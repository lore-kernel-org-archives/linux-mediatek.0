Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B29DC25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7PYcSJNF1g7ywX09LW0XnY+rtNpzcQYeWJY4FR4cYM=; b=gXyYO9MF+30TJcztkIpDghrsx7
	aJ8pXMAlXGBkV4jkfWHq9DfQoLHqUcnVaih89HJgN84fzzL5urGF5GHP/IlTzZ9tuSBnqvayO+qoU
	GR9emN8g29soK453lBazX+RaSJdETuzBK9RXT8Y/es7wg9XC61E2ptn8RrwQNlkltaRktG06B5qyX
	Fil76omJ8A4Gw3ISp027V6FuIQAB/Kb1ObYfuD4kZEvM10kiPDuWvf6bD1B/wTkVhg6+aYEvBVoEe
	mB0LRUF8qUICrXdggVzxnZj8j8FHC59uYKgmc3Q2q0xY612mInM1jVuXEk40z3g4lgOp72svr8U57
	S+PQNz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUl-0000000CWTq-45BM;
	Sun, 19 May 2024 18:42:55 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUX-0000000CWI3-3rLv
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5751237a79bso3753499a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144160; x=1716748960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7PYcSJNF1g7ywX09LW0XnY+rtNpzcQYeWJY4FR4cYM=;
        b=QnFt43VDpd4IgvDvhgF69NXzKfkz7FTd5apIMteiW+hs3Tg0rQQq0cK7qP1LJLc1Ic
         rXtzqw074rfeYIVozywjDvx8dpbwdxGigNuNNcV4znQmg7YiOYDfaish07lwqzEwxBpx
         p5k+v9gpRCqnboi3dUvKr6rBoP4F6cOg/Dk6qz/PGJywvFcYlm8tU/lUdeOu5EL+qQY+
         OUhfwQg2ISbYcNkyBhYZWZAadkPIVoVC7203i1IQ/42zg2tvq2onsGFPe03qJEVJwKw9
         v37OnvZFWYceYVsYjCumbx9T58948ZfFEkXvYlefaojaLk6qxy5IIL5Gi/QqeRyUbThu
         usAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144160; x=1716748960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7PYcSJNF1g7ywX09LW0XnY+rtNpzcQYeWJY4FR4cYM=;
        b=t/mhx/giYI0k6PTEWkX5/JhQMJmv9XnOk/rf00ZC36XBeYOe4bMm8sVBrZSHjqWqvk
         3mewlTOwI63iSBqXTpk9LzAmRN5Xrg/cu1am4Waz5rxPkVeVafQDxWfAreEI1nlRxxLM
         MGpaAfe2TPoN1LeD71Ma9qWhJuviKM93T0YYEsRcjRJ4Y4GlFqc2yBQx8UxwYUs9Ok0H
         +ChQ9RvlTeWfLeaelo8LFwreP0hJp4+00tbIQXClILIUd7uj9ENJre690fu0oLpNXANN
         LC2AROJYhJWVFuCBTi5B2yHrUWnUafFasM+SLCH37s0k7+CiGvGJj6QqcYMn/bnnYNlN
         AIjA==
X-Forwarded-Encrypted: i=1; AJvYcCWOexWRohiWmREGLrLasdZXL92DLPL4WRRygWXCGGL8uK5z8tWx1cFwUyoa4IpPmrt/VGEQIyS1Wtk+gk78MOzqZi4E1KTjSPOT+8UJE8zuvDMN
X-Gm-Message-State: AOJu0YwAP6nEulrr7czrkcUZvutbot+P0btLLr+kHawWdjXC+pqa6PDG
	GhZuFwvmdqmh8FBCbingUJBQaOQesfmjeDE1FM1pEqSy/iUa4QXmCGXWJdikboIAtG4UwNo04Ep
	S
X-Google-Smtp-Source: AGHT+IERTbf+ILkmL8wK7SH8w4OETrwrM3/QR2TQZVEqGWc5zTaWklumLATqeRWUQnqKN8hvh9EpRA==
X-Received: by 2002:a50:ccd3:0:b0:574:ebfb:6d98 with SMTP id 4fb4d7f45d1cf-574ebfb6da8mr10157638a12.4.1716144159808;
        Sun, 19 May 2024 11:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:18 +0200
Subject: [PATCH 3/8] dt-bindings: soc: intel: lgm-syscon: Move to dedicated
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-3-aaf996e2313a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vAJT1P0FomWLhWAzUqykqRB/KaNwziPxJILM0FyE4jg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgSBDwpWFtDxIz0QH0LiVJvEMjMZleLn5a2h
 BGkMwtdqg+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIEgAKCRDBN2bmhouD
 12/0D/99xK/6Tafjmp5u5Rklb1WDho4MtHUcbBHTGUfCWh0r70/umtMwP5mPeqzC3sY4/EJet0Z
 T66duDebCbpAU1UH4A0XIq+0fGAYwA/Ap4cXaodHERwX6mQvAjAG5XSPKMe2/nd3MFgPMrtunVh
 sK1mAbhKAk9rCkz1B9lI8z5g0aVaukItJ4sfIyothjXIw6Y5AIIv494EA4pXXsDDdkjUwFb0kcf
 KVcl5wOijgOZyvHzJXu++n87RT7GNllr3OrkHYaZzL4qIqsu3UC+Gwx9nHJPcbHPJn07/71tsKI
 ipgLoESg6STxuAgpl4Yr4iPO3HRM//wAjSE4TQ04XhNH8D5qBRUNr+i0woIiU4mS9YRytVyDtjb
 FRxPiJdLZ0U73p31Fsswvg+uwmXa50/JSuiiYjgSQzfeIzLhCBTQ/KjxSqOU4seSGB2l3ZzcNAv
 2IAJCu5gdQFT+uAb6pVvQRV3nTf7Y4GT4vVtk7VPG6aekeNp9h/wY7MG+4JS9jirLvpgtIczE36
 8nEBxV7y6h4vbEIYTJUynB8ZW7z3NTr7vj60iczmQZbX0ggXDGQPg7gr1CvsRmvytOtTrS7SrK+
 P3aN6UokB+opJXkP4Cyz7opxKUPsh+k8tKIERvGyKrGmP7rxsyJL06PP79JYUCFQuADgVeERHiB
 axo8qKdiIs7/1Rw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114242_036748_570333F3 
X-CRM114-Status: GOOD (  14.39  )
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

intel,lgm-syscon is not a simple syscon device - it has children - thus
it should be fully documented in its own binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Context might depend on
https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../bindings/soc/intel/intel,lgm-syscon.yaml       | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 622ea0f1b08e..5a0aeae24a50 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -77,7 +77,6 @@ properties:
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
               - hpe,gxp-sysreg
-              - intel,lgm-syscon
               - loongson,ls1b-syscon
               - loongson,ls1c-syscon
               - lsi,axxia-syscon
diff --git a/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
new file mode 100644
index 000000000000..aa8d24074fd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/intel/intel,lgm-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain(LGM) Syscon
+
+maintainers:
+  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+
+properties:
+  compatible:
+    items:
+      - const: intel,lgm-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^emmc-phy@[0-9a-f]+$":
+    $ref: /schemas/phy/intel,lgm-emmc-phy.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    chiptop@e0200000 {
+        compatible = "intel,lgm-syscon", "syscon";
+        reg = <0xe0200000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        emmc-phy@a8 {
+            compatible = "intel,lgm-emmc-phy";
+            reg = <0x00a8 0x10>;
+            clocks = <&emmc>;
+            #phy-cells = <0>;
+        };
+    };

-- 
2.43.0


