Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90465C5CFEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HgWe5tpKZyMDDKHMyaxPea7hr5M6J8J1qypHu7opcQ=; b=sqrcCC2UbaKTF4IMFnGSiaOjvV
	5Rq/RUOIHZ3PyBKqm2lwtirF/gREa2J+zdYtrIGmeNCcuRCj7wistmej020zf+2xQw1b8IDpjwGS8
	js3gGqNRXjMSF8ipVZDSZnVeIWUyZsJ8M2gSJbqyteiTK1omKoj+RCGreZq0Fa2QmzEaAzhUfHUmd
	BQRYWjSUSu3L+AYKxsZFKkSwk3KcI79P1FIsBldydGUsH0RgQwllAy8AWGnEItCPv8het8VeyC5t9
	lqELwLmp2KZuqDEU5BLKb+LPQwNoZld8K9h4t1tRE4ygB8nPc/efn4wsROK8L9lYN5SJKZqYHSnws
	2a4rGi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXG8-00000000zx7-2inz;
	Thu, 13 Aug 2026 15:22:20 +0000
Received: from out-30.mta1.migadu.com ([2001:41d0:203:375::1e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXG5-00000000ztr-3UqY
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 15:22:20 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XyXTkrVvcf4imSkHyIrt+1glBg5r4UAiPlvuYUXtjRc=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786634534; v=1; x=1787239334;
 b=buwTWuD/2NIUynz8urJx0U1b8JMr/KVso0y6g5bZ9jnEKpkmSRVEXsjDWfpbaCC84vwg+37A
 FiO1paO7emUU/uadt8RJeiEzH7tw7NPIL3MzpbHy69P2o8NX1+jbn3JEIJPGZWsktwi6yMysZEY
 kK/VwQWbGv/4BP1jS26FJ3mo+sJcDFDYMjNOMimnCEJBoLpW9DpuAuvmJWruuCgkVTAP/I8v0ZO
 yPHPK6woxRU2nSm+jOuvxgyS5GBGvIvVUorWTq+Rov3t1p7Xu/m33Q8p8618GbkEbWPNcZMmcsx
 qP3BSLXAbY+Kh+QejO8+9TygfzeUmPnVuEC4Z+D/fRH9w==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id ebb65674c93e86f6;
	Thu, 13 Aug 2026 15:21:02 +0000
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	stable@vger.kernel.org,
	Orly Orge <orlyorge2004@gmail.com>,
	Inanix <contact@inanix.fr>,
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH wireless] wifi: mt76: mt7615: do not tear down BSS/STA state for monitor vifs
Date: Thu, 13 Aug 2026 08:20:59 -0700
Message-ID: <20260813152059.15747-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082218_373743_E5E8D195 
X-CRM114-Status: UNSURE (   7.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mark Anthony Agarro <markanthonyagarro@gmail.com>

Tearing down a monitor interface oopses:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt76_connac_mcu_uni_add_bss+0x144/0x370 [mt76_connac_lib]
  Call Trace:
   mt7615_remove_interface+0x6a/0x200 [mt7615_common]
   drv_remove_interface+0x60/0x140 [mac80211]
   ieee80211_del_virtual_monitor+0x8f/0xc0 [mac80211]
   ieee80211_do_open+0x550/0x7d0 [mac80211]
   ieee80211_open+0xaa/0xb0 [mac80211]
   __dev_open+0x11b/0x280

mt7615_remove_interface() tears down BSS and STA state for every vif type.
On MT7663 with offload firmware that reaches mt76_connac_mcu_uni_add_bss(),
which has no monitor case in its iftype switch. It takes WARN_ON(1), then
copies ETH_ALEN from vif->bss_conf.bssid, which is NULL for a monitor vif.

mt76_connac_mcu_bss_basic_tlv() in the same file handles this. It has an
NL80211_IFTYPE_MONITOR case and it copies phy->macaddr in place of the
bssid. The uni variant has neither.

There is nothing to tear down. mt7615_add_interface() only calls
mt7615_mcu_add_dev_info(). The BSS and STA state comes from beacon enable
in mt7615_bss_info_changed(), from mt7615_set_key() and from
mt7615_mac_sta_add(), so a monitor vif never has any.

Reported on mt7615e going from monitor back to managed, and on mt7663u on
an "ip link set down", both through ieee80211_del_virtual_monitor().

Fixes: d9852ab2f362 ("mt76: mt7615: keep mcu_add_bss_info enabled till interface removal")
Cc: stable@vger.kernel.org
Reported-by: Orly Orge <orlyorge2004@gmail.com>
Closes: https://lore.kernel.org/linux-wireless/CANj5C4mTOHs6riyWee=dFdkE5p=714J8xs-x3hq3ewQ+r6O_Nw@mail.gmail.com/
Reported-by: Inanix <contact@inanix.fr>
Closes: https://github.com/morrownr/mt76/issues/79
Tested-by: Inanix <contact@inanix.fr>
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index fc619ac..986fde1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -254,8 +254,10 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 
 	mt7615_mutex_acquire(dev);
 
-	mt7615_mcu_add_bss_info(phy, vif, NULL, false);
-	mt7615_mcu_sta_add(phy, vif, NULL, false);
+	if (vif->type != NL80211_IFTYPE_MONITOR) {
+		mt7615_mcu_add_bss_info(phy, vif, NULL, false);
+		mt7615_mcu_sta_add(phy, vif, NULL, false);
+	}
 
 	mt76_testmode_reset(phy->mt76, true);
 	if (vif == phy->monitor_vif)
-- 
2.55.0


