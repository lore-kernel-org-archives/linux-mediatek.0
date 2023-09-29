Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A193BE732D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKFoxdRkLTqqeQsvh4AvyUof9cGGj7cAggKCqCouSAA=; b=UuujDqz+UFvTMM+Ch/ZrfG4xRP
	dK+E4ruiWX2Fh8As8cEs/Zedc8DccTUXzziA/d9RT4PCRpY5MXipbWkRSNW5XQAFjtzZfdzMhZ1wY
	PMn8j1IBEeJmc/3KAb6YgjyKsmCPbU6pX/qeS+8NrNNm7FiqYsuhoMeAoIUSYfCj4cJ5ED5/1NELv
	4pvmlAjq7acUkTwQSM8kzhXZUcf+AwoIGqH/PH0JjHziejDT9wuNS+ipDdnHN10iRoKhEFbfFjlWR
	t5w3Yl9otBCb5o2XRmqolpVtYGgDOBFz0l4h7Tf6LdBXqAAnzmfTIhnlyEoqVPOIP3VGP/NOMS/QQ
	Ab//RzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAd2-007XGt-1Z;
	Fri, 29 Sep 2023 10:21:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAd1-007XGe-0D;
	Fri, 29 Sep 2023 10:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lKFoxdRkLTqqeQsvh4AvyUof9cGGj7cAggKCqCouSAA=; b=gA0Cs9nTbER/aLaPoARGDChZIo
	DlEKlFIYmOxPXeqSq5duqn6lp0RSdXtgimVz/R7EMh/kvP/+f55x3MBatV3vZS+VvgLJ3T+Gc7Shs
	K9hZOM2qHLX8wbOIWSpfOnX/xc3iMqYpqoh88ZHPBfwiyz31XGMELjqzzusTQxYeRVO5yQDemr0L+
	W0Z3EeDT/wGRtQOnMU/IVP5+K8sX7dg3XasOa19hrxOrA68VZSa4zDSWKSKgRD9t5FjvuGSnnIW4y
	cjyuRvaDSxmNkvzC0k1BQE+0Wz/OUfEsQAXB7y0tSVnv80kg+bOnddD8dRtZ7oPLs8l5WVWOjQM3F
	dTKwOFEA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAco-0062Tw-2C;
	Fri, 29 Sep 2023 10:21:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C867730030F; Fri, 29 Sep 2023 12:21:35 +0200 (CEST)
Date: Fri, 29 Sep 2023 12:21:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang =?utf-8?B?KOW8teW7uuaWhyk=?= <Kuyo.Chang@mediatek.com>
Cc: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"bristot@redhat.com" <bristot@redhat.com>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Message-ID: <20230929102135.GD6282@noisy.programming.kicks-ass.net>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
 <20230927080850.GB21824@noisy.programming.kicks-ass.net>
 <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 27, 2023 at 03:57:35PM +0000, Kuyo Chang (張建文) wrote:

> This issue occurs at CPU hotplug/set_affinity stress test.
> The reproduce ratio is very low(about once a week).

I'm assuming you're running an arm64 kernel with preempt_full=y (the
default for arm64).

Could you please test the below?

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d8fd29d66b24..079a63b8a954 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2645,9 +2645,11 @@ static int migration_cpu_stop(void *data)
 		 * it.
 		 */
 		WARN_ON_ONCE(!pending->stop_pending);
+		preempt_disable();
 		task_rq_unlock(rq, p, &rf);
 		stop_one_cpu_nowait(task_cpu(p), migration_cpu_stop,
 				    &pending->arg, &pending->stop_work);
+		preempt_enable();
 		return 0;
 	}
 out:
@@ -2967,12 +2969,13 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 			complete = true;
 		}
 
+		preempt_disable();
 		task_rq_unlock(rq, p, rf);
-
 		if (push_task) {
 			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
 					    p, &rq->push_work);
 		}
+		preempt_enable();
 
 		if (complete)
 			complete_all(&pending->done);
@@ -3038,12 +3041,13 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 		if (flags & SCA_MIGRATE_ENABLE)
 			p->migration_flags &= ~MDF_PUSH;
 
+		preempt_disable();
 		task_rq_unlock(rq, p, rf);
-
 		if (!stop_pending) {
 			stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
 					    &pending->arg, &pending->stop_work);
 		}
+		preempt_enable();
 
 		if (flags & SCA_MIGRATE_ENABLE)
 			return 0;
@@ -9459,6 +9461,7 @@ static void balance_push(struct rq *rq)
 	 * Temporarily drop rq->lock such that we can wake-up the stop task.
 	 * Both preemption and IRQs are still disabled.
 	 */
+	preempt_disable();
 	raw_spin_rq_unlock(rq);
 	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop, push_task,
 			    this_cpu_ptr(&push_work));
@@ -9468,6 +9471,7 @@ static void balance_push(struct rq *rq)
 	 * which kthread_is_per_cpu() and will push this task away.
 	 */
 	raw_spin_rq_lock(rq);
+	preempt_enable();
 }
 
 static void balance_push_set(int cpu, bool on)

