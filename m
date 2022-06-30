Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F379C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1ICy1YkconN4OfaD9Mcwnpp4LamaSM6di+i1zfK368=; b=C3AYhxupIvCpuB2Y8QHonkr9Cq
	VDjHp4jKdMNjP0iXwX2A3P9gfUSUf3OtfeKd9yykNI65d31GaFGKR4eg2Xo09DcJA8xnqBE8s54fI
	XqYy/uoHbBdGyscce9NF4Yss6DXf+3LGKAE/6EV2+8EIaqTowTtskBgIwjbxxiXWAJ3jbV9PfdLpe
	ipIyjf2FX9Agz/GrN3pfq8jKnlVizdxQc/4VPgH2vDqVB5Fg/i7gx5FGddIMCBhbX/+Q51VR4sBcI
	AYHqi19uZY0fAYHnbaTQoJqMhSVUQBM9J9GvcDsAzESToh53E1r5RMteUIG39+XmXPgGef5vRCClJ
	c1jp/5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6kmb-00Eso7-HK; Thu, 30 Jun 2022 03:23:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6kmY-00Esng-Df; Thu, 30 Jun 2022 03:23:56 +0000
X-UUID: 5d9b330ab19e472580c4bdc62ce6f7ef-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:c6cd351c-0a23-40dd-be60-2e59387042e4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:93bf0363-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5d9b330ab19e472580c4bdc62ce6f7ef-20220629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1499603681; Wed, 29 Jun 2022 20:23:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 30 Jun 2022 10:43:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 30 Jun 2022 10:43:09 +0800
Message-ID: <c4017901a0a1dc073f8060d46dcddf6753278fa4.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 30 Jun 2022 10:43:09 +0800
In-Reply-To: <20220627080341.5087-6-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
	 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_202354_495741_FDAE8DC5 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, 2022-06-27 at 16:03 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static void mtk_dp_set_color_depth(struct mtk_dp *mtk_dp)
> +{
> +	u32 val;
> +	/* Only support 8 bits currently */
> +	u32 color_depth = DP_MSA_MISC_8_BPC;
> +
> +	mtk_dp->info.depth = color_depth;
> +
> +	/* Update MISC0 */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +			   color_depth, DP_TEST_BIT_DEPTH_MASK);
> +
> +	switch (color_depth) {
> +	case DP_MSA_MISC_6_BPC:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
> +		break;
> +	case DP_MSA_MISC_8_BPC:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;

This driver just use DP_MSA_MISC_8_BPC, so keep this and drop others.

Regards,
CK

> +		break;
> +	case DP_MSA_MISC_10_BPC:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
> +		break;
> +	case DP_MSA_MISC_12_BPC:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
> +		break;
> +	case DP_MSA_MISC_16_BPC:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
> +		break;
> +	default:
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color depth
> %d\n",
> +			 color_depth);
> +		return;
> +	}
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> +			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
> +}
> +


