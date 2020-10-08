Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8D1C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:35:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001772085B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pi7lrogz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RmymH21T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001772085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fq7EKGqdtNanYak4dHrV6G9rPtd+j7kWkmBk21qSpbM=; b=Pi7lrogz3weYMONxFy60hQ6b6
	boEMjivvf43U3sQWxICF4aOEndnPbOpERaEPhBGVg/YARq5kWSIIR6TQ/eDPP1/zCJbXx3iGIo01u
	iFEnn03l5hN07KDo1E5u/hR7TJAqRfqoqIsli8xNf+8oIJy8pcBX+r5F1hhfObwpGJwfdd+3rqbrL
	indtxujyueKvUNeknGtkL1IxQ4dLhRP19ETzjpIyGeXVKr6zXgpawag+r7xcK9SA5N+SIMeQ8deT0
	jF1t6QGGfzbc3Y27TU+K42Zm9UwqjU0OAmxoYJ5RCqHeFmJViIuU3qpwakOAZsMuNA/fzD14LFjZw
	zV6x+QTEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQLmV-0000uc-Uy; Thu, 08 Oct 2020 02:35:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQLmQ-0000to-23; Thu, 08 Oct 2020 02:35:44 +0000
X-UUID: 941e4db970cb43a5810e6feb437c1f70-20201007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eUyQWurX7TEUFvUgroyyTolSOwQdWAlsjRrM01Zvm7Q=; 
 b=RmymH21TpPcq9m+iGBio/irwVdu3VnHnSoqCHcxCwwXnxQMPRXT5WBLGb3WmxuMch4SpH3nzx5xDtCSjZ2sOMkMkpPlv91sASRsyUmK7dl9oeLdVn3LLiU9a2ymlvCvA8iIApU9DK1NhlcOkxnaB/3aG613jYhCV6YCnanWEjcQ=;
X-UUID: 941e4db970cb43a5810e6feb437c1f70-20201007
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1879546882; Wed, 07 Oct 2020 18:35:24 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Oct 2020 19:35:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 10:35:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Oct 2020 10:35:14 +0800
Message-ID: <1602124514.28301.17.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 8 Oct 2020 10:35:14 +0800
In-Reply-To: <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9FA1AAA7491D792DC98672D1D1A0F49F3CA1AE3E773A0A3C478DB17D4AA32D362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_223542_331818_B4B5D028 
X-CRM114-Status: GOOD (  48.68  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
> 
> On 27/08/2020 05:06, Neal Liu wrote:
> > MediaTek bus fabric provides TrustZone security support and data
> > protection to prevent slaves from being accessed by unexpected
> > masters.
> > The security violation is logged and sent to the processor for
> > further analysis or countermeasures.
> > 
> > Any occurrence of security violation would raise an interrupt, and
> > it will be handled by mtk-devapc driver. The violation
> > information is printed in order to find the murderer.
> 
> "The violation information is printed in order to find the responsible component."
> 
> Nobody got actually killed, right :)

Correct !
> 
> > 
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >   drivers/soc/mediatek/Kconfig      |    9 ++
> >   drivers/soc/mediatek/Makefile     |    1 +
> >   drivers/soc/mediatek/mtk-devapc.c |  305 +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 315 insertions(+)
> >   create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> > 
> > diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> > index 59a56cd..1177c98 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -17,6 +17,15 @@ config MTK_CMDQ
> >   	  time limitation, such as updating display configuration during the
> >   	  vblank.
> >   
> > +config MTK_DEVAPC
> > +	tristate "Mediatek Device APC Support"
> > +	help
> > +	  Say yes here to enable support for Mediatek Device APC driver.
> > +	  This driver is mainly used to handle the violation which catches
> > +	  unexpected transaction.
> > +	  The violation information is logged for further analysis or
> > +	  countermeasures.
> > +
> >   config MTK_INFRACFG
> >   	bool "MediaTek INFRACFG Support"
> >   	select REGMAP
> > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > index 01f9f87..abfd4ba 100644
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> > @@ -1,5 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> > +obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
> >   obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >   obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >   obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > new file mode 100644
> > index 0000000..0ba61d7
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 MediaTek Inc.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_address.h>
> > +
> > +#define VIO_MOD_TO_REG_IND(m)	((m) / 32)
> > +#define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
> > +
> > +struct mtk_devapc_vio_dbgs {
> > +	union {
> > +		u32 vio_dbg0;
> > +		struct {
> > +			u32 mstid:16;
> > +			u32 dmnid:6;
> > +			u32 vio_w:1;
> > +			u32 vio_r:1;
> > +			u32 addr_h:4;
> > +			u32 resv:4;
> > +		} dbg0_bits;
> > +	};
> > +
> > +	u32 vio_dbg1;
> > +};
> > +
> > +struct mtk_devapc_data {
> > +	u32 vio_idx_num;
> > +	u32 vio_mask_offset;
> > +	u32 vio_sta_offset;
> > +	u32 vio_dbg0_offset;
> > +	u32 vio_dbg1_offset;
> > +	u32 apc_con_offset;
> > +	u32 vio_shift_sta_offset;
> > +	u32 vio_shift_sel_offset;
> > +	u32 vio_shift_con_offset;
> > +};
> 
> Please describe the fields of the struct, that will make it easier to understand 
> the driver.

Okay, I'll try to add more description about this struct. May be like:

struct mtk_devapc_data {
	/* numbers of violation index */
	u32 vio_idx_num;

	/* reg offset */
	u32 vio_mask_offset;
	u32 vio_sta_offset;
	u32 vio_dbg0_offset;
	u32 vio_dbg1_offset;
	u32 apc_con_offset;
	u32 vio_shift_sta_offset;
	u32 vio_shift_sel_offset;
	u32 vio_shift_con_offset;
};

> 
> > +
> > +struct mtk_devapc_context {
> > +	struct device *dev;
> > +	void __iomem *infra_base;
> > +	struct clk *infra_clk;
> > +	const struct mtk_devapc_data *data;
> > +};
> > +
> > +static void clear_vio_status(struct mtk_devapc_context *ctx)
> > +{
> > +	void __iomem *reg;
> > +	int i;
> > +
> > +	reg = ctx->infra_base + ctx->data->vio_sta_offset;
> > +
> > +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
> > +		writel(GENMASK(31, 0), reg + 4 * i);
> > +
> > +	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1), 0),
> > +	       reg + 4 * i);
> > +}
> > +
> > +static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> > +{
> > +	void __iomem *reg;
> > +	u32 val;
> > +	int i;
> > +
> > +	reg = ctx->infra_base + ctx->data->vio_mask_offset;
> > +
> > +	if (mask)
> > +		val = GENMASK(31, 0);
> > +	else
> > +		val = 0;
> > +
> > +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
> 
> Do I get that right? We have a number of virtual IO identifier. Their 
> correspondending interrupt are grouped in 32 bit registers. And we want to 
> enable/disable them by writing 0 or 1. We have to take care of the last 
> registers as it could be the case that vio_idx_num is not a multiple of 32, correct?
> 
> In this case we should traverse VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1 
> registers, which is (vio_idx_num / 32) - 1 and not (vio_idx_num - 1) / 32.
> 

Yes, your understanding is correct. It should be
VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1 instead of
VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1).

> > +		writel(val, reg + 4 * i);
> > +
> > +	val = readl(reg + 4 * i);
> > +	if (mask)
> > +		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
> > +			       0);
> 
> We have 511 IRQs, which gives us 31 bits in the last register to set/unset. 
> Thats 510..0 bits, so from what I understand, once again we want
> GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0)
> which is (vio_idx_num % 32) - 1
> 
> Correct or do I understand something wrong?
> If so, same applies to clear_vio_status().
> 

Correct. I'll fix it on next patch.
Thanks

> 
> > +	else
> > +		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
> > +				0);
> > +
> > +	writel(val, reg + 4 * i);
> > +}
> > +
> > +#define PHY_DEVAPC_TIMEOUT	0x10000
> > +
> > +/*
> > + * devapc_sync_vio_dbg - do "shift" mechansim" to get full violation information.
> > + *                       shift mechanism is depends on devapc hardware design.
> > + *                       Mediatek devapc set multiple slaves as a group.
> > + *                       When violation is triggered, violation info is kept
> > + *                       inside devapc hardware.
> > + *                       Driver should do shift mechansim to sync full violation
> > + *                       info to VIO_DBGs registers.
> > + *
> > + */
> > +static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
> > +{
> > +	void __iomem *pd_vio_shift_sta_reg;
> > +	void __iomem *pd_vio_shift_sel_reg;
> > +	void __iomem *pd_vio_shift_con_reg;
> > +	int min_shift_group;
> > +	int ret;
> > +	u32 val;
> > +
> > +	pd_vio_shift_sta_reg = ctx->infra_base +
> > +			       ctx->data->vio_shift_sta_offset;
> > +	pd_vio_shift_sel_reg = ctx->infra_base +
> > +			       ctx->data->vio_shift_sel_offset;
> > +	pd_vio_shift_con_reg = ctx->infra_base +
> > +			       ctx->data->vio_shift_con_offset;
> > +
> > +	/* Find the minimum shift group which has violation */
> > +	val = readl(pd_vio_shift_sta_reg);
> > +	if (!val)
> > +		return false;
> 
> So bit 0 of selection register (pd_vio_shift_sel_reg) does not represent a 
> violation group?
> I don't know how the HW works, but is seems odd to me. In case that's bit 0 
> actually doesn't represent anything: how can an interrupt be triggered without 
> any debug information present (means val == 0)?

This check implies HW status has something wrong. It cannot get any
debug information for this case.
It won't happen in normal scenario. Should we remove this check?

> 
> > +
> > +	min_shift_group = __ffs(val);
> > +
> > +	/* Assign the group to sync */
> > +	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
> > +
> > +	/* Start syncing */
> > +	writel(0x1, pd_vio_shift_con_reg);
> > +
> > +	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3, 0,
> > +				 PHY_DEVAPC_TIMEOUT);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "%s: Shift violation info failed\n", __func__);
> 
> In which case this can happen? I'm asking, because we are calling 
> devapc_sync_vio_dbg() in a while loop that could make the kernel hang here.
> 
> Do I understand correctly, that we are using the while loop, because there can 
> be more then one violation group which got triggered (read, more then one bit is 
> set in pd_vio_shift_sta_reg)? Would it make more sense then to read the register 
> once and do all the shift operation for all groups which bit set to 1 in the 
> shift status register?

Yes, your understanding is correct.
This check also implies HW status has something wrong. We return false
to skip further violation info dump.
How could this case make the kernel hang?

> 
> > +		return false;
> > +	}
> > +
> > +	/* Stop syncing */
> > +	writel(0x0, pd_vio_shift_con_reg);
> > +
> > +	/* Write clear */
> > +	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
> > +
> > +	return true;
> > +}
> > +
> > +/*
> > + * devapc_extract_vio_dbg - extract full violation information after doing
> > + *                          shift mechanism.
> > + */
> > +static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> > +{
> > +	struct mtk_devapc_vio_dbgs vio_dbgs;
> > +	void __iomem *vio_dbg0_reg;
> > +	void __iomem *vio_dbg1_reg;
> > +
> > +	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
> > +	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
> > +
> > +	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
> > +	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> > +
> > +	/* Print violation information */
> > +	if (vio_dbgs.dbg0_bits.vio_w)
> > +		dev_info(ctx->dev, "Write Violation\n");
> > +	else if (vio_dbgs.dbg0_bits.vio_r)
> > +		dev_info(ctx->dev, "Read Violation\n");
> > +
> > +	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
> > +		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
> > +		 vio_dbgs.vio_dbg1);
> > +}
> > +
> > +/*
> > + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
> > + *                        violation information including which master violates
> > + *                        access slave.
> > + */
> > +static irqreturn_t devapc_violation_irq(int irq_number,
> > +					struct mtk_devapc_context *ctx)
> 
> static irqreturn_t devapc_violation_irq(int irq_number, void *data)
> {
> 	struct mtk_devapc_context *ctx = data;

Okay, I'll fix it on next patch.
Thanks

> 
> > +{
> > +	while (devapc_sync_vio_dbg(ctx))
> > +		devapc_extract_vio_dbg(ctx);
> > +
> > +	clear_vio_status(ctx);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +/*
> > + * start_devapc - unmask slave's irq to start receiving devapc violation.
> > + */
> > +static void start_devapc(struct mtk_devapc_context *ctx)
> > +{
> > +	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
> > +
> > +	mask_module_irq(ctx, false);
> > +}
> > +
> > +/*
> > + * stop_devapc - mask slave's irq to stop service.
> > + */
> > +static void stop_devapc(struct mtk_devapc_context *ctx)
> > +{
> > +	mask_module_irq(ctx, true);
> > +
> > +	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
> > +}
> > +
> > +static const struct mtk_devapc_data devapc_mt6779 = {
> > +	.vio_idx_num = 511,
> > +	.vio_mask_offset = 0x0,
> > +	.vio_sta_offset = 0x400,
> > +	.vio_dbg0_offset = 0x900,
> > +	.vio_dbg1_offset = 0x904,
> > +	.apc_con_offset = 0xF00,
> > +	.vio_shift_sta_offset = 0xF10,
> > +	.vio_shift_sel_offset = 0xF14,
> > +	.vio_shift_con_offset = 0xF20,
> > +};
> > +
> > +static const struct of_device_id mtk_devapc_dt_match[] = {
> > +	{
> > +		.compatible = "mediatek,mt6779-devapc",
> > +		.data = &devapc_mt6779,
> > +	}, {
> > +	},
> > +};
> > +
> > +static int mtk_devapc_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *node = pdev->dev.of_node;
> > +	struct mtk_devapc_context *ctx;
> > +	u32 devapc_irq;
> > +	int ret;
> > +
> > +	if (IS_ERR(node))
> > +		return -ENODEV;
> > +
> > +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->data = of_device_get_match_data(&pdev->dev);
> > +	ctx->dev = &pdev->dev;
> > +
> > +	ctx->infra_base = of_iomap(node, 0);
> 
> Does this mean the device is part of the infracfg block?
> I wasn't able to find any information about it.

I'm not sure why you would ask infracfg block. devapc is parts of our
SoC infra, it's different with infracfg.

> 
> > +	if (!ctx->infra_base)
> > +		return -EINVAL;
> > +
> > +	devapc_irq = irq_of_parse_and_map(node, 0);
> > +	if (!devapc_irq)
> > +		return -EINVAL;
> > +
> > +	ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
> > +	if (IS_ERR(ctx->infra_clk))
> > +		return -EINVAL;
> > +
> > +	if (clk_prepare_enable(ctx->infra_clk))
> > +		return -EINVAL;
> > +
> > +	ret = devm_request_irq(&pdev->dev, devapc_irq,
> > +			       (irq_handler_t)devapc_violation_irq,
> 
> No cast should be needed.

Okay, I'll remove it on next patch.
Thanks

> 
> > +			       IRQF_TRIGGER_NONE, "devapc", ctx);
> > +	if (ret) {
> > +		clk_disable_unprepare(ctx->infra_clk);
> > +		return ret;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, ctx);
> > +
> > +	start_devapc(ctx);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_devapc_remove(struct platform_device *pdev)
> > +{
> > +	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
> > +
> > +	stop_devapc(ctx);
> > +
> > +	clk_disable_unprepare(ctx->infra_clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver mtk_devapc_driver = {
> > +	.probe = mtk_devapc_probe,
> > +	.remove = mtk_devapc_remove,
> > +	.driver = {
> > +		.name = KBUILD_MODNAME,
> 
> .name = "mtk-devapc",

Okay, I'll add it on next patch.
Thanks

> 
> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
