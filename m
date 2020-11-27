Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99673C5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 19:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205E224137
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 19:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJspxQYN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yzOuRLDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205E224137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2CPdH24sD3H2uV40DX4vj4ZrRks9nNduSX/4g9z/g5k=; b=aJspxQYNH9VKhl6EnS0qTCY/V
	kmCecRQWZYt1BHllCYmdOPyPM087/Onm4M9YrYGiYYyEKfG+LnIoMlDGYRHYwoBzi9iMpFI5rvqs2
	ndziMgUtD9gCHVtIzPhtnChajAQ8Kh7n2njn3rooMT5ZBvCUGRU1tg6lFTv/reniIbQtB9GYyYlPP
	72giE8DKMnU2UK4FkGdUDCfpwklKnzPvQ2FGfLOyky2j4nmTnmCodC/vUqSBgLQZbnmBPzoSxkoIw
	qVyhibLVOOcfBQ/liMKZrzbzvyks+oxDb8gnDGsGg/Hfd2rCaQJ1//snau7qwTuWIcUjh16bviO0I
	dnnOtubyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kijek-0005k8-MO; Fri, 27 Nov 2020 19:43:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijeh-0005jQ-8v; Fri, 27 Nov 2020 19:43:44 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1275D24101;
 Fri, 27 Nov 2020 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606506222;
 bh=7ujO+KYr0YlgsozIs8GtOPMUFRnhc+7f76/at6EGjss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yzOuRLDlBY/lQvtkbXcRWppVCTvoqXGJhgcJc4Q2PhCCeDP4gQ/T+HvVXDArxv744
 yakYiDQcJJzrjncJ1/FAUFxxs4/2JWkDf28VtCu0lYifHffnQ4V2nz4jv7Rs+GoJEE
 bVa5VV9wbXRsJQQIhPS6Yoij9cx+9aHBLTCy9P0I=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kijee-00E99B-5i; Fri, 27 Nov 2020 19:43:40 +0000
MIME-Version: 1.0
Date: Fri, 27 Nov 2020 19:43:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v1 1/3] irqchip/gic: enable irq target all
In-Reply-To: <20201127185610.GA30096@gaia>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
 <1606486531-25719-2-git-send-email-hanks.chen@mediatek.com>
 <a3bd54fb5fe1c8ea11559d7459710263@kernel.org> <20201127185610.GA30096@gaia>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <dab968d8c7629c7aebc5e62770a9743d@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, hanks.chen@mediatek.com,
 tglx@linutronix.de, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 cc.hwang@mediatek.com, kuohong.wang@mediatek.com, loda.chou@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_144343_462308_7BBF04A0 
X-CRM114-Status: GOOD (  20.96  )
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
 Loda Chou <loda.chou@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-27 18:56, Catalin Marinas wrote:
> On Fri, Nov 27, 2020 at 06:11:01PM +0000, Marc Zyngier wrote:
>> On 2020-11-27 14:15, Hanks Chen wrote:
>> > Support for interrupt distribution design for SMP system solutions.
>> 
>> As far as I know, we have been supporting interrupt distribution on
>> ARM SMP systems pretty well for the past... what... 15 years?
>> I'm sure Russell can dig out an ARM926 SMP system that even predates
>> that.
>> 
>> > With this feature enabled ,the SPI interrupts would be routed to
>> > all the cores rather than boot core to achieve better
>> > load balance of interrupt handling.
>> 
>> Please quantify this compared to the current distribution method.
>> 
>> > That is, interrupts might be serviced simultaneously on different CPUs.
>> 
>> They already can. What is new here? Or do you mean the *same* 
>> interrupt
>> being serviced by different CPUs *at the same time*? That'd be fun.
> 
> IIRC (it's been many years since I looked at the GIC), more than one 
> CPU
> is woken and if they all read the INTACK, only one of them gets the
> actual IRQ number, the others see a spurious interrupt. I thought we
> decided that's not an efficient way to handle interrupts, so a software
> irqbalancer is better.
> 
> Has anything changed since then?

What you describe is mostly the GICv1/v2 behaviour.

GICv3 *can* be slightly better in that respect, as long as you force
the synchronization from the CPU interface back to the redistributor
via PHME and a DSB SY on each priority change.

Which means what whatever you gain from not interrupting the other CPUs,
you waste it by forcing synchronization system wide.

> I'm also concerned that in a big.LITTLE system, you may see the big 
> CPUs
> taking the interrupts all the time, which is nice for energy 
> efficiency.

Yes, this is bound to happen. It means you cannot place interrupts
on a small cluster unless you completely hotplug the big cores off,
thanks to the "more than one means all" nonsense.

And since these patches seem to also break hotplug, that's... fun.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
