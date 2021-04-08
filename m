Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC698C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:05:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593E061155
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593E061155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cfcnzDYye5VRp+3c9K+lGNDRygVXQM0gmv6fI5/LlEI=; b=mtX/U29ALSv9GZMtR2BBXkumm
	LSz/VwsAEy0zG9QYLNdq1PW2fW69GDhj17FBEqbEZL7aTabO9aCfm6zbwWb8t01n7WBxXqNDWFJry
	PaJjEXOWjukMP1oGHPyIOg6oVn42PE08fRCVD1IrYedb3XqZrF+GGGRDjsmG16rviXKk4tYdLpLG1
	3iSRgtd7O54VRdzFQkd/0r1npWfKR3o5XA2Aqby46PmZyv8Csnp4HL/VlihkvkVp0QKI4LTDusuAs
	jwPsWd5TEolhOLcJTgDSp+3xfeFXG0JWlRN0y8Fz1KTKApZRpOb9Ch1P/p2wsilbrr7WaZdhCF/m8
	T+ZHf11PQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNnA-0072oz-Ko; Thu, 08 Apr 2021 06:05:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNn4-0072o9-UG; Thu, 08 Apr 2021 06:05:22 +0000
X-UUID: b27cfac436c240d9aa4a2f8300831237-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lMu54n3WM7h13T4KRXSxF20E2a6a7I6PmSwVbYUM2ys=; 
 b=Bi6SOH460znrXWsR0YJziqBdrrZX6/YoEV+URq1eC4BUN2kxDlzJTH9q0I+7bD3UdP8834lCeKj+mAZWKnZ7rwppzkBQqEqo25bWYmTeTuLJv6fliY2yWF2U+Kg1Hfe2dBq/1/LmLOyju5EpfYC/QZUaXLX078HIsYmV+HMP6RY=;
X-UUID: b27cfac436c240d9aa4a2f8300831237-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1013267768; Wed, 07 Apr 2021 23:05:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 22:58:23 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 13:58:21 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 13:58:21 +0800
Message-ID: <1617861501.8874.4.camel@mtksdccf07>
Subject: Re: [PATCH v2 4/6] soc: mediatek: devapc: rename variable for new
 IC support
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Date: Thu, 8 Apr 2021 13:58:21 +0800
In-Reply-To: <a76686d1-3544-fcb9-4c3e-1498ec29ff47@gmail.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-4-git-send-email-nina-cm.wu@mediatek.com>
 <a76686d1-3544-fcb9-4c3e-1498ec29ff47@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_070519_622351_1ABE8423 
X-CRM114-Status: GOOD (  27.14  )
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

On Tue, 2021-04-06 at 15:43 +0200, Matthias Brugger wrote:
> Regarding the commit subject:
> "soc: mediatek: devapc: rename variable for new IC support"
> maybe something like:
> "soc: mediatek: devapc: rename register variable infra_base"
> 
> Other then that looks good to me.
> 

OK. I will fix it in the next version.

Thanks

> On 01/04/2021 08:38, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > For new ICs, there are multiple devapc HWs for different subsys.
> > For example, there is devapc respectively for infra, peri, peri2, etc.
> > So we rename the variable 'infra_base' to 'base' for code readability.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-devapc.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > index 68c3e35..bcf6e3c 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -45,7 +45,7 @@ struct mtk_devapc_data {
> >  
> >  struct mtk_devapc_context {
> >  	struct device *dev;
> > -	void __iomem *infra_base;
> > +	void __iomem *base;
> >  	u32 vio_idx_num;
> >  	struct clk *infra_clk;
> >  	const struct mtk_devapc_data *data;
> > @@ -56,7 +56,7 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
> >  	void __iomem *reg;
> >  	int i;
> >  
> > -	reg = ctx->infra_base + ctx->data->vio_sta_offset;
> > +	reg = ctx->base + ctx->data->vio_sta_offset;
> >  
> >  	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
> >  		writel(GENMASK(31, 0), reg + 4 * i);
> > @@ -71,7 +71,7 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> >  	u32 val;
> >  	int i;
> >  
> > -	reg = ctx->infra_base + ctx->data->vio_mask_offset;
> > +	reg = ctx->base + ctx->data->vio_mask_offset;
> >  
> >  	if (mask)
> >  		val = GENMASK(31, 0);
> > @@ -113,11 +113,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
> >  	int ret;
> >  	u32 val;
> >  
> > -	pd_vio_shift_sta_reg = ctx->infra_base +
> > +	pd_vio_shift_sta_reg = ctx->base +
> >  			       ctx->data->vio_shift_sta_offset;
> > -	pd_vio_shift_sel_reg = ctx->infra_base +
> > +	pd_vio_shift_sel_reg = ctx->base +
> >  			       ctx->data->vio_shift_sel_offset;
> > -	pd_vio_shift_con_reg = ctx->infra_base +
> > +	pd_vio_shift_con_reg = ctx->base +
> >  			       ctx->data->vio_shift_con_offset;
> >  
> >  	/* Find the minimum shift group which has violation */
> > @@ -159,8 +159,8 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> >  	void __iomem *vio_dbg0_reg;
> >  	void __iomem *vio_dbg1_reg;
> >  
> > -	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
> > -	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
> > +	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
> > +	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
> >  
> >  	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
> >  	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> > @@ -198,7 +198,7 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
> >   */
> >  static void start_devapc(struct mtk_devapc_context *ctx)
> >  {
> > -	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
> > +	writel(BIT(31), ctx->base + ctx->data->apc_con_offset);
> >  
> >  	mask_module_irq(ctx, false);
> >  }
> > @@ -210,7 +210,7 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
> >  {
> >  	mask_module_irq(ctx, true);
> >  
> > -	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
> > +	writel(BIT(2), ctx->base + ctx->data->apc_con_offset);
> >  }
> >  
> >  static const struct mtk_devapc_data devapc_mt6779 = {
> > @@ -249,8 +249,8 @@ static int mtk_devapc_probe(struct platform_device *pdev)
> >  	ctx->data = of_device_get_match_data(&pdev->dev);
> >  	ctx->dev = &pdev->dev;
> >  
> > -	ctx->infra_base = of_iomap(node, 0);
> > -	if (!ctx->infra_base)
> > +	ctx->base = of_iomap(node, 0);
> > +	if (!ctx->base)
> >  		return -EINVAL;
> >  
> >  	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
