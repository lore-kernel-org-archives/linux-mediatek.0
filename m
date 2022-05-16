Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB87AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OtbBOOnUmjIkgASERY38HdkQGNQfJFZe8ZHh1Uw8Do=; b=jKhqX6O4MB+X86
	uvt4trWzWpV33bT4/PV2MbXwlRUn2HT1bLcBhYjDZMshMM6SDEoAD4Ml0pg1syKVKacXGOELZ0/NA
	M+5rZ3PRgenEwmukb3sfb2+hW2+2jUZ+8FgzoabWyXsZudxtiaQbCyJ7sPutIK0iATh+SeSx1udYD
	uUTrd0B9WgoydUnPp76CTBd/NO0fhlHGLcnF7x3cp6WGMDLKj1VOUwieAS4dS1S2L0bqp9M038VK0
	xB0vCrxASdm3BZUrauzm9sJYGlx23s9o+lCPb4iVVTV3Qpn7712HQ+bEOhc2VwEhfptNGoQUV6DO0
	8jJiqgP15wO8AZZD/FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTVs-0063l5-1E; Mon, 16 May 2022 05:43:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTVd-0063h2-WC; Mon, 16 May 2022 05:43:14 +0000
X-UUID: a97f87e0d5eb4bc690f4813d61112de9-20220515
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1d65870d-f9c6-4f4a-a710-510aa5dbd32c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b14b5df2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: a97f87e0d5eb4bc690f4813d61112de9-20220515
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1515484460; Sun, 15 May 2022 22:43:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 May 2022 22:43:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 13:43:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 16 May 2022 13:43:01 +0800
Message-ID: <7c996c665a57fdd9ba8d6df4dc085f70afc1b933.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
From: CK Hu <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <konrad.dybcio@somainline.org>, <marijn.suijten@somainline.org>,
 <martin.botka@somainline.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <paul.bouchara@somainline.org>,
 <kernel@collabora.com>
Date: Mon, 16 May 2022 13:43:01 +0800
In-Reply-To: <20220513170350.502501-1-angelogioacchino.delregno@collabora.com>
References: <20220513170350.502501-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_224310_092075_89A51EF5 
X-CRM114-Status: GOOD (  20.06  )
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

Hi, Angelo:

On Fri, 2022-05-13 at 19:03 +0200, AngeloGioacchino Del Regno wrote:
> Add MM support for the MT6795 SoC, using the mmsys default routing
> table.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> 
> In order for this patch to have any meaning and functionality, it is
> required to also have in-tree the [1] MT6795 clocks series, even
> though that's not required to actually compile this code.
> 
> [1] 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=641493__;!!CTRNKA9wMg0ARbw!ywDb_Gj4oV0iYHK_PbtJSNejzsJGlFVjX-1O0G1mR0vZX_5VeMtlZJ_AS6K_Mg$
>  
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..38b36b881a3b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -57,6 +57,13 @@ static const struct mtk_mmsys_match_data
> mt6779_mmsys_match_data = {
>  	},
>  };
>  
> +static const struct mtk_mmsys_driver_data mt6795_mmsys_driver_data =
> {
> +	.clk_driver = "clk-mt6795-mm",
> +	.routes = mmsys_default_routing_table,

mt6795 should have its own routing table instead of default one. The
default one is used for mt8173, mt2701, mt2712 which no one knows how
to separate them. If you don't know the routing table of mt6795, just
left this as NULL.

Regards,
CK

> +	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +};
> +
>  static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt6797-mm",
>  };
> @@ -363,6 +370,10 @@ static const struct of_device_id
> of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt6779-mmsys",
>  		.data = &mt6779_mmsys_match_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt6795-mmsys",
> +		.data = &mt6795_mmsys_driver_data,
> +	},
>  	{
>  		.compatible = "mediatek,mt6797-mmsys",
>  		.data = &mt6797_mmsys_match_data,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
