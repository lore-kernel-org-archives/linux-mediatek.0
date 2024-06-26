Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE89C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=; b=RawQ6scUbKbtIvAa/47pVXFp/s
	eElbR5THrBAifRC7qnr66M5D/HWnSuYurl9xP4K8dFifmd0cjoZCNUypjFQDy+MLw/zpv8xvtu+x2
	1tWcJnOsUn4RW9q7w40fm9VN8iDx9eaEAZwrPEwSgq7iJ0NLA5gTxWl1v9QYc1zUNpG+M9Q5iq2Uu
	rve3ZAuTljg7giJD4HhEqRObDUHKqsiQpZ2toaDbpE492ef5CsSqWslSQr5GPwDlSXdZy5lJ1wn+h
	C7/Gb1JH8cHhQyiUvpRj94tr8kAMYjGkIufZAaMNCmfb4hJ7OJrE48ytHJn1R0/iC0aB7RuE02DJo
	+/1LluFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbm-00000006FcR-2cVM;
	Wed, 26 Jun 2024 10:10:34 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbK-00000006FJe-0KFy
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:10:10 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7eb671a835fso378209939f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396597; x=1720001397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=;
        b=T9FoR1rOmK4TyTII+n7sFlbb7JxsQytkjCViad/vXfYnOlq+Z5Q7bSsj87ywlcwBUX
         4xdz+LX5uGF27TlmnQqJyc8Cd3o3NUjqi8YSOmuo1XWZf0MpAl6Fq4t4KdDDVqV6DP9U
         UjMW3yVkrCQdgOIzAnCjtkkyQsDFIaxZaw4i2B3d3f79d4bsWnDPCqNocbOHxvaVYdSl
         m0cr2zfHKThOxbT01yiandJvTQkazvBXLU3hWMCM/JA8QLT0Hfp626XCFH0aBCa3x7ne
         a/9vkbOlCMQutdcpeN4kSRjpgyaA/CsxFJEVB5IhQyhWPKVPvduP5NyXYXxq9nMSMMg5
         Bj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396597; x=1720001397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=;
        b=UGQ8ouVnf8LnIXpd13cxh88sEs0r6V/5tNcx1cwr+oFmg+dL+DSZ7vxSCe7BSTUJNl
         65S08O3q4ugqhJK0YLpOjrGotW9i+YPEqQaPEm1YUviTXwS/b+6R8qPlXTkmYRTzKKAF
         RTK/2JUVni9pakVZNFRNu20pQmJSm0DOBCaTFmKfAscyCctXSGQTXVbsZ3PozRpI5yFb
         Oori9poZCx3YKX9lsI+MdE5JdnkCHEk3zqVPS9vGn6qc2s47UNTKZUBXvWLXiLFsLCxU
         p2nOWcQYoIS+NDUrth1QGTvEQN9uAgN6HLiS03zVBrXHzhRS/5hfEhUrgfeZeVKelVF5
         HHqw==
X-Forwarded-Encrypted: i=1; AJvYcCVxEsaoG1995deMKwBjZvSBZEgqUa+E/GmSyctHRD4UwALgGD9C8gCooyihn77UhLtDyOYnaVpZeq9NhJnemjOGTAYnEnhIg1oQU6LVu3Ep3bbC
X-Gm-Message-State: AOJu0YyDHlaJo5yuZXnJtBnA/PW6TOVEC5TZGRv1CiUxuuCmHYkQ8WtD
	sC2UYlwjKItVYZyVieD+wfLeDY0+hcDQGklyVQtcKKCwnlBLERnvMZV45qUAH74=
X-Google-Smtp-Source: AGHT+IHI1wtegxgP3+6Da94JrIe1ZxojFMEUdsp5T+ZGQfCNxN4Ar0Gf4u6U3yfHQ3/tOnqVb8Y03g==
X-Received: by 2002:a05:6602:6b10:b0:7f1:3ad1:234e with SMTP id ca18e2360f4ac-7f3a4e62794mr1343333539f.18.1719396596988;
        Wed, 26 Jun 2024 03:09:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:09:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:13 +0200
Subject: [PATCH v3 4/7] dt-bindings: soc: microchip: sparx5-cpu-syscon:
 Move to dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-4-3409903bb99b@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2G0rLi4cLmhzl8ZJMSFvOy5W9L4JVSO3sWW9FraSLfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jQVYvtx7mGIQPlwytJrS9d+PkZFNMW+2/a7
 XEXUUXPRFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvo0AAKCRDBN2bmhouD
 18d7D/9XW67fIBG54/dKruUXgjoUk97WDQY9GDGuvYHIdqvuAjQ9Pc12XOHfTt0vlJ5UphWrM2o
 NkIedVjvzsEkI8ncuFSfD1GvwypTgtYly9duJ6HOP+RC6QORcaPTlxfdFLEl3g23uio164nY65c
 vFDduNYvKbF/8WbwckF9aKGnvMq5K5jsIM3Sa8mVJT+L6sP5kLFXJX2xUFP3deBXqGEtYSrvru9
 NTgJKckLWd+3vpuX+xy3tQ5b4qV/zm49RrmHepjUbPI1eR4+HnB+rWEtXMejx2fNBAAHRYUrEC8
 OHbzg31wDfLAjOxdE4yiRqG+u46J+ASS+v6Q9Xt8gqYpC/Nxf1T0vLnoIQevZsDD4dvKNoG1F1n
 bLuXZqhp39cGJKoCUMcUd0pmePatEZK2w88cS1SMgWc1KTnI4lJrPkTPJaiL3zGGAtCeg4a/6AT
 ea4r98wjcLSWbZVv3agdaF27ioRsvZm1uAjLFGRRbPCI1BxPzPU/V0LXChNWEmPH4K7t7f1xHgZ
 3n9qZ0C5+iicCfd3dIFklyFNjvBhIiwb59JJJqUC/0nRjqZB33lAGyKi0AYu3sFH1HhDOHWrZ/4
 UjfSLHejQZVoc6B8o3LxEQkk9vI2IqfvQSQf5KpUSpRUK99JdVZXpIqaPPW5U9ZBmPSDkGQPtzA
 U5IRE1lCVUdhxbQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031006_651340_E632074D 
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
index b9bf5bc05e92..abd3debe5faf 100644
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


