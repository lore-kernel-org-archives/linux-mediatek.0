Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE29C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ghN7VmVQnos4hPKWncaAnfXqQiRkXmmPVdQejnrLbs=; b=GRjbDF0PwnB1Lttbke5ROotLGg
	a+yszBLj0OWtJge6KuJsXXKzsaKXCkS8IA+K/U6lrwPSWLNkY/5lhUmA6bPRRWJZqYspROcgYlqeC
	K9kF0kmKsBLIGZIIhfGgjSjuQs5mKjvbVKKzFG9PgUT0WnMh1OL5ePrZhU2H2UODPyOSL4tZ21PN3
	3KWR+DnTT9L0WJZZC1dl8bVJeWjhXAeBVi5jCWPM1mkSpiffW7jmt5XG9Ea5iTkV5I/nkBd3Ow4se
	rp4Ypjq/GSXTl4AOyh0g8dkvmuZPbVkI8AdIOj9DAGBj2vkbzsXpo/gF3FUXk2ZqHTcdsk0KCh4rl
	DtUIzHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ17p-005Z2K-7V; Mon, 22 Aug 2022 06:41:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ17m-005Yxf-4u; Mon, 22 Aug 2022 06:41:27 +0000
X-UUID: 708443db2c9943cea5e33bb8adcd72ca-20220821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3ghN7VmVQnos4hPKWncaAnfXqQiRkXmmPVdQejnrLbs=;
	b=jK7Ak6U8Xsd1GWww/FqDdtMlCYJqmRcM1d7+ggBng1vvdPMomBAsOkoan0fRPYaFp2P1JD4YQS4Imqus6OmC7IXZnTJhI6J/62FafFzoHBQ24iWXhxbqQHjoU34n8LpS37F3Chm2OnqD3k5oO3vmiE8G6G39lvn4mIwgiDVPsio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c49a3f01-ecb4-4392-839b-d70e4249934e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:87c962c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 708443db2c9943cea5e33bb8adcd72ca-20220821
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1431493271; Sun, 21 Aug 2022 23:41:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 13:50:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 22 Aug 2022 13:50:41 +0800
Message-ID: <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8188
From: CK Hu <ck.hu@mediatek.com>
To: nathan.lu <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Moudy Ho <moudy.ho@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<wsd_upstream@mediatek.com>, <lancelot.wu@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Date: Mon, 22 Aug 2022 13:50:41 +0800
In-Reply-To: <20220822033213.15769-5-nathan.lu@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
	 <20220822033213.15769-5-nathan.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_234126_260638_B9326303 
X-CRM114-Status: GOOD (  17.24  )
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

Hi, Nathan:

On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30
> ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index d72263c8a621..260514006093 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] =
> {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const unsigned int mt8188_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER0,
> +	DDP_COMPONENT_DP_INTF0,
> +};
> +
>  static const unsigned int mt8192_mtk_ddp_main[] = {
>  	DDP_COMPONENT_OVL0,
>  	DDP_COMPONENT_OVL_2L0,
> @@ -323,6 +335,20 @@ static const struct mtk_mmsys_match_data
> mt8186_mmsys_match_data = {
>  	},
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data
> = {
> +	.io_start = 0x1c01d000,

For only one mmsys, it's not necessary to set io_start.

Regards,
CK

> +	.main_path = mt8188_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> +	.mmsys_dev_num = 1,
> +};
> +
> +static const struct mtk_mmsys_match_data mt8188_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8188_vdosys0_driver_data,
> +	},
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
> {
>  	.main_path = mt8192_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -376,6 +402,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8183_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8186-mmsys",
>  	  .data = &mt8186_mmsys_match_data},
> +	{ .compatible = "mediatek,mt8188-mmsys",
> +	  .data = &mt8188_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8192-mmsys",
>  	  .data = &mt8192_mmsys_match_data},
>  	{ .compatible = "mediatek,mt8195-mmsys",
> @@ -734,6 +762,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8186-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8188-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8192-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8195-disp-mutex",


