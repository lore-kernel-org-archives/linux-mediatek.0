Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA48C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7805061A16
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7805061A16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dDyug4USwt3VhZXakAdYRT6OxAfrtBjCFFJ8zArE7BA=; b=iHeIGnWeGMZwo9GB1WQfnyW6w
	5OLYqLbGQ/DmTNINEUKK34tsbjw+PeRERben9vdMbMNx1/pAD/kX3fcgJYg/YHzi+y023nHfeimlj
	cbsdDV6wtB4tyAlftlpQjB/tr7y4IfHFVxFxKVpTM2nt89AZQKjJ0mp+EnRh++gVI2y520mKADjl3
	J77ZNaLnlo0S2OXED/sIUDkfK0Ug9p3SY0cbItD8QUqxrUd5hxZbtfZ7HLNWxwbk6qq3zupF9kvQq
	5WyR2x9YPH5uMDg4HcBh8cmFCqBnOmPZBaAPezTeZpEJ0lKWffd1v5pmJ8csLlka371WKR2FSvE+B
	o9t0BcNvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL2x-000uJP-BP; Thu, 25 Mar 2021 08:08:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL28-000u5L-E7
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:08:07 +0000
X-UUID: 8f9c42e347934bdc95d3297da3b719bd-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2VMr/khulRzPahN4HWmR+FPurRLgluDqIK4/XsUQ4TI=; 
 b=fzbM1p2XZ8wogZclsaWClAIp17pFUEF58pcR/DBRtygVJsbUXSRwUZHAWL2JrhVyNpVyZSIvDA244a92A8flE1+C/LxayKxggV9R1OJ7b6y/loJJZbuCsJtWdf2R7u/8FoxiRteCClRaN1aIxOWu8KXTlgycv1WrRBZV9Jh4oN0=;
X-UUID: 8f9c42e347934bdc95d3297da3b719bd-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 687008034; Thu, 25 Mar 2021 00:07:44 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 01:06:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:06:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:06:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/5] mt76: mt7622: trigger hif interrupt for system reset
Date: Thu, 25 Mar 2021 16:06:03 +0800
Message-ID: <fdf1a87df05dd4edfda3652fbb2ff3a4a14ccc83.1616657048.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
References: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 83C2051780332E87DCD936F4975CBF7E14F2C82AE2C05767D9379E12B5C73B222000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_080801_543475_C3C0D8AB 
X-CRM114-Status: UNSURE (   8.22  )
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

hif interrupt needs to be triggered after MT_MCU_INT_EVENT.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c   | 15 ++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/mt7615.h    |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 17aa3e4d67ca..3d9d893dbac5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2053,6 +2053,15 @@ void mt7615_tx_token_put(struct mt7615_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt7615_tx_token_put);
 
+static void
+mt7615_hif_int_event_trigger(struct mt7615_dev *dev, u8 event)
+{
+	mt76_wr(dev, MT_MCU_INT_EVENT, event);
+
+	mt7622_trigger_hif_int(dev, true);
+	mt7622_trigger_hif_int(dev, false);
+}
+
 void mt7615_mac_reset_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy2;
@@ -2095,7 +2104,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	mt7615_mutex_acquire(dev);
 
-	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_PDMA_STOPPED);
+	mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_PDMA_STOPPED);
 
 	mt7615_tx_token_put(dev);
 	idr_init(&dev->token);
@@ -2105,7 +2114,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 		mt76_wr(dev, MT_WPDMA_MEM_RNG_ERR, 0);
 
-		mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_PDMA_INIT);
+		mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_PDMA_INIT);
 		mt7615_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
 	}
 
@@ -2128,7 +2137,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	if (ext_phy)
 		ieee80211_wake_queues(ext_phy->hw);
 
-	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
+	mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_RESET_DONE);
 	mt7615_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
 
 	mt7615_update_beacons(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 4ca0d8d4c536..99c1676c9f0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -274,7 +274,7 @@ int mt7615_rf_wr(struct mt7615_dev *dev, u32 wf, u32 reg, u32 val)
 				 sizeof(req), false);
 }
 
-static void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en)
+void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en)
 {
 	if (!is_mt7622(&dev->mt76))
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 84d06f2b41d4..484fc16f0c11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -556,6 +556,8 @@ u32 mt7615_mcu_reg_rr(struct mt76_dev *dev, u32 offset);
 void mt7615_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
 void mt7615_coredump_work(struct work_struct *work);
 
+void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en);
+
 /* usb */
 int mt7663_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
