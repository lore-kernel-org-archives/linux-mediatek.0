Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420E8C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9AiiLm1Q6lviLJO0BEL6W5VC9coNG8EiehRaQyqaXbg=; b=CotuA0Mz+dFClB
	pHpAGh8yMd8eXCSrGQE1yhUI0CK/cTJXc/otoaGs63zEesPt3qRH4E7uD74e+WXRI538wjp5poISA
	+cautM75I6QLpYrQD0uPUcuZkWe+1yZQSPR+TN2dVyIJF9HlDWdTAAacA2BOOkN+OBYGEuc14MlNj
	s1sa0CwMpEEbS4DWzsvsI7m1Gx/ek9WTYAsKxDF7T/z27w5lkQfnVMYb9oyXiX1OqzXHSoDHD90Gh
	bBEGN63s3MzhJhlgb7fSP1XDrZDmxUainwXnhzwx3rmHhOjxuot9WtL28FkbxPSFj2n6QdXM916O4
	E2lHhhqRTGQDZ8YDztXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrWl-00CA87-7f; Wed, 08 Jun 2022 08:58:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrJw-00C4S5-F2; Wed, 08 Jun 2022 08:45:47 +0000
X-UUID: 761d2fb1865d4f918cc55999dcc8e295-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:f4f1ff91-984c-41b2-af86-1493d6a0dec2,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:7401a07e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 761d2fb1865d4f918cc55999dcc8e295-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 42834503; Wed, 08 Jun 2022 01:45:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:43:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 16:43:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 16:43:31 +0800
Message-ID: <6aa6e07728f67c86a6c50f32e3cb461012b60409.camel@mediatek.com>
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
Date: Wed, 8 Jun 2022 16:43:31 +0800
In-Reply-To: <358331497a5ff431d46bfea9c5c9dcadfaaa9a63.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
	 <0bd8b0c66b9e2a1b63280e7eab63048bee7fe786.camel@mediatek.com>
	 <8af7938ae9244e4b7caf62e0c6ce0bcdddc13889.camel@mediatek.com>
	 <358331497a5ff431d46bfea9c5c9dcadfaaa9a63.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_014544_618766_D35E5DBF 
X-CRM114-Status: GOOD (  50.51  )
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

On Wed, 2022-06-08 at 10:23 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Tue, 2022-06-07 at 20:24 +0800, Rex-BC Chen wrote:
> > On Tue, 2022-06-07 at 14:21 +0800, CK Hu wrote:
> > > Hi, Rex:
> > > 
> > > On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > 
> > > > This patch adds a DisplayPort driver for the Mediatek mt8195
> > > > SoC.
> > > > 
> > > > It supports the mt8195, the embedded DisplayPort units. It
> > > > offers
> > > > DisplayPort 1.4 with up to 4 lanes.
> > > > 
> > > > The driver creates a child device for the phy. The child device
> > > > will
> > > > never exist without the parent being active. As they are
> > > > sharing
> > > > a
> > > > register range, the parent passes a regmap pointer to the child
> > > > so
> > > > that
> > > > both can work with the same register range. The phy driver sets
> > > > device
> > > > data that is read by the parent to get the phy device that can
> > > > be
> > > > used
> > > > to control the phy properties.
> > > > 
> > > > This driver is based on an initial version by
> > > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > > 
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +
> > > > +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> > > > +{
> > > > +	struct mtk_dp *mtk_dp = dev;
> > > > +	int event;
> > > > +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> > > > +
> > > > +	event = mtk_dp_plug_state(mtk_dp) ?
> > > > connector_status_connected
> > > > :
> > > > +						  connector_sta
> > > > tus_disc
> > > > onnected;
> > > > +
> > > > +	if (event < 0)
> > > 
> > > event is always > 0, isn't it?
> > > 
> > 
> > Hello CK,
> > 
> > ok, I will move this to dp patch.
> > 
> > > > +		return IRQ_HANDLED;
> > > > +
> > > > +	if (mtk_dp->drm_dev) {
> > > > +		dev_info(mtk_dp->dev,
> > > > "drm_helper_hpd_irq_event\n");
> > > > +		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> > > 
> > > I think this ISR would come once. If bridge has not attached, the
> > > drm
> > > core would lost this event. Maybe you should enable eDP hardware
> > > after
> > > bridge attached or send this event when attached.
> > > 
> > 
> > for edp patch, I will move it to (mtk_dp_bridge_attach).
> > for dp patch, I will add it back.
> 
> I find out that mtk_dp_poweron() is in top of mtk_dp_bridge_attach().
> If move mtk_dp_poweron() to bottom of mtk_dp_bridge_attach(), mtk_dp-
> > drm_dev would not be NULL here. So we could drop this checking.
> > 

Hello CK,

If we failed to setup phy(ret!=0), we alos need to deattach this
bridge.
I don't think  it's a good idea just for remove this.

> > > > +	}
> > > > +
> > > > +	if (mtk_dp->train_info.cable_state_change) {
> > > 
> > > Executing this thread imply cable_state_change = true, so drop
> > > cable_state_change.
> > > 
> > 
> > In mtk_dp_hpd_isr_handler(), there is another irq
> > "MTK_DP_HPD_INTERRUPT" which means the sink devices give a
> > interrupt
> > to
> > source device. it's not about connected status, so I think we still
> > need this.
> 
> In bottom of mtk_dp_hpd_isr_handler(), the code is:
> 
> +	train_info->cable_state_change = true;
> +
> +	return IRQ_WAKE_THREAD;
> 
> This thread is called only when return IRQ_WAKE_THREAD, and before
> return IRQ_WAKE_THREAD, train_info->cable_state_change is always set
> to
> true. So in this thread, train_info->cable_state_change must be true.
> 

As mentioned, this irq handler function is not only for connected
status.

this could be return if this irq is interrupt from sink device.
+	if (!(train_info->irq_status &
+	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
+		return IRQ_HANDLED;

BRs,
Bo-Chen
> Regards,
> CK
> 
> > 
> > > > +		mtk_dp->train_info.cable_state_change = false;
> > > > +
> > > > +		mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_STARTUP;
> > > > +
> > > > +		if (!mtk_dp->train_info.cable_plugged_in ||
> > > > +		    !mtk_dp_plug_state(mtk_dp)) {
> > > 
> > > I do not like two variable to present one thing. If
> > > 
> > > mtk_dp->train_info.cable_plugged_in = false
> > > and
> > > mtk_dp_plug_state(mtk_dp) = ture
> > > 
> > > What does this mean? I think this mean 'now' is connected because
> > > cable_plugged_in is old information and mtk_dp_plug_state() is
> > > current
> > > information.
> > > 
> > > But I would like to keep cable_plugged_in and drop
> > > mtk_dp_plug_state()
> > > because cable_plugged_in would be changed in isr and it would be
> > > the
> > > same as mtk_dp_plug_state().
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > ok, I will drop this.
> > 
> > BRs,
> > Rex
> > 
> > > > +			mtk_dp_video_mute(mtk_dp, true);
> > > > +
> > > > +			mtk_dp_initialize_priv_data(mtk_dp);
> > > > +			mtk_dp_set_idle_pattern(mtk_dp, true);
> > > > +			if (mtk_dp->has_fec)
> > > > +				mtk_dp_fec_enable(mtk_dp,
> > > > false);
> > > > +
> > > > +			mtk_dp_update_bits(mtk_dp,
> > > > MTK_DP_TOP_PWR_STATE,
> > > > +					   DP_PWR_STATE_BANDGAP
> > > > _TPLL,
> > > > +					   DP_PWR_STATE_MASK);
> > > > +		} else {
> > > > +			mtk_dp_update_bits(mtk_dp,
> > > > MTK_DP_TOP_PWR_STATE,
> > > > +					   DP_PWR_STATE_BANDGAP
> > > > _TPLL_LA
> > > > NE,
> > > > +					   DP_PWR_STATE_MASK);
> > > > +			drm_dp_read_dpcd_caps(&mtk_dp->aux,
> > > > buf);
> > > > +			mtk_dp->train_info.link_rate =
> > > > +				min_t(int, mtk_dp-
> > > > >max_linkrate,
> > > > +				      buf[mtk_dp-
> > > > >max_linkrate]);
> > > > +			mtk_dp->train_info.lane_count =
> > > > +				min_t(int, mtk_dp->max_lanes,
> > > > +				      drm_dp_max_lane_count(buf
> > > > ));
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (mtk_dp->train_info.irq_status &
> > > > MTK_DP_HPD_INTERRUPT) {
> > > > +		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
> > > > +		mtk_dp->train_info.irq_status &=
> > > > ~MTK_DP_HPD_INTERRUPT;
> > > > +		mtk_dp_hpd_sink_event(mtk_dp);
> > > > +	}
> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > > +
> > > 
> > > 
> > 
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
