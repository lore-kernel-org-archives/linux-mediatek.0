Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8591FC71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=; b=RpAxMf55OgCq5o2dD8dgbO/3/j
	wwxMhMjhXYfDFbPCfpgR30oMpykeHrrgLf+/p/14mUFJaJSeNzu/ZBFUNV+q+IlFNxbbT6mknKNAX
	L3s5+ahs70F8czpeHeKJjnhQArSFK7ZpKTwB40FK1s+yv2kWqBHKi+0LcBDmsZoZTDPZALiMVehvD
	BTyC9uaSHzVhzbjk0wSiePceSeY+5peDHhNTzU/zNDj/dvr0Ov65C64e1CaShLE0MYjzwdOwIA3yX
	OxlovXzc/tJ/vPpZwABgQLURxgWjJiuKfJBAJq6IsNvDm49qh/qsL30veVEu+MKrXdUdXV8Vr2C+0
	XEdYuCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV4v-0000000Bh50-1pri;
	Wed, 11 Jun 2025 23:41:57 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9a-0000000BVX5-21CE
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:44 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-408d14c7ebeso206859b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681762; x=1750286562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=XA6TFG5Qq5k/ua4TuoW+FQZMPMP75zpoO+lS3nmQ0wopySq045K5HGar60p4p+4q0w
         rW2/nNvta2vOzRboP6MidYvHk4r+nRUIdC91Q8wBzEouU7bMVyC3wEYa5FjOm0xphDjA
         7drjF38kanfMwJMPZaYTIczhhJgQ5tOxZG4h8VZw/VAvYm4imm5NhB/ZjA8yK8vAi3cY
         j2mgSDrTH1fNqeJciKeaw44GAUhL0CgbUW7KjWzJBTbqgEBB4nJMP5m1htCPGOdWEFlt
         HzSdUmxVjOxug+TEX/YgqAFmtmFFId6M4g/9W06cuhZcyp7AgWTGqdTp0Yu3/4SZrbf3
         rBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681762; x=1750286562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=Xzx2Itcoktty2HoyIMyQ7CrL7HfdWnKmewmRu6bP8AtfvAntSQyGK2IFcQmyut0Enm
         f7fovfrTXyVGc9zvQQEpU70iFxQSmlghTj+D4I6ayGTbkiOGf6wihkJcVl821DcPiMVM
         goMUgTH+PRHrCU7nVW3GL7CuPJQ2pwfpNLaV7RRUn0sY8PlS2R1LkfWvMWuiYJ3yjj7h
         as0hrc4HGmHM7C3xpIkdy+zJQMbS1dbIOoI/DBFch/613Sxowjwpd+aulSvEkchLGDs3
         fXd+Yf+3dcy6bDtcssH/smlgHtsrnpPvr24tKBqUzaA2pUD4gvadDdMmHxo8Gwh509WQ
         RjCg==
X-Forwarded-Encrypted: i=1; AJvYcCWsWGfROticN4g+BwW6+7qIdDSiY/yairM8u4VWPkfLtWy9Yos9CXIzWWxm9X8UKnUihydPSQvsp8hSUF8hOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKJUgo19YnzSFsupsJ/AXLY6DgQkp1lccZ7DNbSrT9urlRww3B
	QPGXim58Y/zL5uBlxTWVj5UMvjylb3wIIajhmeQ7UR8aWpkU1M013krY9OcLbaP5uQg=
X-Gm-Gg: ASbGncs6qMnlIpwUFBmni18iHeDnjw/lE0R9do8XIzFDAka5d/Issu6iCQ6EZ1qwOpv
	vbfKu6T6kFWnGvTR3hqnp87/2cuzJv/1M8ZmHBJZC280GyzEm/NphL5nEbD60VAQG60wLGg+Yrv
	w+GvukcbTqUUBJFKlES8TgYaFq/igTZ+G8Qfxwou2Tqv9QHKR3PzCQOkeaHHyd61iSwvgIoTXsl
	tExpxt25qO0FKs1/j9b7hKd4SQiDZbLDTGB27MUFInfVAxVse606mfeaw1NIGe0hjYEKHqLpwSA
	n3wxGEMU6qHoeOHx0c3i61CDuX46wnKw6I419u7RHGOFC3EkUxEh9Lg+dKv0Azy0jvEK
X-Google-Smtp-Source: AGHT+IFMMzvtGjq/XF9sKG5BGljgdifNq6jOybNnZI2VIWkdnxiv1hDecZPrcYLXm/jeBNerhjgiZw==
X-Received: by 2002:a05:6808:144f:b0:406:39b4:2232 with SMTP id 5614622812f47-40a5d053e13mr3229763b6e.3.1749681761758;
        Wed, 11 Jun 2025 15:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:04 -0500
Subject: [PATCH 12/28] iio: chemical: scd4x: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-12-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=w6sewnHJwVlZtUZ1XCEB4lsBcr4uySr0t3enC0nXMgo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXTO0fwqvdhMYlsTHXtIYGob2RsszuHsUyLs
 SfL1LagKj+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF0wAKCRDCzCAB/wGP
 wPZeCACIJ32MRJGFXAWVkUo7XJ8IPrL0OrDOVi8YV9Bz71zO9E1Xbt2tdxaHIRCxRXTjHv0+zxe
 w/o0PiRItwBJgVkYx0LCNcV0wRJiX/3SOXvkNIYHEjW/6bG5mIuft2mWy9pOWtFB1hHlRO5OHW0
 HRZV2jH97fcqcIdH9wSd/O5uzb2vY2Mv537m9vzG3NCE1EZ6ni5m4frRR2Ju3EquwZ5eFRMUZDk
 6TffT8htFYg5wCw+GGZ+kUM+ESDQvMFNiOZTKVDPOJtDl6Lepqk3gBrXVA5n8ijfXQPulfkc44L
 Ad5/aXu1TD4BBvsWqxbL+8KuoPFw5kwu1Q/N4uflwEd9cOV+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154242_514953_C57F5169 
X-CRM114-Status: GOOD (  10.87  )
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
 drivers/iio/chemical/scd4x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 2463149519b6d82caede9c9b253942fa421fdd3c..8859f89fb2a942d940b1ba7adf202977df7b4ad6 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -665,10 +665,9 @@ static irqreturn_t scd4x_trigger_handler(int irq, void *p)
 	struct {
 		uint16_t data[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	mutex_lock(&state->lock);
 	ret = scd4x_read_poll(state, scan.data);
 	mutex_unlock(&state->lock);

-- 
2.43.0


