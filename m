Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0CAC02181
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8Seydpbd7RN4//dau0WHbnEJIo9MdsVN3XRt1Twru0=; b=4gzVNLWHTmrkyTl4GejwbKZc4H
	Y18P4AZ9yUEfhMHFFQfzxnn6HYPUF4BFAM3Bxu4CFBgZ81uoNbHHn/zE9NcbQ7BvT6tuxgh+qKmuG
	A3U/kgumYWRtrLMYAvq+P2iTzmm+K0yV/iDlRIaNnARIIp8C6CcIbi+83LeegjOQKJZ9un5r0BUG5
	eNEYbjQgPHbGp9l4kGR7PyLM0gwHqoWVPaM7KnNROVjG0C4fQjwtqlHDvr8cZwcoJFMuzbs0TbVNh
	v2VOiU0AfKLBte9cru9ySN6Lk+O+G4s/nA+C1My5FWJCK9cqGYrMFIdH7DXtwtTHbuFlkO19wnkVW
	K0hBg6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwq9-00000006GlL-1kUt;
	Mon, 20 Jan 2025 18:49:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwoq-00000006GZm-46Uf;
	Mon, 20 Jan 2025 18:48:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385df53e559so3744278f8f.3;
        Mon, 20 Jan 2025 10:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737398895; x=1738003695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8Seydpbd7RN4//dau0WHbnEJIo9MdsVN3XRt1Twru0=;
        b=ZAVP4CMio9SG9L15MVDIAGDaBXfwjqZCeQgkGAcs7v7kkSyFqoIrNbKGt77um5PksY
         cqGowNU0WNDwgWD2/UFW99s4WXzNufEz7OQvf5Jz09RFJwABx1O4qApI0MK3wwai4b4e
         UKttFUffd7RJa2WSAEnUWjplegDiifNJ2ddAbIejUG+CxSzZcAJcGfLeI/uJnGFBIFVB
         OXdyoKy1mPTolCBJKNpSzA8YhBsIjMfSyUZNY+cH9uwttd9FV3NDAj+wVuayrhe5S9o1
         YIeOE5A4U+TfGufHbQIY1BKr975qfKmpCwDAsPbOnYClBKuz7ihTO/YA6jA7KzV0Zxp4
         a6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737398895; x=1738003695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8Seydpbd7RN4//dau0WHbnEJIo9MdsVN3XRt1Twru0=;
        b=LwhCYwBsjljO8l+SusMBvHZNsOtKU1yfHAkB/5ISDBKwEcyk/5Cp7pScPlgPEkVJD5
         qBub07RFSiXxXeShv+tVtGRIhkwEGlDoHvCZLOzJzj9tMT3tfZsqunpjyV21/uT6m4h2
         lTHsMQLZl2HgxePbNWeWqRXmt8poHaO4R3LrN58b/8gTjKVTl53F2cb9rzeAGYLHj+at
         PH5xT2ucYZJm0+TuHI0u3YOS+AqG7UfaroLhKSItTaXLIaNDkUzRIwawuoXL3PJWzcnM
         GcIIQ0OyHHNx6Nom0eZd23utuvd/mXGiwksn5NF2aHcxOsGxExPTjuSFixQ7EIsixH+P
         wZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE5lBobxaOSlfq2EklcfDxyotced5qL3qf9i8javMYDXZBhuICoMardwobuDelwubiykg4bEGRtNNuE6oi3eEj@lists.infradead.org, AJvYcCXKo2a7WRqN+NVzaKqdLJ+pv8KRYcsGo2qro996bKTAB1/GJh8EpaOY73FDtkfD63rW3MBVYun9cLWuuAAtdfM=@lists.infradead.org
X-Gm-Message-State: AOJu0YydxtX+zGP1W6VNVz/A7ZWHHGSAXE5ZklzlYRYskl0Yv1JrU9hy
	6qVe9pdMkD+Yb/JgkQC8BNDdDDrCOLxQS1jUshUFXGINB7HujM6C
X-Gm-Gg: ASbGncvkyLT12X+PaKVpjHFLyLCeVBTgkTsuHmN0GC3eDl2YBQuQzf9dAfCJA113T8L
	vxYwrhjkJZVpM0b6khEgitGinA6t17nZvngyWaRxv7EcyKoWyRozAcex3CUI8TAR8JwxnzHvmiB
	MLzMIBHYeo5azn3cdFYVnL6xe+aVVjYCfYYwQmZZNehek2l2QQIvvia9cW6Ncma97yM3PnSnIsb
	kmkDfk/4pFEdEJf4xcr1pMTb3uNL1+6CjI6dAVrVPM4G8PfRwIc1AiyJm13l94TOleg6q7XXE8g
	YRu0h1UmGiEqYv8AjOoUxclYCN9iWOdePeDOLJg=
X-Google-Smtp-Source: AGHT+IHdc8xiYtH4eGE52ikJIMkZ5teueIyjohP596cdY4yzLLgnrH7k/sLT0W0Fb/5CsCENj4sPrw==
X-Received: by 2002:a05:6000:1788:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38bf56633damr14023832f8f.16.1737398895134;
        Mon, 20 Jan 2025 10:48:15 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf3215023sm11095390f8f.9.2025.01.20.10.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 10:48:14 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
Date: Mon, 20 Jan 2025 19:47:01 +0100
Message-ID: <20250120184728.18325-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_104817_017089_D2B478FD 
X-CRM114-Status: GOOD (  12.84  )
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

Document eMMC compatible for AN7581. This eMMC controller doesn't have
regulator exposed to the system and have a single clock only for source
clock and only default pintctrl.

Rework the schema to permit these new requirements and make supply
optional only for airoha,an7581-mmc compatible.

Also provide an example for airoha,an7581-mmc.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop else condition
- Move Required and pinctrl property to dedicated if condition

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 116 +++++++++++++++++-
 1 file changed, 110 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..4c1da48aaa1b 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -48,11 +49,11 @@ properties:
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   interrupts:
@@ -72,7 +73,7 @@ properties:
       Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
       will be switched between GPIO mode and SDIO DAT1 mode, state_eint is mandatory in this
       scenario.
-    minItems: 2
+    minItems: 1
     items:
       - const: default
       - const: state_uhs
@@ -170,9 +171,6 @@ required:
   - clock-names
   - pinctrl-names
   - pinctrl-0
-  - pinctrl-1
-  - vmmc-supply
-  - vqmmc-supply
 
 allOf:
   - $ref: mmc-controller.yaml#
@@ -275,12 +273,14 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           items:
             - description: source clock
             - description: HCLK which used for host
             - description: Advanced eXtensible Interface
             - description: Advanced High-performance Bus clock
         clock-names:
+          minItems: 2
           items:
             - const: source
             - const: hclk
@@ -317,6 +317,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           items:
             - description: source clock
             - description: HCLK which used for host
@@ -326,6 +327,7 @@ allOf:
             - description: AXI bus clock gate
             - description: AHB bus clock gate
         clock-names:
+          minItems: 2
           items:
             - const: source
             - const: hclk
@@ -335,6 +337,89 @@ allOf:
             - const: axi_cg
             - const: ahb_cg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-mmc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: source clock
+
+        clock-names:
+          items:
+            - const: source
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt2701-mmc
+            - mediatek,mt2712-mmc
+            - mediatek,mt6779-mmc
+            - mediatek,mt6795-mmc
+            - mediatek,mt7620-mmc
+            - mediatek,mt7622-mmc
+            - mediatek,mt7623-mmc
+            - mediatek,mt7986-mmc
+            - mediatek,mt7988-mmc
+            - mediatek,mt8135-mmc
+            - mediatek,mt8173-mmc
+            - mediatek,mt8183-mmc
+            - mediatek,mt8186-mmc
+            - mediatek,mt8188-mmc
+            - mediatek,mt8192-mmc
+            - mediatek,mt8195-mmc
+            - mediatek,mt8196-mmc
+            - mediatek,mt8365-mmc
+            - mediatek,mt8516-mmc
+    then:
+      properties:
+        pinctrl-names:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-mmc
+    then:
+      properties:
+        pinctrl-names:
+          items:
+            - const: default
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt2701-mmc
+            - mediatek,mt2712-mmc
+            - mediatek,mt6779-mmc
+            - mediatek,mt6795-mmc
+            - mediatek,mt7620-mmc
+            - mediatek,mt7622-mmc
+            - mediatek,mt7623-mmc
+            - mediatek,mt7986-mmc
+            - mediatek,mt7988-mmc
+            - mediatek,mt8135-mmc
+            - mediatek,mt8173-mmc
+            - mediatek,mt8183-mmc
+            - mediatek,mt8186-mmc
+            - mediatek,mt8188-mmc
+            - mediatek,mt8192-mmc
+            - mediatek,mt8195-mmc
+            - mediatek,mt8196-mmc
+            - mediatek,mt8365-mmc
+            - mediatek,mt8516-mmc
+    then:
+      required:
+        - pinctrl-1
+        - vmmc-supply
+        - vqmmc-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -389,5 +474,24 @@ examples:
         vqmmc-supply = <&mt6397_vgp3_reg>;
         mmc-pwrseq = <&wifi_pwrseq>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+    mmc@1fa0e000 {
+        compatible = "airoha,an7581-mmc";
+        reg = <0x1fa0e000 0x1000>,
+              <0x1fa0c000 0x60>;
+        clocks = <&scuclk EN7581_CLK_EMMC>;
+        clock-names = "source";
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&mmc_pins>;
+        bus-width = <4>;
+        max-frequency = <52000000>;
+        disable-wp;
+        cap-mmc-highspeed;
+        non-removable;
+    };
 
 ...
-- 
2.47.1


