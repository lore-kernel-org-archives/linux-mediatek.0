Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2E2C04E69
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8Venfjko70ZSph3HMOgKeQ1UbSb98Zd5gRGR2o1BLU=; b=Agw3w20WIsUTuIKA/sAhcCwfOF
	D0ueRY0reOApjmAqbfgCP5bFj/EOtAko4b1eWvk69bDFo5gdRVBp5vntUhjdTDrQb6xXlj8ecBTO9
	Ymtyc0+scVTeaMo1JBO3Gu0ekuEQEIjgxb0ofgUt2Gu3nK5AgqhX0IczyDpDI7HtIlPUq0Xj5fN/M
	rhD2l9kNaETsgqlW7d4BniUEaigdLRqgcqlzXhpiPuu9tUpFrqMvLv7CzZFrhKhX71+Qib9qN9Eb1
	/8DMQg1IitPsM4rAv3ictF6PJAtQohTnWKLH+5377CoYLJEyX7ahJuk8ARnc9MtW1qRiWRaQriAGu
	MPTZHgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXP-006bUr-0c;
	Tue, 25 Jul 2023 07:32:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXI-006bPT-2N;
	Tue, 25 Jul 2023 07:32:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE8106607105;
	Tue, 25 Jul 2023 08:32:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270367;
	bh=UxJIucVDAWGMbZsVbKjD2E/6cJnPX0LdsT06i3DZxik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YW3anaAj7ptZfarIiyPRoDecQCMcNbYlxkGGh5CU4bz6SPe94Zao8/ciXWnBZ9ULd
	 dByyJ/wHMOcMYtiuhM/cTo2Q0v74tvh15Dgvl35xTm5C3AQmo6jJlux/DqCDqiELWj
	 Xl2mtdgPPmHrrc/xNKwqP2LmuMzpParND7W0GF/Mo9rp7zmyHtwu+TeXOiDL/Laaev
	 JY18VzL4HiSypdUpc4gzpD+oNISP5HxwXmgb8T57QVeb9bSbef5/46wuYWl+dDUr5a
	 Hw+nt0Cw97usTttpPQhBrRbXfXk3ND0qTzC6qdTvyPQOYsL9lGtzXmm4c+A0NXgQJp
	 71CFG73YOthuw==
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
	nfraprado@collabora.com,
	ehristev@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 01/11] drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabilities
Date: Tue, 25 Jul 2023 09:32:24 +0200
Message-ID: <20230725073234.55892-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003248_936037_C998036E 
X-CRM114-Status: GOOD (  12.37  )
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

If reading the RX capabilities fails the training pattern will be set
wrongly: add error checking for drm_dp_read_dpcd_caps() and return if
anything went wrong with it.

While at it, also add a less critical error check when writing to
clear the ESI0 IRQ vector.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..c58b775877a3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1588,7 +1588,9 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	u8 val;
 	ssize_t ret;
 
-	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
+	ret = drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
+	if (ret < 0)
+		return ret;
 
 	if (drm_dp_tps4_supported(mtk_dp->rx_cap))
 		mtk_dp->train_info.channel_eq_pattern = DP_TRAINING_PATTERN_4;
@@ -1615,10 +1617,13 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 			return ret == 0 ? -EIO : ret;
 		}
 
-		if (val)
-			drm_dp_dpcd_writeb(&mtk_dp->aux,
-					   DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
-					   val);
+		if (val) {
+			ret = drm_dp_dpcd_writeb(&mtk_dp->aux,
+						 DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
+						 val);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.41.0


