Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43751C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 13:39:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F2F61C98
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 13:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F2F61C98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQFN+qcXYKVYTHnwFHIrkLzfkYbCP7zbLPnTKeNzY8E=; b=bZyjgTARA0IlLj
	ztKJzL2GTnPo9BCwN8K8fCjL6ihQ2gu8606mN6QYLXYuN5SAi9uOTJS2gBFLdT87xBAllWQmnXOtK
	Hkmd92JX1FZy58BOOj/yjKIrCm5rdvWGC/F9oGiMa+xY66XGSw129qPi/4Idypcrwi6CiqAIbnRJ+
	WVij4lpoPuDQqENzMUSkehWLWpc3nAZv4CrU63YWl8CS6VNB3TSUkUzaAmV0IrDw4C/Gh3x9OQAoN
	01gr6PLtKMJXV4Ewle5Csd79AAqSJxJuGsfMQTujrJfVzs9f8EeVV+SXMYqFmhtIhOev7WmN2v3I5
	6YbcWp7msvtNJCZGUyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m17mC-00Ewgy-7g; Wed, 07 Jul 2021 13:39:44 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m17lk-00EwYp-Q8
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 13:39:20 +0000
Received: by mail-qv1-xf29.google.com with SMTP id v17so1003618qvw.12
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NBmnpGkMnjPhE8k+PU98glx9l34cNHET8f7BGXMX2R8=;
 b=NZX10fjCpzb0SE2l2VEWfJG3fn91unHKRPw9ug7EIii+bRg5jDv2gc6WWwVkDFgPGA
 tddDX2jQoE9CabfJBbgPPow7bWTbe1JlPCbILBY5abezCHNVkWhtuvvP5iHSt6vrO3Yr
 FlE9VOUug6ByDE3tJIUMgH0bZEyXc6G27Dkd8vX1zq+DzVFzdYLJijpmrlonM0s6Plr/
 gL90PV11rvVZN17wmmNwRD0cAQnMf4RAIcTDxKJse5LSBruXIM3jNWqXZ8HZmyhFq3/l
 lMEaHdBArGbkDLlV91Fjma9NI5FRfiMOXCQlrLp83d4jju0Y1b8d6z16XZr7VBylq7Bb
 3xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NBmnpGkMnjPhE8k+PU98glx9l34cNHET8f7BGXMX2R8=;
 b=CmWfcQNrZE3WHvy+mVPJdzmXqdVjdNjDo9rppronAFafNyz5RYLmnLb5fUTQh184md
 ggxlZdaeMGudYwZbGkmX1usbxEbyb/RjE2zBdgrcWGDqwuqykNsSlMXPRKOodQh0Y01o
 dJuBuZ/HH1+HB2EGjvNSuye+s3BgVAWk0EHMV7sgiu9DsbVDME4RZu3cB6e1C8D8lWi2
 TGd4dZq7yEdPcr0Lz3MstTZGSXWX4Kl9FRl+iBcx8NNnfjEj2IAvg54vqLSEX/qD/pYL
 qSoIJZqb5YNvtgl6dC+vWwmMFgk6RYbMsgNv8erUqDgK6iPpu3EVQ59Aj2M8RqpNbv7h
 Mypw==
X-Gm-Message-State: AOAM532F6m+rxeYlEvhhSacI2zUuc9k/rlKXNm74Hxpg1NMsMLH91eT5
 /7hvbDr4nLWA2M/p5RIDJbzjTQ==
X-Google-Smtp-Source: ABdhPJzFnW37eDnemMfC+7m8hErzLP3g4Ti2rxVLZO5i1u6e+mzeDOuCmpIWN7gldbHPqWgUXQ5Gvg==
X-Received: by 2002:ad4:56e4:: with SMTP id cr4mr2075482qvb.54.1625665154351; 
 Wed, 07 Jul 2021 06:39:14 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
 by smtp.gmail.com with ESMTPSA id y24sm6649032qtv.97.2021.07.07.06.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:39:13 -0700 (PDT)
Date: Wed, 7 Jul 2021 09:39:13 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, matthias.bgg@gmail.com, minchan@google.com,
 timmurray@google.com, yt.chang@mediatek.com, wenju.xu@mediatek.com,
 jonathan.jmchen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v3 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YOWugYxQ9Yfsqba2@cmpxchg.org>
References: <20210707023933.1691149-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707023933.1691149-1-surenb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_063916_984276_BD72BCCD 
X-CRM114-Status: GOOD (  21.01  )
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

This looks good to me now code wise. Just a comment on the comments:

On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
>  	return now + group->poll_min_period;
>  }
>  
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
> +	/* xchg should be called even when !force to set poll_scheduled */
> +	if (atomic_xchg(&group->poll_scheduled, 1) && !force)
>  		return;

This explains what the code does, but not why. It would be good to
explain the ordering with poll_work, here or there. But both sides
should mention each other.

> @@ -595,6 +595,28 @@ static void psi_poll_work(struct psi_group *group)
>  
>  	now = sched_clock();
>  
> +	if (now > group->polling_until) {
> +		/*
> +		 * We are either about to start or might stop polling if no
> +		 * state change was recorded. Resetting poll_scheduled leaves
> +		 * a small window for psi_group_change to sneak in and schedule
> +		 * an immegiate poll_work before we get to rescheduling. One
> +		 * potential extra wakeup at the end of the polling window
> +		 * should be negligible and polling_next_update still keeps
> +		 * updates correctly on schedule.
> +		 */
> +		atomic_set(&group->poll_scheduled, 0);
> +		/*
> +		 * Ensure that operations of clearing group->poll_scheduled and
> +		 * obtaining changed_states are not reordered.
> +		 */
> +		smp_mb();

Same here, it would be good to explain that this is ordering the
scheduler with the timer such that no events are missed. Feel free to
reuse my race diagram from the other thread - those are better at
conveying the situation than freeform text.

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
