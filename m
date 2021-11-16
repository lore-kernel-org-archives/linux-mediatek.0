Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF05C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 14:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E658361BF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 14:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E658361BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvU5tQCIGEX1sluAMXYwvLITMLR5ct17sNUxoC7HMs8=; b=3/DShSS97TG/rY
	rzzmkV7s7esZ1Vizm2kTvGFcIZu1EsdZU98wVXMcaiNWsTWaatl6tr+8pXRI4RXbifCuzcu0jw1g7
	g+n74ctMCYlntLSSfniuA1ZKfR+xovaXc4vrUC6hBTn5cJ4v8EXyfEpW2TYHVKcRa0djRGwEa0+sH
	+hkwd8T1/IlgPvrHFeow2RJNQnvbAcoLzsuS+SQipjTZhjM2aTHPuY1nY/xrOlTd5Ak6d/vB1phJi
	FsiSnk4X1t8QSvwtNWdYOd9G4bip2L5CTJ3m2EY5lI+UkjbcSGLCm2Tw7Q5/eQpNXhw8iPKqP307l
	hRhWoDlyDiu58zWtnuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzVd-001uES-JJ; Tue, 16 Nov 2021 14:32:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzVY-001uDO-Vl
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 14:32:27 +0000
X-UUID: ddad392f6e5f48498cb2f6baebfc5c34-20211116
X-UUID: ddad392f6e5f48498cb2f6baebfc5c34-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1377976819; Tue, 16 Nov 2021 07:32:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 06:32:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 22:32:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Nov 2021 22:32:16 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v3] mt76: mt7921: introduce 160 MHz channel bandwidth support
Date: Tue, 16 Nov 2021 22:31:18 +0800
Message-ID: <6bdc71ea1d5977e31717efaddc70092871be1a4b.1637072707.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_063225_062621_85E42EBE 
X-CRM114-Status: UNSURE (   8.80  )
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

Introduce the basic configuration for BW160 capability in 7922

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v3: remove .has_bw160 field in mt76_hw_cap. Check bw160 by chip ID
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c |  4 ++++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 210998f086ab..b23067a8326c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -264,6 +264,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
 			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 			IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
 			(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (is_mt7922(&dev->mt76))
+		dev->mphy.sband_5g.sband.vht_cap.cap |=
+			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ |
+			IEEE80211_VHT_CAP_SHORT_GI_160;
 
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 633c6d2a57ac..6b005db64ad3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -128,11 +128,23 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
 				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
 				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
+
+			if (is_mt7922(phy->mt76->dev)) {
+				he_cap_elem->phy_cap_info[0] |=
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
+				he_cap_elem->phy_cap_info[8] |=
+					IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
+					IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
+			}
 			break;
 		}
 
 		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
 		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
+		if (is_mt7922(phy->mt76->dev)) {
+			he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map);
+			he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map);
+		}
 
 		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 		if (he_cap_elem->phy_cap_info[6] &
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
