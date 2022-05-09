Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72997C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B7/hZ3EYgn6kNYQ2ii87PTRbVxFfz54w0eLc78kMa6I=; b=v7dKgrwkU2bovb
	UrTPmqxYhb5EVQBzIi2sjcHSpGhOJzLXpSVb5Brw3W8cHNOhwX5RuSe2BTrC9EXVzAlntJ2LfrwAk
	4EvD6clNiRU4zqgWvCC8QXKbk93tl4EcnkFuP7iWv7PnLS87OemN9DVb7IRirU9cJAU0aS3OFU/WB
	s21euknBmPYBdL1fntRtYGLBjm6qktERU3ceSk1HcIvSEaKb+3PBeSw8KpyNk03ajCxVA9Gma+nQu
	3bK5nIMC3Rj1We53/Vnd2rZe9WEFg5vr0WhsFwlEFUTVaVsKnnRli1GeqmGLBpZ+p3QDlxZQb4k4U
	5e2OI1v9CftZEP4376vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnsc4-00C0sT-3g; Mon, 09 May 2022 01:55:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnsbr-00C0pl-5Y; Mon, 09 May 2022 01:54:54 +0000
X-UUID: 8c570b0ef5134c0db6e6cc41db7c6bd1-20220508
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f2b41f93-cce9-43e5-a369-b33ae9f8e468, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:ae0b09b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8c570b0ef5134c0db6e6cc41db7c6bd1-20220508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 120135678; Sun, 08 May 2022 18:54:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 May 2022 18:45:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 9 May 2022 09:45:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 May 2022 09:45:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH v4] dt-bindings: nvmem: convert mtk-efuse.txt to YAML schema
Date: Mon, 9 May 2022 09:45:21 +0800
Message-ID: <20220509014521.10248-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_185451_243757_CB261506 
X-CRM114-Status: GOOD (  14.21  )
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

Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: fix duplicated unit-address in example;
    drop reviewed-by Rob, due to changes;

v3: add reviewed-by Rob

v2:
   1. remove description of subnodes which is covered by nvmem.yaml suggested by Rob
   2. change the example which is commoner than mt8173's

---
 .../bindings/nvmem/mediatek,efuse.yaml        | 86 +++++++++++++++++++
 .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ----------
 2 files changed, 86 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
new file mode 100644
index 000000000000..abb8b85655fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek efuse device tree bindings
+
+description: |
+  MediaTek's efuse is used for storing calibration data, it can be accessed
+  on ARM devices usiong I/O mapped memory.
+
+maintainers:
+  - Andrew-CT Chen <andrew-ct.chen@mediatek.com>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  $nodename:
+    pattern: "^efuse@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt7622-efuse
+              - mediatek,mt7623-efuse
+              - mediatek,mt8173-efuse
+              - mediatek,mt8192-efuse
+              - mediatek,mt8195-efuse
+              - mediatek,mt8516-efuse
+          - const: mediatek,efuse
+      - const: mediatek,mt8173-efuse
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@11c10000 {
+        compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
+        reg = <0x11c10000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        u3_tx_imp_p0: usb3-tx-imp@184,1 {
+            reg = <0x184 0x1>;
+            bits = <0 5>;
+        };
+        u3_rx_imp_p0: usb3-rx-imp@184,2 {
+            reg = <0x184 0x2>;
+            bits = <5 5>;
+        };
+        u3_intr_p0: usb3-intr@185 {
+            reg = <0x185 0x1>;
+            bits = <2 6>;
+        };
+        comb_tx_imp_p1: usb3-tx-imp@186,1 {
+            reg = <0x186 0x1>;
+            bits = <0 5>;
+        };
+        comb_rx_imp_p1: usb3-rx-imp@186,2 {
+            reg = <0x186 0x2>;
+            bits = <5 5>;
+        };
+        comb_intr_p1: usb3-intr@187 {
+            reg = <0x187 0x1>;
+            bits = <2 6>;
+        };
+        u2_intr_p0: usb2-intr-p0@188,1 {
+            reg = <0x188 0x1>;
+            bits = <0 5>;
+        };
+        u2_intr_p1: usb2-intr-p1@188,2 {
+            reg = <0x188 0x2>;
+            bits = <5 5>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
deleted file mode 100644
index 39d529599444..000000000000
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-= Mediatek MTK-EFUSE device tree bindings =
-
-This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
-
-Required properties:
-- compatible: should be
-	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
-	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
-	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
-	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
-	      "mediatek,mt8195-efuse", "mediatek,efuse": for MT8195
-	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
-- reg: Should contain registers location and length
-- bits: contain the bits range by offset and size
-
-= Data cells =
-Are child nodes of MTK-EFUSE, bindings of which as described in
-bindings/nvmem/nvmem.txt
-
-Example:
-
-	efuse: efuse@10206000 {
-		compatible = "mediatek,mt8173-efuse";
-		reg	   = <0 0x10206000 0 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		/* Data cells */
-		thermal_calibration: calib@528 {
-			reg = <0x528 0xc>;
-		};
-	};
-
-= Data consumers =
-Are device nodes which consume nvmem data cells.
-
-For example:
-
-	thermal {
-		...
-		nvmem-cells = <&thermal_calibration>;
-		nvmem-cell-names = "calibration";
-	};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
