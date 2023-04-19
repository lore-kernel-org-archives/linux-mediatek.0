Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE32C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqPFLO+AVaKo1E1p6za4vyYX+tIhZ1uK9BaVGfdpMxo=; b=M9cW3LVil6LY6ybYKvezrdB9Oe
	T+PhUcrCElEg2dRcIWscKzsmr36/HamRjSfmklm5r9Jim15ogi9BVKiDKN8iJHaypxHj0ChvvmtfO
	kfUEo7LlOR1bXQuV2zK9S3Es+TwlBS+wvGTBnn3mGRElsr2qIyyOOtmIM2/wyvYnyjLK4OFMbhXS1
	SPluqCjTIJN+s2nYeDlkAZzQjyHy77ak8zcCIwHKmp4m3Wz0AfpKuUxaIx4oy9X3nZe1DgAahrb2B
	QW1e3XGMdYyExUCceMD4o47wD06cGoOj44hUasaZJw9o6TM57FH1gxKhiYuGj9mOZAvOgi6qLMlvi
	H2I42Y5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDRJ-006Fs6-1D;
	Wed, 19 Apr 2023 19:26:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDRG-006FrI-2L;
	Wed, 19 Apr 2023 19:26:00 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppDRF-0003xn-1W;
	Wed, 19 Apr 2023 21:25:57 +0200
Date: Wed, 19 Apr 2023 20:25:51 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] pwm: mediatek: Add support for MT7981
Message-ID: <e22d8e66558f094b544aa208c722a7f88fd0bde1.1681932165.git.daniel@makrotopia.org>
References: <cover.1681932165.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681932165.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_122558_766492_136F30AD 
X-CRM114-Status: GOOD (  16.72  )
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

The PWM unit on MT7981 uses different register offsets than previous
MediaTek PWM units. Add support for these new offsets and add support
for PWM on MT7981 which has 3 PWM channels, one of them is typically
used for a temperature controlled fan.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/pwm/pwm-mediatek.c | 54 ++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 5b5eeaff35da6..2bfb5bedf570b 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -34,10 +34,14 @@
 
 #define PWM_CLK_DIV_MAX		7
 
+#define REG_V1			1
+#define REG_V2			2
+
 struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
 	bool has_ck_26m_sel;
+	u8 reg_ver;
 };
 
 /**
@@ -59,10 +63,14 @@ struct pwm_mediatek_chip {
 	const struct pwm_mediatek_of_data *soc;
 };
 
-static const unsigned int pwm_mediatek_reg_offset[] = {
+static const unsigned int mtk_pwm_reg_offset_v1[] = {
 	0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
 };
 
+static const unsigned int mtk_pwm_reg_offset_v2[] = {
+	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x1c0, 0x200, 0x0240
+};
+
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
@@ -111,7 +119,19 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 				       unsigned int num, unsigned int offset,
 				       u32 value)
 {
-	writel(value, chip->regs + pwm_mediatek_reg_offset[num] + offset);
+	u32 pwm_offset;
+
+	switch (chip->soc->reg_ver) {
+	case REG_V2:
+		pwm_offset = mtk_pwm_reg_offset_v2[num];
+		break;
+
+	case REG_V1:
+	default:
+		pwm_offset = mtk_pwm_reg_offset_v1[num];
+	}
+
+	writel(value, chip->regs + pwm_offset + offset);
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -285,60 +305,77 @@ static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt6795_pwm_data = {
 	.num_pwms = 7,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt7623_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = true,
 	.has_ck_26m_sel = false,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt7628_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = true,
 	.has_ck_26m_sel = false,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.num_pwms = 1,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_ver = REG_V1,
 };
 
-static const struct pwm_mediatek_of_data mt8183_pwm_data = {
-	.num_pwms = 4,
+static const struct pwm_mediatek_of_data mt7981_pwm_data = {
+	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_ver = REG_V2,
 };
 
-static const struct pwm_mediatek_of_data mt8365_pwm_data = {
-	.num_pwms = 3,
+static const struct pwm_mediatek_of_data mt7986_pwm_data = {
+	.num_pwms = 2,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_ver = REG_V1,
 };
 
-static const struct pwm_mediatek_of_data mt7986_pwm_data = {
-	.num_pwms = 2,
+static const struct pwm_mediatek_of_data mt8183_pwm_data = {
+	.num_pwms = 4,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = true,
+	.reg_ver = REG_V1,
+};
+
+static const struct pwm_mediatek_of_data mt8365_pwm_data = {
+	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_ver = REG_V1,
 };
 
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_ver = REG_V1,
 };
 
 static const struct of_device_id pwm_mediatek_of_match[] = {
@@ -348,6 +385,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
+	{ .compatible = "mediatek,mt7981-pwm", .data = &mt7981_pwm_data },
 	{ .compatible = "mediatek,mt7986-pwm", .data = &mt7986_pwm_data },
 	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
 	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
-- 
2.40.0


