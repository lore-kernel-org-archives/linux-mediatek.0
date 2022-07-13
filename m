Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F270C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COj/g9JYSB+pcXohXy1P1nlHNsWLhDm+qBwUeuMOjtA=; b=wZRh8ZWoVfJKg2uCFD/MAbsk3/
	6VdNC+35aeWLilS40B61AFoWbLh7SrCU1w7pgst+1O7M9gnawei+fI3ut+jtljs5f2Qy77E4e33Dz
	zzw9u22omGP3gWjl7CAc2KpPy/BMa+x+FE+kLDf5Ie244r4FUrIVSmJ+c7NZc8X5FnUI9UScCv+pK
	MwPanNxqP8/7fVH/DigOMGid49mGG62tH8qCTMiVC/hv+CTAhdJL/5mbsKERV5eLTp8CYzp284CXA
	oiNH6wNrH9D6Oka0myCybdkmPIrX6Cuv8yWWR3aqPZkSumrRDhJJ3rXQkfu6z4Mxax/6BMi5aNkgm
	VYRDKnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBZPs-002dy6-6E; Wed, 13 Jul 2022 10:16:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBZPp-002dwl-SE; Wed, 13 Jul 2022 10:16:23 +0000
X-UUID: 40eb3329afba479ca8d59e43a32c537b-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:804b7548-c358-416e-bb4d-1768c252e32b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a05c2e64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 40eb3329afba479ca8d59e43a32c537b-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167966200; Wed, 13 Jul 2022 03:16:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 13 Jul 2022 17:45:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 13 Jul 2022 17:45:41 +0800
Message-ID: <1dc880e7b5b6a28911a0c7acb29fa423ddb10da0.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Jul 2022 17:45:41 +0800
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_031621_921692_C879CB14 
X-CRM114-Status: GOOD (  21.63  )
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

On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
> +{
> +	struct drm_display_mode mode;
> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
> +
> +	drm_display_mode_from_videomode(&timings->vm, &mode);
> +
> +	/* horizontal */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3010,
> +			   mode.htotal, HTOTAL_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3018,
> +			   timings->vm.hsync_len + timings-
> >vm.hback_porch,
> +			   HSTART_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028,
> +			   timings->vm.hsync_len <<
> HSW_SW_DP_ENC0_P0_SHIFT,

Directly use a number for shift because we know it's a shift, so it's
not necessary to define a symbol for shift.

> +			   HSW_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028,
> +			   0, HSP_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3020,
> +			   timings->vm.hactive,
> HWIDTH_SW_DP_ENC0_P0_MASK);
> +
> +	/* vertical */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3014,
> +			   mode.vtotal, VTOTAL_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_301C,
> +			   timings->vm.vsync_len + timings-
> >vm.vback_porch,
> +			   VSTART_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C,
> +			   timings->vm.vsync_len <<
> VSW_SW_DP_ENC0_P0_SHIFT,

Ditto.

Regards,
CK

> +			   VSW_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C,
> +			   0, VSP_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3024,
> +			   timings->vm.vactive,
> VHEIGHT_SW_DP_ENC0_P0_MASK);
> +
> +	/* horizontal */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3064,
> +			   timings->vm.hactive,
> HDE_NUM_LAST_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3154,
> +			   mode.htotal, PGEN_HTOTAL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3158,
> +			   timings->vm.hfront_porch,
> +			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_315C,
> +			   timings->vm.hsync_len,
> +			   PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
> +			   timings->vm.hback_porch + timings-
> >vm.hsync_len,
> +			   PGEN_HFDE_START_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3164,
> +			   timings->vm.hactive,
> +			   PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
> +
> +	/* vertical */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3168,
> +			   mode.vtotal,
> +			   PGEN_VTOTAL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_316C,
> +			   timings->vm.vfront_porch,
> +			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3170,
> +			   timings->vm.vsync_len,
> +			   PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
> +			   timings->vm.vback_porch + timings-
> >vm.vsync_len,
> +			   PGEN_VFDE_START_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3178,
> +			   timings->vm.vactive,
> +			   PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
> +}
> +


