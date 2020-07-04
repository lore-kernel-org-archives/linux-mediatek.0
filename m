Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B3C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 01:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A1C2075D
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 01:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G9Q+W0Vq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="joOfIGWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A1C2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YKoHfKyUGN1yQ4IVIR+cC05Nmd82g+Vb5ls5TsViOs=; b=G9Q+W0Vqcu20/PFgVdLFNx0IH
	AGQedHQmEchns/TTsPZmxswMZrRv1C77WMaDVqdv6AY9Btj3mEcFYYUaEYo1OQ169ggLSOzcdtapu
	/RQEHQb6XnLdq2Y0r+6yq+DJRsn3ZqwRv1BTFk9klg/U1FCpsA9NICS7g1t/ukKA4ulEOZuJIXDUp
	2ehkqxQDjheFmiIcbu/RFKXm/hDjMVmmFQiApixhmzuAKx5tB0kSiNwSEhGO7uRXfgohr2VrGib0I
	q1g7BdizmicmHsSMtk4f8sAVyQhrLSS1CCjMenIrXy8zCj4LyV2OA8j4uCneYLQYDCQfn052PcnHB
	CRsfT49Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrWna-0001tU-Ah; Sat, 04 Jul 2020 01:16:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrWnY-0001sX-6F; Sat, 04 Jul 2020 01:16:57 +0000
X-UUID: 4a10807e77a244e78d5a4a5495f56f8b-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T1Dk7nQlgGGkbfMonA3Q9alxa/t5hffgX9wAPRQoUoI=; 
 b=joOfIGWfXHDlqGQvvGaQ23ClAy/FmLUtZEwkqF5R0Uw3Z7QQv5JHMvRER3r2aPs6gWwzEOu4If5QueNu5eI84fsuvjDuhLZ7MWcNVCcACUX5mXQvkOTfcwoJAwGQYXgiTfI4VmJj1Z0Ph4w0K4u9tqAE70flWREL+jP1GATwcTg=;
X-UUID: 4a10807e77a244e78d5a4a5495f56f8b-20200703
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1563952256; Fri, 03 Jul 2020 17:16:47 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 18:16:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 09:16:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 4 Jul 2020 09:16:38 +0800
Message-ID: <1593825398.4355.1.camel@mtksdaap41>
Subject: Re: [PATCH v6 03/10] iommu/mediatek: Use a u32 flags to describe
 different HW features
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Chao Hao <chao.hao@mediatek.com>
Date: Sat, 4 Jul 2020 09:16:38 +0800
In-Reply-To: <20200703044127.27438-4-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200703044127.27438-4-chao.hao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_211656_392474_A50F5160 
X-CRM114-Status: GOOD (  24.35  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 TH Yang <th.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-03 at 12:41 +0800, Chao Hao wrote:
> Given the fact that we are adding more and more plat_data bool values,
> it would make sense to use a u32 flags register and add the appropriate
> macro definitions to set and check for a flag present.
> No functional change.
> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Suggested-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 28 +++++++++++++++++-----------
>  drivers/iommu/mtk_iommu.h |  7 +------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 88d3df5b91c2..40ca564d97af 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -100,6 +100,15 @@
>  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
>  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
>  
> +#define HAS_4GB_MODE			BIT(0)
> +/* HW will use the EMI clock if there isn't the "bclk". */
> +#define HAS_BCLK			BIT(1)
> +#define HAS_VLD_PA_RNG			BIT(2)
> +#define RESET_AXI			BIT(3)
> +
> +#define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> +		((((pdata)->flags) & (_x)) == (_x))
> +
>  struct mtk_iommu_domain {
>  	struct io_pgtable_cfg		cfg;
>  	struct io_pgtable_ops		*iop;
> @@ -563,7 +572,8 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  			 upper_32_bits(data->protect_base);
>  	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
>  
> -	if (data->enable_4GB && data->plat_data->has_vld_pa_rng) {
> +	if (data->enable_4GB &&
> +	    MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_VLD_PA_RNG)) {
>  		/*
>  		 * If 4GB mode is enabled, the validate PA range is from
>  		 * 0x1_0000_0000 to 0x1_ffff_ffff. here record bit[32:30].
> @@ -573,7 +583,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  	}
>  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
>  
> -	if (data->plat_data->reset_axi) {
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
>  		/* The register is called STANDARD_AXI_MODE in this case */
>  		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
>  	}
> @@ -618,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  
>  	/* Whether the current dram is over 4GB */
>  	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> -	if (!data->plat_data->has_4gb_mode)
> +	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
>  		data->enable_4GB = false;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -631,7 +641,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	if (data->irq < 0)
>  		return data->irq;
>  
> -	if (data->plat_data->has_bclk) {
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
>  		data->bclk = devm_clk_get(dev, "bclk");
>  		if (IS_ERR(data->bclk))
>  			return PTR_ERR(data->bclk);
> @@ -763,23 +773,19 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
>  
>  static const struct mtk_iommu_plat_data mt2712_data = {
>  	.m4u_plat     = M4U_MT2712,
> -	.has_4gb_mode = true,
> -	.has_bclk     = true,
> -	.has_vld_pa_rng   = true,
> +	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
> -	.has_4gb_mode = true,
> -	.has_bclk     = true,
> -	.reset_axi    = true,
> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI,
>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
>  
>  static const struct mtk_iommu_plat_data mt8183_data = {
>  	.m4u_plat     = M4U_MT8183,
> -	.reset_axi    = true,
> +	.flags        = RESET_AXI,
>  	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
>  };
>  
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 7212e6fcf982..5225a9170aaa 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -39,12 +39,7 @@ enum mtk_iommu_plat {
>  
>  struct mtk_iommu_plat_data {
>  	enum mtk_iommu_plat m4u_plat;
> -	bool                has_4gb_mode;
> -
> -	/* HW will use the EMI clock if there isn't the "bclk". */
> -	bool                has_bclk;
> -	bool                has_vld_pa_rng;
> -	bool                reset_axi;
> +	u32                 flags;


How about using bit field instead? eg

  u32 has_bclk:1;

In this way, we don't need to change code.

Joe.C


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
