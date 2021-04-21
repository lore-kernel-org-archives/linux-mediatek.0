Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8CDC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1AAB60FDB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1AAB60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8QBpkNuupZyEK+nxg9Dmw0EFHbRCM8hFgMgaMK/9Ai4=; b=FYa0db3t0w+NDkJu2NZsQqzMYP
	mYAzG27g7BQsOcjmsfdVOu4DTzgHHEpwXPmhPSNZ0P8y05/AbyB73p5Z3sj8FwzGyuCsbjS54joR+
	ouSOFjIfEUIgLhuWsNBbLw4vCKdJiAVCSMbl3r0908vIbqLJ93HpwwwdAEe5LlYTiX+JbhJ0mHi1j
	g40ih3X245FXbs2YJBbPCfVEMFZd5fY+uJHQuM6Y9OOqsvbQLbMq/j1BOQUIj7vUnP9rcO+vgYq0/
	KAeF99JYrVsRfWBp0UhtL32JCyq8FqHuf6i89/7kmbrWWpWpPtrHYVwEGcEz6/KuwQ1gHQ9XnV5D0
	V5mcZtjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZIss-00F3z8-2f; Wed, 21 Apr 2021 19:51:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIsq-00F3yh-40
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 19:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YGgZpX16VK4bUK7RC3pxK9vS2/VvLB3bj9Vi9p99/4o=; b=qPdVFAUd8a498fjVb7PiQyWsBL
 u5n5I/Qm9hnHpD1IAK1nfwzwvRfLzbmYINC0uCPBlUv6piK//+zbCqNSUwPBMYEYHLcvOI0dqX3qr
 p1qv2iIsiddIgh232ffOrPODLYbkJgfxn1o+/jowieowvYUh2j/eQtn0d1qjNbjs+sf+izfqEN7z8
 87LLX3El9BVKNJm0CbkrnO4HcWC8c6GJmnWl/pmRFtnQyj6NPKTefaKu5+3IXQxiHNCh0lT2VBtIs
 BQZCwXULmyHuOYetOR3Hxldrt5o/RdGgkdvAkTHdh+yRnI+HJh3BxWCy+SgcAoqewISb3PGJzvUWh
 A5vCf5Lw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIsn-00D9Ng-Br
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 19:51:34 +0000
X-UUID: 5df753833dae45a59031ba1e323882e3-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YGgZpX16VK4bUK7RC3pxK9vS2/VvLB3bj9Vi9p99/4o=; 
 b=d//oN0jGeEGdNm6i4Z2Dk2WuPGCdxUs7BgVwf7ONFnPtJRiqgIHaMSae0itFJXRQIT0Lo09H4Sm5XMHYvA390JYKT/yXO2J7xRhXrRvceKrUlq2JzW9t/6/cPTf99ywlRxXoEEgKxRK+7UD/fFgF5BobZzY+grRopNd9DTfPbsY=;
X-UUID: 5df753833dae45a59031ba1e323882e3-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1139578221; Wed, 21 Apr 2021 12:51:29 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 12:51:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 03:51:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Apr 2021 03:51:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/3] mt76: mt7915: add thermal sensor device support
Date: Thu, 22 Apr 2021 03:51:09 +0800
Message-ID: <202e3d430a232592c1194d4fdec1adb1b3703588.1619026557.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7A69F6808C339900A98BA6546E360855D96943017DB73CABB90E574A75BA58582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_125133_433730_3820604A 
X-CRM114-Status: GOOD (  15.12  )
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

This provides userspace with a unified interface, hwmon sysfs, to monitor
temperature in the hardware and can be adapted to system monitoring tools.

For reading temperature, cat /sys/class/ieee80211/phy*/hwmon*/temp1_input

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2 - drop mutex
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 14 -----
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  7 +--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +-
 4 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 6a8ddeeecbe9..f1e8b076d54c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -224,18 +224,6 @@ mt7915_tx_stats_show(struct seq_file *file, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(mt7915_tx_stats);
 
-static int mt7915_read_temperature(struct seq_file *s, void *data)
-{
-	struct mt7915_dev *dev = dev_get_drvdata(s->private);
-	int temp;
-
-	/* cpu */
-	temp = mt7915_mcu_get_temperature(dev, 0);
-	seq_printf(s, "Temperature: %d\n", temp);
-
-	return 0;
-}
-
 static int
 mt7915_queues_acq(struct seq_file *s, void *data)
 {
@@ -390,8 +378,6 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	debugfs_create_file("radar_trigger", 0200, dir, dev,
 			    &fops_radar_trigger);
 	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
-	debugfs_create_devm_seqfile(dev->mt76.dev, "temperature", dir,
-				    mt7915_read_temperature);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "txpower_sku", dir,
 				    mt7915_read_rate_txpower);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c13b932b0a44..b1c4dbad837c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -2,6 +2,8 @@
 /* Copyright (C) 2020 MediaTek Inc. */
 
 #include <linux/etherdevice.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include "mt7915.h"
 #include "mac.h"
 #include "mcu.h"
@@ -67,6 +69,47 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
+static ssize_t mt7915_thermal_show_temp(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct mt7915_phy *phy = dev_get_drvdata(dev);
+	int temperature;
+
+	temperature = mt7915_mcu_get_temperature(phy);
+	if (temperature < 0)
+		return temperature;
+
+	/* display in millidegree celcius */
+	return sprintf(buf, "%u\n", temperature * 1000);
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, mt7915_thermal_show_temp,
+			  NULL, 0);
+
+static struct attribute *mt7915_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mt7915_hwmon);
+
+static int mt7915_thermal_init(struct mt7915_phy *phy)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	struct device *hwmon;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
+						       wiphy_name(wiphy), phy,
+						       mt7915_hwmon_groups);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	return 0;
+}
+
 static void
 mt7915_init_txpower(struct mt7915_dev *dev,
 		    struct ieee80211_supported_band *sband)
@@ -286,6 +329,10 @@ static int mt7915_register_ext_phy(struct mt7915_dev *dev)
 	if (ret)
 		goto error;
 
+	ret = mt7915_thermal_init(phy);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:
@@ -739,6 +786,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7915_thermal_init(&dev->phy);
+	if (ret)
+		return ret;
+
 	ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
 
 	ret = mt7915_register_ext_phy(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 559ad230eabe..17a617df6dba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3469,16 +3469,17 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 	return 0;
 }
 
-int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
+int mt7915_mcu_get_temperature(struct mt7915_phy *phy)
 {
+	struct mt7915_dev *dev = phy->dev;
 	struct {
 		u8 ctrl_id;
 		u8 action;
-		u8 band;
+		u8 dbdc_idx;
 		u8 rsv[5];
 	} req = {
 		.ctrl_id = THERMAL_SENSOR_TEMP_QUERY,
-		.action = index,
+		.dbdc_idx = phy != &dev->phy,
 	};
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_CTRL), &req,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 80eb35231a1a..d5296e2d481b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -357,7 +357,7 @@ int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
 int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
 int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
-int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
+int mt7915_mcu_get_temperature(struct mt7915_phy *phy);
 int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
