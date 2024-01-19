Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F94C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKHbaajHnQvvPjqGOqfRSPnn9K+Y+EmUMUlxyszHpJA=; b=OrtKDyg3z8WY38o+IE0yLD50tK
	DLg2+S2VmDMk6QBS8wol1q3qiwPenIWu9TTFYEQmwobmGbnvPSkZOSf3RGdP+FFiubAY8AJfoQChm
	OPjiofKH+xgjL4Q5eGLxAWFo5OKU5674sn1o8LK/f+a3Wb15br/mjZiRfNE81kZcs+/5CISkVLKDW
	wAxtdwYSDLCuqVBuNfD9H8xsMi3p2PglVGm2qtss0Q2bHUKvVmgEgVAcsAGP9moP9R2MQGbEZ+q9/
	jR7vTP615pht0IXoiOwa+ri7JagItvI5ECBerKkq1DMyH6KNDcMJX0r6PyCjl8+nyJiuHjhm91QWU
	odHjQz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmOV-00587j-2w;
	Fri, 19 Jan 2024 10:46:39 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmNu-0057ax-1p;
	Fri, 19 Jan 2024 10:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705661158;
	bh=yMBnHD84devz8pBb0bWiL0F28mWeot+MVGjDOv5Z7as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=4Shbc6VRqhEa23YWSU8byPvUmRnm4h/gsWjKVJhGi4eNs0oVeQXY19FIolPUAkJZS
	 D8hkRHxuIAD44Cblwc1NDspTmtaWc5wiABxeT4KHJQd7fCBmoietIgWiSRARDi2ZgO
	 yxSuCne0OPu0K93fPILgjxmmT+6D15aCmQIzNM9fAnmOrEyYIb0/AVw1+su1Kqc3IY
	 nnXnuRb5Xl1kMBDvy31HhqzdzfwcD3jBEXUsF1M9uKyNl/Rnmco32CeHZyUPZQHCx+
	 ClE/mvHn4RWZ7PP4ChBtaRvDDHpVwPKVA/2BhyocRzHwR2H5zWhOPBSyirf2Evm8c1
	 HjEDlonA0/tpw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7E00A378207E;
	Fri, 19 Jan 2024 10:45:57 +0000 (UTC)
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
Subject: [PATCH 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode Passive MUX
Date: Fri, 19 Jan 2024 11:45:49 +0100
Message-ID: <20240119104550.140061-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119104550.140061-1-angelogioacchino.delregno@collabora.com>
References: <20240119104550.140061-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_024602_754747_9B9EE4E3 
X-CRM114-Status: GOOD (  12.25  )
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


