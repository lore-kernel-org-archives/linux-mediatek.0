Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CB7C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:53:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5201613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5201613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fe8x5gm9FrL4ixqjPAMIw7qNZ9jWsx3z6mBJCkNArsQ=; b=moyiHNl0QtK6BRFsErd7yiMw7
	9479pUDMdzqsQXREg8/lPPxsGHNny+GzBoleH89CFMgN2fj79JmsZu5CDOujTL0GSVkr2WErIg1+5
	dtyZqcIikGVNRr5gJcN67+PbNcN7GsoPj3hCG4Ru6NESSaAFMdMkaYOeQ2hWXM7wwS7OckMn/u9fs
	Bsl1UX56a48ar9yM7jcbveC4ojes0QPuR17YsfDCYAJZl4rZ8Rkk0A5pnJHHV4cOjcYe6LRZ/oLvZ
	a8eZu/iCTd40o7LLcs5ppzCBbET5bheLw9pQyEbeBTEJOA5edjf6lEg2YaJR05f1PYUW1cwnoGpbn
	phofK+z8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKm3-001mZg-2h; Wed, 05 May 2021 16:53:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKX5-001ghX-Lf; Wed, 05 May 2021 16:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Cidf4Urlye51gFjBEJ7uxDkrSvLIGxn5/Oi5Nb7A0vY=; b=3PM88Lug9qnTESlWCJ6IwMsWH6
 bVSvyMAWWrMCiG4cQK3YWEsdImkTKM8QG5iAz+/HbkibfDg5Xxy1SHzVgV0EVK69Y0uJlqLYQN6DY
 bsPJYy4AISmy4Iy8u6skgrIZTNkRuFiW6t98j9TjmOqAO9pzqIaFYl0ZFAO/i8i454cRc454jk07x
 Y1qmCjp5FNTU9WZsj3XMUR1jhlfqckzi4kuKWfXRgN3hEZEEPIMWbSmYPKZN/fZzNrcKT5FuimqX6
 MAlq+LVfOEjOzCJbZC+iANx9aW6GD/T1oRCwCKbUaUrO+WB2bFbxeGvsaloZ5rAo6tgPwf5g8y9Vm
 6O1zqdVw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKX3-004xaO-1e; Wed, 05 May 2021 16:37:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 986F261965;
 Wed,  5 May 2021 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232672;
 bh=/SzXmTGqbDyxVH+gy01NWuzrI1L3UAsKsg/UFD0dWOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjjLlf6eUONizUuDudcCwHilobyElcqdbgyGXllTZGVC73s2hlhTQnTpaF4AcGF6j
 aUUDVZr+rkHW5l7hBztqhY34EGqoKfhoR1b5PC42/InzDP2+vMiJWpuBMe5fVWSXG7
 jGE5q8uMOGiVV4O90LupATwYWvtFIPQ5Au8BOTbVypaEjEUJ/7UiZ01BDer47ORmTi
 iSw3pkHKJUn+cwZEBvvTnJnR+ghchFcbf9nLWfMVRD1XiiJlE5/TTCIv5lxQrionAM
 AFvNPQPHvDl/16ohucSvJ6giNo9MoRi2R/92z4h26ULiBQsK3l1EpteYiH+TaiD1N3
 toRNVN8h6FjyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 43/85] mt76: mt7915: fix txpower init for TSSI
 off chips
Date: Wed,  5 May 2021 12:36:06 -0400
Message-Id: <20210505163648.3462507-43-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093753_139798_B1C60D89 
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
index 7deba7ebd68a..e4c5f968f706 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -104,7 +104,7 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx)
 {
-	int index;
+	int index, target_power;
 	bool tssi_on;
 
 	if (chain_idx > 3)
@@ -113,15 +113,22 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
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
