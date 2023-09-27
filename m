Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74EE810A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV9c/kOF7YEwPqI/+eatPgOU1BbthTf21OmVVgxee5k=; b=nlJK1GCQ/bQmOBGNetxqA/Ic6G
	/afpNTXvAlk4w+wVVK/F9giB66ATuZCMbCqBqiAwzgHnvXCKOVijco+XPUaUQqtKfQxU3HELdMKKV
	nXzzJbphr2xDUBDP0RJ8GFAOWT8S6GR149UFvxhcJ1DcXZfoB41QjGK/9gNeOWM6pwsiVUtoabT91
	FJy3G+C13UfDEhySY//JU9oUEsytMAHp5SWXxqcZRnuRryyWEbJYYc/omoJkV0ZOx2JIBFIJeLfdL
	Ve5XxY+whihb3nizKTeTtbXlle9LGEC9udqoREuJ30vzPH/cZuPmyhKSBIHpB/HiY5UUux0C+YGIl
	YcMc6a5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPbR-000J0q-2Q;
	Wed, 27 Sep 2023 08:09:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPbQ-000J0R-0F;
	Wed, 27 Sep 2023 08:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eV9c/kOF7YEwPqI/+eatPgOU1BbthTf21OmVVgxee5k=; b=FRVQf+6MNZpKA9nWLDsLlHBGXR
	0ofWHEjcbEFjoV1qiGrfL7/Ob5wWTADcK+DMM0tQcDfzhMfOkKsyPDeD2YcbG2yZF9/ypamOjbmQw
	xMkWKjn9rPYR8tZf2B5Ns8TIndPjmpgwvtWm4hqFv6qYdZsZkgdenEumsh2U21mZM870q9L2sNFDx
	U2Zkf7oF7K9ngsJiTYkIija3SnUwSz1JgPzzKUatB3QKnm4b8xuH6b8BZV7iFeF9Le8+thaa2byb+
	r+tqQPDMm6CFzPedTCOj+DVtXMR+WjzSahjLY2ldPDpLTGtZeM1KBNm/nBs0uiWolWPLxMYd5gaO0
	1vGX0oxw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPbF-003htP-15;
	Wed, 27 Sep 2023 08:08:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 71369300348; Wed, 27 Sep 2023 10:08:50 +0200 (CEST)
Date: Wed, 27 Sep 2023 10:08:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Message-ID: <20230927080850.GB21824@noisy.programming.kicks-ass.net>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927033431.12406-1-kuyo.chang@mediatek.com>
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

On Wed, Sep 27, 2023 at 11:34:28AM +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Syndrome] hung detect shows below warning msg
> [ 4320.666557] [   T56] khungtaskd: [name:hung_task&]INFO: task stressapptest:17803 blocked for more than 3600 seconds.
> [ 4320.666589] [   T56] khungtaskd: [name:core&]task:stressapptest   state:D stack:0     pid:17803 ppid:17579  flags:0x04000008
> [ 4320.666601] [   T56] khungtaskd: Call trace:
> [ 4320.666607] [   T56] khungtaskd:  __switch_to+0x17c/0x338
> [ 4320.666642] [   T56] khungtaskd:  __schedule+0x54c/0x8ec
> [ 4320.666651] [   T56] khungtaskd:  schedule+0x74/0xd4
> [ 4320.666656] [   T56] khungtaskd:  schedule_timeout+0x34/0x108
> [ 4320.666672] [   T56] khungtaskd:  do_wait_for_common+0xe0/0x154
> [ 4320.666678] [   T56] khungtaskd:  wait_for_completion+0x44/0x58
> [ 4320.666681] [   T56] khungtaskd:  __set_cpus_allowed_ptr_locked+0x344/0x730
> [ 4320.666702] [   T56] khungtaskd:  __sched_setaffinity+0x118/0x160
> [ 4320.666709] [   T56] khungtaskd:  sched_setaffinity+0x10c/0x248
> [ 4320.666715] [   T56] khungtaskd:  __arm64_sys_sched_setaffinity+0x15c/0x1c0
> [ 4320.666719] [   T56] khungtaskd:  invoke_syscall+0x3c/0xf8
> [ 4320.666743] [   T56] khungtaskd:  el0_svc_common+0xb0/0xe8
> [ 4320.666749] [   T56] khungtaskd:  do_el0_svc+0x28/0xa8
> [ 4320.666755] [   T56] khungtaskd:  el0_svc+0x28/0x9c
> [ 4320.666761] [   T56] khungtaskd:  el0t_64_sync_handler+0x7c/0xe4
> [ 4320.666766] [   T56] khungtaskd:  el0t_64_sync+0x18c/0x190
> 
> [Analysis]
> 
> After add some debug footprint massage, this issue happened at stopper
> disable case.
> It cannot exec migration_cpu_stop fun to complete migration.
> This will cause stuck on wait_for_completion.

How did you get in this situation?

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1dc0b0287e30..98c217a1caa0 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3041,8 +3041,9 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
>  		task_rq_unlock(rq, p, rf);
>  
>  		if (!stop_pending) {
> -			stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
> -					    &pending->arg, &pending->stop_work);
> +			if (!stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
> +					    &pending->arg, &pending->stop_work))
> +				return -ENOENT;

And -ENOENT is the right return code for when the target CPU is not
available?

I suspect you're missing more than halp the picture and this is a
band-aid solution at best. Please try harder.

>  		}
>  
>  		if (flags & SCA_MIGRATE_ENABLE)
> -- 
> 2.18.0
> 

