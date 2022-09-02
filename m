Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D8C6FA81
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 03:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2xnOcGvBy3Njjbz6b+gGaRXL1W5YwhL4H3CLYHZZnE=; b=hzxCN/Dm5gv72+b35CjU4/ztVy
	rrsHDEsATqJHzKmoXKLbHuqhjNRGtTprp197D03Fk5x+KFfUfB7QXYysaLdrYwFd194acPIkEusNO
	YfekMkVTfFP7aKfwgo/hLw5ql/zMddvMBycsB1Xb14fv5i1Iy03JtV1odRmQF4Huf6tlqr5by/Mri
	8rqJnoj5+pgMpxQjtIBPNvj4kdh22g7FMx7SELHPFEYOctvBmKnCFgW/Qk/XIjemxELp3+D5ENWWc
	QeC9eYN/okQXBnQOjNvsSDPjMzYAFeHm+uWR7QcWUA7gg781406CIX5PlJqiGAmKuCf0mV/VEHDjL
	u9Oo0R4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxO5-00HMOX-Kl; Fri, 02 Sep 2022 03:30:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxO2-00HML4-VA; Fri, 02 Sep 2022 03:30:32 +0000
X-UUID: e366445ba6ae4f6ab786cef997444d12-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g2xnOcGvBy3Njjbz6b+gGaRXL1W5YwhL4H3CLYHZZnE=;
	b=oEkwR3Wi64K/9jiLcuqJ7nvDXg/FHOLCwD5JOqc8liQ/42rT9A5vcp5U9RVLpT46K4BZNOLgZMgkUKL6pyOFbps9h9VKvNPyuEBIrYY0I8desglfWXl98oUWXPxRldtH/kpfbwQi1DwQ24CGQZxbMsUQD3j7lTrq5PN+1S+kOho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:be8397f6-bfc3-4f0b-951f-5a98ad7e8865,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:63825b56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e366445ba6ae4f6ab786cef997444d12-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1878482296; Thu, 01 Sep 2022 20:15:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 2 Sep 2022 11:15:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 2 Sep 2022 11:15:22 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: <major.chen@samsung.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <wsd_upstream@mediatek.com>, <hongfei.tang@samsung.com>, kuyo chang
	<kuyo.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] sched/debug: fix dentry leak in update_sched_domain_debugfs
Date: Fri, 2 Sep 2022 11:15:15 +0800
Message-ID: <20220902031518.1116-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_203031_023189_8EBADE0E 
X-CRM114-Status: GOOD (  12.83  )
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

From: kuyo chang <kuyo.chang@mediatek.com>

[Syndrome]
Lowmemorykiller triggered while doing hotplug stress test as below cmd:
echo [0/1] > /sys/devices/system/cpu/cpu${index}/online

Rootcause:
Call trace of the slab owner & usage as below after hotplug stress
test(4hr).
There exists dentry leak at update_sched_domain_debugfs.

Total size : 322000KB
<prep_new_page+44>:
<get_page_from_freelist+672>:
<__alloc_pages+304>:
<allocate_slab+144>:
<___slab_alloc+404>:
<__slab_alloc+60>:
<kmem_cache_alloc+1204>:
<alloc_inode+100>:
<new_inode+40>:
<__debugfs_create_file+172>:
<update_sched_domain_debugfs+824>:
<partition_sched_domains_locked+1292>:
<rebuild_sched_domains_locked+576>:
<cpuset_hotplug_workfn+1052>:
<process_one_work+584>:
<worker_thread+1008>:

[Solution]
Provided by Major Chen <major.chen@samsung.com> as below link.
https://lore.kernel.org/lkml/20220711030341epcms5p173848e98b13c09eb2fcdf2fd7287526a@epcms5p1/
update_sched_domain_debugfs() uses debugfs_lookup() to find wanted dentry(which has
been created by debugfs_create_dir() before), but not call dput() to return this dentry
back. This result in dentry leak even debugfs_remove() is called.

[Test result]
Using below commands to check inode_cache & dentry leak.
cat /proc/slabinfo | grep -w inode_cache
cat /proc/slabinfo | grep -w dentry

With the patch, the inode_cache & dentry stays consistent
so the lowmemorykiller will not triggered anymore.

Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to debugfs")

Signed-off-by: Major Chen <major.chen@samsung.com>
Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
Tested-by: kuyo chang <kuyo.chang@mediatek.com>

---
 kernel/sched/debug.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index bb3d63bdf4ae..4ffea2dc01da 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -412,11 +412,14 @@ void update_sched_domain_debugfs(void)
 
 	for_each_cpu(cpu, sd_sysctl_cpus) {
 		struct sched_domain *sd;
-		struct dentry *d_cpu;
+		struct dentry *d_cpu, *d_lookup;
 		char buf[32];
 
 		snprintf(buf, sizeof(buf), "cpu%d", cpu);
-		debugfs_remove(debugfs_lookup(buf, sd_dentry));
+		d_lookup = debugfs_lookup(buf, sd_dentry);
+		debugfs_remove(d_lookup);
+		if (!IS_ERR_OR_NULL(d_lookup))
+			dput(d_lookup);
 		d_cpu = debugfs_create_dir(buf, sd_dentry);
 
 		i = 0;
-- 
2.18.0


