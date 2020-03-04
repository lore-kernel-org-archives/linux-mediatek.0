Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEA7C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897232146E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/i2Tr4p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V+Wb4VIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897232146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jq9ADrSLmQG+uHOJquGtYnQCO4uS+YY07QWMOarI+Xw=; b=F/i2Tr4pt2sPVV
	QhJrBNery65J5y9gEuoiPgifKgAeoZk9mHGIvOV9I2RiNdxV0B0MP0ITEmOTWPn6VKVGoAqjr1rV8
	pT3EU+lxpYpTLV3E5DCMt080pqlhqXE9moJ2pHqziOrgxcYnqs0tdGgbtoWEdThDuaKH+Do/Kp6SX
	8OAhLvYc20lDmNsXmjbmiIEHuDbFbKGjchAz13fxo5zGFbpa4HxlSJ+M5iUN7k+StFCVe3Srwhz2f
	6PmMb4v69q8v91oQt9U1eyPTsKH3r3FiKyTxpkxkmUtZ03saUpFU/MADizjglGdyK5FdxdQKH81ld
	Lx9wJSjuqqkzr3+KuEyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9T3q-0007Kz-Hi; Wed, 04 Mar 2020 12:23:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9T3n-0007IH-Jt; Wed, 04 Mar 2020 12:23:37 +0000
X-UUID: 665d5ac891564feb8c6fb5b76b502811-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OssUNRC3Tj6PFiOJDmNMrtiv3wqgqqKa4MYNjVzDtI0=; 
 b=V+Wb4VIyQmbCZh6bXJd24Ul9B1GMKJyoRpnzns1S1E30lgZlSKp+4lgjPEoFenjzdYFS/mL/ocNUD5hocCipvUkr2/Rtk4AvC094ZNEbH99fNA9feyBAAv5CRGXPoUSs3BT53M37ce5NrkJFouqyxs2n0uae2ouvpwEbM05f8B8=;
X-UUID: 665d5ac891564feb8c6fb5b76b502811-20200304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 941070899; Wed, 04 Mar 2020 04:23:29 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 04:24:21 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 4 Mar 2020 20:22:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 20:22:25 +0800
Message-ID: <1583324597.4784.23.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/3] iommu/mediatek: add pdata member for legacy ivrp
 paddr
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Wed, 4 Mar 2020 20:23:17 +0800
In-Reply-To: <20200302112152.2887131-2-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
 <20200302112152.2887131-2-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6605E1F8BA11BF1D3312455B42D32C1E8866B40A03E980F364CC1ED7C780BC92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_042335_696350_563AB104 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org, joro@8bytes.org,
 youlin.pei@mediatek.com, linux-kernel@vger.kernel.org, ck.hu@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, scott.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-03-02 at 12:21 +0100, Fabien Parent wrote:
> Add a new platform data member in order to select which IVRP_PADDR
> format is used by an SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2: new patch
> 
> ---
>  drivers/iommu/mtk_iommu.c | 3 ++-
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 95945f467c03..78cb14ab7dd0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -569,7 +569,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
>  	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>  
> -	if (data->plat_data->m4u_plat == M4U_MT8173)
> +	if (data->plat_data->has_legacy_ivrp_paddr)
>  		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>  	else
>  		regval = lower_32_bits(data->protect_base) |
> @@ -786,6 +786,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
> +	.has_legacy_ivrp_paddr = true;
>  	.reset_axi    = true,
>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index ea949a324e33..4696ba027a71 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -42,6 +42,7 @@ struct mtk_iommu_plat_data {
>  	bool                has_bclk;
>  	bool                has_vld_pa_rng;
>  	bool                reset_axi;
> +	bool                has_legacy_ivrp_paddr;

I'd like to put this before "has_vld_pa_rng" alphabetically.

Other than this,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

>  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
