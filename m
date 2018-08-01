From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 00/14] Add mt76x0 driver
Date: Wed, 1 Aug 2018 10:40:57 +0200
Message-ID: <20180801084056.GB4794@localhost.localdomain>
References: <1533040864-9026-1-git-send-email-sgruszka@redhat.com>
 <87y3dqzga9.fsf@purkki.adurom.net>
 <20180801082508.GA4526@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180801082508.GA4526-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Aug 01, Stanislaw Gruszka wrote:
> On Wed, Aug 01, 2018 at 10:39:58AM +0300, Kalle Valo wrote:
> > Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
> > 
> > > Add mt76x0 driver for MT7610U based USB dongles. Currently driver
> > > support only STA mode.
> > >
> > > mt76x0 is based on Jakub's mt7601u driver already included
> > > in the kernel. I would like the driver be integrated as part
> > > of mt76 (instead of separate driver in mediatek dir like mt7601u)
> > > to utilize mt76 code for adding support for MT76x0 PCIe devices
> > > in further development.
> > 
> > So what's the future for mt7601u, are we going to delete it? What's
> > Jakub's opinion about all this? And what's the delta featurewise between
> > mt7601u and this driver? Which one will be loaded by default?
> 
> mt7601u is driver for different chip: MT7601. This driver if for MT7610
> chip. There are lot of similarities between the drivers, but there are
> bunch of differences too. And in the future development of mt76x0, due
> to integration into mt76 and mt76x2u and adding support for PCIe chips,
> the differences against mt7601u will be much be bigger.
> 
> > Also I noticed that mt76 is missing an entry in MAINTAINERS file? Could
> > someone send a separate patch to add that, please?
> 
> The question is if Felix would like to be the maintainer? Otherwise who would
> want to do this job? I think the best option would be to get some
> commitment from Mediatek if that possible, maybe Sean Wang could aggree
> to be the maintainer ? :-)

Maybe add multiple maintainers? I think the best option is Felix (if he agrees)
since he started the work and he has more experience/knowledge of the code

Regards,
Lorenzo

> 
> Thanks
> Stanislaw 
