Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E534C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=; b=R3nQuqfp2QnmVOWVIV0sKA68UY
	s2bHNXupxREImc9geT2qymt1tUjWraHmlKhOAjI4y1SUO2UVkvnnmq/V2LsrKEz3Ykw3aKo3MD1bt
	4cH1MBoJkNn9+8BXgMano81enPye9fnn3ovMTp8nLNU/aFb66re9eSIi9Q2l7pkSO7iDr2PeXl72J
	oh/A2iapCtUbEaR0BL9HWAEAukKDI2Jyy+aKw3cxiGj0kiKkp0YkA8n+WQnIz7nDQdUBMk64+ccro
	b/stZM/LDnhQ9gPdYACOeUm+pIYvE4C0fiYZwHyP/EY1j54FeoY/1VLUtJGpBgAodgMu26LRZoPbM
	PktlyGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpns-00000007aWz-0D4q;
	Sun, 16 Jun 2024 13:20:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnM-00000007aBF-1bjM
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so4223460a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543982; x=1719148782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=;
        b=ogtNrhuLOgj2XoKjDLkGLXTc4MXngGgFBOqfdyHlWb926Ljdu7MBgrpObWTOIgh7yM
         rbeCrTIv4UkS5oguzISQKef+oEFERrJsvfxuHCUU5+/3nEgW/WHKIp2wLc1cwNae0TJn
         kMcPd9fqJvmPijQArJ3plEd3emc9npaVa4NuWZj0/YoaL5TnntcPtfUucoT6jg72WMeM
         Ys8eWTWXfGQFaTY8n4iUGEK2s3xX7w5KkwRiNmZn6xnLky80Rq1femHm64RHKMdqKSAC
         nRazcMjpL37p9PomYtSiq+sjgAbHwflOAeIGc4Rx6zBHTb2+apYSM+KNnPvCCaOU6wJt
         IyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543982; x=1719148782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrd8K+qyBfVetpIrLm6qlKeNQKmHjz4ob0FFgn8jaII=;
        b=kBQpIs/pJFR44KqUsUI8SC9OWJ0AOWSjghidl1L96GNAF365fKWI4K0BfbQ4aSYs3j
         a56fky1oZw+GnT5SbkIjbg3j7xHy9scWpd8aUaR+1q2HitgvLYYtdVuCXCI9HcZejQBX
         OFmGwqeOxcj2xp1O3HMIbvrlIVX8pa/cfaUY9KWC5l4s754l8hYpFaPjyxbwg1TbsGnx
         11m6LG6mr5vCX/ADBuNWgoriDo17suoYlfoa/vodUKuBl8Mz/3eRWZESSqU8dQT3XqEO
         F2S29QhPRXNwE5wKpI/pkau8idc9+VCOMPcDGik9NI3bl673Q0PH55s666wE381Nx/ET
         oz1g==
X-Forwarded-Encrypted: i=1; AJvYcCXbqBlV3CFtMcyX6n9BZTdsx5Iv2Siwnp9ijus6t3ou3XqOk7p58MP+BjfX4CzW0agiddYA1o66vK/5ALv1S42YmqbVnpL4DZlDLdVN9E1Ih0c8
X-Gm-Message-State: AOJu0YxlJyIbPrLVFG9Ljqv4THaf0aNdk9lBB/pKE88cWhh23CN4UA9q
	Bp/ZMhentexQuWa51Hd9IjFRCXp4lBSwBP7w3QEPsVMNOriZ/nEdUJxqt42DTmw=
X-Google-Smtp-Source: AGHT+IG1AznA+Lz8oKbRyPDepmptaEHOWEWQisNJz6RK9g8E/VHYfQMB1p5/XhswdG1VwZfzoBzPbA==
X-Received: by 2002:a50:d742:0:b0:57c:75a1:2a14 with SMTP id 4fb4d7f45d1cf-57cbd681bbamr5002360a12.12.1718543982620;
        Sun, 16 Jun 2024 06:19:42 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 16 Jun 2024 15:19:25 +0200
Subject: [PATCH v2 5/7] dt-bindings: soc: ti: am654-serdes-ctrl: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-5-571b5850174a@linaro.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dA2BvNuDdbIFKkStpUlyQC5zc7XFrh1545e/AvgMWBA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZhdw2OJqKWPIez7Bw4c+bpBIlOWqahFa6N3
 vt1eSNm7wCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mYQAKCRDBN2bmhouD
 17EoD/94eOpZAXKoTf2ia7EdDFmk+pBWWwdfyOpIq7Ksp9V4d/pv7Di+qlNkb0wzLNuUQaEy9Jf
 8Wxyaw9fXUuFVQMzoWdzGo+Og3ShTXhXZrLO1SGQHNKZzJnZM3ddfNRxLXkUBDKJw3d1S5z3kDB
 UcyIPeE+/O1JW3+GLJzjUyMK54R9oYMg5khXUqHfVAusjzWlw5CvND4FIy9zH02FxN9HEOVCGSR
 MlleH3QxqZn9eI4HwwfwiO3Wqpf6PKy63HbglbvAt6LvrBGZAjmuIRRJgbz3AMo7dq6xDMj63e+
 CarQdQv6dn+FjXjM9aqLJymAqTmNKroi/eX4qBQ2Mn0t/t+9n+FO9qjnFp+0r/QBffYNQqmIAKH
 JnWWakdxz6UEltnAqADc0XFQd4Hm6RSM+Mq9WsrVIcTRGMW7+nEAMQVonhxKEhT4ydv7Oyye0bm
 cvNU4CtmWlZuM3onCm0q61ypX3115EnlOVJMIv1UfCx6pfL1RPxP1fZjTX8RcSR14Fha0ZaVlSY
 IiYAYMPa8BTrJfUOOYGVGsfEvu7kfJR04H9w5JoAwIQudTPsNbW6hOS2/6etb2gVcy9bBWb3np3
 nzN0QIx9OsjmU7oM56jv4UUqp1/My72/sbBtb9FqVv+sZHre/B+VF1alm0BlhuC0UBS5b3nUF/R
 +UoL/+AQ81t75cw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061944_446265_4BEA0740 
X-CRM114-Status: GOOD (  14.33  )
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

ti,am654-serdes-ctrl is not a simple syscon device - it has children -
thus it should be fully documented in its own binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Context might depend on patch in Lee's MFD tree:
https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index abd3debe5faf..d6fa58c9e4de 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -117,7 +117,6 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
-              - ti,am654-serdes-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
 
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml b/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml
new file mode 100644
index 000000000000..a10a3b89ae05
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,am654-serdes-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM654 Serdes Control Syscon
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,am654-serdes-ctrl
+      - const: syscon
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
+    clock@4080 {
+        compatible = "ti,am654-serdes-ctrl", "syscon";
+        reg = <0x4080 0x4>;
+
+        mux-controller {
+            compatible = "mmio-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0x0 0x3>; /* lane select */
+        };
+    };

-- 
2.43.0


