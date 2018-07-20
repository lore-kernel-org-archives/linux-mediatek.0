From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/11] Add mt76x0 driver
Date: Fri, 20 Jul 2018 14:18:22 +0200
Message-ID: <20180720121821.GB26455@localhost.localdomain>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
 <20180705153216.GE17524@localhost.localdomain>
 <alpine.LNX.2.00.1807071027140.11361@T420s>
 <20180720103032.GA1791@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180720103032.GA1791-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

> On Sat, Jul 07, 2018 at 10:38:27AM +0200, Hans Ulli Kroll wrote:
> > > > My integration efforts can be traced here:
> > > > https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft
> > > > 
> > > 
> > > I just had a brief review of the code and I compiled the driver since at
> > > the moment I had no adapter for that chipset.
> > > As a remainder for future improvements/integration most of the code in 
> > > dma.c, usb.c (except probe/disconnect functions) and tx.c can use the related
> > > routines in the mt76-usb layer (we need to fill function pointer for chipset
> > > related stuff if there are differences with mt76x2u, not looked yet).
> > > Moreover mcu code can use utility routines in usb-mcu.c
> > > I have not looked at mt76x2 common code yet.
> > > 
> > > Regards,
> > > Lorenzo
> > > 
> > 
> > It is also possible to reuse 
> > struct mt76x2_txwi
> > struct mt76x2_rxwi
> > 
> > They have the same memory layout for both mt76x0u and mt76x2u chipsets.
> > 
> > Lorenzo can you move them up to
> > mt76.h
> > and rename them to
> > struct mt76_txwi
> > struct mt76_rxwi
> > 
> > And we can also do this for
> > struct mt76x2_vif
> 
> For the record. I unified bunch of mac80211 callbacks and mac/wcid functions
> and structures (including structures pointed above) into new mt76xx_lib
> module. I also rebased the changes on top of latest wireless-drivers-next
> master and mt76x2u patches in new branch mt76x0-draft-v2:
> https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft-v2
> 

Sorry Hans, I forgot to reply to your email. I have already seen Stanislaw's
repo and I agree he can apply his patchset on top of mt76x2u one as soon as
it is merged in wireless-driver-next repo.
Moreover Stanislaw I started working on unifying mt76x2u/mt76x0 dma/usb code,
I have not sent you the patchset since I am waiting for the adapter. If you
want I can send you the code as soon as it is completed (just compiled, not
tested)

Regards,
Lorenzo

> Regards
> Stanislaw
