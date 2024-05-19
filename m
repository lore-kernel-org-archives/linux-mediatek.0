Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A20C25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG1aV24RN7E3p6c9ASDyYan6B2OB6NWdWdHsWR4ahx4=; b=owmsam0TjvcjYOxkUI2R/4BGLA
	yc4B8hx3JVcT2mJTVGGOwkqCGgUaeA+GUeHtT5PfPDgvIWY4PDp4KFsygdpWb+MbQ1xtXPhNJeo8Y
	jtO1FRN87srx7KeTtMHKxLvlidG2GRCNf8a2/EA6iUUK69EDNCJIO2jYCm8BCqDAe7bgZbKtqinIs
	aiHjik1ViuGw2i4qxz/AmXGCD8M3H8x+uYV59k6/nGVZcbvmIIys4lKwP/wDVMrDEirJ4nOVZVGM5
	IU/a6wcx02WI1zM4pXjweGZv1ObYTNWwq/+2Z7xG0Kx0a/bBEwA10oujfePs9ciLCmZzGSeN5F3BB
	frP/n6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUj-0000000CWS5-2TPz;
	Sun, 19 May 2024 18:42:53 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUW-0000000CWHP-2sWr
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-51f174e316eso2502831e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144158; x=1716748958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RG1aV24RN7E3p6c9ASDyYan6B2OB6NWdWdHsWR4ahx4=;
        b=CM6Mj1EWkbHZ5lYXeFvyse275Fzr/qwjdAW9BfnIdLFzxd1b/mWkwn1YchS+MiIwYe
         xkqw7PNKjIYRD6tWLc+BTLh9DOh8cRWmbM8jEJuner3DayyZPvnyY357jr9KLG2TDdyA
         N6XpQdY9ER8Oid+ZF1A5zuFGq7Tc4PGWr8LKFPmWw3BYggzt3BJ0iYnfhqJKjvEsUwkt
         s4BYQ/no70dbSVvFPZTkM/MWW59inhNIPy8kAtl5pRo9WEnbCX9KHh7tIJfKhVxC6IWC
         of37yDr/Fzm/fTYDjgDFiwKiXMWRMk6U9JaK+2u50otSOIubbhklp+IsRtAglFidieBZ
         uSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144158; x=1716748958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG1aV24RN7E3p6c9ASDyYan6B2OB6NWdWdHsWR4ahx4=;
        b=vIua9pFWuwY1Q8aDchdxLuUspNBIOkZZSgvW9lNzC7CD/VmLefEnemlIvDgGSxFPLr
         CQqGm0ggK304gi8Z4rinIizdoa9vkss1vUHdDOplUQEhe93PYKPpazNUR3ZyVEeokx/3
         g4t6+f5CAZMmlUbHTYHncawmTdUM1/s/9OOSfGjxPLTKDSw6Yugb+uhIzcfznISzkVyX
         TqGLiWF4bQtQH+iUbLXVvoa8iFipWLRJfU54UEPuYJNc6aJ5NFjv/UKjZzuBmkPc1UcW
         hHaohyF+PXh9Dq2ERBNQLv1ENDyltzn6rx1TWqapBWBlwK76p5if8af/RJxbSVq55T8V
         AbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoKy+q6WwQtRBvI819v+3neVcP7Hw/51C/nG5g9cLweXnCEWFPMnumBmj9E9cBgXKZiVtMwskppJYzYeg761WrrH80LSp3bWlSa1rrI9q6tzZg
X-Gm-Message-State: AOJu0YyQSwJYcPtNNSc0Brxwo2Zo9R94dJyvsl9exk5Nay5ZYrbjq+no
	q/+vVWFG8q4QA7mWEXn/JxOh0g6ftNvJerE8hVSjsnqjcYWyFOH1RT2tm21CSH4=
X-Google-Smtp-Source: AGHT+IGeP5PBCKh7R7auyfHm+GXOjm+D8EqF1EdnvZtmcr8kFLBQpsFXYhpZsC566l7dfYdexNT+Ww==
X-Received: by 2002:a05:6512:3447:b0:51d:82a2:8d72 with SMTP id 2adb3069b0e04-5220fc6d7fcmr15155418e87.40.1716144158271;
        Sun, 19 May 2024 11:42:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:17 +0200
Subject: [PATCH 2/8] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-2-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KLwl8QR9y7PCdA8grXbhLfcs6VAielprx2Avjw32E0U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgRADA1CSPsrZfoM/PxSQDkifcbA+LbMFTzB
 lBlt3VKxieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIEQAKCRDBN2bmhouD
 1xIID/4yXJXNCUgau/f+VFKvHW5KJWWiPMu4jqoVeRHkyYejYdulr/dHo+3XZU3LIw5HIssC7VK
 F3I+eB/7GAZqSlc/5srwYTYqezXZnWFaQqlLdoAqJBV0ciHJ1jviOpUbehozInPy9UCBWHgRYL1
 VThz8W0xRwqMJ69aM2DrWawttaPwDgrGpWKhRB5f/wTv5L94oHiJM3SA+K8WJ0HHKOr3/x4s655
 d2l0j9qYzD7zTaXkpuJKp95QCy1ivqruNAPY75hMiQIC+YrmlBJtzeU1iazhyv3XQeyPrWjpWcH
 bBSLvkZhJfN3RwyxkP0+cHzZlNRTqg8K+Q8uPETF+fHopYK/h6smjrtmP2rDBSsZB2c44sZn5pS
 F9CkANvNYYQZC6Y741OfQg8ztXKDm7x0rLeF7UEWLXcr5Gctp+qY5aXARPmrTwbJanBeoQxcspw
 QDl0Z1ajFgz9yhr8FJxLMnvmM+kx5K9n+aAtcyuInz219Z8iiDTFi4R/2Lrj+A5jRJ98Pf8kaK3
 5kxL/2qA+ac9qBs5oM5dG85E2cQir6ZArE5rBtEtXGJij7289DoJOsPYAcrmKm1PU5BhVupIAij
 NFXaRvjvBQSxI7XayKQk9jJs/LDV8b2XXWu/0wZZhxUPDutRsVwdbucmUlEz8stJK8O2wLZvGwn
 GmJYcvQFskDl4qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114240_771477_3CC8EB79 
X-CRM114-Status: GOOD (  11.01  )
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

Document sprd,sc9863a-glbregs compatible already used in DTS and other
bindings example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
new file mode 100644
index 000000000000..49add564e5e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sprd/sprd,sc9863a-glbregs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SC9863A Syscon
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: sprd,sc9863a-glbregs
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: /schemas/clock/sprd,sc9863a-clk.yaml
+    description: Clock controllers
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@20e00000 {
+      compatible = "sprd,sc9863a-glbregs", "syscon", "simple-mfd";
+      reg = <0x20e00000 0x4000>;
+      ranges = <0 0x20e00000 0x4000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      apahb_gate: apahb-gate@0 {
+        compatible = "sprd,sc9863a-apahb-gate";
+        reg = <0x0 0x1020>;
+        #clock-cells = <1>;
+      };
+    };
+
+...

-- 
2.43.0


