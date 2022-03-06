Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC11C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uX3fJ9fpLKPiEXdDS/VQXjZ1HeQNZCT5FiCPnYLI9VU=; b=qDk4/uZUJ0+fO3
	8wvKsrKBqh0eCFSGHEvzcZ9LIYyT8+MKdTFSGU2z4I+gGc1ELZnv35XyGtUiYggNXmSb0XrFcdI6H
	ZWaG8fAKORoEKRfFk1Y3+EuPF75+quG6VryPE0eZd4VGTeAaevdj43DwBi/oozwc5ibOAIKM/+RNE
	aSDuOyUBv/SaaxCBW6so5Bwo/bnzuZZI08OLwXBrCK5G8ha3r4aQSuohKMlL6PguG4x6kHP40v/Q9
	EQym36BbhsbzUpV+K3MAac5zHz7qeZBmbUiUMJhMODhVqimR7ibj4gXjqRc7SJ4OnkI11Y98jPc6Q
	U0EPeqS5lckWxSViu7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQosl-00EXlm-Uh; Sun, 06 Mar 2022 11:16:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQooS-00EVLq-H7
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:12:35 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B9D903F635
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565130;
 bh=wgqfJLkBNpY/mAWjYm7cIkcCFLA2nEZfPDvOkx5plvo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=XpmvNknC22UxnjOPzKL23Xr3Fq6BWCDFxe2wMBCZXLnCUYLdm0A2kQUfpSbNxtV7y
 TQfyBCmWe3u1Me/9q5JoVyVLJOrp1o5RUbnovr3oVnYKuCvuPpJ8ZICMmoUZSWMYwM
 TdnwLiBtdjEeUHB9nVON9qb8pwwlT9wxZBtW2mXPPMI4WVGIKaEgtVHtEUSUe49Uff
 /jgv7Ck14bO9iku4EGeca0FFLo7GYLsdNDL2QU0m6EaCqYl2tk+jRsVG89xZdFxCu+
 gJbNY23aE09Qp38yzFwTdzAFP4Zwab6hfUmh61kHE4CDMzzFA57ECwwOdW8PILsciz
 TCeYrXLa2B7Xw==
Received: by mail-ed1-f71.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so3281608edb.6
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgqfJLkBNpY/mAWjYm7cIkcCFLA2nEZfPDvOkx5plvo=;
 b=CCQbs/nwKjNa76jVDH/oEPDPt1beJc9H9E0CR3IiDU0FMQ4UI+3AwQ0jzEJCxCGibW
 RBYV/PC3VB3RA98egUHDfPeqM4neblpFnnFBkzA8mw4UdRW3GtqsSV9sKMlu7QP2aWXv
 Psu4AWsHRY16cGi5sB7k08dO37RGd7kaTklm5xO9howpDRWA5DvJgOsG7W3qShsZLZfP
 mFw6eLW4JeUT20odciLqMlnSjYUh1nVDvCDkDRjcP0WKlUvUAv2nOjGOF4aYcz6go3Ls
 F0C5yGSEnDR6SKVnQOVnYn7MvkDBoSjjwwzF47VQS4D4s0U5R0exjPTJWUHS5BgaVb+O
 xdKA==
X-Gm-Message-State: AOAM531487SuLu6+4i1CXdpOpWWAb1g8qkQwThna42o2jLAtkRSwgLLm
 3Y2IrH82GYAONhwSK8a1WgLqUyhjt1Td+bPG5+hgOjex0uEB87+f09zB0Gcw3BsbQhf20K9Z1/Q
 puMLOq7UXZiBogVOvFDSICzcyPet3KrvTv/nRXOYpD94jvsCBNQ==
X-Received: by 2002:a17:907:97c7:b0:6da:b3ba:6d9f with SMTP id
 js7-20020a17090797c700b006dab3ba6d9fmr5656073ejc.256.1646565101840; 
 Sun, 06 Mar 2022 03:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI/f9oe/d9Yo/mQsZljd3XsbvAm03QZ35EIUbF5Mn8Bm1LIQVAU9sQSoq11d5BH7Hd2xRHBA==
X-Received: by 2002:a17:907:97c7:b0:6da:b3ba:6d9f with SMTP id
 js7-20020a17090797c700b006dab3ba6d9fmr5656059ejc.256.1646565101607; 
 Sun, 06 Mar 2022 03:11:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 07/12] dt-bindings: ufs: mediatek,ufs: convert to dtschema
Date: Sun,  6 Mar 2022 12:11:20 +0100
Message-Id: <20220306111125.116455-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031232_723255_429124A0 
X-CRM114-Status: GOOD (  17.88  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 67 +++++++++++++++++++
 .../devicetree/bindings/ufs/ufs-mediatek.txt  | 45 -------------
 2 files changed, 67 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
new file mode 100644
index 000000000000..32fd535a514a
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
+            freq-table-hz = <0 0>;
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
