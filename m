Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2226C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJux4Od4WclGRzmE6aM1d/Z4wHjU5GgSWPM1pDjMQUM=; b=SpKcyRpvPNWzpkxx8hGRQb3XHc
	V1NGe0fc9KfFSP5vb2nNwoUUI133kq5xKSMhmAIrhM7tsNfNn+TyuLpF1eQtfXCRLGxqjQ2CSx8pW
	q2MppR7sUo65ckjCnLP8hT/t3VkP2DWWSNXZos6KpnG8ieYG8DvnJJZCGP/PyGvEqSSqOaPuVnToX
	5P+V7ZdU84XOPKswk77Bplz5a4Wr67FXJggHaKlBb6dzZBvEHHyNvxn9xkGWaOVuJYuR6FADwhyo+
	ytdjAnfzlMWDrAsSl6c1aSFRtlnkiD4Mj8xkmlY+XFhFpJ9X6ho7wF8pYO6LKnu7TvS/9eA4UERNb
	fgX+QUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaj5-0000000HKKX-0wcD;
	Mon, 24 Aug 2026 19:52:59 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaj3-0000000HKJs-1HkU
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:52:58 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44cf70de986so2708398fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601176; x=1788205976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJux4Od4WclGRzmE6aM1d/Z4wHjU5GgSWPM1pDjMQUM=;
        b=sNIlzhm9w4lHL8a0k+0ZjmZgxQXbhSLYrZxABxYFB11bwzbjNg/NzUQ9ehfoHakju5
         DhifKY2H9uKYxM3VkJDyweEkP8mfhaX2vSqnnmTZbSXp8xs/7x0LVksGV/lN/YK1Y5R3
         W6XordD/BKg27nFjIO+oW10asTTc9ZOI5+u60Epc22n55h9DBqrFkaSeKEPOmmL20cpp
         /vaDuWXVuh8t+Tw25SUP7pC+YbJL5Whe/qzPi+lQrtgnWHXpKk2OmEFd8M8JABtig7TJ
         zAbd5t9rjYdJOQC6pqVp1GvVn9Te5VYTHY2QENNAUGdaysVwSk5ZbNgBQFOniZzsshqt
         KRKA==
X-Forwarded-Encrypted: i=1; AHgh+RotZSYTXsL09LO1YejDA6pJhHvDBaPW88df6g3JQ10Dq30QrztwsfeK1D5j6azoQd5ZKJaJrl2JdksDsix8sQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lrZDK71TwyEETnxcQZX3y6g9rQYp+4INBqR8Amfuv7jN0JyihO
	IKbi65DRrYYDAVEwsAmVww9ZMD8fc68/9Wq0dX8lVYAqpZ7I+p5jLt3/
X-Gm-Gg: AR+sD12JL77Hbdlgm9UFnwCFMmW8HZEKFr2FyeU/SOEdkVe0lGxhrAdNdRh4kQUod+C
	/YV9maHSz566ysEu7LKkcuBVy1OzzCha1pV6RNpVqWMC93ftqWda2jf4+WrzEEqFb6voemtRC1k
	ZIEMND1p81FKfFWEWDOPrwv/Xrm15wlpnt9ffJneV6NZt/on9xuMzOMtkx5ZtIohqVlE0TugdR4
	yck3qhcwYJ8G4EbR4eYOPRj4+bg2bpAX91mFzioccU5Lns1nM1BZi04t3H+0PMK1n3LI/qL2yWq
	5HZSoJb9KqhB/4Q2jmF0CpRmztwmyKDEp6pNoiFK4DSVojP0ZEx5NQowvR75KxZ/wtYg4G79+yG
	GRDnZG3rhTtyCBgIXI0aJqa/wi+vjhLrfdMm35d0D0k4+RXexm+WNBbB1oPM8Bbu5II/7WfQYBF
	duTDLJ/6PxYHT2xCh3D1XWWTku4TtzC9SDqbsDWH3mpHq4gAbYADOnzGEOqiP8poihrYceiErIz
	YyzGvAcbsv8imRVhAlRESgmfKnx+JNG9ZxOUkM8JT/b
X-Received: by 2002:a05:6870:b3e9:b0:451:9455:d733 with SMTP id 586e51a60fabf-463802da087mr21787483fac.21.1787601176165;
        Mon, 24 Aug 2026 12:52:56 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:52:55 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 02/15] wifi: mt76: mt7925: fix NAN start failure
Date: Mon, 24 Aug 2026 14:52:14 -0500
Message-ID: <20260824195227.12589-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125257_353228_C60460C2 
X-CRM114-Status: GOOD (  10.63  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

mt7925_start_nan() called mt7925_nan_set_nmi_addr(), which makes NAN
start fail. The NMI address is not managed here, so drop the call.

Also track dev->nan_vif only in add/remove_interface and fold the
single BSS rollback into an inline error check.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 17 +---------
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 32 -------------------
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  2 --
 3 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 84b55f008b3d..77420bb6f977 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2592,21 +2592,9 @@ static int mt7925_start_nan(struct ieee80211_hw *hw,
 	if (err < 0)
 		goto out;
 
-	dev->nan_vif = vif;
-
-	err = mt7925_nan_set_nmi_addr(dev, vif->addr);
-	if (err)
-		goto rollback_bss;
-
 	err = mt7925_nan_enable(vif, dev, conf);
 	if (err)
-		goto rollback_bss;
-
-	goto out;
-
-rollback_bss:
-	dev->nan_vif = NULL;
-	mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf, NULL, false);
+		mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf, NULL, false);
 
 out:
 	mt792x_mutex_release(dev);
@@ -2630,9 +2618,6 @@ static int mt7925_stop_nan(struct ieee80211_hw *hw,
 	if (!err)
 		err = ret;
 
-	if (dev->nan_vif == vif)
-		dev->nan_vif = NULL;
-
 	mt792x_mutex_release(dev);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 70cb2c44869c..ba7374fb7c03 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -144,38 +144,6 @@ mt7925_nan_update_conf(struct mt792x_vif *mvif,
 	memcpy(mvif->nan.conf.cluster_id, conf->cluster_id, ETH_ALEN);
 }
 
-int mt7925_nan_set_nmi_addr(struct mt792x_dev *dev, const u8 *addr)
-{
-	struct mt76_dev *mdev;
-	struct {
-		u8 rsv[4];
-		struct mt7925_nan_nmi_addr_tlv nmi_addr_tlv;
-	} nmi_cmd = {
-		.rsv = { 0 },
-		.nmi_addr_tlv = {
-			.tag = cpu_to_le16(NAN_UNI_CMD_CHANGE_NMI_ADDRESS),
-			.len = cpu_to_le16(sizeof(struct mt7925_nan_nmi_addr_tlv)),
-		},
-	};
-	int ret;
-
-	if (!dev || !addr)
-		return -EINVAL;
-
-	if (is_zero_ether_addr(addr) || is_multicast_ether_addr(addr)) {
-		dev_err(dev->mt76.dev, "NAN: invalid NMI address %pM\n", addr);
-		return -EINVAL;
-	}
-
-	mdev = &dev->mt76;
-	memcpy(nmi_cmd.nmi_addr_tlv.nmi_addr, addr, ETH_ALEN);
-
-	ret = mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nmi_cmd,
-				sizeof(nmi_cmd), true);
-
-	return ret;
-}
-
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 1dcc888d98f9..91f4e999711e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -405,8 +405,6 @@ int mt7925_nan_change_configure(struct ieee80211_vif *vif,
 
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
-int mt7925_nan_set_nmi_addr(struct mt792x_dev *dev, const u8 *addr);
-
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
-- 
2.43.0


