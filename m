From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Add mt76x0 driver
Date: Wed, 11 Jul 2018 10:07:25 +0200
Message-ID: <20180711080721.GA3871@localhost.localdomain>
References: <1530875029-26274-1-git-send-email-sgruszka@redhat.com>
 <1531205430.26214.8.camel@mtkswgap22>
 <20180710095222.GA18926@redhat.com>
 <1531230864.26214.20.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1531230864.26214.20.camel@mtkswgap22>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

> On Tue, 2018-07-10 at 11:52 +0200, Stanislaw Gruszka wrote:
> > On Tue, Jul 10, 2018 at 02:50:30PM +0800, Sean Wang wrote:
> > > > For full support mt7610.bin firmware blob is need, hopefully with 
> > > > the permission of Mediatek, the blob will be pushed into linux-firmware
> > > > git tree.
> > > > 
> > > 
> > > Hi, Stanislaw
> > > 
> > > You can feel free to add mt7610.bin firmware blob to linux-firmware with
> > > the license LICENCE.mediatek I added in [1].
> > > 
> > > 
> > > [1]
> > > http://lists.infradead.org/pipermail/linux-mediatek/2018-June/013759.html
> > 
> > Thank you Sean!
> > 
> > I guess there is no problem with similar submission for
> > mt7662u.bin and mt7662u_rom_patch.bin needed for mt76x2u:
> > https://marc.info/?l=linux-wireless&m=153045438821562&w=2
> > 
> 

Thanks Sean,

I will submit mt7662u.bin and mt7662u_rom_patch.bin with LICENCE.mediatek
soon

> Sure, there is no any problem for submitting mt7662u.bin and
> mt7662u_rom_patch.bin if they are added with LICENCE.mediatek.
> 
> Do you or Lorenzo have a plan to add MT7668u support to mt76?
> MT7668 is a newer wifi device than MT7610u or MT7662u.
> 

Cool, I am interested in adding MT7668u support to mt76 driver.
Is the adapter available on the market?

Regards,
Lorenzo

> > Regards
> > Stanislaw
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
