Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B51C54E66
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRWP9snI8RAx/YHERzDgmRG2nMqfLoPSeiF3f8FNgLU=; b=HRBx6/jEh6W1z9MEDdblvy2Z6X
	C92TvbO8VfWHlftYmHR/xugAx9JurpvuINHasWuEULWZoxk56o7E0iRMhp8rI4pbmF0yGjjM+Dyih
	4EqxbDyl6l2N3VYjPKBqM7UkjmRhPm/2V0Ft2E9sJCWWAGAm7gw7UWZyvTuvqYl0ccFuziTKAF2iV
	0qcxg5f8AqvJ6n8zkiqX++xehMn8UkVeczgQ70R+GMl+QTTbW5l1apFahTlRB2Zr6v5qRqhCMHpUh
	jI4hitB75NsdAbHoK2lL26KBFhDA4tdOaTyoeFPhbulpln/K6gKy4vmeKAQR4V+Ri1Q5ER9Hr+pD8
	XvW09wTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl20t-0000000GzT5-3XeG;
	Fri, 15 Mar 2024 07:29:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl20p-0000000GzSF-2COG;
	Fri, 15 Mar 2024 07:29:57 +0000
X-UUID: cee860eae29d11eeacdb61a41848c7d2-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yRWP9snI8RAx/YHERzDgmRG2nMqfLoPSeiF3f8FNgLU=;
	b=bldC4cM9793BaKcuaQ0gkl4VpnCoZlK0X4MKNorbxVZSnYciSY1gLj36okttM+p8tCVru4t9xaLBIlpN2wutowW8HYiwAV33cAMaecRtcazC4w2KDU1X4dUaF4wgFmuxobfErVVQgTdNnB8i6gMIbrjDvFWNcbgVHPMzPY4vrwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:06088bb6-b6ba-4fa9-8e3f-cf66b8aa9071,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:6f543d0,CLOUDID:1405eeff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cee860eae29d11eeacdb61a41848c7d2-20240315
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1308439576; Fri, 15 Mar 2024 00:29:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 15:28:52 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 15:28:51 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH] mediatek: dsi: Correct calculation formula of PHY Timing
Date: Fri, 15 Mar 2024 15:29:17 +0800
Message-ID: <20240315072945.19502-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.215100-8.000000
X-TMASE-MatchedRID: YZSAQvmCNEE926lAoePLB6Yb59qT2vdqEbxKVXd70tXfUZT83lbkEEFN
	G6vV64Np89MfnAiuroaG184Y5LIraR8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFErqa51gGLvDwDD
	qsyMeG4EW6WhcUTCY/falSjsNC8GOBNZu/eAwGF85FgWkTMqhfn6+pNxelVQZ8K6z02AXwE6f9V
	II1fK9/PI2nuDg9d7QFezHPq6MHFSrV/xdKQcFSY0leYQxW8u2lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.215100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5A67AD3405B3FBFC63F4F8117293508A52A6B56E3483D38D0BF2920C847618F52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_002955_577412_1FAF7451 
X-CRM114-Status: UNSURE (   7.46  )
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

This patch correct calculation formula of PHY timing.
Make actual phy timing more accurate.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 33 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a2fdfc8ddb15..d1bd7d671880 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -235,22 +235,23 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
-	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
-	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
-			     timing->da_hs_prepare;
-	timing->da_hs_trail = timing->da_hs_prepare + 1;
-
-	timing->ta_go = 4 * timing->lpx - 2;
-	timing->ta_sure = timing->lpx + 2;
-	timing->ta_get = 4 * timing->lpx;
-	timing->da_hs_exit = 2 * timing->lpx + 1;
-
-	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
-	timing->clk_hs_post = timing->clk_hs_prepare + 8;
-	timing->clk_hs_trail = timing->clk_hs_prepare;
-	timing->clk_hs_zero = timing->clk_hs_trail * 4;
-	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
+	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
+	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
+		timing->da_hs_prepare;
+	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
+
+	timing->ta_go = 4 * timing->lpx;
+	timing->ta_sure = 3 * timing->lpx / 2;
+	timing->ta_get = 5 * timing->lpx;
+	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
+
+	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
+	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
+	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
+		timing->clk_hs_prepare;
+	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
 
 	timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
 		  timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
-- 
2.43.0


