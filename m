Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DE4C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 14:56:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B812083B
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 14:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zRofyYtE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CuUdyapr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B812083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HROZMo3oGJny7TkVWHZ6wxJWtVr86BmCgiaoU3xEvX4=; b=zRofyYtEyE0Y7+0cy5FSJK0xz
	w3UBUKcYZohQqrnRx0mGJWK7dtBp+4K5/ttH5GaBW2uCLY1vNv9quLurln3CnhAHxQv8//+U1pwqS
	PMx/2zNpr4qCmChqVWh/lb0QJ3DYzNQRdrIHM8jUDqfw0WwEyOBd1K7d29dYFY1REoG/hUgW8cUX8
	dxWYpbEycpQOfLbtvIBgXLQPJtOWW7G+jxDj+wHVmyx+PmK0o9eGfjgxaHc6wfArxj4kGpI/ZQMh2
	IBOyEzEChnXJsbYKTfb6ML2qs7+hh6H72FGWfGX4xRT9EuffnlHZ2a2B5IBpRGQrMf4kwx2xNRunf
	z4nH7tmCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8PVf-0008Oa-Ea; Wed, 19 Aug 2020 14:56:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8PVc-0008MY-5a; Wed, 19 Aug 2020 14:56:14 +0000
X-UUID: 2bf4708b966640e4be42e1ed016dfbd4-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AoeUUvCjkrCNhYfqve8JEcUAO7P8LbXeCUbXyAWumY0=; 
 b=CuUdyaprq4NzPSfPJNniWUlBoger3pChNskh8ssVrfZkkrpRIie3itK8Yk71o2YN2bvd3Htc5bWN4pkwZzpnj/sMbfMKGkfI5rd1ivuaPFfKXem+oJnEacT4gBBt2rzkacpfKEk9MZx6pL+9dtwJE8vPx0yeCm9KU05fqTUkf5M=;
X-UUID: 2bf4708b966640e4be42e1ed016dfbd4-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 286300020; Wed, 19 Aug 2020 06:56:07 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 07:56:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 22:56:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Aug 2020 22:56:02 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
Date: Wed, 19 Aug 2020 22:55:26 +0800
Message-ID: <20200819145525.26315-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f593f5e395c8558657a3f265b7038ec3@kernel.org>
References: <f593f5e395c8558657a3f265b7038ec3@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_105613_068966_7A82EAD0 
X-CRM114-Status: GOOD (  18.58  )
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

From: Marc Zyngier <maz@kernel.org>

>On 2020-08-19 14:31, Mark-PK Tsai wrote:
>> From: Marc Zyngier <maz@kernel.org>
>> 
>>> > +
>>> > +static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned
>>> > int virq,
>>> > +				 unsigned int nr_irqs, void *data)
>>> > +{
>>> > +	int i;
>>> > +	irq_hw_number_t hwirq;
>>> > +	struct irq_fwspec parent_fwspec, *fwspec = data;
>>> > +	struct mst_intc_chip_data *cd = (struct mst_intc_chip_data
>>> > *)domain->host_data;
>>> 
>>> No cast necessary here.
>>> 
>>> > +
>>> > +	/* Not GIC compliant */
>>> > +	if (fwspec->param_count != 3)
>>> > +		return -EINVAL;
>>> > +
>>> > +	/* No PPI should point to this domain */
>>> > +	if (fwspec->param[0])
>>> > +		return -EINVAL;
>>> > +
>>> > +	if (fwspec->param[1] >= cd->nr_irqs)
>>> 
>>> This condition is bogus, as it doesn't take into account the nr_irqs
>>> parameter.
>>> 
>> 
>> 
>> The hwirq number need to be in the irq map range. (property:
>> mstar,irqs-map-range)
>> If it's not, it must be incorrect configuration.
>
>I agree. And since you are checking whether the configuration is 
>correct,
>it'd better be completely correct.
>
>> So how about use the condition as following?
>> 
>> if (hwirq >= cd->nr_irqs)
>> 	return -EINVAL;
>
>Again, this says nothing of the validity of (hwirq + nr_irqs - 1)...
>

How about move this to mst_intc_domain_translate? Then all the irq_fwspec
point to domain mst_intc should be valid.

The mst_intc_domain_translate will be as following:

static int mst_intc_domain_translate(struct irq_domain *d,
				     struct irq_fwspec *fwspec,
				     unsigned long *hwirq,
				     unsigned int *type)
{
	struct mst_intc_chip_data *cd = d->host_data;

	if (is_of_node(fwspec->fwnode)) {
		if (fwspec->param_count != 3)
			return -EINVAL;

		/* No PPI should point to this domain */
		if (fwspec->param[0] != 0)
			return -EINVAL;

		if (fwspec->param[1] >= cd->nr_irqs)
			return -EINVAL;

		*hwirq = fwspec->param[1];
		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
		return 0;
	}

	return -EINVAL;
}


>> 
>>> > +		return -EINVAL;
>>> > +
>>> > +	hwirq = fwspec->param[1];
>>> > +	for (i = 0; i < nr_irqs; i++)
>>> > +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
>>> > +					      &mst_intc_chip,
>>> > +					      domain->host_data);
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
