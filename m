From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE GPMI
 NAND driver
Date: Thu, 25 Feb 2016 11:24:41 -0800
Message-ID: <20160225192441.GM21465@google.com>
References: <1455767715-621-1-git-send-email-han.xu@nxp.com>
 <20160218043612.GA735@sha-win-210.asiapac.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160218043612.GA735-RnYvDTsF2hYsaCPVB7xHRghBfBaA6wv0QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
Cc: rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 18, 2016 at 12:36:13PM +0800, Huang Shijie wrote:
> On Thu, Feb 18, 2016 at 03:55:15AM +0000, Han Xu wrote:
> > Add a maintainer entry for FREESCALE GPMI NAND driver and add myself as a
> > maintainer.
> >
> > Signed-off-by: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7bd927e..49baa5b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4543,6 +4543,12 @@ L:     linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >  S:   Maintained
> >  F:   drivers/dma/fsldma.*
> >
> > +FREESCALE GPMI NAND DRIVER
> > +M:   Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> > +L:   linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > +S:   Maintained
> > +F:   drivers/mtd/nand/gpmi-nand/*
> > +
> >  FREESCALE I2C CPM DRIVER
> >  M:   Jochen Friedrich <jochen-NIgtFMG+Po8@public.gmane.org>
> >  L:   linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > --
> > 2.7.1
> >
> Acked-by: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>

Pushed to linux-mtd.git
