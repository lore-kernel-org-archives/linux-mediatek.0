Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ADDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bh1oN5m+pDvZ8mZy2F0ZQXoFdL3rCFtmcvQ75kUjHKk=; b=cgbweBwLPT2IGojM/m9gNfxtAz
	+/HYkfI1bh1XuIZKUD+LVOwbicK7xxjiPAv9QhwMIx34EzSyDQ/t9aQj3w8F1KqwnJWZHCrZft0mm
	5bY6ufog1RBKFTu0O4bihIYxShtAs6bL6zQ6SkfGtgbsumc2/TfrWV1zia0XHKWhYlcx5x/5UcaJ2
	YO8ZKvUEdG46tOW46fsTgtTO6SzWE6np0oQQEDTdosqrGWkFv12139jGSZQ/a0+tBOuN3E103rB2H
	oICTMxmnehtLBnMuZeWLvIomEoq8VuVFaZ6HMSCVelcmYoCDTromUzFjkx/g07L6Wr3Glu1ESvB9W
	ip/MPreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Ky5-009Uua-5k; Fri, 17 Jun 2022 23:01:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Kxu-009Urh-2i; Fri, 17 Jun 2022 23:01:23 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 11B5466015AF;
	Sat, 18 Jun 2022 00:01:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655506880;
	bh=HzB24ka+vz57Ogmycw3WCgaPbXa1Hv253R1g2u8xX1A=;
	h=From:To:Cc:Subject:Date:From;
	b=j4XqjOfLpSKcL2Mztni26hqC6h7eaKwGlfecl0neuEsIkbvgPDTnJQApY7yejAbN7
	 fVgdCD+MG3PMfbMWAnO1BLpjnrPP4/ZBzp0UGQ7kxqsNLQWORnZFbNhRO7rjvoongC
	 AYY4JcTAg08Dlyie1XWifBa4oGFgyncLFpGBDkTNpqU/gooRGejCDUgly1CLIlZIO8
	 o4QWlDwHbQtqzF7vr02zzdQsKPUIxK7Aqisn3Ndc73EujqQsviUBfXhFsYuA9ckXN9
	 TA7rtQZha2CWCN2naZxjTjo02mvndfrRlpLY41v736o6bABvf5yL2ico6Qzk160LRN
	 0ecqKf6aDgE4g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: mtk-sd: Set clocks based on compatible
Date: Fri, 17 Jun 2022 19:01:14 -0400
Message-Id: <20220617230114.2438875-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_160122_425697_E50CEFCD 
X-CRM114-Status: GOOD (  11.81  )
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

The binding was describing a single clock list for all platforms, but
that's not really suitable: mt2712 requires an extra 'bus_clk' on some
of its controllers, while mt8192 requires four different extra clocks.
The rest of the platforms can share the same 3 clocks, with the third
being optional as it's not present on all platforms.

Move the clock definitions inside if blocks that match on the
compatibles. In practice this gets rid of dtbs_check warnings on mt8192,
since the 'bus_clk' clock from mt2712 is no longer expected on this
platform.

Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 115 ++++++++++++------
 1 file changed, 81 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 2a2e9fa8c188..ba48ff041299 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Chaotian Jing <chaotian.jing@mediatek.com>
   - Wenbin Mei <wenbin.mei@mediatek.com>
 
-allOf:
-  - $ref: mmc-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -48,28 +45,8 @@ properties:
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
-    minItems: 2
-    items:
-      - description: source clock (required).
-      - description: HCLK which used for host (required).
-      - description: independent source clock gate (required for MT2712).
-      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
-      - description: msdc subsys clock gate (required for MT8192).
-      - description: peripheral bus clock gate (required for MT8192).
-      - description: AXI bus clock gate (required for MT8192).
-      - description: AHB bus clock gate (required for MT8192).
-
-  clock-names:
-    minItems: 2
-    items:
-      - const: source
-      - const: hclk
-      - const: source_cg
-      - const: bus_clk
-      - const: sys_cg
-      - const: pclk_cg
-      - const: axi_cg
-      - const: ahb_cg
+
+  clock-names: true
 
   interrupts:
     maxItems: 1
@@ -171,15 +148,85 @@ required:
   - vmmc-supply
   - vqmmc-supply
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: mediatek,mt8183-mmc
-then:
-  properties:
-    reg:
-      minItems: 2
+allOf:
+  - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mmc
+    then:
+      properties:
+        reg:
+          minItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mmc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: msdc subsys clock gate
+            - description: peripheral bus clock gate
+            - description: AXI bus clock gate
+            - description: AHB bus clock gate
+        clock-names:
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: sys_cg
+            - const: pclk_cg
+            - const: axi_cg
+            - const: ahb_cg
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt2712-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: bus clock used for internal register access (required for MSDC0/3).
+        clock-names:
+          minItems: 3
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: bus_clk
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt2712-mmc
+                - mediatek,mt8192-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+        clock-names:
+          minItems: 2
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
 
 unevaluatedProperties: false
 
-- 
2.36.1


