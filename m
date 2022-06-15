Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B76C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaHrLeCcXA4MKrx/nOdikRD1p0jFZglYy5I+OtA3MFk=; b=pZvMaqCkc5/7Eb
	s19lk1ScTtPvZ98t+/dKQGlckIWEYdP90KXpH/JdylS2zV4rxZqKuy9t9+sXA+f2Y8NNjpBPG8xxV
	n7D4UbaEP7cggTUzjnqX5kTxY3DlZFPQ0Z8RmNJyb9J0kVMOF7yPsS4uZCJ+Qu2LvCuN2ZfVI5U2h
	v0ogCO1jHitjwukiwpKe8EL3HK95SFwOrCUqdRcEb7PGsQTCA2Qei+KJc93vQn1MW1GMFLtbfshxh
	T0zzkCWnHg5lWi9a3cywh8fzZEiBsKAmK3ZV/HyRTjf3y0P4cQv1dqV74TJknfaVMJ2iD9/1D27p9
	ItH1vLkbj/P0n3oZyCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1MtQ-00CweJ-Vh; Wed, 15 Jun 2022 06:52:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1MtF-00CwZm-UW; Wed, 15 Jun 2022 06:52:35 +0000
X-UUID: db72bd2acb9f45c99d409136a3a90d13-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d088c03b-4543-4cfc-a380-c89f3ed8c873,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c1db49f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: db72bd2acb9f45c99d409136a3a90d13-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1989722894; Tue, 14 Jun 2022 23:52:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 23:52:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 15 Jun 2022 14:52:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 14:52:25 +0800
Message-ID: <f8fbd1b522c3ecfbdacc290f028126045d9c0dc8.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Wed, 15 Jun 2022 14:52:25 +0800
In-Reply-To: <20220610105522.13449-6-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
	 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_235234_037431_822D4EE1 
X-CRM114-Status: GOOD (  24.39  )
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

Hi, Bo-Chen:

On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
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
> +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +	u8 lane_count;
> +	u8 link_rate;
> +	u8 train_limit;
> +	u8 max_link_rate;
> +
> +	link_rate = mtk_dp->rx_cap[1];
> +	lane_count = mtk_dp->rx_cap[2] & 0x1F;
> +
> +	mtk_dp->train_info.link_rate = min(mtk_dp->max_linkrate,
> link_rate);
> +	mtk_dp->train_info.lane_count = min(mtk_dp->max_lanes,
> lane_count);
> +	link_rate = mtk_dp->train_info.link_rate;
> +	lane_count = mtk_dp->train_info.lane_count;
> +
> +	switch (link_rate) {
> +	case MTK_DP_LINKRATE_RBR:
> +	case MTK_DP_LINKRATE_HBR:
> +	case MTK_DP_LINKRATE_HBR2:
> +	case MTK_DP_LINKRATE_HBR25:
> +	case MTK_DP_LINKRATE_HBR3:
> +		break;
> +	default:
> +		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
> +		break;
> +	};
> +
> +	max_link_rate = link_rate;
> +	for (train_limit = 6; train_limit > 0; train_limit--) {
> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +
> +		mtk_dp_train_change_mode(mtk_dp);
> +		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> +		if (ret)
> +			return ret;
> +
> +		if (!mtk_dp->train_info.cr_done) {

When mtk_dp_train_flow() return 0, it imply train_info.cr_done is true,
isn't it?

> +			switch (link_rate) {
> +			case MTK_DP_LINKRATE_RBR:
> +				lane_count = lane_count / 2;
> +				link_rate = max_link_rate;
> +				if (lane_count == 0)
> +					return -EIO;
> +				break;
> +			case MTK_DP_LINKRATE_HBR:
> +				link_rate = MTK_DP_LINKRATE_RBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR2:
> +				link_rate = MTK_DP_LINKRATE_HBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR3:
> +				link_rate = MTK_DP_LINKRATE_HBR2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			};
> +		} else if (!mtk_dp->train_info.eq_done) {

When mtk_dp_train_flow() return 0, it imply train_info.eq_done is true,
isn't it?

Regards,
CK

> +			if (lane_count == 0)
> +				return -EIO;
> +
> +			lane_count /= 2;
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	if (train_limit == 0)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
