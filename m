Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76181C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fo2G9n7fj7d+xwoh8TC0dgh9mB2KmiapPb2p9Jb4oc=; b=PDZKfNFcgV+kasl5McKZn5HaMT
	3y1hSksyKiDVWgvBu2rAeWoVv1abjYvxDHzQNS3IiiaW8KqjwGUgzb+dxEZKNsP04CgWP4HO8gq2z
	wYS7WY8O7ZvixRDxBjTDjEerfsavlX5ijssuE2DlzE+NeVYWdieCjqDompXo4k3dmCaPjWvrOcNlg
	Ojt2R2qQrU9NX+1ZBNiPKkqeUQK2u2wNC9rjSGClu5839L+ci+5hxycOJEmRiSDiuD0BSFiT5PAhz
	Sr/dOcLci16gjRzxyRjJrfU7SAhSe9OAHQJbxayLa1qmLUEfQyX+f/MFOkTp8KSiVtC6iOxl38Ygu
	EfPG33xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29ro-007Dei-1V; Fri, 17 Jun 2022 11:10:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29pC-007Cdl-Eq; Fri, 17 Jun 2022 11:07:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FAF4660179B;
	Fri, 17 Jun 2022 12:07:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655464057;
	bh=wxT88oQqGVwEkp3rg/ZJOnJEaa8bNQoe2qAp5DUjU20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OwOtV4QKYzMhyWoOLuoOZtDsR2x7X7Hoip5KQI4g5onHO1s2ghuqvRDlyiie0cSvT
	 SOczvohcA+6oHOW9tRb0fqbubBpiZdv4V5xHknoMGGn+gBpx901ja3SuGG9KuVO+X7
	 Tm8ZAl+a4BZm3ml9h7dHsKpmP57dx/kzHo2Nn8RLErPGrYft7ZdfceQstQ/+Q4bQFs
	 Fu/qrghUB6OUBZUu5xQMRvKk8E1PyGsWhGEQhij6RhBLJyPGss+dyOdrMwen5JM+cS
	 kEjpSh8RDhwLJnleozSTdD+U1/iEBupY1bNn6XhxTQM/cuZfSSrq+YJoGb72OMes4j
	 uHM8urC7LRx3w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC and keys
Date: Fri, 17 Jun 2022 13:07:27 +0200
Message-Id: <20220617110728.90132-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617110728.90132-1-angelogioacchino.delregno@collabora.com>
References: <20220617110728.90132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_040738_711696_F504E457 
X-CRM114-Status: GOOD (  10.07  )
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

The MT6331 PMIC provides many sub modules: regulators, audio
codec, LED controller, keys, RTC and some GPIOs.
It is always paired with a MT6332 Companion PMIC, which provides
thermistors, WLEDs (display LED backlight), secondary AP cluster
regulators, modem clocks, battery charger and fuel gauge.

Add the necessary compatibles to start implementing the basics.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 293db2a71ef2..500275d2c2b4 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -29,6 +29,7 @@ Optional subnodes:
 - rtc
 	Required properties: Should be one of follows
 		- compatible: "mediatek,mt6323-rtc"
+		- compatible: "mediatek,mt6331-rtc"
 		- compatible: "mediatek,mt6358-rtc"
 		- compatible: "mediatek,mt6397-rtc"
 	For details, see ../rtc/rtc-mt6397.txt
@@ -52,8 +53,10 @@ Optional subnodes:
 	see ../leds/leds-mt6323.txt
 
 - keys
-	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+	Required properties: Should be one of the following
+		- compatible: "mediatek,mt6323-keys"
+		- compatible: "mediatek,mt6331-keys"
+		- compatible: "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.35.1


