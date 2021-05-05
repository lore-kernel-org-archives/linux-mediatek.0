Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A441C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:36:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1373961949
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1373961949
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+TvLuqaKi7hwxxz7tp++pkL9cb/0tzNJlyQCSdm3X4=; b=dc2+kZl2/+yCaGsHpZVR8yJuK
	2K8p8/99LM32ZKEqgn3gJzZ5tmnKMAaqmvRGiSAXN39huSq91xs8fAZRId2cNnE1HV8H84kF3XTT2
	Ooc+rlJsoZSWdOZZO60x9/M5nXtq7pNGB72DH0DaWbh46dqLwUHsgFCqY3mGO0u9KRi49K2gxU2mm
	NqZz6YCv6L76LS2aK3fPPVV5bcHm8BSDula62mbUHQWSAEroH4CuxkYaSS1NHbSRgVWES6J5ft6T8
	4yOG2K2YdzlGVdlNbWUm00+TRwCmAqLtcaIZ5MkhN9PkUEzL/g2np2Wttm9JjEt9KKCKPc2hC5BIs
	ps7t+DCSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKW1-001gFG-EW; Wed, 05 May 2021 16:36:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSG-001eZ6-Qy; Wed, 05 May 2021 16:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fe8ry6gKcJuYzW3r81vhLyAWUGDP0+2BD+sr1e6RbAo=; b=yYaBi1hY2nJPs2eW7uMVzaAkto
 HyxuoA8ttSXq3Fv1c/3myV5Gg3dFiU0nlCZCBE1IRu16MZEDi8n50IHxfBe0puHdPJv/xTunI+Wz/
 pxUDZG289U9/ZTBVTJIVU5u8WZRRrvrUlGzNSy/O01qIY9naJoAKe8fVk53ahT6FBaZRtCA0XC2XO
 DfBV8MmcxJOkKSftF/BkPHMXkopm1YIjXc+VCPvY2PAXmno6Fm6sCbwKGZQM3zhRH2FQYdjUw62uO
 gV1/Py/PdkNvIMQFusiMZHsNVHm0dr5SRi3btrQtfx3eFfyIQ2Z2lN77EUEfQT/StknD1+eakk4Uu
 ZavZi0Ew==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSD-004wQo-Uv; Wed, 05 May 2021 16:32:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7673D61424;
 Wed,  5 May 2021 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232373;
 bh=wxWoUpRdyXYh9izoGPXn5BkYGk3rIvTMA9JbMWgFAe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mWpxNL+FEkiCkujFnQTDwS3UBdhqfXNhMGJWrS1WXGpYmgTpkSIDm37iAnBpnhgq8
 tKCaYS5Y7iql2HSKbx0Nio0Ob8JfcF2ssBValLQyZRMAXcj5vVex42dO6g/1Fj7pHu
 PJ/44Xs4CXhLflARSZy4sdaQNHM6VTEheG+iAELLhUAHa24wkSRskYGiHbMopgYIo/
 d8RIWl/zDfqOvn2fHPNTdhkTzCqv37N83ZafXBgw1wGJvsExBMuOMKWoGrP2/RzTK9
 +6FlpMa0xwoBiOzO24+QrdEVgtrsBSreHsncvqXUnHnHvkdwwAE26FdKugM9v/yIEj
 lwQhOCffII88Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 063/116] mt76: mt7921: fix key set/delete issue
Date: Wed,  5 May 2021 12:30:31 -0400
Message-Id: <20210505163125.3460440-63-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093254_061012_0BE5FD0D 
X-CRM114-Status: GOOD (  13.21  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 60468f7fd7072c804b2613f1cadabace8d77d311 ]

Similar to the mt7915 driver, deleting a key with the previous key index
deletes the current key. Rework the code to better keep track of
multiple keys and check for the key index before deleting the current
key

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 729f6c42cdde..672192e53269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -413,7 +413,8 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7921_sta *msta = sta ? (struct mt7921_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
-	int idx = key->keyidx;
+	u8 *wcid_keyidx = &wcid->hw_key_idx;
+	int idx = key->keyidx, err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -429,6 +430,7 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_AES_CMAC:
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
+		wcid_keyidx = &wcid->hw_key_idx2;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
 	case WLAN_CIPHER_SUITE_CCMP:
@@ -443,16 +445,23 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
-	if (cmd == SET_KEY) {
-		key->hw_key_idx = wcid->idx;
-		wcid->hw_key_idx = idx;
-	} else if (idx == wcid->hw_key_idx) {
-		wcid->hw_key_idx = -1;
-	}
+	mt7921_mutex_acquire(dev);
+
+	if (cmd == SET_KEY)
+		*wcid_keyidx = idx;
+	else if (idx == *wcid_keyidx)
+		*wcid_keyidx = -1;
+	else
+		goto out;
+
 	mt76_wcid_key_setup(&dev->mt76, wcid,
 			    cmd == SET_KEY ? key : NULL);
 
-	return mt7921_mcu_add_key(dev, vif, msta, key, cmd);
+	err = mt7921_mcu_add_key(dev, vif, msta, key, cmd);
+out:
+	mt7921_mutex_release(dev);
+
+	return err;
 }
 
 static int mt7921_config(struct ieee80211_hw *hw, u32 changed)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
