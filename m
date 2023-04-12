Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E0C77B71
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sD3lBiiLUb06dq6C183mu1Eb+HlNCo2IoGiH8B3Vm6w=; b=LVQAYt6+T735BEyBzvWpTQcPfE
	qKcFsxxZXxjUfQzysFeuUZ5G+1NkGUEYF8R9rR33ZYXay287ZD9yQEa8/tI2SRpa1QH+kPklSiCzj
	UA3K9VKj5eJfUcegrQKwIWzqZAV4eH4VLQC1wvFERRz+W1eFHwm7Zk7B7LboXyzmNH8E0tjs/5lim
	UxCddpQEFftWLWsBiJ9U2Ynd0WnJFTAVkoPOPlM1BgcC0+FH4BX6iJJ0WZq2jillJnDbbtH424fAN
	MpDzkcq75AIhJhplvH/dL9BHWrHEquOPkqCFcRH9nT7CtvIOrll52ZjYphHSTzpI4x8IwnZv6RkBn
	pZ7tmi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdp-002nfW-0P;
	Wed, 12 Apr 2023 11:27:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdj-002ncF-1L;
	Wed, 12 Apr 2023 11:27:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D08DA660320D;
	Wed, 12 Apr 2023 12:27:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298868;
	bh=NzUsNWSsVvvmJv02n7djBLkN0Zq4SqWAI0O2gjnIL7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TaSKHO3sqFHwQzFrGRDBpls+rHV/AP954ERZJw6yABDWUD5PIT4SKcKRFKQDqKDqF
	 Cx57kdOJOjloHkvOGcyxZjFZa/CdgAJ9H8BYQ4L6FBhm7kjkcYJj4ToOTQQX/yxLag
	 vc51ZMhp7l2xesHnA98ycICf28mCxFwhY02T9Qx/c4guG59O7y63UxwJ5B2Tc7XTr5
	 K9BdKBAVQujJ6o/z6dFYkN8P4arc0kpaB3BowYxcjqOiJ5ZbHmVf05YG38M06NytC3
	 /I9+60MfGHs92i3dGaXq3PgkHgi+hGUExGMNiNtDQwzHJft4thyWZE6LNM9VjPK4lQ
	 zzCWvsYIj8CDw==
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
Subject: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible for MT6795 Helio X10
Date: Wed, 12 Apr 2023 13:27:14 +0200
Message-Id: <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042751_666310_A8753457 
X-CRM114-Status: UNSURE (   7.55  )
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

Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
the same DSI PHY as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 26f2b887cfc1..a9f78344efdb 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - mediatek,mt7623-mipi-tx
           - const: mediatek,mt2701-mipi-tx
+      - items:
+          - enum:
+              - mediatek,mt6795-mipi-tx
+          - const: mediatek,mt8173-mipi-tx
       - items:
           - enum:
               - mediatek,mt8365-mipi-tx
-- 
2.40.0


