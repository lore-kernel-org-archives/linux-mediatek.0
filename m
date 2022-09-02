Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB69CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVl11gCVG+L3OOSrvd7lAtcHP1USRC9hCAiJGILnyY4=; b=TlTZkf5XaMncXjDiO7+ogrxq7F
	gqUp9MX/o3Ie8fm2gywJUCoWpL4StBGyWQUPAITD3uSa90IAW6e6d0stsQ4miHpFYmWicqJRB/8Ro
	8/5nfIMyCTZPKSaaArJdpF1GrAlNov5HWZV77/YnPFYl+6dHFuqwW6w0nicVlT4+LqcKNuGEoGAmT
	+5RaV9iParV12JJoGq4n22zlE+M8Lj8QUbn/5wx5DXiYgO8OH3j6OpMZ2ZvZ8kRUk5QUoyib8g81D
	9B23LPJlXBjYekst4CESNPxoFBZqrkDvUgdQecIGCiFUcg2do6h+96kRkXjoVU2zbbEWIiSNQHtUJ
	uwdSlKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU191-001JIq-PW; Fri, 02 Sep 2022 07:31:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU18z-001JG4-FD; Fri, 02 Sep 2022 07:31:15 +0000
X-UUID: e6a5a3aacac041eeab1442a4b9737706-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kVl11gCVG+L3OOSrvd7lAtcHP1USRC9hCAiJGILnyY4=;
	b=MN+1p2tLk/0Ss3T0gDnC/RILNKMYkfaVwRJttNmTvVJYZiGiK+1Kik89lAlQMWenADYL12ASqKFcWl7cz4E3RgITiPh4mdiiJrb/cSbAJwMFL6MLFspNznSpuDlqQ/fH+LU66mqXaAhkSdQ8WER8Z1j3YBAs0e/1ACSUPtq+Gt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3dde6d96-a36a-423e-91f2-5535b65c9d47,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:88e9ec20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e6a5a3aacac041eeab1442a4b9737706-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 376827081; Fri, 02 Sep 2022 00:31:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 14:40:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 14:40:59 +0800
Message-ID: <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
Subject: Re: [PATCH 1/1] sched/debug: fix dentry leak in
 update_sched_domain_debugfs
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <major.chen@samsung.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <wsd_upstream@mediatek.com>,
	<hongfei.tang@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 2 Sep 2022 14:40:59 +0800
In-Reply-To: <YxGUBzp9C7kcNgps@kroah.com>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
	 <YxGUBzp9C7kcNgps@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_003113_562139_BC454C0E 
X-CRM114-Status: GOOD (  28.99  )
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

On Fri, 2022-09-02 at 07:26 +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 02, 2022 at 11:15:15AM +0800, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > [Syndrome]
> > Lowmemorykiller triggered while doing hotplug stress test as below
> > cmd:
> > echo [0/1] > /sys/devices/system/cpu/cpu${index}/online
> > 
> > Rootcause:
> > Call trace of the slab owner & usage as below after hotplug stress
> > test(4hr).
> > There exists dentry leak at update_sched_domain_debugfs.
> > 
> > Total size : 322000KB
> > <prep_new_page+44>:
> > <get_page_from_freelist+672>:
> > <__alloc_pages+304>:
> > <allocate_slab+144>:
> > <___slab_alloc+404>:
> > <__slab_alloc+60>:
> > <kmem_cache_alloc+1204>:
> > <alloc_inode+100>:
> > <new_inode+40>:
> > <__debugfs_create_file+172>:
> > <update_sched_domain_debugfs+824>:
> > <partition_sched_domains_locked+1292>:
> > <rebuild_sched_domains_locked+576>:
> > <cpuset_hotplug_workfn+1052>:
> > <process_one_work+584>:
> > <worker_thread+1008>:
> > 
> > [Solution]
> > Provided by Major Chen <major.chen@samsung.com> as below link.
> > 
https://lore.kernel.org/lkml/20220711030341epcms5p173848e98b13c09eb2fcdf2fd7287526a@epcms5p1/
> > update_sched_domain_debugfs() uses debugfs_lookup() to find wanted
> > dentry(which has
> > been created by debugfs_create_dir() before), but not call dput()
> > to return this dentry
> > back. This result in dentry leak even debugfs_remove() is called.
> > 
> > [Test result]
> > Using below commands to check inode_cache & dentry leak.
> > cat /proc/slabinfo | grep -w inode_cache
> > cat /proc/slabinfo | grep -w dentry
> > 
> > With the patch, the inode_cache & dentry stays consistent
> > so the lowmemorykiller will not triggered anymore.
> > 
> > Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to debugfs")
> > 
> > Signed-off-by: Major Chen <major.chen@samsung.com>
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > Tested-by: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > ---
> >  kernel/sched/debug.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> > index bb3d63bdf4ae..4ffea2dc01da 100644
> > --- a/kernel/sched/debug.c
> > +++ b/kernel/sched/debug.c
> > @@ -412,11 +412,14 @@ void update_sched_domain_debugfs(void)
> >  
> >  	for_each_cpu(cpu, sd_sysctl_cpus) {
> >  		struct sched_domain *sd;
> > -		struct dentry *d_cpu;
> > +		struct dentry *d_cpu, *d_lookup;
> >  		char buf[32];
> >  
> >  		snprintf(buf, sizeof(buf), "cpu%d", cpu);
> > -		debugfs_remove(debugfs_lookup(buf, sd_dentry));
> > +		d_lookup = debugfs_lookup(buf, sd_dentry);
> > +		debugfs_remove(d_lookup);
> > +		if (!IS_ERR_OR_NULL(d_lookup))
> > +			dput(d_lookup);
> 
> That's odd, and means that something else is removing this file right
> after we looked it up?  Is there a missing lock here that should be
> used
> instead?
> 
> thanks,
> 
> greg k-h


While doing cpu hotlug, the cpu_active_mask is changed, 
so it need to update_sched_domain_debugfs.

The original design is to recreate sd_dentry, so it doing
debugfs_remove and then debugfs_create_dir.
However, by debugfs_lookup function usage.
The returned dentry must be passed to dput() when it is no longer
needed to avoid dentry leak.



