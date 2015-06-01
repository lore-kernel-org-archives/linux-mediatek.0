From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: mediatek: arm64 updates for v4.2
Date: Mon, 1 Jun 2015 10:07:40 +0200
Message-ID: <CABuKBeJzTXrRRoAAL7m1=HAP8pR5vrp-tK7vj2oym8KYwTA+Cg@mail.gmail.com>
References: <CABuKBeLhFR=94cF301wL7J8hJVTtyseoD7g45PLE6znQkPAFGQ@mail.gmail.com>
 <4904430.YVNgRyyb6C@wuerfel> <20150529125829.GE6325@pengutronix.de>
 <2560864.dSIGJOm4yU@wuerfel> <20150529164605.GA3022@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20150529164605.GA3022-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yingjoe Chen <Yingjoe.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

2015-05-29 18:46 GMT+02:00 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>:
> On 05/29, Arnd Bergmann wrote:
>> On Friday 29 May 2015 14:58:29 Sascha Hauer wrote:
>> > On Fri, May 29, 2015 at 02:07:40PM +0200, Arnd Bergmann wrote:
>> > > On Friday 29 May 2015 14:04:32 Arnd Bergmann wrote:
>> > > > On Wednesday 27 May 2015 17:14:08 Matthias Brugger wrote:
>> > > > > - dts: fixup pinctrl mt8173
>> > > > > - dts: mt8173-evb fix model name
>> > > > > - dts: mt8173 fix identation
>> > > > > - dts: mt8173 add clock controller
>> > > > > - dts: mt8173 change uart clocks
>> > > > > - dts: mt8173 add pmic wrapper
>> > > > >
>> > > >
>> > > > Pulled into next/dt, thanks!
>> > > >
>> > >
>> > > Dropped it again, after getting a build error:
>> > >
>> > >   DTC     arch/arm64/boot/dts/mediatek/mt8173-evb.dtb
>> > > In file included from ../arch/arm64/boot/dts/mediatek/mt8173-evb.dts:16:0:
>> > > ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:14:42: fatal error: dt-bindings/clock/mt8173-clk.h: No such file or directory
>> > >  #include <dt-bindings/clock/mt8173-clk.h>
>> > >                                           ^
>> > >
>> > > Please fix and resubmit.
>> >
>> > These come from the clk tree. My original suggestion was to pull in this
>> > dts changes late after -rc1.
>>
>> Please don't do it that way. If you can't figure out a way to
>> avoid the dependency, just stage it out over an extra merge window
>> and add the driver first and the dt changes the next time.
>>
>> > Other possibility: Stephen, can you provide
>> > a stable commit containing the Mediatek clk changes?
>>
>> That would work.
>
> Or another possibility, put the same header file into the branch
> you send to arm-soc. Git will figure out that the files are
> exactly the same and there's no cross tree dependency.

OK, I will do that.

-- 
motzblog.wordpress.com
