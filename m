Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E642AD1AD3B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70Lnov7SwZqtBX1y0HTdwaaXOT9Fa5CdT6Zj6fI6TQA=; b=QHuvD2SVGQZHSRQ2YVGJS/rrf6
	WJ/ndVYMUyemPnY8k8lGdwHT+pEDHyAblzpf5fJ+GnXtD3LJGgdljfTvWss/NUk043XsAJ7MEslff
	mybXo0XkNqtjecuEVLS/RYwfe06nuA1S5OUpVRXsHYrf0L8Ja7rxRxXex1pHkXBKONsRr5jSvdrl9
	wk2AMqPEvEgkX9e2gDL4nI3rBdMA9FFuB9+Oyg28T0raum74aKEQdVyQ4THlTQUxJb6u/aDQtGZ+b
	wb8jtNtOFFrm9TxzglqpaU1mj2xck9eD5S/bmxNPVs3U4od0fc5u5MiAp34Bi/UTa84C02+sHh/Ab
	Q4GvVu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t112i-0000000BOAs-3dSP;
	Wed, 16 Oct 2024 10:14:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10x6-0000000BMzy-10Rj;
	Wed, 16 Oct 2024 10:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71851A43BDE;
	Wed, 16 Oct 2024 10:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D966C4CEC5;
	Wed, 16 Oct 2024 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729073303;
	bh=XeXtI3ee+OeOqTEY9KnIkN4qLg1Q8wUxrPM5In0H/Zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SytKO7G6algKu+vMXNzAV/wXIJR0sehWFumPhVOJyQJOsARzclbisrI1jv/iwbEqz
	 4MbyOLON5fKo38GUQPMEvt1QmAqOa1rfbn6pnaLVhlL05AfkDZ3IFfULPxp7kK0VNh
	 DtM0uKbNns0MUXoj5yzqX/t2qd2QPK3zhHWTW2U8a6SHDE2usZdmqULoRobNoTPwuH
	 rTRV4FwWknVufZPtKVFhxyU++nRYtUI2/5DkZ17XBN1rfRCZ8wg7TOh+hTooliwnMp
	 10vED1elTsU3CXt0OpU+wBHdJLwApDaD4TLwn6cpu0ZedeQcjDsTgSGjJwtw1CCNHw
	 ab81Sl3ZvNAoQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 16 Oct 2024 12:07:31 +0200
Subject: [PATCH v7 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-en7581-pinctrl-v7-3-4ff611f263a7@kernel.org>
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
X-CRM114-CacheID: sfid-20241016_030824_376080_68F07D29 
X-CRM114-Status: GOOD (  10.53  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f36387572a9781636aeacdbcc8947017c7ca75a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
@@ -0,0 +1,34 @@
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


