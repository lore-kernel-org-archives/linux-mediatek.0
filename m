Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC606FD45F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=; b=G2bC23CqGOiwknyVimUkcVNuya
	jFNs0HI+utfs7AhDZcerUbIlddb5oZyQwfLijDggXYVpUPC+x0ud2K+MvZB2Obr4x85pPF+WEhHuQ
	vx9D5v5MTLp11/euK138TiCSDWLYUJXYZEGiVOaSwHQUC03VR3/iT73TTgmSDw/8GBwAgkRdq4yFa
	zFQimxCqKT1GebQJ8HzUeFE6ASyO0NU1rRkr3Zr7i9kV0FpnMiXFeiJDsyB+1I47QtomW6eiXq/QC
	o6taL255Od9+wE9dJV1GKc/pckmF2TSa9dKkIm/YBm0awaKCFLDEF/A3lexJ9NHkFPmrFLdx4Hg1w
	rVIPcMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMPV-00000004vKm-38Cu;
	Wed, 25 Feb 2026 21:27:09 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMPS-00000004vJr-32PD
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 21:27:08 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-463a0e14abfso125686b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 13:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772054825; x=1772659625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=pe1s+URMgQRuN7jzSiHB8jGvhr35M3eBn1nr23Hv2oBBncBb6MSs1vCugKG0u/OgYH
         x6cldFOTGYXArxFHy/f3ay6wAG6Q5j9vmpAlZZGgQTpR9w5MRbybnBJvtkYKrgMP9WCP
         G+pUlND+5IQb88YqdEi/i/AqLn94Lc6nUCcNIcS2BHLEZoYiPuCuGmjkqFI8nj1oSmay
         u2KHt/FNynn15A8U3BIjYn8Fu+jSJSMR9QhNau1ACdZKQMcDXI8/dswJCfSOrIrGSi0g
         BiJdUv2140m+pJ1VAwZ9f8wBL3PmDB+d5d6GBOBMVrojkGb7vSO1kGEQe6GUn1SvjJkC
         QV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054825; x=1772659625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=qIkkDu5YYcbnsko/QE0wGvnvyvuqMn4pAS0B+dYGwNRrbT+TQW0BEzM5ETuR+CicF5
         TqFHmTcsqA5endGg7LSX3oyqn+H8urPP0OZmT0QHH2/Gl6ZQxwHodXwjB1qNYyMVoYGQ
         OmfDUBzGXSY4za53griGIqugqvNBBvfYqlCBXGwYgoqNEWmQDzJXemtPSip3RBL97XTc
         yxb0mfs+/pQ48xDKWn1JP/sii3dO8wgpgdbmRn5bZHfVlF+R+HQRB6lEf2lMUB2YSOmv
         UVrsz2LVkA+SCGuHR+QHvu/uZuUxXs0K6dHFJtvh/HIEIHkKurttp9ht5BYMpz53OUVU
         l9pg==
X-Forwarded-Encrypted: i=1; AJvYcCUNcKKP81skhZTYhHfwx4uXyVx+UjdOzOwv5Bu2RprgDzKOgDDtnLU8AInt9DTYY9TWY4MRuvqgHao3PAgwIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Dkp0CJYi32tK99MUW3mE9GDd7wlRwwdgTADQJinc4Da9jwnG
	hX7vBRN4TuYRZqXfw7NTuXBOnXgj+tsURZc4eh5ZPYaX4KlyJhGM9IZPGEd8rlzUHIU=
X-Gm-Gg: ATEYQzyaNBi3WCfc2yrKlObc+aner/W3tLIkHEglQDLlKgW2N3cRxA1zbSTXj83jbK6
	gIa0UGULlV2h74ikkaL9zFLHkYDDgSbWGE9ROusik9ezePTNBzAntpzwN41NbisPCXYOjL/HKm9
	A8LhltOCB+Z72xBwos8DYOUV8G95A9F0ioEC9IKG97ykWm8zqcIonOOgO52+ZKoqLXsiEYGN8LF
	R+/n8sogP+LjsjVC2p0rZZ6GTK49uL/ZGg6ydmJmbLonlWPKP4bBPfcM+CS2u6GgM7htt/KvEoQ
	gEONTDxguqKvoVfCMwsEj2Tjlvm20K5mkdAh4oeqzeJo27A9X2sdnEsFJ5VbRk3ARH4RXFGPjyg
	w1pLyHt8NTM4Y3AtgtOLrwYjwQlDifXorbkM4NgBf3O24UuyV59szk71UzVQs6ID5qD8zl/075t
	WfbzzldeT7zUbTxDl/Za1EYVvSHDUkz1rYG2ViN9hfJbt5uoqbAYhd1JnAMRa5BerHUD1/h8g=
X-Received: by 2002:a05:6870:2188:b0:3e8:8e56:671a with SMTP id 586e51a60fabf-4157b210230mr8655778fac.54.1772054824819;
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:146:def2:caeb:cb1f? ([2600:8803:e7e4:500:146:def2:caeb:cb1f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf2572bsm64198fac.2.2026.02.25.13.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Message-ID: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
Date: Wed, 25 Feb 2026 15:27:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] iio: Rename 'sign' field to `format` in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Dan Robertson <dan@dlrobertson.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Esteban Blanc <eblanc@baylibre.com>, Jorge Marques
 <jorge.marques@analog.com>, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Renato Lui Geh
 <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Paul Cercueil <paul@crapouillou.net>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kurt Borja <kuurtb@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Haibo Chen <haibo.chen@nxp.com>, Salih Erim <salih.erim@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Michal Simek
 <michal.simek@amd.com>, Gustavo Silva <gustavograzs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Roan van Dijk <roan@protonic.nl>,
 Jyoti Bhayana <jbhayana@google.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Remi Buisson <remi.buisson@tdk.com>, Christian Eggers <ceggers@arri.de>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jir?=
 =?UTF-8?Q?man?= <megi@xff.cz>, Song Qiang <songqiang1304521@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101735.2368252-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260225101735.2368252-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_132706_963759_CDB2CB07 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On 2/25/26 4:17 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use to in order to add support for non-
> integer scan elements; therefore, change its name from 'sign' to a more
> generic 'format'.
> 

Maybe Jonathan is OK with doing this all at once, but another alternative
could be to introduce a union to allow both names at the same time, then
we could make the change more gradually.

