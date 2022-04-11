Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9prpFakghOxBNjSuba7xXG6nV+R/GkzT/MXIe6gMKXo=; b=jsS3EIbzqoJ69Q
	5BU9zEgF0ROGgJVb/l+anUvpr0saloHcSPKbwzbolIPXMUMAosodaHLRx6tK8KL83odPicTZIUt39
	fer3j8ReohL6F9skXPlILaSAnnI30TH7B4NY3/yregbu6Gye3rHneK3BKW3QLIgPxzt96h03g2sfR
	w5kjoASxm9+++V4NF7qlr0JYcdBwfePCqvqc7h/2ScXSgix+wBo2MBFdPrXbLiEfAC17xvYA9NTfk
	T2lPsw/bcJhJc9paWOg8rgOtqesYJeX+394PYlL2BMbDH+Igiwq4dTo2j5W+BDZCk9m3xxnTFO7b4
	jfQh4FGOpNquIAJBdX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrLY-008Mhr-7s; Mon, 11 Apr 2022 10:32:36 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndr43-008E8s-Vw
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 10:14:42 +0000
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec0bb4b715so30659607b3.5
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsf+M8kyK9JtetTVOfR1iwiRi9tmqW4D3f/X+nIL/yk=;
 b=oqzXYM/5ecgunchfONePZAhKq/09D27/vD3TVb8dXZ0kxoC6nQe8kqQ1SDr+nmnsVn
 By+5nerjtNBTHV9PoUi+oG12v135H+vm9AQOfKmzIpLmXCa/g5/zRB7geDnMBcQVF9sK
 Qr45aU9Pbz8XQuPxjgKYtksLmsG5BxGNpNDdEFX5pkbtC65oKmYg5IXbwjGk407+3aVl
 iFR2fZcGlWjoq8PDQBZIZpL19OEq7QPpx4oxjw49yLlllxMYJOlZV0fQ9qwWbxCQweHk
 a+fxriChWBHQBe3YSoOhR8OzTtk1q6C/ZD5hZyrCJ1tuY/t1hatnjsz4fdmEfomxaj85
 beDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsf+M8kyK9JtetTVOfR1iwiRi9tmqW4D3f/X+nIL/yk=;
 b=IFdSIqLJibQVsXzY09BM1vM7NTOO8Qiu5BjA1SpChaU9nZ+WpsuDmvpLWrvEIah27x
 MUyZNV6v37kH8Ory8q1n/nFKl9HGD2juoMRZYFsWTDPw7BY6up54dpi4xbqRdEPS6Te2
 XZoUwsPme/w73jlOTPkRfuFoBwnTjCQMJjBFi0W4fgIsGOOPBSX+NW4SlPCKxMfrpv3u
 LJA5VxwYpzuqrdXKt9HuePZROzUo97CWeb72q3nYzdOGTpK5g8JqXff2JnCxkjoDb12p
 OIDyjwQoWMVnEHinc1WuHY8FC2c/MxmIr49+v9v+KCUmZuyh9ghT39DE0gxoE2UqI0+M
 Q6eA==
X-Gm-Message-State: AOAM530CBF/c6jlX3J4FgE9W1Tu3s8H3hd7V8UEFO2THiLfCKrwjTIgY
 HjHCdivgO687DiPDY6MHLFBVJekjhg0TM8Lwn54xGQ==
X-Google-Smtp-Source: ABdhPJw0Pk/l2o6qtGYjGVjdd2NoJEPv0aZ1kWw6KF0LE5sYbFYW2svHYHKkeqpddVePz11KoiLeiuG8ypc9Nzeg51U=
X-Received: by 2002:a81:db52:0:b0:2e6:b428:f541 with SMTP id
 b18-20020a81db52000000b002e6b428f541mr25833934ywn.359.1649672070525; Mon, 11
 Apr 2022 03:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
 <YlPl9jq5sipeY5nF@hirez.programming.kicks-ass.net>
In-Reply-To: <YlPl9jq5sipeY5nF@hirez.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 11 Apr 2022 12:14:18 +0200
Message-ID: <CAKfTPtCXRoT9_dW-jqTf6Hdom+ryeueF8HyfmP8kv4jqEOFxzg@mail.gmail.com>
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>, 
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, wsd_upstream@mediatek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_031432_397365_3075AE54 
X-CRM114-Status: GOOD (  37.79  )
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

On Mon, 11 Apr 2022 at 10:25, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Apr 11, 2022 at 02:16:56PM +0800, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> >
> > I meet the warning message at cfs_rq_is_decayed at below code.
> >
> > SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> >                   cfs_rq->avg.util_avg ||
> >                   cfs_rq->avg.runnable_avg)
> >
> > Following is the calltrace.
> >
> > Call trace:
> > __update_blocked_fair
> > update_blocked_averages
> > newidle_balance
> > pick_next_task_fair
> > __schedule
> > schedule
> > pipe_read
> > vfs_read
> > ksys_read
> >
> > After code analyzing and some debug messages, I found it exits a corner
> > case at attach_entity_load_avg which will cause load_sum is zero and
> > load_avg is not.
> > Consider se_weight is 88761 according by sched_prio_to_weight table.
> > And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
> > By the calculating for se->avg.load_sum as following will become zero
> > as following.
> > se->avg.load_sum =
> >       div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> > se->avg.load_sum = 1*47742/88761 = 0.
> >
> > After enqueue_load_avg code as below.
> > cfs_rq->avg.load_avg += se->avg.load_avg;
> > cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> >
> > Then the load_sum for cfs_rq will be 1 while the load_sum for cfs_rq is 0.
> > So it will hit the warning message.
> >
> > After all, I refer the following commit patch to do the similar thing at
> > enqueue_load_avg.
> > sched/pelt: Relax the sync of load_sum with load_avg
>
>   2d02fa8cc21a ("sched/pelt: Relax the sync of load_sum with load_avg")
>
> >
> > After long time testing, the kernel warning was gone and the system runs
> > as well as before.
> >
>
> Could probably do with a Fixes: tag too
>
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > ---
> >  kernel/sched/fair.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4bd299d67ab..30d8b6dba249 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -3074,8 +3074,10 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  static inline void
> >  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> > -     cfs_rq->avg.load_avg += se->avg.load_avg;
> > -     cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> > +     add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> > +     add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> > +     cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> > +                                       cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
> >  }
>
> Yes,. that looks right. Looking at this again though, I wonder if we
> should perhaps clean is all up a bit.

adding se->load_avg|sum in cfs_rq should not create a situation where
cfs->load_sum is null but not cfs->load_avg unless se->load_avg|sum
are wrong from the beginning which seems to be the case here

>
> Does something like the below on top make sense?
>
>
> ---
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3071,23 +3071,37 @@ account_entity_dequeue(struct cfs_rq *cf
>  } while (0)
>
>  #ifdef CONFIG_SMP
> +
> +/*
> + * Because of rounding, se->util_sum might ends up being +1 more than
> + * cfs->util_sum. Although this is not a problem by itself, detaching
> + * a lot of tasks with the rounding problem between 2 updates of
> + * util_avg (~1ms) can make cfs->util_sum becoming null whereas
> + * cfs_util_avg is not.
> + *
> + * Check that util_sum is still above its lower bound for the new
> + * util_avg. Given that period_contrib might have moved since the last
> + * sync, we are only sure that util_sum must be above or equal to
> + *    util_avg * minimum possible divider
> + */
> +#define __update_sa(sa, name, delta_avg, delta_sum) do {       \
> +       add_positive(&(sa)->name##_avg, delta_avg);             \
> +       add_positive(&(sa)->name##_sum, delta_sum);             \
> +       (sa)->name##_sum = max_t(typeof((sa)->name##_sum),      \
> +                              (sa)->name##_sum,                \
> +                              (sa)->name##_avg * PELT_MIN_DIVIDER); \
> +} while (0)
> +
>  static inline void
>  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> -       add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> -       cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> -                                         cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
>  }
>
>  static inline void
>  dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> -       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> -                                         cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
>  }
>  #else
>  static inline void
> @@ -3529,12 +3543,7 @@ update_tg_cfs_util(struct cfs_rq *cfs_rq
>         se->avg.util_sum = new_sum;
>
>         /* Update parent cfs_rq utilization */
> -       add_positive(&cfs_rq->avg.util_avg, delta_avg);
> -       add_positive(&cfs_rq->avg.util_sum, delta_sum);
> -
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.util_sum = max_t(u32, cfs_rq->avg.util_sum,
> -                                         cfs_rq->avg.util_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, util, delta_avg, delta_sum);
>  }
>
>  static inline void
> @@ -3560,11 +3569,7 @@ update_tg_cfs_runnable(struct cfs_rq *cf
>         se->avg.runnable_sum = new_sum;
>
>         /* Update parent cfs_rq runnable */
> -       add_positive(&cfs_rq->avg.runnable_avg, delta_avg);
> -       add_positive(&cfs_rq->avg.runnable_sum, delta_sum);
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.runnable_sum = max_t(u32, cfs_rq->avg.runnable_sum,
> -                                             cfs_rq->avg.runnable_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, runnable, delta_avg, delta_sum);
>  }
>
>  static inline void
> @@ -3628,11 +3633,7 @@ update_tg_cfs_load(struct cfs_rq *cfs_rq
>
>         se->avg.load_sum = runnable_sum;
>         se->avg.load_avg = load_avg;
> -       add_positive(&cfs_rq->avg.load_avg, delta_avg);
> -       add_positive(&cfs_rq->avg.load_sum, delta_sum);
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> -                                         cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, load, delta_avg, delta_sum);
>  }
>
>  static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum)
> @@ -3747,33 +3748,13 @@ update_cfs_rq_load_avg(u64 now, struct c
>                 raw_spin_unlock(&cfs_rq->removed.lock);
>
>                 r = removed_load;
> -               sub_positive(&sa->load_avg, r);
> -               sub_positive(&sa->load_sum, r * divider);
> -               /* See sa->util_sum below */
> -               sa->load_sum = max_t(u32, sa->load_sum, sa->load_avg * PELT_MIN_DIVIDER);
> +               __update_sa(sa, load, r, r*divider);
>
>                 r = removed_util;
> -               sub_positive(&sa->util_avg, r);
> -               sub_positive(&sa->util_sum, r * divider);
> -               /*
> -                * Because of rounding, se->util_sum might ends up being +1 more than
> -                * cfs->util_sum. Although this is not a problem by itself, detaching
> -                * a lot of tasks with the rounding problem between 2 updates of
> -                * util_avg (~1ms) can make cfs->util_sum becoming null whereas
> -                * cfs_util_avg is not.
> -                * Check that util_sum is still above its lower bound for the new
> -                * util_avg. Given that period_contrib might have moved since the last
> -                * sync, we are only sure that util_sum must be above or equal to
> -                *    util_avg * minimum possible divider
> -                */
> -               sa->util_sum = max_t(u32, sa->util_sum, sa->util_avg * PELT_MIN_DIVIDER);
> +               __update_sa(sa, util, r, r*divider);
>
>                 r = removed_runnable;
> -               sub_positive(&sa->runnable_avg, r);
> -               sub_positive(&sa->runnable_sum, r * divider);
> -               /* See sa->util_sum above */
> -               sa->runnable_sum = max_t(u32, sa->runnable_sum,
> -                                             sa->runnable_avg * PELT_MIN_DIVIDER);
> +               __update_sa(sa, runnable, r, r*divider);
>
>                 /*
>                  * removed_runnable is the unweighted version of removed_load so we
> @@ -3861,17 +3842,8 @@ static void attach_entity_load_avg(struc
>  static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
>         dequeue_load_avg(cfs_rq, se);
> -       sub_positive(&cfs_rq->avg.util_avg, se->avg.util_avg);
> -       sub_positive(&cfs_rq->avg.util_sum, se->avg.util_sum);
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.util_sum = max_t(u32, cfs_rq->avg.util_sum,
> -                                         cfs_rq->avg.util_avg * PELT_MIN_DIVIDER);
> -
> -       sub_positive(&cfs_rq->avg.runnable_avg, se->avg.runnable_avg);
> -       sub_positive(&cfs_rq->avg.runnable_sum, se->avg.runnable_sum);
> -       /* See update_cfs_rq_load_avg() */
> -       cfs_rq->avg.runnable_sum = max_t(u32, cfs_rq->avg.runnable_sum,
> -                                             cfs_rq->avg.runnable_avg * PELT_MIN_DIVIDER);
> +       __update_sa(&cfs_rq->avg, util, se->avg.util_avg, se->avg.util_sum);
> +       __update_sa(&cfs_rq->avg, runnable, se->avg.runnable_avg, se->avg.runnable_sum);
>
>         add_tg_cfs_propagate(cfs_rq, -se->avg.load_sum);
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
