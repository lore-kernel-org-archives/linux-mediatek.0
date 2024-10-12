Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62048CF2587
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeyTvWSJZytzDtgLZ3A9Bfb5m8Quozf520noQgiGdGc=; b=3aZi4bOAS+99Ag0jx9ktRk/TVe
	cE2hoY11X+N6VBU6qQCp2NfpNPdBMbKTBbDJXpBNaJ9nA/eS5fQwQ3iRVRODWXSOpL9pe48SrHZu4
	Czgoh/oMdGoBjuSSWQhgFtNGeQPb2UCTAIO58HakjJDaDVGhHpGm63vRZd3rYD6dpqzoYyaugYAIP
	UPJ9vF2RsZDuVV/1NyyxhsUO2MoPjEh/G2U6jC5ScDMDljIKtzu+NFAXmhhFsJOSGyqaPJtBQ/PJW
	VhW9tzDmOyJ1D8nlgUDVn4hxebO1xGABCLUw6E5XwGYYggkegKnW1lM2rK3WOHHyAUzgQRrCIAqh+
	u15ZYrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szkOD-00000001vOn-1q3v;
	Sat, 12 Oct 2024 22:15:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szkHf-00000001ujP-24lZ;
	Sat, 12 Oct 2024 22:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00143A40AEF;
	Sat, 12 Oct 2024 22:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17301C4CEC6;
	Sat, 12 Oct 2024 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728770902;
	bh=hPDzU0MU42w4NN9HxoGD4ZxcUZc8Ag1v1MGVFJad9j8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gpj5/8xpSql6ZOpMqaERf2ogQnT/f75lM6FDgblM1x1J6x5Brn7XjgnWcKycPwGTs
	 mrsPjzSpx9SPlWxqpXUZRAsFW5Jv4GIec0iltQKbOOCu9FxaCFsWV04WdNJKSxKFMo
	 UGarYfigaTSA4EiaDHQN4MFdcav9Zjm1APpN+kHCJJ1LpcsCZq47L32m1yo1Sn/m1w
	 vUVmviLh2kr61kxBLuXVdZJmR58nzxyXj9CdHIpRdsENvvJFjBTIqI0iUJy3C2qPRw
	 YpyxvWkWZEYzbNMKUhLkhfxZdlV8RV0jrku1xDt/buC2QOw1tjYY0vmTtDxzZcqWrO
	 k2CdrcXHdxlSQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 13 Oct 2024 00:07:10 +0200
Subject: [PATCH v6 4/6] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
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
X-CRM114-CacheID: sfid-20241012_150823_709298_00E9EA7A 
X-CRM114-Status: GOOD (  10.94  )
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

From: Christian Marangi <ansuelsmth@gmail.com>

Add support for Airoha EN7581 GPIO System Controller which provide a
register map for controlling the GPIO, pinctrl and PWM of the SoC via
dedicated pinctrl and pwm child nodes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4a81ed82ef34dc2b99594098584cc77f67f276c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 GPIO System Controller
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  Airoha EN7581 SoC GPIO system controller which provided a register map
+  for controlling the GPIO, pins and PWM of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,en7581-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
+    description:
+      Child node definition for EN7581 Pin controller
+
+  pwm:
+    type: object
+    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
+    description:
+      Child node definition for EN7581 PWM controller
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    system-controller@1fbf0200 {
+      compatible = "airoha,en7581-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x1fbf0200 0xc0>;
+
+      pinctrl {
+        compatible = "airoha,en7581-pinctrl";
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+
+        mdio-pins {
+          mux {
+            function = "mdio";
+            groups = "mdio";
+          };
+
+          conf {
+            pins = "gpio2";
+            output-enable;
+          };
+        };
+      };
+
+      pwm {
+        compatible = "airoha,en7581-pwm";
+
+        #pwm-cells = <3>;
+      };
+    };

-- 
2.47.0


