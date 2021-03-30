Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FF9C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:57:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE6F6157F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE6F6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lcNnhVXQalnSsPAQ6HJ00WwSI2xcaCJm3X4zXKHuXgs=; b=HWsy+6dnwJ3VM5SpqopqhC9cK
	Og+NKLX65VWBeE766acL6Fgx+OkBYfLp0J71bM1nopzTAyPZRsFydJB4US78iVAo7KHRpsDrR3A11
	DIlOHXHcGAXzL6K5Z5SC27eonkmNBSaI89DfYHdFxsaas0SvlcgV5WYN0CvXUFHtoblG2ptFpPYYP
	BzfGjLdQVWzZlBKifGKgJ4cQ7vtKGTi7+L5ptbHelWe7x3Ug634/SfDV3tJKCIb5ccOJyZQwzkk98
	XMM3TiRYoDwzEPmpYnIzHIFOoUdD406OijLcp6iDrlcOphKtQCk2BDV07jFqCJLz3cWBlg8jYMpEr
	sTI9ghiTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR3dN-002OQc-Fh; Tue, 30 Mar 2021 01:57:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR2nh-002Img-19; Tue, 30 Mar 2021 01:04:12 +0000
X-UUID: 6e4ab73792ed47d29766ddaf000e2951-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vZsOxgUdHF+/FCXfNfybr3h2krRU2dbdwm7QTGpmZEI=; 
 b=Q9Ycp7cCU0GkHxb+CgAnDmdYmZ63ESOJU8vgjM4WoKLjD+rSUhR5GwNnktgxyrhuPwb2O6wnSHYVGDse1+8PtGya05V0lKUvBMDWZ4bix2Vx45pdAoBxcZkG+oww9nJu3Q2YiwARiF/8Q3bix7VAKBgmcCypum5K3vpbreP5Lzc=;
X-UUID: 6e4ab73792ed47d29766ddaf000e2951-20210329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 324592916; Mon, 29 Mar 2021 17:04:00 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 18:03:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 09:03:57 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 09:03:57 +0800
Message-ID: <1617066237.9554.9.camel@mtksdccf07>
Subject: Re: [PATCH 2/2] soc: mediatek: Add mt8192 devapc driver
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Neal Liu <neal.liu@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <nina-cm.wu@mediatek.com>, <chunkuang.hu@kernel.org>
Date: Tue, 30 Mar 2021 09:03:57 +0800
In-Reply-To: <365d12f3-3553-f560-2418-7f0ab764a81a@gmail.com>
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
 <1616743871-8087-2-git-send-email-nina-cm.wu@mediatek.com>
 <365d12f3-3553-f560-2418-7f0ab764a81a@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_020409_696274_42DF8944 
X-CRM114-Status: GOOD (  37.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias


On Mon, 2021-03-29 at 13:16 +0200, Matthias Brugger wrote:
> As a general comment:
> 
> Please split your patch in several, one introducing changes to the existing code
> base which are needed for newer SoCs (depending on the changes more then one)
> and one which actually adds support for the new SoC.
> 
> More comments below.
> 


Thanks for the advice.
I will try to split it in the next version.

> 
> On 26/03/2021 08:31, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > The hardware architecture of mt8192 devapc is slightly
> > different from that of the previous IC.
> > We add necessary extensions to support mt8192 and be
> > back-compatible with other ICs.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-devapc.c | 213 ++++++++++++++++++++++++++++----------
> >  1 file changed, 156 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > index f1cea04..1e40a52 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -15,6 +15,11 @@
> >  #define VIO_MOD_TO_REG_IND(m)	((m) / 32)
> >  #define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
> >  
> > +#define FOR_EACH_SLAVE_TYPE(ctx, idx) \
> > +	for ((idx) = 0; (idx) < (ctx)->slave_type_num; (idx)++)
> 
> Not really needed, please drop.
> 
> > +#define BASE(i)			(ctx->base_list[i])
> 
> same here.
> 
> > +#define VIO_IDX_NUM(i)		(ctx->vio_idx_num[i])
> 
> same here.
> 

OK, will fixed in the next version.


> > +
> >  struct mtk_devapc_vio_dbgs {
> >  	union {
> >  		u32 vio_dbg0;
> > @@ -26,20 +31,28 @@ struct mtk_devapc_vio_dbgs {
> >  			u32 addr_h:4;
> >  			u32 resv:4;
> >  		} dbg0_bits;
> > +
> > +		/* Not used, reference only */
> > +		struct {
> > +			u32 dmnid:6;
> > +			u32 vio_w:1;
> > +			u32 vio_r:1;
> > +			u32 addr_h:4;
> > +			u32 resv:20;
> > +		} dbg0_bits_ver2;
> >  	};
> >  
> >  	u32 vio_dbg1;
> > +	u32 vio_dbg2;
> >  };
> >  
> >  struct mtk_devapc_data {
> > -	/* numbers of violation index */
> > -	u32 vio_idx_num;
> > -
> >  	/* reg offset */
> >  	u32 vio_mask_offset;
> >  	u32 vio_sta_offset;
> >  	u32 vio_dbg0_offset;
> >  	u32 vio_dbg1_offset;
> > +	u32 vio_dbg2_offset;
> >  	u32 apc_con_offset;
> >  	u32 vio_shift_sta_offset;
> >  	u32 vio_shift_sel_offset;
> > @@ -48,7 +61,10 @@ struct mtk_devapc_data {
> >  
> >  struct mtk_devapc_context {
> >  	struct device *dev;
> > -	void __iomem *infra_base;
> > +	u32 arch_ver;
> > +	u32 slave_type_num;
> > +	void __iomem **base_list;
> > +	u32 *vio_idx_num;
> >  	struct clk *infra_clk;
> >  	const struct mtk_devapc_data *data;
> >  };
> > @@ -56,39 +72,39 @@ struct mtk_devapc_context {
> >  static void clear_vio_status(struct mtk_devapc_context *ctx)
> >  {
> >  	void __iomem *reg;
> > -	int i;
> > +	int i, j;
> >  
> > -	reg = ctx->infra_base + ctx->data->vio_sta_offset;
> > +	FOR_EACH_SLAVE_TYPE(ctx, i) {
> > +		reg = BASE(i) + ctx->data->vio_sta_offset;
> >  
> > -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> > -		writel(GENMASK(31, 0), reg + 4 * i);
> > +		for (j = 0; j < VIO_MOD_TO_REG_IND(VIO_IDX_NUM(i) - 1); j++)
> > +			writel(GENMASK(31, 0), reg + 4 * j);
> > +
> > +		writel(GENMASK(VIO_MOD_TO_REG_OFF(VIO_IDX_NUM(i) - 1), 0),
> > +		       reg + 4 * j);
> > +	}
> >  
> > -	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
> > -	       reg + 4 * i);
> >  }
> >  
> > -static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> > +static void mask_module_irq(void __iomem *reg, int vio_idx_num, bool mask)
> >  {
> > -	void __iomem *reg;
> >  	u32 val;
> >  	int i;
> >  
> > -	reg = ctx->infra_base + ctx->data->vio_mask_offset;
> > -
> >  	if (mask)
> >  		val = GENMASK(31, 0);
> >  	else
> >  		val = 0;
> >  
> > -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> > +	for (i = 0; i < VIO_MOD_TO_REG_IND(vio_idx_num - 1); i++)
> >  		writel(val, reg + 4 * i);
> >  
> >  	val = readl(reg + 4 * i);
> >  	if (mask)
> > -		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> > +		val |= GENMASK(VIO_MOD_TO_REG_OFF(vio_idx_num - 1),
> >  			       0);
> >  	else
> > -		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> > +		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(vio_idx_num - 1),
> >  				0);
> >  
> >  	writel(val, reg + 4 * i);
> > @@ -108,6 +124,8 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> >   */
> >  static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
> >  {
> > +	int i;
> > +	void __iomem *reg_base;
> 
> Not needed.

will be removed.

> 
> >  	void __iomem *pd_vio_shift_sta_reg;
> >  	void __iomem *pd_vio_shift_sel_reg;
> >  	void __iomem *pd_vio_shift_con_reg;
> > @@ -115,57 +133,87 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
> >  	int ret;
> >  	u32 val;
> >  
> > -	pd_vio_shift_sta_reg = ctx->infra_base +
> > -			       ctx->data->vio_shift_sta_offset;
> > -	pd_vio_shift_sel_reg = ctx->infra_base +
> > -			       ctx->data->vio_shift_sel_offset;
> > -	pd_vio_shift_con_reg = ctx->infra_base +
> > -			       ctx->data->vio_shift_con_offset;
> > +	FOR_EACH_SLAVE_TYPE(ctx, i) {
> > +		reg_base = BASE(i);
> >  
> > -	/* Find the minimum shift group which has violation */
> > -	val = readl(pd_vio_shift_sta_reg);
> > -	if (!val)
> > -		return false;
> > +		pd_vio_shift_sta_reg = reg_base +
> > +				       ctx->data->vio_shift_sta_offset;
> > +		pd_vio_shift_sel_reg = reg_base +
> > +				       ctx->data->vio_shift_sel_offset;
> > +		pd_vio_shift_con_reg = reg_base +
> > +				       ctx->data->vio_shift_con_offset;
> >  
> > -	min_shift_group = __ffs(val);
> > +		/* Find the minimum shift group which has violation */
> > +		val = readl(pd_vio_shift_sta_reg);
> > +		if (!val)
> > +			continue;
> >  
> > -	/* Assign the group to sync */
> > -	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
> > +		min_shift_group = __ffs(val);
> >  
> > -	/* Start syncing */
> > -	writel(0x1, pd_vio_shift_con_reg);
> > +		/* Assign the group to sync */
> > +		writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
> >  
> > -	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3, 0,
> > -				 PHY_DEVAPC_TIMEOUT);
> > -	if (ret) {
> > -		dev_err(ctx->dev, "%s: Shift violation info failed\n", __func__);
> > -		return false;
> > -	}
> > +		/* Start syncing */
> > +		writel(0x1, pd_vio_shift_con_reg);
> > +
> > +		ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3,
> > +					 0, PHY_DEVAPC_TIMEOUT);
> > +		if (ret) {
> > +			dev_err(ctx->dev, "%s: Shift violation info failed\n",
> > +				__func__);
> > +			return -ETIMEDOUT;
> > +		}
> >  
> > -	/* Stop syncing */
> > -	writel(0x0, pd_vio_shift_con_reg);
> > +		/* Stop syncing */
> > +		writel(0x0, pd_vio_shift_con_reg);
> >  
> > -	/* Write clear */
> > -	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
> > +		/* Write clear */
> > +		writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
> >  
> > -	return true;
> > +		return i;
> 
> Not sure why you change that.

There is multiple devapc HW here sharing the same interrupt.
When interrupts come, all devapc HW should be checked.
I just got some advice from other reviewer.
I will drop this modification and try to have multiple nodes in DT
instead.

> 
> > +	}
> > +
> > +	/* No violation found */
> > +	return -ENODATA;
> >  }
> >  
> >  /*
> >   * devapc_extract_vio_dbg - extract full violation information after doing
> >   *                          shift mechanism.
> >   */
> > -static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> > +static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx,
> > +				   int vio_slave_type)
> >  {
> >  	struct mtk_devapc_vio_dbgs vio_dbgs;
> >  	void __iomem *vio_dbg0_reg;
> >  	void __iomem *vio_dbg1_reg;
> > +	void __iomem *vio_dbg2_reg;
> > +	u32 vio_addr, bus_id;
> >  
> > -	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
> > -	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
> > +	vio_dbg0_reg = BASE(vio_slave_type) + ctx->data->vio_dbg0_offset;
> > +	vio_dbg1_reg = BASE(vio_slave_type) + ctx->data->vio_dbg1_offset;
> > +	vio_dbg2_reg = BASE(vio_slave_type) + ctx->data->vio_dbg2_offset;
> >  
> >  	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
> >  	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> > +	vio_dbgs.vio_dbg2 = readl(vio_dbg2_reg);
> > +
> > +	switch (ctx->arch_ver) {
> > +	case 1:
> > +		bus_id = vio_dbgs.dbg0_bits.mstid;
> > +		vio_addr = vio_dbgs.vio_dbg1;
> > +		break;
> > +	case 2:
> > +		bus_id = vio_dbgs.vio_dbg1;
> > +		vio_addr = vio_dbgs.vio_dbg2;
> > +
> > +		/* To align with the bit definition of arch_ver 1 */
> > +		vio_dbgs.vio_dbg0 = (vio_dbgs.vio_dbg0 << 16);
> > +		break;
> > +	default:
> > +		/* Not Supported */
> > +		return;
> > +	}
> >  
> >  	/* Print violation information */
> >  	if (vio_dbgs.dbg0_bits.vio_w)
> > @@ -174,8 +222,7 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> >  		dev_info(ctx->dev, "Read Violation\n");
> >  
> >  	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
> > -		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
> > -		 vio_dbgs.vio_dbg1);
> > +		 bus_id, vio_dbgs.dbg0_bits.dmnid, vio_addr);
> >  }
> >  
> >  /*
> > @@ -186,9 +233,10 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> >  static irqreturn_t devapc_violation_irq(int irq_number, void *data)
> >  {
> >  	struct mtk_devapc_context *ctx = data;
> > +	int vio_slave_type;
> >  
> > -	while (devapc_sync_vio_dbg(ctx))
> > -		devapc_extract_vio_dbg(ctx);
> > +	while ((vio_slave_type = devapc_sync_vio_dbg(ctx)) >= 0)
> > +		devapc_extract_vio_dbg(ctx, vio_slave_type);
> >  
> >  	clear_vio_status(ctx);
> >  
> > @@ -200,9 +248,15 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
> >   */
> >  static void start_devapc(struct mtk_devapc_context *ctx)
> >  {
> > -	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
> > +	int i;
> > +	void __iomem *reg_base;
> >  
> > -	mask_module_irq(ctx, false);
> > +	FOR_EACH_SLAVE_TYPE(ctx, i) {
> > +		writel(BIT(31), BASE(i) + ctx->data->apc_con_offset);
> > +
> > +		reg_base = BASE(i) + ctx->data->vio_mask_offset;
> > +		mask_module_irq(reg_base, VIO_IDX_NUM(i), false);
> > +	}
> >  }
> >  
> >  /*
> > @@ -210,13 +264,18 @@ static void start_devapc(struct mtk_devapc_context *ctx)
> >   */
> >  static void stop_devapc(struct mtk_devapc_context *ctx)
> >  {
> > -	mask_module_irq(ctx, true);
> > +	int i;
> > +	void __iomem *reg_base;
> > +
> > +	FOR_EACH_SLAVE_TYPE(ctx, i) {
> > +		reg_base = BASE(i) + ctx->data->vio_mask_offset;
> > +		mask_module_irq(reg_base, VIO_IDX_NUM(i), true);
> >  
> > -	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
> > +		writel(BIT(2), BASE(i) + ctx->data->apc_con_offset);
> > +	}
> >  }
> >  
> >  static const struct mtk_devapc_data devapc_mt6779 = {
> > -	.vio_idx_num = 511,
> >  	.vio_mask_offset = 0x0,
> >  	.vio_sta_offset = 0x400,
> >  	.vio_dbg0_offset = 0x900,
> > @@ -227,11 +286,26 @@ static const struct mtk_devapc_data devapc_mt6779 = {
> >  	.vio_shift_con_offset = 0xF20,
> >  };
> >  
> > +static const struct mtk_devapc_data devapc_mt8192 = {
> > +	.vio_mask_offset = 0x0,
> > +	.vio_sta_offset = 0x400,
> > +	.vio_dbg0_offset = 0x900,
> > +	.vio_dbg1_offset = 0x904,
> > +	.vio_dbg2_offset = 0x908,
> > +	.apc_con_offset = 0xF00,
> > +	.vio_shift_sta_offset = 0xF20,
> > +	.vio_shift_sel_offset = 0xF30,
> > +	.vio_shift_con_offset = 0xF10,
> > +};
> > +
> >  static const struct of_device_id mtk_devapc_dt_match[] = {
> >  	{
> >  		.compatible = "mediatek,mt6779-devapc",
> >  		.data = &devapc_mt6779,
> >  	}, {
> > +		.compatible = "mediatek,mt8192-devapc",
> > +		.data = &devapc_mt8192,
> > +	}, {
> >  	},
> >  };
> >  
> > @@ -239,6 +313,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node *node = pdev->dev.of_node;
> >  	struct mtk_devapc_context *ctx;
> > +	int i;
> >  	u32 devapc_irq;
> >  	int ret;
> >  
> > @@ -252,8 +327,32 @@ static int mtk_devapc_probe(struct platform_device *pdev)
> >  	ctx->data = of_device_get_match_data(&pdev->dev);
> >  	ctx->dev = &pdev->dev;
> >  
> > -	ctx->infra_base = of_iomap(node, 0);
> > -	if (!ctx->infra_base)
> > +	if (of_property_read_u32(node, "version", &ctx->arch_ver))
> > +		return -EINVAL;
> > +
> > +	if (of_property_read_u32(node, "slave_type_num", &ctx->slave_type_num))
> 
> arch_ver and slave_type_num can be ddriver internal parameters set through the
> DT data instead of through a new property.
> 
> > +		return -EINVAL;
> > +
> > +	ctx->base_list = devm_kzalloc(&pdev->dev,
> > +				      sizeof(void *) * ctx->slave_type_num,
> > +				      GFP_KERNEL);
> > +	if (!ctx->base_list)
> > +		return -ENOMEM;
> > +
> > +	FOR_EACH_SLAVE_TYPE(ctx, i) {
> > +		BASE(i) = of_iomap(node, i);
> > +		if (!BASE(i))
> > +			return -EINVAL;
> > +	}
> > +
> > +	ctx->vio_idx_num = devm_kzalloc(&pdev->dev,
> > +					sizeof(u32) * ctx->slave_type_num,
> > +					GFP_KERNEL);
> > +	if (!ctx->vio_idx_num)
> > +		return -ENOMEM;
> > +
> > +	if (of_property_read_u32_array(node, "vio_idx_num",
> > +				       ctx->vio_idx_num, ctx->slave_type_num))
> >  		return -EINVAL;
> >  
> >  	devapc_irq = irq_of_parse_and_map(node, 0);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
