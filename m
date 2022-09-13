Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB8C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTAn/m/YlJsSUDR82KQhgEA2KgpeEvGALi/1FEr1v5o=; b=VwiRCGfOqAhTrRLhAf5+RGJlZA
	OV72ZoPU6JLpjB+XPVVu/rC4gt2Xytioiyygfzsah5XAxaUl4nP+Og3m2W0JMSETEe/uW6l/7UWJ9
	l7jfGfcwa2AXNCt7bzKboRxgmdId9J5I+gJgHqfhx8vih0uqjEW33RW+VOxU04idDuRPBdF1OVqIz
	fC8lSZ3g6WEFsdpDXL1unQf/3nTnrYX8ZYbIyoVytV/OBjv4Wl9pkpKOLwoE2KKSU7vExbty2Q8+4
	nrNCYShnHxcEVZoev1698Fi4iX/0BRJha1zVAp3VAlQm3N0+aI+4bii7rBEksQhHefpJG/BGsz5oE
	KCZmZQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6V4-00BCN7-0d; Tue, 13 Sep 2022 14:02:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6UM-00BB8p-KB; Tue, 13 Sep 2022 14:02:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 281E96602006;
	Tue, 13 Sep 2022 15:02:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663077726;
	bh=ErT3ESbOa0vk9bZS+9TSr45Pf6iZdWC5H+hlE0INnY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJYmSs73FepwOwIMBcXJo14SVTarVl0tD9gnZ1PTlzIo2FTtmK1owHlvYSENheeBF
	 opGwe37fjNsT4xRnC3Lg50PKtRmhjbxEmr5u3i1Yc+djPcqstgBvwN89imroO0+9w2
	 L92faVBBCMJMKpX5mC8ZNXEzpFYWJb4NiU8+WBaTy98atXRHukmMLya5Ay9bEXNNb+
	 HTzKRA3YPzCwFWsffE3cMkU+3AOdT0bVG6PbWIzznpWKWxhHgd8YVgC85RPanwH/hy
	 WPApudvvt+iWgH2UCDJrzeGjFq5IUQSvPXUSegNf8Pu40KUuBwg444gEsl+B5aGdKs
	 Uo8obMwIWxARg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	jason-jh.lin@mediatek.com,
	rex-bc.chen@mediatek.com,
	moudy.ho@mediatek.com,
	allen-kh.cheng@mediatek.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: soc: mediatek: Add display mutex support for MT6795
Date: Tue, 13 Sep 2022 16:01:20 +0200
Message-Id: <20220913140121.403637-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
References: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070210_807793_A9C3E7B9 
X-CRM114-Status: UNSURE (   8.45  )
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

Add compatible for MT6795 Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 234fa5dc07c2..9241e5fc7cff 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt2701-disp-mutex
       - mediatek,mt2712-disp-mutex
+      - mediatek,mt6795-disp-mutex
       - mediatek,mt8167-disp-mutex
       - mediatek,mt8173-disp-mutex
       - mediatek,mt8183-disp-mutex
-- 
2.37.2


