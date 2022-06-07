Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B0C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANf35e0pBi3spkEPgcGHzHemVgU/HS2s4x1Nm5ZHN3c=; b=hlaDn0ZDlQts0c
	RRWY4tiUpFgsQm/tJj7C5AgpawIqIJI3CytHslKc8AxCLguO+xRHBBcP7JJAUgMvUbWsT+muhZ6FG
	Fca0Zt6P6dJXSz8KhyqIJ6BJ8z2LyZVGqDh8oBeFQmO2wOnJb+7AGVXcUrJAv9Tk9fJReWmn05of2
	S0tBYDTXDGVIq12r2ZC/Fdx/UYLeVI8pBOKjIs6uQ/TxnlP1lbEkF9kuJ9G8bCXEeYNrEhmpeeHx9
	mqh761CAucuH39sWOuYZ/SKbLPMOLJWcCu1fEGEhXJXXvZ6TvR+vnHTbkp8A2Bwl/39gqE7AhNPZ7
	9Rn78uwoCLNh4tSBwe/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUAr-005gQG-N1; Tue, 07 Jun 2022 08:02:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyU9f-005fp4-A7; Tue, 07 Jun 2022 08:01:36 +0000
X-UUID: 9d161159d5d648d3ac3e5f51f75fbb8a-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:21da53bf-47a1-4e5c-9502-8851ca5c1c73,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:b049e9e4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 9d161159d5d648d3ac3e5f51f75fbb8a-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1741692076; Tue, 07 Jun 2022 01:01:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 01:01:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 16:01:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 16:01:25 +0800
Message-ID: <387fc4f9a65b87467fbff3878ad371bee4552e6e.camel@mediatek.com>
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
Date: Tue, 7 Jun 2022 16:01:25 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_010135_421309_750715D0 
X-CRM114-Status: GOOD (  21.11  )
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
> +static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
> +{
> +	switch (mtk_dp->state) {

Does mtk_dp->state has any relation with mtk_dp->train_state. If yes,
mix mtk_dp->state and mtk_dp->train_state into one state. If no, move
calling mtk_dp_state_handler() out of mtk_dp_train_handler().

Regards,
CK

> +	case MTK_DP_STATE_INITIAL:
> +		mtk_dp_video_mute(mtk_dp, true);
> +		mtk_dp->state = MTK_DP_STATE_IDLE;
> +		break;
> +
> +	case MTK_DP_STATE_IDLE:
> +		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +			mtk_dp->state = MTK_DP_STATE_PREPARE;
> +		break;
> +
> +	case MTK_DP_STATE_PREPARE:
> +		mtk_dp_video_config(mtk_dp);
> +		mtk_dp_video_enable(mtk_dp, true);
> +
> +		mtk_dp->state = MTK_DP_STATE_NORMAL;
> +		break;
> +
> +	case MTK_DP_STATE_NORMAL:
> +		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp->state = MTK_DP_STATE_IDLE;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
