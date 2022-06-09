Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E67CCA47F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxZScI8ZNovwtraQU+2XDPME+11ntWpsSd85lp64ekA=; b=wcspFXqvz9fBOn
	oB94t2P55nCfsK1jotTc+M5EJ7qFofk3LTc8mKJq69ePclIaax9Hp2MZ9+yeXVTU8n2hhDqBbNwp7
	vrpMYtQQEYbkjPj+dgNvhWKzdnXyUDPCh9OKujb6exGVgurbZ+N/D8KcGTceoML/qVC5OEdEAL0ff
	3AWzOLxgzYOaJu/kM9yo0IPMYP/84T4LUei+QWJH/0CthkeMdRjAy7BhRcpeXkERLgqj2hb3CA7Pa
	K5aTqTRdapxvO3MpaBtuYoFzJy9yhIctD+zWo7/04eALJxI4lJzGPhv/bZ8jMQqROCk42OkR82PYB
	FJoYjByG4/kMW2pxBxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDIa-00091x-D8; Thu, 09 Jun 2022 08:13:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDIP-00090F-HK; Thu, 09 Jun 2022 08:13:39 +0000
X-UUID: 8a4f809055354ecfb0b7a2e4e088daee-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ba79fff0-a90b-4a4e-b689-0b0bd04863e6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:bc65c57e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8a4f809055354ecfb0b7a2e4e088daee-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 971183097; Thu, 09 Jun 2022 01:13:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 01:03:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Jun 2022 16:03:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 9 Jun 2022 16:03:31 +0800
Message-ID: <49162f7d313478f13472eb0f3b07ffa2a47cbeba.camel@mediatek.com>
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
Date: Thu, 9 Jun 2022 16:03:30 +0800
In-Reply-To: <651e6b993562d53c893d0325d33fa137e98ab596.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
	 <651e6b993562d53c893d0325d33fa137e98ab596.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_011337_609908_44550AF3 
X-CRM114-Status: GOOD (  27.62  )
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

On Wed, 2022-06-08 at 16:30 +0800, CK Hu wrote:
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
> > +static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> > +{
> > +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> > +	u8 val;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +
> > +	if (!mtk_dp_plug_state(mtk_dp))
> > +		return false;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > +	/* Wait for power on */
> > +	usleep_range(2000, 5000);
> > +
> > +	drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> > +
> > +	memcpy(mtk_dp->rx_cap, buf, min(sizeof(mtk_dp->rx_cap),
> > sizeof(buf)));
> 
> sizeof(mtk_dp->rx_cap) is identical to sizeof(buf), so
> 
> drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> 
> 

Hello CK,

I will drop buf[].

> > +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> > DP_TRAINING_AUX_RD_MASK;
> > +
> > +	train_info->link_rate =
> > +		min_t(int, mtk_dp->max_linkrate, buf[mtk_dp-
> > > max_linkrate]);
> > 
> > +	train_info->lane_count =
> > +		min_t(int, mtk_dp->max_lanes,
> > drm_dp_max_lane_count(buf));
> > +
> > +	train_info->tps3 = drm_dp_tps3_supported(buf);
> > +	train_info->tps4 = drm_dp_tps4_supported(buf);
> > +
> > +	train_info->sink_ssc =
> > +		!!(buf[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
> > +
> > +	train_info->sink_ssc = false;
> 
> What does these two statement do?
> 

ssc = Spread spectrum clock.
it's for both edp and dp.

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +
> > +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> > +	if (val & DP_MST_CAP) {
> > +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> > +		drm_dp_dpcd_readb(&mtk_dp->aux,
> > +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> > &val);
> > +		if (val)
> > +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> > +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> > _ESI0,
> > +					   val);
> > +	}
> > +
> > +	return true;
> > +}
> > +
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
