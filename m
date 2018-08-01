From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 12/14] mt76: Kconfig and Makefile for mt76x0 driver
Date: Wed, 1 Aug 2018 10:28:45 +0200
Message-ID: <20180801082844.GB4526@redhat.com>
References: <1533040864-9026-1-git-send-email-sgruszka@redhat.com>
 <1533040864-9026-13-git-send-email-sgruszka@redhat.com>
 <8736vy1r0j.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8736vy1r0j.fsf-5ukZ45wKbUHoml4zekdYB16hYfS7NtTn@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Aug 01, 2018 at 10:32:12AM +0300, Kalle Valo wrote:
> Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
> 
> > Add Kconfig and Makefiles for mt76x0 driver. Now the driver
> > can be build.
> >
> > Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/net/wireless/mediatek/mt76/Kconfig         | 7 +++++++
> >  drivers/net/wireless/mediatek/mt76/Makefile        | 1 +
> >  drivers/net/wireless/mediatek/mt76/mt76x0/Makefile | 7 +++++++
> >  3 files changed, 15 insertions(+)
> >  create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
> > index 69906c733a1c..850611ad347a 100644
> > --- a/drivers/net/wireless/mediatek/mt76/Kconfig
> > +++ b/drivers/net/wireless/mediatek/mt76/Kconfig
> > @@ -9,6 +9,13 @@ config MT76x2_COMMON
> >  	tristate
> >  	depends on MT76_CORE
> >  
> > +config MT76x0U
> > +	tristate "MediaTek MT76x0U (USB) support"
> > +	depends on MAC80211
> > +	depends on USB
> > +	help
> > +	  This adds support for MT7610U-based wireless USB dongles.
> 
> Does it make sense to add a Kconfig option for every mt76 device? I'm
> worried that soon we have over a dozen of them. I can understand having
> separate options to enable PCI or USB devices, but I don't see the
> benefit for anything more finegrained than that.

I think it does make sense for AP/home routers and other embedded
devices.

Stanislaw
