Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED12AC77B61
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcdhZzelGiLWVRkQSPYVU84yN6BDoaInWPYe2mWzyWI=; b=N0yQ/xPo3epNICV8off+YfeYHM
	oWouuqXOiYiU0G/MMWg8QQcYLKoypaP0Ww3hpFTMY9VJKacfgxAT6PWvVNKo4jUbYJCAIjnu8Vc3w
	Mnt4k/t4j4inzg2gi87WuVqmAi09am2kZ7warU0PpoPK9nR4owUrQbN0Bp2iACiBkA2YN+BcZ4AYI
	ofx10il81+JgzJ2LUsgqmXndVTHTQuxw1fkjtUzD6NJsIT8mKWmDhl3BsUtZ3Leh1qBir4CGe5Zhg
	EhOnKyYqp/F0QMjE2BtPrfwjtiXA5u5o7Xf6qIZGtr1uCXBIR+egjPdYjPzVxXnmtM5ygdkI0xC9m
	zlwu2Bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po9fq-00ERNR-0x;
	Sun, 16 Apr 2023 21:12:38 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po9fk-00ERM0-2w
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Apr 2023 21:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=PcdhZzelGiLWVRkQSPYVU84yN6BD
	oaInWPYe2mWzyWI=; b=0vlvYnXM0yc2UOV09gFwoU0Plkbv9q8QVtBV91C/Xct+
	nQaNG2FpJ5ue/IGfl/+vqlk/skwVcvLJ/OiMlAMchiTrl0GtHOLktk8sjvMT1ycY
	6D3x7GP9CzLuMSAWyzexEUQPLk1ptIFAEipKhWYtxMOtuO22My5NQaelxoDf/TM=
Received: (qmail 2639833 invoked from network); 16 Apr 2023 23:12:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2023 23:12:19 +0200
X-UD-Smtp-Session: l3s3148p1@dHlEh3r5xr4gAQnoAEhOALUKm+CIhvWF
Date: Sun, 16 Apr 2023 23:12:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Message-ID: <ZDxkrVOhrEMg0oWh@sai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8XwfRVUNrqARVTo"
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_141233_838939_2BE8FE51 
X-CRM114-Status: UNSURE (   8.90  )
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


--+8XwfRVUNrqARVTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2023 at 11:51:08AM +0200, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for Renesas =
WDT


--+8XwfRVUNrqARVTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ8ZKIACgkQFA3kzBSg
KbYctA//WZaNN4qBA3XDpxqd0lCrFYt2SAthM8gh8vN6cczN1b9Nak3ux3+Boc1k
TKtCJ81t8g4Gg65bxDolozTwVxdZ3qsHXLOtRJrlLwn4SQjNtyjQPxt+FSYxe/AJ
gDf8hNvHEHfeKRFI4boNK2fzxDkjE9R8RMrZnh63OnGtcCNQvEp6MkZimwStVVlX
TwYmE7rf6r8dbq7n3yDuWZFJB+eXi1ld0LNJrsROMMc5m88KNRHWi4r9Dxjg+UfK
VjpH5kYQFUtnFrd9Q8kcPdV/r9L9sVW3jdZJG5KB5xMPfZk4sX8wpXf28gqyOrW0
ENNFH8YV1rbQxZ8c6wszQs5+HJDbJmAetk9rJ32K98sTissdzrVZxm3hM8jSbO63
3oD8Gsy5wFifbAKlMukOSCavhnsbHQEUs0QLkBDOnOBCRGItoabDJLAT3TsLMyKq
ln8lCA9vu9InZ0UCtC0RJKpkFHxXorcEGZ3mu7xPeT7eUW9Qj6hsJ3nhvfgD9Tsd
jOFUoL9NSbGmTvFfM3wQDG1e9kFKvVZ01wN/8GRDEkKlOxP5O3oCvUW4VSa1Rq6u
fXpV0eFgzt0452QFbx0/Q5RU9+N25EOGcM3zZXzc7SHs2/yvNnCWvmB/RY9o6wxB
2YGS7nThdzLseBhIGuQPyyrmhwtJImDqa8043vnHIxUJ4RiG4i4=
=fYC2
-----END PGP SIGNATURE-----

--+8XwfRVUNrqARVTo--

