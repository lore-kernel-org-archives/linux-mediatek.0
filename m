Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnitHAQz9hKJrC0X8eNm5Efg9oWJUHk8mogNdaUMsxM=; b=uI58yU31aEqyu5zb/vqsVX4Xvw
	S9FdHQvpkmhECH7q3IaR+1YMwcg5rIybpCiYurPEmtlWjb4eVE5S4BkRcqJqxsCejnXDLAVE8jV5A
	pLjeiLau9ba3H6XcoD1/0G7PTmz6RyzLl19KeFDpX721Yh3c06OMINaSvmePco9e9TRoL3yRuPH5O
	+uxJ3hZShOqXmL7+BrWCXhY5rs5G7JaeZKZ5poB/yu7/JMIEUNa5du6QBHqsMS84Q8X7erBrhK9YL
	IcxfMWEC1/cAfM1JaUAeBRAAs6DwoyLiC71sVllsYTEPkolydx17HUGt62IRp5oIb6+phDbOA+2CT
	xjxaVXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8c5C-00F2yW-Hp; Tue, 05 Jul 2022 06:30:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8c4k-00F2e0-L0; Tue, 05 Jul 2022 06:30:24 +0000
X-UUID: 035c91ad891248d59245f6434e1a62a0-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:47bbef5b-07c0-4eb8-b1c5-56b77da8a131,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1452a1d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 035c91ad891248d59245f6434e1a62a0-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 76494609; Mon, 04 Jul 2022 23:30:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 13:29:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jul 2022 13:29:39 +0800
Message-ID: <b126b455927dabad2e2f1dc07beefd4a44ce975f.camel@mediatek.com>
Subject: Re: [PATCH v15 16/16] drm/mediatek: dpi: Add dp_intf support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 13:29:39 +0800
In-Reply-To: <20220701035845.16458-17-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-17-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_233022_770565_0E43C8A5 
X-CRM114-Status: GOOD (  25.93  )
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

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Dpintf is the displayport interface hardware unit. This unit is
> similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - 4 pixels for one iteration for dp_intf while dpi is 1 pixel for
> one
>    iteration. Therefore, we add a new config "pixels_per_iter" to
> control
>    quantity of transferred pixels per iteration.
>  - Input of dp_intf is two pixels per iteration, so we add a new
> config
>    "input_2pixel" to control this.
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
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 65
> ++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     | 12 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  3 +
>  5 files changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index be039474cf26..1072e94d2f2f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -125,12 +125,15 @@ struct mtk_dpi_yc_limit {
>   * @swap_input_support: Support input swap function.
>   * @color_fmt_trans_support: Enable color format transfer.
>   * @support_direct_pin: IP supports direct connection to dpi panels.
> + * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so
> enable this
> + *		  config to enable this feature.
>   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> VSYNC_PORCH
>   *		    (no shift).
>   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
>   * @channel_swap_shift: Shift value of channel swap.
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
> + * @pixels_per_iter: Quantity of transferred pixels per iteration.
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -143,11 +146,13 @@ struct mtk_dpi_conf {
>  	bool swap_input_support;
>  	bool color_fmt_trans_support;
>  	bool support_direct_pin;
> +	bool input_2pixel;

Separate input_2pixel to an independent patch.

>  	u32 dimension_mask;
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
>  	u32 yuv422_en_bit;
>  	u32 csc_enable_bit;
> +	u32 pixels_per_iter;

Separate pixels_per_iter to an independent patch.

Regards,
CK

>  };
>  
> 


