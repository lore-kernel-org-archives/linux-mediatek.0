Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9981C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KMICS1Q5Fq6Dw1QetFoTC9sYzZ0CLPr/VuPpfGz1vY=; b=SxStffg2V7o0Ur
	CId2gEork+5ip66KXK43xf5xXyoMM+sof4OfsjOJnd841FH4yQFLsStrFNFBhVsvQxVLmSRLVDITd
	JpgNB0B/o6L4UTb3FIrHmyK5w28M4g+iS4mZeWhe8CGEgrj4ALyMEWJogGTWYt5vmFGJ2GedSTx7N
	mImA55/+clzq6lELJQJP3flRrkvWB9NduRyyKuf6wQa3a+uG726TebgbYgTFSm3aJNgc+DAlPCMaq
	/dzLvLPH62Glqv+MiJG+hov0CAgYYbEDwgdkja4gx17fiDCizAK7UZZkw5BLCu/EZYMuqLu+BTDEu
	FQmJbPoAiyFj/LMNWHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFbh-000hNp-9S; Mon, 07 Mar 2022 15:49:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFan-000gpW-Gz; Mon, 07 Mar 2022 15:48:15 +0000
X-UUID: e438ad9a9c95498da893a556f7056f9b-20220307
X-UUID: e438ad9a9c95498da893a556f7056f9b-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 642656085; Mon, 07 Mar 2022 08:48:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 07:48:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 23:48:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 23:48:03 +0800
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
Subject: [PATCH v2 4/5] kernel/watchdog: Adapt the watchdog_hld interface for
 async model
Date: Mon, 7 Mar 2022 23:47:28 +0800
Message-ID: <20220307154729.13477-5-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307154729.13477-1-lecopzer.chen@mediatek.com>
References: <20220307154729.13477-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_074813_630441_31678712 
X-CRM114-Status: GOOD (  19.18  )
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

When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
yet. E.g. on arm64, PMU is not ready until
device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
with the driver model and cpuhp. Hence it is hard to push this
initialization before smp_init().

But it is easy to take an opposite approach by enabling watchdog_hld to
get the capability of PMU async.

The async model is achieved by expanding watchdog_nmi_probe() with
-EBUSY, and a re-initializing work_struct which waits on a wait_queue_head.

Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Suggested-by: Petr Mladek <pmladek@suse.com>
---
 include/linux/nmi.h |  3 +++
 kernel/watchdog.c   | 62 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index b7bcd63c36b4..cc7df31be9db 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -118,6 +118,9 @@ static inline int hardlockup_detector_perf_init(void) { return 0; }
 
 void watchdog_nmi_stop(void);
 void watchdog_nmi_start(void);
+
+extern bool lockup_detector_pending_init;
+extern struct wait_queue_head hld_detector_wait;
 int watchdog_nmi_probe(void);
 void watchdog_nmi_enable(unsigned int cpu);
 void watchdog_nmi_disable(unsigned int cpu);
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index b71d434cf648..49bdcaf5bd8f 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -103,7 +103,11 @@ void __weak watchdog_nmi_disable(unsigned int cpu)
 	hardlockup_detector_perf_disable();
 }
 
-/* Return 0, if a NMI watchdog is available. Error code otherwise */
+/*
+ * Arch specific API. Return 0, if a NMI watchdog is available. -EBUSY if not
+ * ready, and arch code should wake up hld_detector_wait when ready. Other
+ * negative value if not support.
+ */
 int __weak __init watchdog_nmi_probe(void)
 {
 	return hardlockup_detector_perf_init();
@@ -839,16 +843,70 @@ static void __init watchdog_sysctl_init(void)
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+static void lockup_detector_delay_init(struct work_struct *work);
+bool lockup_detector_pending_init __initdata;
+
+struct wait_queue_head hld_detector_wait __initdata =
+		__WAIT_QUEUE_HEAD_INITIALIZER(hld_detector_wait);
+
+static struct work_struct detector_work __initdata =
+		__WORK_INITIALIZER(detector_work, lockup_detector_delay_init);
+
+static void __init lockup_detector_delay_init(struct work_struct *work)
+{
+	int ret;
+
+	wait_event(hld_detector_wait,
+			lockup_detector_pending_init == false);
+
+	/*
+	 * Here, we know the PMU should be ready, so set pending to true to
+	 * inform watchdog_nmi_probe() that it shouldn't return -EBUSY again.
+	 */
+	lockup_detector_pending_init = true;
+	ret = watchdog_nmi_probe();
+	if (ret) {
+		pr_info("Delayed init of the lockup detector failed: %d\n", ret);
+		pr_info("Perf NMI watchdog permanently disabled\n");
+		return;
+	}
+
+	nmi_watchdog_available = true;
+	lockup_detector_setup();
+	lockup_detector_pending_init = false;
+}
+
+/* Ensure the check is called after the initialization of PMU driver */
+static int __init lockup_detector_check(void)
+{
+	if (!lockup_detector_pending_init)
+		return 0;
+
+	pr_info("Delayed init checking failed, retry for once.\n");
+	lockup_detector_pending_init = false;
+	wake_up(&hld_detector_wait);
+	return 0;
+}
+late_initcall_sync(lockup_detector_check);
+
 void __init lockup_detector_init(void)
 {
+	int ret;
+
 	if (tick_nohz_full_enabled())
 		pr_info("Disabling watchdog on nohz_full cores by default\n");
 
 	cpumask_copy(&watchdog_cpumask,
 		     housekeeping_cpumask(HK_FLAG_TIMER));
 
-	if (!watchdog_nmi_probe())
+	ret = watchdog_nmi_probe();
+	if (!ret)
 		nmi_watchdog_available = true;
+	else if (ret == -EBUSY) {
+		lockup_detector_pending_init = true;
+		queue_work_on(smp_processor_id(), system_wq, &detector_work);
+	}
+
 	lockup_detector_setup();
 	watchdog_sysctl_init();
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
