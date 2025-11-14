Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E3CDE018
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Nov 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPV0LSaUYzaJgitRedlekTHNotld+5DnyIFndNe75Y0=; b=XvYrGN+5llCE1c62kqL3dnf2Ya
	vsxku2kX/f5504S1CFku3Y8HN/UZSi8YWcC9WSU0gk6OYmL8G0ugwWefKeyTZAujB7KP4CMhnp0vI
	7NTN2IWUfpTQ+qYrRo+a6r7+QEe0zc5ay6rDw7XjYcYcXxze8sTy5V3NogwYe1eV2PEFbBQLk1W2e
	bimFFCLls2HX7WXC5GwhssBVertVKusY+Fxbr8qZJyyr4pY9qcDulehSBECJvZWXCtImk5TDWHqsk
	qGF/d0Vj4dDACqbC/wriu3VAhDH86pyYohRP/zVuzKI2OB3kjuJSwIkto+mefXFaUr4cTnwcRJIJ4
	UxQOEoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfM-0000000CEut-2dZV;
	Fri, 14 Nov 2025 13:16:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfJ-0000000CEsF-2dzA;
	Fri, 14 Nov 2025 13:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA03643E14;
	Fri, 14 Nov 2025 13:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B29C16AAE;
	Fri, 14 Nov 2025 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763126196;
	bh=Vcbw/nbH6Zz2C0EOEfbBO4A1x5TNQygfQV5lmRNbtf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W4RS5EfEhc6Qtde7eGmYM6f7YK/73tC8grXFVGq0/xdE7KTlrJT93FhY7ihN9V4m6
	 7oF0eHku86lHdsMPtpsxzmruOqrQ5ewH6w8NtMiRY5JPfR4YeQk0THeYMZtt1lqmc8
	 YAfJlUNSxctoL6K5gEDOkNFDXxeLwmW4kpAzB728I0XfVJEXxVcwEl4HJFjrqgkmIz
	 BhsLjXcRQ6BRiUTD3AGViaHUCI16aC9B/IDOwNhRgq0mpx0OKM37YTxf71tcJop68d
	 YhIbop+5EVKy/7M2LMMt32fdx4aU4fSlmoHeNBDkjfPoJPcnmiEbDdljuKicRyKcz1
	 1bwfy9ZyQGEeA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 14 Nov 2025 14:16:21 +0100
Subject: [PATCH mt76 1/4] wifi: mt76: mt7996: grab mt76 mutex in
 mt7996_mac_sta_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt76-fix-missing-mtx-v1-1-259ebf11f654@kernel.org>
References: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
In-Reply-To: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_051637_715740_9A6C1075 
X-CRM114-Status: UNSURE (   9.84  )
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

Grab mt76 mutex in mt7996_mac_sta_event routine in order to rely on
mt76_dereference() utility macro.

Fixes: ecd72f9695e7e ("wifi: mt76: mt7996: Support MLO in mt7996_mac_sta_event()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 581314368c5ba566f6050bee86696c4654619176..ad8698cf16242489b92e23befab4d040abbdcac2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1160,12 +1160,15 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	unsigned long links = sta->valid_links;
 	struct ieee80211_link_sta *link_sta;
 	unsigned int link_id;
+	int err = 0;
+
+	mutex_lock(&dev->mt76.mutex);
 
 	for_each_sta_active_link(vif, sta, link_sta, link_id) {
 		struct ieee80211_bss_conf *link_conf;
 		struct mt7996_sta_link *msta_link;
 		struct mt7996_vif_link *link;
-		int i, err;
+		int i;
 
 		link_conf = link_conf_dereference_protected(vif, link_id);
 		if (!link_conf)
@@ -1185,12 +1188,12 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 						 link, msta_link,
 						 CONN_STATE_CONNECT, true);
 			if (err)
-				return err;
+				goto unlock;
 
 			err = mt7996_mcu_add_rate_ctrl(dev, msta_link->sta, vif,
 						       link_id, false);
 			if (err)
-				return err;
+				goto unlock;
 
 			msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 			break;
@@ -1199,7 +1202,7 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 						 link, msta_link,
 						 CONN_STATE_PORT_SECURE, false);
 			if (err)
-				return err;
+				goto unlock;
 			break;
 		case MT76_STA_EVENT_DISASSOC:
 			for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++)
@@ -1219,8 +1222,10 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			break;
 		}
 	}
+unlock:
+	mutex_unlock(&dev->mt76.mutex);
 
-	return 0;
+	return err;
 }
 
 static void

-- 
2.51.1


