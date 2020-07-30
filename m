Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75825C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C8120829
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1drvkcon";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="bS33mlwd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C8120829
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vTdqIhI+DwkIhPUlMgK+1VNVtbcfGIrlH1ZirhuzHHs=; b=1drvkconasBLWABbcG6LW2pyy
	0bkn3HeuAMBt3eohYTGXBeFTD5Mr1H2B7hWCAnBifBvUjlf/fLY5nCVwVIH21RfGU4WE6Ee4xFjKF
	yGions5yH0TPxs1khSWELcz4rABTTNhl5u74Uy4fA5jjkdDHFWeCUsTJT1JpGgw2eLYqsJ5j2aC2y
	H9d8ATJ9++54GV8en3fWkxgUjnPUJoQfN+KinM/0lFNRzUstougSUR0LebcSTr/psJapDjEYHcCd3
	Acx+Azwnfh6UwCTCrMV1coUVWhr5ohl9TCV1vHrZ/9lblxcFsJiM6glBpteIRhzwsKjQ+ng6AmDJG
	vuaEH7oFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1FWl-0004kv-8N; Thu, 30 Jul 2020 20:51:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1FWX-0004fM-S8
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 20:51:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id t3so6704552pjo.2
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=U0OUPTDRNGhh0ydoN6VkhJdiruQZ6OtwNxR4N39C4f8=;
 b=bS33mlwdf/DJIQD28epPbEI7pJZXa1xHzvIjvbrwJsYvNRprRL04EmCMO8BY7c7vyR
 ofLXj+EecJitrlsOgIRSeYox7Ze/fCWlAwsLoJGJXNxJhm1Jzit1E25lLOIc4Zq4SNtH
 vDVgxSSFKjr6Dev1jNeB+/y6/4/TPRX9evR1RJBCof4kAi7IzZUb1z4wOFHcPt1MDXS1
 UMmiVxWsDAo7fDiJWj5rZyAePJEpkaW+/xc4T//YX/DRcxFqZMlHsEZewHwkWf3ZE5Bn
 pEZzlVLo2QFc9P0WbNbGGnsimIfk/QgsbAfVHpxvfHt3Lp7csq8m7P0gUJ1850oZa06/
 oWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=U0OUPTDRNGhh0ydoN6VkhJdiruQZ6OtwNxR4N39C4f8=;
 b=JEExlZGZv3Ke6q6U9XXB0zwG+tU1E8+iqrLoMiBnbHwmjXRUzLTavR2iyuqYVAOdv4
 bCou4klI9Oj95WdyjlAQ5mWVuaaig5fMFsPcw8XXZ3AapBjVYk0US/TWqdaEV7rd4M10
 xwdM9XLw2r2Xpcu79iPR2hrnUCvKUJiD71OtrsJpskjW7cKfZhOtkgELUZ+NSa9FtLrD
 eg7M3DVfssUtJnHpnrBv1cF/rpOVw/5yqPpW3avcc6STSgtRQbCmPLKii0K6eDZcxKul
 n45OGn1Sold9JM7eMTr5IrYXJ0pdnA1vtcf8GJtuVqY3LYYTkbyZNXsNcA9kXlGiw0wb
 hKPg==
X-Gm-Message-State: AOAM5301SnIuk9gnRCA/4SYjm5SkHi1kOsIKjoutJ0j6qu01cZAUOxHo
 jiI2oeMHv99io5pqeBIVsEP92hF5pgFoq7UlkWI=
X-Google-Smtp-Source: ABdhPJwCEyx+wmqrFUv640p8yJy8eY2sYOEIDXEj/DD5NDhOwWleNVqKa5yzVDKQryUe9mvaALl+3zlHBVcQT43pRDg=
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr923395pjb.4.1596142290243; 
 Thu, 30 Jul 2020 13:51:30 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:51:10 -0700
In-Reply-To: <20200730205112.2099429-1-ndesaulniers@google.com>
Message-Id: <20200730205112.2099429-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 2/4] ARM: backtrace-clang: add fixup for lr dereference
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Huckleberry <nhuck15@gmail.com>,
 Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_165133_989234_6470B41C 
X-CRM114-Status: GOOD (  13.34  )
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 clang-built-linux@googlegroups.com, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the value of the link register is not correct (tail call from asm
that didn't set it, stack corruption, memory no longer mapped), then
using it for an address calculation may trigger an exception.  Without a
fixup handler, this will lead to a panic, which will unwind, which will
trigger the fault repeatedly in an infinite loop.

We don't observe such failures currently, but we have. Just to be safe,
add a fixup handler here so that at least we don't have an infinite
loop.

Cc: stable@vger.kernel.org
Fixes: commit 6dc5fd93b2f1 ("ARM: 8900/1: UNWINDER_FRAME_POINTER implementation for Clang")
Reported-by: Miles Chen <miles.chen@mediatek.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/lib/backtrace-clang.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
index 5388ac664c12..40eb2215eaf4 100644
--- a/arch/arm/lib/backtrace-clang.S
+++ b/arch/arm/lib/backtrace-clang.S
@@ -146,7 +146,7 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
 
 		tst	sv_lr, #0		@ If there's no previous lr,
 		beq	finished_setup		@ we're done.
-		ldr	r0, [sv_lr, #-4]	@ get call instruction
+prev_call:	ldr	r0, [sv_lr, #-4]	@ get call instruction
 		ldr	r3, .Lopcode+4
 		and	r2, r3, r0		@ is this a bl call
 		teq	r2, r3
@@ -206,6 +206,13 @@ finished_setup:
 		mov	r2, frame
 		bl	printk
 no_frame:	ldmfd	sp!, {r4 - r9, fp, pc}
+/*
+ * Accessing the address pointed to by the link register triggered an
+ * exception, don't try to unwind through it.
+ */
+bad_lr:		mov	sv_fp, #0
+		mov	sv_lr, #0
+		b	finished_setup
 ENDPROC(c_backtrace)
 		.pushsection __ex_table,"a"
 		.align	3
@@ -214,6 +221,7 @@ ENDPROC(c_backtrace)
 		.long	1003b, 1006b
 		.long	1004b, 1006b
 		.long   1005b, 1006b
+		.long	prev_call, bad_lr
 		.popsection
 
 .Lbad:		.asciz	"%sBacktrace aborted due to bad frame pointer <%p>\n"
-- 
2.28.0.163.g6104cc2f0b6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
