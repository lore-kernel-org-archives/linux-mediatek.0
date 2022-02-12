Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A65C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AHxAaz9Fw3pG3xDXS975flDZrxbilqiKEUBfR7SpwCQ=; b=3jYwGaEQrYzSit
	iwwQ7TKF8/tt7x2q3+amq7GHXEQPh1SUYxod4oK6Psf1CvoZhgmNJquhrbN5/ndQU6nb+BShd+8/y
	P+lKWfAM81Ls0AN5aer/ebotfPLwMZD87eo+AAsz3oNHwm5RLcm4CDr7U/16ejZNgHW67gUKcLAcF
	Vh7HQ6xQFyDWoWKw5KcXlaDfLfnao+HxdE1Ni1NlvsixXRz84a9Qavmi3pNA9d/4TMTzCfCRBpsub
	+BExHFn3SJ2tnkoaAhbmFs0FwxjHHsrRp5wLUAcl8h8BF/CZaoB4JT6aGZS+Uywj1oU865W3iKr4Z
	7wWoMkqJQ93mZkgq/XVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIptp-009iu7-QB; Sat, 12 Feb 2022 10:45:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIpsu-009iTM-Ir; Sat, 12 Feb 2022 10:44:10 +0000
X-UUID: fd0c739d43de4c30ac06a8a0583c171b-20220212
X-UUID: fd0c739d43de4c30ac06a8a0583c171b-20220212
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857456718; Sat, 12 Feb 2022 03:44:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 02:44:04 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 12 Feb 2022 18:43:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Feb 2022 18:43:50 +0800
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
Subject: [PATCH 0/5] Support hld based on Pseudo-NMI for arm64
Date: Sat, 12 Feb 2022 18:43:44 +0800
Message-ID: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_024408_690679_71AB94F3 
X-CRM114-Status: GOOD (  12.52  )
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

As we already used hld internally for arm64 since 2020, there still
doesn't have a proper commit on the upstream and we badly need it.

This serise rebase on 5.17-rc3 from [1] and the origin author is
Pingfan Liu <kernelfans@gmail.com>
Sumit Garg <sumit.garg@linaro.org>

[1] wasn't reviewed for its patch v3, I'll take over the further development
for this.


Qoute from [1]:

Hard lockup detector is helpful to diagnose unpaired irq enable/disable.
But the current watchdog framework can not cope with arm64 hw perf event
easily.

On arm64, when lockup_detector_init()->watchdog_nmi_probe(), PMU is not
ready until device_initcall(armv8_pmu_driver_init).  And it is deeply
integrated with the driver model and cpuhp. Hence it is hard to push the
initialization of armv8_pmu_driver_init() before smp_init().

But it is easy to take an opposite approach by enabling watchdog_hld to
get the capability of PMU async. 
The async model is achieved by expanding watchdog_nmi_probe() with
-EBUSY, and a re-initializing work_struct which waits on a
wait_queue_head.

[1] https://lore.kernel.org/lkml/20211014024155.15253-1-kernelfans@gmail.com/


Lecopzer Chen (2):
  kernel/watchdog: remove WATCHDOG_DEFAULT
  kernel/watchdog: change watchdog_nmi_enable() to void

Pingfan Liu (2):
  kernel/watchdog_hld: Ensure CPU-bound context when creating hardlockup
    detector event
  kernel/watchdog: Adapt the watchdog_hld interface for async model

Sumit Garg (1):
  arm64: Enable perf events based hard lockup detector

 arch/arm64/Kconfig               |  2 ++
 arch/arm64/kernel/Makefile       |  1 +
 arch/arm64/kernel/perf_event.c   | 11 ++++--
 arch/arm64/kernel/watchdog_hld.c | 36 +++++++++++++++++++
 arch/sparc/kernel/nmi.c          |  8 ++---
 drivers/perf/arm_pmu.c           |  5 +++
 include/linux/nmi.h              | 11 +++++-
 include/linux/perf/arm_pmu.h     |  2 ++
 kernel/watchdog.c                | 61 ++++++++++++++++++++++++++++----
 kernel/watchdog_hld.c            |  8 ++++-
 10 files changed, 131 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
