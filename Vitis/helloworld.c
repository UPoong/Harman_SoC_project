
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "xparameters.h"
#include "xintc.h"
#include "xil_exception.h"
#include "myMotorControl.h"

#define MOTOR_CTRL_IRQ_VEC_ID XPAR_INTC_0_MYMOTORCONTROL_0_VEC_ID
#define MOTOR_CTRL_BASE_ADDR XPAR_MYMOTORCONTROL_0_S00_AXI_BASEADDR

XIntc intc_instance;

volatile unsigned int time_count;
volatile unsigned int RPM;
volatile int interruptFlag;

unsigned int RPM_window_valid = 0;
unsigned int RPM_window_count = 0;
unsigned int RPM_window_sum = 0;
volatile unsigned int RPM_moving_average = 0;
unsigned int RPM_window[10] = {0,};

void calculateRPM(void* CallBackRef){
	time_count = MYMOTORCONTROL_mReadReg(MOTOR_CTRL_BASE_ADDR, 0);
	RPM = 10*100000000 / time_count;
	MYMOTORCONTROL_mWriteReg(MOTOR_CTRL_BASE_ADDR, 8, 	RPM_moving_average);
	MYMOTORCONTROL_mWriteReg(MOTOR_CTRL_BASE_ADDR, 12, 	1);
	MYMOTORCONTROL_mWriteReg(MOTOR_CTRL_BASE_ADDR, 12, 	0);
	interruptFlag = 1;
}

int main()
{
    init_platform();

//    Interrupt
	XIntc_Initialize(&intc_instance, MOTOR_CTRL_IRQ_VEC_ID);
    XIntc_Connect(&intc_instance, MOTOR_CTRL_IRQ_VEC_ID, (XInterruptHandler) calculateRPM, (void *) NULL);
    XIntc_Enable(&intc_instance, MOTOR_CTRL_IRQ_VEC_ID);
    XIntc_Start(&intc_instance, XIN_REAL_MODE);
//    -----------------------------------------------

//    Exception
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XIntc_InterruptHandler, (void *) &intc_instance);
    Xil_ExceptionEnable();
//    -----------------------------------------------

//    PL
    time_count = 0;
    RPM = 0;
    interruptFlag = 0;
//    -----------------------------------------------

//    Moving Average
    RPM_window_valid = 0;
    RPM_window_count = 0;
    RPM_window_sum = 0;
    RPM_moving_average = 0;
//    -----------------------------------------------

//    Loop
    while (1){
    	if (interruptFlag) {
    		interruptFlag = 0;
    		if (RPM_window_count < 10) {
    			RPM_window[RPM_window_count] = RPM;
    			RPM_window_count++;
    			RPM_window_valid = 0;
    		}
    		else {
    			RPM_window_sum = 0;
    			for (int i = 0; i < 9; i++){
        			RPM_window[i] = RPM_window[i+1];
        			RPM_window_sum += RPM_window[i];
    			}
    			RPM_window[9] = RPM;
    			RPM_window_sum += RPM_window[9];
    			RPM_window_valid = 1;
    			RPM_moving_average = RPM_window_sum / 10;
    		}
    		if (RPM_window_valid) {
            	xil_printf("TimeCounter = %d\tRPM = %d\tRPM (MA) = %d\r", time_count, RPM, RPM_moving_average);
    		}
    		else {
            	xil_printf("Waiting For Stable Moving Average\r");
    		}
    	}
    }
//    -----------------------------------------------

    cleanup_platform();
    return 0;
}

