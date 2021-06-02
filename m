Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40CAC47092
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 15:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C010C60698
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 15:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C010C60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YaE33rp7r2a/CyPzxXIfqUZz850cUW6IjY1kAUT/BUU=; b=fjA4saZv3jdG6r
	q/GvQaPtGTEr+NR/AgHVK7+GiVD8YVY9Z+6e/NH6hpP/0nnnIXh18tg24YVK6XODZzzchtxh1xIsR
	PzxJsCu6B4xqEMtal6xcwjkfglEo8w33BY7oWfLqZ/hdxZmVR+MSB/cJBDcLyJSfptmOPKCXjrGkx
	ruKLGSDzRq6k1Gk5ESann9awaQ6pmlw7uoyd30Y9Z4u7IhbNh2TW9rhQc4+4YfHhpKfTdL3ADAQfR
	+uomP+95tmZtImrEg0O3PGqVTJgFCx3nCRJAYuDaJXnJo/A14k/BqIetwpNNtr2erjuDDzWx5TFIq
	9bpT3lHhQy0NriSxaxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loSdx-004oRE-Sc; Wed, 02 Jun 2021 15:18:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loSdg-004oHb-JS
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 15:18:41 +0000
X-UUID: 0773d6e9c6634646aed69f843f9004ee-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YFNQnNmEh4zBNxetjBQ4jQR7qUz4i/cBR6RMVT3vLZo=; 
 b=f3EHYx5wvoccZ1qp/jZ7rMzRdGTn3fRftTcil4hsSLQrSUU1Ab8AuBnpAbbsm4vNujf7FUisGHQs9POfgxbtjwer5MecnJcuaKiaqlJqaim1w9/w+1Ofgh8R2WxjTSChudjsb7oKXiB3YIHmy4uzDXu/tU/r+u/aUFrgAbMnmX0=;
X-UUID: 0773d6e9c6634646aed69f843f9004ee-20210602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 345371321; Wed, 02 Jun 2021 08:18:27 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 08:18:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 23:18:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 23:18:24 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 <jemele@google.com>, <yenlinlai@google.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: enable VHT BFee capabiliity
Date: Wed, 2 Jun 2021 23:17:52 +0800
Message-ID: <a5748514496b2b4e4b23be7b0b560d2585feafb6.1622627260.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_081838_089456_BC8E191E 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Deren Wu <deren.wu@mediatek.com>

enable BFee functions with proper BFee IEs

Tested-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c   |  1 +
 .../net/wireless/mediatek/mt76/mt7921/main.c   | 18 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mt7921.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 59da29032645..82b01a2cea69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -219,6 +219,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
 
 	mt76_set_stream_caps(&dev->mphy, true);
+	mt7921_set_stream_vht_bf_caps(&dev->phy);
 	mt7921_set_stream_he_caps(&dev->phy);
 
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 84930ad5ebc7..95502708b840 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -140,6 +140,24 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 	return idx;
 }
 
+void mt7921_set_stream_vht_bf_caps(struct mt7921_phy *phy)
+{
+	u32 *cap;
+
+	if (!phy->mt76->cap.has_5ghz)
+		return;
+
+	cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
+
+	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
+		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
+		(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+
+	*cap &= ~(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK |
+		  IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
+		  IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE);
+}
+
 void mt7921_set_stream_he_caps(struct mt7921_phy *phy)
 {
 	struct ieee80211_sband_iftype_data *data;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 8aa8d2ecdffa..abf8be358786 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -356,6 +356,7 @@ void mt7921_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps);
 void mt7921_stats_work(struct work_struct *work);
 void mt7921_txp_skb_unmap(struct mt76_dev *dev,
 			  struct mt76_txwi_cache *txwi);
+void mt7921_set_stream_vht_bf_caps(struct mt7921_phy *phy);
 void mt7921_set_stream_he_caps(struct mt7921_phy *phy);
 void mt7921_update_channel(struct mt76_dev *mdev);
 int mt7921_init_debugfs(struct mt7921_dev *dev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
