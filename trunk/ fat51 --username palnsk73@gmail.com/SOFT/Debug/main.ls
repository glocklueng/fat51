   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2173                     	switch	.data
2174  0000               _b1000Hz:
2175  0000 00            	dc.b	0
2176  0001               _b100Hz:
2177  0001 00            	dc.b	0
2178  0002               _b10Hz:
2179  0002 00            	dc.b	0
2180  0003               _b5Hz:
2181  0003 00            	dc.b	0
2182  0004               _b2Hz:
2183  0004 00            	dc.b	0
2184  0005               _b1Hz:
2185  0005 00            	dc.b	0
2186  0006               _t0_cnt0:
2187  0006 00            	dc.b	0
2188  0007               _t0_cnt1:
2189  0007 00            	dc.b	0
2190  0008               _t0_cnt2:
2191  0008 00            	dc.b	0
2192  0009               _t0_cnt3:
2193  0009 00            	dc.b	0
2194  000a               _t0_cnt4:
2195  000a 00            	dc.b	0
2196  000b               _bTIME_WRK:
2197  000b 00            	dc.b	0
2198  000c               _time_wrk_cnt_max:
2199  000c 0064          	dc.w	100
2200  000e               _program_stat:
2201  000e 03            	dc.b	3
2202                     .const:	section	.text
2203  0000               _program_steps_max:
2204  0000 06            	dc.b	6
2205  0001 06            	dc.b	6
2206  0002 0c            	dc.b	12
2207  0003 0c            	dc.b	12
2208  0004 0c            	dc.b	12
2209  0005               _program_repeat_max:
2210  0005 0a            	dc.b	10
2211  0006 0a            	dc.b	10
2212  0007 05            	dc.b	5
2213  0008 05            	dc.b	5
2214  0009 05            	dc.b	5
2215  000a               _p1_const:
2216  000a 01            	dc.b	1
2217  000b 02            	dc.b	2
2218  000c 04            	dc.b	4
2219  000d 08            	dc.b	8
2220  000e 10            	dc.b	16
2221  000f 20            	dc.b	32
2222  0010               _p2_const:
2223  0010 20            	dc.b	32
2224  0011 10            	dc.b	16
2225  0012 08            	dc.b	8
2226  0013 04            	dc.b	4
2227  0014 02            	dc.b	2
2228  0015 01            	dc.b	1
2229  0016               _p3_const:
2230  0016 01            	dc.b	1
2231  0017 03            	dc.b	3
2232  0018 07            	dc.b	7
2233  0019 0f            	dc.b	15
2234  001a 1f            	dc.b	31
2235  001b 3f            	dc.b	63
2236  001c 3e            	dc.b	62
2237  001d 3c            	dc.b	60
2238  001e 38            	dc.b	56
2239  001f 30            	dc.b	48
2240  0020 20            	dc.b	32
2241  0021 00            	dc.b	0
2242  0022               _p4_const:
2243  0022 20            	dc.b	32
2244  0023 30            	dc.b	48
2245  0024 38            	dc.b	56
2246  0025 3c            	dc.b	60
2247  0026 3e            	dc.b	62
2248  0027 3f            	dc.b	63
2249  0028 1f            	dc.b	31
2250  0029 0f            	dc.b	15
2251  002a 07            	dc.b	7
2252  002b 03            	dc.b	3
2253  002c 01            	dc.b	1
2254  002d 00            	dc.b	0
2255  002e               _p5_const:
2256  002e 01            	dc.b	1
2257  002f 03            	dc.b	3
2258  0030 02            	dc.b	2
2259  0031 06            	dc.b	6
2260  0032 04            	dc.b	4
2261  0033 0c            	dc.b	12
2262  0034 08            	dc.b	8
2263  0035 18            	dc.b	24
2264  0036 10            	dc.b	16
2265  0037 30            	dc.b	48
2266  0038 20            	dc.b	32
2267  0039 21            	dc.b	33
2300                     ; 85 void time_wrk(void)
2300                     ; 86 {
2302                     	switch	.text
2303  0000               _time_wrk:
2307                     ; 87 time_wrk_cnt_max=adc_buff_*2;
2309  0000 ce0001        	ldw	x,_adc_buff_
2310  0003 58            	sllw	x
2311  0004 cf000c        	ldw	_time_wrk_cnt_max,x
2312                     ; 89 time_wrk_cnt++;
2314  0007 ce0026        	ldw	x,_time_wrk_cnt
2315  000a 1c0001        	addw	x,#1
2316  000d cf0026        	ldw	_time_wrk_cnt,x
2317                     ; 90 if(time_wrk_cnt>=time_wrk_cnt_max)
2319  0010 9c            	rvf
2320  0011 ce0026        	ldw	x,_time_wrk_cnt
2321  0014 c3000c        	cpw	x,_time_wrk_cnt_max
2322  0017 2f08          	jrslt	L1441
2323                     ; 92 	time_wrk_cnt=0;
2325  0019 5f            	clrw	x
2326  001a cf0026        	ldw	_time_wrk_cnt,x
2327                     ; 93 	bTIME_WRK=1;
2329  001d 3501000b      	mov	_bTIME_WRK,#1
2330  0021               L1441:
2331                     ; 96 }
2334  0021 81            	ret
2369                     ; 99 void wrk_hndl(void)
2369                     ; 100 {
2370                     	switch	.text
2371  0022               _wrk_hndl:
2375                     ; 101 if(bTIME_WRK)
2377  0022 725d000b      	tnz	_bTIME_WRK
2378  0026 2603          	jrne	L01
2379  0028 cc00ca        	jp	L3541
2380  002b               L01:
2381                     ; 103 	program_steps++;
2383  002b 725c0024      	inc	_program_steps
2384                     ; 104 	if(program_steps>=program_steps_max[program_stat])
2386  002f c6000e        	ld	a,_program_stat
2387  0032 5f            	clrw	x
2388  0033 97            	ld	xl,a
2389  0034 d60000        	ld	a,(_program_steps_max,x)
2390  0037 c10024        	cp	a,_program_steps
2391  003a 2228          	jrugt	L5541
2392                     ; 106 		program_steps=0;
2394  003c 725f0024      	clr	_program_steps
2395                     ; 107 		program_repeat++;
2397  0040 725c0023      	inc	_program_repeat
2398                     ; 108 		if(program_repeat>=program_repeat_max[program_stat])
2400  0044 c6000e        	ld	a,_program_stat
2401  0047 5f            	clrw	x
2402  0048 97            	ld	xl,a
2403  0049 d60005        	ld	a,(_program_repeat_max,x)
2404  004c c10023        	cp	a,_program_repeat
2405  004f 2213          	jrugt	L5541
2406                     ; 110 			program_repeat=0;
2408  0051 725f0023      	clr	_program_repeat
2409                     ; 111 			program_stat++;
2411  0055 725c000e      	inc	_program_stat
2412                     ; 112 			if(program_stat>=MAX_PROGRAM_STAT)program_stat=0;
2414  0059 c6000e        	ld	a,_program_stat
2415  005c a105          	cp	a,#5
2416  005e 2504          	jrult	L5541
2419  0060 725f000e      	clr	_program_stat
2420  0064               L5541:
2421                     ; 116 	if(program_stat==p1)
2423  0064 725d000e      	tnz	_program_stat
2424  0068 260d          	jrne	L3641
2425                     ; 118 		port_temp=p1_const[program_steps];	
2427  006a c60024        	ld	a,_program_steps
2428  006d 5f            	clrw	x
2429  006e 97            	ld	xl,a
2430  006f d6000a        	ld	a,(_p1_const,x)
2431  0072 c70025        	ld	_port_temp,a
2433  0075 204e          	jra	L5641
2434  0077               L3641:
2435                     ; 120 	else if(program_stat==p2)
2437  0077 c6000e        	ld	a,_program_stat
2438  007a a101          	cp	a,#1
2439  007c 260d          	jrne	L7641
2440                     ; 122 		port_temp=p2_const[program_steps];	
2442  007e c60024        	ld	a,_program_steps
2443  0081 5f            	clrw	x
2444  0082 97            	ld	xl,a
2445  0083 d60010        	ld	a,(_p2_const,x)
2446  0086 c70025        	ld	_port_temp,a
2448  0089 203a          	jra	L5641
2449  008b               L7641:
2450                     ; 124 	else if(program_stat==p3)
2452  008b c6000e        	ld	a,_program_stat
2453  008e a102          	cp	a,#2
2454  0090 260d          	jrne	L3741
2455                     ; 126 		port_temp=p3_const[program_steps];	
2457  0092 c60024        	ld	a,_program_steps
2458  0095 5f            	clrw	x
2459  0096 97            	ld	xl,a
2460  0097 d60016        	ld	a,(_p3_const,x)
2461  009a c70025        	ld	_port_temp,a
2463  009d 2026          	jra	L5641
2464  009f               L3741:
2465                     ; 128 	else if(program_stat==p4)
2467  009f c6000e        	ld	a,_program_stat
2468  00a2 a103          	cp	a,#3
2469  00a4 260d          	jrne	L7741
2470                     ; 130 		port_temp=p4_const[program_steps];	
2472  00a6 c60024        	ld	a,_program_steps
2473  00a9 5f            	clrw	x
2474  00aa 97            	ld	xl,a
2475  00ab d60022        	ld	a,(_p4_const,x)
2476  00ae c70025        	ld	_port_temp,a
2478  00b1 2012          	jra	L5641
2479  00b3               L7741:
2480                     ; 132 	else if(program_stat==p5)
2482  00b3 c6000e        	ld	a,_program_stat
2483  00b6 a104          	cp	a,#4
2484  00b8 260b          	jrne	L5641
2485                     ; 134 		port_temp=p5_const[program_steps];	
2487  00ba c60024        	ld	a,_program_steps
2488  00bd 5f            	clrw	x
2489  00be 97            	ld	xl,a
2490  00bf d6002e        	ld	a,(_p5_const,x)
2491  00c2 c70025        	ld	_port_temp,a
2492  00c5               L5641:
2493                     ; 137 	GPIOD->ODR=port_temp;
2495  00c5 550025500f    	mov	20495,_port_temp
2496  00ca               L3541:
2497                     ; 139 bTIME_WRK=0;
2499  00ca 725f000b      	clr	_bTIME_WRK
2500                     ; 140 }
2503  00ce 81            	ret
2526                     ; 143 void gpio_init(void)
2526                     ; 144 {
2527                     	switch	.text
2528  00cf               _gpio_init:
2532                     ; 147 GPIOD->DDR|=0xff;
2534  00cf c65011        	ld	a,20497
2535  00d2 aaff          	or	a,#255
2536  00d4 c75011        	ld	20497,a
2537                     ; 148 GPIOD->CR1|=0xff;
2539  00d7 c65012        	ld	a,20498
2540  00da aaff          	or	a,#255
2541  00dc c75012        	ld	20498,a
2542                     ; 149 GPIOD->CR2&=~0xff;
2544  00df c65013        	ld	a,20499
2545  00e2 a400          	and	a,#0
2546  00e4 c75013        	ld	20499,a
2547                     ; 152 }
2550  00e7 81            	ret
2573                     ; 155 void t4_init(void)
2573                     ; 156 {
2574                     	switch	.text
2575  00e8               _t4_init:
2579                     ; 157 TIM4->PSCR = 7;
2581  00e8 35075347      	mov	21319,#7
2582                     ; 158 TIM4->ARR= 123;
2584  00ec 357b5348      	mov	21320,#123
2585                     ; 159 TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2587  00f0 72105343      	bset	21315,#0
2588                     ; 161 TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2590  00f4 35855340      	mov	21312,#133
2591                     ; 162 }
2594  00f8 81            	ret
2617                     ; 164 void adc_init(void){
2618                     	switch	.text
2619  00f9               _adc_init:
2623                     ; 165 	GPIOB->DDR&=~(1<<2);
2625  00f9 72155007      	bres	20487,#2
2626                     ; 166 	GPIOB->CR1&=~(1<<2);
2628  00fd 72155008      	bres	20488,#2
2629                     ; 167 	GPIOB->CR2&=~(1<<2);
2631  0101 72155009      	bres	20489,#2
2632                     ; 168 	ADC1->TDRL|=(1<<2);
2634  0105 72145407      	bset	21511,#2
2635                     ; 171 	ADC1->CR2=0x08;
2637  0109 35085402      	mov	21506,#8
2638                     ; 172 	ADC1->CR1=0x40;
2640  010d 35405401      	mov	21505,#64
2641                     ; 173 	ADC1->CSR=0x20+2;
2643  0111 35225400      	mov	21504,#34
2644                     ; 175 	ADC1->CR1|=1;
2646  0115 72105401      	bset	21505,#0
2647                     ; 176 ADC1->CR1|=1;
2649  0119 72105401      	bset	21505,#0
2650                     ; 177 }
2653  011d 81            	ret
2690                     ; 184 @far @interrupt void TIM4_UPD_Interrupt (void) 
2690                     ; 185 {
2692                     	switch	.text
2693  011e               f_TIM4_UPD_Interrupt:
2697                     ; 186 b1000Hz=1;
2699  011e 35010000      	mov	_b1000Hz,#1
2700                     ; 187 if(++t0_cnt0>=10)
2702  0122 725c0006      	inc	_t0_cnt0
2703  0126 c60006        	ld	a,_t0_cnt0
2704  0129 a10a          	cp	a,#10
2705  012b 2575          	jrult	L5451
2706                     ; 189 	t0_cnt0=0;
2708  012d 725f0006      	clr	_t0_cnt0
2709                     ; 190 	b100Hz=1;
2711  0131 35010001      	mov	_b100Hz,#1
2712                     ; 192 	if(++t0_cnt1>=10)
2714  0135 725c0007      	inc	_t0_cnt1
2715  0139 c60007        	ld	a,_t0_cnt1
2716  013c a10a          	cp	a,#10
2717  013e 2508          	jrult	L7451
2718                     ; 194 		t0_cnt1=0;
2720  0140 725f0007      	clr	_t0_cnt1
2721                     ; 195 		b10Hz=1;
2723  0144 35010002      	mov	_b10Hz,#1
2724  0148               L7451:
2725                     ; 198 	if(++t0_cnt2>=20)
2727  0148 725c0008      	inc	_t0_cnt2
2728  014c c60008        	ld	a,_t0_cnt2
2729  014f a114          	cp	a,#20
2730  0151 2513          	jrult	L1551
2731                     ; 200 		t0_cnt2=0;
2733  0153 725f0008      	clr	_t0_cnt2
2734                     ; 201 		b5Hz=1;
2736  0157 35010003      	mov	_b5Hz,#1
2737                     ; 202 		bFL5=!bFL5;
2739  015b 3d03          	tnz	_bFL5
2740  015d 2604          	jrne	L22
2741  015f a601          	ld	a,#1
2742  0161 2001          	jra	L42
2743  0163               L22:
2744  0163 4f            	clr	a
2745  0164               L42:
2746  0164 b703          	ld	_bFL5,a
2747  0166               L1551:
2748                     ; 205 	if(++t0_cnt3>=50)
2750  0166 725c0009      	inc	_t0_cnt3
2751  016a c60009        	ld	a,_t0_cnt3
2752  016d a132          	cp	a,#50
2753  016f 2513          	jrult	L3551
2754                     ; 207 		t0_cnt3=0;
2756  0171 725f0009      	clr	_t0_cnt3
2757                     ; 208 		b2Hz=1;
2759  0175 35010004      	mov	_b2Hz,#1
2760                     ; 209 		bFL2=!bFL2;		
2762  0179 3d02          	tnz	_bFL2
2763  017b 2604          	jrne	L62
2764  017d a601          	ld	a,#1
2765  017f 2001          	jra	L03
2766  0181               L62:
2767  0181 4f            	clr	a
2768  0182               L03:
2769  0182 b702          	ld	_bFL2,a
2770  0184               L3551:
2771                     ; 212 	if(++t0_cnt4>=100)
2773  0184 725c000a      	inc	_t0_cnt4
2774  0188 c6000a        	ld	a,_t0_cnt4
2775  018b a164          	cp	a,#100
2776  018d 2513          	jrult	L5451
2777                     ; 214 		t0_cnt4=0;
2779  018f 725f000a      	clr	_t0_cnt4
2780                     ; 215 		b1Hz=1;
2782  0193 35010005      	mov	_b1Hz,#1
2783                     ; 216 		bFL1=!bFL1;
2785  0197 3d01          	tnz	_bFL1
2786  0199 2604          	jrne	L23
2787  019b a601          	ld	a,#1
2788  019d 2001          	jra	L43
2789  019f               L23:
2790  019f 4f            	clr	a
2791  01a0               L43:
2792  01a0 b701          	ld	_bFL1,a
2793  01a2               L5451:
2794                     ; 220 TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
2796  01a2 72115344      	bres	21316,#0
2797                     ; 221 return;
2800  01a6 80            	iret
2854                     ; 224 @far @interrupt void ADC_EOC_Interrupt (void) {
2855                     	switch	.text
2856  01a7               f_ADC_EOC_Interrupt:
2858       00000009      OFST:	set	9
2859  01a7 be00          	ldw	x,c_x
2860  01a9 89            	pushw	x
2861  01aa be00          	ldw	x,c_y
2862  01ac 89            	pushw	x
2863  01ad be02          	ldw	x,c_lreg+2
2864  01af 89            	pushw	x
2865  01b0 be00          	ldw	x,c_lreg
2866  01b2 89            	pushw	x
2867  01b3 5209          	subw	sp,#9
2870                     ; 234 ADC1->CSR&=~(1<<7);
2872  01b5 721f5400      	bres	21504,#7
2873                     ; 236 temp_adc=(((signed long)(ADC1->DRH))*256)+((signed long)(ADC1->DRL));
2875  01b9 c65405        	ld	a,21509
2876  01bc b703          	ld	c_lreg+3,a
2877  01be 3f02          	clr	c_lreg+2
2878  01c0 3f01          	clr	c_lreg+1
2879  01c2 3f00          	clr	c_lreg
2880  01c4 96            	ldw	x,sp
2881  01c5 1c0001        	addw	x,#OFST-8
2882  01c8 cd0000        	call	c_rtol
2884  01cb c65404        	ld	a,21508
2885  01ce 5f            	clrw	x
2886  01cf 97            	ld	xl,a
2887  01d0 90ae0100      	ldw	y,#256
2888  01d4 cd0000        	call	c_umul
2890  01d7 96            	ldw	x,sp
2891  01d8 1c0001        	addw	x,#OFST-8
2892  01db cd0000        	call	c_ladd
2894  01de 96            	ldw	x,sp
2895  01df 1c0006        	addw	x,#OFST-3
2896  01e2 cd0000        	call	c_rtol
2898                     ; 242 adc_buff[adc_cnt]=temp_adc;
2900  01e5 c60000        	ld	a,_adc_cnt
2901  01e8 5f            	clrw	x
2902  01e9 97            	ld	xl,a
2903  01ea 58            	sllw	x
2904  01eb 1608          	ldw	y,(OFST-1,sp)
2905  01ed df0003        	ldw	(_adc_buff,x),y
2906                     ; 247 adc_cnt++;
2908  01f0 725c0000      	inc	_adc_cnt
2909                     ; 248 if(adc_cnt>=16)
2911  01f4 c60000        	ld	a,_adc_cnt
2912  01f7 a110          	cp	a,#16
2913  01f9 2504          	jrult	L5061
2914                     ; 250 	adc_cnt=0;
2916  01fb 725f0000      	clr	_adc_cnt
2917  01ff               L5061:
2918                     ; 254 if((adc_cnt&0x03)==0)
2920  01ff c60000        	ld	a,_adc_cnt
2921  0202 a503          	bcp	a,#3
2922  0204 2637          	jrne	L7061
2923                     ; 258 	tempSS=0;
2925  0206 ae0000        	ldw	x,#0
2926  0209 1f08          	ldw	(OFST-1,sp),x
2927  020b ae0000        	ldw	x,#0
2928  020e 1f06          	ldw	(OFST-3,sp),x
2929                     ; 262 	for(i=0;i<16;i++)
2931  0210 0f05          	clr	(OFST-4,sp)
2932  0212               L1161:
2933                     ; 264 		tempSS+=(signed long)adc_buff[i];
2935  0212 7b05          	ld	a,(OFST-4,sp)
2936  0214 5f            	clrw	x
2937  0215 97            	ld	xl,a
2938  0216 58            	sllw	x
2939  0217 de0003        	ldw	x,(_adc_buff,x)
2940  021a cd0000        	call	c_itolx
2942  021d 96            	ldw	x,sp
2943  021e 1c0006        	addw	x,#OFST-3
2944  0221 cd0000        	call	c_lgadd
2946                     ; 262 	for(i=0;i<16;i++)
2948  0224 0c05          	inc	(OFST-4,sp)
2951  0226 7b05          	ld	a,(OFST-4,sp)
2952  0228 a110          	cp	a,#16
2953  022a 25e6          	jrult	L1161
2954                     ; 266 	adc_buff_=(signed short)(tempSS>>4);
2956  022c 96            	ldw	x,sp
2957  022d 1c0006        	addw	x,#OFST-3
2958  0230 cd0000        	call	c_ltor
2960  0233 a604          	ld	a,#4
2961  0235 cd0000        	call	c_lrsh
2963  0238 be02          	ldw	x,c_lreg+2
2964  023a cf0001        	ldw	_adc_buff_,x
2965  023d               L7061:
2966                     ; 288 }
2969  023d 5b09          	addw	sp,#9
2970  023f 85            	popw	x
2971  0240 bf00          	ldw	c_lreg,x
2972  0242 85            	popw	x
2973  0243 bf02          	ldw	c_lreg+2,x
2974  0245 85            	popw	x
2975  0246 bf00          	ldw	c_y,x
2976  0248 85            	popw	x
2977  0249 bf00          	ldw	c_x,x
2978  024b 80            	iret
3000                     ; 290 @far @interrupt void TIM1_Ovf_Interrupt (void) 
3000                     ; 291 {
3001                     	switch	.text
3002  024c               f_TIM1_Ovf_Interrupt:
3006                     ; 293 TIM1->SR1&=~TIM1_SR1_UIF;			
3008  024c 72115255      	bres	21077,#0
3009                     ; 294 }
3012  0250 80            	iret
3047                     ; 299 main()
3047                     ; 300 {
3049                     	switch	.text
3050  0251               _main:
3054                     ; 301 CLK->CKDIVR=0;
3056  0251 725f50c6      	clr	20678
3057                     ; 303 gpio_init();
3059  0255 cd00cf        	call	_gpio_init
3061                     ; 307 FLASH_DUKR=0xae;
3063  0258 35ae5064      	mov	_FLASH_DUKR,#174
3064                     ; 308 FLASH_DUKR=0x56;	
3066  025c 35565064      	mov	_FLASH_DUKR,#86
3067                     ; 312 t4_init();
3069  0260 cd00e8        	call	_t4_init
3071                     ; 313 enableInterrupts();	
3074  0263 9a            rim
3076                     ; 315 adc_init();
3079  0264 cd00f9        	call	_adc_init
3081  0267               L7361:
3082                     ; 320 	if(b1000Hz)
3084  0267 725d0000      	tnz	_b1000Hz
3085  026b 2707          	jreq	L3461
3086                     ; 322 		b1000Hz=0;
3088  026d 725f0000      	clr	_b1000Hz
3089                     ; 323 		time_wrk();
3091  0271 cd0000        	call	_time_wrk
3093  0274               L3461:
3094                     ; 326 	if(b100Hz)
3096  0274 725d0001      	tnz	_b100Hz
3097  0278 2707          	jreq	L5461
3098                     ; 328 		b100Hz=0;
3100  027a 725f0001      	clr	_b100Hz
3101                     ; 329 		wrk_hndl();	
3103  027e cd0022        	call	_wrk_hndl
3105  0281               L5461:
3106                     ; 332 	if(b10Hz)
3108  0281 725d0002      	tnz	_b10Hz
3109  0285 2707          	jreq	L7461
3110                     ; 334 		b10Hz=0;
3112  0287 725f0002      	clr	_b10Hz
3113                     ; 335 		adc_init();	
3115  028b cd00f9        	call	_adc_init
3117  028e               L7461:
3118                     ; 338 	if(b5Hz)
3120  028e 725d0003      	tnz	_b5Hz
3121  0292 2704          	jreq	L1561
3122                     ; 340 		b5Hz=0;
3124  0294 725f0003      	clr	_b5Hz
3125  0298               L1561:
3126                     ; 344 	if(b2Hz)
3128  0298 725d0004      	tnz	_b2Hz
3129  029c 2704          	jreq	L3561
3130                     ; 346 		b2Hz=0;
3132  029e 725f0004      	clr	_b2Hz
3133  02a2               L3561:
3134                     ; 350 	if(b1Hz)
3136  02a2 725d0005      	tnz	_b1Hz
3137  02a6 27bf          	jreq	L7361
3138                     ; 352 		b1Hz=0;
3140  02a8 725f0005      	clr	_b1Hz
3141  02ac 20b9          	jra	L7361
3525                     	xdef	_main
3526                     	xdef	f_TIM1_Ovf_Interrupt
3527                     	xdef	f_ADC_EOC_Interrupt
3528                     	xdef	f_TIM4_UPD_Interrupt
3529                     	xdef	_adc_init
3530                     	xdef	_t4_init
3531                     	xdef	_gpio_init
3532                     	xdef	_wrk_hndl
3533                     	xdef	_time_wrk
3534                     	xdef	_p5_const
3535                     	xdef	_p4_const
3536                     	xdef	_p3_const
3537                     	xdef	_p2_const
3538                     	xdef	_p1_const
3539                     	switch	.bss
3540  0000               _adc_cnt:
3541  0000 00            	ds.b	1
3542                     	xdef	_adc_cnt
3543  0001               _adc_buff_:
3544  0001 0000          	ds.b	2
3545                     	xdef	_adc_buff_
3546  0003               _adc_buff:
3547  0003 000000000000  	ds.b	32
3548                     	xdef	_adc_buff
3549  0023               _program_repeat:
3550  0023 00            	ds.b	1
3551                     	xdef	_program_repeat
3552  0024               _program_steps:
3553  0024 00            	ds.b	1
3554                     	xdef	_program_steps
3555                     	xdef	_program_repeat_max
3556                     	xdef	_program_steps_max
3557  0025               _port_temp:
3558  0025 00            	ds.b	1
3559                     	xdef	_port_temp
3560                     	xdef	_program_stat
3561                     	xdef	_time_wrk_cnt_max
3562  0026               _time_wrk_cnt:
3563  0026 0000          	ds.b	2
3564                     	xdef	_time_wrk_cnt
3565                     	xdef	_bTIME_WRK
3566                     	switch	.ubsct
3567  0000               _bFL_:
3568  0000 00            	ds.b	1
3569                     	xdef	_bFL_
3570  0001               _bFL1:
3571  0001 00            	ds.b	1
3572                     	xdef	_bFL1
3573  0002               _bFL2:
3574  0002 00            	ds.b	1
3575                     	xdef	_bFL2
3576  0003               _bFL5:
3577  0003 00            	ds.b	1
3578                     	xdef	_bFL5
3579                     	xdef	_t0_cnt4
3580                     	xdef	_t0_cnt3
3581                     	xdef	_t0_cnt2
3582                     	xdef	_t0_cnt1
3583                     	xdef	_t0_cnt0
3584                     	xdef	_b1Hz
3585                     	xdef	_b2Hz
3586                     	xdef	_b5Hz
3587                     	xdef	_b10Hz
3588                     	xdef	_b100Hz
3589                     	xdef	_b1000Hz
3590                     	xref.b	c_lreg
3591                     	xref.b	c_x
3592                     	xref.b	c_y
3612                     	xref	c_lrsh
3613                     	xref	c_ltor
3614                     	xref	c_lgadd
3615                     	xref	c_itolx
3616                     	xref	c_ladd
3617                     	xref	c_rtol
3618                     	xref	c_umul
3619                     	end
