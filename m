Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C87EC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHFq/SHYWwmMrxqEzdo+SS/aNsqA6ziw9jOujhP9PYE=; b=liAsBt3NlBXxTRuPe6mI8qr95j
	2CQnBXk6/5B8IMmz7qOy41gjgrV/n0XcBywOpEMb/PqM1LziB7ZOb2nOPKiZ5aPULkR9clBo1ex1Q
	UqWxreF31WxMLmVgEaW1MtYtsTUy6olDutH/81heHYRbwI0Ha+idbejI9uLbmta4/7kmwf6ZeO6P9
	ZUi5hTozt0QkddA2dVHLuIIsrJpvWZFhPVU0yWFpycgp/IwUZIeJMUMtajh8rnM60a1IJHM3ojj/g
	IDukGLo50UG1K4Bw0D0ieHyWvfXbzuMxG1edC/eXd9JA5Kg4HUM8FpEROdBZvqnwbK81Bb5iwlMzK
	F7b3c8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpj-0000000Gtug-3s4n;
	Wed, 20 Mar 2024 11:10:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpe-0000000Gtrf-1KoP
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:10:07 +0000
X-UUID: 65975518e6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qHFq/SHYWwmMrxqEzdo+SS/aNsqA6ziw9jOujhP9PYE=;
	b=DdAfNmpqefUoT18qqyU5epKKXWrQJe6MFBhgzRJko3ENiBwTzyljijgxX0q4ght7rtF90y4TufzVbitoXn/6k+bPKpNZFCzESp/RBUGbdoQzksQA2dmNunN+4QUorjiME0+eHGEUpHPLL6GJ5mf2sQRkSRvB5PtvQ1dmPOxWrcg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:a2343651-f307-4078-bfd7-39b8f6fa638f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:0507a090-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 65975518e6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2138778213; Wed, 20 Mar 2024 04:10:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 03/10] wifi: mt76: mt7996: set RCPI value in rate control command
Date: Wed, 20 Mar 2024 19:09:11 +0800
Message-ID: <20240320110918.3488-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.180700-8.000000
X-TMASE-MatchedRID: QbPx/KKIOtkVAKRaMHqjDuqwWVBfMuvoiXPf/NTPc3L7a38GZa638/9T
	oIqmlx19ThbvLLI8RvPySrCMyCN+k7f0EuHoGRzuXP5rFAucBUF9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO22utO5qEfOUcvaotXfhHsZS0JIXn46gU++kqPMl4Gd85C8Y298Z3DOAzbuP/fdBgNF+R
	fkwBqz1SePOtBmr2D8XDMWiox8SpCKT2uf3M1sLUma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6
	x5U/HriPpCuffGH9zI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.180700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 51CF1722E20EA23050E6926241C88091E4E8080300A86576510A5276BDA6BBDE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_041006_392809_6E49276D 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Set RCPI values in mt7996_mcu_sta_rate_ctrl_tlv(), which can make the
FW rate control algorithm be initialized with a better MCS selection
table.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index fd0cc945b22a..ddd93ec1dddd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1968,6 +1968,7 @@ static void
 mt7996_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7996_dev *dev,
 			     struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
+#define INIT_RCPI 180
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt76_phy *mphy = mvif->phy->mt76;
 	struct cfg80211_chan_def *chandef = &mphy->chandef;
@@ -2065,6 +2066,8 @@ mt7996_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7996_dev *dev,
 					       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP);
 	}
 	ra->sta_cap = cpu_to_le32(cap);
+
+	memset(ra->rx_rcpi, INIT_RCPI, sizeof(ra->rx_rcpi));
 }
 
 int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-- 
2.39.2


