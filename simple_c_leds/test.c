void delay(void) {
	unsigned int i;
	for(i = 0; i < 0xFFFFF; i++);
}

int c_entry(void) {
	unsigned int *gpio_on_p7 = (int*) 0x400f629c; //gpio port on 7 register
	unsigned int *gpio_off_p7 = (int*) 0x400f631c; //gpio port off 7 register
	unsigned int redled = 0x20;
	while(1) {
		delay();
		*gpio_on_p7 = redled;
		delay();
		*gpio_off_p7 = redled;
	}
	return 0;
}
