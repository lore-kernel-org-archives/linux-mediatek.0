Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15BC48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 10:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aB7AIqUQI98KNHzoy9W0cNWNVIjBskg1cCz+kipFny8=; b=Yu/oyQ6Hehf9r27ibyGWHngi2X
	P9UeuatnHv/fa13aRY+388sv1+4QWY7H7NWnZZIPYD/aIisxHvyaZDw2UUyqRSWKwpv2iyoJ/gm0I
	Ct5gO7Ga3Fz/AeAIe+cJup/uh8dkYeweOKZdYZuEDKVpf6Cky+dci32hZKIaqsJ2GPSqo99rrrNNg
	V+LPBE6ugufpFe3EofpmP3aEOihPftg4iFohNIu4ODzRjRTvcV/7gJ/1rdf2XSGCMjNdmvA7K7SS4
	o1B8MMbJovEH9wAxh0ravZJ02D+EncOmJQVhioAoBVZxene2wVw9+08uYOy79tsreu5iwm9aVJEmS
	xSbwE6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCfv-0000000CYLV-3alK;
	Wed, 14 Feb 2024 10:39:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCfs-0000000CYKT-1u4e;
	Wed, 14 Feb 2024 10:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E2BF618CD;
	Wed, 14 Feb 2024 10:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD63EC433C7;
	Wed, 14 Feb 2024 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707907171;
	bh=ve+usHpPiLeGFo9qGaUdJEB8rWWmsI433I+8nLrtPWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMG2JxTY5r0JtemuhnLGxIkBv2vs9oCD8JbPETLCQD3yg2qQ4VKFDBUVSU7yIge4J
	 4MrcD29ANaG2BIMVo3oS8op8fUmcTulSdxbxdcVYhZbgkqyOak9zrqsfNKhV+krgza
	 xLBeJ68UbUTpFQO+ditMDCSTVbcpZujlhg7+2k6g=
Date: Wed, 14 Feb 2024 11:39:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v6 001/164] pwm: Provide an inline function to get the
 parent device of a given chip
Message-ID: <2024021414-sedan-banking-f6b5@gregkh>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <cc30090d2f9762bed9854a55612144bccc910781.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc30090d2f9762bed9854a55612144bccc910781.1707900770.git.u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_023932_557077_F8F8AE41 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Feb 14, 2024 at 10:30:48AM +0100, Uwe Kleine-König wrote:
> Currently a pwm_chip stores in its struct device *dev member a pointer
> to the parent device. Preparing a change that embeds a full struct
> device in struct pwm_chip, this accessor function should be used in all
> drivers directly accessing chip->dev now. This way struct pwm_chip and
> this new function can be changed without having to touch all drivers in
> the same change set.
> 
> Make use of this function in the framework's core sources.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

