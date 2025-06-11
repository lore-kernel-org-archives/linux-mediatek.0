Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB59C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxd93MXVamZ7ztUFC194OTJH1bC4/5rgbs/4bZ7YxEg=; b=wc7VnOqCK116o/y16QRs9mSive
	K8cQ2G4uCyJHRYuafNmxX+UnlU4IhI95ZxH8YM7M/PyfHqzISmETEBg7jJMPyrAMABOviIykBR2tp
	zIvS1Jo/+pS5TKfL3I6NfeMeI8PIFzRFQWc5Kkdqv5yqxHe1BMu8PLXPCseCbdWHL0PvmeCtbQB5o
	iC3Xq2pyS5za51pA/m8q4StLcqioIeutKY734aSSpZDRC3LnB7YDyDakq/tHVStXMIVHR+XWTg5QO
	lXZVHSn/NS6ndImTKhhNmNw7TkLTMd5vFJ2wdXjyxCw8nbr0nhvL2AC6xl/KKEdA6PGi7xgGjywG6
	+/ukZBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUqE-0000000BfdS-0CYf;
	Wed, 11 Jun 2025 23:26:46 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9M-0000000BVO8-0yRV
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:29 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-40905ae04e4so126526b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681747; x=1750286547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxd93MXVamZ7ztUFC194OTJH1bC4/5rgbs/4bZ7YxEg=;
        b=AXmwOMllRjLt8mw6B+vesoh7SoY6THIDIwox0l2E0Glpj1gIMC0BNpCJeIbnUxTGFQ
         7a6fb3Q/2nydXyPO4Ng/m0MwWKjC0KGR/k1WiKgr2T3jyEXGiS2O4c8ZjVXQNr+g4UuC
         Iy5NRLvcj8V4H3Kw2bUWTAuWjpR/Cf1WWMDju+Y53LEFxwJhdowY7hgrX+d7O6JTsTVj
         6db9Y/qSW7h9Q+QEIKS3k9i2a3Xz1dw+p0NzYQVw9dTPEVHeJd8dUqyKJ/gBRt9eKV9B
         D9oYCOv0WA9QdUoP+D6Vx4w8QBrtl8KNMtaO61UIZat7MvNqGldRpqHQ3WLZU4feVvNV
         u5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681747; x=1750286547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxd93MXVamZ7ztUFC194OTJH1bC4/5rgbs/4bZ7YxEg=;
        b=oPU9eA1b27Kx/DEl8VbwBxdpx3wI94AToPHwymrg7C2xCqCJ2/D0/fMaLLjtxNnY26
         3UqmKsBZYuEtETXkpgUc3P18yKYeCBNCvDA/t9WBixvhPchxup0WKwxapuht+YrW/lBm
         pWMNa4ll8OJm1w7wlesSnsdd8IsPuMTyNa+3BTzBGUPiuIaC6GMYoqms5oVFs4cgJdbF
         HKPSkFzavA0yAbILLei/UVxLX/0YzYM5WBweuB9X9QRwSIDKw0c1zj0ZHd1zBork0V9b
         U/NdCLnOqOO3I+YeZbPgUSqUWiS2mdo4JPITtYrTOc84+/pFOmEcbtpjMU0Ivu59lHDQ
         QZRw==
X-Forwarded-Encrypted: i=1; AJvYcCVvZTkee6Us7UQsf00IWU9JbZFF6Ncqowe3inAN4hSaAMIj3tx439caUj8E+2BQLkKUOZ3ix4fpSGyM+Df6vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfD+hcLC8cWe11cqNldK49dAFKKTyv7a09ZfrT3XOXOFptPdYp
	d60EkTsZ71HtE8SzKarwUuIxDmzozPmkpTE+abWPYgtY/J2PVHmAvXQIb8qKHxv93l8=
X-Gm-Gg: ASbGncsfO8uMdJNXhXHQA48jtL03cIr42s3MUM7MaCacsARTjsieKj5W0fd95+tez0h
	DWA3RKOZ6nUBwY1qXxowxEdmh+LZ8VtmODUc7OCJPTgfwgI46puUhBdh9yD9hsgVpq/kcIdeRnF
	N4gcuwIZJybxgUkGJV3XtEbttlZHcmaW7HKf78SyrkWMVsSNeVzQk3S/PX6GirXKQ2NR4PXtI01
	VQYcyCohg52t2nAmrbcGu7ZdG7gA2mG6CUq1f8XX7vbeDutp1vOH4GPrf80alH2PigYFzzVlfXm
	I/sZIBoFoG7JGIkOc+Kx536jUESADFZCr0mFWSwVH82FGCLuM8p3HEPzaDTa7WnZd5zc+zvp/RQ
	TJh0=
X-Google-Smtp-Source: AGHT+IFQBThN9gqVMuv0yZV4fKxfsQN3C7pn2YLNqV1M+RISkP7nir8q7A3hG/2ChnbAzLdY1TtRyw==
X-Received: by 2002:a05:6808:6349:b0:402:1016:e9cf with SMTP id 5614622812f47-40a5d1640c9mr2811691b6e.34.1749681747387;
        Wed, 11 Jun 2025 15:42:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:27 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:58 -0500
Subject: [PATCH 06/28] iio: adc: rtq6056: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-6-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=J89vMIrnHas95b9IQRpMB3abmxVy58q4+X2PR5Kxrzs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWrluEPstsE3vfOa2602G4vDUiURfJwcuPmj
 Ecdin91id+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFqwAKCRDCzCAB/wGP
 wPDzB/0ezOPNIM1GcdwSJUtoBdBzF+of4mq74dFA0f4iCvbOvAC9fCmCzg5hxL69oaeNJIKLKNN
 hwYn4bwrsFDn7hpTk4oxy+0yhbNBF3FS9rqxNmkw5sq+imc+Bge3o9MlimTvdYjRFeWz1olLBsK
 RujuQh/8d+BqbeBkJy6HGkvMCcyYr4HMiR32pZxq3ktZX1yG2QbvAfaGvOtFKtCjsFCh+x/0Tk1
 JzzUKytVoQDoqN/jeT+fEIYsymB+ELqIGIQ5jEtG2AOnEQdDR4Q/i73QIQnRhDjaJw/RzxhYyeY
 LG1BSqJLLtf/Qqw+97BIE+EwDDmTTolk2qkEpoqaZjPnMzDK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154228_283169_D1052340 
X-CRM114-Status: GOOD (  11.13  )
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
 drivers/iio/adc/rtq6056.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rtq6056.c b/drivers/iio/adc/rtq6056.c
index 6ff47415a2221436b1fd548aa0bc070ba5fbb774..ad9738228b7f2db3f3b6cfc01fd97e43b579b687 100644
--- a/drivers/iio/adc/rtq6056.c
+++ b/drivers/iio/adc/rtq6056.c
@@ -645,12 +645,10 @@ static irqreturn_t rtq6056_buffer_trigger_handler(int irq, void *p)
 	struct {
 		u16 vals[RTQ6056_MAX_CHANNEL];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	unsigned int raw;
 	int i = 0, bit, ret;
 
-	memset(&data, 0, sizeof(data));
-
 	pm_runtime_get_sync(dev);
 
 	iio_for_each_active_channel(indio_dev, bit) {

-- 
2.43.0


