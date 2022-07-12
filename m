Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0348C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8dBp5IkZBtCwAuvDQ/uk5OujzdKUzu0kM3xTx3mv6k=; b=12oxS4z6faM9y2q52auoTEKGOo
	pwgI88X01Bb5yoxJMA1guyl+tCuzFBxESAo74fGusfz3G0GyS/l5hS7XU2mi0HyGb43ahKxX/ZFiS
	+D7ev7XDRdWKqEHyJVHZtY+leZRCB29AgZYi04GDKpyi/Ee0TXgdJW1wmhGiAnbUAjypwmMlBDSoe
	NRH45stY5xweTBffKYjLvVLaeN5AUCm7kvQxrzn7Le0wODzIdC4JPRyuXFDwZMzyHwU0fi581GHm2
	ZJdsrJpx82EHKyNLGFqWbWcD/9V9dKoUb/sJjY/nyvHkf6gIibegMXZiaUzGUQIJ1G2AiM7hG90CS
	QkDj3OgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBbb-008vhu-AR; Tue, 12 Jul 2022 08:50:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBbY-008vek-F3; Tue, 12 Jul 2022 08:50:53 +0000
X-UUID: ead7fb42837443dca5321ec5bb49a3ff-20220712
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:347d61d0-c58e-4c36-93b1-069626073592,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:6be841d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ead7fb42837443dca5321ec5bb49a3ff-20220712
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1260756297; Tue, 12 Jul 2022 01:50:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 12 Jul 2022 16:10:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 16:10:07 +0800
Message-ID: <aa0b332468145634d6a9ef538da5c3eb26033de3.camel@mediatek.com>
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
	<granquet@baylibre.com>, "Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=" <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?=" <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Jul 2022 16:10:07 +0800
In-Reply-To: <fde545ed10e3baa1a375eead29dd2d12d95b7cb2.camel@mediatek.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
	 <20220701062808.18596-6-rex-bc.chen@mediatek.com>
	 <fde545ed10e3baa1a375eead29dd2d12d95b7cb2.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_015052_521328_F30F6061 
X-CRM114-Status: GOOD (  26.26  )
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

On Thu, 2022-07-07 at 10:21 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-07-01 at 14:28 +0800, Bo-Chen Chen wrote:
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
> 
> clk-mt8195-vdo0 driver [1] is part of mtk-mmsys driver [2] and it is
> still separated out to ccf driver. In addition, you does not manage
> the
> parent clock. If the parent clock is not enable, these leaf clock
> would
> not work.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/mediatek/clk-mt8195-vdo0.c?h=v5.19-rc5#n138
> 
> [2] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/mediatek/mtk-mmsys.c?h=v5.19-rc5#n140
> 
> Regards,
> CK
> 

Hello CK,

MTK_DP_0034 is just a enable control for dp hardware, so I think we
don't need to move it to ccf driver. it's not related to ccf.

After checking with Jitao, we only need to update
DA_CKM_CKTX0_EN_FORCE_E. I will set this bit as 1 in
mtk_dp_power_disable and 0 in mtk_dp_power_enable

BRs,
Bo-Chen

> > +
> > +	/* Disable RX */
> > +	mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
> > +	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> > +		     0x550 | BIT(FUSE_SEL_SHIFT) |
> > BIT(MEM_ISO_EN_SHIFT));
> > +}
> > +
> 
> 


