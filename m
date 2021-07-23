Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13771C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B2660EC0
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4B2660EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRuT15kiBOopYyW3WI4EuI/1qDVh1QdNWjJ12jnGKBk=; b=V3lVPpv4zg5UyD
	umDVItT0z6bDEelqETS1OMHShqRuly01ICN+Bk0KwAwR70HtkMRMQNN9rCIf15XZqqITr61UcIU0H
	5VeAwAqLnpReMeNYOPBX2OpTlFbFXTh6MAlTSvey7ReoZ4Jvaxx9jwX+wP6R5BY6hVty+grejvB7u
	HxPT6Hzxctjx+PxsiAU0jXB97Ftof2OBgzwXB2PN7gXmaTLqxIhkyRf7V5wpDlAZ/xySG6cilofBq
	B9VD30MbGjvzW0WfzkJnQKotUBZmMHY2hdKP7GKzIf+LCmqmfRPewBcA70gEl54a6IQUiXZHSx50i
	Ll2Z05yz9VWwp1nmDzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rrG-004CPl-VA; Fri, 23 Jul 2021 09:52:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rqp-004CID-Bf; Fri, 23 Jul 2021 09:52:16 +0000
X-UUID: 490e45cf745944f8b0f0d658066d2c90-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HNWHnwuQWhIXc/gBtz94cxVbyXGSbWRy6UjL+GJ49JY=; 
 b=PJi6qKe1nX9/UaSYUfiu7iith5KUEjHWXvX0q//oaJTOF2rcU0FPomam8ya5R5AX281rf5CQoEtpvjdfKfG+N2KznDralWiWr2LUb9vsi2Qat3XkwGX5mvNjW+bRzWPiEo8DZtZ3WSVINJHaMSYtg7MRi1cmtucMvm+gdvVAjQU=;
X-UUID: 490e45cf745944f8b0f0d658066d2c90-20210723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1698618711; Fri, 23 Jul 2021 02:52:14 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 02:42:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 17:42:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 17:42:11 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <seiya.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>, Christine Zhu
 <Christine.Zhu@mediatek.com>
Subject: [v6,
 2/3] dt-bindings: reset: mt8195: add toprgu reset-controller header
 file
Date: Fri, 23 Jul 2021 17:41:37 +0800
Message-ID: <20210723094138.24793-3-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210723094138.24793-1-Christine.Zhu@mediatek.com>
References: <20210723094138.24793-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_025215_449833_C06D7D53 
X-CRM114-Status: GOOD (  11.76  )
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

Add toprgu reset-controller header file for MT8195 platform

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
---
 .../reset-controller/mt8195-resets.h          | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h

diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h
new file mode 100644
index 000000000000..8176a3e5063f
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8195-resets.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either licens
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Christine Zhu <christine.zhu@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
+
+#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
+#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
+#define MT8195_TOPRGU_APU_SW_RST               2
+#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
+#define MT8195_TOPRGU_MMSYS_SW_RST             7
+#define MT8195_TOPRGU_MFG_SW_RST               8
+#define MT8195_TOPRGU_VENC_SW_RST              9
+#define MT8195_TOPRGU_VDEC_SW_RST              10
+#define MT8195_TOPRGU_IMG_SW_RST               11
+#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
+#define MT8195_TOPRGU_AUDIO_SW_RST             14
+#define MT8195_TOPRGU_CAMSYS_SW_RST            15
+#define MT8195_TOPRGU_EDPTX_SW_RST             16
+#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
+#define MT8195_TOPRGU_DPTX_SW_RST              22
+#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
+
+#define MT8195_TOPRGU_SW_RST_NUM               16
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
