Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F157C25B08
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 00:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQilvMFKBxazIlswRqWv91yqQ/yCqwwKRxMlrAjTfZU=; b=JlVH6E4KWhQOOOoXQ7Rcp7Thx2
	H9LRiH4giecV1eODfbOeIQxsn8Ot0cpYhuIIQ9TpEP+B/S7/8q59l7PTtDGNP3T46pje2BWK+foYh
	eUfBzQXO9rbD+06iQeWtWHtf6KLkHJwXoGgfmzpzBQWGN6ONrWRcSdGCldl/1hMFwoDEqhNbueA6Y
	c7fUNgVXdcVM4sWEciwg/7jJu/9fQ+iL8HI1lYlBuDAflhx1tCP7aw8lul7nPJrSdr5qo8dnc7pyZ
	A3Q9q2KvpT9Fi+pab/AwQWybytjiKJQGplq32Nv560vqbIwsy+OL56YelO7X0pOX88Y4cahuaL7SS
	9YODogkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNNxs-00A2ma-KX; Mon, 15 Aug 2022 00:28:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNNxp-00A2kf-VR
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 00:28:19 +0000
X-UUID: 5b6e34485d074025972c95750b125e35-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bQilvMFKBxazIlswRqWv91yqQ/yCqwwKRxMlrAjTfZU=;
	b=GL90L7P6nK13GFdisTvzHnlzkVUl0lhiFTa0I/FPzbgGvFfUNPMHjiuRgunMrHPMG8TPH2NW5p8NNwtOAfVVaj/JBcDom+gD/m+QVzfLIEmbHI5rDDdOaJChKFv5sWLEYflwoOwybUygEviIirNLbbNM5z/BDR0KSXpQTRGKrgY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:dbb785c2-0155-4580-bd7d-52dedf9d16f6,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:f88f45fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5b6e34485d074025972c95750b125e35-20220814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 829021929; Sun, 14 Aug 2022 17:28:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 07:37:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 15 Aug 2022 07:37:15 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: get rid of the false positive reset
Date: Mon, 15 Aug 2022 07:37:14 +0800
Message-ID: <95b03bb77ce93cb2cade98d947309cd669721939.1660519674.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_172818_182318_7666AE15 
X-CRM114-Status: GOOD (  11.44  )
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

From: Sean Wang <sean.wang@mediatek.com>

False positive reset would be possibly triggered by those commands we
applied in suspend with HZ MCU timeout, especially it happened when we
enabled kernel log in pm core to diagnose how much time we spend in each
driver during suspend procedure. So we enlarge the value and align the MCU
timeout as other commands we did to reduce the false positive reset.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c  | 7 +------
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c | 7 +------
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c      | 7 +------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
index 5efda694fb9d..64568536c1e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
@@ -30,12 +30,7 @@ mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (ret)
 		return ret;
 
-	if (cmd == MCU_UNI_CMD(HIF_CTRL) ||
-	    cmd == MCU_UNI_CMD(SUSPEND) ||
-	    cmd == MCU_UNI_CMD(OFFLOAD))
-		mdev->mcu.timeout = HZ;
-	else
-		mdev->mcu.timeout = 3 * HZ;
+	mdev->mcu.timeout = 3 * HZ;
 
 	if (cmd == MCU_CMD(FW_SCATTER))
 		txq = MT_MCUQ_FWDL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
index e038d7404323..5c1489766d9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
@@ -33,12 +33,7 @@ mt7921s_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (ret)
 		return ret;
 
-	if (cmd == MCU_UNI_CMD(HIF_CTRL) ||
-	    cmd == MCU_UNI_CMD(SUSPEND) ||
-	    cmd == MCU_UNI_CMD(OFFLOAD))
-		mdev->mcu.timeout = HZ;
-	else
-		mdev->mcu.timeout = 3 * HZ;
+	mdev->mcu.timeout = 3 * HZ;
 
 	if (cmd == MCU_CMD(FW_SCATTER))
 		type = MT7921_SDIO_FWDL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index dd3b8884e162..d06cee386acd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -106,12 +106,7 @@ mt7921u_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (ret)
 		return ret;
 
-	if (cmd == MCU_UNI_CMD(HIF_CTRL) ||
-	    cmd == MCU_UNI_CMD(SUSPEND) ||
-	    cmd == MCU_UNI_CMD(OFFLOAD))
-		mdev->mcu.timeout = HZ;
-	else
-		mdev->mcu.timeout = 3 * HZ;
+	mdev->mcu.timeout = 3 * HZ;
 
 	if (cmd != MCU_CMD(FW_SCATTER))
 		ep = MT_EP_OUT_INBAND_CMD;
-- 
2.25.1


