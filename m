Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2ACC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:52:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1F22072A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZg0kUzA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLBfpVc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1F22072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tbxg1qqUmpv1GoY95f5QI+Ldj4c/18Y92P5k1PM+SyM=; b=EZg0kUzA9AFSOuLnoaIUe8Cpa
	yQVNwAApaUUjENCb9QyFQHpKMCtRpsOZpqqMEeftIlOnla87VRYancG0zdtczpHcN1iu9TPt9d18o
	brYgb/11ZDwucsY01X0W30YLqyMlaHop+8Am4vo4zUXJFU0RQ12RCo3CDMK3pv2M3oZMp2Hihfvqd
	lB1sBFpjheM0ICLwu0BJLf5iVILJmh+WxjkhvBpJnO/a9Ou1JZas8fBsp1zA/Rl3btct4rEsTvdmF
	pUYdRsY0Hdxsi2Jx5yiLKrr8Td6LFP/3nZPFjR7u9zn8OUZXb5x5DTaleS8Dof/GhKIzwvAP5s1wI
	tWG5/PtIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ckx-0004xj-BU; Mon, 03 Aug 2020 15:52:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ckt-0004we-Vn; Mon, 03 Aug 2020 15:52:04 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5FC82072A;
 Mon,  3 Aug 2020 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469922;
 bh=T7K90irjubNIFSVeq85wbcwpNGOjt5yZjmQ4qDPlPPM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GLBfpVc5Ixviz5v0DVPOVmz1tmitRI10Gp8/FidMeHlrayRDhtgVC7M/4ZRnlau1q
 SSrM+ks+Cx1yJl1dJyu7bbxVJbTB/pZE4AQweAh3x0yVYKWqGsg6kKsB3d+P8K/iJb
 NnFRHgjqe+VJC0LcpHWWsJHEQ0+oJgK4jAERly5c=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k2ckr-00H9C1-Cr; Mon, 03 Aug 2020 16:52:01 +0100
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 16:52:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] irqchip: irq-mt58xx: Add mt58xx interrupt controller
 support
In-Reply-To: <43f5cba1199f89cde68c8a577103f28b@kernel.org> (raw)
References: <43f5cba1199f89cde68c8a577103f28b@kernel.org>
 <43f5cba1199f89cde68c8a577103f28b@kernel.org> (raw)
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <18809de59c26b1817320992c7f7bb0f4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mark-pk.tsai@mediatek.com, alix.wu@mediatek.com,
 devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 tglx@linutronix.de, yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_115204_186370_BCD3D624 
X-CRM114-Status: GOOD (  27.11  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-03 16:03, Mark-PK Tsai wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
>> On 2020-08-03 07:22, Mark-PK Tsai wrote:
>> > Add mt58xx interrupt controller support using hierarchy irq
>> > domain.
>> >
>> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>> > ---
>> >  drivers/irqchip/Kconfig      |   7 ++
>> >  drivers/irqchip/Makefile     |   1 +
>> >  drivers/irqchip/irq-mt58xx.c | 196 +++++++++++++++++++++++++++++++++++
>> >  3 files changed, 204 insertions(+)
>> >  create mode 100644 drivers/irqchip/irq-mt58xx.c
>> >
>> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> > index 216b3b8392b5..00453af78be0 100644
>> > --- a/drivers/irqchip/Kconfig
>> > +++ b/drivers/irqchip/Kconfig
>> > @@ -572,4 +572,11 @@ config LOONGSON_PCH_MSI
>> >  	help
>> >  	  Support for the Loongson PCH MSI Controller.
>> >
>> > +config MT58XX_IRQ
>> > +	bool "MT58XX IRQ"
>> > +	select IRQ_DOMAIN
>> > +	select IRQ_DOMAIN_HIERARCHY
>> > +	help
>> > +	  Support Mediatek MT58XX Interrupt Controller.
>> > +
>> >  endmenu
>> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> > index 133f9c45744a..5062e9bfa92d 100644
>> > --- a/drivers/irqchip/Makefile
>> > +++ b/drivers/irqchip/Makefile
>> > @@ -111,3 +111,4 @@ obj-$(CONFIG_LOONGSON_HTPIC)		+=
>> > irq-loongson-htpic.o
>> >  obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
>> >  obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
>> >  obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
>> > +obj-$(CONFIG_MT58XX_IRQ)		+= irq-mt58xx.o
>> > diff --git a/drivers/irqchip/irq-mt58xx.c
>> > b/drivers/irqchip/irq-mt58xx.c
>> > new file mode 100644
>> > index 000000000000..e45ad023afa6
>> > --- /dev/null
>> > +++ b/drivers/irqchip/irq-mt58xx.c
>> > @@ -0,0 +1,196 @@
>> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> > +/*
>> > + * Copyright (c) 2020 MediaTek Inc.
>> > + * Author Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>> > + */
>> > +
>> > +#include <linux/interrupt.h>
>> > +#include <linux/io.h>
>> > +#include <linux/irq.h>
>> > +#include <linux/irqchip.h>
>> > +#include <linux/irqdomain.h>
>> > +#include <linux/of.h>
>> > +#include <linux/of_address.h>
>> > +#include <linux/of_irq.h>
>> > +#include <linux/slab.h>
>> > +
>> > +#define INTC_MASK	0x0
>> > +#define INTC_EOI	0x20
>> > +
>> > +struct mtk_intc_chip_data {
>> > +	char *name;
>> > +	struct irq_chip chip;
>> 
>> There is no need to embed a full struct irqchip per controller, see
>> below.
> 
> We want to distinguish which controller the device interrupts are 
> belong to
> by "cat /proc/interrupts".
> And if all the controller share the same struct, the name field will be 
> the
> same.
> Do you have suggestion for this?

Yes. /proc/interrupts is not a debug tool, and doesn't need to
show the interrupt routing. We have a debugfs option for this
purpose, and that is what you should use. If it is missing
any information, just say so and I will see what we can do.

[...]

>> > +static struct irq_chip mtk_intc_chip = {
>> > +	.irq_mask		= mtk_intc_mask_irq,
>> > +	.irq_unmask		= mtk_intc_unmask_irq,
>> > +	.irq_eoi		= mtk_intc_eoi_irq,
>> > +	.irq_get_irqchip_state	= irq_chip_get_parent_state,
>> > +	.irq_set_irqchip_state	= irq_chip_set_parent_state,
>> > +	.irq_set_affinity	= irq_chip_set_affinity_parent,
>> > +	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
>> 
>> How about retrigger?
>> 
> 
> What is retrigger means?

It allows the HW to regenerate an interrupt. Set irq_retrigger
to irq_chip_retrigger_hierarchy, and you'll be fine. It is
going to be implemented shortly in the GIC driver.

> To be honest, I just try to direct all the irqchip ops implemented in
> /drivers/irqchip/irq-gic.c to gic driver.
> But "irq_set_vcpu_affinity" is not used in our projects now.

I assume you are not contributing this code just for your
own project...

> Should I remove ".irq_set_vcpu_affinity" here?

No, just leave it. Who knows, just in case virtualization becomes
a thing...

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
