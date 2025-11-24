Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F7CCFA466
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vNsLCBeDp0qTj47JoR93GstfPbGa8Y6IYdp85BG3Y8=; b=EYZsJbZG6tSWIDMm69JAIAFjpv
	lATKv/4SR2px8XhbRT7nOSFAgnh/Ct/FDCGf+adtLj4ijnBkTKY7Ze2DlZkEfhsXMs3coafIjHXIx
	zZ68K0A4MJlfrRvBcSj8IIi3ehoFbBYs8YQTQFN+txgCuswXpujEErue8psllY4Cb/J+Gaav1TnUK
	mjHkJS75Egx6v4zsZvyq0BkEwOrPfOnzAyW/T7bQzgGnokMHiGXKhfYMTos4oswhgnjxN/s98SYvz
	l4as75aL8XAw5rLQEHiwFcwT1EGMOCnoZuPp3uunBc3jk/bjtKIHFGBnLZMi6pXOn+hkuFqdOoy3K
	zDR6Liqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYAU-0000000BtD2-3jMc;
	Mon, 24 Nov 2025 15:07:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYAR-0000000BtC4-21In;
	Mon, 24 Nov 2025 15:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763996872; x=1795532872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z56v9C0Rg97jOdx0MwIq/SrG80i12igOo1dqKgEs9Ik=;
  b=F9wAyIBLnhr4in67jjQRzpnplOacaZxsY3Aus2C43yHBexEXkt9QQK3h
   /HLUZ6EQ/iMnOPzLi1BTF0v0hwXXwFeWHeyxVmCeUoExrSDuLG08APRVF
   3AfTDglOX5G6C9Of/uL8EyAzS0ZAhXCZpZcfwxqkEm/3CoouS9xb61TmE
   l6yJ2P/n5i4n1CILVXme3waBiMfRAbF9CVxH+6lrEMfsHB7xtpuTS2ee5
   H1EtgHYwGd/ncJKiVnBg6jbO2U9BMNFVj3iiRe0EXVmtL77DSKytk6loY
   +CgUQbyYqJysRi7rIg+GfpiKhd9lkmN5pp5N7IxI2hNnALGBbQIWCdYYt
   Q==;
X-CSE-ConnectionGUID: QK9ThwmCTqOD49yQVfAzlA==
X-CSE-MsgGUID: mgb11TCyRamysXKnAWgx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88647369"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="88647369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:07:49 -0800
X-CSE-ConnectionGUID: P/h9s0EiQjK4ZI/Rp7ebrQ==
X-CSE-MsgGUID: gvu9jDc3QauPN63N7QPpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192595689"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:07:35 -0800
Date: Mon, 24 Nov 2025 17:07:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Rosin <peda@axentia.se>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Iskren Chernev <me@iskren.info>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Dixit Parmar <dixitparmar19@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 0/6] Add support for the LTM8054 voltage regulator
Message-ID: <aSR0tcV0ULNYvf7t@smile.fi.intel.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_070751_596667_886CD8FA 
X-CRM114-Status: GOOD (  17.61  )
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

On Mon, Nov 24, 2025 at 06:57:41AM -0800, Guenter Roeck wrote:
> On 11/24/25 06:48, Romain Gantois wrote:
> > 
> > This is version four of my series which adds initial support of the Linear
> > Technology LTM8054 voltage regulator. The driver supports a fixed voltage
> > and a tunable output current limit using a DAC-controlled pin.
> > 
> > I'd say that the most unusual part of this series is the usage of the IIO
> > consumer API in a regulator driver. I think this makes sense here, since
> > the regulator driver has to access a DAC to read/set the output current
> > limit.
> 
> I don't think that is a valid reason. Literally every driver measuring voltages
> or current uses a DAC to do it. How else would one convert an analog value
> into a digital value ?

While I'm not objecting your vision on this, the ADC is also possible to use to
"measure" the analog signal. DAC approach IIRC considered cheaper solution, but
require an analogue comparator.

-- 
With Best Regards,
Andy Shevchenko



