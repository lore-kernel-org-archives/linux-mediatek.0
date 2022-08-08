Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D89C00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLpQA2HDs6HPyBnCtsxUkBeWCCaY6SEoWDsQLMWSn6E=; b=UzT9A6uiuJupTTv9QuMa8qK66c
	7nXt+igkNWNsXZswt9cUx4iEcmWO/e6oKIsZiGB2WPtYbLgU6RVynwKi9CjsjFNP9TaOs7m5R7DLj
	A6rDzelon+MjObnOssl44EjExJ2TzVlesTjEB01F35vt/WoclaTKNry113wkCxAkoLQtQKueQZ7wG
	J+HY7996BmrA69B6CBb6rYSv/SAIxI4x4gaKf+kDmEHx9EKzjDh3+/o9uHntWfvD/FqgUcpKk0aKQ
	s/xvYaxOZ9ywfLmLfZPwYnzOQnZSoWKn98tgEjwa9YDf5oRM+An/kmUpVinJxFoBTH/u+bTxLfYD7
	XDp6H8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxkQ-00CI8W-KZ; Mon, 08 Aug 2022 08:04:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxkM-00CI5O-5V; Mon, 08 Aug 2022 08:04:25 +0000
X-UUID: 44dde70a6a654c4ea8ce33026ccdcda4-20220808
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:aee4afba-330f-4d23-b78c-ec3e94e17f96,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:5bdb0d9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 44dde70a6a654c4ea8ce33026ccdcda4-20220808
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 36334641; Mon, 08 Aug 2022 01:04:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 16:04:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 16:04:01 +0800
Message-ID: <575181dc6cdd1fcf391e840c0fcd5722b954a457.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Mon, 8 Aug 2022 16:04:01 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
	 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010422_242565_F8933B55 
X-CRM114-Status: GOOD (  20.65  )
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

On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
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
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

[snip]

> +
> +static enum drm_mode_status
> +mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
> +			 const struct drm_display_info *info,
> +			 const struct drm_display_mode *mode)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	u32 rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
> +	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16
> : 24;
> +
> +	if (rx_linkrate * mtk_dp->train_info.lane_count < mode->clock *
> bpp / 8)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock > 600000)

If the clock has pass the linkrate and land_count limitation, the clock
would be OK because the linkrate and lane_count is trained. Why need to
check 600000?

Regards,
CK

> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +


