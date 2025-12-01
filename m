Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51694D116F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=; b=xwEK/ooLqXCj5uLMrgv6QLZKy/
	x8gmixhFLayrGzyKCo7K1ydIUGtlgAuCBHWrlhFDfF9Gwq7KPPKtv4iPzGUCPxBKt3/XDqS9D1Dqa
	YPUZ4yBTxdBwqOwICIyULhAK3Ih8QYVwKaqWrFrPSnFWlIICqWRoh7sIJWLXp+rE1fblbAW6PWOd4
	OgEaXe4hHe8BNsGtEKnfQ66U3nSSbPvVKIAylNU/G5TX1ilVlk51qP9U6lITC558+JCmn4TCocU32
	mkaer4p4JWJyvqopktyJl7T6ZDDFrLCsx3dHhz/zEtHUNSEKCWQb6AYRtUz66jU5OGd41tATRtHjE
	RMv5WcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7VK-00000004LeE-3sXA;
	Mon, 01 Dec 2025 17:16:02 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7VG-00000004LbX-3hCm
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 17:16:01 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-45085a4ab72so2135380b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764609357; x=1765214157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=I1KyIvuJUFy5jFk0CCKJuXJa9z3OdG9VUpwTWl/KX6iQuUmYCe2TtKK7sio9EAbou9
         YELTkoWGFXgDb/ssuQ7dm7OnzahNbXfLnG8aFleOEMlM/K2vUbUfCWJCEh2V5QoS6wXL
         PrkGmuMbTsYlfAfbqhAutgya0/nt2BN87fUS1TL1OQ0W1tx4Dj10yU8N4CtWgolQGp7i
         WXMASSHYY+hkumb8Z/K4B34Bl91rFVNTG/Kszc1K6ykriw7G1tX4ER40vJmSpIGWG3Np
         WxaeXV17DcvXp+GkuApGge5pMaEUu9R4QolT2fYEmcc9sI67pB6Ssp1WjzQxhwaVJQu6
         vVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609357; x=1765214157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=hdmVCokp6R2tBpKiL0tfonE69qEx1afYEzd+J9fMuhxVaMO6b0vn24noNf4FuRBt9d
         qJEUFTTmZ3G4ATR7y4Oht3jr2RybWg4w46yGO+zNiAMI9k+e4ClBXVWjMhqHZ4H/jrCe
         X+qaAcYlItDIMdXScEtbcwtPb478sMYJ2kJ9Hsnt6y249WqYRVCIDMqj3FkdotURdsIj
         ETib+xGyD8Efats1xgm+J4gyD0M/kGDZBDLspGkqDeieNkm5hP2TbGHRadE7FPhY1iN3
         nFt7iHD+30f3KZQRo+//vJjiIYsth8GzyY7V4UCccxATt9qeYyVR2pVhis8VuQbsrw3v
         9dxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxIf7+UwS9jXwQkUoxGXpYpfiD/3C8gHwbyytsCO2OoHjJjhX0XI2ejU9Hkyb94jCbji0clbr5qTSiExbx2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0WY8+fErDs/smaQ17pXP4QYDHh0H8KUGYsN+XOwJg/sA83iJ
	s3NI6mjOd/SsjlTmPhhlbsk3px8YHJnvg71YIXQVZid0WQucS6oSdm6uPIM+4u0sbtw=
X-Gm-Gg: ASbGncsKr4CHMiupaUbyR9DSwFSSWHzS9a7mQjb7pgdBZhg9WBNRDyI1pe5puwS6Reu
	oY8OIM1DHFhNUdAhR9fSH6FinnLl9XWc4tKs+pYXBzSK6mT4RAYDo2kaFUBKBveNneSnhhiRIr6
	MBE0jRoMNNMSmosMS2SHfUouP4d2t9MWryj/2uwrhqf128ipxcQkhGndi1hGIJ9gR95pSQaD+3m
	/RmGQYT1Gtla0iGF1Zcdqw6nTn9S3kRIXu3LaEEhnbOmhng6AuvlHhM5gaDMVx9Kb6z2an1ek0f
	m4Qv4heEYVqffukCuxbOk2Wc73jmPbdyhXo0CEttPiDdnNP8/YXzZffUSoTjNyn+mQECc6zFphm
	F7sA1Ed4MrLnPUpYHQfUcZmjfwnN+A/rrpI263VWk8MEtX+fbCGDIpK5u10OqDtqvhyQ8O1j50a
	i5t3nuJauiN34QS55xZeFT3PWK6FcFdzZV8Z7FZcv3bD10X5RPLxAXwadZHA==
X-Google-Smtp-Source: AGHT+IFhXzu7oIvN//K+0gQ9fSmHlhexzrACWF7hMjJsE/gYpW4bjA3882odDNc+t9DkOzPtuw0t9A==
X-Received: by 2002:a05:6808:1790:b0:450:65dc:1fce with SMTP id 5614622812f47-4514e5f84ddmr11527679b6e.3.1764609356945;
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:b67b:16c:f7ae:4908? ([2600:8803:e7e4:500:b67b:16c:f7ae:4908])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453169b2a51sm3922009b6e.4.2025.12.01.09.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Message-ID: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
Date: Mon, 1 Dec 2025 11:15:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
To: Romain Gantois <romain.gantois@bootlin.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Kevin Tsai
 <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_091559_178304_EB0BBEEC 
X-CRM114-Status: GOOD (  11.29  )
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

On 12/1/25 4:59 AM, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---

...

> diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> index a8198ba4f98a..33d6692f46fe 100644
> --- a/drivers/iio/dac/ds4424.c
> +++ b/drivers/iio/dac/ds4424.c
> @@ -14,7 +14,6 @@
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
>  #include <linux/iio/machine.h>
> -#include <linux/iio/consumer.h>

Unrelated change?

>  
>  #define DS4422_MAX_DAC_CHANNELS		2
>  #define DS4424_MAX_DAC_CHANNELS		4
> @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose <ismail.kose@maximintegrated.com>");
>  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
>  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("IIO_CONSUMER");
Is this actually needed if we don't use anything from consumer.h?

