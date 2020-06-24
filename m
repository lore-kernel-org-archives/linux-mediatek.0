Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59DEC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49B420706
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 06:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLl3+E3e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Am65U8ln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49B420706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JY3r1r1rqq54GUKOOulVjALHFfL/Ihu/C8df5Jg3xNU=; b=tLl3+E3egr9x6s/P1AQL6VVdG
	cEdM1xO1C1//93xfGZvyT+FrfDDx9GNdmFgf4mI1oEn3rXtsyxolAyAsS2Wi+PTykCL8gZNa9igYu
	7HVrxa/plrbPKT7c6KpLQr/mKAQBa0UeIqmqg8Mov3F0Gkse8PbaVlufdN9BF+zm37D37U6gvxobj
	BAW6qh6lDA9gvmc+Q6+eVauag2gHiWQyBXe+CYahQ0cPsg9WUW6fpwuVuU2/2P/8xjscT3HoeioRH
	MnSKKKHF87w7DSdYIcH7oTbko3Jbs4FNo5R9EdunXLdmpKoY6F19iX4BsLupOy41yvEahz4A5pq7U
	bYXwBXi7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnzBN-00059v-HH; Wed, 24 Jun 2020 06:46:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnzBK-00058f-H6; Wed, 24 Jun 2020 06:46:51 +0000
X-UUID: a1bbb95176284ebda69ac4757d3970b2-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dyrzMGwsnsiMhIacftJo7XUszB6l2wtiz1xwMW8R/c0=; 
 b=Am65U8lnm61YapKhelbvFNf2q1U1T6Vwon0jPy5pKhqj47mzQWEyR3AsvvbAnKTJrOYw8BfpvHeyIHsZNE2ESjCc8gODTA0UC9fTXF4vqmq4PiEFYF18TSc7wkAVOEv7eFT2KaT5GwKnz3Ko0YSeJyKcXa1Ov03hSSMeRyr2CTE=;
X-UUID: a1bbb95176284ebda69ac4757d3970b2-20200623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1126202237; Tue, 23 Jun 2020 22:46:27 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 23:36:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 14:36:41 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 14:36:41 +0800
Message-ID: <1592980561.24677.1.camel@mbjsdccf07>
Subject: Re: [PATCH v4 6/7] iommu/mediatek: Add REG_MMU_WR_LEN definition
 preparing for mt6779
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 24 Jun 2020 14:36:01 +0800
In-Reply-To: <e9a62fd8-ed8c-05d6-1eaa-49d5a471cd3a@gmail.com>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
 <20200617030029.4082-7-chao.hao@mediatek.com>
 <9e2c52d6-a887-1977-8877-fbcd30cb4261@gmail.com>
 <1592564184.5692.6.camel@mbjsdccf07>
 <e9a62fd8-ed8c-05d6-1eaa-49d5a471cd3a@gmail.com>
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
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-06-21 at 13:01 +0200, Matthias Brugger wrote:
> 
> On 19/06/2020 12:56, chao hao wrote:
> > On Wed, 2020-06-17 at 11:22 +0200, Matthias Brugger wrote:
> >>
> >> On 17/06/2020 05:00, Chao Hao wrote:
> >>> Some platforms(ex: mt6779) have a new register called by REG_MMU_WR_LEN
> >>> to improve performance.
> >>> This patch add this register definition.
> >>
> >> Please be more specific what this register is about.
> >>
> > OK. thanks.
> > We can use "has_wr_len" flag to control whether we need to set the
> > register. If the register uses default value, iommu will send command to
> > EMI without restriction, when the number of commands become more and
> > more, it will drop the EMI performance. So when more than
> > ten_commands(default value) don't be handled for EMI, IOMMU will stop
> > send command to EMI for keeping EMI's performace by enabling write
> > throttling mechanism(bit[5][21]=0) in MMU_WR_LEN_CTRL register.
> > 
> > I will write description above to commit message in next version
> > 
> >>>
> >>> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> >>> ---
> >>>  drivers/iommu/mtk_iommu.c | 10 ++++++++++
> >>>  drivers/iommu/mtk_iommu.h |  2 ++
> >>>  2 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >>> index a687e8db0e51..c706bca6487e 100644
> >>> --- a/drivers/iommu/mtk_iommu.c
> >>> +++ b/drivers/iommu/mtk_iommu.c
> >>> @@ -46,6 +46,8 @@
> >>>  #define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> >>>  
> >>>  #define REG_MMU_DCM_DIS				0x050
> >>> +#define REG_MMU_WR_LEN				0x054
> >>> +#define F_MMU_WR_THROT_DIS_BIT			(BIT(5) |  BIT(21))
> >>>  
> >>>  #define REG_MMU_CTRL_REG			0x110
> >>>  #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
> >>> @@ -581,6 +583,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>>  		writel_relaxed(regval, data->base + REG_MMU_VLD_PA_RNG);
> >>>  	}
> >>>  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> >>> +	if (data->plat_data->has_wr_len) {
> >>> +		/* write command throttling mode */
> >>> +		regval = readl_relaxed(data->base + REG_MMU_WR_LEN);
> >>> +		regval &= ~F_MMU_WR_THROT_DIS_BIT;
> >>> +		writel_relaxed(regval, data->base + REG_MMU_WR_LEN);
> >>> +	}
> >>>  
> >>>  	if (data->plat_data->reset_axi) {
> >>>  		/* The register is called STANDARD_AXI_MODE in this case */
> >>> @@ -737,6 +745,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> >>>  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> >>>  	void __iomem *base = data->base;
> >>>  
> >>> +	reg->wr_len = readl_relaxed(base + REG_MMU_WR_LEN);
> >>
> >> Can we read/write the register without any side effect although hardware has not
> >> implemented it (!has_wr_len)?
> > 
> > It doesn't have side effect. Becasue all the MTK platform have the
> > register for iommu HW. If we need to have requirement for performance,
> > we can set it by has_wr_len.
> > But I'm Sorry, the name of flag(has_wr_len) is not exact, I will rename
> > it in next version, ex: "wr_throt_en"
> > 
> >>
> >>
> >>>  	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
> >>>  	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
> >>>  	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
> >>> @@ -761,6 +770,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
> >>>  		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
> >>>  		return ret;
> >>>  	}
> >>> +	writel_relaxed(reg->wr_len, base + REG_MMU_WR_LEN);
> >>>  	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
> >>>  	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
> >>>  	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
> >>> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> >>> index d51ff99c2c71..9971cedd72ea 100644
> >>> --- a/drivers/iommu/mtk_iommu.h
> >>> +++ b/drivers/iommu/mtk_iommu.h
> >>> @@ -25,6 +25,7 @@ struct mtk_iommu_suspend_reg {
> >>>  	u32				int_main_control;
> >>>  	u32				ivrp_paddr;
> >>>  	u32				vld_pa_rng;
> >>> +	u32				wr_len;
> >>>  };
> >>>  
> >>>  enum mtk_iommu_plat {
> >>> @@ -43,6 +44,7 @@ struct mtk_iommu_plat_data {
> >>>  	bool		    has_misc_ctrl;
> >>>  	bool		    has_sub_comm;
> >>>  	bool                has_vld_pa_rng;
> >>> +	bool                has_wr_len;
> >>
> >> Given the fact that we are adding more and more plat_data bool values, I think
> >> it would make sense to use a u32 flags register and add the appropriate macro
> >> definitions to set and check for a flag present.
> > 
> > Thanks for your advice.
> > do you mean like this:
> > struct plat_flag {
> > 
> >         #define  HAS_4GB_MODE   BIT(0)
> >         #define  HAS_BCLK       BIT(1)
> >         #define  REST_AXI       BIT(2)
> >         ... ...
> > 
> >         u32 flag;
> > };
> > 
> > struct mtk_iommu_plat_data {
> >         ......
> >         struct plat_flag flag;
> >         ......
> > };
> > 
> 
> Nearly, I mean something like this:
> 
> #define  HAS_4GB_MODE   BIT(0)
> #define  HAS_BCLK       BIT(1)
> #define  REST_AXI       BIT(2)
> 
> #define MTK_IOMMU_HAS_FLAG(pdata, _x)	\
> 		((((pdata)->flags) & (_x)) == (_x))
> 
> struct mtk_iommu_plat_data {
> 	...
> 	u32 flags;
> 	...
> }
> 
> if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)
> ...
> 

Ok, got it, thanks


> Regards,
> Matthias
> 
> > 
> >> Regards,
> >> Matthias
> >>
> >>>  	bool                reset_axi;
> >>>  	u32                 inv_sel_reg;
> >>>  	unsigned char       larbid_remap[8][4];
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
