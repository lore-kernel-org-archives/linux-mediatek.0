Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B77C3600C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Apr 2025 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cH49TxsMj42T5XlGVZhmWk7M5dM3WJktSmMWHk1vBvI=; b=PZjz66uPXVAxmDZZPqJbwoaYZu
	0LR4QDmVc6sOOukGCjzTJ3yqdHeE2QMVzkdyy2gKPzYQTl3rWDPcxQQZ+1vNfTB0n8IfHRkHiraB5
	47PolAGElDhrXyvY4nsRDixiQkLq45YMzS4pFtEVipMm83azw+HOwEltBKt7Fc31cUkBRfbYtdQsk
	XFskq6aVhdKFdaZV0OVVUe6cb02WrZ5fk4XPf29518RPZr4w9XZGihvczYqvWUlTzkWxE5qS7GSvk
	3Gp7XUEhuoe+QM3B2ytYpY069HmUFVCDr3QjjPGp4mndi0YYUFMsDjF9aJfNCCgXJATLQPzuvJk8z
	hrEDcFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QU9-00000009o8k-2EGF;
	Thu, 03 Apr 2025 19:44:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q4T-00000009hk5-44Xe;
	Thu, 03 Apr 2025 19:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57CF35C6255;
	Thu,  3 Apr 2025 19:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A881EC4CEE8;
	Thu,  3 Apr 2025 19:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707869;
	bh=H3VghN29XNAy06+WBBEN/U8Yh4BCdN+CDO5yaZMq4yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lVQSzIoanX/wnJ5fwf5bUiKpxicqserntPRP818kJbvuTGK5y6ZXcxBmJl/t1geL+
	 AcINcSk5DDM52ATsy+AL4lFPB9wv1QMaCkjli1KI9MQuN9reRHF9U+/Wliin6EAHtC
	 kJGVFQpGqZstybZ5GV5UE5rz6EZWImA6GXnQGNumkrywew6JPV/9Lt8sb9MrLUfdvn
	 0HLMsVPSnoNzSRn20vMgmWfIiE1fljiBZ/85MWdC366CDfnQ0/d0dDyJog3XrnbAyZ
	 aWpuZCseV53UA0KT70KbhHgciUV5aMCGxUtNu9xSUjGjNziZrgHg0UcTsapbtzXrMr
	 1xsRvupv+li/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 20/33] drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
Date: Thu,  3 Apr 2025 15:16:43 -0400
Message-Id: <20250403191656.2680995-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191656.2680995-1-sashal@kernel.org>
References: <20250403191656.2680995-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_121750_123930_6B9DED8E 
X-CRM114-Status: GOOD (  13.33  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit c90876a695dd83e76680b88b40067275a5982811 ]

In preparation for adding support for MT8195's HDMI reserved DPI
instance, move the input_2p_en bit for DP_INTF to platform data.

While at it, remove the input_2pixel member from platform data as
having this bit implies that the 2pixel feature must be enabled.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20250217154836.108895-7-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a08d206549543..21ec6c775521f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -127,14 +127,14 @@ struct mtk_dpi_yc_limit {
  * @is_ck_de_pol: Support CK/DE polarity.
  * @swap_input_support: Support input swap function.
  * @support_direct_pin: IP supports direct connection to dpi panels.
- * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
- *		  config to enable this feature.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
  * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
  * @channel_swap_shift: Shift value of channel swap.
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
+ * @input_2p_en_bit: Enable bit for input two pixel per round feature.
+ *		     If present, implies that the feature must be enabled.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  */
@@ -148,12 +148,12 @@ struct mtk_dpi_conf {
 	bool is_ck_de_pol;
 	bool swap_input_support;
 	bool support_direct_pin;
-	bool input_2pixel;
 	u32 dimension_mask;
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
+	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
 };
@@ -610,9 +610,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 		mtk_dpi_dual_edge(dpi);
 		mtk_dpi_config_disable_edge(dpi);
 	}
-	if (dpi->conf->input_2pixel) {
-		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
-			     DPINTF_INPUT_2P_EN);
+	if (dpi->conf->input_2p_en_bit) {
+		mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
+			     dpi->conf->input_2p_en_bit);
 	}
 	mtk_dpi_sw_reset(dpi, false);
 
@@ -992,12 +992,12 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.output_fmts = mt8195_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
 	.pixels_per_iter = 4,
-	.input_2pixel = true,
 	.dimension_mask = DPINTF_HPW_MASK,
 	.hvsize_mask = DPINTF_HSIZE_MASK,
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.input_2p_en_bit = DPINTF_INPUT_2P_EN,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.39.5


