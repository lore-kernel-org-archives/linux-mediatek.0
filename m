Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD66FC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 22:04:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81277613C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 22:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81277613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPd/ybcQLtV8dFuRxLfRTER3YYuAP4ipgPajyBv1PTA=; b=zxz6DwdA/8zwma
	LDtwIkAA84T933D2zRHixVcmb7U29weZ/Y7SWMK0NylWLdMOnTD8HYFXHMrF/4XHX4jou99uvWZdb
	yrTPxTxvsFKIf3qxTeAku63iyydkJrg5pFrR+DL6m2XvSZV+EqT4ywrZXM4wz/y5VHBv/gTXN+mPa
	LGlEt7eUgVCUzZzACmM/mjEGqTNnA8GoZJmRhNiRQxxw8WrUI/GmXzr4JrSa0pUIHzlRrdh0IFQnb
	EhHluXNmwdB/FNo/SY00ZO49RsMuII+nXFImAnOaNVEdcZXUPkCJJ9YPVCwP+ri+7qBm8Ry/seHnD
	16IYkclLs11uOJ9zZ/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyiJY-00FLdu-RJ; Wed, 30 Jun 2021 22:04:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyiJV-00FLcj-VW
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 22:04:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id kt19so2779474pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1xj3mjgl+Arki73EKAV3PgrCtaGzeKnSIXIchlBxI7Q=;
 b=ZFbyjeWHwvRHjkoWH0VLZRj64VuV8dW50SYuFmOa8Qf0sCuKNptjXInz4yTTYxYvY6
 0h+molYKLDQv+Y5fbYAImma6LRY5JjOW2+wn5LdYM4hKBGiW4Bxluh8gELH0CaPrkliV
 0H+1OG7nuAPOUV56lP4jPUrHsmFQoYqdnoA2a8t8ZEPChGwzz0UoWrbDgc+SQ3diZCL/
 6UdItCFGiKSXjoiO7xzMpQcYlE1uYQfVDOz8r3QAieMCveeGdoTm/6j60uXFWo20HvL8
 qkmBuKjFzyJacM7aOTntm3tfT7sdjJqvg2JowrAq3MkgURnMneU6rQrT44Cjrzn1xrn9
 SZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1xj3mjgl+Arki73EKAV3PgrCtaGzeKnSIXIchlBxI7Q=;
 b=qw64FMNacYRTvXZXJ31WnAMBlUreGcYhUaWfWqIuY3EeRNQk2/FoNcN6T7q+zcD9nT
 +YT9iWPYWOGA2HBN69BJs4LfEfPayj4fF6PydMk3ys5TzBPcAv+sxw0X6P4aYXof5bQK
 yxNYf4X1/Zy/40sStTgaYYLhPPCptFMpcfllrG4cu+gdIRA81LryvZxP+QfBPhYwVQni
 SqhqRLgPs85GK0Q/0j78H+PC86N2hyoBgOqxzd0B5AKBStuueF01iT8RRkP1G4zYOxng
 Bfq8QjXpxIcESu6NWFjUVeGBagpTXLl1r1A1Vjgih2USxfcOEd1JyEOon6RP7dNJW0+u
 Ju4g==
X-Gm-Message-State: AOAM5320b2aQKsSuiJMdcvOprV6t0Uw39IDxB4LU6WgAvk+gEMS6jjNf
 pxcT+s9ynnp9RPnFKlDnAdxFXw==
X-Google-Smtp-Source: ABdhPJxz1ZMyumEp4ut6puBSe5M6KJD1Ou9m6zO5s120HNE35/ac+ogH5z1hWCJkO91lDKpKS2b7BQ==
X-Received: by 2002:a17:90a:db4e:: with SMTP id
 u14mr6487559pjx.120.1625090648854; 
 Wed, 30 Jun 2021 15:04:08 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:14ba])
 by smtp.gmail.com with ESMTPSA id x4sm13788221pgr.40.2021.06.30.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 15:04:08 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:04:06 -0400
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
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YNzqVh9fnpYVeP6j@cmpxchg.org>
References: <20210630205151.137001-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630205151.137001-1-surenb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_150410_080529_E70C92B4 
X-CRM114-Status: GOOD (  16.53  )
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

On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
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
> Tested-by: SH Chen <show-hong.chen@mediatek.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
