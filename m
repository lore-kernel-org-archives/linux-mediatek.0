Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2501C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:03:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF722067D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWH7L19M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d5UVI0cD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF722067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tUAh9z0iRMBZtuO02U8TfoHNHHreKUDa3HAAO/v7tqU=; b=gWH7L19M+4U9sLGqcJPfOhvKg
	/OgiCrTkgl/iQi/z/tlqt0N8lum1RwTatN6XtfYYm0xayajuXtli3Ybc8dKunNTc4rMwo+bRUNGcc
	qvZm1a+2Op+p5X6rBwu0PoqyeOuzGDp5vRX3MOiQjM7tyNt13YSel4Q8hVn3Mf+DBvEEfyiKGkQMG
	ooGJQOnQhEZNPZeUsvnqncXZxvys8JDiI1Vcpup75GOVEmPgjmYklbSmLUWPuGa6Dtj3GuzUTJ3Wm
	CgkyhLfPTVqcuYAd5GI2yUPteYXimYOfOW0aXlD4jfPgaRQqdgsgSG/auYDOuR9WrIuNNWzFWVocw
	AUlVOP+cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqE39-0003O5-8C; Tue, 30 Jun 2020 11:03:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqE36-0003NC-Uc; Tue, 30 Jun 2020 11:03:38 +0000
X-UUID: 32a3eac0cce14221974703b4a957426e-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=95kISZUSvb1i6OWzMABsaIUaNlAlruFq+xXF6/0ThCQ=; 
 b=d5UVI0cDtCN5mJT9R0W64vMR7q1TVlSamYwBrxPshjmdLLEIgX2V1ZDieKn0VbY3mpE01KjpnKXcOJmX2jQ7XGCv4NvzAZc/8FV2sLjAfJ4lU6856rmkhkxxn4px3AaebX7Z4o39GN0jDBDl6tiDgeLIVsVChX2f/izYb6ZEm3Y=;
X-UUID: 32a3eac0cce14221974703b4a957426e-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1398023672; Tue, 30 Jun 2020 03:03:28 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 04:03:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 19:03:20 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 19:03:19 +0800
Message-ID: <1593514941.13270.6.camel@mbjsdccf07>
Subject: Re: [PATCH v5 09/10] iommu/mediatek: Modify MMU_CTRL register setting
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 30 Jun 2020 19:02:21 +0800
In-Reply-To: <e063a5d2-8edc-9cf9-4872-d3f4abb1e481@gmail.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-10-chao.hao@mediatek.com>
 <e063a5d2-8edc-9cf9-4872-d3f4abb1e481@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
 linux-arm-kernel@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 12:28 +0200, Matthias Brugger wrote:
> 
> On 29/06/2020 09:13, Chao Hao wrote:
> > MT8173 is different from other SoCs for MMU_CTRL register.
> > For mt8173, its bit9 is in_order_write_en and doesn't use its
> > default 1'b1.> For other SoCs, bit[12] represents victim_tlb_en feature and
> > victim_tlb is enable defaultly(bit[12]=1), if we use
> > "regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR", victim_tlb will be
> > disabled, it will drop iommu performace.
> > So we need to deal with the setting of MMU_CTRL separately
> > for mt8173 and others.
> > 
> 
> My proposal to rewrite the commit message:
> 
> The MMU_CTRL regiser of MT8173 is different from other SoCs. The in_order_wr_en
> is bit[9] which is zero by default.
> Other SoCs have the vitcim_tlb_en feature mapped to bit[12]. This bit is set to
> one by default. We need to preserve the bit when setting
> F_MMU_TF_PROT_TO_PROGRAM_ADDR as otherwise the bit will be cleared and IOMMU
> performance will drop.

got it, thanks for your advice very much.

> 
> 
> > Suggested-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Suggested-by: Yong Wu <yong.wu@mediatek.com>
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 8299a3299090..e46e2deee3fd 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -543,11 +543,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >  		return ret;
> >  	}
> >  
> > +	regval = readl_relaxed(data->base + REG_MMU_CTRL_REG);
> 
> The read is only needed in the else branch.
> 
ok, thanks

> >  	if (data->plat_data->m4u_plat == M4U_MT8173)
> >  		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
> >  			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
> >  	else
> > -		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
> > +		regval |= F_MMU_TF_PROT_TO_PROGRAM_ADDR;
> >  	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
> >  
> >  	regval = F_L2_MULIT_HIT_EN |
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
