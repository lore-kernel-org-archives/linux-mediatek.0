Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29271C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TL1DUTNfvzaTDC5V59A/ZBBk1n7wWZR3gc8cGOLQ5D4=; b=NvtJhFbnLIArHZTtHnrG3WTog5
	O/5QcEjOAfLMZFYSJvzQqHA2zpF7lSvbo1ok9zLLObkybpkq7fQmijyB0xSmhlMJTLlKGPZil/5hg
	HjEXtxIU1ktkjXQ4JsgcDaX8KyrVhT1kQsAfpX1rqdDNSwZlANRw1dIhvH0d2pqdqCqwp1jlMskBs
	gfJ3p6/Y71/YEaofZzpfLweDHE9fBLfV3adOVW3YJLwtFsQ7GfzGUAPKnak9mcUOzDML2sSJoYCOr
	E1YE5QBKva1UBHCb735JluTJBd7eVP2oBPT3eIPoc09cpzvhuCQ55F3RZf772BfMlk/FnKS528V6R
	HoMqefsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otOb6-00DuAZ-UF; Fri, 11 Nov 2022 07:37:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otOb0-00Du9j-UL
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 07:37:04 +0000
X-UUID: abd9e54267f344328fd16967385f4271-20221111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TL1DUTNfvzaTDC5V59A/ZBBk1n7wWZR3gc8cGOLQ5D4=;
	b=euRNAwOzB8yEiRwTM3nZe5E2XO7WcRKyHzROM78uNIVY6350LfBM4lGJkAmyAf5mAfb7VynW/HN+ck/t1+J3GsCtlTX8SHQg44wo77xXeWYixeiMthS6qsSuvlskJZn/4AyC033v6RKd8edur/HyGbK1Dd43d0UKEcsknUoR4dc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:75af9219-fce4-4239-b8f6-02a2c7fc379c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:9301ff85-088c-4756-8f76-577be701e693,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: abd9e54267f344328fd16967385f4271-20221111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <evelyn.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1192972103; Fri, 11 Nov 2022 00:36:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 11 Nov 2022 15:36:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 11 Nov 2022 15:36:16 +0800
From: Evelyn Tsai <evelyn.tsai@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] wifi: mt76: connac: update nss calculation in txs
Date: Fri, 11 Nov 2022 15:36:15 +0800
Message-ID: <20221111073615.25666-1-evelyn.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_233703_049470_840133E5 
X-CRM114-Status: UNSURE (   8.71  )
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

Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 8b7ec64abc95..fd60123fb284 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -567,7 +567,7 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 	struct mt76_phy *mphy;
 	struct rate_info rate = {};
 	bool cck = false;
-	u32 txrate, txs, mode;
+	u32 txrate, txs, mode, stbc;
 
 	txs = le32_to_cpu(txs_data[0]);
 
@@ -587,6 +587,10 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 
 	rate.mcs = FIELD_GET(MT_TX_RATE_IDX, txrate);
 	rate.nss = FIELD_GET(MT_TX_RATE_NSS, txrate) + 1;
+	stbc = FIELD_GET(MT_TX_RATE_STBC, txrate);
+
+	if (stbc && rate.nss > 1)
+		rate.nss >>= 1;
 
 	if (rate.nss - 1 < ARRAY_SIZE(stats->tx_nss))
 		stats->tx_nss[rate.nss - 1]++;
-- 
2.18.0


