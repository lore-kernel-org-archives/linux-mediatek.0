Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6323EC71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=; b=en2ctbkhLtoejOWqzQx7yqI1At
	lGG/riLSf8aIUHWWe8Un0a/Lk0BBD8yRG7eOH5+lR30YTd4MBCPJNi6AhUoEECpLLsYYiOviks4ud
	WDraza1JbhuJQH2jaVoVTkwPDkQenpj/N+zsnmSweXqMR/k9as/dU8HQhcJ7Q2LJOkgGXVdTllw2E
	UYDGrOcK8icDU/e/OPE2jjnb8Ufv+GGBhQ8of6AC2UrLVWfxvilQLcEXz7iZjCI6oUqp75Z1H94vR
	cdnaITIcKOm8opjS0yEvv3krqUg++B8xRZrCcI2R6tLhYYEx4bLv/Zljd/D2uuN99dWPMuCLZH2L7
	x8FYZuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUhp-0000000BetT-1Hm8;
	Wed, 11 Jun 2025 23:18:05 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9D-0000000BVJq-1DJE
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:20 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-40a4de1753fso197425b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681738; x=1750286538; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
        b=NUG62BSzE/+G40oX7mA86om3zZzYw/ur1qb0v3igExn3z031YC+LO93sKeVb2dR3b7
         k8tyAPeT17uJgz/APupKcdRgmqxZbZvtgSdXyJkSFGrmLP2glMDOruZ4+W7ScdN9T+to
         b+Ff82MozJ4LFSG+Rtac5HeMBF5lo7ninvrrt14kWFFV/stJX9MVCNKfJ5OEd49E1IGK
         5d69tzzVegutLCTW60tkLbhF2HzmhQY/fnkLwPZE3R6KMgR/yV+38Sd1oPtQuAJn0MRu
         3MN2RJrkRu2J+fFbstD+uO5i05jmCm3c3Qq+iiEYGjUKGsuLV/XFLZXkEShmGIp4fyaR
         08bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681738; x=1750286538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
        b=qwpUtrfaR57BWM6qAX3T0MCwJW6he0mkZh4zsFq7qgU9yywWyzSAoMT1lkqySpdaZm
         N1JUbeURH3FpvBk2Jh7ip7jauI5KVqmqkIF+f6ncaDlCJ542HyvSS8eC3PwCwGgSKdgS
         R2zwQCE4zt3We3J5V7xAVL7fWzoQaSAnpAyRsWgKdZYCDlglNlqpRU4IQ4N5C+1rbuNl
         EpJYiwPHfUH1W3H85Ren7Z5eaJ86pVTpHfAsLQGLZl10U5wW6DmFf8whsYSFtS7Y1yuE
         S+4NXHXG6Z1sogptO5Sq3MJxGiFhShQNeQsbbVFeA+JzsDzJBWazLY+BKm4g7Gr11mwO
         WL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4bvLrngEkfj3jkcGhPLYKxcLmq3l2odRpefKG5U9HQowvMiDMNJsZZdW1OO+LfsHMo5BIdZxz4/UDgzmsJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHHEBM8XjXpsFeTAiLufBBM2m26OoD02/HV8OPIdfCj3ulCBb5
	yy33ypZe7HrIiN2hf47oHidLJB7T4wUGvycDfxiK4Sr/0LnDxToDkj/KBxsd7uH5mq0=
X-Gm-Gg: ASbGnctKsEsEDl86cR04Jx88CNCmRtgYug6DfLvze2g9bJoihOpz+tci3CvVNTcZ0Vy
	RlgkJfJF/gv1PQ+16n488Cc5g8RmQ8+bnuIDyTjDjVjSeb1xHe/X9wPXS8tpG8nf4R2MZU24OWl
	NAGJ+fELPW8n25n0kh7/Yw0sqFnoeQNyWr+U+Rr/oizHALltfnoIqDDhCjnPBC57Jm4MR+I55oM
	O67ogcgH9hdhRhSboP7i6MUpHviPOwB7C/emo+jjbkIdxdG2UwJ/APqsFWRXWNFXf9n0yWG8Rfj
	a5ujA+EO73ooGJw+MC9oTarQI6Y0syqB3m9ChsmRbBRFZNTOxXg1Vo4dlAq7Bp3+uTFg
X-Google-Smtp-Source: AGHT+IGUaZZsecRpS6ezZKLm+idnU2IVxpLfqAg4YSBuYkt3FpO3sNHyKbW5ao3Kw3MTkHa7seuNaQ==
X-Received: by 2002:a05:6808:23d2:b0:403:304:6b06 with SMTP id 5614622812f47-40a66015927mr932627b6e.10.1749681738571;
        Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:54 -0500
Subject: [PATCH 02/28] iio: accel: msa311: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-2-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=731; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=odIkwKy7IqDnChDxGqAGKTlpXL7zVUclleEfAo7/6gA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWQWkEr5QWjTPvfNMocah7h8+meXXS5pWdsy
 5sDAkLdoOOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFkAAKCRDCzCAB/wGP
 wOi+B/sEIoa3eIWCvSKlVpRK8xGkIEyYTFb6Nq8IlqoeBNY05GGcL2a5hP1Gn/kmb+2MO6PapeI
 dB2wl0+dESiOgkcl+SenqcxbQRRAhbRbVRd1/Cqac8psYYmmgKDSdLHesmbAPsWPhWccCox/lvU
 N0jdZERcu8kxa9AJs3z5gfb7AoKrRAZR/Q31HaF9jMQZk9xrzgW6H7/w05EWYudtxJPdpOaPv9W
 5N4ONT005xNjYaL/6LuZKHCE9D7n0gCZPQTTr2LcZXOKPofYkVVrg6LAuac/UpQH45sM5Bykm/R
 cW7aI66fWEN0bBxgJ8Jh9VbYLcpVDvd8K/aZLgpoffJ0rwGm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154219_323945_D9C3E0C5 
X-CRM114-Status: GOOD (  10.82  )
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
 drivers/iio/accel/msa311.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index c31c53abc3d09f29d01efb7cfd31955cd88b9409..3e10225410e89a341411a75e544a890f45c8f55e 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -897,9 +897,7 @@ static irqreturn_t msa311_buffer_thread(int irq, void *p)
 	struct {
 		__le16 channels[MSA311_SI_Z + 1];
 		aligned_s64 ts;
-	} buf;
-
-	memset(&buf, 0, sizeof(buf));
+	} buf = { };
 
 	mutex_lock(&msa311->lock);
 

-- 
2.43.0


