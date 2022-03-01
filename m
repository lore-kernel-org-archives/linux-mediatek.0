Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 05:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEKOtq7FelO0+4Sb8ceex1aluIaWxEVTyQ8XedAflVc=; b=Mcp4t8IVBIbHlE
	X5baergz0YCCLRyg+hD4evXGaQKyQjcoy5vhWVjNaHndOPESSB28q3+AygAtOLKWPHlDo/NyzGNqM
	xgg5BhaWmerekxaDS4lhrx+T1xYumK7MsWNH8cfrFHw4Rkq0MEIB16vEzLXanpAJM7Iv4Uj935MXW
	RTAuto0ZkXVJiU4DjOyHHMbKzPDSw8hkKqdatlcuqTGA8MDGnRQmrOF4SXHedP4Yur88z1AYImMYy
	Ec7ONZC0U6RwP1fgZeZtE6Yk7nCdonZg3ovHMywPQ4V16wHohXSrYhHuURGF66zxDRP1YzaidLJCW
	kADOieHtdOd+KEi7MfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvKL-00F4CT-18; Tue, 01 Mar 2022 05:45:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvJ2-00F3gK-O6; Tue, 01 Mar 2022 05:44:18 +0000
X-UUID: 1b10190a4d0a4496a8ef9f65b6bab34f-20220228
X-UUID: 1b10190a4d0a4496a8ef9f65b6bab34f-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 950570796; Mon, 28 Feb 2022 22:39:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 21:37:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 13:37:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 13:37:35 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 2/3] dt-bindings: reset: mt8186: add reset-controller header
 file
Date: Tue, 1 Mar 2022 13:37:32 +0800
Message-ID: <20220301053733.24755-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220301053733.24755-1-rex-bc.chen@mediatek.com>
References: <20220301053733.24755-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_214416_816102_0133EE54 
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

From: Runyang Chen <runyang.chen@mediatek.com>

1. Add toprgu reset-controller header file for MT8186.
2. Add DSI software reset bit which is controlled in MMSYS for MT8186.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 include/dt-bindings/reset/mt8186-resets.h | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8186-resets.h

diff --git a/include/dt-bindings/reset/mt8186-resets.h b/include/dt-bindings/reset/mt8186-resets.h
new file mode 100644
index 000000000000..5f850370c42c
--- /dev/null
+++ b/include/dt-bindings/reset/mt8186-resets.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Runyang Chen <runyang.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8186
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8186
+
+#define MT8186_TOPRGU_INFRA_SW_RST				0
+#define MT8186_TOPRGU_MM_SW_RST					1
+#define MT8186_TOPRGU_MFG_SW_RST				2
+#define MT8186_TOPRGU_VENC_SW_RST				3
+#define MT8186_TOPRGU_VDEC_SW_RST				4
+#define MT8186_TOPRGU_IMG_SW_RST				5
+#define MT8186_TOPRGU_DDR_SW_RST				6
+#define MT8186_TOPRGU_INFRA_AO_SW_RST				8
+#define MT8186_TOPRGU_CONNSYS_SW_RST				9
+#define MT8186_TOPRGU_APMIXED_SW_RST				10
+#define MT8186_TOPRGU_PWRAP_SW_RST				11
+#define MT8186_TOPRGU_CONN_MCU_SW_RST				12
+#define MT8186_TOPRGU_IPNNA_SW_RST				13
+#define MT8186_TOPRGU_WPE_SW_RST				14
+#define MT8186_TOPRGU_ADSP_SW_RST				15
+#define MT8186_TOPRGU_AUDIO_SW_RST				17
+#define MT8186_TOPRGU_CAM_MAIN_SW_RST				18
+#define MT8186_TOPRGU_CAM_RAWA_SW_RST				19
+#define MT8186_TOPRGU_CAM_RAWB_SW_RST				20
+#define MT8186_TOPRGU_IPE_SW_RST				21
+#define MT8186_TOPRGU_IMG2_SW_RST				22
+#define MT8186_TOPRGU_SW_RST_NUM				23
+
+/* MMSYS resets */
+#define MT8186_MMSYS_SW0_RST_B_DISP_DSI0			19
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
