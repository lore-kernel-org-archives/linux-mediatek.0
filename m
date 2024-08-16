Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9058C5320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P8Q5aPYJ95Nkv+yhaexcDyfyP79mJeFOtrPENogz6Q=; b=shvaWiE9xJPqOazqNyL8AZUSTv
	yyvgCJGGtQN2yz+INVU6sbQghfY4A8Y/DXotOK9u478wZUjc7ZcBi44s7h9d5H2Hwd1Npi6thE7Az
	po9CJH0GQTBj+DkJ1aXYB+C32r4yBCBiUegsbUW07tIkq1UW32ipzg2orAzA7NZTAlGLv55MhunBG
	iwfjsH0Q0Cco6gA0bbZq6L4BDl85oeesWBJ+Y2ABUXUAQuAzrI2ky82VDubbzK5HLvuS53QdfoOvY
	7NvblLS8HsUnvRtAmzUbO6UsARQhzrGy9PdqhCn79Ww4ZHnbbAswKbWhuRlPuJu4bWrXHghzdOMlu
	CXJWUxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdv-0000000CV6J-1WNF;
	Fri, 16 Aug 2024 09:53:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setbH-0000000CUOC-43qi
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:50:30 +0000
X-UUID: f5e34cc45bb411efba0aef63c0775dbf-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0P8Q5aPYJ95Nkv+yhaexcDyfyP79mJeFOtrPENogz6Q=;
	b=EqyWnft0RiMIsj3XBm14MaK/F1noCLqhD9XdKVqYF19pyD4LmWuVqsimDzxBmzCMYRcWkvPO4TRuNgNhpVfD4FSlLTNYoCpWrgynR1+gcpJ6HKfqusR69gMByuuyth31wHYgB8TvQ7XmY7pVFDv1+Dn5fFtpXx5Mzez8SKXODlM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:70309889-5b3e-40a4-b803-68d049dddc34,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c360b1fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f5e34cc45bb411efba0aef63c0775dbf-20240816
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1846995436; Fri, 16 Aug 2024 02:50:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:50:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:16 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 12/12] wifi: mt76: mt7996: set IEEE80211_KEY_FLAG_GENERATE_MMIE for other ciphers
Date: Fri, 16 Aug 2024 17:46:35 +0800
Message-ID: <20240816094635.2391-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.424400-8.000000
X-TMASE-MatchedRID: 72n23NsrtG5Dn01oiZfuY4Q6iEG+7EHnVNyumldWne3fc2Xd6VJ+yjFa
	TRf5dTetdwvRxvSoxhzX3CBAz92EpWNvKIW9g24opvwZ9GmdwDNMkOX0UoduuQqiCYa6w8tvxjf
	J+i+nbHSPvzCryM/S54Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGkbHfwjbIquItEKd2FZKuTfUvi
	hDc8zGGPsVh7XWXFhv56vXtoWyuGHAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.424400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 854B1E48823A03FE6D506702CAEB90D599A40A29D76B55F8503079D1F7322EDF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025028_039511_A9916768 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Michael-CY Lee <michael-cy.lee@mediatek.com>

When beacon protection is enabled, FW checks MMIE tag & length in the
beacon for every cipher mode. To pass the check, driver needs to set the
key flag IEEE80211_KEY_GENERATE_MMIE to let mac80211 generate and
initialize MMIE.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 1ab2fb292266..d43bd5c2432e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -364,14 +364,14 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	case WLAN_CIPHER_SUITE_SMS4:
 		break;
 	case WLAN_CIPHER_SUITE_AES_CMAC:
-		wcid_keyidx = &wcid->hw_key_idx2;
-		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
-		fallthrough;
 	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
-		if (key->keyidx == 6 || key->keyidx == 7)
+		if (key->keyidx == 6 || key->keyidx == 7) {
+			wcid_keyidx = &wcid->hw_key_idx2;
+			key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 			break;
+		}
 		fallthrough;
 	case WLAN_CIPHER_SUITE_WEP40:
 	case WLAN_CIPHER_SUITE_WEP104:
-- 
2.39.2


