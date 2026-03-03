Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB1BE67A6D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKPlvqaM8hImZCQ5w/scQ7fp97KZPGf8mv9ivOTsvk0=; b=q2I3Xly7kipPtr7Y9NhH/XTTEu
	cl/VB/VBTr4ERhPc88fF0RZwBAdFEia+At141NNJwierAn6DTDbK2evKbfQAUogceQWuTqAaBvc9b
	TmC5Oqwwm8lrcU4gauTGB3YB7S6pOjAMgxvbz4Pr+78LuuQ3evpTXWuGA1em/x4kKNMjMVHs1A6Xo
	HHWiWuyuq/+KAtoom2gh+FF8q4eHUnXhT8BfTt/lU1569WqjOPkhfsA9dxyKpq2oaEC6jjybEQ8eU
	MeUj9tMLpS4/0TBIUN7bFZlIwBH2dOGxIygoJMJqvcIxway/O1ac/DXD2Ngy8i56aiztut0aaVOGA
	UeVAlGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRG-0000000EYZO-35G1;
	Tue, 03 Mar 2026 05:36:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRD-0000000EYYG-3ZUP
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:36:56 +0000
X-UUID: fa6f16ea16c211f1a16f0188aa809bee-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oKPlvqaM8hImZCQ5w/scQ7fp97KZPGf8mv9ivOTsvk0=;
	b=kv5G/KZp3vsjE9+VEnc1WMeF1EXpL5Kwqtux1qHXFhyG5TwzKu10RWj8VUFG7JxTx7hjgG1LrMrg+i6aK1BSjXomG0hscgoqlsy7gecoKH5wWvXXAxF8JUe3iI+H1QJ5rW9+DMZAclpsSRWx0cx9OKGIcKmcuvAgDB9T7RVuwF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:df9673e1-a3a6-41a8-8440-8b65c2ccf14c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f239747b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa6f16ea16c211f1a16f0188aa809bee-20260302
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 347387592; Mon, 02 Mar 2026 22:36:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:36:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:36:48 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH v2 1/5] wifi: mt76: mt7921: refactor regulatory domain handling to regd.[ch]
Date: Tue, 3 Mar 2026 13:36:33 +0800
Message-ID: <20260303053637.465465-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213655_929718_A707FAF1 
X-CRM114-Status: GOOD (  20.25  )
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

Move regd logic to regd.c and regd.h files

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
v2: Switch SPDX to BSD-3-Clause-Clear; remove unused <linux/of_net.h>;
decouple regd.h from mt7921.h with forward declarations
(no functional change).
---
 .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  98 +----------------
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   1 +
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   1 -
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   1 +
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 103 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  15 +++
 7 files changed, 122 insertions(+), 99 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/regd.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/regd.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index 2ad3c1cc3779..3ef7c9c45386 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_MT7921E) += mt7921e.o
 obj-$(CONFIG_MT7921S) += mt7921s.o
 obj-$(CONFIG_MT7921U) += mt7921u.o
 
-mt7921-common-y := mac.o mcu.o main.o init.o debugfs.o
+mt7921-common-y := mac.o mcu.o regd.o main.o init.o debugfs.o
 mt7921-common-$(CONFIG_NL80211_TESTMODE) += testmode.o
 mt7921e-y := pci.o pci_mac.o pci_mcu.o
 mt7921s-y := sdio.o sdio_mac.o sdio_mcu.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 8e7790702191..49be2fa4e3fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -9,6 +9,7 @@
 #include "mt7921.h"
 #include "../mt76_connac2_mac.h"
 #include "mcu.h"
+#include "regd.h"
 
 static ssize_t mt7921_thermal_temp_show(struct device *dev,
 					struct device_attribute *attr,
@@ -60,103 +61,6 @@ static int mt7921_thermal_init(struct mt792x_phy *phy)
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
-static void
-mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
-{
-#define IS_UNII_INVALID(idx, sfreq, efreq) \
-	(!(dev->phy.clc_chan_conf & BIT(idx)) && (cfreq) >= (sfreq) && (cfreq) <= (efreq))
-	struct ieee80211_supported_band *sband;
-	struct mt76_dev *mdev = &dev->mt76;
-	struct device_node *np, *band_np;
-	struct ieee80211_channel *ch;
-	int i, cfreq;
-
-	np = mt76_find_power_limits_node(mdev);
-
-	sband = wiphy->bands[NL80211_BAND_5GHZ];
-	band_np = np ? of_get_child_by_name(np, "txpower-5g") : NULL;
-	for (i = 0; i < sband->n_channels; i++) {
-		ch = &sband->channels[i];
-		cfreq = ch->center_freq;
-
-		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
-			ch->flags |= IEEE80211_CHAN_DISABLED;
-			continue;
-		}
-
-		/* UNII-4 */
-		if (IS_UNII_INVALID(0, 5845, 5925))
-			ch->flags |= IEEE80211_CHAN_DISABLED;
-	}
-
-	sband = wiphy->bands[NL80211_BAND_6GHZ];
-	if (!sband)
-		return;
-
-	band_np = np ? of_get_child_by_name(np, "txpower-6g") : NULL;
-	for (i = 0; i < sband->n_channels; i++) {
-		ch = &sband->channels[i];
-		cfreq = ch->center_freq;
-
-		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
-			ch->flags |= IEEE80211_CHAN_DISABLED;
-			continue;
-		}
-
-		/* UNII-5/6/7/8 */
-		if (IS_UNII_INVALID(1, 5925, 6425) ||
-		    IS_UNII_INVALID(2, 6425, 6525) ||
-		    IS_UNII_INVALID(3, 6525, 6875) ||
-		    IS_UNII_INVALID(4, 6875, 7125))
-			ch->flags |= IEEE80211_CHAN_DISABLED;
-	}
-}
-
-void mt7921_regd_update(struct mt792x_dev *dev)
-{
-	struct mt76_dev *mdev = &dev->mt76;
-	struct ieee80211_hw *hw = mdev->hw;
-	struct wiphy *wiphy = hw->wiphy;
-
-	mt7921_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
-	mt7921_regd_channel_update(wiphy, dev);
-	mt76_connac_mcu_set_channel_domain(hw->priv);
-	mt7921_set_tx_sar_pwr(hw, NULL);
-}
-EXPORT_SYMBOL_GPL(mt7921_regd_update);
-
-static void
-mt7921_regd_notifier(struct wiphy *wiphy,
-		     struct regulatory_request *request)
-{
-	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
-	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct mt76_connac_pm *pm = &dev->pm;
-
-	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
-	dev->mt76.region = request->dfs_region;
-	dev->country_ie_env = request->country_ie_env;
-
-	if (request->initiator == NL80211_REGDOM_SET_BY_USER) {
-		if (dev->mt76.alpha2[0] == '0' && dev->mt76.alpha2[1] == '0')
-			wiphy->regulatory_flags &= ~REGULATORY_COUNTRY_IE_IGNORE;
-		else
-			wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE;
-	}
-
-	if (pm->suspended)
-		return;
-
-	dev->regd_in_progress = true;
-
-	mt792x_mutex_acquire(dev);
-	mt7921_regd_update(dev);
-	mt792x_mutex_release(dev);
-
-	dev->regd_in_progress = false;
-	wake_up(&dev->wait);
-}
-
 int mt7921_mac_init(struct mt792x_dev *dev)
 {
 	int i;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe7408..d9925a528294 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <net/ipv6.h>
 #include "mt7921.h"
+#include "regd.h"
 #include "mcu.h"
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 64f60c4fc60c..fb8654b7c5e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -260,7 +260,6 @@ mt7921_l1_rmw(struct mt792x_dev *dev, u32 addr, u32 mask, u32 val)
 #define mt7921_l1_set(dev, addr, val)	mt7921_l1_rmw(dev, addr, 0, val)
 #define mt7921_l1_clear(dev, addr, val)	mt7921_l1_rmw(dev, addr, val, 0)
 
-void mt7921_regd_update(struct mt792x_dev *dev);
 int mt7921_mac_init(struct mt792x_dev *dev);
 bool mt7921_mac_wtbl_update(struct mt792x_dev *dev, int idx, u32 mask);
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 7a790ddf43bb..64340f9b7fa4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -12,6 +12,7 @@
 #include "../mt76_connac2_mac.h"
 #include "../dma.h"
 #include "mcu.h"
+#include "regd.h"
 
 static const struct pci_device_id mt7921_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7961),
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
new file mode 100644
index 000000000000..51dbbadbc63a
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/* Copyright (C) 2025 MediaTek Inc. */
+
+#include <linux/of.h>
+#include "mt7921.h"
+#include "regd.h"
+#include "mcu.h"
+
+static void
+mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
+{
+#define IS_UNII_INVALID(idx, sfreq, efreq) \
+	(!(dev->phy.clc_chan_conf & BIT(idx)) && (cfreq) >= (sfreq) && (cfreq) <= (efreq))
+	struct ieee80211_supported_band *sband;
+	struct mt76_dev *mdev = &dev->mt76;
+	struct device_node *np, *band_np;
+	struct ieee80211_channel *ch;
+	int i, cfreq;
+
+	np = mt76_find_power_limits_node(mdev);
+
+	sband = wiphy->bands[NL80211_BAND_5GHZ];
+	band_np = np ? of_get_child_by_name(np, "txpower-5g") : NULL;
+	for (i = 0; i < sband->n_channels; i++) {
+		ch = &sband->channels[i];
+		cfreq = ch->center_freq;
+
+		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+			continue;
+		}
+
+		/* UNII-4 */
+		if (IS_UNII_INVALID(0, 5845, 5925))
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+	}
+
+	sband = wiphy->bands[NL80211_BAND_6GHZ];
+	if (!sband)
+		return;
+
+	band_np = np ? of_get_child_by_name(np, "txpower-6g") : NULL;
+	for (i = 0; i < sband->n_channels; i++) {
+		ch = &sband->channels[i];
+		cfreq = ch->center_freq;
+
+		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+			continue;
+		}
+
+		/* UNII-5/6/7/8 */
+		if (IS_UNII_INVALID(1, 5925, 6425) ||
+		    IS_UNII_INVALID(2, 6425, 6525) ||
+		    IS_UNII_INVALID(3, 6525, 6875) ||
+		    IS_UNII_INVALID(4, 6875, 7125))
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+	}
+}
+
+void mt7921_regd_update(struct mt792x_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	struct ieee80211_hw *hw = mdev->hw;
+	struct wiphy *wiphy = hw->wiphy;
+
+	mt7921_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
+	mt7921_regd_channel_update(wiphy, dev);
+	mt76_connac_mcu_set_channel_domain(hw->priv);
+	mt7921_set_tx_sar_pwr(hw, NULL);
+}
+EXPORT_SYMBOL_GPL(mt7921_regd_update);
+
+void mt7921_regd_notifier(struct wiphy *wiphy,
+			  struct regulatory_request *request)
+{
+	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt76_connac_pm *pm = &dev->pm;
+
+	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
+	dev->mt76.region = request->dfs_region;
+	dev->country_ie_env = request->country_ie_env;
+
+	if (request->initiator == NL80211_REGDOM_SET_BY_USER) {
+		if (dev->mt76.alpha2[0] == '0' && dev->mt76.alpha2[1] == '0')
+			wiphy->regulatory_flags &= ~REGULATORY_COUNTRY_IE_IGNORE;
+		else
+			wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE;
+	}
+
+	if (pm->suspended)
+		return;
+
+	dev->regd_in_progress = true;
+
+	mt792x_mutex_acquire(dev);
+	mt7921_regd_update(dev);
+	mt792x_mutex_release(dev);
+
+	dev->regd_in_progress = false;
+	wake_up(&dev->wait);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
new file mode 100644
index 000000000000..2907b78d375b
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/* Copyright (C) 2025 MediaTek Inc. */
+
+#ifndef __MT7921_REGD_H
+#define __MT7921_REGD_H
+
+struct mt792x_dev;
+struct wiphy;
+struct regulatory_request;
+
+void mt7921_regd_update(struct mt792x_dev *dev);
+void mt7921_regd_notifier(struct wiphy *wiphy,
+			  struct regulatory_request *request);
+
+#endif
-- 
2.43.0


