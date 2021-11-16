Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B496187F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66B496187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8phSueWAJSrQKJZDKxSTeHdJJo5IDxtvBsIB3Gcr4o=; b=GLW8hHPSiRRABB
	U+nHK//7+B/GHJRQ2XAEcKO3h85sQdEtXrJM6kV/NB8OSVdAPTXB1zcad5Cqwfs/9H5joIpgZ3DRi
	+Q9P1YDDMv2rNtO2m329rIiQgUeK5lzxpoL4B9cTusdrnUKnH6ELHnhmq5562SsFbbzGKNpE7YWKf
	g++EHwlb2nmMK8TJ1c6bMNPCGPfxr/rInSPVUQxCs6BQuAL+jw8qpPmfEchsxI/Txpl0/woxv3o6C
	o+5ynhswx59L1yYYuQZaG5bGWatmznPAIagMXNB04bqhjWiTxGUwl5eZTuUrq1A2yBM27OzJsV/0a
	gD3Gf7eLjEyIUx9cPPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmoaB-0009TO-2B; Tue, 16 Nov 2021 02:52:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmoZ6-00091p-Ou; Tue, 16 Nov 2021 02:51:22 +0000
X-UUID: deb023c376434d47859ed710b0c31bd5-20211115
X-UUID: deb023c376434d47859ed710b0c31bd5-20211115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 748379456; Mon, 15 Nov 2021 19:51:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Nov 2021 18:51:15 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Nov 2021 10:51:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Nov 2021 10:51:13 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v6 1/5] dt-bindings: power: Add MT8195 power domains
Date: Tue, 16 Nov 2021 10:50:41 +0800
Message-ID: <20211116025045.5401-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_185120_862682_3736E094 
X-CRM114-Status: GOOD (  13.74  )
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

Add power domains dt-bindings for MT8195.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
no change
---
 .../power/mediatek,power-controller.yaml      |  2 +
 include/dt-bindings/power/mt8195-power.h      | 46 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8195-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f234a756c193..d6ebd77d28a7 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -27,6 +27,7 @@ properties:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8192-power-controller
+      - mediatek,mt8195-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -64,6 +65,7 @@ patternProperties:
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
+              "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8195-power.h b/include/dt-bindings/power/mt8195-power.h
new file mode 100644
index 000000000000..b20ca4b3e3a8
--- /dev/null
+++ b/include/dt-bindings/power/mt8195-power.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8195_POWER_H
+#define _DT_BINDINGS_POWER_MT8195_POWER_H
+
+#define MT8195_POWER_DOMAIN_PCIE_MAC_P0		0
+#define MT8195_POWER_DOMAIN_PCIE_MAC_P1		1
+#define MT8195_POWER_DOMAIN_PCIE_PHY		2
+#define MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY	3
+#define MT8195_POWER_DOMAIN_CSI_RX_TOP		4
+#define MT8195_POWER_DOMAIN_ETHER		5
+#define MT8195_POWER_DOMAIN_ADSP		6
+#define MT8195_POWER_DOMAIN_AUDIO		7
+#define MT8195_POWER_DOMAIN_MFG0		8
+#define MT8195_POWER_DOMAIN_MFG1		9
+#define MT8195_POWER_DOMAIN_MFG2		10
+#define MT8195_POWER_DOMAIN_MFG3		11
+#define MT8195_POWER_DOMAIN_MFG4		12
+#define MT8195_POWER_DOMAIN_MFG5		13
+#define MT8195_POWER_DOMAIN_MFG6		14
+#define MT8195_POWER_DOMAIN_VPPSYS0		15
+#define MT8195_POWER_DOMAIN_VDOSYS0		16
+#define MT8195_POWER_DOMAIN_VPPSYS1		17
+#define MT8195_POWER_DOMAIN_VDOSYS1		18
+#define MT8195_POWER_DOMAIN_DP_TX		19
+#define MT8195_POWER_DOMAIN_EPD_TX		20
+#define MT8195_POWER_DOMAIN_HDMI_TX		21
+#define MT8195_POWER_DOMAIN_WPESYS		22
+#define MT8195_POWER_DOMAIN_VDEC0		23
+#define MT8195_POWER_DOMAIN_VDEC1		24
+#define MT8195_POWER_DOMAIN_VDEC2		25
+#define MT8195_POWER_DOMAIN_VENC		26
+#define MT8195_POWER_DOMAIN_VENC_CORE1		27
+#define MT8195_POWER_DOMAIN_IMG			28
+#define MT8195_POWER_DOMAIN_DIP			29
+#define MT8195_POWER_DOMAIN_IPE			30
+#define MT8195_POWER_DOMAIN_CAM			31
+#define MT8195_POWER_DOMAIN_CAM_RAWA		32
+#define MT8195_POWER_DOMAIN_CAM_RAWB		33
+#define MT8195_POWER_DOMAIN_CAM_MRAW		34
+
+#endif /* _DT_BINDINGS_POWER_MT8195_POWER_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
