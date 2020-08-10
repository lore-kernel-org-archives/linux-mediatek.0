Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66278C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 22:33:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C58206DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 22:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmFBAx6J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="A5gGDmYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C58206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xgkmuzuk2ZrbPGSNJJ855IqoLIEYR/fk4PFiIxoF+aM=; b=tmFBAx6JBTz2xc5wumdIekgh3
	QM8sGBKRzGW04GXc/srPqT/nimv3QXOdbX95oZDOjKh5On7eyzbXTpuMlf+cIDcb/rasGfa78IHhU
	Mhrkx0CZVyt9mkLuamHcJ+6LGNOrcxCiUmhM6rYjNL0gG+5zEIuA8NG3G7KdB1NxYiUbMBQ1XdMac
	Tv3Q0FSQCb7lFpLsWhmk4rquUjzWw1khta6GvduMKVrEpF0e+ofkw9qX0hynMeOkc4b0fPyMTvFLs
	AdKK8x/q/bL9kQ4U++jBsiyROgXfTnnwo9nd3syv+Qkb/C1bI9hqdjDvn8MLOwwT+yeMqv5I/AFmp
	EHFJ+GTuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5GLb-0003uH-JI; Mon, 10 Aug 2020 22:32:51 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5GLY-0003sC-4U
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 22:32:49 +0000
Received: by mail-pl1-x644.google.com with SMTP id o1so5870205plk.1
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 15:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXQVV8QzuLxMQgNKr0LaFyD2ve8ZpOBor9lL6l9h4Ds=;
 b=A5gGDmYjWmpB699JIOK6on6qDu9uDtnkIil+iYYDbdyy6JwRwaleVNUog1nVfM3OCH
 J3eWA+s+RBIw3Nm0nAnt+irl8ws3IeWlT7CFAjBxQMTdTgaNP3mGZGI6/V+fQp4+sm+I
 j965e6vopsDobvVf4P4MoP1750zNWOihUzQXNNKi4USfnGKwC/5OrEuWGkXaCS8HDAQa
 LB9NVTF6Q0tmZAVyk3lnpOpyVDxqepVHhujQ/j8apT/UOrOLfoAoY3dQszUYKcC6Mgxe
 mpMRjF2aMavDkt32srSX0KzPl1do8fAVHcvkJ09gflS272e9XIeGmpKey+2bY1luqGjP
 xmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXQVV8QzuLxMQgNKr0LaFyD2ve8ZpOBor9lL6l9h4Ds=;
 b=uMwFQTdnT32kvmLqum3CgPeP4NPZLIyIxR6WZyMEX3qYOlS1l809tIiIU1hdxgy/Vs
 38FZ6h89jXn8TAqyyKTheazZHy1pcunfLo5ibHlAugT3rsjIc78jse+QoCcgX4ZsAZRx
 44m4x4VSBwsAUS4qf8ipd1Zb8sr08EOn6VAY6mXi/iGukW1FUXNHb1qXYaoB2NBCQZst
 q8NYFvLkXGXPG5aGLw4E3gemwuNcLUGQGv/tlkNPoe2+8CmgjVTLkFsLxQih98la8TJ+
 EglhC/sf0icKY6ftwjaioM+7HMZxbCKfWeWd0FC/DAkmN0t9VgtgPTnC5+HJG6LX0LD6
 2TNw==
X-Gm-Message-State: AOAM532PPKj4BOlikPe0YKYepTqGBZD+Bteq0J0wfQdhKbH7m2naAEjM
 4lG1jidesQf0ScUsRnJrMC5X7+A4L24nVY0nFNIzhw==
X-Google-Smtp-Source: ABdhPJzDEd2QBFQmRufQF9FdKaFeqP55ESrnL6LWIXjGrIg3RjVKiIiVetNDyjpn7llpLrrv1LyQ7LDZ0bj4IzPw12E=
X-Received: by 2002:a17:902:8509:: with SMTP id
 bj9mr11421853plb.179.1597098763680; 
 Mon, 10 Aug 2020 15:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-4-ndesaulniers@google.com>
 <CAN=-RxstJBjJUcOf9iuAxEcxYUhJTdF9JhPVWwQuefnE+3s52w@mail.gmail.com>
In-Reply-To: <CAN=-RxstJBjJUcOf9iuAxEcxYUhJTdF9JhPVWwQuefnE+3s52w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Aug 2020 15:32:32 -0700
Message-ID: <CAKwvOdn+MGgYf8k9uAUT55vBL+ERTjv+jx+t8SD9HO98-h2c0w@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: backtrace-clang: give labels more descriptive
 names
To: Nathan Huckleberry <nhuck15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_183248_295143_52DBEC21 
X-CRM114-Status: GOOD (  25.15  )
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
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
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
> The style cleanup looks great. I just have one extra thing that
> can probably be thrown into this patch.
>
> On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Removes the 1004 label; it was neither a control flow target, nor an
> > instruction we expect to produce a fault.
> >
> > Gives the labels slightly more readable names. The `b` suffixes are
> > handy to disambiguate between labels of the same identifier when there's
> > more than one. Since these labels are unique, let's just give them
> > names.
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/arm/lib/backtrace-clang.S | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> > index 40eb2215eaf4..7dad2a6843a5 100644
> > --- a/arch/arm/lib/backtrace-clang.S
> > +++ b/arch/arm/lib/backtrace-clang.S
> > @@ -121,8 +121,8 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
> >   * start. This value gets updated to be the function start later if it is
> >   * possible.
> >   */
> > -1001:          ldr     sv_pc, [frame, #4]      @ get saved 'pc'
> > -1002:          ldr     sv_fp, [frame, #0]      @ get saved fp
> > +load_pc:       ldr     sv_pc, [frame, #4]      @ get saved 'pc'
> > +load_fp:       ldr     sv_fp, [frame, #0]      @ get saved fp
> >
> >                 teq     sv_fp, mask             @ make sure next frame exists
> >                 beq     no_frame
> > @@ -142,7 +142,7 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
> >   * registers for the current function, but the stacktrace is still printed
> >   * properly.
> >   */
> > -1003:          ldr     sv_lr, [sv_fp, #4]      @ get saved lr from next frame
> > +load_lr:       ldr     sv_lr, [sv_fp, #4]      @ get saved lr from next frame
> >
> >                 tst     sv_lr, #0               @ If there's no previous lr,
> >                 beq     finished_setup          @ we're done.
> > @@ -166,8 +166,7 @@ finished_setup:
> >  /*
> >   * Print the function (sv_pc) and where it was called from (sv_lr).
> >   */
> > -1004:          mov     r0, sv_pc
> > -
> > +               mov     r0, sv_pc
> >                 mov     r1, sv_lr
> >                 mov     r2, frame
> >                 bic     r1, r1, mask            @ mask PC/LR for the mode
> > @@ -182,7 +181,7 @@ finished_setup:
> >   * pointer the comparison will fail and no registers will print. Unwinding will
> >   * continue as if there had been no registers stored in this frame.
> >   */
> > -1005:          ldr     r1, [sv_pc, #0]         @ if stmfd sp!, {..., fp, lr}
> > +load_stmfd:    ldr     r1, [sv_pc, #0]         @ if stmfd sp!, {..., fp, lr}
> >                 ldr     r3, .Lopcode            @ instruction exists,
> >                 teq     r3, r1, lsr #11
> >                 ldr     r0, [frame]             @ locals are stored in
> > @@ -201,7 +200,7 @@ finished_setup:
> >                 mov     frame, sv_fp            @ above the current frame
> >                 bhi     for_each_frame
> >
> > -1006:          adr     r0, .Lbad
> > +bad_frame:     adr     r0, .Lbad
> >                 mov     r1, loglvl
> >                 mov     r2, frame
> >                 bl      printk
> > @@ -216,11 +215,10 @@ bad_lr:           mov     sv_fp, #0
> >  ENDPROC(c_backtrace)
> >                 .pushsection __ex_table,"a"
> >                 .align  3
> > -               .long   1001b, 1006b
> > -               .long   1002b, 1006b
> > -               .long   1003b, 1006b
> > -               .long   1004b, 1006b
> > -               .long   1005b, 1006b
> > +               .long   load_pc, bad_frame
> > +               .long   load_fp, bad_frame
> > +               .long   load_lr, bad_frame
> > +               .long   load_stmfd, bad_frame
>
> Load_stmfd should get its own fixup
> handler since it should emit errors about a bad
> pc, not a bad frame pointer.

Yeah, I can add that.  It's a little orthogonal though to this patch
that renames labels. I'd consider more so a pre-existing bug.  Let me
add a patch to the series that gives it a new fixup handler, separate
from the label renaming, in a v2 of the series.

>
> >                 .long   prev_call, bad_lr
> >                 .popsection
> >
> > --
> > 2.28.0.163.g6104cc2f0b6-goog
> >



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
