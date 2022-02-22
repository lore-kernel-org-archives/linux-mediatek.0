Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdNfFnJy1utP0y5VKLlcCuhTnkEepWIwWG2vBWR6Hec=; b=lw1G9qbyrIHSuP
	TasyV2xIjPcbzcMIRY2YQM3fLsL3EXvf0H9w7zPQLu3BEqIdRhRQox/9Pf3sRYD2BkeVhYAyUwGtR
	Dlrta1sCv7CSYb2mTvOIjAr4IpXEBt6N9ERwOzz7X4RYR4nUj11/vIdF3lRNbI/fmEfAqPc7THKsz
	rTyLZXGZ1s1vTyR9kD63i4fRDBfVmEtyWi1UtsFAq+pamGrg+81lGKO4vtAfaaCRbQbq7mAmWqn6p
	pf5u5hAEXhEw/slzv/kJXOOvIyDIaih5DroqxRWz4xXCiSHASKVzGIcgTYZudEjW+m0HwSx56rY/o
	yY8+M1bhl6KSwHX5kJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWkf-00A41R-MX; Tue, 22 Feb 2022 15:06:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWe6-00A0Au-RL
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:09 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4FE840A7B
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541997;
 bh=hSZ7F8gBRrOjsQXCC6rZDxcT9sE5F7qcCO45OrXZ8Og=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=DLcNp4T4aAMbY5L0rIV6vcvgTkbSHLtLHPyeOdxe4zi7RgGJwOsZN0Vtw1TP4ry7R
 Q1m9NV/VNEqztwzN1NYPpZvK6stFI8y98Tm3fMdGf0bE6YHTxqqWgt6SV325aj2D4h
 57Di2sF8/mUGVabIAetJ87X/m1Mvwu7ydtiNssPq4uBTHl+qdeEzvg4AGDcAQE/PIv
 8I/z1jsdcpipKVLVt4Jq3Hx2dxStmuEh+qc7c4lX+mnHQNlp55B5BVa8haaZLRFvug
 7iZEauLHH2XU8VkDl8y8Y5xY4mF50QSmxAxsLK1rR4rLQK9HLuzfxbC2rKyV0yO/Om
 duA1i4K7oIEyg==
Received: by mail-ej1-f71.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so5862572ejk.16
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSZ7F8gBRrOjsQXCC6rZDxcT9sE5F7qcCO45OrXZ8Og=;
 b=wibe57TVyY6CVJdu7DlLuQVSCc9iWkgSny+dv5T560NxvdPeHEdrCUdpJ9hlmYzVeb
 XVSyOePeft9Q/5oUBUiQCqErUY8ecCe1W3RI84gTyvvtrN8lsHJgG4eEVP0aQA+cTOYe
 7RloRYV2ukuPkw59TfHM6clJLT+K863zh2lDVZpF6ekgSCrsoGAcgMdFTjw7JL3MD3WO
 3/urtrhkZRD0ZPmvMlW/BjG8Mi5OeMGqAEKbLzxqOieRNRMKZ/UsRFf/ac7WkHydddRw
 rXI/OQip7dkzciF91tSwkZAzXjC3ZpIQ8Y/+11k2c7UxdhmRJR19m4fa/6vUKYrBHig/
 QLUg==
X-Gm-Message-State: AOAM5305Fpz71MRfjvlfF39v70pPrP2w+20gIvscKtfXkduRjGWPLEbZ
 Q4vj+E2RRf6w64KbruzRgELTExMc7xJbfxAvA0Wyyokj+RL4EgEMis7fv5q6qAz9pxNoRBHZ233
 1/euJ2y84ZGvm5OBwaQi8kioCS30Mj21Zg309POIkgXOI87TnGw==
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id
 cd17-20020a170906b35100b006ca8d27526amr20328742ejb.289.1645541984768; 
 Tue, 22 Feb 2022 06:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWI4axJkVwBbmPapLPc5fCL1iXsNaaZjBGwawNt2yW9KIZGUlWJR52lTA7TnshFvIcz51bMQ==
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id
 cd17-20020a170906b35100b006ca8d27526amr20328714ejb.289.1645541984504; 
 Tue, 22 Feb 2022 06:59:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 03/15] dt-bindings: ufs: cdns,ufshc: convert to dtschema
Date: Tue, 22 Feb 2022 15:58:42 +0100
Message-Id: <20220222145854.358646-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070007_033377_D2E2204D 
X-CRM114-Status: GOOD (  19.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
 3 files changed, 71 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt b/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
deleted file mode 100644
index 02347b017abd..000000000000
--- a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Cadence Universal Flash Storage (UFS) Controller
-
-UFS nodes are defined to describe on-chip UFS host controllers.
-Each UFS controller instance should have its own node.
-Please see the ufshcd-pltfrm.txt for a list of all available properties.
-
-Required properties:
-- compatible	: Compatible list, contains one of the following controllers:
-			"cdns,ufshc" - Generic CDNS HCI,
-			"cdns,ufshc-m31-16nm" - CDNS UFS HC + M31 16nm PHY
-		  complemented with the JEDEC version:
-			"jedec,ufs-2.0"
-
-- reg		: Address and length of the UFS register set.
-- interrupts	: One interrupt mapping.
-- freq-table-hz	: Clock frequency table.
-		  See the ufshcd-pltfrm.txt for details.
-- clocks	: List of phandle and clock specifier pairs.
-- clock-names	: List of clock input name strings sorted in the same
-		  order as the clocks property. "core_clk" is mandatory.
-		  Depending on a type of a PHY,
-		  the "phy_clk" clock can also be added, if needed.
-
-Example:
-	ufs@fd030000 {
-		compatible = "cdns,ufshc", "jedec,ufs-2.0";
-		reg = <0xfd030000 0x10000>;
-		interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
-		freq-table-hz = <0 0>, <0 0>;
-		clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
-		clock-names = "core_clk", "phy_clk";
-	};
diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
new file mode 100644
index 000000000000..59588914ec76
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/cdns,ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - cdns,ufshc
+          - cdns,ufshc-m31-16nm
+  required:
+    - compatible
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cdns,ufshc
+            # CDNS UFS HC + M31 16nm PHY
+          - cdns,ufshc-m31-16nm
+      - const: jedec,ufs-2.0
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core_clk
+      - const: phy_clk
+      - const: ref_clk
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufs@fd030000 {
+        compatible = "cdns,ufshc", "jedec,ufs-2.0";
+        reg = <0xfd030000 0x10000>;
+        interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+        freq-table = <0 0>, <0 0>;
+        clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
+        clock-names = "core_clk", "phy_clk";
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
index dc93fe2d3458..6cb0001e6a58 100644
--- a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -47,11 +47,10 @@ required:
 
 patternProperties:
   "^ufs@[0-9a-f]+$":
-    type: object
+    $ref: cdns,ufshc.yaml
     description: |
-      Cadence UFS controller node must be the child node. Refer
-      Documentation/devicetree/bindings/ufs/cdns,ufshc.txt for binding
-      documentation of child node
+      Cadence UFS controller node must be the child node.
+    unevaluatedProperties: false
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
