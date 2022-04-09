Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B13AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVamVknxgIT3Um32WE8aMEdRNZdI1eFwN1NJImy80ak=; b=WajVPdxjjdZwGD
	ZUDBO+ywe0o7jykuqvJqGllIj1T0jp2KDPlvuGZCsWasJV3crd4S1vWyOGRI16P5XETz7EmxY0+YG
	IkP8L+59f97QZF0oxsT0nNoRCcJwegwhb7wfsPF3vi9Nw//XP3sxIIiWe233ybVzzr+H1vVTxF8E1
	6trMHnfwVjJs2s0A4Ijf0EHXxG77jyenTT8mnV4Oreh/FxeqAsAhKGi6YTng+Y1i7PGelEU2m472/
	Sd+YMUNrezvfqpXuS5QkhWXMDR0EeBhN05641crqrRvN7WgfdZe5rU3PPg9S2DoklnVZurLePIBvB
	Xw6V1m2+y9c3E9IjaNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndBOj-003HwP-7D; Sat, 09 Apr 2022 13:45:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndBOh-003HvD-AU
 for linux-mediatek@lists.infradead.org; Sat, 09 Apr 2022 13:45:04 +0000
X-UUID: a08b457ac65f4360806156ad81602592-20220409
X-UUID: a08b457ac65f4360806156ad81602592-20220409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365785634; Sat, 09 Apr 2022 06:44:57 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Apr 2022 06:44:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 9 Apr 2022 21:44:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 Apr 2022 21:44:41 +0800
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
Subject: [PATCH] mt76: fix antenna config missing in 6G cap
Date: Sat, 9 Apr 2022 21:44:07 +0800
Message-ID: <357763fe0b112838d500422a27b114b4281adb9a.1649511465.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_064503_410930_6CAF66A4 
X-CRM114-Status: GOOD (  10.40  )
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

To make sure we have the proper antenna config in 6g cap,
move IEEE80211_VHT_CAP_[T/R]X_ANTENNA_PATTERN to stream init.

Fixes: f1103fa6b3492 ("mt76: add TX/RX antenna pattern capabilities")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 026ab1e16d45..2dd3ebd1863f 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -248,6 +248,8 @@ static void mt76_init_stream_cap(struct mt76_phy *phy,
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
 	else
 		vht_cap->cap &= ~IEEE80211_VHT_CAP_TXSTBC;
+	vht_cap->cap |= IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
+			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN;
 
 	for (i = 0; i < 8; i++) {
 		if (i < nstream)
@@ -323,8 +325,6 @@ mt76_init_sband(struct mt76_phy *phy, struct mt76_sband *msband,
 	vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC |
 			IEEE80211_VHT_CAP_RXSTBC_1 |
 			IEEE80211_VHT_CAP_SHORT_GI_80 |
-			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN |
-			IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
 			(3 << IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT);
 
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
