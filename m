Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC96AC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:20:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562CD22201
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Czh6iOD/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m9R1pokP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562CD22201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlHTnGn9XwYQiB0YWYhb0qtUWzYvTlsBEV8+96zgaHs=; b=Czh6iOD/k+wZ1suXpT6acVNjP
	FaTgRiz8MeDrSpZaSBPfAhNhPv8yKu000TC46fi0NdGjtOTSq4jp/WaiCw/Pb+4BwiM1131TK1Hgl
	K3EhgaduWTXI7yvVHnu+grE/hOGdvJ1vS5kIiOjpw8mhDqVJfyvwv3cMzMRJt/zR2s19ewzXfRoo4
	e4KUfqlKkBmG4DKAlsXtqm7TMyTAZebbwqZtJd0v6e1AStUFQFOq76ElgeonwPTLJvOECtx0yf4/6
	fL6xBdi8sUFyP1tcoF8lJL/fkvmz/cGXKhfauOayLDmfUayBJWzMm3Schh8oW9x1rWd1qnWGkJl6r
	p3AhNtrWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSghN-00027k-If; Wed, 14 Oct 2020 13:20:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgh6-00020q-Pg; Wed, 14 Oct 2020 13:19:55 +0000
X-UUID: e7f7d1930eaa4693a21af504a945653e-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0rbUbY5d6b/CqzMZNuO81lplf7j7vZlyTocLXWOmLaM=; 
 b=m9R1pokPGauzmf59bT/trKuj/TH8qtbQQDy2yNSuUH4FAeFyT2rLbS4vYSjowpOJwnrbbbvWVfPlZmxtcuRtfVM+mfKnZ6MYzlHYOaophJ5CroFErjdlIjbq/nAMCSClbAK2QadlbshVmUusDoHVtiSZhqHisvUberq57EEttlo=;
X-UUID: e7f7d1930eaa4693a21af504a945653e-20201014
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1100275202; Wed, 14 Oct 2020 05:19:45 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 06:19:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 21:19:39 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [v6,3/4] dt-binding: mt8192: add toprgu reset-controller head file
Date: Wed, 14 Oct 2020 21:19:35 +0800
Message-ID: <20201014131936.20584-4-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014131936.20584-1-crystal.guo@mediatek.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F5A6F80AD7BD25478AC14C6C4E8CC7DB10719FD8D2B222C1A33C1090362E511C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_091953_012830_3C1C87FE 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add toprgu reset-controller head file for MT8192 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h

diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
new file mode 100644
index 000000000000..be9a7ca245b9
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8192-resets.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Yong Liang <yong.liang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8192
+
+#define MT8192_TOPRGU_MM_SW_RST					1
+#define MT8192_TOPRGU_MFG_SW_RST				2
+#define MT8192_TOPRGU_VENC_SW_RST				3
+#define MT8192_TOPRGU_VDEC_SW_RST				4
+#define MT8192_TOPRGU_IMG_SW_RST				5
+#define MT8192_TOPRGU_MD_SW_RST					7
+#define MT8192_TOPRGU_CONN_SW_RST				9
+#define MT8192_TOPRGU_CONN_MCU_SW_RST			12
+#define MT8192_TOPRGU_IPU0_SW_RST				14
+#define MT8192_TOPRGU_IPU1_SW_RST				15
+#define MT8192_TOPRGU_AUDIO_SW_RST				17
+#define MT8192_TOPRGU_CAMSYS_SW_RST				18
+#define MT8192_TOPRGU_MJC_SW_RST				19
+#define MT8192_TOPRGU_C2K_S2_SW_RST				20
+#define MT8192_TOPRGU_C2K_SW_RST				21
+#define MT8192_TOPRGU_PERI_SW_RST				22
+#define MT8192_TOPRGU_PERI_AO_SW_RST			23
+
+#define MT8192_TOPRGU_SW_RST_NUM				23
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
