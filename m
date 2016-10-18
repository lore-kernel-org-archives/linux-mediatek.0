From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: fix a typo
Date: Tue, 18 Oct 2016 17:44:59 +0800
Message-ID: <1476783899.25750.3.camel@mtksdaap41>
References: <1476779039-28963-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476779039-28963-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

Acked-by: CK Hu <ck.hu@mediatek.com>

On Tue, 2016-10-18 at 16:23 +0800, Bibby Hsieh wrote:
> If we want to set the hardware OD to relay mode,
> we have to set OD_CFG register rather than
> OD_RELAYMODE; otherwise, the system will access
> the wrong address.
> 
> Fixes: 7216436420414144646f5d8343d061355fd23483 ("drm/mediatek: set mt8173 dithering function")
> Cc: stable@vger.kernel.org # v4.9+
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index df33b3c..aa5f20f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -123,7 +123,7 @@ static void mtk_od_config(struct mtk_ddp_comp *comp, unsigned int w,
>  			  unsigned int bpc)
>  {
>  	writel(w << 16 | h, comp->regs + DISP_OD_SIZE);
> -	writel(OD_RELAYMODE, comp->regs + OD_RELAYMODE);
> +	writel(OD_RELAYMODE, comp->regs + OD_CFG);
>  	mtk_dither_set(comp, bpc, DISP_OD_CFG);
>  }
>  
