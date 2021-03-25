Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A057DC433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C816198C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C816198C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SL0r4F0QT/1PTWUvVndig0gm02Nwuc9ZwavLNNg6tVc=; b=gYdrMphrLzPrz2Djwx9vsodeP
	LS51JZrTYoxEPqkoqYtM+K/01+liuRX3BAJ1ARj1YaRiKQe5GY8JsNdWDdFhiELkbu3w6Z7ot6AoD
	3R410R7YGaMX/dTYMfRJx8lDfKi1tYBZx85YhfFr1i7XpsKA+xCOQcLE2WMWb9lKRUAmhraofxu4S
	67m8LhyJqe51/CNX0sn+ZgrI0r9dw6jMp1cogz9FEF5HB4TII8sX7cxUr/7hMknkMsfJleQY82f1n
	LwjkxeujNDfjEcBZaLYtecDQ2nf+Is7QSU3DWxgDOSEpbORhK5gpBB8ke4e/C8fcbw1qVYrhtKB6i
	3UWO1YbuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL3M-000uQW-9v; Thu, 25 Mar 2021 08:09:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL2d-000u9r-8I
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:08:34 +0000
X-UUID: a89a01d246bf4a64bbf0cf7d031dd9ba-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RYbpDkxjPcuGEsvJutW81MSsnM3lNLnQLx6bjyAeqg8=; 
 b=HfOiHj5CFRvf8elo2HBaMoH1E2x7QR/VBOQVd55HnWyUuOpunUB2FZqxHwWjr7faK6XKCpv/qb4B0m6MaCmRcuK8/1R+I4qC/Mh95XncNWu7ESK+lUePBumB0aLFG0LNXRoRkvuCkx0foUWGKtAQ9OekEXGmepEe9hzpfAVj4PE=;
X-UUID: a89a01d246bf4a64bbf0cf7d031dd9ba-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408857046; Thu, 25 Mar 2021 00:08:08 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 01:06:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:06:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:06:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 4/5] mt76: mt7615: keep mcu_add_bss_info enabled till
 interface removal
Date: Thu, 25 Mar 2021 16:06:04 +0800
Message-ID: <02d52818307a85b66e59ca11e36a9da47e2fe4df.1616657048.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
References: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_080832_030908_504B5E97 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

BSS_INFO_BASIC is never called alone with inactive state, which always
follows beacon offload disable, so keep it enabled throughout interfaces
life cycle. Inactive state also removes sta record of all connected
stations, thurs causes connection lost which defeats the purpose of CSA.

Lastly, this is especially an unexpected behavior that keeping mt7622
failing beacon buffer recyled when scanning channels.

bss_conf change is updated with active state only, so just overwrite it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 342e2c5d9766..ef879d71faa2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -253,7 +253,8 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
 	int idx = msta->wcid.idx;
 
-	/* TODO: disable beacon for the bss */
+	mt7615_mcu_add_bss_info(phy, vif, NULL, false);
+	mt7615_mcu_sta_add(phy, vif, NULL, false);
 
 	mt7615_mutex_acquire(dev);
 
@@ -558,11 +559,11 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED) {
-		mt7615_mcu_add_bss_info(phy, vif, NULL, info->enable_beacon);
-		mt7615_mcu_sta_add(phy, vif, NULL, info->enable_beacon);
+	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
+		mt7615_mcu_add_bss_info(phy, vif, NULL, true);
+		mt7615_mcu_sta_add(phy, vif, NULL, true);
 
-		if (vif->p2p && info->enable_beacon)
+		if (vif->p2p)
 			mt7615_mcu_set_p2p_oppps(hw, vif);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
