Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77922D1AD3E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PoFI89rLN2ytSYMTWo5YqKnbvfTUnAc6PMkvYI+HSY=; b=3BvdqXrtWyoM28Kc08oAFVzLbv
	tdI8gkeF3YBhY6E+azInnKOoGTHUfBR0xYh96T9kAkHEGrAV81RDrq6AIj6IpIeojoZRwmstMHeJm
	gk0XEAjrmV/6rVYQkMKnP6hPr7rGO90sCLqnAL2dOdLVqF37QjwZdIocWWWSta01OzUh8YMYdUMK5
	Mr0Q4dclKWd1bkkv7u2iwcNd29ERDDsWJ2vkl5vE5e1KpIZiJLTcWnCuBr/7BltCcDluWxMKvLc9j
	YhlkiQVbU1IWb6AdNM0GHjPQ9uirnz5bOMIzz2FkdIMx7epjdDEAZWVdGFyeN55C36XARAHR/OLiY
	kyL98g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10zu-0000000BNZ5-1rhe;
	Wed, 16 Oct 2024 10:11:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10x0-0000000BMxD-41lY;
	Wed, 16 Oct 2024 10:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3478A43BDE;
	Wed, 16 Oct 2024 10:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B067C4CEC5;
	Wed, 16 Oct 2024 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729073297;
	bh=PHnsXDPgonSGur7LNFvBXgYxGpnNy03h+D9rXnrfuM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MaYBAYCdurWRnQ4W1G4JU9TRWU8zw+mvGlCGZnBK2fsWV6mKs65ClRqFF5WZJYRVC
	 /MKso7TzXaFZu1ILW1OtQX2SNZhDRj5QVycqGtzoIKKUzQuC/wh5hAKVt/0zZIMAFX
	 ovYw1ip4ddI6coC2WlpJiZRRKvl+A35PYs4uo7gWBl+A2YKPYytQiYLWaL+xvwhUW4
	 3iaBdNdCLTYP5DMdWSfmfOXXo3F92wGcJgtgRIVpGApuStTJBmTyFi/x/zceSyccVr
	 f4aWoWugRMCxeVSN6lnQAeTqOlo5C+gbOSciwAKsDeMGp3P93qNJdmkLYACsIJRwcx
	 3/6ONOhRRTEtg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 16 Oct 2024 12:07:29 +0200
Subject: [PATCH v7 1/6] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-en7581-pinctrl-v7-1-4ff611f263a7@kernel.org>
References: <20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org>
In-Reply-To: <20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org>
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
X-CRM114-CacheID: sfid-20241016_030819_094760_DECBD154 
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


