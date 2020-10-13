Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780C2C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2838420872
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSdJDwLn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="br10SF3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2838420872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yr4S5HdO1BqGJ9xHkWTGv/YTySpzYmMwLYSRqyE6QV8=; b=nSdJDwLnFxRqdaxm7qJ9GRo03
	wK+QcL+h+RvEST0R9Gn2eta5Ju7ZKb2unReJvyEW7jEBABuyUUjFbP5q378TVLbTvBJD881k6J0N0
	IUMKuN9svFnrJStUyzPAApc1/Su7t8FEQiPJc5lezGIveMPaqcO6FmNPq1OUTbgHaEqP4DOy6/Dd/
	VND8VSxMxjIlEBMOpVcmfMzTilk8kRhZNfaTQXl4Jxi3N7OJVcXs1iM5pZ50/mDk93o0ryeH258z8
	hhNXk0iPuFHWTqCsliXXkIdZHUW3IL63B2c+dajMGHiBfJAzZ6B13B5h8FqqhOf3eExcCAwOkEW1O
	LniNg1kog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSHTh-000202-7L; Tue, 13 Oct 2020 10:24:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSHTW-0001wX-OM; Tue, 13 Oct 2020 10:24:13 +0000
X-UUID: 6649a7cefd924842b41e30e7fc287563-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uU5h/PCfw5tLAU29bsJqUl+QoZ77GPhjS0d0QniL9QQ=; 
 b=br10SF3BpaSVd8m073qpYehuoUsbCbLyhuM8JTXKJOdVnYlKvAHafmQ4j6U8bVNsTLBgCEoISLIcBmLgHS1yi1mvHVPzzggZ0u7cTR0TLjcxy3dhNdbMHsBho+fko9dDFbhuWB7PpbAB3qJPOBWPnZOos83Ui5CNC5ntg/Ji6/Q=;
X-UUID: 6649a7cefd924842b41e30e7fc287563-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2047591002; Tue, 13 Oct 2020 02:24:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 03:24:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 18:24:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Oct 2020 18:24:00 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [v5 3/3] thermal: mediatek: add another get_temp ops for thermal
 sensors
Date: Tue, 13 Oct 2020 18:23:58 +0800
Message-ID: <20201013102358.22588-4-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201013102358.22588-1-michael.kao@mediatek.com>
References: <20201013102358.22588-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_062410_957419_9DFDBD19 
X-CRM114-Status: GOOD (  21.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Provide thermal zone to read thermal sensor
in the SoC. We can read all the thermal sensors
value in the SoC by the node /sys/class/thermal/

In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
on the first read of sensor that often are bogus values.
This can avoid following warning on boot:

  thermal thermal_zone6: failed to read out thermal zone (-13)

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/thermal/mtk_thermal.c | 99 +++++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 23 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 0bd7aa564bc2..43c7bdbc147f 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -245,6 +245,11 @@ enum mtk_thermal_version {
 
 struct mtk_thermal;
 
+struct mtk_thermal_zone {
+	struct mtk_thermal *mt;
+	int id;
+};
+
 struct thermal_bank_cfg {
 	unsigned int num_sensors;
 	const int *sensors;
@@ -637,6 +642,32 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
 		mutex_unlock(&mt->lock);
 }
 
+static u32 _get_sensor_temp(struct mtk_thermal *mt, int id)
+{
+	u32 raw;
+	int temp;
+
+	const struct mtk_thermal_data *conf = mt->conf;
+
+	raw = readl(mt->thermal_base + conf->msr[id]);
+
+	if (mt->conf->version == MTK_THERMAL_V1)
+		temp = raw_to_mcelsius_v1(mt, id, raw);
+	else
+		temp = raw_to_mcelsius_v2(mt, id, raw);
+
+	/*
+	 * The first read of a sensor often contains very high bogus
+	 * temperature value. Filter these out so that the system does
+	 * not immediately shut down.
+	 */
+
+	if (temp > 200000)
+		return  -EAGAIN;
+	else
+		return	temp;
+}
+
 /**
  * mtk_thermal_bank_temperature - get the temperature of a bank
  * @bank:	The bank
@@ -649,26 +680,10 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	struct mtk_thermal *mt = bank->mt;
 	const struct mtk_thermal_data *conf = mt->conf;
 	int i, temp = INT_MIN, max = INT_MIN;
-	u32 raw;
 
 	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
-		raw = readl(mt->thermal_base + conf->msr[i]);
-
-		if (mt->conf->version == MTK_THERMAL_V1) {
-			temp = raw_to_mcelsius_v1(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		} else {
-			temp = raw_to_mcelsius_v2(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		}
 
-		/*
-		 * The first read of a sensor often contains very high bogus
-		 * temperature value. Filter these out so that the system does
-		 * not immediately shut down.
-		 */
-		if (temp > 200000)
-			temp = 0;
+		temp = _get_sensor_temp(mt, i);
 
 		if (temp > max)
 			max = temp;
@@ -679,7 +694,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 
 static int mtk_read_temp(void *data, int *temperature)
 {
-	struct mtk_thermal *mt = data;
+	struct mtk_thermal_zone *tz = data;
+	struct mtk_thermal *mt = tz->mt;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -698,10 +714,28 @@ static int mtk_read_temp(void *data, int *temperature)
 	return 0;
 }
 
+static int mtk_read_sensor_temp(void *data, int *temperature)
+{
+	struct mtk_thermal_zone *tz = data;
+	struct mtk_thermal *mt = tz->mt;
+	int id = tz->id - 1;
+
+	if (id < 0)
+		return  -EACCES;
+
+	*temperature = _get_sensor_temp(mt, id);
+
+	return 0;
+}
+
 static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
+static const struct thermal_zone_of_device_ops mtk_thermal_sensor_ops = {
+	.get_temp = mtk_read_sensor_temp,
+};
+
 static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 				  u32 apmixed_phys_base, u32 auxadc_phys_base,
 				  int ctrl_id)
@@ -992,6 +1026,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
+	struct mtk_thermal_zone *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -1080,11 +1115,29 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
-						     &mtk_thermal_ops);
-	if (IS_ERR(tzdev)) {
-		ret = PTR_ERR(tzdev);
-		goto err_disable_clk_peri_therm;
+	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
+		tz = kmalloc(sizeof(*tz), GFP_KERNEL);
+		if (!tz)
+			return -ENOMEM;
+
+		tz->mt = mt;
+		tz->id = i;
+
+		tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i, tz, (i == 0) ?
+							     &mtk_thermal_ops :
+							     &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			if (PTR_ERR(tzdev) == -ENODEV) {
+				dev_warn(&pdev->dev,
+					 "sensor %d not registered in thermal zone in dt\n", i);
+				continue;
+			}
+			if (PTR_ERR(tzdev) == -EACCES) {
+				ret = PTR_ERR(tzdev);
+				goto err_disable_clk_peri_therm;
+			}
+		}
 	}
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
