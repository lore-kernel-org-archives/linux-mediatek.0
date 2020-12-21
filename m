Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87A1C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 16:23:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CDC922C9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 16:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CDC922C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jR89jwJsKF/2UJ44Ub+adCG33fZ6EcSSxJldWVOkjx8=; b=h4ExORXc/L0sVDYvLBMAVuHYHx
	o7KWDcc/rdWlIXdtCmn/Fw8PVSxXr2fFfPM26dECgc/KdGDm66Pm8jmxrJ64/uwyKqXEvK21Tdxrw
	FtvNgneCEvOn3w4Sx7gOaR+ZbOTqTNriovysT4JN+HNXXxZIn3fzT5uTsgwqOXdiRlEEz9z3V13Cj
	sH47cIIRXl/jwTZYymrektFReiNuDt5hV8FRU7+2efcwLAUN/davUeyPac6mbX7vDU/p8iQN6Xa3p
	5zmX++x4VOlktXV2sAIX64zsslHeLYBiN3mdeyWxZo0OwiDXc6fthZQTEdpL4YEfVSPFgfw1j8RoW
	bnu4cDJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krNxx-00016Y-Ae; Mon, 21 Dec 2020 16:23:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krNxr-000154-QH; Mon, 21 Dec 2020 16:23:18 +0000
X-UUID: 38d216ab8c4040f3ad99a4b0c85e36c5-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+QbS1zHi3H6q9w7Q5Q6TzAqwxTbSzUbGIy+hOpaDaxE=; 
 b=UatxX8XaahNlOdZNclKU7LiTSSREV15eI6dGKyzXA24uuamk7ykovUkqalv1/Y0h2AcvwK04f2V/qcnyedosY5kX+XzNUJTqhO6uLmD5iV/2Qckp6qHGIBsRUhEmDIQEjasGYmL4V9o2EzOOKSzgOgFeI5bNRQTZdcb91jmc/+U=;
X-UUID: 38d216ab8c4040f3ad99a4b0c85e36c5-20201221
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1793919157; Mon, 21 Dec 2020 08:23:01 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 08:22:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 00:22:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 00:22:49 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: perf: Fix access percpu variables in preemptible
 context
Date: Tue, 22 Dec 2020 00:22:49 +0800
Message-ID: <20201221162249.3119-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_112316_639014_A219BECB 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, jolsa@redhat.com,
 catalin.marinas@arm.com, lecopzer.chen@mediatek.com, peterz@infradead.org,
 will@kernel.org, yj.chiang@mediatek.com, acme@kernel.org,
 alexander.shishkin@linux.intel.com, mingo@redhat.com,
 linux-mediatek@lists.infradead.org, namhyung@kernel.org,
 matthias.bgg@gmail.com, oliver.sang@intel.com, alexandru.elisei@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
reinitilizes lockup detector after arm64 PMU is initialized and open
a window for accessing smp_processor_id() in preemptible context.
Since hardlockup_detector_perf_init() always called in init stage
with a single cpu, but we initialize lockup detector after the init task
is migratable.

Fix this by utilizing lockup detector reconfiguration which calls
softlockup_start_all() on each cpu and calls watatchdog_nmi_enable() later.
Because softlockup_start_all() use IPI call function to make sure
watatchdog_nmi_enable() will bind on each cpu and fix this issue.

    BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
    caller is debug_smp_processor_id+0x20/0x2c
    CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.10.0+ #276
    Hardware name: linux,dummy-virt (DT)
    Call trace:
      dump_backtrace+0x0/0x3c0
      show_stack+0x20/0x6c
      dump_stack+0x2f0/0x42c
      check_preemption_disabled+0x1cc/0x1dc
      debug_smp_processor_id+0x20/0x2c
      hardlockup_detector_event_create+0x34/0x18c
      hardlockup_detector_perf_init+0x2c/0x134
      watchdog_nmi_probe+0x18/0x24
      lockup_detector_init+0x44/0xa8
      armv8_pmu_driver_init+0x54/0x78
      do_one_initcall+0x184/0x43c
      kernel_init_freeable+0x368/0x380
      kernel_init+0x1c/0x1cc
      ret_from_fork+0x10/0x30


Fixes: 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Cc: Sumit Garg <sumit.garg@linaro.org>
---

Changelog v1 -> v2:
* https://lore.kernel.org/lkml/20201217130617.32202-1-lecopzer.chen@mediatek.com/
* Move solution from kernel/watchdog_hld.c to arm64 perf_event
    * avoid preemptive kmalloc in preempt_disable().



 arch/arm64/kernel/perf_event.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index 38bb07eff872..c03e21210bbb 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -1345,4 +1345,20 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
 
 	return (u64)max_cpu_freq * watchdog_thresh;
 }
+
+/*
+ * hardlockup_detector_perf_init() always call in init stage with a single
+ * cpu. In arm64 case, we re-initialize lockup detector after pmu driver
+ * initialized. Lockup detector initial function use lots of percpu variables
+ * and this makes CONFIG_DEBUG_PREEMPT unhappy because we are now in
+ * preemptive context.
+ * Return 0 if the nmi is ready and register nmi hardlockup detector by
+ * lockup detector reconfiguration.
+ */
+int __init watchdog_nmi_probe(void)
+{
+	if (arm_pmu_irq_is_nmi())
+		return 0;
+	return -ENODEV;
+}
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
