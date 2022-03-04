Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D29C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38U0eboZtG8Zs4yDuODExZlFP4/eM4KBc9keQKVe4/I=; b=sIL0Y6G/nYZocb
	4v24MrD5F8KXUy8aNF66xy2e+1lS2fndy8qyMhmFbKQAEnPCxrYtZeXQ5XWOaAbc6QyUGYKqoXh9O
	pcGTPuAPcVWfiGyvgmxQwB4CY8b4IGXiacI5EADu/TOFSijvf4oggaEgtzTNW9ai2l4TGEpO1edXW
	pT5xK4gZvq13EeyyzkwWlAtvqMWxn9zVvHvoESjouHh+vQoH8bPjK3dqRiGGkKPJOuvfdReRHIBLN
	Kgs2paqvmOrsr4+inM2vHQxqICKVLF51NdqJNYq2n3et+OdFPTKrsUg41ck6dDPJUejsUiSV2GPXk
	HT30dnyVqw86do96EKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQHZG-00CMmQ-W0; Fri, 04 Mar 2022 23:42:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQHZD-00CMl4-FV
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 23:42:38 +0000
X-UUID: 8d615b8ec4c34d01a23955dab6c23b60-20220304
X-UUID: 8d615b8ec4c34d01a23955dab6c23b60-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412362929; Fri, 04 Mar 2022 16:42:28 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 15:42:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 07:42:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Mar 2022 07:42:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: allow beaconing on all chains
Date: Sat, 5 Mar 2022 07:42:24 +0800
Message-ID: <7dcbe1ef9dd396883ae6caf98b138c5a30429b94.1646437090.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_154235_546425_78E565D5 
X-CRM114-Status: UNSURE (   6.53  )
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

This improves rate reach performance on units with polarized antennas.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1da551f0b389..71e889b56581 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1101,6 +1101,7 @@ mt7915_mac_write_txwi_80211(struct mt7915_dev *dev, __le32 *txwi,
 	if (ieee80211_is_beacon(fc)) {
 		txwi[3] &= ~cpu_to_le32(MT_TXD3_SW_POWER_MGMT);
 		txwi[3] |= cpu_to_le32(MT_TXD3_REM_TX_COUNT);
+		txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, 0x18));
 	}
 
 	if (info->flags & IEEE80211_TX_CTL_INJECTED) {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
