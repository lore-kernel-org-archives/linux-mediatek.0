Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB23C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 02:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elZ3oM0hweB94ZBrLm0yOA52D8BuxM5GNFshO0o30y4=; b=Gj1K3ktsmir/Fsc3D5RUPb3yjp
	UcCrKx6w3iAFSnBsOE2hQEuR4viTLb+8TqNlcMtnvdpqLXIVeln7dy3O4PmFksCGrniUUWJnyJ9Pw
	hGCkTfaZF3lfgIoEjy0IRtuzD9PYYK0ZAB4oeJLVBacs7qU71LpglOf57hhZfyI2XAVFkRddRKRc/
	o77K/Ct/5gSjeOuCJz/Kb5nO7MigdXfa9A18umBbqALVq5bEyjJY3qTLiA2Lq6hB5vlKI5AVp58Wi
	29FYyWNSO57ChC1DlX5v5aACM3tnRFsPD7zGcagBQgAoWVSg1Nq9nVLSjSN1zmrGytIuTR46o7IKm
	60Z1y+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Tsi-003Hkc-E9; Tue, 21 Jun 2022 02:44:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Tse-003Hja-Vk; Tue, 21 Jun 2022 02:44:42 +0000
X-UUID: e978168dffbf41298446460fca4337e1-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:86b4c4ae-1ae7-4060-8c18-7ee79ac7a081,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:e0e10eea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e978168dffbf41298446460fca4337e1-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2128024256; Mon, 20 Jun 2022 19:42:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 19:32:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 10:32:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jun 2022 10:32:30 +0800
Message-ID: <0862532b568f7e13b89b6537928efd518a2971a3.camel@mediatek.com>
Subject: Re: [PATCH v12 10/14] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 10:32:30 +0800
In-Reply-To: <20220620121028.29234-11-rex-bc.chen@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-11-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_194441_076051_D3DCB352 
X-CRM114-Status: GOOD (  32.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bo-Chen:

On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is
> similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - 4 pixels for one round for dp_intf while dpi is 1 pixel for one
> round.
>    Therefore, pixel clock and timing parameter should be divided by 4
> for
>    dp_intf.
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set.
>    The main difference is some parts of hardware design between
> dp_intf
>    and dpi.
>  - Some register contents differ slightly between the two components.
> To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 65
> +++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     | 13 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  3 +
>  5 files changed, 82 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index e186870ba3bc..2717b1741b7a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
> +	bool is_dpintf;
>  	bool swap_input_support;
>  	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> (no shift) */
>  	u32 dimension_mask;
> @@ -513,6 +514,14 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	pll_rate = clk_get_rate(dpi->tvd_clk);
>  
>  	vm.pixelclock = pll_rate / factor;
> +
> +	/*
> +	 * For dp_intf, we need to divide clock by 4 because it's
> +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> +	 */
> +	if (dpi->conf->is_dpintf)
> +		vm.pixelclock /= 4;

I this this should define dpi->conf->round_pixels rather than dpi-
>conf->is_dpintf.

> +
>  	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
>  	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
>  		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> @@ -534,6 +543,17 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	hsync.sync_width = vm.hsync_len;
>  	hsync.back_porch = vm.hback_porch;
>  	hsync.front_porch = vm.hfront_porch;
> +
> +	/*
> +	 * For dp_intf, we need to divide everything by 4 because it's
> +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> +	 */
> +	if (dpi->conf->is_dpintf) {
> +		hsync.sync_width = vm.hsync_len / 4;
> +		hsync.back_porch = vm.hback_porch / 4;
> +		hsync.front_porch = vm.hfront_porch / 4;
> +	}

Ditto.

> +
>  	hsync.shift_half_line = false;
>  	vsync_lodd.sync_width = vm.vsync_len;
>  	vsync_lodd.back_porch = vm.vback_porch;
> @@ -575,11 +595,16 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	mtk_dpi_config_channel_limit(dpi);
>  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> -	mtk_dpi_config_2n_h_fre(dpi);
> -	mtk_dpi_dual_edge(dpi);
> -	mtk_dpi_config_disable_edge(dpi);
> +	if (dpi->conf->is_dpintf) {

Separate this to an independent patch and give a better config name
rather than dpi->conf->is_dpintf.

> +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> +			     DPINTF_INPUT_2P_EN);
> +	} else {
> +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> +		mtk_dpi_config_2n_h_fre(dpi);
> +		mtk_dpi_dual_edge(dpi);
> +		mtk_dpi_config_disable_edge(dpi);
> +	}
>  	mtk_dpi_sw_reset(dpi, false);
>  
>  	return 0;
> @@ -817,6 +842,16 @@ static unsigned int mt8183_calculate_factor(int
> clock)
>  		return 2;
>  }
>  

[snip]

>  
>  #define EDGE_SEL_EN			BIT(5)
>  #define H_FRE_2N			BIT(25)
> +

This seems not related to dpintf support.

Regards,
CK

>  #endif /* __MTK_DPI_REGS_H */
> 


