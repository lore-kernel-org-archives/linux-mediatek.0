Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B1CCD484E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhgUhKinaZm9wc2oxAYL97aNphx+Ps1+imWLYZvC+k0=; b=27+EuMbGqKDXul42+xrC05227J
	NO76pDw0ej11G1WAylFtJ/T0HWfXZyjxO+r0B7f6EUnIWvmQeJi0Ll1iMQZLvsPIqted9Fhh1ZnXZ
	hdaNRzzXsDYJqFTWZcBkv2AwTcPoH4c8kBModPa54QA6hx+efo3prS5jJjrFgLyHfJ96aEr5QF+qN
	BXGf8HFjenjN1PhczLMeszOLXY+XdIVrw72B9eVYmdnuUpzG6CB5hXLl6ey9q0IrBLMCRKpNn3Vl8
	rDph/1O0+uQvbkeJ/Pe6r3tFWjXabwUx0eMy67towvrJlNYCLAwezUGrnOIhEe+QOA768bZNJdkYt
	kFtHEqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYs-0000000FYp1-0ruv;
	Tue, 12 May 2026 05:21:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYq-0000000FYmN-3fO6;
	Tue, 12 May 2026 05:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CB4060129;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E00B7C4AF18;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=aGHT9z1n3C9+p+Out5mHqpcJwPXX+WklX7bs9Uz0sH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l09k1Uam453DaWI8qML4bLCZQ2dTuVOdbDa6f7b6qLpbrprwQLPE3lS4+g4fdm5XM
	 VpDv6RTYiErKWDblTNhbgKTfL3jT+JBA3brMS0RNLbt7DL9hSo7fsNvfX0e97wZxAM
	 Gfh/MPlwPPupLTmTzHH7N3SkN/CTqDicJrx6PFSTK1eUvofdmoL7+CM08gYAGWnF40
	 EQn46AC0anELq6ZM8z82O33cjs3txzU2ocFAuPWB4ce3ifO9AJQnx5AWMwwTZirhJw
	 QiCcLNgAsMwjalQvKp0vCPSHB9hPjOd0t4pmoEpBXOau/UQuLDqPwbh9XECHYPsYpk
	 WZQNuV9+JLLbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CC6CD4F22;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:18 +0300
Subject: [PATCH v2 04/16] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC thermal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-4-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=2547;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=ZpxlgI78YGvqL6f2ifb/QUYUxotfv5VA81LyEjs6Ymg=;
 b=5BpWueZ6TOkGclDn87Sy1sIhi9IvwPL+bOAayzD9G/vf7l+pNOHAza/evuYJiGk/kmkMyaTE6
 fLx7vC0yprjDBloMp/NHwxiCGAjDohboW+0tPC3yFrcGLM/t0thkt9k
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The MediaTek mt6323 PMIC temperature can be read using AUXADC channel.

Add the devicetree binding documentation for the MediaTek mt6323 thermal.

While mt6323 exposes only a single thermal sensor, newer PMICs like
mt6358 provide more than one sensor. Therefore define #thermal-sensor-cells
as 1 to avoid breaking devicetree ABI in the future.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index beaa67bf0df2..2c826737189e 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -242,6 +242,31 @@ properties:
     description:
       Pin controller
 
+  thermal:
+    type: object
+    unevaluatedProperties: false
+    description:
+      PMIC thermal monitoring
+
+    properties:
+      compatible:
+        const: mediatek,mt6323-thermal
+
+      io-channels:
+        description:
+          IIO channel for the AUXADC to read raw data from.
+        maxItems: 1
+
+      nvmem-cells:
+        maxItems: 1
+
+      "#thermal-sensor-cells":
+        const: 1
+    required:
+      - compatible
+      - io-channels
+      - "#thermal-sensor-cells"
+
 required:
   - compatible
   - regulators
@@ -250,6 +275,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/leds/common.h>
 
@@ -262,6 +288,16 @@ examples:
 
         efuse {
           compatible = "mediatek,mt6323-efuse";
+
+          nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            mt6323_thermal_calibration_data: thermal-data@14 {
+              reg = <0x14 0x4>;
+            };
+          };
         };
 
         leds {
@@ -511,6 +547,14 @@ examples:
         rtc {
             compatible = "mediatek,mt6323-rtc";
         };
+
+        thermal {
+          compatible = "mediatek,mt6323-thermal";
+          nvmem-cells = <&mt6323_thermal_calibration_data>;
+
+          io-channels = <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
+          #thermal-sensor-cells = <1>;
+        };
     };
 
   - |

-- 
2.54.0



