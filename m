Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A397C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 16:22:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D451164F97
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 16:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D451164F97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D2s4Xf8aZQHLenIr2cPwAb1hkz/GWMaeeD7bQ3ras6s=; b=ialdu1Qbg3gtmGT/UhDlSdCFC
	4Hycr4N7InItdsXfm2KvLmenZboRfuqze+4t5G62dtRcV25VU7xqBXWZkSmLAb1mvueDqtbIMsMxW
	slauEi9f062+w+MvWj0044IbvKVhnXzh+BCOgxbxCk2WwzD0Y0SkJUh8yQ20XAamw/Pqis4KK8J9m
	7sD/R5yKeFATavQc9uvMx57OiiEhwMruLTx3dAiEKEUtYHW2/Cob2INwSSOXN9ZqAPK4O3i6h3Kz9
	W5XsqggWmNL7Ycj6Fbxh/JHelE3pfqxIvwbToaXd1T0Kl6mI9kejHFLHa6ovfoJHp9sf+oxWohIsW
	qRhCdWYcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKO4d-009Yqc-8r; Thu, 11 Mar 2021 16:22:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKO4W-009YpE-2P; Thu, 11 Mar 2021 16:22:05 +0000
X-UUID: db09bb93ef894b3fbce150beeaf87571-20210311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yOWz7EcUFXukHlQeneozmQanXXbAS3lida/J9lse/KM=; 
 b=YwdYtuSXDo92iEDEpdEYBNBFRfie/g+/NVpoPncA9L40vFAJLyRhSsOBusjP2n7GhLaXKqRa9KmN6rZIfER9nwj0EE0U2bs/sqIHwEKON8VTROkW/3sR7Y+dnXoEWkR82URZhnwKX2CxRqjhgzX0s9nHsFm726m51v4bJHSxzUQ=;
X-UUID: db09bb93ef894b3fbce150beeaf87571-20210311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 961682649; Thu, 11 Mar 2021 08:21:53 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 08:11:50 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 00:11:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Mar 2021 00:11:43 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <maz@kernel.org>, <tglx@linutronix.de>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
Date: Fri, 12 Mar 2021 00:11:40 +0800
Message-ID: <20210311161140.32678-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFr9PXmHhB=PT1kRoYYowf2dw2fqa1-LGCD5S52hW9jJtq5Q4w@mail.gmail.com>
References: <CAFr9PXmHhB=PT1kRoYYowf2dw2fqa1-LGCD5S52hW9jJtq5Q4w@mail.gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F57B12502744B967590C3F5378BE9D0A449D426B3AD3C6D8362E0B0796EBA2102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_162200_720599_76096F1C 
X-CRM114-Status: GOOD (  31.04  )
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

From: Daniel Palmer <daniel@0x0f.com>

> On Thu, 11 Mar 2021 at 12:12, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > For a fiq controller, the input edge signal will be convert to level and
> > keep the interrupt status until we do EOI operation.
> > That means if a rising edge input if trigger the ouput line will keep high
> > until we clear the interrupt status.
> 
> I think maybe the fiq is always edge triggered?
> It seems like it latches on an edge and holds it's output to the GIC
> high until it is reset by eoi and then only triggers again on another
> edge.
> I can experiment to confirm that's what it actually does for the chips I have.
> 
> Then it seems like the irq version is almost just a configurable
> inverter that passes either the input signal or the inverted input
> signal to the GIC.
> 
> So maybe fiq should only accept edge type interrupts and irq could
> accept either?

Why irq could accept either?
And if it's a fiq controller, we can just remove 'mstar,intc-no-eoi' from the
device node.
Whether the controller is fiq or irq, the interrupt request from mst-intc to
parent GIC is level sensitive. Because if the source is edge triggered, mst-intc
always latch it.

> 
> >  static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
> >  {
> > -       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
> > -               return -EINVAL;
> > -
> > -       if (type == IRQ_TYPE_LEVEL_LOW) {
> > +       if (type == IRQ_TYPE_EDGE_FALLING) {
> > +               mst_set_irq(data, INTC_REV_POLARITY);
> > +               type = IRQ_TYPE_EDGE_RISING;

The interrupt triggered type of the parent GIC should be active high,
I will modify it.

> > +       } else if (type == IRQ_TYPE_LEVEL_LOW) {
> >                 mst_set_irq(data, INTC_REV_POLARITY);
> >                 type = IRQ_TYPE_LEVEL_HIGH;
> >         }
> 
> I think this still needs the logic to check that type is something we
> can handle (not IRQ_TYPE_EDGE_BOTH) and maybe if the fiq controller

Agree.

> can only do edge interrupts level types should return -EINVAL?

No matter what triggered type of an irq we write in dts is edge or level triggered,
the init and handling flow is the same except we need to do eoi if the
controller doesn't have the property 'mstar,intc-no-eoi'.
So maybe we don't need to do extra work to check the type for an fiq or irq controller?

And I will update the patch as following:

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 841b9b1c2699..f46ade7b1775 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -90,13 +90,14 @@ static void mst_intc_eoi_irq(struct irq_data *d)
 
 static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
 {
-	if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
+	if (type != IRQ_TYPE_EDGE_RISING && type != IRQ_TYPE_EDGE_FALLING &&
+	    type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_LEVEL_LOW)
 		return -EINVAL;
 
-	if (type == IRQ_TYPE_LEVEL_LOW) {
+	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING)
 		mst_set_irq(data, INTC_REV_POLARITY);
-		type = IRQ_TYPE_LEVEL_HIGH;
-	}
+
+	type = IRQ_TYPE_LEVEL_HIGH;
 
 	return irq_chip_set_type_parent(data, type);
 }
@@ -219,11 +220,12 @@ static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	parent_fwspec.param[1] = cd->irq_start + hwirq;
 
 	/*
-	 * If the irq signal is active low, configure it to active high
-	 * to meet GIC SPI spec in mst_irq_chip_set_type via REV_POLARITY bit
+	 * mst-intc latch the interrupt request if it's edge triggered,
+	 * so the output signal to parent GIC is always level sensitive.
+	 * And if the irq signal is active low, configure it to active high
+	 * to meet GIC SPI spec in mst_irq_chip_set_type via REV_POLARITY bit.
 	 */
-	if (fwspec->param[2] == IRQ_TYPE_LEVEL_LOW)
-		parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
+	parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
 
 	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
 }
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
