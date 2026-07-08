Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC6AC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9nVNcWATvF7bPIfSPONAnAMk/bnxNc604c/IURuo4I=; b=Nx5b5Wb8XvPkMkNMHG6+keEcmt
	x5u0x2xR/EjTLavMFEK1kgh49O2TI+B+q0/DkVcr1aJ/e3wiHb8yYuHsruflVrC3U/aurvkATMzRZ
	B1rqj7oga18hKdPiwsm3ZtqTa2sFjwrnIJW0I2EwAd47sZ+FT1XDHFU7CVGgtPBqHYFJuPdLb6ZVm
	96hvIaRCWn24+3nUNeAdHbVKWaMxj//YZNc0QMyLN9k6GP2jyuDoBvAWLdjT4frm516QFHVmYstPL
	iOslmLs2UdkEOpOtEdPYS2oi1uI8nTlluxRo0NiUr5j/kbUE6n/C1/y6isVOot9Tb+FHaycMSdbDi
	TNtqkMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQYM-0000000H1ZW-0GcF;
	Wed, 08 Jul 2026 11:34:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQYI-0000000H1YI-2gNk;
	Wed, 08 Jul 2026 11:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783510495; x=1815046495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AGYgMg5Ug10S/wSIeCwDKP9iDkCMyr/A63ihhHSiwRU=;
  b=AURyBC6Uny989jMHmAA530jkFGpmhNbyxMe79G0Pj6pmEvQaaKIDQPNX
   tbwg/5W8bgP0Qb73s3pW/Q3NThvCSwPETLoozpzHtJEfYp0XcKUqSIPPJ
   fLTMzB52qUo6wl17yRQOqoxg36GU+HZqmml0+76/ZzwL69ljVy07nDcr6
   nbxq3QpNWJwdk3Fjm4Vqt+jU/lyYOcrLuFzGrfV8M/0KKsgadxxUv0Bdr
   SvK3wbThHXiiyi1PwxLxctJfwhRxbbwb7R3MUhGSjsWDv3tPluk8WBHRU
   wMwPrhJKEsHgLAfns58gMhddplWPqGR2o3Xnc/t+w3EKKKBQ8o5jyoelK
   Q==;
X-CSE-ConnectionGUID: hjQVavw0Sb6GOe4yP1rV7w==
X-CSE-MsgGUID: o6t814jITdqydyS4FbMc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="109714180"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="109714180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:34:53 -0700
X-CSE-ConnectionGUID: 9piD6cfVSWie6SfgMzvaFQ==
X-CSE-MsgGUID: Nlf/R1UvSVO9P8OFz8tYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278642571"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:34:35 -0700
Date: Wed, 8 Jul 2026 14:34:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>, linux-crypto@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Colin Foster <colin.foster@in-advantage.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Andreas Werner <andreas.werner@men.de>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>, linux@ew.tq-group.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Saravanan Sekar <sravanhome@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH v2 00/23] mfd: Use named initializers for arrays of
 *_device_data
Message-ID: <ak41yQp3x78s4Fmx@ashevche-desk.local>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043454_712021_30C9DF8E 
X-CRM114-Status: GOOD (  19.80  )
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

On Wed, Jul 08, 2026 at 01:15:07PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> this series superseeds my previous patch "[PATCH v1] mfd: Use named
> initializers for arrays of i2c_device_data"
> (https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@baylibre.com)
> that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
> Initialize spi_device_id arrays using member names"
> (https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@baylibre.com).
> 
> The objective for this series is to prepare mfd for changing
> of_device_id etc to make driver_data a union, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> for the idea behind it.
> 
> This series is based on yesterday's next/master and it does the
> restructuring not only for i2c and spi (as the two series mentioned
> above), but for all *_device_id structures that I intend to modify with
> a union that affect mfd. So (I hope) this is the only patch series
> affecting mfd for this quest.
> 
> I don't care much about the last few patches unifying the coding style.
> I think it's a good opportunity to do that, but if you don't like them,
> just don't apply these.

The patches bring inconsistency (or still leave it) with the terminator style
in both I²C and ACPI ID tables. Can you revisit that?

-- 
With Best Regards,
Andy Shevchenko



