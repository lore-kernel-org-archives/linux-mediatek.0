Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB9C2FC14
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUQ1PX4nHQYcJOBZC6EajmPL1CAhcP5+ZnUx+6W1ftY=; b=LVPDBvwF942jcSWuC2Z/BOR8/i
	eK0mylvfEZHDoo9itwrWVzkBqMrqsu4RCUVN71sy98X9w8GeiVv0bKuG+gvxe4XzMBqRY7gReskSZ
	Na4YXlI+5zJmeRAPnPWY44dWR7zA7UHUUi7BO6PexwLIrAFwe8py36bYnC9O8KCEkUlVtsKIIxUNJ
	axhB6tzryDfyqliq+8D6/5Cis9i9s68GJd7Kt2AqcD/Qp/PDgY1GrVtBIPdZKtFPCWsez5LaLLWm3
	agl08bE4LVlmFlG+UpP+r3vcbmUHzPyTMMk/kXoCcllEq3iklSM8UPOZFem+OOwqp9+LX7buav7r7
	SIAwxMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxc-005mKv-2J;
	Thu, 17 Aug 2023 08:02:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxX-005mGu-1M
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:25 +0000
X-UUID: 603564323cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wUQ1PX4nHQYcJOBZC6EajmPL1CAhcP5+ZnUx+6W1ftY=;
	b=T+FzkqHG+Mg7Dq4ag/Sj4pvbdaZuirfy4n3agYsA2kePWvuO73jhYT9KVc4iBWLbGpDeAZu+WcCGuI6pS0xU/mQdd3+CRTafu2NHKzR7bQEPLfjCVGqyJbk//uiD2AwWn7No6a/Q7hbF7jRGwDf9roxDvmDLHvy5yn3wr3aGKI4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e1964a44-c22c-4536-b8ae-52f9aab54674,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:e1964a44-c22c-4536-b8ae-52f9aab54674,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:154ddf12-4929-4845-9571-38c601e9c3c9,B
	ulkID:230817160214EOQTY9GL,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: 603564323cd411ee83ed1395ce914268-20230817
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1396422102; Thu, 17 Aug 2023 01:02:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 4/9] wifi: mt76: mt7996: fix wmm queue mapping
Date: Thu, 17 Aug 2023 16:01:49 +0800
Message-ID: <20230817080154.16475-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010223_480434_15079EA0 
X-CRM114-Status: GOOD (  12.59  )
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

Firmware uses access class index (ACI) for wmm parameters update, so
convert mac80211 queue to ACI in mt7996_conf_tx().

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c  |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c3a479dc3f53..600010cdb94e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -190,7 +190,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	mvif->mt76.omac_idx = idx;
 	mvif->phy = phy;
 	mvif->mt76.band_idx = band_idx;
-	mvif->mt76.wmm_idx = band_idx;
+	mvif->mt76.wmm_idx = vif->type != NL80211_IFTYPE_AP;
 
 	ret = mt7996_mcu_add_dev_info(phy, vif, true);
 	if (ret)
@@ -414,10 +414,16 @@ mt7996_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       const struct ieee80211_tx_queue_params *params)
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	const u8 mq_to_aci[] = {
+		[IEEE80211_AC_VO] = 3,
+		[IEEE80211_AC_VI] = 2,
+		[IEEE80211_AC_BE] = 0,
+		[IEEE80211_AC_BK] = 1,
+	};
 
+	/* firmware uses access class index */
+	mvif->queue_params[mq_to_aci[queue]] = *params;
 	/* no need to update right away, we'll get BSS_CHANGED_QOS */
-	queue = mt76_connac_lmac_mapping(queue);
-	mvif->queue_params[queue] = *params;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4ed164381898..cf443748ef7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2679,7 +2679,7 @@ int mt7996_mcu_set_tx(struct mt7996_dev *dev, struct ieee80211_vif *vif)
 
 		e = (struct edca *)tlv;
 		e->set = WMM_PARAM_SET;
-		e->queue = ac + mvif->mt76.wmm_idx * MT7996_MAX_WMM_SETS;
+		e->queue = ac;
 		e->aifs = q->aifs;
 		e->txop = cpu_to_le16(q->txop);
 
-- 
2.39.2


