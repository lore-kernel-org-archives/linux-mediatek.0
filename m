Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E79C7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kto2WDWq8SXrCfQMl14bP+htdglCH2HfwzImspNOE2s=; b=dFcBKpe5BPfuf0DT4Nsx9ffrKM
	RSkpbC+n4DtfDsaYvKf+y6tcoen3oKQXv86Qih+wdGZHaYyrP+FrAEvyCZP+UrTGE78NcbAOYfiJe
	3KF4B8mmgQEJcrP9MhJ0m1lMYTXDBr2BKlmPc0WMtq7s9m59oP1OxYTt4QYBhhEGZOG0SaXziJ/UB
	pFWau+QZEhx4cG2Dy46E1eEtvJ3K6MJ1PS73i4a5hNSq99UXjjAiqA+6g+FJWIAq9f5vR1IyqVwWN
	ke+6jW7CQ1K3JqQJqutguG2+XKCPDjO4r0U8SBv9qcgH4bEPaVgp01SozUOIh4mDtVkhw55NFSANl
	rYviEmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfEz-00000006Hd4-3RZj;
	Tue, 01 Jul 2025 17:57:57 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcjL-00000005rIx-02mB
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Jul 2025 15:17:09 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so1816652fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Jul 2025 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751383025; x=1751987825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kto2WDWq8SXrCfQMl14bP+htdglCH2HfwzImspNOE2s=;
        b=tFTXD12EL3sjW5iY7vNmcQuotBePn2TCf+cUQW64Gb70ZQIIpWd8oSEOd48POCxqjd
         Ot+InkY1dEqDYqkcb9EOB+Xg6Akh5wciXxOlQ4ufarAUgWoYgvLvqM/zKH2QjCsZYJ9d
         7PQ+o1CITfPfZoRi5ehtkYhXrJPYodfNyPAHoPcatKTF4JvfwMHat8tmdp8pEQh0VFKz
         YgXBaHxRTlitXFqaHTk4xMU/DR/5YPxH+9v0za4cbUcqWJttkuOiVHAP3mEpnO2t9uPy
         vDi+GScCQ8EL5k/+yJlf4uGhympo4QGBWcRkqg2rUsBnOqDQBUJ2B4CS/JKF8E2Y5v9C
         P+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383025; x=1751987825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kto2WDWq8SXrCfQMl14bP+htdglCH2HfwzImspNOE2s=;
        b=JYyfjKKl2997E/fZuPen+tE/u7uCUpl+tfFK0Bjxih1EM+9eMgmbeHcgk3hAzCRHw2
         CV212e0ZMyvAhi7QnqIZT2wC0msofvcBKvhdEL+/CCmRstg1BJtxmiLKZM3UgbdY3zhL
         zFKiJixl1Oi+2eIWVm8hzicwuFmSWhSspb/5Cs00qbFMMgPYuSZTgJld+iAOqmdoG6Xc
         jVLAnNijfExRs5VPHlz12EVKSkPWu5HI4yjAhUev5hzDa0EKFCop66ZWMLDfloBbCvr5
         5KEhJgV8CHk0+yDESJr+80uDCosJ8kwvtuNjdecIP8kYTDNRYl1iMmwoRm6MRDJObaaV
         Ge8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeq3iZc8sPW1GDudPGkqZb/h7Zea5VXhbeQ2TPzy/XSDwEaBDXem7aFYPgpSLgos3tcXnnq4rDvjGIf6vrjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgdMFVgGS9Ca7Ws+2+9793o8MK91G4Ri8ClbhcjF5FMZkwfNrQ
	L0ubL0fUgwOEbQXGbcYR+kirW9UMH7PyEB5HJc+OZ24pBc/z+U1UrVS1mLTOIKo+x/o=
X-Gm-Gg: ASbGnctezSns1k0/XEQ7+9fBRuHM4xnt3uF/Fb8AnxRJcDsW3rz9Lo4aSiTm6B63h7d
	vxjcZFZyWZb8IKShTWOlQbqn+PGH6pJyddWQFq4rRGs0jhKlUb3LmYnCOiIUPa+4d83iuQrr4tN
	37I/app1spIq0hVDSV6sy5CS32GnieyZhSvicDH6HfpAkiIs+gC0o0SSZDgcrKVZVUxj7d1lw0L
	1ELF0XGPbGpNNIke0wOHbt5hSBJA2jAqkt6lh0USsoh1Gn0Io4C90OSCSnzpYYZpatjzOu/LkN9
	cS+rAENzJtxgTIDeExUOWkkTs8UrQgakJ7+TiVah9YjwwhgyjC7b9c2MtpIIZ+MXy0cfb8vq83F
	wSXpzkfIZ+e/4UCYWUBGiqctBBT3HzJKWOMzgCHs=
X-Google-Smtp-Source: AGHT+IGFKFZEsYZ4erbtAtqvl8tEHdHdyZFtcG8OKzWXPDqsQnJB5BtiKcEBEjaczDbwqY+Qnse9tA==
X-Received: by 2002:a05:6871:82a:b0:2c7:6f57:3645 with SMTP id 586e51a60fabf-2efed67879emr12142176fac.18.1751383010329;
        Tue, 01 Jul 2025 08:16:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fb14esm3319606fac.42.2025.07.01.08.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:16:49 -0700 (PDT)
Message-ID: <3df2c424-297e-4538-b350-5c465b22fa39@baylibre.com>
Date: Tue, 1 Jul 2025 10:16:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@axis.com, linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
References: <pnd7c0s6ji2.fsf@axis.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081707_089772_851B9AA5 
X-CRM114-Status: GOOD (  17.91  )
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

On 7/1/25 10:03 AM, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
I can't speak for all subsystems, but this would probably be acceptable
in the iio subsystem.

However, I don't think anyone is going to accept a patch that touches
all of these files at the same time across subsystems.

So I would suggest to split this up into one patch per driver and create
one series per subsystem. This way, each subsystem isn't bothered by unrelated
patches that they don't particularly need to care about. And note that some
subsystems like net have additional expectations, e.g for the patch subject
so that it gets picked up by automated tools, so be sure to check the docs
for this.



