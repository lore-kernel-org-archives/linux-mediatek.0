Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D420C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6LsppgKJup2xZ9Y8CPzyFaM+ug9UHh2+Cyivb+Gtj8=; b=cPLNHUZOr8kCTyJSTvRo22juZd
	tAhgmLBWtisbl0jZjr+8/JbW2uhvJDn9fIhieLbXeEo2r9YrT7Pl7DqmUr0pOUhafRFzO+ln/l/sc
	JYsj4xqvZZ2D4AGZQBW8jKCkR16YbGMXLI8kfQmD8AKYKhkWXm2DA6Nzuhgng3dGeiqYqBAyalaaj
	/n3OkP8432N9FpBaIINqdtbn5OoyGfMJ6snKwuCLyxto6iKVDpp9mP/XDpijN6jUulfN3fguvYiZK
	IYtQmjC/wZtKcucwPYu0sVH8oQV0me9uvzWN4/YeEY/+2svJEop91xvCf5RgJz6KwSoU0XfgX3zzy
	POWoiz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2hR-00Dokv-Ji; Wed, 05 Oct 2022 11:36:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2ge-00DoQE-De; Wed, 05 Oct 2022 11:35:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73F2A66022F9;
	Wed,  5 Oct 2022 12:35:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969739;
	bh=/7BGNVmlvPkqeDYBGkWztyuuvDVeU67h+vPFB54rXc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ct9+K1N+ae63ngLJ6uGP20dsPPJ0BTs6+78OZ+A9nGM6zkENoRXts2wBvrNwmnGUV
	 MoWW2tswP4zV77YyjzaapzVEp7VydKdQl0WgOshQuZM5tI/dCKXMNdl075b37xWa0j
	 HDH7VHU1bln2BUyi3BF9ai5iMLw9LqNwdiwM4+IihhxZppjBx1xsNBntcBTMJCINxo
	 sVO7+MQiACkHY1xF2QRga2m3AcgBrtwSz/X04uYWO6Bg6qFvFFhxTlsNw0ts7zhrla
	 dFIxgF0AuDt78oVdJxHH2BcKJY9f51i0XoNvQ6fqhWHB+LCaRuC3XjbuLyye9MLv4h
	 hm3OGiBTMpajQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com,
	seiya.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
Date: Wed,  5 Oct 2022 13:35:16 +0200
Message-Id: <20221005113517.70628-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043540_606709_48EA0B94 
X-CRM114-Status: UNSURE (   7.92  )
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

Add the mediatek,mt6795-wdt compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f43b5af92d40..54dfe7941d53 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - mediatek,mt2712-wdt
               - mediatek,mt6589-wdt
+              - mediatek,mt6795-wdt
               - mediatek,mt7986-wdt
               - mediatek,mt8183-wdt
               - mediatek,mt8186-wdt
-- 
2.37.2


