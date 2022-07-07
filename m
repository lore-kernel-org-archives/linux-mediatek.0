Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A26C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AFGWfxkRaMpt/LZv5Qc73mdpeBYJe6Tb+FqF38yy/Q=; b=RyuenblQmAgAHkm8KCKNiQHnb8
	aeGNqRIS5uif3DjxLekO3WKX8ySA6Gpp5FVwCQegRrGf/6TIUSec0yMxRj52BHePC05S31Ot3ygIn
	ZA+9z8nBF1GygiYvYmfuEA22duGkikwqMQOccWow+oC8GSsS65D7OxO87snMTLo/LCudos5rAQDe6
	1xQfFkRVcOYWykZ0BYSptpAjt00cm2eg+oI6UkYV58jszPJKosFnCYezXXAtd8Hgo3vuZyA4DsS1R
	oGLBGCkY28lnyL5DWDy/8aBLvDkYSGAc5VL9gqPNdpAPbN8im/sJiwYQFdczuHted2li68jx01lGm
	GRzASZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KMl-00Dnk0-HU; Thu, 07 Jul 2022 05:47:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KMi-00Dniw-0h; Thu, 07 Jul 2022 05:47:53 +0000
X-UUID: de76ac5a74ee4ea9b51b7f2800fc0b51-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:bcd97c95-a2e5-4b25-9a47-48843fe80087,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4f8da463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: de76ac5a74ee4ea9b51b7f2800fc0b51-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1380214109; Wed, 06 Jul 2022 22:47:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 7 Jul 2022 13:07:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 7 Jul 2022 13:07:12 +0800
Message-ID: <4e09ec20087d8a197d32294806c5ecfecaff84fa.camel@mediatek.com>
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Thu, 7 Jul 2022 13:07:12 +0800
In-Reply-To: <20220701062808.18596-6-rex-bc.chen@mediatek.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
	 <20220701062808.18596-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_224752_094220_EE119205 
X-CRM114-Status: GOOD (  20.02  )
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

On Fri, 2022-07-01 at 14:28 +0800, Bo-Chen Chen wrote:
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
> +struct mtk_dp_timings {
> +	struct videomode vm;
> +	u8 frame_rate;

You just assign value to frame_rate, but you never use this frame_rate,
so drop it.

Regards,
CK

> +};
> +

[snip]

> +
> +static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
> +	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
> +	mtk_dp->train_info.cable_plugged_in = false;
> +	mtk_dp->train_info.cable_state_change = false;
> +	memset(&mtk_dp->train_info.irq_sta, 0, sizeof(struct
> mtk_dp_irq_sta));
> +
> +	mtk_dp->info.format = DP_PIXELFORMAT_RGB;
> +	mtk_dp->info.depth = DP_MSA_MISC_8_BPC;
> +	memset(&mtk_dp->info.timings, 0, sizeof(struct
> mtk_dp_timings));
> +	mtk_dp->info.timings.frame_rate = 60;
> +}
> +

[snip]

> +
> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
> +					  struct drm_display_mode
> *mode)
> +{
> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
> +
> +	drm_display_mode_to_videomode(mode, &timings->vm);
> +	timings->frame_rate = drm_mode_vrefresh(mode);
> +}
> +


