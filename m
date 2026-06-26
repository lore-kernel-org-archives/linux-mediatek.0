Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDCCDE00E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3Jp96yby4mBloce1WqC7k3yvfuGDAMz6lqsjN7sDIA=; b=DCQpHWbKGkxNaXB3j2sAN1LesH
	/oFnzUp1VwfAwfKtw2Tc9ZOYkr3JdeJqCO282DyeV82Ejk62SByWdgrNoihoF4U9YlLeiJ9Zm5pNS
	bK7qNYPXikmpFmCc3SqAgXB8CyNVMuqZgPrq2r+eaNd6BQxHIyCj+2Ljt5Sg9sknIHeM3hh/Zeo2/
	D/aO3j8LWCfCZgmxjMtHT/u8wiC3IaEkA07fmv7Ct9dBY4SNNoGI6FpsoB95b3gOh9/CJalYpRAzJ
	xZxn/n63gTStljaOyTr/SAXDki1eKLh/+DwRs2e4a5SqI0b/B5Y2VTnDZevx5LgI/tI12fOorsdP5
	uxDaGW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ih-0000000AiUs-04na;
	Fri, 26 Jun 2026 07:48:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ic-0000000AiSd-2mD0
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 07:48:32 +0000
X-UUID: 69c49bd0713311f1acbe4559397dec65-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B3Jp96yby4mBloce1WqC7k3yvfuGDAMz6lqsjN7sDIA=;
	b=PpSnV0DmHdP9cn+YykHB1cicQEmCZZb5fNFwnlyTkGgUSp++A7kZfdMiKFnHJE2o5FnDCWSu0v7p46Mm3U5+f7/ek8bzTvjx5cdxTAUuJVQ4Dkm9LwbwmmDvy/IQYrXf1h258GFYI+G9dr1XSKj9+xw5rIMJPfEh3dPDeQjnEbI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:34594d7d-9a18-487d-8290-06072bb7270a,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:834296da-5eb1-42d4-aa37-265f0625e786,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|123|136|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:97|99|83|106|11|1,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 69c49bd0713311f1acbe4559397dec65-20260626
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2090192131; Fri, 26 Jun 2026 00:48:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 15:48:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 15:48:22 +0800
From: <peter.wang@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-devicetree@vger.kernel.org>, <peter.wang@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 1/2] Documentation: dt: reset: add mediatek,syscon-reset binding
Date: Fri, 26 Jun 2026 15:46:08 +0800
Message-ID: <20260626074820.2537772-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626074820.2537772-1-peter.wang@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004830_711944_AE6530F7 
X-CRM114-Status: GOOD (  16.73  )
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

From: Peter Wang <peter.wang@mediatek.com>

Add Device Tree binding documentation for the MediaTek SYSCON reset
controller (mediatek,syscon-reset). This binding describes a reset
controller that is part of a MediaTek SYSCON MFD block and manages
multiple reset lines within that block.

The reset lines are defined via the 'mediatek,reset-bits' property,
where each entry is a five-cell tuple specifying the register offsets
and bit positions for asserting and deasserting a reset line:

  <set_offset set_bit clear_offset clear_bit delay_us>

Consumers reference individual reset lines by index into this list
using the standard '#reset-cells = <1>' scheme.

An example is provided showing a UFS subsystem use case, where the
reset controller is instantiated as a child node of the UFS syscon
MFD node.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 .../bindings/reset/mediatek,syscon-reset.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
new file mode 100644
index 000000000000..45520ae6f090
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SYSCON Reset Controller
+
+maintainers:
+  - Peter Wang <peter.wang@mediatek.com>
+
+description: |
+  This describes a reset controller which is part of a MediaTek SYSCON block
+  and is designed to manage multiple reset lines within that block.
+
+  The node should be a child of a syscon MFD node; it uses the parent's
+  regmap and therefore does not require its own 'reg' property.
+
+  The reset specifier for consumers is an index into the 'mediatek,reset-bits'
+  list. For example, to reference the second reset line:
+
+    resets = <&ufs0cfgao_rst 1>;
+    reset-names = "hci_rst";
+
+properties:
+  compatible:
+    const: mediatek,syscon-reset
+
+  '#reset-cells':
+    const: 1
+    description:
+      The cell should contain the index into the 'mediatek,reset-bits'
+      property to select the specific reset line.
+
+  mediatek,reset-bits:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 64
+    description: |
+      A list of reset bit definitions. Each reset line is defined by a
+      five-cell entry: <set_offset set_bit clear_offset clear_bit delay_us>.
+      The reset specifier in the consumer driver will be an index into
+      this list. Up to 64 reset lines are supported per controller instance.
+    items:
+      items:
+        - description: >
+            Register offset from the parent syscon base for asserting
+            the reset. Must be 4-byte aligned.
+          minimum: 0
+          multipleOf: 4
+        - description: >
+            Bit index (0-based) within the register for asserting reset.
+          minimum: 0
+          maximum: 31
+        - description: >
+            Register offset from the parent syscon base for deasserting
+            the reset. Must be 4-byte aligned.
+          minimum: 0
+          multipleOf: 4
+        - description: >
+            Bit index (0-based) within the register for deasserting reset.
+          minimum: 0
+          maximum: 31
+        - description: >
+            Minimum delay in microseconds between assertion and deassertion
+            during a full reset cycle. Use 0 if no delay is required.
+          minimum: 0
+          maximum: 1000000
+
+required:
+  - compatible
+  - '#reset-cells'
+  - mediatek,reset-bits
+
+additionalProperties: false
+
+examples:
+  - |
+    ufs0cfg_ao: syscon@16840000 {
+        compatible = "mediatek,mt8183-ufs0cfg_ao", "syscon", "simple-mfd";
+        reg = <0x16840000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ufs0cfgao_rst: reset-controller {
+            compatible = "mediatek,syscon-reset";
+            #reset-cells = <1>;
+            mediatek,reset-bits =
+                <0x48  3  0x4c  3  100>,
+                <0x148 0  0x14c 0  100>,
+                <0x148 1  0x14c 1  100>,
+                <0x148 2  0x14c 2  0>;
+        };
+    };
-- 
2.45.2


