Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D665FCD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34Ndrewp5sbJMJ2jOunLl5qw82bqk9h/3cG8G8ygPsc=; b=ezzi7ipTJ+2zgzQ8iFFjFa1KD+
	FZzjjbnogBME8/LEySn+KFI0tGS3hXuf4creRp8J49/Z8jgQeH/eBi1CY0eNHHZq9r29SV/lCxF6g
	HbAqJUjrO5yoWvN34BmLi0YsUiofZ9N/M8SPLEe7uS5WwKRde/npffoalWEMe/RAVsKbaAJwG86ml
	0xUZQ28A3u9HkwhZUjC92fPX0SwtjRSuiL9gZ0cXUUNrfgymPVRCiZGu69Lqb0z1JBvos7ek4SaRo
	0hMDMX0a5HIvZqWnwXHTDUh3shmERbpPGQhRnjhYvgYGiLeNuDi0GizcGIZqy93N+XyBWoXiq4WXe
	1BWrFvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhueV-00Doqm-0g;
	Sun, 17 Sep 2023 16:29:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhueR-00DoqI-0B;
	Sun, 17 Sep 2023 16:29:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D80A2FF805;
	Sun, 17 Sep 2023 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694968174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=34Ndrewp5sbJMJ2jOunLl5qw82bqk9h/3cG8G8ygPsc=;
	b=aISGUYh72XAMzn5uT1GbJpZ68jajpUa/1xb1LmMeXvwMILRv3eTZEFnqi4FSgOIqqXh+jG
	FRKQhYMGF2n75GjvnFLisdZnUT1xcqZ0S5ZIPB93Z9G+IxEZH6AuQUyce4EsXnDBnHWpoV
	cT0b6Wg/HYU5h+L5XeOL/TTtZxQwiltZXrqNNSV/XQFfdz+XsmUiTr5+XBVKYS7qrZ6gr+
	EkJLKgNOrbVQ13DpVzHvBtFcBn0lPfui80GCBmxinB5ufJEJGMzFnX+JQROFz/GY+yjwH6
	hiX1PpYoaceNfsprFN9FgXg8X2WFpacj6kPZbX6frJn6c3qemTJWaHAe8cCPuw==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: mtmips: add deprecated ralink,rt2880-pinmux
Date: Sun, 17 Sep 2023 19:28:36 +0300
Message-Id: <20230917162837.277405-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_092939_397653_02FB279F 
X-CRM114-Status: UNSURE (   8.14  )
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

The "ralink,rt2880-pinmux" compatible string applies to all MediaTek MTMIPS
SoC pin controllers. Add it as a deprecated compatible string.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml | 5 ++++-
 .../devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml | 5 ++++-
 .../devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml | 5 ++++-
 .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml   | 5 ++++-
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml   | 5 ++++-
 .../devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml   | 5 ++++-
 .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml   | 5 ++++-
 .../devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml   | 5 ++++-
 8 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 591bc0664ec6..221adcef6e14 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,mt7620-pinctrl
+    oneOf:
+      - const: ralink,mt7620-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
index e568b9c13727..5e29332c794b 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,mt7621-pinctrl
+    oneOf:
+      - const: ralink,mt7621-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
index 31849dd5940b..fef7728a5220 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,mt76x8-pinctrl
+    oneOf:
+      - const: ralink,mt76x8-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 43b33dbf115b..71bc961b856e 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,rt2880-pinctrl
+    oneOf:
+      - const: ralink,rt2880-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 95a904273009..bde19a00af80 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,rt305x-pinctrl
+    oneOf:
+      - const: ralink,rt305x-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
index c9bc6cfd834c..f87038cadfc8 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,rt3352-pinctrl
+    oneOf:
+      - const: ralink,rt3352-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 8d14e525b25e..3a13a69f7752 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,rt3883-pinctrl
+    oneOf:
+      - const: ralink,rt3883-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
index f248202ce866..1231f442afbc 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: ralink,rt5350-pinctrl
+    oneOf:
+      - const: ralink,rt5350-pinctrl
+      - const: ralink,rt2880-pinmux
+        deprecated: true
 
 patternProperties:
   '-pins$':
-- 
2.39.2


