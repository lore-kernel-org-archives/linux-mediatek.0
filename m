Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0283C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3O0/Mz/lprdpPQOxLl+wwsZwG8lzgV8rVDy4Bhr3IQ=; b=ZoZSaMiWAqN18UqU2M6ESqXJpl
	ZdMt4jHM1sfAUwmTMDZoAaVDVIbdMa4YCugsip7IdxRJq6LyOnjN+IlhUzLRh5MjaStkqD34iNg2B
	BHRlTwTY5WsQ/CGqFZ84uI4v3eeRJflDNF5dThp2DkiDe0q0f0Zmdpt+R/uZRMFYwFZpXyFd6KI3x
	Yl0k1hJ+iF/xyG72DmDPLjiIf44t2fJuhWXilH0PedxqCWX4DxIK2xYc7vXB7cKa1zlDCFu/PDwsz
	VuMbgkNmcwJt1pRvBBITjUtagbGdAk8Q/IHMhL50v9o+4SOPDm3IWD6Lsd5d08vWWqG/pSC7kUd8r
	SfNALgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EsV-0056qf-3r; Mon, 04 Jul 2022 05:44:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Eoq-00547u-Kw; Mon, 04 Jul 2022 05:40:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id d17so7990374pfq.9;
        Sun, 03 Jul 2022 22:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R3O0/Mz/lprdpPQOxLl+wwsZwG8lzgV8rVDy4Bhr3IQ=;
        b=LfjYDKckD6QosPH8c+tLDdw+5/mzeQKKNB7KunOFbiwA6AE7+LlzyHUpDrxd6DCXay
         yaRZEJ9Fwi13+PnQv/MwE76wNw/dStNPDRB6Jgd27InfjwT+YsNLxnSs3BYTXr2HLeqX
         1h5nroIrM+dNsxJwlrIkAz5lGlJrNHDLOlDFqvCN1BRzdIytcBwRGbnzjCCR2e7Ij8A4
         NCE/H597ksTIhaGHrBCtchOhbynMY+GlwEEiSj8iLX7Tu/ocI3EVVrLhQ3AF0dfKXyNe
         5ZFQQ1PS6sDjM1SrM30aaKV7OGB+OaSdBuPqREsgv0opmyNvrxBfEswIJqSivldbnMoH
         /PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R3O0/Mz/lprdpPQOxLl+wwsZwG8lzgV8rVDy4Bhr3IQ=;
        b=ff1otA2BiLb7T90c1ujk1Y5rceQu6PkEi4BgFUnZKNl++gYWemcwfjTvBr+8FWDFhT
         ynFJ7xF3woc01RSiF1PFlf+YW8NcXzkLmEjNvX14BU29YNVWg5zLHZNABSWVHZ0w9aNF
         EH5CWpVjEexBbB3WOcgwhEupzJ4NyYIUMTI3Efy5hwGtEIe1S/1OvaookEGstRmX1RdX
         y5XSIjx79hP9nSz6cSD9Y9D4owZgrAZzczPSLAUY4cc4ZLM7KB00ya56bhDTULdTqj74
         duHJUpMJYKV10RWQqRdDBxFxRYOchAPsqB7xWPj61OZlVSb76n2lFuR43Gdlut54eV1M
         aT0g==
X-Gm-Message-State: AJIora9HtqAWSakLTmS2BPmMVPYK/iTutJON0VW6CrNqsNl2aQOq/YJ+
	hGmE+HVrgFUnEiLf84+BuKI=
X-Google-Smtp-Source: AGRyM1uQwVVIIoFF691YQuefKWsQKT2SWLpYihUrJhJ9/upo8cRNTYJbPoin4zmRFrTroppH2P/RNQ==
X-Received: by 2002:aa7:92d2:0:b0:51b:4d60:6475 with SMTP id k18-20020aa792d2000000b0051b4d606475mr33212509pfa.73.1656913223184;
        Sun, 03 Jul 2022 22:40:23 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:40:22 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: [PATCH v4 09/13] iio: adc: mt6370: Add Mediatek MT6370 support
Date: Mon,  4 Jul 2022 13:38:57 +0800
Message-Id: <20220704053901.728-10-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_224024_747537_3C1DBA0F 
X-CRM114-Status: GOOD (  26.04  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 ADC support.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v4:
- Replace text "Mediatek" with "MediaTek"
- Replace all "first dev_err() and then return" with "return
  dev_err_probe()"
- Add Copyright in the source code
- Add module name related description in Kconfig
- Add unit suffix of macro "ADC_CONV_POLLING_TIME"
- Add new macro "ADC_CONV_TIME_MS"
- Adjust the position of include file <mediatek,mt6370_adc.h>
- Adjust the postions between <linux/module.h> and
  <linux/mod_devicetable.h>
- Fix some incorrect characters
---
 drivers/iio/adc/Kconfig      |  12 ++
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/mt6370-adc.c | 274 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/iio/adc/mt6370-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 48ace74..fca382d 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -737,6 +737,18 @@ config MEDIATEK_MT6360_ADC
 	  is used in smartphones and tablets and supports a 11 channel
 	  general purpose ADC.
 
+config MEDIATEK_MT6370_ADC
+	tristate "MediaTek MT6370 ADC driver"
+	depends on MFD_MT6370
+	help
+	  Say yes here to enable MediaTek MT6370 ADC support.
+
+	  This ADC driver provides 9 channels for system monitoring (charger
+	  current, voltage, and temperature).
+
+	  This driver can also be built as a module. If so the module
+	  will be called "mt6370-adc.ko".
+
 config MEDIATEK_MT6577_AUXADC
 	tristate "MediaTek AUXADC driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 39d806f..0ce285c 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
 obj-$(CONFIG_MCP3911) += mcp3911.o
 obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
+obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.c
new file mode 100644
index 0000000..0493d6e
--- /dev/null
+++ b/drivers/iio/adc/mt6370-adc.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiaEn Wu <chiaen_wu@richtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/iio/iio.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
+
+#define MT6370_REG_CHG_CTRL3		0x113 /* AICR */
+#define MT6370_REG_CHG_CTRL7		0x117 /* ICHG */
+#define MT6370_REG_CHG_ADC		0x121
+#define MT6370_REG_ADC_DATA_H		0x14C
+
+#define MT6370_ADC_START_MASK		BIT(0)
+#define MT6370_ADC_IN_SEL_MASK		GENMASK(7, 4)
+#define MT6370_AICR_ICHG_MASK		GENMASK(7, 2)
+
+#define MT6370_AICR_400MA		0x6
+#define MT6370_ICHG_500MA		0x4
+#define MT6370_ICHG_900MA		0x8
+
+#define ADC_CONV_TIME_US		35000
+#define ADC_CONV_TIME_MS		(ADC_CONV_TIME_US / 1000)
+#define ADC_CONV_POLLING_TIME_US	1000
+
+struct mt6370_adc_data {
+	struct device *dev;
+	struct regmap *regmap;
+	/*
+	 * This mutex lock is for preventing the different ADC channels
+	 * from being read at the same time.
+	 */
+	struct mutex adc_lock;
+};
+
+static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
+				   unsigned long addr, int *val)
+{
+	__be16 be_val;
+	unsigned int reg_val;
+	int ret;
+
+	mutex_lock(&priv->adc_lock);
+
+	reg_val = MT6370_ADC_START_MASK |
+		  FIELD_PREP(MT6370_ADC_IN_SEL_MASK, addr);
+	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, reg_val);
+	if (ret)
+		goto adc_unlock;
+
+	msleep(ADC_CONV_TIME_MS);
+
+	ret = regmap_read_poll_timeout(priv->regmap,
+				       MT6370_REG_CHG_ADC, reg_val,
+				       !(reg_val & MT6370_ADC_START_MASK),
+				       ADC_CONV_POLLING_TIME_US,
+				       ADC_CONV_TIME_US * 3);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read ADC register (%d)\n", ret);
+		goto adc_unlock;
+	}
+
+	ret = regmap_raw_read(priv->regmap, MT6370_REG_ADC_DATA_H,
+			      &be_val, sizeof(be_val));
+	if (ret)
+		goto adc_unlock;
+
+	*val = be16_to_cpu(be_val);
+	ret = IIO_VAL_INT;
+
+adc_unlock:
+	mutex_unlock(&priv->adc_lock);
+
+	return ret;
+}
+
+static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
+				 int chan, int *val1, int *val2)
+{
+	unsigned int reg_val;
+	int ret;
+
+	switch (chan) {
+	case MT6370_CHAN_VBAT:
+	case MT6370_CHAN_VSYS:
+	case MT6370_CHAN_CHG_VDDP:
+		*val1 = 5;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_IBUS:
+		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL3, &reg_val);
+		if (ret)
+			return ret;
+
+		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
+		if (reg_val < MT6370_AICR_400MA)
+			*val1 = 3350;
+		else
+			*val1 = 5000;
+
+		*val2 = 100;
+
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_IBAT:
+		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL7, &reg_val);
+		if (ret)
+			return ret;
+
+		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
+		if (reg_val < MT6370_ICHG_500MA)
+			*val1 = 2375;
+		else if (reg_val >= MT6370_ICHG_500MA &&
+			 reg_val < MT6370_ICHG_900MA)
+			*val1 = 2680;
+		else
+			*val1 = 5000;
+
+		*val2 = 100;
+
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_VBUSDIV5:
+		*val1 = 25;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_VBUSDIV2:
+		*val1 = 50;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_TS_BAT:
+		*val1 = 25;
+		*val2 = 10000;
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_TEMP_JC:
+		*val1 = 2000;
+		return IIO_VAL_FRACTIONAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6370_adc_read_offset(struct mt6370_adc_data *priv,
+				  int chan, int *val)
+{
+	*val = -20;
+
+	return IIO_VAL_INT;
+}
+
+static int mt6370_adc_read_raw(struct iio_dev *iio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct mt6370_adc_data *priv = iio_priv(iio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		return mt6370_adc_read_channel(priv, chan->channel,
+					       chan->address, val);
+	case IIO_CHAN_INFO_SCALE:
+		return mt6370_adc_read_scale(priv, chan->channel, val, val2);
+	case IIO_CHAN_INFO_OFFSET:
+		return mt6370_adc_read_offset(priv, chan->channel, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {
+	[MT6370_CHAN_VBUSDIV5] = "vbusdiv5",
+	[MT6370_CHAN_VBUSDIV2] = "vbusdiv2",
+	[MT6370_CHAN_VSYS] = "vsys",
+	[MT6370_CHAN_VBAT] = "vbat",
+	[MT6370_CHAN_TS_BAT] = "ts_bat",
+	[MT6370_CHAN_IBUS] = "ibus",
+	[MT6370_CHAN_IBAT] = "ibat",
+	[MT6370_CHAN_CHG_VDDP] = "chg_vddp",
+	[MT6370_CHAN_TEMP_JC] = "temp_jc",
+};
+
+static int mt6370_adc_read_label(struct iio_dev *iio_dev,
+				 struct iio_chan_spec const *chan, char *label)
+{
+	return snprintf(label, PAGE_SIZE, "%s\n",
+			mt6370_channel_labels[chan->channel]);
+}
+
+static const struct iio_info mt6370_adc_iio_info = {
+	.read_raw = mt6370_adc_read_raw,
+	.read_label = mt6370_adc_read_label,
+};
+
+#define MT6370_ADC_CHAN(_idx, _type, _addr, _extra_info) {	\
+	.type = _type,						\
+	.channel = MT6370_CHAN_##_idx,				\
+	.address = _addr,					\
+	.scan_index = MT6370_CHAN_##_idx,			\
+	.indexed = 1,						\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
+			      BIT(IIO_CHAN_INFO_SCALE) |	\
+			      _extra_info,			\
+}
+
+static const struct iio_chan_spec mt6370_adc_channels[] = {
+	MT6370_ADC_CHAN(VBUSDIV5, IIO_VOLTAGE, 1, 0),
+	MT6370_ADC_CHAN(VBUSDIV2, IIO_VOLTAGE, 2, 0),
+	MT6370_ADC_CHAN(VSYS, IIO_VOLTAGE, 3, 0),
+	MT6370_ADC_CHAN(VBAT, IIO_VOLTAGE, 4, 0),
+	MT6370_ADC_CHAN(TS_BAT, IIO_VOLTAGE, 6, 0),
+	MT6370_ADC_CHAN(IBUS, IIO_CURRENT, 8, 0),
+	MT6370_ADC_CHAN(IBAT, IIO_CURRENT, 9, 0),
+	MT6370_ADC_CHAN(CHG_VDDP, IIO_VOLTAGE, 11, 0),
+	MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12, BIT(IIO_CHAN_INFO_OFFSET)),
+};
+
+static int mt6370_adc_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct mt6370_adc_data *priv;
+	struct regmap *regmap;
+	struct iio_dev *indio_dev;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Failed to get regmap\n");
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*priv));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	priv = iio_priv(indio_dev);
+	priv->dev = &pdev->dev;
+	priv->regmap = regmap;
+	mutex_init(&priv->adc_lock);
+
+	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to reset ADC\n");
+
+	indio_dev->name = "mt6370-adc";
+	indio_dev->info = &mt6370_adc_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mt6370_adc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
+
+	return devm_iio_device_register(&pdev->dev, indio_dev);
+}
+
+static const struct of_device_id mt6370_adc_of_id[] = {
+	{ .compatible = "mediatek,mt6370-adc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_adc_of_id);
+
+static struct platform_driver mt6370_adc_driver = {
+	.driver = {
+		.name = "mt6370-adc",
+		.of_match_table = mt6370_adc_of_id,
+	},
+	.probe = mt6370_adc_probe,
+};
+module_platform_driver(mt6370_adc_driver);
+
+MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
+MODULE_DESCRIPTION("MT6370 ADC Drvier");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4


