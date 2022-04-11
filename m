Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNbHBPqG7NWz4dxZ5A8VMCLIdwSJAq4+hLMe4QpIbmE=; b=igg6ozFgg+7kiu
	Fix+aXg8hb1dKm161BQmoxPxrAQp6iIhIwATtLP4kk8XKz01hQhn1aAC+60mL54RLEYfmU7UfJpJN
	Up942v7yf2MNAnfL26UphmPmW1RwAS3fygbYF6C77D07qmkNF8GWuRztnWk9e+z2u8gaEXMPZxN21
	XljZAVAkjDI15zSEZVpZI2o9ajFfpxkcokR82jIsKqTmUvhq1v3NS/84oLdRcfY54lTogt+ca8yfz
	91np5f1XDEsEXJJwUACHcsrzUYkXzpAkq5h9ueSJeYwGIz9OBNmGOIRwCu5asUKaHoJ/gjHDbi0MT
	JII32yjce2FUUt7edmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpa9-007b0s-Mv; Mon, 11 Apr 2022 08:39:33 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpa7-007azD-2j
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 08:39:32 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id l14so26204527ybe.4
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9nJm17K/yud/Vja2i5nosF7JRnfY8vZ/WHIXKk9f6w=;
 b=QjG37G9hcBCKyJJPEueSmvuJ4kGecn9OdjK0F5aKlzodqMICJs2bJyRMuIEvtpWfm+
 ag/mGQx9OIiQQyEuximvaMdligXWgRdG5meye0AsQrnWqQawlmRca/NLtkeGps3VBRPE
 GqLxLxzz3gVd9K6ZGkM7mTTmwbbSX4AZVV+qAcYFfCyS+ELU4TzhKefl5HAJx/YnzJzP
 13NhTf9YXB62ISsZ13uuOxJgrMOJELQ2JCV4gs78L+IAA5r8g9462BhMZaK2DjVjRhqo
 ZSThhlkvMyq4FzQagerPBLr/RFk13GuscmRf4UjWsjCnXtBZhux2YsTskn46fugduT4D
 gMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9nJm17K/yud/Vja2i5nosF7JRnfY8vZ/WHIXKk9f6w=;
 b=d3WcWcrLqjpJ91MLcJ8syJG3QBbKlJJREF8mCoVc1q7lDROX795raujo0OFRAt2b9N
 YgQIKQvfmO5dDLnTVvHrRthiG9znS6l1zKvtbPm2UfUpd3JMONTNEkQT8M0njbQElTZN
 cs5BGqJdiKzwAWU+RNan07bQeOl6BiZLG8hYUdoI7anVzYjdL0/xTue53nMzErmi2TAM
 B333X7X7c9LoDdF00HRTmQCMyM4SRguEBvSUdenaJ6IDPDdNyt7UhUZnGqA9CFdJ4dDP
 T8hFAczOkykoZA3Zo74LBtAAfF3Akj6BZ5EIqvkRuh/a/Vn0UUe1DhEVML13H13XXnAy
 17MA==
X-Gm-Message-State: AOAM532UdRAepVNIqW/ecsd9xs6xpgh+IJwOi7g1HFdWpBuAsxl+xrbL
 c7G976VWlEEIuVXs6IHxQ57SVf2eLCuYEjm/hGNbkQUCX7GBAg==
X-Google-Smtp-Source: ABdhPJxQukCB3C2RSIxVqw7saiBSI8LGmbDPS1ymWQyy9ZS8UYDHorULHehzgaFixVzrNwBrVJ4LCY/l/CbBTmcGgpo=
X-Received: by 2002:a25:d80a:0:b0:641:38dd:2f4c with SMTP id
 p10-20020a25d80a000000b0064138dd2f4cmr4717123ybg.225.1649666367294; Mon, 11
 Apr 2022 01:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
In-Reply-To: <20220411061702.22978-1-kuyo.chang@mediatek.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 11 Apr 2022 10:39:16 +0200
Message-ID: <CAKfTPtAyhc-tAWXmXcHstmiBSMjj5GENizX__KRDab28NRum1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, wsd_upstream@mediatek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_013931_216117_62E507F1 
X-CRM114-Status: GOOD (  24.62  )
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

On Mon, 11 Apr 2022 at 08:17, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
>
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> I meet the warning message at cfs_rq_is_decayed at below code.
>
> SCHED_WARN_ON(cfs_rq->avg.load_avg ||
>                     cfs_rq->avg.util_avg ||
>                     cfs_rq->avg.runnable_avg)
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
>         div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> se->avg.load_sum = 1*47742/88761 = 0.

The root problem is there, se->avg.load_sum must not be null if
se->avg.load_avg is not null because the correct relation between _avg
and _sum is:

load_avg = weight * load_sum / divider.

so the fix should be attach_entity_load_avg() and probably the below is enough

se->avg.load_sum = div_u64(se->avg.load_avg * se->avg.load_sum,
se_weight(se)) + 1;

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
>
> After long time testing, the kernel warning was gone and the system runs
> as well as before.
>
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
> -       cfs_rq->avg.load_avg += se->avg.load_avg;
> -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> +       add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> +       add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> +       cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
> +                                         cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
>  }
>
>  static inline void
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
