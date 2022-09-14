Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wy5CZ7whd4Um5NV5JQOHZfdTnoxxIEcuBpfmElqhC5s=; b=nTQHYN7xXlKt5KHY3PNj/5JiuA
	d5rkFqZyLdLEiD6Gh714DkWxlM4ANOPmlRoXqlCdDRfbwWLVsAcwtJfwVubOTLhKahdQL64X0zJRh
	3m/8uA1D0Cpf2kv7yIkDlouLXBTKoSCV3xa94FQ60p0ZWeyk+HHIiUTpJycl2TWcEqKpLxPfnAoFx
	0EXhnIwuXGM0OxgDbMGvnN73+xMRDhzID4pQa4fitILJng8t2fQzYD/DfbNPl4BWPEiSWj7ZjmqQM
	ysw4EVRTO6+ya6TA9afh0sySHletQcrC2JigeEHpXe1tpamV2wYBK+W6SlGhvfuuRdDkctSMylnXC
	XOfVkdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSwX-001Ud9-2I; Wed, 14 Sep 2022 14:00:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSwT-001USS-RV; Wed, 14 Sep 2022 14:00:43 +0000
X-UUID: 833397c2f17c41a884c92a743b61453b-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wy5CZ7whd4Um5NV5JQOHZfdTnoxxIEcuBpfmElqhC5s=;
	b=E+A3eU8DGU1Q/RIEZp2Yev0oa5jAvLZ0L6rArb8Pk9Gq4/sgyxQAXWMJje0Ctw28mCjAQZDWKItcJbpqcks2ygtu/UfgrjiPaJO9IhLu8AsLao2tj4qNCGzD3rTu8NM4Mx8hJt3nzVg6/n1fwQf4baxgxnQ4YD6ABvqBHV2/TEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1ff2bca4-b46c-40fa-8082-429d63b0fb91,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:8fcea45d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 833397c2f17c41a884c92a743b61453b-20220914
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 769631736; Wed, 14 Sep 2022 07:00:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 22:00:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Sep 2022 22:00:34 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Xinlei
 Lee <xinlei.lee@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2] drm: mediatek: Fix display vblank timeout when disable dsi
Date: Wed, 14 Sep 2022 22:00:31 +0800
Message-ID: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_070041_935056_57365805 
X-CRM114-Status: GOOD (  11.62  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Dsi is turned off at bridge.disable, causing crtc to wait for vblank
timeout. It is necessary to add count protection to turn off dsi and
turn off at post_disable.

Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
Change in v1:
  * Rebase to kernel/git/chunkuang.hu/linux.git, mediatek-drm-fixes
    [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
---
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5b624e0f5b0a..e30f4244c001 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_display_mode_to_videomode(adjusted, &dsi->vm);
 }
 
-static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_output_dsi_disable(dsi);
-}
-
 static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *old_bridge_state)
 {
@@ -803,13 +795,15 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
@@ -829,6 +823,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
-- 
2.18.0


