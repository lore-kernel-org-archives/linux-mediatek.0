Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B97ACFB424
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fH5wQnoWOTiXLp9N8VUPFHb75jHSB86CAirXoIdZS3c=; b=tpc4Fso6kx65oG
	GNa0OFqzkd7awxuZqSwBQ+tfkrcsCQJlblfgDMjLzwdDsv8qR5uEkTn6rjS1JKPe85QdfbQ+ae+8d
	kAL21Ngv/bytr6RbBjcFipgG2fYtkgh5PSFdlGQERB17oYM7Tink2nc6b8U9S/sNSg4Ub26NYrBRp
	bKI3nsMvyEQe7M/WndkHNEDAqbaBmneJksw+LGSyPnWeMasHSmNW7xqIzWMtEyqHSo0VJPbn5wbbI
	z5bl6fd/IlHMXDwA0vx5t52UIRjY5J2cLKwmEzN53V7NA/3mTq9wFTlE+jfpxHyl2g4RiBICFwpZA
	oQlGPPURs04DW9H5peeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxORL-0000000HWEJ-2CTC;
	Sun, 06 Oct 2024 10:24:39 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxOOp-0000000HVue-2MTy;
	Sun, 06 Oct 2024 10:22:05 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id D51F460182;
	Sun,  6 Oct 2024 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728210122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH5wQnoWOTiXLp9N8VUPFHb75jHSB86CAirXoIdZS3c=;
	b=PYQRb81rWjUX8inLx/+Md5kH6n2+4AnsoRvx6J1huta+A8f7HSTODPpnnpq/N7oWacMoDZ
	0T3gbXRdb3TQ9tDD8qz8/kW4TWwhvHRgPsdLwPSPr/5MEvjSUSxH5XxcwD/0CZ2TK8t6XY
	yNMGSjc4mDTtB2N4EOTUvx84TjEUS0I=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2476036030E;
	Sun,  6 Oct 2024 10:22:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Date: Sun,  6 Oct 2024 12:21:48 +0200
Message-ID: <20241006102154.17087-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241006102154.17087-1-linux@fw-web.de>
References: <20241006102154.17087-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0a46719d-9336-4af5-bfd8-2c62d6de095e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_032203_771567_7467BFC2 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add binding definitions for mmc on MT7988 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..db7d1c570aea 100644
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
+          minItems: 3
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


