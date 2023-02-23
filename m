Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB140C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ywC0lpWIV9O+8/h0oC75OVWnYnh4CTXbd+m738N5ds=; b=g5hNxoxCRmsL1Iy3OzOQ+qXVTY
	oK+DP3I6G+yiIfAjoFuEvUwsZs72zUWGuFQFE+RSQgXL9W/2Od1ZdPAOZzjui5XpyKPkdKQXUFUZ5
	FnZt4AuH1+VY9DLPcXKeBwtK+2TJRMaOE9WgDKp5Bz46L/0ec42wNcUF/CzPpWE+OAitQXhcVn1TU
	8fCUtrkGV0OGJ+E97+sHNd3tJQa5b0EK9JHkawcKVG89e4BNnC9ff34ItX0sZn4WBna0wz8B0d4bK
	mOcng0ckgqdGLMh0FDaWqNJcTQu76WHXyBc7kaTnVWEW+rJ1BlDd/sfONHEaNn7tKnfTl+6vQGehL
	SIcXjiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBld-00GTm0-Qs; Thu, 23 Feb 2023 13:36:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkQ-00GSxi-Ba; Thu, 23 Feb 2023 13:35:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F3126602209;
	Thu, 23 Feb 2023 13:34:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159296;
	bh=JLv1ypqmRwA4sZAh0v4tJj4CqhA/6gB3AMkCmc8wtN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2rgnFPD+fTyfHhqgstB7LTl1kGPo44M2phl54QzydFcD2EUaaGWwsajUDcCzkbWs
	 FKvY20+PnWDFfQ0Wzfb5Zy5jEUvSg8jRWUEArHqkY5kwnSZMq+fxlXute/9c2DBFVd
	 BXUrFqYwiPgMWRMEPG5wq8UY3QBdb5xbBV5D73aPEmbpEbzxRfksb5Dmw906xQAVq2
	 9tyLADgKSJ/ON1K8uLTlWf1PBHBUsSd+GsCW1nQ8GELVlLIw0q6CrvQA70K2sNzJdY
	 fHivw5MkRRtvH/lL3lu43e1ftJn86jz+p1P6ZZdwQLqx2M4s1IXRmGXNxl0i7Jc1aT
	 /ejkmKq5/z3vw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 03/11] dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
Date: Thu, 23 Feb 2023 14:34:32 +0100
Message-Id: <20230223133440.80941-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053458_579689_A43D6FDA 
X-CRM114-Status: UNSURE (   9.07  )
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

MediaTek MT8192 (and similar) needs five power domains for the
Mali GPU and no sram-supply: change the binding to allow so.

Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index ac174c17e25f..65fe139ceb83 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -63,7 +63,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   power-domain-names: true
 
@@ -152,6 +152,7 @@ allOf:
             contains:
               enum:
                 - mediatek,mt8183-mali
+                - mediatek,mt8192-mali
     then:
       properties:
         power-domains:
@@ -179,6 +180,25 @@ allOf:
     else:
       properties:
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 5
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2


