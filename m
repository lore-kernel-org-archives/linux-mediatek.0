Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D39C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qLgqGxCEOJUWYl1HLzDiDyCtuT3vN8bbM1YFd5If7Hk=; b=BemMU6FPjJPk7+/9SNkpyjJXcJ
	3WU3kjmKTZ71eD5X4WXfISvf8KiPtUAlF9WRz6LlkhMW2HgSpfoMg92sygzEEJp/HPkSyVsiCpmKo
	Vc8F+M4aRbFNruH/zsGVtBPzKlkt+QZtjTfyN6bSRZjtjq0NmZyGFeo2s8r7PpmouiYpl0uuGhLum
	IVixUk6GhJS7VWQN1McqNB6/Ah2AeKp2uLvCko7+IADAviGxK69rj/XjFLbnu5Uc/PVNk2wNRgcoK
	P4aa6rZrup1VhZFWEnVlfP+tU20SG9q1flsMJCn04X5d+1XM95Ks4YBCaMPQDBqmpuUjfnnx9PZjT
	LDRKdrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoxh-00BkMU-1b;
	Fri, 04 Aug 2023 07:11:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoxe-00BkLc-32
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 07:11:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bba04b9df3so15361695ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Aug 2023 00:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691133056; x=1691737856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLgqGxCEOJUWYl1HLzDiDyCtuT3vN8bbM1YFd5If7Hk=;
        b=huTaTGCouicXJqoF3OEt6UaDylAOrbKUTRYDM7hccOOkVS8vQFtKchgBM/8pr81TGl
         4xRvendyIemNoWM+VcufHw84hR05Gxlm7QgRIexK1Fcgr5E/tN5IX84CFamvf5CpsVcl
         dItnBo2ldYwo2a3ihnDIW6/30sopoDS2QNH8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691133056; x=1691737856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLgqGxCEOJUWYl1HLzDiDyCtuT3vN8bbM1YFd5If7Hk=;
        b=CttZ7Cp9V38K+aOmXL4f971gGmlje9oKS0iObWazvy2yl3QRhUVpejnx62SJ3ytPFn
         32erv4Ou74d9+ZUpZQuPB1+R2bDLeaWKHjrjkJ9ggaA2KTulzHrLm8PQcmdwJGHYHrvn
         +Fa2lXiwYbEnVrDQGoF0+JFGDK35AlMj0Oz3yN4/98fU7sIdedn1nFyHdQhEBmkuDHTM
         yjVaLar97WUVCZg8H5TQj20NxbgtxH8RjUtwydQMMLBscav81zNob2vlk6IVNhbkJbf8
         nttaMed9AJ+yEtTtRjmTe7mlPnqa2NgKEw7sXQUEMFJzCCQJzIulJNoUFvEEbBwx3xWz
         5CVg==
X-Gm-Message-State: AOJu0Yx73G8BUiWSiZcvYJ7GwqDppFdOTl8Oe5Wx2geTSifgmzobip75
	WZALIZReGRfeR/yLQVsKzLrD7Q==
X-Google-Smtp-Source: AGHT+IETdwNZg9gj+A7ervMmpFTsOMlLZiUHM59Tw5IabaPwEazFEscS0doAxstPoxaGixEQ6FiJCg==
X-Received: by 2002:a17:902:d904:b0:1bb:2020:be0d with SMTP id c4-20020a170902d90400b001bb2020be0dmr950403plz.14.1691133056517;
        Fri, 04 Aug 2023 00:10:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709027fcf00b001bb9d6b1baasm1004673plb.198.2023.08.04.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 00:10:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Kees Cook <keescook@chromium.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ARM: ptrace: Restore syscall skipping and restart while tracing
Date: Fri,  4 Aug 2023 00:10:53 -0700
Message-Id: <20230804071045.never.134-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616; i=keescook@chromium.org;
 h=from:subject:message-id; bh=YJOlkz5vR8N2JtifY2dbTGKNtQ5WuTgnR2Q8FS+sopI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBkzKR9I86BSc6Kgktbv/7TDrdJhNiDSv95T3xHY
 eyI/ytlKbuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZMykfQAKCRCJcvTf3G3A
 Jik5D/wJIILgmLRP6PaC7n466O199JDTx/nN4iSx3/PxF6xa5b2VxRNepGSXm+bdcy5M4OqFg3r
 TA1mKMteXSnWTrbT6GiBIpzbb7RZFqHQOobd5wekGbI0n067nE+ORmctWJhm+Ez+ND7kvimDYsA
 m0J22/G7zNs0ra32uU0923Itwf0Ecq3IpRk6/Nq0Thkqs6Ske3CEnT7knCi/TW2wVVRFaYYGBg4
 JRpm78U3nRqxZZKGzRMHXrjS+C0zpxMYb/mAi70Gqst2Cv8SQ6zG+AF+0yXYHtn9nDL6cpYs/zg
 2RJt+z6nn1dc1PjKFW2epvs50HQWpZ6bxr27B9saaxelsggIzQvZiSP3kRP20HiSKuy15PBpfCt
 lPiwqMq/vdC+jkApGPq34GOt5QykWpS6foa957+wSOq8zGbgJ+P6VR9dABq/CWSKdpYo8u8Rq1Q
 QivGh6o9OZTwFFf+tzPyFnrCP8vukNObnld8PCe9Fb2ZReOQa7Q0dce7AWkvt6u0DflPGvGr9NT
 wFVfmqWQUQRZ4u9BQS/OSWloz11A49wuJuNiBnO43ROHdO94wjO1qs4Z5Iz4X4KfaUUsSguYalJ
 H4OwKyvCk8gKBRbgGrvrMqp4nQvKxVditb2rk2EjVJEARIxXoYwJwZEmcJEeKbv2JPCRnqimCs/
 PCY1+m3 4PNLqCLQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_001059_012690_EF218C89 
X-CRM114-Status: GOOD (  16.13  )
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

Since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
thread_info->abi_syscall"), the seccomp selftests "syscall_errno",
"syscall_faked", and "syscall_restart" have been broken. This was
related to two issues:

- seccomp and PTRACE depend on using the special value of "-1" for
  skipping syscalls. This value wasn't working because it was getting
  masked by __NR_SYSCALL_MASK in both PTRACE_SET_SYSCALL and
  get_syscall_nr().

- the syscall entry label "local_restart" is used for resuming syscalls
  interrupted by signals, but the updated syscall number (in scno) was
  not being stored in current_thread_info()->abi_syscall, causing traced
  syscall restarting to fail.

Explicitly test for -1 in PTRACE_SET_SYSCALL and get_syscall_nr(),
leaving it exposed when present, allowing tracers to skip syscalls
again.

Move the AEABI-only assignment of current_thread_info()->abi_syscall
after the "local_restart" label to allow tracers to survive syscall
restarting.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Fixes: 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store thread_info->abi_syscall")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Note that I haven't tested OABI at all, and AEABI+OABI_COMPAT doesn't
work with seccomp. I booted an AEABI system under AEABI+OABI_COMPAT,
but I wasn't able to test tracing...
---
 arch/arm/include/asm/syscall.h | 3 +++
 arch/arm/kernel/entry-common.S | 5 +++--
 arch/arm/kernel/ptrace.c       | 5 +++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index dfeed440254a..fe4326d938c1 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -25,6 +25,9 @@ static inline int syscall_get_nr(struct task_struct *task,
 	if (IS_ENABLED(CONFIG_AEABI) && !IS_ENABLED(CONFIG_OABI_COMPAT))
 		return task_thread_info(task)->abi_syscall;
 
+	if (task_thread_info(task)->abi_syscall == -1)
+		return -1;
+
 	return task_thread_info(task)->abi_syscall & __NR_SYSCALL_MASK;
 }
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index bcc4c9ec3aa4..08bd624e4c6f 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -246,8 +246,6 @@ ENTRY(vector_swi)
 	bic	scno, scno, #0xff000000		@ mask off SWI op-code
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 	eor	scno, scno, #__NR_SYSCALL_BASE	@ check OS number
-#else
-	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
 	/*
 	 * Reload the registers that may have been corrupted on entry to
@@ -256,6 +254,9 @@ ENTRY(vector_swi)
  TRACE(	ldmia	sp, {r0 - r3}		)
 
 local_restart:
+#if defined(CONFIG_AEABI) && !defined(CONFIG_OABI_COMPAT)
+	str	scno, [tsk, #TI_ABI_SYSCALL]	@ store scno for syscall restart
+#endif
 	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 2d8e2516906b..fef32d73f912 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -783,8 +783,9 @@ long arch_ptrace(struct task_struct *child, long request,
 			break;
 
 		case PTRACE_SET_SYSCALL:
-			task_thread_info(child)->abi_syscall = data &
-							__NR_SYSCALL_MASK;
+			if (data != -1)
+				data &= __NR_SYSCALL_MASK;
+			task_thread_info(child)->abi_syscall = data;
 			ret = 0;
 			break;
 
-- 
2.34.1


