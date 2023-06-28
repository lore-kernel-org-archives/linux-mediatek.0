Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0650DEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVe4k/Rn+DcjBSH4JWRc4NQwfN692T8yUnDggT+CmXw=; b=LErTtBR3JhimrzE14zdwZ7tZHx
	jNdGfztMvpJ4GjgvhdURtqL1GCrlwzW8YgpepE7ZnombBbzh+jnOFUX0s2payMJIIEzlOg9JGExwR
	tGI4CGyoR4H9rK+rUVCKzpr+DY1gfT5VeI0nFL9307dYZUblqTjmVJw1VV9LuyxO+o4DmMdLAStfi
	zULQtJ2Gje5+zQ9XX5zB7hUR/H9DoOKniKbc5pnDCUrtlaXHF+Z1RVnY7mrpblak7WFZk7okHTcRg
	HFL1t656bhY0clcubXd9DgUyCrGtik3Ea3nCf77vrM2YKNBpq0209ExXOSqDDgAu3KOWv/yq1q6NB
	RFzZXsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKi-00F2R4-2x;
	Wed, 28 Jun 2023 07:11:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKg-00F2Pw-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:11:20 +0000
X-UUID: a8a4a6ac158211ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dVe4k/Rn+DcjBSH4JWRc4NQwfN692T8yUnDggT+CmXw=;
	b=c1LBsc7DhFqKwAcBrY0YLzeSEosnhcq4XKo1HH5eJ+8O7AFS061QqxJWhp16qA/U2NUWDNBhCQnjfZlV7ugULQiEOoPZCBMf2BBW2deGVkNx7H8w2MM3OQUoVyRHjiRckhLjuntJBNUfMUt0Gw98SmLRbUjVu7EoQYoKux/kvXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:4921a5ec-80c0-4017-8481-9b7e162dfeec,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:01c9525,CLOUDID:7af77182-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8a4a6ac158211ee912e1518a6540028-20230628
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 40070862; Wed, 28 Jun 2023 00:09:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:09:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:09:00 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 09/11] wifi: mt76: mt792x: move MT7921_PM_TIMEOUT and MT7921_HW_SCAN_TIMEOUT in common code
Date: Wed, 28 Jun 2023 15:07:22 +0800
Message-ID: <95218a7dc09f2020ef3bf02b17d46fcfa2f6c513.1687920269.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687920269.git.deren.wu@mediatek.com>
References: <cover.1687920269.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_001118_837098_4319422C 
X-CRM114-Status: GOOD (  11.33  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

MT7921_PM_TIMEOUT is shared between mt7925 and mt7921 so move it in
mt792x module.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 3 ---
 drivers/net/wireless/mediatek/mt76/mt792x.h        | 3 +++
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 7b8876bf8fc8..ff63f37f67d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -217,7 +217,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	timer_setup(&dev->phy.roc_timer, mt792x_roc_timer, 0);
 	init_waitqueue_head(&dev->phy.roc_wait);
 
-	dev->pm.idle_timeout = MT7921_PM_TIMEOUT;
+	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
 	if (!mt76_is_usb(&dev->mt76)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4b77d95af958..90c93970acab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -167,7 +167,7 @@ mt7921_mcu_scan_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	spin_unlock_bh(&dev->mt76.lock);
 
 	ieee80211_queue_delayed_work(mphy->hw, &phy->scan_work,
-				     MT7921_HW_SCAN_TIMEOUT);
+				     MT792x_HW_SCAN_TIMEOUT);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index e458ddb7d99a..0f8b93a2be3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -7,9 +7,6 @@
 #include "../mt792x.h"
 #include "regs.h"
 
-#define MT7921_PM_TIMEOUT		(HZ / 12)
-#define MT7921_HW_SCAN_TIMEOUT		(HZ / 10)
-
 #define MT7921_TX_RING_SIZE		2048
 #define MT7921_TX_MCU_RING_SIZE		256
 #define MT7921_TX_FWDL_RING_SIZE	128
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 700cd0ccc5d3..d80f80bc7656 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -11,6 +11,9 @@
 #include "mt792x_regs.h"
 #include "mt792x_acpi_sar.h"
 
+#define MT792x_PM_TIMEOUT	(HZ / 12)
+#define MT792x_HW_SCAN_TIMEOUT	(HZ / 10)
+
 #define MT792x_MAX_INTERFACES	4
 #define MT792x_WTBL_SIZE	20
 #define MT792x_WTBL_RESERVED	(MT792x_WTBL_SIZE - 1)
-- 
2.18.0


