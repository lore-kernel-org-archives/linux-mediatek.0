Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE42C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A4961D81
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A4961D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv9oA0HnK0DnWEnORSgnzt/FR2yze0Z1TaFIYDRv+HQ=; b=4qwEkT7tWukku+
	JUMFXzLx8JeMZir8sGAkuJtPQ/mo4CxZRW4a7zxclu/3OH266fF30jL86h9gY3NaEna/NmUJBNsvK
	rY9ZyDx2DBhtzBpQWr3ocrsZefbFg2lVFsJeDCWarMEkAOLV/OFWBoWADjTuH3rOIJ9v9xhfvTOxK
	bCwhawzUX83DP38DYXM4JD1H1gri47mlvnX+Ls3Jy+VTrBQGoM9I/EBRmYvdvmlNw792iE1dE+bcg
	GjKOUYpYUxvb5AKbYogJd23hkw8d8Nf5MtVPDpyIN/Gqqi7UJ9m1eYviN6EFUp7sujMfOqcbnsk8S
	oM/B4lwwNgCQoRxv8QxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jEb-00BKnz-GI; Tue, 06 Jul 2021 11:27:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4g-00BEPo-Uy; Tue, 06 Jul 2021 11:17:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2528F61C99;
 Tue,  6 Jul 2021 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570230;
 bh=5dUHdsNsgzfUJUdOFrKUl9DLlmlD94Tqy77aqB7y6vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gWIlMCzJ5pbINXQZDF5YyCOr8vHvQjuXIKQljAJutV1EUg9zihYS6PUhGY961pykd
 JRG4CgKbSIt+Ygr3JPGZGZMbeuBVzgC2YjuB2ZjfXVugm0v6I9jnuMEedVDnQc6qFu
 hmyAruN3+HUiyPh/SqX5Caxw7JPJlD2D2qjB+4+688iv8GsNm94xS61BerTHJr5NBK
 D06YV19LGNU7PhqDilhn7ILUla15t9opiRJ2qgA328rR+4H8ReF7P61UVLVUX8vMmn
 ijosBCtYwqUc913f+krtZ3L7DTxGjGILQZOmrco4RVJgKJ4+MAJO9dLg9nQZwuZPOO
 zxIbWUPywdadA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Deren Wu <deren.wu@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 134/189] mt76: connac: fix UC entry is being
 overwritten
Date: Tue,  6 Jul 2021 07:13:14 -0400
Message-Id: <20210706111409.2058071-134-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041711_105051_5F67D063 
X-CRM114-Status: GOOD (  12.00  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 82453b1cbf9ef166364c12b5464251f16bac5f51 ]

Fix UC entry is being overwritten by BC entry

Tested-by: Deren Wu <deren.wu@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  8 +++++---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 10 ++++++----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c      |  1 +
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index aa42af9ebfd6..de7126d45aa6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1120,12 +1120,14 @@ mt7615_mcu_sta_rx_ba(struct mt7615_dev *dev,
 
 static int
 __mt7615_mcu_add_sta(struct mt76_phy *phy, struct ieee80211_vif *vif,
-		     struct ieee80211_sta *sta, bool enable, int cmd)
+		     struct ieee80211_sta *sta, bool enable, int cmd,
+		     bool offload_fw)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt76_sta_cmd_info info = {
 		.sta = sta,
 		.vif = vif,
+		.offload_fw = offload_fw,
 		.enable = enable,
 		.cmd = cmd,
 	};
@@ -1139,7 +1141,7 @@ mt7615_mcu_add_sta(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		   struct ieee80211_sta *sta, bool enable)
 {
 	return __mt7615_mcu_add_sta(phy->mt76, vif, sta, enable,
-				    MCU_EXT_CMD_STA_REC_UPDATE);
+				    MCU_EXT_CMD_STA_REC_UPDATE, false);
 }
 
 static const struct mt7615_mcu_ops sta_update_ops = {
@@ -1280,7 +1282,7 @@ mt7615_mcu_uni_add_sta(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable)
 {
 	return __mt7615_mcu_add_sta(phy->mt76, vif, sta, enable,
-				    MCU_UNI_CMD_STA_REC_UPDATE);
+				    MCU_UNI_CMD_STA_REC_UPDATE, true);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 619561606f96..f975f6d98a98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -841,10 +841,12 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable);
-	if (info->enable && info->sta)
-		mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
-					info->rcpi);
+	if (info->sta || !info->offload_fw)
+		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
+					      info->enable);
+	if (info->sta && info->enable)
+		mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
+					info->vif, info->rcpi);
 
 	sta_wtbl = mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
 					   sizeof(struct tlv));
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index a1096861d04a..61bed6e89427 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -891,6 +891,7 @@ struct mt76_sta_cmd_info {
 
 	struct ieee80211_vif *vif;
 
+	bool offload_fw;
 	bool enable;
 	int cmd;
 	u8 rcpi;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index ef3e454862ad..23b337b43874 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1278,6 +1278,7 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		.vif = vif,
 		.enable = enable,
 		.cmd = MCU_UNI_CMD_STA_REC_UPDATE,
+		.offload_fw = true,
 		.rcpi = to_rcpi(rssi),
 	};
 	struct mt7921_sta *msta;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
