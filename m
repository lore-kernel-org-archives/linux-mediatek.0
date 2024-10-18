Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7214CD30007
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTueToM8KZ/WRANPLM2oymKVxyH6UpeHkkFKXDhySoY=; b=qh9d+/GJDB4JQjEiGEC+HNcich
	7FW/h8UIbgxKScIhBCNyqL4ypPtQbQahndwGXQXKKryJZ7kmauIVbNx8uq98MREdlbtd6puR2jQ/9
	lu3JTl9KDBKlsYCoQOpCsY/W8+8/F0knuffEH+NG8AGDPfsNwm0WE72vvzsa2Wsa2CQBDy+Z/Rclg
	/T9mBKEiH4Xcg5LDXdj0ZN8ugtMNIO70KSod0Yomk1XGNXWLi4bDjJT5EPaMvmjoxWfMHwmnFxXns
	vIyPrKo5rXqDkGSL6hiAnIQ/vKJqyGT4s+QeW61Fi+IYWRggo584tyZZouBjQyLAab4CsIRDyPKxq
	7TOJJ6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1n5e-00000000tF0-1Lmw;
	Fri, 18 Oct 2024 13:32:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mtK-00000000rJo-35av;
	Fri, 18 Oct 2024 13:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5D94A43B5B;
	Fri, 18 Oct 2024 13:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EB9C4CEC3;
	Fri, 18 Oct 2024 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729257581;
	bh=eB3BfaRHbAYsShmwieKgK+tyQ9QuJAeGouECbmRe0ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZiXyNnANDDto5wGex3YPjx4ArU1KPSrhedpJYtpLZ1BaAAUvCVtu1WsyDfOffBGSJ
	 4td1aWS/HTNG+UYaT76FaCTsa4iqtfssCTpW+VI0E6f2+WBOBPavdKTyrbe6F0LZWv
	 9+hzNrkolUoLEugROSshLgGVEff8Q5Zc45GVnp0MjAzmDlvOBBHhuPjmHfeQVHiLyG
	 dRb/5gVqCYIh5XDT3mV8KId2V/uuitHUK1/Ff+aJwKD8sNeUEAFXtOVOOrytt1fjiX
	 QrEGDtfzhzYOSCWtiZJZvO3cO+T0ZbYHjjUKKl86vHkxZFQZx62HIBa4CM+YB3rgTd
	 ckAF0Y5pQwdrg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 18 Oct 2024 15:19:04 +0200
Subject: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
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
X-CRM114-CacheID: sfid-20241018_061942_942347_9DD61A12 
X-CRM114-Status: GOOD (  12.41  )
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

Introduce device-tree binding documentation for Airoha EN7581 pwm
controller.

Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb68c10b037b840a571a2ceee57f13cbae78da66
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/airoha,en7581-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 PWM Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: airoha,en7581-pwm
+
+  "#pwm-cells":
+    const: 3
+
+  airoha,74hc595-mode:
+    description: Set the PWM to handle attached shift register chip 74HC595.
+
+      With this disabled, PWM assume a 74HC164 chip attached.
+
+      The main difference between the 2 chip is the presence of a latch pin
+      that needs to triggered to apply the configuration and PWM needs to
+      account for that.
+    type: boolean
+
+  airoha,sipo-clock-divisor:
+    description: Declare Shift Register chip clock divisor (clock source is
+      from SoC APB Clock)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 32
+    enum: [4, 8, 16, 32]
+
+  airoha,sipo-clock-delay:
+    description: Declare Serial GPIO Clock delay.
+      This can be needed to permit the attached shift register to correctly
+      setup and apply settings. Value must NOT be greater than
+      "airoha,sipo-clock-divisor" / 2
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    minimum: 1
+    maximum: 16
+
+required:
+  - compatible
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm {
+      compatible = "airoha,en7581-pwm";
+
+      #pwm-cells = <3>;
+    };

-- 
2.47.0


