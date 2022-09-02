Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E41FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 05:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/sA4won21IS+GEe9djBu/7xJn+6c9qMwyzkucRpoBg=; b=l9jbbBCxJLRz9mCkSsjQF8EiE8
	WzZwUYWZJrD8A/oeF0ha8W3qhFOMVT1hLvfZYC+SgT8tNs33CEnB0rLnx8ECbwKzu/T+2nNPdE3wK
	bNIHRsNSXe/7g95WkX4KHOQRp8XKcPAkGw4QiPa6PRtcKgLD766NG5lIs6MMLj7Ivd4wPcAB5e8EB
	RcucCALYv9rtUvTjTRZUlYGxgwpE3pRG42+GQKTFVXXL3CxNWwTEcbAxLx9tyE0nBLcGRn/OjLse0
	qK9d0wl87mn031ZEpk1O2pKuxn8DQGHXyhYa184EkhA2ZwGJvi6lo1LMThLGK8II78vA1aNCyuhXn
	TFqXfFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTzCZ-000Vjm-U9; Fri, 02 Sep 2022 05:26:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTzCP-000Vec-2S; Fri, 02 Sep 2022 05:26:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBD9DB829B0;
	Fri,  2 Sep 2022 05:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAAAC433C1;
	Fri,  2 Sep 2022 05:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662096393;
	bh=kCs5hcyaQYvKEehl1r3IG5R/zbdM0jlFTO/QONZfXSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQpjnAIV/bYvfDkZKk+HQc+Tevna0RhemKsyrgP11ix0XS3m4adpMFBZJm251cABE
	 2xO4NRVAxzMaIvY7DW5WRBCBBA2N0QU5mhahRVc//pvf4joAk1gg7kMpPJ6/ZM1vGF
	 pW3TIlIAg9UbQFKdpDW+HYFKcMITh6eTz5zMHUGo=
Date: Fri, 2 Sep 2022 07:26:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: major.chen@samsung.com, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, hongfei.tang@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/debug: fix dentry leak in
 update_sched_domain_debugfs
Message-ID: <YxGUBzp9C7kcNgps@kroah.com>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902031518.1116-1-kuyo.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_222637_408348_132C22F6 
X-CRM114-Status: GOOD (  23.96  )
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

On Fri, Sep 02, 2022 at 11:15:15AM +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Syndrome]
> Lowmemorykiller triggered while doing hotplug stress test as below cmd:
> echo [0/1] > /sys/devices/system/cpu/cpu${index}/online
> 
> Rootcause:
> Call trace of the slab owner & usage as below after hotplug stress
> test(4hr).
> There exists dentry leak at update_sched_domain_debugfs.
> 
> Total size : 322000KB
> <prep_new_page+44>:
> <get_page_from_freelist+672>:
> <__alloc_pages+304>:
> <allocate_slab+144>:
> <___slab_alloc+404>:
> <__slab_alloc+60>:
> <kmem_cache_alloc+1204>:
> <alloc_inode+100>:
> <new_inode+40>:
> <__debugfs_create_file+172>:
> <update_sched_domain_debugfs+824>:
> <partition_sched_domains_locked+1292>:
> <rebuild_sched_domains_locked+576>:
> <cpuset_hotplug_workfn+1052>:
> <process_one_work+584>:
> <worker_thread+1008>:
> 
> [Solution]
> Provided by Major Chen <major.chen@samsung.com> as below link.
> https://lore.kernel.org/lkml/20220711030341epcms5p173848e98b13c09eb2fcdf2fd7287526a@epcms5p1/
> update_sched_domain_debugfs() uses debugfs_lookup() to find wanted dentry(which has
> been created by debugfs_create_dir() before), but not call dput() to return this dentry
> back. This result in dentry leak even debugfs_remove() is called.
> 
> [Test result]
> Using below commands to check inode_cache & dentry leak.
> cat /proc/slabinfo | grep -w inode_cache
> cat /proc/slabinfo | grep -w dentry
> 
> With the patch, the inode_cache & dentry stays consistent
> so the lowmemorykiller will not triggered anymore.
> 
> Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to debugfs")
> 
> Signed-off-by: Major Chen <major.chen@samsung.com>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Tested-by: kuyo chang <kuyo.chang@mediatek.com>
> 
> ---
>  kernel/sched/debug.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index bb3d63bdf4ae..4ffea2dc01da 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -412,11 +412,14 @@ void update_sched_domain_debugfs(void)
>  
>  	for_each_cpu(cpu, sd_sysctl_cpus) {
>  		struct sched_domain *sd;
> -		struct dentry *d_cpu;
> +		struct dentry *d_cpu, *d_lookup;
>  		char buf[32];
>  
>  		snprintf(buf, sizeof(buf), "cpu%d", cpu);
> -		debugfs_remove(debugfs_lookup(buf, sd_dentry));
> +		d_lookup = debugfs_lookup(buf, sd_dentry);
> +		debugfs_remove(d_lookup);
> +		if (!IS_ERR_OR_NULL(d_lookup))
> +			dput(d_lookup);

That's odd, and means that something else is removing this file right
after we looked it up?  Is there a missing lock here that should be used
instead?

thanks,

greg k-h

