Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F42C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o634fOaOMAn/imbM9rsABXX2eup9+4z5W8RdsDU/wPE=; b=BpW0OEu31TqB2C/3b8BiDVofFV
	mwk3Bb8LV+n9xGkePg5OlYGu5XnxKirCJ0SlhEP1Vov5EJDbZnEmucHMJddjnpdaoceBlGCf2FOxP
	In56TKiBWHolSdpklztLvlAtiz3bD3HoZ3rnMwGWAjK5iJKKzYg2uEoC5A6+8mUguGSrKrI0mWaQw
	KoftI/4JExgj3vEpEZWZ2J+16Y2NumWjxxJiTNqFSVEz74WhtZnYO3Hjf3uiVFTt5rS9NJ36nJNVq
	KqFhCYxb4sp70kc3cy1s4lSJVMd8/wqx2EBf0Pcaj2f6qQaHNTOaDEBIXkUxkVSme60v/dhVCY7VK
	gFKvx3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ox2-00FibG-NC; Thu, 23 Jun 2022 15:41:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Owq-00FiWL-QT; Thu, 23 Jun 2022 15:40:50 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CEDD166016D1;
	Thu, 23 Jun 2022 16:40:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655998843;
	bh=2jeuLe0zedb6o0kZiLElfapJFeQNLh2yeAOrBr+93uA=;
	h=From:To:Cc:Subject:Date:From;
	b=ievPSFp8BOVHTNdBWk7zQxRgt3pXWx7VJs/89gkU+G9/atXtB8iOppycZdYKnmXT3
	 RX9hJi2qRNLOZcTVK3Lrx0a44cDa1zBiY+W4djjWhG4TjwdgileT54Yz/4c+8wcPdr
	 qHIUgDdc9LpXcoZ0Ku/YpA7BeCu52v4Hydz66jID5ip/BSnxdnbhSBAFsf1bRjQvHJ
	 VbbMGEgcUa/4DCNTxhm7Y38mkaMP5U4wGf93dAFqghvZ3w/XW6U0Kjmn31ZqiZEo77
	 RwfOLxK+4pd7NtMIGmhQ3iS4USpMwto5NslI56resJiso4eo8iwcrUW6gfBUfHIPy+
	 ouO0NH/jPxcFg==
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
Subject: [PATCH v2] dt-bindings: mmc: mtk-sd: Set clocks based on compatible
Date: Thu, 23 Jun 2022 11:40:38 -0400
Message-Id: <20220623154038.771874-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_084049_165293_7E0FED11 
X-CRM114-Status: GOOD (  12.46  )
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
v1: https://lore.kernel.org/all/20220617230114.2438875-1-nfraprado@collabora.com

Changes in v2:
- Kept widest minItems/maxItems outside the if blocks

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 111 +++++++++++++-----
 1 file changed, 81 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 2a2e9fa8c188..5e73218d2e6e 100644
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
@@ -49,27 +46,11 @@ properties:
     description:
       Should contain phandle for the clock feeding the MMC controller.
     minItems: 2
-    items:
-      - description: source clock (required).
-      - description: HCLK which used for host (required).
-      - description: independent source clock gate (required for MT2712).
-      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
-      - description: msdc subsys clock gate (required for MT8192).
-      - description: peripheral bus clock gate (required for MT8192).
-      - description: AXI bus clock gate (required for MT8192).
-      - description: AHB bus clock gate (required for MT8192).
+    maxItems: 7
 
   clock-names:
     minItems: 2
-    items:
-      - const: source
-      - const: hclk
-      - const: source_cg
-      - const: bus_clk
-      - const: sys_cg
-      - const: pclk_cg
-      - const: axi_cg
-      - const: ahb_cg
+    maxItems: 7
 
   interrupts:
     maxItems: 1
@@ -171,15 +152,85 @@ required:
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


