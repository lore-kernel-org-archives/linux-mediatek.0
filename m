Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E72C47DAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKHbaajHnQvvPjqGOqfRSPnn9K+Y+EmUMUlxyszHpJA=; b=YpY1wMuQxJbNLu+kyBr4ONkMF/
	4zEMRMxjlX6DSOAXe4RUv2Sqc+8ypmwXf4N9CrLBKF/zdxo0qy378yfe8caDFXrMeTvp9wQRKHDQ6
	+GjpkODAjEFP7wI9tOPLDovkx/Og1YXvGmfbII/TxhoOBJ+VzZFqEVU/dkAnbiDosOQmVckAhHucq
	VRxFGfiJ/5+ISeS4zrjwwnq3bnG/al6H1U1e97wM/arDYPlivisbHihk3RqMAEIEA6U0thIglJdfV
	6acodZWCY1GT7yToZqPeGTh6oAFEXnsrWaCaVV7HXCVBjjV8AbDRkLu6Ev+e3IGKMUbYdrqjou0vi
	sYLJCAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQoS4-005Zid-1L;
	Fri, 19 Jan 2024 12:58:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQoRx-005Zem-2I;
	Fri, 19 Jan 2024 12:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705669098;
	bh=yMBnHD84devz8pBb0bWiL0F28mWeot+MVGjDOv5Z7as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGOGU6UzfoCntF4nff5F3P7Kmb4VSOuGSAJcJt5rGkh7SLFwKkhZELITmVDexpyMy
	 5jvj5EgS8n3dlezI1Uvk7WRMFjvav5UPYoT78yGrDKncLZd+OmCifztXmolRKsyT5M
	 DAxcRt8/OEBxc51p1n+r6aEcc17NRbdwMxjvYmtfwxxVagPJKeAXbccYQGLhs7+ocF
	 IMdxgebaGpIoKktyclXXGyPmkV8f4hpkv40DSGeVhtYDQ+7yxBe4cZe2WuCfsTPTMV
	 avtiBPrbc9+jP5Aygx1dfIqi60mi83XJbev1FAbF/fJQmbx3m38NPGRgjJ/GV3YfpA
	 wZgML5/d9XoRA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B54BB3781FF2;
	Fri, 19 Jan 2024 12:58:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	andersson@kernel.org,
	nathan@kernel.org,
	luca.weiss@fairphone.com,
	tianping.fang@mediatek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode Passive MUX
Date: Fri, 19 Jan 2024 13:58:11 +0100
Message-ID: <20240119125812.239197-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_045821_885442_94C429D5 
X-CRM114-Status: GOOD (  12.27  )
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

Introduce a binding for the ITE IT5205 Alternate Mode Passive MUX,
used for connecting, disconnecting and switching orientation and
control the SBU signals for alternate modes on USB Type-C ports.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/usb/ite,it5205.yaml   | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml

diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
new file mode 100644
index 000000000000..36ec4251b5f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ite,it5205.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT5202 Type-C USB Alternate Mode Passive MUX
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Tianping Fang <tianping.fang@mediatek.com>
+
+properties:
+  compatible:
+    const: ite,it5205
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Power supply for VCC pin (3.3V)
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  ite,ovp-enable:
+    description: Enable Over Voltage Protection functionality
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the IT5205 to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - orientation-switch
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@48 {
+          compatible = "ite,it5205";
+          reg = <0x48>;
+
+          mode-switch;
+          orientation-switch;
+
+          vcc-supply = <&mt6359_vibr_ldo_reg>;
+
+          port {
+            it5205_usbss_sbu: endpoint {
+              remote-endpoint = <&typec_controller>;
+            };
+          };
+        };
+    };
+...
-- 
2.43.0


