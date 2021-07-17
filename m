Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09828C636CA
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 00:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C687E613EB
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 00:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C687E613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1X/dn/ZrNsA2atPe+q7RRhwcma8fiSjWx3iwwBiF1aM=; b=x4AhRbhmjg12cY
	zrgLUpTX7M4+8iPJHQvpAg3PFOMdBj/rxChIp6Lr5sfEX6KTt5bsPZfPZx9Oan7wXlcsr4Pz2S5mj
	/r91G0SuewxBGXDy0ERR0MbPEKDzj3wncZAlZyOwEbQdBW+qvQfUyYH14dXIMBebIsGfLJyICy4Vz
	hR92JeSmcpgvCR1ET85YeC1FPgIHUG+yl0d/lXvqn8RXVXLf5FpiBmejzEcCID1aHJ/K/o8hbY6o3
	cwcKfLZgK0lijpF929QkSVIdnmHq0mXyZiCK/0rzoqmJ3QaW57n3SNj6OqXc/2QKz2+ZQZmrY84N+
	zLmfKG+0uCAg0j/uY2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4YCD-005hwl-BR; Sat, 17 Jul 2021 00:28:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4YC9-005hvt-69
 for linux-mediatek@lists.infradead.org; Sat, 17 Jul 2021 00:28:44 +0000
X-UUID: e5a26021acc4449080d80484c443f812-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3WNVbSH77r95+4QBsg5woPy5wJFWLDSgw+0Ljw+88U0=; 
 b=fF1N1pcN4EhjIxDD7Xw2tbvTJUrCZyo/bwJauq2sM/0OckjMAtuMxL7BhVd4gZvWnw4DuPyTPptAdm9x7kofif7AB5KPrmVgYO/aVFCvumdV135VJn/5IdaoOObYuRN2mfvajUjpzMs6Liwn86J/Gdu+fFP3a8TqHOHAV6DYx9o=;
X-UUID: e5a26021acc4449080d80484c443f812-20210716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2100405457; Fri, 16 Jul 2021 17:28:31 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 17:18:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 08:18:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 08:18:27 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: add control knobs for thermal throttling
Date: Sat, 17 Jul 2021 08:18:25 +0800
Message-ID: <af157fa64bb37eb9bb44036f7888a0f3a5ddcb1c.1626480942.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_172841_592382_A5DB374C 
X-CRM114-Status: GOOD (  15.64  )
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

With this patch, users can set the trigger/restore temperature for
thermal service according to their use cases.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 40 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 17 +++-----
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index eb4c4991d020..77c7486d6a5c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -42,13 +42,17 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
-static ssize_t mt7915_thermal_show_temp(struct device *dev,
+static ssize_t mt7915_thermal_temp_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
 	struct mt7915_phy *phy = dev_get_drvdata(dev);
+	int i = to_sensor_dev_attr(attr)->index;
 	int temperature;
 
+	if (i)
+		return sprintf(buf, "%u\n", phy->throttle_temp[i - 1] * 1000);
+
 	temperature = mt7915_mcu_get_temperature(phy);
 	if (temperature < 0)
 		return temperature;
@@ -57,11 +61,34 @@ static ssize_t mt7915_thermal_show_temp(struct device *dev,
 	return sprintf(buf, "%u\n", temperature * 1000);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, 0444, mt7915_thermal_show_temp,
-			  NULL, 0);
+static ssize_t mt7915_thermal_temp_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct mt7915_phy *phy = dev_get_drvdata(dev);
+	int ret, i = to_sensor_dev_attr(attr)->index;
+	long val;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&phy->dev->mt76.mutex);
+	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 60, 130);
+	phy->throttle_temp[i - 1] = val;
+	mutex_unlock(&phy->dev->mt76.mutex);
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, mt7915_thermal_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, mt7915_thermal_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, mt7915_thermal_temp, 2);
 
 static struct attribute *mt7915_hwmon_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_crit.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(mt7915_hwmon);
@@ -96,6 +123,9 @@ mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	if (state > MT7915_THERMAL_THROTTLE_MAX)
 		return -EINVAL;
 
+	if (phy->throttle_temp[0] > phy->throttle_temp[1])
+		return 0;
+
 	if (state == phy->throttle_state)
 		return 0;
 
@@ -150,6 +180,10 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
+	/* initialize critical/maximum high temperature */
+	phy->throttle_temp[0] = 110;
+	phy->throttle_temp[1] = 120;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8d646aa3d084..cb3f833181d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3544,10 +3544,6 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	};
 	int level;
 
-#define TRIGGER_TEMPERATURE	122
-#define RESTORE_TEMPERATURE	116
-#define SUSTAIN_PERIOD		10
-
 	if (!state) {
 		req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
 		goto out;
@@ -3560,7 +3556,7 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 		req.ctrl.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG;
 		req.ctrl.duty.duty_level = level;
 		req.ctrl.duty.duty_cycle = state;
-		state = state * 4 / 5;
+		state /= 2;
 
 		ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
 					&req, sizeof(req.ctrl), false);
@@ -3568,15 +3564,12 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 			return ret;
 	}
 
-	/* currently use fixed values for throttling, and would be better
-	 * to implement thermal zone for dynamic trip in the long run.
-	 */
-
 	/* set high-temperature trigger threshold */
 	req.ctrl.ctrl_id = THERMAL_PROTECT_ENABLE;
-	req.trigger_temp = cpu_to_le32(TRIGGER_TEMPERATURE);
-	req.restore_temp = cpu_to_le32(RESTORE_TEMPERATURE);
-	req.sustain_time = cpu_to_le16(SUSTAIN_PERIOD);
+	/* add a safety margin ~10 */
+	req.restore_temp = cpu_to_le32(phy->throttle_temp[0] - 10);
+	req.trigger_temp = cpu_to_le32(phy->throttle_temp[1]);
+	req.sustain_time = cpu_to_le16(10);
 
 out:
 	req.ctrl.type.protect_type = 1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 33be449309e0..7f3482c59603 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -123,6 +123,7 @@ struct mt7915_phy {
 
 	struct thermal_cooling_device *cdev;
 	u8 throttle_state;
+	u32 throttle_temp[2]; /* 0: critical high, 1: maximum */
 
 	u32 rxfilter;
 	u64 omac_mask;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
