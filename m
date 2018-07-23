From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Add mt76x0 driver
Date: Mon, 23 Jul 2018 11:44:05 +0200
Message-ID: <20180723094404.GC26486@redhat.com>
References: <1530875029-26274-1-git-send-email-sgruszka@redhat.com>
 <1531205430.26214.8.camel@mtkswgap22>
 <20180710095222.GA18926@redhat.com>
 <1531230864.26214.20.camel@mtkswgap22>
 <20180711080721.GA3871@localhost.localdomain>
 <1532100994.8953.305.camel@mtkswgap22>
 <CAJ0CqmXmQMBfz7GUe31LYrqD=ZF1bWGSdvD0DMgA7cTC=eyQpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ0CqmXmQMBfz7GUe31LYrqD=ZF1bWGSdvD0DMgA7cTC=eyQpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi

On Mon, Jul 23, 2018 at 11:16:25AM +0200, Lorenzo Bianconi wrote:
> > I'm not sure if it can be got from the market easily.
> >
> > I would like to say, mt7668 is based on new MTK wifi architecture. as
> > for mt7662/mt7612/mt7610, they all belong to legacy Ralink based design.
> > of course, we will never see any new chip based on Ralink based design
> > wifi in the future.
> >
> > There must be really lots of differences exist between two types of
> > devices, such as MCU firmware download, MCU control interface, tx/rx
> > path, even hardware register layout all changed and so on.
> >
> > I guess the hardware abstraction layer needs to be largely adjusted to
> > add the new device mt7668u into mt76 driver. And even I think it would
> > be easier for development and maintenance if we make a separate driver
> > and then pick up some pure software components from mt76 to reuse.
> >
> 
> the mt76 driver has a hw independent layer (mt76/mt76-usb modules) that
> implements data path (tx/rx side), mac80211 integration and calls hw dependent
> code for hw initialization (that approach allows to support mt76x2 and mt7603
> chipsets in the same driver).
> I guess it will be feasible (at least in theory) to integrate mt7668
> support in the
> mt76 driver (but I can't be more precise since I have no any reference code or
> hw to test)
> 
> > Maybe it's the time I want to test your tree first with 7612u (?) or
> > mt7610u (?) , what is suggested? and see how big the gap between this
> > two type of devices and last write some code based on your tree to test
> > mt7668u
> 
> mt76x2u and mt76x0 are not merged yet, but I would suggest to start looking
> at mt76x2u since it is already integrated in the mt76 driver while
> mt76x0 is a standalone
> driver for the moment.
> 
> @Stanislaw what do you think?

I think checking common mt76-usb layer for possibility to add
support for new MT7688U chip on top of it is reasonable :-)

Thanks
Stanislaw
