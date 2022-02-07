Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F852C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 10:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3XTpQ4DKmXwfkJeIlx+08q4W0kU+L53+jxlNpKMJyI=; b=1BsIGix82ia0yt
	FJQ2goOODSQWjJc0FBiwo+v2alwOk99uLroXEAp5kN+NJA6oo4GqAFZd8p+Ha2g/jtDOtTKxlgC8m
	KbQKXqfZMXqlOZXEX3AT7VQRZb6Wut7vXAGB4MBHSIBuVOZcj6a//jMrRjdELfzqnymAaMJiX/gzc
	+ekH6YQI+55hFWifSHF6P/nhg0mZ0isbl1K8LxeYoaYrGJLVCsOVh+qqxVdypCFCC+SKMRSjxbfWO
	LqK+KlFNWySVtMG38fQnQ84pK/ZpJVw7PNW1mZre8w8KjKvri85nkClgv9ZHN3zT14ZyceN2oLega
	SqVvGT/BsMbmMwJ7VBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH1Zw-009skg-K9; Mon, 07 Feb 2022 10:49:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH1Zl-009si2-95; Mon, 07 Feb 2022 10:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zFFfeACZv+Zz/Z1pAOvHul7A7nmnAr1YmT299E07rqo=; b=qaHAIEhcQUKF0ItqKyJo6puHQ3
 VMYiiC1DLx2H4xdjksPDGcndvBmobNu0wdngb8ZtQB7h5QT9VN+9pcdjK6TOS2tvhC4TRLhaa/rkw
 Wq3DEPY105JCBbLYafyumLyAG39czuljCAyn49KgyB2Nwhb7+gENr7NSAvc7k9s+rNWFG2zX/Rz5U
 aTWPJn/WJCfEv98o84IOHJnHbdY7HYAM9IwdsbSKBNEnmXES3n6qNRCEn5YCAvt+bmFOGqTARDxN4
 UU8ks08k9Bxxvn5JaD/ohJasSzIGSIzemM5feW5E0hpjhirTsXj9BeH/r7730n/s177DKW5BLa5fh
 /MZ8IfKA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH1Zf-000KcB-0y; Mon, 07 Feb 2022 10:48:47 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id B8545986235; Mon,  7 Feb 2022 11:48:45 +0100 (CET)
Date: Mon, 7 Feb 2022 11:48:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: YT Chang <yt.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH 1/1] sched: Add update_rq_clock() in sched_rt_rq_enqueue()
Message-ID: <20220207104845.GD23216@worktop.programming.kicks-ass.net>
References: <20211224012239.4694-1-yt.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211224012239.4694-1-yt.chang@mediatek.com>
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

On Fri, Dec 24, 2021 at 09:22:39AM +0800, YT Chang wrote:
> Add update_rq_clock() in sched_rt_rq_enqueue() to
> prevent the warning "rq->clock_update_flags < RQCF_ACT_SKIP"
> when call rq_clock() in cpufreq_update_util().
> 
> sched_rt_rq_enqueue ->
>    enqueue_top_rt_rq ->
>       cpufreq_update_util ->
>          rq_clock ->
>             assert_clock_updated
> 
> Signed-off-by: YT Chang <yt.chang@mediatek.com>
> Change-Id: I4fba5a561b7064aafa991d7f1a34431607779cb4

Change-Id does not belong in kernel patches..

> ---
>  kernel/sched/rt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index b48baaba2fc2..faf1a68c0723 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -539,6 +539,7 @@ static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
>  
>  	int cpu = cpu_of(rq);
>  
> +	update_rq_clock(rq);

This isn't right I think; there's at least one caller of this function
that already did that. A double clock update is also wrong. Each path
should have just one.

>  	rt_se = rt_rq->tg->rt_se[cpu];
>  
>  	if (rt_rq->rt_nr_running) {
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
