Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC269C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ideZ1Klm2NAjWMwjK8/UouIl5u5BNTWawKkvNwAq98U=; b=2BrAA15Jryl6HXwSujRsSfnxxy
	zccTLqAJjU4m1bAF3WCw8bKRyYM3XGQovMqO1kYTwtEaBVyJykXpPlqb+EvBzR8z0CN5kdOgkHBAu
	B2owEfgF3fKxudXfBfV4WxudTJhnWMraZHCMn3goDfu3t2WWKKobP4MDKp60jhbH1jFIsGp1gprY1
	CbpF9zGYfeZWf7LgaOw2d6fx/mtcNKcxYZLo1WtvzAg2ZipkQ5fG9MVdPoqlGPlRs5Tfr7Jri3WKT
	vOCFNEYdIs3ofsyZQbJC9TGdQe3MXWuR7FZQWLns4npJeBxCDI/GJf2YKTgJk6upbXogvIN9AAY5q
	coPLK98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SL-00Egy6-0f;
	Mon, 05 Jun 2023 08:20:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SJ-00EgxB-1I
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 08:20:48 +0000
X-UUID: dd7271e0037911ee912e1518a6540028-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ideZ1Klm2NAjWMwjK8/UouIl5u5BNTWawKkvNwAq98U=;
	b=Kou+9FKq9+56g5OusoGwIRg1Hsbo2SZvtlFcrBcY3z/aRW6ZvrGVxRBMdfbDux1UFmcdGG5aILYhKGPtuXEnl7jicJF056BF5UBxgrJ4RJcX9Suw7oooNoaW6y/G8Q2ajLapdpjFx2VyiggXaag5pT9y1W79M9CZKBVKoxLryNI=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.25,REQID:8c2fa14a-b1b0-49b7-b29d-ac06c0b1db45,IP:0,U
	RL:0,TC:0,Content:20,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:115
X-CID-INFO: VERSION:1.1.25,REQID:8c2fa14a-b1b0-49b7-b29d-ac06c0b1db45,IP:0,URL
	:0,TC:0,Content:20,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:115
X-CID-META: VersionHash:d5b0ae3,CLOUDID:d90f0c6e-2f20-4998-991c-3b78627e4938,B
	ulkID:230605162045QDONOK0B,BulkQuantity:0,Recheck:0,SF:19|48|29|28|17,TC:n
	il,Content:4,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dd7271e0037911ee912e1518a6540028-20230605
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1825559451; Mon, 05 Jun 2023 01:20:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 16:20:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:20:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 03/10] wifi: mt76: mt7996: fix bss wlan_idx when sending bss_info command
Date: Mon, 5 Jun 2023 16:19:40 +0800
Message-ID: <20230605081947.12804-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605081947.12804-1-shayne.chen@mediatek.com>
References: <20230605081947.12804-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012047_445412_B69C252C 
X-CRM114-Status: GOOD (  10.48  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

The bmc_tx_wlan_idx should be the wlan_idx of the current bss rather
than peer AP's wlan_idx, otherwise there will appear some frame
decryption problems on station mode.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 28930693a75a..64b99fd16f51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -712,6 +712,7 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
 	struct cfg80211_chan_def *chandef = &phy->chandef;
 	struct mt76_connac_bss_basic_tlv *bss;
 	u32 type = CONNECTION_INFRA_AP;
+	u16 sta_wlan_idx = wlan_idx;
 	struct tlv *tlv;
 	int idx;
 
@@ -731,7 +732,7 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
 				struct mt76_wcid *wcid;
 
 				wcid = (struct mt76_wcid *)sta->drv_priv;
-				wlan_idx = wcid->idx;
+				sta_wlan_idx = wcid->idx;
 			}
 			rcu_read_unlock();
 		}
@@ -751,7 +752,7 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
 	bss->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
 	bss->dtim_period = vif->bss_conf.dtim_period;
 	bss->bmc_tx_wlan_idx = cpu_to_le16(wlan_idx);
-	bss->sta_idx = cpu_to_le16(wlan_idx);
+	bss->sta_idx = cpu_to_le16(sta_wlan_idx);
 	bss->conn_type = cpu_to_le32(type);
 	bss->omac_idx = mvif->omac_idx;
 	bss->band_idx = mvif->band_idx;
-- 
2.39.2


