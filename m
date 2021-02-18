Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70D4C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A89064E2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A89064E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4XqAgiiiVnN3v3mH2C9mBqkb7zEfuZEBwYnb6TWJZ1k=; b=JKWJAjhhT+fT5qR1Drf0924DK
	DaUw4sjSdAQ+9qrIkv3l4qhYMTN9EYRTRK9ZA8NH/FwTXw5S7qdGDm0yZ1lMcSiwgUgbTwtfEGUut
	+QDYyZ/JoxlfE7ihZjbvJqdvHzdgWDcUh5ohoSx5ncFbabgTHyA8WLCsXkK0Ej6SGTH76dyfuy9Ih
	z9J5D2IGVmKSTJOHsIPEkWJNNkQfQp+JxGJnxAB3N+TDytNhup7kg3ygarryzS6niaVZXWCcivHom
	9AuPZq0bQ7SoL7oJxL94INAWBMxbAKnNYN7wnLjZzPFQ+S1Vp3Ts/rroUFy/xL8w+6SR+ClhPuGsA
	yTFNVzsHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCYDV-0003wy-1B; Thu, 18 Feb 2021 01:34:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCYDS-0003wL-0y
 for linux-mediatek@lists.infradead.org; Thu, 18 Feb 2021 01:34:51 +0000
X-UUID: 3037ced0bd1b4fb1b8e818e84653fe3e-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wo1UJYSZONfNTDr6j741divuMJW9WcSjX1yV4ekWG98=; 
 b=SCDB+YDR5mO0QS45h1weqmWt/zB+p+z+krXFTpRMeEzD9/Egc4CYIVZrPSO1vaOiYImM8DNqvO5iNYkdZV4suhBqzXXlLo4yN7IL/1+pcgDtkYCuRsc8DuU0kLEV+n35wYcGtxQOOAeQ9eJGeM4o5uj21G3/32D8fcT4Os4ga3Y=;
X-UUID: 3037ced0bd1b4fb1b8e818e84653fe3e-20210217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 564695984; Wed, 17 Feb 2021 17:34:46 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 17:34:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 09:34:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Feb 2021 09:34:43 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/3] mt76: mt7615: add rx checksum offload support
Date: Thu, 18 Feb 2021 09:34:39 +0800
Message-ID: <5986dbd65f23d49aaf7656e0a4b4750985188f36.1613603857.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
References: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_203450_334159_189FC08F 
X-CRM114-Status: GOOD (  10.68  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set skb->ip_summed to CHECKSUM_UNNECESSARY if the hardware has validated
the IP and TCP/UDP checksum

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index a97cc723094c..fd38737a27bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -329,6 +329,7 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	hw->max_rates = 3;
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 11;
+	hw->netdev_features = NETIF_F_RXCSUM;
 
 	phy->slottime = 9;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 928edd158f64..340beff0e121 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -234,6 +234,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	u32 rxd0 = le32_to_cpu(rxd[0]);
 	u32 rxd1 = le32_to_cpu(rxd[1]);
 	u32 rxd2 = le32_to_cpu(rxd[2]);
+	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
 	__le32 rxd12 = rxd[12];
 	bool unicast, remove_pad, insert_ccmp_hdr = false;
 	int phy_idx;
@@ -271,6 +272,9 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 		spin_unlock_bh(&dev->sta_poll_lock);
 	}
 
+	if ((rxd0 & csum_mask) == csum_mask)
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+
 	if (rxd2 & MT_RXD2_NORMAL_FCS_ERR)
 		status->flag |= RX_FLAG_FAILED_FCS_CRC;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
