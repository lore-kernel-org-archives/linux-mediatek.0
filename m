Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4CCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 22:33:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1ED206DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 22:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qfXZC4BZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mhtQBufT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1ED206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/0fwCaoQXH/Lt+dZSs6nFlJ26czzS1Re5UVWZQR1ZQ=; b=qfXZC4BZ3jZJVzVnLDj9XKZOB
	KRK1MSp2HSlBsx8lUxSA8lmnewbbtjyZrDkHYat9jHtXQ6tch4YTVy5sdGWFbMOR2E5S0MZrTUAO0
	sZOjzl6210ZeKdJNR05pdxhuv793aZVoFK4g5AXnj5mtJlxWYXFrbXsr3/BtFYkd0DuIdNZ70yVRf
	GRmsk6xrXmFHrh7Q4pljg3iC0S9x2wAkfUpvZQhmdzKTmKlNsoqC/YEb4uTF6ZzyN3uXhtl3sPbh8
	BxgHs3ISooZUc8kYE1Tp5kFRQuy2wpY6FqY+1GsxuMRkBi1/+e7afjT4f/mRzw1c393jI5QhiP7OQ
	7jTkgjAeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5GMO-0004Dc-Dn; Mon, 10 Aug 2020 22:33:40 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5GMK-0004Ai-Gz
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 22:33:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id y206so6520465pfb.10
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 15:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7ZfdynehOdybqijT/Iim3hOWf1+yvwIpK/H7v550UQ=;
 b=mhtQBufTPANHwJt2YnyJ/vLi8+sR6/jg0gf8krTkW7x+L/KIh2eF3Y25ypKQKj9eWQ
 tgbLDbBM6IE0m6FyEMSx9Lf8gKi71rjxKVxlh3QgXE0PD70t5TUELjSWWcr5FzHWft0p
 fWjKTYUFd1tCnYomCDpU5Yqyob35Egp5DlfkjDxCOKcqU60ZTJ0HqbJ5sfR2yQtWnyHy
 jKM+WiclhG925nM7/r3iiPEa8WPWjOP4ajTCyse9YDiMGVgHVi3YwcBU4yyPWBXUtBV6
 aC2kcORjgG0XDv3MmSZfNNvxhdZO+QvJ9aeXFO4p1uX7Dl+iIDUCvT1cLvyyyZdT/8IK
 KfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7ZfdynehOdybqijT/Iim3hOWf1+yvwIpK/H7v550UQ=;
 b=JilGzNI0D2O9XZJ6hkTdZh68b/J+hExQqQ4hhCygxtGYnivi47AEhOp7stEbjaAaws
 gTRzvdVS7RDZ9v7v22ejWqxaK1yZOVWlGpVcohAMD6OgdDNz5LKWt81Finz3X7EA3ah/
 O8O6BUZ85dooHcttrciAIb5donjdlZXx+bT7oiphpuuGP+aL/t6hLvGO+KYdpy204uk3
 c77xJzHQpBSFnvfffucrZE/XVW8zo0CL8xTBG+U+YZXrgbtpGIYQvVS1RrXY6P6G8FYC
 L3obXI0ahQ10m0x7aAqRdUdleQux8CjGHU5COkg2QLIqf3LqeR39hbnAzYxyl/rajxEf
 HZzQ==
X-Gm-Message-State: AOAM5334xfpUkk8vFxldU+fq3wG49gHr5q7gh9rllJAgq0rQpXFSs8hb
 M5AMLZWoMZikCWFocMk46me5RZGxxL2asVZ7UG5Vcw==
X-Google-Smtp-Source: ABdhPJzXTvIZAHfH9jpUrtK3vUE/qI8VWhuaoQktb5lbMLN9zEI8agpeALqtVf0qPpZVQ0WKCLyimURi+ymlHxcwJLA=
X-Received: by 2002:a63:4e56:: with SMTP id o22mr8537935pgl.381.1597098813343; 
 Mon, 10 Aug 2020 15:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-3-ndesaulniers@google.com>
 <CAN=-Rxty=Ux5rj-VQSZH-ryj1RiNJvy7mRE7uyx_YAndGtcq7Q@mail.gmail.com>
In-Reply-To: <CAN=-Rxty=Ux5rj-VQSZH-ryj1RiNJvy7mRE7uyx_YAndGtcq7Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Aug 2020 15:33:22 -0700
Message-ID: <CAKwvOdkNLK2cRfY+DA0u3KuY5PuEss5Qox6X3zzpL053pARfrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: backtrace-clang: add fixup for lr dereference
To: Nathan Huckleberry <nhuck15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_183336_951009_1E5156D3 
X-CRM114-Status: GOOD (  26.46  )
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
 Russell King <linux@armlinux.org.uk>, "# 3.4.x" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 3:39 PM Nathan Huckleberry <nhuck15@gmail.com> wrote:
>
> Mostly looks good to me. Just a minor nit.
>
> On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > If the value of the link register is not correct (tail call from asm
> > that didn't set it, stack corruption, memory no longer mapped), then
> > using it for an address calculation may trigger an exception.  Without a
> > fixup handler, this will lead to a panic, which will unwind, which will
> > trigger the fault repeatedly in an infinite loop.
> >
> > We don't observe such failures currently, but we have. Just to be safe,
> > add a fixup handler here so that at least we don't have an infinite
> > loop.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: commit 6dc5fd93b2f1 ("ARM: 8900/1: UNWINDER_FRAME_POINTER implementation for Clang")
> > Reported-by: Miles Chen <miles.chen@mediatek.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/arm/lib/backtrace-clang.S | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> > index 5388ac664c12..40eb2215eaf4 100644
> > --- a/arch/arm/lib/backtrace-clang.S
> > +++ b/arch/arm/lib/backtrace-clang.S
> > @@ -146,7 +146,7 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
> >
> >                 tst     sv_lr, #0               @ If there's no previous lr,
> >                 beq     finished_setup          @ we're done.
> > -               ldr     r0, [sv_lr, #-4]        @ get call instruction
> > +prev_call:     ldr     r0, [sv_lr, #-4]        @ get call instruction
> >                 ldr     r3, .Lopcode+4
> >                 and     r2, r3, r0              @ is this a bl call
> >                 teq     r2, r3
> > @@ -206,6 +206,13 @@ finished_setup:
> >                 mov     r2, frame
> >                 bl      printk
> >  no_frame:      ldmfd   sp!, {r4 - r9, fp, pc}
> > +/*
> > + * Accessing the address pointed to by the link register triggered an
> > + * exception, don't try to unwind through it.
> > + */
> > +bad_lr:                mov     sv_fp, #0
>
> It might be nice to emit a warning here since we'll
> only hit this case if something fishy is going on
> with the saved lr.

Yeah, something fishy is going on if that ever happens.  Let me create
a V2 with an additional print.

>
> > +               mov     sv_lr, #0
> > +               b       finished_setup
> >  ENDPROC(c_backtrace)
> >                 .pushsection __ex_table,"a"
> >                 .align  3
> > @@ -214,6 +221,7 @@ ENDPROC(c_backtrace)
> >                 .long   1003b, 1006b
> >                 .long   1004b, 1006b
> >                 .long   1005b, 1006b
> > +               .long   prev_call, bad_lr
> >                 .popsection
> >
> >  .Lbad:         .asciz  "%sBacktrace aborted due to bad frame pointer <%p>\n"
> > --
> > 2.28.0.163.g6104cc2f0b6-goog
> >
>
> Thanks,
> Huck



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
