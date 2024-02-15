Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B25C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyQwwuue8k9ICWXs7lfHS125lsG5ogkRl5B14tgL/Bw=; b=s39f5YXYxCoF3xGkqOW8HruEa3
	KkysOfiQPDvgBg01ySi0OYj24dgGMPG+PmRb5XcbbKj8zozxohsDq+rGzh+8bHsTqvwgkqRmDm8pf
	7QhQqi6NPS2yfS+gc9WAfRZ9Qy09AoUm0jYBP9xPIctI/PtRdSPMICzgSTcgr0i9o8Jp6tvm/n/Yc
	ZTyCTcLKbxB+Pa5/GRJJYyA+gVb+lTCnhRQbo8TTH/KfHiSPC0JVf5ljUga3VwzKKFT6+NMU+lKm2
	utLqqQc7uNBzGzuGBPsj0C96seTkeBUNmeD4pbO9usIELiLjvlZksKBaVTzK7wRMIwm9e7pdaOnvv
	yYC4Jigg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6h-0000000Faum-3xNW;
	Thu, 15 Feb 2024 09:32:39 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6Q-0000000FaiN-4AuW;
	Thu, 15 Feb 2024 09:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707989543; x=1739525543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hyQwwuue8k9ICWXs7lfHS125lsG5ogkRl5B14tgL/Bw=;
  b=LcJ+yCnoqGMXqe5trZ4aOWk82qUlu/EYcQqSZRKjax0GPsHBGK78t/9L
   09Sq8FyuYDUoZPxxJ7Erc/Z0V5J6zOagY7zE1BSuZ1CiEJWoG6ZpeMI7v
   I+CqV2p9zPg3wFrPOHYCnyhQO3BJtnRF0vRgwaU/xfgsx8nQ/UVvNEMAJ
   YATu2iVpGtuwB1tKm4UmNU7ehUrP7EoncCnDJa9YHkfqvMUMSainaZmlL
   bQGlnkOPiUnWMjmWywz4x1txEFaRKAU3SVjwD+ux2ujHv0+bfR1y5D9US
   2jOH5V54b38MzpAlgO++Z/Q912//Tz/aN6Guw0Hoix7eCgAOzZrJpx5ui
   Q==;
X-IronPort-AV: E=Sophos;i="6.06,161,1705359600"; 
   d="scan'208";a="35420059"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Feb 2024 10:32:16 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2BBAA280084;
	Thu, 15 Feb 2024 10:32:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: extcon-usb-gpio: convert to DT schema format
Date: Thu, 15 Feb 2024 10:32:13 +0100
Message-Id: <20240215093214.796821-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
References: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_013223_486556_4D24D9B2 
X-CRM114-Status: GOOD (  16.59  )
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

Convert the binding to DT schema format. Change the GPIO properties to new
naming convention using -gpios as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
 .../bindings/extcon/extcon-usb-gpio.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
deleted file mode 100644
index dfc14f71e81fb..0000000000000
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-USB GPIO Extcon device
-
-This is a virtual device used to generate USB cable states from the USB ID pin
-connected to a GPIO pin.
-
-Required properties:
-- compatible: Should be "linux,extcon-usb-gpio"
-
-Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
-- id-gpio: gpio for USB ID pin. See gpio binding.
-- vbus-gpio: gpio for USB VBUS pin.
-
-Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
-	extcon_usb1 {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
-	}
-
-	&omap_dwc3_1 {
-		extcon = <&extcon_usb1>;
-	};
diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
new file mode 100644
index 0000000000000..136f865b87816
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/extcon-usb-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB GPIO Extcon device
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+
+description:
+  This is a virtual device used to generate USB cable states from the
+  USB ID pin connected to a GPIO pin.
+  Deprecated, use USB connector node instead.
+
+deprecated: true
+
+properties:
+  compatible:
+    const: linux,extcon-usb-gpio
+
+  id-gpios:
+    description: An input gpio for USB ID pin.
+    maxItems: 1
+
+  vbus-gpios:
+    description: An input gpio for USB VBus pin, used to detect presence of
+      VBUS 5V.
+    maxItems: 1
+
+required:
+  - compatible
+
+anyOf:
+  - required:
+      - id-gpios
+  - required:
+      - vbus-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    extcon-usb1 {
+      compatible = "linux,extcon-usb-gpio";
+      id-gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+      vbus-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.34.1


