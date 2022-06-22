Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F116C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUAi/Iu+Qdzqomw5jGnHCvxQxIhwfXkQim/dC0pCFW4=; b=Lp6MPMphYnRl36jqdHP8PWqJWm
	FVmhhgKCUpt8uH2EXexNyNB5ZO/Xy51ZsDQ/l/kUUuEKXbzRl+lPfbRmLLsMle9FtJk2U396F/kmd
	UqLJvDGg2dW4/98eUV70GXWBBvr68A5dCx/yZ8r+L/GPfdr0K2wuHoNmF840X5Xr63GbbnJwMFY7V
	Qpl6LzP0RdIwEssT+eD81Y3P6KWh01mPvQN+73dVjUbU3ZXo8ZNEbrYvxqj/Qb0SRFHd2UMJd0vB5
	QJugZ63fjiN/JoigSB3h69mvNfAB+oRUpjMUKBHeePVI/Z7iZBJ9wcU86GxWjyPM2DZarHCFNYgd/
	M0cqbGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pG8-0080fK-DG; Wed, 22 Jun 2022 01:34:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pG4-0080cn-Or
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 01:34:18 +0000
X-UUID: 2c9aff4f382945618c32f61d1433ffba-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e69b9ba5-f928-4b04-9942-28d74bac2564,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ba38b02d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2c9aff4f382945618c32f61d1433ffba-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 262865420; Tue, 21 Jun 2022 18:34:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:24:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 09:24:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jun 2022 09:24:50 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: add sta_rec with EXTRA_INFO_NEW for the first time only
Date: Wed, 22 Jun 2022 09:24:49 +0800
Message-ID: <20220622012449.17797-2-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220622012449.17797-1-chui-hao.chiu@mediatek.com>
References: <20220622012449.17797-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_183416_886704_29749259 
X-CRM114-Status: GOOD (  11.15  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Set EXTRA_INFO_NEW for the first time only to prevent adding the same
starec entry, otherwise the entry might be removed in fw.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 793498175..395879923 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -235,7 +235,6 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	mt7915_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
 	if (vif->txq) {
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
 		mtxq->wcid = idx;
@@ -251,6 +250,7 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 
 	mt7915_mcu_add_bss_info(phy, vif, true);
 	mt7915_mcu_add_sta(dev, vif, NULL, true);
+	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
 
 out:
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 45fd844a4..b24692399 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1663,7 +1663,8 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(skb, vif, sta, enable, true);
+	mt76_connac_mcu_sta_basic_tlv(skb, vif, sta, enable,
+			!rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
 	if (!enable)
 		goto out;
 
-- 
2.18.0


