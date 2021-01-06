Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B35C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BE7205F4
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 12:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BE7205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/qUN5P/UFZdnTjtwpSKkpjaWT4cUWc0T9fgpB9FX0q8=; b=malTZ1ZH6xk7N4j20AR6E9vrG
	O85of1ZCOTCe5yErTiSlQnnud6BR6msIAXa9NWZWjnLot1ZklG4YaLPSte5SEF7BEsfsSX7h9ajoz
	mhGOmgNqPOLYVFzr6n5YrLJwly1UsiMyf+6wFJdLLCwNWpUKyxMF3ArnJylp3fNSsKaCw0haGQ2sX
	t21fkAF3lk2ijiut2bPQfKEG7dRBBfW+Fzicaigpl6UJn1dy7Ye9t4xBVOLA51TvzmoMVu0c2+eph
	9n6HpR17uyjwZTtQunaPCis2yVpQp3moho/Ztmy73TCDjTS+RDNX4KHLJlj1xkKQrHUS4X26HLJIq
	M7MKyyAXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx7qj-0006Wy-NV; Wed, 06 Jan 2021 12:23:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx7qc-0006Ub-B9; Wed, 06 Jan 2021 12:23:34 +0000
X-UUID: 3a66c8b86e294190852d9bdd3bc4eedf-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ImypHT1VCNLKpqMF7WeiKp6SV68VmgXvJuZUg6ehwZc=; 
 b=BMsOIOYnxdpfcntO6l+3HQyzP136DIwBS+hYAkME7OGIZ9SB8MBbXBn93uFe6Taqq/9AMUwrGdToSCFjE5jWu/a2HekVfJKt35C9HZkApkiXRpWhwB/NxTcSk9+oSzSEfNtr/eU5ddotVAlaUoC03LvxcSxD2rWGTI9/07x+Smc=;
X-UUID: 3a66c8b86e294190852d9bdd3bc4eedf-20210106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1298720681; Wed, 06 Jan 2021 04:21:18 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 04:19:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 20:19:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Jan 2021 20:19:11 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt6359: add MT6359 accdet driver
Date: Wed, 6 Jan 2021 20:19:06 +0800
Message-ID: <1609935546-11722-3-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: ADB79D830827389D88FB39CE9A0F133E18D0523AA10894E4BBA6C4C1BEBE1D952000:8
X-MTK: N
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
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Argus
 Lin <argus.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "Shane.Chien" <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT6359 audio codec support accessory detect features, adds MT6359
accdet driver to support plug detection and key detection.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 sound/soc/codecs/Kconfig         |    7 +
 sound/soc/codecs/Makefile        |    2 +
 sound/soc/codecs/mt6359-accdet.c | 1951 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6359-accdet.h |  136 +++
 sound/soc/codecs/mt6359.h        | 1863 +++++++++++++++++++++++++++++++++---
 5 files changed, 3853 insertions(+), 106 deletions(-)
 create mode 100644 sound/soc/codecs/mt6359-accdet.c
 create mode 100644 sound/soc/codecs/mt6359-accdet.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba4eb54..dbf3141 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1774,6 +1774,13 @@ config SND_SOC_MT6359
 	help
 	  Enable support for the platform which uses MT6359 as
 	  external codec device.
+config SND_SOC_MT6359_ACCDET
+	tristate "MediaTek MT6359 ACCDET driver"
+	depends on MTK_PMIC_WRAP
+	help
+	  ACCDET means Accessory Detection technology, MediaTek develop it
+	  for ASoC codec soc-jack detection mechanism.
+	  Select N if you don't have jack on board.

 config SND_SOC_MT6660
 	tristate "Mediatek MT6660 Speaker Amplifier"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d277f03..f77d057 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -133,6 +133,7 @@ snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
 snd-soc-mt6359-objs := mt6359.o
+snd-soc-mt6359-accdet-objs := mt6359-accdet.o
 snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8315-objs := nau8315.o
 snd-soc-nau8540-objs := nau8540.o
@@ -448,6 +449,7 @@ obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
+obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
new file mode 100644
index 0000000..ff90e4e
--- /dev/null
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -0,0 +1,1951 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Argus Lin <argus.lin@mediatek.com>
+ */
+
+#include <linux/of_gpio.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/input.h>
+#include <linux/kthread.h>
+#include <linux/io.h>
+#include <linux/sched/clock.h>
+#include <linux/workqueue.h>
+#include <linux/timer.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/irq.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include <linux/mfd/mt6397/core.h>
+#include "mt6359-accdet.h"
+#include "mt6359.h"
+/* grobal variable definitions */
+#define REGISTER_VAL(x)	((x) - 1)
+#define HAS_CAP(_c, _x)	\
+	({typeof(_c)c = (_c); \
+	typeof(_x)x = (_x); \
+	(((c) & (x)) == (x)); })
+#define ACCDET_PMIC_EINT_IRQ		BIT(0)
+#define ACCDET_AP_GPIO_EINT		BIT(1)
+
+#define ACCDET_PMIC_EINT0		BIT(2)
+#define ACCDET_PMIC_EINT1		BIT(3)
+#define ACCDET_PMIC_BI_EINT		BIT(4)
+
+#define ACCDET_PMIC_GPIO_TRIG_EINT	BIT(5)
+#define ACCDET_PMIC_INVERTER_TRIG_EINT	BIT(6)
+#define ACCDET_PMIC_RSV_EINT		BIT(7)
+
+#define ACCDET_THREE_KEY		BIT(8)
+#define ACCDET_FOUR_KEY			BIT(9)
+#define ACCDET_TRI_KEY_CDD		BIT(10)
+#define ACCDET_RSV_KEY			BIT(11)
+
+#define ACCDET_ANALOG_FASTDISCHARGE	BIT(12)
+#define ACCDET_DIGITAL_FASTDISCHARGE	BIT(13)
+#define ACCDET_AD_FASTDISCHRAGE		BIT(14)
+
+#define RET_LT_5K			(-1)
+#define RET_GT_5K			(0)
+
+/* Used to let accdet know if the pin has been fully plugged-in */
+#define EINT_PLUG_OUT			(0)
+#define EINT_PLUG_IN			(1)
+
+struct mt63xx_accdet_data {
+	struct snd_soc_jack jack;
+	struct platform_device *pdev;
+	struct device *dev;
+	struct accdet_priv *data;
+	atomic_t init_once;
+	struct regmap *regmap;
+	int accdet_irq;
+	int accdet_eint0;
+	int accdet_eint1;
+	struct wakeup_source *wake_lock;
+	struct wakeup_source *timer_lock;
+	struct mutex res_lock; /* lock to protect flag */
+	bool eint_sync_flag;
+	/* accdet FSM State & lock*/
+	unsigned int cur_eint_state;
+	unsigned int eint0_state;
+	unsigned int eint1_state;
+	unsigned int accdet_status;
+	unsigned int cable_type;
+	unsigned int cur_key;
+	unsigned int cali_voltage;
+	int auxadc_offset;
+	unsigned int eint_id;
+	/* when caps include ACCDET_AP_GPIO_EINT */
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pins_eint;
+	unsigned int gpiopin;
+	unsigned int gpio_hp_deb;
+	unsigned int gpioirq;
+	unsigned int accdet_eint_type;
+	/* when MICBIAS_DISABLE_TIMER timeout, queue work: dis_micbias_work */
+	struct work_struct delay_init_work;
+	struct workqueue_struct *delay_init_workqueue;
+	struct work_struct dis_micbias_work;
+	struct workqueue_struct *dis_micbias_workqueue;
+	struct work_struct accdet_work;
+	struct workqueue_struct *accdet_workqueue;
+	/* when eint issued, queue work: eint_work */
+	struct work_struct eint_work;
+	struct workqueue_struct *eint_workqueue;
+};
+
+static struct mt63xx_accdet_data *accdet;
+
+static struct head_dts_data accdet_dts;
+struct pwm_deb_settings *cust_pwm_deb;
+
+struct accdet_priv {
+	unsigned int caps;
+};
+
+static struct accdet_priv mt6359_accdet[] = {
+	{
+		.caps = 0,
+	},
+};
+
+const struct of_device_id mt6359_accdet_of_match[] = {
+	{
+		.compatible = "mediatek,mt6359-accdet",
+		.data = &mt6359_accdet,
+	}, {
+		/* sentinel */
+	},
+};
+
+static struct platform_driver mt6359_accdet_driver;
+static const struct snd_soc_component_driver mt6359_accdet_soc_driver;
+
+#define ACCDET_INIT_WAIT_TIMER (10 * HZ)
+static struct timer_list accdet_init_timer;
+static void delay_init_timerhandler(struct timer_list *t);
+/* micbias_timer: disable micbias if no accdet irq after eint,
+ * timeout: 6 seconds
+ * timerHandler: dis_micbias_timerhandler()
+ */
+#define MICBIAS_DISABLE_TIMER (6 * HZ)
+static struct timer_list micbias_timer;
+static void dis_micbias_timerhandler(struct timer_list *t);
+
+static unsigned int button_press_debounce = 0x400;
+static unsigned int button_press_debounce_01 = 0x800;
+
+/* local function declaration */
+static void accdet_init_once(void);
+static inline void accdet_init(void);
+static void accdet_init_debounce(void);
+static unsigned int adjust_eint_analog_setting(void);
+static unsigned int adjust_eint_setting(unsigned int eintsts);
+static void config_digital_init_by_mode(void);
+static void config_eint_init_by_mode(void);
+static unsigned int get_triggered_eint(void);
+static void recover_eint_analog_setting(void);
+static void recover_eint_digital_setting(void);
+static void recover_eint_setting(unsigned int eintsts);
+static void send_status_event(unsigned int cable_type, unsigned int status);
+static void accdet_set_debounce(int state, unsigned int debounce);
+
+/* global function declaration */
+
+static u64 mt6359_accdet_get_current_time(void)
+{
+	return sched_clock();
+}
+
+static bool mt6359_accdet_timeout_ns(u64 start_time_ns, u64 timeout_time_ns)
+{
+	u64 cur_time = 0;
+	u64 elapse_time = 0;
+
+	/* get current tick, ns */
+	cur_time = mt6359_accdet_get_current_time();
+	if (cur_time < start_time_ns) {
+		start_time_ns = cur_time;
+		/* 400us */
+		timeout_time_ns = 400 * 1000;
+	}
+	elapse_time = cur_time - start_time_ns;
+
+	/* check if timeout */
+	if (timeout_time_ns <= elapse_time)
+		return false;
+
+	return true;
+}
+
+static unsigned int check_key(unsigned int v)
+{
+	if (HAS_CAP(accdet->data->caps, ACCDET_FOUR_KEY)) {
+		if (v < accdet_dts.four_key.down && v >= accdet_dts.four_key.up)
+			return DW_KEY;
+		if (v < accdet_dts.four_key.up && v >= accdet_dts.four_key.voice)
+			return UP_KEY;
+		if (v < accdet_dts.four_key.voice && v >= accdet_dts.four_key.mid)
+			return AS_KEY;
+		if (v < accdet_dts.four_key.mid)
+			return MD_KEY;
+	} else {
+		if (v < accdet_dts.three_key.down && v >= accdet_dts.three_key.up)
+			return DW_KEY;
+		if (v < accdet_dts.three_key.up && v >= accdet_dts.three_key.mid)
+			return UP_KEY;
+		if (v < accdet_dts.three_key.mid)
+			return MD_KEY;
+	}
+	return NO_KEY;
+}
+
+static void send_key_event(unsigned int keycode, unsigned int flag)
+{
+	int report = 0;
+
+	switch (keycode) {
+	case DW_KEY:
+		if (flag != 0)
+			report = SND_JACK_BTN_1;
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_BTN_1);
+		break;
+	case UP_KEY:
+		if (flag != 0)
+			report = SND_JACK_BTN_2;
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_BTN_2);
+		break;
+	case MD_KEY:
+		if (flag != 0)
+			report = SND_JACK_BTN_0;
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_BTN_0);
+		break;
+	case AS_KEY:
+		if (flag != 0)
+			report = SND_JACK_BTN_3;
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_BTN_3);
+		break;
+	}
+}
+
+static void send_status_event(unsigned int cable_type, unsigned int status)
+{
+	int report = 0;
+
+	switch (cable_type) {
+	case HEADSET_NO_MIC:
+		if (status)
+			report = SND_JACK_HEADPHONE;
+		else
+			report = 0;
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_HEADPHONE);
+		/* when plug 4-pole out, if both AB=3 AB=0 happen,3-pole plug
+		 * in will be incorrectly reported, then 3-pole plug-out is
+		 * reported,if no mantory 4-pole plug-out, icon would be
+		 * visible.
+		 */
+		if (status == 0) {
+			report = 0;
+			snd_soc_jack_report(&accdet->jack, report, SND_JACK_MICROPHONE);
+		}
+		pr_info("accdet HEADPHONE(3-pole) %s\n",
+			status ? "PlugIn" : "PlugOut");
+		break;
+	case HEADSET_MIC:
+		/* when plug 4-pole out, 3-pole plug out should also be
+		 * reported for slow plug-in case
+		 */
+		if (status == 0) {
+			report = 0;
+			snd_soc_jack_report(&accdet->jack, report, SND_JACK_HEADPHONE);
+		}
+		if (status)
+			report = SND_JACK_MICROPHONE;
+		else
+			report = 0;
+
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_MICROPHONE);
+		pr_info("accdet MICROPHONE(4-pole) %s\n",
+			status ? "PlugIn" : "PlugOut");
+		/* when press key for a long time then plug in
+		 * even recoginized as 4-pole
+		 * disable micbias timer still timeout after 6s
+		 * it check AB=00(because keep to press key) then disable
+		 * micbias, it will cause key no response
+		 */
+		del_timer_sync(&micbias_timer);
+		break;
+	case LINE_OUT_DEVICE:
+		if (status)
+			report = SND_JACK_LINEOUT;
+		else
+			report = 0;
+
+		snd_soc_jack_report(&accdet->jack, report, SND_JACK_LINEOUT);
+		pr_info("accdet LineOut %s\n",
+			status ? "PlugIn" : "PlugOut");
+		break;
+	default:
+		pr_info("%s Invalid cableType\n", __func__);
+	}
+}
+
+static void multi_key_detection(unsigned int cur_AB)
+{
+	if (cur_AB == ACCDET_STATE_AB_00)
+		accdet->cur_key = check_key(accdet->cali_voltage);
+
+	/* delay to wait eint been flaged in register.
+	 * or eint handler issued. accdet->cur_eint_state == PLUG_OUT
+	 */
+	usleep_range(10000, 12000);
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_AP_GPIO_EINT)) {
+		if (accdet->cur_eint_state == EINT_PLUG_IN)
+			send_key_event(accdet->cur_key, !cur_AB);
+		else
+			accdet->cur_key = NO_KEY;
+	} else {
+		bool irq_bit = false;
+		unsigned int val = 0;
+
+		regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &val);
+		irq_bit = !(val & ACCDET_EINT_IRQ_B2_B3);
+		/* send key when:
+		 * no eint is flaged in reg, and now eint PLUG_IN
+		 */
+		if (irq_bit && accdet->cur_eint_state == EINT_PLUG_IN)
+			send_key_event(accdet->cur_key, !cur_AB);
+		else
+			accdet->cur_key = NO_KEY;
+	}
+
+	if (cur_AB)
+		accdet->cur_key = NO_KEY;
+}
+
+static inline void clear_accdet_int(void)
+{
+	/* it is safe by using polling to adjust when to clear IRQ_CLR_BIT */
+	regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+			   BIT(ACCDET_IRQ_CLR_SFT), BIT(ACCDET_IRQ_CLR_SFT));
+}
+
+static inline void clear_accdet_int_check(void)
+{
+	u64 cur_time = mt6359_accdet_get_current_time();
+	unsigned int val = 0;
+
+	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &val);
+	while (val & ACCDET_IRQ_MASK_SFT &&
+	       mt6359_accdet_timeout_ns(cur_time, ACCDET_TIME_OUT))
+		;
+	/* clear accdet int, modify  for fix interrupt trigger twice error */
+	regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+			   BIT(ACCDET_IRQ_CLR_SFT), 0);
+	regmap_update_bits(accdet->regmap, RG_INT_STATUS_ACCDET_ADDR,
+			   BIT(RG_INT_STATUS_ACCDET_SFT),
+			   BIT(RG_INT_STATUS_ACCDET_SFT));
+}
+
+static inline void clear_accdet_eint(unsigned int eintid)
+{
+	if ((eintid & PMIC_EINT0) == PMIC_EINT0) {
+		regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+				   BIT(ACCDET_EINT0_IRQ_CLR_SFT),
+				   BIT(ACCDET_EINT0_IRQ_CLR_SFT));
+	}
+	if ((eintid & PMIC_EINT1) == PMIC_EINT1) {
+		regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+				   BIT(ACCDET_EINT1_IRQ_CLR_SFT),
+				   BIT(ACCDET_EINT1_IRQ_CLR_SFT));
+	}
+}
+
+static inline void clear_accdet_eint_check(unsigned int eintid)
+{
+	u64 cur_time = mt6359_accdet_get_current_time();
+	unsigned int val = 0;
+
+	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &val);
+
+	if ((eintid & PMIC_EINT0) == PMIC_EINT0) {
+		while (val & ACCDET_EINT0_IRQ_MASK_SFT &&
+		       mt6359_accdet_timeout_ns(cur_time, ACCDET_TIME_OUT))
+			;
+		regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+				   BIT(ACCDET_EINT0_IRQ_CLR_SFT), 0);
+		regmap_update_bits(accdet->regmap,
+				   RG_INT_STATUS_ACCDET_ADDR,
+				   BIT(RG_INT_STATUS_ACCDET_EINT0_SFT),
+				   BIT(RG_INT_STATUS_ACCDET_EINT0_SFT));
+	}
+	if ((eintid & PMIC_EINT1) == PMIC_EINT1) {
+		while (val & ACCDET_EINT1_IRQ_MASK_SFT &&
+		       mt6359_accdet_timeout_ns(cur_time, ACCDET_TIME_OUT))
+			;
+		regmap_update_bits(accdet->regmap, ACCDET_IRQ_ADDR,
+				   BIT(ACCDET_EINT1_IRQ_CLR_SFT), 0);
+		regmap_update_bits(accdet->regmap,
+				   RG_INT_STATUS_ACCDET_ADDR,
+				   BIT(RG_INT_STATUS_ACCDET_EINT1_SFT),
+				   BIT(RG_INT_STATUS_ACCDET_EINT1_SFT));
+	}
+}
+
+static unsigned int adjust_eint_analog_setting(void)
+{
+	if (accdet_dts.eint_detect_mode == 0x3 ||
+	    accdet_dts.eint_detect_mode == 0x4) {
+		/* ESD switches off */
+		regmap_update_bits(accdet->regmap,
+				   RG_ACCDETSPARE_ADDR, 1 << 8, 0);
+	}
+	if (accdet_dts.eint_detect_mode == 0x4) {
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			/* enable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   BIT(RG_EINT0CONFIGACCDET_SFT),
+					   BIT(RG_EINT0CONFIGACCDET_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			/* enable RG_EINT1CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   BIT(RG_EINT1CONFIGACCDET_SFT),
+					   BIT(RG_EINT1CONFIGACCDET_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			/* enable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   BIT(RG_EINT0CONFIGACCDET_SFT),
+					   BIT(RG_EINT0CONFIGACCDET_SFT));
+			/* enable RG_EINT1CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   BIT(RG_EINT1CONFIGACCDET_SFT),
+					   BIT(RG_EINT1CONFIGACCDET_SFT));
+		}
+		if (accdet_dts.eint_use_ext_res == 0x3 ||
+		    accdet_dts.eint_use_ext_res == 0x4) {
+			/*select 500k, use internal resistor */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT0HIRENB_ADDR,
+					   BIT(RG_EINT0HIRENB_SFT),
+					   BIT(RG_EINT0HIRENB_SFT));
+		}
+	}
+	return 0;
+}
+
+static unsigned int adjust_eint_digital_setting(void)
+{
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		/* disable inverter */
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT), 0);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		/* disable inverter */
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT), 0);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		/* disable inverter */
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT), 0);
+		/* disable inverter */
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT), 0);
+	}
+
+	if (accdet_dts.eint_detect_mode == 0x4) {
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			/* set DA stable signal */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT), 0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			/* set DA stable signal */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT), 0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			/* set DA stable signal */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT), 0);
+			/* set DA stable signal */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT), 0);
+		}
+	}
+	return 0;
+}
+
+static unsigned int adjust_eint_setting(unsigned int eintsts)
+{
+	if (eintsts == M_PLUG_IN) {
+		/* adjust digital setting */
+		adjust_eint_digital_setting();
+		/* adjust analog setting */
+		adjust_eint_analog_setting();
+	} else if (eintsts == M_PLUG_OUT) {
+		/* set debounce to 1ms */
+		accdet_set_debounce(eint_state000,
+				    accdet_dts.pwm_deb.eint_debounce0);
+	} else {
+		pr_debug("should not be here %s()\n", __func__);
+	}
+
+	return 0;
+}
+
+static void recover_eint_analog_setting(void)
+{
+	if (accdet_dts.eint_detect_mode == 0x3 ||
+	    accdet_dts.eint_detect_mode == 0x4) {
+		/* ESD switches on */
+		regmap_update_bits(accdet->regmap, RG_ACCDETSPARE_ADDR,
+				   1 << 8, 1 << 8);
+	}
+	if (accdet_dts.eint_detect_mode == 0x4) {
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			/* disable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   BIT(RG_EINT0CONFIGACCDET_SFT), 0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			/* disable RG_EINT1CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   BIT(RG_EINT1CONFIGACCDET_SFT), 0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			/* disable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   BIT(RG_EINT0CONFIGACCDET_SFT), 0);
+			/* disable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(accdet->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   BIT(RG_EINT1CONFIGACCDET_SFT), 0);
+		}
+		regmap_update_bits(accdet->regmap, RG_EINT0HIRENB_ADDR,
+				   BIT(RG_EINT0HIRENB_SFT), 0);
+	}
+}
+
+static void recover_eint_digital_setting(void)
+{
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT0_M_SW_EN_ADDR,
+				   BIT(ACCDET_EINT0_M_SW_EN_SFT), 0);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT1_M_SW_EN_ADDR,
+				   BIT(ACCDET_EINT1_M_SW_EN_SFT), 0);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT0_M_SW_EN_ADDR,
+				   BIT(ACCDET_EINT0_M_SW_EN_SFT), 0);
+		regmap_update_bits(accdet->regmap,
+				   ACCDET_EINT1_M_SW_EN_ADDR,
+				   BIT(ACCDET_EINT1_M_SW_EN_SFT), 0);
+	}
+	if (accdet_dts.eint_detect_mode == 0x4) {
+		/* enable eint0cen */
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			/* enable eint0cen */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT),
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			/* enable eint1cen */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT),
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			/* enable eint0cen */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT),
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+			/* enable eint1cen */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT),
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
+		}
+	}
+
+	if (accdet_dts.eint_detect_mode != 0x1) {
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			/* enable inverter */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			/* enable inverter */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			/* enable inverter */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+			/* enable inverter */
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		}
+	}
+}
+
+static void recover_eint_setting(unsigned int eintsts)
+{
+	if (eintsts == M_PLUG_OUT) {
+		recover_eint_analog_setting();
+		recover_eint_digital_setting();
+	}
+}
+
+static unsigned int get_triggered_eint(void)
+{
+	unsigned int eint_ID = NO_PMIC_EINT;
+	unsigned int irq_status = 0;
+
+	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &irq_status);
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		if ((irq_status & ACCDET_EINT0_IRQ_MASK_SFT) ==
+				ACCDET_EINT0_IRQ_MASK_SFT)
+			eint_ID = PMIC_EINT0;
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		if ((irq_status & ACCDET_EINT1_IRQ_MASK_SFT) ==
+				ACCDET_EINT1_IRQ_MASK_SFT)
+			eint_ID = PMIC_EINT1;
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		if ((irq_status & ACCDET_EINT0_IRQ_MASK_SFT) ==
+				ACCDET_EINT0_IRQ_MASK_SFT)
+			eint_ID |= PMIC_EINT0;
+		if ((irq_status & ACCDET_EINT1_IRQ_MASK_SFT) ==
+				ACCDET_EINT1_IRQ_MASK_SFT)
+			eint_ID |= PMIC_EINT1;
+	}
+	return eint_ID;
+}
+
+static inline void enable_accdet(unsigned int state_swctrl)
+{
+	/* enable ACCDET unit */
+	regmap_update_bits(accdet->regmap, ACCDET_SW_EN_ADDR,
+			   BIT(ACCDET_SW_EN_SFT), BIT(ACCDET_SW_EN_SFT));
+}
+
+static inline void disable_accdet(void)
+{
+	clear_accdet_int();
+	usleep_range(200, 300);
+	mutex_lock(&accdet->res_lock);
+	clear_accdet_int_check();
+	mutex_unlock(&accdet->res_lock);
+
+	/* recover accdet debounce0,3 */
+	accdet_set_debounce(accdet_state000, cust_pwm_deb->debounce0);
+	accdet_set_debounce(accdet_state001, cust_pwm_deb->debounce1);
+	accdet_set_debounce(accdet_state011, cust_pwm_deb->debounce3);
+}
+
+static inline void headset_plug_out(void)
+{
+	send_status_event(accdet->cable_type, 0);
+	accdet->accdet_status = PLUG_OUT;
+	accdet->cable_type = NO_DEVICE;
+
+	if (accdet->cur_key != 0) {
+		send_key_event(accdet->cur_key, 0);
+		accdet->cur_key = 0;
+	}
+	pr_info("accdet %s, set cable_type = NO_DEVICE\n", __func__);
+}
+
+static void dis_micbias_timerhandler(struct timer_list *t)
+{
+	int ret = 0;
+
+	ret = queue_work(accdet->dis_micbias_workqueue,
+			 &accdet->dis_micbias_work);
+	if (!ret)
+		pr_notice("Error: %s (%d)\n", __func__, ret);
+}
+
+static void dis_micbias_work_callback(struct work_struct *work)
+{
+	unsigned int cur_AB = 0, eint = 0;
+	unsigned int val = 0;
+
+	/* check EINT0 status, if plug out,
+	 * not need to disable accdet here
+	 */
+	regmap_read(accdet->regmap, ACCDET_EINT0_MEM_IN_ADDR, &val);
+	eint = ((val >> ACCDET_EINT0_MEM_IN_SFT) & ACCDET_EINT0_MEM_IN_MASK);
+	if (eint == M_PLUG_OUT) {
+		pr_notice("%s Plug-out, no need disable micbias\n", __func__);
+		return;
+	}
+
+	regmap_read(accdet->regmap, ACCDET_MEM_IN_ADDR, &val);
+	cur_AB = (val >> ACCDET_STATE_MEM_IN_OFFSET) & ACCDET_STATE_AB_MASK;
+
+	/* if 3pole disable accdet
+	 * if <20k + 4pole, disable accdet will disable accdet
+	 * plug out interrupt. The behavior will same as 3pole
+	 */
+	if (accdet->cable_type == HEADSET_NO_MIC ||
+	    cur_AB == ACCDET_STATE_AB_00 ||
+	    cur_AB == ACCDET_STATE_AB_11) {
+		regmap_update_bits(accdet->regmap, ACCDET_SW_EN_ADDR,
+				   BIT(ACCDET_SW_EN_SFT), 0);
+		disable_accdet();
+	}
+}
+
+static void eint_work_callback(struct work_struct *work)
+{
+	if (accdet->cur_eint_state == EINT_PLUG_IN) {
+		/* disable vusb LP */
+		regmap_write(accdet->regmap, RG_LDO_VUSB_HW0_OP_EN_ADDR, 0x8000);
+
+		mutex_lock(&accdet->res_lock);
+		accdet->eint_sync_flag = true;
+		mutex_unlock(&accdet->res_lock);
+		__pm_wakeup_event(accdet->timer_lock,
+				  jiffies_to_msecs(7 * HZ));
+
+		accdet_init();
+
+		enable_accdet(0);
+	} else {
+		mutex_lock(&accdet->res_lock);
+		accdet->eint_sync_flag = false;
+		mutex_unlock(&accdet->res_lock);
+		del_timer_sync(&micbias_timer);
+
+		regmap_update_bits(accdet->regmap, ACCDET_SW_EN_ADDR,
+				   BIT(ACCDET_SW_EN_SFT), 0);
+		disable_accdet();
+		headset_plug_out();
+	}
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT_IRQ))
+		recover_eint_setting(accdet->eint_id);
+	else if (HAS_CAP(accdet->data->caps, ACCDET_AP_GPIO_EINT))
+		enable_irq(accdet->gpioirq);
+}
+
+static void accdet_set_debounce(int state, unsigned int debounce)
+{
+	switch (state) {
+	case accdet_state000:
+		/* set ACCDET debounce value = debounce/32 ms */
+		regmap_write(accdet->regmap, ACCDET_DEBOUNCE0_ADDR, debounce);
+		break;
+	case accdet_state001:
+		regmap_write(accdet->regmap, ACCDET_DEBOUNCE1_ADDR, debounce);
+		break;
+	case accdet_state010:
+		regmap_write(accdet->regmap, ACCDET_DEBOUNCE2_ADDR, debounce);
+		break;
+	case accdet_state011:
+		regmap_write(accdet->regmap, ACCDET_DEBOUNCE3_ADDR, debounce);
+		break;
+	case accdet_auxadc:
+		/* set auxadc debounce:0x42(2ms) */
+		regmap_write(accdet->regmap,
+			     ACCDET_CONNECT_AUXADC_TIME_DIG_ADDR, debounce);
+		break;
+	case eint_state000:
+		regmap_update_bits(accdet->regmap, ACCDET_EINT_DEBOUNCE0_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE0_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE0_SFT);
+		break;
+	case eint_state001:
+		regmap_update_bits(accdet->regmap, ACCDET_EINT_DEBOUNCE1_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE1_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE1_SFT);
+		break;
+	case eint_state010:
+		regmap_update_bits(accdet->regmap, ACCDET_EINT_DEBOUNCE2_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE2_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE2_SFT);
+		break;
+	case eint_state011:
+		regmap_update_bits(accdet->regmap, ACCDET_EINT_DEBOUNCE3_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE3_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE3_SFT);
+		break;
+	case eint_inverter_state000:
+		regmap_write(accdet->regmap, ACCDET_EINT_INVERTER_DEBOUNCE_ADDR,
+			     debounce);
+		break;
+	default:
+		pr_notice("Error: %s error state (%d)\n", __func__, state);
+		break;
+	}
+}
+
+static inline void check_cable_type(void)
+{
+	unsigned int cur_AB = 0;
+	unsigned int val = 0;
+
+	regmap_read(accdet->regmap, ACCDET_MEM_IN_ADDR, &val);
+
+	cur_AB = (val >> ACCDET_STATE_MEM_IN_OFFSET) & ACCDET_STATE_AB_MASK;
+
+	switch (accdet->accdet_status) {
+	case PLUG_OUT:
+		if (cur_AB == ACCDET_STATE_AB_00) {
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag) {
+				accdet->cable_type = HEADSET_NO_MIC;
+				accdet->accdet_status = HOOK_SWITCH;
+			} else {
+				pr_notice("accdet hp has been plug-out\n");
+			}
+			mutex_unlock(&accdet->res_lock);
+			/* for IOT HP */
+			accdet_set_debounce(eint_state011,
+					    accdet_dts.pwm_deb.eint_debounce3);
+		} else if (cur_AB == ACCDET_STATE_AB_01) {
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag) {
+				accdet->accdet_status = MIC_BIAS;
+				accdet->cable_type = HEADSET_MIC;
+			} else {
+				pr_notice("accdet hp has been plug-out\n");
+			}
+			mutex_unlock(&accdet->res_lock);
+			/* adjust hook switch debounce time
+			 * for fast key press condition, avoid to miss key
+			 */
+			accdet_set_debounce(accdet_state000,
+					    button_press_debounce);
+
+			/* adjust debounce1 to original 0x800(64ms),
+			 * to fix miss key issue when fast press double key.
+			 */
+			accdet_set_debounce(accdet_state001,
+					    button_press_debounce_01);
+			accdet_set_debounce(eint_state011, 0x1);
+		} else if (cur_AB == ACCDET_STATE_AB_11) {
+			/* accdet PLUG_OUT state not change */
+			if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT_IRQ)) {
+				mutex_lock(&accdet->res_lock);
+				if (accdet->eint_sync_flag) {
+					accdet->accdet_status = PLUG_OUT;
+					accdet->cable_type = NO_DEVICE;
+				} else {
+					pr_notice("accdet hp been plug-out\n");
+				}
+				mutex_unlock(&accdet->res_lock);
+			}
+		} else {
+			pr_notice("accdet %s Invalid AB.\n", __func__);
+		}
+		break;
+	case MIC_BIAS:
+		if (cur_AB == ACCDET_STATE_AB_00) {
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag) {
+				accdet->accdet_status = HOOK_SWITCH;
+				multi_key_detection(cur_AB);
+			} else {
+				pr_notice("accdet hp has been plug-out\n");
+			}
+			mutex_unlock(&accdet->res_lock);
+		} else if (cur_AB == ACCDET_STATE_AB_01) {
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag) {
+				accdet->accdet_status = MIC_BIAS;
+				accdet->cable_type = HEADSET_MIC;
+				/* accdet MIC_BIAS state not change */
+			} else {
+				pr_notice("accdet hp has been plug-out\n");
+			}
+			mutex_unlock(&accdet->res_lock);
+			accdet_set_debounce(eint_state011, 0x1);
+		} else if (cur_AB == ACCDET_STATE_AB_11) {
+			/* accdet Don't send plug out in MIC_BIAS */
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag)
+				accdet->accdet_status = PLUG_OUT;
+			else
+				pr_notice("accdet hp has been plug-out\n");
+			mutex_unlock(&accdet->res_lock);
+		} else {
+			pr_notice("accdet %s Invalid AB.\n", __func__);
+		}
+		break;
+	case HOOK_SWITCH:
+		if (cur_AB == ACCDET_STATE_AB_00) {
+		} else if (cur_AB == ACCDET_STATE_AB_01) {
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag) {
+				multi_key_detection(cur_AB);
+				accdet->accdet_status = MIC_BIAS;
+				accdet->cable_type = HEADSET_MIC;
+			} else {
+				pr_notice("accdet hp has been plug-out\n");
+			}
+			mutex_unlock(&accdet->res_lock);
+
+			/* adjust debounce0 and debounce1 to fix miss key issue.
+			 */
+			accdet_set_debounce(accdet_state000,
+					    button_press_debounce);
+			accdet_set_debounce(accdet_state001,
+					    button_press_debounce_01);
+			/* for IOT HP */
+			accdet_set_debounce(eint_state011, 0x1);
+		} else if (cur_AB == ACCDET_STATE_AB_11) {
+			/* accdet Don't send plugout in HOOK_SWITCH */
+			mutex_lock(&accdet->res_lock);
+			if (accdet->eint_sync_flag)
+				accdet->accdet_status = PLUG_OUT;
+			else
+				pr_notice("accdet hp has been plug-out\n");
+			mutex_unlock(&accdet->res_lock);
+		} else {
+			pr_notice("accdet %s Invalid AB.\n", __func__);
+		}
+		break;
+	case STAND_BY:
+		/* accdet %s STANDBY state.Err!Do nothing */
+		break;
+	default:
+		/* accdet %s Error state.Do nothing */
+		break;
+	}
+}
+
+static void accdet_work_callback(struct work_struct *work)
+{
+	unsigned int pre_cable_type = accdet->cable_type;
+
+	__pm_stay_awake(accdet->wake_lock);
+	check_cable_type();
+
+	mutex_lock(&accdet->res_lock);
+	if (accdet->eint_sync_flag) {
+		if (pre_cable_type != accdet->cable_type)
+			send_status_event(accdet->cable_type, 1);
+	}
+	mutex_unlock(&accdet->res_lock);
+	if (accdet->cable_type != NO_DEVICE) {
+		/* enable vusb LP */
+		regmap_write(accdet->regmap, RG_LDO_VUSB_HW0_OP_EN_ADDR, 0x8005);
+	}
+
+	__pm_relax(accdet->wake_lock);
+}
+
+static void accdet_queue_work(void)
+{
+	int ret;
+
+	if (accdet->accdet_status == MIC_BIAS)
+		accdet->cali_voltage = 10;
+
+	ret = queue_work(accdet->accdet_workqueue, &accdet->accdet_work);
+	if (!ret)
+		pr_notice("Error: %s (%d)\n", __func__, ret);
+}
+
+static int pmic_eint_queue_work(int eint)
+{
+	int ret = 0;
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		if (eint == PMIC_EINT0) {
+			if (accdet->cur_eint_state == EINT_PLUG_IN) {
+				accdet_set_debounce(accdet_state011,
+						    cust_pwm_deb->debounce3);
+				accdet->cur_eint_state = EINT_PLUG_OUT;
+			} else {
+				if (accdet->eint_id != M_PLUG_OUT) {
+					accdet->cur_eint_state = EINT_PLUG_IN;
+					mod_timer(&micbias_timer,
+						  jiffies + MICBIAS_DISABLE_TIMER);
+				}
+			}
+			ret = queue_work(accdet->eint_workqueue,
+					 &accdet->eint_work);
+		} else {
+			pr_notice("%s invalid EINT ID!\n", __func__);
+		}
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		if (eint == PMIC_EINT1) {
+			if (accdet->cur_eint_state == EINT_PLUG_IN) {
+				accdet_set_debounce(accdet_state011,
+						    cust_pwm_deb->debounce3);
+				accdet->cur_eint_state = EINT_PLUG_OUT;
+			} else {
+				if (accdet->eint_id != M_PLUG_OUT) {
+					accdet->cur_eint_state = EINT_PLUG_IN;
+					mod_timer(&micbias_timer,
+						  jiffies + MICBIAS_DISABLE_TIMER);
+				}
+			}
+			ret = queue_work(accdet->eint_workqueue,
+					 &accdet->eint_work);
+		} else {
+			pr_notice("%s invalid EINT ID!\n", __func__);
+		}
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		if ((eint & PMIC_EINT0) == PMIC_EINT0) {
+			if (accdet->eint0_state == EINT_PLUG_IN) {
+				accdet_set_debounce(accdet_state011,
+						    cust_pwm_deb->debounce3);
+				accdet->eint0_state = EINT_PLUG_OUT;
+			} else {
+				if (accdet->eint_id != M_PLUG_OUT)
+					accdet->eint0_state = EINT_PLUG_IN;
+			}
+		}
+		if ((eint & PMIC_EINT1) == PMIC_EINT1) {
+			if (accdet->eint1_state == EINT_PLUG_IN) {
+				accdet_set_debounce(accdet_state011,
+						    cust_pwm_deb->debounce3);
+				accdet->eint1_state = EINT_PLUG_OUT;
+			} else {
+				if (accdet->eint_id != M_PLUG_OUT)
+					accdet->eint1_state = EINT_PLUG_IN;
+			}
+		}
+
+		/* bi_eint trigger issued current state, may */
+		if (accdet->cur_eint_state == EINT_PLUG_OUT) {
+			accdet->cur_eint_state =
+				accdet->eint0_state & accdet->eint1_state;
+			if (accdet->cur_eint_state == EINT_PLUG_IN) {
+				mod_timer(&micbias_timer,
+					  jiffies + MICBIAS_DISABLE_TIMER);
+				ret = queue_work(accdet->eint_workqueue,
+						 &accdet->eint_work);
+			}
+		} else if (accdet->cur_eint_state == EINT_PLUG_IN) {
+			if ((accdet->eint0_state | accdet->eint1_state) == EINT_PLUG_OUT) {
+				clear_accdet_eint_check(PMIC_EINT0);
+				clear_accdet_eint_check(PMIC_EINT1);
+			} else if ((accdet->eint0_state & accdet->eint1_state)
+					== EINT_PLUG_OUT) {
+				accdet->cur_eint_state = EINT_PLUG_OUT;
+				ret = queue_work(accdet->eint_workqueue,
+						 &accdet->eint_work);
+			}
+		}
+	}
+	return ret;
+}
+
+void accdet_irq_handle(void)
+{
+	unsigned int eint = 0;
+	unsigned int irq_status = 0, acc_sts = 0, eint_sts = 0;
+	unsigned int val = 0;
+
+	eint = get_triggered_eint();
+	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &irq_status);
+	regmap_read(accdet->regmap, ACCDET_MEM_IN_ADDR, &acc_sts);
+	regmap_read(accdet->regmap, ACCDET_EINT0_MEM_IN_ADDR, &eint_sts);
+
+	if ((irq_status & ACCDET_IRQ_MASK_SFT) && eint == 0) {
+		clear_accdet_int();
+		accdet_queue_work();
+		clear_accdet_int_check();
+	} else if (eint != NO_PMIC_EINT) {
+		/* check EINT0 status */
+		regmap_read(accdet->regmap, ACCDET_EINT0_MEM_IN_ADDR, &val);
+		accdet->eint_id = ((val >> ACCDET_EINT0_MEM_IN_SFT) &
+				   ACCDET_EINT0_MEM_IN_MASK);
+		/* adjust eint digital/analog setting */
+		adjust_eint_setting(accdet->eint_id);
+		clear_accdet_eint(eint);
+		clear_accdet_eint_check(eint);
+		pmic_eint_queue_work(eint);
+	} else {
+		pr_notice("%s no interrupt detected!\n", __func__);
+	}
+}
+
+static irqreturn_t mtk_accdet_irq_handler_thread(int irq, void *data)
+{
+	accdet_irq_handle();
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ex_eint_handler(int irq, void *data)
+{
+	int ret = 0;
+
+	if (accdet->cur_eint_state == EINT_PLUG_IN) {
+		/* To trigger EINT when the headset was plugged in
+		 * We set the polarity back as we initialed.
+		 */
+		if (accdet->accdet_eint_type == IRQ_TYPE_LEVEL_HIGH)
+			irq_set_irq_type(accdet->gpioirq, IRQ_TYPE_LEVEL_HIGH);
+		else
+			irq_set_irq_type(accdet->gpioirq, IRQ_TYPE_LEVEL_LOW);
+		gpio_set_debounce(accdet->gpiopin, accdet->gpio_hp_deb);
+
+		accdet->cur_eint_state = EINT_PLUG_OUT;
+	} else {
+		/* To trigger EINT when the headset was plugged out
+		 * We set the opposite polarity to what we initialed.
+		 */
+		if (accdet->accdet_eint_type == IRQ_TYPE_LEVEL_HIGH)
+			irq_set_irq_type(accdet->gpioirq, IRQ_TYPE_LEVEL_LOW);
+		else
+			irq_set_irq_type(accdet->gpioirq, IRQ_TYPE_LEVEL_HIGH);
+
+		gpio_set_debounce(accdet->gpiopin,
+				  accdet_dts.plugout_deb * 1000);
+
+		accdet->cur_eint_state = EINT_PLUG_IN;
+
+		mod_timer(&micbias_timer,
+			  jiffies + MICBIAS_DISABLE_TIMER);
+	}
+
+	disable_irq_nosync(accdet->gpioirq);
+	ret = queue_work(accdet->eint_workqueue, &accdet->eint_work);
+	return IRQ_HANDLED;
+}
+
+static inline int ext_eint_setup(struct platform_device *platform_device)
+{
+	int ret = 0;
+	unsigned int ints[4] = { 0 };
+	struct device_node *node = NULL;
+	struct pinctrl_state *pins_default = NULL;
+
+	accdet->pinctrl = devm_pinctrl_get(&platform_device->dev);
+	if (IS_ERR(accdet->pinctrl)) {
+		ret = PTR_ERR(accdet->pinctrl);
+		return ret;
+	}
+
+	pins_default = pinctrl_lookup_state(accdet->pinctrl, "default");
+	if (IS_ERR(pins_default))
+		ret = PTR_ERR(pins_default);
+
+	accdet->pins_eint = pinctrl_lookup_state(accdet->pinctrl,
+						 "state_eint_as_int");
+	if (IS_ERR(accdet->pins_eint)) {
+		ret = PTR_ERR(accdet->pins_eint);
+		return ret;
+	}
+	pinctrl_select_state(accdet->pinctrl, accdet->pins_eint);
+
+	node = of_find_matching_node(node, mt6359_accdet_of_match);
+	if (!node)
+		return -1;
+
+	accdet->gpiopin = of_get_named_gpio(node, "deb-gpios", 0);
+	ret = of_property_read_u32(node, "debounce",
+				   &accdet->gpio_hp_deb);
+	if (ret < 0)
+		return ret;
+
+	gpio_set_debounce(accdet->gpiopin, accdet->gpio_hp_deb);
+
+	accdet->gpioirq = irq_of_parse_and_map(node, 0);
+	ret = of_property_read_u32_array(node, "interrupts", ints,
+					 ARRAY_SIZE(ints));
+	if (ret)
+		return ret;
+
+	accdet->accdet_eint_type = ints[1];
+	ret = request_irq(accdet->gpioirq, ex_eint_handler, IRQF_TRIGGER_NONE,
+			  "accdet-eint", NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mt6359_accdet_parse_dt(void)
+{
+	int ret = 0;
+	struct device_node *node = NULL;
+	int pwm_deb[15] = {0};
+	int three_key[4] = {0};
+	unsigned int tmp = 0;
+
+	node = of_find_matching_node(node, mt6359_accdet_of_match);
+	if (!node) {
+		pr_notice("Error: %s can't find dts node\n", __func__);
+		return -1;
+	}
+
+	ret = of_property_read_u32(node, "eint_use_ext_res",
+				   &accdet_dts.eint_use_ext_res);
+	if (ret) {
+		/* eint use internal resister */
+		accdet_dts.eint_use_ext_res = 0x0;
+	}
+	ret = of_property_read_u32(node, "eint_detect_mode",
+				   &accdet_dts.eint_detect_mode);
+	if (ret) {
+		/* eint detection mode equals to EINT HW Mode */
+		accdet_dts.eint_detect_mode = 0x4;
+	}
+
+	ret = of_property_read_u32(node,
+				   "accdet-mic-vol", &accdet_dts.mic_vol);
+	if (ret)
+		accdet_dts.mic_vol = 8;
+
+	ret = of_property_read_u32(node, "accdet-plugout-debounce",
+				   &accdet_dts.plugout_deb);
+	if (ret)
+		accdet_dts.plugout_deb = 1;
+
+	ret = of_property_read_u32(node,
+				   "accdet-mic-mode", &accdet_dts.mic_mode);
+	if (ret)
+		accdet_dts.mic_mode = 2;
+
+	ret = of_property_read_u32_array(node, "headset-mode-setting", pwm_deb,
+					 ARRAY_SIZE(pwm_deb));
+	/* debounce8(auxadc debounce) is default, needn't get from dts */
+	if (!ret)
+		memcpy(&accdet_dts.pwm_deb, pwm_deb, sizeof(pwm_deb));
+
+	cust_pwm_deb = &accdet_dts.pwm_deb;
+
+	ret = of_property_read_u32(node, "headset-eint-level-pol",
+				   &accdet_dts.eint_pol);
+	if (ret)
+		accdet_dts.eint_pol = 8;
+
+	ret = of_property_read_u32(node, "headset-use-ap-eint", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		accdet->data->caps |= ACCDET_PMIC_EINT_IRQ;
+	else if (tmp == 1)
+		accdet->data->caps |= ACCDET_AP_GPIO_EINT;
+
+	ret = of_property_read_u32(node, "headset-eint-num", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		accdet->data->caps |= ACCDET_PMIC_EINT0;
+	else if (tmp == 1)
+		accdet->data->caps |= ACCDET_PMIC_EINT1;
+	else if (tmp == 2)
+		accdet->data->caps |= ACCDET_PMIC_BI_EINT;
+
+	ret = of_property_read_u32(node, "headset-eint-trig-mode", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		accdet->data->caps |= ACCDET_PMIC_GPIO_TRIG_EINT;
+	else if (tmp == 1)
+		accdet->data->caps |= ACCDET_PMIC_INVERTER_TRIG_EINT;
+
+	ret = of_property_read_u32(node, "headset-key-mode", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		accdet->data->caps |= ACCDET_THREE_KEY;
+	else if (tmp == 1)
+		accdet->data->caps |= ACCDET_FOUR_KEY;
+	else if (tmp == 2)
+		accdet->data->caps |= ACCDET_TRI_KEY_CDD;
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_FOUR_KEY)) {
+		int four_key[5];
+
+		ret = of_property_read_u32_array(node,
+						 "headset-four-key-threshold",
+						 four_key, ARRAY_SIZE(four_key));
+		if (!ret) {
+			memcpy(&accdet_dts.four_key, four_key + 1,
+			       sizeof(struct four_key_threshold));
+		} else {
+			pr_notice("accdet no 4-key-thrsh dts, use efuse\n");
+		}
+	} else {
+		if (HAS_CAP(accdet->data->caps, ACCDET_THREE_KEY)) {
+			ret = of_property_read_u32_array(node,
+							 "headset-three-key-threshold",
+							 three_key, ARRAY_SIZE(three_key));
+		} else {
+			ret = of_property_read_u32_array(node,
+							 "headset-three-key-threshold-CDD",
+							 three_key,
+							 ARRAY_SIZE(three_key));
+		}
+		if (!ret)
+			memcpy(&accdet_dts.three_key, three_key + 1,
+			       sizeof(struct three_key_threshold));
+	}
+
+	ret = of_property_read_u32(node, "eint_use_ext_res",
+				   &accdet_dts.eint_use_ext_res);
+	if (ret) {
+		/* eint use internal resister */
+		accdet_dts.eint_use_ext_res = 0x0;
+	}
+	pr_info("accdet caps=%x\n", accdet->data->caps);
+
+	return 0;
+}
+
+static void config_digital_init_by_mode(void)
+{
+	/* enable eint cmpmem pwm */
+	regmap_write(accdet->regmap, ACCDET_EINT_CMPMEN_PWM_THRESH_ADDR,
+		     (accdet_dts.pwm_deb.eint_pwm_width << 4 |
+		     accdet_dts.pwm_deb.eint_pwm_thresh));
+	/* DA signal stable */
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		regmap_write(accdet->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT0_STABLE_VAL);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		regmap_write(accdet->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT1_STABLE_VAL);
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		regmap_write(accdet->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT0_STABLE_VAL);
+		regmap_write(accdet->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT1_STABLE_VAL);
+	}
+	/* after receive n+1 number, interrupt issued. now is 2 times */
+	regmap_update_bits(accdet->regmap, ACCDET_EINT_M_PLUG_IN_NUM_ADDR,
+			   BIT(ACCDET_EINT_M_PLUG_IN_NUM_SFT),
+			   BIT(ACCDET_EINT_M_PLUG_IN_NUM_SFT));
+	/* setting HW mode, enable digital fast discharge
+	 * if use EINT0 & EINT1 detection, please modify
+	 * ACCDET_HWMODE_EN_ADDR[2:1]
+	 */
+	regmap_write(accdet->regmap, ACCDET_HWMODE_EN_ADDR, 0x100);
+
+	regmap_update_bits(accdet->regmap, ACCDET_EINT_M_DETECT_EN_ADDR,
+			   BIT(ACCDET_EINT_M_DETECT_EN_SFT), 0);
+
+	/* enable PWM */
+	regmap_write(accdet->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x67);
+	/* enable inverter detection */
+	if (accdet_dts.eint_detect_mode == 0x1) {
+		/* disable inverter detection */
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   0);
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   0);
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   0);
+		}
+	} else {
+		if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+			regmap_update_bits(accdet->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT),
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		}
+	}
+}
+
+static void config_eint_init_by_mode(void)
+{
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		regmap_update_bits(accdet->regmap, RG_EINT0EN_ADDR,
+				   BIT(RG_EINT0EN_SFT), BIT(RG_EINT0EN_SFT));
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		regmap_update_bits(accdet->regmap, RG_EINT1EN_ADDR,
+				   BIT(RG_EINT1EN_SFT), BIT(RG_EINT1EN_SFT));
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		regmap_update_bits(accdet->regmap, RG_EINT0EN_ADDR,
+				   BIT(RG_EINT0EN_SFT), BIT(RG_EINT0EN_SFT));
+		regmap_update_bits(accdet->regmap, RG_EINT1EN_ADDR,
+				   BIT(RG_EINT1EN_SFT), BIT(RG_EINT1EN_SFT));
+	}
+	/* ESD switches on */
+	regmap_update_bits(accdet->regmap, RG_ACCDETSPARE_ADDR,
+			   1 << 8, 1 << 8);
+	/* before playback, set NCP pull low before nagative voltage */
+	regmap_update_bits(accdet->regmap, RG_NCP_PDDIS_EN_ADDR,
+			   BIT(RG_NCP_PDDIS_EN_SFT), BIT(RG_NCP_PDDIS_EN_SFT));
+
+	if (accdet_dts.eint_detect_mode == 0x1 ||
+	    accdet_dts.eint_detect_mode == 0x2 ||
+	    accdet_dts.eint_detect_mode == 0x3) {
+		if (accdet_dts.eint_use_ext_res == 0x1) {
+			/* select VTH to 2v and 500k, use external resitance */
+			if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+				/* disable RG_EINT0CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   BIT(RG_EINT0CONFIGACCDET_SFT),
+						   0);
+			} else if (HAS_CAP(accdet->data->caps,
+					ACCDET_PMIC_EINT1)) {
+				/* disable RG_EINT1CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   BIT(RG_EINT1CONFIGACCDET_SFT),
+						   0);
+			} else if (HAS_CAP(accdet->data->caps,
+					ACCDET_PMIC_BI_EINT)) {
+				/* disable RG_EINT0CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   BIT(RG_EINT0CONFIGACCDET_SFT),
+						   0);
+				/* disable RG_EINT1CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   BIT(RG_EINT1CONFIGACCDET_SFT),
+						   0);
+			}
+		} else {
+			/* select VTH to 2v and 500k, use internal resitance */
+			if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+				/* enable RG_EINT0CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   BIT(RG_EINT0CONFIGACCDET_SFT),
+						   BIT(RG_EINT0CONFIGACCDET_SFT));
+			} else if (HAS_CAP(accdet->data->caps,
+					ACCDET_PMIC_EINT1)) {
+				/* enable RG_EINT1CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   BIT(RG_EINT1CONFIGACCDET_SFT),
+						   BIT(RG_EINT1CONFIGACCDET_SFT));
+			} else if (HAS_CAP(accdet->data->caps,
+					ACCDET_PMIC_BI_EINT)) {
+				/* enable RG_EINT0CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   BIT(RG_EINT0CONFIGACCDET_SFT),
+						   BIT(RG_EINT0CONFIGACCDET_SFT));
+				/* enable RG_EINT1CONFIGACCDET */
+				regmap_update_bits(accdet->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   BIT(RG_EINT1CONFIGACCDET_SFT),
+						   BIT(RG_EINT1CONFIGACCDET_SFT));
+			}
+		}
+	}
+
+	if (accdet_dts.eint_detect_mode != 0x1) {
+		/* current detect set 0.25uA */
+		regmap_update_bits(accdet->regmap, RG_ACCDETSPARE_ADDR,
+				   0x3 << RG_ACCDETSPARE_SFT,
+				   0x3 << RG_ACCDETSPARE_SFT);
+	}
+}
+
+static void accdet_init_once(void)
+{
+	unsigned int reg = 0;
+
+	/* reset the accdet unit */
+	regmap_update_bits(accdet->regmap, RG_ACCDET_RST_ADDR,
+			   BIT(RG_ACCDET_RST_SFT), BIT(RG_ACCDET_RST_SFT));
+	regmap_update_bits(accdet->regmap, RG_ACCDET_RST_ADDR,
+			   BIT(RG_ACCDET_RST_SFT), 0);
+
+	/* clear high micbias1 voltage setting */
+	regmap_update_bits(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			   0x3 << RG_AUDMICBIAS1HVEN_SFT, 0);
+	/* clear micbias1 voltage */
+	regmap_update_bits(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			   0x7 << RG_AUDMICBIAS1VREF_SFT, 0);
+
+	/* init pwm frequency, duty & rise/falling delay */
+	regmap_write(accdet->regmap, ACCDET_PWM_WIDTH_ADDR,
+		     REGISTER_VAL(cust_pwm_deb->pwm_width));
+	regmap_write(accdet->regmap, ACCDET_PWM_THRESH_ADDR,
+		     REGISTER_VAL(cust_pwm_deb->pwm_thresh));
+	regmap_write(accdet->regmap, ACCDET_RISE_DELAY_ADDR,
+		     (cust_pwm_deb->fall_delay << 15 | cust_pwm_deb->rise_delay));
+
+	/* config micbias voltage, micbias1 vref is only controlled by accdet
+	 * if we need 2.8V, config [12:13]
+	 */
+	regmap_read(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR, &reg);
+	if (accdet_dts.mic_vol <= 7) {
+		/* micbias1 <= 2.7V */
+		regmap_write(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (accdet_dts.mic_vol << RG_AUDMICBIAS1VREF_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	} else if (accdet_dts.mic_vol == 8) {
+		/* micbias1 = 2.8v */
+		regmap_write(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (3 << RG_AUDMICBIAS1HVEN_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	} else if (accdet_dts.mic_vol == 9) {
+		/* micbias1 = 2.85v */
+		regmap_write(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (1 << RG_AUDMICBIAS1HVEN_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	}
+	/* mic mode setting */
+	regmap_read(accdet->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR, &reg);
+	if (accdet_dts.mic_mode == HEADSET_MODE_1) {
+		/* ACC mode*/
+		regmap_write(accdet->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE1);
+		/* enable analog fast discharge */
+		regmap_update_bits(accdet->regmap, RG_ANALOGFDEN_ADDR,
+				   BIT(RG_ANALOGFDEN_SFT),
+				   BIT(RG_ANALOGFDEN_SFT));
+		regmap_update_bits(accdet->regmap, RG_ACCDETSPARE_ADDR,
+				   0x3 << 11, 0x3 << 11);
+	} else if (accdet_dts.mic_mode == HEADSET_MODE_2) {
+		/* DCC mode Low cost mode without internal bias*/
+		regmap_write(accdet->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE2);
+		/* enable analog fast discharge */
+		regmap_update_bits(accdet->regmap, RG_ANALOGFDEN_ADDR,
+				   0x3 << RG_ANALOGFDEN_SFT,
+				   0x3 << RG_ANALOGFDEN_SFT);
+	} else if (accdet_dts.mic_mode == HEADSET_MODE_6) {
+		/* DCC mode Low cost mode with internal bias,
+		 * bit8 = 1 to use internal bias
+		 */
+		regmap_write(accdet->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE6);
+		regmap_update_bits(accdet->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+				   BIT(RG_AUDMICBIAS1DCSW1PEN_SFT),
+				   BIT(RG_AUDMICBIAS1DCSW1PEN_SFT));
+		/* enable analog fast discharge */
+		regmap_update_bits(accdet->regmap, RG_ANALOGFDEN_ADDR,
+				   0x3 << RG_ANALOGFDEN_SFT,
+				   0x3 << RG_ANALOGFDEN_SFT);
+	}
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT_IRQ)) {
+		config_eint_init_by_mode();
+		config_digital_init_by_mode();
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_AP_GPIO_EINT)) {
+		/* set pull low pads and DCC mode */
+		regmap_write(accdet->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     0x8F);
+		/* disconnect configaccdet */
+		regmap_write(accdet->regmap, RG_EINT1CONFIGACCDET_ADDR,
+			     0x0);
+		/* disable eint comparator */
+		regmap_write(accdet->regmap, RG_EINT0CMPEN_ADDR, 0x0);
+		/* enable PWM */
+		regmap_write(accdet->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x7);
+		/* enable accdet sw mode */
+		regmap_write(accdet->regmap, ACCDET_HWMODE_EN_ADDR, 0x0);
+		/* set DA signal to stable */
+		regmap_write(accdet->regmap, ACCDET_DA_STABLE_ADDR, 0x1);
+		/* disable eint/inverter/sw_en */
+		regmap_write(accdet->regmap, ACCDET_SW_EN_ADDR, 0x0);
+	}
+}
+
+static void accdet_init_debounce(void)
+{
+	/* set debounce to 1ms */
+	accdet_set_debounce(eint_state000, accdet_dts.pwm_deb.eint_debounce0);
+	/* set debounce to 128ms */
+	accdet_set_debounce(eint_state011, accdet_dts.pwm_deb.eint_debounce3);
+}
+
+static inline void accdet_init(void)
+{
+	/* set and clear initial bit every eint interrutp */
+	regmap_update_bits(accdet->regmap, ACCDET_SEQ_INIT_ADDR,
+			   BIT(ACCDET_SEQ_INIT_SFT), BIT(ACCDET_SEQ_INIT_SFT));
+	mdelay(2);
+	regmap_update_bits(accdet->regmap, ACCDET_SEQ_INIT_ADDR,
+			   BIT(ACCDET_SEQ_INIT_SFT), 0);
+	mdelay(1);
+	/* init the debounce time (debounce/32768)sec */
+	accdet_set_debounce(accdet_state000, cust_pwm_deb->debounce0);
+	accdet_set_debounce(accdet_state001, cust_pwm_deb->debounce1);
+	accdet_set_debounce(accdet_state011, cust_pwm_deb->debounce3);
+	/* auxadc:2ms */
+	accdet_set_debounce(accdet_auxadc, cust_pwm_deb->debounce4);
+	accdet_set_debounce(eint_state001, accdet_dts.pwm_deb.eint_debounce1);
+	accdet_set_debounce(eint_inverter_state000,
+			    accdet_dts.pwm_deb.eint_inverter_debounce);
+}
+
+/* late init for DC trim, and this API  Will be called by audio */
+void mt6359_accdet_late_init(unsigned long data)
+{
+	if (atomic_cmpxchg(&accdet->init_once, 1, 0)) {
+		del_timer_sync(&accdet_init_timer);
+		accdet_init();
+		accdet_init_debounce();
+		accdet_init_once();
+	} else {
+		pr_info("%s fail\n", __func__);
+	}
+}
+EXPORT_SYMBOL(mt6359_accdet_late_init);
+
+static void delay_init_work_callback(struct work_struct *work)
+{
+	accdet_init();
+	accdet_init_debounce();
+	accdet_init_once();
+}
+
+static void delay_init_timerhandler(struct timer_list *t)
+{
+	int ret = 0;
+
+	ret = queue_work(accdet->delay_init_workqueue,
+			 &accdet->delay_init_work);
+	if (!ret)
+		pr_err("Error: %s (%d)\n", __func__, ret);
+}
+
+int mt6359_accdet_init(struct snd_soc_component *component,
+		       struct snd_soc_card *card)
+{
+	int ret = 0;
+	struct mt63xx_accdet_data *priv =
+			snd_soc_card_get_drvdata(component->card);
+
+	/* Enable Headset and 4 Buttons Jack detection */
+	ret = snd_soc_card_jack_new(card,
+				    "Headset Jack",
+				    SND_JACK_HEADSET |
+				    SND_JACK_LINEOUT |
+				    SND_JACK_MECHANICAL,
+				    &priv->jack,
+				    NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't new Headset Jack %x\n", ret);
+		return ret;
+	}
+
+	accdet->jack.jack->input_dev->id.bustype = BUS_HOST;
+	snd_jack_set_key(accdet->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(accdet->jack.jack, SND_JACK_BTN_1, KEY_VOLUMEDOWN);
+	snd_jack_set_key(accdet->jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(accdet->jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mt6359_accdet_init);
+
+int mt6359_accdet_set_drvdata(struct snd_soc_card *card)
+{
+	snd_soc_card_set_drvdata(card, accdet);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_accdet_set_drvdata);
+
+static int mt6359_accdet_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+	struct resource *res;
+	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
+	const struct of_device_id *of_id =
+			of_match_device(mt6359_accdet_of_match, &pdev->dev);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
+	accdet = devm_kzalloc(&pdev->dev, sizeof(*accdet), GFP_KERNEL);
+	if (!accdet)
+		return -ENOMEM;
+
+	accdet->data = (struct accdet_priv *)of_id->data;
+	accdet->pdev = pdev;
+
+	/* parse dts attributes */
+	ret = mt6359_accdet_parse_dt();
+	if (ret) {
+		dev_err(&pdev->dev, "Error: Get dts data failed (%d)\n", ret);
+		return ret;
+	}
+	/* init lock */
+	accdet->wake_lock = wakeup_source_register(NULL, "accdet_wake_lock");
+	if (!accdet->wake_lock) {
+		dev_err(&pdev->dev, "Error: get accdet_wake_lock fail\n");
+		return -ENOMEM;
+	}
+	accdet->timer_lock = wakeup_source_register(NULL, "accdet_timer_lock");
+	if (!accdet->timer_lock) {
+		dev_err(&pdev->dev, "Error: get accdet_timer_lock fail\n");
+		return -ENOMEM;
+	}
+	mutex_init(&accdet->res_lock);
+
+	platform_set_drvdata(pdev, accdet);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mt6359_accdet_soc_driver,
+					      NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "Error: register component fail\n");
+		return ret;
+	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	accdet->regmap = mt6397_chip->regmap;
+	accdet->dev = &pdev->dev;
+	accdet->auxadc_offset = 0;
+
+	/* register pmic interrupt */
+	accdet->accdet_irq = platform_get_irq(pdev, 0);
+	if (accdet->accdet_irq < 0) {
+		dev_err(&pdev->dev,
+			"Error: Get accdet irq failed (%d)\n",
+			accdet->accdet_irq);
+		return accdet->accdet_irq;
+	}
+	ret = devm_request_threaded_irq(&pdev->dev, accdet->accdet_irq,
+					NULL, mtk_accdet_irq_handler_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"ACCDET_IRQ", accdet);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Error: Get thread irq request failed (%d) (%d)\n",
+			accdet->accdet_irq, ret);
+		return ret;
+	}
+
+	if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT0)) {
+		accdet->accdet_eint0 = platform_get_irq(pdev, 1);
+		if (accdet->accdet_eint0 < 0) {
+			dev_err(&pdev->dev,
+				"Error: Get eint0 irq failed (%d)\n",
+				accdet->accdet_eint0);
+			return accdet->accdet_eint0;
+		}
+		ret = devm_request_threaded_irq(&pdev->dev,
+						accdet->accdet_eint0,
+						NULL, mtk_accdet_irq_handler_thread,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_EINT0", accdet);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Error: Get eint0 irq request failed (%d)\n",
+				ret);
+			return ret;
+		}
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_EINT1)) {
+		accdet->accdet_eint1 = platform_get_irq(pdev, 2);
+		if (accdet->accdet_eint1 < 0) {
+			dev_err(&pdev->dev,
+				"Error: Get eint1 irq failed (%d)\n",
+				accdet->accdet_eint1);
+			return accdet->accdet_eint1;
+		}
+		ret = devm_request_threaded_irq(&pdev->dev,
+						accdet->accdet_eint1,
+						NULL,
+						mtk_accdet_irq_handler_thread,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_EINT1", accdet);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Error: Get eint1 irq request failed (%d)\n",
+				ret);
+			return ret;
+		}
+	} else if (HAS_CAP(accdet->data->caps, ACCDET_PMIC_BI_EINT)) {
+		accdet->accdet_eint0 = platform_get_irq(pdev, 1);
+		if (accdet->accdet_eint0 < 0) {
+			dev_err(&pdev->dev,
+				"Error: Get eint0 irq failed (%d)\n",
+				accdet->accdet_eint0);
+			return accdet->accdet_eint0;
+		}
+		ret = devm_request_threaded_irq(&pdev->dev,
+						accdet->accdet_eint0,
+						NULL,
+						mtk_accdet_irq_handler_thread,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_EINT0", accdet);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Error: Get eint0 irq request failed (%d)\n",
+				ret);
+			return ret;
+		}
+		accdet->accdet_eint1 = platform_get_irq(pdev, 2);
+		if (accdet->accdet_eint1 < 0) {
+			dev_err(&pdev->dev,
+				"Error: Get eint1 irq failed (%d)\n",
+				accdet->accdet_eint1);
+			return accdet->accdet_eint1;
+		}
+		ret = devm_request_threaded_irq(&pdev->dev,
+						accdet->accdet_eint1,
+						NULL,
+						mtk_accdet_irq_handler_thread,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_EINT1", accdet);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Error: Get eint1 irq request failed (%d)\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* setup timer */
+	timer_setup(&micbias_timer, dis_micbias_timerhandler, 0);
+	micbias_timer.expires = jiffies + MICBIAS_DISABLE_TIMER;
+	timer_setup(&accdet_init_timer, delay_init_timerhandler, 0);
+	accdet_init_timer.expires = jiffies + ACCDET_INIT_WAIT_TIMER;
+
+	/* Create workqueue */
+	accdet->delay_init_workqueue =
+		create_singlethread_workqueue("delay_init");
+	INIT_WORK(&accdet->delay_init_work, delay_init_work_callback);
+	if (!accdet->delay_init_workqueue) {
+		dev_err(&pdev->dev, "Error: Create dinit workqueue failed\n");
+		ret = -1;
+		goto err_delay_init_wq;
+	}
+	accdet->accdet_workqueue = create_singlethread_workqueue("accdet");
+	INIT_WORK(&accdet->accdet_work, accdet_work_callback);
+	if (!accdet->accdet_workqueue) {
+		dev_err(&pdev->dev, "Error: Create accdet workqueue failed\n");
+		ret = -1;
+		goto err_accdet_wq;
+	}
+
+	accdet->dis_micbias_workqueue =
+		create_singlethread_workqueue("dismicQueue");
+	INIT_WORK(&accdet->dis_micbias_work, dis_micbias_work_callback);
+	if (!accdet->dis_micbias_workqueue) {
+		dev_err(&pdev->dev, "Error: Create dismic workqueue failed\n");
+		ret = -1;
+		goto err_dis_micbias_wq;
+	}
+	accdet->eint_workqueue = create_singlethread_workqueue("accdet_eint");
+	INIT_WORK(&accdet->eint_work, eint_work_callback);
+	if (!accdet->eint_workqueue) {
+		dev_err(&pdev->dev, "Error: Create eint workqueue failed\n");
+		ret = -1;
+		goto err_eint_wq;
+	}
+	if (HAS_CAP(accdet->data->caps, ACCDET_AP_GPIO_EINT)) {
+		accdet->accdet_eint_type = IRQ_TYPE_LEVEL_LOW;
+		ret = ext_eint_setup(pdev);
+		if (ret)
+			destroy_workqueue(accdet->eint_workqueue);
+	}
+
+	atomic_set(&accdet->init_once, 1);
+	mod_timer(&accdet_init_timer, (jiffies + ACCDET_INIT_WAIT_TIMER));
+
+	return 0;
+
+err_eint_wq:
+	destroy_workqueue(accdet->dis_micbias_workqueue);
+err_dis_micbias_wq:
+	destroy_workqueue(accdet->accdet_workqueue);
+err_accdet_wq:
+	destroy_workqueue(accdet->delay_init_workqueue);
+err_delay_init_wq:
+	pr_notice("%s error. now exit.!\n", __func__);
+	return ret;
+}
+
+static int mt6359_accdet_remove(struct platform_device *pdev)
+{
+	destroy_workqueue(accdet->eint_workqueue);
+	destroy_workqueue(accdet->dis_micbias_workqueue);
+	destroy_workqueue(accdet->accdet_workqueue);
+	destroy_workqueue(accdet->delay_init_workqueue);
+	devm_kfree(&pdev->dev, accdet);
+	return 0;
+}
+
+static struct platform_driver mt6359_accdet_driver = {
+	.probe = mt6359_accdet_probe,
+	.remove = mt6359_accdet_remove,
+	.driver = {
+		.name = "pmic-codec-accdet",
+		.of_match_table = mt6359_accdet_of_match,
+	},
+};
+
+static int __init mt6359_accdet_soc_init(void)
+{
+	int ret = 0;
+
+	ret = platform_driver_register(&mt6359_accdet_driver);
+	if (ret)
+		return -ENODEV;
+	return 0;
+}
+
+static void __exit mt6359_accdet_soc_exit(void)
+{
+	platform_driver_unregister(&mt6359_accdet_driver);
+}
+module_init(mt6359_accdet_soc_init);
+module_exit(mt6359_accdet_soc_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("MT6359 ALSA SoC accdet driver");
+MODULE_AUTHOR("Argus Lin <argus.lin@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
new file mode 100644
index 0000000..d081d69
--- /dev/null
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Argus Lin <argus.lin@mediatek.com>
+ */
+
+#ifndef _ACCDET_H_
+#define _ACCDET_H_
+
+#include <linux/ctype.h>
+#include <linux/string.h>
+
+#define ACCDET_DEVNAME "accdet"
+/* SW ENV define */
+#define NO_KEY			(0x0)
+#define UP_KEY			(0x01)
+#define MD_KEY			(0x02)
+#define DW_KEY			(0x04)
+#define AS_KEY			(0x08)
+
+#define HEADSET_MODE_1		(1)
+#define HEADSET_MODE_2		(2)
+#define HEADSET_MODE_6		(6)
+
+/* IOCTL */
+#define ACCDET_IOC_MAGIC 'A'
+#define ACCDET_INIT _IO(ACCDET_IOC_MAGIC, 0)
+#define SET_CALL_STATE _IO(ACCDET_IOC_MAGIC, 1)
+#define GET_BUTTON_STATUS _IO(ACCDET_IOC_MAGIC, 2)
+
+/* 400us, Accdet irq clear timeout  */
+#define ACCDET_TIME_OUT		0x61A80
+
+/* cable type recognized by accdet, and report to WiredAccessoryManager */
+enum accdet_report_state {
+	NO_DEVICE =		0,
+	HEADSET_MIC =		1,
+	HEADSET_NO_MIC =	2,
+	HEADSET_FIVE_POLE =	3,
+	LINE_OUT_DEVICE =	4,
+};
+
+/* accdet status got from accdet FSM  */
+enum accdet_status {
+	PLUG_OUT =		0,
+	MIC_BIAS =		1,
+	HOOK_SWITCH =		2,
+	BI_MIC_BIAS =		3,
+	LINE_OUT =		4,
+	STAND_BY =		5
+};
+
+enum accdet_eint_ID {
+	NO_PMIC_EINT =		0,
+	PMIC_EINT0 =		1,
+	PMIC_EINT1 =		2,
+	PMIC_BIEINT =		3,
+};
+
+/* EINT state when moisture enable  */
+enum eint_moisture_status {
+	M_PLUG_IN =		0,
+	M_WATER_IN =		1,
+	M_HP_PLUG_IN =		2,
+	M_PLUG_OUT =		3,
+	M_NO_ACT =		4,
+	M_UNKNOWN =		5,
+};
+
+struct three_key_threshold {
+	unsigned int mid;
+	unsigned int up;
+	unsigned int down;
+};
+
+struct four_key_threshold {
+	unsigned int mid;
+	unsigned int voice;
+	unsigned int up;
+	unsigned int down;
+};
+
+struct pwm_deb_settings {
+	unsigned int pwm_width;
+	unsigned int pwm_thresh;
+	unsigned int fall_delay;
+	unsigned int rise_delay;
+	unsigned int debounce0;
+	unsigned int debounce1;
+	unsigned int debounce3;
+	unsigned int debounce4;
+	unsigned int eint_pwm_width;
+	unsigned int eint_pwm_thresh;
+	unsigned int eint_debounce0;
+	unsigned int eint_debounce1;
+	unsigned int eint_debounce2;
+	unsigned int eint_debounce3;
+	unsigned int eint_inverter_debounce;
+
+};
+
+struct head_dts_data {
+	unsigned int mic_vol;
+	unsigned int mic_mode;
+	unsigned int plugout_deb;
+	unsigned int eint_pol;
+	struct pwm_deb_settings pwm_deb;
+	struct three_key_threshold three_key;
+	struct four_key_threshold four_key;
+	unsigned int moisture_detect_enable;
+	unsigned int eint_detect_mode;
+	unsigned int eint_use_ext_res;
+	unsigned int moisture_detect_mode;
+	unsigned int moisture_comp_vth;
+	unsigned int moisture_comp_vref2;
+	unsigned int moisture_use_ext_res;
+};
+
+enum {
+	accdet_state000 = 0,
+	accdet_state001,
+	accdet_state010,
+	accdet_state011,
+	accdet_auxadc,
+	eint_state000,
+	eint_state001,
+	eint_state010,
+	eint_state011,
+	eint_inverter_state000,
+};
+
+/* just be called by audio module for DC trim */
+void mt6359_accdet_late_init(unsigned long data);
+int mt6359_accdet_init(struct snd_soc_component *component, struct snd_soc_card *card);
+int mt6359_accdet_set_drvdata(struct snd_soc_card *card);
+#endif
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index 35f806b..9f9a94a 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -8,128 +8,1779 @@
 #define _MT6359_H_

 /*************Register Bit Define*************/
-#define PMIC_ACCDET_IRQ_SHIFT				0
-#define PMIC_ACCDET_EINT0_IRQ_SHIFT			2
-#define PMIC_ACCDET_EINT1_IRQ_SHIFT			3
-#define PMIC_ACCDET_IRQ_CLR_SHIFT			8
-#define PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT			10
-#define PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT			11
-#define PMIC_RG_INT_STATUS_ACCDET_SHIFT			5
-#define PMIC_RG_INT_STATUS_ACCDET_EINT0_SHIFT		6
-#define PMIC_RG_INT_STATUS_ACCDET_EINT1_SHIFT		7
-#define PMIC_RG_EINT0CONFIGACCDET_SHIFT			11
-#define PMIC_RG_EINT1CONFIGACCDET_SHIFT			0
-#define PMIC_ACCDET_EINT0_INVERTER_SW_EN_SHIFT		6
-#define PMIC_ACCDET_EINT1_INVERTER_SW_EN_SHIFT		8
-#define PMIC_RG_MTEST_EN_SHIFT				8
-#define PMIC_RG_MTEST_SEL_SHIFT				9
-#define PMIC_ACCDET_EINT0_M_SW_EN_SHIFT			10
-#define PMIC_ACCDET_EINT1_M_SW_EN_SHIFT			11
-#define PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT		5
-#define PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT		10
-#define PMIC_ACCDET_DA_STABLE_SHIFT			0
-#define PMIC_ACCDET_EINT0_EN_STABLE_SHIFT		1
-#define PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT		2
-#define PMIC_ACCDET_EINT1_EN_STABLE_SHIFT		6
-#define PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT		7
-#define PMIC_ACCDET_EINT_CTURBO_SEL_SHIFT		7
-#define PMIC_ACCDET_EINT0_CTURBO_SW_SHIFT		7
-#define PMIC_RG_EINTCOMPVTH_SHIFT			4
-#define PMIC_RG_EINT0HIRENB_SHIFT			12
-#define PMIC_RG_EINT0NOHYS_SHIFT			10
-#define PMIC_ACCDET_SW_EN_SHIFT				0
-#define PMIC_ACCDET_EINT0_MEM_IN_SHIFT			6
-#define PMIC_ACCDET_MEM_IN_SHIFT			6
-#define PMIC_ACCDET_EINT_DEBOUNCE0_SHIFT		0
-#define PMIC_ACCDET_EINT_DEBOUNCE1_SHIFT		4
-#define PMIC_ACCDET_EINT_DEBOUNCE2_SHIFT		8
-#define PMIC_ACCDET_EINT_DEBOUNCE3_SHIFT		12
-#define PMIC_RG_ACCDET2AUXSWEN_SHIFT			14
-#define PMIC_AUDACCDETAUXADCSWCTRL_SEL_SHIFT		9
-#define PMIC_AUDACCDETAUXADCSWCTRL_SW_SHIFT		10
-#define PMIC_RG_EINT0CTURBO_SHIFT			5
-#define PMIC_RG_EINT1CTURBO_SHIFT			13
-#define PMIC_ACCDET_EINT_M_PLUG_IN_NUM_SHIFT		12
-#define PMIC_ACCDET_EINT_M_DETECT_EN_SHIFT		12
-#define PMIC_ACCDET_EINT0_SW_EN_SHIFT			2
-#define PMIC_ACCDET_EINT1_SW_EN_SHIFT			4
-#define PMIC_ACCDET_EINT_CMPMOUT_SEL_SHIFT		12
-#define PMIC_ACCDET_EINT_CMPMEN_SEL_SHIFT		6
-#define PMIC_RG_HPLOUTPUTSTBENH_VAUDP32_SHIFT		0
-#define PMIC_RG_HPROUTPUTSTBENH_VAUDP32_SHIFT		4
-#define PMIC_RG_EINT0EN_SHIFT				2
-#define PMIC_RG_EINT1EN_SHIFT				10
-#define PMIC_RG_NCP_PDDIS_EN_SHIFT			0
-#define PMIC_RG_ACCDETSPARE_SHIFT			0
-#define PMIC_RG_ACCDET_RST_SHIFT			1
-#define PMIC_RG_AUDMICBIAS1HVEN_SHIFT			12
-#define PMIC_RG_AUDMICBIAS1VREF_SHIFT			4
-#define PMIC_RG_ANALOGFDEN_SHIFT			12
-#define PMIC_RG_AUDMICBIAS1DCSW1PEN_SHIFT		8
-#define PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT			2
-#define PMIC_ACCDET_SEQ_INIT_SHIFT			1
-#define PMIC_RG_EINTCOMPVTH_MASK			0xf
-#define PMIC_ACCDET_EINT0_MEM_IN_MASK			0x3
-#define PMIC_ACCDET_EINT_DEBOUNCE0_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE1_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE2_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE3_MASK			0xf
-#define PMIC_ACCDET_EINT0_IRQ_SHIFT			2
-#define PMIC_ACCDET_EINT1_IRQ_SHIFT			3
-
-/* AUDENC_ANA_CON16: */
-#define RG_AUD_MICBIAS1_LOWP_EN		BIT(PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT)
-
+#define MT6359_TOP0_ID                       0x0
+#define MT6359_SMT_CON1                      0x32
+#define MT6359_DRV_CON2                      0x3c
+#define MT6359_DRV_CON3                      0x3e
+#define MT6359_DRV_CON4                      0x40
+#define MT6359_TOP_CKPDN_CON0                0x10c
+#define MT6359_TOP_CKPDN_CON0_SET            0x10e
+#define MT6359_TOP_CKPDN_CON0_CLR            0x110
+#define MT6359_AUXADC_RQST0                  0x1108
+#define MT6359_AUXADC_CON10                  0x11a0
+#define MT6359_AUXADC_ACCDET                 0x11ba
+#define MT6359_LDO_VUSB_OP_EN                0x1d0c
+#define MT6359_LDO_VUSB_OP_EN_SET            0x1d0e
+#define MT6359_LDO_VUSB_OP_EN_CLR            0x1d10
+#define MT6359_AUD_TOP_CKPDN_CON0            0x230c
+#define MT6359_AUD_TOP_CKPDN_CON0_SET        0x230e
+#define MT6359_AUD_TOP_CKPDN_CON0_CLR        0x2310
+#define MT6359_AUD_TOP_RST_CON0              0x2320
+#define MT6359_AUD_TOP_RST_CON0_SET          0x2322
+#define MT6359_AUD_TOP_RST_CON0_CLR          0x2324
+#define MT6359_AUD_TOP_INT_CON0              0x2328
+#define MT6359_AUD_TOP_INT_CON0_SET          0x232a
+#define MT6359_AUD_TOP_INT_CON0_CLR          0x232c
+#define MT6359_AUD_TOP_INT_MASK_CON0         0x232e
+#define MT6359_AUD_TOP_INT_MASK_CON0_SET     0x2330
+#define MT6359_AUD_TOP_INT_MASK_CON0_CLR     0x2332
+#define MT6359_AUD_TOP_INT_STATUS0           0x2334
+#define MT6359_AFE_NCP_CFG2                  0x24e2
+#define MT6359_AUDENC_DSN_ID                 0x2500
+#define MT6359_AUDENC_DSN_REV0               0x2502
+#define MT6359_AUDENC_DSN_DBI                0x2504
+#define MT6359_AUDENC_DSN_FPI                0x2506
+#define MT6359_AUDENC_ANA_CON0               0x2508
+#define MT6359_AUDENC_ANA_CON1               0x250a
+#define MT6359_AUDENC_ANA_CON2               0x250c
+#define MT6359_AUDENC_ANA_CON3               0x250e
+#define MT6359_AUDENC_ANA_CON4               0x2510
+#define MT6359_AUDENC_ANA_CON5               0x2512
+#define MT6359_AUDENC_ANA_CON6               0x2514
+#define MT6359_AUDENC_ANA_CON7               0x2516
+#define MT6359_AUDENC_ANA_CON8               0x2518
+#define MT6359_AUDENC_ANA_CON9               0x251a
+#define MT6359_AUDENC_ANA_CON10              0x251c
+#define MT6359_AUDENC_ANA_CON11              0x251e
+#define MT6359_AUDENC_ANA_CON12              0x2520
+#define MT6359_AUDENC_ANA_CON13              0x2522
+#define MT6359_AUDENC_ANA_CON14              0x2524
+#define MT6359_AUDENC_ANA_CON15              0x2526
+#define MT6359_AUDENC_ANA_CON16              0x2528
+#define MT6359_AUDENC_ANA_CON17              0x252a
+#define MT6359_AUDENC_ANA_CON18              0x252c
+#define MT6359_AUDENC_ANA_CON19              0x252e
+#define MT6359_AUDENC_ANA_CON20              0x2530
+#define MT6359_AUDENC_ANA_CON21              0x2532
+#define MT6359_AUDENC_ANA_CON22              0x2534
+#define MT6359_AUDENC_ANA_CON23              0x2536
+#define MT6359_AUDDEC_DSN_ID                 0x2580
+#define MT6359_AUDDEC_DSN_REV0               0x2582
+#define MT6359_AUDDEC_DSN_DBI                0x2584
+#define MT6359_AUDDEC_DSN_FPI                0x2586
+#define MT6359_AUDDEC_ANA_CON0               0x2588
+#define MT6359_AUDDEC_ANA_CON1               0x258a
+#define MT6359_AUDDEC_ANA_CON2               0x258c
+#define MT6359_AUDDEC_ANA_CON3               0x258e
+#define MT6359_AUDDEC_ANA_CON4               0x2590
+#define MT6359_AUDDEC_ANA_CON5               0x2592
+#define MT6359_AUDDEC_ANA_CON6               0x2594
+#define MT6359_AUDDEC_ANA_CON7               0x2596
+#define MT6359_AUDDEC_ANA_CON8               0x2598
+#define MT6359_AUDDEC_ANA_CON9               0x259a
+#define MT6359_AUDDEC_ANA_CON10              0x259c
+#define MT6359_AUDDEC_ANA_CON11              0x259e
+#define MT6359_AUDDEC_ANA_CON12              0x25a0
+#define MT6359_AUDDEC_ANA_CON13              0x25a2
+#define MT6359_AUDDEC_ANA_CON14              0x25a4
+#define MT6359_ACCDET_DSN_DIG_ID             0x2680
+#define MT6359_ACCDET_DSN_DIG_REV0           0x2682
+#define MT6359_ACCDET_DSN_DBI                0x2684
+#define MT6359_ACCDET_DSN_FPI                0x2686
+#define MT6359_ACCDET_CON0                   0x2688
+#define MT6359_ACCDET_CON1                   0x268a
+#define MT6359_ACCDET_CON2                   0x268c
+#define MT6359_ACCDET_CON3                   0x268e
+#define MT6359_ACCDET_CON4                   0x2690
+#define MT6359_ACCDET_CON5                   0x2692
+#define MT6359_ACCDET_CON6                   0x2694
+#define MT6359_ACCDET_CON7                   0x2696
+#define MT6359_ACCDET_CON8                   0x2698
+#define MT6359_ACCDET_CON9                   0x269a
+#define MT6359_ACCDET_CON10                  0x269c
+#define MT6359_ACCDET_CON11                  0x269e
+#define MT6359_ACCDET_CON12                  0x26a0
+#define MT6359_ACCDET_CON13                  0x26a2
+#define MT6359_ACCDET_CON14                  0x26a4
+#define MT6359_ACCDET_CON15                  0x26a6
+#define MT6359_ACCDET_CON16                  0x26a8
+#define MT6359_ACCDET_CON17                  0x26aa
+#define MT6359_ACCDET_CON18                  0x26ac
+#define MT6359_ACCDET_CON19                  0x26ae
+#define MT6359_ACCDET_CON20                  0x26b0
+#define MT6359_ACCDET_CON21                  0x26b2
+#define MT6359_ACCDET_CON22                  0x26b4
+#define MT6359_ACCDET_CON23                  0x26b6
+#define MT6359_ACCDET_CON24                  0x26b8
+#define MT6359_ACCDET_CON25                  0x26ba
+#define MT6359_ACCDET_CON26                  0x26bc
+#define MT6359_ACCDET_CON27                  0x26be
+#define MT6359_ACCDET_CON28                  0x26c0
+#define MT6359_ACCDET_CON29                  0x26c2
+#define MT6359_ACCDET_CON30                  0x26c4
+#define MT6359_ACCDET_CON31                  0x26c6
+#define MT6359_ACCDET_CON32                  0x26c8
+#define MT6359_ACCDET_CON33                  0x26ca
+#define MT6359_ACCDET_CON34                  0x26cc
+#define MT6359_ACCDET_CON35                  0x26ce
+#define MT6359_ACCDET_CON36                  0x26d0
+#define MT6359_ACCDET_CON37                  0x26d2
+#define MT6359_ACCDET_CON38                  0x26d4
+#define MT6359_ACCDET_CON39                  0x26d6
+#define MT6359_ACCDET_CON40                  0x26d8
+
+#define TOP0_ANA_ID_ADDR                               \
+	MT6359_TOP0_ID
+#define TOP0_ANA_ID_SFT                                0
+#define TOP0_ANA_ID_MASK                               0xFF
+#define TOP0_ANA_ID_MASK_SFT                           (0xFF << 0)
+#define AUXADC_RQST_CH0_ADDR                           \
+	MT6359_AUXADC_RQST0
+#define AUXADC_RQST_CH0_SFT                            0
+#define AUXADC_RQST_CH0_MASK                           0x1
+#define AUXADC_RQST_CH0_MASK_SFT                       (0x1 << 0)
+#define AUXADC_ACCDET_ANASWCTRL_EN_ADDR                \
+	MT6359_AUXADC_CON15
+#define AUXADC_ACCDET_ANASWCTRL_EN_SFT                 6
+#define AUXADC_ACCDET_ANASWCTRL_EN_MASK                0x1
+#define AUXADC_ACCDET_ANASWCTRL_EN_MASK_SFT            (0x1 << 6)
+
+#define AUXADC_ACCDET_AUTO_SPL_ADDR                    \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_AUTO_SPL_SFT                     0
+#define AUXADC_ACCDET_AUTO_SPL_MASK                    0x1
+#define AUXADC_ACCDET_AUTO_SPL_MASK_SFT                (0x1 << 0)
+#define AUXADC_ACCDET_AUTO_RQST_CLR_ADDR               \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_AUTO_RQST_CLR_SFT                1
+#define AUXADC_ACCDET_AUTO_RQST_CLR_MASK               0x1
+#define AUXADC_ACCDET_AUTO_RQST_CLR_MASK_SFT           (0x1 << 1)
+#define AUXADC_ACCDET_DIG1_RSV0_ADDR                   \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_DIG1_RSV0_SFT                    2
+#define AUXADC_ACCDET_DIG1_RSV0_MASK                   0x3F
+#define AUXADC_ACCDET_DIG1_RSV0_MASK_SFT               (0x3F << 2)
+#define AUXADC_ACCDET_DIG0_RSV0_ADDR                   \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_DIG0_RSV0_SFT                    8
+#define AUXADC_ACCDET_DIG0_RSV0_MASK                   0xFF
+#define AUXADC_ACCDET_DIG0_RSV0_MASK_SFT               (0xFF << 8)
+
+#define RG_ACCDET_CK_PDN_ADDR                          \
+	MT6359_AUD_TOP_CKPDN_CON0
+#define RG_ACCDET_CK_PDN_SFT                           0
+#define RG_ACCDET_CK_PDN_MASK                          0x1
+#define RG_ACCDET_CK_PDN_MASK_SFT                      (0x1 << 0)
+
+#define RG_ACCDET_RST_ADDR                             \
+	MT6359_AUD_TOP_RST_CON0
+#define RG_ACCDET_RST_SFT                              1
+#define RG_ACCDET_RST_MASK                             0x1
+#define RG_ACCDET_RST_MASK_SFT                         (0x1 << 1)
+#define BANK_ACCDET_SWRST_ADDR                         \
+	MT6359_AUD_TOP_RST_BANK_CON0
+#define BANK_ACCDET_SWRST_SFT                          0
+#define BANK_ACCDET_SWRST_MASK                         0x1
+#define BANK_ACCDET_SWRST_MASK_SFT                     (0x1 << 0)
+
+#define RG_INT_EN_ACCDET_ADDR                          \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_SFT                           5
+#define RG_INT_EN_ACCDET_MASK                          0x1
+#define RG_INT_EN_ACCDET_MASK_SFT                      (0x1 << 5)
+#define RG_INT_EN_ACCDET_EINT0_ADDR                    \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_EINT0_SFT                     6
+#define RG_INT_EN_ACCDET_EINT0_MASK                    0x1
+#define RG_INT_EN_ACCDET_EINT0_MASK_SFT                (0x1 << 6)
+#define RG_INT_EN_ACCDET_EINT1_ADDR                    \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_EINT1_SFT                     7
+#define RG_INT_EN_ACCDET_EINT1_MASK                    0x1
+#define RG_INT_EN_ACCDET_EINT1_MASK_SFT                (0x1 << 7)
+
+#define RG_INT_MASK_ACCDET_ADDR                        \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_SFT                         5
+#define RG_INT_MASK_ACCDET_MASK                        0x1
+#define RG_INT_MASK_ACCDET_MASK_SFT                    (0x1 << 5)
+#define RG_INT_MASK_ACCDET_EINT0_ADDR                  \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_EINT0_SFT                   6
+#define RG_INT_MASK_ACCDET_EINT0_MASK                  0x1
+#define RG_INT_MASK_ACCDET_EINT0_MASK_SFT              (0x1 << 6)
+#define RG_INT_MASK_ACCDET_EINT1_ADDR                  \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_EINT1_SFT                   7
+#define RG_INT_MASK_ACCDET_EINT1_MASK                  0x1
+#define RG_INT_MASK_ACCDET_EINT1_MASK_SFT              (0x1 << 7)
+
+#define RG_INT_STATUS_ACCDET_ADDR                      \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_SFT                       5
+#define RG_INT_STATUS_ACCDET_MASK                      0x1
+#define RG_INT_STATUS_ACCDET_MASK_SFT                  (0x1 << 5)
+#define RG_INT_STATUS_ACCDET_EINT0_ADDR                \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_EINT0_SFT                 6
+#define RG_INT_STATUS_ACCDET_EINT0_MASK                0x1
+#define RG_INT_STATUS_ACCDET_EINT0_MASK_SFT            (0x1 << 6)
+#define RG_INT_STATUS_ACCDET_EINT1_ADDR                \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_EINT1_SFT                 7
+#define RG_INT_STATUS_ACCDET_EINT1_MASK                0x1
+#define RG_INT_STATUS_ACCDET_EINT1_MASK_SFT            (0x1 << 7)
+
+#define RG_INT_RAW_STATUS_ACCDET_ADDR                  \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_SFT                   5
+#define RG_INT_RAW_STATUS_ACCDET_MASK                  0x1
+#define RG_INT_RAW_STATUS_ACCDET_MASK_SFT              (0x1 << 5)
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_ADDR            \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_SFT             6
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_MASK            0x1
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_MASK_SFT        (0x1 << 6)
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_ADDR            \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_SFT             7
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_MASK            0x1
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_MASK_SFT        (0x1 << 7)
+
+#define RG_AUDACCDETMICBIAS0PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS0PULLLOW_SFT                0
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK_SFT           (0x1 << 0)
+#define RG_AUDACCDETMICBIAS1PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS1PULLLOW_SFT                1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK_SFT           (0x1 << 1)
+#define RG_AUDACCDETMICBIAS2PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS2PULLLOW_SFT                2
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK_SFT           (0x1 << 2)
+#define RG_AUDACCDETVIN1PULLLOW_ADDR                   \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVIN1PULLLOW_SFT                    3
+#define RG_AUDACCDETVIN1PULLLOW_MASK                   0x1
+#define RG_AUDACCDETVIN1PULLLOW_MASK_SFT               (0x1 << 3)
+#define RG_AUDACCDETVTHACAL_ADDR                       \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVTHACAL_SFT                        4
+#define RG_AUDACCDETVTHACAL_MASK                       0x1
+#define RG_AUDACCDETVTHACAL_MASK_SFT                   (0x1 << 4)
+#define RG_AUDACCDETVTHBCAL_ADDR                       \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVTHBCAL_SFT                        5
+#define RG_AUDACCDETVTHBCAL_MASK                       0x1
+#define RG_AUDACCDETVTHBCAL_MASK_SFT                   (0x1 << 5)
+#define RG_AUDACCDETTVDET_ADDR                         \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETTVDET_SFT                          6
+#define RG_AUDACCDETTVDET_MASK                         0x1
+#define RG_AUDACCDETTVDET_MASK_SFT                     (0x1 << 6)
+#define RG_ACCDETSEL_ADDR                              \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDETSEL_SFT                               7
+#define RG_ACCDETSEL_MASK                              0x1
+#define RG_ACCDETSEL_MASK_SFT                          (0x1 << 7)
+
+#define RG_AUDPWDBMICBIAS1_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDPWDBMICBIAS1_SFT                         0
+#define RG_AUDPWDBMICBIAS1_MASK                        0x1
+#define RG_AUDPWDBMICBIAS1_MASK_SFT                    (0x1 << 0)
+#define RG_AUDMICBIAS1BYPASSEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1BYPASSEN_SFT                     1
+#define RG_AUDMICBIAS1BYPASSEN_MASK                    0x1
+#define RG_AUDMICBIAS1BYPASSEN_MASK_SFT                (0x1 << 1)
+#define RG_AUDMICBIAS1LOWPEN_ADDR                      \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1LOWPEN_SFT                       2
+#define RG_AUDMICBIAS1LOWPEN_MASK                      0x1
+#define RG_AUDMICBIAS1LOWPEN_MASK_SFT                  (0x1 << 2)
+#define RG_AUDMICBIAS1VREF_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1VREF_SFT                         4
+#define RG_AUDMICBIAS1VREF_MASK                        0x7
+#define RG_AUDMICBIAS1VREF_MASK_SFT                    (0x7 << 4)
+#define RG_AUDMICBIAS1DCSW1PEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1DCSW1PEN_SFT                     8
+#define RG_AUDMICBIAS1DCSW1PEN_MASK                    0x1
+#define RG_AUDMICBIAS1DCSW1PEN_MASK_SFT                (0x1 << 8)
+#define RG_AUDMICBIAS1DCSW1NEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1DCSW1NEN_SFT                     9
+#define RG_AUDMICBIAS1DCSW1NEN_MASK                    0x1
+#define RG_AUDMICBIAS1DCSW1NEN_MASK_SFT                (0x1 << 9)
+#define RG_BANDGAPGEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON16
+#define RG_BANDGAPGEN_SFT                              10
+#define RG_BANDGAPGEN_MASK                             0x1
+#define RG_BANDGAPGEN_MASK_SFT                         (0x1 << 10)
+#define RG_AUDMICBIAS1HVEN_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1HVEN_SFT                         12
+#define RG_AUDMICBIAS1HVEN_MASK                        0x1
+#define RG_AUDMICBIAS1HVEN_MASK_SFT                    (0x1 << 12)
+#define RG_AUDMICBIAS1HVVREF_ADDR                      \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1HVVREF_SFT                       13
+#define RG_AUDMICBIAS1HVVREF_MASK                      0x1
+#define RG_AUDMICBIAS1HVVREF_MASK_SFT                  (0x1 << 13)
+
+#define RG_EINT0NOHYS_ADDR                             \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0NOHYS_SFT                              10
+#define RG_EINT0NOHYS_MASK                             0x1
+#define RG_EINT0NOHYS_MASK_SFT                         (0x1 << 10)
+#define RG_EINT0CONFIGACCDET_ADDR                      \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0CONFIGACCDET_SFT                       11
+#define RG_EINT0CONFIGACCDET_MASK                      0x1
+#define RG_EINT0CONFIGACCDET_MASK_SFT                  (0x1 << 11)
+#define RG_EINT0HIRENB_ADDR                            \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0HIRENB_SFT                             12
+#define RG_EINT0HIRENB_MASK                            0x1
+#define RG_EINT0HIRENB_MASK_SFT                        (0x1 << 12)
+#define RG_ACCDET2AUXRESBYPASS_ADDR                    \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDET2AUXRESBYPASS_SFT                     13
+#define RG_ACCDET2AUXRESBYPASS_MASK                    0x1
+#define RG_ACCDET2AUXRESBYPASS_MASK_SFT                (0x1 << 13)
+#define RG_ACCDET2AUXSWEN_ADDR                         \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDET2AUXSWEN_SFT                          14
+#define RG_ACCDET2AUXSWEN_MASK                         0x1
+#define RG_ACCDET2AUXSWEN_MASK_SFT                     (0x1 << 14)
+#define RG_AUDACCDETMICBIAS3PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS3PULLLOW_SFT                15
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK_SFT           (0x1 << 15)
+#define RG_EINT1CONFIGACCDET_ADDR                      \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1CONFIGACCDET_SFT                       0
+#define RG_EINT1CONFIGACCDET_MASK                      0x1
+#define RG_EINT1CONFIGACCDET_MASK_SFT                  (0x1 << 0)
+#define RG_EINT1HIRENB_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1HIRENB_SFT                             1
+#define RG_EINT1HIRENB_MASK                            0x1
+#define RG_EINT1HIRENB_MASK_SFT                        (0x1 << 1)
+#define RG_EINT1NOHYS_ADDR                             \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1NOHYS_SFT                              2
+#define RG_EINT1NOHYS_MASK                             0x1
+#define RG_EINT1NOHYS_MASK_SFT                         (0x1 << 2)
+#define RG_EINTCOMPVTH_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_EN_ADDR                               \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_EN_SFT                                8
+#define RG_MTEST_EN_MASK                               0x1
+#define RG_MTEST_EN_MASK_SFT                           (0x1 << 8)
+#define RG_MTEST_SEL_ADDR                              \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_SEL_SFT                               9
+#define RG_MTEST_SEL_MASK                              0x1
+#define RG_MTEST_SEL_MASK_SFT                          (0x1 << 9)
+#define RG_MTEST_CURRENT_ADDR                          \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_CURRENT_SFT                           10
+#define RG_MTEST_CURRENT_MASK                          0x1
+#define RG_MTEST_CURRENT_MASK_SFT                      (0x1 << 10)
+#define RG_ANALOGFDEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON19
+#define RG_ANALOGFDEN_SFT                              12
+#define RG_ANALOGFDEN_MASK                             0x1
+#define RG_ANALOGFDEN_MASK_SFT                         (0x1 << 12)
+#define RG_FDVIN1PPULLLOW_ADDR                         \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDVIN1PPULLLOW_SFT                          13
+#define RG_FDVIN1PPULLLOW_MASK                         0x1
+#define RG_FDVIN1PPULLLOW_MASK_SFT                     (0x1 << 13)
+#define RG_FDEINT0TYPE_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDEINT0TYPE_SFT                             14
+#define RG_FDEINT0TYPE_MASK                            0x1
+#define RG_FDEINT0TYPE_MASK_SFT                        (0x1 << 14)
+#define RG_FDEINT1TYPE_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDEINT1TYPE_SFT                             15
+#define RG_FDEINT1TYPE_MASK                            0x1
+#define RG_FDEINT1TYPE_MASK_SFT                        (0x1 << 15)
+#define RG_EINT0CMPEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CMPEN_SFT                              0
+#define RG_EINT0CMPEN_MASK                             0x1
+#define RG_EINT0CMPEN_MASK_SFT                         (0x1 << 0)
+#define RG_EINT0CMPMEN_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CMPMEN_SFT                             1
+#define RG_EINT0CMPMEN_MASK                            0x1
+#define RG_EINT0CMPMEN_MASK_SFT                        (0x1 << 1)
+#define RG_EINT0EN_ADDR                                \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0EN_SFT                                 2
+#define RG_EINT0EN_MASK                                0x1
+#define RG_EINT0EN_MASK_SFT                            (0x1 << 2)
+#define RG_EINT0CEN_ADDR                               \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CEN_SFT                                3
+#define RG_EINT0CEN_MASK                               0x1
+#define RG_EINT0CEN_MASK_SFT                           (0x1 << 3)
+#define RG_EINT0INVEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0INVEN_SFT                              4
+#define RG_EINT0INVEN_MASK                             0x1
+#define RG_EINT0INVEN_MASK_SFT                         (0x1 << 4)
+#define RG_EINT0CTURBO_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CTURBO_SFT                             5
+#define RG_EINT0CTURBO_MASK                            0x7
+#define RG_EINT0CTURBO_MASK_SFT                        (0x7 << 5)
+#define RG_EINT1CMPEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CMPEN_SFT                              8
+#define RG_EINT1CMPEN_MASK                             0x1
+#define RG_EINT1CMPEN_MASK_SFT                         (0x1 << 8)
+#define RG_EINT1CMPMEN_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CMPMEN_SFT                             9
+#define RG_EINT1CMPMEN_MASK                            0x1
+#define RG_EINT1CMPMEN_MASK_SFT                        (0x1 << 9)
+#define RG_EINT1EN_ADDR                                \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1EN_SFT                                 10
+#define RG_EINT1EN_MASK                                0x1
+#define RG_EINT1EN_MASK_SFT                            (0x1 << 10)
+#define RG_EINT1CEN_ADDR                               \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CEN_SFT                                11
+#define RG_EINT1CEN_MASK                               0x1
+#define RG_EINT1CEN_MASK_SFT                           (0x1 << 11)
+#define RG_EINT1INVEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1INVEN_SFT                              12
+#define RG_EINT1INVEN_MASK                             0x1
+#define RG_EINT1INVEN_MASK_SFT                         (0x1 << 12)
+#define RG_EINT1CTURBO_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CTURBO_SFT                             13
+#define RG_EINT1CTURBO_MASK                            0x7
+#define RG_EINT1CTURBO_MASK_SFT                        (0x7 << 13)
+#define RG_ACCDETSPARE_ADDR                            \
+	MT6359_AUDENC_ANA_CON21
+
+#define ACCDET_ANA_ID_ADDR                             \
+	MT6359_ACCDET_DSN_DIG_ID
+#define ACCDET_ANA_ID_SFT                              0
+#define ACCDET_ANA_ID_MASK                             0xFF
+#define ACCDET_ANA_ID_MASK_SFT                         (0xFF << 0)
+#define ACCDET_DIG_ID_ADDR                             \
+	MT6359_ACCDET_DSN_DIG_ID
+#define ACCDET_DIG_ID_SFT                              8
+#define ACCDET_DIG_ID_MASK                             0xFF
+#define ACCDET_DIG_ID_MASK_SFT                         (0xFF << 8)
+#define ACCDET_ANA_MINOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_ANA_MINOR_REV_SFT                       0
+#define ACCDET_ANA_MINOR_REV_MASK                      0xF
+#define ACCDET_ANA_MINOR_REV_MASK_SFT                  (0xF << 0)
+#define ACCDET_ANA_MAJOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_ANA_MAJOR_REV_SFT                       4
+#define ACCDET_ANA_MAJOR_REV_MASK                      0xF
+#define ACCDET_ANA_MAJOR_REV_MASK_SFT                  (0xF << 4)
+#define ACCDET_DIG_MINOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_DIG_MINOR_REV_SFT                       8
+#define ACCDET_DIG_MINOR_REV_MASK                      0xF
+#define ACCDET_DIG_MINOR_REV_MASK_SFT                  (0xF << 8)
+#define ACCDET_DIG_MAJOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_DIG_MAJOR_REV_SFT                       12
+#define ACCDET_DIG_MAJOR_REV_MASK                      0xF
+#define ACCDET_DIG_MAJOR_REV_MASK_SFT                  (0xF << 12)
+#define ACCDET_DSN_CBS_ADDR                            \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_DSN_CBS_SFT                             0
+#define ACCDET_DSN_CBS_MASK                            0x3
+#define ACCDET_DSN_CBS_MASK_SFT                        (0x3 << 0)
+#define ACCDET_DSN_BIX_ADDR                            \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_DSN_BIX_SFT                             2
+#define ACCDET_DSN_BIX_MASK                            0x3
+#define ACCDET_DSN_BIX_MASK_SFT                        (0x3 << 2)
+#define ACCDET_ESP_ADDR                                \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_ESP_SFT                                 8
+#define ACCDET_ESP_MASK                                0xFF
+#define ACCDET_ESP_MASK_SFT                            (0xFF << 8)
+#define ACCDET_DSN_FPI_ADDR                            \
+	MT6359_ACCDET_DSN_FPI
+#define ACCDET_DSN_FPI_SFT                             0
+#define ACCDET_DSN_FPI_MASK                            0xFF
+#define ACCDET_DSN_FPI_MASK_SFT                        (0xFF << 0)
+#define ACCDET_AUXADC_SEL_ADDR                         \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_SEL_SFT                          0
+#define ACCDET_AUXADC_SEL_MASK                         0x1
+#define ACCDET_AUXADC_SEL_MASK_SFT                     (0x1 << 0)
+#define ACCDET_AUXADC_SW_ADDR                          \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_SW_SFT                           1
+#define ACCDET_AUXADC_SW_MASK                          0x1
+#define ACCDET_AUXADC_SW_MASK_SFT                      (0x1 << 1)
+#define ACCDET_TEST_AUXADC_ADDR                        \
+	MT6359_ACCDET_CON0
+#define ACCDET_TEST_AUXADC_SFT                         2
+#define ACCDET_TEST_AUXADC_MASK                        0x1
+#define ACCDET_TEST_AUXADC_MASK_SFT                    (0x1 << 2)
+#define ACCDET_AUXADC_ANASWCTRL_SEL_ADDR               \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_ANASWCTRL_SEL_SFT                8
+#define ACCDET_AUXADC_ANASWCTRL_SEL_MASK               0x1
+#define ACCDET_AUXADC_ANASWCTRL_SEL_MASK_SFT           (0x1 << 8)
+#define AUDACCDETAUXADCSWCTRL_SEL_ADDR                 \
+	MT6359_ACCDET_CON0
+#define AUDACCDETAUXADCSWCTRL_SEL_SFT                  9
+#define AUDACCDETAUXADCSWCTRL_SEL_MASK                 0x1
+#define AUDACCDETAUXADCSWCTRL_SEL_MASK_SFT             (0x1 << 9)
+#define AUDACCDETAUXADCSWCTRL_SW_ADDR                  \
+	MT6359_ACCDET_CON0
+#define AUDACCDETAUXADCSWCTRL_SW_SFT                   10
+#define AUDACCDETAUXADCSWCTRL_SW_MASK                  0x1
+#define AUDACCDETAUXADCSWCTRL_SW_MASK_SFT              (0x1 << 10)
+#define ACCDET_TEST_ANA_ADDR                           \
+	MT6359_ACCDET_CON0
+#define ACCDET_TEST_ANA_SFT                            11
+#define ACCDET_TEST_ANA_MASK                           0x1
+#define ACCDET_TEST_ANA_MASK_SFT                       (0x1 << 11)
+#define RG_AUDACCDETRSV_ADDR                           \
+	MT6359_ACCDET_CON0
+#define RG_AUDACCDETRSV_SFT                            13
+#define RG_AUDACCDETRSV_MASK                           0x3
+#define RG_AUDACCDETRSV_MASK_SFT                       (0x3 << 13)
+#define ACCDET_SW_EN_ADDR                              \
+	MT6359_ACCDET_CON1
+#define ACCDET_SW_EN_SFT                               0
+#define ACCDET_SW_EN_MASK                              0x1
+#define ACCDET_SW_EN_MASK_SFT                          (0x1 << 0)
+#define ACCDET_SEQ_INIT_ADDR                           \
+	MT6359_ACCDET_CON1
+#define ACCDET_SEQ_INIT_SFT                            1
+#define ACCDET_SEQ_INIT_MASK                           0x1
+#define ACCDET_SEQ_INIT_MASK_SFT                       (0x1 << 1)
+#define ACCDET_EINT0_SW_EN_ADDR                        \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_SW_EN_SFT                         2
+#define ACCDET_EINT0_SW_EN_MASK                        0x1
+#define ACCDET_EINT0_SW_EN_MASK_SFT                    (0x1 << 2)
+#define ACCDET_EINT0_SEQ_INIT_ADDR                     \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_SEQ_INIT_SFT                      3
+#define ACCDET_EINT0_SEQ_INIT_MASK                     0x1
+#define ACCDET_EINT0_SEQ_INIT_MASK_SFT                 (0x1 << 3)
+#define ACCDET_EINT1_SW_EN_ADDR                        \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_SW_EN_SFT                         4
+#define ACCDET_EINT1_SW_EN_MASK                        0x1
+#define ACCDET_EINT1_SW_EN_MASK_SFT                    (0x1 << 4)
+#define ACCDET_EINT1_SEQ_INIT_ADDR                     \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_SEQ_INIT_SFT                      5
+#define ACCDET_EINT1_SEQ_INIT_MASK                     0x1
+#define ACCDET_EINT1_SEQ_INIT_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT0_INVERTER_SW_EN_ADDR               \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_INVERTER_SW_EN_SFT                6
+#define ACCDET_EINT0_INVERTER_SW_EN_MASK               0x1
+#define ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT           (0x1 << 6)
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_ADDR            \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_SFT             7
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_MASK            0x1
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_MASK_SFT        (0x1 << 7)
+#define ACCDET_EINT1_INVERTER_SW_EN_ADDR               \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_INVERTER_SW_EN_SFT                8
+#define ACCDET_EINT1_INVERTER_SW_EN_MASK               0x1
+#define ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT           (0x1 << 8)
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_ADDR            \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_SFT             9
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_MASK            0x1
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_MASK_SFT        (0x1 << 9)
+#define ACCDET_EINT0_M_SW_EN_ADDR                      \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_M_SW_EN_SFT                       10
+#define ACCDET_EINT0_M_SW_EN_MASK                      0x1
+#define ACCDET_EINT0_M_SW_EN_MASK_SFT                  (0x1 << 10)
+#define ACCDET_EINT1_M_SW_EN_ADDR                      \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_M_SW_EN_SFT                       11
+#define ACCDET_EINT1_M_SW_EN_MASK                      0x1
+#define ACCDET_EINT1_M_SW_EN_MASK_SFT                  (0x1 << 11)
+#define ACCDET_EINT_M_DETECT_EN_ADDR                   \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT_M_DETECT_EN_SFT                    12
+#define ACCDET_EINT_M_DETECT_EN_MASK                   0x1
+#define ACCDET_EINT_M_DETECT_EN_MASK_SFT               (0x1 << 12)
+#define ACCDET_CMP_PWM_EN_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_CMP_PWM_EN_SFT                          0
+#define ACCDET_CMP_PWM_EN_MASK                         0x1
+#define ACCDET_CMP_PWM_EN_MASK_SFT                     (0x1 << 0)
+#define ACCDET_VTH_PWM_EN_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_VTH_PWM_EN_SFT                          1
+#define ACCDET_VTH_PWM_EN_MASK                         0x1
+#define ACCDET_VTH_PWM_EN_MASK_SFT                     (0x1 << 1)
+#define ACCDET_MBIAS_PWM_EN_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_MBIAS_PWM_EN_SFT                        2
+#define ACCDET_MBIAS_PWM_EN_MASK                       0x1
+#define ACCDET_MBIAS_PWM_EN_MASK_SFT                   (0x1 << 2)
+#define ACCDET_EINT_EN_PWM_EN_ADDR                     \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_EN_PWM_EN_SFT                      3
+#define ACCDET_EINT_EN_PWM_EN_MASK                     0x1
+#define ACCDET_EINT_EN_PWM_EN_MASK_SFT                 (0x1 << 3)
+#define ACCDET_EINT_CMPEN_PWM_EN_ADDR                  \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CMPEN_PWM_EN_SFT                   4
+#define ACCDET_EINT_CMPEN_PWM_EN_MASK                  0x1
+#define ACCDET_EINT_CMPEN_PWM_EN_MASK_SFT              (0x1 << 4)
+#define ACCDET_EINT_CMPMEN_PWM_EN_ADDR                 \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CMPMEN_PWM_EN_SFT                  5
+#define ACCDET_EINT_CMPMEN_PWM_EN_MASK                 0x1
+#define ACCDET_EINT_CMPMEN_PWM_EN_MASK_SFT             (0x1 << 5)
+#define ACCDET_EINT_CTURBO_PWM_EN_ADDR                 \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CTURBO_PWM_EN_SFT                  6
+#define ACCDET_EINT_CTURBO_PWM_EN_MASK                 0x1
+#define ACCDET_EINT_CTURBO_PWM_EN_MASK_SFT             (0x1 << 6)
+#define ACCDET_CMP_PWM_IDLE_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_CMP_PWM_IDLE_SFT                        8
+#define ACCDET_CMP_PWM_IDLE_MASK                       0x1
+#define ACCDET_CMP_PWM_IDLE_MASK_SFT                   (0x1 << 8)
+#define ACCDET_VTH_PWM_IDLE_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_VTH_PWM_IDLE_SFT                        9
+#define ACCDET_VTH_PWM_IDLE_MASK                       0x1
+#define ACCDET_VTH_PWM_IDLE_MASK_SFT                   (0x1 << 9)
+#define ACCDET_MBIAS_PWM_IDLE_ADDR                     \
+	MT6359_ACCDET_CON2
+#define ACCDET_MBIAS_PWM_IDLE_SFT                      10
+#define ACCDET_MBIAS_PWM_IDLE_MASK                     0x1
+#define ACCDET_MBIAS_PWM_IDLE_MASK_SFT                 (0x1 << 10)
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_ADDR               \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_SFT                11
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_MASK               0x1
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_MASK_SFT           (0x1 << 11)
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_ADDR               \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_SFT                12
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_MASK               0x1
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_MASK_SFT           (0x1 << 12)
+#define ACCDET_PWM_EN_SW_ADDR                          \
+	MT6359_ACCDET_CON2
+#define ACCDET_PWM_EN_SW_SFT                           13
+#define ACCDET_PWM_EN_SW_MASK                          0x1
+#define ACCDET_PWM_EN_SW_MASK_SFT                      (0x1 << 13)
+#define ACCDET_PWM_EN_SEL_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_PWM_EN_SEL_SFT                          14
+#define ACCDET_PWM_EN_SEL_MASK                         0x3
+#define ACCDET_PWM_EN_SEL_MASK_SFT                     (0x3 << 14)
+#define ACCDET_PWM_WIDTH_ADDR                          \
+	MT6359_ACCDET_CON3
+#define ACCDET_PWM_WIDTH_SFT                           0
+#define ACCDET_PWM_WIDTH_MASK                          0xFFFF
+#define ACCDET_PWM_WIDTH_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_PWM_THRESH_ADDR                         \
+	MT6359_ACCDET_CON4
+#define ACCDET_PWM_THRESH_SFT                          0
+#define ACCDET_PWM_THRESH_MASK                         0xFFFF
+#define ACCDET_PWM_THRESH_MASK_SFT                     (0xFFFF << 0)
+#define ACCDET_RISE_DELAY_ADDR                         \
+	MT6359_ACCDET_CON5
+#define ACCDET_RISE_DELAY_SFT                          0
+#define ACCDET_RISE_DELAY_MASK                         0x7FFF
+#define ACCDET_RISE_DELAY_MASK_SFT                     (0x7FFF << 0)
+#define ACCDET_FALL_DELAY_ADDR                         \
+	MT6359_ACCDET_CON5
+#define ACCDET_FALL_DELAY_SFT                          15
+#define ACCDET_FALL_DELAY_MASK                         0x1
+#define ACCDET_FALL_DELAY_MASK_SFT                     (0x1 << 15)
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_ADDR             \
+	MT6359_ACCDET_CON6
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_SFT              0
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_MASK             0x7
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_MASK_SFT         (0x7 << 0)
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_ADDR              \
+	MT6359_ACCDET_CON6
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_SFT               4
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_MASK              0x7
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_MASK_SFT          (0x7 << 4)
+#define ACCDET_EINT_EN_PWM_THRESH_ADDR                 \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_EN_PWM_THRESH_SFT                  0
+#define ACCDET_EINT_EN_PWM_THRESH_MASK                 0x7
+#define ACCDET_EINT_EN_PWM_THRESH_MASK_SFT             (0x7 << 0)
+#define ACCDET_EINT_EN_PWM_WIDTH_ADDR                  \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_EN_PWM_WIDTH_SFT                   4
+#define ACCDET_EINT_EN_PWM_WIDTH_MASK                  0x3
+#define ACCDET_EINT_EN_PWM_WIDTH_MASK_SFT              (0x3 << 4)
+#define ACCDET_EINT_CMPEN_PWM_THRESH_ADDR              \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_CMPEN_PWM_THRESH_SFT               8
+#define ACCDET_EINT_CMPEN_PWM_THRESH_MASK              0x7
+#define ACCDET_EINT_CMPEN_PWM_THRESH_MASK_SFT          (0x7 << 8)
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_ADDR               \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_SFT                12
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_MASK               0x3
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_MASK_SFT           (0x3 << 12)
+#define ACCDET_DEBOUNCE0_ADDR                          \
+	MT6359_ACCDET_CON8
+#define ACCDET_DEBOUNCE0_SFT                           0
+#define ACCDET_DEBOUNCE0_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE0_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE1_ADDR                          \
+	MT6359_ACCDET_CON9
+#define ACCDET_DEBOUNCE1_SFT                           0
+#define ACCDET_DEBOUNCE1_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE1_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE2_ADDR                          \
+	MT6359_ACCDET_CON10
+#define ACCDET_DEBOUNCE2_SFT                           0
+#define ACCDET_DEBOUNCE2_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE2_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE3_ADDR                          \
+	MT6359_ACCDET_CON11
+#define ACCDET_DEBOUNCE3_SFT                           0
+#define ACCDET_DEBOUNCE3_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE3_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_ADDR            \
+	MT6359_ACCDET_CON12
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_SFT             0
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_MASK            0xFFFF
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_MASK_SFT        (0xFFFF << 0)
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_ADDR            \
+	MT6359_ACCDET_CON13
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_SFT             0
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_MASK            0xFFFF
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_MASK_SFT        (0xFFFF << 0)
+#define ACCDET_EINT_DEBOUNCE0_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE0_SFT                      0
+#define ACCDET_EINT_DEBOUNCE0_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE0_MASK_SFT                 (0xF << 0)
+#define ACCDET_EINT_DEBOUNCE1_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE1_SFT                      4
+#define ACCDET_EINT_DEBOUNCE1_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE1_MASK_SFT                 (0xF << 4)
+#define ACCDET_EINT_DEBOUNCE2_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE2_SFT                      8
+#define ACCDET_EINT_DEBOUNCE2_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE2_MASK_SFT                 (0xF << 8)
+#define ACCDET_EINT_DEBOUNCE3_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE3_SFT                      12
+#define ACCDET_EINT_DEBOUNCE3_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE3_MASK_SFT                 (0xF << 12)
+#define ACCDET_EINT_INVERTER_DEBOUNCE_ADDR             \
+	MT6359_ACCDET_CON15
+#define ACCDET_EINT_INVERTER_DEBOUNCE_SFT              0
+#define ACCDET_EINT_INVERTER_DEBOUNCE_MASK             0xF
+#define ACCDET_EINT_INVERTER_DEBOUNCE_MASK_SFT         (0xF << 0)
+#define ACCDET_IVAL_CUR_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_CUR_IN_SFT                         0
+#define ACCDET_IVAL_CUR_IN_MASK                        0x3
+#define ACCDET_IVAL_CUR_IN_MASK_SFT                    (0x3 << 0)
+#define ACCDET_IVAL_SAM_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_SAM_IN_SFT                         2
+#define ACCDET_IVAL_SAM_IN_MASK                        0x3
+#define ACCDET_IVAL_SAM_IN_MASK_SFT                    (0x3 << 2)
+#define ACCDET_IVAL_MEM_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_MEM_IN_SFT                         4
+#define ACCDET_IVAL_MEM_IN_MASK                        0x3
+#define ACCDET_IVAL_MEM_IN_MASK_SFT                    (0x3 << 4)
+#define ACCDET_EINT_IVAL_CUR_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_CUR_IN_SFT                    6
+#define ACCDET_EINT_IVAL_CUR_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_CUR_IN_MASK_SFT               (0x3 << 6)
+#define ACCDET_EINT_IVAL_SAM_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_SAM_IN_SFT                    8
+#define ACCDET_EINT_IVAL_SAM_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_SAM_IN_MASK_SFT               (0x3 << 8)
+#define ACCDET_EINT_IVAL_MEM_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_MEM_IN_SFT                    10
+#define ACCDET_EINT_IVAL_MEM_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_MEM_IN_MASK_SFT               (0x3 << 10)
+#define ACCDET_IVAL_SEL_ADDR                           \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_SEL_SFT                            12
+#define ACCDET_IVAL_SEL_MASK                           0x1
+#define ACCDET_IVAL_SEL_MASK_SFT                       (0x1 << 12)
+#define ACCDET_EINT_IVAL_SEL_ADDR                      \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_SEL_SFT                       13
+#define ACCDET_EINT_IVAL_SEL_MASK                      0x1
+#define ACCDET_EINT_IVAL_SEL_MASK_SFT                  (0x1 << 13)
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_SFT           0
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_MASK_SFT      (0x1 << 0)
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_SFT           1
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_MASK_SFT      (0x1 << 1)
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_SFT           2
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_MASK_SFT      (0x1 << 2)
+#define ACCDET_EINT_INVERTER_IVAL_SEL_ADDR             \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_SEL_SFT              3
+#define ACCDET_EINT_INVERTER_IVAL_SEL_MASK             0x1
+#define ACCDET_EINT_INVERTER_IVAL_SEL_MASK_SFT         (0x1 << 3)
+#define ACCDET_IRQ_ADDR                                \
+	MT6359_ACCDET_CON18
+#define ACCDET_IRQ_SFT                                 0
+#define ACCDET_IRQ_MASK                                0x1
+#define ACCDET_IRQ_MASK_SFT                            (0x1 << 0)
+#define ACCDET_EINT0_IRQ_ADDR                          \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT0_IRQ_SFT                           2
+#define ACCDET_EINT0_IRQ_MASK                          0x1
+#define ACCDET_EINT0_IRQ_MASK_SFT                      (0x1 << 2)
+#define ACCDET_EINT1_IRQ_ADDR                          \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT1_IRQ_SFT                           3
+#define ACCDET_EINT1_IRQ_MASK                          0x1
+#define ACCDET_EINT1_IRQ_MASK_SFT                      (0x1 << 3)
+#define ACCDET_EINT_IN_INVERSE_ADDR                    \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT_IN_INVERSE_SFT                     4
+#define ACCDET_EINT_IN_INVERSE_MASK                    0x1
+#define ACCDET_EINT_IN_INVERSE_MASK_SFT                (0x1 << 4)
+#define ACCDET_IRQ_CLR_ADDR                            \
+	MT6359_ACCDET_CON18
+#define ACCDET_IRQ_CLR_SFT                             8
+#define ACCDET_IRQ_CLR_MASK                            0x1
+#define ACCDET_IRQ_CLR_MASK_SFT                        (0x1 << 8)
+#define ACCDET_EINT0_IRQ_CLR_ADDR                      \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT0_IRQ_CLR_SFT                       10
+#define ACCDET_EINT0_IRQ_CLR_MASK                      0x1
+#define ACCDET_EINT0_IRQ_CLR_MASK_SFT                  (0x1 << 10)
+#define ACCDET_EINT1_IRQ_CLR_ADDR                      \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT1_IRQ_CLR_SFT                       11
+#define ACCDET_EINT1_IRQ_CLR_MASK                      0x1
+#define ACCDET_EINT1_IRQ_CLR_MASK_SFT                  (0x1 << 11)
+#define ACCDET_EINT_M_PLUG_IN_NUM_ADDR                 \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT_M_PLUG_IN_NUM_SFT                  12
+#define ACCDET_EINT_M_PLUG_IN_NUM_MASK                 0x7
+#define ACCDET_EINT_M_PLUG_IN_NUM_MASK_SFT             (0x7 << 12)
+#define ACCDET_DA_STABLE_ADDR                          \
+	MT6359_ACCDET_CON19
+#define ACCDET_DA_STABLE_SFT                           0
+#define ACCDET_DA_STABLE_MASK                          0x1
+#define ACCDET_DA_STABLE_MASK_SFT                      (0x1 << 0)
+#define ACCDET_EINT0_EN_STABLE_ADDR                    \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_EN_STABLE_SFT                     1
+#define ACCDET_EINT0_EN_STABLE_MASK                    0x1
+#define ACCDET_EINT0_EN_STABLE_MASK_SFT                (0x1 << 1)
+#define ACCDET_EINT0_CMPEN_STABLE_ADDR                 \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CMPEN_STABLE_SFT                  2
+#define ACCDET_EINT0_CMPEN_STABLE_MASK                 0x1
+#define ACCDET_EINT0_CMPEN_STABLE_MASK_SFT             (0x1 << 2)
+#define ACCDET_EINT0_CMPMEN_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CMPMEN_STABLE_SFT                 3
+#define ACCDET_EINT0_CMPMEN_STABLE_MASK                0x1
+#define ACCDET_EINT0_CMPMEN_STABLE_MASK_SFT            (0x1 << 3)
+#define ACCDET_EINT0_CTURBO_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CTURBO_STABLE_SFT                 4
+#define ACCDET_EINT0_CTURBO_STABLE_MASK                0x1
+#define ACCDET_EINT0_CTURBO_STABLE_MASK_SFT            (0x1 << 4)
+#define ACCDET_EINT0_CEN_STABLE_ADDR                   \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CEN_STABLE_SFT                    5
+#define ACCDET_EINT0_CEN_STABLE_MASK                   0x1
+#define ACCDET_EINT0_CEN_STABLE_MASK_SFT               (0x1 << 5)
+#define ACCDET_EINT1_EN_STABLE_ADDR                    \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_EN_STABLE_SFT                     6
+#define ACCDET_EINT1_EN_STABLE_MASK                    0x1
+#define ACCDET_EINT1_EN_STABLE_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT1_CMPEN_STABLE_ADDR                 \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CMPEN_STABLE_SFT                  7
+#define ACCDET_EINT1_CMPEN_STABLE_MASK                 0x1
+#define ACCDET_EINT1_CMPEN_STABLE_MASK_SFT             (0x1 << 7)
+#define ACCDET_EINT1_CMPMEN_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CMPMEN_STABLE_SFT                 8
+#define ACCDET_EINT1_CMPMEN_STABLE_MASK                0x1
+#define ACCDET_EINT1_CMPMEN_STABLE_MASK_SFT            (0x1 << 8)
+#define ACCDET_EINT1_CTURBO_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CTURBO_STABLE_SFT                 9
+#define ACCDET_EINT1_CTURBO_STABLE_MASK                0x1
+#define ACCDET_EINT1_CTURBO_STABLE_MASK_SFT            (0x1 << 9)
+#define ACCDET_EINT1_CEN_STABLE_ADDR                   \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CEN_STABLE_SFT                    10
+#define ACCDET_EINT1_CEN_STABLE_MASK                   0x1
+#define ACCDET_EINT1_CEN_STABLE_MASK_SFT               (0x1 << 10)
+#define ACCDET_HWMODE_EN_ADDR                          \
+	MT6359_ACCDET_CON20
+#define ACCDET_HWMODE_EN_SFT                           0
+#define ACCDET_HWMODE_EN_MASK                          0x1
+#define ACCDET_HWMODE_EN_MASK_SFT                      (0x1 << 0)
+#define ACCDET_HWMODE_SEL_ADDR                         \
+	MT6359_ACCDET_CON20
+#define ACCDET_HWMODE_SEL_SFT                          1
+#define ACCDET_HWMODE_SEL_MASK                         0x3
+#define ACCDET_HWMODE_SEL_MASK_SFT                     (0x3 << 1)
+#define ACCDET_PLUG_OUT_DETECT_ADDR                    \
+	MT6359_ACCDET_CON20
+#define ACCDET_PLUG_OUT_DETECT_SFT                     3
+#define ACCDET_PLUG_OUT_DETECT_MASK                    0x1
+#define ACCDET_PLUG_OUT_DETECT_MASK_SFT                (0x1 << 3)
+#define ACCDET_EINT0_REVERSE_ADDR                      \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT0_REVERSE_SFT                       4
+#define ACCDET_EINT0_REVERSE_MASK                      0x1
+#define ACCDET_EINT0_REVERSE_MASK_SFT                  (0x1 << 4)
+#define ACCDET_EINT1_REVERSE_ADDR                      \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT1_REVERSE_SFT                       5
+#define ACCDET_EINT1_REVERSE_MASK                      0x1
+#define ACCDET_EINT1_REVERSE_MASK_SFT                  (0x1 << 5)
+#define ACCDET_EINT_HWMODE_EN_ADDR                     \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_HWMODE_EN_SFT                      8
+#define ACCDET_EINT_HWMODE_EN_MASK                     0x1
+#define ACCDET_EINT_HWMODE_EN_MASK_SFT                 (0x1 << 8)
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_ADDR           \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_SFT            9
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_MASK           0x1
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_MASK_SFT       (0x1 << 9)
+#define ACCDET_EINT_M_PLUG_IN_EN_ADDR                  \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_M_PLUG_IN_EN_SFT                   10
+#define ACCDET_EINT_M_PLUG_IN_EN_MASK                  0x1
+#define ACCDET_EINT_M_PLUG_IN_EN_MASK_SFT              (0x1 << 10)
+#define ACCDET_EINT_M_HWMODE_EN_ADDR                   \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_M_HWMODE_EN_SFT                    11
+#define ACCDET_EINT_M_HWMODE_EN_MASK                   0x1
+#define ACCDET_EINT_M_HWMODE_EN_MASK_SFT               (0x1 << 11)
+#define ACCDET_TEST_CMPEN_ADDR                         \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_CMPEN_SFT                          0
+#define ACCDET_TEST_CMPEN_MASK                         0x1
+#define ACCDET_TEST_CMPEN_MASK_SFT                     (0x1 << 0)
+#define ACCDET_TEST_VTHEN_ADDR                         \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_VTHEN_SFT                          1
+#define ACCDET_TEST_VTHEN_MASK                         0x1
+#define ACCDET_TEST_VTHEN_MASK_SFT                     (0x1 << 1)
+#define ACCDET_TEST_MBIASEN_ADDR                       \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_MBIASEN_SFT                        2
+#define ACCDET_TEST_MBIASEN_MASK                       0x1
+#define ACCDET_TEST_MBIASEN_MASK_SFT                   (0x1 << 2)
+#define ACCDET_EINT_TEST_EN_ADDR                       \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_EN_SFT                        3
+#define ACCDET_EINT_TEST_EN_MASK                       0x1
+#define ACCDET_EINT_TEST_EN_MASK_SFT                   (0x1 << 3)
+#define ACCDET_EINT_TEST_INVEN_ADDR                    \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_INVEN_SFT                     4
+#define ACCDET_EINT_TEST_INVEN_MASK                    0x1
+#define ACCDET_EINT_TEST_INVEN_MASK_SFT                (0x1 << 4)
+#define ACCDET_EINT_TEST_CMPEN_ADDR                    \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPEN_SFT                     5
+#define ACCDET_EINT_TEST_CMPEN_MASK                    0x1
+#define ACCDET_EINT_TEST_CMPEN_MASK_SFT                (0x1 << 5)
+#define ACCDET_EINT_TEST_CMPMEN_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPMEN_SFT                    6
+#define ACCDET_EINT_TEST_CMPMEN_MASK                   0x1
+#define ACCDET_EINT_TEST_CMPMEN_MASK_SFT               (0x1 << 6)
+#define ACCDET_EINT_TEST_CTURBO_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CTURBO_SFT                    7
+#define ACCDET_EINT_TEST_CTURBO_MASK                   0x1
+#define ACCDET_EINT_TEST_CTURBO_MASK_SFT               (0x1 << 7)
+#define ACCDET_EINT_TEST_CEN_ADDR                      \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CEN_SFT                       8
+#define ACCDET_EINT_TEST_CEN_MASK                      0x1
+#define ACCDET_EINT_TEST_CEN_MASK_SFT                  (0x1 << 8)
+#define ACCDET_TEST_B_ADDR                             \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_B_SFT                              9
+#define ACCDET_TEST_B_MASK                             0x1
+#define ACCDET_TEST_B_MASK_SFT                         (0x1 << 9)
+#define ACCDET_TEST_A_ADDR                             \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_A_SFT                              10
+#define ACCDET_TEST_A_MASK                             0x1
+#define ACCDET_TEST_A_MASK_SFT                         (0x1 << 10)
+#define ACCDET_EINT_TEST_CMPOUT_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPOUT_SFT                    11
+#define ACCDET_EINT_TEST_CMPOUT_MASK                   0x1
+#define ACCDET_EINT_TEST_CMPOUT_MASK_SFT               (0x1 << 11)
+#define ACCDET_EINT_TEST_CMPMOUT_ADDR                  \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPMOUT_SFT                   12
+#define ACCDET_EINT_TEST_CMPMOUT_MASK                  0x1
+#define ACCDET_EINT_TEST_CMPMOUT_MASK_SFT              (0x1 << 12)
+#define ACCDET_EINT_TEST_INVOUT_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_INVOUT_SFT                    13
+#define ACCDET_EINT_TEST_INVOUT_MASK                   0x1
+#define ACCDET_EINT_TEST_INVOUT_MASK_SFT               (0x1 << 13)
+#define ACCDET_CMPEN_SEL_ADDR                          \
+	MT6359_ACCDET_CON22
+#define ACCDET_CMPEN_SEL_SFT                           0
+#define ACCDET_CMPEN_SEL_MASK                          0x1
+#define ACCDET_CMPEN_SEL_MASK_SFT                      (0x1 << 0)
+#define ACCDET_VTHEN_SEL_ADDR                          \
+	MT6359_ACCDET_CON22
+#define ACCDET_VTHEN_SEL_SFT                           1
+#define ACCDET_VTHEN_SEL_MASK                          0x1
+#define ACCDET_VTHEN_SEL_MASK_SFT                      (0x1 << 1)
+#define ACCDET_MBIASEN_SEL_ADDR                        \
+	MT6359_ACCDET_CON22
+#define ACCDET_MBIASEN_SEL_SFT                         2
+#define ACCDET_MBIASEN_SEL_MASK                        0x1
+#define ACCDET_MBIASEN_SEL_MASK_SFT                    (0x1 << 2)
+#define ACCDET_EINT_EN_SEL_ADDR                        \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_EN_SEL_SFT                         3
+#define ACCDET_EINT_EN_SEL_MASK                        0x1
+#define ACCDET_EINT_EN_SEL_MASK_SFT                    (0x1 << 3)
+#define ACCDET_EINT_INVEN_SEL_ADDR                     \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_INVEN_SEL_SFT                      4
+#define ACCDET_EINT_INVEN_SEL_MASK                     0x1
+#define ACCDET_EINT_INVEN_SEL_MASK_SFT                 (0x1 << 4)
+#define ACCDET_EINT_CMPEN_SEL_ADDR                     \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPEN_SEL_SFT                      5
+#define ACCDET_EINT_CMPEN_SEL_MASK                     0x1
+#define ACCDET_EINT_CMPEN_SEL_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT_CMPMEN_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPMEN_SEL_SFT                     6
+#define ACCDET_EINT_CMPMEN_SEL_MASK                    0x1
+#define ACCDET_EINT_CMPMEN_SEL_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT_CTURBO_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CTURBO_SEL_SFT                     7
+#define ACCDET_EINT_CTURBO_SEL_MASK                    0x1
+#define ACCDET_EINT_CTURBO_SEL_MASK_SFT                (0x1 << 7)
+#define ACCDET_B_SEL_ADDR                              \
+	MT6359_ACCDET_CON22
+#define ACCDET_B_SEL_SFT                               9
+#define ACCDET_B_SEL_MASK                              0x1
+#define ACCDET_B_SEL_MASK_SFT                          (0x1 << 9)
+#define ACCDET_A_SEL_ADDR                              \
+	MT6359_ACCDET_CON22
+#define ACCDET_A_SEL_SFT                               10
+#define ACCDET_A_SEL_MASK                              0x1
+#define ACCDET_A_SEL_MASK_SFT                          (0x1 << 10)
+#define ACCDET_EINT_CMPOUT_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPOUT_SEL_SFT                     11
+#define ACCDET_EINT_CMPOUT_SEL_MASK                    0x1
+#define ACCDET_EINT_CMPOUT_SEL_MASK_SFT                (0x1 << 11)
+#define ACCDET_EINT_CMPMOUT_SEL_ADDR                   \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPMOUT_SEL_SFT                    12
+#define ACCDET_EINT_CMPMOUT_SEL_MASK                   0x1
+#define ACCDET_EINT_CMPMOUT_SEL_MASK_SFT               (0x1 << 12)
+#define ACCDET_EINT_INVOUT_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_INVOUT_SEL_SFT                     13
+#define ACCDET_EINT_INVOUT_SEL_MASK                    0x1
+#define ACCDET_EINT_INVOUT_SEL_MASK_SFT                (0x1 << 13)
+#define ACCDET_CMPEN_SW_ADDR                           \
+	MT6359_ACCDET_CON23
+#define ACCDET_CMPEN_SW_SFT                            0
+#define ACCDET_CMPEN_SW_MASK                           0x1
+#define ACCDET_CMPEN_SW_MASK_SFT                       (0x1 << 0)
+#define ACCDET_VTHEN_SW_ADDR                           \
+	MT6359_ACCDET_CON23
+#define ACCDET_VTHEN_SW_SFT                            1
+#define ACCDET_VTHEN_SW_MASK                           0x1
+#define ACCDET_VTHEN_SW_MASK_SFT                       (0x1 << 1)
+#define ACCDET_MBIASEN_SW_ADDR                         \
+	MT6359_ACCDET_CON23
+#define ACCDET_MBIASEN_SW_SFT                          2
+#define ACCDET_MBIASEN_SW_MASK                         0x1
+#define ACCDET_MBIASEN_SW_MASK_SFT                     (0x1 << 2)
+#define ACCDET_EINT0_EN_SW_ADDR                        \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_EN_SW_SFT                         3
+#define ACCDET_EINT0_EN_SW_MASK                        0x1
+#define ACCDET_EINT0_EN_SW_MASK_SFT                    (0x1 << 3)
+#define ACCDET_EINT0_INVEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_INVEN_SW_SFT                      4
+#define ACCDET_EINT0_INVEN_SW_MASK                     0x1
+#define ACCDET_EINT0_INVEN_SW_MASK_SFT                 (0x1 << 4)
+#define ACCDET_EINT0_CMPEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CMPEN_SW_SFT                      5
+#define ACCDET_EINT0_CMPEN_SW_MASK                     0x1
+#define ACCDET_EINT0_CMPEN_SW_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT0_CMPMEN_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CMPMEN_SW_SFT                     6
+#define ACCDET_EINT0_CMPMEN_SW_MASK                    0x1
+#define ACCDET_EINT0_CMPMEN_SW_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT0_CTURBO_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CTURBO_SW_SFT                     7
+#define ACCDET_EINT0_CTURBO_SW_MASK                    0x1
+#define ACCDET_EINT0_CTURBO_SW_MASK_SFT                (0x1 << 7)
+#define ACCDET_EINT1_EN_SW_ADDR                        \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_EN_SW_SFT                         8
+#define ACCDET_EINT1_EN_SW_MASK                        0x1
+#define ACCDET_EINT1_EN_SW_MASK_SFT                    (0x1 << 8)
+#define ACCDET_EINT1_INVEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_INVEN_SW_SFT                      9
+#define ACCDET_EINT1_INVEN_SW_MASK                     0x1
+#define ACCDET_EINT1_INVEN_SW_MASK_SFT                 (0x1 << 9)
+#define ACCDET_EINT1_CMPEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CMPEN_SW_SFT                      10
+#define ACCDET_EINT1_CMPEN_SW_MASK                     0x1
+#define ACCDET_EINT1_CMPEN_SW_MASK_SFT                 (0x1 << 10)
+#define ACCDET_EINT1_CMPMEN_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CMPMEN_SW_SFT                     11
+#define ACCDET_EINT1_CMPMEN_SW_MASK                    0x1
+#define ACCDET_EINT1_CMPMEN_SW_MASK_SFT                (0x1 << 11)
+#define ACCDET_EINT1_CTURBO_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CTURBO_SW_SFT                     12
+#define ACCDET_EINT1_CTURBO_SW_MASK                    0x1
+#define ACCDET_EINT1_CTURBO_SW_MASK_SFT                (0x1 << 12)
+#define ACCDET_B_SW_ADDR                               \
+	MT6359_ACCDET_CON24
+#define ACCDET_B_SW_SFT                                0
+#define ACCDET_B_SW_MASK                               0x1
+#define ACCDET_B_SW_MASK_SFT                           (0x1 << 0)
+#define ACCDET_A_SW_ADDR                               \
+	MT6359_ACCDET_CON24
+#define ACCDET_A_SW_SFT                                1
+#define ACCDET_A_SW_MASK                               0x1
+#define ACCDET_A_SW_MASK_SFT                           (0x1 << 1)
+#define ACCDET_EINT0_CMPOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_CMPOUT_SW_SFT                     2
+#define ACCDET_EINT0_CMPOUT_SW_MASK                    0x1
+#define ACCDET_EINT0_CMPOUT_SW_MASK_SFT                (0x1 << 2)
+#define ACCDET_EINT0_CMPMOUT_SW_ADDR                   \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_CMPMOUT_SW_SFT                    3
+#define ACCDET_EINT0_CMPMOUT_SW_MASK                   0x1
+#define ACCDET_EINT0_CMPMOUT_SW_MASK_SFT               (0x1 << 3)
+#define ACCDET_EINT0_INVOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_INVOUT_SW_SFT                     4
+#define ACCDET_EINT0_INVOUT_SW_MASK                    0x1
+#define ACCDET_EINT0_INVOUT_SW_MASK_SFT                (0x1 << 4)
+#define ACCDET_EINT1_CMPOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_CMPOUT_SW_SFT                     5
+#define ACCDET_EINT1_CMPOUT_SW_MASK                    0x1
+#define ACCDET_EINT1_CMPOUT_SW_MASK_SFT                (0x1 << 5)
+#define ACCDET_EINT1_CMPMOUT_SW_ADDR                   \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_CMPMOUT_SW_SFT                    6
+#define ACCDET_EINT1_CMPMOUT_SW_MASK                   0x1
+#define ACCDET_EINT1_CMPMOUT_SW_MASK_SFT               (0x1 << 6)
+#define ACCDET_EINT1_INVOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_INVOUT_SW_SFT                     7
+#define ACCDET_EINT1_INVOUT_SW_MASK                    0x1
+#define ACCDET_EINT1_INVOUT_SW_MASK_SFT                (0x1 << 7)
+#define AD_AUDACCDETCMPOB_ADDR                         \
+	MT6359_ACCDET_CON25
+#define AD_AUDACCDETCMPOB_SFT                          0
+#define AD_AUDACCDETCMPOB_MASK                         0x1
+#define AD_AUDACCDETCMPOB_MASK_SFT                     (0x1 << 0)
+#define AD_AUDACCDETCMPOA_ADDR                         \
+	MT6359_ACCDET_CON25
+#define AD_AUDACCDETCMPOA_SFT                          1
+#define AD_AUDACCDETCMPOA_MASK                         0x1
+#define AD_AUDACCDETCMPOA_MASK_SFT                     (0x1 << 1)
+#define ACCDET_CUR_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_CUR_IN_SFT                              2
+#define ACCDET_CUR_IN_MASK                             0x3
+#define ACCDET_CUR_IN_MASK_SFT                         (0x3 << 2)
+#define ACCDET_SAM_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_SAM_IN_SFT                              4
+#define ACCDET_SAM_IN_MASK                             0x3
+#define ACCDET_SAM_IN_MASK_SFT                         (0x3 << 4)
+#define ACCDET_MEM_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_MEM_IN_SFT                              6
+#define ACCDET_MEM_IN_MASK                             0x3
+#define ACCDET_MEM_IN_MASK_SFT                         (0x3 << 6)
+#define ACCDET_STATE_ADDR                              \
+	MT6359_ACCDET_CON25
+#define ACCDET_STATE_SFT                               8
+#define ACCDET_STATE_MASK                              0x7
+#define ACCDET_STATE_MASK_SFT                          (0x7 << 8)
+#define DA_AUDACCDETMBIASCLK_ADDR                      \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETMBIASCLK_SFT                       12
+#define DA_AUDACCDETMBIASCLK_MASK                      0x1
+#define DA_AUDACCDETMBIASCLK_MASK_SFT                  (0x1 << 12)
+#define DA_AUDACCDETVTHCLK_ADDR                        \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETVTHCLK_SFT                         13
+#define DA_AUDACCDETVTHCLK_MASK                        0x1
+#define DA_AUDACCDETVTHCLK_MASK_SFT                    (0x1 << 13)
+#define DA_AUDACCDETCMPCLK_ADDR                        \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETCMPCLK_SFT                         14
+#define DA_AUDACCDETCMPCLK_MASK                        0x1
+#define DA_AUDACCDETCMPCLK_MASK_SFT                    (0x1 << 14)
+#define DA_AUDACCDETAUXADCSWCTRL_ADDR                  \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETAUXADCSWCTRL_SFT                   15
+#define DA_AUDACCDETAUXADCSWCTRL_MASK                  0x1
+#define DA_AUDACCDETAUXADCSWCTRL_MASK_SFT              (0x1 << 15)
+#define AD_EINT0CMPMOUT_ADDR                           \
+	MT6359_ACCDET_CON26
+#define AD_EINT0CMPMOUT_SFT                            0
+#define AD_EINT0CMPMOUT_MASK                           0x1
+#define AD_EINT0CMPMOUT_MASK_SFT                       (0x1 << 0)
+#define AD_EINT0CMPOUT_ADDR                            \
+	MT6359_ACCDET_CON26
+#define AD_EINT0CMPOUT_SFT                             1
+#define AD_EINT0CMPOUT_MASK                            0x1
+#define AD_EINT0CMPOUT_MASK_SFT                        (0x1 << 1)
+#define ACCDET_EINT0_CUR_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_CUR_IN_SFT                        2
+#define ACCDET_EINT0_CUR_IN_MASK                       0x3
+#define ACCDET_EINT0_CUR_IN_MASK_SFT                   (0x3 << 2)
+#define ACCDET_EINT0_SAM_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_SAM_IN_SFT                        4
+#define ACCDET_EINT0_SAM_IN_MASK                       0x3
+#define ACCDET_EINT0_SAM_IN_MASK_SFT                   (0x3 << 4)
+#define ACCDET_EINT0_MEM_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_MEM_IN_SFT                        6
+#define ACCDET_EINT0_MEM_IN_MASK                       0x3
+#define ACCDET_EINT0_MEM_IN_MASK_SFT                   (0x3 << 6)
+#define ACCDET_EINT0_STATE_ADDR                        \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_STATE_SFT                         8
+#define ACCDET_EINT0_STATE_MASK                        0x7
+#define ACCDET_EINT0_STATE_MASK_SFT                    (0x7 << 8)
+#define DA_EINT0CMPEN_ADDR                             \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CMPEN_SFT                              13
+#define DA_EINT0CMPEN_MASK                             0x1
+#define DA_EINT0CMPEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT0CMPMEN_ADDR                            \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CMPMEN_SFT                             14
+#define DA_EINT0CMPMEN_MASK                            0x1
+#define DA_EINT0CMPMEN_MASK_SFT                        (0x1 << 14)
+#define DA_EINT0CTURBO_ADDR                            \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CTURBO_SFT                             15
+#define DA_EINT0CTURBO_MASK                            0x1
+#define DA_EINT0CTURBO_MASK_SFT                        (0x1 << 15)
+#define AD_EINT1CMPMOUT_ADDR                           \
+	MT6359_ACCDET_CON27
+#define AD_EINT1CMPMOUT_SFT                            0
+#define AD_EINT1CMPMOUT_MASK                           0x1
+#define AD_EINT1CMPMOUT_MASK_SFT                       (0x1 << 0)
+#define AD_EINT1CMPOUT_ADDR                            \
+	MT6359_ACCDET_CON27
+#define AD_EINT1CMPOUT_SFT                             1
+#define AD_EINT1CMPOUT_MASK                            0x1
+#define AD_EINT1CMPOUT_MASK_SFT                        (0x1 << 1)
+#define ACCDET_EINT1_CUR_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_CUR_IN_SFT                        2
+#define ACCDET_EINT1_CUR_IN_MASK                       0x3
+#define ACCDET_EINT1_CUR_IN_MASK_SFT                   (0x3 << 2)
+#define ACCDET_EINT1_SAM_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_SAM_IN_SFT                        4
+#define ACCDET_EINT1_SAM_IN_MASK                       0x3
+#define ACCDET_EINT1_SAM_IN_MASK_SFT                   (0x3 << 4)
+#define ACCDET_EINT1_MEM_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_MEM_IN_SFT                        6
+#define ACCDET_EINT1_MEM_IN_MASK                       0x3
+#define ACCDET_EINT1_MEM_IN_MASK_SFT                   (0x3 << 6)
+#define ACCDET_EINT1_STATE_ADDR                        \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_STATE_SFT                         8
+#define ACCDET_EINT1_STATE_MASK                        0x7
+#define ACCDET_EINT1_STATE_MASK_SFT                    (0x7 << 8)
+#define DA_EINT1CMPEN_ADDR                             \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CMPEN_SFT                              13
+#define DA_EINT1CMPEN_MASK                             0x1
+#define DA_EINT1CMPEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT1CMPMEN_ADDR                            \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CMPMEN_SFT                             14
+#define DA_EINT1CMPMEN_MASK                            0x1
+#define DA_EINT1CMPMEN_MASK_SFT                        (0x1 << 14)
+#define DA_EINT1CTURBO_ADDR                            \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CTURBO_SFT                             15
+#define DA_EINT1CTURBO_MASK                            0x1
+#define DA_EINT1CTURBO_MASK_SFT                        (0x1 << 15)
+#define AD_EINT0INVOUT_ADDR                            \
+	MT6359_ACCDET_CON28
+#define AD_EINT0INVOUT_SFT                             0
+#define AD_EINT0INVOUT_MASK                            0x1
+#define AD_EINT0INVOUT_MASK_SFT                        (0x1 << 0)
+#define ACCDET_EINT0_INVERTER_CUR_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_CUR_IN_SFT               1
+#define ACCDET_EINT0_INVERTER_CUR_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_CUR_IN_MASK_SFT          (0x1 << 1)
+#define ACCDET_EINT0_INVERTER_SAM_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_SAM_IN_SFT               2
+#define ACCDET_EINT0_INVERTER_SAM_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_SAM_IN_MASK_SFT          (0x1 << 2)
+#define ACCDET_EINT0_INVERTER_MEM_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_MEM_IN_SFT               3
+#define ACCDET_EINT0_INVERTER_MEM_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_MEM_IN_MASK_SFT          (0x1 << 3)
+#define ACCDET_EINT0_INVERTER_STATE_ADDR               \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_STATE_SFT                8
+#define ACCDET_EINT0_INVERTER_STATE_MASK               0x7
+#define ACCDET_EINT0_INVERTER_STATE_MASK_SFT           (0x7 << 8)
+#define DA_EINT0EN_ADDR                                \
+	MT6359_ACCDET_CON28
+#define DA_EINT0EN_SFT                                 12
+#define DA_EINT0EN_MASK                                0x1
+#define DA_EINT0EN_MASK_SFT                            (0x1 << 12)
+#define DA_EINT0INVEN_ADDR                             \
+	MT6359_ACCDET_CON28
+#define DA_EINT0INVEN_SFT                              13
+#define DA_EINT0INVEN_MASK                             0x1
+#define DA_EINT0INVEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT0CEN_ADDR                               \
+	MT6359_ACCDET_CON28
+#define DA_EINT0CEN_SFT                                14
+#define DA_EINT0CEN_MASK                               0x1
+#define DA_EINT0CEN_MASK_SFT                           (0x1 << 14)
+#define AD_EINT1INVOUT_ADDR                            \
+	MT6359_ACCDET_CON29
+#define AD_EINT1INVOUT_SFT                             0
+#define AD_EINT1INVOUT_MASK                            0x1
+#define AD_EINT1INVOUT_MASK_SFT                        (0x1 << 0)
+#define ACCDET_EINT1_INVERTER_CUR_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_CUR_IN_SFT               1
+#define ACCDET_EINT1_INVERTER_CUR_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_CUR_IN_MASK_SFT          (0x1 << 1)
+#define ACCDET_EINT1_INVERTER_SAM_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_SAM_IN_SFT               2
+#define ACCDET_EINT1_INVERTER_SAM_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_SAM_IN_MASK_SFT          (0x1 << 2)
+#define ACCDET_EINT1_INVERTER_MEM_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_MEM_IN_SFT               3
+#define ACCDET_EINT1_INVERTER_MEM_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_MEM_IN_MASK_SFT          (0x1 << 3)
+#define ACCDET_EINT1_INVERTER_STATE_ADDR               \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_STATE_SFT                8
+#define ACCDET_EINT1_INVERTER_STATE_MASK               0x7
+#define ACCDET_EINT1_INVERTER_STATE_MASK_SFT           (0x7 << 8)
+#define DA_EINT1EN_ADDR                                \
+	MT6359_ACCDET_CON29
+#define DA_EINT1EN_SFT                                 12
+#define DA_EINT1EN_MASK                                0x1
+#define DA_EINT1EN_MASK_SFT                            (0x1 << 12)
+#define DA_EINT1INVEN_ADDR                             \
+	MT6359_ACCDET_CON29
+#define DA_EINT1INVEN_SFT                              13
+#define DA_EINT1INVEN_MASK                             0x1
+#define DA_EINT1INVEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT1CEN_ADDR                               \
+	MT6359_ACCDET_CON29
+#define DA_EINT1CEN_SFT                                14
+#define DA_EINT1CEN_MASK                               0x1
+#define DA_EINT1CEN_MASK_SFT                           (0x1 << 14)
+#define ACCDET_EN_ADDR                                 \
+	MT6359_ACCDET_CON30
+#define ACCDET_EN_SFT                                  0
+#define ACCDET_EN_MASK                                 0x1
+#define ACCDET_EN_MASK_SFT                             (0x1 << 0)
+#define ACCDET_EINT0_EN_ADDR                           \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_EN_SFT                            1
+#define ACCDET_EINT0_EN_MASK                           0x1
+#define ACCDET_EINT0_EN_MASK_SFT                       (0x1 << 1)
+#define ACCDET_EINT1_EN_ADDR                           \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_EN_SFT                            2
+#define ACCDET_EINT1_EN_MASK                           0x1
+#define ACCDET_EINT1_EN_MASK_SFT                       (0x1 << 2)
+#define ACCDET_EINT0_M_EN_ADDR                         \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_M_EN_SFT                          3
+#define ACCDET_EINT0_M_EN_MASK                         0x1
+#define ACCDET_EINT0_M_EN_MASK_SFT                     (0x1 << 3)
+#define ACCDET_EINT0_DETECT_MOISTURE_ADDR              \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_DETECT_MOISTURE_SFT               4
+#define ACCDET_EINT0_DETECT_MOISTURE_MASK              0x1
+#define ACCDET_EINT0_DETECT_MOISTURE_MASK_SFT          (0x1 << 4)
+#define ACCDET_EINT0_PLUG_IN_ADDR                      \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_PLUG_IN_SFT                       5
+#define ACCDET_EINT0_PLUG_IN_MASK                      0x1
+#define ACCDET_EINT0_PLUG_IN_MASK_SFT                  (0x1 << 5)
+#define ACCDET_EINT0_M_PLUG_IN_ADDR                    \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_M_PLUG_IN_SFT                     6
+#define ACCDET_EINT0_M_PLUG_IN_MASK                    0x1
+#define ACCDET_EINT0_M_PLUG_IN_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT1_M_EN_ADDR                         \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_M_EN_SFT                          7
+#define ACCDET_EINT1_M_EN_MASK                         0x1
+#define ACCDET_EINT1_M_EN_MASK_SFT                     (0x1 << 7)
+#define ACCDET_EINT1_DETECT_MOISTURE_ADDR              \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_DETECT_MOISTURE_SFT               8
+#define ACCDET_EINT1_DETECT_MOISTURE_MASK              0x1
+#define ACCDET_EINT1_DETECT_MOISTURE_MASK_SFT          (0x1 << 8)
+#define ACCDET_EINT1_PLUG_IN_ADDR                      \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_PLUG_IN_SFT                       9
+#define ACCDET_EINT1_PLUG_IN_MASK                      0x1
+#define ACCDET_EINT1_PLUG_IN_MASK_SFT                  (0x1 << 9)
+#define ACCDET_EINT1_M_PLUG_IN_ADDR                    \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_M_PLUG_IN_SFT                     10
+#define ACCDET_EINT1_M_PLUG_IN_MASK                    0x1
+#define ACCDET_EINT1_M_PLUG_IN_MASK_SFT                (0x1 << 10)
+#define ACCDET_CUR_DEB_ADDR                            \
+	MT6359_ACCDET_CON31
+#define ACCDET_CUR_DEB_SFT                             0
+#define ACCDET_CUR_DEB_MASK                            0xFFFF
+#define ACCDET_CUR_DEB_MASK_SFT                        (0xFFFF << 0)
+#define ACCDET_EINT0_CUR_DEB_ADDR                      \
+	MT6359_ACCDET_CON32
+#define ACCDET_EINT0_CUR_DEB_SFT                       0
+#define ACCDET_EINT0_CUR_DEB_MASK                      0x7FFF
+#define ACCDET_EINT0_CUR_DEB_MASK_SFT                  (0x7FFF << 0)
+#define ACCDET_EINT1_CUR_DEB_ADDR                      \
+	MT6359_ACCDET_CON33
+#define ACCDET_EINT1_CUR_DEB_SFT                       0
+#define ACCDET_EINT1_CUR_DEB_MASK                      0x7FFF
+#define ACCDET_EINT1_CUR_DEB_MASK_SFT                  (0x7FFF << 0)
+#define ACCDET_EINT0_INVERTER_CUR_DEB_ADDR             \
+	MT6359_ACCDET_CON34
+#define ACCDET_EINT0_INVERTER_CUR_DEB_SFT              0
+#define ACCDET_EINT0_INVERTER_CUR_DEB_MASK             0x7FFF
+#define ACCDET_EINT0_INVERTER_CUR_DEB_MASK_SFT         (0x7FFF << 0)
+#define ACCDET_EINT1_INVERTER_CUR_DEB_ADDR             \
+	MT6359_ACCDET_CON35
+#define ACCDET_EINT1_INVERTER_CUR_DEB_SFT              0
+#define ACCDET_EINT1_INVERTER_CUR_DEB_MASK             0x7FFF
+#define ACCDET_EINT1_INVERTER_CUR_DEB_MASK_SFT         (0x7FFF << 0)
+#define AD_AUDACCDETCMPOB_MON_ADDR                     \
+	MT6359_ACCDET_CON36
+#define AD_AUDACCDETCMPOB_MON_SFT                      0
+#define AD_AUDACCDETCMPOB_MON_MASK                     0x1
+#define AD_AUDACCDETCMPOB_MON_MASK_SFT                 (0x1 << 0)
+#define AD_AUDACCDETCMPOA_MON_ADDR                     \
+	MT6359_ACCDET_CON36
+#define AD_AUDACCDETCMPOA_MON_SFT                      1
+#define AD_AUDACCDETCMPOA_MON_MASK                     0x1
+#define AD_AUDACCDETCMPOA_MON_MASK_SFT                 (0x1 << 1)
+#define AD_EINT0CMPMOUT_MON_ADDR                       \
+	MT6359_ACCDET_CON36
+#define AD_EINT0CMPMOUT_MON_SFT                        2
+#define AD_EINT0CMPMOUT_MON_MASK                       0x1
+#define AD_EINT0CMPMOUT_MON_MASK_SFT                   (0x1 << 2)
+#define AD_EINT0CMPOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT0CMPOUT_MON_SFT                         3
+#define AD_EINT0CMPOUT_MON_MASK                        0x1
+#define AD_EINT0CMPOUT_MON_MASK_SFT                    (0x1 << 3)
+#define AD_EINT0INVOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT0INVOUT_MON_SFT                         4
+#define AD_EINT0INVOUT_MON_MASK                        0x1
+#define AD_EINT0INVOUT_MON_MASK_SFT                    (0x1 << 4)
+#define AD_EINT1CMPMOUT_MON_ADDR                       \
+	MT6359_ACCDET_CON36
+#define AD_EINT1CMPMOUT_MON_SFT                        5
+#define AD_EINT1CMPMOUT_MON_MASK                       0x1
+#define AD_EINT1CMPMOUT_MON_MASK_SFT                   (0x1 << 5)
+#define AD_EINT1CMPOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT1CMPOUT_MON_SFT                         6
+#define AD_EINT1CMPOUT_MON_MASK                        0x1
+#define AD_EINT1CMPOUT_MON_MASK_SFT                    (0x1 << 6)
+#define AD_EINT1INVOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT1INVOUT_MON_SFT                         7
+#define AD_EINT1INVOUT_MON_MASK                        0x1
+#define AD_EINT1INVOUT_MON_MASK_SFT                    (0x1 << 7)
+#define DA_AUDACCDETCMPCLK_MON_ADDR                    \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETCMPCLK_MON_SFT                     0
+#define DA_AUDACCDETCMPCLK_MON_MASK                    0x1
+#define DA_AUDACCDETCMPCLK_MON_MASK_SFT                (0x1 << 0)
+#define DA_AUDACCDETVTHCLK_MON_ADDR                    \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETVTHCLK_MON_SFT                     1
+#define DA_AUDACCDETVTHCLK_MON_MASK                    0x1
+#define DA_AUDACCDETVTHCLK_MON_MASK_SFT                (0x1 << 1)
+#define DA_AUDACCDETMBIASCLK_MON_ADDR                  \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETMBIASCLK_MON_SFT                   2
+#define DA_AUDACCDETMBIASCLK_MON_MASK                  0x1
+#define DA_AUDACCDETMBIASCLK_MON_MASK_SFT              (0x1 << 2)
+#define DA_AUDACCDETAUXADCSWCTRL_MON_ADDR              \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETAUXADCSWCTRL_MON_SFT               3
+#define DA_AUDACCDETAUXADCSWCTRL_MON_MASK              0x1
+#define DA_AUDACCDETAUXADCSWCTRL_MON_MASK_SFT          (0x1 << 3)
+#define DA_EINT0CTURBO_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CTURBO_MON_SFT                         0
+#define DA_EINT0CTURBO_MON_MASK                        0x1
+#define DA_EINT0CTURBO_MON_MASK_SFT                    (0x1 << 0)
+#define DA_EINT0CMPMEN_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CMPMEN_MON_SFT                         1
+#define DA_EINT0CMPMEN_MON_MASK                        0x1
+#define DA_EINT0CMPMEN_MON_MASK_SFT                    (0x1 << 1)
+#define DA_EINT0CMPEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CMPEN_MON_SFT                          2
+#define DA_EINT0CMPEN_MON_MASK                         0x1
+#define DA_EINT0CMPEN_MON_MASK_SFT                     (0x1 << 2)
+#define DA_EINT0INVEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT0INVEN_MON_SFT                          3
+#define DA_EINT0INVEN_MON_MASK                         0x1
+#define DA_EINT0INVEN_MON_MASK_SFT                     (0x1 << 3)
+#define DA_EINT0CEN_MON_ADDR                           \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CEN_MON_SFT                            4
+#define DA_EINT0CEN_MON_MASK                           0x1
+#define DA_EINT0CEN_MON_MASK_SFT                       (0x1 << 4)
+#define DA_EINT0EN_MON_ADDR                            \
+	MT6359_ACCDET_CON38
+#define DA_EINT0EN_MON_SFT                             5
+#define DA_EINT0EN_MON_MASK                            0x1
+#define DA_EINT0EN_MON_MASK_SFT                        (0x1 << 5)
+#define DA_EINT1CTURBO_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CTURBO_MON_SFT                         8
+#define DA_EINT1CTURBO_MON_MASK                        0x1
+#define DA_EINT1CTURBO_MON_MASK_SFT                    (0x1 << 8)
+#define DA_EINT1CMPMEN_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CMPMEN_MON_SFT                         9
+#define DA_EINT1CMPMEN_MON_MASK                        0x1
+#define DA_EINT1CMPMEN_MON_MASK_SFT                    (0x1 << 9)
+#define DA_EINT1CMPEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CMPEN_MON_SFT                          10
+#define DA_EINT1CMPEN_MON_MASK                         0x1
+#define DA_EINT1CMPEN_MON_MASK_SFT                     (0x1 << 10)
+#define DA_EINT1INVEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT1INVEN_MON_SFT                          11
+#define DA_EINT1INVEN_MON_MASK                         0x1
+#define DA_EINT1INVEN_MON_MASK_SFT                     (0x1 << 11)
+#define DA_EINT1CEN_MON_ADDR                           \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CEN_MON_SFT                            12
+#define DA_EINT1CEN_MON_MASK                           0x1
+#define DA_EINT1CEN_MON_MASK_SFT                       (0x1 << 12)
+#define DA_EINT1EN_MON_ADDR                            \
+	MT6359_ACCDET_CON38
+#define DA_EINT1EN_MON_SFT                             13
+#define DA_EINT1EN_MON_MASK                            0x1
+#define DA_EINT1EN_MON_MASK_SFT                        (0x1 << 13)
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_ADDR              \
+	MT6359_ACCDET_CON39
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_SFT               0
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_MASK              0x7
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_MASK_SFT          (0x7 << 0)
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_ADDR              \
+	MT6359_ACCDET_CON39
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_SFT               4
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_MASK              0x7
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_MASK_SFT          (0x7 << 4)
+#define ACCDET_MON_FLAG_EN_ADDR                        \
+	MT6359_ACCDET_CON40
+#define ACCDET_MON_FLAG_EN_SFT                         0
+#define ACCDET_MON_FLAG_EN_MASK                        0x1
+#define ACCDET_MON_FLAG_EN_MASK_SFT                    (0x1 << 0)
+#define ACCDET_MON_FLAG_SEL_ADDR                       \
+	MT6359_ACCDET_CON40
+#define ACCDET_MON_FLAG_SEL_SFT                        4
+#define ACCDET_MON_FLAG_SEL_MASK                       0xF
+#define ACCDET_MON_FLAG_SEL_MASK_SFT                   (0xF << 4)
+
+#define RG_AUDPWDBMICBIAS0_ADDR                        \
+	MT6359_AUDENC_ANA_CON15
+#define RG_AUDPWDBMICBIAS0_SFT                         0
+#define RG_AUDPWDBMICBIAS0_MASK                        0x1
+#define RG_AUDPWDBMICBIAS0_MASK_SFT                    (0x1 << 0)
+#define RG_AUDPREAMPLON_ADDR                           \
+	MT6359_AUDENC_ANA_CON0
+#define RG_AUDPREAMPLON_SFT                            0
+#define RG_AUDPREAMPLON_MASK                           0x1
+#define RG_AUDPREAMPLON_MASK_SFT                       (0x1 << 0)
+#define RG_CLKSQ_EN_ADDR                               \
+	MT6359_AUDENC_ANA_CON23
+#define RG_CLKSQ_EN_SFT                                0
+#define RG_CLKSQ_EN_MASK                               0x1
+#define RG_CLKSQ_EN_MASK_SFT                           (0x1 << 0)
+#define RG_RTC32K_CK_PDN_ADDR                          \
+	MT6359_TOP_CKPDN_CON0
+#define RG_RTC32K_CK_PDN_SFT                           15
+#define RG_RTC32K_CK_PDN_MASK                          0x1
+#define RG_RTC32K_CK_PDN_MASK_SFT                      (0x1 << 15)
+#define RG_HPLOUTPUTSTBENH_VAUDP32_ADDR                \
+	MT6359_AUDDEC_ANA_CON2
+#define RG_HPLOUTPUTSTBENH_VAUDP32_SFT                 0
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK                0x7
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK_SFT            (0x7 << 0)
+#define AUXADC_RQST_CH5_ADDR                           \
+	MT6359_AUXADC_RQST0
+#define AUXADC_RQST_CH5_SFT                            5
+#define AUXADC_RQST_CH5_MASK                           0x1
+#define AUXADC_RQST_CH5_MASK_SFT                       (0x1 << 5)
+#define RG_LDO_VUSB_HW0_OP_EN_ADDR                     \
+	MT6359_LDO_VUSB_OP_EN
+#define RG_LDO_VUSB_HW0_OP_EN_SFT                      0
+#define RG_LDO_VUSB_HW0_OP_EN_MASK                     0x1
+#define RG_LDO_VUSB_HW0_OP_EN_MASK_SFT                 (0x1 << 0)
+#define RG_HPROUTPUTSTBENH_VAUDP32_ADDR                \
+	MT6359_AUDDEC_ANA_CON2
+#define RG_HPROUTPUTSTBENH_VAUDP32_SFT                 4
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK                0x7
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK_SFT            (0x7 << 4)
+#define RG_NCP_PDDIS_EN_ADDR                           \
+	MT6359_AFE_NCP_CFG2
+#define RG_NCP_PDDIS_EN_SFT                            0
+#define RG_NCP_PDDIS_EN_MASK                           0x1
+#define RG_NCP_PDDIS_EN_MASK_SFT                       (0x1 << 0)
+#define RG_SCK32K_CK_PDN_ADDR                          \
+	MT6359_TOP_CKPDN_CON0
+#define RG_SCK32K_CK_PDN_SFT                           0
+#define RG_SCK32K_CK_PDN_MASK                          0x1
+#define RG_SCK32K_CK_PDN_MASK_SFT                      (0x1 << 0)
 /* AUDENC_ANA_CON18: */
-#define RG_ACCDET_MODE_ANA11_MODE1			(0x000f)
-#define RG_ACCDET_MODE_ANA11_MODE2			(0x008f)
-#define RG_ACCDET_MODE_ANA11_MODE6			(0x008f)
+#define RG_ACCDET_MODE_ANA11_MODE1	(0x000F)
+#define RG_ACCDET_MODE_ANA11_MODE2	(0x008F)
+#define RG_ACCDET_MODE_ANA11_MODE6	(0x008F)

 /* AUXADC_ADC5:  Auxadc CH5 read data */
 #define AUXADC_DATA_RDY_CH5		BIT(15)
 #define AUXADC_DATA_PROCEED_CH5		BIT(15)
-#define AUXADC_DATA_MASK				(0x0fff)
+#define AUXADC_DATA_MASK		(0x0FFF)

 /* AUXADC_RQST0_SET:  Auxadc CH5 request, relevant 0x07EC */
 #define AUXADC_RQST_CH5_SET		BIT(5)
 /* AUXADC_RQST0_CLR:  Auxadc CH5 request, relevant 0x07EC */
 #define AUXADC_RQST_CH5_CLR		BIT(5)

-#define ACCDET_CALI_MASK0				(0xff)
-#define ACCDET_CALI_MASK1				(0xff << 8)
-#define ACCDET_CALI_MASK2				(0xff)
-#define ACCDET_CALI_MASK3				(0xff << 8)
-#define ACCDET_CALI_MASK4				(0xff)
-
-#define ACCDET_EINT1_IRQ_CLR_B11	BIT(PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT)
-#define ACCDET_EINT0_IRQ_CLR_B10	BIT(PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
-#define ACCDET_EINT_IRQ_CLR_B10_11	(0x03 << \
-					 PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
-#define ACCDET_IRQ_CLR_B8		BIT(PMIC_ACCDET_IRQ_CLR_SHIFT)
+#define ACCDET_CALI_MASK0		(0xFF)
+#define ACCDET_CALI_MASK1		(0xFF << 8)
+#define ACCDET_CALI_MASK2		(0xFF)
+#define ACCDET_CALI_MASK3		(0xFF << 8)
+#define ACCDET_CALI_MASK4		(0xFF)

-#define ACCDET_EINT1_IRQ_B3		BIT(PMIC_ACCDET_EINT1_IRQ_SHIFT)
-#define ACCDET_EINT0_IRQ_B2		BIT(PMIC_ACCDET_EINT0_IRQ_SHIFT)
-#define ACCDET_EINT_IRQ_B2_B3		(0x03 << PMIC_ACCDET_EINT0_IRQ_SHIFT)
-#define ACCDET_IRQ_B0			BIT(PMIC_ACCDET_IRQ_SHIFT)
+#define ACCDET_EINT_IRQ_B2_B3		(0x03 << ACCDET_EINT0_IRQ_SFT)

 /* ACCDET_CON25: RO, accdet FSM state,etc.*/
-#define ACCDET_STATE_MEM_IN_OFFSET	(PMIC_ACCDET_MEM_IN_SHIFT)
-#define ACCDET_STATE_AB_MASK				(0x03)
-#define ACCDET_STATE_AB_00				(0x00)
-#define ACCDET_STATE_AB_01				(0x01)
-#define ACCDET_STATE_AB_10				(0x02)
-#define ACCDET_STATE_AB_11				(0x03)
+#define ACCDET_STATE_MEM_IN_OFFSET	(ACCDET_MEM_IN_SFT)
+#define ACCDET_STATE_AB_MASK		(0x03)
+#define ACCDET_STATE_AB_00		(0x00)
+#define ACCDET_STATE_AB_01		(0x01)
+#define ACCDET_STATE_AB_10		(0x02)
+#define ACCDET_STATE_AB_11		(0x03)

 /* ACCDET_CON19 */
-#define ACCDET_EINT0_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_EN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT))
-
-#define ACCDET_EINT1_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_EN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT))
+#define ACCDET_EINT0_STABLE_VAL ((ACCDET_DA_STABLE_SFT) | \
+				(ACCDET_EINT0_EN_STABLE_SFT) | \
+				(ACCDET_EINT0_CMPEN_STABLE_SFT) | \
+				(ACCDET_EINT0_CEN_STABLE_SFT))
+
+#define ACCDET_EINT1_STABLE_VAL ((ACCDET_DA_STABLE_SFT) | \
+				(ACCDET_EINT1_EN_STABLE_SFT) | \
+				(ACCDET_EINT1_CMPEN_STABLE_SFT) | \
+				(ACCDET_EINT1_CEN_STABLE_SFT))

 /* The following are used for mt6359.c */
 /* MT6359_DCXO_CW12 */
--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
