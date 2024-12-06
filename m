Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9227AE77170
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l75Cs5/L8ia/ZbVy9zJCGIpdn3WprY0h9l4n4o2DNlA=; b=ZGWfx53PRoWb512+5nziu5b4r0
	BwFsi/XGWV7JPf/A0mkKq42Q1AhxTXvRK7iUC+JfDseafAY+lgz++Ft3wyiAfGRbmpjqMBHj4k2LP
	E7A5eBIC0T3GUeZ3qbpDEgDQDgjwUiUWXTAHfNkbTwWGAohLYL/hOzu1iicrx4nQN8MuzeKGpOAY9
	gIWCUPrN6gNxHxl1RtAQ4QclOLC89sHpNDdASJoW92Clyc0YmLhUjknLZbhauMDNfHtS5s9B4fq6L
	U+O9XJVuBOiz8ZT2g8PjJazaHlWft1MtsRatMEEmQnTpKVvKImSgX9Hzy1VkPI1xKX3N7XRfuR4Wp
	oLxe/Zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOpV-00000000PON-34vM;
	Fri, 06 Dec 2024 03:16:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOoi-00000000PGn-3k6w
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 03:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EDFA5C5B99;
	Fri,  6 Dec 2024 03:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71CCC4CED6;
	Fri,  6 Dec 2024 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733454943;
	bh=zQXJcJ42eZeCkXUcZcfvCDN5aoEbWTGs0+cWtqvl/+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wjanxt3tDKPkTCC4o7YbLMF8UvgURcAjva9M93hiKqjYB//z/BedY8ri7VU2TLoRL
	 Meh0BpwdElqJrScIBjSmYoLBtfSFPGQ/xameDyYeS7b26e3ZqLGZSmpREVzIL1gVod
	 Y+41Uprf9h+2SOvknU+jRcUKNZWjGZCGFPCLo+oM+Pq5XAB5YyzhKjtYUwDD1EV99Z
	 xa2qnZCAi+VL2XfnOWdznOuzym2MLmbYeR6GftiFUlHm7wABLfQlP2kyjp15YOOBTP
	 4ECm4kDDVBq4vgD6BwpO5XXq7OJxL+pCgfZoZlSfVxsLoARtQ4c4fhYWn8fk09nMOW
	 wcMD5piMFE9vA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	bleung@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH 2/2] dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight
Date: Fri,  6 Dec 2024 03:14:05 +0000
Message-ID: <20241206031405.1711996-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206031405.1711996-1-tzungbi@kernel.org>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191544_971200_E28FC1B4 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
keyboard-backlight node"), there are no users for using the OF match.
Instead, the device is added via drivers/mfd/cros_ec_dev.c by
970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").

Remove the DT bindings.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../chrome/google,cros-kbd-led-backlight.yaml | 36 -------------------
 .../bindings/mfd/google,cros-ec.yaml          |  3 --
 2 files changed, 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml b/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
deleted file mode 100644
index c94ab8f9e0b8..000000000000
--- a/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
+++ /dev/null
@@ -1,36 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/chrome/google,cros-kbd-led-backlight.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: ChromeOS keyboard backlight LED driver.
-
-maintainers:
-  - Tzung-Bi Shih <tzungbi@kernel.org>
-
-properties:
-  compatible:
-    const: google,cros-kbd-led-backlight
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    spi {
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      cros_ec: ec@0 {
-        compatible = "google,cros-ec-spi";
-        reg = <0>;
-        interrupts = <15 0>;
-
-        kbd-led-backlight {
-          compatible = "google,cros-kbd-led-backlight";
-        };
-      };
-    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..50f457090066 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -108,9 +108,6 @@ properties:
   pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
 
-  kbd-led-backlight:
-    $ref: /schemas/chrome/google,cros-kbd-led-backlight.yaml#
-
   keyboard-controller:
     $ref: /schemas/input/google,cros-ec-keyb.yaml#
 
-- 
2.47.0.338.g60cca15819-goog


