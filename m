From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 09/13] drm/mediatek: add callback function to return
 OVL layer number
Date: Tue, 7 Aug 2018 11:47:10 +0800
Message-ID: <1533613630.22668.10.camel@mtksdaap41>
References: <1533556700-26525-1-git-send-email-stu.hsieh@mediatek.com>
         <1533556700-26525-10-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533556700-26525-10-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Stu:

On Mon, 2018-08-06 at 19:58 +0800, Stu Hsieh wrote:
> This patch add callback function to return OVL layer number
> 
> For now, MT8173, MT2712, MT2701 OVL all has 4 layer.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>

I would like to remove the term 'callback' because this is just function
pointer rather than callback function. OVL does not register callback
function to crtc and crtc call OVL function directly. The modification
is good to me, so

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 978782a77629..66060e79afbc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -132,6 +132,11 @@ static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
>  	writel(0x0, comp->regs + DISP_REG_OVL_RST);
>  }
>  
> +static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
> +{
> +	return 4;
> +}
> +
>  static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx)
>  {
>  	unsigned int reg;
> @@ -221,6 +226,7 @@ static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
>  	.stop = mtk_ovl_stop,
>  	.enable_vblank = mtk_ovl_enable_vblank,
>  	.disable_vblank = mtk_ovl_disable_vblank,
> +	.layer_nr = mtk_ovl_layer_nr,
>  	.layer_on = mtk_ovl_layer_on,
>  	.layer_off = mtk_ovl_layer_off,
>  	.layer_config = mtk_ovl_layer_config,
