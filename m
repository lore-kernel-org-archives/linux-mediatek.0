Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5332C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e3z9DcY4o4P06bAZYEpXIZ8EBk5zFzxIiEicW9dGAg=; b=lDXwhRCQNbEkqw2gxEYxgqVDFA
	FNGUmBGh83dP/6lSHXWYUKidmXY4UUYFxc2xWVg1IfvKZCvNDJHrSr+TWXfZHJzb/h63CS8eDaDiB
	YslnqbvXL60XbnyUAOo74HOaWUID5vlJlpbAjUE8JDvsOLZihlNVILxA/UjterUCsxXtRxOB35qJn
	tMv4Vn+V+6UfWTpIhuCJ4QM6nTMh5tiPZ8Y+mcZT5hVz8nlVLzTb44fI9H35Bup/kEkrCmhati0Wi
	wUYgJ7XUv4lnNuHf5azxC4GPW2AAzeF0/QqCwP55PSTJ5ZAdwduAmK6pSxO0zn9m+xQWHS9PiuOG8
	r7jYwlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldD-005AOZ-2U;
	Fri, 24 Mar 2023 17:55:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld5-005AHb-2O;
	Fri, 24 Mar 2023 17:55:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8C23660312F;
	Fri, 24 Mar 2023 17:55:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680504;
	bh=K0Zn+1zJOvMiVcMPpFQWTebyCIuwNTPLMAYftcNlQPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0QTPx+iyIn435vWHAlLMr468WsGxAnYdsdmi47ETRYuK1LkfRrX5A6+G8NRmK8rf
	 npzjmmyuClzcIORD6vKXpKfjWIVvCdQPGCc00n7sDi7X0zTAdkfghZFFnyNaJiuRmu
	 kA1n836ZmRtxbXLGPwjq/wt+7kQvL9j5vHs1Wgup/6MTybPrG7VeHn+ZEWAs81XTq+
	 QyyiLZpLOmPLaWD2lzbi1VcKl7fkDEAnIxfP2cW95S0pwTpXX0Sp4NmuSaRUHsKNk7
	 BB7/bd1of1Bvv8hjkLgNX/koHH8FKzwySysSzq4wGwaOQekPaqxRBPZL1Kwhux+4f4
	 tVSpxn5Kx3LSw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 04/18] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
Date: Fri, 24 Mar 2023 18:54:42 +0100
Message-Id: <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105508_005604_96B0E588 
X-CRM114-Status: UNSURE (   7.48  )
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

The MT6795 SoC uses the same I2C controller parameters as MT8173:
add a new compatible string for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 72ae2e01cf22..685da4df688d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -45,6 +45,10 @@ properties:
           - enum:
               - mediatek,mt8365-i2c
           - const: mediatek,mt8168-i2c
+      - items:
+          - enum:
+              - mediatek,mt6795-i2c
+          - const: mediatek,mt8173-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c
-- 
2.40.0


