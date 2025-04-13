Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CDC369B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Apr 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bfhYzFpGn1B5RnzNyN51+I0POHsgnSqYypq5zUupqA=; b=rVr80s4CqLDRkF
	y9N7Og1TspxwAL3luhYqw4gb082/t4o3u2swrjxZ/mc7CUyGuCy8U6ESuZzQPmzwl5bO7Xk2weHhI
	42Pqq5yCpU+33GYxGTsyfbCiV8MBxKjH3ARhPU7tUlDMVcBt9cikqPBPnyA+0BOS11hVFwEm+4Nrc
	tKLCp+46x0XerWC1XndFfgBgo//6D+WOAn3fgCL2ls6AVLLI6OlWV/TZEBran+pJRzIo93WkgX3AQ
	EdkQrQ9ceB0dCw5ILTCLipPhp5JoUJq7aPMN+HDdCLFhHY5rjSPObnDhJL1EpVd+HjWnmioKnPcL/
	M/wP/CzbGUK/4rv/mOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tHm-0000000GzU2-1U1P;
	Sun, 13 Apr 2025 09:05:54 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tAP-0000000Gylh-09Wh;
	Sun, 13 Apr 2025 08:58:18 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 7FD6460533;
	Sun, 13 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bfhYzFpGn1B5RnzNyN51+I0POHsgnSqYypq5zUupqA=;
	b=pCzmcJ1BcwSaDmCCw1UdgyY2Tn8jvDcYynkIZRXOv3KEw2hvW1Jvz42jNDdlX/zuTTcI8F
	6LEXt/pxULn95Qzr2TZpIN9xnRsb6wYmOY/6Bcu1H14wO/bOSM4B4fT53vF5PTpPmWWZOC
	T87WS5vWaPzwJRijvKHymcZtqUMkaWc=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 7FE4E40089;
	Sun, 13 Apr 2025 08:58:13 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988 topmisc power controller
Date: Sun, 13 Apr 2025 10:58:03 +0200
Message-ID: <20250413085806.8544-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413085806.8544-1-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9abf532c-77b9-424f-a697-dc702d13d513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_015817_229940_C311A0E5 
X-CRM114-Status: UNSURE (   7.42  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, MandyJH Liu <mandyjh.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
Add binding for it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../power/mediatek,power-controller.yaml      | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 591a080ca3ff..60d2fc7963e5 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -22,17 +22,27 @@ properties:
     pattern: '^power-controller(@[0-9a-f]+)?$'
 
   compatible:
-    enum:
-      - mediatek,mt6735-power-controller
-      - mediatek,mt6795-power-controller
-      - mediatek,mt8167-power-controller
-      - mediatek,mt8173-power-controller
-      - mediatek,mt8183-power-controller
-      - mediatek,mt8186-power-controller
-      - mediatek,mt8188-power-controller
-      - mediatek,mt8192-power-controller
-      - mediatek,mt8195-power-controller
-      - mediatek,mt8365-power-controller
+    oneOf:
+      - items:
+        - enum:
+          - mediatek,mt6735-power-controller
+          - mediatek,mt6795-power-controller
+          - mediatek,mt8167-power-controller
+          - mediatek,mt8173-power-controller
+          - mediatek,mt8183-power-controller
+          - mediatek,mt8186-power-controller
+          - mediatek,mt8188-power-controller
+          - mediatek,mt8192-power-controller
+          - mediatek,mt8195-power-controller
+          - mediatek,mt8365-power-controller
+      - items:
+        - enum:
+          - mediatek,mt7988-topmisc
+        - const: syscon
+        - const: mediatek,mt7988-power-controller
+
+  reg:
+    maxItems: 1
 
   '#power-domain-cells':
     const: 1
@@ -43,6 +53,9 @@ properties:
   '#size-cells':
     const: 0
 
+  '#clock-cells':
+    const: 1
+
 patternProperties:
   "^power-domain@[0-9a-f]+$":
     $ref: "#/$defs/power-domain-node"
-- 
2.43.0


