Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A1CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUKpCvbxH1tdNjd9NMQN16s+I1HZ5rmHDxkJRUFuPLs=; b=tPSYtEfUo+JF7jeOrlchyhYMO5
	lITIvSFVeNrYpaO9CeP1HxTeR0Fm361AUuhobFQx4kqo5m4qP0uE9F3jIEOV/+ZNuSHkibtJi1bgY
	jfEnqy2imaGjZxpZ7E8skIUXvsEVhvXQYro+Ww+3kHRPSyxK/qwkMP4IuGzGtksD11TlfFJLMmcrO
	7osWGogaIXVfAc3xkyuAg8NRlj32hDvibE3pX6m0tVoN9LoJAkjtNR54iI3NUMkIqx5/51gNIcKoe
	u8OomdsaLoZj3hLp7b4nmD+FEoToX+XLbKMPWrQTKMqYeDAAQjbjBL7iwP3hkpZg6fvLTUyfcbLJD
	NyLej2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuay-00CWqf-AU; Thu, 14 Jul 2022 08:53:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuav-00CWlW-LU; Thu, 14 Jul 2022 08:53:15 +0000
X-UUID: 4809b8d73ffc4ec89bd4619e61c1b185-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e21909dd-687e-43dd-878d-8c3753ec5f7a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:8a194964-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4809b8d73ffc4ec89bd4619e61c1b185-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1101606908; Thu, 14 Jul 2022 01:52:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 16:52:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 16:52:30 +0800
Message-ID: <a8cf1b4465bb0599d0688ace020d896c1ce54b24.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Thu, 14 Jul 2022 16:52:29 +0800
In-Reply-To: <9eceb5412bfed5f408153fe05bc2f8a4e3570b77.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
	 <9eceb5412bfed5f408153fe05bc2f8a4e3570b77.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_015313_720250_60038FB5 
X-CRM114-Status: GOOD (  26.65  )
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

On Wed, 2022-07-13 at 17:31 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
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
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32
> > offset, u8 *buf,
> > +				    size_t length)
> 
> The offset would always be MTK_DP_AUX_P0_3708, so drop offset and use
> MTK_DP_AUX_P0_3708 directly.
> 

Hello CK,

I don't think it's a good idea. this function is a fucntion of writing
registers. I want to keep the offset variable.

> > +{
> > +	int i;
> > +	int num_regs = (length + 1) / 2;
> > +
> > +	/* 2 bytes per register */
> > +	for (i = 0; i < num_regs; i++) {
> > +		u32 val = buf[i * 2] |
> > +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 :
> > 0);
> > +
> > +		if (mtk_dp_write(mtk_dp, offset + i * 4, val))
> > +			return;
> > +	}
> 
> for (i = 0; i < length; i += 2) {
> 	val = buf[i] | (i + 1 < length ? buf[i + 1] << 8 : 0);
> 	if (mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3708 + i * 2, val))
> 		return;
> }
> 

ok.

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +}
> > +
> 
> 


