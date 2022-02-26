Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6438AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 00:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9JcC17NFUphBdFy3Y2pTxV/Yg1f9joRu3WckuIg5VM=; b=Tx82aRuWG+VmMY
	Y1/PzFdrkBv3U/h9vrZlMXuQlJJBnQS30ZDYE6VbTHuqbxukrXxRva7JkmJX+C0x2kbAYSDSCfFxA
	G633HF8hwFNuEvWkh2Dt991DuvZIE2KvAeoyPOWCOIwVhMW8ISIb0uQdyuzaT3NZG7hOxiGoZ6os5
	3FYZRZLEnyyTM71SHggakOiZbFlXekWZCM0ZJf1HwGBQWf0HcG0nu9oF7hSlds84iKkGL7KhLIPPF
	MXsULksbGJQ7i0Ck7d/Y4O3BrOuG7Ys/QFG7oobLuM4/DO3A80IQW9W8ge9M0yJ6CmhstkMU7Aoj6
	24P4HHQbZsKrX2Ybr/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNkv5-007FLE-8Z; Sat, 26 Feb 2022 00:26:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNkv2-007FKP-HK
 for linux-mediatek@lists.infradead.org; Sat, 26 Feb 2022 00:26:42 +0000
X-UUID: efc76b10cd20419e99e49108d363533c-20220225
X-UUID: efc76b10cd20419e99e49108d363533c-20220225
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1043810411; Fri, 25 Feb 2022 17:26:33 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 16:26:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 26 Feb 2022 08:26:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Feb 2022 08:26:18 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/2] mt76: mt7921: use mt76_hw instead of open coding it
Date: Sat, 26 Feb 2022 08:26:15 +0800
Message-ID: <a081918cc1892c4289068b904362d42d7cdb6c69.1645832790.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
References: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_162640_602789_14DA52B6 
X-CRM114-Status: GOOD (  10.43  )
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

use mt76_hw instead of open coding it

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: no change
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 0f3c56530e66..349d1d0f9bac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -491,7 +491,7 @@ mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 
 void mt7921_set_runtime_pm(struct mt7921_dev *dev)
 {
-	struct ieee80211_hw *hw = dev->mphy.hw;
+	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct mt76_connac_pm *pm = &dev->pm;
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
