Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCBAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pN5i02WJ64ZW/jbjeDoAiEqVWeqraOAlRCcvPFxqweg=; b=De+bDkzkpgbqIn
	iZ40/Q4rsOTTSmfLWQQSfW8xQ837IZ6GhYUV12AVNm33AC+Y5lczOALBUcHkjJEuvFCoBOVhREcTr
	pI7Z+rPFl/ykiRpkGpvDrSWQn2/+d5eqk0DE9JKTXqEZVThy/pvpdC/dNeV25913u3jtM97Qee2GH
	rkGbsJIPCEagsn59IXbtdwqER8KktOscuruSzSQOgaU/MotWRkzh/TxeSIQubpnKLNtg5CxcBSAID
	9P24am0EhZZRMnMl2AhSJrA9qVPedUToA0YCztbv8Of5JhT3QgU7gQ4goHu0harNAWH6FvTB3dCXB
	vCQ3d4gTI70rtJGaIDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWyHC-00DKMh-5B; Wed, 23 Mar 2022 10:31:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWyH7-00DKLm-E1; Wed, 23 Mar 2022 10:31:36 +0000
X-UUID: e8958b5b1f794083978199f39ff629a8-20220323
X-UUID: e8958b5b1f794083978199f39ff629a8-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233098754; Wed, 23 Mar 2022 03:31:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 03:23:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 18:23:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 18:23:15 +0800
Message-ID: <314a9839609898933bf19a6d29b83807391845af.camel@mediatek.com>
Subject: Re: [PATCH v2] soc: mediatek: mmsys: Add sw0_rst_offset for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>
Date: Wed, 23 Mar 2022 18:23:15 +0800
In-Reply-To: <20220323091932.10648-1-angelogioacchino.delregno@collabora.com>
References: <20220323091932.10648-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_033133_489616_DEAE0D5D 
X-CRM114-Status: GOOD (  17.36  )
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

On Wed, 2022-03-23 at 17:19 +0800, AngeloGioacchino Del Regno wrote:
> MT8192 has the same sw0 reset offset as MT8186: add the parameter
> to be able to use mmsys as a reset controller for managing at
> least the DSI reset line.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> 
> v2: Change the offset to 0x160 (as defined for MT8186). Thanks, Rex-
> BC!
> 

You are welcome!

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

>  drivers/soc/mediatek/mtk-mmsys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..f69521fabcce 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -70,6 +70,7 @@ static const struct mtk_mmsys_driver_data
> mt8192_mmsys_driver_data = {
>  	.clk_driver = "clk-mt8192-mm",
>  	.routes = mmsys_mt8192_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {
> -- 
> 2.35.1
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
