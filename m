Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C19C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 05:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtmKFDaWcRnigXfry8WB+DXNHJJDYXrl5VnkqjdnBXk=; b=xgM2/XvKJ7o5svoWp3JB+GX2Ws
	msZxm7+oxq+WP68Wdldu5yHixn1Uad7ocQ8VN62/I6auqtDEwZoJyJAv8dpGnWJckprIcGOfKi85X
	XK60t3tteMeZB9BTXKem4NCwQDvCojJBQ5tlxLkz607VJvwTNO9FckKWrY/fH62eNBazODMfI6xMi
	gcXQ/R2GXixRz5cfYOR0wt6oP1zTiCGfdQk1sdUor1o83liHRO0s339keKyRJzo75FtO/62UX9uBV
	rpNkLo/0MWkoZJr6N6ItuXjY+k6cFIT9mQEyedTUnUm1pbMpTp2WNriwiDEy+z2VyKJKw/6XfA+ga
	AtnZug2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o79Co-002xaF-RH; Fri, 01 Jul 2022 05:28:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o79Cm-002xZm-6O; Fri, 01 Jul 2022 05:28:37 +0000
X-UUID: 00dd80cb65714582a3422213e1baeec2-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:89b3051d-3c28-4611-9db0-1cb0e18ece6d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:2
X-CID-META: VersionHash:87442a2,CLOUDID:642d2163-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 00dd80cb65714582a3422213e1baeec2-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1845914335; Thu, 30 Jun 2022 22:28:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 13:17:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 13:17:58 +0800
Message-ID: <33f121fa1a97e9fa8fd3fc6e87f197b7965bd825.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Fri, 1 Jul 2022 13:17:58 +0800
In-Reply-To: <78d71a052d214e0c11cab5c2f4dee39c4f67c0bc.camel@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
	 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
	 <78d71a052d214e0c11cab5c2f4dee39c4f67c0bc.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_222836_271772_9B441D85 
X-CRM114-Status: GOOD (  26.68  )
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

On Wed, 2022-06-29 at 13:34 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-27 at 16:03 +0800, Bo-Chen Chen wrote:
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
> > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> > +{
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> > +			   0, SW_RST_B_PHYD);
> > +
> > +	/* Wait for power enable */
> > +	usleep_range(10, 200);
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> > +			   SW_RST_B_PHYD, SW_RST_B_PHYD);
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +			   DP_PWR_STATE_BANDGAP_TPLL,
> > DP_PWR_STATE_MASK);
> > +}
> > +
> > +static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
> > +{
> > +	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> > +
> > +	mtk_dp_write(mtk_dp, MTK_DP_0034,
> > +		     DA_CKM_CKTX0_EN_FORCE_EN |
> > +		     DA_CKM_BIAS_LPF_EN_FORCE_VAL |
> > +		     DA_CKM_BIAS_EN_FORCE_VAL |
> > +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
> > +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
> > +
> > +	/* Disable RX */
> > +	mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
> 
> MTK_DP_1040 is set to 0 in mtk_dp_power_disable(), but it is not set
> to
> other value in mtk_dp_power_enable(). Does any thing would be wrong
> when mtk_dp_power_disable() and mtk_dp_power_enable()?
> 
> Regards,
> CK
> 

Hello CK,

in mtk_dp_power_enable(),
after we reset the hw:
mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
		   SW_RST_B_PHYD, SW_RST_B_PHYD);
mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
		   DP_PWR_STATE_BANDGAP_TPLL,
		   DP_PWR_STATE_MASK);

the value will be set back to default value 0x7.
I will add "mtk_dp_write(mtk_dp, MTK_DP_1040, 7);" to prevent
misunderstanding.

BRs,
Bo-Chen

> > +	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> > +		     0x550 | BIT(FUSE_SEL_SHIFT) |
> > BIT(MEM_ISO_EN_SHIFT));
> > +}
> > +
> 
> 


