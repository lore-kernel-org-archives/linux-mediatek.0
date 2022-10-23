Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0ECC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VritE+ybpU07rveA4R3SYkkmaTESv58T7iG6/ydmr8=; b=JgJ9hWf9ZTjMkl
	FC+UOrZJBB95muhk3Yen0ccT7Z7AMV/YpPJNH4d4HGWPMX9RMJlJ+TLfVKC14az+/FEigss5BIW2h
	gkCISQGsNP56Rvbx0VXzySOJQ3LE/IRlYqfXJO6AYsWWuePz0IEyltgChj+Imw3fXDl25mM1ZvP39
	nHdB9xe5FgSS8Aw7jRwwWpDCGReqgubEksbQ7c2EgDgZXbdI0ieLDXyE5uPUY6p0TWLwbSphoAF1l
	Lor5Zp9dRUvYc2vH0FkyNy1ExppVTBpOmnHRHY9ftneDFy7avzA2cnzI/oFcBoNqdlmqLqYvamVuN
	Kh0Fsxy1ivVj99IDVj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX44-00EmJn-1q; Sun, 23 Oct 2022 09:14:40 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX2i-00Elbj-LZ; Sun, 23 Oct 2022 09:13:19 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id A3A2F60553;
	Sun, 23 Oct 2022 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666516390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VritE+ybpU07rveA4R3SYkkmaTESv58T7iG6/ydmr8=;
	b=SNSTWeYb/eV/JIYBlg57eIomzZIwVjBbkbeWKybl4nyzT6YzkpbWdM+s3ztyJGU7j4+oSQ
	Qfd6J4+4ZMVqDkUdloaGc/C/MMCMUQ2LVEWUTCXgY+pTkhssjLXeU38gpD2S9ouLxtRm4R
	PLVs5K7M55g36aSahPJmr9S9vm1/z/w=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D267310009F;
	Sun, 23 Oct 2022 09:13:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/7] dt-bindings: mmc: mtk-sd: Set clocks based on compatible
Date: Sun, 23 Oct 2022 11:12:42 +0200
Message-Id: <20221023091247.70586-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023091247.70586-1-linux@fw-web.de>
References: <20221023091247.70586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 26f9b6cb-7d41-488e-9bd4-dd6e7e6caf6b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_021317_041254_91EEFE33 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

The binding was describing a single clock list for all platforms, but
that's not really suitable:

Most platforms using at least 2 clocks (source, hclk), some of them
a third "source_cg". Mt2712 requires an extra 'bus_clk' on some of
its controllers, while mt8192 requires 8 clocks.

Move the clock definitions inside if blocks that match on the
compatibles.

I used Patch from Nícolas F. R. A. Prado and modified it to not using
"not" statement.

Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

---
v2:
- add this patch
v3:
- add blank lines and change "not" to matchlist
- reorder entries - make generic first then order alphanumeric
- rewrite commit description
- drop soc-specific mt8183 - constraints were also set for it above
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 113 +++++++++++++-----
 1 file changed, 83 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 3cbf0208f1b4..31bb6dc329d2 100644
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
     description:
@@ -191,15 +172,87 @@ required:
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
+          enum:
+            - mediatek,mt2701-mmc
+            - mediatek,mt6779-mmc
+            - mediatek,mt6795-mmc
+            - mediatek,mt7620-mmc
+            - mediatek,mt7622-mmc
+            - mediatek,mt7623-mmc
+            - mediatek,mt8135-mmc
+            - mediatek,mt8173-mmc
+            - mediatek,mt8183-mmc
+            - mediatek,mt8186-mmc
+            - mediatek,mt8188-mmc
+            - mediatek,mt8195-mmc
+            - mediatek,mt8516-mmc
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
+
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
+
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
 
 unevaluatedProperties: false
 
-- 
2.34.1


