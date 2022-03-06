Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BACAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u10FjMmRu+sCSCJX4RToYhxPnyNVig1NrLfIJRYs2So=; b=ejmg8QmSaboHxZ
	dZj0uLgkyJnUJSAgy8lgfyldVJ7HL7+3ESgIh0cXLwOepNex5sp7YpKvS5is84rUKGlgQZ7wILZyr
	hg85/O+ZNcPUM0sK58gfBJbNyyaFzi8ybc4FDMueAK5wYNGHk9uFv+jrvODcj82A+NzHOdNgTVJJX
	6e9H94md45/ivKDc6wk5ttXOWNBNFAaYdo8wEpPhjLrj9t9iX6FYlKM/6fSI6yPrNEusVC2g69Ql4
	4poz01NyjPb6nU1i/3Zti8vHrVDGG2mjCgDCSCCOjkCptEgbZAcbqK2ZFezoQfiVIRxp8YUpZWiTt
	9Zmw67bjNdZjtxpalwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQosj-00EXkZ-Bm; Sun, 06 Mar 2022 11:16:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQooT-00EVMA-4p
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:12:36 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EAC4F3F61E
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565139;
 bh=ooKaXowXEnZxahywb1wfZAg4AWHbsKObfN/Ew6XXXRw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=rzx8X4DAZM+VV+Zn12affmW6VycUjZLv7gubyAXm4psg7CM3lJaaB1/VABxZsUA1C
 dhcFj2rlNoLjU7xfGEfkspnYPkGG1/3m2LzUQ+6+2OW6ESZ8gJmKM7m0mzB/lsCS3R
 GqbyHwVWufGAzNMoPl4eppANcundQiSSkAy4hji/q/eqzDSowiZc41G8yrRgixizRd
 RYwJP7+f++G4N74ZFGchhvViWpA7Am0PUTErTykQRDyndcpQpL0PLwYE5XjH1+bSdj
 OVWsXRQ1IwUrtFu5zt1ipIFamXL5LTeltR9exuWywfR+3qqgBDhDRX/5JwidTN/ljS
 4nRNYDZlypzcg==
Received: by mail-ed1-f72.google.com with SMTP id
 y26-20020a50ce1a000000b00415e9b35c81so4493591edi.9
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooKaXowXEnZxahywb1wfZAg4AWHbsKObfN/Ew6XXXRw=;
 b=6fgpKztvqB06H8O2JSOGAGPtdpF25tsRtu4exai2dBPCVBdctLMOLCOK1WZ3I5mtn1
 hSBtnK17lAw7n6dKc8lLphbW7NajtQaLU7tHHuEQQI5OgXikSr1hW55yNQ2C+cAXcNgS
 olIKo4yWSAlOtBAdGYrZZSMI1dUMsrP57mj7d+Z+5jPDzyCJqK6QGZi5lCfqMD8rnqjb
 9h7GaBKLp69+qPdG9BhbeX/0Jf/FGjswwWf00wC2gTyNUILlcbG5GymT59UB+WeV2imC
 SslDhbDr47vXaHNRr6Eq05jWBBUTvhtCsD6JkObHGog4V8Jt5ilqZvwD8yOkLcj++2Hu
 CP5A==
X-Gm-Message-State: AOAM533lZ2I85u8zmO8D6seIjjCkdui6lPAdOgdAhPv4uTzys1EjfKP8
 GITK35j80EqAtTVEcZFpyuiffEPkEWl6eYXFHI+9vetwpyJcXyJzWC6NUPq2of+jbDthrB2dElT
 XrgZgO0OI4ZeDnxLLkcRkRo/pQCijMk7kudJauAU8dWQCnum4jA==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr5452635ejj.767.1646565103212; 
 Sun, 06 Mar 2022 03:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ1ed4qzxBbYzHrlnD8XX/sT7klp5jhLS9V8sQLJhk1P830VQKhrTEknvYCZVGqRqW8eDEQg==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr5452623ejj.767.1646565102968; 
 Sun, 06 Mar 2022 03:11:42 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:42 -0800 (PST)
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
Subject: [PATCH v3 08/12] dt-bindings: ufs: snps,
 tc-dwc-g210: convert to dtschema
Date: Sun,  6 Mar 2022 12:11:21 +0100
Message-Id: <20220306111125.116455-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031233_356942_89213250 
X-CRM114-Status: GOOD (  14.72  )
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

Convert the Synopsys Universal Flash Storage (UFS) Controller to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/ufs/snps,tc-dwc-g210.yaml        | 51 +++++++++++++++++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       | 26 ----------
 2 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt

diff --git a/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml b/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
new file mode 100644
index 000000000000..671a70d95138
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/snps,tc-dwc-g210.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Li Wei <liwei213@huawei.com>
+
+# Select only our matches, not all jedec,ufs
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - snps,dwc-ufshcd-1.40a
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
+          - snps,g210-tc-6.00-20bit
+          - snps,g210-tc-6.00-40bit
+      - const: snps,dwc-ufshcd-1.40a
+      - const: jedec,ufs-2.0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ufs@d0000000 {
+        compatible = "snps,g210-tc-6.00-40bit",
+                     "snps,dwc-ufshcd-1.40a",
+                     "jedec,ufs-2.0";
+        reg = <0xd0000000 0x10000>;
+        interrupts = <24>;
+    };
diff --git a/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt b/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
deleted file mode 100644
index 71c0777960e9..000000000000
--- a/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Universal Flash Storage (UFS) DesignWare Host Controller
-
-DWC_UFS nodes are defined to describe on-chip UFS host controllers and MPHY.
-Each UFS controller instance should have its own node.
-
-Required properties:
-- compatible	: compatible list must contain the PHY type & version:
-			"snps,g210-tc-6.00-20bit"
-			"snps,g210-tc-6.00-40bit"
-		  complemented with the Controller IP version:
-			"snps,dwc-ufshcd-1.40a"
-		  complemented with the JEDEC version:
-			"jedec,ufs-1.1"
-			"jedec,ufs-2.0"
-
-- reg		: <registers mapping>
-- interrupts	: <interrupt mapping for UFS host controller IRQ>
-
-Example for a setup using a 1.40a DWC Controller with a 6.00 G210 40-bit TC:
-	dwc-ufs@d0000000 {
-		compatible = "snps,g210-tc-6.00-40bit",
-			     "snps,dwc-ufshcd-1.40a",
-			     "jedec,ufs-2.0";
-		reg = < 0xd0000000 0x10000 >;
-		interrupts = < 24 >;
-	};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
