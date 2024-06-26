Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54266C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoYyv1JfNQ5/bYMgeMIzJcXdRr3laILkHeyjJlFqVI0=; b=Ilt4s/H0ZkTNpa+z9r0LGrpHRi
	mAuk2c9xC/qqysGyj9Y4fS7iZ3WCLo+wmeNVXSSqp9prtaOK09YjQTUI0el8QTX2Nsp3pRMZ8YHCv
	PL9ZpI+Fmr5c9m9FufY+qn4LtzRH3TFIME6OvES2EDnE7tHTm+oVZXiun4hLQ37ypUciNFR2dlJ1G
	lkicNYSYQYHc+cvKVaPSFo9lupqDsk4cIpaO1wX1fxSmGBkz3SFSrBPsisCRk0HkAkIPHKxRB65EQ
	Dyw9ikC8YGbjxEwiamBIHbMWEiZLXugmy6Pnxc/xsgGeuw8NF2WgfAgOnLwFoUY1t/WE/jmEBB7PW
	LksylBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbt-00000006FgU-2VWI;
	Wed, 26 Jun 2024 10:10:41 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbK-00000006FIt-09dm
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:10:11 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7f3d2d441e4so15930239f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396591; x=1720001391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoYyv1JfNQ5/bYMgeMIzJcXdRr3laILkHeyjJlFqVI0=;
        b=Ut78zdD1ib+AS/dr6XIQCB5NzKMKApDr0XNlrUQAVOvxp2XJwf46vmwxRnWW/3tvLX
         PqPIRKeAMzG6acKaklXmAcH7zEV3AxAaV0WIYZNxsjvpZLN2dLj6qUrDN4TUMv+oCe8s
         /Wf2fJkhYQ5azq1kDxPWsHTiK4HWmy/fgPFX5cSqVcp59kRULpyHo/Dba2Lml/IldTop
         c6wrLSgqrlw5XRSFH6dXDuuMNZ3PG6NZTBXJqzXnCOqIPxXPdn8LI+kjyKx3xQB6dpGL
         s5esB+7Q7/I/bGkH+oRpNJd5NZfdqQah6l7La7TezWIv87ip104XLwQ9j+6G3mmy8ubm
         PJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396591; x=1720001391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoYyv1JfNQ5/bYMgeMIzJcXdRr3laILkHeyjJlFqVI0=;
        b=T0PW4vrJKBMrHCAC/y4okWuJCN87dacw6y2Am9sbeduVGx8ojcI3B82EJDS56XzfVH
         pAJCRhxCLssHrigGd9oiKlq1RVGmkwULRJRqu4caML+u1l6FWP6Y8mk+5i51lnQ2dqeo
         bCWE8hGnXgBRqGSj4/6qlu/Ff1fgb06xtUyxsgOd+OeBY942SruCYUZ9NC2Q7AD7XUEo
         ECDREheefXC0NsPEYMi/jac6iOcqi5nX4eAmeBP3/+PQWeTKViqov+mtzk8WvRDSb7MZ
         3MTk3/43rj/QXCOtCHsioWOVa4FV9OIebwYdG+6ob67tkv42/8VRBsKmrLTxB/4i/mib
         OGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNdXDTxzaezCFN87e8EMItyqNpV0ROt0MZyn1hSpl++puN3XfOGQDqaIdqWA1vQbqDsP47RgJ3dCh7u1xCGqA9qjVi8b5QnvzNvCzohtthcErh
X-Gm-Message-State: AOJu0YyuWDh6n66pVQZmi5+vjQBUpVplc6j2YQDIwEHnrUziTxtur/Nh
	h+TRyleBfyyV4ba+t7KdF/QQoyq7QsUkhdhEAfaRbYh68UA/kDr0KtNuR9TQPvg=
X-Google-Smtp-Source: AGHT+IEV500RWvFhXGEtFcRDihdWVaS1stReWnk1RyeO62061c9eWBuqX0Lm7cIXGByHUT76RnLSyw==
X-Received: by 2002:a05:6602:3428:b0:7eb:4957:ea5b with SMTP id ca18e2360f4ac-7f3a7556c59mr1318193339f.11.1719396591627;
        Wed, 26 Jun 2024 03:09:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:09:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:12 +0200
Subject: [PATCH v3 3/7] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-3-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>, 
 "Zhu, Yi Xin" <Yixin.zhu@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cSD/jHQUP9UaTQwVe/lAb1jbbNkgxv6GNkc4nFRX3RM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jPipFbrcUkKVwnewbgvivyKt142GIXts2UH
 Sl79iiv+JiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvozwAKCRDBN2bmhouD
 15DED/99VuG+osM5hju34/3Db9qPHKxklXrI4si79XiFua1YV/H57NmqIs9EsUZSKJ6GwjwvQwa
 xYohWS1lG91/2BrUnu7QF/ZLpFJnvK1INlBJBp+FbYwpO1Zw+9CionjNMmS96rG1/Ooq8KEiABF
 iycKZGpKvOs3BscZjRt/59vhuYQ0Z37w4M0uCq/yhnsEkzrQXsCNht7fA1OE4nza0ZZZ7mVqR6n
 3zTJds65wTZO7txj8XollTpytEbobEo1KkfTyuiyhlXnHNvAyBnr/iN9ir8QJcHI9Q/d+IXGe2a
 LO8JVMPHnUiwPfsx9/vnBd4ypxeV6D0unMhKc4hgJgqairKcilsfcFqLjo9cSpnPobYV01cssXG
 25zeAW9o3G8B2geGEBOCyRjKc2kYBF50qaW3fz5soOqs905+l8ItLUbQAy/cWY48krE3qy4XqND
 PLQfnOPuH5tYSbRjLyty/BfWCNWLI4kX9mRyWQ+poWIPz5K5brIK1uUf5M7bi4c2Z8840RDmdBy
 p9FV9nCSHVETJQZ6+34Xx1f4paHkux3LxO3Vsm3K62qM32hbHfav2HSnIA6K+sEZorXx0MavKY1
 /FullhERpGFOnV8cO8XOfHy75Ff2tEy1mDGkOhI7JAj22vPgWrsTvJ+cBDDxZfiZC9JgrwRux5B
 3XDhHQzntUpib6Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031006_882419_E68A9532 
X-CRM114-Status: GOOD (  14.65  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Context might depend on patch in Lee's MFD tree:
https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
and also further patches here depend on this one.

We need to cleanup intel's emails. Does this bounce?
Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>
Cc: "Zhu, Yi Xin" <Yixin.zhu@intel.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../bindings/soc/intel/intel,lgm-syscon.yaml       | 57 ++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index af442767aa96..b9bf5bc05e92 100644
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
index 000000000000..6951d55356d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/intel/intel,lgm-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain(LGM) Syscon
+
+maintainers:
+  - Chuanhua Lei <lchuanhua@maxlinear.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
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
+  ranges: true
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
+        ranges = <0x0 0xe0200000 0x100>;
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


