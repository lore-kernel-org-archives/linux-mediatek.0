Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB97CC369D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=780IU6l6+bA2Iyc7NOyuGA3mbBghhZqm999CSKTIko4=; b=NiEZ/U3ej7rbQTA2Ok2DYPj/35
	GdGwpMD4++oET2AufefzfFBg9flZUkK1k6czaqzQek6ih1dVq+FcobotVQjlsSC2FUbZ5ZIeXG+r8
	ajwpjDo0s8nO3klZsr01Th5Hp7fKLlyYmerjCunMHyMjmufOKe+xMZbqi115uoaBt1WPDXE8tUPEn
	xXN85mqpA9VOpUI7KCruM4njL4PIDqdmg9gxnttVBT+0aoAUcNd1STaNzX4aDI1rJ4STpA/6zd3Rt
	57gh2vNn/hRIIQXsVVkTyLUJDwkKkCL6QK0NWm4sT6RUqhP6lGzDH1OzG7idl3322cogUpvZDD4Ks
	pMBpnEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stR3o-000000057hW-39dw;
	Wed, 25 Sep 2024 12:24:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQtp-000000054OO-0kXF;
	Wed, 25 Sep 2024 12:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A5BE5C0144;
	Wed, 25 Sep 2024 12:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE3AC4CEC3;
	Wed, 25 Sep 2024 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266420;
	bh=XhfPoPjMGZJ4e9xKiYa7H3zimc7LARC0zTQHcSvNCKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQO3kOWfzYyW1iISpwMlUeP+XIQg3/XvKCk04zRKtQUSvnTryMExJdKLi6Jn1FotZ
	 8gwbMQQd0krJpdLrDr8HxZnYrc8RepdKYRwwAf7BvAATug5OL0sqClfDzLLsYaGmX/
	 pkJByqyvdF3lnbi0AExhmFOeCtDfprQv81dlYQkpUqHET0paUbw6KXyFKPhtfopW6b
	 6YHML7MEqyIHLnBl6BMQcNgQuKy0GWoIGyLXkU9OwbJ4J0RgkkXMsaUsirZASgQgXt
	 1uiimirktcYYNjE0A09Os/DJHe1VIyFByALDPKQs5LSug2fon6FG11FlJhOnDnMVtf
	 F4OP8HRUlOx+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shayne.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	howard-yh.hsu@mediatek.com,
	ruanjinjie@huawei.com,
	StanleyYP.Wang@mediatek.com,
	johannes.berg@intel.com,
	dmantipov@yandex.ru,
	greearb@candelatech.com,
	meichia.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 052/139] wifi: mt76: mt7915: add dummy HW offload of IEEE 802.11 fragmentation
Date: Wed, 25 Sep 2024 08:07:52 -0400
Message-ID: <20240925121137.1307574-52-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_051341_340931_253EAE97 
X-CRM114-Status: UNSURE (   9.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

[ Upstream commit f2cc859149240d910fdc6405717673e0b84bfda8 ]

Currently, CONNAC2 series do not support encryption for fragmented Tx frames.
Therefore, add dummy function mt7915_set_frag_threshold() to prevent SW
IEEE 802.11 fragmentation.

Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Link: https://patch.msgid.link/20240827093011.18621-16-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 35fdf4f98d80b..2fabef0ec42e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -386,6 +386,7 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
 	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 
 	hw->max_tx_fragments = 4;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 260fe00d7dc6d..f0f4f7d1d600d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1562,6 +1562,12 @@ mt7915_twt_teardown_request(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static int
+mt7915_set_frag_threshold(struct ieee80211_hw *hw, u32 val)
+{
+	return 0;
+}
+
 static int
 mt7915_set_radar_background(struct ieee80211_hw *hw,
 			    struct cfg80211_chan_def *chandef)
@@ -1688,6 +1694,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.sta_set_decap_offload = mt7915_sta_set_decap_offload,
 	.add_twt_setup = mt7915_mac_add_twt_setup,
 	.twt_teardown_request = mt7915_twt_teardown_request,
+	.set_frag_threshold = mt7915_set_frag_threshold,
 	CFG80211_TESTMODE_CMD(mt76_testmode_cmd)
 	CFG80211_TESTMODE_DUMP(mt76_testmode_dump)
 #ifdef CONFIG_MAC80211_DEBUGFS
-- 
2.43.0


