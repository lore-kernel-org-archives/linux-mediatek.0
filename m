Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEBAC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBE961357
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EBE961357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9QsgxXm8LS2KZerNaTtWLklomYdmCyNkt4GJEUPz1E=; b=LnBCg7rpAY/Neq
	4GBPlTqHBaiehTSjb0Vgqa/iMyp8MImpdwLFAuo+/ecNC2yrjV3uxbBo3nAPpJHPE+sM2dh0HmY0U
	j3qTl/zxyw3rKiL/D5LBgDV9iZBYSck6R3kp+cwJ7KOXLxrbkPTGylyx18OwJ+mbgo3C2gpHPDMHO
	SC37Kr7JjhT/YY+4ixX2ZXCFsbnZFyUB4+9hiJcSiyyN84Hq7aWlbnsAtywGk3szLUpFn7gIUYMCE
	F8JHB49zRlxErAumnMbhwRTgWVYSCvR4F1o6LHs9qITCGcF5ZmvUjm0kuGmnKGprpqCuvY5S9JboC
	c7b2eMPtaFZn2TiKX/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvgtB-007Nrf-9q; Tue, 22 Jun 2021 13:56:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgsu-007Nkh-Hv; Tue, 22 Jun 2021 13:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gmz5poUQaceLKV0RtAse/MGXjoRAt1CEVmrmQpXj2oM=; b=fhXfJmG8MFXfQ2OTjMPxf0oQAm
 z+1EVSBdLlMmWv01P5Zf6tfYdgLslAPNAwwR3/OZZ/RPJcC8WN5ktFp/prD551gsySogdLetE65uq
 Mu4Q9rRWfmVGGvOhInPZz0tf8VKC46nyS8WqjbLK//PG98LtNKX4wMsr8vLUwLC227uwi6eBzTfmN
 8vdQxqDK8yo0wiw1PooQQrwk6Ysf3IUTX5aEo0Bm5fn/RqWDNCyWkCd/IctwcN0kUtwBOfeXVgsz1
 stkyq00S2vC6nL1dQ8yg145VAc5wszU3yD3kymCSdn0vVDtS6oD0VxKtCg5pvbriF5GV4zYGzQaPM
 9/EHjWOg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgsg-00AcAf-CY; Tue, 22 Jun 2021 13:56:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 10F3D30021A;
 Tue, 22 Jun 2021 15:56:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E137420C169E1; Tue, 22 Jun 2021 15:56:03 +0200 (CEST)
Date: Tue, 22 Jun 2021 15:56:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: hannes@cmpxchg.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, matthias.bgg@gmail.com, minchan@google.com,
 timmurray@google.com, yt.chang@mediatek.com, wenju.xu@mediatek.com,
 jonathan.jmchen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YNHr81D/fPD2Q8kM@hirez.programming.kicks-ass.net>
References: <20210617212654.1529125-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617212654.1529125-1-surenb@google.com>
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

On Thu, Jun 17, 2021 at 02:26:54PM -0700, Suren Baghdasaryan wrote:
> Psi polling mechanism is trying to minimize the number of wakeups to
> run psi_poll_work and is currently relying on timer_pending() to detect
> when this work is already scheduled. This provides a window of opportunity
> for psi_group_change to schedule an immediate psi_poll_work after
> poll_timer_fn got called but before psi_poll_work could reschedule itself.
> Below is the depiction of this entire window:
> 
> poll_timer_fn
>   wake_up_interruptible(&group->poll_wait);
> 
> psi_poll_worker
>   wait_event_interruptible(group->poll_wait, ...)
>   psi_poll_work
>     psi_schedule_poll_work
>       if (timer_pending(&group->poll_timer)) return;
>       ...
>       mod_timer(&group->poll_timer, jiffies + delay);
> 
> Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
> reset and set back inside psi_poll_work and therefore this race window
> was much smaller.
> The larger window causes increased number of wakeups and our partners
> report visible power regression of ~10mA after applying 461daba06bdc.
> Bring back the poll_scheduled atomic and make this race window even
> narrower by resetting poll_scheduled only when we reach polling expiration
> time. This does not completely eliminate the possibility of extra wakeups
> caused by a race with psi_group_change however it will limit it to the
> worst case scenario of one extra wakeup per every tracking window (0.5s
> in the worst case).
> By tracing the number of immediate rescheduling attempts performed by
> psi_group_change and the number of these attempts being blocked due to
> psi monitor being already active, we can assess the effects of this change:
> 
> Before the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           684365   1385156    1261240
> Immediate reschedules blocked:             682846   1381654    1258682
> Immediate reschedules (delta):             1519     3502       2558
> Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
> 
> After the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           882244   770298    426218
> Immediate reschedules blocked:             881996   769796    426074
> Immediate reschedules (delta):             248      502       144
> Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
> 
> The number of non-blocked immediate reschedules dropped from 0.22-0.25%
> to 0.03-0.07%. The drop is attributed to the decrease in the race window
> size and the fact that we allow this race only when psi monitors reach
> polling window expiration time.
> 
> Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Johannes?


> -/* Schedule polling if it's not already scheduled. */
> -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> +/* Schedule polling if it's not already scheduled or forced. */
> +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> +				   bool force)
>  {
>  	struct task_struct *task;
>  
> -	/*
> -	 * Do not reschedule if already scheduled.
> -	 * Possible race with a timer scheduled after this check but before
> -	 * mod_timer below can be tolerated because group->polling_next_update
> -	 * will keep updates on schedule.
> -	 */
> -	if (timer_pending(&group->poll_timer))
> +	/* cmpxchg should be called even when !force to set poll_scheduled */
> +	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) != 0 && !force)

Do you care about memory ordering here? Afaict the whole thing is
supposed to be ordered by ->trigger_lock, so you don't.

Howver, if you did, the code seems to suggest you need a RELEASE
ordering, but cmpxchg() as used above can fail in which case it does't
provide anything.

Also, I think the more conventional way to write that might be:

	if (atomic_xchg_relaxed(&group->poll_scheduled, 1) && !force)

Hmm?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
