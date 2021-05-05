Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49E5C43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:46:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D7A613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D7A613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dcMtCSKyiHO8+Fm+HBRyk4LBv0VV1Av+f3+AAlftUXY=; b=WDsd5/SiLAaGO8PTV630tNXyK
	qtzr/zUjmJ3IQ4No/E5IC5gp1qBQRbt6yg4Q0PJFn3OG0vdYvDXzW/sZZ50+yZzkPaoDaL3Crq+Nx
	0iXxjmzu6m7o/6qYvXOc7MvgjuvJTwVn3ymczerSNgVyUR5mje13VtWhiWhZ/HjeehlKUPIyNuc6l
	ToN28pkcngo+AiishgGueFcSTrq5SaF0+MbduWKEq/J9aBt5Jt85qU3uKiKksoO4tcX8YWsqYFkb+
	br/rstWT9VKVCrKZuZP9aIaZP/Te/Yru5Teb4iX6g9P3fxmcPmbLm1DiZ/VYkmcbZPqZdRAs7RMLj
	sLlsutNsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKf7-001jtK-BV; Wed, 05 May 2021 16:46:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUq-001feQ-Sy; Wed, 05 May 2021 16:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=arehUmzUY/LglN8e6XBlYVdVHexm99v5B4MIfUsXJ44=; b=f1G0mCYQnT0ULxS4zPnAoJ5VM9
 6qZTeXetMDSOwMQpTFKi1deqPBeY/AcJ59OIrJ95wMTY6jK3ZFSJ32gzS7ZWjjtY3VcUtdu4GSsd+
 KGxbQhSZPPbJrrRUoNsJ3QFNCg61mDz+C9RQmY2N+jAFrlD598paXjJSQeG+o/XnbjZ16mZtilO9y
 mZ+94DVUmQ1TmVsKde6IPuS8l4dp49AykOzkXDs0FsaU/+Ujy0YINzTT67WT6mlAxHpJ8t6/2Be/8
 tUzekCop+3vnt9Y27hFZfkgjHSjLlUq2MIScfIXPVn+FwgL9IA1/ux0zjdzxo2v/w5DhZR5h6mWFq
 mXtI2t6g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUo-004x68-Ah; Wed, 05 May 2021 16:35:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D26B061874;
 Wed,  5 May 2021 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232533;
 bh=GsWVx2TWKCIrL5inlj2AYPPNbMQvBe2WbhYn+taTPsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UU8IoALC3WSCUQOv2eK1afDWT9cKND277qQYqb2FBSkuSVoJcW5j/bM+/wxXgbTc/
 u+eZ1DGUYNxC6B0T2ysTKkRDDHnbVYZVCiFq9Fzfi9GnvJTbsatcQel7dj2u5Ccjap
 GlhD4z63DuLIhuPNpcc8rd0dt3au1kWU3A09tu7t4ioIwK2J1NvRN8jq1DGs0SGUIx
 GQGSgm7QmbZZXA5S59xicxiuav/Z1NJKNyRtpCF8TalG4SsCW1sMg9FV0rydc2ZHYy
 6Q7FBPqTdsfWyUGpqenWgRzmKwWF6SI+0axniHHXji4eKrG917zYHUP7SlWAYIEwen
 GvM1lsIak7r1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 055/104] mt76: mt7915: fix key set/delete issue
Date: Wed,  5 May 2021 12:33:24 -0400
Message-Id: <20210505163413.3461611-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093534_421645_2D779E14 
X-CRM114-Status: GOOD (  13.34  )
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
index 0c82aa2ef219..2c75a5987544 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -314,7 +314,9 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7915_sta *msta = sta ? (struct mt7915_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
+	u8 *wcid_keyidx = &wcid->hw_key_idx;
 	int idx = key->keyidx;
+	int err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -329,6 +331,7 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_AES_CMAC:
+		wcid_keyidx = &wcid->hw_key_idx2;
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
@@ -344,16 +347,24 @@ static int mt7915_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
