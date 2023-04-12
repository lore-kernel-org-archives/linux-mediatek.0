Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AED2C77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAwG6Y8A5V5loyVewrTbghHb8UJ861fD/n3ZjHNaKfI=; b=AMf2SAUu722aYRfd+PdFZFM4It
	NY0VFcxAnTIm9hZ74IgVe2IWgMxbLbCP8k/SfRbgdwkLK1HRB8i9ZYm4juwu6chFmft5azMi4/q48
	6tYnpjsDLVRvwOx8naPyUEB+ZqbUi9MkJnv5aStbC7tSkEd48odJXYb/23sUHEJU8Yc3rgfgp+0MU
	jNYRviFsnbE0RBUgZluEnei+FAiDO4E/bmE6fnv7ciZoOuVVyEW9pknFdW2bTKzOmKkECIiJWXsHn
	kpOM8uubkI9oIKfm3LnMCsHya32O6CTNNHZuT50igwT4zbDFN4+CVJIgmBvhGHDZFv8IiKavBm1XZ
	0uy4fmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe1-002nrF-17;
	Wed, 12 Apr 2023 11:28:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdk-002ncT-0M;
	Wed, 12 Apr 2023 11:27:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A92A8660321B;
	Wed, 12 Apr 2023 12:27:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298871;
	bh=ldbfDeNpQ5/zM9eHSB8JeIaBEL0OQKQfjXn1SCCi2DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxXjiJZ7p1YY1OBLjncsrhMXEP05TZ0vQDDw0eNavUZTqfIUSBJNLAPI/rIf/1mBq
	 fW8TNlmIwFwmGQfnFIQf05/YA2CPZVCyesNm6ws6hfc0FknxVQR6pzmR9dot980XC4
	 pWZ6jir2AzEAzQ9AHpJLlrT0sXC/TCV9e9WLeWaKkQhhWaCvE7xD6KueZe4vjo25HE
	 /01O4v6h5nBb8/KUU8c/v8uqAY3B1YccUB4i8RTLhfvuE87uV6ei8Q1lZL4t2vYIYx
	 yB/4gBkWRSWVVX1eelHbULStSTgwINvWXqhXuWzIK3HPlsjrHXwvNzvRz0la2VFOc9
	 bLAKwfRYagZeA==
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
Subject: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:16 +0200
Message-Id: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042752_275334_A4E2F137 
X-CRM114-Status: UNSURE (   7.52  )
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

Add a compatible string for MediaTek Helio X10 MT6795: similarly to
MT8173, this SoC has the gamma LUT registers in DISP_AAL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 92741486c24d..7fd42c8fdc32 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
+              - mediatek,mt6795-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
-- 
2.40.0


