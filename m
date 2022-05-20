Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upEckIxCkSZyOJ3ti2eUojOW+jtqcRJEumaRFbSN57Q=; b=nNitDt+vqL9Fqb
	rUkwCNWyohiyGrBart063yzS13LHr9WRIK/w5iQPv1O+Ycwos70mZGA6RLBl6lz1b6/koD1xN01xN
	MXqhm+zlxiqUKHd95p40nKw/SzHMB3XnIDdfhHi3iHNOUwG6TBH0tjUzRzjUKs4ZdPSnTh0tVJ5JD
	gqVwZB/4TkOJUxaZj1p8bEqoObRdxv/BL88vaRjYznsZR+FfeDVvfm6eUHFrIiww27L1UcgTEBeDg
	TrZTvpRKXxbFBL+J9Ohjx4DIGPUY+mGnI0/Ut3eLgQ4M4w+DRx2mgOjw05sxkgg4sZnkJE9Vczcdg
	ARpsncnAIRWwciFMOj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrwSR-00ArN7-Fy; Fri, 20 May 2022 06:49:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrwSH-00ArIB-31; Fri, 20 May 2022 06:49:46 +0000
X-UUID: 47d62c5a01d04205a1d689e9be8724f1-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c55cbd36-c2cf-45b1-b075-bfb7f68d4b00, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:20
X-CID-META: VersionHash:2a19b09, CLOUDID:2537f979-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 47d62c5a01d04205a1d689e9be8724f1-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965121795; Thu, 19 May 2022 23:49:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 23:49:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 14:49:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 14:49:25 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Subject: [PATCH v9 1/2] dt-bindings: phy: mediatek: Add YAML schema for PCIe
 PHY
Date: Fri, 20 May 2022 14:49:19 +0800
Message-ID: <20220520064920.27313-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520064920.27313-1-jianjun.wang@mediatek.com>
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_234945_153367_A1FEA1F0 
X-CRM114-Status: GOOD (  13.07  )
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

Add YAML schema documentation for PCIe PHY on MediaTek chipsets.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
new file mode 100644
index 000000000000..422750cc4121
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCIe PHY
+
+maintainers:
+  - Jianjun Wang <jianjun.wang@mediatek.com>
+
+description: |
+  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
+
+properties:
+  compatible:
+    const: mediatek,mt8195-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: sif
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    maxItems: 7
+    description:
+      Phandles to nvmem cell that contains the efuse data, if unspecified,
+      default value is used.
+
+  nvmem-cell-names:
+    items:
+      - const: glb_intr
+      - const: tx_ln0_pmos
+      - const: tx_ln0_nmos
+      - const: rx_ln0
+      - const: tx_ln1_pmos
+      - const: tx_ln1_nmos
+      - const: rx_ln1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@11e80000 {
+        compatible = "mediatek,mt8195-pcie-phy";
+        #phy-cells = <0>;
+        reg = <0x11e80000 0x10000>;
+        reg-names = "sif";
+        nvmem-cells = <&pciephy_glb_intr>,
+                      <&pciephy_tx_ln0_pmos>,
+                      <&pciephy_tx_ln0_nmos>,
+                      <&pciephy_rx_ln0>,
+                      <&pciephy_tx_ln1_pmos>,
+                      <&pciephy_tx_ln1_nmos>,
+                      <&pciephy_rx_ln1>;
+        nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
+                           "tx_ln0_nmos", "rx_ln0",
+                           "tx_ln1_pmos", "tx_ln1_nmos",
+                           "rx_ln1";
+        power-domains = <&spm 2>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
