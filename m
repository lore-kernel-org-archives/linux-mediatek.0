Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A3C4706F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDWDn9oBv1U+3xvwbXPmm8vBhm6pjyap2Yx2ddY1yCs=; b=TxZY2qxiSxBCm1TAFtuMJP4ksC
	VZk+Sy0opsl2vBnIp0dAPSqqgoLu4cKUkoCCMdFLCXb96VC1wZP7kdGnENs8BEc1pkBNOK3YsAYQs
	txpa7UYOUQIDhuCGbkx9LePMprKkBMG1VDUL4vl5EtGXdQMUY8IZjfSS6FONCscy5g7PkJzJNP46f
	dDtA2BH6h++U6CyDrD5zIaiyCIZFl8etaWEL9nh1RaBPshzdqJ2dgKzvrSWBt4jTWA5Vk0IBGHBec
	h2vNrH0bccD79FeMYQE6mcOC1T3JEORRn7s5m68FgOu+s0pu2j36Mvu3gvh5/T0j2ItITmpzRSR0Y
	gUGvq+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNX-00GSki-0z;
	Thu, 28 Dec 2023 09:08:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNU-00GSiD-0W
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 09:08:33 +0000
X-UUID: aa6b51c0a56011ee9a662f17bb45267e-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zDWDn9oBv1U+3xvwbXPmm8vBhm6pjyap2Yx2ddY1yCs=;
	b=SAyVrnL/ddbvL7vEjulmVTyGRM6F32xlfu3SyF/vQZfH6WhjU/dixUWHocYsHELamTU+YDVa59FryXR1KIiqyFhk45xAFc/zcj6xzg9E8meGgfAUzUJBVquQJC0TpE6kN2RO7gOPEKp3m2x81W/dn+kMCQCbB/Xh4WtDWdKqKCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:3c29077b-0883-46bd-9a03-f0df68e60560,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:06e8932e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa6b51c0a56011ee9a662f17bb45267e-20231228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1558001288; Thu, 28 Dec 2023 02:08:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Dec 2023 17:07:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Dec 2023 17:07:51 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 01/10] wifi: mt76: mt7925: fix connect to 80211b mode fail in 2Ghz band
Date: Thu, 28 Dec 2023 17:07:40 +0800
Message-ID: <20231228090749.15191-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
References: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.257000-8.000000
X-TMASE-MatchedRID: bN0Ga+Wo/7hM4VjZ76ar2O7KTDtx8CggKx5ICGp/WtHn6GYh0cRtjgqu
	sGnv+h2ZtYR/uNxnStF3sYj9S1edi5h0PDgwvMa21tU7lyp9XhHpq684eYHKOpsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXVyxeDRw4D4Y4ZmzlSMcFDcVOAHdxVcYcVY7cnaNuxij7jS
	78m3fSKupsNAGGHNIh0+gS1dRxxfgJAnkL6fnskqMvYuBNt1czF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.257000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 36A22719969328C328E9BB42351D0352DA707616F7D58815E5AD14B8355A4B302000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_010832_228407_F16159F9 
X-CRM114-Status: UNSURE (   8.41  )
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

Driver should setting correct phy mode to firmware when in legacy mode.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c5fd7116929b..1fc9ecb96bc4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1460,12 +1460,10 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 	struct tlv *tlv;
 	u8 af = 0, mm = 0;
 
-	if (!sta->deflink.ht_cap.ht_supported && !sta->deflink.he_6ghz_capa.capa)
-		return;
-
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
 	phy = (struct sta_rec_phy *)tlv;
 	phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif, chandef->chan->band, sta);
+	phy->basic_rate = cpu_to_le16((u16)vif->bss_conf.basic_rates);
 	if (sta->deflink.ht_cap.ht_supported) {
 		af = sta->deflink.ht_cap.ampdu_factor;
 		mm = sta->deflink.ht_cap.ampdu_density;
-- 
2.18.0


