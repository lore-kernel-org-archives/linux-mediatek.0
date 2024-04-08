Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85722C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ee6ScaF8NDqFt1x4FzTWri7fuE/3zdB6eCOnjp0D+Cw=; b=Zdd7fiEdQc/OodhOWvuBOo4EiV
	y23HiyiB4YviW0EiWnFTXry73GCo3lTZV+3QJHfi2Zxkw1Xjc92reKmvsFDqGNXTcaD+40l2FsdTw
	XO8ZmNp9NE+N/edgFtTWkNy7j4+Ncftiw7OU0xNlLUogteGmIz+xuM/mSgpVGWqAqS/sSte3F88at
	RJUJvmGpeLAxK9299TZHPD0FyV5P8rSl/Yca7KOvzHpKlgM/rJxufs4qrXYqJMvN/ea68dkhQ22vI
	lvq4DZ/xFxpqV5uT1WTVVN9rjArjYcZMFNSIfqSlo0ReLSgP2EQNqGdVfqEWCgy8DtS+jxJQjAnik
	XGDq6hNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiHh-0000000EU6g-1QLm;
	Mon, 08 Apr 2024 06:15:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiHe-0000000EU5l-2FTE
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 06:15:11 +0000
X-UUID: 5785bc0cf56f11eeac1957ae9f99f617-20240407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ee6ScaF8NDqFt1x4FzTWri7fuE/3zdB6eCOnjp0D+Cw=;
	b=gpb/ph8fma/Vr7S2u69Av3c5+KTOtoLQ6O3hRxbwu41RD1ojZEyguC/4iraYXQv4NdaXDJrvGLS2sz+JmWK89odMm7anW1GMs4dXgmccIypGsiJN/dLVxn+5L5m0aGdypLZtdzXHsrTFH1cgIWVykcOoJcajskgSBzNv1U8ppy4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:72d71216-286b-42f1-8b60-9ea4e74e7ab8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:ad574f91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5785bc0cf56f11eeac1957ae9f99f617-20240407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747999055; Sun, 07 Apr 2024 23:15:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Apr 2024 14:15:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Apr 2024 14:15:03 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7996: let upper layer handle MGMT frame protection
Date: Mon, 8 Apr 2024 14:14:21 +0800
Message-ID: <20240408061421.10287-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_231510_684168_6F0C9C19 
X-CRM114-Status: GOOD (  10.73  )
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
v2: add back missing line
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 338ff10b121d..c4a068d52c35 100644
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
@@ -363,6 +359,11 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	case WLAN_CIPHER_SUITE_GCMP_256:
 	case WLAN_CIPHER_SUITE_SMS4:
 		break;
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		wcid_keyidx = &wcid->hw_key_idx2;
+		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
+		fallthrough;
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
 		if (key->keyidx == 6 || key->keyidx == 7)
-- 
2.39.2


