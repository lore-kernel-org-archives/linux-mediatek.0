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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B54C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7728D613B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7728D613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5LKQwqJNmhCFhFM2ylCGaVOjUOBirTv9b1+ne9WnDOo=; b=gnB5Nnjej63emZ3zThumNzxlp
	ACsa6UzmFWu1RpKLZaQ7wV8i4QH+oicDtCjcDXC8/kgWsu4QAOdjoVp5VHd7GK31bDHU/zIlpjDtC
	w3I3sVI8oCEaJ8YybsRRcyqruJT1sc3YZXFBHv9u9s9GLTRNi3Wp70sbyUxJOZ9W9YaO/A5vwri5K
	InWhFt/pTfQJxDJebYe7Ou6ccYX2jbUPnRqzXlDwmU842a7DUjbIv7PPzJw+qF56eupIXHYq+3qs9
	ZpTC+Rxq7xrKbstOSvUx8Acco28jbhogyLI/+UTMGghiQjD0X0NKcoO+E8RGC13e+mnQGw76SuM0Q
	KO3ZWDnUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZIsn-00F3yL-At; Wed, 21 Apr 2021 19:51:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIsi-00F3y5-Fu
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 19:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=vIboHF7j48+XXFI7KQ8Il+r75cuPgoT8vBXDzlz17hM=; b=UoAvTSUpHdieMwSHhBxvLLO9G3
 pEOZNX5BPQvw6pSlFZkR5z0poaHu3fMCnDbyFGaxwgEETs+mdF5E1RyW6dC+Ij1qh1Lmx0ej8dCBe
 sTEZVbB8S+11dNZt44qa1DHQ4i226sP96IkXZ0CxE4Ybhx+hlK8yB8MTwpPGj3lzRDDksUytvCnA+
 nCb1wsN3V2rEDuIsUYsvUpNJOtuLt2NVb07st0rin2te8O8d1OZZCzhNWDte+TcxvODa5rgvNxpNB
 c0EE7MRyWzxtI6in4jFn0JzPLqT1QBSgLlyi0iPXPkkGAG+yhYn2c4s3UUHBbxzzvB47eQ0Qbz+G7
 lsymOwGg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIse-00D9Mx-O4
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 19:51:26 +0000
X-UUID: a0fd754659094e99b75bdd44d4b48858-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vIboHF7j48+XXFI7KQ8Il+r75cuPgoT8vBXDzlz17hM=; 
 b=M1oQ41zz1ogdfev6bdNDln+8IcyMWKj4I4yNWTg+U4Lm9x0QGyk5dY5KBifIoCUbPM+i4DvOWaGG3Bcb9feobRoLULkH426ESE5S576ab4bpPpEO19w6DpB6VFYvqGJyftVlzN/tsJdKVr0kynm09CYQgKZ/8o9cCelOnrUfzKg=;
X-UUID: a0fd754659094e99b75bdd44d4b48858-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1235942270; Wed, 21 Apr 2021 12:51:20 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 12:51:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 03:51:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Apr 2021 03:51:16 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 3/3] mt76: mt7615: add thermal sensor device support
Date: Thu, 22 Apr 2021 03:51:11 +0800
Message-ID: <8e7057e048669d634b270fdd71a1de7527a5edb6.1619026557.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202e3d430a232592c1194d4fdec1adb1b3703588.1619026557.git.ryder.lee@mediatek.com>
References: <202e3d430a232592c1194d4fdec1adb1b3703588.1619026557.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE777033FFC9BFF4D25E7F87C019A949BAC5EAABBB7740D87AFD516711FCF4DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_125124_817646_7D864265 
X-CRM114-Status: GOOD (  16.86  )
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

Similar to mt7915, switching to use standard hwmon sysfs.
For reading temperature, cat /sys/class/ieee80211/phy*/hwmon*/temp1_input

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2 - fix build error
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 20 --------
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 50 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  6 +--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  3 +-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  |  4 ++
 5 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 1b414220521a..96b75f316071 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -291,24 +291,6 @@ mt7615_radio_read(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int mt7615_read_temperature(struct seq_file *s, void *data)
-{
-	struct mt7615_dev *dev = dev_get_drvdata(s->private);
-	int temp;
-
-	if (!mt7615_wait_for_mcu_init(dev))
-		return 0;
-
-	/* cpu */
-	mt7615_mutex_acquire(dev);
-	temp = mt7615_mcu_get_temperature(dev, 0);
-	mt7615_mutex_release(dev);
-
-	seq_printf(s, "Temperature: %d\n", temp);
-
-	return 0;
-}
-
 static int
 mt7615_queues_acq(struct seq_file *s, void *data)
 {
@@ -536,8 +518,6 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 
 	debugfs_create_file("reset_test", 0200, dir, dev,
 			    &fops_reset_test);
-	debugfs_create_devm_seqfile(dev->mt76.dev, "temperature", dir,
-				    mt7615_read_temperature);
 	debugfs_create_file("ext_mac_addr", 0600, dir, dev, &fops_ext_mac_addr);
 
 	debugfs_create_u32("rf_wfidx", 0600, dir, &dev->debugfs_rf_wf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index d84662fb0304..515933d239ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -8,11 +8,61 @@
  */
 
 #include <linux/etherdevice.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include "mt7615.h"
 #include "mac.h"
 #include "mcu.h"
 #include "eeprom.h"
 
+static ssize_t mt7615_thermal_show_temp(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct mt7615_dev *mdev = dev_get_drvdata(dev);
+	int temperature;
+
+	if (!mt7615_wait_for_mcu_init(mdev))
+		return 0;
+
+	mt7615_mutex_acquire(mdev);
+	temperature = mt7615_mcu_get_temperature(mdev);
+	mt7615_mutex_release(mdev);
+
+	if (temperature < 0)
+		return temperature;
+
+	/* display in millidegree celcius */
+	return sprintf(buf, "%u\n", temperature * 1000);
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, mt7615_thermal_show_temp,
+			  NULL, 0);
+
+static struct attribute *mt7615_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mt7615_hwmon);
+
+int mt7615_thermal_init(struct mt7615_dev *dev)
+{
+	struct wiphy *wiphy = mt76_hw(dev)->wiphy;
+	struct device *hwmon;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
+						       wiphy_name(wiphy), dev,
+						       mt7615_hwmon_groups);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7615_thermal_init);
+
 static void
 mt7615_phy_init(struct mt7615_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index be976fe97290..67af2e2d4779 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2301,14 +2301,12 @@ int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd)
 	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), true);
 }
 
-int mt7615_mcu_get_temperature(struct mt7615_dev *dev, int index)
+int mt7615_mcu_get_temperature(struct mt7615_dev *dev)
 {
 	struct {
 		u8 action;
 		u8 rsv[3];
-	} req = {
-		.action = index,
-	};
+	} req = {};
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_GET_TEMP, &req,
 				 sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 6a50338ec9f5..68c844527f65 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -359,6 +359,7 @@ static inline int mt7622_wmac_init(struct mt7615_dev *dev)
 }
 #endif
 
+int mt7615_thermal_init(struct mt7615_dev *dev);
 int mt7615_mmio_probe(struct device *pdev, void __iomem *mem_base,
 		      int irq, const u32 *map);
 u32 mt7615_reg_map(struct mt7615_dev *dev, u32 addr);
@@ -497,7 +498,7 @@ u32 mt7615_rf_rr(struct mt7615_dev *dev, u32 wf, u32 reg);
 int mt7615_rf_wr(struct mt7615_dev *dev, u32 wf, u32 reg, u32 val);
 int mt7615_mcu_set_dbdc(struct mt7615_dev *dev);
 int mt7615_mcu_set_eeprom(struct mt7615_dev *dev);
-int mt7615_mcu_get_temperature(struct mt7615_dev *dev, int index);
+int mt7615_mcu_get_temperature(struct mt7615_dev *dev);
 int mt7615_mcu_set_tx_power(struct mt7615_phy *phy);
 void mt7615_mcu_exit(struct mt7615_dev *dev);
 void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 49540b00519d..10bd2c2bbf1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -153,6 +153,10 @@ int mt7615_register_device(struct mt7615_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7615_thermal_init(dev);
+	if (ret)
+		return ret;
+
 	ieee80211_queue_work(mt76_hw(dev), &dev->mcu_work);
 	mt7615_init_txpower(dev, &dev->mphy.sband_2g.sband);
 	mt7615_init_txpower(dev, &dev->mphy.sband_5g.sband);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
