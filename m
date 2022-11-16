Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71704C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7oiKZywyB41Vswo/EeSoC8nLldb6/iwDPmCeozDplTY=; b=e2qhWEW6MAUKdI+TwuGUMWr/9J
	GNH82cEku0SCnJ90Q9XkCqt/0wnJXwWlivwKxRKZ7UKZcMlClZBiZVlUoJl+mZ9DpA/f6GV33//qr
	f6FNMGp9Swxe9igPinNBxxMUwGlM6jmQi7kyc2bMsoqT3JVfPuzM2moHJiQtZmpNBjZ1VkvAmP08+
	17zrLhbDDomyghLsxUNYXDbEealhcGEI8GjXqxJT8k2Fe2cH0xsuO/mVYPyqP53lWdXRbaKd5e/Ku
	tlNA4wj/OjiWE0kXII/XO0kcAMP8FS6ma2iRJrDSBDsONOVh+n+X8DwQ/vh/1cX+A6hkYP0ce6Nk1
	as3G4Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKQE-005Huf-7W; Wed, 16 Nov 2022 15:33:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKQB-005HqR-41
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 15:33:53 +0000
X-UUID: 8e93e84547894f69ab38876f5dbec945-20221116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7oiKZywyB41Vswo/EeSoC8nLldb6/iwDPmCeozDplTY=;
	b=ashpAhDqgwCupMMdGqJBbdJvBRfdiTlYFbrAol25ljjdXZaTSEipUCc/VM1FRyfZnp9g5uHa+71fzS0trbkl8AehgQPyHm28hki9jDbe6VBK5gq7eiAvEWTuA2DjDn7N/RpNfIlumv0lLPEayr+2bBjlCQHfV1g+hSJ7v0kYOuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:89358076-a07a-4738-a8ec-eb43a22c3112,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:bdd75928-7328-4d53-af97-37d3ca89e562,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e93e84547894f69ab38876f5dbec945-20221116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 461489062; Wed, 16 Nov 2022 08:33:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 16 Nov 2022 22:43:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 16 Nov 2022 22:43:31 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix wrong power after multiple SAR set
Date: Wed, 16 Nov 2022 22:43:02 +0800
Message-ID: <33ea63656f19f30d73ce51045c46e9813a9532b5.1668608804.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_073351_443151_1827C4C9 
X-CRM114-Status: GOOD (  10.64  )
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

From: YN Chen <YN.Chen@mediatek.com>

We should update CLC config before SAR set to synchronize all
related settings.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 79b8055ce4c4..3abda4fbe5fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -59,6 +59,7 @@ mt7921_regd_notifier(struct wiphy *wiphy,
 
 	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
 	dev->mt76.region = request->dfs_region;
+	dev->country_ie_env  = request->country_ie_env;
 
 	mt7921_mutex_acquire(dev);
 	mt7921_mcu_set_clc(dev, request->alpha2, request->country_ie_env);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 41df17efdb3a..76ac5069638f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1615,7 +1615,13 @@ static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
 	int err;
 
 	mt7921_mutex_acquire(dev);
+	err = mt7921_mcu_set_clc(dev, dev->mt76.alpha2,
+				 dev->country_ie_env);
+	if (err < 0)
+		goto out;
+
 	err = mt7921_set_tx_sar_pwr(hw, sar);
+out:
 	mt7921_mutex_release(dev);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index ac70a978dbed..2398c6fd0b39 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -304,6 +304,8 @@ struct mt7921_dev {
 	struct work_struct ipv6_ns_work;
 	/* IPv6 addresses for WoWLAN */
 	struct sk_buff_head ipv6_ns_list;
+
+	enum environment_cap country_ie_env;
 };
 
 enum {
-- 
2.18.0


