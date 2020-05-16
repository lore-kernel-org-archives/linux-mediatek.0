Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82BEC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:51:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950BA20671
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRd1Biem";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wfmkk6YL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950BA20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdIwtNUxW2QYvga3c0rQC+9t8ojH9UPs9+GBTEldUGU=; b=aRd1BiemV97tEs
	YNXFgfsodV9JX1rP8dHCP3cJW6sHp2y2Gg4D3Otqc6OkV5BnmxCP/h44BlXiS+mGTeFxy9VmnN0zF
	yjILt+iH0EdK0jqnOeo2no/ZffvWjP3x3suiEIAiGJHq/5AwQvwim8oXil2X6ONde+JDhgYnBoFNa
	Kg04oXGdPwrdFnnrkIYtD4ieHN4Gsgn2jxVeBWHDqyqaEfQ5YzSVR+kWroG4FQ//0mZO3KtO5N/uN
	1P41LdKQJaRPCEWJJu4QfkXQsWy/09sKojekyLbjJX64Mzxx97Cb8HgDb/W2qSGS0A0zrlcyWCzL1
	O05zvKXSuofv376x8HlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZwHL-0006Jf-EC; Sat, 16 May 2020 12:50:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZwGZ-0003B2-L0; Sat, 16 May 2020 12:50:13 +0000
Received: by mail-pg1-x543.google.com with SMTP id n11so2357944pgl.9;
 Sat, 16 May 2020 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Z6dDEgJ8JOKztYXxydgUej7Z//VJ8spR5lsEGk0ThA=;
 b=Wfmkk6YLVQyys3v12FMJyKSckjTTVNq2Ei/+qQ9hyv9vpR/RMpkRz/hBkEe2dapNid
 IVsTNI1hHNfkQLlg1NxoxI1q+Z51znwv+LyW1iO/OOFMr7xFIbVRNI+brXpKPjX5MENB
 ajGEQcanj1mDwOiASbV84kEpQjOwAAWYtEwcYciYO5lXsEnQl++umR+MXOwihDIY/ZPy
 nkXdGJfLwLcoiVY1YMp6m1DpPyYz3WDPDd3kwAfpdjwBaxvLfP5rejq4Se/XSGj21P/c
 5uHmd2WrY5io8clRne5suBQYEIwgcAK1+r5ZTClo6qiArJfMJSWRlr1rmwwPVMTlYqW+
 WwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z6dDEgJ8JOKztYXxydgUej7Z//VJ8spR5lsEGk0ThA=;
 b=d2bMcaLjcaPpIH+1G/7rd73IcfJN0Y1rUSLkpjU1NQfjZnzK8hkV+raea/j1YXzWL+
 4rMHR+gHwrv2+CduhCRKBeEVls1c/iju5XKCRiuvtmOjbmiKiRqqGaYDxr8hDf03aoPR
 KM/zDnDe0W2LpX77zX1GCCw1GS5PUrI+/q9wkGovx+ust9JnfgdHiwCEuRA25oyyUY3e
 4+F1YxalnGuoHS0F5fFK5Da2lZLwSSX7FXQRLTpjp042SYwzTtkW9oKrt0aZehrIR34E
 WrOBn/RZmttkWFwy1PqSRKhdsJifkwhINIIwnU2quff3c/YopSiHE5w6rvSXmw04bBKF
 0oNg==
X-Gm-Message-State: AOAM532r+3EnrMmkYjZ6C2zPw0hnNChiH1IMyDhbJPkb/0Q/H9iNe7Qj
 CGkELYy3mgn6s0+XjgPLvKg=
X-Google-Smtp-Source: ABdhPJwTurwJxVNlU96gRcq5LNsYIbq02ALyV5Dcv7PzRcjk9FXAX24fNayH3a4igWL0noCY6Oz53w==
X-Received: by 2002:a62:e402:: with SMTP id r2mr8634666pfh.300.1589633410908; 
 Sat, 16 May 2020 05:50:10 -0700 (PDT)
Received: from localhost.localdomain (61-228-240-171.dynamic-ip.hinet.net.
 [61.228.240.171])
 by smtp.gmail.com with ESMTPSA id k27sm3768323pgb.30.2020.05.16.05.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 05:50:10 -0700 (PDT)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: perf: Support NMI context for perf event ISR
Date: Sat, 16 May 2020 20:48:56 +0800
Message-Id: <20200516124857.75004-3-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200516124857.75004-1-lecopzer@gmail.com>
References: <20200516124857.75004-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_055011_702507_560D08F0 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: mark.rutland@arm.com, lecopzer.chen@mediatek.com,
 Lecopzer Chen <lecopzer@gmail.com>, alexander.shishkin@linux.intel.com,
 catalin.marinas@arm.com, jolsa@redhat.com, acme@kernel.org,
 peterz@infradead.org, mingo@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, namhyung@kernel.org, will@kernel.org,
 yj.chiang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Perf ISR doesn't support for NMI context, thus add some necessary
condition-if to handle NMI context:

- We should not hold pmu_lock since it may have already been acquired
before NMI triggered.
- irq_work should not run at NMI context.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/kernel/perf_event.c | 36 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index 4d7879484cec..94b404509f02 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -313,6 +313,23 @@ static inline bool armv8pmu_event_is_chained(struct perf_event *event)
 	       (idx != ARMV8_IDX_CYCLE_COUNTER);
 }
 
+/*
+ * NMI Perf interrupts may be triggered during kernel holding
+ * same lock.
+ * Avoid acquiring lock again in NMI context.
+ */
+#define armv8pmu_lock(lock, flags)				\
+	do {							\
+		if (!in_nmi())					\
+			raw_spin_lock_irqsave(lock, flags);	\
+	} while (0)
+
+#define armv8pmu_unlock(lock, flags)				\
+	do {							\
+		if (!in_nmi())					\
+			raw_spin_unlock_irqrestore(lock, flags);\
+	} while (0)
+
 /*
  * ARMv8 low level PMU access
  */
@@ -589,7 +606,7 @@ static void armv8pmu_enable_event(struct perf_event *event)
 	 * Enable counter and interrupt, and set the counter to count
 	 * the event that we're interested in.
 	 */
-	raw_spin_lock_irqsave(&events->pmu_lock, flags);
+	armv8pmu_lock(&events->pmu_lock, flags);
 
 	/*
 	 * Disable counter
@@ -611,7 +628,7 @@ static void armv8pmu_enable_event(struct perf_event *event)
 	 */
 	armv8pmu_enable_event_counter(event);
 
-	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
+	armv8pmu_unlock(&events->pmu_lock, flags);
 }
 
 static void armv8pmu_disable_event(struct perf_event *event)
@@ -623,7 +640,7 @@ static void armv8pmu_disable_event(struct perf_event *event)
 	/*
 	 * Disable counter and interrupt
 	 */
-	raw_spin_lock_irqsave(&events->pmu_lock, flags);
+	armv8pmu_lock(&events->pmu_lock, flags);
 
 	/*
 	 * Disable counter
@@ -635,7 +652,7 @@ static void armv8pmu_disable_event(struct perf_event *event)
 	 */
 	armv8pmu_disable_event_irq(event);
 
-	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
+	armv8pmu_unlock(&events->pmu_lock, flags);
 }
 
 static void armv8pmu_start(struct arm_pmu *cpu_pmu)
@@ -643,10 +660,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 	unsigned long flags;
 	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
 
-	raw_spin_lock_irqsave(&events->pmu_lock, flags);
+	armv8pmu_lock(&events->pmu_lock, flags);
 	/* Enable all counters */
 	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
-	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
+	armv8pmu_unlock(&events->pmu_lock, flags);
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
@@ -654,10 +671,10 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 	unsigned long flags;
 	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
 
-	raw_spin_lock_irqsave(&events->pmu_lock, flags);
+	armv8pmu_lock(&events->pmu_lock, flags);
 	/* Disable all counters */
 	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
-	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
+	armv8pmu_unlock(&events->pmu_lock, flags);
 }
 
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
@@ -722,7 +739,8 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	 * platforms that can have the PMU interrupts raised as an NMI, this
 	 * will not work.
 	 */
-	irq_work_run();
+	if (!armpmu_support_nmi())
+		irq_work_run();
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
