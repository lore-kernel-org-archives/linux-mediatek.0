Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4204C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6ctC3BGiJkXY956ejA4Nxbcw2E656RqEiMyVTTwPOs=; b=Pkw4wBEfZQHv87gkInkd9hUivG
	2UdZ6DrEmCxxGLTqvt4VM9MbVmC5iVN3cMrtrxMx8XCBmAAESVwc6h8QCj9a9XT4RGul1gcwGm/c+
	CrnFmcayL63pIVV/ShrZhk5kZuiOwcbCgAEuZbzRGTMWHhISrHQBUj9I++/RiwhYjXep7giCyzJaA
	oyWk3/DaItpixjO4YrNAabxQXhrqcQh8C4QP27/red/nEi64S87ZfhP7/dMNoUUeGkvMoq1te3Zzw
	lmqZ1/cZ2VNJuAsST2YFVPn6P/iN1wl54iAVWwMobY5FWX8Rf8mDLWXrq1FwgYRGJXCr0BB/gZ2LZ
	6VQCS04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOow-00G96z-Os; Sat, 06 Aug 2022 18:46:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOot-00G94b-Gq; Sat, 06 Aug 2022 18:46:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B2961248;
	Sat,  6 Aug 2022 18:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71514C433D6;
	Sat,  6 Aug 2022 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659811601;
	bh=B/0w1udhvHD/9i0cSXbtONOW92202f2YhMQiT3LJId8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pFsBYtApmnG2eqrOLyURupaAFLXeLc7W/9MhUykPguHD+e2ft00vYjP4PgD7meTaL
	 aPiqJFS71t0cIyfkSjKk98zrKxyjz09pS447wpgFxKM6eWxbQk3PVjXmckPypt4Sfb
	 Lm30+HGsvQ3Z8zumo7J6GRstmybs7OtVuu+uLeKiYDXuzzCb9QynrGjKoCD5Y60u6J
	 Zd2cs38zj5zkuUAfwWbj8DgGekQr4BK6wercvB/3Om+mW3sBpol/kP2ySEzM+fgHeh
	 7NU/Gt2skLPY/Q3zl2jiIS2qg1r4JEz2ddRLnSlZKFPH9bPGC1ox2H1RL+vuQEmBOd
	 Lib5B34RgV13Q==
Date: Sat, 6 Aug 2022 19:56:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-iio@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-arm-msm@vger.kernel.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "Olivier Moysan" <olivier.moysan@foss.st.com>, Tali Perry
 <tali.perry1@gmail.com>, Thara Gopinath <thara.gopinath@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Patrick Venture <venture@google.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Benson Leung
 <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, Zhang Rui <rui.zhang@intel.com>, Linus
 Walleij <linus.walleij@linaro.org>, Christophe Branchereau
 <cbranchereau@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman
 <avifishman70@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, "Andy
 Shevchenko" <andy.shevchenko@gmail.com>, Guenter Roeck
 <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, Amit
 Kucheria <amitk@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, "Haibo Chen" <haibo.chen@nxp.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 00/15] make iio inkern interface firmware agnostic
Message-ID: <20220806195649.4aee65fc@jic23-huawei>
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_114643_672484_D6402382 
X-CRM114-Status: GOOD (  15.60  )
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

On Fri, 15 Jul 2022 14:28:48 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> First version of the series can be found here:
>=20
> https://lore.kernel.org/linux-iio/20220610084545.547700-1-nuno.sa@analog.=
com/
>=20
> Second version:
>=20
> https://lore.kernel.org/linux-iio/20220711123835.811358-1-nuno.sa@analog.=
com/
>=20
> v3 changes:
>=20
> [1/15]:
>   * Improved (spell fixes) commit message.
>=20
> [13/15]:
>   * Get back to u32 API for 'st,adc-diff-channels' but making it more cle=
ar
> what's going on;
>   * Fix infinite loop;
>   * Store number of st,min-sample-time-nsecs properties to avoid
> duplication in sanity checks.
>=20
> [15/15]
>   * Improved 'if' condition for readability.
>=20
> (hopefulyl did not forgot any tag)


Very nice work.  All applied, with a few minor tweaks as called out in
relevant patches.  Note I'll push this out as testing.  Will go out as togr=
eg
only after I can rebase on rc1 in a week or so time.

Thanks,

Jonathan

>=20
> Nuno S=C3=A1 (15):
>   iio: inkern: only release the device node when done with it
>   iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
>   iio: inkern: only return error codes in iio_channel_get_*() APIs
>   iio: inkern: split of_iio_channel_get_by_name()
>   iio: inkern: move to fwnode properties
>   thermal: qcom: qcom-spmi-adc-tm5: convert to IIO fwnode API
>   iio: adc: ingenic-adc: convert to IIO fwnode interface
>   iio: adc: ab8500-gpadc: convert to device properties
>   iio: adc: at91-sama5d2_adc: convert to device properties
>   iio: adc: qcom-pm8xxx-xoadc: convert to device properties
>   iio: adc: qcom-spmi-vadc: convert to device properties
>   iio: adc: qcom-spmi-adc5: convert to device properties
>   iio: adc: stm32-adc: convert to device properties
>   iio: inkern: remove OF dependencies
>   iio: inkern: fix coding style warnings
>=20
>  drivers/iio/adc/ab8500-gpadc.c           |  27 +--
>  drivers/iio/adc/at91-sama5d2_adc.c       |  30 +--
>  drivers/iio/adc/ingenic-adc.c            |   8 +-
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c      |  58 +++--
>  drivers/iio/adc/qcom-spmi-adc5.c         |  63 +++---
>  drivers/iio/adc/qcom-spmi-vadc.c         |  44 ++--
>  drivers/iio/adc/stm32-adc.c              | 125 ++++++-----
>  drivers/iio/inkern.c                     | 271 +++++++++++++----------
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |   3 +-
>  include/linux/iio/consumer.h             |  28 +--
>  include/linux/iio/iio.h                  |   8 +-
>  11 files changed, 350 insertions(+), 315 deletions(-)
>=20


