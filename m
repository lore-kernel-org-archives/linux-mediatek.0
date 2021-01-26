Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3C6C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:14:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F522251D
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F522251D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rasUPn9qV1y5R5DtGs5ubjZXUq1d8+RCtNera3mfVB8=; b=nbtVUcprz4k24tobGOQAv8npR
	gX2PiYWekW6lmFlvWR1z/RMW4Vs117Rc+y7h+NoXrMoq8X4/Fde8lAIk1lDuxDjZ3uzxthWnLQihJ
	YxRo38WU+onHkxarvQ8KbAVuKI5B0xNhhmp37X8Mzqn9Osv0HK+4m3M2QkLk3aAgt2C9sRhDXgxVo
	+rYe8KvIdKuPPklBKnXOxv9+UocWAKUtrBo2fnz0usZQ725GCPd9joWia0MJ8h+hx2pTkRe3H6oW+
	YBWzaR8ircuVdlO2C+TCFwseq7/arHLI4j+W6rVdTLUYDGycKB7nEuNTxwM5GEStdgwyCnidokupZ
	rEX0XhKVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4JUF-0001gt-C1; Tue, 26 Jan 2021 08:14:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4JUA-0001eY-Ef; Tue, 26 Jan 2021 08:14:03 +0000
X-UUID: f58c76059bda4ae8910a8bb88e6e139d-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1unrZPQMAfcMyUGqJ0NEbW0zCXoVksC8yD/s45yrY58=; 
 b=Zsd9KDMQLODp+4RQlvJSRHu4KDZUpbDcYk5fWJ69PBrLbcucrFO4YsMpFReGvEWeyrZfZHkcFGHoRkwHlwvf9he3Ii6xUvAwiAkBtWtVZNo6tM0Hw45Rf9jFoB8NZmwfV55PjQfthVSvUU9G21w1DGNI64VLg9D0JrX77xm9MZc=;
X-UUID: f58c76059bda4ae8910a8bb88e6e139d-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 344442772; Tue, 26 Jan 2021 00:13:59 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:03:57 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:03:56 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Jan 2021 16:03:56 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Subject: [PATCH V8 04/12] soc: mediatek: add support for mt6873
Date: Tue, 26 Jan 2021 16:03:46 +0800
Message-ID: <1611648234-15043-5-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_031402_635576_5B4F5DBE 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add support for mt6873

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 114 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index c0c6d91..a422680 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -102,6 +102,16 @@ enum dvfsrc_regs {
 	[DVFSRC_SW_BW] =	0x160,
 };
 
+static const int mt6873_regs[] = {
+	[DVFSRC_SW_REQ] =		0xC,
+	[DVFSRC_LEVEL] =		0xD44,
+	[DVFSRC_SW_PEAK_BW] =		0x278,
+	[DVFSRC_SW_BW] =		0x26C,
+	[DVFSRC_SW_HRT_BW] =		0x290,
+	[DVFSRC_TARGET_LEVEL] =		0xD48,
+	[DVFSRC_VCORE_REQUEST] =	0x6C,
+};
+
 static const struct dvfsrc_opp *get_current_opp(struct mtk_dvfsrc *dvfsrc)
 {
 	int level;
@@ -127,6 +137,78 @@ static int dvfsrc_wait_for_vcore_level(struct mtk_dvfsrc *dvfsrc, u32 level)
 					 POLL_TIMEOUT);
 }
 
+static int mt6873_get_target_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return dvfsrc_read(dvfsrc, DVFSRC_TARGET_LEVEL);
+}
+
+static int mt6873_get_current_level(struct mtk_dvfsrc *dvfsrc)
+{
+	u32 curr_level;
+
+	/* HW level 0 is begin from 0x1, and max opp is 0x1*/
+	curr_level = ffs(dvfsrc_read(dvfsrc, DVFSRC_LEVEL));
+	if (curr_level > dvfsrc->curr_opps->num_opp)
+		curr_level = 0;
+	else
+		curr_level = dvfsrc->curr_opps->num_opp - curr_level;
+
+	return curr_level;
+}
+
+static int mt6873_wait_for_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	const struct dvfsrc_opp *target, *curr;
+
+	target = &dvfsrc->curr_opps->opps[level];
+	return readx_poll_timeout_atomic(get_current_opp, dvfsrc, curr,
+		curr->dram_opp >= target->dram_opp,
+		STARTUP_TIME, POLL_TIMEOUT);
+}
+
+static u32 mt6873_get_vcore_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return (dvfsrc_read(dvfsrc, DVFSRC_SW_REQ) >> 4) & 0x7;
+}
+
+static u32 mt6873_get_vcp_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return (dvfsrc_read(dvfsrc, DVFSRC_VCORE_REQUEST) >> 12) & 0x7;
+}
+
+static void mt6873_set_dram_bw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64(kbps_to_mbps(bw), 100);
+	bw = min_t(u64, bw, 0xFF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_BW, bw);
+}
+
+static void mt6873_set_dram_peak_bw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64(kbps_to_mbps(bw), 100);
+	bw = min_t(u64, bw, 0xFF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_PEAK_BW, bw);
+}
+
+static void mt6873_set_dram_hrtbw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64((kbps_to_mbps(bw) + 29), 30);
+	bw = min_t(u64, bw, 0x3FF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_HRT_BW, bw);
+}
+
+static void mt6873_set_vcore_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	spin_lock(&dvfsrc->req_lock);
+	dvfsrc_rmw(dvfsrc, DVFSRC_SW_REQ, level, 0x7, 4);
+	spin_unlock(&dvfsrc->req_lock);
+}
+
+static void mt6873_set_vscp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	dvfsrc_rmw(dvfsrc, DVFSRC_VCORE_REQUEST, level, 0x7, 12);
+}
+
 static int mt8183_wait_for_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
 {
 	const struct dvfsrc_opp *target, *curr;
@@ -377,6 +459,35 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level,
 };
 
+static const struct dvfsrc_opp dvfsrc_opp_mt6873_lp4[] = {
+	{0, 0}, {1, 0}, {2, 0}, {3, 0},
+	{0, 1}, {1, 1}, {2, 1}, {3, 1},
+	{0, 2}, {1, 2}, {2, 2}, {3, 2},
+	{1, 3}, {2, 3}, {3, 3}, {1, 4},
+	{2, 4}, {3, 4}, {2, 5}, {3, 5},
+	{3, 6},
+};
+
+static const struct dvfsrc_opp_desc dvfsrc_opp_mt6873_desc[] = {
+	DVFSRC_OPP_DESC(dvfsrc_opp_mt6873_lp4),
+};
+
+static const struct dvfsrc_soc_data mt6873_data = {
+	.opps_desc = dvfsrc_opp_mt6873_desc,
+	.regs = mt6873_regs,
+	.get_target_level = mt6873_get_target_level,
+	.get_current_level = mt6873_get_current_level,
+	.get_vcore_level = mt6873_get_vcore_level,
+	.get_vcp_level = mt6873_get_vcp_level,
+	.set_dram_bw = mt6873_set_dram_bw,
+	.set_dram_peak_bw = mt6873_set_dram_peak_bw,
+	.set_dram_hrtbw = mt6873_set_dram_hrtbw,
+	.set_vcore_level = mt6873_set_vcore_level,
+	.set_vscp_level = mt6873_set_vscp_level,
+	.wait_for_opp_level = mt6873_wait_for_opp_level,
+	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level,
+};
+
 static int mtk_dvfsrc_remove(struct platform_device *pdev)
 {
 	struct mtk_dvfsrc *dvfsrc = platform_get_drvdata(pdev);
@@ -392,6 +503,9 @@ static int mtk_dvfsrc_remove(struct platform_device *pdev)
 		.compatible = "mediatek,mt8183-dvfsrc",
 		.data = &mt8183_data,
 	}, {
+		.compatible = "mediatek,mt6873-dvfsrc",
+		.data = &mt6873_data,
+	}, {
 		/* sentinel */
 	},
 };
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
