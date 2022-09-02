Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8EAECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ReC0F1iNzbQdbxAWNjzHcPRtal8dxDiiw1th7HYZlQ=; b=M/nWU6c2MRowcBQjeZylZfXvbc
	n3xYkWwPTpnIlmTHt1OVwebkPaD0sdUtBuHMetcd1SZq2I233Vgnzwh+VrtTU4pl4IgA0OYr3vxYu
	HvKsiNaaOHleLDAy37vbZ9ViDQUDE1xn1CNeGUxMt/Y4OV1h/LhOHimnVi76y1BR9+8ZOcRCMWQYY
	djKQGhb3hjseR5mIzOAqf8rd2rUxQWPphbJC0G4SSOSx0ATiljeE7KHis9dUKBl72v71V+/oczWOD
	TNCoLwIEqtXRgVTFIQWpGzkjTk+VFFeuocjO3pyT4/lRFL+0QoAw4lmwALrttoKUqKLZk5AjTYcaB
	xWN8ZspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2im-002NHj-UH; Fri, 02 Sep 2022 09:12:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2iU-002N7V-6B; Fri, 02 Sep 2022 09:12:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8748161721;
	Fri,  2 Sep 2022 09:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B3AC433D6;
	Fri,  2 Sep 2022 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662109917;
	bh=iqF5qVkaDvUMb/LbRgoSyAtRf8NkCHROfMrBIjCBInk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZJBu1h2UvTxCavaVjGeY+3gBKuIXcS57/1TW0o/bVZN8kaueW1d8sRT1g+c+fFiN
	 Rfz5LzN4LORZ7EFsG40qSTjgXWymUSirnVHOclKvnqz8GO7uNTiaUcm7IqDhLWFKZ/
	 Iz2sWAaSHeM/wg385vQUGwMeZXzZZLfuTD1hmyfs=
Date: Fri, 2 Sep 2022 11:11:54 +0200
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
Message-ID: <YxHI2sRgF2gqYcHk@kroah.com>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
 <YxGUBzp9C7kcNgps@kroah.com>
 <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
 <YxGpp/+lWSzwpVLZ@kroah.com>
 <f14e71182ebf1520aeede06afb44af49ec6128a0.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f14e71182ebf1520aeede06afb44af49ec6128a0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_021158_353865_83F9357F 
X-CRM114-Status: GOOD (  54.05  )
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

On Fri, Sep 02, 2022 at 03:36:08PM +0800, Kuyo Chang wrote:
> On Fri, 2022-09-02 at 08:58 +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 02, 2022 at 02:40:59PM +0800, Kuyo Chang wrote:
> > > On Fri, 2022-09-02 at 07:26 +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Sep 02, 2022 at 11:15:15AM +0800, Kuyo Chang wrote:
> > > > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > > > 
> > > > > [Syndrome]
> > > > > Lowmemorykiller triggered while doing hotplug stress test as
> > > > > below
> > > > > cmd:
> > > > > echo [0/1] > /sys/devices/system/cpu/cpu${index}/online
> > > > > 
> > > > > Rootcause:
> > > > > Call trace of the slab owner & usage as below after hotplug
> > > > > stress
> > > > > test(4hr).
> > > > > There exists dentry leak at update_sched_domain_debugfs.
> > > > > 
> > > > > Total size : 322000KB
> > > > > <prep_new_page+44>:
> > > > > <get_page_from_freelist+672>:
> > > > > <__alloc_pages+304>:
> > > > > <allocate_slab+144>:
> > > > > <___slab_alloc+404>:
> > > > > <__slab_alloc+60>:
> > > > > <kmem_cache_alloc+1204>:
> > > > > <alloc_inode+100>:
> > > > > <new_inode+40>:
> > > > > <__debugfs_create_file+172>:
> > > > > <update_sched_domain_debugfs+824>:
> > > > > <partition_sched_domains_locked+1292>:
> > > > > <rebuild_sched_domains_locked+576>:
> > > > > <cpuset_hotplug_workfn+1052>:
> > > > > <process_one_work+584>:
> > > > > <worker_thread+1008>:
> > > > > 
> > > > > [Solution]
> > > > > Provided by Major Chen <major.chen@samsung.com> as below link.
> > > > > 
> > > 
> > > 
> https://lore.kernel.org/lkml/20220711030341epcms5p173848e98b13c09eb2fcdf2fd7287526a@epcms5p1/
> > > > > update_sched_domain_debugfs() uses debugfs_lookup() to find
> > > > > wanted
> > > > > dentry(which has
> > > > > been created by debugfs_create_dir() before), but not call
> > > > > dput()
> > > > > to return this dentry
> > > > > back. This result in dentry leak even debugfs_remove() is
> > > > > called.
> > > > > 
> > > > > [Test result]
> > > > > Using below commands to check inode_cache & dentry leak.
> > > > > cat /proc/slabinfo | grep -w inode_cache
> > > > > cat /proc/slabinfo | grep -w dentry
> > > > > 
> > > > > With the patch, the inode_cache & dentry stays consistent
> > > > > so the lowmemorykiller will not triggered anymore.
> > > > > 
> > > > > Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to
> > > > > debugfs")
> > > > > 
> > > > > Signed-off-by: Major Chen <major.chen@samsung.com>
> > > > > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > > > > Tested-by: kuyo chang <kuyo.chang@mediatek.com>
> > > > > 
> > > > > ---
> > > > >  kernel/sched/debug.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> > > > > index bb3d63bdf4ae..4ffea2dc01da 100644
> > > > > --- a/kernel/sched/debug.c
> > > > > +++ b/kernel/sched/debug.c
> > > > > @@ -412,11 +412,14 @@ void update_sched_domain_debugfs(void)
> > > > >  
> > > > >  	for_each_cpu(cpu, sd_sysctl_cpus) {
> > > > >  		struct sched_domain *sd;
> > > > > -		struct dentry *d_cpu;
> > > > > +		struct dentry *d_cpu, *d_lookup;
> > > > >  		char buf[32];
> > > > >  
> > > > >  		snprintf(buf, sizeof(buf), "cpu%d", cpu);
> > > > > -		debugfs_remove(debugfs_lookup(buf, sd_dentry));
> > > > > +		d_lookup = debugfs_lookup(buf, sd_dentry);
> > > > > +		debugfs_remove(d_lookup);
> > > > > +		if (!IS_ERR_OR_NULL(d_lookup))
> > > > > +			dput(d_lookup);
> > > > 
> > > > That's odd, and means that something else is removing this file
> > > > right
> > > > after we looked it up?  Is there a missing lock here that should
> > > > be
> > > > used
> > > > instead?
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > 
> > > While doing cpu hotlug, the cpu_active_mask is changed, 
> > > so it need to update_sched_domain_debugfs.
> > > 
> > > The original design is to recreate sd_dentry, so it doing
> > > debugfs_remove and then debugfs_create_dir.
> > > However, by debugfs_lookup function usage.
> > > The returned dentry must be passed to dput() when it is no longer
> > > needed to avoid dentry leak.
> > 
> > Eeeek, nice find!  I've been adding this pattern:
> > 	debugfs_remove(debugfs_lookup(...));
> > all over the place, and as you point out, that's wrong!
> > 
> > It's as if I didn't even read the documentation I wrote.
> > 
> > {sigh}
> > 
> > Ok, as this is going to be a very common pattern, how about we
> > create:
> > 	debugfs_lookup_and_remove()
> > function that does the above logic all in one place and then we don't
> > have to put that logic everywhere in the kernel.  My goal is for
> > users
> > of debugfs to never have to worry about anything about 'struct
> > dentry'
> > at all, and I really failed that goal here in a major way.
> > 
> > I can work on that this afternoon after I get some other things done,
> > unless you want to do it now?
> > 
> > Again, very nice find, thank you for this.
> > 
> 
> Thanks for your kindly support !
> Please help to add debugfs_lookup_and_remove() and then we can use
> this api to fix this denrty leak issue.

Ok, can you test the patch below with your reproducer to see if it is
fixed or not?  If this resolves the issue, I'll split it up into the
proper set of patches and sweep the whole tree as every user of
debugfs_lookup() that I've found so far got it wrong :(

thanks again!

greg k-h

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 3dcf0b8b4e93..87ccd6280a9b 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -744,6 +744,28 @@ void debugfs_remove(struct dentry *dentry)
 }
 EXPORT_SYMBOL_GPL(debugfs_remove);
 
+/**
+ * debugfs_lookup_and_remove - lookup a directory or file and recursively remove it
+ * @name: a pointer to a string containing the name of the item to look up.
+ * @parent: a pointer to the parent dentry of the item.
+ *
+ * This is the equlivant of doing something like
+ * debugfs_remove(debugfs_lookup(..)) but with the proper reference counting
+ * handled for the directory being looked up.
+ */
+void debugfs_lookup_and_remove(const char *name, struct dentry *parent)
+{
+	struct dentry *dentry;
+
+	dentry = debugfs_lookup(name, parent);
+	if (IS_ERR_OR_NULL(dentry))
+		return;
+
+	debugfs_remove(dentry);
+	dput(dentry);
+}
+EXPORT_SYMBOL_GPL(debugfs_lookup_and_remove);
+
 /**
  * debugfs_rename - rename a file/directory in the debugfs filesystem
  * @old_dir: a pointer to the parent dentry for the renamed object. This
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index c869f1e73d75..f60674692d36 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -91,6 +91,8 @@ struct dentry *debugfs_create_automount(const char *name,
 void debugfs_remove(struct dentry *dentry);
 #define debugfs_remove_recursive debugfs_remove
 
+void debugfs_lookup_and_remove(const char *name, struct dentry *parent);
+
 const struct file_operations *debugfs_real_fops(const struct file *filp);
 
 int debugfs_file_get(struct dentry *dentry);
@@ -225,6 +227,10 @@ static inline void debugfs_remove(struct dentry *dentry)
 static inline void debugfs_remove_recursive(struct dentry *dentry)
 { }
 
+static inline void debugfs_lookup_and_remove(const char *name,
+					     struct dentry *parent)
+{ }
+
 const struct file_operations *debugfs_real_fops(const struct file *filp);
 
 static inline int debugfs_file_get(struct dentry *dentry)
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index bb3d63bdf4ae..667876da8382 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -416,7 +416,7 @@ void update_sched_domain_debugfs(void)
 		char buf[32];
 
 		snprintf(buf, sizeof(buf), "cpu%d", cpu);
-		debugfs_remove(debugfs_lookup(buf, sd_dentry));
+		debugfs_lookup_and_remove(buf, sd_dentry);
 		d_cpu = debugfs_create_dir(buf, sd_dentry);
 
 		i = 0;

