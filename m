Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQuJJ2N2HKOk2jb8mrTJSCqonqivQ9kAvpXHeNd6Vwk=; b=I/XsgPX5AEGoWaKn4MzBQau4dE
	c2DfpcnI03R9ZFSC4IODh2iV1eA2QGUlyfLBNcyhyXtWf1Cc9879g8HmwSRamg57yN3lr8GZfQIFW
	jrGUprJFJTadyswkSYCohyFKriI8l7EtsUBw/NZY/ZgEX1m6xr0euE8+7B0mq2sWR7E+ir00bljvh
	bAUai5eLC5MP7bTSACcLoRQp9Iqs5c1jYxEOjwLpvNMeGI/OC9b4SR/TQEKU6zCqp5YnE5kSyMQ6k
	jPywmxyFiEDhKtrLIkz9IujKC89NRlsGceD+FL/lhTsORm3ZDV8TzTYDgmHWvcjouyChuclQEiYjx
	cbM+qybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXeE-001c92-Uu; Wed, 13 Jul 2022 08:23:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXeA-001c4g-Qu; Wed, 13 Jul 2022 08:23:04 +0000
X-UUID: 291d4c12c8a748ecb83138c161269837-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:70ca5fad-6d2e-404a-8d39-e17aa8151be0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:59a8da32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 291d4c12c8a748ecb83138c161269837-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 824815901; Wed, 13 Jul 2022 01:22:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 13 Jul 2022 16:22:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 13 Jul 2022 16:22:15 +0800
Message-ID: <6ba15d8532b726bd1a16cf2956140b2cba5d74f7.camel@mediatek.com>
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
Date: Wed, 13 Jul 2022 16:22:15 +0800
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_012302_915913_D5712096 
X-CRM114-Status: GOOD (  22.89  )
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
> +static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state
> *bridge_state,
> +				      struct drm_crtc_state
> *crtc_state,
> +				      struct drm_connector_state
> *conn_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_crtc *crtc = conn_state->crtc;
> +	unsigned int input_bus_format;
> +
> +	input_bus_format = bridge_state->input_bus_cfg.format;
> +
> +	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format
> 0x%04x\n",
> +		bridge_state->input_bus_cfg.format,
> +		 bridge_state->output_bus_cfg.format);
> +
> +	if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> +		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
> +	else
> +		mtk_dp->info.format = DP_PIXELFORMAT_RGB;
> +
> +	if (!crtc) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state doesn't
> have a crtc\n");
> +		return -EINVAL;
> +	}
> +
> +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state-
> >adjusted_mode);
> +	if (mtk_dp_parse_capabilities(mtk_dp)) {

mtk_dp_bridge_atomic_enable() would call mtk_dp_parse_capabilities(),
so this is redundant.

Regards,
CK

> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged
> in\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +


