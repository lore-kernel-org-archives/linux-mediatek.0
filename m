Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E51C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YIiUZlTrjdPAMVHM7klpVqQezdSDroJaCTYC5nvEj0=; b=bJquJhT1yHGG5f
	VGFNCrAhmcuH52VZVZCurDYw+zt5V9hwLUVNMtnxhV+/DF1Gz/w6e40Fl20YrAd6wCu+hnZnrbGsW
	8AOm9ElO8KZCcraELywBHbg2sgwOwswhqUxLCfSGiJC9z4TCXIutYrDNu6p2oeQtMv0tSKOddp9uG
	437QSKYRuCdAQfBjFSuYCTSnJ/YaABeNQw0/mQOpucuBsJW81k/lk0ihQFKIqxJJGgqJhT5g0yf0b
	tNPZg9Hv/dsburdVlX4BE0gUj3mKmjxVnARFgJhI5NE8qE8jGrkWb5SMhrPK1mh0FiZ3kOWIMmdeO
	NSaauyBR9ADTbbhtRmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD8J-00Doou-II; Sat, 08 Oct 2022 16:57:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD7s-00Doah-Rv; Sat, 08 Oct 2022 16:56:38 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 156D310094F;
	Sat,  8 Oct 2022 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665248195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9YIiUZlTrjdPAMVHM7klpVqQezdSDroJaCTYC5nvEj0=;
	b=km4yddHkV4sqnpW12lvMpNkYt0xlfCd/XoPJkbX2q5TzkkJ15fP0GURXfYijVVwgWvcFqM
	J7lkGHlJzS9GlSneVrjbcFOb63GQGMrOLBkFUop/w/ijXHNC8YBaMnqZNRqqIgSZFbcXbx
	vzZ8mV1EmsEEeu0Zuqz5ZJ08ksUE5ag=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 5DE3E80098;
	Sat,  8 Oct 2022 16:56:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] mmc: mediatek: add support for MT7986 SoC
Date: Sat,  8 Oct 2022 18:56:27 +0200
Message-Id: <20221008165627.114782-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221008165627.114782-1-linux@fw-web.de>
References: <20221008165627.114782-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8ce3f27c-43c1-411d-b25c-a3173c96a672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_095637_074372_6A76DF14 
X-CRM114-Status: UNSURE (   9.21  )
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


