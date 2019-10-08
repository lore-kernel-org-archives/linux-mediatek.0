From: Adam Boardman <adamboardman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: CPU Thermal sensor - including Kunit tests - for Gemini PDA (MT6797*)
Date: Tue, 8 Oct 2019 21:43:58 +0100
Message-ID: <CABvHX8jUNG7S-u69LR5ciPqRCsrC3TTMvWVeOYmEhLVfc5QxFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

I've finally got something working, I've added MT6797 definitions to
the thermal driver[A1], it took a few goes to figure out how to
configure the different driver format, including a fix to the existing
code to actually make use of the vts_index, all current mainlined CPU
Thermals appear to have a 1-1 mapping so they probably wouldn't notice
this problem. I also had to comment out the reset[A6] as that failed.

I've also added some test code making use of Kunit[A2] that is
particularly useful to help figure things out. Being able to step
through code with a UML kernel in CLion with mocked devicetree, efuse
and readl is very useful, though it took a fair bit of effort to work
out how to programmatically create them. For CLion integration I
needed to break out the build part separately[A3], so the debugger can
attach to the linux executable after doing the build.

Some of my test code matches exactly the values from the 3.18 kernel
with its different maths[A7], others are at least within 0.1 degree C
of the expected value so I'm happy that I've got the correct settings
and calibration values.

We'll need to wait for Kunit to get mainlined (cc Brendan) so this is
just an invitation to review and for others with other devices to add
tests for different CPU's thermal sensors[A8] to verify my assumptions
about the 1-1 mapping. Any thoughts on how the other thermal sensors
mtkts [battery, pmic, wmt, dram, igmsensor, etc...] that appear to
perform reboots on critical temperatures should be mainlined?

Is it a first device put in a sanitised version of whatever is
available then second device makes it multi device, or do you have to
start with at least two devices to extract the commonality first time
around? My second device will be the Cosmo Communicator (MT6771) but
we have zero mainline code for that as yet.

I've done what I can with the help from Matthias & Manivannan, so
thanks for the responses. I'm now stuck - it would be really handy to
get the i2c and pmic/wrap working. The change from regmap to pinctrl
seems very confusing to me, for example the pin ball map has only one
pin for SDA0 [A4], yet the pinfunc[A5] has multiple IO's set to SDA0,
eg MT6797_GPIO60__FUNC_SDA0_2 (in total 5 different GPIO's appear to
be able to be SDA0, with different numbers for the other SDAn's etc).
Initially I thought that the idea was that different devices could
have the GPIO60 doing different things depending on how the PCB tracks
are set out, though I'm not convinced that this is the case as there
is only one SDA0 and the old kernel was able to work by the magic of
just the base address 0x11007000 [A4 - 5.9.4 Register Definition]?

Matthias you can of course update the wiki page with WIP for the few
items I'm currently working on (CPU-Thermal, I2C, PMIC-Vibrator,
LED-AW9120). I'd rather get these simplest of devices working first to
prove I/O functions before the much more useful eMMC.

Many thanks for any help,

Adam.

--

[A1] https://github.com/gemian/linux/blob/master/drivers/thermal/mtk_thermal.c
[A2] https://github.com/gemian/linux/blob/master/drivers/thermal/mtk_thermal_test.c
(Thermal test code)
[A3] https://github.com/gemian/linux/blob/master/tools/testing/kunit/kunit.py#L150
(kunit test code pulled from branch - kunit/initial/v5.3/v18)
[A4] https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Functional_Specification_V1_0.pdf
(2.2.1 Ball Map View)
[A5] https://github.com/gemian/linux/blob/master/include/dt-bindings/pinctrl/mt6797-pinfunc.h
(confusing headers)
[A6] https://github.com/gemian/linux/blob/master/drivers/thermal/mtk_thermal.c#L1028
(reset removed)
[A7] https://github.com/gemian/linux/blob/master/drivers/thermal/mtk_thermal.c#L613
vs https://github.com/gemian/gemini-linux-kernel-3.18/blob/native/drivers/misc/mediatek/thermal/mt6797/src/mtk_tc.c#L553
(raw->temp)
[A8] You'd need to give me some logging after enabling
/proc/driver/thermal/tzcpu_log and the calibration block that gets
dumped at early boot
