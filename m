Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478DBC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 22:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F203060F9E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 22:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F203060F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEPGfjcItEbaYJ64Rj/7LqpYlgkliyThmI0hwXWwgZs=; b=ZFAY5Pkc9+Hwnt
	SKYCny+sNxoraFRwknxJfZVfEBOaSuPBqf/9KssZ7mohvgN4sTVT5Y4ZDwUCqqB8rdtTEWcrs2VIg
	6TU3/TyAhtOa6M5WKatiqrA802uG6RhDcqzRpsWruhbf6+D8sIHtYRElYSlgokEwHDaIf69DeGN8G
	NTK1jCzJ/t3ypDV9lGppk9lT0HDxeefO4pO9ySYrstL9UyTvD7QA6PvHojHULW4od7+Mol+YQa4kw
	5TwmxXcu8Y5i/MI3OHq4yhdA7JVit4ys5V3dEyEWoINoy0m1HOY/c+HBtY6AMUsdLlQERSx41NNSI
	MWLIL9vwoHagG96sEjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8W2r-00GarU-8P; Tue, 27 Jul 2021 22:59:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8W2n-00GapL-Ax
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 22:59:28 +0000
X-UUID: 449f861d2b0c417ba6d93bd3d1ac5fb9-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Sdk/D8XePkqWpMZ1Xad/v0L7Y3skdo0Wbx2fghJZVEU=; 
 b=U0cS+LFbiH3Y3ns8uY17HM4rHvoojcwOFz6/Z+pJynDGjHU6xV3SKjLx25aYOXx5slT2e/8m53O9A0F48gb9OiD5DiZvZQvIg2n8u38ERE6sR/r1dZx6S0Btnq6qAajpWWHQQ9mX5pVum4uv83Uib6AGCCdufbK/8/bQcbZ2w/A=;
X-UUID: 449f861d2b0c417ba6d93bd3d1ac5fb9-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1504843531; Tue, 27 Jul 2021 15:59:22 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 15:59:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 06:59:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 06:59:19 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] mt76: connac: add support maximum regulatory Tx power
Date: Wed, 28 Jul 2021 06:59:17 +0800
Message-ID: <1627426757-14811-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
References: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_155926_832031_FDBA5AD8 
X-CRM114-Status: GOOD (  14.53  )
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
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index d71393b1c5e6..84f42ce12626 100644
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
+				if (power > 127 || power < -127)
+					power = 127;
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
