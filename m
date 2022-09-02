Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49572ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAXy2U2Luui51GZrowzJgqbYOip4mu91cTwgYzNeje8=; b=rM1tPSkqYc1U7IsiyOhE+yyaKe
	jo+6Vp5l6yMvMdHZBmeVknJHutt3hD/w1C+C0yZP8FTrtAGXnWsR2TVoEbjhlaaVMvOxbipovGR6d
	U7iXav12e230LnOCWF47CICCh5rMXGKGrAFkaeoQLXF2l2G8Q0Wejcj+2ztzaHMvg8eesw8r4OkQj
	J+RpEF8+IAYJTiY4JIa91jnmoXdKx/RdCoBtOshZpVjkuuEBfM9aobPJmuS121v9co7OCcCs/jmUm
	4lLl0RD08k5OZHic7ziU4ies+2//hgZA2CAimcq0KPHwtPoIpB4ijuYhx3LDJOXKR/rsUP2t9mSz0
	ozR6GTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0dt-0014Lq-NY; Fri, 02 Sep 2022 06:59:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0dg-0014Ez-3g; Fri, 02 Sep 2022 06:58:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DABB62044;
	Fri,  2 Sep 2022 06:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7ECC433C1;
	Fri,  2 Sep 2022 06:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662101930;
	bh=EbCrk796rcIWl6oYp0x0apSH+wARfAzmCrDmoWXP5vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioISn01lAH47kxusb/wvXPpGv1iIMIBgGSM800yecTNVRCzTGFRW0A+w0m+Kd0XsQ
	 aUIj/OC88nHVDLfUAg35MMzl2ftwsCfYhJYUb8yUNdDbrKvQ0l//HvKqMdbdm9IZeL
	 bUZbHMfMuWADGj372JYLEo4YnDG0BrDXf1J7GJwY=
Date: Fri, 2 Sep 2022 08:58:47 +0200
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
Message-ID: <YxGpp/+lWSzwpVLZ@kroah.com>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
 <YxGUBzp9C7kcNgps@kroah.com>
 <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235852_250615_3FE8686A 
X-CRM114-Status: GOOD (  36.78  )
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

On Fri, Sep 02, 2022 at 02:40:59PM +0800, Kuyo Chang wrote:
> On Fri, 2022-09-02 at 07:26 +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 02, 2022 at 11:15:15AM +0800, Kuyo Chang wrote:
> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > [Syndrome]
> > > Lowmemorykiller triggered while doing hotplug stress test as below
> > > cmd:
> > > echo [0/1] > /sys/devices/system/cpu/cpu${index}/online
> > > 
> > > Rootcause:
> > > Call trace of the slab owner & usage as below after hotplug stress
> > > test(4hr).
> > > There exists dentry leak at update_sched_domain_debugfs.
> > > 
> > > Total size : 322000KB
> > > <prep_new_page+44>:
> > > <get_page_from_freelist+672>:
> > > <__alloc_pages+304>:
> > > <allocate_slab+144>:
> > > <___slab_alloc+404>:
> > > <__slab_alloc+60>:
> > > <kmem_cache_alloc+1204>:
> > > <alloc_inode+100>:
> > > <new_inode+40>:
> > > <__debugfs_create_file+172>:
> > > <update_sched_domain_debugfs+824>:
> > > <partition_sched_domains_locked+1292>:
> > > <rebuild_sched_domains_locked+576>:
> > > <cpuset_hotplug_workfn+1052>:
> > > <process_one_work+584>:
> > > <worker_thread+1008>:
> > > 
> > > [Solution]
> > > Provided by Major Chen <major.chen@samsung.com> as below link.
> > > 
> https://lore.kernel.org/lkml/20220711030341epcms5p173848e98b13c09eb2fcdf2fd7287526a@epcms5p1/
> > > update_sched_domain_debugfs() uses debugfs_lookup() to find wanted
> > > dentry(which has
> > > been created by debugfs_create_dir() before), but not call dput()
> > > to return this dentry
> > > back. This result in dentry leak even debugfs_remove() is called.
> > > 
> > > [Test result]
> > > Using below commands to check inode_cache & dentry leak.
> > > cat /proc/slabinfo | grep -w inode_cache
> > > cat /proc/slabinfo | grep -w dentry
> > > 
> > > With the patch, the inode_cache & dentry stays consistent
> > > so the lowmemorykiller will not triggered anymore.
> > > 
> > > Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to debugfs")
> > > 
> > > Signed-off-by: Major Chen <major.chen@samsung.com>
> > > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > > Tested-by: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > ---
> > >  kernel/sched/debug.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> > > index bb3d63bdf4ae..4ffea2dc01da 100644
> > > --- a/kernel/sched/debug.c
> > > +++ b/kernel/sched/debug.c
> > > @@ -412,11 +412,14 @@ void update_sched_domain_debugfs(void)
> > >  
> > >  	for_each_cpu(cpu, sd_sysctl_cpus) {
> > >  		struct sched_domain *sd;
> > > -		struct dentry *d_cpu;
> > > +		struct dentry *d_cpu, *d_lookup;
> > >  		char buf[32];
> > >  
> > >  		snprintf(buf, sizeof(buf), "cpu%d", cpu);
> > > -		debugfs_remove(debugfs_lookup(buf, sd_dentry));
> > > +		d_lookup = debugfs_lookup(buf, sd_dentry);
> > > +		debugfs_remove(d_lookup);
> > > +		if (!IS_ERR_OR_NULL(d_lookup))
> > > +			dput(d_lookup);
> > 
> > That's odd, and means that something else is removing this file right
> > after we looked it up?  Is there a missing lock here that should be
> > used
> > instead?
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> While doing cpu hotlug, the cpu_active_mask is changed, 
> so it need to update_sched_domain_debugfs.
> 
> The original design is to recreate sd_dentry, so it doing
> debugfs_remove and then debugfs_create_dir.
> However, by debugfs_lookup function usage.
> The returned dentry must be passed to dput() when it is no longer
> needed to avoid dentry leak.

Eeeek, nice find!  I've been adding this pattern:
	debugfs_remove(debugfs_lookup(...));
all over the place, and as you point out, that's wrong!

It's as if I didn't even read the documentation I wrote.

{sigh}

Ok, as this is going to be a very common pattern, how about we create:
	debugfs_lookup_and_remove()
function that does the above logic all in one place and then we don't
have to put that logic everywhere in the kernel.  My goal is for users
of debugfs to never have to worry about anything about 'struct dentry'
at all, and I really failed that goal here in a major way.

I can work on that this afternoon after I get some other things done,
unless you want to do it now?

Again, very nice find, thank you for this.

greg k-h

