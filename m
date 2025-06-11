Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA115C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=; b=uMQm1nUaHG3b/FaFeDl0rvE9Ar
	e3x8n+J1DC3VtUJqQdVD5fLV7T3D1bqVqwjA4ClvbaT3a7Z4M55obANTy3OHZ7tvPUuIbnNYKEvDQ
	fA7qPnfrnbmfzQm/SW1R64mOQnBXgPQ043hPW8I+kXvMGUxVf8DiWrRHc8NaFikp1s5X4V7FVP6EK
	saw6jURAIAKcmXAdLTKxXqjc1mHKZzj/fyYXK2kzkbJFJZ9+tLbilbgr5v8/MWs5bQiyHqRTRD8Z/
	m3ooEHHd/fC7WyKlM1A2/aLDJv1jWAKy4iBAPIyWvcVM47crk+h05G388be0/kfp6OFAONW2/a9aX
	3ezmNYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV0h-0000000BgbK-3Im7;
	Wed, 11 Jun 2025 23:37:35 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9W-0000000BVUn-01uF
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:40 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4034118aeb7so92177b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681757; x=1750286557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
        b=kVUY8KYsbnSUp7VlMq7z2JiOOx/CmZNDq3aFvcIE77LwVwQWx7+HTxdj/SO78+iFuu
         O3hydyUUdYwVeJHLhotGIN9Gm6aKPJkF0piwSp29BjFgYApdAVK3KBntTZkWpQOFPLKj
         5lnyIuDFNH/plJe1n6vux18rPsFphgE3rIWLi/TyQovcTA/fzG0rfR21VenZz/Fi7BRR
         A+JpmzBjzdJG4ylSb2Xh+o9DnhLyKW8TLk8rPTFROgQTUvzGH9oMlXklLaPvVXVoU35a
         ToUDAT5zM0t+zwRTpr3M+TQj75dOCYq8AtIHVoqeLXttrCJ+0KJER5QIWoz4hAjjLOcd
         +YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681757; x=1750286557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
        b=lR9Pi5FN3LjNxebbSX+544BcoryPiglLY/N0rkYMtmwbNXUU5xGpyFLQKZbpCHe/Ta
         7R3wGpKlUAxP3rtYk4aL1Q+dI5sCnNIJrVRG+Vx3MNQta9XNyvOGo63MljMwKaLD6eMa
         7SbD7plRdSfyTp8bTHCx9xhMv1LEI5NY+76ZIEniSi4d/ecVANWQjmk3XRhozWxHn2ch
         AK7MWgfnBLIepgWQ4ahyA8Fw8oJkdnFB9e/Wcu4Vb+Dr3yk5mP3KyTZYuK5wLp0YC29s
         jXet1TrSKzAi4jigN7g8kL3rv4o5r8D0fQLL6XWkr74zJbeKHUDOKff0LTuX4PqyoDNx
         p/bw==
X-Forwarded-Encrypted: i=1; AJvYcCUSnXFXOqmjz4C+AhtgXunIdmqUA+Bv+G7Es+y8qaxntAvYer3OWS9F8ocBgWkshgSjvEhMdFm84jgMDhN+Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/O3CmS+mKnK+Kx178L2dw01BvUUP0FLSREM5qYR6Z+G5Tromf
	/f/A/FAA+gDTDGfniO+fsQ4uqb+i7f8lVQlfmDy3wjIu1Fiz0wSnXuSvMWxZW1AIhcM=
X-Gm-Gg: ASbGnctEmzvRo6cA5gJxtggLHajHJNgpJpk4AdfxnaSeMid6XYg09Ocs27PjVCIU2Sr
	80k7VuYAxwbF3z0gn1y6Inr+jsAkGwTAzJTqvEoqcBxkXTB0T/3R7CKmm8k0OBoeSXxg/ML/uN6
	4x9N4SEApWgnRnXIGhpUrx4UrpWBkY2iGlKF0Qg9Dc+Rh9c1DbVv2XsIH+4prVxG8H9JKM5+1XY
	ukTIUIDBUeylAFZEoOtbh5r33OLNeUJIV6scT2kO/jiUb2aQN4GL2iO92fvojdNDjghWFaK/aGz
	xvfAR5jDcSDJ75Ul4DGUM3X0cIYu5oVwXmDy4/+NWhSWEz8W8GUYiKdLP7jtakcBoIqd
X-Google-Smtp-Source: AGHT+IFExQxTK2nqz9eZvqFA01OLk3tdW0HRirCOET6sNhsVUFcwPfvM5Peex5ov7to5WvXVcBavAw==
X-Received: by 2002:a05:6808:218f:b0:409:f8e:7273 with SMTP id 5614622812f47-40a660deb1fmr937185b6e.4.1749681757305;
        Wed, 11 Jun 2025 15:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:02 -0500
Subject: [PATCH 10/28] iio: adc: ti-lmp92064: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-10-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=H2qSnwk5w335N1zWnLuUuRDW3evPi/7hcB/vx7gI2r0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXGMQtBWy5ZBcGQvb7srptCW55i3K59YMUWH
 K/p9lukFTSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFxgAKCRDCzCAB/wGP
 wMdrB/4wnul03c3MOAO6mWCe18RIhEvueAt8702Bg9iNqcJOIXzAq60UtlsL8lL9KfJBeyTWIE8
 Kn1YcuPT6kG/NM23xq9DfwqkwmJRaqql/t9NtrWj3fcDZ9hisOphYqKQTG/igEAW5g6Nfcz+8bW
 0MGHwVhT0gE2vhbfXW9+hFrHBHtmM7Ha9P5rGLa3H6cx2R2thSNCpjzS3ShjNnVhoTjLv0YbNk7
 cVrheUS1e/VAQdCaGjeafb/wfh7v0zxFJ8ugIGJ3AvK2hD9WEUPNck1toBMCR/UjT3Eb3fKsEzp
 LKfypHeHbcCyjL/xNms+MxWA4JU4Wp6gW8jxoF72I9jj7qfq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154238_053494_8710475D 
X-CRM114-Status: GOOD (  10.98  )
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
 drivers/iio/adc/ti-lmp92064.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-lmp92064.c b/drivers/iio/adc/ti-lmp92064.c
index 3f375c1f586c4153caf9b47c34a0dcf6d5c48266..7e57006a8a1268cdda3a31d7c0366f72e1b11ea7 100644
--- a/drivers/iio/adc/ti-lmp92064.c
+++ b/drivers/iio/adc/ti-lmp92064.c
@@ -200,11 +200,9 @@ static irqreturn_t lmp92064_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[2];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 
-	memset(&data, 0, sizeof(data));
-
 	ret = lmp92064_read_meas(priv, data.values);
 	if (ret)
 		goto err;

-- 
2.43.0


