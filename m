Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96AEC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ywC0lpWIV9O+8/h0oC75OVWnYnh4CTXbd+m738N5ds=; b=qbmTNLvJuno6PmOCyQhGV2qGFt
	MJGvPemGMRNjo2BOfYW4WQTgpFwMpvlFCwetwiyxxqTSAgXQNzQ2x6GM/ORkSmx1FkcE415Ze+lFq
	MySrSR9oU5/wJqRpNi8CNFmb+guOkG1ppK3/IVmJqoOk/FH15VxWxSmRINFbqG62hxGFfx06Soh8Z
	xM44bp7GP89wB/jlBWTRo6hNQF/vwB/V+7c9C5FEmrtbKTYmGLoYX8QFMyvPMqWUhQkH2vJTz+6pB
	OOpDfiBhu0DRyDwTjp1zWGf6JXRj+uaEnFBdMJk6AFXNNsyoTyoG0X6dvJEhXcWn5OkrYY29x1PZ1
	iNtjVr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUii-008iI8-Td; Tue, 21 Feb 2023 15:38:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiC-008hxZ-LO; Tue, 21 Feb 2023 15:37:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B411566021D0;
	Tue, 21 Feb 2023 15:37:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993867;
	bh=JLv1ypqmRwA4sZAh0v4tJj4CqhA/6gB3AMkCmc8wtN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRERP9lHxptyHbkUIZZpTJEqOpnNczybSXcyIV2hS8lxN1Xf3IbrOuPaPNYKST+ZN
	 Fz5zFhdeoF6ZzKr8f0ZsVa5aoa63K7JcIZCAfSjclssml45FkFuiK/miXMO46sUTwv
	 rZLajVOGcKKAZf7CR2I86/6OTqe74T2xWUg2wjULhETlbTdPH8WvNX97XqxLUjC7Jm
	 Vpxx7rw5rxf6QFFGSrlVCQ6qP7PfNW6Qc/UY8qGR6hU+cdPyRUMtxqqWcWx5llNodm
	 gKq02ZgAYkvQEL4I6wFUv6qC2CmQrzstTzSWYBRIGibzsZlJh1HORevo5JzmS4Lo4A
	 iNwNkr5vSAYtg==
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
Subject: [PATCH v2 03/10] dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
Date: Tue, 21 Feb 2023 16:37:33 +0100
Message-Id: <20230221153740.1620529-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073748_848221_A228F1BD 
X-CRM114-Status: UNSURE (   9.48  )
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


