Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6382AC04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PSrYCHt1s+/8+dBgzjGusiRw4L1KQL4zpTRTuSAxQw=; b=P8sLkbwsPAzOfCunIEVLkHKyIM
	d6yPm+etU4wqXf9OujC6nNff6fPoTQfp7nIPm0X5V3wy4zMxcuMGAUdoXZTGKojVZaccQlTHhBNDk
	k3u0rp/p6Qd+EW9JUsshGmLcVAuZIIB+p3lctV9Sj3VzXED9YKyLzT5x35bBcduI8kOLJyjpGESZW
	UziwBoKBm8ThVAzbIF4V/fgH7FYrCtVO6VCquO56vgu2JMvRrlJMTn93G31kfbF9cR17ZMbso3wJH
	XIADxIYRIbmsxOQ0JSCVP8zaR1pPajmpYV4mZ+lZkjigTM9DkkXpPXQlyhuSnuB0AG36HK6NFWdp0
	uFGJQfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXi-006bkV-0r;
	Tue, 25 Jul 2023 07:33:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXM-006bRL-0q;
	Tue, 25 Jul 2023 07:32:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B60C6606FD7;
	Tue, 25 Jul 2023 08:32:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270371;
	bh=hHqJCxhzA0NOhvW3sNvZ11fAVEceLOVkRCjEEye+yKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=npAYi+z4wql40aD1QROYJmcM6oHeg8AUjTxpZzqZpdYN0AP4TA99xgNx3d+AmkgHE
	 /2RIRRrcLBrz6aYmi6CzHDfVFo1D1anRp9WAE9U3cjRqi07ksFICzqCLY//tpEFRXX
	 RH5RGXVTfNZC5cvNIA1rnIwlg1fVW2u8/Htbd6PFcaZQ+/juM06VYKukci3xfqYetl
	 dwGQjcjbjgvPaoidOQHbgTbxYzWtErnseCUBYgDZ7PFjPgd5KKxxJ1bUwmCQ2tP9AG
	 8pL2LcGhozsJR+XmLF4AdDoPWVT5DIqHk+G/snsa+gtT4JHfUoUnRUnzTo4keEaNeG
	 sDZVbEJaXM6bg==
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
	CK Hu <ck.hu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 05/11] drm/mediatek: dp: Move AUX_P0 setting to mtk_dp_initialize_aux_settings()
Date: Tue, 25 Jul 2023 09:32:28 +0200
Message-ID: <20230725073234.55892-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003252_455472_8D17A77C 
X-CRM114-Status: UNSURE (   8.70  )
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fc6cabf5370b..e8d3bf310608 100644
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
@@ -1826,10 +1831,6 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
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
2.41.0


