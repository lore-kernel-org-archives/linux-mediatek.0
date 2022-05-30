Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EBEC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JehtIy2W9832C1RnzpE+UX36810zo4xqcUK0wz3YYI=; b=MED8b9Peb0B9PN
	VPFvC0QnU+UmBm9XZjhVUseuio0sfiUehtoxPdd2ezPHMkqT3tTw0fn0bEQH/xvWz0zttD4jW+sj/
	ZCjW6mj7HxKmlxGPibopun6ExNRjohc+/3aup2xqw36rZAdzZ0SDntZM2M6pyZRPjF5Ykd740KQpm
	Bnca1ZWpwN+epF5wegbrfEfylo4nkTzXh2m5dbiZK9r9Aa3S0s9n1vjvxdecs2baO7UsptT6KQLnS
	vOc0dQXo0CQodPvSncolHjaebS/exQPQt/DVsaIuAjQcdx92fbNsFAbwZ3AS+KgHzttpCvCx0EgiN
	2/uVLY+b2s+SjybMcx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbnm-0068SA-LL; Mon, 30 May 2022 09:35:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbnZ-0068OS-5A; Mon, 30 May 2022 09:34:56 +0000
X-UUID: add0bce945884312a68ecf817c5440c8-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:9c193e2e-b9b4-4a76-bf71-fb4c7add843b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:2c610148-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: add0bce945884312a68ecf817c5440c8-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1512981265; Mon, 30 May 2022 02:34:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 02:34:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 30 May 2022 17:34:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 17:34:46 +0800
Message-ID: <719320a455d4dc5d142cea48577c3a1b0317bb9a.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
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
Date: Mon, 30 May 2022 17:34:46 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_023453_257175_EAEEF11C 
X-CRM114-Status: GOOD (  24.05  )
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

Hi, Guillaume:

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
> 

[snip]

> +
> +static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
> +				    u8
> link_status[DP_LINK_STATUS_SIZE])
> +{
> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
> +			 DP_LINK_STATUS_SIZE);
> +}
> +
> +static int mtk_dp_train_tps_1(struct mtk_dp *mtk_dp,
> +			      u8 target_lane_count, int
> *iteration_count, u8 *lane_adjust,  int *status_control, u8
> *prev_lane_adjust)
> +{
> +	int ret;
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	ret = mtk_dp_training_set_scramble(mtk_dp, false);
> +	if (ret)
> +		return ret;
> +
> +	if (*status_control == 0) {
> +		ret = mtk_dp_train_set_pattern(mtk_dp, 1);
> +		if (ret)
> +			return ret;
> +
> +		val = DP_LINK_SCRAMBLING_DISABLE |
> +			DP_TRAINING_PATTERN_1;
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET,
> +				DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_1);
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> +				lane_adjust,
> +				sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 1;
> +		(*iteration_count)++;
> +	}
> +
> +	drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
> +					       mtk_dp->rx_cap);
> +	mtk_dp_read_link_status(mtk_dp, link_status);

drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);

> +
> +	if (drm_dp_clock_recovery_ok(link_status,
> +				     target_lane_count)) {
> +		mtk_dp->train_info.cr_done = true;
> +		*iteration_count = 1;
> +		dev_dbg(mtk_dp->dev, "Link train CR pass\n");
> +		return 0;
> +	} else if (*prev_lane_adjust == link_status[4]) {
> +		(*iteration_count)++;
> +		if (*prev_lane_adjust &
> DP_ADJUST_VOLTAGE_SWING_LANE0_MASK) {
> +			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		*prev_lane_adjust = link_status[4];
> +	}
> +	return -EAGAIN;
> +}
> +
> +static int mtk_dp_train_tps_2_3(struct mtk_dp *mtk_dp, u8
> target_linkrate,
> +				u8 target_lane_count, int
> *iteration_count, u8 *lane_adjust,  int *status_control, u8
> *prev_lane_adjust)
> +{
> +	int ret;
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	if (*status_control == 1) {
> +		if (mtk_dp->train_info.tps4) {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 4);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_TRAINING_PATTERN_4;
> +		} else if (mtk_dp->train_info.tps3) {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 3);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_3;
> +		} else {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 2);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_2;
> +		}
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET,
> +				val);
> +
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> +				lane_adjust,
> +				sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 2;
> +		(*iteration_count)++;
> +	}
> +
> +	drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
> +					   mtk_dp->rx_cap);
> +
> +	mtk_dp_read_link_status(mtk_dp, link_status);

drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);

Regards,
CK

> +
> +	if (!drm_dp_clock_recovery_ok(link_status,
> +				      target_lane_count)) {
> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +		dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +		return -EINVAL;
> +	}
> +
> +	if (drm_dp_channel_eq_ok(link_status,
> +				 target_lane_count)) {
> +		mtk_dp->train_info.eq_done = true;
> +		dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +		return 0;
> +	}
> +
> +	if (*prev_lane_adjust == link_status[4])
> +		(*iteration_count)++;
> +	else
> +		*prev_lane_adjust = link_status[4];
> +
> +	return -EAGAIN;
> +}
> +
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
