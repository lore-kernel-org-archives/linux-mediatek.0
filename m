Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505BCFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWad4mvVdtgpAklA0NUqnK9RzmPaXG2g9lgsXi99zSI=; b=IiOfXyc9Icb5C5
	5WnLP8X+TUVcE3mY0D+rHwsNSG9seyI3jV/h5w8LsXTGFfPK2nGC05Qh6HETE3vXSQCzBzlXuTd+U
	CfkvcnSYg9PcE4usAiByrJezU43L56X4hbG81wZdTU0yDDAKXseN2Fdyhctg349AlIj0RlJcvtIN6
	wdQdUtsAJbqmB/PhbJieYtyyR4OItmQjlf7ad7aC5wz4+EcDmG6JudTptPYMTC3FS85ENlGqBDMIM
	rWs9ygu14gsUX+7TpISX5Ue0bZE9Q4d0txFCqKZwRaAmnMXkJyWc2JO29NzPP6pnLKkso070/QmoJ
	Q5cu/diMrJoGAreFVXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTLO-00000000EgN-3Brj;
	Sun, 06 Oct 2024 15:38:50 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTHd-00000000E9t-1jQJ;
	Sun, 06 Oct 2024 15:34:59 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 52737100686;
	Sun,  6 Oct 2024 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728228895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWad4mvVdtgpAklA0NUqnK9RzmPaXG2g9lgsXi99zSI=;
	b=HKUABLJHoAz5SRjgY0pRJu8+RYC3KnH9d7e0cf8Xz6Cgx6HotlM2ML925NxsOGNpGFJ1Q8
	/Ehrk0kLzCpHTApBUTCH1IHvFY4QRt+qgFVu315+92/6gF3XQ9rEjk6drO/2zNdVcE+rtm
	RySndsd8V9B05mH8nS7ElRgFdg5W8Vo=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7FC4E100546;
	Sun,  6 Oct 2024 15:34:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: add support for mt7988
Date: Sun,  6 Oct 2024 17:34:46 +0200
Message-ID: <20241006153447.41377-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241006153447.41377-1-linux@fw-web.de>
References: <20241006153447.41377-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 90dd9763-464e-42af-a560-77d9e9212177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_083457_598176_EF099EFE 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add support for mmc on MT7988 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 89018b6c97b9..6d5afe51a61d 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -571,6 +571,19 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt7988_compat = {
+	.clk_div_bits = 12,
+	.recheck_sdio_irq = true,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.enhance_rx = true,
+	.support_64g = true,
+};
+
 static const struct mtk_mmc_compatible mt8135_compat = {
 	.clk_div_bits = 8,
 	.recheck_sdio_irq = true,
@@ -629,6 +642,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
 	{ .compatible = "mediatek,mt7986-mmc", .data = &mt7986_compat},
+	{ .compatible = "mediatek,mt7988-mmc", .data = &mt7988_compat},
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
-- 
2.43.0


