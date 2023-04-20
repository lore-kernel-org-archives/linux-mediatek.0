Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49AAC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLpSYAegpxY7NjaX/YgkK/7RMMj/JIX8fCYP8Mrk+Dk=; b=cTllDxx0gV6LZsAJ+TKxQ9Porz
	NwxphtpFfZNfL6C36zXHfPQbfFlLa/OcrUpHSUxH6eii1obykfnOF5PG/GopUeAGPRxfLVvvRn38D
	rlmvHNoKKtHiMmIlVBEeH0M6CxAT9oOA8S9P4v630W+AboE0xutwdpERR3EPTazcUTGV9rTSKI2Pz
	juieImUn4wj38HBjRpY+AZhA/se2XtJunhi87bueJkT3VMtf0i1Fi9ZPnXAEuLPdY2CY4AiVkUbCf
	fdV4mPFxoozX0j5/f0iEFwnkYxVriIy/gELDouK2JLgmoiSVimLnYb+5utautFWzvsdWvGsZYWGuv
	a3IK9SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTWb-0085WU-2J;
	Thu, 20 Apr 2023 12:36:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTWY-0085Us-35;
	Thu, 20 Apr 2023 12:36:32 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppTWX-0005XF-2E;
	Thu, 20 Apr 2023 14:36:29 +0200
Date: Thu, 20 Apr 2023 13:36:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH v2 2/2] pwm: mediatek: Add support for MT7981
Message-ID: <7c6e31c844642c199f223f4229a04a37b57a34f3.1681992038.git.daniel@makrotopia.org>
References: <cover.1681992038.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681992038.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_053630_995060_E291C6C3 
X-CRM114-Status: GOOD (  15.12  )
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
Changes since v1:
 * use pointer to reg_offset instead of u8 reg_ver and if-else

 drivers/pwm/pwm-mediatek.c | 39 ++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 5b5eeaff35da6..7a51d210a8778 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -38,6 +38,7 @@ struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
 	bool has_ck_26m_sel;
+	const unsigned int *reg_offset;
 };
 
 /**
@@ -59,10 +60,14 @@ struct pwm_mediatek_chip {
 	const struct pwm_mediatek_of_data *soc;
 };
 
-static const unsigned int pwm_mediatek_reg_offset[] = {
+static const unsigned int mtk_pwm_reg_offset_v1[] = {
 	0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
 };
 
+static const unsigned int mtk_pwm_reg_offset_v2[] = {
+	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x01c0, 0x0200, 0x0240
+};
+
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
@@ -111,7 +116,7 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 				       unsigned int num, unsigned int offset,
 				       u32 value)
 {
-	writel(value, chip->regs + pwm_mediatek_reg_offset[num] + offset);
+	writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -285,60 +290,77 @@ static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt6795_pwm_data = {
 	.num_pwms = 7,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7623_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = true,
 	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7628_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = true,
 	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.num_pwms = 1,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
-static const struct pwm_mediatek_of_data mt8183_pwm_data = {
-	.num_pwms = 4,
+static const struct pwm_mediatek_of_data mt7981_pwm_data = {
+	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v2,
 };
 
-static const struct pwm_mediatek_of_data mt8365_pwm_data = {
-	.num_pwms = 3,
+static const struct pwm_mediatek_of_data mt7986_pwm_data = {
+	.num_pwms = 2,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
-static const struct pwm_mediatek_of_data mt7986_pwm_data = {
-	.num_pwms = 2,
+static const struct pwm_mediatek_of_data mt8183_pwm_data = {
+	.num_pwms = 4,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v1,
+};
+
+static const struct pwm_mediatek_of_data mt8365_pwm_data = {
+	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
 	.has_ck_26m_sel = true,
+	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct of_device_id pwm_mediatek_of_match[] = {
@@ -348,6 +370,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
+	{ .compatible = "mediatek,mt7981-pwm", .data = &mt7981_pwm_data },
 	{ .compatible = "mediatek,mt7986-pwm", .data = &mt7986_pwm_data },
 	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
 	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
-- 
2.40.0


