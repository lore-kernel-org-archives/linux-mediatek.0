Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E42CD6E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YrjkmK5upRYwbkDcj+pSMAUrTHwaFr1/OzjFdDvbY8=; b=PTp46rjtm5COlLthfPatD2xSNi
	TIJB49GUefblvOk9/ot/9i98lEhw9Lb6xQXsdArbjPSvaQY+pAJd3lh4PP7L40O6xMnOu/6b9gFSw
	+z9t9Oz2b8MoBenzHpEat+bs4Jec+dDa6/qVPMEv+VT9Lbc5MYT+amhm4RGKpLMmDdQ3n6DMotZi4
	JupUa+6pQ9xsXKCWRTR5WhghXbiZHA12utBu5BgKU9ZDCAJCk/xXBb6jKzUmiRf5IeA++Q6O7BJMU
	80gOedP9h04gkAkiOEEJ6uzkrPKBDsJKx2cFnsLwIl5DjTkIfDIESfWvqnwpAO1WT8mhymPDEFaXn
	o+SUR6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZEO-00FyBt-2C;
	Wed, 11 Oct 2023 13:26:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZEN-00FyAx-0N;
	Wed, 11 Oct 2023 13:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4YrjkmK5upRYwbkDcj+pSMAUrTHwaFr1/OzjFdDvbY8=; b=aAQZAN+flZxWL8H0Ca9UqhgfV4
	W9SfV9Zn5blzAAWfrdp15Js+iKQgYPSrisaRei+aNk+qb4AJCIO3Rq5CGmV0JXbIiPU2Th9EJmu4T
	iixjwSloJZnVUquxcZuVYNJ9Upto+l4Q6xMJLTGL36lt19m+ACqAb9n1e4lyCNtgFw5FVGfp/p7CC
	tk/HJ7XOAZs6uKo54rdKZ9PmfG1G7wg6H78NJvCRnTROsQ7NtVAv1moa8w8ljlg3ocAw9qL0y1S0H
	x9LnP40TxO6q/6TdJJX4yYQF7uRyA+tMOOIbtl03cVzV/h/4FXh6ke4+gi8pEo3VznwxjIZyKpYuB
	a4hoboFg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qqZEJ-00AzIj-BZ; Wed, 11 Oct 2023 13:26:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0BB0C30026F; Wed, 11 Oct 2023 15:26:27 +0200 (CEST)
Date: Wed, 11 Oct 2023 15:26:26 +0200
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
Subject: Re: [PATCH] sched: Fix stop_one_cpu_nowait() vs hotplug
Message-ID: <20231011132626.GP14330@noisy.programming.kicks-ass.net>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
 <20230927080850.GB21824@noisy.programming.kicks-ass.net>
 <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
 <20230929102135.GD6282@noisy.programming.kicks-ass.net>
 <8ad1b617a1040ce4cc56a5d04e8219b5313a9a6e.camel@mediatek.com>
 <20231010145747.GQ377@noisy.programming.kicks-ass.net>
 <20231010200442.GA16515@noisy.programming.kicks-ass.net>
 <172a3c89d7937725b61721e869eab3e5ae582643.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172a3c89d7937725b61721e869eab3e5ae582643.camel@mediatek.com>
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

On Wed, Oct 11, 2023 at 03:24:19AM +0000, Kuyo Chang (張建文) wrote:
> On Tue, 2023-10-10 at 22:04 +0200, Peter Zijlstra wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Tue, Oct 10, 2023 at 04:57:47PM +0200, Peter Zijlstra wrote:
> > > On Tue, Oct 10, 2023 at 02:40:22PM +0000, Kuyo Chang (張建文) wrote:
> > 
> > > > It is running good so far(more than a week)on hotplug/set
> > affinity
> > > > stress test. I will keep it testing and report back if it happens
> > > > again.
> > > 
> > > OK, I suppose I should look at writing a coherent Changelog for
> > this
> > > then...
> > 
> > Something like the below... ?
> > 
> Thanks for illustrate the race scenario. It looks good to me.
> But how about RT? Does RT also need this invocations as below?
> 
> ---
>  kernel/sched/rt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index e93b69ef919b..6aaf0a3d6081 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2063,9 +2063,11 @@ static int push_rt_task(struct rq *rq, bool
> pull)
>                  */
>                 push_task = get_push_task(rq);
>                 if (push_task) {
> +                       preempt_disable();
>                         raw_spin_rq_unlock(rq);
>                         stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
>                                             push_task, &rq->push_work);
> +                       preempt_enable();
>                         raw_spin_rq_lock(rq);
>                 }
> 
> @@ -2402,9 +2404,11 @@ static void pull_rt_task(struct rq *this_rq)
>                 double_unlock_balance(this_rq, src_rq);
> 
>                 if (push_task) {
> +                       preempt_disable();
>                         raw_spin_rq_unlock(this_rq);
>                         stop_one_cpu_nowait(src_rq->cpu, push_cpu_stop,
>                                             push_task, &src_rq-
> >push_work);
> +                       preempt_enable();
>                         raw_spin_rq_lock(this_rq);
>                 }
>         }

bah, clearly git-grep didn't work for me last night, I'll go fix up.

