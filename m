Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BD7C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxBk4ypnkqYXwOw44DslhDRSNb58MKb2UrCUgoOWTYg=; b=FHV8d3n3ft+Rhow96JCjYNHf71
	8ewGxatCvEo+Q5VooKBqb7x6KmsirLJYbQ84bSSNCQCWvpCxB5hCbaEibUIDLe7XOB0NUEXEVyIf/
	V0ZpEBHz9KplAu5mPT6Rgq37HM0hPwmns4m/bdZg7cO3o4irk2jgkADeyWV2/4JnSR7BTyOi/Hm97
	3QOQnTXDlcAPKx2EPicmSt2YVlkQ+Q6C2z/uS290gHIfSGp3/ORbl9s9R2Sokm+OjuuUYbpRjy+/g
	S1MAluHKjRDQ2s//z6g9+iFgsc9h45fwKDi4m+vvBM534eDsqdhP4W+VsNkQTgZSI/eQ6+zk1RSrx
	e09jrdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SN-00EgzS-2I;
	Mon, 05 Jun 2023 08:20:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SK-00EgxY-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 08:20:49 +0000
X-UUID: de10a0c2037911ee912e1518a6540028-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XxBk4ypnkqYXwOw44DslhDRSNb58MKb2UrCUgoOWTYg=;
	b=tdjx+bWO6z8kOREJ9z6sTH0rbfXnBD40A8uyC2FA0hdpv5ceX9behbqt9p90TjFBWxNNV/zcXyOs3kOeccWo6sWc9RkQGksjG+f7r1tBqtufjuXEIGOytmJxDWvyf7HvZb+DLZdqd34FkOtRLvIFDzTnvMM1tEhr56fdmwh49R0=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.25,REQID:5a13e0b3-9f13-4ec2-ac64-b638bc24373c,IP:0,U
	RL:0,TC:0,Content:31,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:126
X-CID-INFO: VERSION:1.1.25,REQID:5a13e0b3-9f13-4ec2-ac64-b638bc24373c,IP:0,URL
	:0,TC:0,Content:31,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:126
X-CID-META: VersionHash:d5b0ae3,CLOUDID:db0f0c6e-2f20-4998-991c-3b78627e4938,B
	ulkID:230605162046RU9HBT0C,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:3,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: de10a0c2037911ee912e1518a6540028-20230605
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 675560491; Mon, 05 Jun 2023 01:20:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 16:20:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:20:41 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 07/10] wifi: mt76: mt7996: use correct phy for background radar event
Date: Mon, 5 Jun 2023 16:19:44 +0800
Message-ID: <20230605081947.12804-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605081947.12804-1-shayne.chen@mediatek.com>
References: <20230605081947.12804-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012048_448687_75FC7707 
X-CRM114-Status: UNSURE (   9.97  )
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
index 7eafb5c44a7f..398d27d522ef 100644
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


