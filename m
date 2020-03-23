Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBC5C54FCE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A63220788
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SbEOHi8p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mrh0SgYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A63220788
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n9ovGXmZSbR85xQPxTr9BvGJ+7htXTw4Z9UAKLWk4U=; b=SbEOHi8pimtiLK
	Wwc2C9tkOMj0/Gv/L4Y08J+CuTt/2+TaWT2twhExzPh5sKbWsb1C1/NF9UMUcWEQ+pQLJ1w33ifNQ
	Nf/GlhEOKh0jXWBcjvdaLiEAEtphblbR91MYSJ38Cl18+9th9u8poZp4dV8K2L4cI+15I0C73Afce
	ml/rjDG98vvchSMusCynfUpxyew06esj+6B+fZ/PZ0HwNQT1c37bu6aAtBMRrkFHapMoPItfmxzS3
	QHiRXlTGiyNrvxOqQ/up9W1msQ6Wvb8vvGFcNU7sDmsqhCssKAr88IVn3hpG+2w2wWwtvcsXaQqxI
	vmiGCFfXn3pSqdAvn5mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGM0W-0007dy-S2; Mon, 23 Mar 2020 12:16:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGLzg-0006ob-Rj; Mon, 23 Mar 2020 12:15:50 +0000
X-UUID: c702a28a20b0465ea9ea6ff645699541-20200323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6afKyor9AgACuTa8Oqf4MptvrGy9B10niDpAuK601p8=; 
 b=Mrh0SgYK2mztGt3Sfq9lLr6Ow8t3HhXjV2eiphMsnsOwBoM1NKtuL4dOa9JWbT2T4Y1p7v2Wkl2DG9rKxt3EeglYhrR3qvMg5A5Ev8tEfVTWGzAdAHPL3P9WmEwWhfCuEdwDj9AvvziCX+DI6XThTO7AXV5IOHfe7XEBpjXjFqY=;
X-UUID: c702a28a20b0465ea9ea6ff645699541-20200323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1374918066; Mon, 23 Mar 2020 04:15:43 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 05:15:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 20:15:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Mar 2020 20:15:38 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui
 <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <michael.kao@mediatek.com>
Subject: [v4,
 6/7] thermal: mediatek: add another get_temp ops for thermal sensors
Date: Mon, 23 Mar 2020 20:15:36 +0800
Message-ID: <20200323121537.22697-7-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200323121537.22697-1-michael.kao@mediatek.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_051548_923252_53D6E305 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
 drivers/thermal/mtk_thermal.c | 74 +++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 6b7ef1993d7e..9eaca432920e 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -225,6 +225,11 @@ enum {
 
 struct mtk_thermal;
 
+struct mtk_thermal_zone {
+	struct mtk_thermal *mt;
+	int id;
+};
+
 struct thermal_bank_cfg {
 	unsigned int num_sensors;
 	const int *sensors;
@@ -607,7 +612,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 		 * not immediately shut down.
 		 */
 		if (temp > 200000)
-			temp = 0;
+			temp = -EAGAIN;
 
 		if (temp > max)
 			max = temp;
@@ -618,7 +623,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 
 static int mtk_read_temp(void *data, int *temperature)
 {
-	struct mtk_thermal *mt = data;
+	struct mtk_thermal_zone *tz = data;
+	struct mtk_thermal *mt = tz->mt;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -637,10 +643,44 @@ static int mtk_read_temp(void *data, int *temperature)
 	return 0;
 }
 
+static int mtk_read_sensor_temp(void *data, int *temperature)
+{
+	struct mtk_thermal_zone *tz = data;
+	struct mtk_thermal *mt = tz->mt;
+	const struct mtk_thermal_data *conf = mt->conf;
+	int id = tz->id - 1;
+	int temp = INT_MIN;
+	u32 raw;
+
+	if (id < 0)
+		return  -EACCES;
+
+	raw = readl(mt->thermal_base + conf->msr[id]);
+
+	temp = raw_to_mcelsius(mt, id, raw);
+
+	/*
+	 * The first read of a sensor often contains very high bogus
+	 * temperature value. Filter these out so that the system does
+	 * not immediately shut down.
+	 */
+
+	if (temp > 200000)
+		return  -EAGAIN;
+
+	*temperature = temp;
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
@@ -873,6 +913,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	struct resource *res;
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
+	struct mtk_thermal_zone *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -954,11 +995,30 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
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
+		tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i,
+							     tz, (i == 0) ?
+				&mtk_thermal_ops : &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			if (PTR_ERR(tzdev) == -ENODEV) {
+				dev_warn(&pdev->dev,
+					 "sensor %d not registered in thermal zone in dt\n",
+					 i);
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
