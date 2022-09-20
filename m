Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA39C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLi9Y9lzraMMjpBP1+i+VEvrdSAb0bYIQ6O9q2fTfg4=; b=RV9xDdfa/npUGHsnyYhKg1jMyg
	9J6mCwAgANXRkXOR67U1+qasdsZBgCdC5LDwU0sZJhfu1Q1rhSXNnj0x4XOTUBBo/dzY7xoH2s6LX
	S3ScBvAyLMLkfmBRF1TN7kXDe72nUyMSLc0KTH/iq/Lfy1SFMDlrVb1Y0WR82dw00KOvPc3+bxze3
	dKmFPXXfTW/nud1B5CBGhZCGpf0h2n6vn4ZRXx2B4NQ/QxX25XI2/qh0a1TjRJeXDVySHbKou83wD
	2sx+WNoVywmbmLQJsLNi1cr4584dtKgAHF56wOiVZYalBSmr4AexkfaLvHEbYgCCq6u0VAEIWxwNn
	6r4sRm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oab6O-003B49-6Y; Tue, 20 Sep 2022 11:07:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oab6L-003B20-FY; Tue, 20 Sep 2022 11:07:43 +0000
X-UUID: 5efd892554d64015bf69a28d4ca800f7-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yLi9Y9lzraMMjpBP1+i+VEvrdSAb0bYIQ6O9q2fTfg4=;
	b=hwiThbWLJNdNunaEUQOOCX2rWzBE26t2k4eu72MTijmpNCClRrB/aa7mA3nDknBAefeP2JSKJNvzclItYYHrt8S3fjLGz7c4wWyh+JS7pZ4bLkA2Ydz1TFLFus4aFPq/i7M2TJcZURKy4pixJA65TMaUq+DMpU4QX4Y5FL8i2LQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8c33250f-8251-4255-8349-ac89fcb70642,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ea9008f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5efd892554d64015bf69a28d4ca800f7-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1932841483; Tue, 20 Sep 2022 04:07:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 18:56:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 18:56:30 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Runyang
 Chen <runyang.chen@mediatek.com>
Subject: [PATCH v3 2/3] dt-bindings: reset: mt8188: add toprgu reset-controller header file
Date: Tue, 20 Sep 2022 18:56:21 +0800
Message-ID: <20220920105622.25666-3-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_040741_766880_A2200575 
X-CRM114-Status: GOOD (  11.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Runyang Chen <runyang.chen@mediatek.com>

Add toprgu reset-controller header file for MT8188

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/mt8188-resets.h | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8188-resets.h

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
new file mode 100644
index 000000000000..377cdfda82a9
--- /dev/null
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)*/
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Runyang Chen <runyang.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8188
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8188
+
+#define MT8188_TOPRGU_CONN_MCU_SW_RST          0
+#define MT8188_TOPRGU_INFRA_GRST_SW_RST        1
+#define MT8188_TOPRGU_IPU0_SW_RST              2
+#define MT8188_TOPRGU_IPU1_SW_RST              3
+#define MT8188_TOPRGU_IPU2_SW_RST              4
+#define MT8188_TOPRGU_AUD_ASRC_SW_RST          5
+#define MT8188_TOPRGU_INFRA_SW_RST             6
+#define MT8188_TOPRGU_MMSYS_SW_RST             7
+#define MT8188_TOPRGU_MFG_SW_RST               8
+#define MT8188_TOPRGU_VENC_SW_RST              9
+#define MT8188_TOPRGU_VDEC_SW_RST              10
+#define MT8188_TOPRGU_CAM_VCORE_SW_RST         11
+#define MT8188_TOPRGU_SCP_SW_RST               12
+#define MT8188_TOPRGU_APMIXEDSYS_SW_RST        13
+#define MT8188_TOPRGU_AUDIO_SW_RST             14
+#define MT8188_TOPRGU_CAMSYS_SW_RST            15
+#define MT8188_TOPRGU_MJC_SW_RST               16
+#define MT8188_TOPRGU_PERI_SW_RST              17
+#define MT8188_TOPRGU_PERI_AO_SW_RST           18
+#define MT8188_TOPRGU_PCIE_SW_RST              19
+#define MT8188_TOPRGU_ADSPSYS_SW_RST           21
+#define MT8188_TOPRGU_DPTX_SW_RST              22
+#define MT8188_TOPRGU_SPMI_MST_SW_RST          23
+
+#define MT8188_TOPRGU_SW_RST_NUM               24
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.18.0


