Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3CCC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECE160D07
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECE160D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oLvQaOhOncUgWqpYr4EWPhr8Dgv1RtS/zJx4vA0fzxY=; b=IQ1
	SsXN3Ems5F8rTnn1zLVhpyYNA7ohsNhyCPp5iFL25o/V1etmfFkINrlnOtqMySuR2y7If/8p8Vh27
	hDuIcyKk8damSiGOn/e7lkvpH36QQZzF68b01wElyEaIwvGul9b7D/e3c8M52Zp5Qdp2h9BLprtVY
	S9ek2WEXzLdSj13an6GU2VWJIeKdThE/8kk09WnFSNXi5wNGBUNbAEZ2s31zHzqUHu8uZyP/otQ0z
	KGGd2z5CXYPzG8Pvr67L0adhaF0Lprl8BjucNWetAB8T3TbZXU2vfl5JH48TMyvFU8dpAK6+MzqRc
	BV5j5MYzKWAnHkjR0DrGQZIYMXJfHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltzXu-00Bnc5-Ni; Thu, 17 Jun 2021 21:27:30 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltzXR-00BnOg-Vj
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 21:27:03 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id
 10-20020a0562140d4ab0290247bb35d2c3so3469067qvr.22
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Jun 2021 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NdVbPWWToDxvDZhmKO7pzspuS95Zr9wvtR6cvu0uClU=;
 b=ieMFg4wYCRHIUZxv8+lJU3n1uHJ6n83Jbd60XqdbMIDeYixhmXQHUO+zCYHFlikXkr
 6lYO9K7L61gNJzP7DSFDP3ILEHE0BGLBZdyBompiT79CF7bkS+MQ86j/wKFED074QG9M
 l4hpbRlK/gGe4ZMqhB6kiPCq1l12CsaFBHeb5uKZKC/TKIS70pB4IWtsYlnVR/4VyTOU
 cD35BDCImbA4RJsItmBC1HCSyecwleVVI/4ASxvFWlIVOarIme2PkvtX3Qtn181/M6Lc
 uFOJrPsPp8PgTyNCxtGsZq6pqrmLkRQthbgp+hbuynDWQjWlKvYnxYMEG9fsbWj1c72E
 yxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NdVbPWWToDxvDZhmKO7pzspuS95Zr9wvtR6cvu0uClU=;
 b=lq1hq5QetLfT4j0jLdoCPtkqZKvfV1Qubmaq1sOHvdRDW8tZbP8UEMqcbjROWmdomW
 a78a4dDJT1snJAakcaXTT/7P43k5ZYl5KqDykUGxu900PL5PTCQWiBenwOzIqg+YgwoY
 zxZLPzMs+I0TZZQ3eYtNZysZNhEag+Pj5Wn3cNxp0rRwk8MJ6Pn78WdmZQkd4sXiNw4g
 gWCeF5d/yN3WhhrHSh9z0TUBLsrQUe/4ydzme+xU9zGaNZj20e4CyX9EQ5/Cv0ptAkqi
 WeIslHpqP+Bjj0VHS66hk76onMcVG3G6EQQPAxKBkRlZyT/RTtXXZPMFAg4rzx42Qa+7
 QXZw==
X-Gm-Message-State: AOAM530qEQAd5renm8I7yNvcSA0SSu+OoS0gehVGVLrtM7NnoemOpkJJ
 2M6pS2a3SqasLnfSBtgm7qPZ/TOivhU=
X-Google-Smtp-Source: ABdhPJyiRneCsdxf6UwvpZHUgzETRLidAc3LTxsBOARM56iIoA07hyINtAtn75kQ4acpYmFBKmQnrnMgCto=
X-Received: from surenb1.mtv.corp.google.com
 ([2620:15c:211:200:340e:2cba:c90:140d])
 (user=surenb job=sendgmr) by 2002:a5b:d50:: with SMTP id
 f16mr2318267ybr.221.1623965219434; 
 Thu, 17 Jun 2021 14:26:59 -0700 (PDT)
Date: Thu, 17 Jun 2021 14:26:54 -0700
Message-Id: <20210617212654.1529125-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH 1/1] psi: stop relying on timer_pending for poll_work
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
 surenb@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_142702_068060_0966814F 
X-CRM114-Status: GOOD (  19.64  )
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
---
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
index cc25a3cff41f..fed7c9c2b276 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -193,6 +193,7 @@ static void group_init(struct psi_group *group)
 	INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
 	mutex_init(&group->avgs_lock);
 	/* Init trigger-related members */
+	atomic_set(&group->poll_scheduled, 0);
 	mutex_init(&group->trigger_lock);
 	INIT_LIST_HEAD(&group->triggers);
 	memset(group->nr_triggers, 0, sizeof(group->nr_triggers));
@@ -551,18 +552,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
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
+	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) != 0 && !force)
 		return;
 
 	rcu_read_lock();
@@ -574,12 +571,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
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
 
@@ -587,6 +587,23 @@ static void psi_poll_work(struct psi_group *group)
 
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
@@ -612,7 +629,8 @@ static void psi_poll_work(struct psi_group *group)
 		group->polling_next_update = update_triggers(group, now);
 
 	psi_schedule_poll_work(group,
-		nsecs_to_jiffies(group->polling_next_update - now) + 1);
+		nsecs_to_jiffies(group->polling_next_update - now) + 1,
+		force_reschedule);
 
 out:
 	mutex_unlock(&group->trigger_lock);
@@ -736,7 +754,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
 	write_seqcount_end(&groupc->seq);
 
 	if (state_mask & group->poll_states)
-		psi_schedule_poll_work(group, 1);
+		psi_schedule_poll_work(group, 1, false);
 
 	if (wake_clock && !delayed_work_pending(&group->avgs_work))
 		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
@@ -1235,6 +1253,7 @@ static void psi_trigger_destroy(struct kref *ref)
 		 */
 		del_timer_sync(&group->poll_timer);
 		kthread_stop(task_to_destroy);
+		atomic_set(&group->poll_scheduled, 0);
 	}
 	kfree(t);
 }
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
