Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BAEC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZRqpBw46LBHo9bcrjCO2WwcV1hNJwDBveSTrupTf3o=; b=f8Tt/8cJkpMswO
	h0PwYvB5UH4j+YC/uzW1K/nxZhqw25YOCJ+8rbKruE3VmIW+O9XfkzV4aZgonDjYMax6ww+Icaaft
	Y/XD9q7I/dTmOFV0eyKoLk+xMletXP4HGOH89fzv3JuE8FgsiF3hxmyGDD88XH9huoBjQ83mo0gRB
	2fdBGohJSKECaZKH2G7l3/pmyo0LHUf8nULkhy+Naw9meE9b/WX8ZwZbFp/nicCF4wZgDJR5E9fUC
	6c4QMoJvBYuX5GpYcIiThfBoD2jMtqdC+qNqNBJB4dfQuOARYoEkuTteO2pt/1mZl75ytQQ2BcIFZ
	mJc9eJkUJRfCZo2pT1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySyH-0058ml-95; Tue, 07 Jun 2022 06:45:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySxE-0058EQ-7T; Tue, 07 Jun 2022 06:44:43 +0000
X-UUID: 217ad874c463465faf447f1c62ccdc1f-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:56ad6212-97e7-4b55-bde6-7868df165c00,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:7ed5e5e4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 217ad874c463465faf447f1c62ccdc1f-20220606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 261825984; Mon, 06 Jun 2022 23:44:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 23:44:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 14:44:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 14:44:32 +0800
Message-ID: <b8aef76cef2fa434401b6a016de291eb24198faa.camel@mediatek.com>
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
Date: Tue, 7 Jun 2022 14:44:32 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_234440_346299_AFFEAF19 
X-CRM114-Status: GOOD (  28.32  )
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
> +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	bool training_done = false;
> +	short max_retry = 50;
> +	int ret = 0;
> +
> +	do {
> +		switch (mtk_dp->train_state) {
> +		case MTK_DP_TRAIN_STATE_STARTUP:

mtk_dp->train_state is initialized as MTK_DP_TRAIN_STATE_STARTUP even
though HPD ISR does not exist. Does this mean HPD ISR is redundant? If
HPD ISR is not redundant, create a new state MTK_DP_TRAIN_STATE_NONE
for init state.

> +			mtk_dp_state_handler(mtk_dp);
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKCAP;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKCAP:
> +			if (mtk_dp_parse_capabilities(mtk_dp)) {
> +				mtk_dp->train_info.check_cap_count = 0;
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKEDID;
> +			} else {
> +				mtk_dp->train_info.check_cap_count++;
> +
> +				if (mtk_dp->train_info.check_cap_count
> >
> +				    MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT
> ) {
> +					mtk_dp-
> >train_info.check_cap_count = 0;
> +					mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
> +					ret = -ETIMEDOUT;
> +				}
> +			}
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKEDID:
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_TRAINING_PRE;

MTK_DP_TRAIN_STATE_CHECKEDID is a redundant state, drop it.

> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> +			mtk_dp_state_handler(mtk_dp);
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_TRAINING;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING:
> +			ret = mtk_dp_train_start(mtk_dp);
> +			if (ret == 0) {
> +				mtk_dp_video_mute(mtk_dp, true);
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_NORMAL;
> +				mtk_dp_fec_enable(mtk_dp, mtk_dp-
> >has_fec);
> +			} else if (ret != -EAGAIN) {
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
> +			}
> +			break;
> +		case MTK_DP_TRAIN_STATE_NORMAL:
> +			mtk_dp_state_handler(mtk_dp);
> +			training_done = true;
> +			break;
> +		case MTK_DP_TRAIN_STATE_DPIDLE:

When would this case happen?

Regards,
CK

> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (ret) {
> +			if (ret == -EAGAIN)
> +				continue;
> +			/*
> +			 * If we get any other error number, it doesn't
> +			 * make any sense to keep iterating.
> +			 */
> +			break;
> +		}
> +	} while (!training_done || --max_retry);
> +
> +	return ret;
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
