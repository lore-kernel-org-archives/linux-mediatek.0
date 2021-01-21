Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFD2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 00:57:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 818ED23788
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 00:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 818ED23788
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8P10Qh1fEK/w07IQJbOFgeccBGkRxdEM55BetOD4+8=; b=baF6GzK4xuGbIZf5NWdI01f0aG
	3cYWIFTBhkm33lImuhPGjE6A7DpqKrt2pl/2P4yNZ7C/hRqEc7cSwoZZVDpCASv7FIm5/WlaiXEGL
	iJj76mrukHKKPc3niXRW76JJFfiyKWEucjWfF3arbURaux4QtXReauSNlBDCqysMCy/9ZH/QGtuZw
	l5LQaKuK/MU3sxAWRXP1sxIYv31yh/wJ8poXaeUCzs7DVa0fPknLjfm0KLJuAsm9qeIB3Bin+bfgd
	r7dAxx8ftzYo5esYtg1nzBswoG/tfkjqozjI4iWvNgA5CU9Z0+sxfOY1ieuIctoE3zxbuVYgbXAm6
	VeTqxb+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2OHo-0006Oa-8R; Thu, 21 Jan 2021 00:57:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2OHj-0006NJ-6B; Thu, 21 Jan 2021 00:57:16 +0000
X-UUID: b56c97393a774e62b1488579a7d9881b-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=/dP5wm6CNuyT3vNiZvx2XBt+dwobgLw/9qYKIOrg8ik=; 
 b=OOmc2G85TxC8uEk1Fl2aVq+AekcZa+jTtbWUb80KttH5NytDvFPRjycgTRblSK2zSZsTLxiMazGOsfxvlNEEkl0ZUq9WAY/1bwmAYB3wGNzd2GdO5nYX0Yp65D0nuhUmizfACO0qxg8Hihv31g10YngKmAtAPt/oHJkmcDFp3MM=;
X-UUID: b56c97393a774e62b1488579a7d9881b-20210120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1689175956; Wed, 20 Jan 2021 16:57:01 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 16:57:00 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Jan 2021 08:56:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 08:56:56 +0800
Message-ID: <1611190616.22801.6.camel@mhfsdcap03>
Subject: Re: [PATCH v4, 03/10] soc: mediatek: mmsys: move register operation
 into mmsys path select function
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Matthias Brugger <matthias.bgg@kernel.org>
Date: Thu, 21 Jan 2021 08:56:56 +0800
In-Reply-To: <YAiG0UIfZPCRhMYd@ziggy.stardust>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-4-git-send-email-yongqiang.niu@mediatek.com>
 <YAiG0UIfZPCRhMYd@ziggy.stardust>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_195715_426764_E7247385 
X-CRM114-Status: GOOD (  24.62  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-20 at 20:38 +0100, Matthias Brugger wrote:
> On Tue, Jan 05, 2021 at 11:06:26AM +0800, Yongqiang Niu wrote:
> > move register operation into mmsys path select function
> 
> Why do you want to do that. It seems the register access pattern is the
> same for all SoCs so far supported, so I don't see the need to duplicate
> the code in every SoC.
> 
> Regards,
> Matthias

mt2701 and mt8173 ovl mout en already different.
mt2701 ovl mout en register offset is 0x30
mt8173 olv mout en register offset is 0x40

only the use case is different;
mt2701 ovl->color0
mt8173 ovl->rmda0
there make different define for this different.

#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040

#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030

for the future mt8183, ovl mout en register offset will change to
0xf00

this is only one different sample, there will be more and more
different, so we add this patch for different soc


> 
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 140 +++++++++++++++++----------------
> >  1 file changed, 71 insertions(+), 69 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > index 6c03282..64c8030 100644
> > --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > @@ -106,141 +106,161 @@ struct mtk_mmsys {
> >  	.clk_driver = "clk-mt8183-mm",
> >  };
> >  
> > -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > -					  enum mtk_ddp_comp_id next,
> > -					  unsigned int *addr)
> > +static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
> > +				  enum mtk_ddp_comp_id cur,
> > +				  enum mtk_ddp_comp_id next,
> > +				  bool enable)
> >  {
> > -	unsigned int value;
> > +	unsigned int addr, value, reg;
> >  
> >  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> >  		value = OVL0_MOUT_EN_COLOR0;
> >  	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> >  		value = OVL_MOUT_EN_RDMA;
> >  	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> >  		value = OD_MOUT_EN_RDMA0;
> >  	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> >  		value = UFOE_MOUT_EN_DSI0;
> >  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> >  		value = OVL1_MOUT_EN_COLOR1;
> >  	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> >  		value = GAMMA_MOUT_EN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> >  		value = OD1_MOUT_EN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> >  		value = RDMA0_SOUT_DSI3;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI3;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DPI0;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DPI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> >  		value = RDMA2_SOUT_DSI3;
> >  	} else {
> >  		value = 0;
> >  	}
> >  
> > -	return value;
> > +	if (value) {
> > +		reg = readl_relaxed(config_regs + addr);
> > +
> > +		if (enable)
> > +			reg |= value;
> > +		else
> > +			reg &= ~value;
> > +
> > +		writel_relaxed(reg, config_regs + addr);
> > +	}
> >  }
> >  
> > -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > -					 enum mtk_ddp_comp_id next,
> > -					 unsigned int *addr)
> > +static void mtk_mmsys_ddp_sel_in(void __iomem *config_regs,
> > +				 enum mtk_ddp_comp_id cur,
> > +				 enum mtk_ddp_comp_id next,
> > +				 bool enable)
> >  {
> > -	unsigned int value;
> > +	unsigned int addr, value, reg;
> >  
> >  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> >  		value = COLOR0_SEL_IN_OVL0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI0_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI1_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI0_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI1_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI2_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI3_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI0_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI1_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI0_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI1_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI2_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> >  		value = DSI3_SEL_IN_RDMA2;
> >  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > +		addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> >  		value = COLOR1_SEL_IN_OVL1;
> >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSI_SEL;
> > +		addr = DISP_REG_CONFIG_DSI_SEL;
> >  		value = DSI_SEL_IN_BLS;
> >  	} else {
> >  		value = 0;
> >  	}
> >  
> > -	return value;
> > +	if (value) {
> > +		reg = readl_relaxed(config_regs + addr);
> > +
> > +		if (enable)
> > +			reg |= value;
> > +		else
> > +			reg &= ~value;
> > +
> > +		writel_relaxed(reg, config_regs + addr);
> > +	}
> >  }
> >  
> >  static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > @@ -265,21 +285,12 @@ void mtk_mmsys_ddp_connect(struct device *dev,
> >  			   enum mtk_ddp_comp_id next)
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > -	unsigned int addr, value, reg;
> >  
> > -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) | value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, true);
> >  
> >  	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
> >  
> > -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) | value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, true);
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >  
> > @@ -288,19 +299,10 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >  			      enum mtk_ddp_comp_id next)
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > -	unsigned int addr, value, reg;
> >  
> > -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, false);
> >  
> > -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > -	if (value) {
> > -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > -		writel_relaxed(reg, mmsys->regs + addr);
> > -	}
> > +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, false);
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > -- 
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
