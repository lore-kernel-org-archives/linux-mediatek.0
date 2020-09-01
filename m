Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A9C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 07:07:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B18E20665
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 07:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MCQ/Mdc9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aq421t+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B18E20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0JLOPl7lbqSUBHXC3OZqeY9CCIqbDVDXstjWHMTbZE=; b=MCQ/Mdc9SQP5yNVCthUgLXw5t
	Q1KkRSmSU0ny/bOWtyXEigYmVP+DfMaWP5DzqDYVFKib72019Y59A2y7t5J6SqkZhzuEWuk6zMlFa
	hvt2zN/+K8UaO8vh1vshRAfHP7A3cVJyYqaRlWXtA23e484lhPU+Ge7YkQdY9mwLelN/Ya8rDW5pR
	AwqAWlPVNadBeftYqs+Y6kOPsLGZujhNf/4SMGrXQ6qkH46oHol/s8T1W/zTHQqZYJ2PwSfVcelD2
	WGH05tzvdbOIwnfuSI/p0g6vc0KZpLi2PxzlyDOOPgcLNtp5r8QYSxYUXPohl1wr3Ye/5GmNAmn0f
	Zgz8v0EuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0Nk-00080L-NP; Tue, 01 Sep 2020 07:07:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0Ng-0007yo-G6; Tue, 01 Sep 2020 07:07:01 +0000
X-UUID: 8c6f6efe59b8484eb93defc6574f9451-20200831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r8ViQaf2Xgj/dV0rw5rVosKTAAORdhE7j+Gm7hfgFCw=; 
 b=aq421t+tssSCvodyVqOZ7fpKBhgpSKR5Y1GNfOqQ9I1jv6GLPK+NXuk0Dj0CcrGIk/FkjtAfIkx0Yh1da/oCc/T63GdIfewDEPQMkFRh970XKOgLxNKgDpRwxK6Jgn8yXvtabIJ9wPbuJkuV2vaA0ybfR1bZSG2Ym2ow2/KK2Qg=;
X-UUID: 8c6f6efe59b8484eb93defc6574f9451-20200831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1002029510; Mon, 31 Aug 2020 23:06:53 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 00:05:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 15:05:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Sep 2020 15:05:55 +0800
From: Claude Yen <claude.yen@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Frederic Weisbecker <fweisbec@gmail.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, "Douglas
 Anderson" <dianders@chromium.org>
Subject: [PATCH 1/1] PM: s2idle: Introduce syscore callbacks in s2idle flow
Date: Tue, 1 Sep 2020 15:04:19 +0800
Message-ID: <1598943859-21857-2-git-send-email-claude.yen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E8AAFCC12071577ABD7A8EBC97404A0681E148EF70F51F3427B7B9F778369EE52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_030700_681753_BB4536A4 
X-CRM114-Status: GOOD (  20.40  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 "claude.yen" <claude.yen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "claude.yen" <claude.yen@mediatek.com>

Adding syscore callbacks to s2idle makes the behavior of s2idle become
more similar to Suspend-to-Ram (S2R) and reduces potential porting
effort.

tick_freeze() in s2idle flow calls sched_clock_suspend() and
timekeeping_suspend(), which both functions are also registered as
syscore callback. sched_clock_suspend() introduced in
commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
wrap caused by tick_freeze()") is added due to clock wrap issue.
By adding syscore callbacks in s2idle, if there is any syscore callbacks
also required in s2idle, additional porting effort could be saved.

Besides, in both S2R and s2idle, before the system entering low power
state, there is a state when only one cpu alive with interrupt-disabled,
which is syscore callback designed for. Adding syscore callbacks in
s2idle is feasible option.

Scenarios to call syscore callback:
S2R: one cpu alive when nonboot cpus are hotplug-ed off
s2idle: one cpu alive when other cpus have enter idle state


Signed-off-by: claude.yen <claude.yen@mediatek.com>
---
 drivers/cpuidle/cpuidle.c |   36 ++++++++++++++++++++++++++++++++----
 kernel/cpu_pm.c           |   17 +++++++++++++++++
 kernel/time/tick-common.c |   17 ++---------------
 3 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index 8719731..be22174 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -23,6 +23,9 @@
 #include <linux/suspend.h>
 #include <linux/tick.h>
 #include <trace/events/power.h>
+#include <linux/cpumask.h>
+#include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
 #include "cpuidle.h"
 
@@ -35,6 +38,8 @@
 static int enabled_devices;
 static int off __read_mostly;
 static int initialized __read_mostly;
+static struct cpumask s2idle_cpumask;
+static DEFINE_SPINLOCK(s2idle_spinlock);
 
 int cpuidle_disabled(void)
 {
@@ -137,15 +142,27 @@ static void enter_s2idle_proper(struct cpuidle_driver *drv,
 				struct cpuidle_device *dev, int index)
 {
 	ktime_t time_start, time_end;
+	int cpu;
 
 	time_start = ns_to_ktime(local_clock());
+	cpu = smp_processor_id();
+
+	tick_freeze();
 
 	/*
-	 * trace_suspend_resume() called by tick_freeze() for the last CPU
+	 * trace_suspend_resume() called by syscore_suepnd() for the last CPU
 	 * executing it contains RCU usage regarded as invalid in the idle
 	 * context, so tell RCU about that.
 	 */
-	RCU_NONIDLE(tick_freeze());
+	spin_lock(&s2idle_spinlock);
+	cpumask_set_cpu(cpu, &s2idle_cpumask);
+	if (cpumask_weight(&s2idle_cpumask) == num_online_cpus()) {
+		system_state = SYSTEM_SUSPEND;
+		RCU_NONIDLE(syscore_suspend());
+	}
+
+	spin_unlock(&s2idle_spinlock);
+
 	/*
 	 * The state used here cannot be a "coupled" one, because the "coupled"
 	 * cpuidle mechanism enables interrupts and doing that with timekeeping
@@ -154,12 +171,21 @@ static void enter_s2idle_proper(struct cpuidle_driver *drv,
 	stop_critical_timings();
 	drv->states[index].enter_s2idle(dev, drv, index);
 	WARN_ON(!irqs_disabled());
+
 	/*
-	 * timekeeping_resume() that will be called by tick_unfreeze() for the
+	 * timekeeping_resume() that will be called by syscore_reume() for the
 	 * first CPU executing it calls functions containing RCU read-side
 	 * critical sections, so tell RCU about that.
 	 */
-	RCU_NONIDLE(tick_unfreeze());
+	spin_lock(&s2idle_spinlock);
+	if (cpumask_weight(&s2idle_cpumask) == num_online_cpus()) {
+		RCU_NONIDLE(syscore_resume());
+		system_state = SYSTEM_RUNNING;
+	}
+	cpumask_clear_cpu(cpu, &s2idle_cpumask);
+	spin_unlock(&s2idle_spinlock);
+
+	tick_unfreeze();
 	start_critical_timings();
 
 	time_end = ns_to_ktime(local_clock());
@@ -745,6 +771,8 @@ static int __init cpuidle_init(void)
 	if (cpuidle_disabled())
 		return -ENODEV;
 
+	cpumask_clear(&s2idle_cpumask);
+
 	return cpuidle_add_interface(cpu_subsys.dev_root);
 }
 
diff --git a/kernel/cpu_pm.c b/kernel/cpu_pm.c
index 44a2593..6c2f5ce 100644
--- a/kernel/cpu_pm.c
+++ b/kernel/cpu_pm.c
@@ -12,6 +12,7 @@
 #include <linux/notifier.h>
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
+#include <linux/suspend.h>
 
 static ATOMIC_NOTIFIER_HEAD(cpu_pm_notifier_chain);
 
@@ -172,6 +173,14 @@ static int cpu_pm_suspend(void)
 {
 	int ret;
 
+#ifdef CONFIG_SUSPEND
+	/*
+	 * Skip cpu_pm_suspend in s2idle flow because cpu_pm notifier callbacks
+	 * are triggered in idle framework
+	 */
+	if (s2idle_state != S2IDLE_STATE_NONE)
+		return 0;
+#endif
 	ret = cpu_pm_enter();
 	if (ret)
 		return ret;
@@ -182,6 +191,14 @@ static int cpu_pm_suspend(void)
 
 static void cpu_pm_resume(void)
 {
+#ifdef CONFIG_SUSPEND
+	/*
+	 * Skip cpu_pm_resume in s2idle flow because cpu_pm notifier callbacks
+	 * are triggered in idle framework
+	 */
+	if (s2idle_state != S2IDLE_STATE_NONE)
+		return;
+#endif
 	cpu_cluster_pm_exit();
 	cpu_pm_exit();
 }
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 6c9c342..19feeed 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -528,15 +528,8 @@ void tick_freeze(void)
 	raw_spin_lock(&tick_freeze_lock);
 
 	tick_freeze_depth++;
-	if (tick_freeze_depth == num_online_cpus()) {
-		trace_suspend_resume(TPS("timekeeping_freeze"),
-				     smp_processor_id(), true);
-		system_state = SYSTEM_SUSPEND;
-		sched_clock_suspend();
-		timekeeping_suspend();
-	} else {
+	if (tick_freeze_depth < num_online_cpus())
 		tick_suspend_local();
-	}
 
 	raw_spin_unlock(&tick_freeze_lock);
 }
@@ -554,13 +547,7 @@ void tick_unfreeze(void)
 {
 	raw_spin_lock(&tick_freeze_lock);
 
-	if (tick_freeze_depth == num_online_cpus()) {
-		timekeeping_resume();
-		sched_clock_resume();
-		system_state = SYSTEM_RUNNING;
-		trace_suspend_resume(TPS("timekeeping_freeze"),
-				     smp_processor_id(), false);
-	} else {
+	if (tick_freeze_depth < num_online_cpus()) {
 		touch_softlockup_watchdog();
 		tick_resume_local();
 	}
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
