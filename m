From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] [media] mtk-vcodec: fix more type mismatches
Date: Wed, 13 Jul 2016 15:17:17 +0200
Message-ID: <9022784.B8ChAA686D@wuerfel>
References: <20160713084916.2765651-1-arnd@arndb.de>
 <1468407163.3555.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1468407163.3555.1.camel@mtksdaap41>
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
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, pochun lin <pochun.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wednesday, July 13, 2016 6:52:43 PM CEST pochun lin wrote:
> > diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > index f4e18bb44cb9..9a600525b3c1 100644
> > --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > @@ -295,9 +295,9 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
> >               wb[i].iova = inst->work_bufs[i].dma_addr;
> >  
> >               mtk_vcodec_debug(inst,
> > -                              "work_buf[%d] va=0x%p iova=0x%p size=%zu",
> > +                              "work_buf[%d] va=0x%p iova=%pad size=%zu",
> >                                i, inst->work_bufs[i].va,
> > -                              (void *)inst->work_bufs[i].dma_addr,
> > +                              &inst->work_bufs[i].dma_addr,
> >                                inst->work_bufs[i].size);
> >       }
> >  
> 
> This modified will dump dma_addr's address, not dma_addr value.
> In actually, we need to dump dma_addr value.

According to Documentation/printk-formats.txt, it gets passed by
reference:

| DMA addresses types dma_addr_t:
|
|        %pad    0x01234567 or 0x0123456789abcdef
|
|        For printing a dma_addr_t type which can vary based on build options,
|        regardless of the width of the CPU data path. Passed by reference.

The whole point of the %pad/%pr/%pM/... format strings is to print
something that cannot be passed by value because the type is not
a fixed-size integer.

	Arnd
