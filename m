Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D584BD65531
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBcP/mxSelVDOg/L5To7xCpv808IsvbeaBCkEbSzGw4=; b=ZtqB7ZO0RkBU14EkoZeEjyfBqd
	kKdAAUHLtaO4Ua/kNgFG4ANZ98S0BbWsIpEUU8HwdGLI3ZGsTINX/lqYIoxMqx8oWBbJ4J5hO9Bq1
	DZpKTwoogFhDoYPgw4BpHfQEgh6zVj50FLT4mJwTXC6NJUMBzs9V//0Qaj+WAwoIlhFyezI1oWDCJ
	E55/H98gqW1xlHb6J1/SLADeSJakh8y8EmzGvnmo+p5LfVaTYWjS8Q2rzTNbknWs8QMLix+si1W5J
	TXbWAmFAns1EsRNjyosdHRBBZIs9A5I8YJiqt8LscK08U5uIuHNIP6gPT1sBwpqDaLVVIJo2MGHMA
	otdelNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodK-00000006bM8-1B4U;
	Wed, 17 Dec 2025 10:19:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodB-00000006bC5-2B7l;
	Wed, 17 Dec 2025 10:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966779;
	bh=/iHY6Ek9NZv6NH4I47nsOrQqEuFHwaSUHvBiqk85d20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/SZ7qU7VSj6SCADkIyQuFrB9d48rdPfCmOLWaL41fH735Wu8o2DPTfZkt+OT6Ya1
	 ZiQ/WdZRA4p5UC+Q4qTTl3y3lMNoDbG0qaYTvzkKhCwJ5FkKOraPOrB+WWz5tyfq03
	 TjDeKnKBzt1JIZEVIqODZ9j1IjZ+51JIeuX6CTAWREP/HvBuXD8qSLkQ04gjcT/QV0
	 frYqmE0LAxw8AM6eBCHWsRCRCotlHwd9lLrtatV2eVCiDDFyUrIYBH72xhQde9aFYJ
	 5NWBciA+YpaIEvSSARRMvy8KPwx8T4tNLxPYVY36Z1QGV2ht7tyNXB5q+xlucLdxSx
	 kSvkjfUiaufvQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92B9917E1149;
	Wed, 17 Dec 2025 11:19:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:02 +0100
Subject: [PATCH v2 03/12] dt-bindings: phy: mediatek,hdmi-phy: Document
 extra clocks for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-3-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=1648;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=uBqYbsllwSAgfx3yFUqteOM6qhanU+ngECKB88ov1So=;
 b=mduR62ASYwH+iiccWNUlf5O1GlcYwUlq8FuJbjpMYx1h5b5vGjXRGAnq5gB3T5rwZN24QpXgq
 Xfa8pphygFXDpIY/gjvDUIJ21E0RTdZ+25sFLMncIqvoqLsb14yeHz/
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021941_710846_13CF8448 
X-CRM114-Status: UNSURE (   6.99  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

MT8195's HDMI PHY block has 4 clocks instead of just a single one.
Describe the extra clocks for it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[Louis-Alexis Eyraud: addressed feedback from mailing list]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index cd4ac42ee45e4648ed512f68f6f28d1f3f2e1116..ac93069f48013b7f082f1b64ee0a6a60a3a912eb 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -38,12 +38,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: PLL reference clock
+      - description: HDMI 26MHz clock
+      - description: HDMI PLL1 clock
+      - description: HDMI PLL2 clock
 
   clock-names:
+    minItems: 1
     items:
       - const: pll_ref
+      - const: 26m
+      - const: pll1
+      - const: pll2
 
   clock-output-names:
     maxItems: 1
@@ -79,6 +87,20 @@ required:
   - "#phy-cells"
   - "#clock-cells"
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: mediatek,mt8195-hdmi-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.52.0


