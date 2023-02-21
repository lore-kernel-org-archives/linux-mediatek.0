Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278AEC636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbFCyiDnazR31Wpk8O7uCqJDZQcBF26z3rz3IXEylsw=; b=bJPQT2bLdNBXooYXck6D1AV8Vq
	0/bY3VGdzTL4isijQEEPXKy0kHuGmEF+cS3Cp6hpXCmpOKrSzYB0OOlOPseS9ZaPLk5QOLuHONBGR
	YQT8Drz4WfMddSef5fkmnwkD/56uc/u1KCYyIoaBfOJQad74FrEeCUnNQ63Yo6Musv9C0Ni6Wnr3Z
	YkZua8YPElZpVbx9+oF4j0nO47iT89BVQOI807HI1psHJ7xyfwDZ5qVhuM1g/Jle/vqB2LnqypbuZ
	K70XWDRTO4BAtFWR0PyW+3LzZTlcGRvKADrNFOMQKlOo68eyQpmEpl0xr7CsJurdE74aXRbyJo9aU
	Ni5KePNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUjl-008iwK-IT; Tue, 21 Feb 2023 15:39:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiE-008hyX-DG; Tue, 21 Feb 2023 15:37:51 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B21966021D1;
	Tue, 21 Feb 2023 15:37:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993869;
	bh=laOGM5qspmdr3Jbg8tYgPNAcwC0TKu24Y1j4uxBmTgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjILYONtql0ehe3PptlOR7eKUZBQeJMTTtYY8w09XRxxCvmZ5OYdQLRzzzMtSAGby
	 HsVOVWCd83+EDTFZF3doY2lB7PSEgLgZYw6qei1/ITB6eJeRtG2by53TaA2P5DdPXZ
	 jRazpehci/kSx/ivYH9a4JAUwyZOOmyAqDJiYwUZWMQtslL6KVoPqUhczn4h1MZoGq
	 Twg6GYpjzPuSO63ekaMKMQKyPl8kQz1XrLYnFSbJlypVckkERbCThJBEueEzSPLHlW
	 JOzblsKjiyQXZ3l7dhy4efPviX5plwEkjHZ2HtU0kIu0ipOp+dUVHmPFtb7Did83w0
	 52JqyI6frluDA==
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
Subject: [PATCH v2 05/10] dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
Date: Tue, 21 Feb 2023 16:37:35 +0100
Message-Id: <20230221153740.1620529-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073750_607248_FFF96EBD 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since new platform data was required in Panfrost for getting GPU DVFS
finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4d9ab4702582..be18b161959b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - amlogic,meson-g12a-mali
               - mediatek,mt8183-mali
+              - mediatek,mt8183b-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
@@ -157,6 +158,7 @@ allOf:
             contains:
               enum:
                 - mediatek,mt8183-mali
+                - mediatek,mt8183b-mali
                 - mediatek,mt8192-mali
     then:
       properties:
@@ -185,6 +187,23 @@ allOf:
     else:
       properties:
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183b-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2


