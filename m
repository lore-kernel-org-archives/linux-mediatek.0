Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3CAC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 02:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3C022255
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 02:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grII8j/e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O40sYf0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C3C022255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gh2QgOLQ5ET7JGP7mus+FDvNgO1/Uva8YxICDLhbyuU=; b=grII8j/eDOyfUcEfSRxn5jZ4L
	acJr30zKobh+vwaExd+Xy/xJ+O/T7YDuImxgffhjt+/YDMORVdLDFzHT3OHf2DgxMvMwOC7LTVTpG
	WY+gOF3SClTH2Cl5l6tFSBX6GqdFDbtMS4ntHfQtUTqpTUJacz3VoguNZTEJBAZuVj587Pduo0JqD
	E3iHASXLdRgA3nODhXfwFkmEP6T3LlmXhQizrbGkMBx4RUqB6zLLTGTtfrM+n/rjE0BBiHQuBU3DS
	6R40FD1ypT2iXi5RAVP8ljq0fhP+Oido1nWhdfiEEEDFYX4j5dY/8X0BLJvBDU+pf0wIfGugZwvzW
	N1bhETj2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSsmH-0000qF-NW; Thu, 15 Oct 2020 02:14:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSsmE-0000p1-4O; Thu, 15 Oct 2020 02:13:59 +0000
X-UUID: 58c9fc5a5ce44b798b33592b424b2aef-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IZyDYUlfeht5gnS9jjLlYuC/tfwrT3+I9bjOaLFcuGg=; 
 b=O40sYf0Uovi/mBipz7ijWA7QZKMwglN5hf3ux+uUDiUFMvkgxwSXrdYhQfbdTv67Dmjai9MQ3KkhYIQvnY3ByIJd5tSRGkwIRqi/eWIfBM1bOKL/B1XlAKTW7ZYNQzgwg3OMcQdsPEzEOfYarmVV/Z4RpX1YroRAG2ZJxkC7CHo=;
X-UUID: 58c9fc5a5ce44b798b33592b424b2aef-20201014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1576527738; Wed, 14 Oct 2020 18:13:46 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 19:13:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 10:13:37 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Oct 2020 10:13:35 +0800
Message-ID: <1602728017.11536.5.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 15 Oct 2020 10:13:37 +0800
In-Reply-To: <1602124514.28301.17.camel@mtkswgap22>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
 <1602124514.28301.17.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_221358_305716_E1FB2404 
X-CRM114-Status: GOOD (  37.17  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-08 at 10:35 +0800, Neal Liu wrote:
> On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
> > 
> > On 27/08/2020 05:06, Neal Liu wrote:
[...]

> > > +static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
> > > +{
> > > +	void __iomem *pd_vio_shift_sta_reg;
> > > +	void __iomem *pd_vio_shift_sel_reg;
> > > +	void __iomem *pd_vio_shift_con_reg;
> > > +	int min_shift_group;
> > > +	int ret;
> > > +	u32 val;
> > > +
> > > +	pd_vio_shift_sta_reg = ctx->infra_base +
> > > +			       ctx->data->vio_shift_sta_offset;
> > > +	pd_vio_shift_sel_reg = ctx->infra_base +
> > > +			       ctx->data->vio_shift_sel_offset;
> > > +	pd_vio_shift_con_reg = ctx->infra_base +
> > > +			       ctx->data->vio_shift_con_offset;
> > > +
> > > +	/* Find the minimum shift group which has violation */
> > > +	val = readl(pd_vio_shift_sta_reg);
> > > +	if (!val)
> > > +		return false;
> > 
> > So bit 0 of selection register (pd_vio_shift_sel_reg) does not represent a 
> > violation group?
> > I don't know how the HW works, but is seems odd to me. In case that's bit 0 
> > actually doesn't represent anything: how can an interrupt be triggered without 
> > any debug information present (means val == 0)?
> 
> This check implies HW status has something wrong. It cannot get any
> debug information for this case.
> It won't happen in normal scenario. Should we remove this check?
> 

Sorry, I missed the most common part. Is function is in the while loop:
while (devapc_sync_vio_dbg(ctx))
...

We keep find the minimum bit in pd_vio_shift_sta_reg to get the
violation information, (pd_vio_shift_sta_reg might raise multiple bits)
until all raised bit (shift group) has been handled.
So I don't think it's necessary to add WARN message in this case.
Thanks

> > 
> > > +
> > > +	min_shift_group = __ffs(val);
> > > +
> > > +	/* Assign the group to sync */
> > > +	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
> > > +
> > > +	/* Start syncing */
> > > +	writel(0x1, pd_vio_shift_con_reg);
> > > +
> > > +	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3, 0,
> > > +				 PHY_DEVAPC_TIMEOUT);
> > > +	if (ret) {
> > > +		dev_err(ctx->dev, "%s: Shift violation info failed\n", __func__);
> > 
> > In which case this can happen? I'm asking, because we are calling 
> > devapc_sync_vio_dbg() in a while loop that could make the kernel hang here.
> > 
> > Do I understand correctly, that we are using the while loop, because there can 
> > be more then one violation group which got triggered (read, more then one bit is 
> > set in pd_vio_shift_sta_reg)? Would it make more sense then to read the register 
> > once and do all the shift operation for all groups which bit set to 1 in the 
> > shift status register?
> 
> Yes, your understanding is correct.
> This check also implies HW status has something wrong. We return false
> to skip further violation info dump.
> How could this case make the kernel hang?
> 
> > 
> > > +		return false;
> > > +	}
> > > +
> > > +	/* Stop syncing */
> > > +	writel(0x0, pd_vio_shift_con_reg);
> > > +
> > > +	/* Write clear */
> > > +	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/*
> > > + * devapc_extract_vio_dbg - extract full violation information after doing
> > > + *                          shift mechanism.
> > > + */
> > > +static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> > > +{
> > > +	struct mtk_devapc_vio_dbgs vio_dbgs;
> > > +	void __iomem *vio_dbg0_reg;
> > > +	void __iomem *vio_dbg1_reg;
> > > +
> > > +	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
> > > +	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
> > > +
> > > +	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
> > > +	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> > > +
> > > +	/* Print violation information */
> > > +	if (vio_dbgs.dbg0_bits.vio_w)
> > > +		dev_info(ctx->dev, "Write Violation\n");
> > > +	else if (vio_dbgs.dbg0_bits.vio_r)
> > > +		dev_info(ctx->dev, "Read Violation\n");
> > > +
> > > +	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
> > > +		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
> > > +		 vio_dbgs.vio_dbg1);
> > > +}
> > > +
> > > +/*
> > > + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
> > > + *                        violation information including which master violates
> > > + *                        access slave.
> > > + */
> > > +static irqreturn_t devapc_violation_irq(int irq_number,
> > > +					struct mtk_devapc_context *ctx)
> > 
> > static irqreturn_t devapc_violation_irq(int irq_number, void *data)
> > {
> > 	struct mtk_devapc_context *ctx = data;
> 
> Okay, I'll fix it on next patch.
> Thanks
> 
> > 
> > > +{
> > > +	while (devapc_sync_vio_dbg(ctx))
> > > +		devapc_extract_vio_dbg(ctx);
> > > +
> > > +	clear_vio_status(ctx);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +/*
> > > + * start_devapc - unmask slave's irq to start receiving devapc violation.
> > > + */
> > > +static void start_devapc(struct mtk_devapc_context *ctx)
> > > +{
> > > +	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
> > > +
> > > +	mask_module_irq(ctx, false);
> > > +}
> > > +
> > > +/*
> > > + * stop_devapc - mask slave's irq to stop service.
> > > + */
> > > +static void stop_devapc(struct mtk_devapc_context *ctx)
> > > +{
> > > +	mask_module_irq(ctx, true);
> > > +
> > > +	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
> > > +}
> > > +
> > > +static const struct mtk_devapc_data devapc_mt6779 = {
> > > +	.vio_idx_num = 511,
> > > +	.vio_mask_offset = 0x0,
> > > +	.vio_sta_offset = 0x400,
> > > +	.vio_dbg0_offset = 0x900,
> > > +	.vio_dbg1_offset = 0x904,
> > > +	.apc_con_offset = 0xF00,
> > > +	.vio_shift_sta_offset = 0xF10,
> > > +	.vio_shift_sel_offset = 0xF14,
> > > +	.vio_shift_con_offset = 0xF20,
> > > +};
> > > +
> > > +static const struct of_device_id mtk_devapc_dt_match[] = {
> > > +	{
> > > +		.compatible = "mediatek,mt6779-devapc",
> > > +		.data = &devapc_mt6779,
> > > +	}, {
> > > +	},
> > > +};
> > > +
> > > +static int mtk_devapc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device_node *node = pdev->dev.of_node;
> > > +	struct mtk_devapc_context *ctx;
> > > +	u32 devapc_irq;
> > > +	int ret;
> > > +
> > > +	if (IS_ERR(node))
> > > +		return -ENODEV;
> > > +
> > > +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> > > +	if (!ctx)
> > > +		return -ENOMEM;
> > > +
> > > +	ctx->data = of_device_get_match_data(&pdev->dev);
> > > +	ctx->dev = &pdev->dev;
> > > +
> > > +	ctx->infra_base = of_iomap(node, 0);
> > 
> > Does this mean the device is part of the infracfg block?
> > I wasn't able to find any information about it.
> 
> I'm not sure why you would ask infracfg block. devapc is parts of our
> SoC infra, it's different with infracfg.
> 
> > 
> > > +	if (!ctx->infra_base)
> > > +		return -EINVAL;
> > > +
> > > +	devapc_irq = irq_of_parse_and_map(node, 0);
> > > +	if (!devapc_irq)
> > > +		return -EINVAL;
> > > +
> > > +	ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
> > > +	if (IS_ERR(ctx->infra_clk))
> > > +		return -EINVAL;
> > > +
> > > +	if (clk_prepare_enable(ctx->infra_clk))
> > > +		return -EINVAL;
> > > +
> > > +	ret = devm_request_irq(&pdev->dev, devapc_irq,
> > > +			       (irq_handler_t)devapc_violation_irq,
> > 
> > No cast should be needed.
> 
> Okay, I'll remove it on next patch.
> Thanks
> 
> > 
> > > +			       IRQF_TRIGGER_NONE, "devapc", ctx);
> > > +	if (ret) {
> > > +		clk_disable_unprepare(ctx->infra_clk);
> > > +		return ret;
> > > +	}
> > > +
> > > +	platform_set_drvdata(pdev, ctx);
> > > +
> > > +	start_devapc(ctx);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mtk_devapc_remove(struct platform_device *pdev)
> > > +{
> > > +	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
> > > +
> > > +	stop_devapc(ctx);
> > > +
> > > +	clk_disable_unprepare(ctx->infra_clk);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct platform_driver mtk_devapc_driver = {
> > > +	.probe = mtk_devapc_probe,
> > > +	.remove = mtk_devapc_remove,
> > > +	.driver = {
> > > +		.name = KBUILD_MODNAME,
> > 
> > .name = "mtk-devapc",
> 
> Okay, I'll add it on next patch.
> Thanks
> 
> > 
> > Regards,
> > Matthias
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
