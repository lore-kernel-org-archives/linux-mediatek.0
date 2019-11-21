Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76F8C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 12:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87D82089D
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 12:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNgR0Nm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87D82089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6KSdpvUw/mcuCSTLFhYZV9P//eZTZtJifSis94O728=; b=NNgR0Nm4qLCJYZ
	4rOqv82UR5Y+0CSCZuZ1DOLeWM8YAfC6rYdYsWoG2Jexf2rJMKHRGCkOtaAvfcOhsI6lpDvtYKE7S
	ox22YNstZWyiYsWw68nZXwCNt8hmaByHP1vUaCu7DizB22lPLFh+lrUGmoUh4xSI+7INeGPWHMygg
	OqIcN3kbTXDQLeiqA+/dnhcOGTFAhy4V8Ib0W8w3hZL7zhn7I8x7NjgFJ3XiUyArWHqsBe9wTw3xR
	m1h/gFMM/cpRi9CREA8RTkKHGzOtnZ3VNRqPaB3Ot2o5BotPo8bvj3lU3YgiMWPBD/nffAkGrKJeP
	DThKFEmxuSqrJl6rptUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXliw-0005yZ-B8; Thu, 21 Nov 2019 12:38:14 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXlin-0005qq-Qq; Thu, 21 Nov 2019 12:38:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 55B7E300565;
 Thu, 21 Nov 2019 13:36:53 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 33847201DD6AF; Thu, 21 Nov 2019 13:38:04 +0100 (CET)
Date: Thu, 21 Nov 2019 13:38:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: YT Chang <yt.chang@mediatek.com>
Subject: Re: [PATCH 1/1] sched: cfs_rq h_load might not update due to irq
 disable
Message-ID: <20191121123804.GR4097@hirez.programming.kicks-ass.net>
References: <1574325009-10846-1-git-send-email-yt.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574325009-10846-1-git-send-email-yt.chang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 04:30:09PM +0800, YT Chang wrote:
> Syndrome:
> 
> Two CPUs might do idle balance in the same time.
> One CPU does idle balance and pulls some tasks.
> However before pick next task, ALL task are pulled back to other CPU.
> That results in infinite loop in both CPUs.

Can you easily reproduce this?

> =========================================
> code flow:
> 
> in pick_next_task_fair()
> 
> again:
> 
> if nr_running == 0
> 	goto idle
> pick next task
> 	return
> 
> idle:
> 	idle_balance
>        /* pull some tasks from other CPU,
>         * However other CPU are also do idle balance,
> 	* and pull back these task */
> 
> 	go to again
> 
> =========================================
> The result to pull ALL tasks back when the task_h_load
> is incorrect and too low.

Clearly you're not running a PREEMPT kernel, otherwise the break in
detach_tasks() would've saved you, right?

> static unsigned long task_h_load(struct task_struct *p)
> {
>         struct cfs_rq *cfs_rq = task_cfs_rq(p);
> 
> 	update_cfs_rq_h_load(cfs_rq);
> 	return div64_ul(p->se.avg.load_avg_contrib * cfs_rq->h_load,
> 			cfs_rq->runnable_load_avg + 1);
> }
> 
> The cfs_rq->h_load is incorrect and might too small.
> The original idea of cfs_rq::last_h_load_update will not
> update cfs_rq::h_load more than once a jiffies.
> When the Two CPUs pull each other in the pick_next_task_fair,
> the irq disabled and result in jiffie not update.
> (Other CPUs wait for runqueue lock locked by the two CPUs.
> So, ALL CPUs are irq disabled.)

This cannot be true; because the loop drops rq->lock, so other CPUs
should have an opportunity to acquire the lock and make progress.

> Solution:
> cfs_rq h_load might not update due to irq disable
> use sched_clock instead jiffies
> 
> Signed-off-by: YT Chang <yt.chang@mediatek.com>
> ---
>  kernel/sched/fair.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 83ab35e..231c53f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7578,9 +7578,11 @@ static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
>  {
>  	struct rq *rq = rq_of(cfs_rq);
>  	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
> -	unsigned long now = jiffies;
> +	u64 now = sched_clock_cpu(cpu_of(rq));
>  	unsigned long load;
>  
> +	now = now * HZ >> 30;
> +
>  	if (cfs_rq->last_h_load_update == now)
>  		return;
>  

This is disguisting and wrong. That is not the correct relation between
sched_clock() and jiffies.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
