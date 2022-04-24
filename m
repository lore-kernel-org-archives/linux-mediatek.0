Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFD5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNN7P13jA3ZkUXSJLvvyCwnrqCoBntdBm8trZaABHio=; b=hTSbxnCQPJPUlA
	i7hZHJmAKErZhdmpfanvp4WW/m3a4pEtilZ1QSkp1EGKI7rcCcEGXunMfClUnX2MzFsG9KPFLeNBl
	wn2vu8oCtQk1FIV26V08+2fTqsVzB5hVBodjcAh7KsuWy4eKu+UPE1sVtW7nyAE8a3OJ0FqJwekJA
	YZYF0bztdGPkpAgB8f9OeG4aK3GuExznx0lG24E9Ve9xLXNffXHYbGIAAcJm2IX0gUNCefZNBz2GR
	5I25qYtcC2z5MwdJuOUvp47JGmzHJePmBRGxTYA2sP1OOjhGQCJJgeFij9ajBAr6Ciry8Vp5v0aOn
	pmmCQg10Z0IBVWC4O7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXwv-006A55-QR; Sun, 24 Apr 2022 08:50:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXwr-006A2o-0c; Sun, 24 Apr 2022 08:50:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id y3so3778219ejo.12;
 Sun, 24 Apr 2022 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9hGLWJes4t+4tQMjv3m5RoPb2lvXCIf1ih3dR2aQ4Qc=;
 b=anaLUvD7MuN2zlKzDM7sN/GC+fVdQNLICiJb/sPF1fU8HlUvcyUizTZbHybv+PT4KK
 tO+dpwAc45opffGIyePpf3pm7WtM2xvqQ2IVVk+9MiS+DM3APDdmhuOjW9HTvfCTK8WR
 INcFWxBxztZHMSBcAysEUfq4kcgduFwx4yWcvSWCjD+AzeaO+7/wjwiO6/4LwZPEdjLO
 9p1QrVYJ4s96hA8dov3IkIqWp5yU7rfXNE0ln8rGC7pr/ObS2GaQp6/uCUmQMq9LrUcw
 ilYAvsQ3LPxy18gTQnGbs7UCK/SaRwzpBvEoSd6RdZdqDM7OGZkDkru6YYUxjUC185on
 vKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9hGLWJes4t+4tQMjv3m5RoPb2lvXCIf1ih3dR2aQ4Qc=;
 b=fnbVAMb7DmH9uIwOVI19QsPv7NVyiyOv4UB+A2lqmBxRt+rvi/58qeuf29yzTBATV/
 vrjzVopKIX72AeN6JLmuJ6RAgbsB//2+FHT5/l0QQ1wJAlL+XoeDeTXBmt2MgFRO5/eT
 XMr4bpQSyuRizKVzEyxsHnepuRrgXU/gjmom8U5pY9Z/udCqrXkLufBNa67bW8ZrqgPL
 LGOd0jRRjS7qXuL5in3/Wawub2NJRKtJuuTVeAARFYdohEl39OjC2paSBgCbPz9Q+gOW
 BURBZDh9hcmd4zZwrYToHd5huxSuf88qkOrOYI9rtc8eToS2mHIG8ACHV3jedahPic6f
 3vnA==
X-Gm-Message-State: AOAM5307uAHk/kYuD4P4u6iKrQ2otadXs6C0CpRE1riDGg4SdIuO+oKn
 a5XrGxyeO6k3NYJBzyeJgOk=
X-Google-Smtp-Source: ABdhPJwBtC5p5qrhVd/u7qXx7lSPfmACDBIYD3HWFPMHT5rAadi8AQ5JK+DpO9egTuehUQK3iKG09g==
X-Received: by 2002:a17:907:7f8f:b0:6f0:e67:e3a7 with SMTP id
 qk15-20020a1709077f8f00b006f00e67e3a7mr11700601ejc.517.1650790226555; 
 Sun, 24 Apr 2022 01:50:26 -0700 (PDT)
Received: from localhost.localdomain ([138.199.7.245])
 by smtp.gmail.com with ESMTPSA id
 gy10-20020a170906f24a00b006e894144707sm2435971ejb.53.2022.04.24.01.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:50:26 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: arm: mediatek: topckgen: Convert to DT
 schema
Date: Sun, 24 Apr 2022 12:46:45 +0400
Message-Id: <20220424084647.76577-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424084647.76577-1-y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_015029_117331_1007E2B7 
X-CRM114-Status: GOOD (  16.05  )
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

Convert topckgen bindings to DT schema format. MT2701, MT7623 and
MT7629 device trees currently have the syscon compatible without
it being mentioned in the old DT bindings file which introduces
dtbs_check errors when converting to DT schema as-is, so
mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
in the last items list with the syscon compatible, and syscon is
added to the mediatek,mt7623-topckgen list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,topckgen.txt        | 35 -----------
 .../bindings/clock/mediatek,topckgen.yaml     | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
deleted file mode 100644
index b82422bb717f..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek topckgen controller
-============================
-
-The Mediatek topckgen controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-topckgen"
-	- "mediatek,mt2712-topckgen", "syscon"
-	- "mediatek,mt6765-topckgen", "syscon"
-	- "mediatek,mt6779-topckgen", "syscon"
-	- "mediatek,mt6797-topckgen"
-	- "mediatek,mt7622-topckgen"
-	- "mediatek,mt7623-topckgen", "mediatek,mt2701-topckgen"
-	- "mediatek,mt7629-topckgen"
-	- "mediatek,mt7986-topckgen", "syscon"
-	- "mediatek,mt8135-topckgen"
-	- "mediatek,mt8167-topckgen", "syscon"
-	- "mediatek,mt8173-topckgen"
-	- "mediatek,mt8183-topckgen", "syscon"
-	- "mediatek,mt8516-topckgen"
-- #clock-cells: Must be 1
-
-The topckgen controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-topckgen: power-controller@10000000 {
-	compatible = "mediatek,mt8173-topckgen";
-	reg = <0 0x10000000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
new file mode 100644
index 000000000000..5b8b37a2e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Top Clock Generator Controller
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description:
+  The Mediatek topckgen controller provides various clocks to the system.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6797-topckgen
+          - mediatek,mt7622-topckgen
+          - mediatek,mt8135-topckgen
+          - mediatek,mt8173-topckgen
+          - mediatek,mt8516-topckgen
+      - items:
+          - const: mediatek,mt7623-topckgen
+          - const: mediatek,mt2701-topckgen
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt2701-topckgen
+              - mediatek,mt2712-topckgen
+              - mediatek,mt6765-topckgen
+              - mediatek,mt6779-topckgen
+              - mediatek,mt7629-topckgen
+              - mediatek,mt7986-topckgen
+              - mediatek,mt8167-topckgen
+              - mediatek,mt8183-topckgen
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    topckgen: clock-controller@10000000 {
+        compatible = "mediatek,mt8173-topckgen";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
