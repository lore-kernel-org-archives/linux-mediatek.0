Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A51C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soPB5SC7+r34BhZBxSRCUaZSPNGLA5erVa/IUxag4GU=; b=PE7YG3j6Ky6JVtpQVtL4o0Eojc
	DpFyfV3r0FIto2QxbeD2An/1soRW4V9BZwvMIg3scMIFZJAV7XHHF6LrwJo81cLlsEgPIT6b/YJ77
	bWFrB+QwQS1oha1c0f7EPJM+PhRTJhMnmVO8mFWB5bZrgHHAQaRkkOZGVGPYnUqpB1pJ5ajX9bFqZ
	I5/9AklBTYQHa9nRYnFa8CH4u7QNbb/clhfNdC89Cg5es1NUjxb7+87qD0f53/Z+MACCbU+qj6qUC
	1gsp5gHLtRWEz0I0wVAe8gT+pbCByj1zbQHaF3VDx7KwGO6zrsynffQuKhfGxECZSIM14xgHNehbr
	sBatvYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImnX-00BaM7-Au; Tue, 02 Aug 2022 07:58:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImnT-00BaIQ-I7; Tue, 02 Aug 2022 07:58:38 +0000
X-UUID: 3af41a0f71744959b92f27543b06801c-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:17489c81-9829-4cd3-895f-c6258b43725a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:181f0ed0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3af41a0f71744959b92f27543b06801c-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 777448322; Tue, 02 Aug 2022 00:58:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 15:57:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Aug 2022 15:57:49 +0800
Message-ID: <e51eb3017495fc77c52e7fde507acd33a2893f6f.camel@mediatek.com>
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
Date: Tue, 2 Aug 2022 15:57:49 +0800
In-Reply-To: <20220727045035.32225-6-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
	 <20220727045035.32225-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_005835_619174_6CF38EDE 
X-CRM114-Status: GOOD (  23.14  )
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
> +static int mtk_dp_train_tps_2_3(struct mtk_dp *mtk_dp, u8
> target_linkrate,
> +				u8 target_lane_count, u8 *lane_adjust,
> +				int *status_control, u8
> *prev_lane_adjust)
> +{
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	if (*status_control == 1) {
> +		if (mtk_dp->train_info.tps4) {
> +			mtk_dp_train_set_pattern(mtk_dp, 4);
> +			val = DP_TRAINING_PATTERN_4;
> +		} else if (mtk_dp->train_info.tps3) {
> +			mtk_dp_train_set_pattern(mtk_dp, 3);
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_3;
> +		} else {
> +			mtk_dp_train_set_pattern(mtk_dp, 2);
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_2;
> +		}

Only one of tps2, tps3, tps4 would be process, and the priority is tps4
> tps3 > tps2, so I would like use one variable for this.

if support tps4, train_info.tps = 4.
else if support tps3, train_info.tps = 3.
else train_info.tps = 2.

And this part would be almost the same as the part in
mtk_dp_train_tps_1(), so separate this part to a function.

Regards,
CK


> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET, val);
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> lane_adjust,
> +				 sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 2;
> +	}
> +
> +	drm_dp_link_train_channel_eq_delay(&mtk_dp->aux, mtk_dp-
> >rx_cap);
> +
> +	drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);
> +
> +	if (drm_dp_channel_eq_ok(link_status, target_lane_count)) {
> +		mtk_dp->train_info.eq_done = true;
> +		dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +		return 0;
> +	}
> +
> +	dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +
> +	if (*prev_lane_adjust != link_status[4])
> +		*prev_lane_adjust = link_status[4];
> +
> +	return -EAGAIN;
> +}
> +


