Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF880C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoRjnQP+iJgX3vDZVUJNXCXH+t6RhqgwPTXsIfV7CNY=; b=tkE3dCIj2iZ44RJN/cZQDNQuit
	zkxs4l0VbxLe8LtJeFG2/SKclEGGkpWpKl4HCtDyt+UD/8mWQSMqm/0yfKVcd7iB2DwRJ8ctnTaK5
	Pk2Knrg6+pz3sx41+E5FtSVmhvuNcUpeRuPJOJzA6QA4GI2hWxS047/wog+OdPtZY9frkdf+nAVyT
	UGpiwI1RDgf5vLPR1cErLcu5YTIr30NUDTAdEyHWjclgOBgvTxIsiWEisd9ZU0zx+AnN9cZi3X7zY
	Oi50NXHMophXEkSxesqo6JG2zODiigCKsjGZQTj6rG5MHPJ3nPEJo3z4Znm/AHbT44GaRSuGsp3W2
	65RVHFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZBiX-00Dq6v-7e; Fri, 16 Sep 2022 13:49:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZBiK-00Dq12-SO; Fri, 16 Sep 2022 13:49:06 +0000
X-UUID: 5dc28a4828764c0392dcc1ecea78ed3d-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hoRjnQP+iJgX3vDZVUJNXCXH+t6RhqgwPTXsIfV7CNY=;
	b=crHHXGdNMVwygRgPz596IVf5M0JicW0lBrJPbMI5pw+Bx2SvUIxOvrqcIXqOAHUHJU+uE/ur5u8Nml4litfpSyrTjymwNt1NVORPjP4L/JhGkvchAjMvyCpImj1vDAMy1rY1XZWHkB8XMDOHtTAy1glgbg+T/K4LqWfFm6y3Vww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cb2bcdbd-f5ba-4853-855b-8f6d68b08719,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:86aeea5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5dc28a4828764c0392dcc1ecea78ed3d-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1033955703; Fri, 16 Sep 2022 06:48:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 21:38:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 21:38:23 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
CC: <matthias.bgg@gmail.com>, <granquet@baylibre.com>, <daniel@ffwll.ch>,
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
Date: Fri, 16 Sep 2022 21:38:19 +0800
Message-ID: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_064904_936160_EB107FB4 
X-CRM114-Status: GOOD (  14.96  )
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

In order to improve human readability, reduce the indentation by
returning early if the dp/edp cable is not plugged in.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 66 ++++++++++++++++---------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index dfa942ca62da..c72c646e25e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1933,39 +1933,41 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
 
-	if (mtk_dp->train_info.cable_plugged_in) {
-		if (!enabled) {
-			/* power on aux */
-			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-					   DP_PWR_STATE_MASK);
-
-			/* power on panel */
-			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
-			usleep_range(2000, 5000);
-		}
-		/*
-		 * Some dongles still source HPD when they do not connect to any
-		 * sink device. To avoid this, we need to read the sink count
-		 * to make sure we do connect to sink devices. After this detect
-		 * function, we just need to check the HPD connection to check
-		 * whether we connect to a sink device.
-		 */
-		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
-		if (DP_GET_SINK_COUNT(sink_count))
-			ret = connector_status_connected;
-
-		if (!enabled) {
-			/* power off panel */
-			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-			usleep_range(2000, 3000);
-
-			/* power off aux */
-			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-					   DP_PWR_STATE_BANDGAP_TPLL,
-					   DP_PWR_STATE_MASK);
-		}
+	if (!mtk_dp->train_info.cable_plugged_in)
+		return ret;
+
+	if (!enabled) {
+		/* power on aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+				   DP_PWR_STATE_MASK);
+
+		/* power on panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+		usleep_range(2000, 5000);
 	}
+	/*
+	 * Some dongles still source HPD when they do not connect to any
+	 * sink device. To avoid this, we need to read the sink count
+	 * to make sure we do connect to sink devices. After this detect
+	 * function, we just need to check the HPD connection to check
+	 * whether we connect to a sink device.
+	 */
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (DP_GET_SINK_COUNT(sink_count))
+		ret = connector_status_connected;
+
+	if (!enabled) {
+		/* power off panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+		usleep_range(2000, 3000);
+
+		/* power off aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL,
+				   DP_PWR_STATE_MASK);
+	}
+
 	return ret;
 }
 
-- 
2.18.0


