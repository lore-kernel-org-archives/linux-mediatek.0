Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E404C38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9hEc2Vpt24N4yt2JJ2UCDYftPyEeRKVhboZSuZeuhM=; b=CtbntxPaZNrFczwp798PO3kFGe
	vC4oJa4PJWzTQ/loI9Pf9PzxQy9w9+bvyBK/va5zrpR3aVW87INFHnCLPuw60CUbxF4zy4lX46c8d
	AmTvmq7YHEwqcWb1yMPmqkqwOPNdSfyAevwmdxL9llvn2HjFht+UXE0thNM1rjxfId6+a+p78JT4q
	KhnpdKfeP6lTO9SiWIuOA9OQNVZDFaPh8ScKS+8OrgeVMoKWQzpUAUxN41G3rORZoZcBEdYF1f34N
	EmPP9lSHFFwICmCKsLGBlaRsTcbvP3EVm/1Ch1otIYFrXgkomKP8PDm8mau6xFRUmV/eyyucUxVuF
	1PIL0W6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZzh-008G2P-Gb; Wed, 26 Oct 2022 06:34:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZzS-008Fyy-SR; Wed, 26 Oct 2022 06:34:20 +0000
X-UUID: 439ae6c087ab41948ec65efa38c8317a-20221025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E9hEc2Vpt24N4yt2JJ2UCDYftPyEeRKVhboZSuZeuhM=;
	b=JfNcQeWHdmzij3jFxMLw45TY2hFAvj0SLKp7iwD9z8v7W0LLedzI9SUNKHjUxR1eoP/1r6l+icoprzkZhIr9DiWPWLYP+e6lLoUdL7NfFWaF/9l1PPwgXTXiC45lOaTiO7tcOOdoREZY5u2SkxF0DVk0JiMkGxnHR2ZpKh1/hTc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e8014c90-756e-4622-894d-d4e667326a5b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:e01e2b27-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 439ae6c087ab41948ec65efa38c8317a-20221025
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2054355688; Tue, 25 Oct 2022 23:34:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Oct 2022 14:33:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Oct 2022 14:33:37 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Runyang Chen
	<runyang.chen@mediatek.com>
Subject: [RESEND v3 2/3] dt-bindings: reset: mt8188: add toprgu reset-controller header file
Date: Wed, 26 Oct 2022 14:33:26 +0800
Message-ID: <20221026063327.20037-3-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20221026063327.20037-1-Runyang.Chen@mediatek.com>
References: <20221026063327.20037-1-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_233414_943271_88792FD8 
X-CRM114-Status: GOOD (  10.78  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


