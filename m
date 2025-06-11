Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FE0C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaCqKPIs2f0ylRS6bTSnQ5BqgfESWCqO1Av05E42Aq8=; b=x/lzZQp6C/GiU8+XOCu4Qkzqrn
	jnQLvx9OPzXLgg76h9+RjN5leyrw4mN3xvXRz4ce/wHqzeaL8UQ65BitCxZbJ1cQmP78D9AvfVTVu
	96mp28bfwv7RiBWia28PSxAWl9L942w5MStdHF3iY2qUB8AWfWByVUcZl7xN396fkt1WnmAI54a+e
	KQ7TT51dWdQHvJ/ywRBsbVifJo+kMbTI3MXig5xUlCV2xaMdxtVfLjtAbTwBkT6WY5u7N/28gEvx6
	ZxyrxTD0Oq8n/T88J1lqbyRaQd867EDYbEe7d0BuH4G1l9qpa4BRre45QOamPBohnp0MInYvxWK8w
	0kIpVXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV5a-0000000BhGK-3jpp;
	Wed, 11 Jun 2025 23:42:38 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9h-0000000BVbr-0GMn
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:51 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4079f80ff0fso864798b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681768; x=1750286568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaCqKPIs2f0ylRS6bTSnQ5BqgfESWCqO1Av05E42Aq8=;
        b=gmqzokRNHopwKGrsotW/mI5/IBxAOLAjxMvXP4XG5e4CDEIRVQNuPzFit7RNbzoSPO
         KvFbeDjwSovT6fldvy6FbD3fhQ+Atf4YG+oK8C3HUNtUKcp8SGR7uVtEm8d1rM0hIuy2
         GyTG75wac2H1bS7T/hLOmcCMPsfNGTdd2bwS8X6hsqAm8hWSM60NSBuo1WoJv8UJzvTv
         qGtKqswW3vN3LA6cSQ/0gGRmYGTlSj/ydc6khIVR9+7uP6wBmsL76WUfKqlXpEJUuk0Y
         /8NK53jJvOkuFSYGeB1kow+iCaVLcYvJhMuyi3LSyokq0JkWQu/9WVzPW9IvvHh0Hkw4
         /OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681768; x=1750286568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaCqKPIs2f0ylRS6bTSnQ5BqgfESWCqO1Av05E42Aq8=;
        b=h8i937tJS2ppYH4WrNE+BXL+dJLWKzPrUagCFXj/CrGheWaVPhpu027HrgwiGWvdIx
         dJSEWv4reaRUCuDfcxoZS4Al6Cu/SUKW2XWGs//4z4qQWEx9V96r3C+MHqnKBXdZBTwW
         cjVbe/4PM51yfzP3GXwwBKBT1E4jaMQKw7WhKAVBKp7Rak54tWXn/+W5p4Fn2Nwj/BVw
         XKhlpvpAaeAmveK0dBuWKaWW9+EQN1269O++NwRnYTvUYkya4BYAdA3rPVerVdhbCYQW
         BaSTYbN+Qbq+A2jWrH10zlALlUx7loDAZG6PDQ2R2dcVWRfmObpC46vHmstJFnq9nMgx
         pTEA==
X-Forwarded-Encrypted: i=1; AJvYcCUEQTqQdyN8lSK1qLbCicA5OTigDGaBOvmBKEJM7eMJN5cOSsaWA3ErZCkVWq4QhHd47VNPLm3kXQbi8RwTYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5UOUlx9Rxy5AAqvKXiiMWdS9uKVRGqbVRvDgV/09MFtHDp1Mn
	oiSczBG9qG44FGrHn0Pty9tMSQap5Lv4uInShdiWhsEpRrN77eLH/3irQ26SNeYTiQA=
X-Gm-Gg: ASbGnctEfR4AhgaxKtJ4fgWuooNM5IKjyQfilnjnAhUZoEjDOKXCvga46i1H+I+0vSe
	+m1N2ftC62WQUJjXFOx8eiK1vS+zuEC4xKLK6FNVBcHZ9U48kEOA/bvhNVgBE0JmRPzhh7BTKzn
	gcYoETciRne6TiaBEUx79mRfdcXwNjYDB4SJKR1VNyRiJrBsa26uqkSSih4YyXu6TmKYXpoLdUq
	xGr4Aop0TDZ9l/UA4O8o9/HsYUWw453LZXf+5v+yBGQvSBu6o7AiKICNTz2s5p3RDfc0W1KdCPU
	8e24Ke7NgO5JRiTZb5IZr7yIinGvmH/cBRekyVdQxD7FUaBKGeGS5Jw+DGW4JcgEsFg1
X-Google-Smtp-Source: AGHT+IEqBdswhJxFab3cfPWoCt/XhvSdy8p4DMoA4oBrcj8i32O67dKlBd9w/Xt2c78Lmmmu54g1yQ==
X-Received: by 2002:a05:6808:3403:b0:407:a0ea:a233 with SMTP id 5614622812f47-40a66081d10mr892925b6e.10.1749681768360;
        Wed, 11 Jun 2025 15:42:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:08 -0500
Subject: [PATCH 16/28] iio: imu: inv_icm42600: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fAkKApzgvKKCY+4XB2hNM39jEFCTxF0PElDrgzvAlfA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXt+4nZ+zbyhmjJNdPfIxZOtXs2Bk8+N21Ob
 xic8BlFYmWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF7QAKCRDCzCAB/wGP
 wIUNB/48BoC8ymocKlLoNu3v5QYdcqupR0Gl4uhHgWI4Jt4Brgahbb5SfPq/3olqkbiy+T1Ookv
 DWyixFwL+PnlcdEYgsS3FtkBM77VlMTSo6KPDdiudRl4FOE1D8dxwHWMFTSURf17zsYwE+dDLHp
 YZRLNMo9fWgXqlnqEsBGDUgu2l57aaQxB6TaIlukki2lYZmsUTkPQsTN9JnX1WWTeNubNgf9d9W
 0ZUaDpZW1pcDF8oQsk1+HVaB1pWPs5UwKNoW9xGgFt43NyStIN8Eb/T84MFJaOOu+ikBdQENY1a
 Diwzxh8L7c4dTlMajUB9DvjbZGuzAcjh6/xW+3qRtK6/KKlM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154249_134170_E2AB6733 
X-CRM114-Status: GOOD (  11.72  )
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
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
index e6cd9dcb0687d19554e63a69dc60f065c58d70ee..dbd315ad3c4d2bd5085f7cd3cdc6de4391b1c896 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
@@ -902,7 +902,8 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
 	const int8_t *temp;
 	unsigned int odr;
 	int64_t ts_val;
-	struct inv_icm42600_accel_buffer buffer;
+	/* buffer is copied to userspace, zeroing it to avoid any data leak */
+	struct inv_icm42600_accel_buffer buffer = { };
 
 	/* parse all fifo packets */
 	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
@@ -921,8 +922,6 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
 			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
 							st->fifo.nb.total, no);
 
-		/* buffer is copied to userspace, zeroing it to avoid any data leak */
-		memset(&buffer, 0, sizeof(buffer));
 		memcpy(&buffer.accel, accel, sizeof(buffer.accel));
 		/* convert 8 bits FIFO temperature in high resolution format */
 		buffer.temp = temp ? (*temp * 64) : 0;
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
index b4d7ce1432a4f4d096599877040a89ede0625e0b..4058eca076d8b03a2290535eedffa0a74098d739 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
@@ -806,7 +806,8 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
 	const int8_t *temp;
 	unsigned int odr;
 	int64_t ts_val;
-	struct inv_icm42600_gyro_buffer buffer;
+	/* buffer is copied to userspace, zeroing it to avoid any data leak */
+	struct inv_icm42600_gyro_buffer buffer = { };
 
 	/* parse all fifo packets */
 	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
@@ -825,8 +826,6 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
 			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
 							st->fifo.nb.total, no);
 
-		/* buffer is copied to userspace, zeroing it to avoid any data leak */
-		memset(&buffer, 0, sizeof(buffer));
 		memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
 		/* convert 8 bits FIFO temperature in high resolution format */
 		buffer.temp = temp ? (*temp * 64) : 0;

-- 
2.43.0


