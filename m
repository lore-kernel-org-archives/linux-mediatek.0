Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20EBC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 09:58:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87BC2073D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 09:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMk75H8T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KE52f8Sz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87BC2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MaY7coHZ2eMA5XDZQuSeA0LrsBpajPL5QL8RFChkUPA=; b=KMk75H8T9LX94V
	/gecWRkvGKHoHTxFJ4b6/5OcaRPx+Hs6Z+lU7Cg916tQUWwJ5/ajOQVz5VDx4wZkYOcujtVhedDlf
	dqyyUHJtwogYxu05mfglgYMc7FkdtON3uoqwt5P4qxlqHV/mh3fuJcxdMaqZ1UsxmhDV1gy/fJJUc
	Xi+9+oFrtXprS5GkNDsi16hNNSeibweyKOHeOpAw/yXq93ELfkCPw3pGg5QqY+lrkhJGTofh5xgJV
	qpkhMl8Sfi7seNwasHO73Zg0zL9JOV7MUQZoxhVHids8QnBGKM5CP9LBjD/be8MBjRbJyv4alvNga
	42u4yzNUvAnEyJ3aaIaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifhi4-0003aA-8c; Fri, 13 Dec 2019 09:58:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifhhq-0003QE-Ry
 for linux-mediatek@lists.infradead.org; Fri, 13 Dec 2019 09:57:56 +0000
X-UUID: a1dd82ba061341b6bbda9d8cfaecdbf6-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tbtpc4HwoIizJapJHkpAGqXV6L+ForqoT7eLxcawY2k=; 
 b=KE52f8Sz/w9f0fUBpo4cy66XHSG4Rs1ivQhWgCcOEWfVXRj0HHyCOMh6/BpeFGhkk0agJlMMoR7JA/K1hje5FnEEfNeft6qdoNLopOq+eNShcc1OVuFeZfgjX6RBXBn6gWLJI6MOUIICy37RmDKvXg8pn995ttRwtcSdyxGVV84=;
X-UUID: a1dd82ba061341b6bbda9d8cfaecdbf6-20191213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 601802477; Fri, 13 Dec 2019 01:57:48 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 01:52:34 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 13 Dec 2019 17:52:35 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 13 Dec 2019 17:52:00 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
Date: Fri, 13 Dec 2019 17:52:15 +0800
Message-ID: <20191213095215.17068-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F2E272E0679D42771031A586BE6A0F92036613FD0F21104A90D5407779A9FEA32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_015754_910359_E909E93F 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are some extra data transfer in dsi.
ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
This signal will enlarge the line time. So the real frame on dsi bus
will be lower than calc by video timing.

So dsi driver reduces the hbp and hfp to keep the line time.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 67 +++++++++++++++++-------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e9931bbbe846..f247fad47709 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -230,28 +230,25 @@ static void mtk_dsi_mask(struct mtk_dsi *dsi, u32 offset, u32 mask, u32 data)
 static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 {
 	u32 timcon0, timcon1, timcon2, timcon3;
-	u32 ui, cycle_time;
+	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
-	ui = DIV_ROUND_UP(1000000000, dsi->data_rate);
-	cycle_time = div_u64(8000000000ULL, dsi->data_rate);
+	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
+	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
+				 timing->da_hs_prepare;
+	timing->da_hs_trail = timing->da_hs_prepare + 1;
 
-	timing->lpx = NS_TO_CYCLE(60, cycle_time);
-	timing->da_hs_prepare = NS_TO_CYCLE(50 + 5 * ui, cycle_time);
-	timing->da_hs_zero = NS_TO_CYCLE(110 + 6 * ui, cycle_time);
-	timing->da_hs_trail = NS_TO_CYCLE(77 + 4 * ui, cycle_time);
+	timing->ta_go = 4 * timing->lpx - 2;
+	timing->ta_sure = timing->lpx + 2;
+	timing->ta_get = 4 * timing->lpx;
+	timing->da_hs_exit = 2 * timing->lpx + 1;
 
-	timing->ta_go = 4 * timing->lpx;
-	timing->ta_sure = 3 * timing->lpx / 2;
-	timing->ta_get = 5 * timing->lpx;
-	timing->da_hs_exit = 2 * timing->lpx;
-
-	timing->clk_hs_zero = NS_TO_CYCLE(336, cycle_time);
-	timing->clk_hs_trail = NS_TO_CYCLE(100, cycle_time) + 10;
-
-	timing->clk_hs_prepare = NS_TO_CYCLE(64, cycle_time);
-	timing->clk_hs_post = NS_TO_CYCLE(80 + 52 * ui, cycle_time);
-	timing->clk_hs_exit = 2 * timing->lpx;
+	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
+	timing->clk_hs_post = timing->clk_hs_prepare + 8;
+	timing->clk_hs_trail = timing->clk_hs_prepare;
+	timing->clk_hs_zero = timing->clk_hs_trail * 4;
+	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
 
 	timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
 		  timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
@@ -482,27 +479,39 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			dsi_tmp_buf_bpp - 10);
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-				  timing->da_hs_zero + timing->da_hs_exit + 2;
+				  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
-		if (vm->hfront_porch * dsi_tmp_buf_bpp >
+		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
 		    data_phy_cycles * dsi->lanes + 18) {
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp -
-						     data_phy_cycles *
-						     dsi->lanes - 18;
+			horizontal_frontporch_byte =
+				vm->hfront_porch * dsi_tmp_buf_bpp -
+				(data_phy_cycles * dsi->lanes + 18) *
+				vm->hfront_porch /
+				(vm->hfront_porch + vm->hback_porch);
+
+			horizontal_backporch_byte =
+				horizontal_backporch_byte -
+				(data_phy_cycles * dsi->lanes + 18) *
+				vm->hback_porch /
+				(vm->hfront_porch + vm->hback_porch);
 		} else {
 			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
 			horizontal_frontporch_byte = vm->hfront_porch *
 						     dsi_tmp_buf_bpp;
 		}
 	} else {
-		if (vm->hfront_porch * dsi_tmp_buf_bpp >
+		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
 		    data_phy_cycles * dsi->lanes + 12) {
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp -
-						     data_phy_cycles *
-						     dsi->lanes - 12;
+			horizontal_frontporch_byte =
+				vm->hfront_porch * dsi_tmp_buf_bpp -
+				(data_phy_cycles * dsi->lanes + 12) *
+				vm->hfront_porch /
+				(vm->hfront_porch + vm->hback_porch);
+			horizontal_backporch_byte = horizontal_backporch_byte -
+				(data_phy_cycles * dsi->lanes + 12) *
+				vm->hback_porch /
+				(vm->hfront_porch + vm->hback_porch);
 		} else {
 			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
 			horizontal_frontporch_byte = vm->hfront_porch *
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
