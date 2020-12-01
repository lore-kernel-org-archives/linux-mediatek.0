Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD687C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 05:41:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65422087D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 05:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2J/GwPz0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CNnIU5RK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65422087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YICiEvB7eCmsC9oaW65YUm+LVUY7HOkkK+LoNc0geLQ=; b=2J/GwPz0E5yviaf5kPBWzEhgkB
	qghyd4TNBtOIXV+snFdjjekDpbojZ2qQLvgaJ2ePaSwUO9HtbxKvKb5bxFPJiVbbTE2WgprPL/RIo
	6wHVexNhG9KI6e+P7JOK0yKDUyzc4CcAFqKRuhpebY26HyVD/daeP7KlI89+GV7bsmN1TD16elDEh
	MVL+xPYG8sTJ/wiFeIIVrD8zcLuAV5X6sJ5J4/kZIhrdus+2tavKJqY75a687LarEprF4+jrVcAKR
	n0I46B6f3Xd7ireQVcpd0w7cS4n6BTJqWu6/CtpVAJDjA61y4aY9BYUUdXAEQ3a4Cc28vNAMg2zSV
	D4UCnlKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjyQ9-0005ox-Jx; Tue, 01 Dec 2020 05:41:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjyQ7-0005oa-3M
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 05:41:49 +0000
X-UUID: 74f873605fa441ffbf113f5290fb1444-20201130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vuylKl6JvMCvb4e3eC9tBd05ZtAjU9RtYWIM2veHjCQ=; 
 b=CNnIU5RK5H+9Ur+oqo8SXZrPFzWdFjf1c5g6beBfIsJ0fdU90BwnETwSttCrOvzzDR85ubsMSGCdPQ2Ti3FA/SGlKYTWR+hB62uG4FeyoFSPXrb8RlJsh1eKGD/pABrrMR3lX57X60TboJkUZHYWtoK//H6rT/ute8GJdYO7qSY=;
X-UUID: 74f873605fa441ffbf113f5290fb1444-20201130
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1208137741; Mon, 30 Nov 2020 21:41:22 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 21:41:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 13:41:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Dec 2020 13:41:36 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [RFC] ASoC: Add compatible for mt6359-sound device
Date: Tue, 1 Dec 2020 13:41:33 +0800
Message-ID: <1606801293-19472-1-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAA7B66D6D0401E92CE626986C1CCA0E54FCFE8F1A01E9D6E0B728FA417EE9DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_004147_929472_13022200 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 chipeng.chang@mediatek.com, wsd_upstream@mediatek.com, fan.chen@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, jeter.chen@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 shane.chien@mediatek.com, Hsin-Hsiung.Wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

In the change "[v2,1/2] Add mediatek codec mt6359 driver",
The compatible of mt6359-sound device is removed
due to it is regarded as a part of parent device,
which is only reflecting Linux model instead of hardware.
However, if the device is not given a comaptible,
of_node of struct device is null. I cannot use
devm_iio_channel_get such iio interface to get
auxadc value from iio channel. Because during
using devm_iio_channel_get, of_node of mt6359-sound is a
input parameter of of_iio_channel_get_by_name.
If the of_node is null, devm_iio_channel_get will
eventually return ENODEV error.
static struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
						      const char *name)
{
	struct iio_channel *chan = NULL;

	/* Walk up the tree of devices looking for a matching iio channel */
	while (np) {  // np is null and will not enter the while loop
	....
	}
	return chan; // directly return null
}
I add the compatible back to mt6359.c and it
can successfully use devm_iio_channel_get without error.
Is there any suggestions if I need to use this kind of
native interface or can I add the compatible directly?
And I wonder what kind of device can add compatible
under mfd device?

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 sound/soc/codecs/mt6359.c |   58 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6359.h |    7 ++++++
 2 files changed, 65 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 6de0d74..1fb47f4 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/iio/consumer.h>
 #include <linux/sched.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -2741,6 +2742,37 @@ static void mt6359_codec_remove(struct snd_soc_component *cmpnt)
 	.num_dapm_routes = ARRAY_SIZE(mt6359_dapm_routes),
 };
 
+/* dc trim */
+static int mt6359_get_audio_auxadc(struct mt6359_priv *priv, int auxadc_ch)
+{
+	int value = 0;
+	int ret;
+	struct iio_channel *auxadc;
+
+	switch (auxadc_ch) {
+	case AUXADC_HP_OFFSET_CAL:
+		auxadc = priv->hpofs_cal_auxadc;
+		break;
+	case AUXADC_ACCDET:
+		auxadc = priv->accdet_auxadc;
+		break;
+	default:
+		pr_notice("%s() not support\n");
+		break;
+	}
+
+	if (!IS_ERR(auxadc)) {
+		ret = iio_read_channel_processed(auxadc, &value);
+		if (ret < 0) {
+			pr_err("Error: %s read fail (%d)\n", __func__, ret);
+			return ret;
+		}
+	}
+	pr_info("%s() value %d\n", __func__, value);
+
+	return value;
+}
+
 static int mt6359_parse_dt(struct mt6359_priv *priv)
 {
 	int ret;
@@ -2783,6 +2815,25 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 		priv->mux_select[MUX_MIC_TYPE_2] = MIC_TYPE_MUX_IDLE;
 	}
 
+	/* get auxadc channel */
+	priv->hpofs_cal_auxadc = devm_iio_channel_get(dev,
+						      "pmic_hpofs_cal");
+	ret = PTR_ERR_OR_ZERO(priv->hpofs_cal_auxadc);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev,
+				"%s() Get pmic_hpofs_cal iio ch failed (%d)\n",
+				__func__, ret);
+	}
+	priv->accdet_auxadc = devm_iio_channel_get(dev, "pmic_accdet");
+	ret = PTR_ERR_OR_ZERO(priv->accdet_auxadc);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev,
+				"%s() Get pmic_accdet iio ch failed (%d)\n",
+				__func__, ret);
+	}
+
 	return 0;
 }
 
@@ -2818,9 +2869,16 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
 					       ARRAY_SIZE(mt6359_dai_driver));
 }
 
+static const struct of_device_id mt6359_of_match[] = {
+	{.compatible = "mediatek,mt6359-sound",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6359_of_match);
+
 static struct platform_driver mt6359_platform_driver = {
 	.driver = {
 		.name = "mt6359-sound",
+		.of_match_table = mt6359_of_match,
 	},
 	.probe = mt6359_platform_driver_probe,
 };
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index 35f806b..52d2398 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -2610,6 +2610,11 @@ enum {
 	PGA_3_MUX_AIN2,
 };
 
+enum {
+	AUXADC_HP_OFFSET_CAL = 0,
+	AUXADC_ACCDET,
+};
+
 struct mt6359_priv {
 	struct device *dev;
 	struct regmap *regmap;
@@ -2622,6 +2627,8 @@ struct mt6359_priv {
 	int hp_gain_ctl;
 	int hp_hifi_mode;
 	int mtkaif_protocol;
+	struct iio_channel *hpofs_cal_auxadc;
+	struct iio_channel *accdet_auxadc;
 };
 
 #define CODEC_MT6359_NAME "mtk-codec-mt6359"
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
