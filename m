Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61623C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttyCIpDiK6nBRlRMzl/sNrgnRWC6aMyYFm6cJl57Wi4=; b=Cai7/NRhSB3Poh
	WFQt9foNc2EBnEJmaB+lh38Jnf0zbggRUUxrKgl1mmEKiW1Cq1TdRqprbf4oN51MEQL3z2o7vRaOI
	xqTN2XklB9l/yx1KOjRMFPaMKNyMRtpJg1KVHPmsR/1ZQczYf1k97NFnpz39kBiwi0S4YAsgsAdPq
	/dyyckNvOOWOTOC8LH2iXaV8IHS/AFSHQUkVcH58UP2sM1tcsOh5BEqxmI4z9HoZXbG55L4auiES2
	rrnMOsrMxosYPmcEazdUjzEnlDtHLREPX0dQ2g3OmEKu38g9Ms7axuSTXGaX0BLarqdRD9Q0A7qbE
	xmuAwxZAsuGDipQnXotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIWyH-007aUH-F4; Fri, 11 Feb 2022 14:32:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIWwp-007Zmd-5i; Fri, 11 Feb 2022 14:30:58 +0000
X-UUID: 21e126b836b84f28971c769e763e740e-20220211
X-UUID: 21e126b836b84f28971c769e763e740e-20220211
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2119994761; Fri, 11 Feb 2022 07:30:49 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 06:30:47 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Feb 2022 22:30:44 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 11 Feb 2022 22:30:38 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [2/3] drm/mediatek: Separate poweron/poweroff from enable/disable and
 define new funcs
Date: Fri, 11 Feb 2022 22:30:16 +0800
Message-ID: <1644589818-13066-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_063055_288180_DFC06FED 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

In order to match the changes of DSI RX devices (for example, anx7625), 
the poweron/poweroff of dsi is extracted from enable/disable and 
defined as new funcs (pre_enable/post_disable).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 45 ++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 6d7b66d..e47c338 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
-	/*
-	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
-	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
-	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
-	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
-	 * after dsi is fully set.
-	 */
-	mtk_dsi_stop(dsi);
-
-	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
-	int ret;
-
 	if (dsi->enabled)
 		return;
 
-	ret = mtk_dsi_poweron(dsi);
-	if (ret < 0) {
-		DRM_ERROR("failed to power on dsi\n");
-		return;
-	}
-
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
@@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	mtk_dsi_poweroff(dsi);
+	/*
+	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
+	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
+	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
+	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
+	 * after dsi is fully set.
+	 */
+	mtk_dsi_stop(dsi);
+
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 
 	dsi->enabled = false;
 }
@@ -765,10 +756,26 @@ static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
 	mtk_output_dsi_enable(dsi);
 }
 
+static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	mtk_dsi_poweron(dsi);
+}
+
+static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	mtk_dsi_poweroff(dsi);
+}
+
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.disable = mtk_dsi_bridge_disable,
 	.enable = mtk_dsi_bridge_enable,
+	.pre_enable = mtk_dsi_bridge_pre_enable,
+	.post_disable = mtk_dsi_bridge_post_disable,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
