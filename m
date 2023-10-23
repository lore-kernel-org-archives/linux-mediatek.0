Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C40DC25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlAnyuxNkZfkL1WJbUJvBiDDzOo+FPKS+dvUfr+i0WU=; b=C1bRm631pnaX7jLeXomdgjuLkT
	Uirkt3YN6/C7kpb1607JlLe39msMtbc5nNUZAXX2eADsUUP0T4kFEj+rpT0Jw6JAEpT8CQ/qw/ScG
	gmqhRgd93pQzW3mft4lJswHzT2uzprZj0oNIVXBgudkP9Z+I7K8EsSwTFJpDrB3Fq6ka7bZimQL9R
	tdAqRJGoVb+MRSjkiD92QlvhbEU5Kqi2qXATcNzOzIvdb9+NSdVT7fzpjPonuygO6dDDa4XrS76r3
	+5wHMX/uLukbKwyJIhuXMtNHShFaNUeTpEoBCToxQm6f7F82/2fTU45IwkKncro/zWdg61+f6/Yy0
	Zwz0S6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4H-007iXc-31;
	Mon, 23 Oct 2023 15:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4E-007iVH-1z
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:12 +0000
X-UUID: b5245c8a71ba11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qlAnyuxNkZfkL1WJbUJvBiDDzOo+FPKS+dvUfr+i0WU=;
	b=hrxn3KaVGD91l4YUH4ceKEi5kbl2Klg6J7i/i25pAI1QfqFRO5wT1ayidhGjvKhJ2F+i2CrDAYE5UhoHd3GxvpVEoIfnp8zBFdbHbrFCh0AyA9+aDL1dOPA78Gl2aHgBNWkBTgVQ2LJOWgBbfTtgZZT95EJbJ3furVJfdxxAXOE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:88c0f96d-d5ad-490e-bfba-6c887a1ca4ec,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:04ac37d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: b5245c8a71ba11ee9b7791016c24628a-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086696430; Mon, 23 Oct 2023 08:42:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 04/11] wifi: mt76: mt7996: add thermal sensor device support
Date: Mon, 23 Oct 2023 23:38:47 +0800
Message-ID: <20231023153854.10708-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.463000-8.000000
X-TMASE-MatchedRID: JB9HZaG2zbP0D0R+G5TTHAe06kQGFaIWrXeN27EOXQLfUZT83lbkEPq+
	JLKFEPMF4ZQqYHZtqxjtaDDr9p69jYeo25/FaNFLQ4r9bxJdsVu2McZY43zJ423D6f6IpbLI2ug
	QZCK503LLqCJZs0VuwBkmxbIiP0JUhg3ugDGK8YhYKMMlFh4BnQ48ME9K+hF02viB/Jr4D1TD/y
	2uTT9Sb/Q9Bey4ALlxdV0u7CPuH2roSi9uJV6wyTXNObtCvUotZ/rAPfrtWC29M6pMoky+UqPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4KBkcgGnJ4WmNEyIe6/Sex/MtE2/eHGC1gnEeFeVNv37LV8P
	SYWYDyZ+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.463000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 65E4EFA4D77A700F841722AF069833F27A32DFF1784B1264732C08C8081823662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084210_681405_7C232EA2 
X-CRM114-Status: GOOD (  15.30  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

This patch adds support for thermal sensor device, including the
following features:
- Support to read current chip temperature.
- Support to set/get the trigger/restore temperature for thermal service.
- Support to read current chip tx cycle.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 88 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 42 +++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 02b47b299ea8..e2d08bf96eb0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -5,6 +5,8 @@
 
 #include <linux/etherdevice.h>
 #include <linux/of.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/thermal.h>
 #include "mt7996.h"
 #include "mac.h"
@@ -43,6 +45,82 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
+static ssize_t mt7996_thermal_temp_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct mt7996_phy *phy = dev_get_drvdata(dev);
+	int i = to_sensor_dev_attr(attr)->index;
+	int temperature;
+
+	switch (i) {
+	case 0:
+		temperature = mt7996_mcu_get_temperature(phy);
+		if (temperature < 0)
+			return temperature;
+		/* display in millidegree celcius */
+		return sprintf(buf, "%u\n", temperature * 1000);
+	case 1:
+	case 2:
+		return sprintf(buf, "%u\n",
+			       phy->throttle_temp[i - 1] * 1000);
+	case 3:
+		return sprintf(buf, "%hhu\n", phy->throttle_state);
+	default:
+		return -EINVAL;
+	}
+}
+
+static ssize_t mt7996_thermal_temp_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct mt7996_phy *phy = dev_get_drvdata(dev);
+	int ret, i = to_sensor_dev_attr(attr)->index;
+	long val;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&phy->dev->mt76.mutex);
+	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 40, 130);
+
+	/* add a safety margin ~10 */
+	if ((i - 1 == MT7996_CRIT_TEMP_IDX &&
+	     val > phy->throttle_temp[MT7996_MAX_TEMP_IDX] - 10) ||
+	    (i - 1 == MT7996_MAX_TEMP_IDX &&
+	     val - 10 < phy->throttle_temp[MT7996_CRIT_TEMP_IDX])) {
+		dev_err(phy->dev->mt76.dev,
+			"temp1_max shall be 10 degrees higher than temp1_crit.");
+		mutex_unlock(&phy->dev->mt76.mutex);
+		return -EINVAL;
+	}
+
+	phy->throttle_temp[i - 1] = val;
+	mutex_unlock(&phy->dev->mt76.mutex);
+
+	ret = mt7996_mcu_set_thermal_protect(phy, true);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, mt7996_thermal_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, mt7996_thermal_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, mt7996_thermal_temp, 2);
+static SENSOR_DEVICE_ATTR_RO(throttle1, mt7996_thermal_temp, 3);
+
+static struct attribute *mt7996_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_crit.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_throttle1.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mt7996_hwmon);
+
 static int
 mt7996_thermal_get_max_throttle_state(struct thermal_cooling_device *cdev,
 				      unsigned long *state)
@@ -113,6 +191,7 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 {
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 	struct thermal_cooling_device *cdev;
+	struct device *hwmon;
 	const char *name;
 
 	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7996_%s",
@@ -131,6 +210,15 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 	phy->throttle_temp[MT7996_CRIT_TEMP_IDX] = MT7996_CRIT_TEMP;
 	phy->throttle_temp[MT7996_MAX_TEMP_IDX] = MT7996_MAX_TEMP;
 
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
+						       mt7996_hwmon_groups);
+
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 34e83795c76b..61c0d4ff9653 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3602,6 +3602,48 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 	return 0;
 }
 
+int mt7996_mcu_get_temperature(struct mt7996_phy *phy)
+{
+#define TEMPERATURE_QUERY 0
+#define GET_TEMPERATURE 0
+	struct {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
+
+		u8 rsv1;
+		u8 action;
+		u8 band_idx;
+		u8 rsv2;
+	} req = {
+		.tag = cpu_to_le16(TEMPERATURE_QUERY),
+		.len = cpu_to_le16(sizeof(req) - 4),
+		.action = GET_TEMPERATURE,
+		.band_idx = phy->mt76->band_idx,
+	};
+	struct mt7996_mcu_thermal {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
+
+		__le32 rsv;
+		__le32 temperature;
+	} __packed * res;
+	struct sk_buff *skb;
+	int ret;
+
+	ret = mt76_mcu_send_and_get_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	res = (void *)skb->data;
+
+	return le32_to_cpu(res->temperature);
+}
+
 int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state)
 {
 	struct {
-- 
2.39.2


