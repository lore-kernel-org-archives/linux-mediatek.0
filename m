Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E5606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pe3QObIP;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yNbP9gNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pfbacooIO8f3wisdaRiyyaGqgo+54PzHGy2pQaUsY+c=; b=Pe3QObIPXN8PjL
	7hN9np7Av9f5Xw8+O8k589h6yTplCg84418jhkjndSb9P0KJrMna8W4C6IDwbJjUNJlEJGAGavGWd
	oPZJBanNMwCil4V5K01A04ZTIhGjqlOA0UoGlQFjUkgYyrGW2jGPY0m1NlV8ORg0r4XI7fjfrZd3T
	RzBfZ1HCC839ttainVuMF3wxL9VHgyyTQTYvNsLszCkOftkhIaLLJiXaleF+sVVjk2Nn4LNkGMHcD
	7ava+Ct6ACxkOflZu2b3faXY1TFVUbzs+PJRRSE5I3BZu12aSeumU2MtX6NzWjnXUnlvbsGZa3uPB
	PgVpvywon3ZlQrcEx54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1IX-00000005ga8-0exG;
	Wed, 11 Nov 2026 05:55:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1IR-00000005gYy-3sDh;
	Wed, 11 Nov 2026 05:55:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7703DC79A8E;
	Wed, 11 Nov 2026 05:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A09616017E;
	Wed, 11 Nov 2026 05:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA75111BC0758;
	Wed, 11 Nov 2026 06:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794376491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pfbacooIO8f3wisdaRiyyaGqgo+54PzHGy2pQaUsY+c=;
	b=yNbP9gNqUTcBluDPTUGVBT9Sv+/GUwXc/OVvJz1InwCOkT3SDXmol6kIyZj6kX3Yq1NzGH
	m+7vDJygTh4Aeo6ekK8CD2u9W7d6Fobhkef2pBoshtjxbvwZhaFK264cj/tLT7fgNV6x78
	ZUPWtjg+/hKGnEpqW3ry2LwfenlL1Vnpfsx+Duk2T3/ZhtgEL63TIp90jEpCcqg3mwkQte
	XvhXHpQreSW8ZhjjAEgEfPu3744zKJ6yYUnEtxerbgkrN+nhLUAP2VnK8ZqLwE40Hqa9Gw
	2IyI3JXe2VizQhauO617rdUjCPI8djrehwuV7EPN2sl1qfiuh+n75Opl2PpZow==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 06:54:25 +0100
Message-Id: <DMS5DC411M21.387583J8N08R0@bootlin.com>
Cc: "Linus Walleij" <linusw@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Chen-Yu Tsai" <wens@kernel.org>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "James Ogletree"
 <jogletre@opensource.cirrus.com>, "Fred Treven" <fred.treven@cirrus.com>,
 "Ben Bright" <ben.bright@cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Support Opensource" <support.opensource@diasemi.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Tim Harvey"
 <tharvey@gateworks.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Saravanan Sekar" <sravanhome@gmail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Liviu
 Dudau" <liviu.dudau@arm.com>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Heiko
 Stuebner" <heiko@sntech.de>, <mfd@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <patches@opensource.cirrus.com>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Lee Jones" <lee@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
X-Mailer: aerc 0.22.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_215500_129793_98FF7B99 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 10, 2026 at 10:54 PM CET, Uwe Kleine-K=C3=B6nig (The Capable Hub=
) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # =
max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # max*

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

