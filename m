Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D411ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=12q/9kAgDbtDNeYaVuoRij+LJ/FfRHkEvUxv5OfPjGI=; b=V83doimhYDFBpiBflK+m/9AYdo
	45jHgB2OGEMlFo5XyzU+ymlV0RQ51s94gYM17+qL3WG/tUHPMBZHD6T91a5+7OxBivbgWTSapgNVS
	vELF1WZL5kcL2X7DMuOlXNYbMemULN8Pd4YMj3X6ZC6Jh3zXoZ0J/NUSmzN+McrEolDQyeO12Hd9U
	HmVzqp1sSHdEIqR4JfwaaoA3RG+8tTYoAGagsuxzDOpz/lpWwwL6eAGEmBknVAGc7e+qeVvfTex9A
	y0hjO4NRBoBQrpaxp3rZJGmdv2A/UUH0WTj+C+/lvY4EEbe//YUfbHGNhKlSYGaSyyShL5w1L6HuH
	BDy0XL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMWd-009H65-PH; Wed, 14 Sep 2022 07:09:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMWQ-009GnT-M0; Wed, 14 Sep 2022 07:09:24 +0000
X-UUID: 69f4b865a7294274b798b8f772bb63ac-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=12q/9kAgDbtDNeYaVuoRij+LJ/FfRHkEvUxv5OfPjGI=;
	b=THGett3rtiTyFyzMAKx7feTLWPRSuK/QIPzlSzNcpR+O+kdURXwHcyebwFzqKiR7Rm5O8/5aUDH7ZJqSE957pRy8a/6llykLNpCc3WgHwxd4jlEpJdxl71hyV9Rd9Kfn6AXIlQ+Yl2zgPPwKN48QgedMRhuleX/eclogkWDFwEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:faef7af2-9248-40f8-b43a-a3f6e6867411,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:320761ec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 69f4b865a7294274b798b8f772bb63ac-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1015322244; Wed, 14 Sep 2022 00:09:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 14:18:33 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Sep 2022 14:18:31 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <rex-bc.chen@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH] drm: mediatek: Fix display vblank timeout when disable dsi
Date: Wed, 14 Sep 2022 14:18:29 +0800
Message-ID: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_000922_737429_6F5897E7 
X-CRM114-Status: GOOD (  10.40  )
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

Dsi is turned off at bridge.disable, causing crtc to wait for vblank timeout.
It is necessary to add count protection to turn off dsi, and turn off at post_disable.

Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
Base on linux-next.
---
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..157248309c32 100644
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
@@ -803,12 +795,14 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
-	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
@@ -826,6 +820,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
-- 
2.18.0


