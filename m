Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8746C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ziSkhf/HPCL6gzDTvT3hjMVmbmw5JT9p7h3wgw4xuLg=; b=utJ/yl7+qNrHNkOUrt2nfyCuBR
	CjKEH3lYjGvIoclueKsZx+SHtc6QuyOK133xG4n/gKyB41aJbaJtElwd5FwpzYGMis+IgRXY5PSk7
	N/YLN8s/TVZLYn7q3gSr9VclJkoqUYf2frpVvybGyxJ85HKnIyuEL5uJLCleR29mWkgcYA0EUPa0t
	69d7wNilNYx0T9ROcqhcRWx4Ip/toMBrDxhXF4W7ngAdOqilR69dTMOf6CAyeKlqg1wJOi3+9kAtM
	QH44RKrZSwCkio62MBysKv4DInvWA4VpyEKjGgufg7xYxCG6J4I8UbSce2U9ZGoXb+D856IS/vK5h
	9EbIeNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn3eK-0076Re-15;
	Thu, 13 Apr 2023 20:34:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn3eH-0076P5-2j
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 20:34:31 +0000
X-UUID: 8d6c2280da3a11edb7d8d11f642b8e78-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ziSkhf/HPCL6gzDTvT3hjMVmbmw5JT9p7h3wgw4xuLg=;
	b=smbeFu8FKUfQ5kIl5BtYgeSh/iKiGHP2Y6ZRi3jVcXPN5wMTnFXvVe8IroC3R77qixTu7HsLe06Jb0GiStVu46Ir1MQDOf8rC351lkM/BRj76oO4NjvXzctH6hvJiN7Xx4gAMfnPX/GTpvcY+lLrVVzTFQAe9C4aRohsgizBx+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d8d6b284-82a4-4dd0-abfa-b2e9af039ee2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:1cabfb83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8d6c2280da3a11edb7d8d11f642b8e78-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 570465343; Thu, 13 Apr 2023 13:34:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 14 Apr 2023 04:23:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 14 Apr 2023 04:23:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/5] wifi: mt76: connac: fix txd multicast rate setting
Date: Fri, 14 Apr 2023 04:23:29 +0800
Message-ID: <f5d216bcd79cc444b7f7039dd3898e08aff70286.1681416097.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_133429_889007_642EE114 
X-CRM114-Status: UNSURE (   8.52  )
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

The vif->bss_conf.mcast_rate should be applied to multicast data frame
only.

Fixes: 182071cdd594 ("mt76: connac: move connac2_mac_write_txwi in mt76_connac module")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index aed4ee95fb2e..82aac0a04655 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -537,7 +537,8 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	if (txwi[2] & cpu_to_le32(MT_TXD2_FIX_RATE)) {
 		/* Fixed rata is available just for 802.11 txd */
 		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
-		bool multicast = is_multicast_ether_addr(hdr->addr1);
+		bool multicast = ieee80211_is_data(hdr->frame_control) &&
+				 is_multicast_ether_addr(hdr->addr1);
 		u16 rate = mt76_connac2_mac_tx_rate_val(mphy, vif, beacon,
 							multicast);
 		u32 val = MT_TXD6_FIXED_BW;
-- 
2.18.0


