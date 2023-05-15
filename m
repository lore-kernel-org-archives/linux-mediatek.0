Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B12C7EE25
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h57jZNHQL2sJ49TfskDCqEYES50/wJ+p6Hr89+KIa9A=; b=bqZIGh0swFJSF+LqFV1IY5erOD
	p48GvdefsGzRzLzz2kOh/Wjhx/GwOjhIn3Z0s9fIOgIksvIm7jHbyxlB5qcvWviTBKYC/Elmcqpay
	6VX6pW6k6OjSxTtQb0M/z04RH0C4Yj/qTmJZNMc3mF4n+LX1am9Qz3bIyCimjDTmjuBWrnA/oC1YF
	v7pEUDudB+1t524THa+ZMJJn0K1f5Mxment90aRF4htLWHn+1oS6Uj7IBPmiG9LUCQ58vEorIDNzs
	WhVuDBoM9KQWW94S91VMU5nUoB25x1OHfvC5r+is0O935SOWLm8tfa5KqBTAFQV6PCKaPfxH19axg
	L3upJnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVAM-001hMs-0o;
	Mon, 15 May 2023 10:10:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVAJ-001hM8-0R;
	Mon, 15 May 2023 10:10:52 +0000
X-UUID: c2678970f30811ed912e1518a6540028-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h57jZNHQL2sJ49TfskDCqEYES50/wJ+p6Hr89+KIa9A=;
	b=AYMv+Vu5T7HFVdNKn5oi+lQzUxsVw7tiUNkuvKEakcohja2ccT78cGxdmTVHZy1aWMAV2nVKQB7qmBVDTt47+cBEyVVCyBsf4y8Oftsk1FJK9c8BoVvosfX1KrbpV0alJV+vQ456LvG0KkZxAjrUnHBonY6zatHLIzRuRBxDGuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:9936c9b6-8fc5-48f8-bd6d-50378a1d57ca,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:8257da6b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c2678970f30811ed912e1518a6540028-20230515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 432470605; Mon, 15 May 2023 03:10:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 17:49:41 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 17:49:40 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v4 2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence
Date: Mon, 15 May 2023 17:49:55 +0800
Message-ID: <20230515094955.15982-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_031051_182187_A77F0590 
X-CRM114-Status: GOOD (  11.14  )
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

For "boe,tv105wum-nw0" this special panel, it is stipulated in
the panel spec that MIPI needs to keep the LP11 state before
the lcm_reset pin is pulled high.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index a5652d38acda..64e462f49c60 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -36,6 +36,7 @@ struct panel_desc {
 	const struct panel_init_cmd *init_cmds;
 	unsigned int lanes;
 	bool discharge_on_disable;
+	bool lp11_before_reset;
 };
 
 struct boe_panel {
@@ -1365,6 +1366,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
 
 	usleep_range(10000, 11000);
 
+	if (boe->desc->lp11_before_reset) {
+		mipi_dsi_dcs_nop(boe->dsi);
+		usleep_range(1000, 2000);
+	}
 	gpiod_set_value(boe->enable_gpio, 1);
 	usleep_range(1000, 2000);
 	gpiod_set_value(boe->enable_gpio, 0);
@@ -1591,6 +1596,7 @@ static const struct panel_desc boe_tv105wum_nw0_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = boe_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode starry_qfh032011_53g_default_mode = {
-- 
2.40.1


