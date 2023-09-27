Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7623E7F158
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 03:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/VjjYSP/nPGqaqNizuILOYzcVE0ssqx9zL+nJLUZjQ=; b=wSvk128Eza2ht3HlcELRdabSrG
	7B7eBdk2RPFOnwvHBzcY/26BYV04RkYbon9YotJzAiV0Awu4Ffrw8sSVV3KzAB9kn4HHPOkt0C9SS
	9g4OyEOmDeGPs8Oe69xB/KYkLT81n6oNqVr6aEZzYzr13yUCZD8EqcyZlYjOxpJRjN9Z4iZMtLEeq
	sEdN2JlC4AgFr9T4yj+0it3aQGnkOpxFSDKYY7rJwPbaY0kTCSVys0v3qnCPhtdY+LPkv7JTChOkU
	pdKIS5KIlpWBTC2P7SzTuyXnwWbVfOmUfDkolv0ci6KcTipppjrYTti7XndUY62dmkk1Kir7oP1OI
	9+5PwMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlLK6-00HSKG-0m;
	Wed, 27 Sep 2023 03:34:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlLK4-00HSJK-0J;
	Wed, 27 Sep 2023 03:34:49 +0000
X-UUID: cbc087ae5ce611ee9b7791016c24628a-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=T/VjjYSP/nPGqaqNizuILOYzcVE0ssqx9zL+nJLUZjQ=;
	b=KUJXGpn+UPKPm1zEdCKI47NctVFEkZIcD46tWk6sGfc9EbEJdvsI/M9cl8bK0q7To3DNcFiY0KQLAEzouv+3COiWzhqcalxwbBcMUIuIg3p+o6Pq6eGJql4Gh4txEdZAxmUaefvzQxteqSiPP10HFg2I6KJBR3MlTJT/3rmtl5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:ea93935d-c7a5-490e-a36b-3eee0f36db92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:59a42df0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cbc087ae5ce611ee9b7791016c24628a-20230926
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 476733469; Tue, 26 Sep 2023 20:34:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 11:34:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 11:34:37 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] sched/core: Fix stuck on completion for affine_move_task() when stopper disable
Date: Wed, 27 Sep 2023 11:34:28 +0800
Message-ID: <20230927033431.12406-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.864400-8.000000
X-TMASE-MatchedRID: As59EB+03ZJ5vTMZrS1iteEbUg4xvs+wQPCWRE0Lo8IuMQd1pYoA2S7T
	4vtNNpmPhKuaVJ364l1mLZH0kmMDZ1hdPEiZHlm8M8ORI7N4NZbAmOfzKotToi8x1W7rdOBP9BQ
	FWu9qPYa9zsLeDLxbzwszukfLgYhRIg67HHizFeEZXJLztZviXEyQ5fRSh265CqIJhrrDy29ggP
	1j4uH9PN1TeFi3Fi9wgDLqnrRlXrZLA5JD98yI6t0H8LFZNFG71sULACB0qRKy9IyVQRrf1+Lim
	nu7EgSJ3xsiz2kBzNBhrAU2FX2OVDTiLbRo2+mmlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.864400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9EB54FCE026D70D8BD80CFED08505FB3291A82D5ACCBCBA0DED2477AA3C8A2E32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_203448_139910_131F92E7 
X-CRM114-Status: GOOD (  12.50  )
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

[Syndrome] hung detect shows below warning msg
[ 4320.666557] [   T56] khungtaskd: [name:hung_task&]INFO: task stressapptest:17803 blocked for more than 3600 seconds.
[ 4320.666589] [   T56] khungtaskd: [name:core&]task:stressapptest   state:D stack:0     pid:17803 ppid:17579  flags:0x04000008
[ 4320.666601] [   T56] khungtaskd: Call trace:
[ 4320.666607] [   T56] khungtaskd:  __switch_to+0x17c/0x338
[ 4320.666642] [   T56] khungtaskd:  __schedule+0x54c/0x8ec
[ 4320.666651] [   T56] khungtaskd:  schedule+0x74/0xd4
[ 4320.666656] [   T56] khungtaskd:  schedule_timeout+0x34/0x108
[ 4320.666672] [   T56] khungtaskd:  do_wait_for_common+0xe0/0x154
[ 4320.666678] [   T56] khungtaskd:  wait_for_completion+0x44/0x58
[ 4320.666681] [   T56] khungtaskd:  __set_cpus_allowed_ptr_locked+0x344/0x730
[ 4320.666702] [   T56] khungtaskd:  __sched_setaffinity+0x118/0x160
[ 4320.666709] [   T56] khungtaskd:  sched_setaffinity+0x10c/0x248
[ 4320.666715] [   T56] khungtaskd:  __arm64_sys_sched_setaffinity+0x15c/0x1c0
[ 4320.666719] [   T56] khungtaskd:  invoke_syscall+0x3c/0xf8
[ 4320.666743] [   T56] khungtaskd:  el0_svc_common+0xb0/0xe8
[ 4320.666749] [   T56] khungtaskd:  do_el0_svc+0x28/0xa8
[ 4320.666755] [   T56] khungtaskd:  el0_svc+0x28/0x9c
[ 4320.666761] [   T56] khungtaskd:  el0t_64_sync_handler+0x7c/0xe4
[ 4320.666766] [   T56] khungtaskd:  el0t_64_sync+0x18c/0x190

[Analysis]

After add some debug footprint massage, this issue happened at stopper
disable case.
It cannot exec migration_cpu_stop fun to complete migration.
This will cause stuck on wait_for_completion.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1dc0b0287e30..98c217a1caa0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3041,8 +3041,9 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 		task_rq_unlock(rq, p, rf);
 
 		if (!stop_pending) {
-			stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
-					    &pending->arg, &pending->stop_work);
+			if (!stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
+					    &pending->arg, &pending->stop_work))
+				return -ENOENT;
 		}
 
 		if (flags & SCA_MIGRATE_ENABLE)
-- 
2.18.0


