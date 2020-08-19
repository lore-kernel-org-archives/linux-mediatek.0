Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD651C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA6C20885
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aauz8B2w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hv+jQXll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA6C20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2u7BfbyvB1uktdIjsy3WfK1aniBibdxfipOusGZ/T0=; b=aauz8B2wwtVD/rOfJwW5l1u8Y
	QY7aoroUFmZA333bGWfpgGpoLa5R5klCDITi/XxLOffqbmj8lgj9TXPdtW9eUg3V7Ms4wx/eBxnCN
	L92iwjOKxOoqPPi3aGyHhEDRRxQhpL/baHK19YMu+6Y3/x3EqbMBJp2c2hxMu7vJMew+4HWoI2PNp
	AGJBdbZEJtxhTjz5scZXx2MtN5RvAGtQQeDLMdnt6J0puGlOmathrsEzegp69MK1njCdv8ypERLtt
	79Wt0TB2buUWRYBzb0jqKGaZiR+hl4SjeYsdkVKEUi8dD6+fYQCevpchdGdfxsnt2wY+JToUDQKEy
	5W2Ly/w+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8OBr-0008Au-IP; Wed, 19 Aug 2020 13:31:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8OBo-00089k-RE; Wed, 19 Aug 2020 13:31:42 +0000
X-UUID: ee657dfe7dc1478586fbcb844f19177a-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fRw1wAcPb1VygFYYYG7J6cmcnElaUKNFwR0kNG/1s9c=; 
 b=hv+jQXllTnibs+5TIFqN979xYKZ9HSHeIi6RbMiVJg93XLXFdPqOmCDPqjHKWvLyTdO3Hs05fECia0qy8zEskKeBsw0/vmADBHAGwvQBbrVOYT+y6kYSlEr5VrjV5opFfLPPAf0ECD9XFKVV2JtyalqFK73J8g2abtxZJ+J4BZI=;
X-UUID: ee657dfe7dc1478586fbcb844f19177a-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2054884490; Wed, 19 Aug 2020 05:31:39 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 06:31:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 21:31:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Aug 2020 21:31:27 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
Date: Wed, 19 Aug 2020 21:31:18 +0800
Message-ID: <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org> (raw)
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org>
References: <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DE83B45AC3BC27299EB076B4A9D350810BE1BE0B47BE608892730C36C974355C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_093141_098690_CF86C8F5 
X-CRM114-Status: GOOD (  18.13  )
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
 yj.chiang@mediatek.com, daniel@0x0f.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
Message-ID: <20200819133118.-uEdp7tHcLRoobyZ8X2eGSTYrqd1jUfscKZza5xZmX4@z>

From: Marc Zyngier <maz@kernel.org>

> > +
> > +static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned 
> > int virq,
> > +				 unsigned int nr_irqs, void *data)
> > +{
> > +	int i;
> > +	irq_hw_number_t hwirq;
> > +	struct irq_fwspec parent_fwspec, *fwspec = data;
> > +	struct mst_intc_chip_data *cd = (struct mst_intc_chip_data
> > *)domain->host_data;
> 
> No cast necessary here.
> 
> > +
> > +	/* Not GIC compliant */
> > +	if (fwspec->param_count != 3)
> > +		return -EINVAL;
> > +
> > +	/* No PPI should point to this domain */
> > +	if (fwspec->param[0])
> > +		return -EINVAL;
> > +
> > +	if (fwspec->param[1] >= cd->nr_irqs)
> 
> This condition is bogus, as it doesn't take into account the nr_irqs
> parameter.
> 


The hwirq number need to be in the irq map range. (property: mstar,irqs-map-range)
If it's not, it must be incorrect configuration.
So how about use the condition as following?

if (hwirq >= cd->nr_irqs)
	return -EINVAL;

> > +		return -EINVAL;
> > +
> > +	hwirq = fwspec->param[1];
> > +	for (i = 0; i < nr_irqs; i++)
> > +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> > +					      &mst_intc_chip,
> > +					      domain->host_data);
> > +
> > +	parent_fwspec = *fwspec;
> > +	parent_fwspec.fwnode = domain->parent->fwnode;
> > +	parent_fwspec.param[1] = cd->irq_start + hwirq;
> > +	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, 
> > &parent_fwspec);
> > +}
> > +
> > +static const struct irq_domain_ops mst_intc_domain_ops = {
> > +	.translate	= mst_intc_domain_translate,
> > +	.alloc		= mst_intc_domain_alloc,
> > +	.free		= irq_domain_free_irqs_common,
> > +};
> > +
> > +int __init
> > +mst_intc_of_init(struct device_node *dn, struct device_node *parent)
> > +{
> > +	struct irq_domain *domain, *domain_parent;
> > +	struct mst_intc_chip_data *cd;
> > +	unsigned int irq_start, irq_end;
> 
> unsigned int != u32.
> 
> > +
> > +	domain_parent = irq_find_host(parent);
> > +	if (!domain_parent) {
> > +		pr_err("mst-intc: interrupt-parent not found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (of_property_read_u32_index(dn, "mstar,irqs-map-range", 0, 
> > &irq_start) ||
> > +	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, 
> > &irq_end))
> > +		return -EINVAL;
> > +
> > +	cd = kzalloc(sizeof(*cd), GFP_KERNEL);
> > +	if (!cd)
> > +		return -ENOMEM;
> > +
> > +	cd->base = of_iomap(dn, 0);
> > +	if (!cd->base) {
> > +		kfree(cd);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	cd->no_eoi = of_property_read_bool(dn, "mstar,intc-no-eoi");
> > +	raw_spin_lock_init(&cd->lock);
> > +	cd->irq_start = irq_start;
> > +	cd->nr_irqs = irq_end - irq_start + 1;
> > +	domain = irq_domain_add_hierarchy(domain_parent, 0, cd->nr_irqs, dn,
> > +					  &mst_intc_domain_ops, cd);
> > +	if (!domain) {
> > +		iounmap(cd->base);
> > +		kfree(cd);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +IRQCHIP_DECLARE(mst_intc, "mstar,mst-intc", mst_intc_of_init);
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
