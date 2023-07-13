Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB074C001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU6RTyP3KLIxNS3EIMQCNoWeoTvRBcP3Swo8OAnIkko=; b=WWHsxIHbmXvZX7r3cdblSUcINv
	aC7LHMlt/1z+luylkg4VYJX1ATVYEuHCmvvzWVg65+VCnIGrP7LzJl0zZNElZ3tPpQKT7QOv+lHB8
	5XFuyng+gqdjNLyxloo45gr/cjADa2KqRaRVTiZm4UyJERCr+4ow/4jc5PX+H3wYZLTnSkIUL8LQs
	XPVUK/1QQvvXSbMGTEG0qzf9mlw3mxs8EJSPpJ6ntaonLLm8M/cRgm6+urHXDdeHQunMwI3f7B0lh
	Cezir0pIYj3XNiwW0VpuJ0uMECZPwI8qftn8xPE6+dDKkney6QK99aNUfSs8PyNS6AjtQ03bE/Dkv
	LLQMn3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsDG-002XBR-1n;
	Thu, 13 Jul 2023 09:02:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsD5-002X07-36;
	Thu, 13 Jul 2023 09:02:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E14CB6607048;
	Thu, 13 Jul 2023 10:02:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689238921;
	bh=qwF1DpBWAiGeCsgy0xDuFPWrvSNym8Bna4wYMlIfD8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbyY/RQyGhoYuVvbxNoVNLKM6s6EhlTM6eZZVMlLV+T27JSrtOMPlGJRFfL2UJ0CO
	 CgCB99IY4j+3WmNo00B3F5Qc7/K4UqIoNGS53QoNxOfO3zuQzLkYYBe1d187ZGccrS
	 pVgfS3joxOATmF7m4HnXNpPBH+aqSyyDDDHQtPeM4+oj4DkL+r6x/qiLMDv7vlr+CH
	 0rqusgi35Tez+N5fHEJBM06WtjrDeqqMmR41cjtS8xuq45X+/Q4iyMzQ5pfpGRfWTc
	 eSqFFCFrJhPMRH2TdxQ1D79XXQvR+BkX08wVPLDYoqJq4awXFxRUtpEX1Trud6p/TK
	 hPbNUiGw65axg==
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
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v5 04/10] drm/mediatek: dp: Move AUX_P0 setting to mtk_dp_initialize_aux_settings()
Date: Thu, 13 Jul 2023 11:01:46 +0200
Message-Id: <20230713090152.140060-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020204_128484_DF044F97 
X-CRM114-Status: UNSURE (   7.97  )
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

Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
to function mtk_dp_initialize_aux_settings(), as this is effectively
part of the DPTX AUX setup sequence.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9dea78529697..b4e775e040ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1009,6 +1009,11 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_37C8,
 			   MTK_ATOP_EN_AUX_TX_P0,
 			   MTK_ATOP_EN_AUX_TX_P0);
+
+	/* Set complete reply mode for AUX */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0,
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0);
 }
 
 static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
@@ -1821,10 +1826,6 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_initialize_settings(mtk_dp);
 	mtk_dp_initialize_aux_settings(mtk_dp);
 	mtk_dp_initialize_digital_settings(mtk_dp);
-
-	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
-			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0,
-			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0);
 	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
 
 	mtk_dp_digital_sw_reset(mtk_dp);
-- 
2.40.1


