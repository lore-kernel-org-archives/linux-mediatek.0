Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AFDC47DD7
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ0SqrDpCqnZYAflAHsK8+u/jhmOLqrfhMsxL0zC1AQ=; b=OUgxuwfGQosoKGK2kunV//ptVw
	2N1IhvVfIdYtXcJIx+ZZR68oo2jX5vN3g1m66XJphWLpF3DJd+Z6ZOOb5VHUS3iI4o+eTwTg92px8
	S6DynFHulVoZM3qpHNTYAuSr8klDwyDjX24niHg7gdSDt4Bs/YYnz/DUfKlVMTNJDjDEES2qKyrB8
	lWNCW5mcpLhYaeM3hlCEvYEjqy2s7mLXSLcu6Jy+jAM1tHzQNOqZFyCHsIlOjqux8p4fFarGl8SrW
	+nyctCyLpfc3d209UVTrz1XkZNn67J+PQop797deKyABKrXYZ3WVm61QNVRb/ZM1QKm+XjkHuQuo9
	1LhIePlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhA-004uBJ-2f;
	Fri, 19 Jan 2024 08:57:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkh8-004u9g-2f
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 08:57:48 +0000
X-UUID: cc3de232b6a811eea0bf134e88e6c2dc-20240119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BJ0SqrDpCqnZYAflAHsK8+u/jhmOLqrfhMsxL0zC1AQ=;
	b=npcHudFYw+JE4i0RWvde+MOewi+MdD3Vnj0foq3HmNRDdagtBcNoFHHRNfq6wZokUaNN34XEPz/WzYpb6p4wVXs4UWaMgbAkiNEK3u4oB2mt6VxFNKG557fCasDaijkj4nT+9Hxt+4BjqjYGNFjE+OBgcFcE9sqgkVQTfnGi0hY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:8bb8887b-543d-4587-8bf6-d2f6a42c1e51,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:5a6b0783-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cc3de232b6a811eea0bf134e88e6c2dc-20240119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 613322702; Fri, 19 Jan 2024 01:57:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 16:57:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 16:57:36 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/12] wifi: mt76: mt7996: remove TXS queue setting
Date: Fri, 19 Jan 2024 16:57:05 +0800
Message-ID: <20240119085708.23592-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240119085708.23592-1-shayne.chen@mediatek.com>
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.136400-8.000000
X-TMASE-MatchedRID: K2+WBV866GAVAKRaMHqjDp7tR0mnRAg1WDLajM22ETb/mpvOG+QCxGb6
	PphVtfZgsNV8m2Omj9WAMuqetGVetnyef22ep6XYymsk/wUE4hoLG5FW/oUH2X6+otVvpGvg79N
	tqUTGm/7Z+SNyTS8g/rGUvZLrN57u
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.136400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 11DBD51384D9160F3FEEA72E6DEC9BE9DDF368A630A91AFC1F9B93F66A3F8F082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_005746_873291_661DA096 
X-CRM114-Status: UNSURE (   7.44  )
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


