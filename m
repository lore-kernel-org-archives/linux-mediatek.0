Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59191C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=; b=qhbWHFtK7z9gw9c4mWsRXmNMPW
	AJcr6sq9CLJCpBF9aG9ZzIhqxvpzqhCPRpyCY8xhL7WlqAilq1NuhwQDSoYIyiF+mH30GRR07hxDe
	af8LL1rr6np+ThP+zW2DL+9q2PPPQoLIQPbweRDiSfcpGm4D0pZiPGkM3KaO89kf+Gub2r82w6u8K
	1wvu2UOug1ll5ngzffX1tyfqUicCCAIYg3mmkMSdnwuJJWYtQh5UuDnlpGt/m8ryScBrTYqXEjFi8
	c96SdzR6Oj/tKEiCcruM8kMlQx5LL1tNVeAAL3SkhVIs+86EnAbyVcPwrP9kUWZ9d7HfDfZN+860F
	LzWmV2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqt-0000000H9ga-1Rvk;
	Wed, 08 Jul 2026 12:58:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqq-0000000H9f4-37yw
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 12:58:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15b1da6b82so71113266b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515487; x=1784120287; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=lAY1sUOuJqClr5wVNIZxcahi18Se0Wsv26mZ5/BwrKvr59hK5lW3uFkHbm2b7Qkgzr
         lip4RbAtvQn6rjWQDzjBTgf51ri6EUNV7oowkgyc1PH/hfhhNR2wiX0PBnPfLVraUgIq
         5Jpf25JwaQLSmPDEI6nZc8VXqf4TeeobgIWmOYkT1iWlQ1EtmQOlppl2BGUiOfdD5JGB
         tjggMY1tONhNwAMagak74VT3FggIb60ihBU0r7s6Wo06LRg9ddUquLOvy30AuhIwW6XD
         U3Pz0rC8Vq1L9fYtska/mdgLmhhKy1TOtPCdqrk7/mKOTcAA61+By0wHepUwzkTvPkjQ
         sW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515487; x=1784120287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
        b=UZR4HSvZHpx24DEwMMFA7DbyW5aXao7gVnGkgmhiTdLk1JhVxaAYR78S7HXW0SoWjl
         tZEk5VPuwHmF+JpIKsvz7JjDzQK1CQLMJZ/uL/yXOK3s/SNo+RgZ6b+QL+EhH/i76xxw
         NOwXVXZ7/4SGDsdgMCt+Qp/LopzXRG2qNg43na7bFKxWpPw3zY2/Gis//7u6htJ7Q/cU
         C3+gMAJcft1rxDmTLZpNiyFl/xKexd8ROBbSnKY+ODBGetmMA622TIDnhkWd4qDr+bMX
         NxLpLy8RLXp5CbzewUEY16X7rwwsX9haWyQB6Kp6ajiE6eaXrIYRAPcArPCGI0okeB6H
         HPQw==
X-Forwarded-Encrypted: i=1; AHgh+Rowghu4mxM1FGuh1nTvU9VT1FBhYZiCjElIJi6blvvjuF3GY4IhJE0h00D910JWAs51kBt0M0b6/qKoLbkw8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6+E9DKIEY26j8O7zsKECl57QTACZWHJDIMR0TTv5zoFNugmEs
	TeU1O0NbYibIO/4uZOKa0DI7x9q5ZX6D2qXg8mwgfWEf8QgWXTdX8kFbmzTd0x6YC2E=
X-Gm-Gg: AfdE7cmPlWYCnhmOCWhvu5Aw6ik6fVoVllmfkfdPRAeaW7qOoX45ZkTQvK32lRBDxHf
	pqhd3VVP8HbATNwmpWmqZzY2dtBwWALrYEgsLRojeGtEIDnnFuaJznw+tjQOlChbCIBxlmkPcff
	L120BCmUupBqGIGic9zfLUnx7dRJPxOpgB1p67xRMiAP90DQ+naP3JWupeV8DyE0WH1HxAyanjt
	paVxybRnt4agyYwOpohuQpfBI5hn1lW9pAwBYRb2TNscPcbTCXSPOGZlG8oA3qOKqmpfDzACBp7
	mjUR4lelEzCHiv6PEHZZi7Yl2YGAuuJV5qHcyu3tvf2g6+fo2fjVNbzimkJ2mjF6cmP+9FjeVe6
	6icFT889Q3BpiXZPfk+65ezjX7kjbsLqXiImQVVeEBiVn341B4Sx2rJ/9L5C2Q3GtsVLRUlHcdd
	uuIEpCSvr6A5JRn0dI0cE=
X-Received: by 2002:a17:907:7211:b0:c12:4597:601f with SMTP id a640c23a62f3a-c15ce131902mr120160066b.53.1783515486648;
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84c636sm324005266b.22.2026.07.08.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Message-ID: <eed86cadd335597d7c7a4278a9a09706913ba6a3.camel@linaro.org>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>, Florian
 Fainelli	 <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list	 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald	 <rf@opensource.cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>,  Krzysztof Kozlowski	 <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>,  Sven Peter <sven@kernel.org>, Janne
 Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli	 <luca.ceresoli@bootlin.com>, Saravanan Sekar
 <sravanhome@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Matti
 Vaittinen	 <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang	 <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm	 <magnus.damm@gmail.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, 	linux-rpi-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, 	linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, 	linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
Date: Wed, 08 Jul 2026 13:58:20 +0100
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_055808_826051_B1399311 
X-CRM114-Status: UNSURE (   9.65  )
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

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
> =C2=A0- no comma after the list terminator;
> =C2=A0- a comma after an initializer if (and only if) the closing } is no=
t
> =C2=A0=C2=A0 directly following;
> =C2=A0- no explicit zeros in the list terminator;
> =C2=A0- a space after an opening { and before a closing }, a single space=
 in
> =C2=A0=C2=A0 the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759

