Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YMbQtCM58Gtb1hWH2NY/RfBvjeE+Hexo1QDACEJeBI=; b=V3wXHQ4mCbnjHZ
	H5pEq5bUGxpfY2EqmAiowDif/j9yRP/vpyZ4+flNqlfW2x+IuK3ATcpbsZDOJzSdDDOBkbfPOek2+
	zdRcLMgtTTY/vPEAhY1+VGOkH6sNTT3vv8PLXfYdnUY2MfoH/QESZ9XePHaH5tAO41BSFrNcHFv/L
	LOk3fm2hqMFxLeu3JPC4j+NRXt9B91vyeuv5xgkWKw7q/WS3tVEg8W2meBNBnbPTnBQeiBGs3oam+
	tGEcsLAY/bhxOxfUxmRs1IY4ceXDIKW24fBM5A8qp/xLOc8iUNGzI1KwoO2C+spBytrJIm3t0hIIn
	rT5pyCGvCO3aS3UlvZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIpuA-009j7s-Es; Sat, 12 Feb 2022 10:45:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIpsv-009iUD-IA; Sat, 12 Feb 2022 10:44:12 +0000
X-UUID: 2cc0f92ee7934621bfab0d23945b54ab-20220212
X-UUID: 2cc0f92ee7934621bfab0d23945b54ab-20220212
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1428904720; Sat, 12 Feb 2022 03:44:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 02:44:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 12 Feb 2022 18:43:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Feb 2022 18:43:53 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>, Kees Cook
 <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Wang Qing
 <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>, Xiaoming Ni
 <nixiaoming@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <sumit.garg@linaro.org>,
 <kernelfans@gmail.com>, <lecopzer.chen@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 4/5] kernel/watchdog: Adapt the watchdog_hld interface for
 async model
Date: Sat, 12 Feb 2022 18:43:48 +0800
Message-ID: <20220212104349.14266-5-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_024409_618917_922B27CB 
X-CRM114-Status: GOOD (  20.13  )
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

From: Pingfan Liu <kernelfans@gmail.com>

from: Pingfan Liu <kernelfans@gmail.com>

When lockup_detector_init()->watchdog_nmi_probe(), PMU may be not ready
yet. E.g. on arm64, PMU is not ready until
device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
with the driver model and cpuhp. Hence it is hard to push this
initialization before smp_init().

But it is easy to take an opposite approach by enabling watchdog_hld to
get the capability of PMU async.

The async model is achieved by expanding watchdog_nmi_probe() with
-EBUSY, and a re-initializing work_struct which waits on a wait_queue_head.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/watchdog.c | 56 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index b71d434cf648..fa8490cfeef8 100644
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
@@ -839,16 +843,64 @@ static void __init watchdog_sysctl_init(void)
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+static void lockup_detector_delay_init(struct work_struct *work);
+enum hld_detector_state detector_delay_init_state __initdata;
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
+			detector_delay_init_state == DELAY_INIT_READY);
+	ret = watchdog_nmi_probe();
+	if (!ret) {
+		nmi_watchdog_available = true;
+		lockup_detector_setup();
+	} else {
+		WARN_ON(ret == -EBUSY);
+		pr_info("Perf NMI watchdog permanently disabled\n");
+	}
+}
+
+/* Ensure the check is called after the initialization of PMU driver */
+static int __init lockup_detector_check(void)
+{
+	if (detector_delay_init_state < DELAY_INIT_WAIT)
+		return 0;
+
+	if (WARN_ON(detector_delay_init_state == DELAY_INIT_WAIT)) {
+		detector_delay_init_state = DELAY_INIT_READY;
+		wake_up(&hld_detector_wait);
+	}
+	flush_work(&detector_work);
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
+		detector_delay_init_state = DELAY_INIT_WAIT;
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
