Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB54C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=apq5EIREUx5HlkOaBIw0l9h1knG/Ih+M+QEhOYyg79Q=; b=W/KAHx++nvRSJX
	vofbiROJ1g80Ku8ubq2K9zNuTveiNc2Kn9MOi7jlepD0kJFe6JlJloIMQGv54O0F8Vb8Egqsc6kSS
	J5EYy8R318PhJuL57JVWz7fmsggC2lQb/y+gunS0SI2O4M0aUWTOoKbQKiNT2RfLA4j/TbsrV1nrN
	i2CmT5/8wpUZ6XI0/Hc9juGdIAfSxQ708D2WnBOBKl7bJVqD76Jz9SXjZuIczdf6yq/jJ2G0DILcP
	vJRbM7jwCBLtgXoo2iFM+EVqlm7I5vxB5msC3G6ddoMfVoyNtqi58yJoaATcWxRUxXJdIp2ArNPfb
	gpecTQ829jIU34wOsCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFko-000lSH-CO; Mon, 07 Mar 2022 15:58:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFkV-000lGJ-Um; Mon, 07 Mar 2022 15:58:18 +0000
X-UUID: f28da88335694567809102b0dc9afa75-20220307
X-UUID: f28da88335694567809102b0dc9afa75-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1867811872; Mon, 07 Mar 2022 08:58:11 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 07:48:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 23:47:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 23:47:54 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <lecopzer.chen@mediatek.com>, <acme@kernel.org>,
 <akpm@linux-foundation.org>, <alexander.shishkin@linux.intel.com>,
 <catalin.marinas@arm.com>, <davem@davemloft.net>, <jolsa@redhat.com>,
 <jthierry@redhat.com>, <keescook@chromium.org>, <kernelfans@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
 <masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
 <mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
 <nixiaoming@huawei.com>, <peterz@infradead.org>, <pmladek@suse.com>,
 <sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v2 0/5] Suppot hld based on Pseudo-NMI for arm64
Date: Mon, 7 Mar 2022 23:47:24 +0800
Message-ID: <20220307154729.13477-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_075816_030743_FDEB256A 
X-CRM114-Status: GOOD (  15.02  )
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

This serise rework on 5.17-rc7 from [1] and the origin author is
Pingfan Liu <kernelfans@gmail.com>
Sumit Garg <sumit.garg@linaro.org>

Qoute from [1]:

> Hard lockup detector is helpful to diagnose unpaired irq enable/disable.
> But the current watchdog framework can not cope with arm64 hw perf event
> easily.

> On arm64, when lockup_detector_init()->watchdog_nmi_probe(), PMU is not
> ready until device_initcall(armv8_pmu_driver_init).  And it is deeply
> integrated with the driver model and cpuhp. Hence it is hard to push the
> initialization of armv8_pmu_driver_init() before smp_init().

> But it is easy to take an opposite approach by enabling watchdog_hld to
> get the capability of PMU async. 
> The async model is achieved by expanding watchdog_nmi_probe() with
> -EBUSY, and a re-initializing work_struct which waits on a
> wait_queue_head.

[1] https://lore.kernel.org/lkml/20211014024155.15253-1-kernelfans@gmail.com/

v2:
  1. Tweak commit message in patch 01/02/04/05 
  2. Remove vobose WARN in patch 04 within watchdog core.
  3. Change from three states variable: detector_delay_init_state to
     two states variable: lockup_detector_pending_init

     Thanks Petr Mladek <pmladek@suse.com> for the idea.
     > 1.  lockup_detector_work() called before lockup_detector_check().
     >     In this case, wait_event() will wait until lockup_detector_check()
     >     clears detector_delay_pending_init and calls wake_up().

     > 2. lockup_detector_check() called before lockup_detector_work().
     >    In this case, wait_even() will immediately continue because
     >    it will see cleared detector_delay_pending_init.
  4. Add comment in code in patch 04/05 for two states variable changing.


Lecopzer Chen (4):
  kernel/watchdog: remove WATCHDOG_DEFAULT
  kernel/watchdog: change watchdog_nmi_enable() to void
  kernel/watchdog: Adapt the watchdog_hld interface for async model
  arm64: Enable perf events based hard lockup detector

Pingfan Liu (1):
  kernel/watchdog_hld: Ensure CPU-bound context when creating hardlockup
    detector event

 arch/arm64/Kconfig             |  2 +
 arch/arm64/kernel/Makefile     |  1 +
 arch/arm64/kernel/perf_event.c | 12 +++++-
 arch/sparc/kernel/nmi.c        |  8 ++--
 drivers/perf/arm_pmu.c         |  5 +++
 include/linux/nmi.h            |  5 ++-
 include/linux/perf/arm_pmu.h   |  2 +
 kernel/watchdog.c              | 67 +++++++++++++++++++++++++++++++---
 kernel/watchdog_hld.c          |  8 +++-
 9 files changed, 95 insertions(+), 15 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
