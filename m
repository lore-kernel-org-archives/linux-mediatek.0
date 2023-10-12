Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1028CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPqTkbtBXLVhMUV7hq+HoM3v6SzUyXuCev7aS1j/gEY=; b=Tmasjt38RClaqrnRB6mdxDTXqA
	THjSzh1oMwzskE7dXHs+U5u7pQD8AqUoEClFUhpDgwW6ReKHwZ0YrJKRkK/ZNj0X7qACpQvK58cS5
	i4SjlvRDNZVs2gHxe8NLBw9dgyZ6lP51pUoP7/8vjyoRLkAPc5h2GQBFjUarad5+9XTLA9xruL2ZA
	om0sq67d7UfVT8r0FCscF5ugQllNM5o+BgruuT0RPjlA9J2YWnjqtNbPSx0fQhz//SJV0dzAD6+U/
	E8kl7NxbXGyzGbXH34JAsDeA2KKL69wYuSnUstrE/bP34IdrlLplG/B9Ixv5akUFftrKPxHDI4P+e
	SDg1P3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSG-000TPm-1K;
	Thu, 12 Oct 2023 09:58:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS0-000T5l-2q;
	Thu, 12 Oct 2023 09:57:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B3E086607357;
	Thu, 12 Oct 2023 10:57:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104671;
	bh=kzWS8tsbe1nOyVFfaonnwXcO2T4ziHZkSjWTS6xVov8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E66JZ8dOrCUxE2/SYtpRJbH14U9zxeCtWctgPPRHrgE+DQOBYyjFBjebV7wYVDzTZ
	 goh9GrgXVwxxxfL3o3QiLJ1iP4bf1Vg6kPzM7DW7gxaiKkoEwaXFGmK9GtNY9XjJFY
	 6ZDWO/KUTQYCyjUEsWqsL8v1kEO7BjCakmd/8dslBWH1k5gp8E2VLlbvFJYa5M1adn
	 nd83GDOxKFcBQXj5WGHRUviKryHSnnDVO0zKnKeNk6Almz15b8nGSY0koqsiuv6gUj
	 ZAwynXmDW7uwpQF3SOkxOxXEkW1MgRzpg7ldtjofpsmVTOZond779jA0OUfI/eukBe
	 xiBhyLDFUMwiA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com,
	nfraprado@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 09/16] drm/mediatek: gamma: Support multi-bank gamma LUT
Date: Thu, 12 Oct 2023 11:57:29 +0200
Message-ID: <20231012095736.100784-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025753_181933_555C74A5 
X-CRM114-Status: GOOD (  16.83  )
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

Newer Gamma IP have got multiple LUT banks: support specifying the
size of the LUT banks and handle bank-switching before programming
the LUT in mtk_gamma_set_common() in preparation for adding support
for MT8195 and newer SoCs.

Suggested-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Refactored original commit]
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 70 ++++++++++++++---------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 0929f8830d6d..911468984ad5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -24,6 +24,8 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
+#define DISP_GAMMA_BANK				0x0100
+#define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
 #define DISP_GAMMA_LUT				0x0700
 
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
@@ -33,6 +35,7 @@
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_bank_size;
 	u16 lut_size;
 };
 
@@ -75,40 +78,53 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	u32 cfg_val, word;
+	u32 cfg_val, lbank_val, word;
+	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
+	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
 	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < gamma->data->lut_size; i++) {
-		struct drm_color_lut diff, hwlut;
-
-		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
-		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
-
-		if (!gamma->data->lut_diff || (i % 2 == 0)) {
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
-		} else {
-			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, 10);
-
-			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, 10);
-
-			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, 10);
-
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+
+	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
+
+		/* Switch gamma bank and set data mode before writing LUT */
+		if (num_lut_banks > 1) {
+			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
+		}
+
+		for (i = 0; i < gamma->data->lut_bank_size; i++) {
+			int n = cur_bank * gamma->data->lut_bank_size + i;
+			struct drm_color_lut diff, hwlut;
+
+			hwlut.red = drm_color_lut_extract(lut[n].red, 10);
+			hwlut.green = drm_color_lut_extract(lut[n].green, 10);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, 10);
+
+			if (!gamma->data->lut_diff || (i % 2 == 0)) {
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+			} else {
+				diff.red = lut[n].red - lut[n - 1].red;
+				diff.red = drm_color_lut_extract(diff.red, 10);
+
+				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = drm_color_lut_extract(diff.green, 10);
+
+				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = drm_color_lut_extract(diff.blue, 10);
+
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+			}
+			writel(word, lut_base + i * 4);
 		}
-		writel(word, (lut_base + i * 4));
 	}
 
 	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
@@ -208,10 +224,12 @@ static void mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bank_size = 512,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bank_size = 512,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.42.0


