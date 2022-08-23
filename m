Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D0C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IUdramIkid/u6ApEZFUzQPcYeOozNSiBDrLooC1sGY=; b=tkEcryOGVSn4CBOjGP3Vq5GK+6
	+eGTd+sBuul6esAbxtUvDJ410h415v72pD4L0RtmwBhx5KVcl5DYzOJZ7uI+QrYpDB5StHQXWjKW/
	jyHi3/h4y/R5THIBIxrmMiOH+wQDBUOl+dUMauA5na1tdHpKIwszCiSv2Q/9h17W5zLhpQUhGbbUW
	Nbl/5DE5lssveepGXUKn077H4283MKKvxv5vdApSNL6iowu+bCPp3mx0XgYVXDdZ9m7x6E4VHQFY6
	CxHdmTir/ULelLIRoEmyobjWHj00vDXY5lpkPibe/QULxWIwU4wokbmbLk3yAVXf3XTZ7CVtjy1g8
	GWYOK7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQS7d-005OT3-Fh; Tue, 23 Aug 2022 11:31:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQS7O-005OHB-EP; Tue, 23 Aug 2022 11:30:53 +0000
X-UUID: 53e36d7b43434559bc132eb3e02acc79-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=5IUdramIkid/u6ApEZFUzQPcYeOozNSiBDrLooC1sGY=;
	b=PTFVP4/Ha4uQLBY6CHAVX2QizqkUtt8+uLDTHmbUerHbcpRwD+6julRF+yzOcp/BTnb50Ce/5mCME44kVbgbiDC+VHP8m5J24a4cbQpDzb3NauTpQn0+rkaEjqceUEaycFNqaA9BYSfCs1hw69df/U4JqG7HZRiETeFeBC9SaRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:50557a68-01b5-4d55-b450-85c244c81879,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:79f00d68-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 53e36d7b43434559bc132eb3e02acc79-20220823
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 141765435; Tue, 23 Aug 2022 04:30:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 19:30:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 19:30:01 +0800
Message-ID: <140b3cd10317a5db781df180ce4efb697cdd641b.camel@mediatek.com>
Subject: Re: [PATCH v26 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 23 Aug 2022 19:30:01 +0800
In-Reply-To: <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
References: <20220819061011.7672-1-nancy.lin@mediatek.com>
	 <20220819061011.7672-8-nancy.lin@mediatek.com>
	 <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_043050_531151_C4876AD2 
X-CRM114-Status: GOOD (  28.98  )
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

Thanks for the review.

On Tue, 2022-08-23 at 12:20 +0200, Matthias Brugger wrote:
> 
> On 19/08/2022 08:10, Nancy.Lin wrote:
> > Add mmsys for support 64 reset bits. It is a preparation for MT8195
> > vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> > 
> > 1. Add the number of reset bits in mmsys private data
> > 2. move the whole "reset register code section" behind the
> > "get mmsys->data" code section for getting the num_resets in mmsys-
> > >data.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++----
> > -------
> >   drivers/soc/mediatek/mtk-mmsys.h |  1 +
> >   2 files changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 999be064103b..20ae751ad8a7 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -20,6 +20,8 @@
> >   #include "mt8195-mmsys.h"
> >   #include "mt8365-mmsys.h"
> >   
> > +#define MMSYS_SW_RESET_PER_REG 32
> > +
> >   static const struct mtk_mmsys_driver_data
> > mt2701_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt2701-mm",
> >   	.routes = mmsys_default_routing_table,
> > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >   	.routes = mmsys_default_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8173_mmsys_match_data
> > = {
> > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >   	.routes = mmsys_mt8183_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8183_mmsys_match_data
> > = {
> > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >   	.routes = mmsys_mt8186_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8186_mmsys_match_data
> > = {
> > @@ -128,6 +133,7 @@ static const struct mtk_mmsys_driver_data
> > mt8192_mmsys_driver_data = {
> >   	.routes = mmsys_mt8192_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> 
> You didn't reply to Nicolas regarding the reset numbers. I actually
> agree with 
> him that we will need the num_resets declared for all devices. Why do
> you think 
> this is not the case?
> 
> Regards,
> Matthias
> 

Sorry, I lost Nicolas's email. 

I checked with the mmsys git log with reset controller function.

1. Enric add mmsys reset controller function in [1]/[2].
   => in mtk_mmsys_reset_update(), all mmsys reset offset is
MMSYS_SW0_RST_B (0x140). 

2. After Enric's patch, Rex add sw0_rst_offset in mmsys driver data in
[3].

So, I think sw0_rst_offset is not zero. Instead of only add num_resets
but also need to add sw0_rst_offset for all mmsys. What do you think ?

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=f27ef2856343e2ddc392975d7b15120442e4d7b7
[2]

https://patchwork.kernel.org/project/linux-mediatek/cover/20210825102632.601614-1-enric.balletbo@collabora.com/
[3]

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=62dc30150c06774a8122c52aedd0eddaceaf5940

Regards,
Nancy
> 
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8192_mmsys_match_data
> > = {
> > @@ -288,13 +294,19 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > +	u32 offset;
> > +	u32 reg;
> > +
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> > +	reg = mmsys->data->sw0_rst_offset + offset;
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> >   	if (assert)
> > -		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > >sw0_rst_offset, BIT(id), 0, NULL);
> > +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0, NULL);
> >   	else
> > -		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > >sw0_rst_offset, BIT(id), BIT(id), NULL);
> > +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), BIT(id),
> > NULL);
> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   
> > @@ -351,18 +363,6 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		return ret;
> >   	}
> >   
> > -	spin_lock_init(&mmsys->lock);
> > -
> > -	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> > -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > -	mmsys->rcdev.of_node = pdev->dev.of_node;
> > -	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> > >rcdev);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "Couldn't register mmsys reset
> > controller: %d\n", ret);
> > -		return ret;
> > -	}
> > -
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	if (!res) {
> >   		dev_err(dev, "Couldn't get mmsys resource\n");
> > @@ -384,6 +384,18 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		mmsys->data = match_data->drv_data[0];
> >   	}
> >   
> > +	spin_lock_init(&mmsys->lock);
> > +
> > +	mmsys->rcdev.owner = THIS_MODULE;
> > +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> > +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > +	mmsys->rcdev.of_node = pdev->dev.of_node;
> > +	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> > >rcdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Couldn't register mmsys reset
> > controller: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> >   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >   	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> >   	if (ret)
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index f01ba206481d..20a271b80b3b 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
> >   	const struct mtk_mmsys_routes *routes;
> >   	const unsigned int num_routes;
> >   	const u16 sw0_rst_offset;
> > +	const u32 num_resets;
> >   };
> >   
> >   struct mtk_mmsys_match_data {
> 
> 


