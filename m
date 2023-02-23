Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3715CC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PFdmTvEkXL5Fq1d/s1QVn/IJt1nY9cmUPxoQNK3fHQ=; b=RxMoTnt472cCV47pOqX1yFsvXD
	SNZnjXcPJYAfor/5fbSJmy6JiM51ASEJt11ThUL1IWkT7EAOiKEfo67ep7ZsYK3v7/E36s982Zns5
	jzK58zjk+nry3rLcLUSCabsXmrID8jHV9gq7MiZEVEayYc2FgY1wu0MYEAVEkXoffmX7KfZT+fB8E
	JMcuUjDG1yt8FDH9oJcAc+AbUFEUSryfW8Daw0omdDLBKj+m3eZlS0mVnGC3W6CeMoJIueUz7Pm5v
	CUjhNEOOSxGEaiM927LMnHEKO7aL84QxfCRFprNbD0LKGvjbDViMtQAT5euqcD83xtL0xSQM0Mm80
	s4+mZF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBmX-00GUL8-7u; Thu, 23 Feb 2023 13:37:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkS-00GSzZ-0f; Thu, 23 Feb 2023 13:35:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 242906602206;
	Thu, 23 Feb 2023 13:34:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159298;
	bh=8laopmxtR2OlouaKlRNp419Yf1O5zDNFgjtz+3x6w6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ELHcbqVZlsGf9F5eWvkeUdUS6r54S6c20urNg8COWvLiOWeQLN+XvJdtF111drNqG
	 j88UAdHB5EORMwWIwMyIohA02twGQKeDj7ZETlgdk8i+7kUKvsgdAqKBilxs2I3+fT
	 xpq8W+03OxqlTT9zaJHwvHYhm/olqxKQWy2zyaXgvYVVyLtjeYrLxYFiD/0CtTh0Vh
	 GokQAcANcL3X+dGcE05wB/n2KO8NzQc9cJgF//kOPUj8iUDBRVLq+rqephLG5oUx20
	 r+31XHYb3qsKZU+qoykzHtdlotX6tbGfzwcUtfEqoQWDMRM9JllelqjpF414w2xzzy
	 Oih3Cp9+LICgQ==
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
Subject: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
Date: Thu, 23 Feb 2023 14:34:35 +0100
Message-Id: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053500_212289_B27B4711 
X-CRM114-Status: UNSURE (   7.59  )
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

MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
two power domains (one per core) for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index be18b161959b..b9424f3ebd5f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -20,6 +20,7 @@ properties:
               - amlogic,meson-g12a-mali
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
+              - mediatek,mt8186-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
@@ -159,6 +160,7 @@ allOf:
               enum:
                 - mediatek,mt8183-mali
                 - mediatek,mt8183b-mali
+                - mediatek,mt8186-mali
                 - mediatek,mt8192-mali
     then:
       properties:
@@ -204,6 +206,22 @@ allOf:
       required:
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8186-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2


