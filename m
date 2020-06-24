Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D890C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:41:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5909A206FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lw0qUqp2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pYOAFoAu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5909A206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCIsp4C1tsT0NI42hqLlxF8ggWMqZNJIB0RwmUBP338=; b=lw0qUqp2Aet3zydSzzGeSRCp5
	ZKhAKvVHai3jJ2U2Isny6taC4J/9LWzR1PelElDaJmp5Mo3ZxHoR1tHRov16bSpnIlSNu7OaxKWnF
	7GPG7YgLsiWLMVRpauRGj3yf/TbjZgQztDasHooLZHIrwacwhP4eQRJ4CyEPGoxBgJMYtux+Y0IYu
	5diY5pQE3o2kpAbUxKEmndazhOfhP8FQPGCWj8hHthjG7GO4AU7b/av7QH5u4cvgjXSizLEwty/3k
	O4o9gyf2l266sGys8yHEwoIKG4bS4fvPQXstzuPsXtkfRFh3y77pNJxdrmrPdV0bK3/NU1xLiFJ9d
	MdVF9BgSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnz5X-0002Kb-OQ; Wed, 24 Jun 2020 06:40:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnz5U-0002Gg-Ef; Wed, 24 Jun 2020 06:40:49 +0000
X-UUID: b2e3ae5cd51e487e8357fed16dfbd94b-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C01wP7O41EMQ3vJzTY+vMBOf3dw7xo6jocNHUFkcK60=; 
 b=pYOAFoAuAPMKJOUpuxG+ASLryj8g+nVmFgn2Rg/9Mfvm7FwXtiScWEMX4Aeh062CDT4daPemOheV2tCJ7IcreiAbc3WpayoYeQxw+r3sFQ5318KBye2ride6ZpeZLVvqYTpP2lQcoXZ98ZiwioXD01Rx7/K13LjTrsZVOfp4o3w=;
X-UUID: b2e3ae5cd51e487e8357fed16dfbd94b-20200623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 550944001; Tue, 23 Jun 2020 22:40:20 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 23:40:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 14:40:35 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 14:40:34 +0800
Message-ID: <1592980794.24677.4.camel@mbjsdccf07>
Subject: Re: [PATCH v4 3/7] iommu/mediatek: Set MISC_CTRL register
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Wed, 24 Jun 2020 14:39:54 +0800
In-Reply-To: <1592618616.3951.12.camel@mhfsdcap03>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
 <20200617030029.4082-4-chao.hao@mediatek.com>
 <aaf422f5-2ac8-252d-a064-0c1246e09acc@gmail.com>
 <1592480963.12647.5.camel@mbjsdccf07> <1592618616.3951.12.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F70B4854FFD7F8C1D58622D9F607A9A3ED68DABFF7765DD65D58A3DE4CB487062000:8
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
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-06-20 at 10:03 +0800, Yong Wu wrote:
> Hi Chao,
> 
> On Thu, 2020-06-18 at 19:49 +0800, chao hao wrote: 
> > On Wed, 2020-06-17 at 11:34 +0200, Matthias Brugger wrote:
> 
> [snip]
> 
> > > >  
> > > >  #define REG_MMU_MISC_CTRL			0x048
> > > > +#define F_MMU_IN_ORDER_WR_EN			(BIT(1) | BIT(17))
> > > > +#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> > > > +
> > > >  #define REG_MMU_DCM_DIS				0x050
> > > >  
> > > >  #define REG_MMU_CTRL_REG			0x110
> > > > @@ -578,6 +581,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> > > >  		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
> > > >  	}
> > > >  
> > > > +	if (data->plat_data->has_misc_ctrl) {
> > > 
> > > That's confusing. We renamed the register to misc_ctrl, but it's present in all
> > > SoCs. We should find a better name for this flag to describe what the hardware
> > > supports.
> > > 
> > 
> > ok, thanks for you advice, I will rename it in next version.
> > ex:has_perf_req(has performance requirement)
> > 
> > 
> > > Regards,
> > > Matthias
> > > 
> > > > +		/* For mm_iommu, it can improve performance by the setting */
> > > > +		regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> > > > +		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> > > > +		regval &= ~F_MMU_IN_ORDER_WR_EN;
> 
> Note: mt2712 also is MISC_CTRL register, but it don't use this
> in_order setting.
> 
> As commented in v3. 0x48 is either STANDARD_AXI_MODE or MISC_CTRL
> register. No need two flags(reset_axi/has_xx) for it.
> 
> something like:
> 
> regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> if (reset_axi) {
> regval = 0;
> } else {   /* MISC_CTRL */
> if (!apu[1])
> regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> if (out_order_en)
> regval &= ~F_MMU_IN_ORDER_WR_EN;
> }
> writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> 
> 
> [1] Your current patch doesn't support apu-iommu, thus, add it when
> necessary.

ok, the patchset don't need to "if (!apu[1])", I will fix it in next
version. thanks


> > > > +		writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> > > > +	}
> > > > +
> > > >  	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
> > > >  			     dev_name(data->dev), (void *)data)) {
> > > >  		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
> > > > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > > > index 1b6ea839b92c..d711ac630037 100644
> > > > --- a/drivers/iommu/mtk_iommu.h
> > > > +++ b/drivers/iommu/mtk_iommu.h
> > > > @@ -40,6 +40,7 @@ struct mtk_iommu_plat_data {
> > > >  
> > > >  	/* HW will use the EMI clock if there isn't the "bclk". */
> > > >  	bool                has_bclk;
> > > > +	bool		    has_misc_ctrl;
> > > >  	bool                has_vld_pa_rng;
> > > >  	bool                reset_axi;
> > > >  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> > > > 
> > 
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
