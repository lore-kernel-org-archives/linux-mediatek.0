Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12F9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD96C2067D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFlZjKjX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dUrqQqJH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD96C2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gh9S/jMwRUL3DdVQ/IAQ478KUQxNU7hgegPXLnmn134=; b=PFlZjKjXJtGTQtMHtt6vcRubC
	MNd4PrfxCzIp0T13uzVTYaGXtnJJeu9EfLX7KmedeK1i6u9uSUpg7iO0gWdgf7ZASEvS27tuel+jm
	sYIwIXEK2glraN6JwADC0pPeW08wY8lYHAq6Vm1y900xeMLFIcsEI+o1IOAZ64Shb06LHw5Ys2KZM
	bcxDIsLNSXXE+a3yu6cW3f57+RbGO/+IwnNnHii34fbLiEez0rlL3HhGb/PvKOGzq/3Dc4gBl3Fxw
	KimI8LewJt/LXNGP9jnDukaWB7vzAQ4YuwxF/vmRID4mzYR/sd1QoR8Qyr5e5BJEn+lvR9JsU5+92
	TSvHWNJyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt7kS-0004nj-Pm; Wed, 08 Jul 2020 10:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt7kP-0004me-M9; Wed, 08 Jul 2020 10:56:18 +0000
X-UUID: 3237a941086e46ee8fdb0474df4292f6-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8dImjezaDRln9/Yyf6oNcjPYX7KgWdZn4Xoqp2PpPSY=; 
 b=dUrqQqJHdCnJNgDfpdPjGHbAT7DWetdOfIoZWnHAa1Blod49L7X5lITvz3y65cDNqXYKbMnvJy3S20JIBx1Te31A2EtuX3JrtmFveQ5uyqNx/7TML1DIQ8Vnnz3KxiNRcnvPEXbldsImEv7OhwaV93ApbD7WNUG32Rky/Aukw3g=;
X-UUID: 3237a941086e46ee8fdb0474df4292f6-20200708
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 163814751; Wed, 08 Jul 2020 02:45:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:45:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:45:37 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jul 2020 18:45:38 +0800
Message-ID: <1594205054.15266.5.camel@mbjsdccf07>
Subject: Re: [PATCH v6 03/10] iommu/mediatek: Use a u32 flags to describe
 different HW features
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen
 <yingjoe.chen@mediatek.com>
Date: Wed, 8 Jul 2020 18:44:14 +0800
In-Reply-To: <bce3e1e0-f0b0-8c77-d966-3b6e37b3b647@gmail.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200703044127.27438-4-chao.hao@mediatek.com>
 <1593825398.4355.1.camel@mtksdaap41>
 <bce3e1e0-f0b0-8c77-d966-3b6e37b3b647@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6F3F116F4E5F81A05C52BC326B71A4E52496CE3118B5B56139A8833B406E13C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_065617_932476_D7313AC1 
X-CRM114-Status: GOOD (  27.58  )
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
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias and Yingjoe,
Thanks for your comments!

On Mon, 2020-07-06 at 17:17 +0200, Matthias Brugger wrote:
> 
> On 04/07/2020 03:16, Yingjoe Chen wrote:
> > On Fri, 2020-07-03 at 12:41 +0800, Chao Hao wrote:
> >> Given the fact that we are adding more and more plat_data bool values,
> >> it would make sense to use a u32 flags register and add the appropriate
> >> macro definitions to set and check for a flag present.
> >> No functional change.
> >>
> >> Cc: Yong Wu <yong.wu@mediatek.com>
> >> Suggested-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> >> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> ---
> >>  drivers/iommu/mtk_iommu.c | 28 +++++++++++++++++-----------
> >>  drivers/iommu/mtk_iommu.h |  7 +------
> >>  2 files changed, 18 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >> index 88d3df5b91c2..40ca564d97af 100644
> >> --- a/drivers/iommu/mtk_iommu.c
> >> +++ b/drivers/iommu/mtk_iommu.c
> >> @@ -100,6 +100,15 @@
> >>  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
> >>  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> >>  
> >> +#define HAS_4GB_MODE			BIT(0)
> >> +/* HW will use the EMI clock if there isn't the "bclk". */
> >> +#define HAS_BCLK			BIT(1)
> >> +#define HAS_VLD_PA_RNG			BIT(2)
> >> +#define RESET_AXI			BIT(3)
> >> +
> >> +#define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> >> +		((((pdata)->flags) & (_x)) == (_x))
> >> +
> >>  struct mtk_iommu_domain {
> >>  	struct io_pgtable_cfg		cfg;
> >>  	struct io_pgtable_ops		*iop;
> >> @@ -563,7 +572,8 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>  			 upper_32_bits(data->protect_base);
> >>  	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
> >>  
> >> -	if (data->enable_4GB && data->plat_data->has_vld_pa_rng) {
> >> +	if (data->enable_4GB &&
> >> +	    MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_VLD_PA_RNG)) {
> >>  		/*
> >>  		 * If 4GB mode is enabled, the validate PA range is from
> >>  		 * 0x1_0000_0000 to 0x1_ffff_ffff. here record bit[32:30].
> >> @@ -573,7 +583,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>  	}
> >>  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> >>  
> >> -	if (data->plat_data->reset_axi) {
> >> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
> >>  		/* The register is called STANDARD_AXI_MODE in this case */
> >>  		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
> >>  	}
> >> @@ -618,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >>  
> >>  	/* Whether the current dram is over 4GB */
> >>  	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> >> -	if (!data->plat_data->has_4gb_mode)
> >> +	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
> >>  		data->enable_4GB = false;
> >>  
> >>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> @@ -631,7 +641,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >>  	if (data->irq < 0)
> >>  		return data->irq;
> >>  
> >> -	if (data->plat_data->has_bclk) {
> >> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
> >>  		data->bclk = devm_clk_get(dev, "bclk");
> >>  		if (IS_ERR(data->bclk))
> >>  			return PTR_ERR(data->bclk);
> >> @@ -763,23 +773,19 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
> >>  
> >>  static const struct mtk_iommu_plat_data mt2712_data = {
> >>  	.m4u_plat     = M4U_MT2712,
> >> -	.has_4gb_mode = true,
> >> -	.has_bclk     = true,
> >> -	.has_vld_pa_rng   = true,
> >> +	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
> >>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
> >>  };
> >>  
> >>  static const struct mtk_iommu_plat_data mt8173_data = {
> >>  	.m4u_plat     = M4U_MT8173,
> >> -	.has_4gb_mode = true,
> >> -	.has_bclk     = true,
> >> -	.reset_axi    = true,
> >> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI,
> >>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
> >>  };
> >>  
> >>  static const struct mtk_iommu_plat_data mt8183_data = {
> >>  	.m4u_plat     = M4U_MT8183,
> >> -	.reset_axi    = true,
> >> +	.flags        = RESET_AXI,
> >>  	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
> >>  };
> >>  
> >> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> >> index 7212e6fcf982..5225a9170aaa 100644
> >> --- a/drivers/iommu/mtk_iommu.h
> >> +++ b/drivers/iommu/mtk_iommu.h
> >> @@ -39,12 +39,7 @@ enum mtk_iommu_plat {
> >>  
> >>  struct mtk_iommu_plat_data {
> >>  	enum mtk_iommu_plat m4u_plat;
> >> -	bool                has_4gb_mode;
> >> -
> >> -	/* HW will use the EMI clock if there isn't the "bclk". */
> >> -	bool                has_bclk;
> >> -	bool                has_vld_pa_rng;
> >> -	bool                reset_axi;
> >> +	u32                 flags;
> > 
> > 
> > How about using bit field instead? eg
> > 
> >   u32 has_bclk:1;
> > 
> > In this way, we don't need to change code.
> > 
> 
> Actually I proposed to use the flag approach because I didn't want to bloat the
> mtk_iommu_plat_data structure with new variables for every new feature, being it
> a bit field or a bool.
> Regards,
> Matthias

@Yingjoe,
If you don't have other concerns, we will use Matthias's proposal,
thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
