Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95489C001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 19:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5BUcp4rF73339tUbdxChTzYXicpDGHwoyiHDjbgdIQ=; b=wRZ4sCH2UrNFbqovlm+bRqk3XC
	wpD9LyoaKZs76+1VJC99RPunGwQOPAIqJIIonNgPft0alptFRbCVoUv/JT8G6URT7kdV9HpDpCmJV
	A1deiYIdIdkrQg9wTPLALwBc7RU3ZF3H67tiLZQKZNYJtQ3FMQl0ox8QZ0ZCeLs5FK5Fb2GdIJEGp
	pSZ9FU9khKM18pEcMvejP7SXUq4tN5yQGWO5hfiIY2vXo3ib8YBmfXnIgYDwrpO31rg7LwNe6puEh
	ahV6OeSDnSy+qW7RTHi/oOFZ8wxNkCk9JbZ/3lfP+QNcLydrfQvlaYUquZePsjgQLRdpgBXfWDVpD
	7KbKLR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBOH-008YvS-1T;
	Thu, 10 Aug 2023 19:32:13 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBOE-008YuH-37
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 19:32:12 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-564d6aa9abdso1750669a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691695925; x=1692300725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n5BUcp4rF73339tUbdxChTzYXicpDGHwoyiHDjbgdIQ=;
        b=MUhRj4IulKry/rRZHaY3UgOWWMElBQrZl4hueG5jLdyTT2NIolBHKKjvU4Y0TzRsrV
         +wxsVbj+iSIqkXPRzCoYDK57C46cw7kTcbKwyUpB76DazMVmyYYiSy6GhVq+Dhfl6HN/
         vUgOY4RX1nzfdz3uoA+58xgi8C9eqv2Wdwhi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691695925; x=1692300725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5BUcp4rF73339tUbdxChTzYXicpDGHwoyiHDjbgdIQ=;
        b=N0h/KmIjTpeoTKkTSKKV7nVwgQQYzl6Ob5AU3aIIB0Ij674cp7I8IxVGZd5RuatruX
         ufPYat38RY2uzYlWOXMKcVLpz9sCox3m20MXlYvni7RNN5MbDXPJpDadQrJRiZHTrZBn
         rxyFcMuguJVlsfHwj1SmKRsn1WGAYxpfzxj6hFRC4kjq7N5+AaC/kVvmnKBy/RDQD/RO
         4SKzw1beRp7DA7PVaiyk5juRx6sOAl/EiX9zJV/iqZ+AVDfo2zFt4cKVyhFyZQf0nNgS
         0YBq5n9dZBSu9VhTJIgJECNJ9MHSLGuDoheaGRmV9VhIJJho+BWdUOz8Ocq6rMl7x4h9
         Aqyw==
X-Gm-Message-State: AOJu0YzssvrdCzmoIIEtJ9p5a/hNLVCw/zgBmwYoFZ9FEcMGuljrkfw3
	VDYc42Dxj0aiAKZKkhvQbnckZw==
X-Google-Smtp-Source: AGHT+IEOUo5qUDRJcUued1hIUrxl+tnnYRC3515yaFsDbHi7mTOPBSy4Sn1t0M7Wa4EdXVSzgg3wqg==
X-Received: by 2002:a05:6a20:431b:b0:13a:dd47:c31a with SMTP id h27-20020a056a20431b00b0013add47c31amr3971923pzk.20.1691695925514;
        Thu, 10 Aug 2023 12:32:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k17-20020a637b51000000b005639da5a8e2sm1896326pgn.2.2023.08.10.12.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:32:04 -0700 (PDT)
Date: Thu, 10 Aug 2023 12:32:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ARM: ptrace: Restore syscall skipping and restart while
 tracing
Message-ID: <202308101209.45CF7C6F80@keescook>
References: <20230804071045.never.134-kees@kernel.org>
 <f34c11eb-89b5-48a5-bd24-c215083575a5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34c11eb-89b5-48a5-bd24-c215083575a5@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_123211_004994_6FF47BE6 
X-CRM114-Status: GOOD (  32.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 09, 2023 at 09:47:24PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 4, 2023, at 09:10, Kees Cook wrote:
> > Since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
> > thread_info->abi_syscall"), the seccomp selftests "syscall_errno",
> > "syscall_faked", and "syscall_restart" have been broken. This was
> > related to two issues:
> 
> While it looks like my patch introduced both problems, it might
> be better to split your fix into two bits.

Okay, sounds good.

> > - seccomp and PTRACE depend on using the special value of "-1" for
> >   skipping syscalls. This value wasn't working because it was getting
> >   masked by __NR_SYSCALL_MASK in both PTRACE_SET_SYSCALL and
> >   get_syscall_nr().
> 
> > Explicitly test for -1 in PTRACE_SET_SYSCALL and get_syscall_nr(),
> > leaving it exposed when present, allowing tracers to skip syscalls
> > again.
> 
> This part looks good to me, at least it seems to be one of multiple
> ways of doing this, depending on how we want to encode the
> syscall skipping in the variable.
> 
> > - the syscall entry label "local_restart" is used for resuming syscalls
> >   interrupted by signals, but the updated syscall number (in scno) was
> >   not being stored in current_thread_info()->abi_syscall, causing traced
> >   syscall restarting to fail.
> >
> > Move the AEABI-only assignment of current_thread_info()->abi_syscall
> > after the "local_restart" label to allow tracers to survive syscall
> > restarting.
> 
> I'm not following exactly what you are doing here yet, but I suspect
> this part is wrong:
> 
> > diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
> > index bcc4c9ec3aa4..08bd624e4c6f 100644
> > --- a/arch/arm/kernel/entry-common.S
> > +++ b/arch/arm/kernel/entry-common.S
> > @@ -246,8 +246,6 @@ ENTRY(vector_swi)
> >  	bic	scno, scno, #0xff000000		@ mask off SWI op-code
> >  	str	scno, [tsk, #TI_ABI_SYSCALL]
> >  	eor	scno, scno, #__NR_SYSCALL_BASE	@ check OS number
> > -#else
> > -	str	scno, [tsk, #TI_ABI_SYSCALL]
> >  #endif
> >  	/*
> >  	 * Reload the registers that may have been corrupted on entry to
> > @@ -256,6 +254,9 @@ ENTRY(vector_swi)
> >   TRACE(	ldmia	sp, {r0 - r3}		)
> > 
> >  local_restart:
> > +#if defined(CONFIG_AEABI) && !defined(CONFIG_OABI_COMPAT)
> > +	str	scno, [tsk, #TI_ABI_SYSCALL]	@ store scno for syscall restart
> > +#endif
> >  	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
> >  	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
> > 
> 
> If the local_restart code has to store the syscall number
> for an EABI-only kernel, wouldn't it have to also do this
> for a kernel with OABI-only or OABI_COMPAT support?

This is the part I wasn't sure about. Initially I was thinking it didn't
matter because it's only a problem for a seccomp tracer, but I realize
it might be exposed to a PTRACE tracer too. I was only able to test with
EABI since seccomp is disabled for OABI_COMPAT.

Anyway, syscall restart is done this way:

        movlt   scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)

Can a EABI call restart an OABI syscall? I think so?

So maybe we just need to add:

	str     scno, [tsk, #TI_ABI_SYSCALL]    @ store scno for syscall restart

after that instead of moving it like I did originally?

Let me test that...

-- 
Kees Cook

