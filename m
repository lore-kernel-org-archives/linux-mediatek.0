Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8735C19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pl+MDAa1cNSlme5ohVZ4QGF7+/nE1dHPujEfDH6bqDU=; b=n9KFsb2ClptHSRt0HM3oSRhwHj
	cNvT5DeqrTsHvIWlhumK49fnxLjHmS3cO1PIFUyKQ0oga6KArgUVTMaO26u2sGY3XEgTS4vSfOSKR
	QCda/8Ixii1WIvWrsNlzSJ8w0laOU32qpARtAzQnV3FnabitbJ/HhPs+kVUNt+isNSBTFejueqTzx
	2DqhKkXwv7JhMJUlkILZW3NwX2Y1Ybl2La/z+phtev6N4tZqYzDIm081upHYd0ujCzd+mBVQPZinC
	EjlBiD8Ifu9VjTc2sSDMQpzXKvjeos4L7pmDq122YGjIT+IGnwWRiKVTBKTBG85vGmOSq1il1093L
	GsSh+MVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3es-00AOIv-S6; Thu, 11 Aug 2022 08:35:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3eq-00AOHw-2H; Thu, 11 Aug 2022 08:35:13 +0000
X-UUID: c9a9cb3396904d58b9973b94c9b3ee43-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:4979b5cd-3cc6-4ee4-97f6-c0c0839af128,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:b63885ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c9a9cb3396904d58b9973b94c9b3ee43-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 474918275; Thu, 11 Aug 2022 01:35:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 11 Aug 2022 15:54:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Aug 2022 15:54:28 +0800
Message-ID: <3bcf5d974b98acccde89e8d5567d3ddcdfb44800.camel@mediatek.com>
Subject: [Race condition] Race condition at cpuidle_enter_s2idle &
 __cfi_slowpath_diag
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>, Kees Cook
	<keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Ingo Molnar <mingo@redhat.com>,
	"Peter Zijlstra" <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	"Vincent Guittot" <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Daniel Bristot
 de Oliveira" <bristot@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
	<jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>,
	<rcu@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>
CC: <kuyo.chang@mediatek.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<rcu@vger.kernel.org>, <llvm@lists.linux.dev>
Date: Thu, 11 Aug 2022 15:54:28 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_013512_146786_3F3E9847 
X-CRM114-Status: UNSURE (   7.69  )
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

Hi Sami,

During doing s2idle(Suspend-To-Idle) flow, I found a task will put into
runqueue by __cfi_slowpath_diag.
The code trace about fail case as below:

call_cpuidle_s2idle
->if (current_clr_polling_and_test()) //check resched flag
	return -EBUSY;
->cpuidle_enter_s2idle
->enter_s2idle_proper
->target_state->enter_s2idle(dev, drv, index);

Meanwhile the log shows the __cfi_slowpath_diag function will wake up a
task to CPU, below is the backtrace
__cfi_slowpath_diag
find_check_fn
rcu_irq_enter
rcu_nmi_enter
rcu_cleanup_after_idle
invoke_rcu_core
raise_softirq(RCU_SOFTIRQ)
raise_softirq_irqoff
    if (!in_interrupt() && should_wake_ksoftirqd())
        wakeup_softirqd();
//wake up flow
wake_up_process
try_to_wake_up
ttwu_queue
ttwu_do_activate
ttwu_do_wakeup
check_preempt_curr
resched_curr
set_tsk_need_resched(curr);
 

So It will violate the initial check at call_cpuidle_s2idle(Now it
exists a task at rq  and need reched, so it should not enter
cpuidle_enter_s2idle )
if (current_clr_polling_and_test())
	return -EBUSY;

I look the racing may be related to the following patch

57cd6d1 cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
https://android.googlesource.com/kernel/common/+/57cd6d1

Do you have any suggestion for this issue?
Thank you.


