Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D60C30653
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikedj3tVLkYYnUpwfjDtl00VbRPDE3LLjeOugxhtodI=; b=RXpJzKbB8D0TQKL1H0oDkv5i9N
	doB8aryeyT4qDXE7BokUNhNdGxI31q3SKV3EpS+djKD3iQeWilYs4c26q6I5ZCWZOsKUxs1mifm+q
	TGiZPuOeglpbEFGttrvbv0T89zgGk4LHVCzuD1o/UlQFxBOVuOgmVwz/+oQ728WeAqSmveP6DtN9W
	5NL1LMPev6vBVtURE9kLGdcZZSnOpdiFImFOpFA/ws2OYLVQwNQ3UR6RfOv/bxaheAnhhA5tvKGb3
	TgeWYXrZL3up6s1zNO3cjn3zsh8Qp0eE9gRwFmi2s9StnOyRI9IhyqW5n37bknDJnug7Bj6ioAqjd
	1pEqoSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmRk-00000009xco-1T1l;
	Thu, 27 Jun 2024 10:33:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQn-00000009xEH-2gud
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:33:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4248e28de9eso39678145e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484364; x=1720089164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikedj3tVLkYYnUpwfjDtl00VbRPDE3LLjeOugxhtodI=;
        b=nUNQxFxhWdkW4wLZpEXKx/r9nkhMz8SiK/AYChlMNyHxfGZmTPI9rF/7NpiG9gyKBg
         itQU83OiHJa3ph0yGH3Wt4PVQseBLsKN5FeEr0rxKEbK4m7K0SL1afH0oBFuAT2Fw7sX
         dusy36ahf6e3quy0QvtQkhm1fV7a/XXoKyqz0uYJ/0g3jlpH7GnRr/RcqqHFHWVjARQg
         +zofWRFD9z6YUA5VIz2B6ed02sYGEOF07X0PbOpmwBduZF6C/Tcjyy23QInpSmGgkjDe
         8DjJSOlBb+xEU1TuV05qvZIwJPXmV1QLBL5oDyPjYH+D6b/IFPRqA0kmfovsKzFhPNA5
         kQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484364; x=1720089164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikedj3tVLkYYnUpwfjDtl00VbRPDE3LLjeOugxhtodI=;
        b=h10leSpEfr3luhwrJalRamHGmu7MxMYBUQmuggqJEEnF6OQlDRTR4tMLFJIOfA5nAR
         ugYzrnu6b5slisAJ6COnDuD12XjfE+gO5tfbFsfWjLYW/za6ivMV3OURN44V+oF5KcqH
         /mD3DsfPx+qVYBkxu918me17vjfgzpbHyQ4krl/wfQfR9L8aD/fTbJhR8gBwJJKWpird
         zbaNPEIp8k5UtBh3bKQWzLiKwJnAkcPcm/hN/Pm8lWHhHDx7OQjaKchHpVjUOfqwlbdc
         jJhiZB/24I5jG5C+xj4wGcNbfJYVx6DAbTwK2JxFkSWv4b5Q/0qZkumXtJkBH580AGO4
         wG2g==
X-Forwarded-Encrypted: i=1; AJvYcCWA/xSIaHtQ3ZBQy/5sPv5Ah57xlNo+oWgrSufGRymU+GhAtL8Hf3X5rztNVc5PMgFtIBMlfcjxO419tknVu8X1M4UIxUewGiomPozIvXHgywpr
X-Gm-Message-State: AOJu0YxwWAunM1+B3PjgGRUk/G3Cn/q8XNzuEdtp66UD341Aaa+r7y+o
	edjuvZIlwbbuuqhLOhVkaKm4U26K4rSm6CLzFdhWQ7QlMeTQft3QwTn2R/05KaY=
X-Google-Smtp-Source: AGHT+IHIM8K4TTdFmd+OC8FVtPlX+Cx5qck53EwVVVSZ3dVQODT6DSoFQugNihRom9KzkjlOakcDXQ==
X-Received: by 2002:a05:600c:2058:b0:425:63bd:fb44 with SMTP id 5b1f17b1804b1-42563bdfb7cmr14424995e9.33.1719484364231;
        Thu, 27 Jun 2024 03:32:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:20 +0200
Subject: [PATCH v4 4/7] dt-bindings: soc: microchip: sparx5-cpu-syscon:
 Move to dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-4-dc6699a9f3e4@linaro.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LwADOOVCCJ4verKOJbmwOwhGrtMJ9b4n73jXo/44U/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+99AkL8ZgBw3w+AKELOjfBI1jQr4W1b5DVi
 5t0JVgm1m6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/vQAKCRDBN2bmhouD
 19NhD/4rasYCjtRnGj4xAY0TL+5eFGWwcSeM3+Vm3mHJ+UdUH2w04ppMJSGk87lnCv4HTvlJrOO
 VAILx9Y26BfBVa9Pt2nfP23JKhKqwKiWAjO+PrZSecavmsU7GoRyFghJ76v4N0sksRlGtOgQHUr
 JnjvfJ+Lgwz83qSq250QXm8l4EWuFDWrvxhTB3ZROFoa6IP/s2gLszs0AQdYapxcxoacLhSwo83
 uSga2fq021gM3wjrUfQLJI7ZNmpkOZ212GVulHZlP3IXNNXRuDY3QtcolvFcWjFz3943mn1Xckf
 1I6gSUiDaL453vSAWgE+Ij//8ZllYSTyOGGyXmdDzCOADRSQL9938PWUD6HO/2p976i7lYECUB8
 jMcDy2TPNOfB3mEmHHwrl9EJt0fIpNidlUQ9TvnON3s9fgxJtxuLUtsvJElYSr8JiDCr3kXlIwo
 Ll13rgsh/W5xHpfujGEeVzcSc0yksVDugA+IL7eBU7OL+Ycx2ha8vJCpJQSZpet06oJQZ18xA5Y
 r2lFKDqEVZr7YBVn79sqrrB0uIjuoMjzbrBzhcOwcBR3E9M5iDX96y0CyxgtmSLLzMAzDdofL4T
 t5Bs1R4cRHONXCjVNl94fHjkfAyC1dwxB7v+dSnir2XZZOywUHyGssMERt/lXtY6UFd8BbAaVA+
 N31ovjTBAn5sCDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033246_388347_C37CF2E3 
X-CRM114-Status: GOOD (  14.63  )
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

microchip,sparx5-cpu-syscon is not a simple syscon device - it has
children and implements simple-mfd compatible - thus it should be fully
documented in its own binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Context might depend on patch in Lee's MFD tree:
https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e19eb0772f1..49bf85e8f220 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,7 +95,6 @@ properties:
               - microchip,lan966x-cpu-syscon
               - microchip,sam9x60-sfr
               - microchip,sama7g5-ddr3phy
-              - microchip,sparx5-cpu-syscon
               - mscc,ocelot-cpu-syscon
               - mstar,msc313-pmsleep
               - nuvoton,ma35d1-sys
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml
new file mode 100644
index 000000000000..1f0b542d2296
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 CPU Syscon
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+properties:
+  compatible:
+    items:
+      - const: microchip,sparx5-cpu-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        syscon@600000000 {
+            compatible = "microchip,sparx5-cpu-syscon", "syscon",
+                         "simple-mfd";
+            reg = <0x6 0x00000000 0xd0>;
+
+            mux: mux-controller {
+                compatible = "mmio-mux";
+                #mux-control-cells = <1>;
+                mux-reg-masks = <0x88 0xf0>;
+            };
+        };
+    };

-- 
2.43.0


