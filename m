Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B25C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kzu3BJu85DdRorcfPvHp6QVNc78eN6a+tOVqCn2SrXo=; b=QUEdzD4aO/ewd6Lg5kC0NXg4lM
	h8a25DrVZMHhFFtzip45GQVnMYdMEShgUm/DF0Rt15CfxKB0rM5eFxLvBskwu/l48qLg1NverSV/z
	VdgroNi1RZZEYFPtLelkv9Ynw9cnJKYJcq16m3YSJDRYJAyyNJsuRR8MR3+5fiNWnQNrYo+jAavz/
	sJZC1SZjs8C4DlLDwW4MXc54HfAF7vD/MM+xO5TynKvbVwaI02DVOIj64bJZQji2etJBRxF31QFky
	k1Neqy2buoirCG/ZMt03oEHmCiYhYqQiVQK6pR7uNpxcK2O+14ScGvFiEVAxFXQ+233cXzpw96mEH
	DY0DUmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYek-002ofc-0o;
	Wed, 12 Apr 2023 11:28:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdp-002ne3-1j;
	Wed, 12 Apr 2023 11:27:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 826DF6603215;
	Wed, 12 Apr 2023 12:27:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298873;
	bh=j/AmnqcUgZwbS3Y0n+C2WF0SZPlM1NGbL/O9iXx8hnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HlN3auaDUklNJexPh4RU+RZt4NmSau6riHAu2X9cJ0vHgdkteMsTLQkCd9wLUgkdB
	 QFZDMVNF/yPletXBBn4J2hNmk1LIsQ4RGXDxEGeR3SoogP1yWD3MbEbyyW1ZPA5CwL
	 88C4fziaBdzDAaGiZBTJ628cYGM6x+znf4+erLt8jx4XDCENYYdY1XzVBDc8+Pxy0c
	 K/D9UJMsdVL367+q7WJS6v/ezb2Y6ZJKwa6NQa1TbkCtAB7njQQ+/9WCho8l/J5yQw
	 CUTWqbhHv2mTTNixtpQ/TtbXh2cRez6F23yv6CPpw8NU8vB2AnOFzIf9h6rhf+tJLB
	 ZZtVelP8+L7Wg==
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
Subject: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:18 +0200
Message-Id: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042757_707602_B52524AF 
X-CRM114-Status: UNSURE (   7.91  )
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

Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 065e526f950e..7671c01dabdd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -34,6 +34,10 @@ properties:
               - mediatek,mt7623-disp-ovl
               - mediatek,mt2712-disp-ovl
           - const: mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-ovl
+          - const: mediatek,mt8173-disp-ovl
       - items:
           - enum:
               - mediatek,mt8188-disp-ovl
-- 
2.40.0


