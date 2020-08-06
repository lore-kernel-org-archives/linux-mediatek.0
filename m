Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3054C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 22:39:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EEE2224D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 22:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDMIXegD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWwFoqGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97EEE2224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nc/yJT1wNGdhwMjPjgzcqAX/IXWURpyZcOdCwkp9e6Y=; b=HDMIXegDKFRdK9058F7XpMfH2
	GQdP9XKFe+/CsEaBa+UTdbBxsd9mh40EFrUYKT8wRz/RzGeOlVOjQLYO/FZsgUdAIynuCIfrmOpqS
	ClFBVrW3/66LvrzWEpDVw060Uk4606HrX08htZnnnlZKdQFhzbB9VCBA4I3hZUt+M91YEPrU5bn7r
	3QlMe9P+edKDwiPTT5/GO2W68TjS5UCqyEhM/29+Im1UEluMjaC/mN8TZ2Uk/JDiyE8LZ+AH9kUdM
	CSLMdiDCzCnX6Z89yYCcO6CZkLXLpywneAppoPqc2EhtCSQsPqWCn6iIMtvrqcv4Ij3gjk5CZcyJu
	BbIXaf8nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3oXS-0001fJ-SM; Thu, 06 Aug 2020 22:39:06 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3oXO-0001eI-Rq; Thu, 06 Aug 2020 22:39:03 +0000
Received: by mail-oi1-x243.google.com with SMTP id b22so163569oic.8;
 Thu, 06 Aug 2020 15:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ne1iYZprPZsaiWqWZFllfuyUnxnmRkcPCgewhYs7+po=;
 b=oWwFoqGba2t65iV+0hVJvoo34WVzexMPem5bmNrBL2po0vMgi7NmTYQnYyI/pK9BPL
 JEeCUzLouqqweosS1VJ3yAv/DIUZ58V2TeGJV+2vBVGcGw5DgK0PIliW/SRbGaYI69RM
 aw/fTT5Kwv9QtuMRO1O32xkqGq6citRBosNGQc1Fkf8vgCgxzsXc+iuZfcjFVa+9W9mJ
 P95qUCukRV+2zlroNs8CYWd8S7AuoLWQns9qNS/q4DiPOzzAg9r3uSEah1PBfRMaEVw8
 xHHv0C9s3+5LRHBRnuAQDkWMUPjzLeV5xx9lgb8J1li9YC6gpmudNnGNnS7ByakiCOH6
 MafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ne1iYZprPZsaiWqWZFllfuyUnxnmRkcPCgewhYs7+po=;
 b=OVZjM3Pf+B45z8FCRPu9XT5MnvdU6CCkEJ+fuhOxbm3RwF6/k7YkHH0U5LWpYZRDhS
 CHyO78j3yXLbryapd6Tdv1bNIZGasZdmWCBYyNFswUNcS/FdfwqRKYRVsrQFvUTNWdIE
 91a/CfL77NAK4goCeFrJJ0yDXp2rqF3bbXeVv1asmVbxsgvSopyWpmkYCdXO9zsxecyw
 gteuPMaMnJguTQ8PStOgQ3Lub9Iif6hZTG1rrCf6fdEJMbaN57iZmADeRots/E3+dEL2
 iY1lKUnsAFIStS3JiUgqd+nZ4prxbhT9BlhPZss8dPRftHdosjHCyvQax25obZYci3hk
 QA7A==
X-Gm-Message-State: AOAM532zvyD4qivBj/eoGs5K7EBV6LV8cGlVkUxVWtaKJeYJT7pmLY+8
 O7u62f6NMNJBRQVhFtRjkaq+VXo+gZYEv0TbWxU=
X-Google-Smtp-Source: ABdhPJw24FLE0cOWVKOoxoFIzofMAQlqhvnejmnRS9N4YG08WW27U7QHzTUC4wI/BCAaa2dgO3tta2o3+MD5w0Lq8pI=
X-Received: by 2002:aca:2306:: with SMTP id e6mr9080081oie.108.1596753539610; 
 Thu, 06 Aug 2020 15:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-3-ndesaulniers@google.com>
In-Reply-To: <20200730205112.2099429-3-ndesaulniers@google.com>
From: Nathan Huckleberry <nhuck15@gmail.com>
Date: Thu, 6 Aug 2020 17:38:46 -0500
Message-ID: <CAN=-Rxty=Ux5rj-VQSZH-ryj1RiNJvy7mRE7uyx_YAndGtcq7Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: backtrace-clang: add fixup for lr dereference
To: Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_183902_941379_7C619DF9 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mostly looks good to me. Just a minor nit.

On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> If the value of the link register is not correct (tail call from asm
> that didn't set it, stack corruption, memory no longer mapped), then
> using it for an address calculation may trigger an exception.  Without a
> fixup handler, this will lead to a panic, which will unwind, which will
> trigger the fault repeatedly in an infinite loop.
>
> We don't observe such failures currently, but we have. Just to be safe,
> add a fixup handler here so that at least we don't have an infinite
> loop.
>
> Cc: stable@vger.kernel.org
> Fixes: commit 6dc5fd93b2f1 ("ARM: 8900/1: UNWINDER_FRAME_POINTER implementation for Clang")
> Reported-by: Miles Chen <miles.chen@mediatek.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/lib/backtrace-clang.S | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> index 5388ac664c12..40eb2215eaf4 100644
> --- a/arch/arm/lib/backtrace-clang.S
> +++ b/arch/arm/lib/backtrace-clang.S
> @@ -146,7 +146,7 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
>
>                 tst     sv_lr, #0               @ If there's no previous lr,
>                 beq     finished_setup          @ we're done.
> -               ldr     r0, [sv_lr, #-4]        @ get call instruction
> +prev_call:     ldr     r0, [sv_lr, #-4]        @ get call instruction
>                 ldr     r3, .Lopcode+4
>                 and     r2, r3, r0              @ is this a bl call
>                 teq     r2, r3
> @@ -206,6 +206,13 @@ finished_setup:
>                 mov     r2, frame
>                 bl      printk
>  no_frame:      ldmfd   sp!, {r4 - r9, fp, pc}
> +/*
> + * Accessing the address pointed to by the link register triggered an
> + * exception, don't try to unwind through it.
> + */
> +bad_lr:                mov     sv_fp, #0

It might be nice to emit a warning here since we'll
only hit this case if something fishy is going on
with the saved lr.

> +               mov     sv_lr, #0
> +               b       finished_setup
>  ENDPROC(c_backtrace)
>                 .pushsection __ex_table,"a"
>                 .align  3
> @@ -214,6 +221,7 @@ ENDPROC(c_backtrace)
>                 .long   1003b, 1006b
>                 .long   1004b, 1006b
>                 .long   1005b, 1006b
> +               .long   prev_call, bad_lr
>                 .popsection
>
>  .Lbad:         .asciz  "%sBacktrace aborted due to bad frame pointer <%p>\n"
> --
> 2.28.0.163.g6104cc2f0b6-goog
>

Thanks,
Huck

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
