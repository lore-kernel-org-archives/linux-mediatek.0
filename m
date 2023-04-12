Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEACC77B76
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7HAs5TM0IybNBrui8AsECSwvctjmSdRLbOLlwXAZJE=; b=wSNBXA4e8dwekTeOjEeqFj/8JU
	xKvUdTdG2s/A+QoBe8kRvPcNEuJk6mTUh8+WMNmjNYGYmNGlFIiJRM9QGyrSdhUlEhtuXaTLtXaKB
	NI3c5ojy0n6Xk6+SKdI25TTjKJXomZmY1KJbse8pnbKbDLFN98DWAvEX36fu/o7MOfOyFeinD8svL
	7MqosEh30VzjWQ8AV2Le9V98GIxgjqfETOh3ll9WYDlG9eEk7bCoBV3EoI/bQeO0cgp+5U+X4KaUr
	zUyfpR/f2Ftuo0HQ8PtkSU7uhOBq2KI8XVheMnFFAP/u9KCaqN3pBfeytSQjnu1oKEIR8DwLebYRZ
	LwkdkLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYeD-002o6E-1w;
	Wed, 12 Apr 2023 11:28:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdl-002ndo-38;
	Wed, 12 Apr 2023 11:27:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 231636603213;
	Wed, 12 Apr 2023 12:27:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298872;
	bh=lu2YqjszT6GAQfheSYtmuPDjTI03Qls3ZRurM5/bzdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOZnOw2J87HqYSwK3AmmugMo0zxjvfBq7HlkaMBwgOEibqfmGDylJYzvoabSKOCFm
	 Gpoq95VCcoNzMiyLhc7EfhZG3PMNDwkHi/tcs3brHC6NcLq51IzjMrFIEH32AQERie
	 aAbFzQA2Gbw6p1jjT5A8naU3ZQT5iGBGvMXf4kSSMwFrp5KWaLzDTPMtcnEoFj2jJ4
	 gX2agOSfKZpLT5d7dueZvC46+auOanKQOKTidisZWyYDhZvdaD+jVTKlYLJsAzIf9O
	 3J2Fy7OkjNMDm3rNwSbwUDncpPbyhmbdg67VZglnh/xgdtnIn5QfrMFV3n+IPvWmeo
	 yIpS2GztN7+0g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:17 +0200
Message-Id: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042754_141084_E3E5A22C 
X-CRM114-Status: UNSURE (   7.41  )
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

Add a compatible string for MediaTek Helio X10 MT6795, using the same
DSI block as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 4707b60238b0..12441b937684 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -22,13 +22,18 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dsi
-      - mediatek,mt7623-dsi
-      - mediatek,mt8167-dsi
-      - mediatek,mt8173-dsi
-      - mediatek,mt8183-dsi
-      - mediatek,mt8186-dsi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+          - mediatek,mt8186-dsi
+      - items:
+          - enum:
+              - mediatek,mt6795-dsi
+          - const: mediatek,mt8173-dsi
 
   reg:
     maxItems: 1
-- 
2.40.0


