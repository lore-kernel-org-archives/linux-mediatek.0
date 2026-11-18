Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318F606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R1UKp0ri;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MGqyGyVh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=perJkwEqAhVxekSc0fwCpQUsI09QEPJ8eIkTFaNJeoY=; b=R1UKp0ri5KEoACI5ZrQ/k/K3mx
	e3IfWbfNR630kHEV3U4xcvjSo49mMsHpLyRnxbs8Eope89F1WV+qN2Yganmu5ghO4o2xglBdvm/vB
	dfqGh1xsq3gNvCU5EK9H7oww3meHqd/xwwMG032RKw+a6TG4iPsZy5hCtlxIR9Pl4Ics9wenA+NaM
	d664os7F/ymDU83meM4kNW/09mHQXUyoENyTBa6aZwtL0z9APScPH3im1wf8ZTMxbdLhcAejOCbo4
	KUetdzhU3UO+/v6tvyCrCtAKBcpkK89iDilOFjPb1uO5H17ZpZCR5Rwhpe3GS2HIHSbPtydK6t0Mn
	/UkQCIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTU57-00000007Q8q-0uSP;
	Wed, 18 Nov 2026 01:03:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTU54-00000007Q8P-0q5U
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 01:03:23 +0000
X-UUID: d581c90ee2eb11f1afed4741b24580c9-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=perJkwEqAhVxekSc0fwCpQUsI09QEPJ8eIkTFaNJeoY=;
	b=MGqyGyVh5r+Qg1JCn/4/cAStUzoNNY+S/u8yGyyF0u0cvhvz9rUv+vAyCNFFFEaVYzMzzSN4EmCzWXud7X+yv5qfdmfCS9ULECbXvGjVT9KxLpr8tYntYtPvQVBJ/NiTrjc8WM5dpt4dhGWbql2sC3uJqjI7/bR4iCv4G346kfw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b2780f94-bd7d-408d-a338-9d7147ca6a4d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:b0318ac,CLOUDID:3e39ff30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:2|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d581c90ee2eb11f1afed4741b24580c9-20261117
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743559194; Tue, 17 Nov 2026 18:03:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 18 Nov 2026 09:03:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 18 Nov 2026 09:03:12 +0800
From: Michael Shih <michael.shih@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.Lai@mediatek.com>, Michael Shih <michael.shih@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7928: Add MTK OUI support for nl80211 (ALOS support for wpa_supplicant to get MTK OUI)
Date: Wed, 18 Nov 2026 09:03:10 +0800
Message-ID: <20261118010310.1044193-1-michael.shih@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030031758.3397910-1-eason.lai@mediatek.com>
References: <20261030031758.3397910-1-eason.lai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_170322_281865_8F5D1D77 
X-CRM114-Status: GOOD (  20.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Customer request MTK to support OUI for wpa supplicant.

CR-Id: BORA00080136
Signed-off-by: Michael Shih <michael.shih@mediatek.com>
---
v2: Added "CONFIG_MT792x_VENDOR_CMD" for Kconfig build flag
---
 drivers/net/wireless/mediatek/mt76/Kconfig    | 12 +++
 drivers/net/wireless/mediatek/mt76/Makefile   |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  5 ++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  2 +
 .../wireless/mediatek/mt76/mt792x_vendor.c    | 76 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt792x_vendor.h    | 36 +++++++++
 6 files changed, 132 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_vendor.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_vendor.h

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index a4ece38f938d..24faee348d8d 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -33,6 +33,18 @@ config MT792x_LIB
 	tristate
 	select MT76_CONNAC_LIB
 
+config MT792x_VENDOR_CMD
+	bool "MediaTek MT792x nl80211 vendor command support"
+	depends on MT792x_LIB
+	default y
+	help
+	  Advertise the MediaTek OUI (0x000CE7) nl80211 vendor command
+	  interface, allowing user space (e.g. wpa_supplicant) to query
+	  chip information. This is a read-only query interface and has no
+	  effect unless a matching vendor command is issued from user space.
+
+	  Say N to disable the interface entirely.
+
 config MT792x_USB
 	tristate
 	select MT76_USB
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index cacdd2b13d05..e7e75ab66fdd 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -40,6 +40,7 @@ mt76-connac-lib-y := mt76_connac_mcu.o mt76_connac_mac.o mt76_connac3_mac.o
 mt792x-lib-y := mt792x_core.o mt792x_mac.o mt792x_trace.o \
 		mt792x_debugfs.o mt792x_dma.o
 mt792x-lib-$(CONFIG_ACPI) += mt792x_acpi_sar.o
+mt792x-lib-$(CONFIG_MT792x_VENDOR_CMD) += mt792x_vendor.o
 mt792x-usb-y := mt792x_usb.o
 
 obj-$(CONFIG_MT76x0_COMMON) += mt76x0/
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4753ec20fe0c..d0b985d7951c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -558,6 +558,11 @@ int mt792x_pm_stats(struct seq_file *s, void *data);
 int mt792x_pm_idle_timeout_set(void *data, u64 val);
 int mt792x_pm_idle_timeout_get(void *data, u64 *val);
 int mt792x_init_wiphy(struct ieee80211_hw *hw);
+#if IS_ENABLED(CONFIG_MT792x_VENDOR_CMD)
+void mt792x_vendor_register(struct ieee80211_hw *hw);
+#else
+static inline void mt792x_vendor_register(struct ieee80211_hw *hw) {}
+#endif
 struct ieee80211_ops *
 mt792x_get_mac80211_ops(struct device *dev,
 			const struct ieee80211_ops *mac80211_ops,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 1965e9de7099..b6183b2f5db0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -876,6 +876,8 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	hw->max_tx_fragments = 4;
 
+	mt792x_vendor_register(hw);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mt792x_init_wiphy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_vendor.c b/drivers/net/wireless/mediatek/mt76/mt792x_vendor.c
new file mode 100644
index 000000000000..d1f1560d8641
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_vendor.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2026 MediaTek Inc. */
+
+#include <linux/module.h>
+#include <net/netlink.h>
+#include <net/cfg80211.h>
+
+#include "mt792x.h"
+#include "mt792x_vendor.h"
+
+static const struct nla_policy
+mtk_vendor_chip_info_policy[MTK_VENDOR_ATTR_CHIP_INFO_MAX + 1] = {
+	[MTK_VENDOR_ATTR_CHIP_INFO_ID]  = { .type = NLA_U32 },
+	[MTK_VENDOR_ATTR_CHIP_INFO_OUI] = { .type = NLA_U32 },
+};
+
+static int
+mt792x_vendor_get_chip_info(struct wiphy *wiphy, struct wireless_dev *wdev,
+			    const void *data, int data_len)
+{
+	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct sk_buff *skb;
+
+	/* reply payload: two u32 attributes */
+	skb = cfg80211_vendor_cmd_alloc_reply_skb(wiphy,
+						  2 * (nla_total_size(sizeof(u32))));
+	if (!skb)
+		return -ENOMEM;
+
+	if (nla_put_u32(skb, MTK_VENDOR_ATTR_CHIP_INFO_ID,
+			phy->dev->mt76.rev) ||
+	    nla_put_u32(skb, MTK_VENDOR_ATTR_CHIP_INFO_OUI,
+			MTK_NL80211_VENDOR_ID)) {
+		kfree_skb(skb);
+		return -ENOBUFS;
+	}
+
+	return cfg80211_vendor_cmd_reply(skb);
+}
+
+static const struct wiphy_vendor_command mt792x_vendor_commands[] = {
+	{
+		.info = {
+			.vendor_id = MTK_NL80211_VENDOR_ID,
+			.subcmd    = MTK_NL80211_VENDOR_SUBCMD_GET_CHIP_INFO,
+		},
+		.flags = WIPHY_VENDOR_CMD_NEED_WDEV |
+			 WIPHY_VENDOR_CMD_NEED_NETDEV,
+		.doit    = mt792x_vendor_get_chip_info,
+		.policy  = mtk_vendor_chip_info_policy,
+		.maxattr = MTK_VENDOR_ATTR_CHIP_INFO_MAX,
+	},
+};
+
+static const struct nl80211_vendor_cmd_info mt792x_vendor_events[] = {
+	[MTK_NL80211_VENDOR_EVENT_CHIP_INFO] = {
+		.vendor_id = MTK_NL80211_VENDOR_ID,
+		.subcmd    = MTK_NL80211_VENDOR_SUBCMD_GET_CHIP_INFO,
+	},
+};
+
+void mt792x_vendor_register(struct ieee80211_hw *hw)
+{
+	struct wiphy *wiphy = hw->wiphy;
+
+	wiphy->vendor_commands   = mt792x_vendor_commands;
+	wiphy->n_vendor_commands = ARRAY_SIZE(mt792x_vendor_commands);
+	wiphy->vendor_events     = mt792x_vendor_events;
+	wiphy->n_vendor_events   = ARRAY_SIZE(mt792x_vendor_events);
+
+	dev_info(wiphy->dev.parent,
+		 "mt792x: registered %u vendor cmd(s), OUI=0x%06x\n",
+		 wiphy->n_vendor_commands, MTK_NL80211_VENDOR_ID);
+}
+EXPORT_SYMBOL_GPL(mt792x_vendor_register);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_vendor.h b/drivers/net/wireless/mediatek/mt76/mt792x_vendor.h
new file mode 100644
index 000000000000..ab728cfd0912
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_vendor.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: ISC */
+/* Copyright (C) 2026 MediaTek Inc. */
+
+#ifndef __MT792X_VENDOR_H
+#define __MT792X_VENDOR_H
+
+/* MediaTek nl80211 vendor OUI (24-bit OUI placed in the low 24 bits).
+ * This is the value advertised to user space (e.g. wpa_supplicant's
+ * wiphy_info_handler) via NL80211_ATTR_VENDOR_DATA in the GET_WIPHY reply.
+ */
+#define MTK_NL80211_VENDOR_ID		0x000ce7
+
+/* vendor sub-commands (defined by the vendor) */
+enum mtk_nl80211_vendor_subcmds {
+	MTK_NL80211_VENDOR_SUBCMD_UNSPEC	= 0,
+	MTK_NL80211_VENDOR_SUBCMD_GET_CHIP_INFO	= 1,
+};
+
+/* vendor event indexes (used by cfg80211_vendor_event*) */
+enum mtk_nl80211_vendor_events {
+	MTK_NL80211_VENDOR_EVENT_CHIP_INFO	= 0,
+};
+
+/* attributes carried in the GET_CHIP_INFO vendor command reply */
+enum mtk_vendor_attr_chip_info {
+	MTK_VENDOR_ATTR_CHIP_INFO_INVALID	= 0,
+	MTK_VENDOR_ATTR_CHIP_INFO_ID		= 1,
+	MTK_VENDOR_ATTR_CHIP_INFO_OUI		= 2,
+
+	/* keep last */
+	__MTK_VENDOR_ATTR_CHIP_INFO_MAX,
+	MTK_VENDOR_ATTR_CHIP_INFO_MAX =
+		__MTK_VENDOR_ATTR_CHIP_INFO_MAX - 1,
+};
+
+#endif /* __MT792X_VENDOR_H */
-- 
2.45.2


