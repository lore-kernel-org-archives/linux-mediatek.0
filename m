Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE10C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMdA727ML9GfYlwdB+N4dG3v8MdPr2da4KnC11PmGzE=; b=hQRBJhthIsBDB5hT89xi1ILcF2
	jOjUQMdfwOhKKDMoXHsbB+uGhkOr/nb4GLqvJ4nf0ZKR00zhQZwz5t5Q6an9J27vtVOH1sJeSGIfo
	wsKYUTULhsi1d0gBDQcvbSvj34GQLNW0hIKiYV3KL1UKgkpPj5sJTkJqxr8dnYjAWN03zDBEoA/sC
	KcicspI4hlthKjHtHjefXDdVv2kKyffFP+o9jQa2uBeBFKVliRYx42yFNZOwB1272FKtnXi3smXXu
	n3Q29/yegbkjZMlhye3oWXz/X5/XJFjyD3qc51bLwPFtZF4HscOaiecVciuVNn29d0G7/VdhbjxxW
	DJ64Nwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFT-00BmjB-1d;
	Fri, 04 Aug 2023 07:29:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFC-00BmPs-0o;
	Fri, 04 Aug 2023 07:29:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AA8366071BA;
	Fri,  4 Aug 2023 08:29:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134145;
	bh=G9jUBbuND2wlk1NRIFaK24JaPI1K8tQwQG9IqubvDH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=loIubv0nBqKSChhbUGNaF4ysry+i8DIBdMelbcYLA+Zju8yNRgqhfaYDnxphzL6rU
	 e4ib9MBIjO5AO9ilAfO2FX0ZlHum3jsA4+XsFJC2RhdXQOwZxuJoFsFVOG7U58aMwm
	 M0oNnh9sVRxhYtBFlOqmXd8XyPjYBe9ZMnF49QehihwpUFKVcQyni5CNsDXzfTHPC4
	 Q4F3s8wuT7kTaIFHp3Feup1HI3rS/bJS7ApbQTXoDvGEVupOaz2XeqL3oP6ew/gC6x
	 4FGLW5IN7ZhLTtzivlRHiN55GukD47ZMb5rYniqcJIRswMkBJQVWHE/NgaCh/C7Wmp
	 QsjskA8MRu7Og==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v10 09/16] drm/mediatek: gamma: Support specifying number of bits per LUT component
Date: Fri,  4 Aug 2023 09:28:43 +0200
Message-ID: <20230804072850.89365-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002906_447576_392E2B8B 
X-CRM114-Status: GOOD (  13.37  )
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

New SoCs, like MT8195, not only may support bigger lookup tables, but
have got a different register layout to support bigger precision:
support specifying the number of `lut_bits` for each SoC and use it
in mtk_gamma_set_common() to perform the right calculation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 001b98694761..1845bd326a6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -38,6 +38,7 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -91,9 +92,9 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	for (i = 0; i < gamma->data->lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
-		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
-		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
+		hwlut.red = drm_color_lut_extract(lut[i].red, gamma->data->lut_bits);
+		hwlut.green = drm_color_lut_extract(lut[i].green, gamma->data->lut_bits);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, gamma->data->lut_bits);
 
 		if (!gamma->data->lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
@@ -101,13 +102,13 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 		} else {
 			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
+			diff.red = drm_color_lut_extract(diff.red, gamma->data->lut_bits);
 
 			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
+			diff.green = drm_color_lut_extract(diff.green, gamma->data->lut_bits);
 
 			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
+			diff.blue = drm_color_lut_extract(diff.blue, gamma->data->lut_bits);
 
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
@@ -217,10 +218,12 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.41.0


