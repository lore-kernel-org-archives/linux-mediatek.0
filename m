Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B464EC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 13:07:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4958D238D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 13:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4958D238D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzQmo84cjK946tfHv5IccPDOntZm3f6InsZWsEVEJno=; b=r0SVCi63QRTNhjPK7fVicqyfHs
	HSgy4GZYgBjPEyf8kophlMTaFFBbRmRWuw5jPVwOviIjlFi4jADwh2BYWjP0zWyXqREeclsceGuuN
	xaQh1cyjvko1Zi3tIH7LtuZQVrAl0XT0jUzbI4sRita6k08gS96dgngbjEAerZ63hR8sMAJeCG6DN
	4Kaz0aryoidQsbznJmd4izDbwGE6+voQ6+GZO0a5OoYNAJdtvNVyYZgYiq+Z8O0Fu5jpHvIDJKplS
	a5ADU0k7zWSFFye4x+KT4UiPrgitxfFti1YsocY4COOUDll3znJCg/zAFAkBz76brII2L0/6iOjpC
	sCwmDp8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpszd-0000Dc-8r; Thu, 17 Dec 2020 13:06:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpsza-0000CF-4X; Thu, 17 Dec 2020 13:06:51 +0000
X-UUID: a2964e3ac3964ece89e437a113ad96ba-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hnSj/W3WJWDksYPZPWDYXPrubbMEMH4KvtDJQOSem58=; 
 b=n5aDRL7Ni6xWyqGESJ/PzC/LzYZ94doVO1+k4NcfxY5Q5fyNmkGk85pP1phg221nIwZdHebaP55snk2N2cGC9V1486n5Hc3mZ96qzIQH390gTRanGCVQb8wlcXNJ11EjzEalzcqOD86qAYUpLfeKecYXoL9WTamtslJ9Pr/H38A=;
X-UUID: a2964e3ac3964ece89e437a113ad96ba-20201217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 503461541; Thu, 17 Dec 2020 05:06:39 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 05:06:36 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 21:06:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Dec 2020 21:06:33 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] kernel/watchdog_hld.c: Fix access percpu in preemptible
 context
Date: Thu, 17 Dec 2020 21:06:17 +0800
Message-ID: <20201217130617.32202-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_080650_421030_97D441D1 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: sumit.garg@linaro.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 will@kernel.org, yj.chiang@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, alexandru.elisei@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
reinitilizes lockup detector after arm64 PMU is initialized and provide
another chance for access smp_processor_id() in preemptible context.
Since hardlockup_detector_event_create() use many percpu relative variable,
just try to fix this by get/put_cpu()

    BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
    caller is debug_smp_processor_id+0x20/0x2c
    CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.10.0+ #276
    Hardware name: linux,dummy-virt (DT)
    Call trace:
      dump_backtrace+0x0/0x3c0
      show_stack+0x20/0x6c
      dump_stack+0x2f0/0x42c
      check_preemption_disabled+0x1cc/0x1dc
      debug_smp_processor_id+0x20/0x2c
      hardlockup_detector_event_create+0x34/0x18c
      hardlockup_detector_perf_init+0x2c/0x134
      watchdog_nmi_probe+0x18/0x24
      lockup_detector_init+0x44/0xa8
      armv8_pmu_driver_init+0x54/0x78
      do_one_initcall+0x184/0x43c
      kernel_init_freeable+0x368/0x380
      kernel_init+0x1c/0x1cc
      ret_from_fork+0x10/0x30


Fixes: 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: Sumit Garg <sumit.garg@linaro.org>

---
 kernel/watchdog_hld.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..c591a1ea8eb3 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -165,7 +165,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 
 static int hardlockup_detector_event_create(void)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu = get_cpu();
 	struct perf_event_attr *wd_attr;
 	struct perf_event *evt;
 
@@ -176,11 +176,13 @@ static int hardlockup_detector_event_create(void)
 	evt = perf_event_create_kernel_counter(wd_attr, cpu, NULL,
 					       watchdog_overflow_callback, NULL);
 	if (IS_ERR(evt)) {
+		put_cpu();
 		pr_debug("Perf event create on CPU %d failed with %ld\n", cpu,
 			 PTR_ERR(evt));
 		return PTR_ERR(evt);
 	}
 	this_cpu_write(watchdog_ev, evt);
+	put_cpu();
 	return 0;
 }
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
