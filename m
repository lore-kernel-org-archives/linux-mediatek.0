Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA29C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57958207E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 11:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2lxPXsq6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KY3IKegX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57958207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t3sJwlMrPBVePajSStxyoDHA36byQSVaoLM0oL7KrWk=; b=2lxPXsq6JzbgNub86H6HDKGEp
	3t1GmYe+R5Q2V0e2dS9Um0H//eJ/8bkyAtBbIaTMbdhwcUTb1InGKbV+1zIdAq5uTLRb5Z90xmgA0
	QnReyT28csoBS5aRDispyTUBhftZJy4OUx5HBDnJGQaFO1Be+bsaY/H6D6IePSxfsVZChFVBa3eJE
	3CoIwLxCJ3A/nh9ChWH9mK5ShMdZZq0gyXTuy+BYbQcA8UfKFU6jvgp69+Ct9ZxlSs6VzHcAJbAtk
	tvAWWGwq5UrJGBYUPqm5BT9q4lzkDOshWO7QhYMxccgLI25XlbzgITb1yf5t1GUjzJdzeQbXRuRYI
	6M4LdQR1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqE0H-0002pQ-OQ; Tue, 30 Jun 2020 11:00:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqE0E-0002oo-Rd; Tue, 30 Jun 2020 11:00:40 +0000
X-UUID: e83419dda7f644d3b1f81a560aba4eb5-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qgf6+KnJU1C/9ERhG+00Cd7X5IE2bZgFvfn2R9N4ujg=; 
 b=KY3IKegXO3DSuD/QVvBPekshjSIttVde6VaOcWgugHvPr6vyyUNCcHSuf0jYtu3aHCWyTnywl4IgN78UoCSEECRoHPUNzctSBlnIGY+2AWW91K4tTqrKFzA7qXKv+xxCx9yf0kkwWolAVnzOt2tOojZ+IRh3J21EpOnVt5jV9x4=;
X-UUID: e83419dda7f644d3b1f81a560aba4eb5-20200630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1985336076; Tue, 30 Jun 2020 03:00:34 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 04:00:33 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 19:00:23 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 19:00:23 +0800
Message-ID: <1593514765.13270.3.camel@mbjsdccf07>
Subject: Re: [PATCH v5 07/10] iommu/mediatek: Add REG_MMU_WR_LEN register
 definition
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 30 Jun 2020 18:59:25 +0800
In-Reply-To: <ccb63946-e187-187e-c92c-0423f1831d8f@gmail.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-8-chao.hao@mediatek.com>
 <ccb63946-e187-187e-c92c-0423f1831d8f@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 329E5CED00E1E6D984FED548CE85F058205BE3EED5886D85F7D19028D1218CCC2000:8
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

On Mon, 2020-06-29 at 12:16 +0200, Matthias Brugger wrote:
> 
> On 29/06/2020 09:13, Chao Hao wrote:
> > Some platforms(ex: mt6779) need to improve performance by setting
> > REG_MMU_WR_LEN register. And we can use WR_THROT_EN macro to control
> > whether we need to set the register. If the register uses default value,
> > iommu will send command to EMI without restriction, when the number of
> > commands become more and more, it will drop the EMI performance. So when
> > more than ten_commands(default value) don't be handled for EMI, iommu will
> > stop send command to EMI for keeping EMI's performace by enabling write
> > throttling mechanism(bit[5][21]=0) in MMU_WR_LEN_CTRL register.
> > 
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 10 ++++++++++
> >  drivers/iommu/mtk_iommu.h |  2 ++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index ec1f86913739..92316c4175a9 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -46,6 +46,8 @@
> >  #define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> >  
> >  #define REG_MMU_DCM_DIS				0x050
> > +#define REG_MMU_WR_LEN				0x054
> 
> The register name is confusing. For me it seems to describe the length of a
> write but it is used for controlling the write throttling. Is this the name
> that's used in the datasheet?
> 

Thanks for your review carefully, we can name it to REG_MMU_WR_LEN_CTRL


> > +#define F_MMU_WR_THROT_DIS_BIT			(BIT(5) |  BIT(21))
> 
> There are two spaces between '|' and 'BIT(21)', should be one.
> 
> Regarding the name of the define, what does the 'F_' statnds for? 

F_ is used to described some bits in register and doesn't have other
meanings. The format is refer to other bits definition

> Also I think
> it should be called '_MASK' instead of '_BIT' as it defines a mask of bits.
> 

Thanks for your advice.
For F_MMU_WR_THROT_DIS_BIT:
1'b0: Enable write throttling mechanism
1'b1: Disable write throttling mechanism
So I think we can name "F_MMU_WR_THROT_DIS  BIT(5) | BIT(21)" directly,
it maybe more clearer.

> Regards,
> Matthias
> 
> >  
> >  #define REG_MMU_CTRL_REG			0x110
> >  #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
> > @@ -582,6 +584,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >  		writel_relaxed(regval, data->base + REG_MMU_VLD_PA_RNG);
> >  	}
> >  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> > +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, WR_THROT_EN)) {
> > +		/* write command throttling mode */
> > +		regval = readl_relaxed(data->base + REG_MMU_WR_LEN);
> > +		regval &= ~F_MMU_WR_THROT_DIS_BIT;
> > +		writel_relaxed(regval, data->base + REG_MMU_WR_LEN);
> > +	}
> >  
> >  	regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> >  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
> > @@ -737,6 +745,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> >  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> >  	void __iomem *base = data->base;
> >  
> > +	reg->wr_len = readl_relaxed(base + REG_MMU_WR_LEN);
> >  	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
> >  	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
> >  	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
> > @@ -761,6 +770,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
> >  		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
> >  		return ret;
> >  	}
> > +	writel_relaxed(reg->wr_len, base + REG_MMU_WR_LEN);
> >  	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
> >  	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
> >  	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index be6d32ee5bda..ce4f4e8f03aa 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -24,6 +24,7 @@
> >  #define RESET_AXI			BIT(3)
> >  #define OUT_ORDER_EN			BIT(4)
> >  #define HAS_SUB_COMM			BIT(5)
> > +#define WR_THROT_EN			BIT(6)
> >  
> >  #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> >  		((((pdata)->flags) & (_x)) == (_x))
> > @@ -36,6 +37,7 @@ struct mtk_iommu_suspend_reg {
> >  	u32				int_main_control;
> >  	u32				ivrp_paddr;
> >  	u32				vld_pa_rng;
> > +	u32				wr_len;
> >  };
> >  
> >  enum mtk_iommu_plat {
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
