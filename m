Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17A4C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbAz+r7uoZ7wuykGk7qr8Q7vqrx3JT2sQ4TzqRjq868=; b=lU01e4WdnXa8F8Hcdi1YqgQ/wT
	BHktTTjyLT3jecngxkUIrmsrnp016WJ3O+8K1wFdGOjBgkE6bNyb3OPl+FJGwSdygSUOtzk56n3WY
	YOwTfaHi6ZvwrkWs23H5OuwhgOUuygtjaX8LwJGyd5FWHNJI6fJ0dxjBzPwkpsTXjo67xWvubY1uw
	+wnbceYodzvO4ewWDgwucAWwj4TMawXQ2Nh86WbJ5xzPKs3nE+PL9Wi5cnyFmg3/0vpwxDTBLyA4N
	s1XF0ivC5wen08whEVKSj6HzdPvI7W+9HCYLo/jVv0CgdlewWL6dqxbbXMCbOiV8TCcFspX6WAUYr
	oxSN1zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAY-003B5u-07;
	Thu, 01 Jun 2023 11:08:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAM-003Atd-2j;
	Thu, 01 Jun 2023 11:08:29 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A75DE66003B1;
	Thu,  1 Jun 2023 12:08:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617705;
	bh=rtkU/LXfohClR1Fp46CLmRkHJo8bXflFgsmdF+fF9IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3IqwhnCOUQ5YmTsSOqw9XdFRg+83XHDCkTO62ylLR0xe/WV4OpHY9agl0/YzJadB
	 qf6XaEV3z5M9Z4NWgfqathD5tfvjH5WTv6bsw2v4lCLEugFVGJdrac28A013ig+XFX
	 APMTSf8Dg/3JjFno1S+ERcfKzsd7J92Uu3GPyFpvNx0XnfXoQfoZwBN9mOtPRRshK6
	 NTStgOTinKjaOHfXYfgbN2b9X7jC3Nli9fUPrIvRetgGeeVtT845LmW6LYBZBaW6tr
	 3SwlBd5WLThvFN4qJ3ClTA4pjBgjktrFvJxCypl9xSXCWzLAfzMeS4f3A4EgIrVYvh
	 Os795yIVjI1jA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 7/8] leds: leds-mt6323: Add support for MT6331 leds
Date: Thu,  1 Jun 2023 13:08:12 +0200
Message-Id: <20230601110813.2373764-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040827_037745_23496697 
X-CRM114-Status: GOOD (  10.53  )
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
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/leds/leds-mt6323.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index f8bd9f17e89c..85b056fcd94e 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -529,6 +529,17 @@ static const struct mt6323_regs mt6323_registers = {
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
@@ -541,8 +552,14 @@ static const struct mt6323_data mt6323_pdata = {
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
2.40.1


