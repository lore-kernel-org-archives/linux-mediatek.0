Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939B3CF2568
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjedSfGqOZ6oiuD35CvJlq2+oXWPBYIhR55p8Lmk7Yo=; b=1K/SUgmanYP0KQ
	zMtSkWBRznsboBOOugsgPsJRuE9dKP+DTkDI6HFUeW7tHC+odsAAgUjwFIaCCnGwX/B4GYjv0N0SP
	75t4IE+oxSDQGfNQJ8j0lexyNnlbyBHNYdop/mCYSyg8WFZOaqsS4zZyrm4rMJBiWV+0NqPmkQo10
	NVyk8Ws+r7AjhmYtJlZnB6FUhdVCEv3m4Ivv0tXF8plE/2wziu5tKCFPrPSXTGpXnB7P3X0FxkSxX
	F5tA/qv1n+A+HrlHH7JpndX4cqfVJLHjCM225LCKB0XP9IUrTAQp8/JPB0CTo4SwWboGqpp6WuoHV
	+NRKq7EMK2FxQLOadK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szdJE-00000001M1b-1bng;
	Sat, 12 Oct 2024 14:41:32 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szdGT-00000001LWH-0Wlq;
	Sat, 12 Oct 2024 14:38:43 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id D3C5F6017B;
	Sat, 12 Oct 2024 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728743917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WjedSfGqOZ6oiuD35CvJlq2+oXWPBYIhR55p8Lmk7Yo=;
	b=omm14/GgR1mtmtlZZ3caHMuuXQgoNmEd2xuXZTKfZutsMfsJb6lQZIRJbodey0YjSHxHh0
	LJe2W3EiLJ5yR7FmXK+tyWogGY4Bs2fxDaP7QOxPoSCiSlsbMOAZpyW9ppjuqx8HuTcWbH
	6iza6RTINaKRG+zFMS27jIPyu+dZzyo=
Received: from frank-u24.. (fttx-pool-217.61.155.16.bambit.de [217.61.155.16])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id D5FB840147;
	Sat, 12 Oct 2024 14:38:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v4 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Date: Sat, 12 Oct 2024 16:38:22 +0200
Message-ID: <20241012143826.7690-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012143826.7690-1-linux@fw-web.de>
References: <20241012143826.7690-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 54124e21-5cc7-400c-a9a6-663ac3c6d7a2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_073841_496660_E63F139B 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add binding definitions for mmc on MT7988 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
- drop minitems because of errors
v3:
- fixed minItems on clock-names too
v2:
- fixed minItems to 4
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..a51d3bd08d94 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -21,6 +21,7 @@ properties:
           - mediatek,mt7620-mmc
           - mediatek,mt7622-mmc
           - mediatek,mt7986-mmc
+          - mediatek,mt7988-mmc
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
@@ -263,6 +264,27 @@ allOf:
             - const: bus_clk
             - const: sys_cg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7988-mmc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: Advanced eXtensible Interface
+            - description: Advanced High-performance Bus clock
+        clock-names:
+          items:
+            - const: source
+            - const: hclk
+            - const: axi_cg
+            - const: ahb_cg
+
   - if:
       properties:
         compatible:
-- 
2.43.0


