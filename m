Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E762AC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 08:05:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712B3204FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 08:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCzSVmEr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l6FCLiA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 712B3204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j4HsYHv7gJg0HwA2cSRwPAyTkXHhAADaTwzR6MA+rXY=; b=RCzSVmErj0Dq2H2WUPbWcbILK
	0riuvEPQ6t11J0otmbwWlhAoxOiml3DpB286JiOOs8Vd7Ji1q18em83njcOcZLoKvSK/q+Db+Lrr7
	WiuB28NdUGmZ+0YRYkKtpkQScncu99rnV+mSHsXczwwNre0Q1v5r+sd1LafzYPgTo4D+o5Zs3u9JX
	ekzqmLxVdjKclNELsM5pABB9x4uKygYaPvljQUqg5oJSqhvRWatq7qmh7nFupsPfsZY+hH5UtfgcU
	Y/WlPLVCHDoIO3a+2q9IOXCWh2mV8cpuiO+bB04+z9DyTI1ZbWtB9mBEMviQeKw5U2css/lzr7Z42
	UX5a72KxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHjUZ-0005iu-6m; Mon, 14 Sep 2020 08:05:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHjUV-0005iD-FI; Mon, 14 Sep 2020 08:05:38 +0000
X-UUID: acf1ab62da4945e4b372fc16e69030aa-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o4+81MO/aJXsuzsrMQotH3ExSOvHSioLCD4f6dFJz2w=; 
 b=l6FCLiA7CJi3pAqSW4Cxm/8GBgjW4L6Ft2+GXzUAVTo5Y51qYZWyjZPjj+vUJqg7T/QEgu2STC017M8xWY2DUtZLSqt6psW2BkyPoq7AK/pReqqWCYd5BgAEl3EiVl7uzo/4tXOEiWnCvy13/3lk3DmBtYZU3midJqY7LytMqpc=;
X-UUID: acf1ab62da4945e4b372fc16e69030aa-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458273465; Mon, 14 Sep 2020 00:05:28 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 01:05:26 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Sep 2020 16:05:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 16:05:21 +0800
Message-ID: <1600070601.27773.14.camel@mhfsdcap03>
Subject: Re: [PATCH v4 3/3] iommu/mediatek: add support for MT8167
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 14 Sep 2020 16:03:21 +0800
In-Reply-To: <20200907101649.1573134-3-fparent@baylibre.com>
References: <20200907101649.1573134-1-fparent@baylibre.com>
 <20200907101649.1573134-3-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B396821207B0DA67FA40430B531D336757789FCC3ACCCB9E04E67630009AD4F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_040535_722179_F6DF8DA5 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, miles.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-07 at 12:16 +0200, Fabien Parent wrote:
> Add support for the IOMMU on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
> 
> V4;
> 	* Removed HAS_4GB_MODE flag since this SoC does not seem to support it
> V3:
> 	* use LEGACY_IVRP_PADDR flag instead of using a platform data member
> V2:
> 	* removed if based on m4u_plat, and using instead the new
> 	  has_legacy_ivrp_paddr member that was introduced in patch 2.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 8 ++++++++
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index b1f85a7e9346..4ff071eb5279 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -817,6 +817,13 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>  	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>  };
>  
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +	.m4u_plat     = M4U_MT8167,
> +	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR,
> +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> @@ -835,6 +842,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
>  	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
> +	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>  	{}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 122925dbe547..df32b3e3408b 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -39,6 +39,7 @@ enum mtk_iommu_plat {
>  	M4U_MT2701,
>  	M4U_MT2712,
>  	M4U_MT6779,
> +	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
