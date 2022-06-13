Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gkM0BvZAxVzfV4F87jF835XMbYB9pb7GIm/45Sjz+CQ=; b=kWXhPrpsoRMXq/
	m6n12mZMT7ct67s3m1FGti3U2ZzX4feX2NJrch/DqO9ty+jnX5628Godnuyg1ZOfIh2CcUHJYiSXu
	ADmrWORzUWmMJaQAJ7h/uPSm4dkNmUBSiA/pixBMmzw0O7x6/s8qTkBtbCYPK4C1toCIGlZqFe/xv
	31Ykc6GLxkXEFluuHb6B2uUDI2hr7QA6idWr6Ibf5v/+vZu/pRtJdXShMLcaSNIsLGUQJ6rMsa3m1
	HpZVJHkPm/5xqwhmwm8JPvfHsSsCTeIWhaR/91KtY/iZDdz3WKPuFZ0f8g0pxCuqkjVAuDl8DqlM+
	dfMKdBJpuuneAXglqjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kci-0042Wq-Mr; Mon, 13 Jun 2022 14:00:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kc3-00429u-Bo; Mon, 13 Jun 2022 14:00:17 +0000
X-UUID: cd65c93951094995ba6d73688012804f-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e4583005-dad9-4a33-95da-33ae09a14e1e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:1e058f37-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: cd65c93951094995ba6d73688012804f-20220613
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 570734557; Mon, 13 Jun 2022 07:00:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 07:00:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 21:59:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 13 Jun 2022 21:59:58 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <pmladek@suse.com>, <acme@kernel.org>, <akpm@linux-foundation.org>,
	<alexander.shishkin@linux.intel.com>, <catalin.marinas@arm.com>,
	<davem@davemloft.net>, <jolsa@redhat.com>, <jthierry@redhat.com>,
	<keescook@chromium.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
	<masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
	<nixiaoming@huawei.com>, <peterz@infradead.org>,
	<sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
	<will@kernel.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v5 0/6] Support hld delayed init based on Pseudo-NMI for
Date: Mon, 13 Jun 2022 21:59:50 +0800
Message-ID: <20220613135956.15711-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_070015_485636_238F7A57 
X-CRM114-Status: GOOD (  20.36  )
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

This serise rework on 5.17 from [1] and the origin author is
Pingfan Liu <kernelfans@gmail.com>
Sumit Garg <sumit.garg@linaro.org>

Qoute from [1]:

> Hard lockup detector is helpful to diagnose unpaired irq
> enable/disable.
> But the current watchdog framework can not cope with arm64 hw perf
> event
> easily.

> On arm64, when lockup_detector_init()->watchdog_nmi_probe(), PMU is
> not
> ready until device_initcall(armv8_pmu_driver_init).  And it is deeply
> integrated with the driver model and cpuhp. Hence it is hard to push
> the
> initialization of armv8_pmu_driver_init() before smp_init().

> But it is easy to take an opposite approach by enabling watchdog_hld
> to
> get the capability of PMU async. 
> The async model is achieved by expanding watchdog_nmi_probe() with
> -EBUSY, and a re-initializing work_struct which waits on a
> wait_queue_head.

Provide an API - retry_lockup_detector_init() for anyone who needs
to delayed init lockup detector.

The original assumption is: nobody should use delayed probe after
lockup_detector_check() (which has __init attribute).
That is, anyone uses this API must call between lockup_detector_init()
and lockup_detector_check(), and the caller must have __init attribute

The delayed init flow is:
1. lockup_detector_init() -> watchdog_nmi_probe() get non-zero retun,
   then set allow_lockup_detector_init_retry to true which means it's
   able to do delayed probe later.

2. PMU arch code init done, call retry_lockup_detector_init().

3. retry_lockup_detector_init() queue the work only when
   allow_lockup_detector_init_retry is true which means nobody should
call
   this before lockup_detector_init().

4. the work lockup_detector_delay_init() is doing without wait event.
   if probe success, set allow_lockup_detector_init_retry to false.

5. at late_initcall_sync(), lockup_detector_check() set
   allow_lockup_detector_init_retry to false first to avoid any later
retry,
   and then flush_work() to make sure the __init section won't be freed
   before the work done.

[1]
https://lore.kernel.org/lkml/20211014024155.15253-1-kernelfans@gmail.com/

v5:
  1. rebase on v5.19-rc2
  2. change to proper schedule api
  3. return value checking before retry_lockup_detector_init()

v4:
  1. remove -EBUSY protocal, let all the non-zero value from
     watchdog_nmi_probe() be able to retry.
  2. separate arm64 part patch into hw_nmi_get_sample_period and retry
     delayed init
  3. tweak commit msg that we don't have to limit to -EBUSY  
  4. rebase on v5.18-rc4

v3:
  1. Tweak commit message in patch 04 
	2. Remove wait event
  3. s/lockup_detector_pending_init/allow_lockup_detector_init_retry/
  4. provide api retry_lockup_detector_init() 
https://lore.kernel.org/lkml/20220324141405.10835-1-lecopzer.chen@mediatek.com/ 

v2:
  1. Tweak commit message in patch 01/02/04/05 
  2. Remove vobose WARN in patch 04 within watchdog core.
  3. Change from three states variable: detector_delay_init_state to
     two states variable: allow_lockup_detector_init_retry

     Thanks Petr Mladek <pmladek@suse.com> for the idea.
     > 1.  lockup_detector_work() called before lockup_detector_check().
     >     In this case, wait_event() will wait until
     >     lockup_detector_check()
     >     clears detector_delay_pending_init and calls wake_up().

     > 2. lockup_detector_check() called before lockup_detector_work().
     >    In this case, wait_even() will immediately continue because
     >    it will see cleared detector_delay_pending_init.
  4. Add comment in code in patch 04/05 for two states variable
changing.
https://lore.kernel.org/lkml/20220307154729.13477-1-lecopzer.chen@mediatek.com/


Lecopzer Chen (5):
  kernel/watchdog: remove WATCHDOG_DEFAULT
  kernel/watchdog: change watchdog_nmi_enable() to void
  kernel/watchdog: Adapt the watchdog_hld interface for async model
  arm64: add hw_nmi_get_sample_period for preparation of lockup detector
  arm64: Enable perf events based hard lockup detector

Pingfan Liu (1):
  kernel/watchdog_hld: Ensure CPU-bound context when creating hardlockup
    detector event

 arch/arm64/Kconfig               |  2 +
 arch/arm64/kernel/Makefile       |  1 +
 arch/arm64/kernel/perf_event.c   | 12 +++++-
 arch/arm64/kernel/watchdog_hld.c | 39 +++++++++++++++++
 arch/sparc/kernel/nmi.c          |  8 ++--
 drivers/perf/arm_pmu.c           |  5 +++
 include/linux/nmi.h              |  4 +-
 include/linux/perf/arm_pmu.h     |  2 +
 kernel/watchdog.c                | 72 +++++++++++++++++++++++++++++---
 kernel/watchdog_hld.c            |  8 +++-
 10 files changed, 139 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
