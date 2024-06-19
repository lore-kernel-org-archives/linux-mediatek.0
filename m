Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48777C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzEUZNAq+EyXlwOdgqGPLnXbxHRiyk7Or+RJMKxxXE4=; b=46Ks0/9fjNTRE7sZB4lNybay4n
	/UW2bmGK3Q468CvTUE3bs1lTUf/6L/8Eh2yBW15b4InDgS1odabMkY0+pmbgQjuIMtfwziJMClgJ2
	jmmFAbDLMBZ8Jn+ytChEXDBlLmlUdFDJ44v5jJ0n5XmK1ClbOYykIHK2+RRoXWSD4LkISev8VKixF
	m4OiLotc1WVVn4BlSNpHVlf46Tyye//FzfNLczIG0OhT1cW66H46SI8fPak9Qf3SDvNOgAHt1WHlG
	/1o37mYk50yMU2ZZocwF50x9V3xSeZ7APRTdfP4GHrP4kcaws0ZSumLrzF+2YvFxoifj5lTp2wULQ
	uHVyJ4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyM3-0000000259Y-2slW;
	Wed, 19 Jun 2024 16:40:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKk-0000000243K-3k6E;
	Wed, 19 Jun 2024 16:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B04A7CE207B;
	Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 572D0C4AF09;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=Eu9A0/ITfQbhuHN1wINLeIGnV+BDBlF/kN0wOMMPbDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KFSRExqewZrkbfvLAWKo3FSLV4qUKonryLq88DjSbAvNjP1Av5EfjYpW9a4GwD9qz
	 5RrOtNIGRGyW5xuYhJGCG6madtqt3ndm+AD5qvFkpWHo0AsynlnaVX2syvoM96vbL4
	 4AcDYNy9y/V9nGb4pEVDef/yEFTcD/EwxfL7dv1U0Ym+O6s/wOsgNeiH9NARVWasrh
	 wFFEz4WJE0Hdv4ME22ALANOnCDxRQXH4L/Z2Ol0XtxYaxJFN914gkp3MTe2tkLJyZu
	 QEBI6vl1798n9u/icoYH3IBLt/7eSrc4KLof4pwFygcUxhQV6d49dOa9cl/VieBH9C
	 uekXWfRi2IRnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBDAC2BC81;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:50 +0800
Subject: [PATCH v3 10/14] drm/mediatek: Set DRM mode configs accordingly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-10-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=3617;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=m0EG3CktaVu4W67UszRONTV4/7xw5TYqkuXRJdICaFc=;
 b=TMj8/v0fTr1m458crp3qdNkIRDjZE/hOgBhE1U4mPkyPWXfnTsF/rjbzDR+3fY+xHx26Jv5PZ
 E/Jj6LV9LfqD9A2eNCX8HH3snv4DnANhqhcN6cUx+WKAwVFL1tUpaAn
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093855_748401_8A3C54BA 
X-CRM114-Status: GOOD (  14.01  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Set DRM mode configs limitation according to the hardware capabilities
and pass the IGT checks as below:

- The test "graphics.IgtKms.kms_plane" requires a frame buffer with
  width of 4512 pixels (> 4096).
- The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size is
  defined, and run the test with cursor size from 1x1 to 512x512.

Please notice that the test conditions may change as IGT is updated.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 8e047043202b..c9cad3a82737 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.conn_routes = mt8188_mtk_ddp_main_routes,
 	.num_conn_routes = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
+	.max_width = 8191,
+	.min_width = 1,
+	.min_height = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 	.mmsys_dev_num = 2,
+	.max_width = 8191,
+	.min_width = 1,
+	.min_height = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
@@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
@@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
+			if (priv_n->data->max_width)
+				drm->mode_config.max_width = priv_n->data->max_width;
+
+			if (priv_n->data->min_width)
+				drm->mode_config.min_width = priv_n->data->min_width;
+
+			if (priv_n->data->min_height)
+				drm->mode_config.min_height = priv_n->data->min_height;
+
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_crtc_create(drm, priv_n->data->main_path,
 						      priv_n->data->main_len, j,
@@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		}
 	}
 
+	/* IGT will check if the cursor size is configured */
+	drm->mode_config.cursor_width = drm->mode_config.max_width;
+	drm->mode_config.cursor_height = drm->mode_config.max_height;
+
 	/* Use OVL device for all DMA memory allocations */
 	crtc = drm_crtc_from_index(drm, 0);
 	if (crtc)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 78d698ede1bf..ce897984de51 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 	unsigned int mmsys_id;
 	unsigned int mmsys_dev_num;
+
+	u16 max_width;
+	u16 min_width;
+	u16 min_height;
 };
 
 struct mtk_drm_private {

-- 
Git-146)



