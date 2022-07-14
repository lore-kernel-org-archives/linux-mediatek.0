Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540E3CCA47B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da6e9VyN818WsYORU/fzIAaalDwbkeT9yh9NMy/+Ji8=; b=3qIhG8JofobnUYFKC36iwAViUo
	lkhHOYIGxQ/dmfYX5XIoNsPnVyG4cSvvFyObHqnrsge4e5EeRz0ZIQTMe5bz4YjuR0fTtqJotAX7t
	qsZo9tsbKp7Sv+gJ2PuLDtdB/CtSAbY/7YlUF8pkgwGh4NMZQ1Kf8JT/fXQcUN0D4nNxEAkwDSnLA
	28g+n7sonKOCU/aM67VkaM8M2fJCd39u6N63ZjRXoWO/4Dt+sQc7uQ9X/6z2j4CpWsPJsG3qJvXOu
	ijFPCAQt/Xi9zxakeO4+mpKoULVCFzey0AhtZ4adC81kd3j275XB9eNOKSannmqcRR1Hl+s459WBN
	xy9h1zOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwSK-00DVnf-53; Thu, 14 Jul 2022 10:52:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwSH-00DVmp-Ux; Thu, 14 Jul 2022 10:52:27 +0000
X-UUID: e80d8f7c2028405283b7a4c0dc76373d-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5e6712dd-e50d-4d6b-bbbf-ce85f1df3c82,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:362f7ed7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e80d8f7c2028405283b7a4c0dc76373d-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 273372687; Thu, 14 Jul 2022 03:52:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 18:21:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 18:21:42 +0800
Message-ID: <7c847b4177b9420b98bd6ecde473f149463e50b1.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "chunkuang.hu@kernel.org"
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
	<angelogioacchino.delregno@collabora.com>, LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Jul 2022 18:21:41 +0800
In-Reply-To: <b04f4a68e012157db43f8f7b0887d611f790a9c5.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
	 <8fad0421bb7a61ae5e2ecabfc93790f1e2f30b63.camel@mediatek.com>
	 <b04f4a68e012157db43f8f7b0887d611f790a9c5.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_035226_024563_6A548746 
X-CRM114-Status: GOOD (  28.49  )
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

On Thu, 2022-07-14 at 16:24 +0800, Rex-BC Chen wrote:
> On Wed, 2022-07-13 at 16:10 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
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
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > 
> > [snip]
> > 
> > > +
> > > +struct mtk_dp_timings {
> > > +	struct videomode vm;
> > > +};
> > > +
> > > +struct mtk_dp_irq_sta {
> > > +	bool hpd_inerrupt;
> > > +};
> > > +
> > > +struct mtk_dp_train_info {
> > > +	bool tps3;
> > > +	bool tps4;
> > > +	bool sink_ssc;
> > > +	bool cable_plugged_in;
> > > +	bool cable_state_change;
> > > +	bool cr_done;
> > > +	bool eq_done;
> > > +	/* link_rate is in multiple of 0.27Gbps */
> > > +	int link_rate;
> > > +	int lane_count;
> > > +	struct mtk_dp_irq_sta irq_sta;
> > 
> > There is only one member in struct mtk_dp_irq_sta, so drop struct
> > mtk_dp_irq_sta and use bool hpd_inerrupt directly here.
> > 
> 
> Hello CK,
> 
> ok, I will drop this.
> 
> > > +};
> > > +
> > > +struct mtk_dp_info {
> > > +	u32 depth;
> > > +	enum dp_pixelformat format;
> > > +	struct mtk_dp_timings timings;
> > 
> > There is only one member in struct mtk_dp_timings, so drop struct
> > mtk_dp_timings and use struct videomode vm directly here.
> > 
> 
> This structure will add more variable in following patch.
> whole struct is like,
> struct mtk_dp_timings {
> 	struct videomode vm;
> 	u8 frame_rate;
> 	u32 pix_rate_khz;
> };
> 
> I want to keep this.

I think we could just drop struct mtk_dp_timings and place these member
directly in struct mtk_dp_info.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> 
> > Regards,
> > CK
> > 
> > > +};
> > > +
> > 
> > 
> 
> 


