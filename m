Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2BC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SC7RQBwuqymK+8QuF7K9C6fEEhG6tPCJrqS0OMWpn1M=; b=L3fhbpI0y4EHwr
	hQXD3g7XAZ1r5H8bAwT7cXvAN7OXDnLI+rC+KT2eXOu0xVVx2j39o7T9kPy180HH28OU+acRAh9Tx
	rAsoqkVkxA4dsKqXW9tfWyUnK8lKut0o7QyqIZ1mxncsz+jAAbKr7nPTuzV5UwrD5+CpukqTGl7MW
	/311WbGwIP613N40dNfV3uGA1OEqXSny8E6quet69tXbJz90C1k/NDGpwYbxvb813KUpJ7Cy1KOw2
	66qmJkj1r0I2SAcBJb5WSXgwfm1X/oTdnpObEzao7MrR5N8YWkgy9OZcfjzfpCvQr2z7nMMQV/BFM
	3iyrpQ1P58TQF6HjIipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYkL-007VWx-U6; Tue, 07 Jun 2022 12:55:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYk9-007VOu-Ta; Tue, 07 Jun 2022 12:55:35 +0000
X-UUID: 73454075e21c4b96a17b5504bc34c64f-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:a788222f-a01c-4fdb-a0b2-1d0e79125017,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:abf2f3e4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 73454075e21c4b96a17b5504bc34c64f-20220607
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 404733804; Tue, 07 Jun 2022 05:55:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 05:55:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 20:55:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 20:55:26 +0800
Message-ID: <6d7a38e4fe4cd1811c826888531144511407a06a.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun
 =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 20:55:25 +0800
In-Reply-To: <ff858934b622e6716dd48bf02d4d57f19358b805.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
	 <ff858934b622e6716dd48bf02d4d57f19358b805.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_055534_013322_FB2E66D4 
X-CRM114-Status: GOOD (  30.73  )
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

On Tue, 2022-06-07 at 16:12 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports the mt8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> > +{
> > +	int ret = 0;
> > +	u8 lane_count;
> > +	u8 link_rate;
> > +	u8 train_limit;
> > +	u8 max_link_rate;
> > +	u8 plug_wait;
> > +
> > +	for (plug_wait = 7; !mtk_dp_plug_state(mtk_dp) && plug_wait >
> > 0;
> > +	     --plug_wait)
> > +		/* Avoid short pulses on the HPD isr */
> > +		usleep_range(1000, 5000);
> > +	if (plug_wait == 0) {
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> 
> After return, mtk_dp->train_state would be set to
> MTK_DP_TRAIN_STATE_DPIDLE, so drop this.
> 

ok, I will do this.

> > +		return -ENODEV;
> > +	}
> > +
> > +	link_rate = mtk_dp->rx_cap[1];
> > +	lane_count = mtk_dp->rx_cap[2] & 0x1F;
> > +
> > +	mtk_dp->train_info.link_rate = min(mtk_dp->max_linkrate,
> > link_rate);
> > +	mtk_dp->train_info.lane_count = min(mtk_dp->max_lanes,
> > lane_count);
> > +	link_rate = mtk_dp->train_info.link_rate;
> > +	lane_count = mtk_dp->train_info.lane_count;
> > +
> > +	switch (link_rate) {
> > +	case MTK_DP_LINKRATE_RBR:
> > +	case MTK_DP_LINKRATE_HBR:
> > +	case MTK_DP_LINKRATE_HBR2:
> > +	case MTK_DP_LINKRATE_HBR25:
> > +	case MTK_DP_LINKRATE_HBR3:
> > +		break;
> > +	default:
> > +		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
> > +		break;
> > +	};
> > +
> > +	max_link_rate = link_rate;
> > +	for (train_limit = 6; train_limit > 0; train_limit--) {
> > +		mtk_dp->train_info.cr_done = false;
> > +		mtk_dp->train_info.eq_done = false;
> > +
> > +		mtk_dp_train_change_mode(mtk_dp);
> > +		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (!mtk_dp->train_info.cr_done) {
> > +			switch (link_rate) {
> > +			case MTK_DP_LINKRATE_RBR:
> > +				lane_count = lane_count / 2;
> > +				link_rate = max_link_rate;
> > +				if (lane_count == 0) {
> > +					mtk_dp->train_state =
> > +						MTK_DP_TRAIN_STATE_DPID
> > LE;
> 
> After return, mtk_dp->train_state would be set to
> MTK_DP_TRAIN_STATE_DPIDLE, so drop this.
> 
> Regards,
> CK
> 

ok.

> > +					return -EIO;
> > +				}
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR:
> > +				link_rate = MTK_DP_LINKRATE_RBR;
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR2:
> > +				link_rate = MTK_DP_LINKRATE_HBR;
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR3:
> > +				link_rate = MTK_DP_LINKRATE_HBR2;
> > +				break;
> > +			default:
> > +				return -EINVAL;
> > +			};
> > +		} else if (!mtk_dp->train_info.eq_done) {
> > +			if (lane_count == 0)
> > +				return -EIO;
> > +
> > +			lane_count /= 2;
> > +		} else {
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (train_limit == 0)
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> > +
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
