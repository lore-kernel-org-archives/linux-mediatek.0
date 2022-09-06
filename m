Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F71C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QmYjLs9Asoq2RnmK+JEPLEipTLEMcIgsHAUlvR3DFFY=; b=0Xr6k6V4JVvMHfeg/O003qf4w+
	rcRhxk5j903HvyiwZXhIL2583H9EmIOQfgtIbnGa1pDRxgiT+TqcSeO8AycOA+Viogf9WjJuMYcHb
	4aBgK+nFzvZUf1r5N071fmf7HN1pQrttXNmoEARYsxdbjU1Zi4kcyjsKBX81UnwZobPxo3GzPwkxV
	u8fBvkMyrln1aJrXyqTPa++BxzhQJi95UkEuIXToXjk3iJVzqEZX1vMkkJDBMvOUD5/BxHwIrm87E
	5ol6Bj6GHRnNLEAehH1l6N25mYuBlHLeYmc+dsP2wU1SwqrRimAnk6VX5HnLFZSvqFUrXmuXfPcRf
	ng/D7o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYk3-00DrNM-RV; Tue, 06 Sep 2022 13:35:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYjv-00DrCk-Q1
	for linux-mediatek@lists.infradead.org; Tue, 06 Sep 2022 13:35:48 +0000
X-UUID: bc16a967e9d04c249a0ca062e26ea61f-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=QmYjLs9Asoq2RnmK+JEPLEipTLEMcIgsHAUlvR3DFFY=;
	b=q7gqnjhCjLoQx2aoCeHbyOwF2CLs+GmF4fPzlWNRV1REEKnlkwMz0YpSuoetGVxv8j/wcpOz3U72SmccFCEsTo8/mckSIALNt9H6y8+fpW7bpDXrE1Bd/mXnNex/PYbQ3XiIrfema4kym08Gv8QyMNlQEiAxeLhG4JC7rjZX+DU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b4a42190-b4df-425b-9d10-7744629990dd,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:84065f21-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bc16a967e9d04c249a0ca062e26ea61f-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1831291883; Tue, 06 Sep 2022 06:35:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 20:54:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 20:54:58 +0800
Message-ID: <6dab6e564e43c952f63f83ef868da6ed829fc1a8.camel@mediatek.com>
Subject: BUG: list_add corruption while doing migrate_swap -> balance_push
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<bristot@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <jing-ting.wu@mediatek.com>,
	<yt.chang@mediatek.com>, <jonathan.jmchen@mediatek.com>
Date: Tue, 6 Sep 2022 20:54:58 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_063543_922382_4F60F476 
X-CRM114-Status: UNSURE (   5.09  )
X-CRM114-Notice: Please train this message.
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

Hi,

[Syndrome]
A list_add corruption error at kernel-5.15, the log shows.
list_add corruption. prev->next should be next (ffffff81a6f08ba0), but
was 0000000000000000. (prev=ffffff81a6f05930).

The call trace as below:
ipanic_die
notify_die
die
bug_handler
brk_handler
do_debug_exception
el1_dbg
el1h_64_sync_handler
el1h_64_sync
__list_add_valid
cpu_stop_queue_work
stop_one_cpu_nowait
balance_push
__schedule
schedule
do_sched_yield
__arm64_sys_sched_yield
invoke_syscall
el0_svc_common
do_el0_svc
el0_svc
el0t_64_sync_handler
el0t_64_sync

[Analysis]
By memory dump and analyzing the stopper->works list, the error code
flow as following:

migrate_swap 
->stop_two_cpus
	->cpu_stop_queue_two_works
		->__cpu_stop_queue_work (add work->list to stopper-
>works respectively)	
			->list_add_tail(&work->list, &stopper->works);
	->wake_up_q(&wakeq);	
->wait_for_completion(&done.completion);
->wait_for_common
->schedule_timeout
->schedule

At this point, the cpu hotplug trigged,
It registers balance_callback by below flow:
cpu_down(cpuid)
->_cpu_down
->cpuhp_set_state()
->set_cpu_dying(cpuid, true)
->sched_cpu_deactivate
->balance_push_set(cpuid, true)
	->rq->balance_callback = &balance_push_callback;


Finally, 
->__schedule
->__balance_callbacks
->do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
->balance_push
->stop_one_cpu_nowait
	*work_buf = (struct cpu_stop_work){ .fn = fn, .arg = arg,
.caller = _RET_IP_, };
At this point the list_head *next, *prev is initial to NULL!!
->cpu_stop_queue_work
->__list_add_valid

So it will hit this error 
if (CHECK_DATA_CORRUPTION(next->prev != prev,
	"list_add corruption. next->prev should be prev (%px), but was
%px. (next=%px).\n",
	prev, next->prev, next)

Do you have any suggestion for this issue?
Thank you.


