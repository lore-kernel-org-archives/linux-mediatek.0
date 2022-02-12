Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F97C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5tML4BouGMptwFxhhB2cwOLmbiphf2vwmhJJzJs+A0=; b=LIo56Iooa26HP2
	U1TUEh8NMQdeym6hc8ezL1JJHiLIxAW0u7VA+tLFid1RR2dc9wHe1oY7eSkt5D5LyJjhHx96bNr9j
	3whVODh0XfvRigjz4mXfqkteDmzDIB6RyK+X/SyYS9jlRm11V/QNsIcVlP2RrzQsX4gdBA+8w4WxO
	cC2NuXVHLtr7vJEBQk9nsKoZqHSRw9eb0psJeIFHeUBq/dy6m1ksBSRyUy28AG5PBA7UQ2HhRamGz
	KSpP7s6ooYbYwIeOf+goHLjsSRLEox4w38kZYS8gKMKVI+/dEtzAzRFCtysTiqrA2D14wo4N8fWDD
	psXtDq08/8MbBGc164MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIptE-009ib7-SX; Sat, 12 Feb 2022 10:44:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIpso-009iPK-Bn; Sat, 12 Feb 2022 10:44:05 +0000
X-UUID: 0ca9b6244990472681d2d0f700cec86f-20220212
X-UUID: 0ca9b6244990472681d2d0f700cec86f-20220212
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1409174485; Sat, 12 Feb 2022 03:43:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 02:43:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 12 Feb 2022 18:43:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Feb 2022 18:43:53 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>, Kees Cook
 <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Wang Qing
 <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>, Xiaoming Ni
 <nixiaoming@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <sumit.garg@linaro.org>,
 <kernelfans@gmail.com>, <lecopzer.chen@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 3/5] kernel/watchdog_hld: Ensure CPU-bound context when
 creating hardlockup detector event
Date: Sat, 12 Feb 2022 18:43:47 +0800
Message-ID: <20220212104349.14266-4-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_024402_466160_E64CECA9 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Pingfan Liu <kernelfans@gmail.com>

from: Pingfan Liu <kernelfans@gmail.com>

hardlockup_detector_event_create() should create perf_event on the
current CPU. Preemption could not get disabled because
perf_event_create_kernel_counter() allocates memory. Instead,
the CPU locality is achieved by processing the code in a per-CPU
bound kthread.

Add a check to prevent mistakes when calling the code in another
code path.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/watchdog_hld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..96b717205952 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -165,10 +165,16 @@ static void watchdog_overflow_callback(struct perf_event *event,
 
 static int hardlockup_detector_event_create(void)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu;
 	struct perf_event_attr *wd_attr;
 	struct perf_event *evt;
 
+	/*
+	 * Preemption is not disabled because memory will be allocated.
+	 * Ensure CPU-locality by calling this in per-CPU kthread.
+	 */
+	WARN_ON(!is_percpu_thread());
+	cpu = raw_smp_processor_id();
 	wd_attr = &wd_hw_attr;
 	wd_attr->sample_period = hw_nmi_get_sample_period(watchdog_thresh);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
