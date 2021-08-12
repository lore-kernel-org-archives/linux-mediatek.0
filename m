Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B3C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C091760E97
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C091760E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcZINkqdB3aOX7+IIAU2/oT4pjC8CmJRgNficGJATQw=; b=gq23HnAfLylJlv
	O0fcZD/8hxaxbd+M8QCuPvLAtMtsZmLFEUvf0v1Wh5SrVHVnOXDRy0jlomXuD/en1Dc6a4W8+ZRWV
	Mj+AeduSNWY4aKcllZV02TwwwM05mPuPHV2/ExhkqxOIll5FNNUFCIdwbOQFAOPeGGOVtyjWCSDNP
	7IgwfiNzGY5xcDQnt17Q2Mqb3WyH39WX/hg/uKPDYBJ9kTknC3Bt8gRXHHLogcaUu6ToQsA+ECD/r
	x/YUkG2fUE8FHQWbY8YsytV8hdpXwPRf5B8T6RCRzhRbeCURS53BTX2tyls4khL8SI5kfHm41STeq
	14u4wlXzBujOzaXhsYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6hI-009JPA-8Y; Thu, 12 Aug 2021 09:08:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6dV-009HgY-1o; Thu, 12 Aug 2021 09:04:29 +0000
X-UUID: 63b89f61c41946068ed25b1378dcfcee-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vh3pMuZfSvPzJZMQ3BQnGIMNBEpn+SVnOXWgrEedeL4=; 
 b=Q5/5tyIB4lXK6SpEJuslK65JlZqYK3d78aeGmlSPsStjITJh6/o/kIr1aIhvBlNAbjKCwET5gXgh4WY/mMeZcGjFhci2kXOjopIcAE2mJQZpz7O0LkjzAYZrX0g59PxIugRf8yts3gs/UZxQtKYDB+LwnvPX9EPeKIP81F5p9mc=;
X-UUID: 63b89f61c41946068ed25b1378dcfcee-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1729823899; Thu, 12 Aug 2021 02:04:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:00:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 17:00:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Aug 2021 17:00:21 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Dawei Chien
 <dawei.chien@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
Subject: [V11,PATCH 05/19] soc: mediatek: add support for mt6873
Date: Thu, 12 Aug 2021 16:58:32 +0800
Message-ID: <20210812085846.2628-6-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210812085846.2628-1-dawei.chien@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_020425_161399_C2FB6D4A 
X-CRM114-Status: GOOD (  14.95  )
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

From: Henry Chen <henryc.chen@mediatek.com>

add support for mt6873

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 114 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 6ef167cf55bd..1f053367eabe 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -102,6 +102,16 @@ static const int mt8183_regs[] = {
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
@@ -377,6 +459,35 @@ static const struct dvfsrc_soc_data mt8183_data = {
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
@@ -391,6 +502,9 @@ static const struct of_device_id mtk_dvfsrc_of_match[] = {
 	{
 		.compatible = "mediatek,mt8183-dvfsrc",
 		.data = &mt8183_data,
+	}, {
+		.compatible = "mediatek,mt6873-dvfsrc",
+		.data = &mt6873_data,
 	}, {
 		/* sentinel */
 	},
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
