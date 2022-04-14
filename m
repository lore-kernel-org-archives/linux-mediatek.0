Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FAEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vYBO+2ajTjnbyZdAYPEhs0wtXCKiYyKJXRVhpY2fTE=; b=JAkeh9Ju4C7eSC
	xQ6rHEiyo478MNTPaKRUpUXmut+2kUv8uJk8pq1RW/P4D0ADQxJm+lzqwCm/6SXIz6Hh4Jv2CBFPc
	Akay9/cZJLGf5sA+H8EUz6zupflaUsm3vTL9P0v3dCj0ug7GxKoxy1SDO91AVkLpZqWZwAMn7U8g5
	qlkDTPC68WwFYiEq8VuReD5RxUtoi8Om2UvdJVymqzYbP/zMMcQUgNiuaka75gmU74Ri4PHfi6DcY
	JVhM43CYTXuE1ccQTIP9hfn6oJ7U7Gn3BFQXwbNBYYQJvFWVKPpOpmhEue+btCIvMXevz8tELmBjj
	v6PnVr5HougEBW0zP8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neu3J-004NoK-5p; Thu, 14 Apr 2022 07:38:05 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neu36-004Nky-Tv
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 07:37:54 +0000
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ef4a241cc5so39666397b3.2
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2sEUdWYrr9ayBEuVJWBpv3UkoWU5IV5/Hq3UQC9Oqks=;
 b=naA6NBKsG/T3OEnLS6yYkSg1tHF33i6JVoono0ACrn6usn2OHiD89Z4512zT+q5uYO
 EfBWUetaEUbaQqO1vf55u8yAFl0zh1EKDUvnQK2y6xabfZpFANEg0RX7xxEBgiM7loYz
 CBdJc1lnpUaPIRWKhzKRxaMWkt9XKDT9rxNHOweP5XXjMy6p2CaK8cJA3tFFuG9uE9Wb
 zizY2pJ8bAJPcwylMUXjy53zsGBisz+BmC2rYeFwdmgNUhOE5w+EEt3dNj81uAVGcH0a
 /0DNj8H4wNtaPt7lyr4b+k1+B7lzy+CIfTeKvXmJ/JMc5lZjbaZAjI5OXG+wJYsRs3o9
 ubNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2sEUdWYrr9ayBEuVJWBpv3UkoWU5IV5/Hq3UQC9Oqks=;
 b=WTX81/q0E580Da5rF3eMdgSAzIfrJR5PX39jthU7W5hF4PfbqV8Lzo1/FrLAsVCxvX
 hka0unUz0nMiV5V0udK3ZHug9tXy3ovKNaS7OSx4nZdcWK3+1iFXt7cfhxdrPh0tpvmC
 VAB4wWPpsUv5GS5rMtoceITmrDS6zo/y/Dj3uhk5wuUvwortIqi38IMmABrasvZhvv0H
 Hu8RltYRxfzS8B0AvjHB1231S32l2qJPDZiK+vW48m3r8UV2erGrgsQtU8+yxeHO6NeW
 uMHRWLKoSQvc3+TZsbWlURWqSpmsSdV6EOcpTsTm/VuP+S96hfCIkIQ73q4grm4WLNL8
 aVuQ==
X-Gm-Message-State: AOAM531eUtrqesPtvVTmLyqMabLQbDbq3/rZ3ciBAZDGEF7T1LnuCG3g
 gqLrOp5GDFjUlUdoPK1rXEHakQqqAZnFidJhX0jdDA==
X-Google-Smtp-Source: ABdhPJyFMz2V/+P0cegLwco6lv2a7DNKoC8L3DEBpqC8kwi8ZXyMTVyJgIH1+lySoP+mMQHK7rKlEQsbjyOY/ITTS84=
X-Received: by 2002:a81:db52:0:b0:2e6:b428:f541 with SMTP id
 b18-20020a81db52000000b002e6b428f541mr1032097ywn.359.1649921870910; Thu, 14
 Apr 2022 00:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220414015940.9537-1-kuyo.chang@mediatek.com>
In-Reply-To: <20220414015940.9537-1-kuyo.chang@mediatek.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 14 Apr 2022 09:37:39 +0200
Message-ID: <CAKfTPtBn-9WWcA3=e0etbq_6cP5O6TXNqZ1B5=2SPe-yaC+PxQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] [PATCH v2]sched/pelt: Refine the enqueue_load_avg
 calculate method
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
X-CRM114-CacheID: sfid-20220414_003753_008922_81AEB9B0 
X-CRM114-Status: GOOD (  23.60  )
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

On Thu, 14 Apr 2022 at 03:59, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
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
> case at attach_entity_load_avg which will cause load_sum is null but
> load_avg is not.
> Consider se_weight is 88761 according by sched_prio_to_weight table.
> And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
> By the calculating for se->avg.load_sum as following will become zero
> as following.
> se->avg.load_sum =
>         div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> se->avg.load_sum = 1*47742/88761 = 0.
>
> After enqueue_load_avg code as below.
> cfs_rq->avg.load_avg += se->avg.load_avg;
> cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
>
> Then the load_sum for cfs_rq will be 1 while the load_sum for cfs_rq is 0.
> So it will hit the warning message.
>
> In order to fix the corner case, make sure the se->load_avg|sum is correct
> before enqueue_load_avg.
>
> After long time testing, the kernel warning was gone and the system runs
> as well as before.

This needs a fix tag:
Fixes: f207934fb79d ("sched/fair: Align PELT windows between cfs_rq and its se")

>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>
> v1->v2:
>
> (1)Thanks for suggestion from Peter Zijlstra & Vincent Guittot.
> (2)By suggestion from Vincent Guittot,
> rework the se->load_sum calculation method for fix the corner case,
> make sure the se->load_avg|sum is correct before enqueue_load_avg.
> (3)Rework changlog.
>
>  kernel/sched/fair.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4bd299d67ab..159274482c4e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3829,10 +3829,12 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>
>         se->avg.runnable_sum = se->avg.runnable_avg * divider;
>
> -       se->avg.load_sum = divider;
> -       if (se_weight(se)) {
> +       se->avg.load_sum = se->avg.load_avg * divider;
> +       if (se_weight(se) < se->avg.load_sum) {
>                 se->avg.load_sum =
> -                       div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> +                       div_u64(se->avg.load_sum, se_weight(se));
> +       } else {
> +               se->avg.load_sum = 1;
>         }
>
>         enqueue_load_avg(cfs_rq, se);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
