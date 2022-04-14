Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA94C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhfCc4dF9gq4Kho9jq33F+Zuoswfq/cP9z6Ov6lDiLk=; b=h0l5lgz8uSof8o
	o0k8XrJMGZuGUiX06oNrXJfGf0bAreD5KP/FUskEJ+g1Kh3GFv3Ytkh1q3HN0uuN8GtfZchQuqfkd
	iBCClZ+BVzdvUwbQqj+veORJ48Oax6wBdcgfwkBSGiJiIkRkDgib5imLt5j8GKApPNMmP18Klqvw/
	shmk51bmp3c3pmbSc3Fazldh33BPvEMsDFZ1MPtl1CfQfShR5y8fdFoR2fJTCmLkyycmYvAccKfrz
	4CswwJIyxc+VpdKJWtqRBag0j+5iUMuh8KGR3BtVhY6e4NR1tRFfi610aCrjNQXjrbxgwihadTX60
	gRHPNL0p/Um+XxgDFB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevSn-004m51-Ov; Thu, 14 Apr 2022 09:08:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevNX-004jkj-KG; Thu, 14 Apr 2022 09:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68D0E139F;
 Thu, 14 Apr 2022 02:02:58 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 953713F5A1;
 Thu, 14 Apr 2022 02:02:55 -0700 (PDT)
Message-ID: <f7913fea-d110-9140-6dfa-72561c3fbefd@arm.com>
Date: Thu, 14 Apr 2022 11:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] [PATCH v2]sched/pelt: Refine the enqueue_load_avg
 calculate method
Content-Language: en-US
To: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220414015940.9537-1-kuyo.chang@mediatek.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220414015940.9537-1-kuyo.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_020303_763153_A963C41E 
X-CRM114-Status: GOOD (  12.11  )
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

On 14/04/2022 03:59, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>

[...]

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4bd299d67ab..159274482c4e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3829,10 +3829,12 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	se->avg.runnable_sum = se->avg.runnable_avg * divider;
>  
> -	se->avg.load_sum = divider;
> -	if (se_weight(se)) {
> +	se->avg.load_sum = se->avg.load_avg * divider;
> +	if (se_weight(se) < se->avg.load_sum) {
>  		se->avg.load_sum =
> -			div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
> +			div_u64(se->avg.load_sum, se_weight(se));

Seems that this will fit on one line now. No braces needed then.


> +	} else {
> +		se->avg.load_sum = 1;
>  	}
>  
>  	enqueue_load_avg(cfs_rq, se);

Looks like taskgroups are not affected since they get always online
with cpu.shares/weight = 1024 (cgroup v1):

cpu_cgroup_css_online() -> online_fair_sched_group() ->
attach_entity_cfs_rq() -> attach_entity_load_avg()

And reweight_entity() does not have this issue.

Tested with `qemu-system-x86_64 ... cores=64 ... -enable-kvm` and
weight=88761 for nice=0 tasks plus forcing se->avg.load_avg = 1 before
the div_u64() in attach_entity_load_avg().

Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
