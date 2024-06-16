Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A3FC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=; b=iJnxDiPUKn3fGuVgohi+AbdaxD
	MGEY6t4rIL1de79z13Kc78eOljJQ8D0SkQmLZfA04KV4TVHN2jJ1brUN27nZbUz+dgjYelYmkAxCr
	tELPrkNBA3mtaeuTe1xfPgmPcxxeSZuAUHIEqnxeIOgwpNdEnrvEOaPuoHlKsvzKUsfSR+Ig7Ad4G
	+MtwL4MQ5eYpArGceHQ5CwK6CEpZlV9wgZGM3aNwILpDEOEHQb0/MpfluMeNYi2sEGhyOfcA2ltQP
	B9ll8JiqNTT6LXEQDqCBryTo9KcpM7aoUFFtxMh7JzIVEu74sWwb13ICnvJ261IOjxePUY6Z2CWYE
	UHZsO0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnh-00000007aQ7-3h4C;
	Sun, 16 Jun 2024 13:20:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnK-00000007a9j-1HsZ
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57c5c51cb89so4104506a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543981; x=1719148781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=;
        b=bB6VJNHBtFNVyX5vvFs29pOPlKijaK2XBPmVnsoDVISLLO5cIAMZ79VdLd/hTT/v6i
         qDZlT/XnzxIG9EiS8sQcTETL/tdpI8/je3cMfpR7KPnMZHZQjLuWFfE1HZqa02lvX7XA
         0pINq6VkUxcJL88825ubgQWojnUsyyMGCXmyafP/o+n9s45Jw9Wi5DXgT33Uv+wt0vdU
         kEfQfMZS5euz3J5YRf/ljt5a5KLHb1eGvM3Oij8Kx89uL0XVFDC86aW/qVtiEbtkJejp
         EbA24AN+OWowDJ5J3UCpu4qshhwNof75CYU8VC2FQuJ+uCmo7o/4/oI4hb1/E/an7WB5
         0QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543981; x=1719148781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDxj3dPqBsikHw3COW9fzyU/UFgyyuz6MU/96w6Q9SQ=;
        b=diRCxzN0A4Bvac8yArO0bE6V2YHjX5U6ElzngUzMFV/5qmXppSodqMDmlmIUJlVttC
         kqujrdEqeddTMxmcZ3ZdGV+f4UXlR6aOzSKxhemuJlNezVF0U5m8TNu5mnxZAkYzpzzQ
         4A6IuK+PVsMtVAyuI6rVqIX0Te1L7/BQXqP+9wcm4gFPeNmF4iGcKNwHYV9XPKGAjKvn
         AGfrvHIKwAiNJvptMcvh07y1VBW+NbxqVFrk3CWEOJy6r+5vVxOPvj6lOzvLFAQzGrMa
         GlrmWd5eL4AHzxoMq+09sp+h6YmlgDiQ4Xotqze7lkjBNdPRbpE+Os0VVb/GHhMjFV41
         KWXw==
X-Forwarded-Encrypted: i=1; AJvYcCVIBf9GsQlNGkUN6aTm+yw5MC3ZXvW3mU6zHQQXAi/RonhSC7QBld3Jq6AYF3MO2OyknKdFka7JU8Spxnx0x6F5cLLsW6NlKVCk2FSWfxfRopjy
X-Gm-Message-State: AOJu0YxiJGsYGZiJod2pLl6eP/O+z8Q73hDuW73B6FcS2W/IcFgkRfYn
	UXlO2k10WOVLvdghDlY9l7eqTdgVYfPAvS3HBOt+FU+gd11X2eOCp3BW1kC6Ab8=
X-Google-Smtp-Source: AGHT+IGXkj91rCNRNjyM3+Ufq9rMUAVmp/bvUxrcipMwwyyQmCi9zjaLfs3liz7jMElLGmjYr+sppQ==
X-Received: by 2002:aa7:c419:0:b0:57c:cba1:444e with SMTP id 4fb4d7f45d1cf-57ccba144dbmr3519556a12.13.1718543980893;
        Sun, 16 Jun 2024 06:19:40 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 16 Jun 2024 15:19:24 +0200
Subject: [PATCH v2 4/7] dt-bindings: soc: microchip: sparx5-cpu-syscon:
 Move to dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-4-571b5850174a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2G0rLi4cLmhzl8ZJMSFvOy5W9L4JVSO3sWW9FraSLfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZhfXHBzv30HPqvVvXuckFpOfUc2X2zBRfAc
 HNczWTgBAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mYQAKCRDBN2bmhouD
 1xgID/9ZhhA79JtYTQgEYo+AFhkXlRrTae7kFOvzLQw9hC5Png0N364hNVUaPL23p8dsFP0eOoJ
 Lejso+pHq488mcN0YcLMs+a/Gdqfkfc/21EBbKF/zMTy4tgetv6a2QVs0XODLwau3K/tArM9jfP
 2VADzB9BFviR66voHsVe0rhu2lMHef5awGV3Y8unnbwTNjrRPfdCbbqdm+W/TaQiXQUONW9Z9Kf
 rzXf99Nx9jB+KbxKHvk4rRwtP47eN0YHYDdvp4ezsGNhi7lbhMinMDKyc08MYq7nuyiUDUo49kK
 O89f2SD3G8UA6P8DSlsTxaVQtCewQblZmLrMDjDC7csET/s574e3N6UTefNOJZmhP7XHwdKUhbo
 EGoNiOJgkszXzQRyfHEfnrri9QYexs1dQzWMGzfEZV/1UlAc/oNFyWzW7Sdek5uTTVwvIKKz/zP
 r03hu6jhn7QdQLJBtRdm1c4wp3RqY8iR7xA/c5CRmU442GJPey5nDDnYKYsw0qc4TFBah12e7RB
 19K+ToU38Jub5zigxStNHNuzNqbgODXFv6GkGb+8RjfSKrBuDraKca6byqyMyQlMFdSjtW38+95
 tJZY9QdDegJNpdAQ2GWR9zhv/FrVlYD5AH99v7faN0hOKx6/g8NciFccgvjiNgm2C/PxGA/BPrm
 LJqTwU2MlcHBwbw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061942_476446_DBAE01F1 
X-CRM114-Status: GOOD (  14.59  )
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


