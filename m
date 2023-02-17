Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65019C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aNUT+++1EZBfVnzvrwU1iD84ekce1osmO1KrvW0OEpg=; b=FMFRNLXUhhwHVE+Iptyr9S2l4p
	NhE1zTkM8NDkuAk7S4A3/t7m5927GvA18DWZXGZfcAQ9A/RkuTmNE+reubrsuelONVvZVsKGEapCo
	arfKl7gU7uXHBVE00bMTmrfX3NvsfUxsS3QX8kk0FtbK6IVXj04PaTG+P0OrL14ICKr8QEwwM9yH0
	M6pMJduksHoaPXDNrNpGXZWfV2edfYT1ZK9daoPyaUEXC3tEQuYfwlU54dsmDK/nNhSEDZJMA04QX
	FOezBUI3VyYQahf9kQS/Ip1sxs/SgrWEkYsAgXi/PpIbaYq4zFCUobAC/5YDPYS7YazrgG0XUQlx4
	+3SJMk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4zT-00FL6y-DF; Fri, 17 Feb 2023 17:57:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4zQ-00FL6Z-UG
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 17:57:46 +0000
X-UUID: 923816e4aeec11eda08d4d6090ec5a5c-20230217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aNUT+++1EZBfVnzvrwU1iD84ekce1osmO1KrvW0OEpg=;
	b=bNiysFvXZYAdW3a9UNvRxwYvSo/sieKmM34XzUmpEhk0Dz5E4NqZvdPuMRpogIu33AT4ndB6l5z4n3NV7yhGiHe46/HM/8vE8La2zNiYYdYzdHtU6FoSO3IaR7C5Kpse2yPMBjgWyC3DaIGIyD1dmUg2XC8EQ/re1OxpZ+pHWxI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:7b3883b0-0325-4604-a3a0-3c044ff383aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:3d4fcbb0-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 923816e4aeec11eda08d4d6090ec5a5c-20230217
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 919970297; Fri, 17 Feb 2023 10:57:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 18 Feb 2023 01:47:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 18 Feb 2023 01:47:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Himanshu Goyal <himanshu.goyal@mediatek.com>
Subject: [PATCH] wifi: mt76: dynamic channel bandwidth changes in AP mode
Date: Sat, 18 Feb 2023 01:47:32 +0800
Message-ID: <61b1b729baa0cc3160ef65cbdee74222c43ef2b3.1676609955.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_095745_149125_7DBB6181 
X-CRM114-Status: UNSURE (   8.53  )
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

Allow AP to change channel width for 40Mhz intolerant STA on the
2.4 GHz band.

Signed-off-by: Himanshu Goyal <himanshu.goyal@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index b117e4467c87..5ebadf8367ae 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -418,7 +418,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	SET_IEEE80211_DEV(hw, dev->dev);
 	SET_IEEE80211_PERM_ADDR(hw, phy->macaddr);
 
-	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
+	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR |
+			   NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
 			WIPHY_FLAG_SUPPORTS_TDLS |
 			WIPHY_FLAG_AP_UAPSD;
-- 
2.18.0


