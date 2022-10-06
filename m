Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F86C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 04:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeUlVgx+QgZwWz9wCjYV71PSLvTf5NrW0pJ9W294SgA=; b=n9SBms3q00F+XlIFGHDFNpuAwA
	/1zmfc4SDrMDP9BZE5xULtR3xrm5HQNF1Bd6xtfF+vtYCzhvNjvq/oBllJJmLtkapLnR70snoIHZO
	SfPeclrDwVkcd/6ksg+bVBK+ZfJyru0Gdi9y+38dH8yW4ZROgGs1qHfFTSImJuyjhVJzhuhp8ww+D
	3qjVYrbu2HNfeX2XBTvyBTcaSb65HoDcN7HXNh1sWq5tFnovdyJjxoLreitsB/v9tkQzZIexWsoWw
	Mga3pG40YOxa2C9t8GBb28lECozu3pHv/ZWLv03cpRBUe22rfmalr6OeNoatwNBR4UgUqRZvoWaTA
	Ruv5Vs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIbt-00HNuj-CI; Thu, 06 Oct 2022 04:35:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIbq-00HNsP-5K; Thu, 06 Oct 2022 04:35:47 +0000
X-UUID: c6a18642edf046c3a38581fd1712a9e1-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oeUlVgx+QgZwWz9wCjYV71PSLvTf5NrW0pJ9W294SgA=;
	b=SlfHEHHwaCAPwhYdq4R97XUehV+hyssq9Bj/yxW6tGK6Y/ZCrwlg8pPl1IaACNrFnsXveEcI91Pkr08xG+20Ws2TqtqJ/HG6R/fYadivcv+g9YgnlRPtvfa3wbu+dC3+TMDo00Qr2bNdh9CjqL5kRr/tz28UGmX6rGrY/8fYbHM=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11,REQID:1714fd6a-6732-49d0-a46b-e5c3c2b30b72,IP:0,U
	RL:0,TC:0,Content:59,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:159
X-CID-INFO: VERSION:1.1.11,REQID:1714fd6a-6732-49d0-a46b-e5c3c2b30b72,IP:0,URL
	:0,TC:0,Content:59,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_US65DF41,ACTI
	ON:quarantine,TS:159
X-CID-META: VersionHash:39a5ff1,CLOUDID:a0eaab85-5312-4339-9a65-dc27c4b243b8,B
	ulkID:221006123502A2191ENS,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48|801,
	TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: c6a18642edf046c3a38581fd1712a9e1-20221005
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1039781455; Wed, 05 Oct 2022 21:35:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 6 Oct 2022 12:34:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 12:34:58 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v9, 1/4] mailbox: mtk-cmdq: Use GCE_CTRL_BY_SW definition instead of number
Date: Thu, 6 Oct 2022 12:34:53 +0800
Message-ID: <20221006043456.8754-2-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_213546_223304_0137CF74 
X-CRM114-Status: GOOD (  10.67  )
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

Use GCE_CTRL_BY_SW definition instead of number

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..c3cb24f51699 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -38,6 +38,7 @@
 #define CMDQ_THR_PRIORITY		0x40
 
 #define GCE_GCTL_VALUE			0x48
+#define GCE_CTRL_BY_SW				GENMASK(2, 0)
 
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
@@ -129,7 +130,8 @@ static void cmdq_init(struct cmdq *cmdq)
 
 	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
 	if (cmdq->control_by_sw)
-		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
+		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-- 
2.25.1


