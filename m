Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE1CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 06:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598762078B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 06:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uXEHNsC7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O46lawTe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598762078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1n+IQNMH3MqBU1X4blpRySv6Pw7pomlgGzZbx8uw8kY=; b=uXEHNsC7/zXY9B
	6fw3HSdwkURBFwO/4+1jXn6cnTkWabHY0dUJIKUBNdR/BeSGUIYie3uj65n4ddzbpMIQFdN8MlRED
	OX/0BH8wNcr15SyIkqqrcG0QBLB2cQR5bogB47Hi5vSMz5uAojdEAV0xonQjSrtymKnMsfHxC1hLi
	uK1H1fu94y2HlZZgG+13GbzVyw4tKMFNYBHduoSFolnFbkeu79GOLnTkwU98X/9hGLT504nUcLTtr
	YZgwrNVkzVDWNXu8LxV6rPtJX5vkUF1RyCDlcjNVpWz/arjkv6iQtlol2AflxVBE8cXyMxWZXYuqT
	XPafQgrKEucw+fSV4ZXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd6a7-0002si-Er; Mon, 25 May 2020 06:27:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd6a4-0002sD-Rm; Mon, 25 May 2020 06:27:26 +0000
X-UUID: c1652ce0a9c0403ba4ca3c6ac127711a-20200524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P1I8TepixZCqsFw/5SDkpIp4t3EBgZjjh17TkYpSIn0=; 
 b=O46lawTeob/nLYdbqT5TlZGztNQNKqS0Nyyrh1WRftTrCWvWvBl3ZjxTqKnHeTtHe7ZyjScxXunVYnttekCchCl3OsTbqDyHn3b9oPelNaQGp7L4hM4TVdu3+KTJnCVy58RpIiTrwHjPEhOiAeYnekxPqmbn9AKeL7Ol/E1LV3U=;
X-UUID: c1652ce0a9c0403ba4ca3c6ac127711a-20200524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1870454957; Sun, 24 May 2020 22:27:22 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 May 2020 23:24:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 May 2020 14:24:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 14:24:04 +0800
Message-ID: <1590387743.13912.11.camel@mhfsdcap03>
Subject: Re: [PATCH v3 4/7] iommu/mediatek: Move inv_sel_reg into the plat_data
From: Yong Wu <yong.wu@mediatek.com>
To: Chao Hao <chao.hao@mediatek.com>
Date: Mon, 25 May 2020 14:22:23 +0800
In-Reply-To: <20200509083654.5178-5-chao.hao@mediatek.com>
References: <20200509083654.5178-1-chao.hao@mediatek.com>
 <20200509083654.5178-5-chao.hao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 92AFEB32F57DC18BC921CA743F7ED817C952B9384976B2765F29D5F4525EE1A02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_232724_905728_64D0910B 
X-CRM114-Status: GOOD (  15.72  )
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jun Yan <jun.yan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-05-09 at 16:36 +0800, Chao Hao wrote:
> For mt6779, MMU_INVLDT_SEL register's offset is changed from

At this patch, the register is still called by "MMU_INV_SEL".

> 0x38 to 0x2c, so we can put inv_sel_reg in the plat_data to
> use it.
> In addition, we renamed it to REG_MMU_INV_SEL_GEN1 and use it
> before mt6779.
> 
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 9 ++++++---
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 9ede327a418d..d73de987f8be 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -37,7 +37,7 @@
>  #define REG_MMU_INVLD_START_A			0x024
>  #define REG_MMU_INVLD_END_A			0x028
>  
> -#define REG_MMU_INV_SEL				0x038
> +#define REG_MMU_INV_SEL_GEN1			0x038
>  #define F_INVLD_EN0				BIT(0)
>  #define F_INVLD_EN1				BIT(1)
>  
> @@ -167,7 +167,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>  
>  	for_each_m4u(data) {
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -			       data->base + REG_MMU_INV_SEL);
> +			       data->base + data->plat_data->inv_sel_reg);
>  		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
>  		wmb(); /* Make sure the tlb flush all done */
>  	}
> @@ -184,7 +184,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  	for_each_m4u(data) {
>  		spin_lock_irqsave(&data->tlb_lock, flags);
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -			       data->base + REG_MMU_INV_SEL);
> +			       data->base + data->plat_data->inv_sel_reg);
>  
>  		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
>  		writel_relaxed(iova + size - 1,
> @@ -784,6 +784,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
>  	.has_vld_pa_rng   = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,

nitpick: align '=' with the next line.

>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
> @@ -792,12 +793,14 @@ static const struct mtk_iommu_plat_data mt8173_data = {
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
>  	.reset_axi    = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,

align '='

>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
>  
>  static const struct mtk_iommu_plat_data mt8183_data = {
>  	.m4u_plat     = M4U_MT8183,
>  	.reset_axi    = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,
>  	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
>  };
>  
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index d711ac630037..afd7a2de5c1e 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -43,6 +43,7 @@ struct mtk_iommu_plat_data {
>  	bool		    has_misc_ctrl;
>  	bool                has_vld_pa_rng;
>  	bool                reset_axi;
> +	u32                 inv_sel_reg;
>  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
