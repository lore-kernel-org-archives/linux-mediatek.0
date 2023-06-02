Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7528FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft/fewbjIWf+g8/t7x19xDPiG13CNkK4j34oqEeAbXM=; b=pygitM1D9i6CQClq84gLV756r6
	EIPty0NzW4imWH5TvwRsIzexU+B5NnjCOCTgaWjHaWaaC+3FUDw/x06TYV3a17e7R1S7IwciqRa0d
	TDz6+8Z7kf1r3Jy4KuBfz9GYv7aj5F8u7hA4Tj7Y8tdpDRw2nYSk+RyNsYZBrgzh4x+AVPU9nTfjs
	oihrswqov+0eiPQnf5ftSXkx1h0IvI10Yx00amRwOhnmpi++UzXSLZlNue7Ocyks2z4kYRF6moB7W
	57KiEbv/9dw4YGAVAN5Yk7i3rgCrtFB3XJNrwvLIxd5fDT6JPNk7HQ+Pw6euhDFuNWbrb1WvAS7LH
	QPgnGLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56br-007FF5-1n;
	Fri, 02 Jun 2023 15:22:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56bp-007FDQ-1O
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 15:22:34 +0000
X-UUID: 49b31940015911ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ft/fewbjIWf+g8/t7x19xDPiG13CNkK4j34oqEeAbXM=;
	b=LmMBmTlwxVOvUap+qeTBOtF+XanHnWR12suIEIb2nymAe8/fv2usSSgRDBe2VOH3zKTk67nXOdIg/QPXrR6ZjFpRaHh/vjTkEJ6robFtd8BsVrRRDdUzBYS3xRArSxIjPL8HB9861An8UX4y3lmy9b2evbYB2SijJ6okF8EvHfY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:8fa87986-a8e9-4d63-a617-f20ef6d4d5fd,IP:0,U
	RL:0,TC:0,Content:32,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:32
X-CID-META: VersionHash:d5b0ae3,CLOUDID:35f5da6d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 49b31940015911ee83ed1395ce914268-20230602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1653092855; Fri, 02 Jun 2023 08:22:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 23:21:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 23:21:51 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/12] wifi: mt76: mt7996: use correct phy for background radar event
Date: Fri, 2 Jun 2023 23:21:05 +0800
Message-ID: <20230602152108.26860-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230602152108.26860-1-shayne.chen@mediatek.com>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_082233_479275_B85E7830 
X-CRM114-Status: GOOD (  10.84  )
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

If driver directly uses the band_idx reported from the radar event to
access mt76_phy array, it will get the wrong phy for background radar.
Fix this by adjusting the statement.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 52c6c502e9b3..48782b53f5d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -339,7 +339,11 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev, struct sk_buff *skb)
 	if (r->band_idx >= ARRAY_SIZE(dev->mt76.phys))
 		return;
 
-	mphy = dev->mt76.phys[r->band_idx];
+	if (dev->rdd2_phy && r->band_idx == MT_RX_SEL2)
+		mphy = dev->rdd2_phy->mt76;
+	else
+		mphy = dev->mt76.phys[r->band_idx];
+
 	if (!mphy)
 		return;
 
-- 
2.39.2


