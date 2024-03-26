Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DF2C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 00:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d5EWYJtwADKsUoaus/ouDpTQKGw+PIs1wCdfP57Bel0=; b=SoeoeIhdnam7/QzpqMmKKUvpP4
	GpHcRdVG7TuogRTQ22CzccRLhfIRSH2bG855W5iZfhcnMidxD2CqzG10uzNZRV3PxIJHRrNfVgO8l
	hNxN5tqCxKKW2WpvAlcbuCEghBHpdG3uIG325Ok++A01YdxriYase96KwNPn/Ov+TzF0Vdh/D7EKg
	r77Kmts402d2BKAj7+iBIjLI6fBsf0y+BgUF25d4eLgEzM12HflXFjRxI+Kc/bb4nwLqOCamlc/7x
	OACThjvtxfQqgHIqNxu12NDcbotRk5bV+b8DwyZejIAgmqVccOEc4gmwOwvMj6QBdHd1CNRcTPjEO
	O3Gk4xcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rousH-00000002Wj9-0QgX;
	Tue, 26 Mar 2024 00:41:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rousE-00000002Whc-021l
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 00:41:07 +0000
X-UUID: 8131e28aeb0911ee96d5dfc950b7243d-20240325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d5EWYJtwADKsUoaus/ouDpTQKGw+PIs1wCdfP57Bel0=;
	b=tqQEq4jAYEFsbFaGdNd5L4b6dL2tz00J/DCSwmmVMB5lVUfB+4jnCkWNFgRFd9coiYI6LJPLLr4jfI9cnYGJ1dcGtp5gD92V8BMfeyLT1xbb4v8J7RAaItC25/llqUhysKstSP39d0L3PXoh2T8HhAvkHWyt3PO/76vd2Wm+24Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:2959adc6-e638-4a18-941c-13a498c2519c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:92eeeb81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8131e28aeb0911ee96d5dfc950b7243d-20240325
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712603613; Mon, 25 Mar 2024 17:40:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Mar 2024 08:30:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Mar 2024 08:30:51 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: extend IEEE80211_KEY_FLAG_GENERATE_MMIE to other ciphers
Date: Tue, 26 Mar 2024 08:30:36 +0800
Message-ID: <20240326003036.15215-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_174106_168375_40CDDFE9 
X-CRM114-Status: GOOD (  12.09  )
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

This commit extends the flag IEEE80211_KEY_FLAG_GENERATE_MMIE to
BIP-CMAC-256, BIP-GMAC-128 and BIP-GMAC-256 for the same reason that the
flag was added.
(a0b4496a4368: mac80211: add IEEE80211_KEY_FLAG_GENERATE_MMIE to ieee80211_key_flags)

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 include/net/mac80211.h |  4 ++--
 net/mac80211/wpa.c     | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f5b6f46..7709854 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2133,8 +2133,8 @@ static inline bool lockdep_vif_wiphy_mutex_held(struct ieee80211_vif *vif)
  *	@IEEE80211_KEY_FLAG_GENERATE_MMIC on the same key.
  * @IEEE80211_KEY_FLAG_NO_AUTO_TX: Key needs explicit Tx activation.
  * @IEEE80211_KEY_FLAG_GENERATE_MMIE: This flag should be set by the driver
- *	for a AES_CMAC key to indicate that it requires sequence number
- *	generation only
+ *	for a AES_CMAC or a AES_GMAC key to indicate that it requires sequence
+ *	number generation only
  * @IEEE80211_KEY_FLAG_SPP_AMSDU: SPP A-MSDUs can be used with this key
  *	(set by mac80211 from the sta->spp_amsdu flag)
  */
diff --git a/net/mac80211/wpa.c b/net/mac80211/wpa.c
index daf1bcc..e66f917 100644
--- a/net/mac80211/wpa.c
+++ b/net/mac80211/wpa.c
@@ -903,7 +903,8 @@ ieee80211_crypto_aes_cmac_256_encrypt(struct ieee80211_tx_data *tx)
 
 	info = IEEE80211_SKB_CB(skb);
 
-	if (info->control.hw_key)
+	if (info->control.hw_key &&
+	    !(key->conf.flags & IEEE80211_KEY_FLAG_GENERATE_MMIE))
 		return TX_CONTINUE;
 
 	if (WARN_ON(skb_tailroom(skb) < sizeof(*mmie)))
@@ -919,6 +920,9 @@ ieee80211_crypto_aes_cmac_256_encrypt(struct ieee80211_tx_data *tx)
 
 	bip_ipn_set64(mmie->sequence_number, pn64);
 
+	if (info->control.hw_key)
+		return TX_CONTINUE;
+
 	bip_aad(skb, aad);
 
 	/* MIC = AES-256-CMAC(IGTK, AAD || Management Frame Body || MMIE, 128)
@@ -1048,7 +1052,8 @@ ieee80211_crypto_aes_gmac_encrypt(struct ieee80211_tx_data *tx)
 
 	info = IEEE80211_SKB_CB(skb);
 
-	if (info->control.hw_key)
+	if (info->control.hw_key &&
+	    !(key->conf.flags & IEEE80211_KEY_FLAG_GENERATE_MMIE))
 		return TX_CONTINUE;
 
 	if (WARN_ON(skb_tailroom(skb) < sizeof(*mmie)))
@@ -1064,6 +1069,9 @@ ieee80211_crypto_aes_gmac_encrypt(struct ieee80211_tx_data *tx)
 
 	bip_ipn_set64(mmie->sequence_number, pn64);
 
+	if (info->control.hw_key)
+		return TX_CONTINUE;
+
 	bip_aad(skb, aad);
 
 	hdr = (struct ieee80211_hdr *)skb->data;
-- 
2.25.1


