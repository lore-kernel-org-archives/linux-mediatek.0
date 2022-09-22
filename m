Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748EFC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 05:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/4+Moo1S3nQcLY9jDjtjnWEDd9L/Kw2aufNRHGosCA=; b=KcghWhWC6G46zHEjRML0cpQFhl
	9A/156IL8quT3Z3eXnVOLouagi8rXCWuiTLswUHhqFIjtSQy9cebA5kJX/2DNhxr/mtwj4sRJRz1j
	jLNnvJYcPbrTA+AuvHQ3Zi8QA3nPll+h0NyKI3Gk0R0PxTFonCRal9iyoUSb1PhIFiIHU5Rz6OyqM
	gjK8yHxTri8GQZfweukn7Ek2YzMb0DTgXkTUzD6PHjsupax1AWROqQGOyNGHbrDbjHO8dIdPIRaYx
	FX9GLWdHoiwuWze/TpgXr6BdLndcih/KqkTaBUySChvKOA/81xuMLjEzKef2FvnnhNsWdB4r0G232
	rEqcjPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF7d-00DSuQ-VM; Thu, 22 Sep 2022 05:51:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF7Z-00DSrD-S5; Thu, 22 Sep 2022 05:51:40 +0000
X-UUID: 6bfc14f3880a4988b888c56b28fd7f21-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=V/4+Moo1S3nQcLY9jDjtjnWEDd9L/Kw2aufNRHGosCA=;
	b=Zo90xoefOKJHvtfEFcDTAqWFMMlSWhYdihn9YUwakBoC7hSj65xFQOnkygZWjRWo+0MaOfGzMIuyKHdO04SqksKYo04Q/Ql+ZbID6f3GpTsr00YT5rq3AD7qAoZiR0Fhzx7za2FPjitpJ6vUJJ8lOcjWUAYbbUvnHd5+FHK+MKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:04bf92d0-f89d-4265-ba74-6378ad223090,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:7d73d8e3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6bfc14f3880a4988b888c56b28fd7f21-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371594570; Wed, 21 Sep 2022 22:51:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 22 Sep 2022 13:40:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Sep 2022 13:40:47 +0800
Message-ID: <93f4ce9486ec4b856ba0f3bfe956fc9b2d3cb4cf.camel@mediatek.com>
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Hillf Danton <hdanton@sina.com>
CC: Peter Zijlstra <peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Waiman Long <longman@redhat.com>, ValentinSchneider
	<vschneid@redhat.com>, TejunHeo <tj@kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Jonathan.JMChen@mediatek.com>, "chris.redpath@arm.com"
	<chris.redpath@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	"Vincent Donnefort" <vdonnefort@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Christian Brauner <brauner@kernel.org>,
	<cgroups@vger.kernel.org>, <lixiong.liu@mediatek.com>,
	<wenju.xu@mediatek.com>
Date: Thu, 22 Sep 2022 13:40:47 +0800
In-Reply-To: <20220907000741.2496-1-hdanton@sina.com>
References: <20220907000741.2496-1-hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_225137_932229_C4938638 
X-CRM114-Status: GOOD (  20.13  )
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

On Wed, 2022-09-07 at 08:07 +0800, Hillf Danton wrote:
> On 5 Sep 2022 10:47:36 +0800 Jing-Ting Wu <jing-ting.wu@mediatek.com>
> wrote
> > 
> > We meet the HANG_DETECT happened in T SW version with kernel-5.15.
> > Many tasks have been blocked for a long time.
> > 
> > Root cause:
> > migration_cpu_stop() is not complete due to
> > is_migration_disabled(p) is
> > true, complete is false and complete_all() never get executed.
> > It let other task wait the rwsem.
> 
> See if handing task over to stopper again in case of migration
> disabled
> could survive your tests.
> 
> Hillf
> 
> --- linux-5.15/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2322,9 +2322,7 @@ static int migration_cpu_stop(void *data
>  	 * holding rq->lock, if p->on_rq == 0 it cannot get enqueued
> because
>  	 * we're holding p->pi_lock.
>  	 */
> -	if (task_rq(p) == rq) {
> -		if (is_migration_disabled(p))
> -			goto out;
> +	if (task_rq(p) == rq && !is_migration_disabled(p)) {
>  
>  		if (pending) {
>  			p->migration_pending = NULL;

Because Peter have some concern for patch by Waiman.
We add Hillf's patch to our stability test.
But there are side effects after patched.
The warning appear once < two weeks. 

Backtrace as follows:
[name:panic&]WARNING: CPU: 6 PID: 32583 at affine_move_task
pc : affine_move_task
lr : __set_cpus_allowed_ptr_locked
Call trace:
affine_move_task
__set_cpus_allowed_ptr_locked
migrate_enable
__cgroup_bpf_run_filter_skb
ip_finish_output
ip_output


The root cause is when is_migration_disabled(p) is true，the patched
version will set p->migration_pending to NULL by migration_cpu_stop.
And in affine_move_task will raise a WARN_ON_ONCE(!pending).

Kernel-5.15/kernel/sched/core.c:
static int affine_move_task(struct rq *rq, struct task_struct *p,
struct rq_flags *rf, int dest_cpu, unsigned int flags) {
...
	If (WARN_ON_ONCE(!pending)) {
 	  Task_rq_unlock(rq,p,fr);
  	  return -EINVAL;
	}
...
}

But the tasks have not been migrated to the new affinity CPU, so there
should be pending tasks to be processed, so p->migration_pending should
not be NULL.



Without patch:
When is_migration_disabled is true, then goto out and not set p-
>migration_pending to NULL.

static int migration_cpu_stop(void *data) {
...
	If (task_rq(p) == rq) {
        	     if (is_migration_disabled(p))
                	           goto out;
	}
...
}


With patch:
When is_migration_disabled is true and pending is true, goto else if
flow. Because p->cpus_ptr not updated when migrate_disable, so this
condition is always true and p->migration_pending will set to NULL.

static int migration_cpu_stop(void *data) {
...
	If (task_rq(p) == rq && !is_migration_disabled(p) ) {
 	  ...
	} else if (pending) {
	  ...
	  If (cpumask_test_cpu(task_cpu(p), p-> cpus_ ptr)) { 
        	p->migration_pending = NULL;
      		 complete = true;
      		 goto out;
	}
...
}






Best regards,
Jing-Ting Wu



