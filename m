Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71969C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 07:30:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39B26054E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 07:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39B26054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8QoLHJ7Kz7h9BnGaN60GLxvrhTBsfdGc4AvKRhsLQTU=; b=brdFRUEMUdEej6Edj60hndHLJv
	uaMHPDQEk3lbNX9Dvzy2gItkO+7TLNTb3UGm1M+VB9k3bb6PiDg6GI0w08oayUt88aNLKVIX5JesH
	SV5S94Ef0kI9rT35EmIrcGXR6dMfPao2xXdNmzg3Jafk6JHWQX4cISIOGaBY7N97+bThf9aJFVBVr
	NlVOA4RDChUWMVa+KwzWiLvfOetIHdGg04duBOeaBlft/r4C/DxpaeGfz59AdAaDduwkgEFDB4+0g
	GA4C3YTSQ0tI+07KMPxJDK96FmyEzuQw/w+nejFV4NKTxIk3cEqtfl31hoUf7tdim4c+Hf1tmS7Wl
	rrkXOfXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWDVC-008Vau-SK; Tue, 13 Apr 2021 07:30:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDV8-008VYG-RR
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 07:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Y4ObcHOE4VDSCaqm0LH1fdH8cK3pPEGO+XnV1Wh9j+U=; b=m82jUI+gWhTiae+RPl/++SSqin
 I47mUbdl0TyObil1N0QP4q5pCGedHsHlDK38TRM6xhfmg9DuB6w9wccqrcdB56zOf1IBZvnD+CQY7
 lqJusuM4kSI37oIrtffoLeIuNHXK6VquaP0nBBdOkPSL7wYUfuOaFEc+K2IdkDbzXSJQQRWtS6gIS
 nmzJbxt5Pyf2K327+SZ9Bwnr5HHLQxjqIKYp4YPIvUaenfbWH8AyQ+O4B9PnILnnlZvcApqBr8wog
 186Kp0ho7Dd6Up9QvayGSoOXHsVzyzWcS/vjw89LgIHZLFl89tgmNPRIRsr0eRi+CNo4Xb8lV3rp2
 BgmgsShA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDV6-006nmT-2r
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 07:30:21 +0000
X-UUID: 01b8e5a41ea84b4e82b50e1aa68bf3d6-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y4ObcHOE4VDSCaqm0LH1fdH8cK3pPEGO+XnV1Wh9j+U=; 
 b=m2JNH9u9mSCrrx5a/mgE5l6ST9rbzucc4lxPopmfsEQMaEhIS6CHwoJNXh7k0RlDymKeA694gFwtd/329MleZ8jQdyEPHim76VnZRSTxl6W/EKAV9DIdc4yVlUNbQzhdAokETQuUriihCHZI82h7kq9SBUoSqAQEhqaIKs3fjKE=;
X-UUID: 01b8e5a41ea84b4e82b50e1aa68bf3d6-20210413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1442613436; Tue, 13 Apr 2021 00:30:17 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 00:26:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 15:26:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 15:26:24 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7615: only free skbs after mt7615_dma_reset()
 when reset happens
Date: Tue, 13 Apr 2021 15:26:19 +0800
Message-ID: <1fc26bda42fcd85b4bcebc8520601c70b882aa34.1618297567.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_003020_154723_D8F8E495 
X-CRM114-Status: UNSURE (   9.24  )
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

In mt7615_mac_reset_work(), make sure freeing skbs  after mt7615_dma_reset()
and use ieee80211_free_txskb() in stead of to dev_kfree_skb_any() to report
proper status.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c     | 8 ++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 60aadf8a09cc..ce71e2c5a8d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2037,8 +2037,12 @@ void mt7615_tx_token_put(struct mt7615_dev *dev)
 	spin_lock_bh(&dev->token_lock);
 	idr_for_each_entry(&dev->token, txwi, id) {
 		mt7615_txp_skb_unmap(&dev->mt76, txwi);
-		if (txwi->skb)
-			dev_kfree_skb_any(txwi->skb);
+		if (txwi->skb) {
+			struct ieee80211_hw *hw;
+
+			hw = mt76_tx_status_get_hw(&dev->mt76, txwi->skb);
+			ieee80211_free_txskb(hw, txwi->skb);
+		}
 		mt76_put_txwi(&dev->mt76, txwi);
 	}
 	spin_unlock_bh(&dev->token_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 7694391603dd..bcc4344bbfc3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -310,6 +310,9 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	if (mt7615_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
 		mt7615_dma_reset(dev);
 
+		mt7615_tx_token_put(dev);
+		idr_init(&dev->token);
+
 		mt76_wr(dev, MT_WPDMA_MEM_RNG_ERR, 0);
 
 		mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_PDMA_INIT);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
