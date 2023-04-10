Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB1C76196
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPs93IfuGwwJkC4njN2KzdGL1xWxl/Kl8g2czwyDGHo=; b=KJGBbZm4eKUssEc6pyPudOi8Oh
	rgpyugobhXUqs9EuGroGHz5ewgo4L7kLi4ogpsCmfEdFQhCqtcaqOx5COU+9EPJzI+FgLfzYVTapX
	KAUf7jXEF4pnrZRgbwjixTshONWIYS8i22EDfyYARihc75x+dGU1nTNrtLXGhR8Zzfgl5oTzDUzzG
	wNxeEZGInk+XQpJyPGJzGUo9XRPQoBvigIlX6XFQKTFnukkCwAnG+Rc/NKFD55/5MxNor2pAmZXdr
	B7lzLKatBexihMgxJkwm1cUW9gxbDMiB8INfg6yD55ZkGJ73ZGBTDVkChRPwbR63BFgickfz4vXki
	0zPrAgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plorh-00EymB-2c;
	Mon, 10 Apr 2023 10:35:13 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plord-00Eyl4-1p;
	Mon, 10 Apr 2023 10:35:12 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(9462:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>); Mon, 10 Apr 2023 18:34:25 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 10 Apr
 2023 18:34:25 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 10 Apr 2023 18:34:25 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<peterwu.pub@gmail.com>, <cy_huang@richtek.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH v3] iio: adc: mt6370: Fix ibus and ibat scaling value of some specific vendor ID chips
Date: Mon, 10 Apr 2023 18:34:22 +0800
Message-ID: <1681122862-1994-1-git-send-email-chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_033510_059222_F859E99A 
X-CRM114-Status: GOOD (  15.82  )
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

The scale value of ibus and ibat on the datasheet is incorrect due to the
customer report after the experimentation with some specific vendor ID
chips.

Fixes: c1404d1b659f ("iio: adc: mt6370: Add MediaTek MT6370 support")
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
v3:
- Add 'Fixes' tag
- Revise 'mt6370_adc_get_ibus_scale()' and 'mt6370_adc_get_ibat_scale()'
  from using 'if-else' to using 'switch-case'

v2:
- Move 'get_vendor_info' after iio_priv allocation done
- For the special case, bypass indent, make it out-of-line
- For a simple return, add a blank line
- Drop else
---
---
 drivers/iio/adc/mt6370-adc.c | 53 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.c
index bc62e5a..0bc1121 100644
--- a/drivers/iio/adc/mt6370-adc.c
+++ b/drivers/iio/adc/mt6370-adc.c
@@ -19,6 +19,7 @@
 
 #include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
 
+#define MT6370_REG_DEV_INFO		0x100
 #define MT6370_REG_CHG_CTRL3		0x113
 #define MT6370_REG_CHG_CTRL7		0x117
 #define MT6370_REG_CHG_ADC		0x121
@@ -27,6 +28,7 @@
 #define MT6370_ADC_START_MASK		BIT(0)
 #define MT6370_ADC_IN_SEL_MASK		GENMASK(7, 4)
 #define MT6370_AICR_ICHG_MASK		GENMASK(7, 2)
+#define MT6370_VENID_MASK		GENMASK(7, 4)
 
 #define MT6370_AICR_100_mA		0x0
 #define MT6370_AICR_150_mA		0x1
@@ -47,6 +49,10 @@
 #define ADC_CONV_TIME_MS		35
 #define ADC_CONV_POLLING_TIME_US	1000
 
+#define MT6370_VID_RT5081		0x8
+#define MT6370_VID_RT5081A		0xA
+#define MT6370_VID_MT6370		0xE
+
 struct mt6370_adc_data {
 	struct device *dev;
 	struct regmap *regmap;
@@ -55,6 +61,7 @@ struct mt6370_adc_data {
 	 * from being read at the same time.
 	 */
 	struct mutex adc_lock;
+	unsigned int vid;
 };
 
 static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
@@ -98,6 +105,30 @@ static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
 	return ret;
 }
 
+static int mt6370_adc_get_ibus_scale(struct mt6370_adc_data *priv)
+{
+	switch (priv->vid) {
+	case MT6370_VID_RT5081:
+	case MT6370_VID_RT5081A:
+	case MT6370_VID_MT6370:
+		return 3350;
+	default:
+		return 3875;
+	}
+}
+
+static int mt6370_adc_get_ibat_scale(struct mt6370_adc_data *priv)
+{
+	switch (priv->vid) {
+	case MT6370_VID_RT5081:
+	case MT6370_VID_RT5081A:
+	case MT6370_VID_MT6370:
+		return 2680;
+	default:
+		return 3870;
+	}
+}
+
 static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
 				 int chan, int *val1, int *val2)
 {
@@ -123,7 +154,7 @@ static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
 		case MT6370_AICR_250_mA:
 		case MT6370_AICR_300_mA:
 		case MT6370_AICR_350_mA:
-			*val1 = 3350;
+			*val1 = mt6370_adc_get_ibus_scale(priv);
 			break;
 		default:
 			*val1 = 5000;
@@ -150,7 +181,7 @@ static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
 		case MT6370_ICHG_600_mA:
 		case MT6370_ICHG_700_mA:
 		case MT6370_ICHG_800_mA:
-			*val1 = 2680;
+			*val1 = mt6370_adc_get_ibat_scale(priv);
 			break;
 		default:
 			*val1 = 5000;
@@ -251,6 +282,20 @@ static const struct iio_chan_spec mt6370_adc_channels[] = {
 	MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12, BIT(IIO_CHAN_INFO_OFFSET)),
 };
 
+static int mt6370_get_vendor_info(struct mt6370_adc_data *priv)
+{
+	unsigned int dev_info;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
+	if (ret)
+		return ret;
+
+	priv->vid = FIELD_GET(MT6370_VENID_MASK, dev_info);
+
+	return 0;
+}
+
 static int mt6370_adc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -272,6 +317,10 @@ static int mt6370_adc_probe(struct platform_device *pdev)
 	priv->regmap = regmap;
 	mutex_init(&priv->adc_lock);
 
+	ret = mt6370_get_vendor_info(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get vid\n");
+
 	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to reset ADC\n");
-- 
2.7.4


