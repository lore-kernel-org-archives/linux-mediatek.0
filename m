Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC9DC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:52:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7497E61241
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7497E61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9rh7I+X4HqQys5dHoOK5RvezlacmdpOYhHSv5eQ+RU=; b=mTEAyxsQlcYN5xFn3xUJMYT5hI
	JF55itlHtz9IKXoGL3BQ2le6hLfueiWk3x9nR6mVkC+6bBOgo1SEtpGLBNYiofaCLYTRB9cJtSNmq
	s+0pYL9tcykn2WJnCEefvQMprR/MwNjj215NdAAq00yZtgaAlnHAY1eA+TthPesYJG8CuSjkLhbYL
	zNthrZxuiB8eUdrELXpZIfKcgXidCg649WGMr2KPFjt9qvXFARg7mG5d981BaWyw8zWEmwBcQTttt
	Crk0dsx0QAIW7xUsp/x3V6lbymvXwH41VeZrtgWOvXCSz1l61ZpoxDX5PsXQlxqFtKcjGU89LSFEJ
	sHcLrUKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXrvj-006EdP-F2; Sat, 17 Apr 2021 20:52:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrvh-006Ecg-PU
 for linux-mediatek@desiato.infradead.org; Sat, 17 Apr 2021 20:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gXT7RrgdhyY4EPqGsMoX5r/og8qQ6coyLLuurY3O15o=; b=q+A3muUbPFPMDZpeZskg9836cH
 Bm8qldHTJd0yfO7palwbp5kPoEGQvUcs2rywny16REB4Mw4XqUY80KLj1I934Yvr90OXHJfwwP7A3
 cvPvvD6lkgJQouSBnqPEerojZqlKqJCC5nxU9EepNflCsTVbXNJB1z4yoWu9ey0WXBiURZ0pSz+pu
 G2vwaXPYHOBTuCAMKOOjtCBxiUPXJ/gV+/REri+X7TsRhKlqsxrG1LpVv1KxQ0ouwW/4sjm4edwaR
 9SEH0aBAF2fVSO+TPl+jpM7p4iC31LPeiHRWL3vn2rXed6PPdMOV3fqJbU1v8v8TM4bQmPEL9rWvu
 ds30sY/w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrvd-00ABHi-89
 for linux-mediatek@lists.infradead.org; Sat, 17 Apr 2021 20:52:35 +0000
X-UUID: 363158cce403405398508ded949430e2-20210417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gXT7RrgdhyY4EPqGsMoX5r/og8qQ6coyLLuurY3O15o=; 
 b=uxHsO+hia6P16up/L8NIzQwBdIqzA8HlQ0H/BEoOjDyIAnKC+fyrCIFYnuXyf7i7VEQ1z6+AswU28h1whtJ09AittYvRZNvwVNycXMf8ZTH0v0/chGTANXwIRtuZFOMUApawHGy1N2U6ECHnXfmmqknmfAOsNvP3wbRK4mqMlWA=;
X-UUID: 363158cce403405398508ded949430e2-20210417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 193671495; Sat, 17 Apr 2021 13:52:30 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 13:42:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 04:42:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 18 Apr 2021 04:42:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7915: add thermal sensor device support
Date: Sun, 18 Apr 2021 04:42:23 +0800
Message-ID: <b51d79d257e150a09d51029e3465e2ce925d6cfe.1618691395.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D59C00394B710C6E8C283C631551D662974E6C55E0B5C683F1D4B8843299E1E52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_135233_367950_50BBBE28 
X-CRM114-Status: GOOD (  14.93  )
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
temperature in the hardware and can be adaped to system monitoring tools.

For reading temperature, cat /sys/class/ieee80211/phy*/hwmon*/temp1_input

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 14 -----
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 56 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  7 ++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +-
 4 files changed, 61 insertions(+), 18 deletions(-)

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
index c13b932b0a44..cccb3df339de 100644
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
@@ -67,6 +69,52 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
+static ssize_t mt7915_thermal_show_temp(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct mt7915_phy *phy = dev_get_drvdata(dev);
+	int temperature;
+
+	mutex_lock(&phy->dev->mt76.mutex);
+	temperature = mt7915_mcu_get_temperature(phy);
+	mutex_unlock(&phy->dev->mt76.mutex);
+
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
+	/* TODO: add cooling device for throttling */
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
@@ -286,6 +334,10 @@ static int mt7915_register_ext_phy(struct mt7915_dev *dev)
 	if (ret)
 		goto error;
 
+	ret = mt7915_thermal_init(phy);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:
@@ -739,6 +791,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
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
