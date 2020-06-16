Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B856AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:10:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5FB2074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ISAkkoKy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BCD1rIE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5FB2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkXVayTywVBSc+Xxkx7O4Dh8SHUGwA6apV6LmccCQDM=; b=ISAkkoKyD3XmA/
	60RkzZapPW7CSOZDXVumuLAcZvqCx9oOIdaG5fr2+0zqYu96Gjlt2YeCP0j8LXC5MGCmI65+tcs5E
	xiGdvwVbhor4VNYlaBanR24RLciWf6Ip5GNN7p9qpzNxbRr0i1TZ04rq/KoZBLTWTmN54nX2cLmOu
	DTjREL0uXMPP9K1nBsGcoC+tpKvXIyq4A8mn5aNp7JDY+PvMnfMbGD+lR7+raPnsnOJtAAlSaMF34
	bF1oVcXA5DPwOsGd14hZpsfiSunYMstyZDW+hwwv3pAlvSibCl8wvR+Y6enyYBpQ5fsT71aI92VHq
	+X2VfLxx6cVJRyZ12JdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl4nx-0001l0-5w; Tue, 16 Jun 2020 06:10:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl4nt-0001k3-UD; Tue, 16 Jun 2020 06:10:39 +0000
X-UUID: 5d4de66be4c842d3817404164b4b718e-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o0aNLsq8928JAJ6+k5VSSOBMViWOoytBxgKCL5V42kA=; 
 b=BCD1rIE23lWu54UGyS4jCbiPESpXVCF1rQKiNCfC2v8nfbvHHF63eyVQoyv8TVoKv1Fv3BBKa9FdRRUa7uLCfwNs6wBPripmw6f9QUojzGad0Gt8QHPJ+FAnmHAyMpMs4qXOi+DTs6jXp0HC7UBWhP2o1EDSsx+mhK/hx9xankk=;
X-UUID: 5d4de66be4c842d3817404164b4b718e-20200615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1096376262; Mon, 15 Jun 2020 22:10:32 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 23:10:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 14:10:26 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 14:10:28 +0800
Message-ID: <1592287811.29899.3.camel@mbjsdccf07>
Subject: Re: [PATCH v3 3/7] iommu/mediatek: Disable STANDARD_AXI_MODE in
 MISC_CTRL
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Tue, 16 Jun 2020 14:10:11 +0800
In-Reply-To: <1590387275.13912.7.camel@mhfsdcap03>
References: <20200509083654.5178-1-chao.hao@mediatek.com>
 <20200509083654.5178-4-chao.hao@mediatek.com>
 <1590387275.13912.7.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_231037_974025_FAD0F3F5 
X-CRM114-Status: GOOD (  17.17  )
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

On Mon, 2020-05-25 at 14:14 +0800, Yong Wu wrote:
> On Sat, 2020-05-09 at 16:36 +0800, Chao Hao wrote:
> > In order to improve performance, we always disable STANDARD_AXI_MODE in
> > MISC_CTRL.
> > 
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 8 +++++++-
> >  drivers/iommu/mtk_iommu.h | 1 +
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index e7e7c7695ed1..9ede327a418d 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -42,6 +42,8 @@
> >  #define F_INVLD_EN1				BIT(1)
> >  
> >  #define REG_MMU_MISC_CTRL			0x048
> > +#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> > +
> >  #define REG_MMU_DCM_DIS				0x050
> >  
> >  #define REG_MMU_CTRL_REG			0x110
> > @@ -585,7 +587,11 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >  	}
> >  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> >  
> > -	if (data->plat_data->reset_axi) {
> > +	if (data->plat_data->has_misc_ctrl) {
> > +		regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> > +		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> > +		writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> > +	} else if (data->plat_data->reset_axi) {
> >  		/* The register is called STANDARD_AXI_MODE in this case */
> >  		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
> >  	}
> 
> 
> 0x48 is either STANDARD_AXI_MODE or MISC_CTRL.
> 
> Thus, 
> 
> if (data->plat_data->reset_axi) {
>    xxx
> } else {  /* MISC_CTRL */
>    xxx
> }
> 
> No need add "has_misc_ctrl".

Thanks for you comment.
Only mm_iommu/m4u needs to set MISC_CTRL register and apu_iommu don't
need to set it. So I think we need to use has_misc_ctrl to distinguish
it.

> 
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index 1b6ea839b92c..d711ac630037 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -40,6 +40,7 @@ struct mtk_iommu_plat_data {
> >  
> >  	/* HW will use the EMI clock if there isn't the "bclk". */
> >  	bool                has_bclk;
> > +	bool		    has_misc_ctrl;
> >  	bool                has_vld_pa_rng;
> >  	bool                reset_axi;
> >  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
