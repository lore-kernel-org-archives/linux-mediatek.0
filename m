Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA99C04FF8
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 03:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/7WS9CaOwn/eKLmv5GyWR9tHofOvhiIhxgl1+N1pl0=; b=V8SIcjIrAqGELlc+OOoDVgIzrx
	jD+r3hm0Hi7bCXKtgC7pE9CudiMGXUjxWv8KyNXkf0jhQMUUIiRowzGu+LRl++/cS5gXTD4fbHTbx
	J/qw7EnEVZ60sMHRlx2QOnr1UJSbfCo/XISTIiyRPxBvZpRrvSy/0z0yD2Db6QzMnW5LwH+GEJ7RC
	b3yAs0KwMUtjLPl/nqekx6cRM2u/CmNtdn4v1s0PelbqAjIatHAYPGnV7gM80MutxYIuDKnQ+/mmP
	H1wHQFwNIY23z9E6qku7p9YzjDHeprNmeo8NMZNR7+umxUxStJ0EgG0eerDsjCcBlfGOUZg/OTWeA
	8fphXoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv7L0-0000000F1fD-3yI4;
	Fri, 12 Apr 2024 03:12:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv7Kx-0000000F1cj-1dpz;
	Fri, 12 Apr 2024 03:12:25 +0000
X-UUID: 76e2a85ef87a11ee96d5dfc950b7243d-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e/7WS9CaOwn/eKLmv5GyWR9tHofOvhiIhxgl1+N1pl0=;
	b=QSYjclwtEiNIkVxVBDIOMSg1pufRRxgd1Mtm3TbvD6JDNpLIHOR5Ny7jHCXHH9LqyX2qleIKF7L1+9gvll5rok9bK2LWBYQFSpFG36qytY6yWsnQwA+wMUXWUv6Caq59vK5f6QkU6gXwZs+nlOtKWVWm0zou2KPuc50E6/lOuoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b5ae811a-5662-47f9-b928-120bedc54580,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:89d39482-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 76e2a85ef87a11ee96d5dfc950b7243d-20240411
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1594110904; Thu, 11 Apr 2024 20:12:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 11:12:10 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 11:12:10 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v2] mediatek: dsi: Correct calculation formula of PHY Timing
Date: Fri, 12 Apr 2024 11:11:39 +0800
Message-ID: <20240412031208.30688-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.633600-8.000000
X-TMASE-MatchedRID: /Sl7yZT/bBI926lAoePLB3V7tdtvoiba+usHeIAEdV/7eDzreGwykXGp
	r8/fPJWibmtAlFao2lnnaqDS132s4nAvdl/gU+kWe8FaKRfM2oMAa2OncjP1G9iCsYPC4Ul2+Vi
	hXqn9xLEG8FDLLrNywcMR+p3i+7r+SSOWVJeuO1AURSScn+QSXt0H8LFZNFG7MGpgBNI6BaPNJt
	heTOpPzdOSf5nvskmEEcLnS87bz6f5kjJDG0OmloJIjfAzZ/NPWPN3/J2RV2mHSGi7LAgkKJt+N
	NnvujuxaS00v5SMoE6ElVGWRzS6/kYFeh7KssddUGjjbmeia+IPZN5fBGmCHDkCyv2R+K5WftwZ
	3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.633600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AB5D098F171CEC07E897EF910FAFBB6BE93F6B478FC6CB898481F0DBEC61CB022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_201223_635284_CBC61A0A 
X-CRM114-Status: GOOD (  10.17  )
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
The spec define HS-PREPARE should be from 40ns+4*UI(44ns) to
85ns+6*UI(91ns). But current duration is 88ns and is near the boundary.
So this patch make the duration to 64ns so it is near the safe range.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v2:
Add a commit to describe the improvements to this patch in detail,
per suggestion frome previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240315072945.19502-1-shuijing.li@mediatek.com/
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


