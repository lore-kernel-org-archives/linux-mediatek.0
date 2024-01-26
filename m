Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18042C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ0SqrDpCqnZYAflAHsK8+u/jhmOLqrfhMsxL0zC1AQ=; b=mjEzJcAcwxhmbdAStZeR15S2og
	MgEOE4SP+7kzzLj+IUe6YMBDOzZ1SQ5fZETOpeLB8+FX71+zmeKJrv2GvPY4tSNqJlwGwawJ8zNn8
	WCnqvp9XBYmZqo+m54aeiLBuywQ+cYeGOP/pVRJtSjA5Oqxv7s7BDt8d9T5X6YqYkg9oc3vaEKHwb
	BNKOrq7gZUwH/zft1zwfnXDpfn722tZavrYWWjA3DmQX8ci3ImrZ2a+qO4Ysn+t1sAISrtLFRsWWk
	2UbpmheBiAXPTpErWgkvZ+5KcYkwQDxXSEwbbkMJB7j0x8SVcvTVH3d7a1ACDm7qtzyb6Va7htT0s
	CxhRwQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDq-00000003ZzV-2iPH;
	Fri, 26 Jan 2024 09:10:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDm-00000003ZvE-0M45
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:09:59 +0000
X-UUID: a9d9952ebc2a11eea0bf134e88e6c2dc-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BJ0SqrDpCqnZYAflAHsK8+u/jhmOLqrfhMsxL0zC1AQ=;
	b=OTBiLRr8gGNOwKMYahJhDKvNq/FSxW3Yzf7i66BvzcGKS63KeI0FBi/r/maLlmI/GMnIt33ruRsjZE58p405TU6jq1U+alwU+PhumRX7pdhskOwySDaH/PZuNR+jJxDH8pirvdtKMbFE7Hir+jJnRvthGqIXmgHXX0SomFbSeok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:5eb56aca-be73-4a68-9434-e1e28df8a5cd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:1f6f2efe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9d9952ebc2a11eea0bf134e88e6c2dc-20240126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1185340794; Fri, 26 Jan 2024 02:09:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Jan 2024 17:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Jan 2024 17:09:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 09/12] wifi: mt76: mt7996: remove TXS queue setting
Date: Fri, 26 Jan 2024 17:09:20 +0800
Message-ID: <20240126090923.6357-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240126090923.6357-1-shayne.chen@mediatek.com>
References: <20240126090923.6357-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_010958_161547_1B52C134 
X-CRM114-Status: UNSURE (   8.40  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

DMA queue settings of TXS will be initialized by the firmware.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 1a1a60744272..5ae56b10f2b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -507,11 +507,6 @@ void mt7996_mac_init(struct mt7996_dev *dev)
 		mt76_rmw_field(dev, i, MT_LED_GPIO_SEL_MASK, 4);
 	}
 
-	/* txs report queue */
-	mt76_rmw_field(dev, MT_DMA_TCRF1(0), MT_DMA_TCRF1_QIDX, 0);
-	mt76_rmw_field(dev, MT_DMA_TCRF1(1), MT_DMA_TCRF1_QIDX, 6);
-	mt76_rmw_field(dev, MT_DMA_TCRF1(2), MT_DMA_TCRF1_QIDX, 0);
-
 	/* rro module init */
 	if (is_mt7996(&dev->mt76))
 		mt7996_mcu_set_rro(dev, UNI_RRO_SET_PLATFORM_TYPE, 2);
-- 
2.39.2


