Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B10C2FC0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ATIZpJ2w3N3sucx0S1V3QUJsvXOXomP4YLguTKBHGM=; b=4iwEi27/FofuVkHapf1vdfLD73
	PwhKgNhyN6RMR3o3YhTTQvUIg1pNBYxBTgsknhzklPcixRJCzn7Fgqs2moyCYuzqg4iIJoR+Q61Vj
	a6GCtjsci9hLMe8juEi50mfz+5kJnWRjLyzMju0OYZGFdAX3XEvzzQsy5wPvmRkS+Mgk3uZm2m6dL
	imA3e59WCbfioqdNvZ5k50djQ4pUYnH/7is/q5UYfYw/1k0LrXj86akpKqgcmP9R2Hq9gbxnELUeG
	L/qgW+zRTfEKSp9a9FMBYOjF/xlJL58ddc+z90RtHi8Fgp9H1oeZXYDC2uVM1Km2cEekob5kjdWqx
	QdjqlZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxc-005mKk-1J;
	Thu, 17 Aug 2023 08:02:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxW-005mH0-2Q
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:25 +0000
X-UUID: 5fc4238a3cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9ATIZpJ2w3N3sucx0S1V3QUJsvXOXomP4YLguTKBHGM=;
	b=D0BSsREPppvg0gEZzrOEGqrtVvx4Kxr7Yc3ZGg5WtzkSPS26nS6tmZLxzoIxEmj++LFl+UWsqIT2g9EnM5MsYMgFgltM1HbBVs6OdDFGwe+u+9f8oj8NqNT3So34tbuUgJ4HDwpaxw4VOHvDwjpzejWBDfUbVl06/4gonO0jfFM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:21ff89a6-b080-4c78-a049-451767086b5e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:21ff89a6-b080-4c78-a049-451767086b5e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:4384f5c1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:230817160211GDCU45EO,BulkQuantity:1,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 5fc4238a3cd411ee83ed1395ce914268-20230817
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1879048078; Thu, 17 Aug 2023 01:02:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:10 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Michael-CY Lee <michael-cy.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 1/9] wifi: mt76: mt7996: set correct wcid in txp
Date: Thu, 17 Aug 2023 16:01:46 +0800
Message-ID: <20230817080154.16475-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010222_790766_18619E9F 
X-CRM114-Status: GOOD (  11.93  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Set correct wcid in txp to let the SDO hw module look into the correct
wtbl, otherwise the tx descriptor may be wrongly fiiled. This patch also
fixed the issue that driver could not correctly report sta statistics,
especially in WDS mode, which misled AQL.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Co-developed-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c       | 8 +++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 68ca0844cbbf..87bfa441a937 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -257,6 +257,8 @@ enum tx_mgnt_type {
 #define MT_TXD7_UDP_TCP_SUM		BIT(15)
 #define MT_TXD7_TX_TIME			GENMASK(9, 0)
 
+#define MT_TXD9_WLAN_IDX		GENMASK(23, 8)
+
 #define MT_TX_RATE_STBC			BIT(14)
 #define MT_TX_RATE_NSS			GENMASK(13, 10)
 #define MT_TX_RATE_MODE			GENMASK(9, 6)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ac8759febe48..9e866ee13c85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -991,10 +991,8 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	}
 
 	txp->fw.token = cpu_to_le16(id);
-	if (test_bit(MT_WCID_FLAG_4ADDR, &wcid->flags))
-		txp->fw.rept_wds_wcid = cpu_to_le16(wcid->idx);
-	else
-		txp->fw.rept_wds_wcid = cpu_to_le16(0xfff);
+	txp->fw.rept_wds_wcid = cpu_to_le16(sta ? wcid->idx : 0xfff);
+
 	tx_info->skb = DMA_DUMMY_DATA;
 
 	/* pass partial skb header to fw */
@@ -1051,7 +1049,7 @@ mt7996_txwi_free(struct mt7996_dev *dev, struct mt76_txwi_cache *t,
 		if (likely(t->skb->protocol != cpu_to_be16(ETH_P_PAE)))
 			mt7996_tx_check_aggr(sta, txwi);
 	} else {
-		wcid_idx = le32_get_bits(txwi[1], MT_TXD1_WLAN_IDX);
+		wcid_idx = le32_get_bits(txwi[9], MT_TXD9_WLAN_IDX);
 	}
 
 	__mt76_tx_complete_skb(mdev, wcid_idx, t->skb, free_list);
-- 
2.39.2


