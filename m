Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E84C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j3mKbiFZKKPy2wXBpyMEr+vUQJnf56wP9OK+9cBVyc=; b=x4m10J7+x/cUNJJR8lPpzK+G9+
	s5jTECLV43VpSqkTbbC7ouSGm0KyXgcAAeZ+TK5ifnOe5cEOmySC+BS4MEnYPB1s9SpAhc4xGsarb
	RgRB2eUkN1F1PPPVp7ukpRDFRnqRdmBPyDgT1yHgeQx5Xx9OdrsLX7J5Em6ITFh+hfJMAnu4B11Xt
	W09xQvKQmERoH2avSVSjGvHb3yMj169SLHPTNRDFpodYxdCMxQmm4iTH5Ey4LKCdLY8V11gSqVNYM
	VWx+ZoOxeSoooqWyTBwe65X5ZiCaJ+8Z3RNmuej/7Ef3kKDqn8eChEvETgqhcgVLuKQTJUo8nZ/BM
	DaMIFIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNVR-004Abh-GI; Fri, 29 Jul 2022 10:46:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUF-0049uu-FN; Fri, 29 Jul 2022 10:44:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DE3C6601B5B;
	Fri, 29 Jul 2022 11:44:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091494;
	bh=FjoMUwROjlB7ASGVOB0J6z6l9OQcUOCW/N0yhWPHg8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JTTLJwKZozKdOax4mnSZj1zRid9azn4xnWvYLuiriwzApy5olMOYbMeRPWujTXxCA
	 j0TWzrjZeqO8NuwizjAbvJMzFDjBd/bd2e7073MobSqCT1Ijo81DgIwW1zTkumyQ3v
	 oTB2esiYJz438D0/6mppzZCJjz5xGbvh8wSkFQMkH8OG9QdIMhy75SXFo6hV1jq5Ka
	 pjX8XXqlXnLmJJnSV3ySOvLOYjju4dHsFw7t/RKtYkHQqNPtk5ccLKuurUe+pS2fOE
	 cZfn9Z+Llto+30h2RpEsTLQyAXUnWkMvijaV9fsX73aRHd7I0pOmUAklkB/giEe0Ts
	 VYnIc74fgHJbw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/8] dt-bindings: mmc: Add compatible for MT6795 Helio X10 SoC
Date: Fri, 29 Jul 2022 12:44:34 +0200
Message-Id: <20220729104441.39177-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034455_708001_05725B0B 
X-CRM114-Status: UNSURE (   7.65  )
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

Add a compatible string for the MT6795 SoC's mtk-sd mmc controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index be366cefffc2..e1ceefe0ae48 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
+          - mediatek,mt6795-mmc
           - mediatek,mt7620-mmc
           - mediatek,mt7622-mmc
           - mediatek,mt8135-mmc
-- 
2.35.1


