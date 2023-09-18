Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C9CD13D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72eVayWVp8rYcnVKWBje8fRu/Ay09M8ccvdljh1dMk4=; b=lh0mkwcyDudgsLcZ5Y+rJ2Agc9
	1v6/vqM0z8XHu4PLxGslriqPpbBBj+WifjIgbrIltwn4IUn148UUg7ChnJuFoyfLQiLgD1NroXJG5
	uypJKymq2RtZUO7CXeIQZ8htFc79+LtxTTvYFGkIUSMcMLyRqS8tFj0A4PiKv+LJQemenYz51FXLm
	kF9ZLa5vHSLewlpzEZe0YHEWRd+QOhtG0OsqbS11dFD6kM47c81f8y+DDWWJJz6ql9FrBMrj51Mkh
	dAuGuk4o7ulUV44tLT1s9rqCcjgFhwUT8Wbcuk2cg/dwAxMJdoNlCcqo5p2o95k2X6nio8i7Ixmg/
	DubM88Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9pr-00Ercu-0n;
	Mon, 18 Sep 2023 08:42:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9pk-00ErYU-1K;
	Mon, 18 Sep 2023 08:42:21 +0000
X-UUID: 4450fa9e55ff11ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=72eVayWVp8rYcnVKWBje8fRu/Ay09M8ccvdljh1dMk4=;
	b=PqMdtJYmOh+fNAqeSrd+qfoLPzpkAGLCG7KwFBPibIdOrkUQ5zFzhwRfmkVnS88PCH6di6ZbIS/cbyKt2IQrsvQqAfhFP88KPg29yLRTVyBDiPHCeVUP4YhL6e70SfIsw8gMooQ7A4gnnKIwfJr2dvSCoh6esufmXJk0zXo0jwI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b574da1f-af21-4415-814d-9d31f4e93353,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:fcc91014-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4450fa9e55ff11ee9b7791016c24628a-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2067264319; Mon, 18 Sep 2023 01:42:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:42:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:42:11 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>, CK Hu
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2 05/11] drm/mediatek: Adjust DRM mode configs for IGT
Date: Mon, 18 Sep 2023 16:42:01 +0800
Message-ID: <20230918084207.23604-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918084207.23604-1-shawn.sung@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014220_481403_09F9161A 
X-CRM114-Status: GOOD (  11.76  )
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

IGT (Intel GPU Tool) could commit the following planes
during the test:

kms_plane:

The sub-tests pixel-format-* will create planes with
size of 1 or 4512 pixels, these size will be rejected
by the original mode configs.
Adjust minimum and maximum value of both plane width
and height.

kms_cursor_crc:

If cursor_width and cursor_height is not defined,
IGT uses min_width and min_height as the limitation
when creating cursor plane so sub-tests like
cursor-rapid-movement will be skipped.
Set cursor_width and cursor_height to 512 pixel can
solve the problem.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7759a06e5c0e..62581b2a470b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -429,16 +429,18 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;
 
-	drm->mode_config.min_width = 64;
-	drm->mode_config.min_height = 64;
+	drm->mode_config.min_width = 1;
+	drm->mode_config.min_height = 1;
 
 	/*
 	 * set max width and height as default value(4096x4096).
 	 * this value would be used to check framebuffer size limitation
 	 * at drm_mode_addfb().
 	 */
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
+	drm->mode_config.max_width = 8191;
+	drm->mode_config.max_height = 8191;
+	drm->mode_config.cursor_width = 512;
+	drm->mode_config.cursor_height = 512;
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
-- 
2.18.0


