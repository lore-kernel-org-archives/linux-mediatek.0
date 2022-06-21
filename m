Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC8C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YcQWDKXsFDaIQvqNSPk7Z5Z87/pcFg0Pmv2yyM9aeQ=; b=nDQHO40EtFmY9mctm8NyKFlH/a
	8lXFOnOElJ0YeUTLcehEOjHKOkawHE0LG5kbC5dP2ty2QpRSdUHUijpV/WUujjZES/8N6tsk5NL6G
	xA5k7buWmSdgq1tqkWV1c4rQSNZDgTD903t+SK9D2L4vnCBwuHjlPcMoj9U6ud5eVKdpQaYtJXBcx
	tFBFrkbbG/aD1YFdC5EN0j0LLFtSIeeIBYWLf5hrjQmRQTzprsTN1kwTqJeHanLo/x2oH7X0a7ooC
	F6+Ifi714u8hnejROIgTuVz05JLoUOmr4MjCZqOc11jM8RVBc8Kza6Tv/TftaB1C+sk5WQR6itEk/
	7ezquuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cvL-005KMB-IP; Tue, 21 Jun 2022 12:24:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cuv-005KCj-M7; Tue, 21 Jun 2022 12:23:39 +0000
X-UUID: 10e11379d9eb4e7fa2aa8b413ec87412-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:71fc89b4-7e13-44de-9aac-6d086efd2607,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:2fd9a62d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 10e11379d9eb4e7fa2aa8b413ec87412-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1323620826; Tue, 21 Jun 2022 05:23:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 05:21:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 20:21:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jun 2022 20:21:22 +0800
Message-ID: <b8becd032f60a0180fcf3e6fa1663add54c24c8c.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
	<deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 20:21:22 +0800
In-Reply-To: <017bb546af028e881ccd914fad5ac00030199199.camel@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
	 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
	 <7a0630c68f2754343521daf7b638a20b44e55624.camel@mediatek.com>
	 <017bb546af028e881ccd914fad5ac00030199199.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_052337_773066_8B3FA533 
X-CRM114-Status: GOOD (  30.10  )
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

On Mon, 2022-06-20 at 11:19 +0800, CK Hu wrote:
> On Mon, 2022-06-20 at 11:12 +0800, CK Hu wrote:
> > On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This patch adds a embedded displayport driver for the MediaTek
> > > mt8195
> > > SoC.
> > > 
> > > It supports the MT8195, the embedded DisplayPort units. It offers
> > > DisplayPort 1.4 with up to 4 lanes.
> > > 
> > > The driver creates a child device for the phy. The child device
> > > will
> > > never exist without the parent being active. As they are sharing
> > > a
> > > register range, the parent passes a regmap pointer to the child
> > > so
> > > that
> > > both can work with the same register range. The phy driver sets
> > > device
> > > data that is read by the parent to get the phy device that can be
> > > used
> > > to control the phy properties.
> > > 
> > > This driver is based on an initial version by
> > > Jitao shi <jitao.shi@mediatek.com>
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > 
> > [snip]
> > 
> > > +
> > > +static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
> > > +{
> > > +	u8 target_frame_rate = 60;
> > > +	u32 target_pixel_clk;
> > > +	struct drm_display_mode mode;
> > > +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
> > > +
> > > +	drm_display_mode_from_videomode(&timings->vm, &mode);
> > > +
> > > +	if (mtk_dp->info.timings.frame_rate > 0) {
> > > +		target_frame_rate = mtk_dp->info.timings.frame_rate;
> > > +		target_pixel_clk = mode.htotal * mode.vtotal *
> > > +				   target_frame_rate;
> > > +	} else if (mtk_dp->info.timings.pix_rate_khz > 0) {
> > > +		target_pixel_clk = mtk_dp->info.timings.pix_rate_khz *
> > > 1000;
> > > +	} else {
> > > +		target_pixel_clk = mode.htotal * mode.vtotal *
> > > +				   target_frame_rate;
> > > +	}
> > > +
> > > +	mtk_dp->info.timings.pix_rate_khz = target_pixel_clk / 1000;
> > 
> > It seems that pix_rate_khz is used only here and does not used in
> > another place, so pix_rate_khz is useless, remove it.
> 
> It seems that frame_rate is also redundant, so remove it.
> 
> Regards,
> CK
> 

I think we do use this variable in mtk_dp_parse_drm_mode_timings()
We use this variable to get target framerate.

BRs,
Bo-Chen

> > 
> > Regards,
> > CK
> > 
> > > +}
> > > +
> 
> 


