Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557D7C00144
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB+NVdT/pcpnAQ/PU2/kke57xY9y2cj+WKZQ+Nsk26I=; b=btBdxogBhykJyYxqyaFMNApXRc
	p7D7656gqOSAGw1/qKccxblgPIaHPdX79ylYSD9isA4MvE1CiljN3XGBeUwr/6k052MukL5JvUEkY
	b/l5HwowfRify4StnmttJCrRseBtTYjeMiAsOhv8hKVLdUbf0xPMB+mY8mmHRqAo+ZC8ibEJJQhMb
	bN09KwryQ/fkwD7Ecl51yOJpGTGxPdDj2EeWZdW8YMOitoaWpOqxHKRN642LYcoRTyfpzxXrn2bU6
	lWsDIS0NfxCmyeZQoiFlJie5150hKGkWT0DdljWWpg7dDbWPcIE5qX4WnMCLemPDPckpKZuBxWYki
	rNPZKZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIikF-00A6GB-D8; Tue, 02 Aug 2022 03:38:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIikD-00A6Fb-1f; Tue, 02 Aug 2022 03:38:58 +0000
X-UUID: 8c3428323d08402294eb918c4503cf81-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3d2e8da7-3c1d-4c0a-915d-0d44e6bbaafb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:176106d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8c3428323d08402294eb918c4503cf81-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1935882255; Mon, 01 Aug 2022 20:37:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 10:56:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 10:56:31 +0800
Message-ID: <f38757a55a5a5f90099a2b166363b32da44ff3a7.camel@mediatek.com>
Subject: Re: [PATCH v15 05/11] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Tue, 2 Aug 2022 10:56:30 +0800
In-Reply-To: <20220727045035.32225-6-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
	 <20220727045035.32225-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_203857_105657_CA2EDA21 
X-CRM114-Status: GOOD (  18.20  )
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

On Wed, 2022-07-27 at 12:50 +0800, Bo-Chen Chen wrote:
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
> +#define MTK_DP_ENC0_P0_31D0			(ENC0_OFFSET + 0x1D0)

MTK_DP_ENC0_P0_31D0 is uselese, so remove it.

> +#define VSC_EXT_CEA_HB0_DP_ENC0_P0_MASK		GENMASK(7, 0)
> +#define VSC_EXT_CEA_HB1_DP_ENC0_P0_MASK		GENMASK(15, 8)
> +#define VSC_EXT_CEA_HB1_DP_ENC0_P0_SHIFT	BIT(3)
> +
> +#define MTK_DP_ENC0_P0_31D4			(ENC0_OFFSET + 0x1D4)

Ditto.

> +#define VSC_EXT_CEA_HB2_DP_ENC0_P0_MASK		GENMASK(7, 0)
> +#define VSC_EXT_CEA_HB2_DP_ENC0_P0_SHIFT	0
> +#define VSC_EXT_CEA_HB3_DP_ENC0_P0_MASK		GENMASK(15, 8)
> +
> +#define MTK_DP_ENC0_P0_31D8			(ENC0_OFFSET + 0x1D8)

Ditto.

> +#define VSC_EXT_VESA_NUM_DP_ENC0_P0_MASK	GENMASK(5, 0)
> +#define VSC_EXT_VESA_NUM_DP_ENC0_P0_SHIFT	0
> +#define VSC_EXT_CEA_NUM_DP_ENC0_P0_MASK		GENMASK(13, 8)
> +#define VSC_EXT_CEA_NUM_DP_ENC0_P0_SHIFT	BIT(3)
> +
> +#define MTK_DP_ENC0_P0_31DC			(ENC0_OFFSET + 0x1DC)

Ditto.

Regards,
CK

> +#define HDR0_CFG_DP_ENC0_P0_MASK		GENMASK(7, 0)
> +#define HDR0_CFG_DP_ENC0_P0_SHIFT		0
> +#define MTK_DP_ENC0_P0_31E8			(ENC0_OFFSET + 0x1E8)
> +#define MTK_DP_ENC0_P0_31EC			(ENC0_OFFSET + 0x1EC)
> +#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK	BIT(4)
> +#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT	BIT(2)
> +#define ISRC1_HB3_DP_ENC0_P0_MASK		GENMASK(15, 8)
> +#define ISRC1_HB3_DP_ENC0_P0_SHIFT		BIT(3)
> +


