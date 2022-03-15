Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5523FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HaJ7wrpdztO9JJPvRY3SP/pWae1Iesb+yYvcZIdee14=; b=jxpA+Jzr4EiBKt
	mIn9zF5naC2KMws7RHVJwPY6h0AhM3b5MIJ7YjAsU73Mfh9l1M0vL+WbPWcDEd8GYxAVCXRCMcEdt
	xI5/ONE0DePtQyrCWKlQXEJkunIhKU77+pBlLv65+EdN7OXH8xF8FKqo9a49ysIlmm1x5al/Y/D5Q
	kLy3NPw67glkSVxrNN6KgPSjUHsl7LOJWFrjuKf9KqGp0uIwJLnhvXER4bWByD305QyelOe7AszSJ
	A5VoMXTjoUrQkeuHSEfXcSJWOPZn5J1WJiv9qAM4z/A6y9TSxNGlSbfBwebsab35ax59jvumR8MAi
	wG+nlHykvdkvwLi3PDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUCtE-00ASAh-Os; Tue, 15 Mar 2022 19:31:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUCt9-00AS9r-MK
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 19:31:25 +0000
X-UUID: 63bb3e772abf4d549210eea19800d277-20220315
X-UUID: 63bb3e772abf4d549210eea19800d277-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912288795; Tue, 15 Mar 2022 12:31:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 12:25:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 03:25:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 03:25:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: don't enable beacon filter when
 IEEE80211_CONF_CHANGE_MONITOR is set
Date: Wed, 16 Mar 2022 03:25:03 +0800
Message-ID: <c7708dc79cff3ee66e4e60f48e9023ad0cece33a.1647372083.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_123123_765207_46424C22 
X-CRM114-Status: GOOD (  12.37  )
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

IEEE80211_CONF_CHANGE_MONITOR would be set every time even when vif runs as
sta mode.

If vif runs as sta mode, the beacon filter would be falsely enabled
earlier than the associated state.

That is not the behavior the firmware expects and also breaks the original
logic of sta mode. Thus, we only limit the operation to set the beacon
filter only for monitor mode when IEEE80211_CONF_CHANGE_MONITOR is set.

Fixes: 4ad65a54617c ("mt76: mt7921: toggle runtime-pm adding a monitor vif")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index e5dcf1615f17..cfa813bd627a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -484,9 +484,17 @@ mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt7921_dev *dev = priv;
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	struct mt76_connac_pm *pm = &dev->pm;
+	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+
+	mt7921_mcu_set_sniffer(dev, vif, monitor);
+	pm->enable = !monitor;
+	pm->ds_enable = !monitor;
+
+	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
 
-	mt7921_mcu_set_sniffer(dev, vif, enabled);
+	if (monitor)
+		mt7921_mcu_set_beacon_filter(dev, vif, false);
 }
 
 void mt7921_set_runtime_pm(struct mt7921_dev *dev)
@@ -530,7 +538,6 @@ static int mt7921_config(struct ieee80211_hw *hw, u32 changed)
 						    IEEE80211_IFACE_ITER_RESUME_ALL,
 						    mt7921_sniffer_interface_iter, dev);
 		dev->mt76.rxfilter = mt76_rr(dev, MT_WF_RFCR(0));
-		mt7921_set_runtime_pm(dev);
 	}
 
 out:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
