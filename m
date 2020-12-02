Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93D0C64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 11:09:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBFD22203
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 11:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBFD22203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dupP0rQCFnLIrqUhIaC7Lbk/Pr0g8W9MSgPIMrx117M=; b=Vqv3010Qy7wzNYPjes6rsx8rd
	a7jQwrhOqf8qS+dK7k9g19UXBdgPzIWYCjL/RLYEJJEyUFMOfNLnuD4RjCBK+JvrVs8zCAklRh2+r
	Li8VMR0fBe3UeOZ7nthXzW+K7mGNjna6Z9NcD0MfJaOrm4+2VwCDieXM4bAU5MVtY18AVAtwayqWz
	gihdMmFGFmWGzFpsm1DWmT79HfjKKtxrJxRFbbGy5hjUQ55RxOqHw8FAOqMi33Ax8M0LLKo5FJNoi
	8hJ/Y0JI4e4gu6PqwVwdt+xqBGKpvTeRMUk04pWQlzMOpbECn6BOvD5XF5MH7gXkC/6VdrRvrmzxa
	lNCQ+Y/Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkQ0y-0002I0-7V; Wed, 02 Dec 2020 11:09:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkQ0t-0002Gh-NK; Wed, 02 Dec 2020 11:09:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606907372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/o0Ya2ytt0qpgEtW8XeELjEoL4CrZmijfrOfK1xOPyo=;
 b=KDF/IDMf5a4CSsTaTUcDV9k3G+DhomhtyJ4u7beErLXvr+ggjwfC1WCDVSEOIe7whmsvrF
 u7Y1+BiCDqhFO7xtXzFoCVcgD5r/BGMzyURjM+P5W4Ml8OWH6msr4IH3fG7tHSQvJKBH3h
 +7tnR7Iu7TImEC0Xb3kqiLb85eLd3P0JIX5jL6MhlF9Gpg+7SzjlbplVFrDvWOuwIVIhnk
 XxRsaUGPGx0w34/RomS+aCBJ2Jr61bh8fQIiD6XhCq3croDekYSSqA+0wE6XqHc7RX5/LL
 7fdMaDLQJEN1+LipyyZWlvfnmhZgyQIhha2VX4oDR1+tFkvgLjJ3bzmS6v6DVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606907372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/o0Ya2ytt0qpgEtW8XeELjEoL4CrZmijfrOfK1xOPyo=;
 b=/Z15kjCcCnd2dAv+5axCTrJNpEGl33TEMBoG0z707LUeRANX8nTLuq2b6ef+8E3mPK7yYT
 MoDxcdzxWXKLmIAQ==
To: Hanks Chen <hanks.chen@mediatek.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1 1/3] irqchip/gic: enable irq target all
In-Reply-To: <1606830870.6835.45.camel@mtkswgap22>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
 <1606486531-25719-2-git-send-email-hanks.chen@mediatek.com>
 <a3bd54fb5fe1c8ea11559d7459710263@kernel.org>
 <1606830870.6835.45.camel@mtkswgap22>
Date: Wed, 02 Dec 2020 12:09:31 +0100
Message-ID: <87r1o8ea6s.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_060936_003234_419A2869 
X-CRM114-Status: GOOD (  21.77  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, CC Hwang <cc.hwang@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hanks,

On Tue, Dec 01 2020 at 21:54, Hanks Chen wrote:
> On Fri, 2020-11-27 at 18:11 +0000, Marc Zyngier wrote:
>> On 2020-11-27 14:15, Hanks Chen wrote:
>> > +	/*
>> > +	 * No move required, if interrupt is 1 of N IRQ.
>> > +	 * write current cpu_online_mask into affinity mask.
>> > +	 */
>> > +	if (cpumask_weight(desc->irq_common_data.affinity) > 1) {
>> > +		cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
>> 
>> Again, this is totally bogus.
>> 
>
> If I add the target all flag into irq_common_data stucture to
> distinguish it. Would this be better?
>
> remove #ifdef CONFIG_ARM_IRQ_TARGET_ALL
>
> and
>
> if (desc->irq_common_data.irq_target_all)
> 	cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);

No. We are not adding random members to irq_common_data just to support
this. If at all this is a flag of the interrupt chip.

Also this copy is wrong to begin with. The affinity mask is only updated
on cpu hot-unplug when the outgoing CPU is the last online CPU in the
mask. Then we break the user/kernel supplied affinity mask and we only
do that when the interrupt is not affinity managed.

We do not remove offline CPUs from the affinity mask. The affinity code
of the irq chip has to ensure that only online CPUs can be
targeted. That's what ends up in effective_affinity.

>> > +#ifdef CONFIG_ARM_IRQ_TARGET_ALL
>> > +	/*
>> > +	 * No restore required, if interrupt is 1 of N IRQ.
>> > +	 */
>> > +	if (cpumask_weight(affinity) > 1) {
>> > +		cpumask_set_cpu(cpu, irq_data_get_affinity_mask(data));
>> > +		return;
>> > +	}

Heck no. This breaks managed interrupts and some more. Fiddling with the
irq affinity mask is wrong to begin with. Don't touch it ever.

>> > --- a/kernel/irq/manage.c
>> > +++ b/kernel/irq/manage.c
>> > @@ -270,7 +270,14 @@ int irq_do_set_affinity(struct irq_data *data,
>> > const struct cpumask *mask,
>> >  	switch (ret) {
>> >  	case IRQ_SET_MASK_OK:
>> >  	case IRQ_SET_MASK_OK_DONE:
>> > +#ifndef CONFIG_ARM_IRQ_TARGET_ALL
>> >  		cpumask_copy(desc->irq_common_data.affinity, mask);
>> > +#else
>> > +		if (cpumask_weight(mask) > 1)
>> > +			cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
>> > +		else
>> > +			cpumask_copy(desc->irq_common_data.affinity, mask);

Again, no. Touching the affinity mask is a NONO. The affinity mask is
handed in from either the kernel or from user space. This code has no
business to override that.

The only case where the kernel touches it is on CPU hot-unplug when the
last cpu in the affinity mask goes offline and if the interrupt is not
affinity managed.

>> - You pollute the core code with hacks that should never be there. If 
>> the
>>    current behaviour is a problem, please state what the problem is.
>> 
> We found the RCU warn when IRQs target to a offline CPU without I bit
> masked in CPU hot-plug flow
> I'll reproduce the issue again and show the log analysis for it.

That has absolutely nothing to do with any of the functions where you
fiddle with the affinity mask.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
