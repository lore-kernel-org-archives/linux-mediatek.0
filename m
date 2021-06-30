Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CC8C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 20:52:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5568961151
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 20:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5568961151
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wtjPplrQ2P/zk2cgY70CutvjfrJCBjsjwr65hUiMGoc=; b=U4w
	AKD0Z2vc8oBCWhVr9KPEFhC5lRmaPaNzTZMzdczuNq/wmKecWs7nLv0R//YPrk83hAJO3fD+3pzTx
	QDzOWlCfO9xTUusD7tYoGoUb1gpfo0InNhcjiwJzQ3i0gUXDVq369/dDwnA6KHV3aHXsP6cVR2r2Y
	KNCZWrhdvVB6V759XNb+VQYGSYKCd6l4oQlRCwSy5tMPaPg5lIbtOiUKfgA7ff39mcFGBCm3119Ud
	KGVeDrMK/r4vdDL4gHuv8iVnwcjBk2cp3wAZ0vLXYN0S/bZHNKRZsIqTSWd9+2hK/VYjgiayD7LHC
	f9pyC1/lMjDY5QIcu5mar65QSL9ENKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyhBt-00FGgX-4d; Wed, 30 Jun 2021 20:52:13 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyhBf-00FGdj-DB
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 20:52:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 r5-20020a0569021545b0290557963aad97so2771333ybu.12
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WXCJB/sn116SgSEffDSjzbCu9ljJn1wLs+Vne4KFJ+E=;
 b=bte2f2XYQ1DOjqMdsGzUOiZHs6KmPl58pU/flR4jZH0dBZSy8TYGRVvNhSf84qCwA/
 dXsgZrL4sL1B5mC7YRq0UR0PMS0UYxmuQqlaArrawpRYBZHIZLdY7+j2aU0obbPWyrhG
 JR2At/fYtMg3FMmKwu99cf1V9+UgCvu0qJfTMiN1FXJKrd5Ll+pucNzKR2RXvoRriWIa
 +lynkComSrHQiP/O3PaMv26IpIBO6mnSHNt6poK6AEEJpErvgj9LNZikO/Vs4JmECX4N
 zL6utMIXpZJ/rsK9TEwZXF35TZI81+WjZ+cVDv/reDpTSSXltwRS3zbmFRVImYMSQeBN
 abtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WXCJB/sn116SgSEffDSjzbCu9ljJn1wLs+Vne4KFJ+E=;
 b=KI6iApibHdBT1MFaWfsu1EBCEWk6JWOM4htWk2SiMcq+XlgrT00niYe/N5lCruXsWj
 bwEJ72FfVqf7LVPxH0391QNHqVCbYGFv7kjBW3YrSAWBPueAqWRzgr4DcGuO4ZBfgMFn
 l9LwjNu+jJv1/+uu8RU1c6PXhqpLEkds0UEbD9KPFEQWHBs1ZnPBv2TbTW9LkPi5ytDQ
 zm7vFJ+cdZ5ZYQzpOgkf2rTzl9uGk5FHsvio16azAPG7Hyfyhx9kpU8N+7DD/QVp4ZzT
 LEFKunyi1ECMHeMmSODg5Cm1nTzqePr8/KN0s9D1mdcKDsE07E/QHLXfUy7SLKnp8P/2
 taqQ==
X-Gm-Message-State: AOAM530AQ1eW0EMCrgLgmqnVek4HfwH8ThLHVdNiS8xPxck77HSAXaJq
 ZfUzYUQWz+4TZX5Qxia5GtH7uP5fH1A=
X-Google-Smtp-Source: ABdhPJxpwShbTyniu85SbURsJRjlKLSAmfOYgM4PaRy3d7FcNFtwT37Wj1f61GUqf0SviwEqaC0xBrhUbOI=
X-Received: from surenb1.mtv.corp.google.com
 ([2620:15c:211:200:e135:81d1:5036:d9ff])
 (user=surenb job=sendgmr) by 2002:a25:3b46:: with SMTP id
 i67mr49622177yba.207.1625086315507; 
 Wed, 30 Jun 2021 13:51:55 -0700 (PDT)
Date: Wed, 30 Jun 2021 13:51:51 -0700
Message-Id: <20210630205151.137001-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
From: Suren Baghdasaryan <surenb@google.com>
To: peterz@infradead.org
Cc: hannes@cmpxchg.org, mingo@redhat.com, juri.lelli@redhat.com, 
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
 matthias.bgg@gmail.com, minchan@google.com, timmurray@google.com, 
 yt.chang@mediatek.com, wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-team@android.com, 
 surenb@google.com, SH Chen <show-hong.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_135159_485307_0EDB8639 
X-CRM114-Status: GOOD (  20.44  )
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

Psi polling mechanism is trying to minimize the number of wakeups to
run psi_poll_work and is currently relying on timer_pending() to detect
when this work is already scheduled. This provides a window of opportunity
for psi_group_change to schedule an immediate psi_poll_work after
poll_timer_fn got called but before psi_poll_work could reschedule itself.
Below is the depiction of this entire window:

poll_timer_fn
  wake_up_interruptible(&group->poll_wait);

psi_poll_worker
  wait_event_interruptible(group->poll_wait, ...)
  psi_poll_work
    psi_schedule_poll_work
      if (timer_pending(&group->poll_timer)) return;
      ...
      mod_timer(&group->poll_timer, jiffies + delay);

Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
reset and set back inside psi_poll_work and therefore this race window
was much smaller.
The larger window causes increased number of wakeups and our partners
report visible power regression of ~10mA after applying 461daba06bdc.
Bring back the poll_scheduled atomic and make this race window even
narrower by resetting poll_scheduled only when we reach polling expiration
time. This does not completely eliminate the possibility of extra wakeups
caused by a race with psi_group_change however it will limit it to the
worst case scenario of one extra wakeup per every tracking window (0.5s
in the worst case).
By tracing the number of immediate rescheduling attempts performed by
psi_group_change and the number of these attempts being blocked due to
psi monitor being already active, we can assess the effects of this change:

Before the patch:
                                           Run#1    Run#2      Run#3
Immediate reschedules attempted:           684365   1385156    1261240
Immediate reschedules blocked:             682846   1381654    1258682
Immediate reschedules (delta):             1519     3502       2558
Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%

After the patch:
                                           Run#1    Run#2      Run#3
Immediate reschedules attempted:           882244   770298    426218
Immediate reschedules blocked:             881996   769796    426074
Immediate reschedules (delta):             248      502       144
Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%

The number of non-blocked immediate reschedules dropped from 0.22-0.25%
to 0.03-0.07%. The drop is attributed to the decrease in the race window
size and the fact that we allow this race only when psi monitors reach
polling window expiration time.

Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
Reported-by: Kathleen Chang <yt.chang@mediatek.com>
Reported-by: Wenju Xu <wenju.xu@mediatek.com>
Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Tested-by: SH Chen <show-hong.chen@mediatek.com>
---
changes in v2:
- Simplified atomic_cmpxchg() condition per PeterZ
- Added Tested-by:

 include/linux/psi_types.h |  1 +
 kernel/sched/psi.c        | 41 ++++++++++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
index 0a23300d49af..ef8bd89d065e 100644
--- a/include/linux/psi_types.h
+++ b/include/linux/psi_types.h
@@ -158,6 +158,7 @@ struct psi_group {
 	struct timer_list poll_timer;
 	wait_queue_head_t poll_wait;
 	atomic_t poll_wakeup;
+	atomic_t poll_scheduled;
 
 	/* Protects data used by the monitor */
 	struct mutex trigger_lock;
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 58b36d17a09a..82b664ca9ee9 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -195,6 +195,7 @@ static void group_init(struct psi_group *group)
 	INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
 	mutex_init(&group->avgs_lock);
 	/* Init trigger-related members */
+	atomic_set(&group->poll_scheduled, 0);
 	mutex_init(&group->trigger_lock);
 	INIT_LIST_HEAD(&group->triggers);
 	memset(group->nr_triggers, 0, sizeof(group->nr_triggers));
@@ -555,18 +556,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
 	return now + group->poll_min_period;
 }
 
-/* Schedule polling if it's not already scheduled. */
-static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
+/* Schedule polling if it's not already scheduled or forced. */
+static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
+				   bool force)
 {
 	struct task_struct *task;
 
-	/*
-	 * Do not reschedule if already scheduled.
-	 * Possible race with a timer scheduled after this check but before
-	 * mod_timer below can be tolerated because group->polling_next_update
-	 * will keep updates on schedule.
-	 */
-	if (timer_pending(&group->poll_timer))
+	/* cmpxchg should be called even when !force to set poll_scheduled */
+	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
 		return;
 
 	rcu_read_lock();
@@ -578,12 +575,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
 	 */
 	if (likely(task))
 		mod_timer(&group->poll_timer, jiffies + delay);
+	else
+		atomic_set(&group->poll_scheduled, 0);
 
 	rcu_read_unlock();
 }
 
 static void psi_poll_work(struct psi_group *group)
 {
+	bool force_reschedule = false;
 	u32 changed_states;
 	u64 now;
 
@@ -591,6 +591,23 @@ static void psi_poll_work(struct psi_group *group)
 
 	now = sched_clock();
 
+	if (now > group->polling_until) {
+		/*
+		 * We are either about to start or might stop polling if no
+		 * state change was recorded. Resetting poll_scheduled leaves
+		 * a small window for psi_group_change to sneak in and schedule
+		 * an immegiate poll_work before we get to rescheduling. One
+		 * potential extra wakeup at the end of the polling window
+		 * should be negligible and polling_next_update still keeps
+		 * updates correctly on schedule.
+		 */
+		atomic_set(&group->poll_scheduled, 0);
+	} else {
+		/* Polling window is not over, keep rescheduling */
+		force_reschedule = true;
+	}
+
+
 	collect_percpu_times(group, PSI_POLL, &changed_states);
 
 	if (changed_states & group->poll_states) {
@@ -616,7 +633,8 @@ static void psi_poll_work(struct psi_group *group)
 		group->polling_next_update = update_triggers(group, now);
 
 	psi_schedule_poll_work(group,
-		nsecs_to_jiffies(group->polling_next_update - now) + 1);
+		nsecs_to_jiffies(group->polling_next_update - now) + 1,
+		force_reschedule);
 
 out:
 	mutex_unlock(&group->trigger_lock);
@@ -740,7 +758,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
 	write_seqcount_end(&groupc->seq);
 
 	if (state_mask & group->poll_states)
-		psi_schedule_poll_work(group, 1);
+		psi_schedule_poll_work(group, 1, false);
 
 	if (wake_clock && !delayed_work_pending(&group->avgs_work))
 		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
@@ -1235,6 +1253,7 @@ static void psi_trigger_destroy(struct kref *ref)
 		 * can no longer be found through group->poll_task.
 		 */
 		kthread_stop(task_to_destroy);
+		atomic_set(&group->poll_scheduled, 0);
 	}
 	kfree(t);
 }
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
