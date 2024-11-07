Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E461BD5AE60
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmwFuwWjNPLPNCJb3pEwS6rU69b498swzwDmiyKrQjU=; b=ya0izRYj062mG6P4alweuZze8r
	4fclb8sXKnG9jvMfttTidJuRJE8sBill/Ey0YbI/EKCcBFXtCT2phBBjfwbj+Za8rn8FBUXGo6UvT
	ndTQYpiNYp9sqFeXKMpT9DWG5rjfu+86ybzKoogE7M4OixiCJ/rJeN/krpPyubLGKpUVFOYu9gFIj
	FCf9E0RgQR7wgx6ydjm0kdaIZZBzhKnKRcP62Ad2JtwZy65J/yU2WX4z5ieBXbNXpBhiHFBtcQPM8
	el50Dg417+zsbRAku0xpYVoQ9WKCmp8YrTlujoWqE9QfD9+Ob8pQL7U126pMBTWXle7einb6svz1b
	jdKWPP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8v63-00000005iNo-3bGZ;
	Thu, 07 Nov 2024 05:30:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8v60-00000005iMd-3B9T
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Nov 2024 05:30:18 +0000
X-UUID: 5b6ac6269cc911ef82ff63e91e7eb18c-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BmwFuwWjNPLPNCJb3pEwS6rU69b498swzwDmiyKrQjU=;
	b=EoDJf+AS0qC+LbU/T8X/zYUu0Z2F4/YPsGlIF6sHJVnrGYVZDKQhpd+C5ukJcroDxMb8EtBJlJTWETm9m7+AN3MtWEoQw3ApJwuUIp7KhNSEkFYSHnudR3UxuHA5n2YNtl1G0v/8T3Y3W14Wok749jlvp/rMx/UrLf1CNtQ4+HM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:2441967a-d27d-4b4e-806e-3f982376453b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:fcf8a7ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5b6ac6269cc911ef82ff63e91e7eb18c-20241106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1141786323; Wed, 06 Nov 2024 22:30:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 13:30:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 13:30:08 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix the invalid ip address for arp offload
Date: Thu, 7 Nov 2024 13:30:05 +0800
Message-ID: <20241107053005.10558-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_213016_842741_2E0A6B5E 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The wrong ieee80211_vif will lead to get invalid ip address and
the correct ieee80211_vif can be obtained from ieee80211_bss_conf.

Fixes: 147324292979 ("wifi: mt76: mt7925: add link handling in the BSS_CHANGED_ARP_FILTER handler")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b43617dbd5fd..123a585098e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -123,10 +123,8 @@ EXPORT_SYMBOL_GPL(mt7925_mcu_regval);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 				 struct ieee80211_bss_conf *link_conf)
 {
-	struct ieee80211_vif *mvif = container_of((void *)link_conf->vif,
-						  struct ieee80211_vif,
-						  drv_priv);
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct ieee80211_vif *mvif = link_conf->vif;
 	struct sk_buff *skb;
 	int i, len = min_t(int, mvif->cfg.arp_addr_cnt,
 			   IEEE80211_BSS_ARP_ADDR_LIST_LEN);
-- 
2.25.1


