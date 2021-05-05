Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB879C43470
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:35:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 450856192F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 450856192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1HXyTHR29G+XvWCapg3BTncA0u3u+taE/y5VN1ptMM=; b=TbsbJ5E0wU54bnn8LU3bI0M0o
	70hUHY1xzRoYHl5bCImCMHKgVbPC1WH/3ITyneYwSiVBKhcYX+ohezp+J2GxVS4on8pWQBqZBcmPg
	tTWnhodT7zSHq61QSepSVGzy2lJth038iuTYS/aiqfIJv7ZuM2YX7oP4se2WuErrSv+8VH7qA7URy
	X/aGl/cvdPIoiQt7Pv+VUYWaeuIqvDnZxJdjBXHxBE/Z2UQ/6i3BsXB0OIMtjlnOb9a4yaiDIXwy6
	H672ngBXn/T4MqL2qFZ1cQGMWjw6Ua2STbDtjyBuTAiUczExYXqWNzgqS+Rp3T673HxXm3i7WGt7I
	XoPzCvF7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKUv-001fgn-FZ; Wed, 05 May 2021 16:35:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSD-001eXg-7l; Wed, 05 May 2021 16:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=A8DL5kpGlzYZ5cx0PTHhTnKY3kakwlmLBR7anLLR1rY=; b=2uF42rutbK6fsTxL+YwVRZzBhO
 mlXU90Im5htgH1Nx4dSBw9bZw6Vn3AkFxtgirCD76JwixuQ6xvhlR720BbsVFZ/xJnKYqaMzESSm1
 96RmZZxyU4cc6Pn2Fdz6wjHWeBVraQa/KzkOnN9TOSvwOImwk7WLtvxfzYaKNm399lFs613t/8Qys
 IX4FH/fZDiy8Ut8rj26bwG8XjpR4/zjkzo3ZpcmCUUUPEjHMXqgqNQSkmuNI4ABhJBpiWzEr1hB4+
 /t5t4YG1lIGVdMix97s2pbO3Kznip9UbQ3vwPRDrRP9o2iCxRBv/fmOYE+wwqOuKcZobPKvH0kIMD
 7/6+vMxg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSA-004wQ6-Od; Wed, 05 May 2021 16:32:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6978861436;
 Wed,  5 May 2021 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232370;
 bh=a6ayTyQFJO7D2HeeSEFr9P03nh0rXIxRKuFcNLp5WPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B8n07rh88O1ehnOa/M8LSbDEZrIollaq+DzEfHYl29dWdQS/yG3v3JkqEYimcZg82
 nzeOeDMvw2r+T4KUkqrJLz0BBdByoTrIyqbl6V7yOeeJi1Jq0yc83ql2rTz2ylSuEx
 fqc6E4pS2QP7m19G2iSUMXz2tokYdAHe8B/bSBC10cWGq/yyTQ+oER63dtFErccPv6
 s1i61Ld5mVQWfTcWO6YE/tJwlZSMCdsrHGZ4MoDP7Z4tXUC2FDap6TBiXlmxPrqcyz
 y3/+87b7ubol0iMzxPBzY8L9C3GbAMN2+2wwfIjw1GIrdwLuiyZ7VRHfmfBmccEGUY
 pYIdixf0wXYFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 061/116] mt76: mt7915: fix key set/delete issue
Date: Wed,  5 May 2021 12:30:29 -0400
Message-Id: <20210505163125.3460440-61-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093250_871653_870DB36A 
X-CRM114-Status: GOOD (  13.44  )
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

[ Upstream commit 1da4fd48d28436f8b690cdc2879603dede6d8355 ]

Deleting a key with the previous key index deletes the current key
Rework the code to better keep track of multiple keys and check for the
key index before deleting the current key

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 25 +++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index d4969b2e1ffb..33590ff6e281 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -317,7 +317,9 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7915_sta *msta = sta ? (struct mt7915_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
+	u8 *wcid_keyidx = &wcid->hw_key_idx;
 	int idx = key->keyidx;
+	int err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -332,6 +334,7 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_AES_CMAC:
+		wcid_keyidx = &wcid->hw_key_idx2;
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
@@ -347,16 +350,24 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
-	if (cmd == SET_KEY) {
-		key->hw_key_idx = wcid->idx;
-		wcid->hw_key_idx = idx;
-	} else if (idx == wcid->hw_key_idx) {
-		wcid->hw_key_idx = -1;
-	}
+	mutex_lock(&dev->mt76.mutex);
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
 
-	return mt7915_mcu_add_key(dev, vif, msta, key, cmd);
+	err = mt7915_mcu_add_key(dev, vif, msta, key, cmd);
+
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return err;
 }
 
 static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
