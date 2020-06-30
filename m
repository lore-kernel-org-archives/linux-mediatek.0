Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B32C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:57:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63D5207E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGY4qIq3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iaPhi8vY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C63D5207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XJVzq8XE8++sTvv+vBedb8/72uCZHGzEwF/9RLeuvb0=; b=sGY4qIq3l36KDViqkjRdtyR51
	nstKFyuWNV74Xblj+BqyFwxHYUbjfjMxLxVhQV57pLthcbwDs+BU8XzTgHjiG14s28pXplT+FOfq3
	Q/ySZ8VGj2FBSMDC8G1GMC6ShzzwGhqVfe0gwmL4ah39A/DiIJYI8IwsgPLYpfC8ZhQb9f0WkDu2w
	r1khCSHaosi3YBTnekvZWSfBmfbBBxgSv83sou0jQQMbAv5uJiRIlvLOS0DmA9/LHS9W9dwzHiORm
	6QVa3mji0sSxZcz/AR99ElopRvgD8WAWwGj8y/uWunNoNlUKmqzStRUNBdeKGxdAbAv8zkLSehUYd
	J25B6XEEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqEsx-0000cc-Kc; Tue, 30 Jun 2020 11:57:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqEsu-0000bA-PO; Tue, 30 Jun 2020 11:57:09 +0000
X-UUID: e72be7a912fb492aa2942039c68f396d-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HEj432Y5eOzIfGm1gnGAexzqR2J4nebaJR/lmOThafM=; 
 b=iaPhi8vYm/WboC/M8DBtIRW5z2t/Q4vEvcu+KIq7F/GFaRFBgUpyPHn3hzBo8yde7+CSONUhbdZTBojdg+AU02TlJOW/iYGYoq4rZGeQZcxSsTFCZ7YiN9OME+29DGGxAbjzZuW+LAoTjruifrLxhEEF8gB6NXocY5E2xBFTg7E=;
X-UUID: e72be7a912fb492aa2942039c68f396d-20200630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1748413336; Tue, 30 Jun 2020 03:56:50 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 04:56:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 19:56:47 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 19:56:47 +0800
Message-ID: <1593518147.7022.3.camel@mbjsdccf07>
Subject: Re: [PATCH v5 03/10] iommu/mediatek: Modify the usage of
 mtk_iommu_plat_data structure
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Tue, 30 Jun 2020 19:55:47 +0800
In-Reply-To: <1593514600.24171.26.camel@mhfsdcap03>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-4-chao.hao@mediatek.com>
 <1593514600.24171.26.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09C13065B4FA34BD99E063267093959635537950F689927C89C089AD58FAF52D2000:8
X-MTK: N
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
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-30 at 18:56 +0800, Yong Wu wrote:
> Hi Chao,
> 
> This is also ok for me. Only two format nitpick.
> 
> On Mon, 2020-06-29 at 15:13 +0800, Chao Hao wrote:
> > Given the fact that we are adding more and more plat_data bool values,
> > it would make sense to use a u32 flags register and add the appropriate
> > macro definitions to set and check for a flag present.
> > No functional change.
> > 
> > Suggested-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> 
> [snip]
> 
> >  static const struct mtk_iommu_plat_data mt2712_data = {
> >  	.m4u_plat     = M4U_MT2712,
> > -	.has_4gb_mode = true,
> > -	.has_bclk     = true,
> > -	.has_vld_pa_rng   = true,
> > +	.flags        = HAS_4GB_MODE |
> > +			HAS_BCLK |
> > +			HAS_VLD_PA_RNG,
> 
> short enough. we can put it in one line?

ok, I will try to put it in one line in next version, thanks

> 
> >  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
> >  };
> >  
> >  static const struct mtk_iommu_plat_data mt8173_data = {
> >  	.m4u_plat     = M4U_MT8173,
> > -	.has_4gb_mode = true,
> > -	.has_bclk     = true,
> > -	.reset_axi    = true,
> > +	.flags	      = HAS_4GB_MODE |
> > +			HAS_BCLK |
> > +			RESET_AXI,
> >  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
> >  };
> >  
> >  static const struct mtk_iommu_plat_data mt8183_data = {
> >  	.m4u_plat     = M4U_MT8183,
> > -	.reset_axi    = true,
> > +	.flags        = RESET_AXI,
> >  	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
> >  };
> >  
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index 1b6ea839b92c..7cc39f729263 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -17,6 +17,15 @@
> >  #include <linux/spinlock.h>
> >  #include <soc/mediatek/smi.h>
> >  
> > +#define HAS_4GB_MODE			BIT(0)
> > +/* HW will use the EMI clock if there isn't the "bclk". */
> > +#define HAS_BCLK			BIT(1)
> > +#define HAS_VLD_PA_RNG			BIT(2)
> > +#define RESET_AXI			BIT(3)
> > +
> > +#define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> > +		((((pdata)->flags) & (_x)) == (_x))
> 
> If these definitions are not used in mtk_iommu_v1.c(also no this plan),
> then we can put them in the mtk_iommu.c.
> 

ok, mtk_iommu_v1.c doesn't use these definitions.
I will move them to mtk_iommu.c in next version, thanks.

> 
> BTW, the patch title "modify the usage of mtk_iommu_plat_data structure"
> isn't so clear, we could write what the detailed modification is.
> something like:
> iommu/mediatek: Use a u32 flags to describe different HW features
> 
got it , thanks for you advice.


> > +
> >  struct mtk_iommu_suspend_reg {
> >  	u32				misc_ctrl;
> >  	u32				dcm_dis;
> > @@ -36,12 +45,7 @@ enum mtk_iommu_plat {
> >  
> >  struct mtk_iommu_plat_data {
> >  	enum mtk_iommu_plat m4u_plat;
> > -	bool                has_4gb_mode;
> > -
> > -	/* HW will use the EMI clock if there isn't the "bclk". */
> > -	bool                has_bclk;
> > -	bool                has_vld_pa_rng;
> > -	bool                reset_axi;
> > +	u32                 flags;
> >  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> >  };
> >  
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
