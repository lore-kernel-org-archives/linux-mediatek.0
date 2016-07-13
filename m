From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] [media] mtk-vcodec: fix type mismatches
Date: Wed, 13 Jul 2016 15:08:09 +0200
Message-ID: <4915511.9pXBipIRF8@wuerfel>
References: <20160711213959.2481081-1-arnd@arndb.de>
 <1468403786.32454.16.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1468403786.32454.16.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, PoChun Lin <pochun.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wednesday, July 13, 2016 5:56:26 PM CEST tiffany lin wrote:
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 6dcae0a0a1f2..0b25a8700877 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -1028,15 +1028,15 @@ static void mtk_venc_worker(struct work_struct *work)
> >       bs_buf.size = (size_t)dst_buf->planes[0].length;
> >  
> >       mtk_v4l2_debug(2,
> > -                     "Framebuf VA=%p PA=%llx Size=0x%lx;VA=%p PA=0x%llx Size=0x%lx;VA=%p PA=0x%llx Size=%zu",
> > +                     "Framebuf VA=%p PA=%pad Size=0x%zx;VA=%p PA=%pad Size=0x%zx;VA=%p PA=%pad Size=0x%zx",
> >                       frm_buf.fb_addr[0].va,
> > -                     (u64)frm_buf.fb_addr[0].dma_addr,
> > +                     &frm_buf.fb_addr[0].dma_addr,
> >                       frm_buf.fb_addr[0].size,
> >                       frm_buf.fb_addr[1].va,
> > -                     (u64)frm_buf.fb_addr[1].dma_addr,
> > +                     &frm_buf.fb_addr[1].dma_addr,
> >                       frm_buf.fb_addr[1].size,
> >                       frm_buf.fb_addr[2].va,
> > -                     (u64)frm_buf.fb_addr[2].dma_addr,
> > +                     &frm_buf.fb_addr[2].dma_addr,
> >                       frm_buf.fb_addr[2].size);
> This change will make debug message dump address of dma_addr field but
> not the value of the dma_addr we want.
> How about change it from
> PA=%llx -> PA=%u
> (u64)frm_buf.fb_addr[0].dma_addr -> (u32)frm_buf.fb_addr[0].dma_addr,
> 

The %llx works fine with the cast to u64, the change above is mainly for the "%lx"
on a size_t causing a warning.

The change to %pad is done in order to use a consistent output for the
dma_addr_t, which had a leading "0x" in two cases but not in the first
one.

printk interprets %pad as a pointer to a dma_addr_t and prints the
address, not the pointer to it, see Documentation/printk-formats.txt,
which lets you avoid the type cast as well as the 0x.

	Arnd
