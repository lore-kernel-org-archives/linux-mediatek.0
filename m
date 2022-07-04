Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPvP+FG1O9k1ZZtmBX9wBm1Bg8gpE7IXvgXX3ad/3Kc=; b=kbeqiXScBzLkd17sh9rXRSgOMa
	OaKH3d56aGZ7rfYjPPQJb/guDPmHqQK0GGNRX8jeJhMJu8DdptomYb26HGVCsv3HwU1oSzVHTISm2
	8MO46OgOZuFFbCI0CWwmljG/M+ltkg8FJ2lgfxVJwV4aiIxNj0lEmm3RLL0iwRUDBVySfK1MRlJYc
	/kqkKx5cOMBMvohL2WiSN0xHqdrTtY494nF4VbJFFN1xkWobU8597vMfJDu3hi3OImEfCPgZLmBM5
	mm/beNFzcJdH/3Zu29B8o1oA+XzqUxkP+cF69VFRaWbhJVO274QXBf01sjsUueQcEcuajoZJuR6ou
	0UEFyB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5W-006pty-Fy; Mon, 04 Jul 2022 10:13:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J59-006pbm-1N; Mon, 04 Jul 2022 10:13:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D2886601985;
	Mon,  4 Jul 2022 11:13:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929609;
	bh=COlKO70QWsoa/nV38XX44C/HzQIHC3dMfXYf/7vorrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fqc9C9BJFA04iAdl7pBqkmyCxtr4ULPvQnE/DfGCilzYzVtInFMcHnN4iJQwhVueh
	 zeuIQD4VRmA+hWPtR3TWuo5QNwOCixPbaECw4LIdu9YjRVxKWmRcd8sZGrcP4rIGkJ
	 DlvQtQg3+Kuj3J62dXW1KHfkiruecy/hSWWd8O7M/4pj5XilgvGCLXngBoWl7uGHSl
	 58B1Rd0y0qa21+jkp/k+D9sjXu2ydkZq834H96gM2EdZS34OWAmU7KD16mkLtiSEse
	 Xujd2wGDToz6iCPArnrAGdJbQGOovXKJcgW1yM8Hpfliwmid0mTclP9gGCJkq5f/Ki
	 mkud4a+iAd1Lg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
Date: Mon,  4 Jul 2022 12:13:11 +0200
Message-Id: <20220704101321.44835-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031331_443683_4054BBC7 
X-CRM114-Status: UNSURE (   9.62  )
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

Document board compatibles for the MT8195 Cherry platform's
Tomato Chromebooks, at the time of writing composed of four
revisions (r1, r2, r3-r4).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Note for Krzysztof:

I had to add the model number to the description in here, but I
wasn't sure whether I should've kept your Reviewed-by tag or not.

Since I was in doubt, I decided to not keep it just to be on the safe side.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index dd6c6e8011f9..07c0ea94e850 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,19 @@ properties:
           - const: google,spherion-rev0
           - const: google,spherion
           - const: mediatek,mt8192
+      - description: Acer Tomato (Acer Chromebook Spin 513 CP513-2H)
+        items:
+          - enum:
+              - google,tomato-rev2
+              - google,tomato-rev1
+          - const: google,tomato
+          - const: mediatek,mt8195
+      - description: Acer Tomato rev3 - 4 (Acer Chromebook Spin 513 CP513-2H)
+        items:
+          - const: google,tomato-rev4
+          - const: google,tomato-rev3
+          - const: google,tomato
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.35.1


