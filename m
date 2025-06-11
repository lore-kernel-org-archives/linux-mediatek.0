Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DD9C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=; b=wOyeFnaIM9NAIcKhpDsVS/j4hU
	ZkrUEXX5IhuxVXRCDy3KpkQIVd05oEGHBis/Py5+EjGKOxzlCzFFXMrxfQ9nqnYz1E68QzivlWGCX
	cUlptClQ+9X27uM3nojD5sLZljLeT5TP2qJWsjyyK6W3Ebr/8kEtDdM0Joo7TkZKG3Kld44aV/PpW
	2ASwTX1gASjvh3SUOmUWkQazmIa3YLuisJP5GWZTRb86bwabZOY6jxoz/hfIgRehJADXhEq5GO4GV
	an8Sxp2L+No1KrK0TEryUfOoqa8x2JvR7B18j+OlZxRDKfMtBuiiet9lWWLz5sb2SpnOJcf8XVrOA
	V/pF/riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV5b-0000000BhGt-2jB7;
	Wed, 11 Jun 2025 23:42:39 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9j-0000000BVd3-1P9B
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:53 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-408fa4be483so198792b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681770; x=1750286570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=;
        b=ZKHN+OVpjAp6g+kvyE99GO945nLIpMJMhSk6u3JlW7dN9TOUpftq3CK8G51RJJfPlS
         m7TgjbzRZbs1Wy2fuOA4N/Hf8tLQmHDuy905ZF1uiVh+nUytA0yRxDRMTQat1ZLpgmkc
         XQxHkdWHv3pNk++o5waWc/cfkf9/p8YtJc1HYs4NFRgca1sMNiiYmRozLUSaiNgVno83
         uzqAU9drjO34isaNgtf7w0SdcCHAwFLtaupThcW9mkci82n4Ap1fjw1P7TxYp/znmmm4
         NyuD8kpsn9q7Z7bJpvGEUTQ9TLY4s+VUAJfx59per2W5nEaHXNN3fBjJ8mRfmDSob3Wc
         debA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681770; x=1750286570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=;
        b=ZnPdxK/AwFVhBj6B7sd7aa3jCvgt5OGOGkFYJkOCWWhKYGGDBq0lm8JgxHrq3gEnfx
         gTwK9ASquoyb1+Z6poLSqt7pSL7/hJEVL0mViWiDbVdgkTBMrx9+PGP0o8tbBgD+cB6o
         8guo+PRvHtzlqCGy3OaetkWATun5o/i0FNB+swpGXHwQXQwcLp3p8bZU6mIqzBVvfLLD
         0+srQLdt5ru5P84yaUPHFz5n8OZJciOJyj73xtL70EyvMS+xx2SgU08LQDb72/mP25y8
         MWpb+r+TAcmIK++ltQ9nIBoDl3cmup2CBaGkl8dySv6ACHvaSqYhEmuV0SA9LXnEYFja
         0R6A==
X-Forwarded-Encrypted: i=1; AJvYcCXUakXKTAZTLFA7zuQPdKX2J4t3S1b4ZuvyPKdObA/tfJ++lW50DKUPOGNOwKXIlkxpoUlBaqB96rTmlqx7+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPEfr/mDIi9hmUQe1WQgQRYAiff5te8XzMwnzo9Din0ViPuVF
	K9Q03qOivW0Ehj+QZrWJXVEb+WZXaIo2FNgxRnXDKru+hapzBCg9Ib9GcV4H7+y4aNw=
X-Gm-Gg: ASbGncuH0RNVqo6PxiBu13XqNCtqdOeYtrAj6m1cEBP9FkumEs79q2UBmNZMmrNxibF
	ajaUHpXVZ2SvTNvmnT2UZVCa3DDW0A4TmjQsDxndi9ZvkkRhSewaeVptXplcyByOtUFEGalKj8J
	tI+LPRb16dWa4RMcFHAazTQg3uNBzus1ZT1KAtfpS43+T5youf9dtupX8HREyi5oPjNVe+1FI7V
	4cFmWYUpumU8tV3LRyKjw6oDEbcwT+xXH58u5ND3/vqXQourv1lSrXLQxVm2O0Ic1YyYrK8KHq4
	v4QDuVKnRbk9R6FjyfqiNI+b33jVv25pWYkcQ3rFEn9ehP/5Zp5EOce5MhU5U243907E
X-Google-Smtp-Source: AGHT+IEZSzWZ0MLiN0yyfGFrwS0RNkzhIod27nlhwUlhO/mElQY328781XuzrgNg/ZcIzQzVUMXtHA==
X-Received: by 2002:a05:6808:219a:b0:406:6fe7:37c1 with SMTP id 5614622812f47-40a66b32e32mr548422b6e.28.1749681770650;
        Wed, 11 Jun 2025 15:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:09 -0500
Subject: [PATCH 17/28] iio: imu: inv_mpu6050: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-17-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NMgmVVL3w5aWTWvBC+xusdF+bAVkf9GZ8B3SAIKd/as=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgX0U8uxbbKAo49fqrCappc+c/T/hCIP3Y0dC
 FOJqlflsliJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF9AAKCRDCzCAB/wGP
 wL4lB/9xRpYrOL5Dj/pVmFpiHVwrPZM5pGRIEo0tTLcH/Q5JOsLHQ5o/dbIirg/cJUikFfWLQ1G
 B7dqgu1hAl2Md4Pk6GklQzFpnaL0IqNcpDktycC3rp7CqezQvYDEGRcuC/yUKNmBLrL1HXOhMRu
 dFj7jXb/+0YU55sXaMa1UFfO2HiipdgqV0VoMprzCz8d6D6awosWDwQteOQXp56VLuseeqIvY5D
 bhcFYRq6FJO79v0KxUsdYYvTaGAhGGdrxJMabQ/o+fRiSHpy1dkzRXUnLMkM+Qf/Fgbfp1xFNWk
 WGqVvxJtN90stHJuDSbPGOqyJqWTW5GIY/9TYdSUXGc8gS0j
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154252_260144_24DB6129 
X-CRM114-Status: GOOD (  12.06  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 4 +---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
index a9bcf02e5b43fac0e210c6f78816a3c042b52f3d..460792ed27e03192464066dfa088734f0b6b1cdf 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
@@ -130,12 +130,10 @@ int inv_mpu_acpi_create_mux_client(struct i2c_client *client)
 
 	st->mux_client = NULL;
 	if (adev) {
-		struct i2c_board_info info;
+		struct i2c_board_info info = { };
 		struct i2c_client *mux_client;
 		int ret = -1;
 
-		memset(&info, 0, sizeof(info));
-
 		dmi_check_system(inv_mpu_dev_list);
 		switch (matched_product_name) {
 		case INV_MPU_ASUS_T100TA:
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
index 273196e647a2b5a4860e18cfa34a088c773540e4..c4c11124f92f7fa6730e7443e3be67d920b8c115 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
@@ -50,7 +50,8 @@ irqreturn_t inv_mpu6050_read_fifo(int irq, void *p)
 	u16 fifo_count;
 	u32 fifo_period;
 	s64 timestamp;
-	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE] __aligned(8);
+	/* clear internal data buffer for avoiding kernel data leak */
+	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE] __aligned(8) = { };
 	size_t i, nb;
 
 	mutex_lock(&st->lock);
@@ -103,9 +104,6 @@ irqreturn_t inv_mpu6050_read_fifo(int irq, void *p)
 	inv_sensors_timestamp_interrupt(&st->timestamp, 1, pf->timestamp);
 	inv_sensors_timestamp_apply_odr(&st->timestamp, fifo_period, 1, 0);
 
-	/* clear internal data buffer for avoiding kernel data leak */
-	memset(data, 0, sizeof(data));
-
 	/* read all data once and process every samples */
 	result = regmap_noinc_read(st->map, st->reg->fifo_r_w, st->data, fifo_count);
 	if (result)

-- 
2.43.0


