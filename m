Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98365C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:52:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B61208B8
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCWllZZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u41T8bgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B61208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EIk92M6pWQCjjmYxPqFfd6N/DoMSWP5xvsvUXMyKuk=; b=nCWllZZuMfHu6e
	QKH1cFJdaxosUTxLHZ3p0mTP+Mygb1Q1CriUW+4LQIXl5ywmtzZ2l+TO5J5no/2IaDs5xLdkZTcVk
	0NILvmwVaFsJ66C+9xHDyodIlZwNe+TIUfDv2P9UOTnaYYon4Wc1QfF/bM3nCzDWUiS/MrohaYHU/
	RDN0caGQgWXED47+Ba+evQ4VNk6HEFTY1pvcAAeIT2cn+vQFkN9GjgBmbgaXT1texbvRwqnkWOhG1
	otD655DNAJk4e81YiePCrCh5LlpPEysl6+M44iPe5/YZeFB2TahSpxvASK6Dftrk7qMjejcNvN3WV
	RJO7/8bKPbkr/SgmUhvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmEdG-0000Ex-0p; Fri, 19 Jun 2020 10:52:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmEd3-0008WJ-BO; Fri, 19 Jun 2020 10:52:18 +0000
X-UUID: 50802570af7d4ff3b65cc8c556800f6f-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gLyZez7zoj9lEggZKjZhObz4KPttckUsAiOpo+MoMv8=; 
 b=u41T8bgvRxbYNhF5iQVVk9FXc6UvS0j/TVxf9jjgfTYUEvIpqYxdi9DtRJYFc4mruH/tkp3pffkU4VdX+ea5yNlDI85BUHBsrAU9SJLoKwbK46/wJVgOP27516TZimen906NIWrPxSePZCMT0lIr/b4ndjoABmnWnlSW7RXMzM4=;
X-UUID: 50802570af7d4ff3b65cc8c556800f6f-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1348649251; Fri, 19 Jun 2020 02:50:52 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 03:50:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 18:50:50 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 18:50:49 +0800
Message-ID: <1592563824.5692.1.camel@mbjsdccf07>
Subject: Re: [PATCH v4 7/7] iommu/mediatek: Add mt6779 basic support
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 19 Jun 2020 18:50:24 +0800
In-Reply-To: <9618cc95-99ac-63d0-f502-335e38819842@gmail.com>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
 <20200617030029.4082-8-chao.hao@mediatek.com>
 <64f63ccc-92a4-191c-3566-de00c9e04ca2@gmail.com>
 <1592481247.12647.9.camel@mbjsdccf07>
 <9618cc95-99ac-63d0-f502-335e38819842@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_035213_418023_09E2DA10 
X-CRM114-Status: GOOD (  25.74  )
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
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-06-18 at 18:00 +0200, Matthias Brugger wrote:
> 
> On 18/06/2020 13:54, chao hao wrote:
> > On Wed, 2020-06-17 at 11:33 +0200, Matthias Brugger wrote:
> >>
> >> On 17/06/2020 05:00, Chao Hao wrote:
> >>> 1. Start from mt6779, INVLDT_SEL move to offset=0x2c, so we add
> >>>    REG_MMU_INV_SEL_GEN2 definition and mt6779 uses it.
> >>> 2. Change PROTECT_PA_ALIGN from 128 byte to 256 byte.
> >>> 3. For REG_MMU_CTRL_REG register, we only need to change bit[2:0],
> >>>    others bits keep default value, ex: enable victim tlb.
> >>> 4. Add mt6779_data to support mm_iommu HW init.
> >>>
> >>> Change since v3:
> >>> 1. When setting MMU_CTRL_REG, we don't need to include mt8173.
> >>>
> >>> Cc: Yong Wu <yong.wu@mediatek.com>
> >>> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> >>> ---
> >>>  drivers/iommu/mtk_iommu.c | 20 ++++++++++++++++++--
> >>>  drivers/iommu/mtk_iommu.h |  1 +
> >>>  2 files changed, 19 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >>> index c706bca6487e..def2e996683f 100644
> >>> --- a/drivers/iommu/mtk_iommu.c
> >>> +++ b/drivers/iommu/mtk_iommu.c
> >>> @@ -37,6 +37,11 @@
> >>>  #define REG_MMU_INVLD_START_A			0x024
> >>>  #define REG_MMU_INVLD_END_A			0x028
> >>>  
> >>> +/* In latest Coda, MMU_INV_SEL's offset is changed to 0x02c.
> >>> + * So we named offset = 0x02c to "REG_MMU_INV_SEL_GEN2"
> >>> + * and offset = 0x038 to "REG_MMU_INV_SEL_GEN1".
> >>> + */
> >>
> >> Please delete the comment, this should be understandable from the git history
> > 
> > ok, thanks
> > 
> >>
> >>> +#define REG_MMU_INV_SEL_GEN2			0x02c
> >>>  #define REG_MMU_INV_SEL_GEN1			0x038
> >>>  #define F_INVLD_EN0				BIT(0)
> >>>  #define F_INVLD_EN1				BIT(1)
> >>> @@ -98,7 +103,7 @@
> >>>  #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
> >>>  #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
> >>>  
> >>> -#define MTK_PROTECT_PA_ALIGN			128
> >>> +#define MTK_PROTECT_PA_ALIGN			256
> >>
> >> Do we need 512 bytes for all gen2 IOMMUs?
> >> I'm not sure if we should add this in plat_data or if we should just bump up the
> >> value for all SoCs.
> >> In both cases this should be a separate patch.
> >>
> > From mt6779, MTK_PROTECT_PA_ALIGN is extend to 256 bytes and don't be
> > changed for a long time from our HW designer comment. The legacy iommu
> > also can use it, mabye it doesn't set it by platform.
> > 
> 
> Ok then just bump it to 256 in a new patch. Thanks for clarification.

  Ok, thanks

> > 
> >>>  
> >>>  /*
> >>>   * Get the local arbiter ID and the portid within the larb arbiter
> >>> @@ -543,11 +548,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>>  		return ret;
> >>>  	}
> >>>  
> >>> +	regval = readl_relaxed(data->base + REG_MMU_CTRL_REG);
> >>>  	if (data->plat_data->m4u_plat == M4U_MT8173)
> >>>  		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
> >>>  			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
> >>>  	else
> >>> -		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
> >>> +		regval |= F_MMU_TF_PROT_TO_PROGRAM_ADDR;
> >>
> >> Why do we change this, is it that the bootloader for mt6779 set some values in
> >> the register we have to keep? In this case I think we should update the regval
> >> accordingly.
> > 
> > For REG_MMU_CTRL_REG, bit[12] represents victim_tlb_en feature and
> > victim_tlb is enable defaultly(bit[12]=1),but if we use "regval =
> > F_MMU_TF_PROT_TO_PROGRAM_ADDR", victim_tlb will disable, it will drop
> > iommu performace for mt6779
> > 
> 
> Got it. Please put that in a separate patch then.
> 
  Ok, thanks

> Regards,
> Matthias
> 
> > 
> >>
> >>>  	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
> >>>  
> >>>  	regval = F_L2_MULIT_HIT_EN |
> >>> @@ -797,6 +803,15 @@ static const struct mtk_iommu_plat_data mt2712_data = {
> >>>  	.larbid_remap   = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
> >>>  };
> >>>  
> >>> +static const struct mtk_iommu_plat_data mt6779_data = {
> >>> +	.m4u_plat      = M4U_MT6779,
> >>> +	.has_sub_comm  = true,
> >>> +	.has_wr_len    = true,
> >>> +	.has_misc_ctrl = true,
> >>> +	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
> >>> +	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
> >>> +};
> >>> +
> >>>  static const struct mtk_iommu_plat_data mt8173_data = {
> >>>  	.m4u_plat     = M4U_MT8173,
> >>>  	.has_4gb_mode = true,
> >>> @@ -815,6 +830,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
> >>>  
> >>>  static const struct of_device_id mtk_iommu_of_ids[] = {
> >>>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
> >>> +	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
> >>>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
> >>>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
> >>>  	{}
> >>> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> >>> index 9971cedd72ea..fb79e710c8d9 100644
> >>> --- a/drivers/iommu/mtk_iommu.h
> >>> +++ b/drivers/iommu/mtk_iommu.h
> >>> @@ -31,6 +31,7 @@ struct mtk_iommu_suspend_reg {
> >>>  enum mtk_iommu_plat {
> >>>  	M4U_MT2701,
> >>>  	M4U_MT2712,
> >>> +	M4U_MT6779,
> >>>  	M4U_MT8173,
> >>>  	M4U_MT8183,
> >>>  };
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
