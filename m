Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D93C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oo+paZzVCEqSNAiVPpvYp8NZBVxy4Qo5lTzh7lvnIcQ=; b=lTPzCsA3Kb2frD
	rurbh6j4p68OGZlPOSU5WPG6ceSR9Z+MM4m1+mcy/oWDGY1gYNt8KS5nYvOPKph/9t+iXKqgjPnX8
	nVp/OBDze5Mj2mPMDZAXg2PbGk9QlveAjQcMXq9JFUuvKLWyCyt9ImNzxope2gAL/8xV2EjLPJjCK
	mZq+w5YHDla1fx+NiazGzGujPRT2B/seTKBOYgl0/i70qkyYl3tvzkC9udXMmtV8E3VXyJFqBbo1o
	b4O6mIRRuXDabAbPxo1NIF83t6qocx1Lj5YHNw5FMFLKH+n5q5a04KV0F9oSt8Vzydm+f+31cXBgL
	OZqn8yWPxRqypBmDTwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA74X-004Vj5-Cz; Wed, 19 Jan 2022 09:16:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA74B-004Va1-P4; Wed, 19 Jan 2022 09:15:46 +0000
X-UUID: dcc0392e13864dc2b49fcf662fa84fbd-20220119
X-UUID: dcc0392e13864dc2b49fcf662fa84fbd-20220119
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 504708745; Wed, 19 Jan 2022 02:15:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 01:15:33 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:15:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 17:15:32 +0800
Message-ID: <d94c32869633e1341e5fd17ab17f5b5358f590e8.camel@mediatek.com>
Subject: Re: [PATCH v7 5/8] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, 
 <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 19 Jan 2022 17:15:31 +0800
In-Reply-To: <20211217150854.2081-6-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-6-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_011543_862234_518FDC3D 
X-CRM114-Status: GOOD (  30.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Guillaume:

On Fri, 2021-12-17 at 16:08 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is
> similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set
>  - dpintf can and needs to choose between different clockdividers
> based
>    on the clockspeed. This is done by choosing a different clock
> parent.
>  - There are two additional clocks that need to be managed. These are
>    only set for dpintf and will be set to NULL if not supplied. The
>    clk_* calls handle these as normal clocks then.
>  - Some register contents differ slightly between the two components.
> To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 304 ++++++++++++++++
> ----
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
>  include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
>  6 files changed, 299 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4554e2de14309..fbc43ea4049b9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
>  	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
>  };
>  
> +enum TVDPLL_CLK {
> +	TVDPLL_PLL = 0,
> +	TVDPLL_D2 = 2,
> +	TVDPLL_D4 = 4,
> +	TVDPLL_D8 = 8,
> +	TVDPLL_D16 = 16,
> +};
> +
>  struct mtk_dpi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
> @@ -71,8 +79,10 @@ struct mtk_dpi {
>  	void __iomem *regs;
>  	struct device *dev;
>  	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>  	struct clk *pixel_clk;
>  	struct clk *tvd_clk;
> +	struct clk *pclk_src[5];
>  	int irq;
>  	struct drm_display_mode mode;
>  	const struct mtk_dpi_conf *conf;
> @@ -125,6 +135,18 @@ struct mtk_dpi_conf {
>  	bool edge_sel_en;
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
> +	bool is_ck_de_pol;

Seperate is_ck_de_pol to an independent patch.

> +	bool is_dpintf;

Ditto for is_dpintf. And I would like change the name to what this
actually do.

> +	bool csc_support;

Ditto for csc_support.

> +	bool swap_input_support;

Ditto for swap_input_support.

> +	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH 

/* ... */

> (no shift)
> +	u32 dimension_mask;

Ditto for dimension_mask.

> +	// Mask used for HSIZE and VSIZE (no shift)
> +	u32 hvsize_mask;

Ditto for hvsize_mask.

> +	u32 channel_swap_shift;

Ditto for channel_swap_shift.

> +	u32 yuv422_en_bit;

Ditto for yuv422_en_bit.

> +	u32 csc_enable_bit;

Ditto for csc_enable_bit.

> +	const struct mtk_dpi_yc_limit *limit;

Ditto for limit.

>  };
>  
>  
> +
> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.is_dpintf = true,
> +	.csc_support = true,

For every SoC, csc_support is true. Why do we need csc_support?

Regards,
CK

> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +	.limit = &mtk_dpintf_limit,
>  };
>  
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
