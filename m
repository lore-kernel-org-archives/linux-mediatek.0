Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9035BC46CD3
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Dec 2023 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M5Ap3MIoom3Cah/P1/+3hr2fJ0d5kw3uyf9qk8neY38=; b=gk7tvbQ2kHlxoxERuD3WhkCd5z
	Yj2oFtbyW07SD8yMZ0rfo0k/oHOf2MyFmB0eiouh5gvLBTr+FQGcMSg5iOSdxRkUlanYyTWk4HJip
	72me3+PIu7tFTlsrq7DGFvWgrJ5Pereo2upD7/qfq7+th90rnIaT3MXVbG2o1hw+yltQeelmTCHN7
	wth4P7cj7Mi7mTht1Qm27xyGMtttwy4/mMqDOJ3ePXmvvNwrPFzz8T8mgZFDhKsLdFwiY/9GKdtkh
	83WDZ8ZaJJBFUyxE6YDpmaqm+x1vFQBnSm9RFs1jO9nbJ3NcHzOsgR5Qmhe8zW5fDvjM0IrXHANBG
	EuVYvDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHJXT-0091gd-0f;
	Sun, 24 Dec 2023 08:08:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHJXP-0091fi-2D
	for linux-mediatek@lists.infradead.org;
	Sun, 24 Dec 2023 08:08:45 +0000
X-UUID: a353279ea23311ee9b09ad09c76753c8-20231224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=M5Ap3MIoom3Cah/P1/+3hr2fJ0d5kw3uyf9qk8neY38=;
	b=UOz0Poobu0BU9HJ4vSZfEOaRxcmbk4eMPxDBtbM+5WdSnpJ4zFgZi9sg9ke/nq8kSNer2FdpusmGBfRmduqBdpIX65QImmoUrLoEYN+X/zYlGcoqsycoNAIMGHpcyks1PbVsOkaknv+Zk1UFZyHFXjPrL/1pdbnmzHo5h4vcTqo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:a593501e-aabf-46f7-9dbe-326150d10410,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:40806c2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a353279ea23311ee9b09ad09c76753c8-20231224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 510594383; Sun, 24 Dec 2023 01:08:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 24 Dec 2023 16:08:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 24 Dec 2023 16:08:02 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Quan Zhou
	<quan.zhou@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Deren Wu
	<deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: support temperature sensor
Date: Sun, 24 Dec 2023 16:04:59 +0800
Message-ID: <90a818483daff3c6fa2a2a2367dc0cc0be9b3378.1703403371.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.656000-8.000000
X-TMASE-MatchedRID: PehFwp3zCOBjcGvWjN+53s9tRbA8O6QzlZnydB88IJLfUZT83lbkEPq+
	JLKFEPMF4ZQqYHZtqxjtaDDr9p69jSFj8NsBczzdFYJUGv4DL3y2McZY43zJ423D6f6IpbLIawP
	hQZJn9Bzx6gF+AN4QjiB0rM1vTjvT87Q/R9NEbKsZXJLztZviXPngX/aL8PCNYdpcZH3BrBR0v1
	TYNt6TWl2EerRYP46mB6TWlWdPFRI2xqN5L+oQEqIBnfMCFBiCVddk7QGQHackm/L/MIL+8ppuE
	ZGhn28t3VN4WLcWL3BftuJwrFEhTY2j49Ftap9Eymsk/wUE4ho2+VkdMxapXE8iY45nBhHymHjZ
	ALHIFjpAtJKqHMn6+f1ZpzwLrNQq
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.656000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C09AB1D4CF61D677CB0C535EF66C83E69EA53BCC56189DE152ACE82E3138E1F22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_000843_758705_CDE92895 
X-CRM114-Status: GOOD (  12.80  )
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

Allow sensors tool to read radio's temperature, example:

mt7925_phy8-pci-3b00
Adapter: PCI adapter
temp1:        +35.0°C

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 56 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 36 ++++++++++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8f9b7a2f376c..c4cbc8976046 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -2,11 +2,61 @@
 /* Copyright (C) 2023 MediaTek Inc. */
 
 #include <linux/etherdevice.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/thermal.h>
 #include <linux/firmware.h>
 #include "mt7925.h"
 #include "mac.h"
 #include "mcu.h"
 
+static ssize_t mt7925_thermal_temp_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	switch (to_sensor_dev_attr(attr)->index) {
+	case 0: {
+		struct mt792x_phy *phy = dev_get_drvdata(dev);
+		struct mt792x_dev *mdev = phy->dev;
+		int temperature;
+
+		mt792x_mutex_acquire(mdev);
+		temperature = mt7925_mcu_get_temperature(phy);
+		mt792x_mutex_release(mdev);
+
+		if (temperature < 0)
+			return temperature;
+		/* display in millidegree Celsius */
+		return sprintf(buf, "%u\n", temperature * 1000);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+static SENSOR_DEVICE_ATTR_RO(temp1_input, mt7925_thermal_temp, 0);
+
+static struct attribute *mt7925_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mt7925_hwmon);
+
+static int mt7925_thermal_init(struct mt792x_phy *phy)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	struct device *hwmon;
+	const char *name;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7925_%s",
+			      wiphy_name(wiphy));
+
+	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
+						       mt7925_hwmon_groups);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
 static void
 mt7925_regd_notifier(struct wiphy *wiphy,
 		     struct regulatory_request *req)
@@ -142,6 +192,12 @@ static void mt7925_init_work(struct work_struct *work)
 		return;
 	}
 
+	ret = mt7925_thermal_init(&dev->phy);
+	if (ret) {
+		dev_err(dev->mt76.dev, "thermal init failed\n");
+		return;
+	}
+
 	/* we support chip reset now */
 	dev->hw_init_done = true;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c5fd7116929b..d6909d77bbe1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -656,6 +656,42 @@ int mt7925_mcu_fw_log_2_host(struct mt792x_dev *dev, u8 ctrl)
 	return ret;
 }
 
+int mt7925_mcu_get_temperature(struct mt792x_phy *phy)
+{
+	struct {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
+		u8 _rsv2[4];
+	} __packed req = {
+		.tag = cpu_to_le16(0x0),
+		.len = cpu_to_le16(sizeof(req) - 4),
+	};
+	struct mt7925_thermal_evt {
+		u8 rsv[4];
+		__le32 temperature;
+	} __packed * evt;
+	struct mt792x_dev *dev = phy->dev;
+	int temperature, ret;
+	struct sk_buff *skb;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(THERMAL),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	skb_pull(skb, 4 + sizeof(struct tlv));
+	evt = (struct mt7925_thermal_evt *)skb->data;
+
+	temperature = le32_to_cpu(evt->temperature);
+
+	dev_kfree_skb(skb);
+
+	return temperature;
+}
+
 static void
 mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 33785f526acf..8a4a71f6bcb6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -271,6 +271,7 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			   bool enable);
 int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 			      struct ieee80211_chanctx_conf *ctx);
+int mt7925_mcu_get_temperature(struct mt792x_phy *phy);
 
 int mt7925_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-- 
2.18.0


