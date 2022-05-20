Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC8C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9MqqnRRQLfOvxlh6OhU1WxmliHJZp/vaOsSYsg4Rs4=; b=TOeNfpDLjAdyhq
	86Wvc/wLDHMm/wLKz8/38UXq186W1uqF1NDSe49qMjolS4DKvWNL1LZO+hHE+8lI/ptv47cltcZVB
	i/JEt0S0h4lYpk/81HwHS0t1x7nNRMYmxUYyeCBafuQkv2b36XHwiVO0rvSTgCExV3ljymXj56Jmf
	0plb+Ttg462WLd/YagWB/IxJlfuxCOMp2N1cjuaWV6sn93npyjTu50BugvfdWCs86he084/2W8k3t
	oee3i3zWcs7OI5Fvt/ctrUug9Xi+rmWciy1yo2obc3vAmSdkDVZv811NFgbYXz/2IYCzvN4a6/leN
	NemcOOx3JXHCsDfDjTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1yI-00CPeo-R3; Fri, 20 May 2022 12:43:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1w2-00CO10-3v; Fri, 20 May 2022 12:40:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 11F6D1F462BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050446;
 bh=FCqAGYG3PfDArscmLdw2+rXDVhbDbana6dJL9Ndg2RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cz+WV2Mx1DkB5b0z6JeDfZexqx4csHtIhWbrpkSlQui0wFWR3B7ozftz4BvoJHzDC
 zR8i0VYE0b1wLWZqbd/xrsa/wSdJI1NU6nR7OalNi/0cgbakLC7aZe8acI0m1Obhwv
 suRskK41KLULIf12pDDy4vtYRN3Kb+ptfz0HQnePs7uqM01eQT00o12mEMPP9MfNjG
 fGrZBHY/7Tbqg5RmnZXhTPus7+VOH5vKxZFfal2wgJ3WJP6u2+XDPMCA5hv5TZQf4C
 XFId2BV06XAVDELwtPKlXpHKEuOhpn2jLni0HKcmBKI6NJ4k66ZGNJIe2X4MI10QfL
 7XkF5tuAwsnyw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/
 MT6332 companion
Date: Fri, 20 May 2022 14:40:37 +0200
Message-Id: <20220520124039.228314-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054050_390235_E8ED236F 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the MT6331 PMIC and for its companion MT6332 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 8a4bb6392c3a..f2fe51feb237 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -170,6 +170,40 @@ static const u32 mt6323_regs[] = {
 	[PWRAP_DEW_RDDMY_NO] =		0x01a4,
 };
 
+static const u32 mt6331_regs[] = {
+	[PWRAP_DEW_DIO_EN] =		0x018c,
+	[PWRAP_DEW_READ_TEST] =		0x018e,
+	[PWRAP_DEW_WRITE_TEST] =	0x0190,
+	[PWRAP_DEW_CRC_SWRST] =		0x0192,
+	[PWRAP_DEW_CRC_EN] =		0x0194,
+	[PWRAP_DEW_CRC_VAL] =		0x0196,
+	[PWRAP_DEW_MON_GRP_SEL] =	0x0198,
+	[PWRAP_DEW_CIPHER_KEY_SEL] =	0x019a,
+	[PWRAP_DEW_CIPHER_IV_SEL] =	0x019c,
+	[PWRAP_DEW_CIPHER_EN] =		0x019e,
+	[PWRAP_DEW_CIPHER_RDY] =	0x01a0,
+	[PWRAP_DEW_CIPHER_MODE] =	0x01a2,
+	[PWRAP_DEW_CIPHER_SWRST] =	0x01a4,
+	[PWRAP_DEW_RDDMY_NO] =		0x01a6,
+};
+
+static const u32 mt6332_regs[] = {
+	[PWRAP_DEW_DIO_EN] =		0x80f6,
+	[PWRAP_DEW_READ_TEST] =		0x80f8,
+	[PWRAP_DEW_WRITE_TEST] =	0x80fa,
+	[PWRAP_DEW_CRC_SWRST] =		0x80fc,
+	[PWRAP_DEW_CRC_EN] =		0x80fe,
+	[PWRAP_DEW_CRC_VAL] =		0x8100,
+	[PWRAP_DEW_MON_GRP_SEL] =	0x8102,
+	[PWRAP_DEW_CIPHER_KEY_SEL] =	0x8104,
+	[PWRAP_DEW_CIPHER_IV_SEL] =	0x8106,
+	[PWRAP_DEW_CIPHER_EN] =		0x8108,
+	[PWRAP_DEW_CIPHER_RDY] =	0x810a,
+	[PWRAP_DEW_CIPHER_MODE] =	0x810c,
+	[PWRAP_DEW_CIPHER_SWRST] =	0x810e,
+	[PWRAP_DEW_RDDMY_NO] =		0x8110,
+};
+
 static const u32 mt6351_regs[] = {
 	[PWRAP_DEW_DIO_EN] =		0x02F2,
 	[PWRAP_DEW_READ_TEST] =		0x02F4,
@@ -1120,6 +1154,8 @@ static int mt8186_regs[] = {
 
 enum pmic_type {
 	PMIC_MT6323,
+	PMIC_MT6331,
+	PMIC_MT6332,
 	PMIC_MT6351,
 	PMIC_MT6357,
 	PMIC_MT6358,
@@ -1975,6 +2011,16 @@ static const struct pwrap_slv_type pmic_mt6323 = {
 		PWRAP_SLV_CAP_SECURITY,
 };
 
+static const struct pwrap_slv_type pmic_mt6331 = {
+	.dew_regs = mt6331_regs,
+	.type = PMIC_MT6331,
+	.comp_dew_regs = mt6332_regs,
+	.comp_type = PMIC_MT6332,
+	.regops = &pwrap_regops16,
+	.caps = PWRAP_SLV_CAP_SPI | PWRAP_SLV_CAP_DUALIO |
+		PWRAP_SLV_CAP_SECURITY,
+};
+
 static const struct pwrap_slv_type pmic_mt6351 = {
 	.dew_regs = mt6351_regs,
 	.type = PMIC_MT6351,
@@ -2020,6 +2066,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
 	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
