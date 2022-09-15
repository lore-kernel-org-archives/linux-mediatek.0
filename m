Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1AAC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Dkt2iyWGB5eEBrBavMQEPfw+ydgwLy70S8Syi1KApk=; b=nR8wx/T7ZpFZ1BCXT3dVNqxcPr
	cI2j2l67JEoi+/aQWyI8qSsxhwn73Qo3cwxrrtoCWsSPcv00dD00I8cpfMB4HbTTaNRk4QopCZpMn
	GYwJ1kfxxf/yuAMZ6ZZXcuFJrTJD2BipTKFKlnwODt6pN4a1QmRKbiJ7TAJeNsDyJoYjFi+rBuj0V
	JoK4Frw/1bhN/mMEVFv2eVFuesRVWvAhtUONrrooc+V3Aae80he7VMsPw/TksBLvFHhjTI5+TkOXC
	PKJgAtrETxSAa/BYQ+/tp9vEbmKyNE+ZeFs+UUUjh5XKMO3vjgONL3I7ZlNWCnbunVmyTQxEviHpk
	oCNXTrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdkf-00EPvM-3B; Thu, 15 Sep 2022 01:33:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdkR-00EPoe-9T; Thu, 15 Sep 2022 01:33:01 +0000
X-UUID: a18d7e22e6454877ba343d5ab8103920-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1Dkt2iyWGB5eEBrBavMQEPfw+ydgwLy70S8Syi1KApk=;
	b=R3qlMAodXTEyQwa89oTTItD9Zvnvr4b6fj8qjBlEVMaKN3a38hIQEx3+mg1mxmv8bHHTtcr/6BmtHW8cSSOl50ktI+YzefztCGrRXiJQFKbV0GzaQ5O9LzkUsNYvwt836ludaNgno567LLxX6AeXBXjvVfzEiTB502crjCs2cMk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:67ace4db-1b45-4c6c-8f34-f0603b40943f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:06ce6ff6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a18d7e22e6454877ba343d5ab8103920-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1332324057; Wed, 14 Sep 2022 18:31:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 09:31:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Sep 2022 09:31:05 +0800
Message-ID: <fadb9b2eb8a66bf8c4c22a9220798952804fd455.camel@mediatek.com>
Subject: Re: [PATCH 2/5] soc: mediatek: change compatible name for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 15 Sep 2022 09:31:05 +0800
In-Reply-To: <f748b0a8-2e6c-b690-19f2-13f3a695f2cb@gmail.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
	 <20220914182331.20515-3-jason-jh.lin@mediatek.com>
	 <f748b0a8-2e6c-b690-19f2-13f3a695f2cb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_183259_352722_0AE50418 
X-CRM114-Status: GOOD (  29.69  )
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

Hi Matthias,

Thanks for the reviews.

On Wed, 2022-09-14 at 22:42 +0200, Matthias Brugger wrote:
> 
> On 14/09/2022 20:23, Jason-JH.Lin wrote:
> > In mt8195, vdosys0 and vdosys1 are 2 different function blocks
> > for mediatek-drm, so using 2 compatible instead of identifying
> > multiple mmsys by io_start.
> > 
> > Fixes: b804923b7ccb ("soc: mediatek: add mtk-mmsys support for
> > mt8195 vdosys0")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
>  From what I have seen we can just revert the commit. No fixes tag
> needed, it 
> does not fix any (runtime) bug.
> 
OK, I'll revert the original patch then add a new patch for
adding driver data of "mediatek,mt8195-vdosys0" compatible.

Regards,
Jason-JH.Lin

> Regards,
> Matthias
> 
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 141 +++++---------------------
> > -----
> >   drivers/soc/mediatek/mtk-mmsys.h |   6 --
> >   2 files changed, 21 insertions(+), 126 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 06d8e83a2cb5..e1c653f3abc0 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -26,61 +26,26 @@ static const struct mtk_mmsys_driver_data
> > mt2701_mmsys_driver_data = {
> >   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt2701_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt2701_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt2712_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt2712-mm",
> >   	.routes = mmsys_default_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt2712_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt2712_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt6779_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt6779-mm",
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt6779_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt6779_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt6797_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt6797-mm",
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt6797_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt6797_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8167_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8167-mm",
> >   	.routes = mt8167_mmsys_routing_table,
> >   	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8167_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8167_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8173-mm",
> >   	.routes = mmsys_default_routing_table,
> > @@ -88,13 +53,6 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8173_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8183-mm",
> >   	.routes = mmsys_mt8183_routing_table,
> > @@ -102,13 +60,6 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8183_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8186-mm",
> >   	.routes = mmsys_mt8186_routing_table,
> > @@ -116,13 +67,6 @@ static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8186_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8186_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8192_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8192-mm",
> >   	.routes = mmsys_mt8192_routing_table,
> > @@ -130,66 +74,29 @@ static const struct mtk_mmsys_driver_data
> > mt8192_mmsys_driver_data = {
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8192_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8192_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> > -	.io_start = 0x1c01a000,
> >   	.clk_driver = "clk-mt8195-vdo0",
> >   	.routes = mmsys_mt8195_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >   };
> >   
> >   static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> > -	.io_start = 0x1c100000,
> >   	.clk_driver = "clk-mt8195-vdo1",
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> > {
> > -	.num_drv_data = 2,
> > -	.drv_data = {
> > -		&mt8195_vdosys0_driver_data,
> > -		&mt8195_vdosys1_driver_data,
> > -	},
> > -};
> > -
> >   static const struct mtk_mmsys_driver_data
> > mt8365_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8365-mm",
> >   	.routes = mt8365_mmsys_routing_table,
> >   	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
> >   };
> >   
> > -static const struct mtk_mmsys_match_data mt8365_mmsys_match_data =
> > {
> > -	.num_drv_data = 1,
> > -	.drv_data = {
> > -		&mt8365_mmsys_driver_data,
> > -	},
> > -};
> > -
> >   struct mtk_mmsys {
> >   	void __iomem *regs;
> >   	const struct mtk_mmsys_driver_data *data;
> >   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> >   	struct reset_controller_dev rcdev;
> > -	phys_addr_t io_start;
> >   };
> >   
> > -static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> > -					const struct
> > mtk_mmsys_match_data *match)
> > -{
> > -	int i;
> > -
> > -	for (i = 0; i < match->num_drv_data; i++)
> > -		if (mmsys->io_start == match->drv_data[i]->io_start)
> > -			return i;
> > -
> > -	return -EINVAL;
> > -}
> > -
> >   void mtk_mmsys_ddp_connect(struct device *dev,
> >   			   enum mtk_ddp_comp_id cur,
> >   			   enum mtk_ddp_comp_id next)
> > @@ -284,7 +191,6 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   	struct device *dev = &pdev->dev;
> >   	struct platform_device *clks;
> >   	struct platform_device *drm;
> > -	const struct mtk_mmsys_match_data *match_data;
> >   	struct mtk_mmsys *mmsys;
> >   	struct resource *res;
> >   	int ret;
> > @@ -317,20 +223,11 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		dev_err(dev, "Couldn't get mmsys resource\n");
> >   		return -EINVAL;
> >   	}
> > -	mmsys->io_start = res->start;
> > -
> > -	match_data = of_device_get_match_data(dev);
> > -	if (match_data->num_drv_data > 1) {
> > -		/* This SoC has multiple mmsys channels */
> > -		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
> > -		if (ret < 0) {
> > -			dev_err(dev, "Couldn't get match driver
> > data\n");
> > -			return ret;
> > -		}
> > -		mmsys->data = match_data->drv_data[ret];
> > -	} else {
> > -		dev_dbg(dev, "Using single mmsys channel\n");
> > -		mmsys->data = match_data->drv_data[0];
> > +
> > +	mmsys->data = of_device_get_match_data(&pdev->dev);
> > +	if (!mmsys->data) {
> > +		dev_err(dev, "Couldn't get match driver data\n");
> > +		return -EINVAL;
> >   	}
> >   
> >   	platform_set_drvdata(pdev, mmsys);
> > @@ -353,47 +250,51 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   static const struct of_device_id of_match_mtk_mmsys[] = {
> >   	{
> >   		.compatible = "mediatek,mt2701-mmsys",
> > -		.data = &mt2701_mmsys_match_data,
> > +		.data = &mt2701_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt2712-mmsys",
> > -		.data = &mt2712_mmsys_match_data,
> > +		.data = &mt2712_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt6779-mmsys",
> > -		.data = &mt6779_mmsys_match_data,
> > +		.data = &mt6779_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt6797-mmsys",
> > -		.data = &mt6797_mmsys_match_data,
> > +		.data = &mt6797_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8167-mmsys",
> > -		.data = &mt8167_mmsys_match_data,
> > +		.data = &mt8167_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8173-mmsys",
> > -		.data = &mt8173_mmsys_match_data,
> > +		.data = &mt8173_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8183-mmsys",
> > -		.data = &mt8183_mmsys_match_data,
> > +		.data = &mt8183_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8186-mmsys",
> > -		.data = &mt8186_mmsys_match_data,
> > +		.data = &mt8186_mmsys_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8192-mmsys",
> > -		.data = &mt8192_mmsys_match_data,
> > +		.data = &mt8192_mmsys_driver_data,
> > +	},
> > +	{
> > +		.compatible = "mediatek,mt8195-vdosys0",
> > +		.data = &mt8195_vdosys0_driver_data,
> >   	},
> >   	{
> > -		.compatible = "mediatek,mt8195-mmsys",
> > -		.data = &mt8195_mmsys_match_data,
> > +		.compatible = "mediatek,mt8195-vdosys1",
> > +		.data = &mt8195_vdosys1_driver_data,
> >   	},
> >   	{
> >   		.compatible = "mediatek,mt8365-mmsys",
> > -		.data = &mt8365_mmsys_match_data,
> > +		.data = &mt8365_mmsys_driver_data,
> >   	},
> >   	{ }
> >   };
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index f01ba206481d..77f37f8c715b 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -87,18 +87,12 @@ struct mtk_mmsys_routes {
> >   };
> >   
> >   struct mtk_mmsys_driver_data {
> > -	const resource_size_t io_start;
> >   	const char *clk_driver;
> >   	const struct mtk_mmsys_routes *routes;
> >   	const unsigned int num_routes;
> >   	const u16 sw0_rst_offset;
> >   };
> >   
> > -struct mtk_mmsys_match_data {
> > -	unsigned short num_drv_data;
> > -	const struct mtk_mmsys_driver_data *drv_data[];
> > -};
> > -
> >   /*
> >    * Routes in mt8173, mt2701, mt2712 are different. That means
> >    * in the same register address, it controls different
> > input/output
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


