Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8A4C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FF421D7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fZPLoeIv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmJvBhHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FF421D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=urkcAN+azFxWj0cuPFHwt5yO0H1CGczAyCGS6g4qSXg=; b=fZPLoeIvL6KAX8SIkloVKkv7G
	jiUk7JUWvsWf1kVi1nmUsT8J3n9b/Yx91XsK18Z5c33j3EgOSxIXg4ZA53GR+X0XXfYiS2oOetytD
	T8UN1BH31pFXabeIMU4k2NJwfYflznLvUoKeir34hi1w0d4QstRIX0g4Dm6dQsak/F0NEJQAJI3ym
	jBPBGD5ZXcZxQCpoef01kR1OII200jNhDAbQOyvZFmdSoo++duhm4GuUzwqonnuetMswmCuFZNL14
	OI1broUkO5/aswjbpIE3e/pZ3o8Kqjafe1wQPaoNkjwVJtOsNwrYYB0f+puaPMPkukbD7+emIaBHx
	HR+QwywQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiiSi-0007fd-GS; Fri, 27 Nov 2020 18:27:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiiSe-0007e6-63; Fri, 27 Nov 2020 18:27:12 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DDE121534;
 Fri, 27 Nov 2020 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606501631;
 bh=Lu84xRTk7cx2H7+emSh0+FVhYJQrZ8oQSXubGcw8RA4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FmJvBhHrSkTmADhmrlMCa8Zvvpo3z0Pfws8fPyf4dY8H4Y4SCaso+jZJTrGpL7jg9
 3pEBem/Uk4xGgwdJQ/tuw+KOAswEdYapkHiNgrfPhksfp6HQix1o/rlIbbbB0g0OTx
 o0NWifoGHWaVX9BLAi2xo8k1ChlBz7AsETYTlkrY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kiiSb-00E8P8-1u; Fri, 27 Nov 2020 18:27:09 +0000
MIME-Version: 1.0
Date: Fri, 27 Nov 2020 18:27:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v1 3/3] arm64: disable irq on cpu shutdown flow
In-Reply-To: <1606486531-25719-4-git-send-email-hanks.chen@mediatek.com>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
 <1606486531-25719-4-git-send-email-hanks.chen@mediatek.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <e0fb8fade871b08295ed2be488406ff3@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: hanks.chen@mediatek.com, tglx@linutronix.de,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 cc.hwang@mediatek.com, kuohong.wang@mediatek.com, loda.chou@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_132712_351082_2B11C09D 
X-CRM114-Status: GOOD (  21.34  )
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
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-27 14:15, Hanks Chen wrote:
> Disable irq on cpu shutdown flow to ensure interrupts
> did not bother this cpu after status as offline.
> 
> To avoid suspicious RCU usage
> (0)[0:swapper/0]RCU used illegally from offline CPU! ...
> (0)[0:swapper/0]lockdep: [name:lockdep&]cpu_id = 0, cpu_is_offline = 1

This needs to be explained *a lot* more .

My hunch is that because a CPU going offline can still receive 
interrupts
thanks to your interrupt broadcast hack, you break some the core 
expectations,
and RCU shouts at you.

If that's indeed the case, I don't think the architecture code needs 
fixing
(or at least, not for that).

> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  arch/arm64/kernel/smp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 82e75fc2c903..27a6553fa86f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -308,6 +308,12 @@ int __cpu_disable(void)
>  	remove_cpu_topology(cpu);
>  	numa_remove_cpu(cpu);
> 
> +	/*
> +	 * we disable irq here to ensure interrupts
> +	 * did not bother this cpu after status as offline.
> +	 */
> +	local_irq_disable();
> +
>  	/*
>  	 * Take this CPU offline.  Once we clear this, we can't return,
>  	 * and we must not schedule until we're ready to give up the cpu.

Conveniently, the code that takes care of migrating the interrupts is
just below this comment.  Which strongly suggests that the interrupt
migration is broken by your earlier patch.

> @@ -842,9 +848,10 @@ void arch_irq_work_raise(void)
> 
>  static void local_cpu_stop(void)
>  {
> +	local_daif_mask();
> +
>  	set_cpu_online(smp_processor_id(), false);
> 
> -	local_daif_mask();
>  	sdei_mask_local_cpu();
>  	cpu_park_loop();
>  }

What problem are you addressing here?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
