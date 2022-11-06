Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA02C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 03:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiJd/cbIFHc0t29rG3pUwRbp3B0gNob0JkC9ON4oH/Y=; b=tasV54dM/RwAAwdMvfLJ0piMhf
	PiElkHrdao3PAaqMFoeNdpZxJu7xCs3VI0ux6BNqKsKTS3iZdEzR1c0AvZwRLKIG//YtaemlQxsaD
	aWz4oc1jHmhq0rcmV3rbPeuT+hMWl9yoI+gqBt9rl9Nb01i6OE3cQaBFiuimvJ86IvPDYwBgk6OZy
	uyWWe7JtSEHk06NLoB9rPMhMkO0STHK/j7np+LYIr810vLt54BV+Y4srQJqxO2lMiY0TSvxXqOVjA
	Y0qz6JNEQNKJgwh3Jbt2Oz8jWHnzuxl3qmsXJTR/XggLj5V+RGYYvCGljskHfv+diD5KmEvBSbZgw
	wTNyh68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orWgG-007TK6-BE; Sun, 06 Nov 2022 03:50:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orWgC-007TJP-J0; Sun, 06 Nov 2022 03:50:42 +0000
X-UUID: 22a713c8d6f343d5a2a2fba314d1ef8c-20221105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SiJd/cbIFHc0t29rG3pUwRbp3B0gNob0JkC9ON4oH/Y=;
	b=kBeAHwseCHRvvlYzp5mUSoSUVeX44XSrrjGjy7R9mcs8OYcbHQiZebcqMW2cCTm3aSY0Uy+FlIUbP050AWKTmzSM7PMJ11AWG7tAwzM5hrKlloZX5lT4ypkxkWXK5yZZdDGGRmdus1O7lr9PF6rKhd6ock7pyFJffRnoOSnGVv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f0c049e1-957a-4ee1-ae39-10e4febd7b44,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:62cd327,CLOUDID:5e2eb390-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 22a713c8d6f343d5a2a2fba314d1ef8c-20221105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 141581047; Sat, 05 Nov 2022 20:50:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 6 Nov 2022 11:40:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sun, 6 Nov 2022 11:40:30 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <mengqi.zhang@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND v2 2/2] dt-bindings: mmc: mtk-sd: add Inline Crypto Engine clock
Date: Sun, 6 Nov 2022 11:39:26 +0800
Message-ID: <20221106033924.9854-3-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
References: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_205040_659387_3B8F8426 
X-CRM114-Status: UNSURE (   6.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add optional crypto clock of the Inline Crypto Engine of Mediatek SoCs.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 6f8ecb4788eb..8ed94a12a03b 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -263,6 +263,28 @@ allOf:
             - const: bus_clk
             - const: sys_cg
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8186-mmc
+            - mediatek,mt8188-mmc
+            - mediatek,mt8195-mmc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: crypto clock used for data encrypt/decrypt (optional)
+        clock-names:
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: crypto
+
   - if:
       properties:
         compatible:
-- 
2.25.1


