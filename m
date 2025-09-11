Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FCCAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiGFEztwajuMfRUT3GriPKEySRok+K21Z8cbZsV3sZU=; b=AOLOuusMuRgPhU1+wIOjtCdyow
	ZjEVuLkT3tRFm9Wx59XWyDJ7bseF66Ab7IpNU81AEJf3G1q/bsg6xNYkkFPMDo6Qs6MgG0lBp2qah
	F3hcX6dULzEP8lkq8FON6TutJ2zQfWi/4g1AmPy7+Bq2hdTWSLALZI1LuCt1nEl0gbApzDn4EgWXp
	/SuLwpz8WfjQcaYnseAkSF/vntErThfsVAG0OnVfeZAYvXwDPLPntP4DNkcdHyVdzqrPYlIY13+h0
	PoET8OIQI9Qsh4/I72wVr2a90p+bjvawpn575xuMYKVGEsqUFNj11G4+ztc09jF2q7Y4MK3k3joT/
	MR1054Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj12-00000003oPg-2B4Q;
	Thu, 11 Sep 2025 15:15:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj10-00000003oOZ-0Mli;
	Thu, 11 Sep 2025 15:15:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e+IvQJveE0D/NryFztk115aoVC0awDaoQqJr8rkbRsRQJIOhFM4IyOEBcKUaiRaGAwd+NIF3O/chVnIukEXiVAHEV+G6GRESmKozYdWD/VNUs6sTaIx8+XIZrlHZXBR4YhWec+A8uxq/YjI6ywKINBXh/s40yiffmuNEOciTdkc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603671; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UiGFEztwajuMfRUT3GriPKEySRok+K21Z8cbZsV3sZU=; 
	b=Du3ha77bu6sVlh+w5ESM91XMO8r+ri8HQn+Eu9de/+8y1BULt5RM49Ec7iL5P++SHFP/qY7tO9qkNb2UrlUIn7XBPX9EHSbPI1gwJsPUGzeu/Ttwz0zxQDOId3tf6aY1sX8gitXhvIwoUE7QbYAwSO5iJlg9KKKdTI0wG+eSjAo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603671;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UiGFEztwajuMfRUT3GriPKEySRok+K21Z8cbZsV3sZU=;
	b=QWNIuSZ/k4lgmBajDEds6zQGZh6bZ9ozj2kZz8nUUqJebkcmW056IYBhq7Hl4rqj
	iKt8TpsM8JmzPJW6LX83aCpc9z8AnO+tc0NHkZNk/2gAIpP505OfWOC+uFN2AKVLKHd
	CSmWvjQqmuF8TgAE1DMblyxNsrjbCvnJo8yCKOkQ=
Received: by mx.zohomail.com with SMTPS id 1757603670323995.4591080877603;
	Thu, 11 Sep 2025 08:14:30 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
Date: Thu, 11 Sep 2025 12:09:58 -0300
Message-ID: <20250911151001.108744-10-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081514_180017_25D7FF32 
X-CRM114-Status: GOOD (  15.11  )
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

Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
Voltage Regulators family to a DT schema. Examples are simplified, as these
are all equal.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 2 files changed, 104 insertions(+), 205 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml

diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
deleted file mode 100644
index eb871447d5082..0000000000000
--- a/Documentation/devicetree/bindings/regulator/da9211.txt
+++ /dev/null
@@ -1,205 +0,0 @@
-* Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
- Voltage Regulator
-
-Required properties:
-- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213" or "dlg,da9223"
-  or "dlg,da9214" or "dlg,da9224" or "dlg,da9215" or "dlg,da9225"
-- reg: I2C slave address, usually 0x68.
-- interrupts: the interrupt outputs of the controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name, with valid
-  values listed below. The content of each sub-node is defined by the
-  standard binding for regulators; see regulator.txt.
-  BUCKA and BUCKB.
-
-Optional properties:
-- enable-gpios: platform gpio for control of BUCKA/BUCKB.
-- Any optional property defined in regulator.txt
-  - regulator-initial-mode and regulator-allowed-modes may be specified using
-    mode values from dt-bindings/regulator/dlg,da9211-regulator.h
-
-Example 1) DA9211
-	pmic: da9211@68 {
-		compatible = "dlg,da9211";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 27 0>;
-				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
-							   DA9211_BUCK_MODE_AUTO>;
-			};
-		};
-	};
-
-Example 2) DA9212
-	pmic: da9212@68 {
-		compatible = "dlg,da9212";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 3) DA9213
-	pmic: da9213@68 {
-		compatible = "dlg,da9213";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-		};
-	};
-
-Example 4) DA9223
-	pmic: da9223@68 {
-		compatible = "dlg,da9223";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-		};
-	};
-
-Example 5) DA9214
-	pmic: da9214@68 {
-		compatible = "dlg,da9214";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 6) DA9224
-	pmic: da9224@68 {
-		compatible = "dlg,da9224";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 7) DA9215
-	pmic: da9215@68 {
-		compatible = "dlg,da9215";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 8) DA9225
-	pmic: da9225@68 {
-		compatible = "dlg,da9225";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
new file mode 100644
index 0000000000000..9d5e25bc3872c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
+  Voltage Regulator
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - dlg,da9211
+      - dlg,da9212
+      - dlg,da9213
+      - dlg,da9214
+      - dlg,da9215
+      - dlg,da9223
+      - dlg,da9224
+      - dlg,da9225
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      List of regulators provided by the device
+
+    patternProperties:
+      "^BUCK([AB])$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+        description: |
+          Properties for a single BUCK regulator
+
+        properties:
+          regulator-initial-mode:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: |
+              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          regulator-allowed-modes:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: |
+              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          enable-gpios:
+            maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/regulator/dlg,da9211-regulator.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@68 {
+            compatible = "dlg,da9212";
+            reg = <0x68>;
+            interrupts = <3 27>;
+
+            regulators {
+                BUCKA {
+                    regulator-name = "VBUCKA";
+                    regulator-min-microvolt = < 300000>;
+                    regulator-max-microvolt = <1570000>;
+                    regulator-min-microamp = <2000000>;
+                    regulator-max-microamp = <5000000>;
+                    enable-gpios = <&gpio 27 0>;
+                };
+                BUCKB {
+                    regulator-name = "VBUCKB";
+                    regulator-min-microvolt = < 300000>;
+                    regulator-max-microvolt = <1570000>;
+                    regulator-min-microamp = <2000000>;
+                    regulator-max-microamp = <5000000>;
+                    enable-gpios = <&gpio 17 0>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.50.1


