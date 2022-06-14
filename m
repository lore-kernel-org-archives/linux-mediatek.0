Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C27C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypGx9wTQy3H6n+czxOBkLuIS2ed5Ho9JDbybH8CUrrs=; b=QCMYzkZUYlU9JL
	yxZJVQBJY/Hdxx6jxx+iOoKIEIUPOyVV7ZCttuPq7nN/SvLv5w0k2mR9gTtEqBni1rdAGoAXKFINu
	KK1W3qzwBs7VNwjAlDmGRQDc2ps+jOMKx2UoMp30ByauHrPfHyTTXeyKlNCA0wib1Q6doB0/k29n0
	Ua6YhYupzW6ONo0j+SBV6C4SWpUmTRGIMvGypexrfkvQs0PEbnZNcFlkBIOhKEKS/Fk5Rh/fz5THk
	yxwZCpQrHO7BXzRJ1mH6Gi14Fo7L50yE8g2/Rq1a/cefGtkgPpuLZGMV/y8nLaQudnZu5OPMhlvJ3
	C/b0aqWt5lwGmeBWC46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10Bg-007JBb-36; Tue, 14 Jun 2022 06:38:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10B9-007J0V-9i; Tue, 14 Jun 2022 06:37:33 +0000
X-UUID: bb9e9892340b455da218941321c960df-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:f82a45bb-95eb-40e1-9259-b65762ee6487,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:ca555dc5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bb9e9892340b455da218941321c960df-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 396992583; Mon, 13 Jun 2022 23:37:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 23:28:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 14 Jun 2022 14:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jun 2022 14:28:38 +0800
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
Subject: [PATCH v6 3/6] kernel/watchdog_hld: Ensure CPU-bound context when creating hardlockup detector event
Date: Tue, 14 Jun 2022 14:28:32 +0800
Message-ID: <20220614062835.7196-4-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220614062835.7196-1-lecopzer.chen@mediatek.com>
References: <20220614062835.7196-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_233731_391784_75C243A9 
X-CRM114-Status: GOOD (  12.30  )
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
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/watchdog_hld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 701f35f0e2d4..0573cef0b9dc 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -169,10 +169,16 @@ static void watchdog_overflow_callback(struct perf_event *event,
 
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
