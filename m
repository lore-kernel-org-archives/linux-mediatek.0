Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2F9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:13:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5953619FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5953619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f1/8CbXwVwrlwg1iPcM4omi03dQ/cPrvd9CyV+47F9Q=; b=dz6lC01f9MUfyPbKpiKCenws2
	8IxonlfpawKRBSDASpkIkGOg0TmOE+eKG7mZLm68LHqXKs7m1sqWCKx5bfW1K+dGB2ICnNE4bKiil
	8oQDf9E3J1IPG6pyg8nNG3TRLCkXKxbQhFNiukoo9Hw+Wfoj/AD5pYYhDX17waGnC1C73R7OgmmE2
	0w1GZkvwJpqlnkd8DFrWYsBqsMBVdvwUNa/g8iKvPe8HEesOFuGC8qG2ZUgFr/JGcLEwkpFbrHeQW
	uoMV6kR31aK/pFekxS8x0bGbB0RQxrBjw8KNEbLfpnZpuuRsGGvYtr/XXRzlTDOM8o2hUVuiwNR9Z
	ida1SFo3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL76-000vMc-MN; Thu, 25 Mar 2021 08:13:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL6k-000vII-Ee
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:13:02 +0000
X-UUID: 64d36a5ed8ca4a118bee5f34167e519e-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FdlWQ8jvV0rZ4oUd1bET2nZ01CLncjdL7ixAufhuU8k=; 
 b=uvC38xF/t6ifGcPRGTMoJbwG2PMnrC++y6vO5CB6pHMsTH93YmKTuM1C7pRjhxyB37IcDroay5J7BuQkEbUlRc570zaj8rS9jH8uNg5hAGqfOXq0Md88boBw9shASB2erVhd7MZHxdZMvRxHg6WtOpcFwiDJ8bXrtyQqHoq2z04=;
X-UUID: 64d36a5ed8ca4a118bee5f34167e519e-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 165488944; Thu, 25 Mar 2021 00:12:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 01:06:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:06:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:06:10 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 5/5] mt76: mt7915: keep mcu_add_bss_info enabled till
 interface removal
Date: Thu, 25 Mar 2021 16:06:05 +0800
Message-ID: <eb9851d4be7b9887d27efdd79c4cda7c54a66715.1616657048.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
References: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DF0AB339BFE85DC6CF47A159BA20BFA89C77DCB2135D7065C562ECA81C2610702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_081252_248435_DA98D0D2 
X-CRM114-Status: UNSURE (   9.02  )
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

The same as mt7615. Keep BSS_INFO_BASIC enabled throughout interfaces
life cycle.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index cde8c1ce3ae0..0f2a86b3aa9d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -256,7 +256,8 @@ static void mt7915_remove_interface(struct ieee80211_hw *hw,
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	int idx = msta->wcid.idx;
 
-	/* TODO: disable beacon for the bss */
+	mt7915_mcu_add_bss_info(phy, vif, false);
+	mt7915_mcu_add_sta(dev, vif, NULL, false);
 
 	mutex_lock(&dev->mt76.mutex);
 	mt76_testmode_reset(phy->mt76, true);
@@ -544,9 +545,9 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED) {
-		mt7915_mcu_add_bss_info(phy, vif, info->enable_beacon);
-		mt7915_mcu_add_sta(dev, vif, NULL, info->enable_beacon);
+	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
+		mt7915_mcu_add_bss_info(phy, vif, true);
+		mt7915_mcu_add_sta(dev, vif, NULL, true);
 	}
 
 	/* ensure that enable txcmd_mode after bss_info */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
