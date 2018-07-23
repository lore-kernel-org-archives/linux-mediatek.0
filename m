From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Add mt76x0 driver
Date: Mon, 23 Jul 2018 11:35:10 +0200
Message-ID: <20180723093510.GB26486@redhat.com>
References: <1530875029-26274-1-git-send-email-sgruszka@redhat.com>
 <1531205430.26214.8.camel@mtkswgap22>
 <20180710095222.GA18926@redhat.com>
 <1531230864.26214.20.camel@mtkswgap22>
 <20180711080721.GA3871@localhost.localdomain>
 <1532100994.8953.305.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1532100994.8953.305.camel@mtkswgap22>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hello,

On Fri, Jul 20, 2018 at 11:36:34PM +0800, Sean Wang wrote:
> > > Sure, there is no any problem for submitting mt7662u.bin and
> > > mt7662u_rom_patch.bin if they are added with LICENCE.mediatek.
> > > 
> > > Do you or Lorenzo have a plan to add MT7668u support to mt76?
> > > MT7668 is a newer wifi device than MT7610u or MT7662u.
> > > 
> > 
> > Cool, I am interested in adding MT7668u support to mt76 driver.
> > Is the adapter available on the market?
> 
> I'm not sure if it can be got from the market easily.
> 
> I would like to say, mt7668 is based on new MTK wifi architecture. as
> for mt7662/mt7612/mt7610, they all belong to legacy Ralink based design.
> of course, we will never see any new chip based on Ralink based design
> wifi in the future.
> 
> There must be really lots of differences exist between two types of
> devices, such as MCU firmware download, MCU control interface, tx/rx
> path, even hardware register layout all changed and so on.
> 
> I guess the hardware abstraction layer needs to be largely adjusted to
> add the new device mt7668u into mt76 driver. And even I think it would
> be easier for development and maintenance if we make a separate driver
> and then pick up some pure software components from mt76 to reuse.

It could be the case that it's better to develop separate mac80211 driver
for this new chip than to integrate it into mt76. FWIW few years back
there was failed efforts to add MT7630 devices into venerable rt2x00
driver and Felix Fietkau decision to develop new mt76 driver proved that
this is better approach (though MT7620 is still supported via rt2x00
driver, but IMHO would be much better to have it as part of mt76).

As usual the devil is in the detail. We have not yet unstreamed Felix'
mt7603 driver which is part of mt76 in github tree;
https://github.com/openwrt/mt76 
I was not aware of that before, but according to description it also
supports MT7688 ? ( PCIe version ?). However, for what I can tell,
overlap between mt76x2 and mt7603 is very small and make mt7603 a
separate driver it drivers/net/wireless/mediatek/ could be a better
decision.
 
> Maybe it's the time I want to test your tree first with 7612u (?) or
> mt7610u (?) , what is suggested? and see how big the gap between this
> two type of devices and last write some code based on your tree to test
> mt7668u

Both 7610u and 7612u should be supported in my development
mt76x0-draft-v2 branch, which add mt76x0 on top of Lorenzo mt76x2u:
https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft-v2
so you can test that if you want to :-)

Thanks
Stanislaw
