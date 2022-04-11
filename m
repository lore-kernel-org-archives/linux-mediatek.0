Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54426C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKy8mPlu2Y2p1xOMP0SSN5dsmpANfA9q3LP4u4Lku1E=; b=nXp3qM3wTIqp83
	DevqdjSRF9cZwvNhWAV02C+Ut+Zg4RZ4n0/RZ+O+PWYgRYkk+HtxaAqKEFuS8VZ44A51PG8mpF34Y
	kKEhRYXSKvwJKUdUPN5s/OJ4FJEGJ5xhkbFChU9ZlPnd52/ibZBz1rgoaSNDs8eqmb1wBx46M95gl
	Zu8HyuKHlHwXus6Y/y7W4NEkLY4PBLPYroivb6P0UoqDTPrWnuGo9hOmv2CNler8uiyLLj/SW5Ek5
	fxKRdeM5dVBdNJuZIrqhwkpgbtsi1Ba1/24fzf0akJfPg2m3BpGMcJ9fdUrozKvuiWZFn8+sVWh+x
	F88DwA5+T1ImxAoboWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpMo-007XOU-KE; Mon, 11 Apr 2022 08:25:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpMd-007XLD-Gi; Mon, 11 Apr 2022 08:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BH0V5BuY+C2+XfEgTERLqY5IXkmzyKHqnUaFyGgmdJo=; b=tw1f/+4ssbSvW7lizJk7k/1po1
 M3oGKMDDdUPfO6ToKh6CS985sWPWMRd11zb4cKpH2eJPqkXywWiHqFC0Oe+4cUwIDhe1uIa9zVvm5
 wcI2Wv1IxuYNOWrp1pLCX9mkAda9V4qo8Scro1xH6K9BnHoKAstkgoHUIlzJHzBwfB2GCGJ4mMHHG
 +VnGJmTxQ00rRKKZhAnW1uG31ZLYD9lHbpDtQOTMFQu0hu0U8dPdOBshSqJZ4LaVRBJCvMi3OzkCx
 tit34E1Z50cLT0Zj1TIPAJmI5QL8/Tl6N7DVKAwQgSxJVIXVD9UTiQYhjdYLUVKmute3e71Fa34Uy
 WXoHMYOQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpMX-00C9P8-QB; Mon, 11 Apr 2022 08:25:29 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 304CF3002AE;
 Mon, 11 Apr 2022 10:25:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C8CEF30F35129; Mon, 11 Apr 2022 10:25:26 +0200 (CEST)
Date: Mon, 11 Apr 2022 10:25:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
Message-ID: <YlPl9jq5sipeY5nF@hirez.programming.kicks-ass.net>
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411061702.22978-1-kuyo.chang@mediatek.com>
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

On Mon, Apr 11, 2022 at 02:16:56PM +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> I meet the warning message at cfs_rq_is_decayed at below code.
> 
> SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> 		    cfs_rq->avg.util_avg ||
> 		    cfs_rq->avg.runnable_avg)
> 
> Following is the calltrace.
> 
> Call trace:
> __update_blocked_fair
> update_blocked_averages
> newidle_balance
> pick_next_task_fair
> __schedule
> schedule
> pipe_read
> vfs_read
> ksys_read
> 
> After code analyzing and some debug messages, I found it exits a corner
> case at attach_entity_load_avg which will cause load_sum is zero and
> load_avg is not.
> Consider se_weight is 88761 according by sched_prio_to_weight table.
> And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
> By the calculating for se->avg.load_sum as following will become zero
> as following.
> se->avg.load_sum =
> 	div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> se->avg.load_sum = 1*47742/88761 = 0.
> 
> After enqueue_load_avg code as below.
> cfs_rq->avg.load_avg += se->avg.load_avg;
> cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> 
> Then the load_sum for cfs_rq will be 1 while the load_sum for cfs_rq is 0.
> So it will hit the warning message.
> 
> After all, I refer the following commit patch to do the similar thing at
> enqueue_load_avg.
> sched/pelt: Relax the sync of load_sum with load_avg

  2d02fa8cc21a ("sched/pelt: Relax the sync of load_sum with load_avg")

> 
> After long time testing, the kernel warning was gone and the system runs
> as well as before.
> 

Could probably do with a Fixes: tag too

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/fair.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4bd299d67ab..30d8b6dba249 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3074,8 +3074,10 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  static inline void
>  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -	cfs_rq->avg.load_avg += se->avg.load_avg;
> -	cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> +	add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> +	add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> +	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> +					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
>  }

Yes,. that looks right. Looking at this again though, I wonder if we
should perhaps clean is all up a bit.

Does something like the below on top make sense?


---
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3071,23 +3071,37 @@ account_entity_dequeue(struct cfs_rq *cf
 } while (0)
 
 #ifdef CONFIG_SMP
+
+/*
+ * Because of rounding, se->util_sum might ends up being +1 more than
+ * cfs->util_sum. Although this is not a problem by itself, detaching
+ * a lot of tasks with the rounding problem between 2 updates of
+ * util_avg (~1ms) can make cfs->util_sum becoming null whereas
+ * cfs_util_avg is not.
+ *
+ * Check that util_sum is still above its lower bound for the new
+ * util_avg. Given that period_contrib might have moved since the last
+ * sync, we are only sure that util_sum must be above or equal to
+ *    util_avg * minimum possible divider
+ */
+#define __update_sa(sa, name, delta_avg, delta_sum) do {	\
+	add_positive(&(sa)->name##_avg, delta_avg);		\
+	add_positive(&(sa)->name##_sum, delta_sum);		\
+	(sa)->name##_sum = max_t(typeof((sa)->name##_sum),	\
+			       (sa)->name##_sum,		\
+			       (sa)->name##_avg * PELT_MIN_DIVIDER); \
+} while (0)
+
 static inline void
 enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
-	add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
-	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
-					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
 }
 
 static inline void
 dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
-	sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
-					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
 }
 #else
 static inline void
@@ -3529,12 +3543,7 @@ update_tg_cfs_util(struct cfs_rq *cfs_rq
 	se->avg.util_sum = new_sum;
 
 	/* Update parent cfs_rq utilization */
-	add_positive(&cfs_rq->avg.util_avg, delta_avg);
-	add_positive(&cfs_rq->avg.util_sum, delta_sum);
-
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.util_sum = max_t(u32, cfs_rq->avg.util_sum,
-					  cfs_rq->avg.util_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, util, delta_avg, delta_sum);
 }
 
 static inline void
@@ -3560,11 +3569,7 @@ update_tg_cfs_runnable(struct cfs_rq *cf
 	se->avg.runnable_sum = new_sum;
 
 	/* Update parent cfs_rq runnable */
-	add_positive(&cfs_rq->avg.runnable_avg, delta_avg);
-	add_positive(&cfs_rq->avg.runnable_sum, delta_sum);
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.runnable_sum = max_t(u32, cfs_rq->avg.runnable_sum,
-					      cfs_rq->avg.runnable_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, runnable, delta_avg, delta_sum);
 }
 
 static inline void
@@ -3628,11 +3633,7 @@ update_tg_cfs_load(struct cfs_rq *cfs_rq
 
 	se->avg.load_sum = runnable_sum;
 	se->avg.load_avg = load_avg;
-	add_positive(&cfs_rq->avg.load_avg, delta_avg);
-	add_positive(&cfs_rq->avg.load_sum, delta_sum);
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
-					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, load, delta_avg, delta_sum);
 }
 
 static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum)
@@ -3747,33 +3748,13 @@ update_cfs_rq_load_avg(u64 now, struct c
 		raw_spin_unlock(&cfs_rq->removed.lock);
 
 		r = removed_load;
-		sub_positive(&sa->load_avg, r);
-		sub_positive(&sa->load_sum, r * divider);
-		/* See sa->util_sum below */
-		sa->load_sum = max_t(u32, sa->load_sum, sa->load_avg * PELT_MIN_DIVIDER);
+		__update_sa(sa, load, r, r*divider);
 
 		r = removed_util;
-		sub_positive(&sa->util_avg, r);
-		sub_positive(&sa->util_sum, r * divider);
-		/*
-		 * Because of rounding, se->util_sum might ends up being +1 more than
-		 * cfs->util_sum. Although this is not a problem by itself, detaching
-		 * a lot of tasks with the rounding problem between 2 updates of
-		 * util_avg (~1ms) can make cfs->util_sum becoming null whereas
-		 * cfs_util_avg is not.
-		 * Check that util_sum is still above its lower bound for the new
-		 * util_avg. Given that period_contrib might have moved since the last
-		 * sync, we are only sure that util_sum must be above or equal to
-		 *    util_avg * minimum possible divider
-		 */
-		sa->util_sum = max_t(u32, sa->util_sum, sa->util_avg * PELT_MIN_DIVIDER);
+		__update_sa(sa, util, r, r*divider);
 
 		r = removed_runnable;
-		sub_positive(&sa->runnable_avg, r);
-		sub_positive(&sa->runnable_sum, r * divider);
-		/* See sa->util_sum above */
-		sa->runnable_sum = max_t(u32, sa->runnable_sum,
-					      sa->runnable_avg * PELT_MIN_DIVIDER);
+		__update_sa(sa, runnable, r, r*divider);
 
 		/*
 		 * removed_runnable is the unweighted version of removed_load so we
@@ -3861,17 +3842,8 @@ static void attach_entity_load_avg(struc
 static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
 	dequeue_load_avg(cfs_rq, se);
-	sub_positive(&cfs_rq->avg.util_avg, se->avg.util_avg);
-	sub_positive(&cfs_rq->avg.util_sum, se->avg.util_sum);
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.util_sum = max_t(u32, cfs_rq->avg.util_sum,
-					  cfs_rq->avg.util_avg * PELT_MIN_DIVIDER);
-
-	sub_positive(&cfs_rq->avg.runnable_avg, se->avg.runnable_avg);
-	sub_positive(&cfs_rq->avg.runnable_sum, se->avg.runnable_sum);
-	/* See update_cfs_rq_load_avg() */
-	cfs_rq->avg.runnable_sum = max_t(u32, cfs_rq->avg.runnable_sum,
-					      cfs_rq->avg.runnable_avg * PELT_MIN_DIVIDER);
+	__update_sa(&cfs_rq->avg, util, se->avg.util_avg, se->avg.util_sum);
+	__update_sa(&cfs_rq->avg, runnable, se->avg.runnable_avg, se->avg.runnable_sum);
 
 	add_tg_cfs_propagate(cfs_rq, -se->avg.load_sum);
 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
