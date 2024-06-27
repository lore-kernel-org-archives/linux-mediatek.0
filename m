Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961FAC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/72dXFog72t1SdKELuSTolYPlqsqPYanROz8CyzAPAs=; b=kPfbcajotIoERo/sMopIBKoo41
	9MWKC/0gZKRfQuF/CUn86HbN4GFCCVgJxQmgxxlbofs479t8N00z24aD4qjWAKoRM53dpsbx9ED4u
	Ix2eKRKIHZKlkpOz2CSRurRPtyCAfaBlPWBsMyJE20aw+O9yfktR3Tr8jyILpp0CnyuiK6Q2kY8lW
	m98XlunqcLujdDtrXcV9SygCqexeiewKruyAxhgNvil2EdnOLHF1NnPmj1gD0gKsPUGSinBxAAtTC
	gtEvdhUEx6gRwgvyiH9i4LJkXLP0v4UZxbW6gCdclivm1otE5aMAfO/6xrzylqpBnT9Z/OgsIPESZ
	fOTjjk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmRJ-00000009xSw-1tXg;
	Thu, 27 Jun 2024 10:33:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQl-00000009xCv-3jVe
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:32:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-424acf3226fso15769735e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484362; x=1720089162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72dXFog72t1SdKELuSTolYPlqsqPYanROz8CyzAPAs=;
        b=jwv3LvGVp2z/CTDfv37kxclCB8pFzw53gdAX4dCoNJxNCqG9MWdM3apslE/Eboxk2J
         FDJbW1UoWQg8lQNqlBgXY0rwSExlq09XMHLNNZZbJclPsrveC6LdqFrlIy7Q8fzJi2DI
         t9p3DwXdfSVMq7heep3aSMwDabRpQmtHLBTPv3ETkr4eCGG+Uiu15EiwnOHGW/Kgldhh
         GAofXclSK64y2c3q+czRUEW/lfpXd9ahuxtg5u/s1uo6sWuJG0ZIvowm7lYGMyX11KG6
         5WbaS5lv8a2IAYY1np/CuxDO1pzTlb3kD2J0eXscbQcs+bDpTituI94CTwVfhRsObwNH
         RgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484362; x=1720089162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/72dXFog72t1SdKELuSTolYPlqsqPYanROz8CyzAPAs=;
        b=CSkSWf6ECwubIrzSAR2Vk2qNQcV8s/RC/o9OYseo93iEiw379WBATGjSs+w6jIQyDw
         h8nT3e2P3emlPayONeAa1bW4EsO3LxCJ2NSKttSRhdgmoMv27dNOpGsix7fqpPMm79lp
         LJJndDLYK/7p7REZD4I1x171f4E2zwaRHEFbLEihJiUDLCcpX7Qr77RDeQm7wUmDmGS6
         11Jegmaq7ccn489tMYmoQJVmBmZ4jL0rWuL6yRheInyDVQawN7JyaOtrJ+zSxMlf1bUS
         ciZJdfeKvr0fbSvW91/PeTHqjgk4kipqbATz6ycrbYtK7P2Eka7F+63zhb7HSBL8ItYL
         +O3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFyUm+1yKMQ6iLr4h7q3E1xDwI00zavv4ibCCg7HkyNlmlUh4t5syYqHh9lIq3K9Nw9jgEUF7LBgHPHyoXVH27R/IGFbRGiZDNZzG+eCdqlGpW
X-Gm-Message-State: AOJu0YwLzfT001bky6X3Mp2tT4YmTxevasffsgOCXdI6UNZtN8xr/UrV
	4UKp+hgIm5BzUgtijxXUfWa7s23IXTl/rOReamL/n1OuMqbt1WqLEYX/DIKSTg0=
X-Google-Smtp-Source: AGHT+IH/kzOIaLiKteMbLy0cBtwbkcTKMmn/pR09hom4+eGaNN6ZSj4lhnuKK1SwTp4TkCxMefFcUg==
X-Received: by 2002:a05:600c:44d2:b0:425:5f60:b818 with SMTP id 5b1f17b1804b1-4255f60b971mr27977775e9.27.1719484362203;
        Thu, 27 Jun 2024 03:32:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:19 +0200
Subject: [PATCH v4 3/7] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-3-dc6699a9f3e4@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>, 
 "Zhu, Yi Xin" <Yixin.zhu@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtbVZYDkzkryXQABqoTO7fSXMXAyEAw/L2jsCfy/SN8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+8Vs4KySkM/ISHPM/mllt44fo8lqKyxHXmU
 2d3Cv6UqxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/vAAKCRDBN2bmhouD
 1y6XD/4z7Yy9cF49133e6MlToxL2tOnL28Qw24UdqrqQypVdhDuvNCe6ajObx+40WkuhuiFbKxu
 UkGNNeaC+cqKg3eG+uPLEuU5TotMNOsHBeyIBjYXVuFMhh5U58OaFes/xEaGk0phhwpfMXnrZC3
 MK3AOI9j3+Z44/6tYGWODKrVQ2SmI7tmCvMNteG1ZZzo1rImQUhAN8fVJIAKmqAwZ4mBLAd4S9Q
 0qSpDl5q9AlUPXvax0kerX9rNKB2ivtODdzeNUKCK9YuaiGOHDFpXy7mQfDh3iKIWSE7CkcERf4
 wikiN4ItXnv1IdlNYeeWcOGMqWfa7HIODhIgibDHEb3JpTPScuhZ0YqcsWxqptxqYWng7JHmsL+
 5R1kovA92+EV+JvYkuJnrP8K1j5sX96dqH6hMzEJgaDuGt5yBL7m7LIMjIpMVCEAM8Zp0CZmuGl
 uFbLwuF/24O3HRyQaIRekk6WrPesH8tSm6x+6jEWHqQ3cTddVe7PBCMiDisEJV0AghtO5+P1/7B
 d6P3KNw/aZ8fezv4lE0xkMFNudo/OlTJ+Binwaq+YYLey/apPvZK0CKZZzyXgbEvxHwEmG8ABc1
 hp7mzxr5poffPo9wh8NiQyZRKec3GUDuUvSkYZ9n6nuyWXiGxq6EvkSDZikdzOJsHIql35TtADc
 nDby8bfT1SG/7qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033244_094794_EC1A2E44 
X-CRM114-Status: GOOD (  14.51  )
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
index cc1e9fec5cc7..0e19eb0772f1 100644
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


