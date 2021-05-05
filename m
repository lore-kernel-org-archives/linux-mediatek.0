Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40099C43462
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:33:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DC961426
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6DC961426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nXfs4sRfpx6RBmQ8vXgR5lGyzUZHK3RkeeR538MjnLo=; b=Owt9PxhOvb125elUTNd4jblz3
	YZfa366yVSiG87lwF9thl3BW74FuwpF/6Mr2x0Y8OpIRZPjhrGOIicThrZLYzk4WHSmM1lQ42K8af
	QrEhO2I1zHLe6JcKGgHcFsWm7sXJhG6lUaXV1RINbc17WbUxAil+xemr1DsEieBg9uzuRsIhZUBDf
	Gw4IOF3/hAeg/+koE/yW9lFeQ4Ov/blQr5H56/PAIWT5Q6wvFjIKIVka+pn7gRH57e0NWerLVAFph
	woASNxuZ2hbKhGu6mw3+dVdrRMPz1gjH1Dc6VAhbibXcOpQFdesDFWHv5uHHVExs05UkfKGpylNQe
	Ok4u3hQ8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKT0-001eml-Lv; Wed, 05 May 2021 16:33:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS5-001eW7-SN; Wed, 05 May 2021 16:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=r4788gCorPisBSJRNBThrJg0v85VwukD5ATcIor8GTs=; b=R7MLmp6m9N4+LfY5coTbOSKim7
 Pi1A7rWaiwBV3iil2Sz+X2VITTku02ttv8i981LiTq6L1pIEQIxeBdH1GSss38DyQBCvsjBRHheJa
 CdXPCLcGP5aBPXusk5nRp1F3NRR9JYO0K3OPZhTBRLLWbqwffozV5S7M+yCUsirrEZXgKoxn7mCOu
 yeCwVHunoGILenm76MYLu0DTi9OV7S8eCi2IkNJrbMGb1ot+3ziMrx6ds3K05yXzFiLPtl+7i7uYa
 lvphrCgcCt7ORom83sN7QgfGK5GQn1J3Eth0Y1+h5Y8/q41ubNwJ4GABR61LM91AW7cbMvRIKzOHd
 TfYMYI9Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS2-004wNL-V2; Wed, 05 May 2021 16:32:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA87613F1;
 Wed,  5 May 2021 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232362;
 bh=JvFCuhW0EsPeygLYdplgOPy/K9J0AYj2Z5oqtympZDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IpBNgv+I48l3Bzr0+nb098lMzZBy6FkQSGtqzWg+0gsRC94Qr0oe69xODmkGHAaE8
 W1F9ASsacrgh4/h6lnwr5x5BDDDkchebbD/a74chKlEuS5/FEEI6QoswY0QRkeyOoE
 3QatZ8fWF2o0GYKvmfBSpgm+LRR5B4wg7Aq/NlUbXEtZBhbe+mMPuADxAVx3gCa8Xy
 x1+BH5xrxy5BwVo/WzKwKgrGapxbC50E0XXo2yN0FkhjqUDzWFpPpAGbnQtukmfc7V
 Bd3WyxuagY10dxOPVkErJCq6rDPdiSVwyJO6PDKY8DnRhBsfyjjoiCTLKzeBoiZNCH
 ihyrTmRYYKkVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 056/116] mt76: mt7615: fix key set/delete issues
Date: Wed,  5 May 2021 12:30:24 -0400
Message-Id: <20210505163125.3460440-56-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093243_094589_38E300BF 
X-CRM114-Status: GOOD (  19.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 730d6d0da8d8f5905faafe645a5b3c08ac3f5a8f ]

There were multiple issues in the current key set/remove code:
- deleting a key with the previous key index deletes the current key
- BIP key would only be uploaded correctly initially and corrupted on rekey

Rework the code to better keep track of multiple keys and check for the
key index before deleting the current key

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 97 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 18 ++--
 3 files changed, 65 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8bf45497cfca..36a430f09f64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -222,6 +222,7 @@ struct mt76_wcid {
 
 	u16 idx;
 	u8 hw_key_idx;
+	u8 hw_key_idx2;
 
 	u8 sta:1;
 	u8 ext_phy:1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 59fdd0fc2ad4..72bdc6579763 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1033,7 +1033,7 @@ EXPORT_SYMBOL_GPL(mt7615_mac_set_rates);
 static int
 mt7615_mac_wtbl_update_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key,
-			   enum mt7615_cipher_type cipher,
+			   enum mt7615_cipher_type cipher, u16 cipher_mask,
 			   enum set_key_cmd cmd)
 {
 	u32 addr = mt7615_mac_wtbl_addr(dev, wcid->idx) + 30 * 4;
@@ -1050,22 +1050,22 @@ mt7615_mac_wtbl_update_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 			memcpy(data + 16, key->key + 24, 8);
 			memcpy(data + 24, key->key + 16, 8);
 		} else {
-			if (cipher != MT_CIPHER_BIP_CMAC_128 && wcid->cipher)
-				memmove(data + 16, data, 16);
-			if (cipher != MT_CIPHER_BIP_CMAC_128 || !wcid->cipher)
+			if (cipher_mask == BIT(cipher))
 				memcpy(data, key->key, key->keylen);
-			else if (cipher == MT_CIPHER_BIP_CMAC_128)
+			else if (cipher != MT_CIPHER_BIP_CMAC_128)
+				memcpy(data, key->key, 16);
+			if (cipher == MT_CIPHER_BIP_CMAC_128)
 				memcpy(data + 16, key->key, 16);
 		}
 	} else {
-		if (wcid->cipher & ~BIT(cipher)) {
-			if (cipher != MT_CIPHER_BIP_CMAC_128)
-				memmove(data, data + 16, 16);
+		if (cipher == MT_CIPHER_BIP_CMAC_128)
 			memset(data + 16, 0, 16);
-		} else {
+		else if (cipher_mask)
+			memset(data, 0, 16);
+		if (!cipher_mask)
 			memset(data, 0, sizeof(data));
-		}
 	}
+
 	mt76_wr_copy(dev, addr, data, sizeof(data));
 
 	return 0;
@@ -1073,7 +1073,7 @@ mt7615_mac_wtbl_update_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 
 static int
 mt7615_mac_wtbl_update_pk(struct mt7615_dev *dev, struct mt76_wcid *wcid,
-			  enum mt7615_cipher_type cipher,
+			  enum mt7615_cipher_type cipher, u16 cipher_mask,
 			  int keyidx, enum set_key_cmd cmd)
 {
 	u32 addr = mt7615_mac_wtbl_addr(dev, wcid->idx), w0, w1;
@@ -1083,20 +1083,23 @@ mt7615_mac_wtbl_update_pk(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 
 	w0 = mt76_rr(dev, addr);
 	w1 = mt76_rr(dev, addr + 4);
-	if (cmd == SET_KEY) {
-		w0 |= MT_WTBL_W0_RX_KEY_VALID |
-		      FIELD_PREP(MT_WTBL_W0_RX_IK_VALID,
-				 cipher == MT_CIPHER_BIP_CMAC_128);
-		if (cipher != MT_CIPHER_BIP_CMAC_128 ||
-		    !wcid->cipher)
-			w0 |= FIELD_PREP(MT_WTBL_W0_KEY_IDX, keyidx);
-	}  else {
-		if (!(wcid->cipher & ~BIT(cipher)))
-			w0 &= ~(MT_WTBL_W0_RX_KEY_VALID |
-				MT_WTBL_W0_KEY_IDX);
-		if (cipher == MT_CIPHER_BIP_CMAC_128)
-			w0 &= ~MT_WTBL_W0_RX_IK_VALID;
+
+	if (cipher_mask)
+		w0 |= MT_WTBL_W0_RX_KEY_VALID;
+	else
+		w0 &= ~(MT_WTBL_W0_RX_KEY_VALID | MT_WTBL_W0_KEY_IDX);
+	if (cipher_mask & BIT(MT_CIPHER_BIP_CMAC_128))
+		w0 |= MT_WTBL_W0_RX_IK_VALID;
+	else
+		w0 &= ~MT_WTBL_W0_RX_IK_VALID;
+
+	if (cmd == SET_KEY &&
+	    (cipher != MT_CIPHER_BIP_CMAC_128 ||
+	     cipher_mask == BIT(cipher))) {
+		w0 &= ~MT_WTBL_W0_KEY_IDX;
+		w0 |= FIELD_PREP(MT_WTBL_W0_KEY_IDX, keyidx);
 	}
+
 	mt76_wr(dev, MT_WTBL_RICR0, w0);
 	mt76_wr(dev, MT_WTBL_RICR1, w1);
 
@@ -1109,24 +1112,25 @@ mt7615_mac_wtbl_update_pk(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 
 static void
 mt7615_mac_wtbl_update_cipher(struct mt7615_dev *dev, struct mt76_wcid *wcid,
-			      enum mt7615_cipher_type cipher,
+			      enum mt7615_cipher_type cipher, u16 cipher_mask,
 			      enum set_key_cmd cmd)
 {
 	u32 addr = mt7615_mac_wtbl_addr(dev, wcid->idx);
 
-	if (cmd == SET_KEY) {
-		if (cipher != MT_CIPHER_BIP_CMAC_128 || !wcid->cipher)
-			mt76_rmw(dev, addr + 2 * 4, MT_WTBL_W2_KEY_TYPE,
-				 FIELD_PREP(MT_WTBL_W2_KEY_TYPE, cipher));
-	} else {
-		if (cipher != MT_CIPHER_BIP_CMAC_128 &&
-		    wcid->cipher & BIT(MT_CIPHER_BIP_CMAC_128))
-			mt76_rmw(dev, addr + 2 * 4, MT_WTBL_W2_KEY_TYPE,
-				 FIELD_PREP(MT_WTBL_W2_KEY_TYPE,
-					    MT_CIPHER_BIP_CMAC_128));
-		else if (!(wcid->cipher & ~BIT(cipher)))
-			mt76_clear(dev, addr + 2 * 4, MT_WTBL_W2_KEY_TYPE);
+	if (!cipher_mask) {
+		mt76_clear(dev, addr + 2 * 4, MT_WTBL_W2_KEY_TYPE);
+		return;
 	}
+
+	if (cmd != SET_KEY)
+		return;
+
+	if (cipher == MT_CIPHER_BIP_CMAC_128 &&
+	    cipher_mask & ~BIT(MT_CIPHER_BIP_CMAC_128))
+		return;
+
+	mt76_rmw(dev, addr + 2 * 4, MT_WTBL_W2_KEY_TYPE,
+		 FIELD_PREP(MT_WTBL_W2_KEY_TYPE, cipher));
 }
 
 int __mt7615_mac_wtbl_set_key(struct mt7615_dev *dev,
@@ -1135,25 +1139,30 @@ int __mt7615_mac_wtbl_set_key(struct mt7615_dev *dev,
 			      enum set_key_cmd cmd)
 {
 	enum mt7615_cipher_type cipher;
+	u16 cipher_mask = wcid->cipher;
 	int err;
 
 	cipher = mt7615_mac_get_cipher(key->cipher);
 	if (cipher == MT_CIPHER_NONE)
 		return -EOPNOTSUPP;
 
-	mt7615_mac_wtbl_update_cipher(dev, wcid, cipher, cmd);
-	err = mt7615_mac_wtbl_update_key(dev, wcid, key, cipher, cmd);
+	if (cmd == SET_KEY)
+		cipher_mask |= BIT(cipher);
+	else
+		cipher_mask &= ~BIT(cipher);
+
+	mt7615_mac_wtbl_update_cipher(dev, wcid, cipher, cipher_mask, cmd);
+	err = mt7615_mac_wtbl_update_key(dev, wcid, key, cipher, cipher_mask,
+					 cmd);
 	if (err < 0)
 		return err;
 
-	err = mt7615_mac_wtbl_update_pk(dev, wcid, cipher, key->keyidx, cmd);
+	err = mt7615_mac_wtbl_update_pk(dev, wcid, cipher, cipher_mask,
+					key->keyidx, cmd);
 	if (err < 0)
 		return err;
 
-	if (cmd == SET_KEY)
-		wcid->cipher |= BIT(cipher);
-	else
-		wcid->cipher &= ~BIT(cipher);
+	wcid->cipher = cipher_mask;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 25faf486d279..1aa6928f88fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -337,7 +337,8 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7615_sta *msta = sta ? (struct mt7615_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
-	int idx = key->keyidx, err;
+	int idx = key->keyidx, err = 0;
+	u8 *wcid_keyidx = &wcid->hw_key_idx;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -352,6 +353,7 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_AES_CMAC:
+		wcid_keyidx = &wcid->hw_key_idx2;
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
@@ -369,12 +371,13 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	mt7615_mutex_acquire(dev);
 
-	if (cmd == SET_KEY) {
-		key->hw_key_idx = wcid->idx;
-		wcid->hw_key_idx = idx;
-	} else if (idx == wcid->hw_key_idx) {
-		wcid->hw_key_idx = -1;
-	}
+	if (cmd == SET_KEY)
+		*wcid_keyidx = idx;
+	else if (idx == *wcid_keyidx)
+		*wcid_keyidx = -1;
+	else
+		goto out;
+
 	mt76_wcid_key_setup(&dev->mt76, wcid,
 			    cmd == SET_KEY ? key : NULL);
 
@@ -383,6 +386,7 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	else
 		err = __mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
 
+out:
 	mt7615_mutex_release(dev);
 
 	return err;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
