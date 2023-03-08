Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36754C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTpI/ATF+c54SwR4NIfut5ZP/DAkJSYP7eEYSoHEoTg=; b=o8laz31XMdwOG1ADXMdFuI6xLG
	rZoZAtWb1SoOA16ntlN0ZoFJeTi8TnBmaa5JbLIX7d0dLBWatRst8EDhK606EcxJWpFSXONRMtq+n
	Rraq3czM9+Ao28fRK66fospvSCbefuCUn8deO5tSZkGZy7TVekyTZGDgrm0o5pbZe+pjS/ks/GqaH
	roPX54FfYpNl8hwkddfM4MZ8/QYxhY5QHkvfjkqWwBy1pQt2VorxteSwYodg2FFhsACL6CtAC34RG
	20MSOYv743IcQs/iC+OZkTUJNy5kCS4iKWaOx/tcLsIsL2FTbrDjXP0gbLfB+MPsdeUnCYOvJsgET
	cVp0/lVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr6K-004QKa-At; Wed, 08 Mar 2023 10:32:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr6G-004QGg-R4
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 10:32:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id j3so9500597wms.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 02:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678271561;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTpI/ATF+c54SwR4NIfut5ZP/DAkJSYP7eEYSoHEoTg=;
        b=GwQXQzmmF7hBdRmoRbCPZpzDZOPv4x+tbm/AGfcGf9mMg9SE9K/xbpBKJ7sCaLlt4N
         XZ1AcrGHwRwuNRuVZbiirQ9QP+4RXo6lzLnrqdjMaVpF1Mwz0UobpbOosQVAa0eab+tc
         8zqiAGh+0B3/u6oj0it85P5/i7oxmM5Nv3HwRvvGSMYpaSKAsKFIeD1lpEt+v22dAQ4+
         B/olSlCglc/Ud6+V20vGTbPCESuVoWa13rOJqyJnM/WVNzj2viYYSPKPllAkozvLgU6l
         Sy9jNYCq5XaX+L5/9Ur5v9dl0ho8VSA94pqQYJRqcJT62y2+vzKkhE8NerkTc5teq/Sr
         /9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271561;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTpI/ATF+c54SwR4NIfut5ZP/DAkJSYP7eEYSoHEoTg=;
        b=k6mm1+4oLynmGJqb2Oy9RmiI/JJogNbaF706SDEfdjNCa+enjJ8i8+38Q/BZhujtNe
         vtClJMAr1hPaShMEerPbgWdnss8szKwTCFTWyS2kgxvMrmL+dwlVN0pPZJwic34xnRAZ
         usyTCEAgQkMG7g1SJjadDDL6QLcCYBJKkNSksTg6v03IvSQlyoF36AEopSY40cYOm39J
         WN29/N0/vQluhOtVO+bNj9iMLbhoWtoIrIOFS6o1P2uZmLw15mSZmcOaTid+0B5+n579
         zQLU1g6RRegmrdVu/np1lU9F/AK9805gYv4ikJQiZ1mkd65CKZywO0obtQVXyhRIoSuP
         u3CA==
X-Gm-Message-State: AO0yUKVefixa5rhVArt0h+MOevJZynFYEprBBo6hCsC8UKLsgpEHFnGk
	fc8keKhQZMiTXrgxX+85ZrxyOg==
X-Google-Smtp-Source: AK7set8Y8IRO+bYklRwCSoQnrSW5ClVdKEoAiubrrROMlKzUVbjvAL0/hv/YW3oe+/LFgT/+USJONw==
X-Received: by 2002:a05:600c:4692:b0:3ea:f73e:9d8a with SMTP id p18-20020a05600c469200b003eaf73e9d8amr15409084wmo.30.1678271561077;
        Wed, 08 Mar 2023 02:32:41 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:ba88:6ccc:13c7:4bae])
        by smtp.gmail.com with ESMTPSA id s25-20020a05600c319900b003db03725e86sm15243907wmp.8.2023.03.08.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:32:40 -0800 (PST)
Date: Wed, 8 Mar 2023 11:32:33 +0100
From: Marco Elver <elver@google.com>
To: Haibo Li <haibo.li@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, dvyukov@google.com,
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mark.rutland@arm.com, matthias.bgg@gmail.com,
	xiaoming.yu@mediatek.com, will@kernel.org
Subject: Re: [PATCH] kcsan:fix alignment_fault when read unaligned
 instrumented memory
Message-ID: <ZAhkQUmvf1U3H4nR@elver.google.com>
References: <CANpmjNMj3JX6d=HS=CNzxZPZcJZWfz0G5wKmJjfGb_N525NNLw@mail.gmail.com>
 <20230308094101.66448-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308094101.66448-1-haibo.li@mediatek.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_023248_964600_84C6A15E 
X-CRM114-Status: GOOD (  27.38  )
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

On Wed, Mar 08, 2023 at 05:41PM +0800, Haibo Li wrote:
[...]
> > > x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000 Call
> > > trace:
> > >  kcsan_setup_watchpoint+0x26c/0x6bc
> > >  __tsan_read2+0x1f0/0x234
> > >  inflate_fast+0x498/0x750
> > 
> > ^^ is it possible that an access in "inflate_fast" is unaligned?
> Here is the instruction for inflate_fast+0x498:
> ffffffc008948980 <inflate_fast>:
> ...
> 	ffffffc008948e10: e0 03 1c aa   mov     x0, x28
> 	ffffffc008948e14: 06 3a e9 97   bl      0xffffffc00839762c <__tsan_unaligned_read2>
> 	ffffffc008948e18: e0 03 17 aa   mov     x0, x23
> 	>ffffffc008948e1c: 9a 27 40 78   ldrh    w26, [x28], #2
> 
> And the instruction for kcsan_setup_watchpoint+0x26c:
> 	ffffffc00839ab90 <kcsan_setup_watchpoint>:
> 	...
> 	>ffffffc00839adfc: a8 fe df 48   ldarh   w8, [x21]
> 
> The instruction is different.READ_ONCE uses ldarh,which requires the access address is aligned.
> As ARM v8 arm said:
> "
> Load-Acquire, Load-AcquirePC and Store-Release, other than Load-Acquire Exclusive Pair and
> Store-Release-Exclusive Pair, access only a single data element. This access is single-copy atomic. The address of the data object must be aligned to the size of the data element being accessed, otherwise the access generates an
> Alignment fault."
> 
> while ldrh accepts unaligned address.
> That's why it is ok while disable KCSAN.

I understand now what's going on, thanks for the analysis.

Can you test the below patch, I think it is the correct solution for
this - compared to your approach of opting out unaligned accesses, with
the below there is no loss of functionality.

Thanks,
-- Marco

------ >8 ------


From 889e9d5ce61592a18c90a9c57495337d5827bbc2 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Wed, 8 Mar 2023 11:21:06 +0100
Subject: [PATCH] kcsan: Avoid READ_ONCE() in read_instrumented_memory()

Haibo Li reported:

 | Unable to handle kernel paging request at virtual address
 |   ffffff802a0d8d7171
 | Mem abort info:o:
 |   ESR = 0x9600002121
 |   EC = 0x25: DABT (current EL), IL = 32 bitsts
 |   SET = 0, FnV = 0 0
 |   EA = 0, S1PTW = 0 0
 |   FSC = 0x21: alignment fault
 | Data abort info:o:
 |   ISV = 0, ISS = 0x0000002121
 |   CM = 0, WnR = 0 0
 | swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000002835200000
 | [ffffff802a0d8d71] pgd=180000005fbf9003, p4d=180000005fbf9003,
 | pud=180000005fbf9003, pmd=180000005fbe8003, pte=006800002a0d8707
 | Internal error: Oops: 96000021 [#1] PREEMPT SMP
 | Modules linked in:
 | CPU: 2 PID: 45 Comm: kworker/u8:2 Not tainted
 |   5.15.78-android13-8-g63561175bbda-dirty #1
 | ...
 | pc : kcsan_setup_watchpoint+0x26c/0x6bc
 | lr : kcsan_setup_watchpoint+0x88/0x6bc
 | sp : ffffffc00ab4b7f0
 | x29: ffffffc00ab4b800 x28: ffffff80294fe588 x27: 0000000000000001
 | x26: 0000000000000019 x25: 0000000000000001 x24: ffffff80294fdb80
 | x23: 0000000000000000 x22: ffffffc00a70fb68 x21: ffffff802a0d8d71
 | x20: 0000000000000002 x19: 0000000000000000 x18: ffffffc00a9bd060
 | x17: 0000000000000001 x16: 0000000000000000 x15: ffffffc00a59f000
 | x14: 0000000000000001 x13: 0000000000000000 x12: ffffffc00a70faa0
 | x11: 00000000aaaaaaab x10: 0000000000000054 x9 : ffffffc00839adf8
 | x8 : ffffffc009b4cf00 x7 : 0000000000000000 x6 : 0000000000000007
 | x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffffc00a70fb70
 | x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000
 | Call trace:
 |  kcsan_setup_watchpoint+0x26c/0x6bc
 |  __tsan_read2+0x1f0/0x234
 |  inflate_fast+0x498/0x750
 |  zlib_inflate+0x1304/0x2384
 |  __gunzip+0x3a0/0x45c
 |  gunzip+0x20/0x30
 |  unpack_to_rootfs+0x2a8/0x3fc
 |  do_populate_rootfs+0xe8/0x11c
 |  async_run_entry_fn+0x58/0x1bc
 |  process_one_work+0x3ec/0x738
 |  worker_thread+0x4c4/0x838
 |  kthread+0x20c/0x258
 |  ret_from_fork+0x10/0x20
 | Code: b8bfc2a8 2a0803f7 14000007 d503249f (78bfc2a8) )
 | ---[ end trace 613a943cb0a572b6 ]-----

The reason for this is that on certain arm64 configuration since
e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when
CONFIG_LTO=y"), READ_ONCE() may be promoted to a full atomic acquire
instruction which cannot be used on unaligned addresses.

Fix it by avoiding READ_ONCE() in read_instrumented_memory(), and simply
forcing the compiler to do the required access by casting to the
appropriate volatile type. In terms of generated code this currently
only affects architectures that do not use the default READ_ONCE()
implementation.

The only downside is that we are not guaranteed atomicity of the access
itself, although on most architectures a plain load up to machine word
size should still be atomic (a fact the default READ_ONCE() still relies
on itself).

Reported-by: Haibo Li <haibo.li@mediatek.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 54d077e1a2dc..5a60cc52adc0 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -337,11 +337,20 @@ static void delay_access(int type)
  */
 static __always_inline u64 read_instrumented_memory(const volatile void *ptr, size_t size)
 {
+	/*
+	 * In the below we don't necessarily need the read of the location to
+	 * be atomic, and we don't use READ_ONCE(), since all we need for race
+	 * detection is to observe 2 different values.
+	 *
+	 * Furthermore, on certain architectures (such as arm64), READ_ONCE()
+	 * may turn into more complex instructions than a plain load that cannot
+	 * do unaligned accesses.
+	 */
 	switch (size) {
-	case 1:  return READ_ONCE(*(const u8 *)ptr);
-	case 2:  return READ_ONCE(*(const u16 *)ptr);
-	case 4:  return READ_ONCE(*(const u32 *)ptr);
-	case 8:  return READ_ONCE(*(const u64 *)ptr);
+	case 1:  return *(const volatile u8 *)ptr;
+	case 2:  return *(const volatile u16 *)ptr;
+	case 4:  return *(const volatile u32 *)ptr;
+	case 8:  return *(const volatile u64 *)ptr;
 	default: return 0; /* Ignore; we do not diff the values. */
 	}
 }
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


