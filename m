Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22537C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytXyJ0wGtZxXNEryOhDuKEMiBIzu1x41XvvccntlwnI=; b=k3vqmlMc67RosE
	opT3RsfEoJOvc7ZTShxBeDiPPS8Rw4VAc2HCKvJhcoTSvEjQ7dxQBFVHkimH48NvPIaCE1RNpqRMq
	+V11CiY2nKYJYBlV6x6JLgsU74oA4ylH5SmvIPBPKt5TjwMPtV0DEtaCugnqhX0EWGRDgf65Ek0aV
	lIGUeZwRF4Q8m6A2KrXH0bKgXEy8hXyYc0V3gJw0e8qomv/pVHtuuQF4ZS4TfZRNt54QUu3BchUSw
	3pWtN2dZNukKBoVxPy+tn3Cafzc36QWnvoaJKoKvVdCNdWkUB0qqccye0J4d1B2z9SWKLAGSIa+Jm
	bAopjy8HpDpIqlKnrRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTw5-005ZaO-TU; Tue, 07 Jun 2022 07:47:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTvr-005ZUb-S6; Tue, 07 Jun 2022 07:47:21 +0000
X-UUID: cb67215c543b4e0290c9e60f08264a21-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:bb9175ec-9a7a-4ab5-a256-efe0e330e1e0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:2ea5e8e4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: cb67215c543b4e0290c9e60f08264a21-20220607
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 608213774; Tue, 07 Jun 2022 00:47:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 00:47:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 15:47:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 15:47:07 +0800
Message-ID: <f791f46c6307a18818574cb7fb8653bcc84aa9ad.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Guillaume Ranquet
	<granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 15:47:07 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_004719_957219_C7A79EC1 
X-CRM114-Status: GOOD (  24.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rex:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
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
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---

[snip]

> +
> +static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
> +	ssize_t ret;
> +	u8 sink_count;
> +	bool locked;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> +	u32 link_status_reg = DP_LANE0_1_STATUS;
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> &sink_count);
> +	if (ret < 0) {
> +		drm_err(mtk_dp->drm_dev, "Read sink count failed:
> %ld\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> link_status,
> +			       sizeof(link_status));
> +	if (!ret) {
> +		drm_err(mtk_dp->drm_dev, "Read link status failed:
> %ld\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	locked = drm_dp_channel_eq_ok(link_status,
> +				      mtk_dp->train_info.lane_count);
> +	if (!locked && mtk_dp->train_state >
> MTK_DP_TRAIN_STATE_TRAINING_PRE)

Before enter this function, mtk_dp->train_state is set to
MTK_DP_TRAIN_STATE_STARTUP, so this never happen, drop this.

> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +
> +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> DP_DEVICE_SERVICE_IRQ_VECTOR,
> +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> +
> +	if (DP_GET_SINK_COUNT(sink_count) &&
> +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> +		mtk_dp->train_info.check_cap_count = 0;
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;

Why change state from MTK_DP_TRAIN_STATE_STARTUP to
MTK_DP_TRAIN_STATE_CHECKEDID? In mtk_dp_train_handler(),
mtk_dp_parse_capabilities() is true then change to
MTK_DP_TRAIN_STATE_CHECKEDID. Give a reason why these two are
different.

Regards,
CK

> +		msleep(20);
> +	}
> +
> +	return 0;
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
