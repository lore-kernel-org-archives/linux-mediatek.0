Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8132BC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaJpxvMmSMlE6jPyK89++NPWnNSGr318dNb0wKR9KJw=; b=aVRX+4fymzV6EXdzEUrjUixnjt
	xbfHQEh4g/FpeyBWGhfeqTaqEoKQBbfFCLrbr15pGZcClvTYiiY46VAmW8CQ8i07GT2Lz7tncQjKQ
	mdytmfUWdlTqG2gqTI00CP49Cc6yDhUK6WhHJThvfuY4dcpAstisSUlFHk6jMdc0a2j6siaGOcg/p
	sTWDNxlqvSmrGsFF3nk2ar20iSmLQp3nH3+aZanvCTn98+yY44QUoOEkX6yt6RxqdRPbvpEOvwedY
	yYePY6wPtP85so4X85b4gHtHWxTWWwZ5/iG7ULJuGF25a5lY5e0UUiN0f8z7tuzLNbLbvK+59mS+1
	IP/wIF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD2a-0014vL-EM; Thu, 08 Sep 2022 08:37:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD2K-0014oM-Fv; Thu, 08 Sep 2022 08:37:25 +0000
X-UUID: ff957787617a45ecbcc2806c65159485-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=AaJpxvMmSMlE6jPyK89++NPWnNSGr318dNb0wKR9KJw=;
	b=kurggbp2OtR4MysjhV7fxiXxTSGoQJ6YHME9TudxJD+VkK0PDLg2T86rkdLravGh8kgWEGlPe5+tZuzP4iReX0P2Pihla6BHibZkekM8+Yuvh8etrcoRfPEz0N8O52x+hh6eHvESRk8ufR5r/HQZ1STZnvkLwz/judIdjbcmTsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d3d49e7d-150f-4e61-b046-2bc0904c4159,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:4830a121-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ff957787617a45ecbcc2806c65159485-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1556519716; Thu, 08 Sep 2022 01:37:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 15:46:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 8 Sep 2022 15:46:39 +0800
Message-ID: <0d3694ce8710128ec338fba4656a65859953bb6a.camel@mediatek.com>
Subject: Re: [PATCH v2 2/3] iommu/mediatek: Add enable IOMMU SMC command for
 INFRA master
From: Chengci.Xu <chengci.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 8 Sep 2022 15:46:38 +0800
In-Reply-To: <8e398e71-1283-b5d7-2b17-958a25563c25@collabora.com>
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
	 <20220831125502.7818-3-chengci.xu@mediatek.com>
	 <8e398e71-1283-b5d7-2b17-958a25563c25@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_013724_552399_2192B15B 
X-CRM114-Status: GOOD (  25.17  )
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

On Fri, 2022-09-02 at 11:00 +0200, AngeloGioacchino Del Regno wrote:
> Il 31/08/22 14:55, Chengci.Xu ha scritto:
> > The register which can enable IOMMU for INFRA master should be
> > setted
> > in secure world for security concerns. Therefore, we add a SMC
> > command
> > for INFRA master to enable/disable INFRA IOMMU in ATF. This
> > function is
> > prepared for MT8188.
> > 
> > Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c  | 34 ++++++++++++++++++++++++++-------
> > -
> >   include/soc/mediatek/smi.h |  1 +
> >   2 files changed, 27 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 7e363b1f24df..6fe780783ec8 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2015-2016 MediaTek Inc.
> >    * Author: Yong Wu <yong.wu@mediatek.com>
> >    */
> > +#include <linux/arm-smccc.h>
> >   #include <linux/bitfield.h>
> >   #include <linux/bug.h>
> >   #include <linux/clk.h>
> > @@ -28,6 +29,7 @@
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/soc/mediatek/infracfg.h>
> > +#include <linux/soc/mediatek/mtk_sip_svc.h>
> >   #include <asm/barrier.h>
> >   #include <soc/mediatek/smi.h>
> >   
> > @@ -138,6 +140,7 @@
> >   #define PM_CLK_AO			BIT(15)
> >   #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
> >   #define PGTABLE_PA_35_EN		BIT(17)
> > +#define CFG_IFA_MASTER_IN_ATF		BIT(18)
> >   
> >   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
> >   				((((pdata)->flags) & (mask)) == (_x))
> > @@ -554,14 +557,29 @@ static int mtk_iommu_config(struct
> > mtk_iommu_data *data, struct device *dev,
> >   			else
> >   				larb_mmu->mmu &=
> > ~MTK_SMI_MMU_EN(portid);
> >   		} else if (MTK_IOMMU_IS_TYPE(data->plat_data,
> > MTK_IOMMU_TYPE_INFRA)) {
> > -			peri_mmuen_msk = BIT(portid);
> > -			/* PCI dev has only one output id, enable the
> > next writing bit for PCIe */
> > -			if (dev_is_pci(dev))
> > -				peri_mmuen_msk |= BIT(portid + 1);
> > -
> > -			peri_mmuen = enable ? peri_mmuen_msk : 0;
> > -			ret = regmap_update_bits(data->pericfg,
> > PERICFG_IOMMU_1,
> > -						 peri_mmuen_msk,
> > peri_mmuen);
> > +			if (MTK_IOMMU_HAS_FLAG(data->plat_data,
> > CFG_IFA_MASTER_IN_ATF)) {
> > +				struct arm_smccc_res res;
> > +
> > +				portid = MTK_M4U_TO_PORT(fwspec-
> > >ids[i]);
> 
> This assignment is redundant, as portid is initialized to the same
> value
> just a few lines before. Please drop it.
> 
> Everything else looks good.
> 
> Regards,
> Angelo

Thanks for your review. This assignment will be dropped in the next
version.

Best regards,
Chengci Xu

> 
> > +				arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONT
> > ROL,
> > +					      IOMMU_ATF_CMD_CONFIG_INFR
> > A_IOMMU,
> > +					      portid, enable, 0, 0, 0,
> > 0, &res);
> > +				ret = (int)res.a0;
> 
> 


