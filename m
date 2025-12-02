Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AF8CFD376
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gutkuk21iRBLBzb9hvOl6cUp6HFUU/VZ7OrEhTRZmwQ=; b=QVbKpwgiJOCQf4/J1Oy6resQmw
	kuyxQVpSjwbl9A5NorlflTRRNgX+JwMUZCzFwQmebHE/iSx5Ty96IHDUDinIxNrLABbt8V6r6Xkwd
	T2ir35WHj9AaL9Lo2BwiqLrVitGSv1783urvWyjuWGcvqob+dj0viZjbMhoLmFKJjD3tq0ljAOTAW
	fYN9C3Ym37M8ycHJuDYjatMtXMWb6ewHSm+FgnPb9scSZUWK4uFSQe0mmz3C67JIPY+Kr9AxBpY1B
	pXA1lwOLWMSac98jq0HTl9bxA2Oihl9LO4XnResWMAdPEpMrfHPJfe7WuMRgQL2215CiGgNw/404B
	kXQ2owxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKr7-00000004xN9-46OZ;
	Tue, 02 Dec 2025 07:31:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKr4-00000004xMg-2Ph1;
	Tue, 02 Dec 2025 07:31:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8899EC17B6B;
	Tue,  2 Dec 2025 07:30:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0F3E606D3;
	Tue,  2 Dec 2025 07:31:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 403D9103C8F04;
	Tue,  2 Dec 2025 08:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764660676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gutkuk21iRBLBzb9hvOl6cUp6HFUU/VZ7OrEhTRZmwQ=;
	b=bY3TTYiSLFXa5B94KQgeAayt80JXK78ig76Aq2SyfufNuWcT41c/auFS4kPqbVeYIZlJKX
	QrXrN/qRIP4zNsj2m/7od8XOWVPza9ZQvvaa8nia4r3ByMuNdtTuF/t2v7gxBFCMMsW9RB
	i0p/8OBYWY3+n3FRUeyswfCRhz6Fv2at184ftP1FUUlpPAnLeFkqXVNSm5O6zbN24Wre4+
	N8LDjO5ty4mD4BpDEbuBV6eat2hrRdfThqf+Hnymm7a9OslgagnMsXhZ11fV4HVQz7RWeL
	AMcHDMFpAB93S2dU0dURDWQPs1MVtcc1ZnrYa/w6k4129RIITI9OMaZRIN58Wg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Lechner <dlechner@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Date: Tue, 02 Dec 2025 08:30:58 +0100
Message-ID: <5948030.DvuYhMxLoT@fw-rgant>
In-Reply-To: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
 <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6220005.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_233122_820149_A82E4693 
X-CRM114-Status: GOOD (  15.91  )
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

--nextPart6220005.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Date: Tue, 02 Dec 2025 08:30:58 +0100
Message-ID: <5948030.DvuYhMxLoT@fw-rgant>
In-Reply-To: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
MIME-Version: 1.0

On Monday, 1 December 2025 18:15:54 CET David Lechner wrote:
> On 12/1/25 4:59 AM, Romain Gantois wrote:
> > Use namespaced exports for IIO consumer API functions.
> > 
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> > ---
> 
> ...
> 
> > diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> > index a8198ba4f98a..33d6692f46fe 100644
> > --- a/drivers/iio/dac/ds4424.c
> > +++ b/drivers/iio/dac/ds4424.c
> > @@ -14,7 +14,6 @@
> > 
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/driver.h>
> >  #include <linux/iio/machine.h>
> > 
> > -#include <linux/iio/consumer.h>
> 
> Unrelated change?

Indeed, I'll leave that out in v2.

> >  #define DS4422_MAX_DAC_CHANNELS		2
> >  #define DS4424_MAX_DAC_CHANNELS		4
> > 
> > @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose
> > <ismail.kose@maximintegrated.com>");> 
> >  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
> >  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
> >  MODULE_LICENSE("GPL v2");
> > 
> > +MODULE_IMPORT_NS("IIO_CONSUMER");
> 
> Is this actually needed if we don't use anything from consumer.h?

No, it's not.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart6220005.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkulbIACgkQKCYAIARz
eA6r+A//aMF01GyQ28Vt1qVRnR+uQNAhVi/B2aUu4XYyy1hc2lVzhHwvSjyYiXET
h1jorSaLD9m5MsoTo9Scxhpu1d5KWIy5DaNATac1wmHh9t0IdE8gw1kNaUcNmefr
NFOanFttvVt7e9cko6PsxmX9GOioawS3CVrJuObkGGftqR3KVD3WMOg+n551pkK4
63Xbfe6PPADF06Lyu2kyyxUXLwIsuXQ8Z4dQ+kX4Bky34L0v4w0Yxos4Uhkwv5ur
SOUtezyExAQTgAJi9KW5MPADpCdXfB3moTv29CdWRs1K8XLkxxLeprZnutXRFxOu
CrmiA30lNs2pp7wut+8PfmeYX6btqOCMQ8KENXNV9StrRc9UqD6K6TbbJGE/Vbzg
gxDVp9t0i0nxcQAwhtvnlmAjf3pxeJWXf1iII5ooXoxv2yW1G+FsL9RBztyEnTA1
0iLFg1Yyx/28b7iZsf6oD5luqSRnQ7Qi0js5sAA3rVHfMtOlO/rGcUH1BprrpLPa
m5jycApgp26OuCSxacOhlAZ6iXy1pyepTaDlS9wz1kbdwVJOf3IaWuRhDHrRugCd
zya/579XFCsbobzejkSRHzgwylhuGsDMAniIn0MaeQw3E5wyBTCVJTXx9qebFj3v
sUVcLNhFQBy/G8YWighvreSaPr43mWS4ueBmAMClqYmOzq2nF2k=
=n+bE
-----END PGP SIGNATURE-----

--nextPart6220005.lOV4Wx5bFT--




