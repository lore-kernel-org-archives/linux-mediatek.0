Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DA1C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIuhdO717Av6b/d6VtfpIog+W7Jxdapkx4VKmL2Jef4=; b=fApRrGzu11gKSC
	1PNZZWh76asuBSTtFCnYTkQr0hzM0PCdRMc6JoMzzwPvZZnT8NVdzZcmaOSdU17YaPaMrjWwknM6P
	GIsV7dK7lNQNPVSpFmHZ55XkATjXYcHjc9o3ob+tEjifzymAQTL7qrgF/HklVPdQ6NHKw4FVmX7GC
	vRIwH7exc9TVFb5oyPKqMQLMAFsr28L5LmAv5av/h4OdojoFGfN2Px3uRq1CLsQcB7j85RxQmsZD7
	dh7MefHRnEKDpJPeVq8SjUFkXG5yIHGWT0pvpxoYngnEjhGEP+TWxN9ruNwUMCZRzcFfMMBLdD3U1
	eEXnO+2sW+5cfa9Qxt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYp-000000076WM-2cWS;
	Thu, 24 Jul 2025 09:48:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUk-00000006tdP-2TKt;
	Thu, 24 Jul 2025 08:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346405;
	bh=zcY6uixOKmgsG390lY8yjsxAZ7IOK+MdAKUlFrBCbSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4W8XI2uE0OOilyU6OFwbaIasgN3IdwzN5wzOns+tcvMWd9KxtwyOS1Y7dMXw8tep
	 pWFlkTvh7lHlM2FlKX3qG+qEqKdz4P6Da+MZDIfGZ9YGA00agCTLQqtAxODCsXLFLJ
	 nmSxSgAr42nlNcPvn7sVQUXrjsUKPASnZqC1Hu7qt/GS+ESCmGQHyQLU3f6DvGAV1b
	 yKJDJ+8hOgj8MDWtyzKc1ORkpFa5eFF3kJJLJobcaztYJHVgwmKgo0q5e8ezMLvNFK
	 Slrn09Q/kh5NpSpakWLJOL/vHgqAI3OwP8tDuUBnvhPFfl1X7rLlgchc4RpGEDJ7fd
	 ebcaqT6JLJlGQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC34517E1298;
	Thu, 24 Jul 2025 10:40:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 15/38] dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
Date: Thu, 24 Jul 2025 10:38:51 +0200
Message-ID: <20250724083914.61351-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014006_773019_5BDE0591 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For all of the HDMI PHYs compatible with the one found on MT8195
the output clock has a different datasheet name and specifically
it is called "hdmi_txpll", differently from the older HDMI PHYs
which output block is called "hdmitx_dig_cts".

Add a conditional to allow the new clock output name on all of the
HDMI PHY IPs that are perfectly compatible with MT8195.

Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/phy/mediatek,hdmi-phy.yaml       | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index f3a8b0b745d1..f1207aea8605 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - mediatek,mt7623-hdmi-phy
           - const: mediatek,mt2701-hdmi-phy
+      - items:
+          - enum:
+              - mediatek,mt8188-hdmi-phy
+          - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy
@@ -41,9 +45,7 @@ properties:
     items:
       - const: pll_ref
 
-  clock-output-names:
-    items:
-      - const: hdmitx_dig_cts
+  clock-output-names: true
 
   "#phy-cells":
     const: 0
@@ -76,6 +78,23 @@ required:
   - "#phy-cells"
   - "#clock-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt8195-hdmi-phy
+then:
+  properties:
+    clock-output-names:
+      items:
+        - const: hdmi_txpll
+else:
+  properties:
+    clock-output-names:
+      items:
+        - const: hdmitx_dig_cts
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


