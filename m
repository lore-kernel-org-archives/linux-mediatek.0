Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245FC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMvbgtLm3o5PK9BxEA0pI7DAuLsjiB4F7y1PvOelLnY=; b=W/sRvLF8ijyFlKoaRISxwOtFYu
	xmJ2avXW/j4FpMEAWbRQTHwUd4yZ+4NQESBwqwtWXcb2lsf0NwXL+042ecmRzJHU3hHiNKq9XAypC
	PCybEDj7Ek94Rm+2exbQSWP9xCg1bNo8n0Wqp+mEGtYQSFwVPhLY9iL/Jdn/wPWwRhwkZGqEcYsuq
	UjA7qp+dpKzZgAGSBjnHAOd1EokSnF9bEdXN2bOtQvVeqrEFukCNgw69Y0wWD4Je639BkhKdc6D/v
	UN5hBwdYCsa0BU1GF2B/OTE6WwWIG8KDZeeMqxT5t2HUMvlAhTEugmCbrw/CFMInZpqqGrQfU2gYM
	7+HcqyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUC4S-008dUU-0y;
	Thu, 10 Aug 2023 20:15:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUC4O-008dSu-2A
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 20:15:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bb9e6c2a90so11841575ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691698541; x=1692303341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMvbgtLm3o5PK9BxEA0pI7DAuLsjiB4F7y1PvOelLnY=;
        b=RW37KCo80cM+P0Mbw74kT7T+WaIbB0/vXrToVyJUMkfjcINUtf/QA11X8JjOiReL/i
         /nEwqJwmgfomIhtRdr+h4Nsg2rbUgfpz/rFV0NK3GpscFGF3B9v9weolkIBkV5gRrv3Y
         eaGosJLsqTFEyUlypwRteNKCrwSUKMNkRgTZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691698541; x=1692303341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMvbgtLm3o5PK9BxEA0pI7DAuLsjiB4F7y1PvOelLnY=;
        b=Wt2e0oj6aaJyPnO3EKjLViWglBTDayA3XVrn3x+5e4Ab0htaS6ft5Mes0OrDTLRujk
         RIANWstVfDW9DoZ2VCtNe4rEJmkcl3Y1omeZPo8HJCbq9N6Wi8EtJzlr1RSB8KUN+HNU
         SIwXtu7kZlaalg0uVR9fXlJWaaCeuE15zzntIorpuyzJV7xSQMVDmr546RPxf3xPIGKN
         Vj9hY/yUegZEPS6yn3wHsYvfmM4/PTt8+zNULjiPRc+AHdjPJ53EWWNJ9MeVjvcXIVvP
         /MkoOPNotSfvzuaQgyT3y1ZgRLfsOYbOLbx9hRrLtHFym/9idpIDEcUz3ngCJZ8AgtZI
         QOsg==
X-Gm-Message-State: AOJu0YywHbjO94IFFchI2jvaNPpbsOSOZPtCc3aAua1VJLbCp9oTh88I
	lnU//X1q45jJqSXUToGKivXLFA==
X-Google-Smtp-Source: AGHT+IGc8AdgH/YPAGqhTVton7wBhQe2kXpP36rX6A0KPMi035sdxnM7obZM3DacHYAXMWzb8lBUqA==
X-Received: by 2002:a17:90a:1002:b0:262:f8b8:dba2 with SMTP id b2-20020a17090a100200b00262f8b8dba2mr2910831pja.35.1691698541096;
        Thu, 10 Aug 2023 13:15:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n2-20020a17090ac68200b00263f8915aa3sm3780733pjt.31.2023.08.10.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 13:15:40 -0700 (PDT)
Date: Thu, 10 Aug 2023 13:15:40 -0700
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
Message-ID: <202308101314.11A15CDF9@keescook>
References: <20230804071045.never.134-kees@kernel.org>
 <f34c11eb-89b5-48a5-bd24-c215083575a5@app.fastmail.com>
 <202308101209.45CF7C6F80@keescook>
 <786b2d02-f649-4c5f-ae9a-ed2228e4a3fb@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786b2d02-f649-4c5f-ae9a-ed2228e4a3fb@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_131544_737288_5AD26E23 
X-CRM114-Status: GOOD (  34.41  )
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

On Thu, Aug 10, 2023 at 10:10:08PM +0200, Arnd Bergmann wrote:
> On Thu, Aug 10, 2023, at 21:32, Kees Cook wrote:
> > On Wed, Aug 09, 2023 at 09:47:24PM +0200, Arnd Bergmann wrote:
> >
> >> If the local_restart code has to store the syscall number
> >> for an EABI-only kernel, wouldn't it have to also do this
> >> for a kernel with OABI-only or OABI_COMPAT support?
> >
> > This is the part I wasn't sure about. Initially I was thinking it didn't
> > matter because it's only a problem for a seccomp tracer, but I realize
> > it might be exposed to a PTRACE tracer too. I was only able to test with
> > EABI since seccomp is disabled for OABI_COMPAT.
> >
> > Anyway, syscall restart is done this way:
> >
> >         movlt   scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
> >
> > Can a EABI call restart an OABI syscall? I think so?
> 
> There are very few differences between oabi and eabi syscalls, I
> think it basically comes down to 
> 
>  - the syscall number, and register in which it is passed to the kernel
>  - a few syscalls that exist for OABI backward compatibility and were
>    deprecated before EABI was added
>  - a few syscalls that pass a struct with different alignment rules
>  - epoll_wait() uses a runtime check for the output format
> 
> It also seems like the __NR_restart_syscall path is only relevant
> for syscalls using restart_block for restarting, and that means
> it's only poll(), futex(), nanosleep(), clock_nanosleep() and their
> time64 counterparts. All of these are handled by the same entry

Right -- it's a tiny corner case I tripped over years ago while building
seccomp filters, so it got added to the selftests. :)

> points for OABI and EABI, i.e. there is no overlap with the
> exceptions above. Crucially, epoll does not use restart_block,
> unlike poll().
> 
> > So maybe we just need to add:
> >
> > 	str     scno, [tsk, #TI_ABI_SYSCALL]    @ store scno for syscall restart
> >
> > after that instead of moving it like I did originally?
> 
> Yes, I think that works!
> 
> For pure EABI and pure OABI kernels, this just does the right thing,
> storing a plain __NR_restart_syscall in the field without an ABI
> marker. For an OABI compat task running on an EABI kernel, it will
> call the EABI version of restart_syscall(), but that is exactly
> the same as the OABI version, as shown above.

Okay, excellent. I came to the same conclusion. Patch 1 in the v2
addresses this and tested okay for me.

Thanks for looking at this!

-Kees

-- 
Kees Cook

