Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C59C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F042067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJZHhYcH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DPFOgYFd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F042067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkNsg4IkB1sM5O4bJqd7uu9O14zmB626ChCPT9NMwHU=; b=nJZHhYcHgnQaec
	qfCZ5X47fpTZhQGrcd8Ygo4ehzFlyQ6B9OElJM0ViZCO+MTyduw4LQK5SOkXICM0s2FlJPwVU4Q2O
	qFv7AnlO2cUEjJvODixpznPZLcDXgvKZnlh0BJhyFLa3tI5C1StB+bRLQcFIw3I///wXJTx+3gKcL
	5NslgcpM8Ro+mLkDWA8yx9EffufJWSEhRDcjH/o/tcPqqkAeeZsoVpEMehoIbgFEIAaZz+OD3cMv9
	1VKCUTpGut+Bg9p7dnQYzrqtR3MFyom3ycsJAsLrGwqjqmK+iCVFJh+ZGL/9JFvw6Dlu2eT9fNXoU
	ibOZXnxBOaAx5zFIRH7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jknW0-0003nz-3m; Mon, 15 Jun 2020 11:43:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jknVx-0003nH-Kp; Mon, 15 Jun 2020 11:42:59 +0000
X-UUID: 7d37a53e68d94e6090d310970cddce4b-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7aICDX8o2NZ326Eya/h/Df7ktHWyErRzpNVBW1KeaMU=; 
 b=DPFOgYFduhQdNDDNTV0rlxKgHSX9KSv6bhzmMsFGDR9ELPY+/yOwFEuI+1OVP7gOnpS6ZkqFF64n4ADmBDNCQDTauNljf8XfgFFkES8Y6xNmdOhy55Xf1qpGSQqxNIiYexlpSW9fVr5I6OX/07TeAMdisaIURTUYygqPkJDLNn4=;
X-UUID: 7d37a53e68d94e6090d310970cddce4b-20200615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1654095912; Mon, 15 Jun 2020 03:42:55 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 04:42:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 19:42:50 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 19:42:51 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Yingjoe
 Chen" <yingjoe.chen@mediatek.com>, Pavel Machek <pavel@ucw.cz>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
Subject: [PATCH v1 2/3] drivers: input: misc: Add mtk vibrator driver
Date: Mon, 15 Jun 2020 19:42:04 +0800
Message-ID: <20200615114203.116656-3-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200615114203.116656-1-fengping.yu@mediatek.com>
References: <20200615114203.116656-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7F06F8960203863317031723F89ED8BE766DAE8E754B0CABD23D4FCC629C39BA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_044257_690082_AF6BD6C5 
X-CRM114-Status: GOOD (  16.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

This adds regulator vibrator driver for Mediatek SoCs.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 drivers/input/misc/Kconfig              |  10 +
 drivers/input/misc/Makefile             |   1 +
 drivers/input/misc/regulator-vibrator.c | 422 ++++++++++++++++++++++++
 3 files changed, 433 insertions(+)
 create mode 100644 drivers/input/misc/regulator-vibrator.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c..71a0dd7a5271 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -459,6 +459,16 @@ config INPUT_REGULATOR_HAPTIC
 	  To compile this driver as a module, choose M here: the
 	  module will be called regulator-haptic.
 
+config INPUT_REGULATOR_VIBRATOR
+	tristate "Regulator vibrator support"
+	depends on REGULATOR
+	help
+		This option enables device driver support vibrator by a regulator.
+		Say Y here if you want to enable this.
+
+		To compile this driver as a module, choose M here: the module will
+		be called regulator-vibrator.
+
 config INPUT_RETU_PWRBUTTON
 	tristate "Retu Power button Driver"
 	depends on MFD_RETU
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..3329e5f12ad7 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
 obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
+obj-$(CONFIG_INPUT_REGULATOR_VIBRATOR) += regulator-vibrator.o
 obj-$(CONFIG_INPUT_RETU_PWRBUTTON)	+= retu-pwrbutton.o
 obj-$(CONFIG_INPUT_AXP20X_PEK)		+= axp20x-pek.o
 obj-$(CONFIG_INPUT_GPIO_ROTARY_ENCODER)	+= rotary_encoder.o
diff --git a/drivers/input/misc/regulator-vibrator.c b/drivers/input/misc/regulator-vibrator.c
new file mode 100644
index 000000000000..03a0c71b55a4
--- /dev/null
+++ b/drivers/input/misc/regulator-vibrator.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/hrtimer.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+#define VIB_DEVICE "regulator_vibrator"
+
+#define DEFAULT_MIN_LIMIT 15
+
+struct reg_vibr_config {
+	unsigned int min_limit;
+	unsigned int max_limit;
+	unsigned int min_volt;
+	unsigned int max_volt;
+	struct regulator *reg;
+};
+
+struct reg_vibr {
+	struct input_dev *vibr_input_dev;
+	struct workqueue_struct *vibr_queue;
+	struct work_struct vibr_work;
+	struct hrtimer vibr_timer;
+	spinlock_t vibr_lock;	/* hrtimer lock */
+	unsigned int vibr_dur;
+	bool vibr_active;
+	bool vibr_state;
+	bool reg_status;
+	bool vibr_shutdown;
+	struct reg_vibr_config vibr_conf;
+	struct notifier_block oc_handle;
+};
+
+static int mt_vibra_parse_dt(struct device *dev,
+		struct reg_vibr_config *vibr_conf)
+{
+	int ret;
+
+	if (device_property_read_u32(dev, "min-limit",
+				     &vibr_conf->min_limit))
+		vibr_conf->min_limit = DEFAULT_MIN_LIMIT;
+	vibr_conf->min_limit = max_t(unsigned int,
+		vibr_conf->min_limit, DEFAULT_MIN_LIMIT);
+
+	if (device_property_read_u32(dev, "max-limit",
+				     &vibr_conf->max_limit))
+		vibr_conf->max_limit = 0;
+
+	if (!vibr_conf->max_limit &&
+		vibr_conf->max_limit < vibr_conf->min_limit) {
+		dev_err(dev, "error load dts: get error limitation(min > max)\n");
+		return -EINVAL;
+	}
+
+	vibr_conf->reg = devm_regulator_get(dev, "vib");
+	if (IS_ERR(vibr_conf->reg)) {
+		dev_err(dev, "error load dts: get regulator return %d\n",
+			PTR_ERR(vibr_conf->reg));
+		vibr_conf->reg = NULL;
+		return PTR_ERR(vibr_conf->reg);
+	}
+
+	if (device_property_read_u32(dev, "max-volt",
+				     &vibr_conf->max_volt)) {
+		dev_err(dev, "error load dts: get max-volt failed\n");
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(dev, "min-volt",
+				     &vibr_conf->min_volt)) {
+		dev_err(dev, "error load dts: get min-volt failed!\n");
+		return -EINVAL;
+	}
+
+	if (vibr_conf->min_volt > vibr_conf->max_volt) {
+		dev_err(dev, "error load dts: get error voltage(min > max)\n");
+		return -EINVAL;
+	}
+
+	dev_info(dev, "vibr_conf = %u, %u, %u-%u\n",
+		 vibr_conf->min_limit, vibr_conf->max_limit,
+		 vibr_conf->min_volt, vibr_conf->max_volt);
+
+	return ret;
+}
+
+static int vibr_power_set(struct reg_vibr *vibr)
+{
+	int ret;
+
+	ret = regulator_set_voltage(vibr->vibr_conf.reg,
+				    vibr->vibr_conf.min_volt,
+				    vibr->vibr_conf.max_volt);
+	if (ret < 0)
+		dev_err(&vibr->vibr_input_dev->dev,
+			"set voltage fail, ret = %d\n", ret);
+
+	return ret;
+}
+
+static void vibr_enable(struct reg_vibr *vibr)
+{
+	if (!vibr->reg_status) {
+		if (regulator_enable(vibr->vibr_conf.reg))
+			dev_err(&vibr->vibr_input_dev->dev, "set vibr_reg enable failed!\n");
+		else
+			vibr->reg_status = 1;
+	} else {
+		dev_info(&vibr->vibr_input_dev->dev, "vibr_reg already enabled.\n");
+	}
+}
+
+static void vibr_disable(struct reg_vibr *vibr)
+{
+	if (vibr->reg_status) {
+		if (regulator_disable(vibr->vibr_conf.reg))
+			dev_err(&vibr->vibr_input_dev->dev, "set vibr_reg disable failed!\n");
+		else
+			vibr->reg_status = 0;
+	} else {
+		dev_info(&vibr->vibr_input_dev->dev, "vibr_reg already disabled.\n");
+	}
+}
+
+static void update_vibrator(struct work_struct *work)
+{
+	struct reg_vibr *vibr = container_of(work, struct reg_vibr, vibr_work);
+
+	if (!vibr->vibr_state)
+		vibr_disable(vibr);
+	else
+		vibr_enable(vibr);
+}
+
+static void vibrator_enable(struct reg_vibr *vibr,
+			    unsigned int dur, unsigned int activate)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&vibr->vibr_lock, flags);
+	hrtimer_cancel(&vibr->vibr_timer);
+
+	if (!activate || vibr->vibr_shutdown || !dur) {
+		vibr->vibr_state = 0;
+	} else {
+		dur = max(vibr->vibr_conf.min_limit, dur);
+		if (vibr->vibr_conf.max_limit)
+			dur = min(dur, vibr->vibr_conf.max_limit);
+		vibr->vibr_state = 1;
+		hrtimer_start(&vibr->vibr_timer,
+			      ktime_set(dur / 1000, (dur % 1000) * 1000000),
+			      HRTIMER_MODE_REL);
+	}
+	spin_unlock_irqrestore(&vibr->vibr_lock, flags);
+	queue_work(vibr->vibr_queue, &vibr->vibr_work);
+}
+
+static enum hrtimer_restart vibrator_timer_func(struct hrtimer *timer)
+{
+	struct reg_vibr *vibr = container_of(timer,
+					     struct reg_vibr, vibr_timer);
+
+	vibr->vibr_state = 0;
+	queue_work(vibr->vibr_queue, &vibr->vibr_work);
+	return HRTIMER_NORESTART;
+}
+
+static const struct of_device_id vibr_of_ids[] = {
+	{ .compatible = "regulator-vibrator", },
+	{ /* sentienel */ }
+};
+
+static ssize_t activate_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct reg_vibr *vibr = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%d\n", vibr->vibr_active);
+}
+
+static ssize_t activate_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	unsigned int activate, duration;
+	ssize_t ret;
+	struct reg_vibr *vibr = dev_get_drvdata(dev->parent);
+
+	ret = kstrtouint(buf, 10, &activate);
+	if (ret) {
+		dev_err(dev, "set activate fail\n");
+		return ret;
+	}
+	duration = vibr->vibr_dur;
+	dev_info(dev, "set activate duration = %u, %u\n",
+		 activate, duration);
+	vibrator_enable(vibr, duration, activate);
+
+	ret = size;
+	return ret;
+}
+
+static ssize_t state_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct reg_vibr *vibr = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%d\n", vibr->vibr_state);
+}
+
+static ssize_t state_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	unsigned int state;
+	ssize_t ret;
+	struct reg_vibr *vibr = dev_get_drvdata(dev->parent);
+
+	ret = kstrtouint(buf, 10, &state);
+	if (ret) {
+		dev_err(dev, "set state fail\n");
+		return ret;
+	}
+
+	vibr->vibr_state = state;
+	ret = size;
+	return ret;
+}
+
+static ssize_t duration_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct reg_vibr *vibr = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%u\n", vibr->vibr_dur);
+}
+
+static ssize_t duration_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	unsigned int duration;
+	ssize_t ret;
+	struct reg_vibr *vibr;
+
+	ret = kstrtouint(buf, 10, &duration);
+	if (ret) {
+		dev_err(dev, "set duration fail!\n");
+		return ret;
+	}
+	vibr = dev_get_drvdata(dev->parent);
+	vibr->vibr_dur = duration;
+
+	dev_dbg(dev, "set activate duration = %u\n",
+		duration);
+
+	ret = size;
+	return ret;
+}
+
+static DEVICE_ATTR_RW(activate);
+static DEVICE_ATTR_RW(state);
+static DEVICE_ATTR_RW(duration);
+
+static struct attribute *sysfs_attrs[] = {
+	&dev_attr_activate.attr,
+	&dev_attr_state.attr,
+	&dev_attr_duration.attr,
+	NULL,
+};
+
+static struct attribute_group vibr_group = {
+	.attrs = sysfs_attrs,
+};
+
+static int regulator_oc_event(struct notifier_block *nb,
+			      unsigned long event, void *data)
+{
+	struct reg_vibr *vibr = container_of(nb, struct reg_vibr, oc_handle);
+
+	switch (event) {
+	case REGULATOR_EVENT_OVER_CURRENT:
+	case REGULATOR_EVENT_FAIL:
+		vibr_disable(vibr);
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int vib_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct reg_vibr *m_vibr;
+
+	m_vibr = devm_kzalloc(&pdev->dev, sizeof(struct reg_vibr), GFP_KERNEL);
+	if (!m_vibr)
+		return -ENOMEM;
+
+	m_vibr->vibr_input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!m_vibr->vibr_input_dev) {
+		dev_err(&pdev->dev, "failed to allocate input dev\n");
+		return -ENOMEM;
+	}
+
+	m_vibr->vibr_input_dev->name = VIB_DEVICE;
+	m_vibr->vibr_input_dev->id.bustype = BUS_HOST;
+	m_vibr->vibr_input_dev->dev.parent = &pdev->dev;
+
+	m_vibr->vibr_queue = create_singlethread_workqueue(VIB_DEVICE);
+	if (!m_vibr->vibr_queue) {
+		dev_err(&pdev->dev, "unable to create workqueue\n");
+		return -ENOMEM;
+	}
+
+	ret = mt_vibra_parse_dt(&pdev->dev, &m_vibr->vibr_conf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to parse devicetree(%d)\n", ret);
+		return ret;
+	}
+
+	INIT_WORK(&m_vibr->vibr_work, update_vibrator);
+	spin_lock_init(&m_vibr->vibr_lock);
+	m_vibr->vibr_shutdown = 0;
+	if (regulator_is_enabled(m_vibr->vibr_conf.reg))
+		m_vibr->reg_status = 1;
+	else
+		m_vibr->reg_status = 0;
+
+	hrtimer_init(&m_vibr->vibr_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	m_vibr->vibr_timer.function = vibrator_timer_func;
+
+	ret = input_register_device(m_vibr->vibr_input_dev);
+	if (ret < 0) {
+		dev_dbg(&pdev->dev, "couldn't register input device\n");
+		return ret;
+	}
+
+	/* register oc notification for this regulator */
+	m_vibr->oc_handle.notifier_call = regulator_oc_event;
+	ret = devm_regulator_register_notifier(m_vibr->vibr_conf.reg,
+					       &m_vibr->oc_handle);
+	if (ret)
+		dev_info(&pdev->dev, "regulator notifier request failed\n");
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &vibr_group);
+	if (ret)
+		dev_warn(&pdev->dev, "cannot allocate sysfs group for %s\n",
+			 VIB_DEVICE);
+
+	platform_set_drvdata(pdev, m_vibr);
+	ret = vibr_power_set(m_vibr);
+	if (ret < 0) {
+		dev_info(&pdev->dev, "set voltage for regulator fail\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vib_remove(struct platform_device *pdev)
+{
+	struct reg_vibr *vibr = platform_get_drvdata(pdev);
+
+	cancel_work_sync(&vibr->vibr_work);
+	hrtimer_cancel(&vibr->vibr_timer);
+
+	sysfs_remove_group(&pdev->dev.kobj, &vibr_group);
+
+	input_unregister_device(vibr->vibr_input_dev);
+
+	return 0;
+}
+
+static void vib_shutdown(struct platform_device *pdev)
+{
+	unsigned long flags;
+	struct reg_vibr *vibr = platform_get_drvdata(pdev);
+
+	spin_lock_irqsave(&vibr->vibr_lock, flags);
+	vibr->vibr_shutdown = 1;
+
+	if (vibr->vibr_state) {
+		vibr->vibr_state = 0;
+		spin_unlock_irqrestore(&vibr->vibr_lock, flags);
+		vibr_disable(vibr);
+	} else {
+		spin_unlock_irqrestore(&vibr->vibr_lock, flags);
+	}
+}
+
+static struct platform_driver vibrator_driver = {
+	.probe = vib_probe,
+	.remove = vib_remove,
+	.shutdown = vib_shutdown,
+	.driver = {
+		.name = VIB_DEVICE,
+		.of_match_table = vibr_of_ids,
+	},
+};
+module_platform_driver(vibrator_driver);
+
+MODULE_AUTHOR("Mediatek Corporation");
+MODULE_DESCRIPTION("Regulator Vibrator Driver (VIB)");
+MODULE_LICENSE("GPL");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
