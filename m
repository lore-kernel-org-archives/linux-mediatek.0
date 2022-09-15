Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261D9ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cljGVpY6wAAn+SXkl4LtIqXnMTsuG1FUYuTwO8joc2Q=; b=agU+iwVUIQW1h+S4AuwHizykNO
	TTwMUvoYzOzbUG+MfyMtIY/swDNZI3ruvEt60yBX/8lYXpNPYyRwhRWI+zGC82p7coAwm69uCK2qm
	XhN9YCoepwvDEi6qxXlEjqzCMXIR0qa46GtkclyAYh8ur+wdiii31LVwCErRkBC1dsL7bq45Ob7mB
	p+tV1+uPzrV2X8pNOF1uDHye6+eGcDDMnJXAim4EheyJBUmZiKxLJCEze98oAhwmrqEkq55ZJizJN
	5BR7Ij7EfBjg7nNRzMxAh0vbJ0AeIiz0hOw5fImPk7UfprEnDTrlMRF6l+Xn1cupa9yCbR7iVYIcs
	dfKzzVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYnjR-008F5K-Jt; Thu, 15 Sep 2022 12:12:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYngQ-008Cez-MJ; Thu, 15 Sep 2022 12:09:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C22C56601FC5;
	Thu, 15 Sep 2022 13:09:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663243769;
	bh=RK8hmnYA9/Ua/srvkkHpq1mJKE2UO3eoI+MSMmIYKB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCZJp/IOyMypPw8N/qUi9fJT0Krp1rDKzMSHjICELzdlUL4h/nzpMg7gXLJYarmwN
	 SUepuoiK6cRqq6MVxnNgPTjOj7djmsaI3lHs9m4WZobEuZFrvv6lRcR162qpalOqCc
	 kD0XYHoB2BBmlnrjtGxVEvE1JxPjDK5sr2dJQYhvWoNxq+hkhJPM0IA351M+9MU4rx
	 yuDR3XkYYmcMq3nekkPRBIwyqn0Wd8ugdSh+26IdkPQ5gzhh+roNX/DUP4cUbj+fJN
	 nQM3wQnU379YAHeDQ6nmf31qlmPdT7AlUXMaoqxM0tHv80n4RSKF9zs8Cc5xhpEFiz
	 28ILISpWrCt9A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Add support for MT6795 Helio X10
Date: Thu, 15 Sep 2022 14:09:23 +0200
Message-Id: <20220915120923.86038-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
References: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_050931_018277_D01374A7 
X-CRM114-Status: UNSURE (   9.43  )
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

Add support for MT6795 with a new compatible string and platform data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 572eb5d48813..df941438aef5 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -513,6 +513,19 @@ static const struct mtk_mmc_compatible mt6779_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt6795_compat = {
+	.clk_div_bits = 8,
+	.recheck_sdio_irq = false,
+	.hs400_tune = true,
+	.pad_tune_reg = MSDC_PAD_TUNE,
+	.async_fifo = false,
+	.data_tune = false,
+	.busy_check = false,
+	.stop_clk_fix = false,
+	.enhance_rx = false,
+	.support_64g = false,
+};
+
 static const struct mtk_mmc_compatible mt7620_compat = {
 	.clk_div_bits = 8,
 	.recheck_sdio_irq = true,
@@ -593,6 +606,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
+	{ .compatible = "mediatek,mt6795-mmc", .data = &mt6795_compat},
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
-- 
2.37.2


