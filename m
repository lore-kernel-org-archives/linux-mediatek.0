Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6011AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndb8FiJwycwQbd68FwDIy1z1+3/dXL/cOI+CVRAVMpw=; b=29YMteAYq/wEd1
	oZU4eb0PMnWAzH/mbIcxN0Feq4JPIu5BizTQgyyZ+OijYfbhPNEYGnbF+TP6y7wksYetHatVrx5lW
	+OJxbSJLJ50Mgt9sCGsEb1Q3oDC1u5WumOOb9NXaeQ+YC4X1g3lR40+yweAk3kBnw19G+obriJsOG
	u743IR1jSLsR7E/ExMJsJZQdgrtNp4lisM8iDPrOnqd11u1NTAOhdSCtyPIBp68P770i7Wvx2/nZy
	+h5c+FVFVmFxYTENEMfWCn1LDyml/zl4ap5UCH+bMQP05pqgOaA9XU3c63WNxAmL+TYbUO1a6WQoB
	76ulrAzE/KJ+bo7UxoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm7im-008rEH-Lz; Wed, 04 May 2022 05:38:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm7ik-008rDd-Ap; Wed, 04 May 2022 05:38:43 +0000
X-UUID: 324a2999a1d14a489b388ffc18640908-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:da51cad0-dec9-497d-9073-97177629d77c, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:151a6bc7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 324a2999a1d14a489b388ffc18640908-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1129485740; Tue, 03 May 2022 22:38:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 22:34:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 13:34:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 13:34:54 +0800
Message-ID: <fbb00a6eceb2e6136d3095e43c6623ccc5f2ca37.camel@mediatek.com>
Subject: Re: [PATCH v19 09/25] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 4 May 2022 13:34:54 +0800
In-Reply-To: <20220503102345.22817-10-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-10-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_223842_408772_0CAA8E70 
X-CRM114-Status: GOOD (  23.79  )
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

Hi, Nancy:

On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys-
> >data.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 38 ++++++++++++++++++++--------
> ----
>  drivers/soc/mediatek/mtk-mmsys.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index cd92db3d36fa..6600185dd9a4 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,8 @@
>  #include "mt8195-mmsys.h"
>  #include "mt8365-mmsys.h"
>  
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt2701-mm",
>  	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> mt8173_mmsys_driver_data = {
>  	.routes = mmsys_default_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> mt8183_mmsys_driver_data = {
>  	.routes = mmsys_mt8183_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> mt8186_mmsys_driver_data = {
>  	.routes = mmsys_mt8186_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> @@ -284,13 +289,18 @@ static int mtk_mmsys_reset_update(struct
> reset_controller_dev *rcdev, unsigned l
>  {
>  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> rcdev);
>  	unsigned long flags;
> +	u32 offset;
> +
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
>  
>  	spin_lock_irqsave(&mmsys->lock, flags);
>  
>  	if (assert)
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), 0, NULL);
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset
> + offset, BIT(id), 0, NULL);
>  	else
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), BIT(id), NULL);
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset
> + offset, BIT(id), BIT(id),
> +				    NULL);
>  
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
>  
> @@ -347,18 +357,6 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;
> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> -	mmsys->rcdev.of_node = pdev->dev.of_node;
> -	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> -		return ret;
> -	}
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(dev, "Couldn't get mmsys resource\n");
> @@ -380,6 +378,18 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		mmsys->data = match_data->drv_data[0];
>  	}
>  
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> +	mmsys->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> +		return ret;
> +	}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
>  	if (ret)
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index f01ba206481d..20a271b80b3b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	const u16 sw0_rst_offset;
> +	const u32 num_resets;
>  };
>  
>  struct mtk_mmsys_match_data {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
