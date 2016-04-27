From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] memory: mtk-smi: export mtk_smi_larb_get/put
Date: Wed, 27 Apr 2016 14:22:38 +0200
Message-ID: <1461759758.4044.43.camel@pengutronix.de>
References: <1461747086-26286-1-git-send-email-p.zabel@pengutronix.de>
 <57209DD0.5050002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <57209DD0.5050002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Matthias,

Am Mittwoch, den 27.04.2016, 13:09 +0200 schrieb Matthias Brugger:
> Hi Philipp,
> 
> On 27/04/16 10:51, Philipp Zabel wrote:
> > To allow building mediatek-drm.ko as a module, the
> > mtk_smi_larb_get and mtk_smi_larb_put symbols have
> > to be exported.
> >
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >   drivers/memory/mtk-smi.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index 089091f..f6b5757 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -91,6 +91,7 @@ int mtk_smi_larb_get(struct device *larbdev)
> >
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_smi_larb_get);
> >
> >   void mtk_smi_larb_put(struct device *larbdev)
> >   {
> > @@ -106,6 +107,7 @@ void mtk_smi_larb_put(struct device *larbdev)
> >   	mtk_smi_disable(&larb->smi);
> >   	mtk_smi_disable(common);
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_smi_larb_put);
> >
> >   static int
> >   mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
> >
> 
> Strangely this didn't work with my config (attached).
> Would you mind to double check?

warning: (DRM_MEDIATEK && MTK_IOMMU) selects MTK_SMI which has unmet
direct dependencies (MEMORY && (ARCH_MEDIATEK || COMPILE_TEST))

I suppose DRM_MEDIATEK also has to select MEMORY, just like MTK_IOMMU
does?

regards
Philipp
