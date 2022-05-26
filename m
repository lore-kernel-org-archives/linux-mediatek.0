Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pUNGqTzV56jqHXkIG43aTDkJn62rpiX5i6zRXKz7DA=; b=ZKGmn6lIStpIWh
	eZOJL0j2Ad3HD8hIxd0rTzIs19yE4qeTb9dkjp3luusjAyP+vlCfE5VocxxD15M+nD9M8FTkpk40M
	rZigw5jhABL5fqkf8LGEGkPXp7OHmybuCVYXwJf4el9D9Aw/m4y7R1AgSFeoVNbYqaet/+qJG2gCr
	BB7SHotwIdmLnokzgomcJyUzC+zS44iAWUNvdDdh2CJqBNFrvM1t4+Qq3KdpBjIkJOnK5tH7i481D
	fp/UNKfqE6GB0Yr1gPAzTq9N/Vd0pmkolrIxiE8xMUIQ2sNd9Y8zGpyvLj+Pxn0fzV5LYnMOGQWsP
	WaTEqPTynfzn1C4guv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9e9-00ECLC-M3; Thu, 26 May 2022 09:19:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9e6-00ECJx-Iq
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 09:19:08 +0000
X-UUID: d2e88c1668834ca4844fb37849a99b3b-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:381fd1d6-f111-4d37-945a-22a145080300,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:e82356b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: d2e88c1668834ca4844fb37849a99b3b-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2033678041; Thu, 26 May 2022 02:18:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 02:08:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 17:08:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 17:08:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, "Ryder Lee" <ryder.lee@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 2/2] mt76: add DBDC rxq handlings into mac_reset_work
Date: Thu, 26 May 2022 17:08:55 +0800
Message-ID: <864fffa767f9fb007c7682ad7bb67ee68cfb2844.1653555432.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <53fffc4aad9d92f7ae5da7e3e9aa1f59033bb662.1653555432.git.ryder.lee@mediatek.com>
References: <53fffc4aad9d92f7ae5da7e3e9aa1f59033bb662.1653555432.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_021906_665296_08D04D26 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable/disable rx napi for DBDC.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/pci_mac.c    | 14 +++++++-------
 .../net/wireless/mediatek/mt76/mt7915/mac.c    | 18 +++++++-----------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index d1806f198aed..73298dce35b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -268,6 +268,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	struct mt76_phy *ext_phy;
 	struct mt7615_dev *dev;
 	unsigned long timeout;
+	int i;
 
 	dev = container_of(work, struct mt7615_dev, reset_work);
 	ext_phy = dev->mt76.phy2;
@@ -299,8 +300,8 @@ void mt7615_mac_reset_work(struct work_struct *work)
 		mt76_txq_schedule_all(ext_phy);
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	napi_disable(&dev->mt76.napi[0]);
-	napi_disable(&dev->mt76.napi[1]);
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
 	napi_disable(&dev->mt76.tx_napi);
 
 	mt7615_mutex_acquire(dev);
@@ -330,11 +331,10 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	napi_enable(&dev->mt76.tx_napi);
 	napi_schedule(&dev->mt76.tx_napi);
 
-	napi_enable(&dev->mt76.napi[0]);
-	napi_schedule(&dev->mt76.napi[0]);
-
-	napi_enable(&dev->mt76.napi[1]);
-	napi_schedule(&dev->mt76.napi[1]);
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		napi_enable(&dev->mt76.napi[i]);
+		napi_schedule(&dev->mt76.napi[i]);
+	}
 	local_bh_enable();
 
 	ieee80211_wake_queues(mt76_hw(dev));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index f59662af3d9d..27b3080469a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2124,6 +2124,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	struct mt7915_phy *phy2;
 	struct mt76_phy *ext_phy;
 	struct mt7915_dev *dev;
+	int i;
 
 	dev = container_of(work, struct mt7915_dev, reset_work);
 	ext_phy = dev->mt76.phy2;
@@ -2145,9 +2146,8 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		cancel_delayed_work_sync(&phy2->mt76->mac_work);
 	}
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	napi_disable(&dev->mt76.napi[0]);
-	napi_disable(&dev->mt76.napi[1]);
-	napi_disable(&dev->mt76.napi[2]);
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
 	napi_disable(&dev->mt76.tx_napi);
 
 	mutex_lock(&dev->mt76.mutex);
@@ -2170,14 +2170,10 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		clear_bit(MT76_RESET, &phy2->mt76->state);
 
 	local_bh_disable();
-	napi_enable(&dev->mt76.napi[0]);
-	napi_schedule(&dev->mt76.napi[0]);
-
-	napi_enable(&dev->mt76.napi[1]);
-	napi_schedule(&dev->mt76.napi[1]);
-
-	napi_enable(&dev->mt76.napi[2]);
-	napi_schedule(&dev->mt76.napi[2]);
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		napi_enable(&dev->mt76.napi[i]);
+		napi_schedule(&dev->mt76.napi[i]);
+	}
 	local_bh_enable();
 
 	tasklet_schedule(&dev->irq_tasklet);
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
