Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B93CCA47C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXBf1KT9o/4I5y2N22L1j1ANzcaq91W00WoW4+mZa1s=; b=rbz5M3wuOQx2s9
	neGjm6kq+3XEEBD197Ema8uLfjvbSu03VJghmeMcsyE7C5D+R2nukKxVP9phLa8pwV7HPr+EB0KOb
	koBPs5TSfd9sSA4ja6JemxxpXkih/2hWNB3gnlnsWWHlWPan3N5P2md1RtrWhvv7tMP2/Kwc/imdf
	6cm8DQzkvpTd9DUGBxx0VBEmTNF68iSlADWeNPzvivTWWaKLPRTWtd4KbBwwopI1n7zFTF8c2K8kc
	9m8Cxn3RSYTomC2+3tZAzZHMvjEDRdQtsRb4lE89ZzokgVz+7DaXA6hhpovqFGcUHUGKN+r6l3Jq9
	ZqR2KWtxegEfQi6jLPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kcY-0042PT-4y; Mon, 13 Jun 2022 14:00:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kc1-00429d-7A; Mon, 13 Jun 2022 14:00:15 +0000
X-UUID: 6605d134defc41ccbd4a9fde9535d22f-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:18ec2c99-2eb8-4a0f-a258-40689dfe1607,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:790f69c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6605d134defc41ccbd4a9fde9535d22f-20220613
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2138931547; Mon, 13 Jun 2022 07:00:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 07:00:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 21:59:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 13 Jun 2022 21:59:59 +0800
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
Subject: [PATCH v5 2/6] kernel/watchdog: change watchdog_nmi_enable() to void
Date: Mon, 13 Jun 2022 21:59:52 +0800
Message-ID: <20220613135956.15711-3-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220613135956.15711-1-lecopzer.chen@mediatek.com>
References: <20220613135956.15711-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_070013_290142_46E49E29 
X-CRM114-Status: GOOD (  11.61  )
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

Nobody cares about the return value of watchdog_nmi_enable(),
changing its prototype to void.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 arch/sparc/kernel/nmi.c | 8 +++-----
 include/linux/nmi.h     | 2 +-
 kernel/watchdog.c       | 3 +--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
index 060fff95a305..5dcf31f7e81f 100644
--- a/arch/sparc/kernel/nmi.c
+++ b/arch/sparc/kernel/nmi.c
@@ -282,11 +282,11 @@ __setup("nmi_watchdog=", setup_nmi_watchdog);
  * sparc specific NMI watchdog enable function.
  * Enables watchdog if it is not enabled already.
  */
-int watchdog_nmi_enable(unsigned int cpu)
+void watchdog_nmi_enable(unsigned int cpu)
 {
 	if (atomic_read(&nmi_active) == -1) {
 		pr_warn("NMI watchdog cannot be enabled or disabled\n");
-		return -1;
+		return;
 	}
 
 	/*
@@ -295,11 +295,9 @@ int watchdog_nmi_enable(unsigned int cpu)
 	 * process first.
 	 */
 	if (!nmi_init_done)
-		return 0;
+		return;
 
 	smp_call_function_single(cpu, start_nmi_watchdog, NULL, 1);
-
-	return 0;
 }
 /*
  * sparc specific NMI watchdog disable function.
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 750c7f395ca9..b7bcd63c36b4 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -119,7 +119,7 @@ static inline int hardlockup_detector_perf_init(void) { return 0; }
 void watchdog_nmi_stop(void);
 void watchdog_nmi_start(void);
 int watchdog_nmi_probe(void);
-int watchdog_nmi_enable(unsigned int cpu);
+void watchdog_nmi_enable(unsigned int cpu);
 void watchdog_nmi_disable(unsigned int cpu);
 
 /**
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 066ad3017767..458737bc4e35 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -93,10 +93,9 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
  * softlockup watchdog start and stop. The arch must select the
  * SOFTLOCKUP_DETECTOR Kconfig.
  */
-int __weak watchdog_nmi_enable(unsigned int cpu)
+void __weak watchdog_nmi_enable(unsigned int cpu)
 {
 	hardlockup_detector_perf_enable();
-	return 0;
 }
 
 void __weak watchdog_nmi_disable(unsigned int cpu)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
