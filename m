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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ED7C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD6D2173E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bcPmN7PR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="h7wTTnVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD6D2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BZArP4QZiYBEj1bfvmI2qIysiC5MwRn63KKG178jOps=; b=bcPmN7PRB6+YO8LlDFf5yIgFf
	3qw/bB9uc0EsdE2QSsxyovDpB+XZ1piKianbaJH1mB688loM0rhNKEsp6ymxF/RgwcFrxRvohDwaP
	1eQ2wLx2FPgQx6D6kqAYN+gBmbjOHm/m6koYeNDI2XKkiSAHsN2u7DzM3hViKrxQaMrItOvQf78h8
	tmLbXpH+54VLy8DKRabiqiLJxgAvjBMjIUQDolMcVXg2pmIPs++3I+GqgYQFY7umfjJw4xUGJXvd5
	BD2phn4Jf6FyVC79PmBIQv53JLp/smFUAjEFy7YvC1wXl6UDY9cZXg2QndH95O8aW9C1CquUeo6S0
	pMTXt4few==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1FWl-0004lD-T4; Thu, 30 Jul 2020 20:51:47 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1FWb-0004gt-VM
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 20:51:39 +0000
Received: by mail-qt1-x84a.google.com with SMTP id b1so11992677qto.17
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ydEFx7nL1QHetJ3IzZOqahIDDjnqGsyqZ8n++t96BPs=;
 b=h7wTTnVreiKdJy+S3fm1G5Q+3oIaI3sFumAyVhgRi/n9ezm7wRwkGq12SeApvBf77Z
 yX7kGgMRDPif/nTYK3URgcmC1Hxjt9vaylvzFShL86Y577Y6AIKwncRD7f+EY3NuLIgC
 p7gZGl2vcGUf1bULilSS8BokmMppT1Dk6tDPMc2loxDlz/Sj0BwExazMghpSO2ttTSYm
 QZT41EGqN8BUowWyiJBATS4vAbv+FJCk9y9IxDLnYkcJddcQ3rn2W7WaH/CaXUGuKrou
 Q/E6wrfVPA3s3Q8HvtnjIGhotWF6O53G/C61bFtcN5o/TijH9HAU744EsMUgY5wpo+GY
 jLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ydEFx7nL1QHetJ3IzZOqahIDDjnqGsyqZ8n++t96BPs=;
 b=lcGxE7fhzFqGIpaCvcZunAyONjsdDYIIWOp518OOheSMd0CmEyczoWKeJHndihVc0e
 nL3htdA5MTQ1p25AUF85qVRNqOUWhXqZckBOEqz/FOWOhaGNOy+cbb0aulbAIfCN86/H
 giVVWslb46RMynEB+iG0jW3McMVpw02fIdlDEXXyTueNcRx4SX32cavpSfMN/vTPlvRW
 DgHmP9N8DSpc2mfHJZO9LduhtrBcoUhP0LL09JEdtjdLJHgtjOWT/CMz7oRx/4VrYx5Z
 zcByo9/azggeN2BrtjNkHV7Yb086Kbqt1uM5yQ8J0tWsPmV/dgRtYDBcpx82i1enMPIr
 OsZA==
X-Gm-Message-State: AOAM532m3mLb66fzu+dLd87EZKP96eeLBU0A1GxQl2up3m4ZF43Qcwb4
 Gxg6ExacZev/Q6gWvGHjMQwssp6aZX7ge828Iio=
X-Google-Smtp-Source: ABdhPJypnfQMkIkUmhttCt6JJcEy5+kESjzSY6DmkgV227v2mbIs9Wfta5Fz6VMfPMaMbwf8XRvCb9EMykZZanPJTgU=
X-Received: by 2002:a0c:b891:: with SMTP id y17mr1039225qvf.2.1596142294513;
 Thu, 30 Jul 2020 13:51:34 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:51:11 -0700
In-Reply-To: <20200730205112.2099429-1-ndesaulniers@google.com>
Message-Id: <20200730205112.2099429-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 3/4] ARM: backtrace-clang: give labels more descriptive names
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Huckleberry <nhuck15@gmail.com>,
 Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_165138_084137_AF869AF3 
X-CRM114-Status: GOOD (  11.50  )
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

Removes the 1004 label; it was neither a control flow target, nor an
instruction we expect to produce a fault.

Gives the labels slightly more readable names. The `b` suffixes are
handy to disambiguate between labels of the same identifier when there's
more than one. Since these labels are unique, let's just give them
names.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/lib/backtrace-clang.S | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
index 40eb2215eaf4..7dad2a6843a5 100644
--- a/arch/arm/lib/backtrace-clang.S
+++ b/arch/arm/lib/backtrace-clang.S
@@ -121,8 +121,8 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
  * start. This value gets updated to be the function start later if it is
  * possible.
  */
-1001:		ldr	sv_pc, [frame, #4]	@ get saved 'pc'
-1002:		ldr	sv_fp, [frame, #0]	@ get saved fp
+load_pc:	ldr	sv_pc, [frame, #4]	@ get saved 'pc'
+load_fp:	ldr	sv_fp, [frame, #0]	@ get saved fp
 
 		teq	sv_fp, mask		@ make sure next frame exists
 		beq	no_frame
@@ -142,7 +142,7 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
  * registers for the current function, but the stacktrace is still printed
  * properly.
  */
-1003:		ldr	sv_lr, [sv_fp, #4]	@ get saved lr from next frame
+load_lr:	ldr	sv_lr, [sv_fp, #4]	@ get saved lr from next frame
 
 		tst	sv_lr, #0		@ If there's no previous lr,
 		beq	finished_setup		@ we're done.
@@ -166,8 +166,7 @@ finished_setup:
 /*
  * Print the function (sv_pc) and where it was called from (sv_lr).
  */
-1004:		mov	r0, sv_pc
-
+		mov	r0, sv_pc
 		mov	r1, sv_lr
 		mov	r2, frame
 		bic	r1, r1, mask		@ mask PC/LR for the mode
@@ -182,7 +181,7 @@ finished_setup:
  * pointer the comparison will fail and no registers will print. Unwinding will
  * continue as if there had been no registers stored in this frame.
  */
-1005:		ldr	r1, [sv_pc, #0]		@ if stmfd sp!, {..., fp, lr}
+load_stmfd:	ldr	r1, [sv_pc, #0]		@ if stmfd sp!, {..., fp, lr}
 		ldr	r3, .Lopcode		@ instruction exists,
 		teq	r3, r1, lsr #11
 		ldr	r0, [frame]		@ locals are stored in
@@ -201,7 +200,7 @@ finished_setup:
 		mov	frame, sv_fp		@ above the current frame
 		bhi	for_each_frame
 
-1006:		adr	r0, .Lbad
+bad_frame:	adr	r0, .Lbad
 		mov	r1, loglvl
 		mov	r2, frame
 		bl	printk
@@ -216,11 +215,10 @@ bad_lr:		mov	sv_fp, #0
 ENDPROC(c_backtrace)
 		.pushsection __ex_table,"a"
 		.align	3
-		.long	1001b, 1006b
-		.long	1002b, 1006b
-		.long	1003b, 1006b
-		.long	1004b, 1006b
-		.long   1005b, 1006b
+		.long	load_pc, bad_frame
+		.long	load_fp, bad_frame
+		.long	load_lr, bad_frame
+		.long	load_stmfd, bad_frame
 		.long	prev_call, bad_lr
 		.popsection
 
-- 
2.28.0.163.g6104cc2f0b6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
