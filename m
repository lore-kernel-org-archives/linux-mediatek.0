Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EE3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cebit43FlajBMkBR7mLrM1TjKHYg2gvOrW1fB7J2Qj4=; b=AisZ0Du85o2Csc7RyHpl4fxsHn
	mBeVC2wfrhiOs1WfSwS8VPKtNcAkEo8VhOa5LjDmwq1kpetq95QsTx56fC0cwICSPIhb/NeBbYsts
	EHbOh/Zivh4D2HC01Hj0VZkUyHS5W0oej2Q3rudoS5+ED4vfjJLuR0LO87U5OsJ1+U2rXP16TcC/z
	aQG76gDjNKuTq1Bam0gUdu0SQboG1jZ2Hd3AS4RRLwZUWB3sMvcFhjrKgHk5abrzDKFsIjPMvTa1x
	3p8PZPJmudBhGDaWcEQFh+2vDLsv9r3kfupj3Z8E6tznvmH7/CIsEc130N//pUyGBau7oKQRMw6Tg
	ycDT9PHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTp-009402-N5; Thu, 09 Mar 2023 10:26:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTf-0093xA-4s; Thu, 09 Mar 2023 10:26:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13C866603054;
	Thu,  9 Mar 2023 10:26:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678357583;
	bh=gUunv/EcOHFtFDQHosEszweFGXYKJo+Qxwm9e5tgDK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFQjt7Nt3VV33wLDJnIDEHUq9cZ64qD7KMR68RpQhK0+8xOCXDcDLbyc6agKE7Crr
	 Too/qCOHCpxUcafXfijL8czDm5WxJVkGbjP5bOrUMohi2AUO0N0ppjKWWeHacFFkr/
	 Y9Y7cZATRKWRfLtvtUWYfdcA+egpN2uZLlzsmJpejqoKLH8Ybjdj1GHeaMfjUQFOMq
	 pVC++sat6e1YO5tlS7dU108rmzHYMqJNKiLhUPbKndu5V5bfexrTUufKQV0GiPp3bG
	 hCktQr4fntPXZ/MAlnctsTUamAsXxVGhy8QfPr3KI3ghTIxDLFQjdyWjtPJqufRO5Z
	 tpeEcldG/hjKA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/3] soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
Date: Thu,  9 Mar 2023 11:26:18 +0100
Message-Id: <20230309102618.114157-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
References: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_022627_607679_3578BBC2 
X-CRM114-Status: UNSURE (   9.98  )
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

Add MMSYS support for the MT6795 SoC using the same mmsys routing
table as MT8173 as, for the currently supported usecases (DSI0, DPI0
with no WDMA), these are identical.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index c4eeab99756b..9619faa796e8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -41,6 +41,14 @@ static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
 	.clk_driver = "clk-mt6779-mm",
 };
 
+static const struct mtk_mmsys_driver_data mt6795_mmsys_driver_data = {
+	.clk_driver = "clk-mt6795-mm",
+	.routes = mt8173_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8173_mmsys_routing_table),
+	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 64,
+};
+
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
@@ -416,6 +424,7 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt2701-mmsys", .data = &mt2701_mmsys_driver_data },
 	{ .compatible = "mediatek,mt2712-mmsys", .data = &mt2712_mmsys_driver_data },
 	{ .compatible = "mediatek,mt6779-mmsys", .data = &mt6779_mmsys_driver_data },
+	{ .compatible = "mediatek,mt6795-mmsys", .data = &mt6795_mmsys_driver_data },
 	{ .compatible = "mediatek,mt6797-mmsys", .data = &mt6797_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8167-mmsys", .data = &mt8167_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8173-mmsys", .data = &mt8173_mmsys_driver_data },
-- 
2.39.2


