Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84567C41535
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vc6WFNVVAwMtEPJchw9LOfr6Ync1saa1KrfHxCIrcc=; b=azGNByqAL2/JVqJO91tofWrZoy
	AHE5EnIRlYzPcu0Sy7t1bvHfM3TzCvYJc+OgLuN6fvG6WzXprAknDAwho+23nH/56nit2nka2zvFo
	64QBdW1jRrpb5Fu5+LO9ytGeqAHahAJ1o9DaAf55ZozLfAkVPxY4z4wc8CfNr9itmAooe4j6QeH4A
	5728b3csqHkmVZTZHMUs6poV2G92Ko1MnWvVKXA1Ti+BZqCa4uZgKjIvX40COGTbZw5e46SNdgL9Q
	R/2Bn6bBmIGr3H8fF2IG43HC+GuD47gtm4bSAMPybFO76Y3nz7qsYVoybVuSqmKt3dYQT77hGQFlI
	eiWqMsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KsJ-001PbC-1O;
	Tue, 07 Nov 2023 12:08:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KsF-001PYc-0l;
	Tue, 07 Nov 2023 12:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C8ADCB8168D;
	Tue,  7 Nov 2023 12:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4469FC433C9;
	Tue,  7 Nov 2023 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358881;
	bh=YTyv8HJFV07JTyfEcbnVeoTNlm0GOpkdppOSK7jQbjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ac/X6xfWt0oQPG5YEXB19Fzr3YVwYAk20xouHyThRLditKwPLkqtDPOJzXmVzyJZ/
	 bUGZXruu8LCo9T9QLBlo/WKs3i0+nPzpOLNXc8B2Xzk5kIx9YC4Q6mRIWzdX4JF5Vw
	 u5ABYNQv9sboPTnh843T4CxnNA+CBHGpmeFQz0lIwmNa7n6x9nmRg0r2ULGwHiNavi
	 o+CK3mq858NPMo6xDkxNIROak4m3MPXoJpGEBWgKZS2aXzuQd2matuWOiu0p1phJyK
	 6L91KjXPtLrf4f4I0iOLr32TxeBdr9QaBs7DYexWAq9iJD2rL8Oxn5jRB1qmVsGTS9
	 m3Ee/DEqz/xNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	meichia.chiu@mediatek.com,
	howard-yh.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 15/31] wifi: mt76: get rid of false alamrs of tx emission issues
Date: Tue,  7 Nov 2023 07:06:02 -0500
Message-ID: <20231107120704.3756327-15-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040803_570753_048F054F 
X-CRM114-Status: GOOD (  11.27  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

[ Upstream commit 413f05d68d11981f5984b49214d3a5a0d88079b1 ]

When the set_chan_info command is set with CH_SWITCH_NORMAL reason,
even if the action is UNI_CHANNEL_RX_PATH, it'll still generate some
unexpected tones, which might confuse DFS CAC tests that there are some
tone leakages. To get rid of these kinds of false alarms, always bypass
DPD calibration when IEEE80211_CONF_IDLE is set.

Reviewed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 50ae7bf3af91c..b8bc7a885b108 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2725,10 +2725,10 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 	if (mt76_connac_spe_idx(phy->mt76->antenna_mask))
 		req.tx_path_num = fls(phy->mt76->antenna_mask);
 
-	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
-	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
+	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL ||
+		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4a30db49ef33f..a9bd7e0d93595 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2960,10 +2960,10 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 		.channel_band = ch_band[chandef->chan->band],
 	};
 
-	if (tag == UNI_CHANNEL_RX_PATH ||
-	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
+	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL ||
+		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
-- 
2.42.0


