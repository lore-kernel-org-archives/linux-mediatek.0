Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B785C2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLi9Y9lzraMMjpBP1+i+VEvrdSAb0bYIQ6O9q2fTfg4=; b=T+wl8lqfQsjMB12Ihh7FKXk8Ns
	cYrHDZ7rhlovGE6AYENcOxkwYFaZcgege8vPDC8f6fpiRqYloekTR/yqq5AtZfCz+8ku9JPwefcIe
	2S5uN/aejH+Kmg6J5bq8782Se7zJSpitafE+dVsXEFbjMn5ChZyYVOx55ZI/P2RrhD68YjExUnn52
	7cWmzG9nxUtGED8GIYYkAAWmPO4A8tUIzLIxG/QpNivuiVzXsrkKnb7PlI5OQFI1Ig2MlzGV0W2eM
	KFngLyFO/i+Nk4M5BgFlMVy+Z+nEKM2b0olEO/GQyuZmyeZNreF0ICU9tHn9MGoc/OrE98iB+dUiA
	V98nM9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqnl-00Ema3-IG; Tue, 16 Aug 2022 07:15:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqnG-00Elof-VG; Tue, 16 Aug 2022 07:15:20 +0000
X-UUID: cff163f80255462bb4ee99c1bd54d3d3-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yLi9Y9lzraMMjpBP1+i+VEvrdSAb0bYIQ6O9q2fTfg4=;
	b=oroPVetDsuXdmmlGe7LtTtft0sZ+jPWE2S11V1bck8HmWswCoNxhYnxVFSnkSx1b1bAO0V+frKfKKUUd2Vz5TXS7wSbu+52vMMH69zu3M6RWIJWUgzQmTCqy2yzDsLnomi0iaytQS0vtUEc5/pfbYZkrMvvgEZV7FxH6KAXphq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a67e9213-8ccf-4b76-aa81-aac2a4160d12,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9ab6f1ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cff163f80255462bb4ee99c1bd54d3d3-20220816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1924044677; Tue, 16 Aug 2022 00:15:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 14:53:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 14:53:46 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Runyang Chen" <runyang.chen@mediatek.com>
Subject: [PATCH v2 2/3] dt-bindings: reset: mt8188: add toprgu reset-controller header file
Date: Tue, 16 Aug 2022 14:53:29 +0800
Message-ID: <20220816065330.27570-3-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
References: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_001519_160293_D6EEDE73 
X-CRM114-Status: GOOD (  10.33  )
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


