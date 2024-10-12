Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D080DCF2586
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 22:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PoFI89rLN2ytSYMTWo5YqKnbvfTUnAc6PMkvYI+HSY=; b=OshRzVt5enZSS5ajsR6G/3q6s4
	pD5YIA5dFwG7zCi/ngyYck4bpPZQ4iO/4A7BcjzyGpp1aV3NfuyzAPBrjuHhRvmDgaQlxqiBIbtXc
	ZKan/eDe2L3ePBY6fgf3Wm29eDuD4wsXYhddB1ZecsJ1/SVCmWPfyF2PHj+R2IRt49xH/lDwxMyrB
	XPzrqMAOM5TW+YEpzxS0ErtbeLsEzWnoHDwHCI1WnVs7KRlVzxaX4ImnqDSfKUMHueSIRbjjL2jrC
	Fw2KguvXfcVx/Nrv83oGT2yu/Zflf/8HJMgme+oB0fB5Qw26IiNtm+iLMb4TGxXmxqL84o9Xv6/pd
	0s0ptY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szkKD-00000001v0O-3u4r;
	Sat, 12 Oct 2024 22:11:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szkHX-00000001uhD-4BRc;
	Sat, 12 Oct 2024 22:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11E91A40AEF;
	Sat, 12 Oct 2024 22:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFB8C4CEC6;
	Sat, 12 Oct 2024 22:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728770894;
	bh=PHnsXDPgonSGur7LNFvBXgYxGpnNy03h+D9rXnrfuM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fZ6VwWxcxiJFm3toWynDnVVn/2JLUpwSrMC9jiVIsRav6D6o3KFpg/Xgt/YkIs0Df
	 XquD1Iu7EBIWa/qIc4mBVU1gcuUxAaIpuhvg1hyoe8I7rC8XyIKwiK/l2Z4At8kDmJ
	 EOXSz9A0MUqwCxJlOLcC9W4Bzhs6tP08ciLHrTDMkQaMS1qzaX5SV8bjBlupiv8vbq
	 y9EHiaMd3pQZBXusmr2Szv+ilxWqHnIYYpUfZFZo16fbEL9naj3Ibb/hqCOesgYCCm
	 Q9W0jwhT0IfHVTpsv75fpobTIkuKxUlfGw5fSIm2Ph9eKfsP9SoCbDwKcvSElqllWs
	 g3FPu1H3mj0/g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 13 Oct 2024 00:07:07 +0200
Subject: [PATCH v6 1/6] dt-bindings: arm: airoha: Add the chip-scu node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-en7581-pinctrl-v6-1-2048e2d099c2@kernel.org>
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
X-CRM114-CacheID: sfid-20241012_150816_138534_E055ACF7 
X-CRM114-Status: GOOD (  11.19  )
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


