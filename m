Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9256BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=; b=QjlJBfxXQmzHuzGVYB/2W71o5f
	Vpf5x11qCbwv0z8TjxDGJv2Dh+sVT0ptgJhefMOZC6s0avBEHBMfwOYndMUdCuijvSAeN9l43Fnjn
	dTjwiebuWYDImc8yFI99HztGxMunLpkkxYgBF86XiGMZ66mTaRFQEfmXW8lEr2QfLPK0wtcJwQX88
	DnIOODEaRVTs9RCdCRo9DVonyFlIyBty/oWgUhq3CMLB2gW+9n6+hL8ps0RknwaYwyOV/MBwUWo7z
	9hK/V1/UXxAHvNZgTx8qU9TxGNLQ+qqrp39m0cucAzdm6bWC7w8AszCxnYXv3AJy6lZ7apPFUbyEL
	CtS7Oy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MR0-00EzwK-C7; Thu, 07 Jul 2022 08:00:26 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8otz-002Ydr-2X; Tue, 05 Jul 2022 20:12:08 +0000
Received: by mail-qk1-x72f.google.com with SMTP id n10so9575256qkn.10;
        Tue, 05 Jul 2022 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=jzyDqqOsmOiFQpBNDEIIiq2MN35QtJrUD2/ujzSWycMbbCOOa/kXWzucbOzXvgJPlM
         l41OpTnwJFtVKAh9ESeTZGx5QRNGnFLf7Ve6XK/dYXbRSWYolxdZFruwb2QvUjtDqKp3
         XPq8C5Jcp4JG3opZdh2U+imHALhK3sBAHCCrGSqp8Vv6nsMRfMt39kYqHYOSFDIblB6A
         qByLsJ7MJ8hdI1n2d+9GcDpXsaJ8cJ751FUYmiFAN8pTN8GWtaPdCiQlJR4UCA74w7VK
         BYLuDVNV9YmL+YjlB3aU/m2FQ5afMCy9VI/vJGznIenuOAJI2wSPMGBH0t9pzT1ABtei
         oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=E8yn0Hz9QxF3ZgyZtCdQJpYAzHWHrBQIxhZ6ttHjc84nP7gycMQ4oHLP4EbzWpnXJ/
         hv09JXIFzCLZDkVL9eaOIu0oxzWAmNuTLLJQVVmbd6aKnxspVaau4B5Oj2VfgHeQDFoV
         lSypgvigq/jW1Dl5JJYD4PV4vxa3VaPaYe1wINItapFlLgA5V4uwta74Nsd3DxxhOd6a
         EPjH3mtmrS9neRO2BJwbTYVdPBneV/KDP5yS9PgFPiKTbyuh7RHF5whuXhLHztJvWKCb
         w6IPtdAlBW/SXoxIwT/A6kXYHMwI3LW5gKdU2Xj07b+60jbNnVFEAYl8JTAt6UgQJrFi
         EfZA==
X-Gm-Message-State: AJIora8bv5T6tnIilvcwgNMdIpIBgL0SEGUNsuwYNaACQBhLpCBqADXa
	AXDmf6ZGpq20rgJ9S8qdMzRlmko3/NFC
X-Google-Smtp-Source: AGRyM1v0OJ93Nu3s63zVNhYbXwTamj5LdNYK8gxlMvIKZ0kjVcSqwnmSr3p+XEHk7rqxFSougreCpA==
X-Received: by 2002:a05:620a:385:b0:6af:1f2b:9168 with SMTP id q5-20020a05620a038500b006af1f2b9168mr24692503qkm.170.1657051922136;
        Tue, 05 Jul 2022 13:12:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id r8-20020a05620a298800b006b4689e3425sm5643578qkp.129.2022.07.05.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:12:01 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:1895:1b49:2a68:29f7])
	by serve.minyard.net (Postfix) with ESMTPSA id B3B861800BD;
	Tue,  5 Jul 2022 20:11:57 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:11:56 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Luca Ceresoli <luca@lucaceresoli.net>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Phong LE <ple@baylibre.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Martin Donnelly <martin.donnelly@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Douglas Anderson <dianders@chromium.org>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jean Delvare <jdelvare@suse.com>,
	George Joseph <george.joseph@fairview5.com>,
	Juerg Haefliger <juergh@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Marc Hulsman <m.hulsman@tudelft.nl>,
	Rudolf Marek <r.marek@assembler.cz>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Dan Robertson <dan@dlrobertson.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Kevin Tsai <ktsai@capellamicro.com>, Crt Mori <cmo@melexis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nick Dyer <nick@shmanahar.org>, Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Jan-Simon Moeller <jansimon.moeller@gmx.de>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Colin Leroy <colin@colino.net>, Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>, Jasmin Jessich <jasmin@anw.at>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Olli Salonen <olli.salonen@iki.fi>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Shawn Tu <shawnx.tu@intel.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heungjun Kim <riverful.kim@samsung.com>,
	Ramesh Shanmugasundaram <rashanmu@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jimmy Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Petr Cvek <petrcvekcz@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mats Randgaard <matrandg@cisco.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Matt Ranostay <matt.ranostay@konsulko.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Robert Jones <rjones@gateworks.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Tony Lindgren <tony@atomide.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	George McCollister <george.mccollister@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mark Gross <markgross@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Maxime Ripard <maxime@cerno.tech>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Lucas Stach <l.stach@pengutronix.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Lyude Paul <lyude@redhat.com>, Xin Ji <xji@analogixsemi.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Angela Czubak <acz@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandru Ardelean <ardeleanalex@gmail.com>,
	Dmitry Rokosov <DDRokosov@sberdevices.ru>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Miaoqian Lin <linmq006@gmail.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Palmer <daniel@0x0f.com>, Haibo Chen <haibo.chen@nxp.com>,
	Cai Huoqing <cai.huoqing@linux.dev>, Marek Vasut <marex@denx.de>,
	Jose Cazarin <joseespiriki@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Nikita Travkin <nikita@trvn.ru>,
	Maslov Dmitry <maslovdmitry@seeed.cc>,
	Jiri Valek - 2N <valek@2n.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	CGEL ZTE <cgel.zte@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
	Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>,
	Kirill Shilimanov <kirill.shilimanov@huawei.com>,
	Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	Colin Ian King <colin.king@intel.com>, lijian <lijian@yulong.com>,
	Kees Cook <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonas Malaco <jonas@protocubo.io>,
	wengjianfeng <wengjianfeng@yulong.com>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>,
	Yizhuo <yzhai003@ucr.edu>, Martiros Shakhzadyan <vrzh@vrzh.net>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
	Sing-Han Chen <singhanc@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Stephen Kitt <steve@sk2.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Seven Lee <wtli@nuvoton.com>, Mac Chiang <mac.chiang@intel.com>,
	David Lin <CTLIN0@nuvoton.com>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
	Ricard Wanderlof <ricardw@axis.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Nicola Lunghi <nick83ola@gmail.com>, Adam Ford <aford173@gmail.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705201156.GL908082@minyard.net>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_131207_179079_4D0653F0 
X-CRM114-Status: GOOD (  12.51  )
X-Mailman-Approved-At: Thu, 07 Jul 2022 01:00:25 -0700
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
Reply-To: minyard@acm.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.

For IPMI portions below:

Acked-by: Corey Minyard <cninyard@mvista.com>

>  
>  static const struct i2c_device_id lcd2s_i2c_id[] = {
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index db40037eb347..a0e9e80d92ee 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -341,14 +341,12 @@ static int ipmb_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ipmb_remove(struct i2c_client *client)
> +static void ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmb_dev *ipmb_dev = i2c_get_clientdata(client);
>  
>  	i2c_slave_unregister(client);
>  	misc_deregister(&ipmb_dev->miscdev);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id ipmb_id[] = {
> diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
> index ab19b4b3317e..25c010c9ec25 100644
> --- a/drivers/char/ipmi/ipmi_ipmb.c
> +++ b/drivers/char/ipmi/ipmi_ipmb.c
> @@ -424,7 +424,7 @@ static void ipmi_ipmb_request_events(void *send_info)
>  	/* We don't fetch events here. */
>  }
>  
> -static int ipmi_ipmb_remove(struct i2c_client *client)
> +static void ipmi_ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmi_ipmb_dev *iidev = i2c_get_clientdata(client);
>  
> @@ -438,8 +438,6 @@ static int ipmi_ipmb_remove(struct i2c_client *client)
>  	ipmi_ipmb_stop_thread(iidev);
>  
>  	ipmi_unregister_smi(iidev->intf);
> -
> -	return 0;
>  }
>  
>  static int ipmi_ipmb_probe(struct i2c_client *client)
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index fc742ee9c046..13da021e7c6b 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1281,13 +1281,13 @@ static void shutdown_ssif(void *send_info)
>  	}
>  }
>  
> -static int ssif_remove(struct i2c_client *client)
> +static void ssif_remove(struct i2c_client *client)
>  {
>  	struct ssif_info *ssif_info = i2c_get_clientdata(client);
>  	struct ssif_addr_info *addr_info;
>  
>  	if (!ssif_info)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * After this point, we won't deliver anything asychronously
> @@ -1303,8 +1303,6 @@ static int ssif_remove(struct i2c_client *client)
>  	}
>  
>  	kfree(ssif_info);
> -
> -	return 0;
>  }
>  
>  static int read_response(struct i2c_client *client, unsigned char *resp)

