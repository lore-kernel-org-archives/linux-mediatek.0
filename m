From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mainline kernel for Gemini PDA (MT6797*)
Date: Tue, 17 Sep 2019 16:08:51 +0200
Message-ID: <d127a5d6-6525-d638-7090-765bcd4dd592@gmail.com>
References: <CABvHX8jSL=UrZ8iVXPOmHEMOm7fkNCim3P0hepOcQB=hP2pGyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABvHX8jSL=UrZ8iVXPOmHEMOm7fkNCim3P0hepOcQB=hP2pGyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Adam Boardman <adamboardman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Fran Quinto <fran.quinto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 16/09/2019 21:35, Adam Boardman wrote:
> I'm new to kernel work and I've started working on trying to get a
> mainline kernel build working for the Gemini PDA (X25/X27 - MT6797*).
> 
> I've pulled in a recent mainline[1] and then added Jasper's fixes[2]
> and Jimmy-Yj's[3], then tried turning on Manivannan's[4] pinctrl

Jaspers clock fixes are upstream, same for the pinctrl. We are missing the
SCPSYS part. Seems it fall through my cracks. If you want then just rebase and
resend it with your Signed-off-by and I can review them.

> driver and adding a couple of simple device drivers (vibrator & led
> controller). Neither work as not enough other things are ported or
> things on the mainline have changed in incompatible ways.
> 
> The mt6397_probe (for MT6351) fails at the dev_get_regmap stage. Which
> looks to be related to the mt6797 picking Paris (pinctrl v2) for this
> device which has none of the regmap code that only features in Moore?
> 

Adding Sean as he is pretty much into the pinctrl implementation of MediaTek.

> The current state is that I can boot to a BusyBox shell over a
> USB-UART cable[5], mount the debugfs etc. Best not to stay there too

Nice, didn't know the USB-UART cable works.

> long as the chip soon overheats, 20-30 mins is enough such that after
> a reboot to a working 3.18 kernel it will only mount the file system
> read-only due to thermal overload, give it a few mins to cool, another
> reboot and its all good again.
> 
> For the over heating I suspect the fact that Jasper commented out the
> cpu-idle-states could be related, though there are so many parts to
> these cpus I wouldn't be certain. Putting the idle states back results
> in a booting kernel to the point that the initramfs calls 'udevadm
> settle' and freezes there or in the subsequent call to the busybox
> shell.
> 

Did you try the plain upstream versions? Any of the two [1] [2] should bring you
to pretty much the same point, serial console with a busybox initramfs.
I personally don't have the Gemini PDA but the 96 board [3], but I didn't
experienced any over-heating.

> I might need to investigate extra devices which I see no mention of so
> far in the gemini pda dts[6]. So any advice on the right order or any
> examples for other similar devices would be great. Also how to
> test/verify each one is working correctly? I'm not requesting the full
> list ordered, just the top 5-10 items that'll get me to a stable state
> where the device can live without likelihood of damage. I can than
> pick off the others as I choose, quite a lot are obvious from the
> names. The power management+thermal side strikes me as a good first
> focus?

As a good first focus I'd try to get the MMC driver working. I started on this
some time ago but got side tracked. From what I saw, you need to implement
pmic_wrapper and pmic as you will need some regulator for the MMC.
I had a quick look on the pmic/pmic_wrapper in the repo you mentioned. Maybe
Mars (in CC) can help with his knowledge to understand if we can re-use an
already implemented pmic/pmic_wrapper or if we have to enhance them/write new
drivers.

> 
> Whats the mainline status for battery and charge support, the 3.18 kernel has:
> MTK_SMART_BATTERY, MTK_HAFG_20 and MTK_PUMP_EXPRESS_PLUS_SUPPORT
> Anyone working on their equivalent?

Not that I'm aware of.

> 
> For the i2c busses to have a chance to work I would also need to
> define: mtk_i2c_compatible mt6797_compat in
> drivers/i2c/busses/i2c-mt65xx.c but I've no idea how to extract the
> needed values from the 3.18 source as the code is too different to
> easily know what to look for. Indications from pinctrl-mt8183.txt

Yes, the downstream mt6797 kernel code is heavily modified and it's difficult to
understand what's the exact difference.

> suggest that I might also need to add i2c0_pins_a style references to
> pio: pinctrl but the 8183 device appears to have no i2c just spi, and
> then pinctrl-mt6797.txt has no mention of i2c, is that the case? again
> I'll need a pointer in the direction of figuring out the values.

I think the datasheets [4] should tell you which PINs have i2c functionality.
You could try to use the schematics of the reference board [5] maybe you are
luky and they haven't swapped the pins.

> 
> I have only publicly available data sheets so far[7], and the original
> kernel[8].
> 
> I've left in Jaspers cmdline force to limit it to one cpu, I don't
> know if this is necessary, usually this is overridden by lk to limit
> it to 5. Also of possible interest I've put in Jaspers mt6797 debugfs
> and whilst some bits of it now work I've no great notion of how to
> make use of it.

I don't think this is necessary. AFAIR I can boot without limiting the CPUs.

> 
> Any help greatly appreciated,
> 

I'm happy to see you are interested in mt6797 upstreaming.
Hope my respond helps.

See you,
Matthias

[1]
https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt6797-evb.dts
[2]
https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
[3] https://www.96boards.org/product/mediatek-x20/
[4] https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/
[5] https://www.96boards.org/documentation/consumer/mediatekx20/hardware-docs/

> Adam.
> 
> PS: The Cosmo Communicator has the P70 so this will all need doing
> again for the MT6771, anyone started on that?
> 
> --
> 
> [1] - https://github.com/gemian/linux (working branch)
> [2] - https://github.com/Jasu/gemini-pda-buildroot (2/3 patches mainlined)
> [3] - https://patchwork.kernel.org/patch/9889457/ (and related)
> [4] - https://patchwork.kernel.org/patch/10672803/ (already in mainline)
> [5] - https://www.omegamoon.com/blog/index.php?entry=entry180626-210224
> [6] - Long list of items from 3.18 dts as yet unknown to mainline -
> power_gs, toprgu, sleep, mcucfg, rt5735, pericfg, dramc, gpio, apxgpt,
> rsvd, hacc, fhctl, devapc, ddrphy, bat_meter, topmisc, mdcldma,
> aes_top, mcumixed, mcufhctl, c2kmisc, modem_temp, scpdvfs, emi,
> sys_cirq, m4u, efusec, gce, cqdma, mipi, gic/gic1, pwm, spi,
> therm_ctrl, eem_fsm, btif, dvfsp, itrx, audiosys, usb, xhci, mjcsys,
> mfgsys, mali, dispsys, mdp, disp, smi, dip, dpe, consys, wifi, camsys,
> vcorefs, pmic_clock_buffer_ctrl, ext_buck, chr, fusb301a, sii9022,
> sm100, accdet, swtp, battery, gps, gsensor, humidity, gyro, hall,
> switch, fpc1145, als, gpio_usage_mapping, cap_touch, solomon_touch,
> aeon_gpio
> [7] - https://github.com/gemian/gemian/wiki/HardwareHacking
> [8] - https://github.com/gemian/gemini-linux-kernel-3.18
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
