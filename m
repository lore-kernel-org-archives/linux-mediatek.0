Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9486BC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQzjv3Rpp0mPgw+11mJogeS+dziK+/+f/mGK4klr9ns=; b=XeDETkMxlR3Lzj8n5x33uAIzn+
	hFuF/18SRWLFWTLlt4tj+xJ9spzoiZsvGdN9GJ6Ap6Qi4j59W6v6oUxBeDPwzYPePqeFMtfO0Q6FU
	MVN8syuOW/9/W3LiqsCccBLeqozYAfnJUJ98IZnAmcZ8RrZBaw7shqdJdgOUVttYmptOXZ7+NuokZ
	eLRMOxV7SDPwUHLQIztTynpOlCBH7IvWTuvLCzxZERJZ7ELBsA8eT2O0h2VrShS0cKADYBnjjaf1u
	mNu4OW8SgU55dSHGe98/tpXPvgaHbNcSt+1Y/nuHOUDecpZJL5WSB2CIhFekOtUGNWsRmChvebUyy
	nTC8pWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdwf-0043oq-0n;
	Fri, 24 Mar 2023 09:42:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdwB-0043b9-24;
	Fri, 24 Mar 2023 09:42:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C20A16603116;
	Fri, 24 Mar 2023 09:42:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679650935;
	bh=uPt2ekOUU4OrWa4bXI3WCTu8A736wA5awt8ihZXf3HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LRt0XMYJc0tZffnjZeQrDM63d2iYy9N+K1NNJT4yjz5HIswfUyzqmH19Mw84D6RrO
	 WrcWe4g9Yc2Y3H/RIHxKCf0rC1KGDIG5U2Edq80RF5C6bk771/AawQRGotm2ogcBDY
	 dPGyNG6TrpfxEhOkT6bGZh6+wAjNJ3dTUNn7Kk9p/r5rpVF7k25ShPqPvRLBNANX+N
	 6G5REi4H2Eq27mnxj8+Y30JXYQeilbhKy5rAVf0xCapc+jU0+ptXOmyyj4/tho8R5J
	 Lj85+gNs8YNaW1L1Mrl+TOuuWIDJNjQMb6yXP0Y1nwYZeIfw5VXYC4xXss+0BQUGuW
	 wnIZwVhEcsf8A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	amergnat@baylibre.com,
	flora.fu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 5/6] soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332 companion
Date: Fri, 24 Mar 2023 10:42:04 +0100
Message-Id: <20230324094205.33266-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024219_806015_7ED2C93F 
X-CRM114-Status: UNSURE (   9.80  )
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

Add support for the MT6331 PMIC and for its companion MT6332 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 366e40b802e4..ceeac43f7bd1 100644
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
@@ -1182,6 +1216,8 @@ static int mt8186_regs[] = {
 
 enum pmic_type {
 	PMIC_MT6323,
+	PMIC_MT6331,
+	PMIC_MT6332,
 	PMIC_MT6351,
 	PMIC_MT6357,
 	PMIC_MT6358,
@@ -2041,6 +2077,16 @@ static const struct pwrap_slv_type pmic_mt6323 = {
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
@@ -2086,6 +2132,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
 	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
-- 
2.40.0


