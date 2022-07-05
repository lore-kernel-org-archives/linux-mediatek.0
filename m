Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7836DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=376tIciAZbDSROn+he/3p2G24DRyxWTKjEw/g6nTML8=; b=yd2alYjK+JSJ23LKMC8IhIuOUy
	acIgVg85au/+8QMZVlTvLy7ORn5UxNJbEBmIz/EfYgyMuGDYxd9EnggSn0OafUgqYLbOAZ+sBqqrp
	ZwC0XWccSVZ2NrLhN6sMQwJPotWi7aMVsNPFLTuNfUkL/KJ/Q2Wdjet4N/CgO2n/Siv7sfP0ZuABn
	KQsORsX48KAg3p+f7xMpMqM7kxPdVBX7Rgm0db7xN8jhj8m5g4BujeVZanpq4WRr3E78RKCtnnCkx
	TR7nEVrc136qzSLjUtR+ilY9octIqy+rDjMNsRQNsp9aHDyRdKf33Uv2cDxXm5Zl+d5oGrB1kcsJs
	8aPUuRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fOA-00H3Lj-B4; Tue, 05 Jul 2022 10:02:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fO7-00H3Kd-Sw; Tue, 05 Jul 2022 10:02:37 +0000
X-UUID: b9c259318f07422483e456ce06b0552d-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:129e54d0-a29f-4640-abb6-9415e7a6fc68,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:7cae9786-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b9c259318f07422483e456ce06b0552d-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 531656748; Tue, 05 Jul 2022 03:02:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 17:51:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 17:51:55 +0800
Message-ID: <3cd66cc0adc84619150bc96416974bceb0b4e917.camel@mediatek.com>
Subject: Re: [PATCH v13 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"deller@gmx.de" <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, "LiangXu
 Xu =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?=" <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 17:51:54 +0800
In-Reply-To: <5971f465-9514-d830-8467-e722475ecc7f@collabora.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
	 <20220701062808.18596-7-rex-bc.chen@mediatek.com>
	 <5971f465-9514-d830-8467-e722475ecc7f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030235_995036_33D3B6D7 
X-CRM114-Status: GOOD (  23.35  )
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

On Fri, 2022-07-01 at 16:14 +0800, AngeloGioacchino Del Regno wrote:
> Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > This patch adds External DisplayPort support to the mt8195 eDP
> > driver.
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dp.c     | 197
> > +++++++++++++++++++++-----
> >   drivers/gpu/drm/mediatek/mtk_dp_reg.h |   1 +
> >   2 files changed, 161 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > index b672d5a6f5bd..c3be97dd055c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -105,6 +105,7 @@ struct mtk_dp {
> >   	struct regmap *regs;
> >   
> >   	bool enabled;
> > +	bool has_fec;
> 
> You're introducing this has_fec variable here....
> 
> >   
> >   	struct drm_connector *conn;
> >   };
> 
> 
> > @@ -1018,6 +1074,8 @@ static void
> > mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
> >   	mtk_dp->info.depth = DP_MSA_MISC_8_BPC;
> >   	memset(&mtk_dp->info.timings, 0, sizeof(struct
> > mtk_dp_timings));
> >   	mtk_dp->info.timings.frame_rate = 60;
> > +
> > +	mtk_dp->has_fec = false;
> 
> .... setting it as false here ....
> 
> >   }
> >   
> >   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
> > @@ -1498,15 +1562,38 @@ static int mtk_dp_init_port(struct mtk_dp
> > *mtk_dp)
> >   static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> >   {
> >   	struct mtk_dp *mtk_dp = dev;
> > +	int event;
> >   	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> >   
> > +	event = mtk_dp_plug_state(mtk_dp) ?
> > +		connector_status_connected :
> > connector_status_disconnected;
> > +
> > +	if (event < 0)
> > +		return IRQ_HANDLED;
> > +
> > +	dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
> 
> P.S.: This should be a dev_dbg().
> 
> > +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> > +
> >   	if (mtk_dp->train_info.cable_state_change) {
> >   		mtk_dp->train_info.cable_state_change = false;
> >   
> > -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > -				   DP_PWR_STATE_MASK);
> > -		drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> > +		if (!mtk_dp->train_info.cable_plugged_in) {
> > +			mtk_dp_video_mute(mtk_dp, true);
> > +
> > +			mtk_dp_initialize_priv_data(mtk_dp);
> > +			mtk_dp_set_idle_pattern(mtk_dp, true);
> > +			if (mtk_dp->has_fec)
> 
> ...and you're checking it here, but there's nothing ever setting that
> as true!
> 
> Is there anything you forgot? :-)
> 
> Cheers,
> Angelo

Hello Angelo,

Thanks for your review.
We do not support fec currently, so I will drop them.

Thanks!

BRs,
Bo-Chen


