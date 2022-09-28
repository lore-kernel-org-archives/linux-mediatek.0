Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49939C07E9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoVsh+lBpo2kny9dOeVB7K/RKMo8E8eyudzqFaV/N2w=; b=zXAnQkapkSdWJlrWoFn5Kz6TPk
	qv/SfK2HcFd3g/v4VPatmVnryKpANTTE06YtdT1yP7/zhCJtELKJuhu4mnZrrNxhUy5iquZqPlB1a
	PqnBeVq5MkZ3+jWASN7Smupm5LZlr0kVYvu4bzVUx95X/VOwb0yXXCQWMODDMZesFoFazmOxNXouI
	vCVimTwmg1ocvyiE8w5NTS9dW1KX2U/ZImQc1ZGscsiUauTV6xAl0DMJOJioYEXJBzHWBVgNq3bSc
	epw+BnkzR/71sJMElyuxQbjaZsF4phzaYa+hp0gz+xZaebAC7rSwIbhBRvInJhVRmuXVHpJIio0Aw
	RdszkeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odNKk-00Dk60-Rb; Wed, 28 Sep 2022 03:02:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odNKg-00Dk4p-9s; Wed, 28 Sep 2022 03:02:00 +0000
X-UUID: 89ed70a15a244d258deb03389e8caadd-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zoVsh+lBpo2kny9dOeVB7K/RKMo8E8eyudzqFaV/N2w=;
	b=HMLzuwVhQUv9fun+rv1k2zOt8bo+rAt3MGJQgaJsh3/LQWZY5q4MYAQK9Tb8kPs2uO7MGhsc4Ng0MfdA2/DS21g/8mypnT4pbxo7kRU9Xp2Mr90rD6eSXDhvBt0I82rYylp75lxcHcUf7JT7jb5wF4iFjbgHtS2aej+iB4jFjXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e473bbbb-22b4-4e46-8b65-645315797a49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:da924da3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 89ed70a15a244d258deb03389e8caadd-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2024121658; Tue, 27 Sep 2022 20:01:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 10:41:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 10:40:59 +0800
Message-ID: <da5c39fb351a7ca5a9dfa1c938d2e3d914ecb0d2.camel@mediatek.com>
Subject: Re: [PATCH v1 14/17] phy: mediatek: add support for
 phy-mtk-hdmi-mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring
	<robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter
	<daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao shi
	<jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
CC: <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	Pablo Sun <pablo.sun@mediatek.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mattijs Korpershoek
	<mkorpershoek@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Wed, 28 Sep 2022 10:40:59 +0800
In-Reply-To: <CABnWg9v4OuAU0x7n1q09gO7u3faOsmeq_4PFpw=_wAn1+erF8A@mail.gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
	 <20220919-v1-14-4844816c9808@baylibre.com>
	 <d1346dcf6b6906d153c13c086bf963dc89c5549b.camel@mediatek.com>
	 <CABnWg9v4OuAU0x7n1q09gO7u3faOsmeq_4PFpw=_wAn1+erF8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_200158_366130_7C9B2F8F 
X-CRM114-Status: GOOD (  22.87  )
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

On Tue, 2022-09-27 at 06:23 -0700, Guillaume Ranquet wrote:
> On Tue, 20 Sep 2022 09:46, Chunfeng Yun <chunfeng.yun@mediatek.com>
> wrote:
> > On Mon, 2022-09-19 at 18:56 +0200, Guillaume Ranquet wrote:
> > > Add basic support for the mediatek hdmi phy on MT8195 SoC
> > > 
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> > > b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> > > index bb7593ea4c86..0157acdce56c 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> > > @@ -1344,6 +1344,8 @@ static void mtk_hdmi_bridge_disable(struct
> > > drm_bridge *bridge,
> > >  	mtk_hdmi_disable_hdcp_encrypt(hdmi);
> > >  	usleep_range(50000, 50050);
> > > 
> > > +	phy_power_off(hdmi->phy);
> > > +
> > >  	hdmi->enabled = false;
> > >  }
> > > 
> > > diff --git a/drivers/phy/mediatek/Makefile
> > > b/drivers/phy/mediatek/Makefile
> > > index fb1f8edaffa7..c9a50395533e 100644
> > > --- a/drivers/phy/mediatek/Makefile
> > > +++ b/drivers/phy/mediatek/Makefile
> > > @@ -12,6 +12,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-
> > > mtk-
> > > xsphy.o
> > >  phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
> > >  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
> > > mt2701.o
> > >  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
> > > mt8173.o
> > > +phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
> > > mt8195.o
> > >  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
> > > 
> > >  phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> > > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > > b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > > new file mode 100644
> > > index 000000000000..149015b64c02
> > > --- /dev/null
> > > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > > @@ -0,0 +1,673 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Copyright (c) 2021 BayLibre, SAS
> > > + */
> > > +#include <linux/delay.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/phy/phy.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/types.h>
> > > +#include <linux/nvmem-consumer.h>
> > > +
> > > +#include "phy-mtk-hdmi.h"
> > > +#include "phy-mtk-hdmi-mt8195.h"
> > > +
> > > +static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
> > > +{
> > > +	/* make data fifo writable for hdmi2.0 */
> > > +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_ANA_CTL,
> > > REG_ANA_HDMI20_FIFO_EN,
> > > +			  REG_ANA_HDMI20_FIFO_EN);
> > > +}
> > > +
> > > +static void
> > > +mtk_mt8195_phy_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy
> > > *hdmi_phy,
> > > +				       bool enable)
> > > +{
> > > +	mtk_hdmi_ana_fifo_en(hdmi_phy);
> > > +
> > > +	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
> > > +	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
> > > +	 */
> > > +	if (enable)
> > > +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG,
> > > +				  0x2 << REG_TXC_DIV_SHIFT,
> > 
> > Use FIELD_PREP() macro, then no need define REG_TXC_DIV_SHIFT
> > anymore.
> > 
> 
> Didn't know about FIELD_* macros, will use them for V2.
> 
> Thx for the suggestion.
Please use helpers defined in phy-mtk-io.h, the register access helpers
of mtk_hdmi_phy_* are already removed in phy next branch.

Thanks a lot



