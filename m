Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3HpPckcgniVH9RHhGbuin6U5KfP/yeOpZWq5bqZxSs=; b=MXeIXfXeuxFDkp
	z9dTTKU0wV3V0hsE+AZ8Glz/coKiO4raHaJYx5jUPDDSE92+Wt5uK/iswyt73KJu2qCCdRChDun9h
	/TednNXMW1a/v8iVwGS6uVsBEvaP7rHglb1BGA8SwA0kqXrNGv8SR5gnyKiIp243PkzwDNow+ojiH
	4hN+1SwJOkkjyjiip+3mpx9UXH/hV+DXTxTEp4cLDopLzh0h2lWlZCG2ZhHTrDhwyDCNmCxXFQksC
	XNz1orrjMBQ0SwelER6gl632TUrg5s5b+ALv0EzEtLfhAxXoxJ+IXFk4SNJXOZBAywX1y9Qiyjj/D
	3GwTBUg0WsRAGPqF0tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBtln-002U7w-6e; Mon, 24 Jan 2022 07:28:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBtlj-002U6R-Sg; Mon, 24 Jan 2022 07:28:05 +0000
X-UUID: c3cf6f7cc97a41599c8adc1c331c9a8f-20220124
X-UUID: c3cf6f7cc97a41599c8adc1c331c9a8f-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1850136264; Mon, 24 Jan 2022 00:27:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 23:18:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 24 Jan 2022 15:18:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 15:18:20 +0800
Message-ID: <94cf3379aa648d7366143e2f84bf4e21ad3576c1.camel@mediatek.com>
Subject: Re: [PATCH v11 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 24 Jan 2022 15:18:20 +0800
In-Reply-To: <20220110084645.31191-22-nancy.lin@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-22-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_232803_943306_68F68817 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, 2022-01-10 at 16:46 +0800, Nancy.Lin wrote:
> Add driver data of mt8195 vdosys1 to mediatek-drm.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 36430f956b4f..e851c56f00b1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -190,6 +190,14 @@ static const enum mtk_ddp_comp_id
> mt8195_mtk_ddp_main[] = {
>  	DDP_COMPONENT_DP_INTF0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_ADAPTOR,
> +	DDP_COMPONENT_MERGE5,
> +	DDP_COMPONENT_DP_INTF1,
> +};
> +
> +static const int mt8195_vdosys1_mtk_cmdq_mbox[] = {-1, 0, -1};

What does this array mean? These number looks so magic.

Regards,
CK

> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -254,6 +262,14 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys0_driver_data = {
>  	.mmsys_dev_num = 2,
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data
> = {
> +	.ext_path = mt8195_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
> +	.mmsys_id = 1,
> +	.mmsys_dev_num = 2,
> +	.mbox_index = mt8195_vdosys1_mtk_cmdq_mbox,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] = {
>  	{ .compatible = "mediatek,mt2701-mmsys",
>  	  .data = &mt2701_mmsys_driver_data},
> @@ -271,6 +287,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8192_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8195-vdosys0",
>  	  .data = &mt8195_vdosys0_driver_data},
> +	{ .compatible = "mediatek,mt8195-vdosys1",
> +	  .data = &mt8195_vdosys1_driver_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
