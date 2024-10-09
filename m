Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03573CEE336
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoeJuySVhg+mmM+pa9MiXw+rnOgF1Rwkix0HnxJwfrk=; b=PTDuTqOKs0fOci
	5tz3N9PfOCXoDIAayeE6YBekMfQQxIzj78u4BOCWlq1ViRsdQxvpEqjOOkReVVF7u8+jUmuQwOgKl
	aUveNRiRFgLxf2SOwX7NyTaJjlUscXG0mNcNJm/SvnR6LukMSD5YPBKEJB+yVH1u2A3UZbcrlqv7X
	ibf38RRv/z5WWaMTXKT0HIZEUrgHhJlxyYOsd7U64970JrhuNGycVUJgZY1TCR7E2nA6hg231b6Ma
	/7YU5CSzdAWMLk3C6p2WGI2gmGYIsUZwEBxbuJyTrQu4Sh/S7zMVVrNd8KWy0X0OZ8GGBIaQwDEVe
	sHOVYFhxovMmzDto/s0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaiz-0000000AES3-00Jh;
	Wed, 09 Oct 2024 17:43:49 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZyc-0000000A5DW-0OQo;
	Wed, 09 Oct 2024 16:55:55 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 5B6E26166E;
	Wed,  9 Oct 2024 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoeJuySVhg+mmM+pa9MiXw+rnOgF1Rwkix0HnxJwfrk=;
	b=Y1ff18U0ZhCacPpVdUmC/yzs9sXTwitx/8LRYJJicOcSWYHbWM/WiRA6WTG24Iw4k+Vzij
	anu2mCSN5u0N2T3YgK+shwrRwasa6ooVZ9aEWqeDw+RFsgEg5oYEAfFWzIo0tIPy9YhU5b
	pIwVhAQVEzPwTk01liyhl8IPh4LEmyQ=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 750E51006CA;
	Wed,  9 Oct 2024 16:55:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Date: Wed,  9 Oct 2024 18:55:41 +0200
Message-ID: <20241009165547.5959-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009165547.5959-1-linux@fw-web.de>
References: <20241009165547.5959-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 87771506-25b3-4f4d-8bef-9c43895fea05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_095554_387417_2872D012 
X-CRM114-Status: UNSURE (   8.58  )
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
v3:
- fixed minItems on clock-names too
v2:
- fixed minItems to 4
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..bec0577b7508 100644
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
+          minItems: 4
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


