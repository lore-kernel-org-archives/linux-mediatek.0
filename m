Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18AFC47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOtri/kGVnfGI7HSHJfipRSA/Lhy3qVUlt+OxeMpIYQ=; b=jJnRQkulH3AozkF15kf8X1Jy5P
	Zfc19R2mJjVws68lr4icBAoVgsvvJGYDtqMyeddh0NIzVUGbO1sPqBVz/o4X4FOluxQvgsH1TTyBR
	elYJeaRtrNlmg0NKmE9rheGZa3sHQmj6E9aFaqiIL8zsJNCkk5dakoKns65zc22aTf/S4kR+QZYtK
	dnGMIgpXRSTj+9+pT5uYVekhpKNUmqzkk6xj6KgoAcaJUiRzHzFElIFGV8wuE/Icr8bxZJOqAEf7f
	mfksHx7XptTPIPJpVBXyh6Plz+TSb0q+je+Cm97l0+FU5uIUuvcU0hbHPB6Z4JrSlJoZagIBSPLcf
	Do50GcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs26-0000000BMEw-1m1F;
	Fri, 02 Feb 2024 11:48:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs20-0000000BMC1-2vtB;
	Fri, 02 Feb 2024 11:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706874506;
	bh=jOBNaj2dKnYfO4IjqztTr2cvYISm8hQDlE/7wryo+2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wAuE95Fek4y1oOi1S7Oh4emT68MyEpuhsKzoCCZuX55c7Eag9J78gRoTwh2iFlKbk
	 Okh//gWossyB9wJktKvwaoYEvXT5u0UTLCucVGOMyfyQ8T+p4zDP2twglU14f+vYVl
	 q6q+hBBrDmz01P3hn5AJfZ8uljFMVRd2s+SMVD1dfBzRqn8gVC0GoB0JFyMTJohFeD
	 7thODRLeAXqUI/0Rv0XWGl1PKBK1ceXjtXCfbF37qARx26uc/Ux2i5Bwm+ixLYddfL
	 QQz2YKo2Dpf4KWuMuDH1dNOOiIVuV/VCyld+anagfdrTLs+yASB6s5gGGHjIiVic4R
	 N2Yrros7+9hxQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A86263782093;
	Fri,  2 Feb 2024 11:48:25 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	stephen@radxa.com,
	tom@radxa.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO 12L board compatible
Date: Fri,  2 Feb 2024 12:48:20 +0100
Message-ID: <20240202114821.79227-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202114821.79227-1-angelogioacchino.delregno@collabora.com>
References: <20240202114821.79227-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034828_888224_6C741751 
X-CRM114-Status: UNSURE (   8.44  )
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

Add a board compatible for the Radxa NIO 12L, based on the MediaTek
MT8395 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 6f2f64ae76fc..168538887fee 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -287,6 +287,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8395-evk
+              - radxa,nio-12l
           - const: mediatek,mt8395
           - const: mediatek,mt8195
       - items:
-- 
2.43.0


