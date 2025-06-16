Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1379EC71136
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=; b=TuLA8LJrk4NQttcARg3MeZ001h
	qoRD+1XZAqMMOIwbiWqGcyr2anwa1DfLXK11lhjwiVbAyzx0O0avK4AkKWNTedwVmPf30oS0IRnRg
	+u3eguJDvYf7bJYbm/OTg1d0npZ+nhpUU1ozS+kXtOK6U5fyW5zsrcb7P8wOO+kgRt+RagMHlTwye
	zZnrn4Rgyb8zx7jNWLh+AfEiIwDDZCpbwmhETGLL/y3tx1J7zFZx+B5lYlwmIfd9nWVkuyh3mwIIJ
	ra+QjdJO7m4Bb9d2cNtMAzvTQe0jKbMX79xuFfLI1vRI9/vtQIJYpJj9EcZvUq2lDkI81feJXJPV5
	mPppvZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBkl-00000004s0V-426S;
	Mon, 16 Jun 2025 15:28:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBMw-00000004n2y-1ATy
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 15:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750086209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
	b=fNKRB3mRUQnOu5Xa63YM7n4EtfO2SFrpKTAoDAcBd3DiWXs2O8mt8ZCia1fGlCUFRNbT55
	7B33i4tFWkWZPvN29wmH6xlH4Q/JdZXXFcFJHp0PjGXrghJga2V3pHScQdBwkEWphGxPX+
	G8GoIK1fJvuEBWgNJZ2Dy+RhcCN2nAw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-lsGeX-x2NfKDTQZCLOUraA-1; Mon, 16 Jun 2025 11:03:25 -0400
X-MC-Unique: lsGeX-x2NfKDTQZCLOUraA-1
X-Mimecast-MFC-AGG-ID: lsGeX-x2NfKDTQZCLOUraA_1750086204
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so35178335e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jun 2025 08:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086204; x=1750691004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
        b=PM0dK/wmc2Tyy+gQFYNIzpC2gnE3X0uYk8WG22aKeRU9nlK81uieej95qpfTbVzFUv
         zOl9XEmrPNGWThQyTkOLXRJrfCxJctVAf7A5uFP6WSPhJhc00Kc44Ul4YTco6BEc9zAw
         535FtW673aRYsoOpxjDBR/+Mv8BgoYaJZI3HJjK9HmlEDLI5Ol8cb2cbA+FwsqIFY97X
         bbjCUmn8XNwnOfznQtjCi6+o9juY6DnGJ115qjdo2pqdmXoGq+r7NZorxSt2cV8SSoQQ
         yimBV11UBPzGAFFKMZigoHarRPC/+a0f358ldz7t1U/OzP50dPv0BuKNYCcgwk79vJ8i
         vgbA==
X-Forwarded-Encrypted: i=1; AJvYcCXM+gY49SkIQtACwRECX2WOPXxOsNGY80L47gB7hSYG4L4WjUolskNF5hHhQaH5tgdZSnqmsqoJwot3MX+ICg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmtAjWGkIolT0f+Z6zz0T4DZRqwcXyS5fRrGavwYzQV9aS+kr
	zLx0V9B75/CiT0jdzU0IsDdc6dqjjVJnD8LnGP7Bwc/evQL3U1vvOmXBzAtU30WedfgyzEUdltC
	BMKMZf2Qhej2cymH7iiDmwhd/YTDHd6HTcAF8PztViG1AIpkp9k5o5CRVpPShItiIuigDen4HcQ
	==
X-Gm-Gg: ASbGnctZGLzYwKGEkkNllchKPtBz2Gr7FhzpxQwiz64ojoY+rJhU5c27c5Dsgi66Gqc
	bt6YzDrOehc7UUdkN5UeKneVEmt3j7obyUyq/0+rooR+AJGbrj1MG+eq3NR2yUH8sBhqtpFC8mg
	T2wGpabs9KZmR5OOstTjPB/Owkho2xypO8Zd7+RJF8wbojaXx6eL7wLfTGU+pqD5j7vwvHK4Ehs
	7ZsY95k3WISy4iE1lsXo/jNKskRMXQYBicvgwldHL+29mw/LWUd8FKrYrncW4zfmys0l1l8hVR7
	yH+Q5KwqnuWbX28NW+PIQXEq3leAdgqfmSl9kqmoDJkdG5rBjx4XkQ==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80888585e9.15.1750086203972;
        Mon, 16 Jun 2025 08:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwbopF1lAROE8wS+9Rv9HcGYsH05oxJyFYV2hv8O12MmuXoDowsfWwuiEaJ3XXZOmwYHksiA==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80885955e9.15.1750086201916;
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm145748335e9.8.2025.06.16.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:03:19 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250615131129.954975-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fLO7bHMoiGeaGZTxK_XLI7UU0QG_YqnrjhlhdAN8Kxg_1750086204
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_080330_384248_EFCBE5AE 
X-CRM114-Status: GOOD (  22.32  )
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

Hello,

On 15/06/25 21:10, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The fair server mechanism, which is intended to prevent fair starvation
> when higher-priority tasks monopolize the CPU.
> Specifically, RT tasks on the runqueue may not be scheduled as expected.
> 
> [Analysis]
> ---------
> The log "sched: DL replenish lagged too much" triggered.
> 
> By memory dump of dl_server:
> --------------
>     curr = 0xFFFFFF80D6A0AC00 (
>       dl_server = 0xFFFFFF83CD5B1470(
>         dl_runtime = 0x02FAF080,
>         dl_deadline = 0x3B9ACA00,
>         dl_period = 0x3B9ACA00,
>         dl_bw = 0xCCCC,
>         dl_density = 0xCCCC,
>         runtime = 0x02FAF080,
>         deadline = 0x0000082031EB0E80,
>         flags = 0x0,
>         dl_throttled = 0x0,
>         dl_yielded = 0x0,
>         dl_non_contending = 0x0,
>         dl_overrun = 0x0,
>         dl_server = 0x1,
>         dl_server_active = 0x1,
>         dl_defer = 0x1,
>         dl_defer_armed = 0x0,
>         dl_defer_running = 0x1,
>         dl_timer = (
>           node = (
>             expires = 0x000008199756E700),
>           _softexpires = 0x000008199756E700,
>           function = 0xFFFFFFDB9AF44D30 = dl_task_timer,
>           base = 0xFFFFFF83CD5A12C0,
>           state = 0x0,
>           is_rel = 0x0,
>           is_soft = 0x0,
>     clock_update_flags = 0x4,
>     clock = 0x000008204A496900,
> 
> - The timer expiration time (rq->curr->dl_server->dl_timer->expires)
>   is already in the past, indicating the timer has expired.
> - The timer state (rq->curr->dl_server->dl_timer->state) is 0.
> 
> [Suspected Root Cause]
> --------------------
> The relevant code flow in the throttle path of
> update_curr_dl_se() as follows:
> 
> dequeue_dl_entity(dl_se, 0);                // the DL entity is dequeued
> 
> if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
>     if (dl_server(dl_se))                   // timer registration fails
>         enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);//enqueue immediately
>     ...
> }
> 
> The failure of `start_dl_timer` is caused by attempting to register a
> timer with an expiration time that is already in the past. When this
> situation persists, the code repeatedly re-enqueues the DL entity
> without properly replenishing or restarting the timer, resulting in RT
> task may not be scheduled as expected.
> 
> [Proposed Solution]:
> ------------------
> Instead of immediately re-enqueuing the DL entity on timer registration
> failure, this change ensures the DL entity is properly replenished and
> the timer is restarted, preventing RT potential starvation.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/deadline.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..e50cb76c961b 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1556,10 +1556,12 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
>  		}
>  
>  		if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
> -			if (dl_server(dl_se))
> -				enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> -			else
> +			if (dl_server(dl_se)) {
> +				replenish_dl_new_period(dl_se, rq);
> +				start_dl_timer(dl_se);

But, even today, enqueue_dl_entity() is called with ENQUEUE_REPLENISH
flag, so I don't get why you say 're-enqueues the DL entity without
properly replenishing'.

Also, why restarting the replenishing timer right after having
replenished the entity?

Thanks,
Juri


