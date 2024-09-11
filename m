Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30E1EE57D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdUqhv3qpuS46II9kAtEI9n7haokqZ6rMveTGSTYjAQ=; b=tvBMP725haap07HzP2j6C7u2cS
	7/xU3R5zoh8WPNNtXN3ioYXyC/QLRYkYEFwkARKWKG+wKqBx0aeCSgyiLgW8FtOlQkiQZM5gBs7D6
	g0/m/VGewe2NNpM+p3Fvl3bRZhQyDzZJAlb9J9cNasRBuB2JVPb7TDOYSTXcdb5DxQzW5+kawzyWe
	qEURovbu3BueO9UBZ3j+sgJQ79BQnL04CNajzRTRwf4Jz1oQfR1LgazvGV2LP0KbpcsE9qsmgvKmm
	cqoEbBWySpIY+UlNO6AiV20+bYZCqdrBxW/KBn4puwqu9zC/9FZLOD4gZVXXFlh6YL395ZnTeBrj0
	GhwxQlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soTOu-0000000Ao0E-2GAp;
	Wed, 11 Sep 2024 19:53:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soTMq-0000000AnkF-2XJn;
	Wed, 11 Sep 2024 19:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E53C5C027A;
	Wed, 11 Sep 2024 19:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235AFC4CEC0;
	Wed, 11 Sep 2024 19:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726084267;
	bh=dt62leiaZPP+WTW3BBP/jAts/x45Hc9lz8dh3jdicJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kU8yDb2V9lbvzLJ22LtdxtKp+MtXKeW5B+MaTlBF3MWzOFPA1CkIhsiSrdNVEAqmY
	 /5xR6fBGPZ9dBqydPcXy7cyGHCV3qP2QAtuensNz5+NQrJ9v+fsKrBhtG+AZ9ITCZ5
	 4R2d0qOREko/UVVfL0w/KiQzy+xWA9PsI06fg9TRSma9ruXtIrQS8N/esQNnH3jc7P
	 duLSVT6RbLSiNy4QxswgzrhzyQkrBNXPQLiUxawGw0SNLnC17O8YEFzAg0vw/Qlpsl
	 H4XltZctly5FzFEZGI28/rPduDTU3GCn0hAMDcTDRNypGBgPTzf3g+xNyctSjnP9q5
	 fOISwHdnXyo1A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 11 Sep 2024 21:50:01 +0200
Subject: [PATCH v4 1/5] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
In-Reply-To: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
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
X-CRM114-CacheID: sfid-20240911_125108_744064_A39C204D 
X-CRM114-Status: GOOD (  12.19  )
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
2.46.0


