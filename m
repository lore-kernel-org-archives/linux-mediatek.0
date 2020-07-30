Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99DFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82ED320829
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBBOb81N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="KNXCOzxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82ED320829
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SwxrHr0KPxLVUWRLPmIqpfMf5zNx2R529UVPSburKEw=; b=XBBOb81Nm9uzNJV4/khXFrTNA
	XI6rCZX3LnBitzhaJMUZGrOymLS0Q5f3UQ347by2hhk9SpHZZrmdSNCU92ZfN9+Y+URPsMYvs/4hl
	VdLZ71/Gumt4lWmoUtNMaMYne7pB9ZkDEDEqcjU5KpYd3Asgtkt0iltgoojarsks2P+wn+CYpINVO
	4uLCVIPY4bEkOnpM838iVmFg9H2OV9d3+P/tAiNpKpX58/Vt/qJSeVz2uZmqsAOPasjUkywqiHjeI
	iMIXTkB7dFrJSK8FuwoAE+InvHS0FkduBs8jwzxXicS4T0sZu+08Yyn2xMlShMPqNdjzPmTMJN9HY
	tLVg2B3zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1FWx-0004pK-RW; Thu, 30 Jul 2020 20:51:59 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1FWf-0004iA-Fg
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 20:51:42 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id e196so30895229ybh.6
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 13:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=QONIUax01BTjdO9Ra0WL2SaVjevDM7EFtQflcDkiZpw=;
 b=KNXCOzxZ5pBdanQWFcSr/OXE5B2/MHBDkzE0HeXydXqmchbCVf1W+UZq4r4Psxg/Wk
 1DEQowbCu9uiGpRhB/dKS68WmrNs9kpD8hFn8AFd9ehaQ+aESTZaHw/5spbgKV2A8+hh
 gPvh6rRe3QytXFvyoUDWs9xZdj9sIJaHtZ1y1PJbwcXaIx9mdZ/Y3Xjw9DwXmEjNWo4/
 2UHVOrmwIJ0roULI0LVnH1Rym+desYivmDF40KeGKX9Tl0bEe2Awjztl/Vxjw3CZlc67
 sNbngbmuxGMjWzDi+NpTTHb8LppYudA+15WmYdcxDCVNRvEZpo0kOAEryTzieodpJD6r
 Ikpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QONIUax01BTjdO9Ra0WL2SaVjevDM7EFtQflcDkiZpw=;
 b=e9GabvgxGIByjfKpW5/ABt+DpOTpi0ROnkLIF6uiw9gRsVX0dq7dn2gMp4D99aKtgN
 2AUej0Lo7djPTkh7KZSmRawHOmXGKTfeLzPnd6gi3RR2BVuZC9ATwEFVZWjFQklK7C8Z
 ET//8yAWfe3hqlvzcW+xb5OR6v898d+P7yBs6Fim/OS18no7VGobVJh0q8iBxNR7Rflz
 AOXzAmw0RJJlFn7vJrrUdGYf/ZNN4tS2620aodh6eo+bwXDs8mMx2vsL9++SO7uHleFy
 jpSYGEt0LKZJIfQA4l97bT1Y7OZIgHkkRGk3wEZxR1+MlkdtYuEiaobOdKSxHHX4SHXe
 VDFA==
X-Gm-Message-State: AOAM53326TN6qwYhjqyhrCmqtH6OTpgFUIw0Ez9GFnz0+nC/31DWSEsQ
 F/BlwF5hAd0iI1HY+guH6ik4rXh6feJIUnfoq3A=
X-Google-Smtp-Source: ABdhPJxNBCENw+3kJpkaLmevqSScT/aVOmfpWZ+6QdeX2ScuiXo2KHy5MFNiKfuHDYstF0PZx795gbSwSo9qT61KX4Q=
X-Received: by 2002:a25:aba2:: with SMTP id v31mr1236236ybi.138.1596142298407; 
 Thu, 30 Jul 2020 13:51:38 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:51:12 -0700
In-Reply-To: <20200730205112.2099429-1-ndesaulniers@google.com>
Message-Id: <20200730205112.2099429-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 4/4] ARM: backtrace: use more descriptive labels
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Huckleberry <nhuck15@gmail.com>,
 Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_165141_616153_2B88214D 
X-CRM114-Status: GOOD (  10.30  )
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

We don't necessarily need the `b` suffixes used to disambiguate between
non-unique local labels. Give these labels more descriptive names.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/lib/backtrace.S | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/lib/backtrace.S b/arch/arm/lib/backtrace.S
index 872f658638d9..138e961ff033 100644
--- a/arch/arm/lib/backtrace.S
+++ b/arch/arm/lib/backtrace.S
@@ -37,9 +37,9 @@ ENDPROC(c_backtrace)
  THUMB(		orreq	mask, #0x03		)
 		movne	mask, #0		@ mask for 32-bit
 
-1:		stmfd	sp!, {pc}		@ calculate offset of PC stored
+store_pc:	stmfd	sp!, {pc}		@ calculate offset of PC stored
 		ldr	r0, [sp], #4		@ by stmfd for this CPU
-		adr	r1, 1b
+		adr	r1, store_pc
 		sub	offset, r0, r1
 
 /*
@@ -60,14 +60,14 @@ ENDPROC(c_backtrace)
 for_each_frame:	tst	frame, mask		@ Check for address exceptions
 		bne	no_frame
 
-1001:		ldr	sv_pc, [frame, #0]	@ get saved pc
-1002:		ldr	sv_fp, [frame, #-12]	@ get saved fp
+load_pc:	ldr	sv_pc, [frame, #0]	@ get saved pc
+load_fp:	ldr	sv_fp, [frame, #-12]	@ get saved fp
 
 		sub	sv_pc, sv_pc, offset	@ Correct PC for prefetching
 		bic	sv_pc, sv_pc, mask	@ mask PC/LR for the mode
 
-1003:		ldr	r2, [sv_pc, #-4]	@ if stmfd sp!, {args} exists,
-		ldr	r3, .Ldsi+4		@ adjust saved 'pc' back one
+load_stmfd:	ldr	r2, [sv_pc, #-4]	@ if stmfd sp!, {args} exists,
+		ldr	r3, .Lopcode + 4	@ adjust saved 'pc' back one
 		teq	r3, r2, lsr #11		@ instruction
 		subne	r0, sv_pc, #4		@ allow for mov
 		subeq	r0, sv_pc, #8		@ allow for mov + stmia
@@ -79,15 +79,15 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
 		bl	dump_backtrace_entry
 
 		ldr	r1, [sv_pc, #-4]	@ if stmfd sp!, {args} exists,
-		ldr	r3, .Ldsi+4
+		ldr	r3, .Lopcode + 4
 		teq	r3, r1, lsr #11
 		ldreq	r0, [frame, #-8]	@ get sp
 		subeq	r0, r0, #4		@ point at the last arg
 		mov	r2, loglvl
 		bleq	dump_backtrace_stm	@ dump saved registers
 
-1004:		ldr	r1, [sv_pc, #0]		@ if stmfd sp!, {..., fp, ip, lr, pc}
-		ldr	r3, .Ldsi		@ instruction exists,
+reload_stmfd:	ldr	r1, [sv_pc, #0]		@ if stmfd sp!, {..., fp, ip, lr, pc}
+		ldr	r3, .Lopcode		@ instruction exists,
 		teq	r3, r1, lsr #11
 		subeq	r0, frame, #16
 		mov	r2, loglvl
@@ -100,7 +100,7 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
 		mov	frame, sv_fp		@ above the current frame
 		bhi	for_each_frame
 
-1006:		adr	r0, .Lbad
+bad_frame:	adr	r0, .Lbad
 		mov	r1, loglvl
 		mov	r2, frame
 		bl	printk
@@ -109,15 +109,15 @@ ENDPROC(c_backtrace)
 		
 		.pushsection __ex_table,"a"
 		.align	3
-		.long	1001b, 1006b
-		.long	1002b, 1006b
-		.long	1003b, 1006b
-		.long	1004b, 1006b
+		.long	load_pc, bad_frame
+		.long	load_fp, bad_frame
+		.long	load_stmfd, bad_frame
+		.long	reload_stmfd, bad_frame
 		.popsection
 
 .Lbad:		.asciz	"%sBacktrace aborted due to bad frame pointer <%p>\n"
 		.align
-.Ldsi:		.word	0xe92dd800 >> 11	@ stmfd sp!, {... fp, ip, lr, pc}
+.Lopcode:	.word	0xe92dd800 >> 11	@ stmfd sp!, {... fp, ip, lr, pc}
 		.word	0xe92d0000 >> 11	@ stmfd sp!, {}
 
 #endif
-- 
2.28.0.163.g6104cc2f0b6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
