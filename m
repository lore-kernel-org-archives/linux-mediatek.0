Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96CCC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2V5rB3R50IqeBfs7LX1P6FCozmqVAN64ExS2GEtUdk=; b=0LJ5kvgejHEDNfYaNHn3n0V6LS
	2LsYF3UcC0KVPRPK6FpnAxiHerE9uaGNJe1KKVIbRy5NzAlr/k6+UXebTmfWzlC3tT1wt3kUSgIqa
	cnXjkrWhQsCW6Kfdc/YK9YsYc+vfNsbppG4bEvJkrR9HstMN1yWkXBINhvsdTlBrQBVO+35y2qsuT
	3Eccfk6nVdM5J/c04ZJcs1DrxKhpsn2P093JVhBjaK/wZgwgLjBus6mpCFuzbtDDBqONCvB7KJM93
	LUaqaLsQtCJjteAeC87uAw+XyV7w71NhYzBQo2ReuCq/q96FSxxc/3bzYidvm6/XoBCMN8G29JgH/
	8BxRgDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtwu-00CDoa-Vz; Thu, 14 Jul 2022 08:11:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtwq-00CDim-VU; Thu, 14 Jul 2022 08:11:50 +0000
X-UUID: 97852d2c9375480ca1e1bb1c8c5d81be-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f30ea0e5-9098-490b-87a2-967933105e75,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:6ecb4764-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 97852d2c9375480ca1e1bb1c8c5d81be-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863748906; Thu, 14 Jul 2022 01:11:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 15:31:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 14 Jul 2022 15:31:05 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, <stable@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.4] sched/rt: Disable RT_RUNTIME_SHARE by default
Date: Thu, 14 Jul 2022 15:30:52 +0800
Message-ID: <20220714073055.15049-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_011149_086051_3E2C38B8 
X-CRM114-Status: GOOD (  12.42  )
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

From: Daniel Bristot de Oliveira <bristot@redhat.com>

commit 2586af1ac187f6b3a50930a4e33497074e81762d upstream.

The RT_RUNTIME_SHARE sched feature enables the sharing of rt_runtime
between CPUs, allowing a CPU to run a real-time task up to 100% of the
time while leaving more space for non-real-time tasks to run on the CPU
that lend rt_runtime.

The problem is that a CPU can easily borrow enough rt_runtime to allow
a spinning rt-task to run forever, starving per-cpu tasks like kworkers,
which are non-real-time by design.

This patch disables RT_RUNTIME_SHARE by default, avoiding this problem.
The feature will still be present for users that want to enable it,
though.

Signed-off-by: Daniel Bristot de Oliveira <bristot@redhat.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Wei Wang <wvw@google.com>
Link: https://lkml.kernel.org/r/b776ab46817e3db5d8ef79175fa0d71073c051c7.1600697903.git.bristot@redhat.com
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: stable@vger.kernel.org
---
 kernel/sched/features.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 2410db5e9a35..66c74aa4753e 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -77,7 +77,7 @@ SCHED_FEAT(WARN_DOUBLE_CLOCK, false)
 SCHED_FEAT(RT_PUSH_IPI, true)
 #endif
 
-SCHED_FEAT(RT_RUNTIME_SHARE, true)
+SCHED_FEAT(RT_RUNTIME_SHARE, false)
 SCHED_FEAT(LB_MIN, false)
 SCHED_FEAT(ATTACH_AGE_LOAD, true)
 
-- 
2.18.0


