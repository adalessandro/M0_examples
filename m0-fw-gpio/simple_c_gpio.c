/*
 * Let's toogle a gpio as fast as we can!
 */
#define GPIO_OUT_P4	(int*) 0x400f6010	//gpio out - port 4
#define GPIO_ON_P4	(int*) 0x400f6210	//gpio on - port 4
#define GPIO_OFF_P4	(int*) 0x400f6290	//gpio off - port 4
#define GPIO_7	(1 << 7)	//gpio 7 bit

int c_entry(void) {
	unsigned int *gpio_out_p4 = GPIO_OUT_P4;
	register *gpio_on_p4 = GPIO_ON_P4;
	register *gpio_off_p4 = GPIO_OFF_P4;
	register bit = GPIO_7;

	*gpio_out_p4 = bit; //set gpio direction to out
	while(1) {
		*gpio_on_p4 = bit;
		*gpio_off_p4 = bit;
	}
	return 0;
}
