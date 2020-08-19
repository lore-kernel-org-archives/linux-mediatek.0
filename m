Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296F3C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7CF20897
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxSXr2vv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzbRLU6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7CF20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U61VVZpi2P/mTuim6aKmxGRBMVzEvdANLWR1mlRdAoM=; b=kxSXr2vvFlwFhWannrpWzehjr
	ZdgOojJvOcCYkDtRya5tgYdo2sgtAEXSjKMDoFCqwVncNWzxLh4Oq8vcevMu/SLeAEnVd77QF2pMD
	49iWvh6t1l0dHMq91TZEnc4POL+0MfAwWzsJ7bmnSAIfD7gqk2AqegGgtxqc8JCQ5xk78ThwRkLy/
	oJNaZxBIVoViEKGrCR+6KwBC8bIzgoClt1Dfia28HaIKcTy2C/zTmMKdXtqk5QXWeWBi9QLex2dVr
	niKiNYxh5t6q9t934TQmdtVg2QhB2HxDoWZUs40JD4akOmErAT+ddLPYZYJRPPs2VlDSPuFTbW8ET
	hMrnHYSPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Pwv-0005ZZ-Hp; Wed, 19 Aug 2020 15:24:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Pwr-0005YD-E1; Wed, 19 Aug 2020 15:24:22 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E18B220897;
 Wed, 19 Aug 2020 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597850660;
 bh=hHa5rHHEdmaLPV8IAAgl2hoR1WMKnusCrOaK/4DnvIM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SzbRLU6uplI9w6fF5ALOG9qTdPUx4A/TcBFXF5MUcMy7oWkEp2G5W2+VgF7Jwd7fn
 Ktrm0XTFXwDXpE1EcWltK4ppy8NwfHG9YElNZ5Wyc7T1xGGOzPNAF9wK59JeqeOP8C
 tFbNuQD+Eq5tGugI17/6zzsdxmKZcc49JnubXs+Y=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k8Pwn-004Fc2-Tn; Wed, 19 Aug 2020 16:24:18 +0100
MIME-Version: 1.0
Date: Wed, 19 Aug 2020 16:24:17 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
In-Reply-To: <20200819145525.26315-1-mark-pk.tsai@mediatek.com>
References: <f593f5e395c8558657a3f265b7038ec3@kernel.org>
 <20200819145525.26315-1-mark-pk.tsai@mediatek.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <85749ec80ad0b9c85e3984c808d02b9c@kernel.org>
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
X-CRM114-CacheID: sfid-20200819_112421_601133_F02CFC30 
X-CRM114-Status: GOOD (  21.78  )
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

On 2020-08-19 15:55, Mark-PK Tsai wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
>> On 2020-08-19 14:31, Mark-PK Tsai wrote:
>>> From: Marc Zyngier <maz@kernel.org>
>>> 
>>>> > +
>>>> > +static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned
>>>> > int virq,
>>>> > +				 unsigned int nr_irqs, void *data)
>>>> > +{
>>>> > +	int i;
>>>> > +	irq_hw_number_t hwirq;
>>>> > +	struct irq_fwspec parent_fwspec, *fwspec = data;
>>>> > +	struct mst_intc_chip_data *cd = (struct mst_intc_chip_data
>>>> > *)domain->host_data;
>>>> 
>>>> No cast necessary here.
>>>> 
>>>> > +
>>>> > +	/* Not GIC compliant */
>>>> > +	if (fwspec->param_count != 3)
>>>> > +		return -EINVAL;
>>>> > +
>>>> > +	/* No PPI should point to this domain */
>>>> > +	if (fwspec->param[0])
>>>> > +		return -EINVAL;
>>>> > +
>>>> > +	if (fwspec->param[1] >= cd->nr_irqs)
>>>> 
>>>> This condition is bogus, as it doesn't take into account the nr_irqs
>>>> parameter.
>>>> 
>>> 
>>> 
>>> The hwirq number need to be in the irq map range. (property:
>>> mstar,irqs-map-range)
>>> If it's not, it must be incorrect configuration.
>> 
>> I agree. And since you are checking whether the configuration is
>> correct,
>> it'd better be completely correct.
>> 
>>> So how about use the condition as following?
>>> 
>>> if (hwirq >= cd->nr_irqs)
>>> 	return -EINVAL;
>> 
>> Again, this says nothing of the validity of (hwirq + nr_irqs - 1)...
>> 
> 
> How about move this to mst_intc_domain_translate? Then all the 
> irq_fwspec
> point to domain mst_intc should be valid.
> 
> The mst_intc_domain_translate will be as following:
> 
> static int mst_intc_domain_translate(struct irq_domain *d,
> 				     struct irq_fwspec *fwspec,
> 				     unsigned long *hwirq,
> 				     unsigned int *type)
> {
> 	struct mst_intc_chip_data *cd = d->host_data;
> 
> 	if (is_of_node(fwspec->fwnode)) {
> 		if (fwspec->param_count != 3)
> 			return -EINVAL;
> 
> 		/* No PPI should point to this domain */
> 		if (fwspec->param[0] != 0)
> 			return -EINVAL;
> 
> 		if (fwspec->param[1] >= cd->nr_irqs)
> 			return -EINVAL;
> 
> 		*hwirq = fwspec->param[1];
> 		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> 		return 0;
> 	}
> 
> 	return -EINVAL;
> }

It would make more sense.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
