Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0827C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY8/55+N7u8FpSBVc12rC53oNeCakod0BBo4/o9XtcI=; b=siBRXVTaP6HGIJ
	ndpoUzJHFXqHNslu2NSHeHukUhVEvkFXxjqapGrzi+U8+EFaq+/gdy1YaJuFflxhaAYpW/Ugs1LHD
	V5iZPkLJejQ0gcwZlMHrc/XB94YsvmREYwNIr4yYDalLmiGEQgbbCXAw8xqAfxnqRlHwfdwU6w9c/
	gRBF1hgm3vr8yADiCG+/dwrm15heNRMFfdckTqYleoS75XFhq5nReMMQ6yeEh1H3jyW9RikusLPzH
	SqZeZ6ad/zAeYmeJnuCDDKCHjmHrjnKBTRoVMaHrMonHkPC8Q586/Bi7n7utIDrnkyfFAB4ZCWx5n
	IyRVwABg8q9tXwhaAilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFc0-000hVe-Na; Mon, 07 Mar 2022 15:49:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFap-000gqX-TH; Mon, 07 Mar 2022 15:48:18 +0000
X-UUID: 5e55b5fb14764fb293879cb92af5f337-20220307
X-UUID: 5e55b5fb14764fb293879cb92af5f337-20220307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1471954953; Mon, 07 Mar 2022 08:48:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 07:48:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 23:48:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 23:48:04 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <lecopzer.chen@mediatek.com>, <acme@kernel.org>,
 <akpm@linux-foundation.org>, <alexander.shishkin@linux.intel.com>,
 <catalin.marinas@arm.com>, <davem@davemloft.net>, <jolsa@redhat.com>,
 <jthierry@redhat.com>, <keescook@chromium.org>, <kernelfans@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
 <masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
 <mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
 <nixiaoming@huawei.com>, <peterz@infradead.org>, <pmladek@suse.com>,
 <sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v2 5/5] arm64: Enable perf events based hard lockup detector
Date: Mon, 7 Mar 2022 23:47:29 +0800
Message-ID: <20220307154729.13477-6-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307154729.13477-1-lecopzer.chen@mediatek.com>
References: <20220307154729.13477-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_074816_038385_0AD47A5B 
X-CRM114-Status: GOOD (  18.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With the recent feature added to enable perf events to use pseudo NMIs
as interrupts on platforms which support GICv3 or later, its now been
possible to enable hard lockup detector (or NMI watchdog) on arm64
platforms. So enable corresponding support.

One thing to note here is that normally lockup detector is initialized
just after the early initcalls but PMU on arm64 comes up much later as
device_initcall(). To cope with that, overriding watchdog_nmi_probe() to
let the watchdog framework know PMU not ready, and inform the framework
to re-initialize lockup detection once PMU has been initialized.

[1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/Kconfig             |  2 ++
 arch/arm64/kernel/Makefile     |  1 +
 arch/arm64/kernel/perf_event.c | 12 ++++++++++--
 drivers/perf/arm_pmu.c         |  5 +++++
 include/linux/perf/arm_pmu.h   |  2 ++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 09b885cc4db5..df6fed8327ba 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -190,6 +190,8 @@ config ARM64
 	select HAVE_NMI
 	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 88b3e2a21408..3e62a8877ed7 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_MODULES)			+= module.o
 obj-$(CONFIG_ARM64_MODULE_PLTS)		+= module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
 obj-$(CONFIG_HW_PERF_EVENTS)		+= perf_event.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
 obj-$(CONFIG_CPU_IDLE)			+= cpuidle.o
diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index cab678ed6618..77eaefee13ea 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/smp.h>
+#include <linux/nmi.h>
 
 /* ARMv8 Cortex-A53 specific event types. */
 #define ARMV8_A53_PERFCTR_PREF_LINEFILL				0xC2
@@ -1380,10 +1381,17 @@ static struct platform_driver armv8_pmu_driver = {
 
 static int __init armv8_pmu_driver_init(void)
 {
+	int ret;
+
 	if (acpi_disabled)
-		return platform_driver_register(&armv8_pmu_driver);
+		ret = platform_driver_register(&armv8_pmu_driver);
 	else
-		return arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+
+	/* Inform watchdog core we are ready to probe hld by delayed init. */
+	lockup_detector_pending_init = false;
+	wake_up(&hld_detector_wait);
+	return ret;
 }
 device_initcall(armv8_pmu_driver_init)
 
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 295cc7952d0e..e77f4897fca2 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -697,6 +697,11 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
 	return per_cpu(hw_events->irq, cpu);
 }
 
+bool arm_pmu_irq_is_nmi(void)
+{
+	return has_nmi;
+}
+
 /*
  * PMU hardware loses all context when a CPU goes offline.
  * When a CPU is hotplugged back in, since some hardware registers are
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 2512e2f9cd4e..9325d01adc3e 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -169,6 +169,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #define kvm_host_pmu_init(x)	do { } while(0)
 #endif
 
+bool arm_pmu_irq_is_nmi(void);
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
