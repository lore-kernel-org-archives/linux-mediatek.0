Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC078C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7654320829
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JS3Ng5XH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WS/N+oLb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7654320829
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XFPfLedl8/dEFBsd/pd6voVYrJgezbVV73JbUUJ5WI=; b=JS3Ng5XHLIPwGp1B4PuV9CFftA
	JfWqvdOamaaIQtXlnO6hvY7F9lQnWjgHEXcgCuH7RYrFG8bGpJ5mZdxrDL8qT/zlD0bdVWKrDwpMA
	HklGlua6UshMYecI9zxvZc1vbTj/Gc+eyN/tVgb3gYExY6MF6r/teVHNZAsDOcaAK5S58FT2AE+X5
	rCuAxu0q0CgGmjFsnJPsVTfmwzcz9hUG0QN/uIm80ipPqxk2+n1iwTDR7OAWHT9+h/127caThGtic
	4PtKQRyQj00yqkk26dozACdvzNfUc/A7WxAXn5RKq/KIEseSCXJeqiYNhT32nuX84bQ33zHs1+zLh
	YZTXHmaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1FWY-0004gP-6A; Thu, 30 Jul 2020 20:51:34 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1FWT-0004dR-1f
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 20:51:29 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id q21so12557692qve.5
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+8IcRcjNMmg55nzAYWemaonCO3YVJFMOAlMg6/HQqZk=;
 b=WS/N+oLbFzSBBDpGrj5zhi5qc3eMKgQfUSbLNA4X6vw0fslhwV92R948HcCKCQBs4B
 3cAPHFnBjNf1GJzmYzjIdxVcT88aOw/+5Z7wY4hDcfZ5yh6wC2nAOs69NEGLdm4IKtNI
 RHkMh6NAvOxXxk7mDuS8rcqW39ze8lB0GIa6RhJc9qU7vK9N2Btacj0v68dmU6Dug9LP
 jP/tT7rYjKVlIhvetloVr2f4TprDQRLJSmx4UsvYZgDVA5qVyPFnBDK3Fkb88waPgT74
 NFiy+CaVbmI50DH86lrxVdWJKfOc9vsv3Lpzq90+nz4g64FuSpFl766z+JkRzk2031lz
 HZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+8IcRcjNMmg55nzAYWemaonCO3YVJFMOAlMg6/HQqZk=;
 b=NTMOMhee6lI335ejp+N9ZXvL95zDSWDSNkOI20YVQQbXWsDDi4jh90ttx+oEDzVBSp
 eyA/eqTtUyFJIyMdbcNhBNF1Q0jgQgoh/UvBG/s4wAPWrObLgeGBJ/F0p9enFwjHWfiJ
 7YN+TP6rNqeVZnFrXY65fAQAFMVW0AmT/mLwbZQ0e9BO1KT83WrF0wqPFtee65hYgYL5
 q6wiISqvO3oVcegD8iaYwsgnU1sHzUuFYdnsdn1YU54gwIEJLxkUhnyT3Dny+FBHdwDG
 BMpo/1vYgK2rTUEZ4L6GZWJcNRQ732ksWTYgzxk7K8uC3um5iKsSW5zrF+Qkj13hMaxk
 OSzg==
X-Gm-Message-State: AOAM532RbOPrVo/HihNrIwfR80I+fdnm+b0g/WQAcs3JMJxy9STUPGc1
 RL94npeEGEmqiFqWqzUN5G30v+ma/htTn3GMkgI=
X-Google-Smtp-Source: ABdhPJwmD50FNu7pg+bxDxzIfP7b6FbrE4ZJaK1Bw8TAS+CDtLGbaaU90Wd09/zT21c7WigKXG7F+Uwo0u5cNy1rAbY=
X-Received: by 2002:a0c:b712:: with SMTP id t18mr958012qvd.205.1596142281418; 
 Thu, 30 Jul 2020 13:51:21 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:51:08 -0700
Message-Id: <20200730205112.2099429-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 0/4] CONFIG_UNWINDER_FRAME_POINTER fixes+cleanups
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Huckleberry <nhuck15@gmail.com>,
 Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_165129_110068_67DAFA72 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We received a report of boot failure on stable/4.14.y using Clang with
CONFIG_UNWINDER_FRAME_POINTER. Turns out, this was a cascaded failure
with at least 4 different things going wrong. Working backwards from the
failure:

4) There was no fixup handler in backtrace-clang.S for a specific
address calculation. If an indirect access to that address triggers a
page fault for which no corresponding fixup exists, then a panic is
triggered. Panicking triggers another unwind, and all this repeats in an
infinite loop.  If the unwind was started from within start_kernel(),
this results in a kernel that does not boot.  We can install a fixup
handler to fix the infinite loop, but why was the unwinder accessing an
address that would trigger a fault?

3) The unwinder has multiple conditions to know when to stop unwinding,
but checking for a valid address in the link register was not one of
them. If there was a value for lr that we could check for before using
it, then we could add that as another stopping condition to terminate
unwinding. But the garbage value in lr in the case of save_stack()
wasn't particularly noteworthy from any other address; it was ambiguous
whether we had more frames to continue unwinding through or not, but
what value would we check for?

2) When following a frame chain, we can generally follow the addresses
pushed onto the stack from the link register, lr. The callee generally
pushes this value.  For our particular failure, the value in the link
register upon entry to save_stack() was garbage. The caller,
__mmap_switched, does a tail call into save_stack() since we don't plan
to return control flow back to __mmap_switched. It uses a `b` (branch)
instruction rather than a `bl` (branch+link) which is correct, since
there are no instructions after the `b save_stack` in __mmap_switched.
If we interpret the value of lr that was pushed on the stack in
save_stack(), then it appears that we have further frames to unwind.
When observing an unwind on mainline though, lr upon entry to
save_stack() was 0x00!

It turns out that this exact ambiguity was found+fixed already by
upstream
commit 59b6359dd92d ("ARM: 8702/1: head-common.S: Clear lr before jumping to start_kernel()")
which landed in 4.15-rc1 but was not yet backported to stable/4.14.y.
Sent to stable in:
https://lore.kernel.org/stable/20200730180340.1724137-1-ndesaulniers@google.com/T/#u
That gives us a value in lr upon entry to save_stack() that's noteworthy
as a terminal condition during unwinding.  But why did we start
unwinding in start_kernel() in the first place?

1) A simple WARN_ON_ONCE was being triggered during start_kernel() due
to another patch that landed in v4.15-rc9 but wasn't backported to
stable/4.14.y. Sent to stable in:
https://lore.kernel.org/stable/20200727191746.3644844-1-ndesaulniers@google.com/T/#u

Read (or unwound; pun intended) in the order 1), 2), 3), 4) explains the
cascading chain of failures that lead to a kernel not booting.

Patch 0001 fixes 3) by adding a test for NULL to the conditions to stop
unwinding. This prevents the cascade from going further.
Patch 0002 fixes 4) by adding a fixup handler. It's not strictly
necessary right now, but I get the feeling that we might not be able to
trust the value of the link register pushed on the stack.  I'm guessing
a stack buffer overflow could overwrite this value. Either way,
triggering an exception during unwind should be prevented at all costs
to avoid infinite loops.
Patches 0003/0004 are cleanup/bikeshed, feel free to NACK them and I
don't mind dropping them.  They're just minor touchups I felt helped
readability from when I was debugging these. 0001 (and slightly so 0002)
are the only patches I really care about.

Nick Desaulniers (4):
  ARM: backtrace-clang: check for NULL lr
  ARM: backtrace-clang: add fixup for lr dereference
  ARM: backtrace-clang: give labels more descriptive names
  ARM: backtrace: use more descriptive labels

 arch/arm/lib/backtrace-clang.S | 34 +++++++++++++++++++++-------------
 arch/arm/lib/backtrace.S       | 30 +++++++++++++++---------------
 2 files changed, 36 insertions(+), 28 deletions(-)

-- 
2.28.0.163.g6104cc2f0b6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
