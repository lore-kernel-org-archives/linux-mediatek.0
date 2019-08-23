From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Aw: Re: Re: BUG: devm_regulator_get returns EPROBE_DEFER
 (5.3-rc5..next-20190822) for bpi-r2/mt7623/mt7530
Date: Fri, 23 Aug 2019 16:43:47 +0200
Message-ID: <0fcdea56-c6fc-993d-1520-be40ff03df2d@gmail.com>
References: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
 <20190822193015.GK23391@sirena.co.uk>
 <trinity-5d117f0d-9f34-4a2b-8a12-1cd34152c108-1566505724458@3c-app-gmx-bs43>
 <20190823100424.GL23391@sirena.co.uk>
 <trinity-2f905f45-85d8-4343-8613-31dda5f7556f-1566561616610@3c-app-gmx-bs11>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-2f905f45-85d8-4343-8613-31dda5f7556f-1566561616610@3c-app-gmx-bs11>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 23/08/2019 14:00, Frank Wunderlich wrote:
>> Gesendet: Freitag, 23. August 2019 um 12:04 Uhr
>> Von: "Mark Brown" <broonie@kernel.org>
> 
>> Can you run a git bisect to try to identify the commit that
>> caused things to fail?
> 
> i have not figured out, how to rebase linux-next on my current (working) codebase :) (failes on file untouched by me at Patch 3/7000+)
> 
>> Look to see if there is a device driver bound to that device, or
>> check if the parent regulator is visible in /sys/class/regulators.
>> You'll also see a mesage printed out for each regulator as it
>> instantiates in the boot logs, you can check there too.
> 
> in working version i only get this message in dmesg which
> looks like a device-binding:
> 
> mt6323-regulator mt6323-regulator: Chip ID = 0x2023
> 
> this is my regulator: mt6323_vpa_reg
> 
> defined in arch/arm/boot/dts/mt6323.dtsi
> 
> &pwrap {
> 	pmic: mt6323 {
> 	  mt6323regulator: mt6323regulator{
> 		compatible = "mediatek,mt6323-regulator";
> 		mt6323_vpa_reg: buck_vpa{
> 			regulator-name = "vpa";
> 			regulator-min-microvolt = < 500000>;
> 			regulator-max-microvolt = <3650000>;
> 		};
> 	  };
> 	};
> };
> 
> parent regulator is then
> mt6323regulator: mt6323regulator
> 
> which is the one i see i dmesg.
> 
> in working version i see the regulator in sys-fs
> 
> cat /sys/class/regulator/regulator.*/name | grep vpa
> vpa
> 
> -------------------------------------------------------------------
> 
> so, now to the non-working regulator:
> 
> dmesg do not have such entry ;(
> 
> regulators-list in /sys/class only containing the dummy and some fixed regulators
> 
> cat /sys/class/regulator/regulator.*/name
> regulator-dummy
> fixed-1.8V
> fixed-3.3V
> fixed-5V
> 
> in arch/arm/boot/dts/mt*.dts and Makefile there is no change between
> working and non-working version.
> in drivers/regulators only the 2 files where i had reverted the
> changes manually without success.
> 
> where can be the cause for no more binding main-regulator?
> 
> are these strange messages related to this problem?
> 
> mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
> 
> another strange line is this:
> 
> mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0
> 
> so the pwrap above regulator is affected too
> 
> and here are many changes in 2 files...
> 
> git diff --name-only non-working..working -- drivers/mfd/mt6397-*
> drivers/mfd/mt6397-core.c
> drivers/mfd/mt6397-irq.c
> 
> which brings me to this 2 commits:
> 
> a4872e80ce7d mfd: mt6397: Extract IRQ related code from core driver
> 708cb5cc3fde mfd: mt6397: Rename macros to something more readable

These are commit IDs from linux-next. At least file from 20190822 should
pinpoint you to the correct commits.

@frank: please don't use commit IDs from linux-next as the history get's
rewritten every day and the IDs can change. Better search the tree to which they
got applied and use the commit IDs from there (stating, of course, which tree
you are looking at).

Looking at commit
a4872e80ce7d ("mfd: mt6397: Extract IRQ related code from core driver")

you can see that it doesn't just move the code but also adds new logic in
mt6397_irq_init(). :(

It seems your chip_id is not supported yet. So you will have to find out which
one it is and add it to the switch.

Hope that helped.
Matthias

> 
> after reverting those 2 regulators are working again.
> Adding both Signed-off-People to CC to keep them informed that a fix is needed
> 
>> Please fix your mail client to word wrap within paragraphs at something
>> substantially less than 80 columns.  Doing this makes your messages much
>> easier to read and reply to.
> 
> i currently write in webmailer, where i cannot set this setting,
> i try to add manual linebreak in long lines, ok?
> 
> regards Frank
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
