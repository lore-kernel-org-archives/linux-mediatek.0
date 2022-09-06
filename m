Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B1DC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzCE/imuOcJ+g/sNBTROhEBFbz+670zTIBkR3Ox5lik=; b=OPZXlP4nvPXXyCcbEZLYooRrZ7
	oRb9bu/wt4qiaeZ4A7TwzG/w/NGgo3dOI9/hNyNKlLOjkLuQedbrO+k3sArYsRQmlVZTzSO7wboxh
	jCVtc9IX/+Q7UeAvdDxwOnI/fv9cAwdy2gd6ALehvhILRUWrvsguv40vJM3f7kV/TbXf/NqJ8Ox0e
	3krGX1lPb0Q9I8veuR45FmeC1TjkPlA5TkcnBvbVKs5svat/N37m7TAA4l5NlNr7r/d3EEqcTWJnu
	v32+g8thLaM5zEfRAPqZ2NYvt/dfNXg4royot61Qclyzbc9EJeXJ1aAjd58sP4w7fCDAvGyZg+gVD
	VzSGc22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfX2-00HH19-I6; Tue, 06 Sep 2022 20:50:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfWs-00HGwd-24; Tue, 06 Sep 2022 20:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GzCE/imuOcJ+g/sNBTROhEBFbz+670zTIBkR3Ox5lik=; b=Wq8JJC2I8k9ghAF1rh90IxH1g1
	6B5eeRWNA2ClA+/QuqBjIVPG+vOa3naUYz8tkXZegSrBEdZEUeeyQPxJ0M4MXqQrI5I68PDnyDsIb
	QUgqk3THblmxaJlRawNJTfv6AOvl5GQkHL++vjZRa4qhEObP5x3vbkUhKXKqmK2zhil4k31p4BUsu
	1w86Xyg88pCB74zI6M76HtjoaEcEEo5ZB6xGGgIozCgqSwYMb5IuzzkpupWExTX+bjHBZJlz3wYfp
	hvEBL908KQXs42Ckacb877wbojdN45KH60/PEhO7xReXrO6e8NWPxkfmSW/OXKYC3P2CnbKHaRWyi
	a9Ozu7dQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfWf-00AGIo-Vn; Tue, 06 Sep 2022 20:50:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1F3AD3006A4;
	Tue,  6 Sep 2022 22:50:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id CEECF203C095B; Tue,  6 Sep 2022 22:50:28 +0200 (CEST)
Date: Tue, 6 Sep 2022 22:50:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Jing-Ting Wu <jing-ting.wu@mediatek.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Valentin Schneider <vschneid@redhat.com>, wsd_upstream@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
	"chris.redpath@arm.com" <chris.redpath@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Donnefort <vdonnefort@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Christian Brauner <brauner@kernel.org>, cgroups@vger.kernel.org,
	lixiong.liu@mediatek.com, wenju.xu@mediatek.com
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Message-ID: <YxeylMvgc/wKcJqk@hirez.programming.kicks-ass.net>
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
 <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
 <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
 <02b8e7b3-941d-8bb9-cd0e-992738893ba3@redhat.com>
 <36a73401-7011-834a-7949-c65a2f66246c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36a73401-7011-834a-7949-c65a2f66246c@redhat.com>
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

On Tue, Sep 06, 2022 at 04:40:03PM -0400, Waiman Long wrote:

I've not followed the earlier stuff due to being unreadable; just
reacting to this..

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 838623b68031..5d9ea1553ec0 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2794,9 +2794,9 @@ static int __set_cpus_allowed_ptr_locked(struct
> task_struct *p,
>                 if (cpumask_equal(&p->cpus_mask, new_mask))
>                         goto out;
> 
> -               if (WARN_ON_ONCE(p == current &&
> -                                is_migration_disabled(p) &&
> -                                !cpumask_test_cpu(task_cpu(p), new_mask)))
> {
> +               if (is_migration_disabled(p) &&
> +                   !cpumask_test_cpu(task_cpu(p), new_mask)) {
> +                       WARN_ON_ONCE(p == current);
>                         ret = -EBUSY;
>                         goto out;
>                 }
> @@ -2818,7 +2818,11 @@ static int __set_cpus_allowed_ptr_locked(struct
> task_struct *p,
>         if (flags & SCA_USER)
>                 user_mask = clear_user_cpus_ptr(p);
> 
> -       ret = affine_move_task(rq, p, rf, dest_cpu, flags);
> +       if (!is_migration_disabled(p) || (flags & SCA_MIGRATE_ENABLE)) {
> +               ret = affine_move_task(rq, p, rf, dest_cpu, flags);
> +       } else {
> +               task_rq_unlock(rq, p, rf);
> +       }

This cannot be right. There might be previous set_cpus_allowed_ptr()
callers that are blocked and waiting for the task to land on a valid
CPU.


