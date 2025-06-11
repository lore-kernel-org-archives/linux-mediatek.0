Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB485C71135
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 00:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIUkxS3NJlxCBqe+Jr2tfFFp8ENb+E8Z8dAwWew1sZ4=; b=fwlfmhnaUKenP070eVehvLPYa7
	1HHDJzbf7q0ptnmCbVrRIGR8m21tQ35x6bQDcRpThR/rnvVYDJw7zQH4TA5FEF664GcOLhCGf7LPV
	bm+qE0yQy4o3q5F3WBLzGUm7fZC0KwvzG9QPU+f1BmHNaexFgwN5V3QvbPUNOAkCndtt0WuaCmI6N
	zY74GxQCMzSq8TEIS6VoHiCUV3fVXCjSVxv7tf2N0PFchtB661rt4cBBwAdccFpvEpBVqBQqZwHH2
	x0qyO7lphxfvAgO0XsQ0DUGyoK4DV1qkCOAxDUnROh+/oEGtMfrMs5F+BPlXNAW493tM5I9S/RW2q
	36iom5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVR3-0000000BkeC-3eGK;
	Thu, 12 Jun 2025 00:04:49 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUA2-0000000BVtH-1Clz
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:11 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-40a4de1753fso197795b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681789; x=1750286589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIUkxS3NJlxCBqe+Jr2tfFFp8ENb+E8Z8dAwWew1sZ4=;
        b=XLbFcytzf6zhLn6sxss7XV9h592mI5p1cyNXQLBaBs0VrZSKLrmdJ4xPsvr5z7GUuh
         IRMMi6aEFS3d+syTS7N3LPaJ3dhG6K+91byWu/odkcFNwpWPojFTogFEwfqdeOev68wW
         xJ2xKCJgLZlFzH09E1SvIJ45ubPY/pT1rXvtwLgU9vE1LaOV+bMXDJp+vtdELD9rJBYi
         71DECesa4Ntpr1tUe9O0KLxDd7XrKGaybWiyryRN68YnZZHQjjiGjha+rFumeqOR7jRp
         xrWuwnDW8QWctSpIUYjVZbpZf2MRo2Zg7ArHtzoErnXAxm4pOBpuYO4gqk8LLw/CWnYo
         MwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681789; x=1750286589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIUkxS3NJlxCBqe+Jr2tfFFp8ENb+E8Z8dAwWew1sZ4=;
        b=GrxUbZ8I/dI8Hv7GaGDJPIn+Qhs4SIPPhv0k6CCIhxMmb2nYJebaQKvLkzSl+DXE2L
         yJC0oZXMS0Gho57ePHFpzywdJx37u/3LydWAwGBVfB/YiwV4GmlbP8JJPin1S4YbPnhw
         il1QHP9SqlwaJlHw4bT/OoYp5S9/SX/JqDGvAgpaA8LL2/B58yBWCyy8LzcgnabcWUuZ
         ubKMXIc6BdJXGgfI5fMrUApmab0yD60xosOl8RndN04sPNBVnnurcFfezLlXTka0WneH
         QhWlJKKx0gKbUJicpxs9nDxOOWwGmjAAmQzEIGUumbT8xL4mxGjh+51Kqe4de7OR5Qoq
         vrUA==
X-Forwarded-Encrypted: i=1; AJvYcCUD0q93CzEJ2mAT1iFMINzXPrEO4D8ANgUZKcchIvYdedTdzdwRClsrSADVFMPxErSzDX2TpWT7X5JfbBuxzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvNqaqyjGQFyjVya3390juqAM8xpldI0wQnpi1ROGVaBPkW2F0
	t7QEYXqIbxLP8CJChFzxW/92kGJyCkZsuqNPXZ8vencAAp2S+K4hMUO6AghZbEvLK5o=
X-Gm-Gg: ASbGnctQgJSoV0wJXdtBWsVzt/RxbZ3PYvyS59z36cWNkxK7PkSp+aQb88jRigZMRw5
	BEQUVcc13LmpUNpSRnmsWZaVFmL+YaVbp+348kqbUGmTtb27J5oTYYQHmljxGLOt7r2e5mOHYRY
	EHNI6M4XB5sCpMyxQGVkXgDLCO1EtueXqeuNEB7cnHncIpG/iFUTbpXpEkKvz2lhR2bJPB6SzV5
	bpdYQtb6lPFANqWjSN+BQHPb+19OzZKrbQTecmjPF4am6s/0hjZ6Gv2a5DxD1IwO+vLBHJa0WZ9
	k4skDlDoEinbHSJJ7Wd0AeneyRfHUIQ9GUFrVr8pVmEVJikcf3s0I/pVNMcdpKfOPR9a
X-Google-Smtp-Source: AGHT+IEnYQuuP7+Ed1yUnqPwBXcm60N0HbHjFFI1Q30n3CnvRs0c1N7PubAsOKk34Bxp6isS1gHJpw==
X-Received: by 2002:a05:6808:181e:b0:408:fef8:9c91 with SMTP id 5614622812f47-40a65fee5edmr1014965b6e.5.1749681789569;
        Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:20 -0500
Subject: [PATCH 28/28] iio: temperature: tmp006: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-28-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=PE+CsjhnIQN3X+3KjjOXuO9jk19Iju+HayM9vpAuU1M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgY9GS1AXDDpXtL3P/xEFQ0nsgDvgF6m8S2Ri
 XNCmUul8aiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGPQAKCRDCzCAB/wGP
 wPyqB/9hXsNHRRXkGxsp4YsM2uNtCavgRRTmB64f/KIXhTDYL1RBaHe1kfKU8iu4OLH+gBGaKt6
 aamU7fhFYq9DAZMXKztJTGp4Bn5UPjmsyGKezfM1KqyY5wXinyUHqiDAa6WFesxPAWSYBW4YhuL
 jjsA4pN6Yl0BLbsYRN061SYdEaoiVyNw5oLsxaeCRQCpjdYZ5kEyewIQcC9SYSb8m8YhpDprTXv
 WqEiMd/n7RM4kkOE1jWOSNJ+od1fajr5bI6tF+f2LNjMT5hE/qs1NYFOOBiY+WfrvFrl3aPqZc7
 060EeNImTcoO1iHforX5lOBvZ5p77oTZs6uZ7OSYFtt07WgK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154310_333898_12F743DB 
X-CRM114-Status: GOOD (  10.84  )
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
 drivers/iio/temperature/tmp006.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/tmp006.c b/drivers/iio/temperature/tmp006.c
index 29bff9d8859d017e1b59536c531f732a2d749631..10bd3f221929d1b58b7e6a6bd9a75d5d068edf84 100644
--- a/drivers/iio/temperature/tmp006.c
+++ b/drivers/iio/temperature/tmp006.c
@@ -254,11 +254,9 @@ static irqreturn_t tmp006_trigger_handler(int irq, void *p)
 	struct {
 		s16 channels[2];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	s32 ret;
 
-	memset(&scan, 0, sizeof(scan));
-
 	ret = i2c_smbus_read_word_data(data->client, TMP006_VOBJECT);
 	if (ret < 0)
 		goto err;

-- 
2.43.0


