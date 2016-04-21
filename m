From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: mt8173-evb: failing to boot in linux-next and mainline
Date: Thu, 21 Apr 2016 16:06:41 +0800
Message-ID: <1461226001.18034.5.camel@mtksdaap41>
References: <CAOi56cV2M_Ee2AhxTUgHhZuZ1y7LH4sKKyiq3Okorj3K+L15GA@mail.gmail.com>
 <1459165876.24094.8.camel@mtksdaap41> <7h37raprav.fsf@baylibre.com>
 <1459230015.25921.10.camel@mtksdaap41>
 <CAOi56cVtfn5BmKP2YHM0kKvCcoAJUmaZWpupODRU4ABE=XEYbQ@mail.gmail.com>
 <570E1C2E.8010203@gmail.com>
 <CAOi56cUSL-O1_5TC3QuZzUJQASKS8GOvvzXfUU2w1sZGdd6W-g@mail.gmail.com>
 <CAOi56cW4GjnCCNM_8-83H4gb4NXM2S7QWnmc=oniRGzBZFHMJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAOi56cW4GjnCCNM_8-83H4gb4NXM2S7QWnmc=oniRGzBZFHMJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Kevin,

On Tue, 2016-04-19 at 15:57 -0700, Kevin Hilman wrote:
> On Thu, Apr 14, 2016 at 2:58 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> > On Wed, Apr 13, 2016 at 3:15 AM, Matthias Brugger
> > <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >>
> >> On 12/04/16 01:12, Kevin Hilman wrote:
> >>>
> >>> On Mon, Mar 28, 2016 at 10:40 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>> wrote:
> >>>>
> >>>> Hi Sascha,
> >>>>
> >>>> On Mon, 2016-03-28 at 08:15 -0700, Kevin Hilman wrote:
> >>>>>
> >>>>> Hi Eddie,
> >>>>>
> >>>>> Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> Thanks your testing again. I can reproduce your case in my local
> >>>>>> environment using 4.6-rc1. After checking, there are two ways to avoid
> >>>>>> the hang:
> >>>>>> 1. set clk_ignore_unused to kernel command line
> >>>>>> 2. Revert patch "cc8ed76 soc: mediatek: SCPSYS: Fix double enabling of
> >>>>>> regulators"
> >>>>>>
> >>>>>> It seems there is a problem between turn on/off clock and power domain.
> >>>>>> We will try to fix this and send patch to public once have a solution.
> >>>>>
> >>>>>
> >>>>> Thanks for verifying.
> >>>>>
> >>>>> I've confirmed that reverting the patch suggested above fixes the
> >>>>> problem.
> >>>>>
> >>>>> Since -rc1 is out, and this problem still exists in mainline, if a
> >>>>> proper fix is not found very soon, I suggest reverting that patch in
> >>>>> mainline.
> >>>>>
> >>>>> Kevin
> >>>>
> >>>>
> >>>> According to Eddie and Kevin's test, I think some clocks
> >>>> (mm/mfg/venc/venclt) may be turned off and there are drivers need these
> >>>> clocks without clk_prepare_enable(). But I have no idea to find out what
> >>>> driver causes this issue. So I prefer to revert it on v4.6-rc1. Do you
> >>>> have comments about this issue?
> >>>
> >>>
> >>> FYI... mt8173-evb is still failing in mainline v4.6-rc3:
> >>>
> >>>     https://kernelci.org/boot/all/job/mainline/kernel/v4.6-rc3/
> >>>
> >>> please fix and/or revert ASAP so this boot regression is not in v4.6
> >>> final.
> >>>
> >>
> >> Sorry for the late reply. I'm quite busy in my day job ATM.
> >> I just send the revert James proposed as fix.
> >>
> >
> > Thanks, I just tried your branch with arm-soc/for-next and mt8173-evb
> > is booting again.  Thanks.
> 
> FYI... mt8173-evb still failing in linux-next, and not sure if it's a
> new issue or not.
> 
> https://kernelci.org/boot/mt8173-evb/job/next/kernel/next-20160419/defconfig/defconfig/lab/lab-khilman/?_id=57163f9459b514ffc46e78d72

Old issue. It seems [1] still not in linux-next. After apply, my
mt8173-evb boot to shell successfully.

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-April/421735.html

Eddie
