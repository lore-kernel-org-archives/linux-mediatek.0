Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E1CC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyhFQAKnySbRXD6mjYJunCjjO4/F3Ayos6o2jXmDw9o=; b=PuwJLWVUqkqBXb3zYXX9YJdESY
	dZEeaBoISLN3i8CQzsW/ikEjp/VaB33+juE64tHg/gXtQZczTaeVBbKkRRdtEy6DHxUVOZ9X7r/sa
	OkZaR0jKaBPGop5mNUq04/UIr119AHEP+7PO4y5MshBzTfKd482Xr8Bqlm0kc6YevFDINhb2gTnTX
	xC88f9Cyraw2Kjo2m6LH/6+oiAEoXk6ECbj9SregjojO8ga9hX8YlLHg7Jni6WDIkldC3nI5n6XrR
	Qytxq/xRT61C3NjfRDNodaK2OhxLkI82azxUjzn2m5+mCooWk5E1d53a2izYRgXvuMAXLFCHjY7hp
	ApGHid1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpf-0000000GttB-3aAt;
	Wed, 20 Mar 2024 11:10:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpc-0000000Gtrf-2orP
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:10:06 +0000
X-UUID: 65e6ab0ee6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zyhFQAKnySbRXD6mjYJunCjjO4/F3Ayos6o2jXmDw9o=;
	b=md44iAOzWfDMml/U9I+WmuVEB+++1ORI/XhKAHc23u9T7yfARkT9zvPer/KVBExB6UGjv2QLdMS9LVLD2s3Mwyjdp84C5qEbQLf4uKKSh/ho7E0yeOl8JzZVx2qzgsTJDw0qLIVyctfHZBU5o1jNrL+BPTBgPnLGuaifzwfy2Z0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9ab6bedd-ac0e-4d3a-8be9-2cd6aa739ef7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:0607a090-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 65e6ab0ee6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1326947325; Wed, 20 Mar 2024 04:10:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/10] wifi: mt76: mt7996: let upper layer handle MGMT frame protection
Date: Wed, 20 Mar 2024 19:09:17 +0800
Message-ID: <20240320110918.3488-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.805400-8.000000
X-TMASE-MatchedRID: udTajMTn5cCPfIU6nDBTAy97pb4g5HCtQBnqdxuJ5SAbZGMpAXstDvlY
	oV6p/cSxrKWVhE5vxYZ+QtlfTC0TseF/B1jEjV+6BtdMuQdWhdV9LQinZ4QefCP/VFuTOXUTC5M
	umjkcRzX3FLeZXNZS4EZLVcXaUbdi/Ef44D9SohVlpVNGOJm8BV8dd/UeRj0HTpZ5lw6YKmmeqD
	9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.805400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 79063AB354112B396A51E2163246A5C7592BD77BDEA60325FE89C744806194D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_041004_747999_DD962BD1 
X-CRM114-Status: GOOD (  11.01  )
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

From: Michael-CY Lee <michael-cy.lee@mediatek.com>

The firmware support for management frame protection has limitations:
- do not support cipher BIP-GMAC-128 and BIP-GMAC-256
- support cipher BIP-CMAC-128 and BIP-CMAC-256, except action frame with
  action type 'not robust'.

Therefore, to simplify the logic, do not set the IGTK to firmware and
let the encryption of management frames be handled by upper layer.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 338ff10b121d..4ab4d2bcbedc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -352,10 +352,6 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
-	case WLAN_CIPHER_SUITE_AES_CMAC:
-		wcid_keyidx = &wcid->hw_key_idx2;
-		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
-		break;
 	case WLAN_CIPHER_SUITE_TKIP:
 	case WLAN_CIPHER_SUITE_CCMP:
 	case WLAN_CIPHER_SUITE_CCMP_256:
@@ -363,6 +359,10 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	case WLAN_CIPHER_SUITE_GCMP_256:
 	case WLAN_CIPHER_SUITE_SMS4:
 		break;
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
+		fallthrough;
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
 		if (key->keyidx == 6 || key->keyidx == 7)
-- 
2.39.2


