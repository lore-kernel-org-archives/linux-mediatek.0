Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4211C54E5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3XtRxBr8QsjZPZc+HT3MG5xiCdCMjVj6cC1ntJAiCs0=; b=frINt9zTgadD2zPbXiG1Zu+1zD
	/pZS4tcfnCsl2EVNPm8Ae2Dv+ckBGd/v5vFTkIr7B9JcjMIlOkPculPoAzMtuXsxfX6SI5eBORtAS
	0vsbaWfiCsVbtNffDP07ygPHlCpH9uhRREtRUtEZf33Rb4ILE94u91QUBHd3pGlBvGmWzIHCncLXU
	FWyVVzEzMBq0KRNJNVpZhCRRsE2Y7mtzFDPog5Y/J0Lg5sMLaiNqM3uXZJx1X/muYTyvTvPY+AoBG
	/lYKPx481AUobc2f31I1m8j2iJR/DWtw6tiqY53mnK1EZYWn5+sg/NNrKfHWr6tcT+R5+K+ensnL5
	iPIBUJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkx3b-0000000GOa7-2glt;
	Fri, 15 Mar 2024 02:12:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkx3Y-0000000GOZ5-0rPC;
	Fri, 15 Mar 2024 02:12:25 +0000
X-UUID: 71e0a8c0e27111eeacdb61a41848c7d2-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3XtRxBr8QsjZPZc+HT3MG5xiCdCMjVj6cC1ntJAiCs0=;
	b=FqcQPsmf/zEF+QB2NaDbLNGZQzULFuSDTcVrquCY+Tkjj+XCgNIC7nvTr827LW61aVrurXpa+rE36b9tox8eAmP5i/LNVpUNy5+RM27TMbsUk6rE9gfwR75fX9hgaHrRfh50OWsY6jPUxov1Axj1c3RNUr54el/P2Cu1eBF91fs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:baf8e3ad-ef81-4aaa-b904-e1d3c306e011,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:1ad60585-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 71e0a8c0e27111eeacdb61a41848c7d2-20240314
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2065581269; Thu, 14 Mar 2024 19:12:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 09:51:39 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 09:51:38 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <liankun.yang@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/1] drm/mediatek/ dp: Adjust bandwidth limit for DP
Date: Fri, 15 Mar 2024 09:52:26 +0800
Message-ID: <20240315015233.2023-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.870500-8.000000
X-TMASE-MatchedRID: aNLZUNMgA8DqDJGloYB7/lu4M/xm4KZeB3WB/vm5tBhvOxpHnc6c8tAO
	OSAF0cTNjhjs4bjZeL60WiAfCTDLxQDNPxu11HXj4pdq9sdj8LVYN1akkye0qOWPsfbn1jth8TF
	JvgPXI7A4hXsmqdKfO3aeDhnWViUE0lwI2rCt62G4jAucHcCqncnlJe2gk8vI6dkNekyzYlk+xn
	rY8SIOUkT88A7P9JJ2kiyjM1Ze4W0Pv5/+N9RjErqQyAveNtg65hCwQ3LNHZ2HegbyfstkOnnUb
	FaXoymeQc1jtbpiLH2AMuqetGVetnyef22ep6XYymsk/wUE4hqrBS4T8labToBwhkOTCouh1zSU
	gYfoEuN+67+mR/pqXYPIuqi1bh4/LrruoM7sUMSL8WaUGCH4mw5CO1gbP3VdOM8jHJvq79Wbjw+
	lQ+OHZvNho9kAt8htLJl1Svx/Hh8xu7K+8aG0gLDxBQ/q2QPNQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.870500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2C05BDA06252C926B0A273E8E84954F6A0B77910A9C2749658F0FB14B43045232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_191224_262575_E5F2BB0D 
X-CRM114-Status: GOOD (  13.60  )
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

By adjusting the order of link training and relocating it to HPD,
link training can identify the usability of each lane in the current link.

It also supports handling signal instability and weakness due to
environmental issues, enabling the acquisition of a stable bandwidth
for the current link. Subsequently, DP work can proceed based on
the actual maximum bandwidth.

It should training in the hpd event thread.
Check the mode with lane count and link rate of training.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 57 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2136a596efa1..14da6077f947 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1870,6 +1870,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1888,9 +1889,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			memset(&mtk_dp->info.audio_cur_cfg, 0,
 			       sizeof(mtk_dp->info.audio_cur_cfg));
 
+			mtk_dp->enabled = false;
+			/* power off aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			       DP_PWR_STATE_BANDGAP_TPLL,
+			       DP_PWR_STATE_MASK);
+
 			mtk_dp->need_debounce = false;
 			mod_timer(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
+		} else {
+			mtk_dp_aux_panel_poweron(mtk_dp, true);
+
+			ret = mtk_dp_parse_capabilities(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+
+			/* Training */
+			ret = mtk_dp_training(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+
+			mtk_dp->enabled = true;
 		}
 	}
 
@@ -2057,16 +2077,6 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 
 	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
-	/*
-	 * Parse capability here to let atomic_get_input_bus_fmts and
-	 * mode_valid use the capability to calculate sink bitrates.
-	 */
-	if (mtk_dp_parse_capabilities(mtk_dp)) {
-		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
-		kfree(new_edid);
-		new_edid = NULL;
-	}
-
 	if (new_edid) {
 		struct cea_sad *sads;
 
@@ -2243,14 +2253,10 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	mtk_dp_aux_panel_poweron(mtk_dp, true);
-
-	/* Training */
-	ret = mtk_dp_training(mtk_dp);
-	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
-		goto power_off_aux;
-	}
+	/* power on aux */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+			   DP_PWR_STATE_MASK);
 
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
@@ -2269,7 +2275,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
-	mtk_dp->enabled = true;
 	mtk_dp_update_plugged_status(mtk_dp);
 
 	return;
@@ -2284,16 +2289,10 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
-	mtk_dp->enabled = false;
 	mtk_dp_update_plugged_status(mtk_dp);
 	mtk_dp_video_enable(mtk_dp, false);
 	mtk_dp_audio_mute(mtk_dp, true);
 
-	if (mtk_dp->train_info.cable_plugged_in) {
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-		usleep_range(2000, 3000);
-	}
-
 	/* power off aux */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 			   DP_PWR_STATE_BANDGAP_TPLL,
@@ -2310,10 +2309,10 @@ mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
-	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
-			      drm_dp_max_lane_count(mtk_dp->rx_cap),
-			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
-			 mtk_dp->max_lanes);
+
+	u32 lane_count_min = mtk_dp->train_info.lane_count;
+	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
+			 lane_count_min;
 
 	if (rate < mode->clock * bpp / 8)
 		return MODE_CLOCK_HIGH;
-- 
2.43.0


