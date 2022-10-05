Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdH7bOuHp/Col+T5Y88CX8K7kvBi7XI+b0NGlOW3+sU=; b=Z5pjMfahvf7yPGmzK33+MdX4WX
	MrWgnrbmgxohoQ+HnT8hXKv/2NtrWpBXDn2LAt9rRGsyT9+sGe1VrPnFvXIstwm48/SMEM/3MMfEo
	v35mHHJH7UX7sd76/rKNAGX1IBCvbqsXH/O/tqOThe5USUcYk4CP43V0AjP5dAqg3dXMcdoNQnn+E
	irAVfhy/QB+jB+uqgeIt/z9FhHCk/QKsU5YDvCu+jtFWum3hrIqUttxwdfcC++n9ARBglFwRyHHlw
	0MSEPd57vXOKb27YGpa2OgdT1VMVh0x17hj9D4+UKI3QOBzui6uBkN86x2ySEOAQryAXMbQkP4BrQ
	VK0sNMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2ht-00Dp29-TP; Wed, 05 Oct 2022 11:36:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gf-00DoR2-7u; Wed, 05 Oct 2022 11:35:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F60F66022FA;
	Wed,  5 Oct 2022 12:35:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969740;
	bh=if4mHZlg0/8K/oXjlgWAfzFCWC8dK9Y0YQUt5Usd1Uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPKWrb0oJD87RtU0bt8UP9pWlC9HER2kPEpB6PeIOfbzVF3/FJBqHeFwta4obPYZl
	 sa3y2B46hc6jOkI6MqwH6M4jB3kOXE/sndAdtWad33gw4guORjeBgKs7aFadiYk+vg
	 vymXwGYNztwYL2MUV89hvtx052E15GnNBz1YqJqTateNJWyIvq9AEU/5KnHK0H6QRU
	 cfhIHFfQcoN9d1VgMM7ezRCDARttr0XiAJMlZYFadAukcdBNgJbJn3gNwfD03GUbnz
	 XISzanY29Nq5zhIkyOjOgsPu0fbsGo4NUNzyX9rIqWOw8F0nyBTWuJxmidHKI9oPTl
	 iHVcQqbtSZo+g==
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
Subject: [PATCH 5/5] watchdog: mtk_wdt: Add support for MT6795 Helio X10 watchdog and toprgu
Date: Wed,  5 Oct 2022 13:35:17 +0200
Message-Id: <20221005113517.70628-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043541_453268_A62A36F0 
X-CRM114-Status: GOOD (  10.71  )
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

Add support for the toprgu reset controller and watchdog for the
MediaTek MT6795 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e97787536792..5fa42b7d4b4d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -78,6 +79,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6795_data = {
+	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt7986_data = {
 	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
 };
@@ -426,6 +431,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
-- 
2.37.2


