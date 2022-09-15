Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA7EC6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r6C2XQzJRsyZOGb8lW2SyUHumL/K1sKkiB5BsdZ9CE=; b=HNm/+ENRypQbtrn3vht25yLamw
	6U6Jr2jUVZQZm1Yp7HnX0TGfzJStyMt3bd7i30yz2Sh+Um4AUqfDWHKscgUiLAFY8rSvzCpFdOipS
	OBT7euHvpevo6BxO/YCxico0YMHsiHgXbYiJIlGg+MgTzdTUK716BhP8oGHjBNF0UuVw4METptijk
	qsmjanJ2Vago/TSfClmCdwWQdsc6mmXuWrZB3mC1T6/jClBhS0ooF14QfBieuZEKQxHu0BOSu2Omv
	Ycxu+jc4xJykUuu9hyclpPRshXM5ey8LO20+Q12UvakNV2+Mtrw2bxFvw1oX+1ApvtB/1+Ozd4ZwC
	Tg5v8c7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkyU-004zNV-PP; Thu, 15 Sep 2022 09:15:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkv6-004t7J-8U; Thu, 15 Sep 2022 09:12:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACF846601FC7;
	Thu, 15 Sep 2022 10:12:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663233146;
	bh=/0hxytC5IdEV5zwBBnvu5ZfC6n4vqovx/9pJ7hE+aMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPTDGcy+4Ve1DjYXxC3eFf7MIwZ84qJe2sE1p11OcZU5S/+fACvlyCqwpCFS+RE00
	 7yWKVVQdsGa3qyG6usy9dBZS929sEBJgDGDopnDONsUNEI1UszkVkaNL0jmgMRMrrd
	 FtqTz+kXnfF8NS8JWJ8qdXpTKdhHMYjRFOQM7FiiPftQzwPq/zhfBXzBZqBK4PEmBG
	 6f/3goaw/wfIdm65+XS+ZoVqNEafUG+AHLRqyspPZNYx0MyVKnRNg1ImvbIT2Dylei
	 jdATSLCD5fXlvx65n+DrPUEsynEaJM7kGLazLIeh7mOLzMhBEZYgjYl1RCuomYOsJw
	 KLnjQxMxdHHvQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/7] leds: leds-mt6323: Add support for MT6331 leds
Date: Thu, 15 Sep 2022 11:12:12 +0200
Message-Id: <20220915091214.59673-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021228_505540_BFF7029B 
X-CRM114-Status: GOOD (  10.22  )
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

Add the register offsets for MT6331. The hwspec is the same as MT6323.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/leds/leds-mt6323.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 26f06452a860..16b5ac60a487 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -531,6 +531,17 @@ static const struct mt6323_regs mt6323_registers = {
 	.isink_en_ctrl = 0x356,
 };
 
+static const struct mt6323_regs mt6331_registers = {
+	.top_ckpdn = (const u16[]){ 0x138, 0x13e, 0x144 },
+	.num_top_ckpdn = 3,
+	.top_ckcon = (const u16[]){ 0x14c, 0x14a },
+	.num_top_ckcon = 2,
+	.isink_con = (const u16[]){ 0x40c, 0x40e, 0x410, 0x412, 0x414 },
+	.num_isink_con = 5,
+	.isink_max_regs = 4, /* ISINK[0..3] */
+	.isink_en_ctrl = 0x43a,
+};
+
 static const struct mt6323_hwspec mt6323_spec = {
 	.max_period = 10000,
 	.max_leds = 4,
@@ -543,8 +554,14 @@ static const struct mt6323_data mt6323_pdata = {
 	.spec = &mt6323_spec,
 };
 
+static const struct mt6323_data mt6331_pdata = {
+	.regs = &mt6331_registers,
+	.spec = &mt6323_spec,
+};
+
 static const struct of_device_id mt6323_led_dt_match[] = {
 	{ .compatible = "mediatek,mt6323-led", .data = &mt6323_pdata},
+	{ .compatible = "mediatek,mt6331-led", .data = &mt6331_pdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mt6323_led_dt_match);
-- 
2.37.2


