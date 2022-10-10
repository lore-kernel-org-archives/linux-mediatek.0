Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx7sXuUBvEE9QAd53CEh8o8OnGbAN1O/srykfC8rXao=; b=mYTl0PcqBDV0chfXGZx0LfxriT
	3erlDqjQoIpZcHDADV3mmR84wIa1UQY6hP3lyYSTng6lHhrEn298oxHKbhQoiVBk/QwpgCudYZj+v
	hs/sOtnW4NHwHP0RjC3P1feK+cFqpDh8mpSnPFyfSHPvxIMoyXv0dqHQRWO+imnLdr8lmOvPt039G
	EXwLCRuOrOxZ2TgXiPg2ncceca9bKoUTZozyhQu48GvAvPjG3q6sClEeVptwrVvvdkNtSpGyiIvXJ
	sd22unsnw0KSVTCQRxqW27PzARN3cZBG8Mou+cJMF5Ac9lO4Z9YKYZpQRUyEhcOPrn6uDe6imCzrp
	Qqcsn4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohr3t-000dHG-Qn; Mon, 10 Oct 2022 11:35:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohr3o-000dFX-Tq; Mon, 10 Oct 2022 11:35:08 +0000
X-UUID: af72526ff09e4bfda57859ba7cd85bec-20221010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mx7sXuUBvEE9QAd53CEh8o8OnGbAN1O/srykfC8rXao=;
	b=pAFpWTm4wjpNMp+wwW5Jf6fYEYvy3oQsrDg5RKnX2SdAzZq/tKnCTcvvY/ZD1MZve+huOHqYBE4RYnQa5f7IbSbq51fH9ShElrt9rrXP3qZkh3segVmC7Qcw2gQJXdV1JgAvaw8VlwSoT9NysldhQHOebQW3RgASz0qzFQ55H+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f09e172b-3533-47e5-b91e-57336d1cefb0,IP:0,U
	RL:0,TC:0,Content:32,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:32
X-CID-META: VersionHash:39a5ff1,CLOUDID:27b8c4fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: af72526ff09e4bfda57859ba7cd85bec-20221010
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 934439395; Mon, 10 Oct 2022 04:32:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 10 Oct 2022 19:32:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 10 Oct 2022 19:32:02 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v10, 4/4] mailbox: mtk-cmdq: add MT8186 support
Date: Mon, 10 Oct 2022 16:50:23 +0800
Message-ID: <20221010085023.7621-5-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010085023.7621-1-yongqiang.niu@mediatek.com>
References: <20221010085023.7621-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_043504_985110_2EAEA789 
X-CRM114-Status: UNSURE (   8.98  )
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

add MT8186 cmdq support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 53904511598d..c5229f377c5e 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -694,9 +694,18 @@ static const struct gce_plat gce_plat_v6 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_v7 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_num = 1
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
+	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
-- 
2.25.1


