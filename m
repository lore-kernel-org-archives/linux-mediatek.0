Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A122C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jun 2022 13:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlAjF3bWMxO7tZo+35saMDJwn8+mwYFHL73pWqLLbUE=; b=0S2+6//yQQZtKe
	MtRTOqq6x+VKr7L4coGarGQSsb3KhHqtdeUWrlA04P/aHqIWaSFdcXgpSnTFreoteOZ/gD+RtH8ge
	D6V7V8a/uX+ZOfxA8N3yPWSXXpBhMxIrMYMW0qpXfmS+qaks2jAkfwBsIP6oBd6bcSg7a6o4Mo61T
	B0YlzCn/CSJzNGtSURMPYhiwUIpS3ECMuBOYoE+TWdknL8/FLoyKBWUYZI+62o67g+5fYwHDF/ElC
	BFtnPjrBa9cABd0S3wujR3RTy/MzFjl72j5LmGG+6oltChQxyfX962QdsTumWPVa4pl0TxWe4SaJ/
	hINY9z1musuWk07OkRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0O3D-00GhCj-O9; Sun, 12 Jun 2022 13:54:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0O2s-00Gh5r-It; Sun, 12 Jun 2022 13:54:28 +0000
X-UUID: f65a2b4361164f04aab6d0094fdc914e-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ea03803d-12f5-4e7e-a283-1df89af2180c,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:2a19b09,CLOUDID:7fa67d50-276a-4a9a-a4c8-ea931023add4,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: f65a2b4361164f04aab6d0094fdc914e-20220612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 711076549; Sun, 12 Jun 2022 06:54:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 06:54:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 12 Jun 2022 21:54:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sun, 12 Jun 2022 21:54:16 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [RFC PATCH 1/2] dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency hopping
Date: Sun, 12 Jun 2022 21:54:13 +0800
Message-ID: <20220612135414.3003-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220612135414.3003-1-johnson.wang@mediatek.com>
References: <20220612135414.3003-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_065426_666041_C7574212 
X-CRM114-Status: GOOD (  16.00  )
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

This patch adds the new binding documentation for frequency hopping
and spread spectrum clocking control on MT8186.

Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,fhctl.yaml | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
new file mode 100644
index 000000000000..9cb04bed9e86
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek frequency hopping and spread spectrum clocking control
+
+maintainers:
+  - Edward-JW Yang <edward-jw.yang@mediatek.com>
+
+description: |
+  Frequency hopping control (FHCTL) is a piece of hardware that control
+  some PLLs to adopt "hopping" mechanism to adjust their frequency.
+  Spread spectrum clocking (SSC) is another function provided by this hardware.
+
+properties:
+  compatible:
+    const: mediatek,mt8186-fhctl
+
+  reg:
+    maxItems: 2
+
+patternProperties:
+  "^map[0-9]$":
+    type: object
+    description:
+      Represents a group of PLLs controlled by the same domain and method.
+
+    properties:
+      domain:
+        description: The position of this hardware block in the chip.
+        $ref: /schemas/types.yaml#/definitions/string-array
+
+      method:
+        description: Determine which method to control this FHCTL hardware.
+        $ref: /schemas/types.yaml#/definitions/string-array
+
+    patternProperties:
+      "^armpll_(ll|bl)|(cci|main|mm|tvd|m|adsp|mfg|nna|nna2|msdc)pll$":
+        type: object
+        description:
+          A subnode represents one PLL clock. The properties it contains are
+          used to determine whether this PLL enable frequency hopping mechanism           and spread spectrum clocking (SSC) control.
+
+        properties:
+          fh-id:
+            description: The index of the PLL clocks.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          perms:
+            description:
+              This is a bit field used to manage the permission of frequency
+              hopping function and spread spectrum clocking control.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          ssc-rate:
+            description: The percentage of the spectrum spreading.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 8
+
+        required:
+          - fh-id
+          - perms
+
+    required:
+      - domain
+      - method
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8186-clk.h>
+    fhctl: fhctl@1000ce00 {
+        compatible = "mediatek,mt8186-fhctl";
+        reg = <0x1000ce00 0x200>,
+              <0x1000c000 0xe00>;
+        map0 {
+            domain = "top";
+            method = "fhctl-ap";
+
+            armpll_ll {
+                fh-id = <0>;
+                perms = <0x10>;
+            };
+
+            armpll_bl {
+                fh-id = <1>;
+                perms = <0x10>;
+            };
+
+            ccipll {
+                fh-id = <2>;
+                perms = <0x10>;
+            };
+
+            mainpll {
+                fh-id = <3>;
+                perms = <0x1c>;
+            };
+
+            mmpll {
+                fh-id = <4>;
+                perms = <0x1c>;
+            };
+
+            tvdpll {
+                fh-id = <5>;
+                perms = <0x1c>;
+            };
+
+            mpll {
+                fh-id = <6>;
+                perms = <0x10>;
+            };
+
+            adsppll {
+                fh-id = <7>;
+                perms = <0x1c>;
+            };
+
+            mfgpll {
+                fh-id = <8>;
+                perms = <0x1c>;
+            };
+
+            nnapll {
+                fh-id = <9>;
+                perms = <0x1c>;
+            };
+
+            nna2pll {
+                fh-id = <10>;
+                perms = <0x1c>;
+            };
+
+            msdcpll {
+                fh-id = <11>;
+                perms = <0x1c>;
+                ssc-rate = <3>;
+            };
+        };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
