Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C58C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gzwSi26kgANkAlEKRYap+NCAHJ4FDv7RKV3gyml+oZ4=; b=lNtWWKAKEDWSWBxQ/JVSkbhvk2
	DSnSqKTHo799HYej5GpiXczpQyFqdGwbMYV4GJU4o7GC5Mw8Ea3LkCTzxWAFCB5eM+DFQ4tKG8BV2
	yrBPsUgGOzeK8ba6TAUMXN1o6NGmsWnrtthsE3NDRs9bM74qduo5eprgAawSEHr2HWx/SRjyQPLpl
	v26E/ZMSW7UUsgIj3GSL8QyUlN7y3MvTB9h2tJqHDavPMsc7k00EOwZiU4NPFrDhcasMSlBCwEcm8
	nSW9MLbCJqbAO+Ssvv3UGgyZ6mvmICFMufEiw9TPDl/wShN7CChrD2H+yWFyyeBlEuvLxGad0mTQ+
	bgndxCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tBk-00E0c7-0m; Sun, 19 Jun 2022 11:33:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tBY-00E0Zq-SA
	for linux-mediatek@lists.infradead.org; Sun, 19 Jun 2022 11:33:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id g25so16194279ejh.9
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzwSi26kgANkAlEKRYap+NCAHJ4FDv7RKV3gyml+oZ4=;
        b=N9NJrcZmpbNRtbzmrOSzC1g43nYZgHUHXO56Y++wJZFbMETQIcwn5PETLkGyKacdd/
         lP1ZhkybqL9/QbWtrPGH2yfuAych0rl/ZawKiN5b4NFcynGLUfXRFYTk/uyJKGcaHNiS
         rZ3ROqtYVCDXd4Lrfy0QvHYKibbJR/alnubrTin0m0wLPZPF583hjS5pvzUKe+wF55Nv
         XjTt5HR1IBEhs5gSs2EsGSvJDddP5mGrV5jlunrE9O1VD5xQKCE43Yoe264bSt1qz6zB
         nfohJrrxpgc0i/NdaJRVNCQfCQjaknKDNRMtFWRA9gHZpxZWbqN1o1dUVV9VXgUyd6Ll
         Msow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzwSi26kgANkAlEKRYap+NCAHJ4FDv7RKV3gyml+oZ4=;
        b=ATt2YSd59RLLSXtZfWcRZ2fM6f1hUTJr5T+UkVKx6nG3afmAxMfAannXubm5kYURC7
         ZLm5lxfcV1CYxz/lnY6h2NBgK3rVfkd10E3LJLFTy8QU6qx8azf5QbOxtUWxUx5W5cMy
         duarDx36QbasVfGbjmZh1XCWZuBl9wVPyfByT61oCx+uAzEct47mdGEwlY44K+MEhFQ5
         vn72dsbtSduyK8F9Rj3YPJ/pZJ+rdSEfT5pY8X6MZ4bZCH2ADO+5v2xgw6iUSHpbyePM
         E06rdJWIK5FGC86yvIWPy0uqo6105U1IcfPKUuLcmPXkXadTsBZfS1/N0qetc1575QG3
         06gw==
X-Gm-Message-State: AJIora94m21KT18LoxB4GYITFS/CnSqK4WJk9frzCAImozWl0wnnEGHI
	aTeto16/viZ3lDHwOwN2g2sdLw==
X-Google-Smtp-Source: AGRyM1tWBL6BXlRJ8aXxuhVL2aUBW7hRs6lbszHJQK6AclrQOieohBjws/JXHuhaxFHX/fk3lbHu2g==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr16482762ejc.712.1655638420564;
        Sun, 19 Jun 2022 04:33:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m10-20020a056402430a00b0042cf43e1937sm7949927edc.75.2022.06.19.04.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 04:33:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sean Anderson <sean.anderson@seco.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: phy: make phy-cells description a text
Date: Sun, 19 Jun 2022 13:33:25 +0200
Message-Id: <20220619113325.21396-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_043344_933878_851D0728 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

The description field is a string, so using YAML inside phy-cells
description is not actually helpful.  Make it a proper text.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/mediatek,tphy.yaml           | 14 ++++----
 .../bindings/phy/mediatek,xsphy.yaml          | 10 +++---
 .../bindings/phy/xlnx,zynqmp-psgtr.yaml       | 32 ++++++++-----------
 3 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 4b638c1d4221..bd0e4c4915ed 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -154,14 +154,12 @@ patternProperties:
       "#phy-cells":
         const: 1
         description: |
-          The cells contain the following arguments.
-
-          - description: The PHY type
-              enum:
-                - PHY_TYPE_USB2
-                - PHY_TYPE_USB3
-                - PHY_TYPE_PCIE
-                - PHY_TYPE_SATA
+          The cells contain the following arguments::
+            - The PHY type::
+              - PHY_TYPE_USB2
+              - PHY_TYPE_USB3
+              - PHY_TYPE_PCIE
+              - PHY_TYPE_SATA
 
       nvmem-cells:
         items:
diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index 598fd2b95c29..7262b8e184e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -100,12 +100,10 @@ patternProperties:
       "#phy-cells":
         const: 1
         description: |
-          The cells contain the following arguments.
-
-          - description: The PHY type
-              enum:
-                - PHY_TYPE_USB2
-                - PHY_TYPE_USB3
+          The cells contain the following arguments::
+            - The PHY type::
+              - PHY_TYPE_USB2
+              - PHY_TYPE_USB3
 
       # The following optional vendor properties are only for debug or HQA test
       mediatek,eye-src:
diff --git a/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml b/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
index 79906519c652..7083eddb467c 100644
--- a/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
+++ b/Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
@@ -18,25 +18,19 @@ properties:
   "#phy-cells":
     const: 4
     description: |
-      The cells contain the following arguments.
-
-      - description: The GTR lane
-        minimum: 0
-        maximum: 3
-      - description: The PHY type
-        enum:
-          - PHY_TYPE_DP
-          - PHY_TYPE_PCIE
-          - PHY_TYPE_SATA
-          - PHY_TYPE_SGMII
-          - PHY_TYPE_USB3
-      - description: The PHY instance
-        minimum: 0
-        maximum: 1 # for DP, SATA or USB
-        maximum: 3 # for PCIE or SGMII
-      - description: The reference clock number
-        minimum: 0
-        maximum: 3
+      The cells contain the following arguments::
+        - The GTR lane (minimum:: 0, maximum:: 3)
+        - The PHY type::
+            - PHY_TYPE_DP
+            - PHY_TYPE_PCIE
+            - PHY_TYPE_SATA
+            - PHY_TYPE_SGMII
+            - PHY_TYPE_USB3
+      - The PHY instance::
+          minimum:: 0
+          maximum:: 1 # for DP, SATA or USB
+          maximum:: 3 # for PCIE or SGMII
+      - The reference clock number (minimum:: 0, maximum:: 3)
 
   compatible:
     enum:
-- 
2.34.1


