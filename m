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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C515C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 22:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8EC2086A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 22:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGQOvXZ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2q1p0JO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E8EC2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1f7zZgNzUFzQNN1e9/D79B5AyPKUYUpwjBDFiq9GvEk=; b=eGQOvXZ+zXKu/wuqfHNGcI8Zp
	NGhnNgDJIkGwkPr+qz+icjGH/2F0RvI/lYZ+kS0BtaoiN6wjJIgoVrd9pEMmOalfeCIJAB6hmhFPB
	hclSU6yxbtc5iXqLvMas8HKFKjMmGSyaoZnyVUflixZmYdc15bMThZprOXhUbzruEVJl+QuLnrSAs
	CAI+RfaBSEVW4GF7rp0L6NSGPCCRNpwtGvMPovrhyBpV3LBCveslmGO5fnO6smDl6fiGv88NdOhwx
	tLaqWfebuTmZucGqkiGAaYDqfWR3xmtK0mnV4HmgxXqBc+VRdYdwAY04FKXF/BiFvADlM7eSqrrWc
	HLmvi2RRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3oYC-0001mi-Mc; Thu, 06 Aug 2020 22:39:52 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3oY7-0001il-Da; Thu, 06 Aug 2020 22:39:48 +0000
Received: by mail-oi1-x244.google.com with SMTP id a24so179048oia.6;
 Thu, 06 Aug 2020 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYyChGMYepRNLD8UKgj7thBgwQob2Oa7/EK/gPsMnyo=;
 b=E2q1p0JO2XvfW4MMncIYFDARtHPyS+Dcb3O71GCXktM+fV9+klnIKIxDdRHgU8QHRr
 l7X7JmWn9GB+naSfiniANoD7LR6lGKLMk5kpKOJWxfeJQffooRC0T6skmfrGEC1AMHne
 yKbq2NmQL6q9ywbDwSPKDUz/etM/TXSWury+bF/GcssilJLmAiftBdZFjsPbW9rUAfP+
 /X3iDgd1HOlYlLaINt0FDbT3U2C2Nks5KEEvO3bLUtsyWVHpvQfouOR9Zj9RrV5LhyCL
 Ghy+AmHJ2iZQF63/YcvknmUTlSDTrBqwC41c7/rEggVDsauU9MQ+kT+MyOWnLhLqZ+EL
 IwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYyChGMYepRNLD8UKgj7thBgwQob2Oa7/EK/gPsMnyo=;
 b=Mvly7GHthEVn6VI1/B7GzqrQW6UdjIF6BFImvPpv9RJKdnUvLBvtNid767sPk1ga5S
 bmRJ9aJTWNPNDX71kgtWqHxU3scBZh7STlj5AJcwLZ+3AVo8WGMk/u1QC4s3NY8/YeDZ
 45nE3lVOA82k6P/0UatLdOoA3yA3CAItNVvxTpeOy0l/91RRiLfYGgqxPOtJuyC3dloo
 0fzLooIL1x7wHJx/7vetumf+v6Lkntbe87YP7tUCxn1+kT5YIJD1EmmcinazzDo+s15L
 gkf8bOqSTJg2J+LdG3aKFs5SVMyGk/BwbVAZA6orpblNIJlZDuVRWOMyvsIni4TC1L19
 F6WA==
X-Gm-Message-State: AOAM530wau2+4pWDOs0cshBJ6rj8XIT4T8WPUmNbZpDP5heFdi35/Fdz
 tYBRS3tLNwM/ZSwfJWDQKNjxieVJoqtq0ycZgzo=
X-Google-Smtp-Source: ABdhPJxgRVHE+w66qKr8NvAura05izXsDohZP4qj6OUjgNalYTkqSJnvf7KROxLkFiU/XGIePEi/yKZRmmb+OQ1qMho=
X-Received: by 2002:a54:4512:: with SMTP id l18mr8807675oil.148.1596753585500; 
 Thu, 06 Aug 2020 15:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-4-ndesaulniers@google.com>
In-Reply-To: <20200730205112.2099429-4-ndesaulniers@google.com>
From: Nathan Huckleberry <nhuck15@gmail.com>
Date: Thu, 6 Aug 2020 17:39:33 -0500
Message-ID: <CAN=-RxstJBjJUcOf9iuAxEcxYUhJTdF9JhPVWwQuefnE+3s52w@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: backtrace-clang: give labels more descriptive
 names
To: Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_183947_541565_E5EBB3CB 
X-CRM114-Status: GOOD (  19.18  )
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
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The style cleanup looks great. I just have one extra thing that
can probably be thrown into this patch.

On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Removes the 1004 label; it was neither a control flow target, nor an
> instruction we expect to produce a fault.
>
> Gives the labels slightly more readable names. The `b` suffixes are
> handy to disambiguate between labels of the same identifier when there's
> more than one. Since these labels are unique, let's just give them
> names.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/lib/backtrace-clang.S | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> index 40eb2215eaf4..7dad2a6843a5 100644
> --- a/arch/arm/lib/backtrace-clang.S
> +++ b/arch/arm/lib/backtrace-clang.S
> @@ -121,8 +121,8 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
>   * start. This value gets updated to be the function start later if it is
>   * possible.
>   */
> -1001:          ldr     sv_pc, [frame, #4]      @ get saved 'pc'
> -1002:          ldr     sv_fp, [frame, #0]      @ get saved fp
> +load_pc:       ldr     sv_pc, [frame, #4]      @ get saved 'pc'
> +load_fp:       ldr     sv_fp, [frame, #0]      @ get saved fp
>
>                 teq     sv_fp, mask             @ make sure next frame exists
>                 beq     no_frame
> @@ -142,7 +142,7 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
>   * registers for the current function, but the stacktrace is still printed
>   * properly.
>   */
> -1003:          ldr     sv_lr, [sv_fp, #4]      @ get saved lr from next frame
> +load_lr:       ldr     sv_lr, [sv_fp, #4]      @ get saved lr from next frame
>
>                 tst     sv_lr, #0               @ If there's no previous lr,
>                 beq     finished_setup          @ we're done.
> @@ -166,8 +166,7 @@ finished_setup:
>  /*
>   * Print the function (sv_pc) and where it was called from (sv_lr).
>   */
> -1004:          mov     r0, sv_pc
> -
> +               mov     r0, sv_pc
>                 mov     r1, sv_lr
>                 mov     r2, frame
>                 bic     r1, r1, mask            @ mask PC/LR for the mode
> @@ -182,7 +181,7 @@ finished_setup:
>   * pointer the comparison will fail and no registers will print. Unwinding will
>   * continue as if there had been no registers stored in this frame.
>   */
> -1005:          ldr     r1, [sv_pc, #0]         @ if stmfd sp!, {..., fp, lr}
> +load_stmfd:    ldr     r1, [sv_pc, #0]         @ if stmfd sp!, {..., fp, lr}
>                 ldr     r3, .Lopcode            @ instruction exists,
>                 teq     r3, r1, lsr #11
>                 ldr     r0, [frame]             @ locals are stored in
> @@ -201,7 +200,7 @@ finished_setup:
>                 mov     frame, sv_fp            @ above the current frame
>                 bhi     for_each_frame
>
> -1006:          adr     r0, .Lbad
> +bad_frame:     adr     r0, .Lbad
>                 mov     r1, loglvl
>                 mov     r2, frame
>                 bl      printk
> @@ -216,11 +215,10 @@ bad_lr:           mov     sv_fp, #0
>  ENDPROC(c_backtrace)
>                 .pushsection __ex_table,"a"
>                 .align  3
> -               .long   1001b, 1006b
> -               .long   1002b, 1006b
> -               .long   1003b, 1006b
> -               .long   1004b, 1006b
> -               .long   1005b, 1006b
> +               .long   load_pc, bad_frame
> +               .long   load_fp, bad_frame
> +               .long   load_lr, bad_frame
> +               .long   load_stmfd, bad_frame

Load_stmfd should get its own fixup
handler since it should emit errors about a bad
pc, not a bad frame pointer.

>                 .long   prev_call, bad_lr
>                 .popsection
>
> --
> 2.28.0.163.g6104cc2f0b6-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
