Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDh7JupnCtmMiMustRWZj9Ei0CfRyWfg15grEhsJqwc=; b=sFqKHbgtiqfUip
	ADsrq3kHmt40kMcEaysPzldBziQ/daLDDayR2ZPBXCiZcKAN2w+1V0QnfwdNouvz7KQaNuEHdIOU6
	sR5+o+N3xpuOWn42JpdKODV4p04rWOIMLK9nBtIw1QlLXeA1SLPxOg8SR+ZJe0pBTAe0mFpAKUbaG
	zcNVMN72b4ogjRtwwwlddcBG3roVq8vEIOTUzJifh4ePbWaIhzxuIOngmZg8hk/il1OjGgCoeISuH
	WDQ/iSMADle3uSJn8lPNa9sFNnz/w+e8NW8p5kUACyCEBmpmObvarXeWt4mujE9FCyGCX7hSG+W+h
	bnJ1Y1+fotcOKknWo8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXxL-006AGS-Ch; Sun, 24 Apr 2022 08:50:59 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXx9-006AA2-3z; Sun, 24 Apr 2022 08:50:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id gh6so100126ejb.0;
 Sun, 24 Apr 2022 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaSVAGu2XwyZao07Jymtbz3ykD0KKs6DAdj6tUH3Obk=;
 b=RjB5zd+KGvmtQtc+Xo1nuEZ0TX1aASqC0Ic8+GKMksqXdoF05w8NKSukK9SvU0bDHM
 HXBwIv8iOKcJrAiDJET8kX5a1Fqw86SsDwF2cMhj6u3pfVGWbbBOHe6YxtBtVov0nal2
 ZuqTegYZwQPG7fzG1OP9oaM9RKhzR5xu7DY+TMtgkLGClKa1grpucmDBVRDWVw+k1+Qg
 b4aUVB15cZTvGptA1h8GwOJ6jlWWG/+ISKNI6hpUPVPiEzC0RN4G9iNvOJP+FFteSEMQ
 N3de/O6n/9pUrwqNjnI6hDTnsfkBfcDu6Yzh1hrxlPEcVMW8qyCJDFGuop2lfkFGtlz5
 NZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaSVAGu2XwyZao07Jymtbz3ykD0KKs6DAdj6tUH3Obk=;
 b=tND1kXS70PLcWeqr9qxegvt7kwRztZJ76SP3EsQTflwluEqoXBKepucj3hXJGUgYqM
 ygmC0Vw9PtLrsdYLAlh/w0wDCOBX0o5quNnWMpBZMSJk8isxYJAeEhMf9lFxo71VfmZO
 8C5jeHg+2b00QkP6+5tvqLnem3jI91cKronQ5BRuMQEuk1cbJNInJcqcoEOtLvC+M8XG
 uj0e0RaG2wmkweEhSz4cIT0RPDj0iXnKXMOkHibOQnCAsOpE+eLnoVv+TI3NpWhztFB3
 //FNyqCLbFs9KCshO7hpozmfG96gYkVq5A8QW6J736O8ITDc8CXLqSf/N7W+a4+z3dzU
 lY5Q==
X-Gm-Message-State: AOAM5309NGNmyYgD/nx/EMxbUfOjwgxmENMfV5+K5VsDUTWBs6bzGsQ8
 Okyz3kojAPJokRGS3XkZxEM=
X-Google-Smtp-Source: ABdhPJzzvMcUnsjX5m8kOC3MoubcHlQ48XHwvDcY9nmYjBRcmKIN1r5JLTL2A/SCNRd7aPswcvoc8w==
X-Received: by 2002:a17:906:dc8b:b0:6ef:86e8:777 with SMTP id
 cs11-20020a170906dc8b00b006ef86e80777mr11822490ejc.326.1650790244772; 
 Sun, 24 Apr 2022 01:50:44 -0700 (PDT)
Received: from localhost.localdomain ([138.199.7.245])
 by smtp.gmail.com with ESMTPSA id
 gy10-20020a170906f24a00b006e894144707sm2435971ejb.53.2022.04.24.01.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:50:44 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH v2 3/3] dt-bindings: arm: mediatek: infracfg: Convert to DT
 schema
Date: Sun, 24 Apr 2022 12:46:47 +0400
Message-Id: <20220424084647.76577-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424084647.76577-1-y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_015047_230977_8E3E4629 
X-CRM114-Status: GOOD (  16.01  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Convert infracfg bindings to DT schema format. Not all drivers
currently implement resets, so #reset-cells is made a required
property only for those that do. Using power-controller in the
example node name makes #power-domain-cells required causing
a dt_binding_check error. To solve this, the node is renamed to
syscon@10001000.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
 .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
deleted file mode 100644
index f66bd720571d..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Mediatek infracfg controller
-============================
-
-The Mediatek infracfg controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-infracfg", "syscon"
-	- "mediatek,mt2712-infracfg", "syscon"
-	- "mediatek,mt6765-infracfg", "syscon"
-	- "mediatek,mt6779-infracfg_ao", "syscon"
-	- "mediatek,mt6797-infracfg", "syscon"
-	- "mediatek,mt7622-infracfg", "syscon"
-	- "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
-	- "mediatek,mt7629-infracfg", "syscon"
-	- "mediatek,mt7986-infracfg", "syscon"
-	- "mediatek,mt8135-infracfg", "syscon"
-	- "mediatek,mt8167-infracfg", "syscon"
-	- "mediatek,mt8173-infracfg", "syscon"
-	- "mediatek,mt8183-infracfg", "syscon"
-	- "mediatek,mt8516-infracfg", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The infracfg controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-Also it uses the common reset controller binding from
-Documentation/devicetree/bindings/reset/reset.txt.
-The available reset outputs are defined in
-dt-bindings/reset/mt*-resets.h
-
-Example:
-
-infracfg: power-controller@10001000 {
-	compatible = "mediatek,mt8173-infracfg", "syscon";
-	reg = <0 0x10001000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
new file mode 100644
index 000000000000..8681b785ed6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Infrastructure System Configuration Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The Mediatek infracfg controller provides various clocks and reset outputs
+  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>,
+  and reset values in <dt-bindings/reset/mt*-reset.h> and
+  <dt-bindings/reset/mt*-resets.h>.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-infracfg
+              - mediatek,mt2712-infracfg
+              - mediatek,mt6765-infracfg
+              - mediatek,mt6779-infracfg_ao
+              - mediatek,mt6797-infracfg
+              - mediatek,mt7622-infracfg
+              - mediatek,mt7629-infracfg
+              - mediatek,mt7986-infracfg
+              - mediatek,mt8135-infracfg
+              - mediatek,mt8167-infracfg
+              - mediatek,mt8173-infracfg
+              - mediatek,mt8183-infracfg
+              - mediatek,mt8516-infracfg
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-infracfg
+          - const: mediatek,mt2701-infracfg
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt2701-infracfg
+          - mediatek,mt2712-infracfg
+          - mediatek,mt7622-infracfg
+          - mediatek,mt7986-infracfg
+          - mediatek,mt8135-infracfg
+          - mediatek,mt8173-infracfg
+          - mediatek,mt8183-infracfg
+then:
+  required:
+    - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    infracfg: clock-controller@10001000 {
+        compatible = "mediatek,mt8173-infracfg", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
