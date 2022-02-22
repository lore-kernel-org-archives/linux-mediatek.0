Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF29C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFMvgv4VU1F4VJ+TkotPwveNbvfqDxhGt6vi8pUdh6M=; b=MAbGQ87AuFLw/K
	VfxZc/0dgcj7wrmdnj6usLk6WyE6bqNB9Sjy5x9x2myjRboh7Vg7yVxEYGAFSwbtzEknGCP9Sl+Iy
	r74r3c/fzZOzr8kByp8XD6swIQIAGA9j1qTyIjMg2P/+WYW3aKXoWU+W7NABZEAMOnS52w3JyPfb0
	pdCkIyeEcpG7wT99IDZOczRreO2jo2MHiZl5JzNJrs8gfz5SFnX3bHpa/BfdbQE2XPWOkuO2O+aYP
	oIHUj7WtcJxTer/hXx/Z8gXxK93Ws3ZWVKcccwO21AeG8lzxQTgXJWAYLg2jeQ0mTD+0L0uKZk1N+
	b0dHT1Jm/+kRQhVMH+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWgL-00A1hm-5c; Tue, 22 Feb 2022 15:02:25 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWdu-00A07d-Mr
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 14:59:58 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C195140313
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541991;
 bh=1P7qQVIntzoTj3/oLgMEwV7rKt1l7cL2m41gmrqktTo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=bU6JK5adMWxlJBra+LF0Ror6FdImeaukVNNCrbw3yE8hwL6RUZK2oBpGpbE2I4J0G
 T1n1jVbzQQD+SMc/12x4kD/z7afsVR27irY4K4IKMH08Sa9bFwWMisBQ2tr8D8RgUf
 b/MA7aVxpbG2YcjZ1M/MO9FhOJLgQxuJv1MeKx6U6Sa0b5CVpzjs/A4jbxT3PFZijN
 +I2jlBtUmZy9dmaDmymZtGEbLT9YiPktsa/aQsYOBeSCBVrdpV2eHN92EHRisEd0eN
 rtQvAzzV0oXWPhv8tOSiIOtNBM0jcCo/J3i0/276sR0g6lUAZGuzbbYBGciyBz3M9d
 jooZCxqpRkBIA==
Received: by mail-ej1-f71.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso5891563ejj.4
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1P7qQVIntzoTj3/oLgMEwV7rKt1l7cL2m41gmrqktTo=;
 b=2Sfe62YTjMbILZoMK8KJB13OvrmjR9lWC7xnmoSkbty5AfwA0877eNwuSLE67BSUX7
 z2wyu67a8/CTQatZ0TOuk5lZIJdjqh0Xj+96mVXVV6Zkw1tsk/EkNJaYCHiei9jVoFrW
 n6gsgPJjNWzXdPEoKchakCi9qV5505ph84Dhj1M+v1yF+xR+xO0IGyHNgk5LDbMVaEhI
 g0Ja8cc9trbSm+jy1Cx+LrmArP9MlXK3YT6DlqYkrmdL4zFnot4MDzQkQPbod73+6qru
 gKr2A1ll5RmTnPkkX8S9BO/ItfcOyQuPi/CHlmCQzx3b2tVSJ2B1RAnYOmTqA7YAJDGE
 dZsA==
X-Gm-Message-State: AOAM532uY+WRqgAmUD/dp9JUZeALS4tT/DagFO4RLDmIXKdNBPOySLOO
 3fqYa56HLAlIeip/TyP9nHCF9xzdxGrnsAXrRgrfk1ya+OS5LVDX/i/HoFkOwVIZcLh9b2W+5JG
 cKApNQhlZW5L1Q1SAleJ4jkw0kuOksBVsrOeCS6mSKdZ68iWUNw==
X-Received: by 2002:a50:e04e:0:b0:410:d961:523a with SMTP id
 g14-20020a50e04e000000b00410d961523amr27317302edl.223.1645541991397; 
 Tue, 22 Feb 2022 06:59:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUtYJeXKFR/3UPBCev0P+VF4C8MI1ryF08nvFtYgouje4ha2q2QFFwRqFjiPr36iU06TskIg==
X-Received: by 2002:a50:e04e:0:b0:410:d961:523a with SMTP id
 g14-20020a50e04e000000b00410d961523amr27317282edl.223.1645541991213; 
 Tue, 22 Feb 2022 06:59:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:50 -0800 (PST)
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
Subject: [PATCH v2 07/15] dt-bindings: ufs: mediatek,ufs: convert to dtschema
Date: Tue, 22 Feb 2022 15:58:46 +0100
Message-Id: <20220222145854.358646-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065954_950536_2DC92184 
X-CRM114-Status: GOOD (  18.43  )
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

Convert the Mediatek Universal Flash Storage (UFS) Controller to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 67 +++++++++++++++++++
 .../devicetree/bindings/ufs/ufs-mediatek.txt  | 45 -------------
 2 files changed, 67 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
new file mode 100644
index 000000000000..1cf530b5c57d
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Stanley Chu <stanley.chu@mediatek.com>
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-ufshci
+      - mediatek,mt8192-ufshci
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ufs
+
+  phys:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - phys
+  - reg
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufs@ff3c0000 {
+            compatible = "mediatek,mt8183-ufshci";
+            reg = <0 0x11270000 0 0x2300>;
+            interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
+            phys = <&ufsphy>;
+
+            clocks = <&infracfg_ao CLK_INFRA_UFS>;
+            clock-names = "ufs";
+            freq-table = <0 0>;
+
+            vcc-supply = <&mt_pmic_vemc_ldo_reg>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
deleted file mode 100644
index 63a953b672d2..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Mediatek Universal Flash Storage (UFS) Host Controller
-
-UFS nodes are defined to describe on-chip UFS hardware macro.
-Each UFS Host Controller should have its own node.
-
-To bind UFS PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS M-PHY node.
-
-Required properties for UFS nodes:
-- compatible         : Compatible list, contains the following controller:
-                       "mediatek,mt8183-ufshci" for MediaTek UFS host controller
-                       present on MT8183 chipsets.
-                       "mediatek,mt8192-ufshci" for MediaTek UFS host controller
-                       present on MT8192 chipsets.
-- reg                : Address and length of the UFS register set.
-- phys               : phandle to m-phy.
-- clocks             : List of phandle and clock specifier pairs.
-- clock-names        : List of clock input name strings sorted in the same
-                       order as the clocks property. "ufs" is mandatory.
-                       "ufs": ufshci core control clock.
-- freq-table-hz      : Array of <min max> operating frequencies stored in the same
-                       order as the clocks property. If this property is not
-                       defined or a value in the array is "0" then it is assumed
-                       that the frequency is set by the parent clock or a
-                       fixed rate clock source.
-- vcc-supply         : phandle to VCC supply regulator node.
-
-Example:
-
-	ufsphy: phy@11fa0000 {
-		...
-	};
-
-	ufshci@11270000 {
-		compatible = "mediatek,mt8183-ufshci";
-		reg = <0 0x11270000 0 0x2300>;
-		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
-		phys = <&ufsphy>;
-
-		clocks = <&infracfg_ao INFRACFG_AO_UFS_CG>;
-		clock-names = "ufs";
-		freq-table-hz = <0 0>;
-
-		vcc-supply = <&mt_pmic_vemc_ldo_reg>;
-	};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
