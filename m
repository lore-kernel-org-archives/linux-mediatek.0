Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3ACC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw4GODQj3jZvzfxA96RDTVnG/u2FtfyTnELn/K5PXeE=; b=TKbQEqCsewePvDArbsDcVeFa31
	/JhseSW9zkO3v56Xy27TwKqktKjlMQRLsO8EPIf46UZwlah7CEztrN8xuilnEvH8nkhSJPPQkpzgA
	ddBwgMyrCkPNyCZ3bC3HlTUHZJbnUnDH0I9rozfmuFa121FlGx/1FW3S5iu4+oTghD2uCIyOUAFpw
	c2Ngncewm/vA8GIwlYr09qV74fwhFIlji/meNJJONW6ryOz20D9VFu0tOCSdx+Ei/bgCMlg8mBpbF
	cAwAJx1un7MRvGeqkFPuEZpF85iu3/wxmOVuUjgOXkwNltdyazeUEQTr+AvPji3MeMGSml19ekZWP
	Dd1BHsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0kNO-007rz7-UO; Thu, 01 Dec 2022 14:17:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0kNK-007rxH-Eu; Thu, 01 Dec 2022 14:17:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BED1D6E;
	Thu,  1 Dec 2022 06:17:23 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0F8B3F73D;
	Thu,  1 Dec 2022 06:17:09 -0800 (PST)
Date: Thu, 1 Dec 2022 14:17:07 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner
 <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Conor Dooley
 <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Fabio Estevam <festevam@gmail.com>,
 linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org, Jerome Brunet
 <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, Florian Fainelli
 <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Sean Anderson
 <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh
 <hammerh0314@gmail.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai
 <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team
 <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Scott Branden
 <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an
 error code
Message-ID: <20221201141707.28af0d1d@donnerap.cambridge.arm.com>
In-Reply-To: <20221201131604.beq4l22d42tjy6dm@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
	<20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
	<20221201102252.52ace284@donnerap.cambridge.arm.com>
	<20221201131604.beq4l22d42tjy6dm@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_061718_612865_8F54E3AB 
X-CRM114-Status: GOOD (  16.73  )
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

On Thu, 1 Dec 2022 14:16:04 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

Hi Uwe,

> Hello Andre,
>=20
> On Thu, Dec 01, 2022 at 10:22:52AM +0000, Andre Przywara wrote:
> > Just one comment: I don't see a sunxi specific patch later in the serie=
s,
> > though it seems we have at least one error error exit (see prescaler =
=3D=3D 0
> > above). Plus potentially another exit if clk_get_rate() (at the very
> > beginning) fails.
> > Shall I send a patch for that? =20
>=20
> That would we very welcome. I mentioned that shortly in the cover
> letter, I wasn't entirely sure how to handle that prescaler =3D 0 case.

Ah right, sorry, I missed that.
So the Allwinner manual somehow marks those prescaler encodings as reserved
or invalid (it's just a "/" in there), and we never set those values in the
driver (there is an explicit check). So it could only be a leftover from
firmware/bootloader, or someone poking at this register behind our back.
I am tempted to just return some -EINVAL. As the current code stands, we
don't manipulate any state flags before that check, so it doesn't
really matter, but would be best practise, at least.

Cheers,
Andre

