From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/11] Add mt76x0 driver
Date: Fri, 6 Jul 2018 13:37:17 +0200
Message-ID: <20180706113716.GA2410@localhost.localdomain>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
 <20180705153216.GE17524@localhost.localdomain>
 <20180706103657.GB2033@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180706103657.GB2033-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Jul 06, Stanislaw Gruszka wrote:
> On Thu, Jul 05, 2018 at 05:32:17PM +0200, Lorenzo Bianconi wrote:
> > > My integration efforts can be traced here:
> > > https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft
> > > 
> > 
> > I just had a brief review of the code and I compiled the driver since at
> > the moment I had no adapter for that chipset.
> > As a remainder for future improvements/integration most of the code in 
> > dma.c, usb.c (except probe/disconnect functions) and tx.c can use the related
> > routines in the mt76-usb layer (we need to fill function pointer for chipset
> > related stuff if there are differences with mt76x2u, not looked yet).
> > Moreover mcu code can use utility routines in usb-mcu.c
> > I have not looked at mt76x2 common code yet.
> 
> That's my plan. So far I started to unify common mac/wcid code. If
> someone want to work on some area i.e. dma/tx, usb or mcu, please
> let me know to do not duplicate work.  

I can work on dma/tx/usb stuff since I did it for mt76x2u.
I have just a mt7601u adapter for the moment but I guess
I can use it that tasks.

Regards,
Lorenzo

> 
> Thanks for review!
> Stanislaw
