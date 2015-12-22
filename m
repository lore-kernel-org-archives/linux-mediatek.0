From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: SCPSYS: use builtin_platform_driver
Date: Tue, 22 Dec 2015 10:48:08 -0500
Message-ID: <20151222154808.GC12458@windriver.com>
References: <1450437573-32079-1-git-send-email-matthias.bgg@gmail.com>
 <CAGS+omA822+-srskZ08pa72xVTMFbWLkaZD0za=3MCBryS6PRg@mail.gmail.com>
 <CAGS+omDrZO8PteeFZMes0QRjG2KLhMG=qacFrho+UFPVAG=YXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omDrZO8PteeFZMes0QRjG2KLhMG=qacFrho+UFPVAG=YXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

[Re: [PATCH] soc: mediatek: SCPSYS: use builtin_platform_driver] On 22/12/2015 (Tue 21:36) Daniel Kurtz wrote:

> Hi Matthias,
> 
> One thing below is missing from this version of the patch...
> 
> > On Fri, Dec 18, 2015 at 7:19 PM, Matthias Brugger
> > <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> SCPSYS can't be built as module. Use builtin_platform_driver instead.
> >> For this probe must not be __init and the data accessed can't be
> >> __initconst. Remove this macros. To make the impact as small as possible,
> >> fold scp_domain_data into scp_domain via a pointer.
> 
> [snip]
> 
> >> @@ -542,10 +533,11 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
> >>  };
> >>
> >>  static struct platform_driver scpsys_drv = {
> >> +       .probe = scpsys_probe,
> >>         .driver = {
> >>                 .name = "mtk-scpsys",
> 
> This was in Sascha's version of the patch:
> 
>   .suppress_bind_attrs = true,

Unless you've got a very specific use case where an unbind makes sense
(like a quad port ethernet card, where you unbind one port and then do
PCI pass through of it to a kvm guest for example) then yes, you should
suppress unbind.  So for most drivers aimed at a single device, or where
being built in but unbinding just makes no sense for any possible use
case, then yes you should set the above.

Paul.
--

> 
> Do we still need it now that we use "builtin_platform_driver"?
> 
> >>                 .owner = THIS_MODULE,
> >>                 .of_match_table = of_match_ptr(of_scpsys_match_tbl),
> >>         },
> >>  };
> >> -builtin_platform_driver_probe(scpsys_drv, scpsys_probe);
> >> +builtin_platform_driver(scpsys_drv);
> >> --
> >> 2.6.2
> >>
