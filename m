Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E66C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 04:36:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2CF650D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 04:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2CF650D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1XRW3IUrrtALrJemCaaTiP/KnmdZl4gOT0gYUe+zfM=; b=HHZZRjD1+lb8tt0dTCv3asNImK
	7o/yM8q8REoSUe61/N6v3jq/0WPyk9Jr3tglqhcfR65Q8daGIRFCiMR4qTKW5dMPhOYjiL9SfGZuO
	JQvDkCIalz7sfoU0FWphEtiQSHydCfr4kLPCJWBlgCOO7MNqDV55EXC0/VJFS+OR3iNzl4bkvQIYI
	EVV13hueMAVXnVLrN/z5bIwsljfyQ+gRlXyfI/4JbgemRfAWtTMS4AChHc83U5tHSBcKp68m/WHT9
	i8BZjuGDiwFsOyhLWdGt9rW++CMUqQi+7/mpGdvIi/I57aeNrO7Yy4MzxSnXm1LMlSvRRDfl1zCUf
	0w7Qho6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM1Qo-00HOma-CM; Tue, 16 Mar 2021 04:35:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM1Qi-00HOlH-H2
 for linux-mediatek@lists.infradead.org; Tue, 16 Mar 2021 04:35:43 +0000
X-UUID: a286327a01d5425095d38085450214de-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uxMLqzrPxjxAH/A5+Fd8ShSgj+frV4A0B898SUlh8So=; 
 b=tRwF+tZEHobEwCHDNi5kPB8ssqXcmHr8tSv7r+XO3lNchnX0BT5hdG+oF3jS02rI7DbjpvZ9sKWOZ3izsKG4SsrC+fK6bvQ2CQcAUg4xxtJd/jYETXj16XBb76dTkkHRMugb9Utf9UYMyRwIgRACDHOCnEYg2+CHDhR+MnVONJo=;
X-UUID: a286327a01d5425095d38085450214de-20210315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 833549971; Mon, 15 Mar 2021 20:35:30 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:35:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 12:35:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 12:35:19 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7615: fix CSA event format
Date: Tue, 16 Mar 2021 12:35:15 +0800
Message-ID: <f349fbb1287b723913dc8be95b637310443c6b90.1615854190.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9C1B20F972B573BBD31E665557CA1402A9924B6BB084AA667F98CEB3C50C85712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_043541_217911_EFAEF85B 
X-CRM114-Status: UNSURE (   9.91  )
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

Fix format changes among the firmware versions.

Fixes: f9390c251868 ("mt76: mt7615: fix CSA notification for DBDC")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
@Felix, please help to fold this, if the previous one hasn't been pulled.
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.h | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 44daee41aa6c..4ca0d8d4c536 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -375,12 +375,13 @@ mt7615_mcu_csa_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 static void
 mt7615_mcu_rx_csa_notify(struct mt7615_dev *dev, struct sk_buff *skb)
 {
+	struct mt7615_phy *ext_phy = mt7615_ext_phy(dev);
 	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt7615_mcu_csa_notify *c;
 
 	c = (struct mt7615_mcu_csa_notify *)skb->data;
 
-	if (c->band_idx && dev->mt76.phy2)
+	if (ext_phy && ext_phy->omac_mask & BIT_ULL(c->omac_idx))
 		mphy = dev->mt76.phy2;
 
 	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index dbf72b1396c7..98c383e400a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -181,8 +181,7 @@ struct mt7615_mcu_csa_notify {
 
 	u8 omac_idx;
 	u8 csa_count;
-	u8 band_idx;
-	u8 rsv;
+	u8 rsv[2];
 } __packed;
 
 struct mt7615_mcu_rdd_report {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
