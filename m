Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96352CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsT74PDZ96S+IGVW2NED4fpSv89pTvSeSrxuAEOIpKs=; b=W81kM2jG52Ayebl4oi6Y8bcbAV
	2MjvL6AyAtjpqora0MVGQK0MvDespKCDMnc2DN4/2c8wP1UvPW9o2NFdzTkFxdHhnxphrQUi+yFF+
	HP8OMiQ089f2ll9NAPV/rWHPpwsBR4qVqVzN6Nv7r3xg4a2IQhk0/IhFD2JWObgGoNQCID64iTnj4
	qcj+8jPbt66TrGOyv7qYU4kKNIeALyv/YjDJaQZjI3Yb0A2UcMVf9JSmtR8BQsFjqnfKrsuJIepcf
	3yngy2tg8cCQSgT0DhU5tSInEn68pmriZDk6sgu3bpI+OtJyV6azgall+elyOijV2XiWYOjgp4pX+
	4Drf2L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgpz-00DjIT-1I;
	Mon, 25 Sep 2023 08:21:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgpx-00DjHR-0B
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:21:02 +0000
X-UUID: 7455960a5b7c11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KsT74PDZ96S+IGVW2NED4fpSv89pTvSeSrxuAEOIpKs=;
	b=V/mnwnPOhVqETjbsmLKD2T53D80AwwgEjDfivw2w7CVE6YdbDhPH2AzP18f7sMTpzm9/9eYTu5O6QCZZsMApaPzFkoi4Q+zw9C3pAugJMHoTJUs23eOfM1gOSHYevFX3yv6RsaAC5m6RjANNsgGm4uahKzS2iVd8wgINNeNfdxk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6fab48c9-b8f2-463d-b234-c64977a2e4a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:709819f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7455960a5b7c11ee9b7791016c24628a-20230925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1595356010; Mon, 25 Sep 2023 01:20:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 16:10:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 16:10:55 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 3/6] wifi: mt76: mt7921: add 6GHz power type support for clc
Date: Mon, 25 Sep 2023 16:10:35 +0800
Message-ID: <383d8c4678a26b31bc4bd1483779cb6b88b23b4c.1695627867.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695627867.git.deren.wu@mediatek.com>
References: <cover.1695627867.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.275200-8.000000
X-TMASE-MatchedRID: fgVbCT167QSR8u6DOJbzpwPZZctd3P4BX5TqQagR07diZCTkFQiKcEUW
	SNUeoUM2ITT0CH6wCHZXUz+XcOBhEZ4tFtWKBvRp0Xw0ILvo/uUpWss5kPUFdPytJo0tuXDqQcb
	fiRJqHPcvPUZhEG3lqB4ZBuPBdsI5RrYNcarBmZ/iNGQgiadfQxPVHMMzH1WYmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1GpeevGsoI5frGfcQt3nowcW0abotUzGj4hiMIlligzVNikUHrE+F4NHgp
	Ea6H8U5IBUV6e/BF8VtMAyq89suidOl4YUcYQu8W89IfFvINUQXRoPmWO3jekxwdkPqCq7vDEyN
	+J8hd+jCS9WgDXVPCn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.275200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 65BA54B0147603FC76963ECC048AE66BA5523A94F977BB7672BAE872CDB166502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_012101_102170_9503E153 
X-CRM114-Status: GOOD (  13.20  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

There are several power type should be supported in 6GHz band. mt7921
apply 6GHz power type from AP settings and clc will setup the
corresponding regulatory power.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 34 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  4 ++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  9 +++++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index aa20fdce2729..cf8aecb200fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -701,6 +701,38 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 	mt792x_mutex_release(dev);
 }
 
+static void
+mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_phy *phy = mvif->phy;
+	struct mt792x_dev *dev = phy->dev;
+
+	if (hweight64(dev->mt76.vif_mask) > 1) {
+		phy->power_type = MT_AP_DEFAULT;
+		goto out;
+	}
+
+	switch (vif->bss_conf.power_type) {
+	case IEEE80211_REG_SP_AP:
+		phy->power_type = MT_AP_SP;
+		break;
+	case IEEE80211_REG_VLP_AP:
+		phy->power_type = MT_AP_VLP;
+		break;
+	case IEEE80211_REG_LPI_AP:
+		phy->power_type = MT_AP_LPI;
+		break;
+	case IEEE80211_REG_UNSET_AP:
+	default:
+		phy->power_type = MT_AP_DEFAULT;
+		break;
+	}
+
+out:
+	mt7921_mcu_set_clc(dev, dev->mt76.alpha2, dev->country_ie_env);
+}
+
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
@@ -736,6 +768,8 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
+	mt7921_regd_set_6ghz_power_type(vif);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8d9ebe34816a..8c76ef92e14f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1254,10 +1254,12 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		u8 pad1;
 		u8 alpha2[2];
 		u8 type[2];
-		u8 rsvd[64];
+		u8 env_6g;
+		u8 rsvd[63];
 	} __packed req = {
 		.idx = idx,
 		.env = env_cap,
+		.env_6g = dev->phy.power_type,
 		.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
 	};
 	int ret, valid_cnt = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 548e89fad4d9..8b1dbddf4582 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -63,6 +63,14 @@ enum {
 	MT792x_CLC_MAX_NUM,
 };
 
+enum mt792x_reg_power_type {
+	MT_AP_UNSET = 0,
+	MT_AP_DEFAULT,
+	MT_AP_LPI,
+	MT_AP_SP,
+	MT_AP_VLP,
+};
+
 DECLARE_EWMA(avg_signal, 10, 8)
 
 struct mt792x_sta {
@@ -114,6 +122,7 @@ struct mt792x_phy {
 	struct mt76_mib_stats mib;
 
 	u8 sta_work_count;
+	enum mt792x_reg_power_type power_type;
 
 	struct sk_buff_head scan_event_list;
 	struct delayed_work scan_work;
-- 
2.18.0


