Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A9EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 22:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21EEF6104F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 22:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21EEF6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bigc6G1w7dTYr1Yl1mbv7gRqXaytRJedgnICp4goFHw=; b=B3dcfLr4+/VRrJ
	Rk2kSp2k3Hwmi788/beZTgtl+LXp5W08NnyBGdSkdtYTlmdTtKpC+VOPReJJvR7dwTE5E1C26zD4V
	psIu2y2wdQK+MfzGb0ZgB8xSrfJ5bScjbXFxrE3MgFLAUemM+P1nd6f5gzYRIefKFxWH3fBR3A6ij
	PdujrGHsoCWD86vUX5GhoCPK4XhHb6I7jIwBi43L6RXI7IDHyq/RwER2alUuaoHGSMkLvAfamQhn8
	Lgc6+sOy3WB8y8Te85EN8U8BMCEzn7Dko0ahZGFPGhhU9C5J3MDll19cq0sQ0Bp6G+uHECln1+Dcj
	Ns3TlJuvlAqvpbqi8XWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBPQ5-007aQq-1I; Wed, 04 Aug 2021 22:31:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBPQ0-007aQT-Ce
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 22:31:21 +0000
X-UUID: b3851bcc4c704fbda560a607a0c08f5d-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tyTK14QTgMAskH2cLqwiOYuNxDdD43qX+Wq9o6TC/no=; 
 b=CsFqEDgAkCyF5AZK00j3IAd9rS+tapYjnMJPxg4uiS6JFiYWQCxBdgau3n+n2OlgvkWiN1jAkX8TAgeVqvlX99ox5RMGLe9DK0FDcJuBQsNlEzKLsaSs8kmwFkOJFKyNx+gpxw22R5bXr/Z2ez2w25cua93ZU7UdlFk7VLCigxg=;
X-UUID: b3851bcc4c704fbda560a607a0c08f5d-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 436265311; Wed, 04 Aug 2021 15:31:11 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 15:23:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 06:23:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Aug 2021 06:23:02 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] mt76: connac: add support maximum regulatory Tx power
Date: Thu, 5 Aug 2021 06:23:00 +0800
Message-ID: <e05024275119c517a4eb7e39bf249640db68d07d.1628115504.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_153120_498203_4FA92394 
X-CRM114-Status: GOOD (  14.87  )
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

From: YN Chen <YN.Chen@mediatek.com>

Consider .max_reg_power in struct ieee80211_channel to limit the
maximum power the wireless device allowed to transmit on the
corresponding channel according to the regulatory domain.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
---
v2: consider the power limit that can be allowed on mt7663
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index d71393b1c5e6..80987af03efe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1773,6 +1773,43 @@ static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
 	return target_power;
 }
 
+static s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
+				   struct ieee80211_channel *chan,
+				   s8 target_power)
+{
+	struct mt76_dev *dev = phy->dev;
+	struct ieee80211_supported_band *sband;
+	int i;
+
+	switch (chan->band) {
+	case NL80211_BAND_2GHZ:
+		sband = &phy->sband_2g.sband;
+		break;
+	case NL80211_BAND_5GHZ:
+		sband = &phy->sband_5g.sband;
+		break;
+	default:
+		return target_power;
+	}
+
+	for (i = 0; i < sband->n_channels; i++) {
+		struct ieee80211_channel *ch = &sband->channels[i];
+
+		if (ch->hw_value == chan->hw_value) {
+			if (!(ch->flags & IEEE80211_CHAN_DISABLED)) {
+				int power = 2 * ch->max_reg_power;
+
+				if (is_mt7663(dev) && (power > 63 || power < -64))
+					power = 63;
+				target_power = min_t(s8, power, target_power);
+			}
+			break;
+		}
+	}
+
+	return target_power;
+}
+
 static int
 mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				  enum nl80211_band band)
@@ -1840,10 +1877,12 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				.hw_value = ch_list[idx],
 				.band = band,
 			};
-			s8 sar_power;
+			s8 reg_power, sar_power;
 
+			reg_power = mt76_connac_get_ch_power(phy, &chan,
+							     tx_power);
 			sar_power = mt76_connac_get_sar_power(phy, &chan,
-							      tx_power);
+							      reg_power);
 
 			mt76_get_rate_power_limits(phy, &chan, &limits,
 						   sar_power);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
