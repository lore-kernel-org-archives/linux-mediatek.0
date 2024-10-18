Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA1BD3000A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PoFI89rLN2ytSYMTWo5YqKnbvfTUnAc6PMkvYI+HSY=; b=EW9Hj5Aae26KEhDdBwvZBlUSIg
	ScqOO0DKTvoAbC9PYATUzizZSkkfLtpBSKw1x2ZhumQNkhIENpX7DMCSeNgZiTYbsoXJBZV7PiQRu
	ZEHgipezmCZLUVsvJ2J4NC6hL2QvBe2527bUNjcHebggyaQDPEvdyyzziHfYruzw1VhgYRAXVj0Tz
	4Dd53ieLEJII4fX4hqxse53iBg30r8ZwYP5+/yZ8H442iluVNjb01Zr0RmNqk3KIujgctyj8/+wol
	GbZGSraaV2JDfs6IXBPmcMzRKRWOD5Sd3tRkXz1mH2eVPiFyZceFBxVxiwDOYdgpXhkmOBIVcQD1E
	ufh1u9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1n2e-00000000sMi-0oa4;
	Fri, 18 Oct 2024 13:29:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mtE-00000000rIi-1irD;
	Fri, 18 Oct 2024 13:19:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81616A43B85;
	Fri, 18 Oct 2024 13:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DD4C4CEC3;
	Fri, 18 Oct 2024 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729257575;
	bh=PHnsXDPgonSGur7LNFvBXgYxGpnNy03h+D9rXnrfuM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QyPlWPx1ufr/SOFonrtE0x1Vc4ChBXk3dtre3iuZiOk6vV3RrEWyNvU68G8+Ab6NO
	 wbujSjo8Y/GcVpPtg0CVZQgmxTYr5Y9VxXRtVBUJfuuPisVFJO7GEEAVMPfMtwTB+H
	 /JJrq+BCaYvzCKlahrmwBpR+LEPQax9YTghbosJkCtgHEehOo2ya54HTvXNMJADeQF
	 6XyDAVzWgucfDRFvZMc29ZsBTyZ8EqtDX4ADr6I/Q/AFXdGoobaTod2mcBXgfZHy4z
	 9BXHXBPGZtbtfH/TR8hlVQubrnFXUGMdfn5FJDmKGRalxRQrYcYjgfjW3y0Ta72It3
	 5TuCSizi5v5uQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 18 Oct 2024 15:19:02 +0200
Subject: [PATCH v8 1/6] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-en7581-pinctrl-v8-1-b676b966a1d1@kernel.org>
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
In-Reply-To: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
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
X-CRM114-CacheID: sfid-20241018_061936_551480_19D7A246 
X-CRM114-Status: GOOD (  11.72  )
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


