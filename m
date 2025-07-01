Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5762AC7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=; b=KEldCuZFWEzu69/yiwmCR5+qdT
	ByCd+J53k6frydT2KlVfrle65UZdMtXiLySqXsW/sjEbKN3F8Cy5Cq5WEza1VcU7kqIwDAiqqwkmQ
	+orLxKO67pX9y8pQMJDbjpYJ8K5phzQysVobHDTZ3mnloz71rEDnE9y2T88KvzCMIqKAyC5MUVWOd
	V+OJGfjMcBJja1aeTJ02oG5+kFbN/cLV0cEsrEuvMF0klw4Vopc/QaINBSGbp93oYZoLJ7wBUQ9fD
	Wwc7su7/x+tC8FI7lOz5VLm0tIJiMpi/3j1ZWAzfzlfSyjMJA4v04JI0XGGjIH/okmwZiFphmpA6P
	D4IRPP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfJc-00000006I8h-0NnL;
	Tue, 01 Jul 2025 18:02:44 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcrZ-00000005sZZ-3rT2;
	Tue, 01 Jul 2025 15:25:39 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fafdd322d3so38215446d6.3;
        Tue, 01 Jul 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751383537; x=1751988337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=fzk1h6BCEI8LPPFqKo3vx5lm2kf5rIemtvaP9XjPa2TmeZL/nLgHrV7m9u+ovHgg8c
         6f3GKrmoto2AixJnEs10LK9h69pIvbhwdMFHxSPRZUmIFeeIsuF8pbASy3fcCS4Mc0Wn
         Ew5V7UJC4FsOMyHuL03U+JyoKsfspBgwdiYIo3byJk3c/HMWZrgNsWbRrOJB2nlL+cUu
         +zjQZ5OhAZN6sSwcGvt3FxsxGt5C7Rmn/r0nTSSJ3REpAkgo4YTpF2cYDQ7aFHrT4Qie
         l5jwBcsvbWTT6p7JXlkM0X0GISCABp1InEOzD9JwDcj0ycGp1fqcb1sx4tFo5fvRUzyP
         xVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383537; x=1751988337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=EcfwYkY5+tO0XG8kXqtdc076W1pJBdwaTE+r49tLvYqqCFIBsytd23MVmlRX5lGlZo
         jP5vDf9qtrlqde1NR7hcFZ8nEnMBEuUrLQYqUm0yU/o/nQq2TItx6/KMoHYSQo0ggTIq
         22RdbO11lCtxZpc5iQ9+COWBUOCTLqeWhPUWzGASCPcoHioC4rmILEcdQB3aCl06k2Ec
         Yi50DDnGLjZNTyclS3cjNd4DzUGhyRV+JZCp4Sb3bh1fWGpfXT3wf1sTaNgGbMgRwvbM
         66urYiJfGDy/f0JiHB1rZZbC07CF2FXOf3lGCyC5qOrZ8Rk7TIizux4gXQFVYHxDEEqe
         SSlg==
X-Forwarded-Encrypted: i=1; AJvYcCU9IfheQqaRDQuT6h123AVUsSQzKy94lpp3++L3yP8EOsjD/v3F0q+Z/pJcHt5zCXgu3F3IYSIo+DiFccN8xgY=@lists.infradead.org, AJvYcCUw2IEJpm54lBEJPFoGF29J30PBWJmMGLbuz48kB9WWlRug4oWxzejvcIyl9sc2Rbeo38nW5pl5DxsD@lists.infradead.org, AJvYcCWkuDQ09Z+43kyIqq21j3Sjs4PpoWWaSigFuiKzDaG+IQsXJu7ooPHFfuE+oaShy8YvvRxn3QyVbH29GVPu@lists.infradead.org, AJvYcCXMQXlA/V70u6GuxBcC/ipjnou/wkZdgDT9OkH4ENp2Xuc8K6mizY89CYuoxkh172syoHRFaq9ZvVKVzDewGyo=@lists.infradead.org, AJvYcCXMwFeClWt0e+ykAjh1Mdv5I296SJDiJtxdR8mCMN355NCVYa/qv7BbrODn4ABzK5rdtV+Sqmu8pop0noKfGRxdwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1CJMLRCUo9o1fo5Hu5dq1xHZnwYXKe85bzbId0sB58hyH29NT
	QR7wY+nGZfwCwWsQnhqgqj71jYyxh7ANqVASWjTz2LwueCL1Tdxs+wgz
X-Gm-Gg: ASbGncsv4hTuxCnUsZXINKXwzKb+L6xDUxpZCfB4PmVlZok5OlsqOE8IHSzE32utws0
	5dJj+xU7Aw6PC2oyzApAerH/JJOvtso+E3Ha04ITCxo4kvNYYBfpvo1AnN9p+ziLaXm/GVKCdDz
	rUVw9RplGM+0EtT0VUlZB1TGrtV+ypGCCiMtwqBVK5g+9qCUgqQ8GctO4AbFkqnox2cYpViehJy
	kuGiZHrk7A7100wf0NffZvSg+dVnzh2NceqtI+OsKW+fEzPIvg7i6ecR+UI/US7mJ1UI/EoAs0c
	qEHaNlFgFVThxGQsxO2Sn/YHKSnzMQyFgoUXIyMuKRHrlKSzov2aucS+A91U
X-Google-Smtp-Source: AGHT+IFGwV5rgzZNlThD3qZhxiETqJeu0UK36HZAls92ncvO2dh0OxLl48BruxfcxiFAUDT+MVUh3g==
X-Received: by 2002:a05:6214:d08:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-7000291854amr270803556d6.32.1751383536220;
        Tue, 01 Jul 2025 08:25:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:517d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm85521916d6.31.2025.07.01.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:25:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:25:12 -0300
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
Message-ID: <aGP92Aqcxt-x78nu@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_082537_963138_1CEF01A4 
X-CRM114-Status: GOOD (  15.51  )
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

On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Hi Waqar,

thank you for the patch. However I personally advise you to split the
patches per-file and remember to then precede each individual patch
subject with the proper subsystem and driver touched.

While this looks like a nit-pick, it really isn't, and my suggestion
will make reviewing much more easier and you'll get your Reviewed-by's
and Acked-by's much more smoothly.

The cover-letter should probably be preceded by "treewide" instead of
a specific subsystem.

Thank you,
Geraldo Nascimento

