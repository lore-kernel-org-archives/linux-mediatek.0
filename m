Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D40EC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:46:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF3A8613BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF3A8613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=++IfwLSz+YA1dvH3Odo6aDU6uu9ALFVGrgreuGiAbD4=; b=cmbZURT8S4eRMcgZGVfrC+i8R
	bZooFMI6D/lLzm1O2yM//J1I1YkToRhbJqR+bQpl4xTjvH7NgPfQe9PQjWKWsZdY2tUTiXvUGSxRi
	bjePbKkN/T/InkTKNLACnhab5GtVvmo/wIe/Wj6IvimsvFzNCn2tt4gPHfLMldj5oddozRa2vSKEF
	mC3U5kKlbuLFCyBH7LwJf3ANz/uuqhalCY64b4VN/k8cHnVuuGc0cF2VHCNTLDulLH8P3V2iWj3kI
	U6jnsA8EWoOR4cxA/Ppxi26j4aAy2qRXZioHojdWl7UIu/bfKDtV2OCBpIatNzwgxDLM2zOMX/kAs
	teSnUAx4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKfZ-001k5E-L3; Wed, 05 May 2021 16:46:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUs-001ff4-Df; Wed, 05 May 2021 16:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qYLU8fjZrfZffRMfCmOtVmlNVNoY7WdvRrHLjaJxSFo=; b=UCcbw0tIiZSjx4uscJVJa37qbY
 UII+jvwlBwxBjXJfP91zYftKzoIbH/0soLpLE2sbg7v00yCO8T5ZhsNgThCoMVqJwuth4Sbjsfb2G
 59CLGLhwOF19npQPaLBDLavCiCJfcSfS6sUaS8YFbQlxhf2/NXHhVrwyiZNa0K3A0tw6CCCofkpqM
 Yj152c1lzzXdFixmSn49KcFj9XmJH4br3Jsh6ArffVGFrTGn/5pynQg56wMffqRQ+iZc39sCsAWFa
 97JnugDjqJmZ4nEGTnmw46ZRHvqfWXQranjfOeCWOgDK7pBJqVCYbg+LXp9fkZL2qfN5dio5FHFLg
 R7uiYbLA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUp-004x6x-Nz; Wed, 05 May 2021 16:35:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 525AD61922;
 Wed,  5 May 2021 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232535;
 bh=lDeIC7HMZT78ZG5J+zGkBUCrnVQ7apnh8xm8hSQ2pc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gf/yM5HeQemEqLUSu5ceNOATFyDFanTSykJmJ/GTfZlWRzhF1Oyy6ZYY8EsTA/Gc9
 bLNlqAhZ/RqAegZrX4k9mcY1GNkFYp9kF0lzyKi+1m6vPMVb3ZaRTqsVLICMCMuyOV
 Gj6kLlSbc7DGTX+k+8+GT0WAVr9rzsenod+fQxOELtLGc4jsCYDQL7e9y1QYAwGA/6
 fnQhfzpDKnbEbhsbcJZXJgc6PP9UGPZthdkJA4O6j/2WeDtoH9HbOzUD/JbMvapm7e
 wLSMorSLL6YWpNPd1IxHse0XnqqYlZ39wuw7bJ2ApcECTNkTbRl5udNoCRN840hxca
 M1g+EeDmDZ3VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 056/104] mt76: mt7915: fix txpower init for TSSI
 off chips
Date: Wed,  5 May 2021 12:33:25 -0400
Message-Id: <20210505163413.3461611-56-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093535_839446_B6A4DAAD 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Shayne Chen <shayne.chen@mediatek.com>

[ Upstream commit a226ccd04c479ccd23d6927c64bad1b441707f70 ]

Fix incorrect txpower init value for TSSI off chips which causes
too small txpower.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 7a2be3f61398..c3e32555cf24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -114,7 +114,7 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx)
 {
-	int index;
+	int index, target_power;
 	bool tssi_on;
 
 	if (chain_idx > 3)
@@ -123,15 +123,22 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 	tssi_on = mt7915_tssi_enabled(dev, chan->band);
 
 	if (chan->band == NL80211_BAND_2GHZ) {
-		index = MT_EE_TX0_POWER_2G + chain_idx * 3 + !tssi_on;
+		index = MT_EE_TX0_POWER_2G + chain_idx * 3;
+		target_power = mt7915_eeprom_read(dev, index);
+
+		if (!tssi_on)
+			target_power += mt7915_eeprom_read(dev, index + 1);
 	} else {
-		int group = tssi_on ?
-			    mt7915_get_channel_group(chan->hw_value) : 8;
+		int group = mt7915_get_channel_group(chan->hw_value);
+
+		index = MT_EE_TX0_POWER_5G + chain_idx * 12;
+		target_power = mt7915_eeprom_read(dev, index + group);
 
-		index = MT_EE_TX0_POWER_5G + chain_idx * 12 + group;
+		if (!tssi_on)
+			target_power += mt7915_eeprom_read(dev, index + 8);
 	}
 
-	return mt7915_eeprom_read(dev, index);
+	return target_power;
 }
 
 static const u8 sku_cck_delta_map[] = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
