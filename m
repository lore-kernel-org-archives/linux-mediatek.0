Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96DAC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMdgC6UY9IrtR2DjZhccaaRp+6wWXRN5UlBGX1AL/uc=; b=UorBEVdvg0gXaexGDy0j0yfvfJ
	xEmLbkoX7ASpGCr0Hnn4LWxjEhIEGMyo22maG9TwSsXqxx3EzoBn4QNtwwDlMCD1r1q811F2V34xA
	0zKddQ1qZd1BeFUZAoYHoi4KKnUvNVhhCAbxmGxFoY9meaz3Cn0SNxIzhCHKmv47iYJFyV2C8R2mD
	ZRoq/KtNd5RTeHPcBmb3lgZRWUcM3mC0TiR/1MCLBcDAFJajh+TIDsUo1dtY4THUZQLjV7onQ0hEv
	HOWz5SR+z1inuuQLbKUyoSZHmK8cPcCrbY0rN0dPZeSO/fHc5KlxEpB+Yo3b3oCU3ZA1JE0r/S2nf
	elcWSqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp137-004Aq6-1E;
	Wed, 19 Apr 2023 06:12:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12r-004AjQ-1i;
	Wed, 19 Apr 2023 06:12:00 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 92E6A660320D;
	Wed, 19 Apr 2023 07:11:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681884714;
	bh=nTpGrftsRIa7La3Ejz06bZ6jB8zQMnXxmXPyKaNjl/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M74pTcM2OYwN/86mnbjQC8NtUEu1+y2BszQaVWA5XmA58kF/QX36GJS5PufvkkNDK
	 W/xIK9tgxVMdjwSF3zgk+KSoLSjAZ8HSSniKJ7krsOM/67iEjr6/ApL4v8rdMWCtP1
	 DZPI2v+REMfaovVo1BIJHqYFb/F7aFEXou/FOxisRP9C72l0SJI9N8CE7zNOdTcpdU
	 FIZ30HuKz+bNUqZTuS14AMGZxC3yZo9zML61T4dhuQDdMwpIHbdS/MXv5KofNmAu6D
	 S9Oizd5d7KETbIdFVbLbBloacfuYcr6xrd3KJNEJhbFgdnMsSQINIIqnSYfpT/RYW5
	 Om0+KjwDsCTsQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aouledameur@baylibre.com,
	bchihi@baylibre.com,
	daniel@makrotopia.org,
	ye.xingchen@zte.com.cn,
	hsinyi@chromium.org,
	michael.kao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] thermal/drivers/mediatek: Add temperature constraints to validate read
Date: Wed, 19 Apr 2023 08:11:46 +0200
Message-Id: <20230419061146.22246-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
References: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_231157_776531_D252D205 
X-CRM114-Status: GOOD (  17.70  )
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

The AUXADC thermal v1 allows reading temperature range between -20°C to
150°C and any value out of this range is invalid.

Add new definitions for MT8173_TEMP_{MIN_MAX} and a new small helper
mtk_thermal_temp_is_valid() to check if new readings are in range: if
not, we tell to the API that the reading is invalid by returning
THERMAL_TEMP_INVALID.

It was chosen to introduce the helper function because, even though this
temperature range is realistically ok for all, it comes from a downstream
kernel driver for version 1, but here we also support v2 and v3 which may
may have wider constraints.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 24 +++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 3c959a827451..e908c8e9d558 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -116,6 +116,10 @@
 /* The calibration coefficient of sensor  */
 #define MT8173_CALIBRATION	165
 
+/* Valid temperatures range */
+#define MT8173_TEMP_MIN		-20000
+#define MT8173_TEMP_MAX		150000
+
 /*
  * Layout of the fuses providing the calibration data
  * These macros could be used for MT8183, MT8173, MT2701, and MT2712.
@@ -689,6 +693,11 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
 	.version = MTK_THERMAL_V3,
 };
 
+static bool mtk_thermal_temp_is_valid(int temp)
+{
+	return (temp >= MT8173_TEMP_MIN) && (temp <= MT8173_TEMP_MAX);
+}
+
 /**
  * raw_to_mcelsius_v1 - convert a raw ADC value to mcelsius
  * @mt:	The thermal controller
@@ -815,14 +824,17 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 		temp = mt->raw_to_mcelsius(
 			mt, conf->bank_data[bank->id].sensors[i], raw);
 
-
 		/*
-		 * The first read of a sensor often contains very high bogus
-		 * temperature value. Filter these out so that the system does
-		 * not immediately shut down.
+		 * Depending on the filt/sen intervals and ADC polling time,
+		 * we may need up to 60 milliseconds after initialization: this
+		 * will result in the first reading containing an out of range
+		 * temperature value.
+		 * Validate the reading to both address the aforementioned issue
+		 * and to eventually avoid bogus readings during runtime in the
+		 * event that the AUXADC gets unstable due to high EMI, etc.
 		 */
-		if (temp > 200000)
-			temp = 0;
+		if (!mtk_thermal_temp_is_valid(temp))
+			temp = THERMAL_TEMP_INVALID;
 
 		if (temp > max)
 			max = temp;
-- 
2.40.0


