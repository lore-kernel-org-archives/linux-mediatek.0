Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52974C83F03
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9ubYD9qtSZHzLtD/KNNQMfCXW/cohvDH7RI1A/ztQc=; b=SqK7rA9iNzqCufy/j6XiI/I/Gv
	6XiBQOtJTDFZ7McliGTyA1zeZ0o23ib97q4yVkSILZXUbaF+WdqsCkxceQ8JWj6iVXXoxgL1ZDblM
	V6wBjaEzphbbNY+JSFJgXQbm1h9gNv9eJqR5KIOyNpGaxphf+rwdN++I95DXZ5wkgzDnathjmymiC
	6mb4AW1BuwW8DEUcFThar3vucgz/r/8H8T8jDS9O15AkjvGyEAlf6OBjdNIkoxckQqLszDxSXi4bk
	HiSV6bAMJBVZ73d1OAEcAs6bAada29aNMpaE1G0uSUWu4tu8iRZV941Y8EXF67WnUoodF8SEjYUYG
	I59a0tGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMeA-0000000ByBc-1HNX;
	Thu, 03 Jul 2025 16:18:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKfK-0000000BcEk-1VNR;
	Thu, 03 Jul 2025 14:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551913;
	bh=QsAuJqTGSAkxlbhomMU/9ni8VK3R+48MCxlhKRwWCTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOLETCWUPeE1udZ03kmUBNL2S8DvMhiSdoMP6lzihCqaTLs7C7qVwwbc8idqlt1H7
	 BwYaCDtNRJYGAP480dZ5zpqlebB7csvDLDY8MDV1D1J+QRMDB4cRIfp/5/tS7WMgf7
	 zDfceKyt/BnyeEANdUlHgyvBUUwWhF8KYxuHkRb2CvusTQTrUVj5Ix+nV9fOgt5iFM
	 CVyFvqJz1IlD5vslYwbNe1W55+mjxDYjvYpMYeKaT0XcHy8y6TUIIywqwvkUUIa8d9
	 bNG3KpL1WLls+sO06prHGf4dpp0SRMrqD+3hoOAwgq5smKVp4ZIU4oCiM6EaABOrnh
	 u6BEF4J0rhyRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FBB017E0EC0;
	Thu,  3 Jul 2025 16:11:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 4/6] iio: adc: mt6359: Move reference voltage to platform data
Date: Thu,  3 Jul 2025 16:11:44 +0200
Message-ID: <20250703141146.171431-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071154_546219_E62F546A 
X-CRM114-Status: GOOD (  12.94  )
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

In preparation to add support for new PMICs, add a `vref_mv`
member to struct mtk_pmic_auxadc_info and use it in place of
the AUXADC_VOLT_FULL definition.

As a consequence, the definition was also removed.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 2ccc64e6c126..914c9a22cd14 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -28,7 +28,6 @@
 #define AUXADC_AVG_TIME_US		10
 #define AUXADC_POLL_DELAY_US		100
 #define AUXADC_TIMEOUT_US		32000
-#define AUXADC_VOLT_FULL		1800
 #define IMP_STOP_DELAY_US		150
 #define IMP_POLL_DELAY_US		1000
 
@@ -123,6 +122,7 @@ struct mtk_pmic_auxadc_chan {
  * @desc:           PMIC AUXADC channel data
  * @regs:           List of PMIC specific registers
  * @sec_unlock_key: Security unlock key for HK_TOP writes
+ * @vref_mv:        AUXADC Reference Voltage (VREF) in millivolts
  * @imp_adc_num:    ADC channel for battery impedance readings
  * @read_imp:       Callback to read impedance channels
  */
@@ -133,6 +133,7 @@ struct mtk_pmic_auxadc_info {
 	const struct mtk_pmic_auxadc_chan *desc;
 	const u16 *regs;
 	u16 sec_unlock_key;
+	u32 vref_mv;
 	u8 imp_adc_num;
 	int (*read_imp)(struct mt6359_auxadc *adc_dev,
 			const struct iio_chan_spec *chan, int *vbat, int *ibat);
@@ -416,6 +417,7 @@ static const struct mtk_pmic_auxadc_info mt6357_chip_info = {
 	.regs = mt6357_auxadc_regs,
 	.imp_adc_num = MT6357_IMP_ADC_NUM,
 	.read_imp = mt6358_read_imp,
+	.vref_mv = 1800,
 };
 
 static const struct mtk_pmic_auxadc_info mt6358_chip_info = {
@@ -426,6 +428,7 @@ static const struct mtk_pmic_auxadc_info mt6358_chip_info = {
 	.regs = mt6358_auxadc_regs,
 	.imp_adc_num = MT6358_IMP_ADC_NUM,
 	.read_imp = mt6358_read_imp,
+	.vref_mv = 1800,
 };
 
 static const struct mtk_pmic_auxadc_info mt6359_chip_info = {
@@ -436,6 +439,7 @@ static const struct mtk_pmic_auxadc_info mt6359_chip_info = {
 	.regs = mt6359_auxadc_regs,
 	.sec_unlock_key = 0x6359,
 	.read_imp = mt6359_read_imp,
+	.vref_mv = 1800,
 };
 
 static void mt6359_auxadc_reset(struct mt6359_auxadc *adc_dev)
@@ -505,7 +509,7 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	if (mask == IIO_CHAN_INFO_SCALE) {
-		*val = desc->r_ratio.numerator * AUXADC_VOLT_FULL;
+		*val = desc->r_ratio.numerator * cinfo->vref_mv;
 
 		if (desc->r_ratio.denominator > 1) {
 			*val2 = desc->r_ratio.denominator;
-- 
2.49.0


