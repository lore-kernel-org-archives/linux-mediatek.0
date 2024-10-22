Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCFAD2C57C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 23:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiGaKX40rnVvscJe7me7yfirGehkkjekcih+O8QUzY4=; b=UXWw0gZe33u46QESdZdFo3NJ8Q
	oWwCyFTqlBJVSl0bj2AOUlC3ch2dmXKSq+tKdLaTOjf1oIAIgrckLL7053jU7KL0YJx562Nj13+qY
	S7cHFdOGYT5TwAvkJC9VRTZY2LiNDUTRhDBdWt2uKO4PcNj9BchLFMYnyeLNnhQIzyf+UMNSMj22M
	G1KVDeLomJFtcBOSm0SMv7TxXzDdhHjDzDTC0mtRpq/ly2vZfoTad2QYwUAVJSvXAaibQS3Hm4OYD
	b5J+D+EVrfqihU9XKCNUMCXt83QvbVW9KAVscfIxpXz2OYj6t5QrxU58ofhLnZa0aYUMAQQ87MVtA
	xp6bBfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3OFt-0000000CQn4-1kiy;
	Tue, 22 Oct 2024 23:25:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3OBk-0000000CQGw-2rJ0;
	Tue, 22 Oct 2024 23:21:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CB42A4488E;
	Tue, 22 Oct 2024 23:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FD5C4CEC3;
	Tue, 22 Oct 2024 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729639279;
	bh=FAO97CuKD7aUVJNmNCdPPUIYExvHYvJ4uLWSpPgZ0gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbEPKR5KkWYqafMhGfTzgClimknwLceQn+89rnz86iHFw5KsrQ+3pMcGvblscklhz
	 UzAJAgmG8FTmmmG+x1uMk9Vr+CD6PHXDwlZb9ivLHvC2mX7wA1bDMpJaGFmHK8PS/J
	 wDv7dgAHPUmaMmRYNz74o9MmGbiAcbuouFCGNf4dRJPz68hS4AsUSbWx8ttK+TnMxZ
	 C/Oxyw4cQfpuSr8s64jqma+ZVj1zLZ0IAIUbQXfN43Y2Vx4X2HoFfUcvEfZlOIEfDV
	 hzQ/7qzdcv2DgVvzOPmoEfxowF7RCxXCw1MIzLz3JuQVN5327t5jiCYEolXCwXS/nC
	 YWrcLWeEyWO0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 23 Oct 2024 01:20:01 +0200
Subject: [PATCH v9 1/6] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-en7581-pinctrl-v9-1-afb0cbcab0ec@kernel.org>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
In-Reply-To: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_162120_829974_DE99B972 
X-CRM114-Status: GOOD (  11.57  )
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

This patch adds the chip-scu document bindings for EN7581 SoC.
The airoha chip-scu block provides a configuration interface for clock,
io-muxing and other functionalities used by multiple controllers (e.g.
clock, pinctrl, ecc.) on EN7581 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..67c449d804c22b6b8268c9840995fe2584349b58
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/airoha,en7581-chip-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Chip SCU Controller for EN7581 SoC
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The airoha chip-scu block provides a configuration interface for clock,
+  io-muxing and other functionalities used by multiple controllers (e.g. clock,
+  pinctrl, ecc) on EN7581 SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - airoha,en7581-chip-scu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      syscon@1fa20000 {
+        compatible = "airoha,en7581-chip-scu", "syscon";
+        reg = <0x0 0x1fa20000 0x0 0x388>;
+      };
+    };

-- 
2.47.0


