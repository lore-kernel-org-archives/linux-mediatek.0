Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72273CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JuqUPwvneTE8WbrG5NSOBsPogFLMaH/M01dP+LSCEk=; b=OYSuvzon4+d6YnXtge8RGtvBBS
	U+Rc4gSWuX27COH29QO9E7lf4V6IAGhDqR05aqq7tqbrHuNqq4AwbK5cZIRWHB9QmacpMMHqsu1gA
	t14MpJ8/rXjvv0wL1UnPR/swBoLmja/rMNrYzwmvBqmTX5c9/wJYRtjj7jrxz8z0QWVuq4ufWw19M
	VfHTBj3v+u3v41F7x+rXB/6nlaiJA23bEWZCf3jfhbfn8m5Aalg5Sfd6TjyHg+TkK3MUWs76IrDm9
	FaDh0+QHWdny2ssooe8cAw1Wc1qwTf/G7r4oxrv1R4OiJX+XCnzYA+qOV8QrR7KUvl1ldEfUT112V
	uFi5GaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggo-00Dhkz-1B;
	Mon, 25 Sep 2023 08:11:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggl-00Dhjl-1s
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:11:32 +0000
X-UUID: 1fa83bf45b7b11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0JuqUPwvneTE8WbrG5NSOBsPogFLMaH/M01dP+LSCEk=;
	b=MR+skQWwSAzVkeOHAKeXnfF8gMTH9blKhq5HfEdrWhq1gHkRavaatDpLYPtSHB97PLaxbP+YCd/CiopECf25XrOitwoW/ZLENsJ6ak18w2fm6TtIeHQUXcU+VH0cFOJhrEhMbT6n0Q8q8lepI922tjHDvH52XFpDtLUyJJTkbnY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:09cfa5c9-2c7a-4f30-ae20-45c69bbb2d1a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:5d7919f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1fa83bf45b7b11ee9b7791016c24628a-20230925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1881978846; Mon, 25 Sep 2023 01:11:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 16:10:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 16:10:54 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/6] wifi: mt76: mt7921: enable set txpower for UNII-4
Date: Mon, 25 Sep 2023 16:10:34 +0800
Message-ID: <1d96ae8bdd5248f1dc8cce83b545304871a958b3.1695627867.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695627867.git.deren.wu@mediatek.com>
References: <cover.1695627867.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.364800-8.000000
X-TMASE-MatchedRID: 943eAS8JJckmiAtJc/lr9wPZZctd3P4BojQrbrPpzzofx9eHA8s3saPF
	jJEFr+olAmPpbGBYlhvkwjHXXC/4I8prJP8FBOIaqEIT8PGyW77CcfklEbo7Q5fKwneGlwV3oXp
	yFyzUSAKUr8e4xVrosg3kGPM1DYLrOi6cGE1VfyvBcXVqgPn7C5YA9VVXC73soVx+33HsKxN0BN
	B20+SxH7f8mJY57oZddJaBDYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.364800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 17D800AFCDDE9BD340E907E83C8BEF9BA5D8F8EF926B5CF3E669F4F0341FC2A72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_011131_619997_16B27998 
X-CRM114-Status: UNSURE (   8.43  )
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

support power config for channel 165/173/177

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 83cf2e2b2868..ae6bf3c968df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2042,7 +2042,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 		112, 114, 116, 118, 120, 122, 124,
 		126, 128, 132, 134, 136, 138, 140,
 		142, 144, 149, 151, 153, 155, 157,
-		159, 161, 165
+		159, 161, 165, 169, 173, 177
 	};
 	static const u8 chan_list_6ghz[] = {
 		  1,   3,   5,   7,   9,  11,  13,
-- 
2.18.0


