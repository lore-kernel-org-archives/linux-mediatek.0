Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzaYjb8tujwS52O5s9nKbfS7MjxkhVsZrv424zhIJCc=; b=o5Z6L/XThhra7s
	8+pxZ2nV1fUfLGEdeP/yufIZg2zThiefHgKmKoS6IBhhtm4Ww6kX6falVRQAD4iEOAoi6mH1+uv33
	Hzgoj2wYjdB/fN+7Qmbzh3ddJ29+MKQggkIVOrjuiYDSmqsjAkZyjAchG5A7roAtY63Du5iCoJMjI
	ypHvgsE0cdvMX5nZTzxoA1IzHowEkSEDjw7iI0S9RULdcsTkti37y0IYDQwOiIN+/TkdmjX590P29
	byZ3YNIIpHEdxR1++J950IZm23e+mR4jQPxUOIoRw7ze8Pg0V4o9HBvCOxIC7hce+Uk/YK+r4Tc0g
	1Ie7vRMOlKKsuIgmuuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCMR-00CjuQ-9C; Tue, 12 Apr 2022 08:58:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCMN-00CjqU-Ct
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 08:58:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b19so26642107wrh.11
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=CPUP1Iq5fK/bmBgD1XCDK9cdQZsBkT+LUZqC6FIYBEk=;
 b=ej+a3pcQfnw/MAwQO1KUZl+/MzVf9OjlW3toLX+V5ZSuj6Lygh+c53bbo4I0FoV8/a
 p8vakm0Jsw3ksH8U50KlfPdIlpLfa7owB0utMqfTJJqho+MpEgpubq/ic8KcX9sig5v2
 5PFZnLin2hJonUxw1sJ83AYtUmG9nzttIF+8MPSDAmTB6/5DoGzMePQGAzjTKjCKmU9J
 odRpwIOgtfuS3i1OiXnWCKw2VlC28PkjI/SPSFsfqh3jtmGyxC51bDyFNAYxafhLn+Mj
 2pgNVO1ZuF/1N3XZJETFpkBxoXbwy0LeF5SFvKQEr3ttl18GC/NavN60TWVeTDtaDrMr
 LWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CPUP1Iq5fK/bmBgD1XCDK9cdQZsBkT+LUZqC6FIYBEk=;
 b=XVLBe9+EpI36JYQaxYu9tE5+pJARjhEQ1SwifX3PzUstAFk7kbcDNAWKAq1iuZ6JWG
 sEfoEagBT0OzXUWH1foNONqB0DhoXY6tIpWFTptvChRICBJpfqljY55k1XZHvUyByAU8
 Voj+XyCsKhDJNxBtfZOkXj7u4/tomIL81ykYsgkKYo1uWnBq5SFVnzHCO1I8HKM9/Aen
 54YWHNBQ7rlGKrjDHdpiRpO+i62TfB/YGqE8QL6x3u9zs2pdE+tiyVcfizsbsbkvnIra
 vtDPu4ZaCNg2HYQJDmtXoJUBLDrDicsa+tkgX5wC+d6Hv2FA92lTWpkjmpXzTQz6YiBB
 C32w==
X-Gm-Message-State: AOAM530kFPDLF5+q910LFZV8pBTlDEGlGjQDy6qcyE7H4huJUX20t47h
 kaLOUfol390vHrdTHBiYB6jlFA==
X-Google-Smtp-Source: ABdhPJyoMN7KH4PRi34uNSYqnK6SmghZOUl9xoVGecU6nVJPgukZNVMMheGJqnwEunGq2o9JuaTtOw==
X-Received: by 2002:a5d:64ae:0:b0:207:8830:fa57 with SMTP id
 m14-20020a5d64ae000000b002078830fa57mr19642993wrp.272.1649753928432; 
 Tue, 12 Apr 2022 01:58:48 -0700 (PDT)
Received: from vingu-book ([2a01:e0a:f:6020:8808:91f3:6692:66dd])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm29504199wrf.61.2022.04.12.01.58.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Apr 2022 01:58:47 -0700 (PDT)
Date: Tue, 12 Apr 2022 10:58:45 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
Message-ID: <20220412085845.GA14088@vingu-book>
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
 <CAKfTPtAyhc-tAWXmXcHstmiBSMjj5GENizX__KRDab28NRum1A@mail.gmail.com>
 <5a90b20570ecacf457f68da7a106d3b2f8c2269e.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a90b20570ecacf457f68da7a106d3b2f8c2269e.camel@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_015851_469511_F7FE8CC8 
X-CRM114-Status: GOOD (  38.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Le mardi 12 avril 2022 =E0 10:51:23 (+0800), Kuyo Chang a =E9crit :
> On Mon, 2022-04-11 at 10:39 +0200, Vincent Guittot wrote:
> > On Mon, 11 Apr 2022 at 08:17, Kuyo Chang <kuyo.chang@mediatek.com>
> > wrote:
> > > =

> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > =

> > > I meet the warning message at cfs_rq_is_decayed at below code.
> > > =

> > > SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> > >                     cfs_rq->avg.util_avg ||
> > >                     cfs_rq->avg.runnable_avg)
> > > =

> > > Following is the calltrace.
> > > =

> > > Call trace:
> > > __update_blocked_fair
> > > update_blocked_averages
> > > newidle_balance
> > > pick_next_task_fair
> > > __schedule
> > > schedule
> > > pipe_read
> > > vfs_read
> > > ksys_read
> > > =

> > > After code analyzing and some debug messages, I found it exits a
> > > corner
> > > case at attach_entity_load_avg which will cause load_sum is zero
> > > and
> > > load_avg is not.
> > > Consider se_weight is 88761 according by sched_prio_to_weight
> > > table.
> > > And assume the get_pelt_divider() is 47742, se->avg.load_avg is 1.
> > > By the calculating for se->avg.load_sum as following will become
> > > zero
> > > as following.
> > > se->avg.load_sum =3D
> > >         div_u64(se->avg.load_avg * se->avg.load_sum,
> > > se_weight(se));
> > > se->avg.load_sum =3D 1*47742/88761 =3D 0.
> > =

> > The root problem is there, se->avg.load_sum must not be null if
> > se->avg.load_avg is not null because the correct relation between
> > _avg
> > and _sum is:
> > =

> > load_avg =3D weight * load_sum / divider.
> > =

> > so the fix should be attach_entity_load_avg() and probably the below
> > is enough
> > =

> > se->avg.load_sum =3D div_u64(se->avg.load_avg * se->avg.load_sum,
> > se_weight(se)) + 1;
> =

> Thanks for your kindly suggestion.
> +1 would make the calcuation for load_sum may be overestimate?
> How about the below code make sense for fix the corner case?
> =

> --- =

> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3832,7 +3832,8 @@ static void attach_entity_load_avg(struct cfs_rq
> *cfs_rq, struct sched_entity *s
>  	se->avg.load_sum =3D divider;
>  	if (se_weight(se)) {
>  		se->avg.load_sum =3D
> -			div_u64(se->avg.load_avg * se->avg.load_sum,
> se_weight(se));
> +			(se->avg.load_avg * se->avg.load_sum >
> se_weight(se)) ?
> +			div_u64(se->avg.load_avg * se->avg.load_sum,
> se_weight(se)) : 1;
>  	}
>  =

>  	enqueue_load_avg(cfs_rq, se);
> -- =

> 2.18.0

In this case, the below is easier to read

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1658a9428d96..2c685474db23 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3836,10 +3836,12 @@ static void attach_entity_load_avg(struct cfs_rq *c=
fs_rq, struct sched_entity *s

        se->avg.runnable_sum =3D se->avg.runnable_avg * divider;

-       se->avg.load_sum =3D divider;
-       if (se_weight(se)) {
+       se->avg.load_sum =3D se->avg.load_avg * divider;
+       if (se_weight(se) < se->avg.load_sum) {
                se->avg.load_sum =3D
-                       div_u64(se->avg.load_avg * se->avg.load_sum, se_wei=
ght(se));
+                       div_u64(se->avg.load_sum, se_weight(se));
+       } else {
+               se->avg.load_sum =3D 1;
        }

        enqueue_load_avg(cfs_rq, se);



> =

> =

> > > =

> > > After enqueue_load_avg code as below.
> > > cfs_rq->avg.load_avg +=3D se->avg.load_avg;
> > > cfs_rq->avg.load_sum +=3D se_weight(se) * se->avg.load_sum;
> > > =

> > > Then the load_sum for cfs_rq will be 1 while the load_sum for
> > > cfs_rq is 0.
> > > So it will hit the warning message.
> > > =

> > > After all, I refer the following commit patch to do the similar
> > > thing at
> > > enqueue_load_avg.
> > > sched/pelt: Relax the sync of load_sum with load_avg
> > > =

> > > After long time testing, the kernel warning was gone and the system
> > > runs
> > > as well as before.
> > > =

> > > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > > ---
> > >  kernel/sched/fair.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index d4bd299d67ab..30d8b6dba249 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -3074,8 +3074,10 @@ account_entity_dequeue(struct cfs_rq
> > > *cfs_rq, struct sched_entity *se)
> > >  static inline void
> > >  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> > >  {
> > > -       cfs_rq->avg.load_avg +=3D se->avg.load_avg;
> > > -       cfs_rq->avg.load_sum +=3D se_weight(se) * se->avg.load_sum;
> > > +       add_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> > > +       add_positive(&cfs_rq->avg.load_sum, se_weight(se) * se-
> > > >avg.load_sum);
> > > +       cfs_rq->avg.load_sum =3D max_t(u32, cfs_rq->avg.load_sum,
> > > +                                         cfs_rq->avg.load_avg *
> > > PELT_MIN_DIVIDER);
> > >  }
> > > =

> > >  static inline void
> > > --
> > > 2.18.0
> > > =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
