Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B11CFB424
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWeFgd5hlsv2/xyaiRcsDg8tz/JqEjHhkgHy+35HE3s=; b=hatHotkAJcHTQZ
	c/Gu3TgB4TOuhXJVpqLR2i98MFDX2/TufKxpEI/SKuqiWsFbbBx+bBILQP/4oGUqhebgvlQpjY9xk
	xwnoKw2CA2CzOiQGg5NOAEPILxHfKWoYjkvErvYSVyR0kH5q6y2YMlsBCj0FTg2f0rfZImhL5IEW9
	mk4yCsO5/fQ1mt50JijJIfX0+ltUMnSvvxSVfVTdIzi82sdQcST90yf3FAdiQHRMUFNZ/qqNlpRAa
	uvCR3YdDpt3qik1E13D6UzF5cdXlaJ3EeQuBgb8Gys0QAb0lVVnBOcd+SlA0QJdW/8Jm0dFrVAOYL
	MuU4xu3y7DHfDS4xqpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTKA-00000000EZt-30ee;
	Sun, 06 Oct 2024 15:37:34 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTHc-00000000E9o-2gJc;
	Sun, 06 Oct 2024 15:34:58 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 8F6955FB2B;
	Sun,  6 Oct 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728228894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWeFgd5hlsv2/xyaiRcsDg8tz/JqEjHhkgHy+35HE3s=;
	b=PFNfzz9gQNsGqn8hMC00Sq3iLT+1E2H89S1dQFOZjsQcDqKlgfob+vsaWQzAcYwHLDxJp2
	DfrKU2koOH2HQHoSuOUmI3QPg8BCq8a8HL7oE8nyshniKdlq0GuV3sr+LWNSY26oBQkLX0
	L6K9IcJjXO9Rltzwbcl5d9AOAEUCeqM=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id C844C1006B2;
	Sun,  6 Oct 2024 15:34:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Date: Sun,  6 Oct 2024 17:34:45 +0200
Message-ID: <20241006153447.41377-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241006153447.41377-1-linux@fw-web.de>
References: <20241006153447.41377-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 41a1ca86-a817-4286-a596-c271918febff
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_083456_841844_BC9880E9 
X-CRM114-Status: UNSURE (   7.92  )
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
v2:
- fixed minItems to 4
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..7380f72ea189 100644
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
@@ -263,6 +264,29 @@ allOf:
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
+          minItems: 4
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: Advanced eXtensible Interface
+            - description: Advanced High-performance Bus clock
+        clock-names:
+          minItems: 3
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


