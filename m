Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9735C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu7JPdBJa35gt8Fiv7D6dielAvggATkOuy9n7/v3rRA=; b=R5xh2z75Ff4Yftdh+rYxEokUZ2
	Gtv/WtmzofaIkJ0LM7+A6Iglny7dRrxsdQ8Wd5x2GGvI5fFMGB9oWpfIfak8a2BR4NlNe5QQADWPu
	iUzcaW27/9JFLEGeyqM38zZ6eCLKPvDr3G2eiBbF1IoUYqQlWDZ332YF0GjawwdUjK0kaRV3FRMvD
	t+O3EBzcHDRg5abq0ngBgQQYGj5G+Cw02nK5zdDQuYPsI8f0LuD5fvUIYhEKYnCvE4VSb+SEvB1DE
	8dR8c8Nxc1MH6c0J/Cj9agyoTrvlfKZr/sl09Rgtt20xRmwjs0V1RHB6KPWX5Gw1MQZG5DpFDb1K4
	j4bXrX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5j-00000001xiD-2xwf;
	Thu, 09 Jul 2026 10:34:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5e-00000001xVE-0LzL;
	Thu, 09 Jul 2026 10:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593284;
	bh=SpH6ZM4ABg1a5n+c9PFwTijwxdPwpAGt4eWJ7AeT+pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jX+sE0ft1VLIZkvv8J45WVtHh4J//fX1XyM7AaHUEoMtxu2lvroPtgoGSS0q4KdtN
	 1ivoW8R/WeZG/bhwvlTjKLKwN1IyyCbaYRzOlWo2XyOjAv4WAnbRNXIFzj7cqxTQiv
	 399nWt83we+cx2JG70DJQ8X8YMwlE5+NZ3HN6dDF5PGjUkmCJrXcX9vDweXe96Uhix
	 /Pc1/JvmjXxz+AErG3n1ucVvIqzUn44OLJienV8hCQsOKFzGXn+iloBR6lvaq9+2sA
	 WIxcnUK9wDFs6HCT0D537qsDcZKVJ9Cek6NDX0OwWHov2Ta5hs8vIHUxIunufcKltt
	 Ae5b3VsurlxLQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DDBB17E0EF3;
	Thu, 09 Jul 2026 12:34:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 08/11] drm/mediatek: mtk_dp: Move max link rate to SoC specific data
Date: Thu,  9 Jul 2026 12:34:28 +0200
Message-ID: <20260709103431.46616-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033446_275463_17022E69 
X-CRM114-Status: GOOD (  12.87  )
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

In preparation for adding support for the eDP IP found in the
MT8196 SoC, having a higher supported maximum link rate, move
this parameter to SoC data instead of statically assigning it
to the training info during initialization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 34a72e0a5f1e..5184159018f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -167,6 +167,7 @@ struct mtk_dp_data {
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
 	u16 audio_m_div2_bit;
+	u8 hw_max_link_rate;
 };
 
 static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1469,7 +1470,7 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
 	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
 
-	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
+	mtk_dp->train_info.link_rate = mtk_dp->data->hw_max_link_rate;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
@@ -2998,6 +2999,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -3006,6 +3008,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -3014,6 +3017,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.54.0


