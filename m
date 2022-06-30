Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECD7C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxkKxtXq0bpuXuycIkjpKFDkV3XDs7nXfkV6R8P1PTQ=; b=gKVBnqwVhXuweee9vcG2FOLjW4
	e6Lxa/zyv+SveIhprScgjoMK7SkRsvNpnDssj0lVxC8WXQ7rt15QWKu9G30i7oKNlRyB+sr3tDxJY
	u4Psx8GLV2dFXfNJ2LKJb2hwc80yD6xixAue5BbjjWJOgEOBp1b6UIenwgjlmZk5zbrh9JPRZZN/N
	gZMS1Pm3AZQ3U0WLe46rsV9r9auBoMNRtt0NhBlMA6N/cgSU8ic5qlFe4qfMTjn8Losz0/86sbrk9
	/U+KUJeGI6zoA/j7gGh0LYCqRLawCwkp9nD9Z9fLBq3DbtLJn8Qw/8KBvPAt379nAaPEzcTwIqhkN
	+0rxOy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6kZU-00ErqN-0i; Thu, 30 Jun 2022 03:10:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6kZR-00Erpv-6d; Thu, 30 Jun 2022 03:10:22 +0000
X-UUID: 8617665342114c39b1037abf136fc7da-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:3a410903-862c-402a-bb28-7828d615ec57,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:c85c0363-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8617665342114c39b1037abf136fc7da-20220629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 708523748; Wed, 29 Jun 2022 20:10:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 10:29:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 30 Jun 2022 10:29:27 +0800
Message-ID: <52747ddcdae8c1445b6bed00acec03da0806b068.camel@mediatek.com>
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
Date: Thu, 30 Jun 2022 10:29:27 +0800
In-Reply-To: <20220627080341.5087-6-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
	 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_201021_278699_9A7E78DB 
X-CRM114-Status: GOOD (  24.43  )
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
> +static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
> +			   struct platform_device *pdev)
> +{
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +	void __iomem *base;
> +	u32 linkrate;
> +	int len;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	mtk_dp->regs = devm_regmap_init_mmio(dev, base,
> &mtk_dp_regmap_config);
> +	if (IS_ERR(mtk_dp->regs))
> +		return PTR_ERR(mtk_dp->regs);
> +
> +	len = of_property_count_elems_of_size(of_node,
> +					      "data-lanes",
> sizeof(u32));
> +	if (len < 0 || len > 4 || len == 3) {
> +		dev_err(dev, "invalid data lane size: %d\n", len);
> +		return -EINVAL;
> +	}
> +
> +	mtk_dp->max_lanes = len;
> +
> +	ret = device_property_read_u32(dev, "max-linkrate-mhz",
> &linkrate);
> +	if (ret) {
> +		dev_err(dev, "failed to read max linkrate: %d\n", ret);
> +		return ret;
> +	}
> +
> +	switch (linkrate) {
> +	case 8100: /* 8.1G */
> +		mtk_dp->max_linkrate = DP_LINK_BW_8_1;
> +		break;
> +	case 5400: /* 5.4G */
> +		mtk_dp->max_linkrate = DP_LINK_BW_5_4;
> +		break;
> +	case 2700: /* 2.7G */
> +		mtk_dp->max_linkrate = DP_LINK_BW_2_7;
> +		break;
> +	case 1620: /* 1.62G */
> +		mtk_dp->max_linkrate = DP_LINK_BW_1_62;
> +		break;
> +	default:
> +		dev_err(dev, "invalid linkrate: %d\n", linkrate);
> +		return -EINVAL;
> +	}

Use drm_dp_link_rate_to_bw_code() instead of self-implementation.

Regards,
CK

> +
> +	return 0;
> +}
> +


