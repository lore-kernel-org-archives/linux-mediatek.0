Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F14C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:43:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2917204FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smMezYGD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2p4tG/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2917204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9PWlq43/yIVH8qaVqhJDFofZo02KVwtCaZ5aHz2qkUU=; b=smMezYGD08lD85zI1deM2zuk4
	IjY3xyihq5xodCQl/2MNOJD5+paXw26d6HZR7+9bT+bTZkmm3eroCnArwRiHw22ivKjEBCKmRXiEl
	pRrFpG0yuyo12zArzH2JScv2fty56ighcebp05vfUt63E7aKcdCkdvt9g8uXrZTZAts5VAOVt6p0V
	bENDWkLxQ0O/361WpKEutYdCLHXgaMxr1eFSRCFmB/x/FHO+zLusruhdkP3IiRp7R8ciKeku8WtEy
	OjXZOPFL47k9QyPyI2bMVkNiwT+SwXflNC81o/mjj+fUV7Yc9DLmKhkmwPkvZ/bWxeo0x3d7lq2na
	4E0foFsnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8OMi-0004O0-Qv; Wed, 19 Aug 2020 13:42:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8OMc-0004MX-L4; Wed, 19 Aug 2020 13:42:51 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3F5E204FD;
 Wed, 19 Aug 2020 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597844569;
 bh=nRHlZ1MnhuRCWEVlVgqtKUWgqsrlzs+w4Nj+dZAbawc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X2p4tG/lI4UDoGQ0sW7iBjo5mfR7OsNSzk2uNq3Xhim97qLQo2BUAax5CH6LxWxQ3
 SyLd/JY3Anlf1Vkm7UkfpDCr9hyV2G5dviys/6P/0z35NeRRb/G3vtxR+wiuYLfK9Q
 CM9M4FOLugd4F74QfZ7XQFOx/6L3XtyEgHhh141s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k8OMa-004DzN-87; Wed, 19 Aug 2020 14:42:48 +0100
MIME-Version: 1.0
Date: Wed, 19 Aug 2020 14:42:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
In-Reply-To: <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org> (raw)
References: <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org>
 <a8ee65eb4d86963bd2b56e86eec0ab3e@kernel.org> (raw)
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <f593f5e395c8558657a3f265b7038ec3@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mark-pk.tsai@mediatek.com, alix.wu@mediatek.com,
 daniel@0x0f.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 tglx@linutronix.de, yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_094250_794137_092A8589 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-19 14:31, Mark-PK Tsai wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
>> > +
>> > +static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned
>> > int virq,
>> > +				 unsigned int nr_irqs, void *data)
>> > +{
>> > +	int i;
>> > +	irq_hw_number_t hwirq;
>> > +	struct irq_fwspec parent_fwspec, *fwspec = data;
>> > +	struct mst_intc_chip_data *cd = (struct mst_intc_chip_data
>> > *)domain->host_data;
>> 
>> No cast necessary here.
>> 
>> > +
>> > +	/* Not GIC compliant */
>> > +	if (fwspec->param_count != 3)
>> > +		return -EINVAL;
>> > +
>> > +	/* No PPI should point to this domain */
>> > +	if (fwspec->param[0])
>> > +		return -EINVAL;
>> > +
>> > +	if (fwspec->param[1] >= cd->nr_irqs)
>> 
>> This condition is bogus, as it doesn't take into account the nr_irqs
>> parameter.
>> 
> 
> 
> The hwirq number need to be in the irq map range. (property:
> mstar,irqs-map-range)
> If it's not, it must be incorrect configuration.

I agree. And since you are checking whether the configuration is 
correct,
it'd better be completely correct.

> So how about use the condition as following?
> 
> if (hwirq >= cd->nr_irqs)
> 	return -EINVAL;

Again, this says nothing of the validity of (hwirq + nr_irqs - 1)...

> 
>> > +		return -EINVAL;
>> > +
>> > +	hwirq = fwspec->param[1];
>> > +	for (i = 0; i < nr_irqs; i++)
>> > +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
>> > +					      &mst_intc_chip,
>> > +					      domain->host_data);

... which you are using here.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
