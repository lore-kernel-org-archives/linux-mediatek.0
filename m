Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE3C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:42:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E5861158
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E5861158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vdQB5GVp6PKyBatH4DOXi+3dLmJ4gaB0YT48Gj6GvaU=; b=IlA82OKXPCrM+Rp94LjBrkQkY
	FEJfpPDRgwvGRuNFxUohyK5nFqP+dyjxq7gfjQNa3rg9UH+N5u8fBKty82B+FgFiIQsNn4CHHdNek
	eQPnat4zKxMbV3jdMlxgZs0tUXbJrdUmOMY6eOYpRunEZR1q9WnI8RyZyfAzBPvovLxAaEXCFUzHR
	EyFUub4ANImS2vrK3wAkuCdD5KDmbGwKKLiRVrbYuHReeWPIZlLmwepPaGpoE4GNnNY2ZzQjsUOgG
	UxrsSJBYIE9JYJQZfTjqeZMKuCB3BYt9KJglhsBCN/RH8w0dYP8v7S7Q1Mp65RnHTQ2LvbNf1fIzU
	T0x5xwFUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTcbS-001MVd-Nc; Tue, 06 Apr 2021 03:42:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTcbN-001MUa-CH
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 03:42:08 +0000
X-UUID: c2c47c82e7c848afa364cd9a0d601dd5-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LclSBmzUshjON8yF64agPfDLwas5Qc9j4Rd4DDToVOI=; 
 b=RKMi1Tj7fxpyj+SIbx4pCVFBwEoqGTg1iw1kge6FbKTVWgYhnhW+a0tWPX6s5VBJmV/3dcRntN6XYKjrW/34CJmoBeL8jUm4cQI3LGWn/7jDzPHIJoFroiAfl9ms7IJmbzpWKGRxRglFpSDyGFjbB5WkUzSyU5BY/sFt480qMyQ=;
X-UUID: c2c47c82e7c848afa364cd9a0d601dd5-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1328631278; Mon, 05 Apr 2021 20:41:58 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:34:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:34:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Apr 2021 11:34:41 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 4/6] mt76: mt7921: fix the insmod hangs
Date: Tue, 6 Apr 2021 11:34:37 +0800
Message-ID: <7d78e01bfbdaa0041c6c88a6fc190989a20b1ec3.1617679693.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
References: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D29E990F5B94B61EFA1C5145FB1283C5C91741CFE307F9DBDDF2401A3B0881A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044206_140722_51C17931 
X-CRM114-Status: GOOD (  10.24  )
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

From: Sean Wang <sean.wang@mediatek.com>

Fix the second insert module causing the device hangs after remove module.

Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   |  2 --
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c    |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 13 +------------
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h |  1 +
 4 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 262c9d150bf0..9046bbfc0690 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -273,8 +273,6 @@ void mt7921_unregister_device(struct mt7921_dev *dev)
 {
 	mt76_unregister_device(&dev->mt76);
 	mt7921_mcu_exit(dev);
-	mt7921_dma_cleanup(dev);
-
 	mt7921_tx_token_put(dev);
 
 	tasklet_disable(&dev->irq_tasklet);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 6f13eef96078..94f178e28e20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1207,8 +1207,7 @@ void mt7921_update_channel(struct mt76_dev *mdev)
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
-static int
-mt7921_wfsys_reset(struct mt7921_dev *dev)
+int mt7921_wfsys_reset(struct mt7921_dev *dev)
 {
 	mt76_set(dev, 0x70002600, BIT(0));
 	msleep(200);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 353877f1c762..b233b12860ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -960,18 +960,7 @@ int mt7921_mcu_init(struct mt7921_dev *dev)
 
 void mt7921_mcu_exit(struct mt7921_dev *dev)
 {
-	u32 reg = mt7921_reg_map_l1(dev, MT_TOP_MISC);
-
-	__mt76_mcu_restart(&dev->mt76);
-	if (!mt76_poll_msec(dev, reg, MT_TOP_MISC_FW_STATE,
-			    FIELD_PREP(MT_TOP_MISC_FW_STATE,
-				       FW_STATE_FW_DOWNLOAD), 1000)) {
-		dev_err(dev->mt76.dev, "Failed to exit mcu\n");
-		return;
-	}
-
-	reg = mt7921_reg_map_l1(dev, MT_TOP_LPCR_HOST_BAND0);
-	mt76_wr(dev, reg, MT_TOP_LPCR_HOST_FW_OWN);
+	mt7921_wfsys_reset(dev);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index ebe51017dd55..e4211b049040 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -351,4 +351,5 @@ void mt7921_coredump_work(struct work_struct *work);
 int mt7921_mcu_update_arp_filter(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_bss_conf *info);
+int mt7921_wfsys_reset(struct mt7921_dev *dev);
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
