From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
Date: Wed, 27 Apr 2016 10:41:31 +0200
Message-ID: <869e6090-04fd-0f99-f248-af68e948362e@openwrt.org>
References: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
 <20160427100627.63b148c3@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160427100627.63b148c3@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org


Hi Boris,

>>
>> the devicetree i am using is this
>>
>> &nandc {
>>         status = "okay";
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&nand_pins_default>;
>>         nand@0 {
>>                 reg = <0>;
>>                 spare_per_sector = <64>;
> 
> If I understood the meaning of spare_per_sector correctly, this should
> be 32 (you have 2K pages and 1024 bytes sectors, so you have 2 sectors
> and want to equally assign the 64 OOB bytes to those sectors =>
> 64 / 2 = 32).
> 
> Anyway, hopefully all this complexity will be gone in the next version
> along with the need to define nand-ecc-strength and nand-ecc-step-size
> (which should be part of the NAND chip detection unless you really
> need to overload them).
> 

thanks for the info. i tried that aswell as some other settings but none
makes the flash work. lets see if Jorge has some ideas. otherwise i will
wait for V4.

	John

>>                 nand-on-flash-bbt;
>>                 nand-ecc-mode = "hw";
>>                 nand-ecc-strength = <12>;
>>                 nand-ecc-step-size = <1024>;
>>                 partitions {
>>                         compatible = "fixed-partitions";
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>>
>>                         partition@C0000 {
>>                                 label = "uboot-env";
>>                                 reg = <0xC0000 0x40000>;
>>                         };
>>
>>                         partition@100000 {
>>                                 label = "factory";
>>                                 reg = <0x100000 0x40000>;
>>                         };
>>
>>                         partition@140000 {
>>                                 label = "kernel";
>>                                 reg = <0x140000 0x2000000>;
>>                         };
>>
>>                         partition@2140000 {
>>                                 label = "recovery";
>>                                 reg = <0x2140000 0x2000000>;
>>                         };
>>
>>                         partition@4140000 {
>>                                 label = "rootfs";
>>                                 reg = <0x4140000 0x1000000>;
>>                         };
>>                 };
>>         };
>> };
> 
> 
