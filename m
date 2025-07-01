Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23107C83038
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=; b=O2U2hGhNskgOBCEWaw1SpnSwyK
	SI10yof+LekfwMLAR9P9J+yJIu5VkX3E+dcElfoYjDkynofw17BNeQNU4VmnupjIfjmPuxkSsuT0f
	zqm+glsGpJvYvCo5+jsEQfJThxGB6vH+fD0ImBjTkF+2PcdPX8Gj4YqkVfVaDL+I7WEFUZI74OoEq
	iI8R0IpxuiqWeqyVleym6GUU3Tfen4gCpLHQGx9QyZcdJb9uqKeJdAdMhpRl9ZpVXSXrsbjoJkibA
	1F5zojn7OyykRaqeTBwjeePCbx8SyTwBsRzayU3wn90hkjrIvMCJBAGAfBbmXlaP8ri8HDA/xMonJ
	rLJSFLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDQ-00000006PC7-1SUg;
	Tue, 01 Jul 2025 19:00:24 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdnl-000000062CM-01zL;
	Tue, 01 Jul 2025 16:25:46 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d45f5fde50so170855985a.2;
        Tue, 01 Jul 2025 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751387144; x=1751991944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=lAsYTX5Q/b+rJKmHkojnbcUBDqsB9ytu+fhYKWzmWwNJlzCWFYgVES5ZbrKhTdviM6
         VDRmXT8LyObUh/jbKHz7i5u1zzUa82H3RBjo++gK/unnXy+NQmF0zRqoLhqNWkb+e1ZI
         vsVO2M+ffNINvaXYC7OTgUukugegJ0rr4ciCuJMin6ZGLSJwwouRCYqLAnuuJFKR+uTD
         pCH8Avp6kw54rHrZgF9zaG8ECiRfaG0u919F/C5/MpUzncrAU8R2YsabnuK+NWqtGQ+Y
         v3ZbPrgazCjdagcviyfzgHAOjmADovYmyb0JFlYUBzrpVSQcHLJNXwecqthl2MbCIUig
         thgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387144; x=1751991944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=XQYXy+zWldHiBuIns2EtlPIjzIamKmUSjRheQBYZ0T3tsbMgnmiiGTU6o06Faq+pz5
         D8HglteAq0PQOacRTjoIeZnpV5A7BqSKBdNZCV9NzHw8aerMVGSvHbUo8KyoWko53pyo
         Q7QkSFBQnikubGL+7AzV+drlUcrpwons5PYGY6mDvOvbuez50ZORm0cWkbb/OOslFTgf
         7a+A9G/a/tc1sLvxH6X0yvGydQyqGKP7SGpLWPpudrE26AGEnU84JVdo0orhQVz+W0/Z
         AV07Y8hDjqiMaQbpW5BmKbc4aYcSxG1xjWwuNsGoxBZYrsv1QfOrQ7WiLEfHdaUnEDmg
         g9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUKh8TeSfhhtBzC5nGJAcSCSat1dpJA7xMBF6gJw527FIDsvad5aE4h16zlhYM4NKr+sYNaj1jvoyqDT2/6MLA=@lists.infradead.org, AJvYcCULJJbxVwRbtzIK78BGRsMC9sYc1PjLI+noAd+cuRq2G6PpyeOD5htwGrYP+980iYPcr08cYjIOTQOh@lists.infradead.org, AJvYcCUMOqvntwMRqIpkaluQQWpvot6WwrPOpj09/W+dAgSV4qhtpqFEbt/kbeIjvJiq3jeR5ztBueDzhC+r/D8vmIWnbA==@lists.infradead.org, AJvYcCV3IeoCKjZGiMT8GtoTk+EvLV2k8bnvnAeLXyAyFlqpJVS0E8xCYM4mDM0wKkhy6jesA1DM2FGlKpcvDBjezjA=@lists.infradead.org, AJvYcCV8vXWSNrDhWuzR7SZyFeYNWxHSKY5hPPA/pv3XD/MHpJo7EdGCAJKWnsXV8KbKV1IJky4hQib8IpUpbYwF@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmsffPNIfxb3eTE6ixHo27IzX9+fqcxHkkxhTj6g6Vh4O63OB
	akSn/RFgLllXPsQxIwO/uKItHxz+kGZV4Y6zwrOJxdPcwFFmThFl02ay
X-Gm-Gg: ASbGnctck+xuNSkRFKw0FQdEMq9CDUt+DPBvSMIab4iDckQ7MkyHkRivJi7pBwJHG+X
	e22ISRhYGN7CddTDcj+TZzz5l6u6Js/nrfeduhqL4tYMLQd6thtUzBrYvogVv8n0qYFTTcVdpKP
	1Fe1N6/GrfcSbJupRkSJmAkJLpCOdjDmmLgi94NXtMFyA1sztabDM7r3Wv7OLRZHKwdpCzkQvUL
	e9sZrMrdVG4AVTdebShr38LY3MOvSy0mvXKv26cCrc576ZN4cBmzUjKhw6zsoU1SJioCyW4XKLL
	lDUUXQPUSTbJfHrV8hTm9Dc/7jnXbYmouqm8wAfAXWSchaxRMg==
X-Google-Smtp-Source: AGHT+IFaquJkOuj7GD/t4hRYC7j2CE8mxqIujMtOYOepN4kjeXyf+EKHtvQBv03/JpyXmxYQUG4sHA==
X-Received: by 2002:a05:620a:1a1a:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d4438566f9mr2476294085a.0.1751387143543;
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Received: from geday ([2804:7f2:800b:55e2::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4305sm86349236d6.66.2025.07.01.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:25:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <aGQL72Ssa4RHShIp@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
 <aGP92Aqcxt-x78nu@geday>
 <pndsejf6g5k.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pndsejf6g5k.fsf@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_092545_046339_75702DD3 
X-CRM114-Status: GOOD (  24.85  )
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

On Tue, Jul 01, 2025 at 06:15:51PM +0200, Waqar Hameed wrote:
> On Tue, Jul 01, 2025 at 12:25 -0300 Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> 
> > [Some people who received this message don't often get email from geraldogabriel@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> >> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> >> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> >> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> >> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> >> return the value instead.
> >
> > Hi Waqar,
> >
> > thank you for the patch. However I personally advise you to split the
> > patches per-file and remember to then precede each individual patch
> > subject with the proper subsystem and driver touched.
> >
> > While this looks like a nit-pick, it really isn't, and my suggestion
> > will make reviewing much more easier and you'll get your Reviewed-by's
> > and Acked-by's much more smoothly.
> >
> > The cover-letter should probably be preceded by "treewide" instead of
> > a specific subsystem.
> 
> Thank you for the suggestion Geraldo! I will do that (as also answered
> to David).

You're welcome Waqar! Note that David's suggestion is even smarter than
mine: instead of patch-bombing lots of maintainers with changes unrelated
to their subsystems through a treewide change, he suggests you split the
patch into one series per subsystem. This is indeed advisable.

Thanks,
Geraldo Nascimento

