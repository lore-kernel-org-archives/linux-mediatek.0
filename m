Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A84C74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 05:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6grznLo16PGHDdoZ3GGQ80Zx5bZgg/pwk+T59FpoqI=; b=aId5WWhx2VxnVO6QogGSJsWjET
	ofj1qtncf7C7WjtislujCPn5qExIXr2FNTgNaKKJ0Z7BB4xMpSKIPUKal0wgctMe0NjJeicSb3vr9
	oA9q+D5NiWIg18CpN1pGNRvmFQM6A08ftmVnEHc6Gjn+crj8jeLi5MNmLSZqX+ibQOOjD0LuE420j
	2b9dtRT64IdwhdzKK8TW6JHhFZvqkcB8pHInRYBQsoIDx5GeyA4vvoBKNCoWiGW2lA7CnEsVJzNxH
	wv/urVwEBCSsYYgzjUj0pDFFd/30aPLfL1IdmDsTBMYiQEHVnObPcIipZxM3wkkSRk+vp/CRr4OdS
	x7blzAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phkq8-002dZ3-29;
	Thu, 30 Mar 2023 05:28:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phkq5-002dXk-2Z
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 05:28:47 +0000
X-UUID: b9316478cebb11ed8687db9d93187ff1-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=R6grznLo16PGHDdoZ3GGQ80Zx5bZgg/pwk+T59FpoqI=;
	b=RhIW54ELCzmI6mS6fbmXgzS/Jkbh76onpgeX1keGx0hf0GpL+Nv58KMire6hCDOj9WvE9qYvo2PvcsMDPjuqI2hy+2g7siu0RDDVc1B/EPSzMgG7jBvDEq7k0LO5tbZd7Oqelg5S+JE50nUlOFSBm0GJpDph6mpeb9NjeRb9CyU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:f27b70c4-bc5a-473d-b600-d4e50f46d196,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:d7ccee29-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b9316478cebb11ed8687db9d93187ff1-20230329
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <stanleyyp.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 717928130; Wed, 29 Mar 2023 22:28:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 13:18:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 13:18:35 +0800
From: StanleyYP.Wang <StanleyYP.Wang@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: fix background radar event being blocked
Date: Thu, 30 Mar 2023 13:17:27 +0800
Message-ID: <20230330051727.20821-1-StanleyYP.Wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_222845_982002_7DB93999 
X-CRM114-Status: GOOD (  11.17  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

The mcu event of background radar will be blocked since the band_idx of 
the background radar event is MT_RX_SEL2, which is larger than MT_BAND1. 
Therefore, this commit fixes the boundary of band_idx checking.

Fixes: 7a53eecd5c87 ("wifi: mt76: mt7915: check the correctness of event data")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 16f09ead307d..a37ab903af99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -274,7 +274,7 @@ mt7915_mcu_rx_radar_detected(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7915_mcu_rdd_report *)skb->data;
 
-	if (r->band_idx > MT_BAND1)
+	if (r->band_idx > MT_RX_SEL2)
 		return;
 
 	if ((r->band_idx && !dev->phy.mt76->band_idx) &&
-- 
2.18.0


