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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2471C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897FA206D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VgGRp7WC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCJnrewn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897FA206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6rkptUPmqK7M7GcnOhjf1GSc5XS2vH5jCQ3aIXvePE=; b=VgGRp7WCYAiSyx
	lfmxw5eNfb/QL2jKPGf+qcG6w9zrC+W953Eiy65Ru/AGD5FqkKAN41QZDUlwZkR3al48lhyEujZ8x
	7Jj7BQcOCuemWk5LFuTawilW95AXUTqiFp7McFPbFHLJ8gnL0IK5O+CX7r2iqQRiYVFd83t5d1eQo
	TeA1qqLP2aDQSFtkol1fBSPN5Bo31S3Yy8TyymolUzLyvA17hzzmOtsZlww8jLlGIyaMy6EWwrMZD
	wI28nTygx+vfBKqdKlgnEbM4rO77132NPnOzwSmAekd+46kD4UAoyBqqLrvg9+lcpcJnxqccxiZ1a
	n8MKyy8jcN5ZVMaIgPYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZwH2-0003e8-3n; Sat, 16 May 2020 12:50:40 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZwGU-00037T-Cp; Sat, 16 May 2020 12:50:08 +0000
Received: by mail-pl1-x642.google.com with SMTP id x10so2084903plr.4;
 Sat, 16 May 2020 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/VElStb6fjAYbZ4B7vgbZVnEhth0ws2lGWe8fvBxrg=;
 b=SCJnrewntUekgCrLrPYKTjDyWUiaT6tukJ7ghZCp/+OlBZYuLFZdo2vx6iAo08VGqN
 HA9FU+E4IuYzi3E4RLgOGtcsrMKaIVhKfJk8juuPDehu3XUNZEfCnrFKPBAZKCX4xGqb
 hs1nFDZ67Bdf0zkzStFPU4wszli+z8hWwt3+8E2+bCSZh+E2Bm66Im4l8o0Ips+Flf/n
 FFQ1sO1tqv4qIv2PgbVNPXtzzz4QFerAN3CxpgNEm3uUPTzlh/z8jL8/4qLXPiJzRbeb
 PGGA/oywLbZkAycUIqB9G9+4YBpewcErpSWjLaYM/h/L6u16827k/r8aJfYhCa2S8oPu
 y4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/VElStb6fjAYbZ4B7vgbZVnEhth0ws2lGWe8fvBxrg=;
 b=N8UO1BNd/X8AkvNOHhOceN2cTZULU7gon2FQmreU6w9+0w/cMer2TEGL68yAIk8CUk
 qVovPXJuyqTqpnhmsLLkvms9jgie35B2PXnrAT267CnkqaR7M0XSy+OfEYusJTioJvye
 IvK5ZJyyFBEcWwiUWex8KMYkjD6goRMLB7/eEKFOEmx7lSUWFmb9YWLR1RfKnSYnpS1W
 HAUL6RX87pGyFWINbGp/ifi/hz6icHrCzs1i0KyJmFAPOwm/jOmkChnKOGXkhvjNJZBh
 ZAq7phaPzz7jMGiIJ3xgdCrvXQ59wqAFFXLfEZYdPKbEWhUAQNCWmAgA5DA7mvJI8gYv
 SQRA==
X-Gm-Message-State: AOAM531jDT3dNX25SA7YqNnf8MqL0JftdN/XWyQf67S5YCJW/FJB5LZm
 FM3TAwU9mwXaiDN9t20bHBk=
X-Google-Smtp-Source: ABdhPJzcs64HJTWzTse+oOBspVOEV5XzRGG9wrG7svjtS4HdTsyk3E3hIOd9b+hUCGQIn9WnzsqeTQ==
X-Received: by 2002:a17:90a:7349:: with SMTP id
 j9mr9123258pjs.196.1589633405850; 
 Sat, 16 May 2020 05:50:05 -0700 (PDT)
Received: from localhost.localdomain (61-228-240-171.dynamic-ip.hinet.net.
 [61.228.240.171])
 by smtp.gmail.com with ESMTPSA id k27sm3768323pgb.30.2020.05.16.05.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 05:50:05 -0700 (PDT)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm_pmu: Add support for perf NMI interrupts registration
Date: Sat, 16 May 2020 20:48:55 +0800
Message-Id: <20200516124857.75004-2-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200516124857.75004-1-lecopzer@gmail.com>
References: <20200516124857.75004-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_055006_437714_FCBB72A1 
X-CRM114-Status: GOOD (  11.90  )
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

Register perf interrupts by request_nmi()/percpu_nmi() when both
ARM64_PSEUDO_NMI and ARM64_PSEUDO_NMI_PERF are enabled and nmi
cpufreature is active.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 drivers/perf/arm_pmu.c       | 51 +++++++++++++++++++++++++++++++-----
 include/linux/perf/arm_pmu.h |  6 +++++
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index df352b334ea7..fa37b72d19e2 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -559,6 +559,48 @@ void armpmu_free_irq(int irq, int cpu)
 	per_cpu(cpu_irq, cpu) = 0;
 }
 
+static void armpmu_prepare_percpu_nmi_other(void *info)
+{
+	/*
+	 * We don't need to disable preemption since smp_call_function()
+	 * did this for us.
+	 */
+	prepare_percpu_nmi((uintptr_t) info);
+}
+
+static int _armpmu_request_irq(unsigned int irq, irq_handler_t handler,
+			       unsigned long flags, int cpu)
+{
+	if (armpmu_support_nmi())
+		return request_nmi(irq, handler, flags, "arm-pmu",
+				   per_cpu_ptr(&cpu_armpmu, cpu));
+	return request_irq(irq, handler, flags, "arm-pmu",
+			   per_cpu_ptr(&cpu_armpmu, cpu));
+}
+
+static int _armpmu_request_percpu_irq(unsigned int irq, irq_handler_t handler)
+{
+	if (armpmu_support_nmi()) {
+		int err;
+
+		err = request_percpu_nmi(irq, handler, "arm-pmu",
+					 &cpu_armpmu);
+		if (err)
+			return err;
+
+		preempt_disable();
+		err = prepare_percpu_nmi(irq);
+		if (err) {
+			return err;
+			preempt_enable();
+		}
+		smp_call_function(armpmu_prepare_percpu_nmi_other,
+				  (void *)(uintptr_t) irq, true);
+		preempt_enable();
+	}
+	return request_percpu_irq(irq, handler, "arm-pmu",
+				  &cpu_armpmu);
+}
+
 int armpmu_request_irq(int irq, int cpu)
 {
 	int err = 0;
@@ -582,12 +624,9 @@ int armpmu_request_irq(int irq, int cpu)
 			    IRQF_NO_THREAD;
 
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
-		err = request_irq(irq, handler, irq_flags, "arm-pmu",
-				  per_cpu_ptr(&cpu_armpmu, cpu));
-	} else if (armpmu_count_irq_users(irq) == 0) {
-		err = request_percpu_irq(irq, handler, "arm-pmu",
-					 &cpu_armpmu);
-	}
+		err = _armpmu_request_irq(irq, handler, irq_flags, cpu);
+	} else if (armpmu_count_irq_users(irq) == 0)
+		err = _armpmu_request_percpu_irq(irq, handler);
 
 	if (err)
 		goto err_out;
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 5b616dde9a4c..5b878b5a22aa 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -160,6 +160,12 @@ int arm_pmu_acpi_probe(armpmu_init_fn init_fn);
 static inline int arm_pmu_acpi_probe(armpmu_init_fn init_fn) { return 0; }
 #endif
 
+static inline bool armpmu_support_nmi(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI_PERF) &&
+	       system_uses_irq_prio_masking();
+}
+
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
 struct arm_pmu *armpmu_alloc_atomic(void);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
