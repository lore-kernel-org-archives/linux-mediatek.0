Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBD4C5DF97
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fo0uxGRk8UJw5F5ZT/mRt7/JG59oNUDLhOEBIJISg10=; b=OC5Hwas5JpIbr4l4hnhPZ91/Uk
	8i7M2RNhDmwxvN3QzZLbLTRE7gb3oXcScp1/ZQDzXE+gXoicc+8wrVDsCualCrSC1wxG+WZD2X78J
	OOiCb7uQhBrrUYHBVBw17JcmyrBGU8OIQ2OI+8Al6o9JzeikTxBCr3An9Onv9rZHS8YZhAdATmjj9
	Vs/WTjEvVp2I8HfDP/zEca9vdNvlviNeqxwd6mGsv2nASSbgFIyVdMq5oDULm94GBfUkC5Ddczdf8
	jHrb/mXI9e8U6Nf2VFaHTAAY57ubu9I4B4Lo2k9O7ckTja8VcMTA0g1AC8cyhscL4zOJ35QcDRvjm
	X0IQg0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMlS-00000003AQt-3d2J;
	Wed, 26 Aug 2026 23:10:38 +0000
Received: from out-135.mta0.migadu.com ([2001:41d0:1004:224b::87] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMlQ-00000003AQL-0k8v
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 23:10:37 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=21mH2w05RhttlqCfTjbNE8XuWsn5+7CCGKT6qfTQtqM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787785832; v=1; x=1788390632;
 b=CkQCF8Oxoh7kuO+Bzw9m9SmsKDdqcgthZ49e2OOMQrl8MBtKKFpkR/c/gaBxguT8JZZJZ+i3
 R+q8yPTYON21q+zLuMnbzAd7Nl+Yv2Pf3InUf05zJWQS6wNX35Ct75eXInu5Xxa2jp1Hqog+12/
 xVdtTvCU3oXeEWTBVXp4wkNgE7Vg0X5cUc7tlw8DObYBMWt+yX6w+Mb0IzdifHcuOzyWxhM5p0n
 3BvQwxiOgpHkeSTTEEdgVJMXCQKNzX6ZbM66r/7jX8CJ2FBdTbE24PSV/tNJkx2HZtMrmOzJbpb
 xxelUJyluYFGydpDTprzl0h08BP4DGCXErrjhTE2xzXYg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id 03c0f21bc6a38391;
	Wed, 26 Aug 2026 23:10:32 +0000
X-Mizu-Trace-ID: 03c0f21bc6a38391
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt7921: honour FIF_FCSFAIL instead of hardcoding drop_err
Date: Wed, 26 Aug 2026 16:10:29 -0700
Message-ID: <20260826231029.39632-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_161036_559367_B0AFB974 
X-CRM114-Status: GOOD (  20.40  )
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

When a monitor interface asks to see frames that failed their checksum,
mac80211 passes the request down to the driver. mt7921 works out the
answer, sends it to the firmware as a receive filter, and then configures
the sniffer with a hardcoded byte telling it to drop those frames anyway.
The answer is used once and never kept, so the sniffer never gets to see
it.

That matters to anyone using monitor mode to judge a link honestly, which
is most of the reason to be in monitor mode at all.

Mark Anthony Agarro posted the same change for mt7925: keep what mac80211
asked for on the phy, and read it back when the sniffer is configured.
This does that for mt7921, and applies on top of it, since that patch is
what adds the field.

https://lore.kernel.org/linux-wireless/20260826091757.469953-1-markanthonyagarro@gmail.com/

The stored value is read in one place only, configuring the sniffer, which
has a single caller, and that call sits inside a branch reached only by a
monitor interface. Nothing else changes.

Measured on an MT7922 with a read-only probe on the command as the driver
sends it, so these are the driver's own bytes rather than an inference
from what came back:

  request  arm      drop_err
  none     stock    1 1 1 1
  none     patched  1 1 1 1
  fcsfail  stock    1 1
  fcsfail  patched  0 0

Stock sends the drop byte whether or not anyone asked for it. Patched
sends it only when nobody did. Withdrawing the request and making it again
inside one driver load moves the byte back and forth, 0 then 1 then 0
across three changes, so nothing sticks once set.

If it does appear to stick when trying this against an MT7927, that is
mac80211 rather than the driver. It raises the filter count
unconditionally when a monitor comes up, but skips lowering it again for
drivers that set NO_VIRTUAL_MONITOR, and that is the only chip in this
family which does.

Fixes: 914189af23b8 ("wifi: mt76: mt7921: fix channel switch fail in monitor mode")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Not standalone. This needs the mt7925 patch linked above, which is what
adds rxfilter to struct mt792x_phy. Without it this will not build.

 drivers/net/wireless/mediatek/mt76/mt7921/main.c   | 8 +++-----
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 5 +++++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 68a059504e83..95f7f56125ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -668,12 +668,8 @@ static void mt7921_configure_filter(struct ieee80211_hw *hw,
 				    unsigned int *total_flags,
 				    u64 multicast)
 {
-#define MT7921_FILTER_FCSFAIL    BIT(2)
-#define MT7921_FILTER_CONTROL    BIT(5)
-#define MT7921_FILTER_OTHER_BSS  BIT(6)
-#define MT7921_FILTER_ENABLE     BIT(31)
-
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	u32 flags = MT7921_FILTER_ENABLE;
 
 #define MT7921_FILTER(_fif, _type) do {			\
@@ -685,6 +681,8 @@ static void mt7921_configure_filter(struct ieee80211_hw *hw,
 	MT7921_FILTER(FIF_CONTROL, CONTROL);
 	MT7921_FILTER(FIF_OTHER_BSS, OTHER_BSS);
 
+	phy->rxfilter = flags;
+
 	mt792x_mutex_acquire(dev);
 	mt7921_mcu_set_rxfilter(dev, flags, 0, 0);
 	mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a118a301564c..7abd1d98feed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1226,7 +1226,7 @@ int mt7921_mcu_config_sniffer(struct mt792x_vif *vif,
 			.len = cpu_to_le16(sizeof(req.tlv)),
 			.control_ch = chandef->chan->hw_value,
 			.center_ch = ieee80211_frequency_to_channel(freq1),
-			.drop_err = 1,
+			.drop_err = !(vif->phy->rxfilter & MT7921_FILTER_FCSFAIL),
 		},
 	};
 	if (chandef->chan->band < ARRAY_SIZE(ch_band))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index fb8654b7c5e7..f7ed11353d28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -7,6 +7,11 @@
 #include "../mt792x.h"
 #include "regs.h"
 
+#define MT7921_FILTER_FCSFAIL		BIT(2)
+#define MT7921_FILTER_CONTROL		BIT(5)
+#define MT7921_FILTER_OTHER_BSS		BIT(6)
+#define MT7921_FILTER_ENABLE		BIT(31)
+
 #define MT7921_MAX_AID                  20
 
 #define MT7921_TX_RING_SIZE		2048
-- 
2.55.0


