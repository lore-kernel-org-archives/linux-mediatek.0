Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3758C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:17:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5BE61057
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5BE61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SaBz02/M8na9SdlbDCdOfvtAEXK8GGWl6W3QedgAHyY=; b=bdhkjJhnO46fEZVydzgVLSs/4g
	kZ3Icr0l6klvakKoFSpy9KDQTelsrd/twdtud8y3bNQxbKJWLFg+R+nvsmK7J8MfAbLmljwhTwxE4
	2JwvTCTfR9XUQdjMEjBw9e5oVQ7upgWoNauLLilg60qJ8qmVNGDtmmxwQqWWu8Ygsio7oGT/K0ikz
	pbDOBTom3NoxEt7nHt74dE+VDCIN2Aicwtw3vMeSfdm//INLmMCCEFmpCR0RqKNant9MqwBi3n6s9
	n24c3UQuaBaRheCkuoZuMHkzKfFC7+WHP6YwoMD/k8xhnA3CvOi2MkKKwagkcO+fyDzfVIZz6l/sp
	LVD/u7Iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgg9-000OqG-O7; Thu, 20 May 2021 11:17:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgfr-000OkH-Ed
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yx+H6sGvKvZ1+h7/FHdbh/ExAGjj5lQ+jgoR4DDOZ70=; b=N1MXmNRZ348CqjUsbEyk9DBoHU
 uCuaejV2yF3XyQyTQaHuwrzaBZc8GRL1Tm1JjKp5Pix3+qAJCoojKWJncscJy8dTTmb8y1M9uur8p
 /YIpqATYECuxlOS6/TirR+V/iRhhQmtnMv37fauu5aMB5Qc0wlmf9QdEWwrcukkWykNd9rmZBbjhs
 70m5RCPQEjuKZ262gITOoz6bCh6AvMRqvvvcMPm34e0C8EPqhusE1RfU5UF+x8Ej9okgqoFrhYftA
 PuIRXfbYFy15s7F7oIcZuGgIxIGlCn9GP6N5bECB/4VoKkTYp+uUCUgdsTUKQh6PzUFp6rsQz9trK
 K5SxVJgQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgfn-00GEQE-Lx
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:17:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so4976465wmf.1
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yx+H6sGvKvZ1+h7/FHdbh/ExAGjj5lQ+jgoR4DDOZ70=;
 b=H8QxOOSaBCTdMFu68ay2mgGLL1LN0CBNKCF8GtN/bctB2bS9jC5Y5CEpGVTPCropIE
 K6NQgmolkq35WNpQiS1w+vAuky69CLhY1/L0rQqVYI4jgfK5M77g35On91XRrcQ8FAix
 Bpp2QASmxtI5NZ9Xwss0C9pLRIE40OXwHovZcRcYfhlijfoNu5agaV/cLmttOE89bl/r
 dItwI2J7LYKBwn1OpG0AvsDogWsS4jjq+76V6y0VcZ+5ZIRnAfOke5FFXcdJWsqH2Db9
 v31JDgmD55hfZW3pJLLj8IZzQW8xfN/RhISkSsu95HnxzudVWO04/ADStXPXHQLlt4Do
 qwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yx+H6sGvKvZ1+h7/FHdbh/ExAGjj5lQ+jgoR4DDOZ70=;
 b=LJqpy+GuuDQHyEbVWG74FXZskr8rmRlTsh497VoSDO6brkQBvMvhDEUNk7EcYoMUl0
 rkX963JABdDv0wW8eHTZMjhgF6dgwg8HnHuzllv8htaRx6F6eVL1Qe02ciUH8KhYrsM6
 SHr3QmpfFVWzOv/iwvW/OmqizZzRnYZMvr8156xABt7MDw4qLabZn3A90mhOSOmKp1wR
 NULVNgvJTg1TjoFFHdXqFf/hGEgUsgCVGNLDPVuCcvIEoA6ejiVM/Wk4hLHrgEa9vzs5
 p/YFTgcMSjztA6IvYZ1IumSR6mKwmo4A/qYghccut2Kh3W0p3wAvco5TL0jEpvcbURaG
 M67g==
X-Gm-Message-State: AOAM5317aBXtNLuLLHvZ+iPf0JrWaJebX3vM9B9WThK+4uQcCG1w3wjn
 KPItvIlnkflhxnVVSgF5AkfMrg==
X-Google-Smtp-Source: ABdhPJyl/rBzjv6gpMQ32Rtdhwde6u6dVWQkPtQQ3xivTTNnE168I4ovRNuIuNkAaXjhralPvS5OPg==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr2397972wmq.159.1621509421823; 
 Thu, 20 May 2021 04:17:01 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a19sm2310757wmb.40.2021.05.20.04.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:17:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: rng: mediatek: convert to yaml schema
Date: Thu, 20 May 2021 13:16:55 +0200
Message-Id: <20210520111656.66017-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_041703_824371_4DFA68E2 
X-CRM114-Status: GOOD (  15.03  )
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

Convert the RNG binding for MediaTek to use YAML schema.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: Write the compatibles in a more compact way

 .../devicetree/bindings/rng/mtk-rng.txt       | 22 --------
 .../devicetree/bindings/rng/mtk-rng.yaml      | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
deleted file mode 100644
index dfdcb5cd2ea8..000000000000
--- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device-Tree bindings for Mediatek random number generator
-found in MediaTek SoC family
-
-Required properties:
-- compatible	    : Should be
-			"mediatek,mt7622-rng", 	"mediatek,mt7623-rng" : for MT7622
-			"mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
-			"mediatek,mt7623-rng" : for MT7623
-			"mediatek,mt8516-rng", "mediatek,mt7623-rng" : for MT8516
-- clocks	    : list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : Should contain "rng" entries;
-- reg 		    : Specifies base physical address and size of the registers
-
-Example:
-
-rng: rng@1020f000 {
-	compatible = "mediatek,mt7623-rng";
-	reg = <0 0x1020f000 0 0x1000>;
-	clocks = <&infracfg CLK_INFRA_TRNG>;
-	clock-names = "rng";
-};
diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
new file mode 100644
index 000000000000..4be5fc3c1409
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/mtk-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Random number generator
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  $nodename:
+    pattern: "^rng@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt7623-rng
+      - items:
+          - enum:
+              - mediatek,mt7622-rng
+              - mediatek,mt7629-rng
+              - mediatek,mt8516-rng
+          - const: mediatek,mt7623-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rng
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    rng: rng@1020f000 {
+            compatible = "mediatek,mt7623-rng";
+            reg = <0x1020f000 0x1000>;
+            clocks = <&infracfg CLK_INFRA_TRNG>;
+            clock-names = "rng";
+    };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
