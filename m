Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B918C11F80
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 737CD61DAD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 737CD61DAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNLBqraVN8TyPYceOwtfH31Oa8ZFVShcyJAZxAS/8jw=; b=BJisK1Ta6noru+
	ReaEsjn3BrD1/lYV0vsHifijpoYvQkuPQlINK+U4n0ULSCwQoDx6fg3/kxqm7ezRjWeagNL3N/ufL
	scng6GBPmBZk9LahVxMHm+Rzrs3b4Cf/3x57C2fUjYRXfTrQ/qbt0zem5naJediyWSp1SNwpQEX5a
	KOQmhD+5rZHk9kDkC8sC4z0jbgp2ucZ7O1j6LhlmsQpGdp2WswyW+R5p0OCUYngmsbtR3ycOCTd31
	LlKch0p/zZnhT1Fvs7TyvCwRBFPXFp40k3bbfpW5tGFXv2lrT4/ovI/hvqSeD7e1RIGbAJ7t9akKg
	ahgyn9Q6oxSiDeocnVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0j86-00BGqb-S2; Tue, 06 Jul 2021 11:20:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4a-00BEKm-Ig; Tue, 06 Jul 2021 11:17:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E75261CCD;
 Tue,  6 Jul 2021 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570224;
 bh=3oFUFi2j9Ch1JD2wnThEm9AucRWtUWw67opvunTldrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HmGx58za3KzW5animRfzpkVe0aRZnIjxXE6Ah9FS/hohmIncntxQtoEoQQ8k0wb9N
 HYjjqTFjJhcE4tDEzo8NXqVWM25Q/hg+Lv/U3PvBEUdQ1rJB0yUcYT4kxoZNvbynHv
 bfmvKs+d4w+J9rLWEo0rOd8WmPyZskSElq1BDHOhzzgXtt8EwecENaUF2OF+GjqOBv
 OdXkTGEsB6NVjmNd+ram8HmSHfmCq9PU0tBz+0OIM1KrCJd6hqH2vkTYEyngtcZl/4
 GYNtKdlvtT167L9NpFRXBGgAU3ASoOy/FVMhH4JVUfxfZDw1qFT0U4NhQFha7ekzkN
 CXE8Cb9nQ1ZyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 130/189] mt76: mt7915: fix tssi indication field
 of DBDC NICs
Date: Tue,  6 Jul 2021 07:13:10 -0400
Message-Id: <20210706111409.2058071-130-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041704_679194_1ABD25A7 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Evelyn Tsai <evelyn.tsai@mediatek.com>

[ Upstream commit 64cf5ad3c2fa841e4b416343a7ea69c63d60fa4e ]

Correct the bitfield which indicates TSSI on/off for MT7915D NIC.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 033fb592bdf0..7896e983209a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -99,12 +99,15 @@ static inline bool
 mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 {
 	u8 *eep = dev->mt76.eeprom.data;
+	u8 val = eep[MT_EE_WIFI_CONF + 7];
 
-	/* TODO: DBDC */
-	if (band == NL80211_BAND_5GHZ)
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_5G;
+	if (band == NL80211_BAND_2GHZ)
+		return val & MT_EE_WIFI_CONF7_TSSI0_2G;
+
+	if (dev->dbdc_support)
+		return val & MT_EE_WIFI_CONF7_TSSI1_5G;
 	else
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_2G;
+		return val & MT_EE_WIFI_CONF7_TSSI0_5G;
 }
 
 extern const u8 mt7915_sku_group_len[MAX_SKU_RATE_GROUP_NUM];
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
