Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69946CEACFA
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 18:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbmpytLwhBopX1ym+x4HdryZ5lG619wDU85u/Xsm90w=; b=gOhlG0QT3NOLCj2jxo4Efyixu5
	Tr26mHixkl8QNNGrHK6OsQg2NA3zQ+OnlaYBTFJbDes/tUk+p3FJtZe72jfqLcvNZZzPBLI1q/njU
	oBckUhZPLdoMsc76PFhvBjuPCE0rYw0Z0jkN53xPh0VzpLvBKbw1OJa00qW3KGk5AGdJWfQdTF9yX
	C8KBDOQA+Pvq9AURCSOEMMMzHWF03GzvlZ4q1D5kkl2487GKyHr084PtWWBg/2J0zAPIrvXB94gqc
	KODZqS+9aAxje3fs4gMqA3RASa3Yg697ddnpYQpv1++GVxjMkVD4zWVbyzjXzQls0Xk+Ll4T1J1XL
	izJMk+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svhtW-00000003oFo-3EC8;
	Tue, 01 Oct 2024 18:46:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svghP-00000003ezi-1Xh2;
	Tue, 01 Oct 2024 17:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BCB05C54F5;
	Tue,  1 Oct 2024 17:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DB6C4CEC6;
	Tue,  1 Oct 2024 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727803809;
	bh=WcNrIcXShBDZ73rKxXuuHmBcBczHBwXefG+qZ+ja9o4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jH0/Y1qjiFnEZ0d8BXzoBZapdus3KsTzxOrT8IWRxfEwkHY1r7oFDUS+yL7u+cV3k
	 g/eQuSfET9hazel2fDVsEmjWlQdA1MYd7DdzsFreZflwAeNPBaMtJy1rfL/CrlWXzg
	 ivuYLrDm7F57dn4aifH4FAeCcebhCHWfTh8JiQiq++sEkbz8NoDJV+OSKuqVAZRhRy
	 8RY4R5KGFe61XhthtQWF9hGpVg3qPvZoPXFxdOpIlwWaSNksfiXPmbS+UOliDHms6F
	 XV9zn5olg4gUz7Y1xQLrD/QHGw6kFuzHdT6UkzUTRb1s1yhiH/Kd+eFHxHNW+VN1Er
	 +ROiWdrdPYUEQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 01 Oct 2024 19:29:30 +0200
Subject: [PATCH v5 1/5] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-en7581-pinctrl-v5-1-dc1ce542b6c6@kernel.org>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
In-Reply-To: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
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
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_103011_508871_32DF8582 
X-CRM114-Status: GOOD (  11.85  )
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
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
new file mode 100644
index 000000000000..67c449d804c2
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
2.46.2


