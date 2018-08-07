From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 08/13] drm/mediatek: add function to get layer number
 for component
Date: Tue, 7 Aug 2018 11:37:38 +0800
Message-ID: <1533613058.22668.6.camel@mtksdaap41>
References: <1533556700-26525-1-git-send-email-stu.hsieh@mediatek.com>
         <1533556700-26525-9-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533556700-26525-9-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Stu:

On Mon, 2018-08-06 at 19:58 +0800, Stu Hsieh wrote:
> This patch add function to get layer number for component
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 7413ffeb3c9d..8399229e6ad2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -78,6 +78,7 @@ struct mtk_ddp_comp_funcs {
>  	void (*stop)(struct mtk_ddp_comp *comp);
>  	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
>  	void (*disable_vblank)(struct mtk_ddp_comp *comp);
> +	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
>  	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx);
>  	void (*layer_off)(struct mtk_ddp_comp *comp, unsigned int idx);
>  	void (*layer_config)(struct mtk_ddp_comp *comp, unsigned int idx,
> @@ -128,6 +129,14 @@ static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
>  		comp->funcs->disable_vblank(comp);
>  }
>  
> +static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->layer_nr)
> +		return comp->funcs->layer_nr(comp);
> +
> +	return 0;
> +}
> +
>  static inline void mtk_ddp_comp_layer_on(struct mtk_ddp_comp *comp,
>  					 unsigned int idx)
>  {
