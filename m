Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C6DC00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 04:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13dVi6zffDRyU08aWmQ+RkE23iuEih6mcqLZPlBATNQ=; b=VAkxhQi2QfpeKMNB/Mjx4R4jcR
	3/yvzQIEl3WaU3b5g4rJMyYvAL13C+nP8Oei/lES84vS43ftplKaKwRYK8UqnPRFlTYys16fftjG4
	jPcm3NgjchBjYtoXNKQQbpFcjYg0hqfvEwYyfnm9bJSd1FXh6aFh68vnjdWl3trhlS20Eu4aqO/7n
	1AdCUmS1FFVDIp1pP9YtsfzBjUwclDvZFtDABRSNbW31xZJfPLO1g6uDM/7wobroiuM76JXPRecWt
	tklq2gAJXOmesvo1LTSZVDVrkd/gyj6wQ7tk/sgx5VyEP6MMKfTM4zqmhIL80U2egtdQS5XaSPDJ8
	4kvWtBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKuSu-009R19-28; Mon, 08 Aug 2022 04:34:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKuSr-009QqJ-4P; Mon, 08 Aug 2022 04:34:06 +0000
X-UUID: 9969fc9d6e7f4a49918432f7c4bb2c88-20220807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f97efe1e-c720-4fab-9171-3af3cc81310d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:b85f2eae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9969fc9d6e7f4a49918432f7c4bb2c88-20220807
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 166129387; Sun, 07 Aug 2022 21:34:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 8 Aug 2022 12:03:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 12:03:24 +0800
Message-ID: <f5165c4f6f4f72668035437ee27b476e588e60a3.camel@mediatek.com>
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
Date: Mon, 8 Aug 2022 12:03:24 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
	 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_213405_191123_2AE2C1F3 
X-CRM114-Status: GOOD (  18.02  )
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
> +#define MTK_DP_ENC0_P0_30B8		(ENC0_OFFSET + 0xB8)

Useless, so remove it.

> +
> +#define MTK_DP_ENC0_P0_30BC		(ENC0_OFFSET + 0xBC)

Ditto.

> +#define ISRC_CONT_DP_ENC0_P0_MASK	BIT(0)
> +#define ISRC_CONT_DP_ENC0_P0_SHIFT	0
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK	GENMASK(10, 8)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT	BIT(3)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2 \
> +		(1 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4 \
> +		(2 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8 \
> +		(3 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2 \
> +		(5 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4 \
> +		(6 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8 \
> +		(7 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
> +
> +#define MTK_DP_ENC0_P0_30D8		(ENC0_OFFSET + 0xD8)

Ditto.

> +#define MTK_DP_ENC0_P0_312C		(ENC0_OFFSET + 0x12C)

Ditto.

> +#define ASP_HB2_DP_ENC0_P0_MASK		GENMASK(7, 0)
> +#define ASP_HB3_DP_ENC0_P0_MASK		GENMASK(15, 8)
> +#define ASP_HB3_DP_ENC0_P0_SHIFT	BIT(3)
> +
> 

[snip]

> +
> +#define MTK_DP_ENC1_P0_3364				(ENC1_OFFSET +
> 0x164)
> +#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK	GENMASK(11, 0)
> +#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT	0
> +#define FIFO_READ_START_POINT_DP_ENC1_P0_MASK		GENMASK
> (15, 12)
> +#define FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT		GENMASK
> (3, 2)

I would like bit-wise value has one more indent like [1].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_disp_rdma.c?h=v5.19

Regards,
CK

> +
> +#define MTK_DP_ENC1_P0_3368				(ENC1_OFFSET +
> 0x168)
> +#define VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT	0
> +#define VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT		BIT(2)
> +#define SDP_DP13_EN_DP_ENC1_P0_SHIFT			BIT(3)
> +#define BS2BS_MODE_DP_ENC1_P0_MASK			GENMASK(13, 12)
> +#define BS2BS_MODE_DP_ENC1_P0_SHIFT			GENMASK(3, 2)
> +
> 


