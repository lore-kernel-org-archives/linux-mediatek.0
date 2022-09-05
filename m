Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FABECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiw6emVZ9qEv2Oxp5XFT5tubk1S02V4+Nexv28K6seQ=; b=fhkL8hWxznVrFnF7mr0P5J98a0
	GfcHbaBON2CENR/5fUu4XBP9WnuvYgrZ+ClK5SY3s/AMkvmY0GVjP61eO8zZFzLzfzcn9/6ZJQbe/
	EPghIf9+o670/IP5Gt3L4+4FnfuSzHXEHz6SF/bARsU4mAB8f4NiK6oV50aklGCZBGuiFP/PIz7Nd
	EPFJIoxyeabtGRKvmy0UQe1uEsa6z7uWb60OA3X8zijTDEg/n8LuOkSmdMtCicBUPcZZvu2zPB8ww
	oBZVWGJiv3LtWW5AqSkYbLg6en0Ui3spVRdEVL32ZrrmvNVYOQGn324ECIYSzYit0OH418QWCHHr4
	nxIma9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8y4-00HHwq-3l; Mon, 05 Sep 2022 10:04:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7Nx-00EY03-Ck; Mon, 05 Sep 2022 08:23:27 +0000
X-UUID: c0240087f03640289e8463fa0f127b90-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eiw6emVZ9qEv2Oxp5XFT5tubk1S02V4+Nexv28K6seQ=;
	b=CRMvp08IkG+QDk0zIRTijQVtIm7RXRdTBTP/cokRgKpkH1dlImWUc2iKuvoV7dRbR4m5CPkwIvW+pCaVHKk4HBPA0tnOi4lFazerfQwq2IOmEwz0oRwHKHUOWB9HLYHLA2SeD4CDYYnXVDhn5+gkB5qdZnsDFysXxOQsYKWtfRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:36e5b72f-692e-4613-971e-349244cf4733,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:2130b4d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c0240087f03640289e8463fa0f127b90-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1756204600; Mon, 05 Sep 2022 01:23:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Sep 2022 16:22:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Sep 2022 16:22:29 +0800
Message-ID: <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>, Peter Zijlstra
	<peterz@infradead.org>, Valentin Schneider <vschneid@redhat.com>, Tejun Heo
	<tj@kernel.org>
CC: <wsd_upstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Jonathan.JMChen@mediatek.com>, "chris.redpath@arm.com"
	<chris.redpath@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	"Vincent Donnefort" <vdonnefort@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, "Steven Rostedt" <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Christian Brauner
	<brauner@kernel.org>, <cgroups@vger.kernel.org>, <lixiong.liu@mediatek.com>,
	<wenju.xu@mediatek.com>
Date: Mon, 5 Sep 2022 16:22:29 +0800
In-Reply-To: <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
	 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_012313_685887_1A04CA8E 
X-CRM114-Status: GOOD (  25.92  )
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

Hi, Mukesh



https://lore.kernel.org/lkml/YvrWaml3F+x9Dk+T@slm.duckdns.org/ is for
fix cgroup_threadgroup_rwsem <-> cpus_read_lock() deadlock.
But this issue is cgroup_threadgroup_rwsem <-> cpuset_rwsem deadlock.

I think they are not same issue.
Do the patch is useful for this issue?



Best regards,
Jing-Ting Wu


On Mon, 2022-09-05 at 12:14 +0530, Mukesh Ojha wrote:
> This is fixed by this.
> 
> https://lore.kernel.org/lkml/YvrWaml3F+x9Dk+T@slm.duckdns.org/
> 
> -Mukesh
> 
> On 9/5/2022 8:17 AM, Jing-Ting Wu wrote:
> > Hi,
> > 
> > We meet the HANG_DETECT happened in T SW version with kernel-5.15.
> > Many tasks have been blocked for a long time.
> > 
> > 
> > Root cause:
> > migration_cpu_stop() is not complete due to
> > is_migration_disabled(p) is
> > true, complete is false and complete_all() never get executed.
> > It let other task wait the rwsem.
> > 
> > Detail:
> > system_server waiting for cgroup_threadgroup_rwsem.
> > OomAdjuster is holding the cgroup_threadgroup_rwsem and waiting for
> > cpuset_rwsem.
> > cpuset_hotplug_workfn is holding the cpuset_rwsem and waiting for
> > affine_move_task() complete.
> > affine_move_task() waiting for migration_cpu_stop() complete.
> > 
> > The backtrace of system_server:
> > __switch_to
> > __schedule
> > schedule
> > percpu_rwsem_wait
> > __percpu_down_read
> > cgroup_css_set_fork => wait for cgroup_threadgroup_rwsem
> > cgroup_can_fork
> > copy_process
> > kernel_clone
> > 
> > The backtrace of OomAdjuster:
> > __switch_to
> > __schedule
> > schedule
> > percpu_rwsem_wait
> > percpu_down_write
> > cpuset_can_attach => wait for cpuset_rwsem
> > cgroup_migrate_execute
> > cgroup_attach_task
> > __cgroup1_procs_write => hold cgroup_threadgroup_rwsem
> > cgroup1_procs_write
> > cgroup_file_write
> > kernfs_fop_write_iter
> > vfs_write
> > ksys_write
> > 
> > The backtrace of cpuset_hotplug_workfn:
> > __switch_to
> > __schedule
> > schedule
> > schedule_timeout
> > wait_for_common
> > affine_move_task => wait for complete
> > __set_cpus_allowed_ptr_locked
> > update_tasks_cpumask
> > cpuset_hotplug_update_tasks => hold cpuset_rwsem
> > cpuset_hotplug_workfn
> > process_one_work
> > worker_thread
> > kthread
> > 
> > 
> > In affine_move_task() will call migration_cpu_stop() and wait for
> > it
> > complete.
> > In normal case, if migration_cpu_stop() complete it will inform
> > everyone that he is done.
> > But there is an exception case that will not notify.
> > If is_migration_disabled(p) is true and complete will always is
> > false,
> > then complete_all() never get executed.
> > 
> > static int migration_cpu_stop(void *data)
> > {
> > ...
> >      bool complete = false;
> > ...
> > 
> >      if (task_rq(p) == rq) {
> >          if (is_migration_disabled(p))
> >                goto out; => is_migration_disabled(p) = true,
> >                             so complete = false.
> >              ...
> >          }
> > ...
> > 
> > out:
> > ...
> >      if (complete) => complete = false,
> >                       so complete_all() never get executed.
> >          complete_all(&pending->done);
> > 
> >          return 0;
> > }
> > 
> > 
> > Review the code, we found that there are many places can change
> > is_migration_disabled() value.
> > (such as: __rt_spin_lock(), rt_read_lock(), rt_write_lock(), ...)
> > 
> > Do you have any suggestion for this issue?
> > Thank you.
> > 
> > 
> > 
> > 
> > Best regards,
> > Jing-Ting Wu
> > 
> > 


