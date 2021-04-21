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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2930C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC49613B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC49613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0agsEjhojQszTHSpNGNM/IgZCxB0A4o1H4/X7E2SN5E=; b=A3Jt0mbDUDwB2ShD5nbGm6q09
	1YLAakfqubbraaaT810Fo5wygEeyWfcSHExIjLBzQ51vpB+AYCk2bD1REssDmjMPPREgjfqla751v
	0pS1BiWnnIy7tZsd8gcymvkAs7QCKXmFUszyqyqSX4wHTibMOE85NBctMv0QOL5xKVtdyYUiDZdMO
	ZoMpkEtaPZc+8SzhyI82bb55HZOpmhp3oLUHNIDa7uViuRpGKc/4Q4sP6ICFo0Oo0QyxcOXPU1DU8
	W3JAwwfmF4eK53nvDOJYIyiz5E0uTn+Dwpk5owtpZR0IwcLCWpY6P3qYiLMqeDeIPvFhgDz5AC746
	q3gCcyEoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZIsx-00F3zr-9y; Wed, 21 Apr 2021 19:51:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIsr-00F3yq-0U
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 19:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Gd8Aj2G+F4VJjIsbjqWHS+M9ubXr9Thgqgdc8Srv1VU=; b=rTetnh1fySy3JWY0ZRNrGhZEw7
 qUkIddEeOFfEjT5aOAcHmBRt+y/S0mGAjjSPQI/n8UEv7mUN26Fz4tk4ZNpZsZdQbFa946Lj/koPo
 gZZjMHcyh03slF4O8ADIrjpd+FlYTIZ6kpciFBlwhS55sNXydwWSfWFo/l27oToFdQZZpLv+dg5Pc
 Sj3OrMgGDl52tFNmqryUUVGUYR4WMEzjhia1XvcjDDUubu1/Gv0qLOYj6CBJZMSfApsWdNsES5u7s
 NrEahVyRdm/bBKHQ8zTXLuIWdZMytEl+FKkFACMQJSjfbxRqdLiS6Xc3DrmaoD31J3e+dsFaOtdli
 R3zGC4KQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIso-00D9Nz-1V
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 19:51:35 +0000
X-UUID: 57bf2349c88b4dd09e3cdf51ebe77249-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Gd8Aj2G+F4VJjIsbjqWHS+M9ubXr9Thgqgdc8Srv1VU=; 
 b=VC8BNfvVTTAtgnCo9tuLYSXCi8+v1LzR3tPRK5zqiZa1MOIyRShsCkTEhm/lm8Tlv6UEVpfHL9SvFye3M+Ruuq2Vlx0zVAGE63WwJEjXAD12sD2TsVGqx4QR6xPiYRvJvSJd58yIXCcmPYw7NhbQ4MtBMLqGa3vj+5uuHjCc+bU=;
X-UUID: 57bf2349c88b4dd09e3cdf51ebe77249-20210421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 277389854; Wed, 21 Apr 2021 12:51:31 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 12:51:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 03:51:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Apr 2021 03:51:15 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/3] mt76: mt7915: add thermal cooling device support
Date: Thu, 22 Apr 2021 03:51:10 +0800
Message-ID: <da2052fb3e2a93f20b3781305e38a8f24598455f.1619026557.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202e3d430a232592c1194d4fdec1adb1b3703588.1619026557.git.ryder.lee@mediatek.com>
References: <202e3d430a232592c1194d4fdec1adb1b3703588.1619026557.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_125134_116365_51888958 
X-CRM114-Status: GOOD (  22.86  )
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

Thermal cooling device support is added to control the temperature by
throttling the data transmission for the given duration. Throttling is
done by adjusting Tx period by given percentage of time. The thermal
device allows user to configure duty cycle.

Throttling can be disabled by setting the duty cycle to 0. The cooling
device can be found under /sys/class/thermal/cooling_deviceX/.
Corresponding soft link to this device can be found under phy folder

To set duty cycle as 80%,
echo 80 > /sys/class/ieee80211/phy*/cooling_device/cur_state

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 83 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 71 ++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 12 +++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  6 ++
 4 files changed, 170 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index b1c4dbad837c..2a8a904d7246 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -4,6 +4,7 @@
 #include <linux/etherdevice.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/thermal.h>
 #include "mt7915.h"
 #include "mac.h"
 #include "mcu.h"
@@ -93,10 +94,80 @@ static struct attribute *mt7915_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(mt7915_hwmon);
 
+static int
+mt7915_thermal_get_max_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
+{
+	*state = MT7915_THERMAL_THROTTLE_MAX;
+
+	return 0;
+}
+
+static int
+mt7915_thermal_get_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
+{
+	struct mt7915_phy *phy = cdev->devdata;
+
+	*state = phy->throttle_state;
+
+	return 0;
+}
+
+static int
+mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long state)
+{
+	struct mt7915_phy *phy = cdev->devdata;
+	int ret;
+
+	if (state > MT7915_THERMAL_THROTTLE_MAX)
+		return -EINVAL;
+
+	if (state == phy->throttle_state)
+		return 0;
+
+	ret = mt7915_mcu_set_thermal_throttling(phy, state);
+	if (ret)
+		return ret;
+
+	phy->throttle_state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops mt7915_thermal_ops = {
+	.get_max_state = mt7915_thermal_get_max_throttle_state,
+	.get_cur_state = mt7915_thermal_get_cur_throttle_state,
+	.set_cur_state = mt7915_thermal_set_cur_throttle_state,
+};
+
+static void mt7915_unregister_thermal(struct mt7915_phy *phy)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+
+	sysfs_remove_link(&wiphy->dev.kobj, "cooling_device");
+	thermal_cooling_device_unregister(phy->cdev);
+}
+
 static int mt7915_thermal_init(struct mt7915_phy *phy)
 {
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	struct thermal_cooling_device *cdev;
 	struct device *hwmon;
+	int ret = 0;
+
+	cdev = thermal_cooling_device_register(wiphy_name(wiphy), phy,
+					       &mt7915_thermal_ops);
+	if (IS_ERR(cdev))
+		return PTR_ERR(cdev);
+
+	ret = sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
+				"cooling_device");
+	if (ret)
+		goto err;
+
+	phy->cdev = cdev;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
@@ -104,10 +175,16 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
 						       wiphy_name(wiphy), phy,
 						       mt7915_hwmon_groups);
-	if (IS_ERR(hwmon))
-		return PTR_ERR(hwmon);
+	if (IS_ERR(hwmon)) {
+		ret = PTR_ERR(hwmon);
+		goto err;
+	}
 
 	return 0;
+
+err:
+	mt7915_unregister_thermal(phy);
+	return ret;
 }
 
 static void
@@ -740,6 +817,7 @@ static void mt7915_unregister_ext_phy(struct mt7915_dev *dev)
 	if (!phy)
 		return;
 
+	mt7915_unregister_thermal(phy);
 	mt76_unregister_phy(mphy);
 	ieee80211_free_hw(mphy->hw);
 }
@@ -802,6 +880,7 @@ int mt7915_register_device(struct mt7915_dev *dev)
 void mt7915_unregister_device(struct mt7915_dev *dev)
 {
 	mt7915_unregister_ext_phy(dev);
+	mt7915_unregister_thermal(&dev->phy);
 	mt76_unregister_device(&dev->mt76);
 	mt7915_mcu_exit(dev);
 	mt7915_tx_token_put(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 17a617df6dba..e4306acea505 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3486,6 +3486,77 @@ int mt7915_mcu_get_temperature(struct mt7915_phy *phy)
 				 sizeof(req), true);
 }
 
+int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		struct req_ctrl {
+			u8 ctrl_id;
+			u8 dbdc_idx;
+			union {
+				struct {
+					u8 protect_type; /* 1: duty admit, 2: radio off */
+					u8 trigger_type; /* 0: low, 1: high */
+				} __packed type;
+				struct {
+					u8 duty_level;	/* level 0~3 */
+					u8 duty_cycle;
+				} __packed duty;
+			};
+		} __packed ctrl;
+		__le32 trigger_temp;
+		__le32 restore_temp;
+		__le16 sustain_time;
+		u8 rsv[2];
+	} __packed req = {
+		.ctrl = {
+			.dbdc_idx = phy != &dev->phy,
+		},
+	};
+	int level;
+
+#define TRIGGER_TEMPERATURE	122
+#define RESTORE_TEMPERATURE	116
+#define SUSTAIN_PERIOD		10
+
+	if (!state) {
+		req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
+		goto out;
+	}
+
+	/* set duty cycle and level */
+	for (level = 0; level < 4; level++) {
+		int ret;
+
+		req.ctrl.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG;
+		req.ctrl.duty.duty_level = level;
+		req.ctrl.duty.duty_cycle = state;
+		state = state * 4 / 5;
+
+		ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
+					&req, sizeof(struct req_ctrl), false);
+		if (ret)
+			return ret;
+	}
+
+	/* currently use fixed values for throttling, and would be better
+	 * to implement thermal zone for dynamic trip in the long run.
+	 */
+
+	/* set high-temperature trigger threshold */
+	req.ctrl.ctrl_id = THERMAL_PROTECT_ENABLE;
+	req.trigger_temp = cpu_to_le32(TRIGGER_TEMPERATURE);
+	req.restore_temp = cpu_to_le32(RESTORE_TEMPERATURE);
+	req.sustain_time = cpu_to_le16(SUSTAIN_PERIOD);
+
+out:
+	req.ctrl.type.protect_type = 1;
+	req.ctrl.type.trigger_type = 1;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
+				 &req, sizeof(req), false);
+}
+
 int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 42582a66e42d..6377c1b16a42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -262,6 +262,7 @@ enum {
 	MCU_EXT_CMD_FW_LOG_2_HOST = 0x13,
 	MCU_EXT_CMD_TXBF_ACTION = 0x1e,
 	MCU_EXT_CMD_EFUSE_BUFFER_MODE = 0x21,
+	MCU_EXT_CMD_THERMAL_PROT = 0x23,
 	MCU_EXT_CMD_STA_REC_UPDATE = 0x25,
 	MCU_EXT_CMD_BSS_INFO_UPDATE = 0x26,
 	MCU_EXT_CMD_EDCA_UPDATE = 0x27,
@@ -1066,6 +1067,17 @@ enum {
 	THERMAL_SENSOR_TASK_CTRL,
 };
 
+enum {
+	THERMAL_PROTECT_PARAMETER_CTRL,
+	THERMAL_PROTECT_BASIC_INFO,
+	THERMAL_PROTECT_ENABLE,
+	THERMAL_PROTECT_DISABLE,
+	THERMAL_PROTECT_DUTY_CONFIG,
+	THERMAL_PROTECT_MECH_INFO,
+	THERMAL_PROTECT_DUTY_INFO,
+	THERMAL_PROTECT_STATE_ACT,
+};
+
 enum {
 	MT_EBF = BIT(0),	/* explicit beamforming */
 	MT_IBF = BIT(1)		/* implicit beamforming */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index d5296e2d481b..43e3d977cdb2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -39,6 +39,8 @@
 #define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
 #define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
+#define MT7915_THERMAL_THROTTLE_MAX	100
+
 struct mt7915_vif;
 struct mt7915_sta;
 struct mt7915_dfs_pulse;
@@ -127,6 +129,9 @@ struct mt7915_phy {
 
 	struct ieee80211_vif *monitor_vif;
 
+	struct thermal_cooling_device *cdev;
+	u8 throttle_state;
+
 	u32 rxfilter;
 	u64 omac_mask;
 
@@ -358,6 +363,7 @@ int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
 int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
 int mt7915_mcu_get_temperature(struct mt7915_phy *phy);
+int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state);
 int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
