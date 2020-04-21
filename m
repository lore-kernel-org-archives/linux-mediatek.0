Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838ADC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:20:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5727A208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CBaFLBlL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nkUqJQfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5727A208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/I+q5fkaud4RxjulZiVYJnTsDA39Z2geEr0MxE61OIE=; b=CBaFLBlLA/ysmc
	vLfhTjlTrZlpnIyZX2gyPeYzUZTxEtT60OJFPzLCBs9BsJxLRkxeRxqCDR9NvbMw+CNnoL0zVnNuJ
	MVo7a+FWHZfJnQxqeyTJv24DwDRdX5qJIKnZOyAuezJTZylMVgtRlNLRO6D0zndJnPVRX8HBj1GQV
	h/h5nFmg9Eo2qXxD598gpzirI5Uumm3M2N32cmqYsvhyJd7ErU0TrK1U8x7kQrEjf+jwtdeBKve+E
	rZVwoAWDU9BrkSnGYeXDdLcdaX2qwG2xppP4qDiB5ZIGKy9TTWKIx2Rf+13oOIAJ5kNdlh/kjiYsE
	zqH8m0+kx0Ogsnm6r0lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQlKu-0005dw-Ud; Tue, 21 Apr 2020 05:20:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQlKr-0005c3-N0
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 05:20:43 +0000
X-UUID: 33e29c87d22a4e2598a387ca2cd31c4a-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xl04sGst5RWKqj6KRI3YoPG+MmLEAdUG9UGxqBx1emY=; 
 b=nkUqJQfOoyZ0M0dssPu+4uGdm/77TK/GJED/auh39NU0/su+YMktG04EwxbKrsJLDTeDZxK7qgS9gP5CjW9FpN8ODURksHmFIeESdaRSb1ZBw7po5YGm+Gtpmgm/k5Qw4F6XwcRI0Bd+9lOY+ap/jXlt1IghKU9F0S/J5lEW2w4=;
X-UUID: 33e29c87d22a4e2598a387ca2cd31c4a-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 211696920; Mon, 20 Apr 2020 21:20:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 22:20:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 13:20:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 13:20:26 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/3] mt76: mt7615: add missing code for providing aid info to
 the mcu
Date: Tue, 21 Apr 2020 13:20:22 +0800
Message-ID: <0292e088e934199434f0ea06598274f57a24f3d9.1587445885.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
References: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_222041_759887_0F4D52A0 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Soul
 Huang <Soul.Huang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Parameters in station record should be kept as up to date as BSS being
updated.

Fixes: a90b4ba1f134 ("mt76: mt7615: provide aid info to the mcu")
Suggested-by: YF Luo <Yf.Luo@mediatek.com>
Suggested-by: Lucy Hsu <Lucy.Hsu@mediatek.com>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index cdc8babca85a..e5012ad680bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -497,9 +497,19 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	if (changed & BSS_CHANGED_ASSOC)
+	if (changed & BSS_CHANGED_ASSOC) {
+		struct ieee80211_sta *sta;
+
 		mt7615_mcu_add_bss_info(phy, vif, info->assoc);
 
+		rcu_read_lock();
+		sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
+		rcu_read_unlock();
+
+		if (sta)
+			mt7615_mcu_sta_add(dev, vif, sta, info->assoc);
+	}
+
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
@@ -557,7 +567,8 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7615_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	mt7615_mcu_sta_add(dev, vif, sta, true);
+	if (vif->type != NL80211_IFTYPE_STATION)
+		mt7615_mcu_sta_add(dev, vif, sta, true);
 
 	return 0;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
