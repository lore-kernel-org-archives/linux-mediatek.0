From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [ANN] mt76x0 usb driver
Date: Mon, 25 Jun 2018 14:08:17 +0200
Message-ID: <20180625120816.GA2072@redhat.com>
References: <20180409141032.GA9247@redhat.com>
 <20180409142640.GA5680@localhost.localdomain>
 <20180409144819.GA9253@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180409144819.GA9253-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Jakub =?utf-8?B?S2ljacWEc2tp?= <moorray3-5tc4TXWwyLM@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi all,

On Mon, Apr 09, 2018 at 04:48:19PM +0200, Stanislaw Gruszka wrote:
> On Mon, Apr 09, 2018 at 04:26:42PM +0200, Lorenzo Bianconi wrote:
> > > I would like to integrate the driver to kernel via mt76 driver, i.e.
> > > add USB hooks and mt76x0 mac/phy code to mt76. This will open
> > > possibility to develop support for mt76x2 USB devices as well as mt76x0
> > > PCIe devices in mt76.
> > > 
> > 
> > I have already started supporting mt76x2 USB devices in mt76 since register map
> > is pretty similar to PCIe devices:
> > https://github.com/LorenzoBianconi/wireless-drivers-next/tree/mt76x2u
> > I added some usb utility routines so I think we can integrate mt76x0 in mt76 as
> > well
> 
> Great, I'll start to integrate mt76x0 on top of your tree.

So I started to do integration here:
https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft

However since driver is self containging, I think better would be just
submit the driver into mt76/mt76x0/ dir upstream and do code merging work as
follow-up patches posted on the mailing list. Patches then could be reviewed
on regular basic. This will provide support for new mt76x0 devices in kernel
quicker. Conflicts with mt76x2u and not yet upstreamed mt7603 could be resolved
on the fly.

Another issue is firmware submission, how it was done for mt7601u and mt76x2 ?

Thanks
Stanislaw
