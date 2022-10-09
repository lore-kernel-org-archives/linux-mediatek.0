Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A027C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvX5JZ3bRps1L5sLKCfsTQTlmDO/mXO5YN2RtdaxIBM=; b=AAclPnZBlx5B6O
	59B9YXR1BewGrs2SObQXw3f+7rJuuDXBhmcIY+TubpRfYBYX/DWryrRi7lk6lAxTemjw9AOZeaEg8
	pFd9gSAFfD2fC5e8ecjULt5CY2bqkrCv6/hPpcMjIKSqOVnsl15p9JT57Q6grGGmxYhrWy+sr2Yo0
	r4/z4wDjal1EVkwOY/HOxqIQgxxl1lHRVQNubMKQqK4x5cwhtykQNRaugCY7Y3/8yZA/Km9KOdVYT
	GXMqraclS8Ikc6CeF2PO7UCUz4NwWTI+7jlOAXk9u97fgGLi6NJTfUyG6NxEC88fZCmNAKMbDmYIe
	wSx5n/4azLLuNEnQfrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMv-00FHZ7-Oy; Sun, 09 Oct 2022 10:17:13 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMU-00FHTQ-5T; Sun, 09 Oct 2022 10:16:48 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 0F4C25FF91;
	Sun,  9 Oct 2022 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665310601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvX5JZ3bRps1L5sLKCfsTQTlmDO/mXO5YN2RtdaxIBM=;
	b=MOdHhfKXcvq4XKXfTBYUtQIVY8JT5DNuGCzThIZ4oxr311CtMPUbYozvXeGiWbpVX/01dF
	iYHVXAWanNasveWEuBgthHPS5D73E2LQJgKaGA+mT+7a9bQv50gBET3+8A9/yaAHYJiQAb
	QsePUUY3LBmUHTm2krLE2XgpbhzA41Q=
Received: from frank-G5.. (fttx-pool-217.61.145.235.bambit.de [217.61.145.235])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 646791005FA;
	Sun,  9 Oct 2022 10:16:40 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] i2c: mediatek: add mt7986 support
Date: Sun,  9 Oct 2022 12:16:31 +0200
Message-Id: <20221009101631.82380-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009101631.82380-1-linux@fw-web.de>
References: <20221009101631.82380-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a3c6661a-5cf1-4138-9773-e2eb642628db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_031646_415979_90307A56 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add i2c support for MT7986 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index fc7bfd98156b..d80e59340d97 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -431,6 +431,19 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.max_dma_support = 33,
 };
 
+static const struct mtk_i2c_compatible mt7986_compat = {
+	.quirks = &mt7622_i2c_quirks,
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 0,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.max_dma_support = 32,
+};
+
 static const struct mtk_i2c_compatible mt8173_compat = {
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
@@ -503,6 +516,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
+	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
 	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
-- 
2.34.1


