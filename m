Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42CBC04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YIiUZlTrjdPAMVHM7klpVqQezdSDroJaCTYC5nvEj0=; b=JWgtiDkd3rgDyF
	QO5kf6LRF/x64bfwuP6nBzhVIiWvoanOsr5tc81bQd1Rw8iH6kqzjwSYt01dsH8jEfT5Xi2tZmJIr
	ZofoArdu7pBZXa9n/l1YAMpvfWRdIaP3APqotX86q1pQ65yb6q7/f4BLtf0xQOZPvmH4SfOudVXNm
	9Sfz/yQYYlNJ5Ecf6qVTwk8apyoDSC2sdPMcKbHN7pJGXP4hU9cvPhXT0FHv1OWeIhzu76ngRMTlY
	XfHMS5ihEpND/bW2RlrZH4qo4hyGqHP9Ck9yofSTQXplUGZwJVc4ZVrVLXD/Ea6VH2lMV26kE3QRF
	urHG42VV2y74WBrYclRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omASx-00BtU2-6f; Sat, 22 Oct 2022 09:06:51 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omARq-00Bsxe-Aw; Sat, 22 Oct 2022 09:05:44 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 633D23FE7B;
	Sat, 22 Oct 2022 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666429538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9YIiUZlTrjdPAMVHM7klpVqQezdSDroJaCTYC5nvEj0=;
	b=lHgZAK25MZU9KEAKj69t9BDdXuWpdeF4092Cc0t/isPenPxhZInA9DSsR6N1xogTdJe1q9
	s+kpaGBNnPDIRN/MA1mSma3kdpCOKr1e9JXQL9B1RlRaE5Xq/G4lfyz/cV7OhXmUFzsQ8K
	d0i/pGO/stnONSn1LmzAiAcjbdTb2z4=
Received: from frank-G5.. (fttx-pool-80.245.73.148.bambit.de [80.245.73.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 98940405AF;
	Sat, 22 Oct 2022 09:05:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/5] mmc: mediatek: add support for MT7986 SoC
Date: Sat, 22 Oct 2022 11:05:27 +0200
Message-Id: <20221022090530.16265-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022090530.16265-1-linux@fw-web.de>
References: <20221022090530.16265-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: beee7ae5-5b66-4462-bddd-cc2fb99e2c29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_020542_539028_F5F16BC7 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Adding mt7986 own characteristics and of_device_id to have support
of MT7986 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index df941438aef5..3f7f3a1e0df8 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -552,6 +552,19 @@ static const struct mtk_mmc_compatible mt7622_compat = {
 	.support_64g = false,
 };
 
+static const struct mtk_mmc_compatible mt7986_compat = {
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
@@ -609,6 +622,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt6795-mmc", .data = &mt6795_compat},
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
+	{ .compatible = "mediatek,mt7986-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
-- 
2.34.1


