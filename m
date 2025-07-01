Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380E6C7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=; b=rq6r5eW6/8Lw78zjrTcMqynka0
	qZNzVDaL/sBODRB92fQRkDGIRf9GmXPdqrFFhCrElYlsloO1Dm3O90DUO4bVTTFPpkKadRSFwI8Dm
	dwTus/L5g6zqbV6WL1AREZGmKzO6yNdfsDyyxHR281eAAcdCW2MIYkWvCtxdOpSf8tM+S2NaPH6nd
	CxUR30NrwPM7nAvhWG4VmrV4iWpCbyu5qGIx+L3jOPm4gXIvOqx9k8HRTAv/FK6B42BOC5SUsvQ3/
	HroNt13UIh5tJqId6SxXCVGc3kGZm2F1hTqxSj83knAbonSnFGUlSSBdjWbTvtYfh9Flkh8VnDNIH
	Mf5CJv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgOz-00000006Rbx-29uH;
	Tue, 01 Jul 2025 19:12:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfEj-00000006Hb6-2RDW;
	Tue, 01 Jul 2025 17:57:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-adfb562266cso971625366b.0;
        Tue, 01 Jul 2025 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751392659; x=1751997459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=Sgxx4ynusHtXr2gqt5JkpK/jVHJHsNDpgyowH75ey3xbyafu07Wok+tiAvj4hfSLsf
         BYojsJCsrnDFxBCVJFktGJqgNvFK3Zmnh48pYLpW7oTxHejko/VreV5QrTjSFY0gVmcH
         9h5Tu6imCJrW/IRvFJuKk9LeTj8YqAjEvRuYuwNplT6EGUnSMtsc5gpzQGT4vYI3PP5A
         dH4wNfTo7PuVTlBpdpdDIVcx8Si3qHCGKB5GjyhIYy1XlVOqnJlC3hoJw22n4ry1cYNu
         6KnZgpDlxrtWC72yAQ+CfurgCtIjIeCELiM2uQfj/8+WHz+Ac04+dnlQRBPZqHzAVqwC
         A/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392659; x=1751997459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=KkVhZor4JmL6hLm2YVAEdy6DwlE84QXlnUTxs0b3A+/7m43vAN/w+Nmhq3rCjJZQUM
         gz1wQsFdzXUAiBAjZWRYys6b5HHM9aaNq+qPYvISAh09t6v9nawUJ1kDeGmzQdu4ey2+
         Obh/uFUNf3gmMSUtgvSeuGKWwo4mzkJGNBYz0hvAvL3FiRIOIpsx5mSZbsxxK4cjusce
         mJHyVWmJZF4vYwpOiXXJH62JV4u8CXHDnSuG77qXZbf8ED+Sj+I27Tqx3SdM/sgGovlk
         lEIklVI66Vo9J0eTeDAxkz7yiQlxKE1eWl84VOiRHFzL9kAoh0Nz9aV1uGjRJClQWjxi
         9YmA==
X-Forwarded-Encrypted: i=1; AJvYcCUMDIXIBdcekB17ifXdjnGj3BANbaDdCTVZcjlPbeHq5LCVPgRL8zO6DoOtnUsWfqzLvi7UCyqxokXA@lists.infradead.org, AJvYcCWdohrLbtFuaIwkv9kXXHs3byQ0e0EnqXX3MgfEbq2MF2AIzeeiY4Tf0e9lmXQ4KMnejWEAh4AiLflrpBidGuv1ng==@lists.infradead.org, AJvYcCWoIW2FjiNjdWBchD+1pAikOYNEN3VCdgHKJM+GjnNWrnsSQ5EktXoC4kCvBqpSckiZ56Ap0eBQa6Bz6knK0Ok=@lists.infradead.org, AJvYcCWpgzTPs7f/grxgVxEzkalUowO8RZzoY95AKLMNQKrSaaianxydeInztVKb5sSDuzxA6ep0r+sT6TKyEljrxTE=@lists.infradead.org, AJvYcCWzdYrq6xucNSP/8PVn6L6wOUQmP+OZOmkYD3gefTkLksc7ZMEnZYONLW6Pyzk6cVYBP4N069owxVNAnpRq@lists.infradead.org
X-Gm-Message-State: AOJu0YykT2oSnwUDlH05LyUqiplNuUToGp7slkX/+dUzif2f88k8hdny
	I6GtWP/PNi96el0Ku0urVA/EJ03X/+9Wz2siqUY7N9yw3kXhVVia57UTFhMT/59cwb3WY0wg0/Y
	GFXyJZnBS2DcyZfzKXwZxgCHImuacKa4=
X-Gm-Gg: ASbGncvyRnASguFtYnVprwRDAE6sjM58juAcBtDUiDQF9LGmNcZnR0i+Xt8ugk1fhpW
	kMNCvHvqoisqiV5neI2FVawgHMqKK/iBUfASJSYJjvSX48x6ny499xs0E88eZIzpCyN9S9O6Bow
	IMpP0iZw7VIJQYJkmvwP/yzxH61HxwMcnvmWVJp2CdVFU=
X-Google-Smtp-Source: AGHT+IFi2mQZLuvuKUJ5Vmbx2bMFhgEtTB1rODdhMnUJkkTAqMfdBOcO66FNReafO5ChqP0c8B6r5Lro21q2uCkd3k4=
X-Received: by 2002:a17:907:1c18:b0:ae0:4410:47e3 with SMTP id
 a640c23a62f3a-ae3501a58a6mr1915225466b.51.1751392659068; Tue, 01 Jul 2025
 10:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <pnd7c0s6ji2.fsf@axis.com> <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
In-Reply-To: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 20:57:02 +0300
X-Gm-Features: Ac12FXyruF9twzstORuqQqTbcXFq7Oy0k32bhmiSfPFWKw8o7JRMkyPmwEAJIYk
Message-ID: <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Julien Panis <jpanis@baylibre.com>, William Breathitt Gray <wbg@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sebastian Reichel <sre@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com, linux-iio@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_105741_628790_56F45E41 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, Jul 1, 2025 at 8:44=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:

...

> With that
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to add clk_put action\n");
>
> from drivers/pwm/pwm-meson.c is optimized to
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return ret;
>
> .
>
> I would prefer this approach, because a) there is no need to drop all
> dev_err_probe()s after devm_add_action_or_reset() and b) the
> dev_err_probe()s could stay for consistency in the error paths of a
> driver.

Why do we need a dev_err_probe() after devm_add_action*()? I would
expect that the original call (if needed) can spit out a message.


--=20
With Best Regards,
Andy Shevchenko

