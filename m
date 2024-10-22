Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B416D2CDF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 23:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2oC/4sz8dtIGNUpi7j+zp3lYKh5d7vMBYAYgTXfoSU=; b=ZY7N2k3fELZiYbJnWgpZDd4h6J
	Pf+wXaSL3Q159sRmdvacLcN4rM1Vpt6aXyNDH6ahaASfiTL37xsAVkTOFqIJCPx7q4X3ml/Z0YRO1
	MfDCMzFqIWm8sByJH0kjgupCOdng9FpCdHSs/4zwMkkd6Fg77479EiYmbwWuM/XxtjwjRW/hfOu+d
	yE3rcLoQrRx1oSoXu10oCS9SShsg+hI1OYQaONWm//JIU5PR51/2uUfD4RBJSetDpwmGrosk2zjTE
	+7Nlxn8Ks8cNSLGd70pPrucbt/+pTlyzX74NdiS81yoqeisgGxzdKxrscuDYn+Ml5SsLpV06p4Ozh
	aSqy+rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3OIr-0000000CR59-0I8k;
	Tue, 22 Oct 2024 23:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3OBo-0000000CQHu-1y1z;
	Tue, 22 Oct 2024 23:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 484B95C5C83;
	Tue, 22 Oct 2024 23:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695B5C4CEC3;
	Tue, 22 Oct 2024 23:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729639283;
	bh=xf3O2KqOGEwytXIWpIp/7uLYcZVVkfANHvZ0KvLjCYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j+GwTg2eSbXQWi89oilcew2yw6HcVamSZ41rytTTRu6g1bRuDKwa24e3wad405X7Z
	 2b2G+EZC85Y55v3C5NM14fBnykS44z3Ap9n4oeiI97rjhZCaijc1HMOZsGJkgGboJG
	 SGfwpYjKJaYn+uvTqsMuMS/C4MGjMJvXkU6aV4rTeqzvuHMMandj+Sv8cHfv1l9IA3
	 Bw7jeDS5wQ4l1CtRvdS4r3fu3SZ+PMHRTMT/4cMVRmgk4hNHN7aSdbndt+M6uXdgY5
	 SiiYHa180wEQ2V31Q31yFyvRjUe1tWZJ379zbswRPLgDfEntYKyiIadLzI3Pkl0IWp
	 8ciB0tPdJE0aw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 23 Oct 2024 01:20:03 +0200
Subject: [PATCH v9 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-en7581-pinctrl-v9-3-afb0cbcab0ec@kernel.org>
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
X-CRM114-CacheID: sfid-20241022_162124_618280_76768C5D 
X-CRM114-Status: GOOD (  10.29  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


