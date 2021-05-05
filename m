Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B6EC43462
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:36:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADE961942
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADE961942
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dyiWBA47mJ4XSKzkPpdIddItd1epvnEh38KZpYz3J30=; b=f0S/z+8NqCDSYrQOXwykXrGAJ
	mkSGFOt7UM74v60KfPQti4KvxjD1NJktXCa/dgrrdg6LrFZf+Jsemml08Lio3cNNRLIpeU+7fgcr9
	MV1jV2+3/79hMtKLa4DUnJtE3/q1idqvQUpRAtFYUPYhRZ9Yq11ia4L1Eqr+0KmqSV9eDSLZMttNn
	soVU9HwiQoZ6e5r6SKwaHpDTOZMKHs2Ru7Ty+2fEUkYp6WCwpXkajdPs02WcCDq5+ezSPit6jsOY0
	upGGgd80waVeaiSJ53B++x9ntLfKN/6s9rvK0BqFxztdFlM6dg1FrArKCah3hazdZ1NRqXBBoJriO
	FhBxYy/Cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKVR-001fu4-1P; Wed, 05 May 2021 16:36:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSE-001eYI-Ie; Wed, 05 May 2021 16:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ib8CtmyKiZNRi/3cAO6eRFwSLNbxja4LcipwZRb54xk=; b=UOFwv6PXjyZehUAzRK/hsivTwN
 vwIUUx2vqrXmHKUfDb49bTMDSHq8pNi7JjHqE/cvSqWMEOWRRYdcRIa8uw4oD77zZ2aS4yrB+DrxD
 44XTM/nZDO1OYmFisxqIjMdQALEBNHkrHTzH/J8whZPp0uGMpTObammYuxZY06/8n0V4I9S8bNOAa
 ITh+rLJclyoEh60HrCFxH4bDiV4Qj9jJST1pa3zWA57EnmQeWTb+LzOVt2KW8SgAfJYE/U5OkdElU
 ojpjBt+YCDCd7N923mR9vbXmzoSKhR644WCcCaYimA8Xk1qt+4rD1JO2lOBHIBXtxZ5t2Nh3NMswd
 b9mP1eQw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSC-004wQ6-4E; Wed, 05 May 2021 16:32:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE9D56141B;
 Wed,  5 May 2021 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232371;
 bh=k1/+NZWdIyxXM4YAwQQG+VyV9Eo3Vmzg3To1cnf+uRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lQossZIIp5pnhyCbNLsY3eQdHV1cTJBiA/vcbx/KrY8UWt74Er7za80DDLX4ewB/n
 PM3eYdZCKVMRiBgTuvmHwrH36vtAvvJp7gFBZcJ8MJnfEn4ERxoadBM2SelYvJbXXY
 qdWFOTJAa/J7JAskVaAh5GpqHhV7Yk8mBtTc/YAPsy7S/C4h833xdMqOceHzrhKZkO
 IFUy3m1AnGKXfne7WNhgNWCafQbKEas5HR0sd0hlR/UizKganIQa5TTQLLcovqkzYK
 Qja4gLlE5yVaB1uw15ofyOdaC8XgJExIa070QigevRzV1CoJ/INM7CYI/2yx7BCdUq
 amu4zNmLOwRjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 062/116] mt76: mt7915: fix txpower init for TSSI
 off chips
Date: Wed,  5 May 2021 12:30:30 -0400
Message-Id: <20210505163125.3460440-62-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093252_218243_4F54ABD8 
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
index 660398ac53c2..738ecf8f4fa2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -124,7 +124,7 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx)
 {
-	int index;
+	int index, target_power;
 	bool tssi_on;
 
 	if (chain_idx > 3)
@@ -133,15 +133,22 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
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
