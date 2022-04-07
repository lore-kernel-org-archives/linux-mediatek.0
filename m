Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C05FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8fbBu5NHWOBMv14J5wT/c6+Ar+ILDSA+MRdjvZUV8k=; b=OiNW8Jb7H+LOeV
	YgcSh+Ua4Oobj/t2ZBYdvuhckjO5LN0D7xCUmini1x17pXtum+pcCfkzvIx5T7cgWiBPMsyOrYbWG
	j5cGNHyiU/BdbbmiP4ZMweqdzqB7QGsFjf9FNHFI/3yEa1tooPENweKIdFGuNOGJJ0HPe0Rvy8uPO
	sz9tKXjvH3pM+cQcltU7GdxeeGJ6Atf97bhee/PIdPtUg6xKV8PdmzkyKoyspVBgbXXoxodHhO7lF
	HIo0DAJcFeFG8OjOWTUsRPOFFN2RiDbsLrqeKDYggv8SP+1uAZA4//cesz12dBOSy0AV8BoweJU7o
	F0h4FCE9LIQrRWIGtinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLhn-009hBB-KT; Thu, 07 Apr 2022 06:33:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLhc-009h8N-AU; Thu, 07 Apr 2022 06:33:10 +0000
X-UUID: 6d581cfb92c644d9b0cbe07e5a731fe8-20220406
X-UUID: 6d581cfb92c644d9b0cbe07e5a731fe8-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1452814759; Wed, 06 Apr 2022 23:33:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 23:27:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Apr 2022 14:27:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 14:27:14 +0800
Message-ID: <d8711b8e4d233240eda73db54a625e88b9b3970b.camel@mediatek.com>
Subject: Re: [RESEND v17 3/7] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: David Airlie <airlied@linux.ie>, <singo.chang@mediatek.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <postmaster@vger.kernel.org>, "Fabien
 Parent" <fparent@baylibre.com>, John 'Warthog9' Hawley
 <warthog9@eaglescrag.net>, <linux-stm32@st-md-mailman.stormreply.com>,
 <roy-cw.yeh@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, <nancy.lin@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <moudy.ho@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 7 Apr 2022 14:27:14 +0800
In-Reply-To: <67b3e42d6a094108f724ed9b8c73f5cd6b2ce219.camel@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
 <67b3e42d6a094108f724ed9b8c73f5cd6b2ce219.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_233308_398068_69321B4B 
X-CRM114-Status: GOOD (  35.15  )
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

Hi CK,

Thanks for the reviews.

On Thu, 2022-04-07 at 13:45 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> > 1. Add mt8195 mmsys compatible for vdosys0.
> > 2. Add mt8195 routing table settings and fix build fail.
> > 3. Add clock name, clock driver name and routing table into the
> > driver data
> >    of mt8195 vdosys0.
> > 4. Add get match data by clock name function and clock platform
> > labels
> >    to identify which mmsys node is corresponding to vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
> >  drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
> >  drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
> >  drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
> >  drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
> >  drivers/soc/mediatek/mt8195-mmsys.h         | 370
> > ++++++++++++++++++++
> >  drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
> >  drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
> >  drivers/soc/mediatek/mtk-mmsys.h            |   1 +
> >  drivers/soc/mediatek/mtk-mutex.c            |   8 +-
> >  include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
> >  12 files changed, 461 insertions(+), 17 deletions(-)
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> 
> [snip]
> 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 4fc4c2c9ea20..b2fa239c5f5f 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -4,6 +4,8 @@
> >   * Author: James Liao <jamesjj.liao@mediatek.com>
> >   */
> >  
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> > @@ -17,6 +19,7 @@
> >  #include "mt8183-mmsys.h"
> >  #include "mt8186-mmsys.h"
> >  #include "mt8192-mmsys.h"
> > +#include "mt8195-mmsys.h"
> >  #include "mt8365-mmsys.h"
> >  
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > =
> > {
> > @@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data
> > mt8192_mmsys_driver_data = {
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data
> > = {
> > +	.clk_name = "cfg_vdo0",
> > +	.clk_driver = "clk-mt8195-vdo0",
> > +	.routes = mmsys_mt8195_routing_table,
> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data
> > =
> > {
> >  	.clk_driver = "clk-mt8365-mm",
> >  	.routes = mt8365_mmsys_routing_table,
> >  	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
> >  };
> >  
> > +static const struct of_device_id mtk_clk_platform_labels[] = {
> > +	{ .compatible = "mediatek,mt8195-mmsys",
> > +	  .data = (void *)"clk-mt8195"},
> > +};
> > +
> >  struct mtk_mmsys {
> >  	void __iomem *regs;
> >  	const struct mtk_mmsys_driver_data *data;
> > @@ -85,6 +100,45 @@ struct mtk_mmsys {
> >  	struct reset_controller_dev rcdev;
> >  };
> >  
> > +static int mtk_mmsys_get_match_data_by_clk_name(const struct
> > mtk_mmsys_driver_data **data,
> > +						struct device *dev)
> > +{
> > +	int i;
> > +	struct clk *clk;
> > +	const char *clk_name;
> > +	const struct of_device_id *of_id =
> > of_match_node(mtk_clk_platform_labels,
> > +							 dev->of_node);
> > +	const struct mtk_mmsys_driver_data *drvdata[] = {
> > +		&mt8195_vdosys0_driver_data,
> > +	};
> > +
> > +	if (!of_id || !of_id->data) {
> > +		dev_err(dev, "Can't find match clk platform labels\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(dev, "failed to get mmsys clk\n");
> > +		return PTR_ERR(clk);
> > +	}
> > +
> > +	clk_name = __clk_get_name(clk);
> > +	if (!clk_name) {
> > +		dev_err(dev, "invalid mmsys clk name\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
> > +		if (strncmp(drvdata[i]->clk_name, clk_name,
> > strlen(clk_name)) == 0 &&
> > +		    strncmp(drvdata[i]->clk_driver, of_id->data,
> > strlen(of_id->data)) == 0) {
> 
> I think clk_name is enough to identify the mmsys, why do you need
> clk_driver?

I think there might be another chip that needs to get driver data by
clk_name .
So I use "clk-mt8195" in clk_driver to identify the corresponding
platform whose clk_name of mmsys is also "cfg_vod0".

> > +			*data = drvdata[i];
> > +			return 0;
> > +		}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >  			   enum mtk_ddp_comp_id cur,
> >  			   enum mtk_ddp_comp_id next)
> > @@ -206,6 +260,11 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  	}
> >  
> >  	mmsys->data = of_device_get_match_data(&pdev->dev);
> > +	if (!mmsys->data &&
> > mtk_mmsys_get_match_data_by_clk_name(&mmsys->data, dev) < 0) {
> > +		dev_err(dev, "Couldn't get match driver data\n");
> > +		return -EINVAL;
> > +	}
> > +
> >  	platform_set_drvdata(pdev, mmsys);
> >  
> >  	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> > > clk_driver,
> > 
> > @@ -260,6 +319,9 @@ static const struct of_device_id
> > of_match_mtk_mmsys[] = {
> >  		.compatible = "mediatek,mt8192-mmsys",
> >  		.data = &mt8192_mmsys_driver_data,
> >  	},
> > +	{
> > +		.compatible = "mediatek,mt8195-mmsys",
> > +	},
> >  	{
> >  		.compatible = "mediatek,mt8365-mmsys",
> >  		.data = &mt8365_mmsys_driver_data,
> > 
> 
> [snip]
> 
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 4bba275e235a..fb719fd1281c 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -16,14 +16,25 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_CCORR,
> >  	DDP_COMPONENT_COLOR0,
> >  	DDP_COMPONENT_COLOR1,
> > -	DDP_COMPONENT_DITHER,
> > +	DDP_COMPONENT_DITHER0,
> 
> I would like soc and drm modification to go through different tree,
> so
> this setting would not modify drm driver in this patch.
> 
> DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
> 
> Then modify drm driver after this patch.
> 
> Regards,
> CK

OK, I will use this modification at the next version.
Thanks!

Regards,
Jason-JH.Lin

> 
> > +	DDP_COMPONENT_DITHER1,
> > +	DDP_COMPONENT_DP_INTF0,
> > +	DDP_COMPONENT_DP_INTF1,
> >  	DDP_COMPONENT_DPI0,
> >  	DDP_COMPONENT_DPI1,
> > +	DDP_COMPONENT_DSC0,
> > +	DDP_COMPONENT_DSC1,
> >  	DDP_COMPONENT_DSI0,
> >  	DDP_COMPONENT_DSI1,
> >  	DDP_COMPONENT_DSI2,
> >  	DDP_COMPONENT_DSI3,
> >  	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_MERGE0,
> > +	DDP_COMPONENT_MERGE1,
> > +	DDP_COMPONENT_MERGE2,
> > +	DDP_COMPONENT_MERGE3,
> > +	DDP_COMPONENT_MERGE4,
> > +	DDP_COMPONENT_MERGE5,
> >  	DDP_COMPONENT_OD0,
> >  	DDP_COMPONENT_OD1,
> >  	DDP_COMPONENT_OVL0,
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
