Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F01C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 02:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IreNKXAd6Wij/T8hdkR8/W4pp0PDvrbdbTuyMa714HU=; b=W3i27KZ2lT5iMAjtvsYDzimW6S
	4YFbhhvEHBRYe85BC5EMwuyWwy0UGce0jr+FOr2uDUBCrtOG4PeIUNJ0IeZjnEePlClcWxUl8Ywt0
	StdtNNEC3bBo56gpwzwdhc3TZ0/lWascN2DPkBt+A3yUJAu6aMB7vpbE/2YLvBsemmMu7fwbphqF4
	iSrQm8hD4OzT/DSgAQGNJWPq+cjmN0Fkw3un5RFjjqdM97T5lqdM7wrM9zs5QqAcX8FhmLYUn+ffP
	KbmnZCnbvistXx1CkKP0iJfa3nEceIMHFX6n50HsDmrMRUI+x7SqvRkvNSsK3bo7WUlRBEBhxWMBq
	vnS1prXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQfx-00000008rhI-1EuF;
	Thu, 15 Aug 2024 02:57:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQfu-00000008rgp-2FgO
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Aug 2024 02:57:19 +0000
X-UUID: 110e9f665ab211efba0aef63c0775dbf-20240814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IreNKXAd6Wij/T8hdkR8/W4pp0PDvrbdbTuyMa714HU=;
	b=EhvLsG968NWKTBd2Vn1QWFfmTlDmR4DbviJhNXnuSEnEWBM5g3ZaKGRjmTIwBbk5eJGJQzJkLaA0PJFMhlE3Y3ToJotfW2mrqqyWUkFF9gHTrNkv5VlB9ndkQsHUrG/EHPpJe/VZPLtUSbfaGPq6WLk1vsnv/buqlG/+bbKXcEM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1b0af197-17cd-4872-819c-e7fd4148f2be,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:fb1e9cfe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 110e9f665ab211efba0aef63c0775dbf-20240814
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87094811; Wed, 14 Aug 2024 19:57:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Aug 2024 10:56:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Aug 2024 10:56:35 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH] wifi: mt76: mt7921: fix wrong UNII-4 freq range check for the channel usage
Date: Thu, 15 Aug 2024 10:56:33 +0800
Message-ID: <20240815025633.20974-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.808800-8.000000
X-TMASE-MatchedRID: PwZ81m9fkLYO9fZKTjt+z/havVZP5tTaKFFZAe4nyZ4Fi3R9x/2qQjEG
	FjeZwyRU/Wti4Vzf8lvbCHv011Gy9U/CFiHta6tDngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDX371moSn0VOAmbF1rkLU7qU7EZP1t1XBI2LIqpGKMvSJdTpzr1FBoedipJQCO3xTig3f
	bPV9K2v+/Dm8xfT8B7S7S4JFB9LdNl6jZ5qkH35hdGg+ZY7eN6THB2Q+oKru8MTI34nyF36MJL1
	aANdU8K+rL5VW+ofZc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.808800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E10A3FC5E124F9FF0A490BB7CFDBDE5BE3AD67CB69DD3D00DA2ED5DBE0B567E2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_195718_617000_513CB246 
X-CRM114-Status: UNSURE (   9.63  )
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

The check should start from 5845 to 5925, which includes
channels 169, 173, and 177.

Cc: stable@vger.kernel.org
Fixes: 09382d8f8641 ("wifi: mt76: mt7921: update the channel usage when the regd domain changed")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index ef0c721d26e3..57672c69150e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -83,7 +83,7 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 		}
 
 		/* UNII-4 */
-		if (IS_UNII_INVALID(0, 5850, 5925))
+		if (IS_UNII_INVALID(0, 5845, 5925))
 			ch->flags |= IEEE80211_CHAN_DISABLED;
 	}
 
-- 
2.18.0


