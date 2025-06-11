Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF80C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=; b=337Ri/S9unoyK5AMIRa4wMgbQd
	RIy5BUEvrPe6v/a7boBTlJ6AXR5QKWjLoUF6JbSnrETE1xXb+99s22VPO/xM0ihyS5f3rrf7GwOfL
	p3M3zaHMy5hXZ15zmdvJ/zLyC5CVCK2qq64Hevy9U8WQtVutsjunQdNTquk75D6nibbn7LN4iPr6j
	8okIGXDK8Ztl4kYZu9lBjrghbNfEFJHL/t48A4ogSJBQKcLnm+xAhdtxozOTV2LMQCJ3mWwe0HWhG
	dauaxwHUJJ+ehhRwQigmHvzdp7DOS1itFKFC2t6hB7P/IHJsCDILw4w5WsVSlPJSnzb5vucEI4k/9
	WZgXu9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVIO-0000000BjQm-2zSj;
	Wed, 11 Jun 2025 23:55:52 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9t-0000000BVks-2KuK
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:02 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-72c3b863b8eso276262a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681780; x=1750286580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
        b=PZGvfwfdp9MMQb254Zc8I32qEx/UWDGZq8OaHS+XOn0gzfgwq6vTJQz3v7gE7VwSXh
         8vuYGKh1zn2WtiELH5HsX7Nqie9hM9voJxFk374IQwvnuPQz7CXZj/0FBeYOnPexkQVc
         3eMZ0HRGGbORT+4C7TJ/P52LVk0Gi2ADmhJKJPBKx2XJF694WaHknfXPblR4i0X3v3hZ
         CHsYYHfHPKccqF3bfZttHyViiOhbUQmSzdhxBp/BCsQazRzWi1/5bbpqXarOFuCyQGQ9
         2t54VzF+ht8la9ieAVfWmBBrntIjw3DHzvzMT5RVqCxDecKg0QzBsLolxKqcwh283Y9q
         eNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681780; x=1750286580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
        b=YrO8vr5Ct0HT1+tiC0+vrnOUERuIbU+B0OMjwPv412oCMvOEHHt98P7XBrMSyeV7C2
         K3yVy1/hTSIpKxxlLwQOYV1VYeTFlVKY1S9khz/lv7LUxDK+aDi9gji6BD2wTFMS1TEW
         b1sFfZLU+Bhp59cyN2dOpT1sMvM8ZyfyKzAN7L9RgfJXtwekJ0Dm+PhPk2GdlRG1oWMG
         tUa+02bHW5xqZ5vJWZDoQr2e3hQNpsYInoJ2NHs2tkuH6jNpsTGMcHpnT8PPCMwU100q
         i1WivPxPGjlflOySBevjIssHn344swFwYPV6eqfdd8Rje38lawPW07KAcPRnWLd/FFkr
         p1AA==
X-Forwarded-Encrypted: i=1; AJvYcCUTdtCLvqQTuJ19CALSzmcnXO82M5jdKpNE/6TufYWCRzpR5JKVXoqqIcAr33W6zy7IOo+q5KwFoXSfrlTwpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5sqmJoDcXGP1TAdYGlqQVt35JukNCUzYsbs7q/iWVYSuThhm
	N6XYveJ33HhIL3rDW/H3e/gVAseykueu8D8cW6QpY/YMRO31gEAkcHXJpOORG8a63wE=
X-Gm-Gg: ASbGncvJUL3kf9l9X3Rv53CX+5h05I0LkBDPymSxS136P/WcBmhwbiQVigFHR1bgrQN
	RflO1kBHXZTAn19Zq3tHztl3tihYPlVVg2BS1vlDyNbfzvXrToEEzio5Qykc8NLwu7yPxDbeg+E
	56eVi+zCFdY2IX6SXjnu8a2UFkIYrKaha1BAvaIScBI9w3UNdA7aGL40G+8qGhusMh4Ge4GWUt2
	+qve84FFqFf3IG4sunxqeKI59+hvRN4EMJVyhFaogAgMykUWIHj1K7ZsVd8OehoTzmZZ9IwjzWb
	DjrYyOk2+AMY6XvPZgGc6IAuD3+kz9DcZYd/QCiIurivxtSyC0047tW6NBA0a8KkA0xb
X-Google-Smtp-Source: AGHT+IG6Fb6ruVGlbHN4wGtZayIBTNPpt4aY0XQOYZxYfr6Numkaii3iELBWcumofDFYzCahxlkCgA==
X-Received: by 2002:a05:6808:199b:b0:404:f14a:1345 with SMTP id 5614622812f47-40a66b0ca19mr438688b6e.20.1749681780657;
        Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:15 -0500
Subject: [PATCH 23/28] iio: pressure: bmp280: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-23-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=jR04YIdN9O2ZMn6ou5NomkQoDwMcMUyRaU/L4iFhuwQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYdm0BKld1aGwa/n8Ufra0S7lpef2bRmG8sm
 XrxLOEC2AGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGHQAKCRDCzCAB/wGP
 wHmNB/9z/ZKAzqrCy6jCj9Nu3CwEx8km3zZWktgGGSTTwtSfGw/x5LdCO3sFLygxQWItan+1Ich
 yO8fN+fnbDRpUq82KyKlfgXYeZ2fx7BLOWimk7amjtwwGL7GwFtoDG6M4WAYuoSlfZDY4Z559WI
 avlUzdpOOZ0uGVROXj1yJsI9B8t1XZCb7Vcuz9L61yMgAPtHcR5MOGVBvenewxkzOS4/+HGapl9
 U67xnC/8UibkMOEViHKdq5RBSx4DBeDzP4zUfHQD1dbiPQO+Rqo8SfdFfQMLRFMpM2NE1QQXecV
 eoiNvbO76iaTybSyC3JuboXfNbd7tzFGUfKYhLRg4vDgwf0R
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154301_588121_07143B29 
X-CRM114-Status: GOOD (  11.02  )
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
 drivers/iio/pressure/bmp280-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f37f20776c89173b0b2a8e28be0ef9aa30ceea53..74505c9ec1a08cf3ffdb55bf578d40ede3cc5d00 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1234,12 +1234,9 @@ static irqreturn_t bme280_trigger_handler(int irq, void *p)
 		s32 comp_temp;
 		u32 comp_humidity;
 		aligned_s64 timestamp;
-	} buffer;
+	} buffer = { }; /* Don't leak uninitialized stack to userspace. */
 	int ret;
 
-	/* Don't leak uninitialized stack to userspace. */
-	memset(&buffer, 0, sizeof(buffer));
-
 	guard(mutex)(&data->lock);
 
 	/* Burst read data registers */

-- 
2.43.0


