Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF3AC44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=; b=PD59hSipcLCHXmm2y//X4sJeJd
	RyC13lyUiUassHIGP7WkSSRLqo1BQM1EgP9iLHABxCx9wGOG2lSBdX3pXz789kO1HBA12NIuiYj+E
	yQsDgmMuYnLB95VB80SejlEms/xYQxCaCCHyc4UVwFgBp6XDtrptTaSZmRSGfKTb1a6H2mWA/KzkP
	r4OkLPVZRzouxvMC9sptvYLGMMPljaoeBej714NPlv91x/Yc8u9A1Cn99Ln43okDA0wZ6yLfYVF8Z
	eriFBRiyhvqvcRg+LShZhxspYvot670K+23XcH7W+jhpZrKuf6CCOPgdilHnHSDF3/QbfNwcm3lxI
	yZm1dn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGk-0000000Gyb6-2LLT;
	Wed, 08 Jul 2026 11:16:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGd-0000000GyV9-0sUK
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c19bad03so5028915e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509396; x=1784114196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
        b=HdkFmboLZDcQifexkvrvlQR/hpHBEL48iFtTkM51LItHcx/k7CFWEfSMEHMnTtks9+
         PpGH6C8n5znbJ88tTG2/dimi2tzLCWbjLoxi4RLfTvkN8I76BqUhvnufbmUCiQ17n7pz
         fnwEDkNUWFbYwiGqRfxXq0MOYZhzLOjVaXDtVLTIsNL41pJrAUrofJw1E2ogp9ph2j/2
         TmFLRoexdrvBdMpBVMtMg08s0HP+4vuxk/qeDG/U+ShDe92LZYUUTet7KwyzEPrKi59f
         01Pt2UABvjiil0ETVMCUnWGVMBbKLwbbVvtYYM7fGa8bOjfmSu1dNL/YZK6MWkYG51SM
         HvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509396; x=1784114196;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
        b=Ng4uJfGDe+u0ex2S4Sn6w0P9Da6aJ4kZJVrHB11xkFb7o8SYTulD9FCzZuKtdyVxwI
         vymr9AgT8IG+cEUO+rgN3mG8bhwRPfKQ53TZDF6B6Ocgc4rJW+LQ1MkeykigcYQ7UY/I
         yeziV5E566aXX7E9UVm3uh84QpqfYlaZt0CQXm0142GMMm0CcrygcYjcn2IzdsWUJK8i
         xpJVTD5Aqo66qYVVDCLmGMC8v93fHS/mSTZYpinByWQDk5ttZckWbGrFOqiSJja/Ryq9
         YNu1V7sQ0k8zFEn2IbrxlGLzj3HXvgPuKjHN/FDLz5tRuO4TgNtW2m2qHkexYVbFDKhh
         Qntw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn7hBxMqj2//xsYVLctRhxyFIgVojZqmhsYGCo3E1cLKKXtdX5GKwj+km/CmYhnUDYd0glau7bjMu998W7ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPwG419CpCMCezSNyEdJ9YltzgaJbrFPWx2KyLjfQzMQZZI6ei
	wBV+YVCxXPV7G3pNW5NaToUwazftVmKzQBzyHQUUjyM54NNN1odCZgI+DrIpAGzhoBk=
X-Gm-Gg: AfdE7ckUpsUsEMT49GlcxOPYZCZWq4seL6R/Al8VVP4+lI8sQ93oAo9SybygXaxPtP/
	36vgqVaSLIIzS8hh5Nqt6zTUMQmmkmiwCnvB3GpF3P6jNCgtVJD3TzYVFe8Jcq2OcZmXHEwHEpc
	6OpeVh96khzJplOcFz2pBvs1kFZwVNQxxubW/wpCsdJvOkg7xSa8yEt0VQ3I4N0VFgdlarEkizE
	ca2hCJkycb1dpxBuKVvFXLLJX1aN0L2VGrOSriW7BGXgUkVkdUIZ9SXmzjWvKxlPmsvjCh6b5l2
	ccqk8ZMA3lapF3I6mlPrEqW+OA4ClsSHZN05gkdim5+mjU1E46j4rexRwQMcnPBaILtdA6GV4L5
	mDfVh+FFf3yEE2gN9EEt+DWZVBNafZYGLS/tvpT+KFiSjsI3W/8s5YzEWkQAyHGCL0WRtFXhQG7
	VjAwLKG5vnDbQK2AbeEykymhsmzkOM9M+/qT0sQ1m/kyt07coli5gYMgkEWHeTffzMdmMiGRfMt
	Gid
X-Received: by 2002:a05:600c:3e07:b0:493:d0b2:bc46 with SMTP id 5b1f17b1804b1-493e6868818mr22405785e9.28.1783509395617;
        Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm40991012f8f.36.2026.07.08.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Colin Foster <colin.foster@in-advantage.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
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
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Werner <andreas.werner@men.de>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	linux@ew.tq-group.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v2 00/23] mfd: Use named initializers for arrays of *_device_data
Date: Wed,  8 Jul 2026 13:15:07 +0200
Message-ID: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10455; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=E3FC72ljteUGOGcVpTGBp/YrOoyfgnbCfRcJyfB8Y/0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiw/Q5s+Y/k2o7lHpivyHIncWbh850X+jPRNklNv1OUu/ aWVzvewk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJ6DzjYNhU8rM+z2p9eUKp X1D4b7MgQ+8ZqyOSv7Hly5nxhf09eenT9602CQJvrz87OONjYenZm5cfbCrentXdUvfpl1LULqm vCz+Y/NeomcT78CvDzuQarcm2nqbGuxt+nDQy9Fvl4jj12VypDMGQn2tfsjCqzT+Q8exTr5y7uW 1Mof0UwSWvw9kDPv6Sl/9QEb55R4O8Z50Na0JXpv3mojvlJ3IaPimrTq5j8NnI/GBy80pWY1425 8WWlXaaqq8Xd//uqxOqmf4rfH2+SPMx1jutu47e3ee2fXXW8kPuV/jsZF92d/2/JDI33HRW8VXe lcY/VdmSz/ZZ3L/rLG5q2aFRGFnzmTVxnUrCasvcTyvdAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041639_413655_E0FE30D2 
X-CRM114-Status: GOOD (  16.08  )
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

Hello,

this series superseeds my previous patch "[PATCH v1] mfd: Use named
initializers for arrays of i2c_device_data"
(https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@baylibre.com)
that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
Initialize spi_device_id arrays using member names"
(https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@baylibre.com).

The objective for this series is to prepare mfd for changing
of_device_id etc to make driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it.

This series is based on yesterday's next/master and it does the
restructuring not only for i2c and spi (as the two series mentioned
above), but for all *_device_id structures that I intend to modify with
a union that affect mfd. So (I hope) this is the only patch series
affecting mfd for this quest.

I don't care much about the last few patches unifying the coding style.
I think it's a good opportunity to do that, but if you don't like them,
just don't apply these.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (23):
  mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used
    locally
  mfd: bcm2835-pm: Drop unused header
  mfd: kempld: Simplify device abstraction
  mfd: lp87565: Explicitly set driver data for the generic dt compatible
  mfd: mt6360: Drop irrelevant __maybe_unused
  mfd: rt4831: Drop irrelevant __maybe_unused
  mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
  mfd: Drop unused assignment of i2c_device_id driver data
  mfd: Drop unused assignment of platform_device_id driver data
  mfd: Drop unused assignment of spi_device_id driver data
  mfd: Use named initializers for acpi_device_id arrays
  mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id
    array
  mfd: Use named initializers for arrays of i2c_device_id
  mfd: twl6030: Use named initializers for of_device_id
  mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
  mfd: Use named initializers for platform_device_id array
  mfd: Use named initializers for arrays of spi_device_id
  mfd: Unify style of acpi_device_id arrays
  mfd: Unify style of dmi_system_id arrays
  mfd: Unify style of i2c_device_id arrays
  mfd: Unify style of of_device_id arrays
  mfd: Unify style of pci_device_id arrays
  mfd: Unify style of spi_device_id arrays

 drivers/mfd/88pm800.c                 |  4 +-
 drivers/mfd/88pm805.c                 |  4 +-
 drivers/mfd/88pm860x-core.c           |  8 ++--
 drivers/mfd/aat2870-core.c            |  2 +-
 drivers/mfd/ab8500-core.c             |  8 ++--
 drivers/mfd/ab8500-sysctrl.c          |  4 +-
 drivers/mfd/ac100.c                   |  2 +-
 drivers/mfd/act8945a.c                |  8 ++--
 drivers/mfd/adp5520.c                 |  4 +-
 drivers/mfd/altera-a10sr.c            |  4 +-
 drivers/mfd/altera-sysmgr.c           |  2 +-
 drivers/mfd/arizona-i2c.c             | 14 +++----
 drivers/mfd/arizona-spi.c             | 14 +++----
 drivers/mfd/as3711.c                  |  8 ++--
 drivers/mfd/as3722.c                  |  8 ++--
 drivers/mfd/atmel-hlcdc.c             |  2 +-
 drivers/mfd/atmel-smc.c               |  2 +-
 drivers/mfd/axp20x-i2c.c              | 26 ++++++------
 drivers/mfd/axp20x-rsb.c              |  2 +-
 drivers/mfd/bcm2835-pm.c              | 15 +++++--
 drivers/mfd/bcm590xx.c                |  4 +-
 drivers/mfd/bd9571mwv.c               |  6 +--
 drivers/mfd/bq257xx.c                 |  8 ++--
 drivers/mfd/cgbc-core.c               |  2 +-
 drivers/mfd/cros_ec_dev.c             |  2 +-
 drivers/mfd/cs40l50-i2c.c             |  6 +--
 drivers/mfd/cs40l50-spi.c             |  6 +--
 drivers/mfd/cs42l43-i2c.c             |  8 ++--
 drivers/mfd/cs5535-mfd.c              |  2 +-
 drivers/mfd/da903x.c                  |  6 +--
 drivers/mfd/da9052-i2c.c              | 12 +++---
 drivers/mfd/da9052-spi.c              | 12 +++---
 drivers/mfd/da9055-i2c.c              |  2 +-
 drivers/mfd/da9062-core.c             |  4 +-
 drivers/mfd/da9063-i2c.c              | 11 ++---
 drivers/mfd/da9150-core.c             |  4 +-
 drivers/mfd/db8500-prcmu.c            |  4 +-
 drivers/mfd/exynos-lpass.c            |  2 +-
 drivers/mfd/gateworks-gsc.c           |  2 +-
 drivers/mfd/hi6421-pmic-core.c        |  6 +--
 drivers/mfd/hi655x-pmic.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++--------------
 drivers/mfd/intel-m10-bmc-pmci.c      |  2 +-
 drivers/mfd/intel-m10-bmc-spi.c       |  6 +--
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_quark_i2c_gpio.c    |  6 +--
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  6 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +-
 drivers/mfd/ioc3.c                    |  4 +-
 drivers/mfd/janz-cmodio.c             | 14 +++----
 drivers/mfd/kempld-core.c             | 29 ++++++--------
 drivers/mfd/khadas-mcu.c              |  4 +-
 drivers/mfd/lm3533-core.c             |  2 +-
 drivers/mfd/lochnagar-i2c.c           |  2 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/lp3943.c                  |  4 +-
 drivers/mfd/lp873x.c                  |  4 +-
 drivers/mfd/lp87565.c                 |  9 +++--
 drivers/mfd/lp8788.c                  |  2 +-
 drivers/mfd/lpc_ich.c                 |  2 +-
 drivers/mfd/macsmc.c                  |  2 +-
 drivers/mfd/madera-core.c             |  2 +-
 drivers/mfd/madera-i2c.c              | 18 ++++-----
 drivers/mfd/madera-spi.c              | 18 ++++-----
 drivers/mfd/max14577.c                |  4 +-
 drivers/mfd/max7360.c                 |  2 +-
 drivers/mfd/max77541.c                |  4 +-
 drivers/mfd/max77620.c                |  8 ++--
 drivers/mfd/max77686.c                |  2 +-
 drivers/mfd/max77693.c                |  2 +-
 drivers/mfd/max77714.c                |  2 +-
 drivers/mfd/max77759.c                |  4 +-
 drivers/mfd/max77843.c                |  8 ++--
 drivers/mfd/max8907.c                 |  6 +--
 drivers/mfd/max8925-i2c.c             |  4 +-
 drivers/mfd/max8997.c                 |  6 +--
 drivers/mfd/max8998.c                 |  6 +--
 drivers/mfd/mc13xxx-spi.c             |  6 +--
 drivers/mfd/menelaus.c                |  2 +-
 drivers/mfd/menf21bmc.c               |  2 +-
 drivers/mfd/motorola-cpcap.c          | 12 +++---
 drivers/mfd/mp2629.c                  |  2 +-
 drivers/mfd/mt6360-core.c             |  6 +--
 drivers/mfd/mt6370.c                  |  2 +-
 drivers/mfd/mt6397-core.c             |  4 +-
 drivers/mfd/mxs-lradc.c               |  4 +-
 drivers/mfd/ntxec.c                   |  4 +-
 drivers/mfd/ocelot-spi.c              |  2 +-
 drivers/mfd/omap-usb-host.c           |  4 +-
 drivers/mfd/palmas.c                  |  8 ++--
 drivers/mfd/pf1550.c                  |  2 +-
 drivers/mfd/qcom-pm8008.c             |  4 +-
 drivers/mfd/qcom-pm8xxx.c             |  6 +--
 drivers/mfd/rc5t583.c                 |  4 +-
 drivers/mfd/rdc321x-southbridge.c     |  2 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk8xx-i2c.c               |  2 +-
 drivers/mfd/rk8xx-spi.c               |  2 +-
 drivers/mfd/rohm-bd71828.c            |  4 +-
 drivers/mfd/rohm-bd9576.c             |  6 +--
 drivers/mfd/rsmu_i2c.c                | 18 ++++-----
 drivers/mfd/rsmu_spi.c                | 14 +++----
 drivers/mfd/rt4831.c                  |  6 +--
 drivers/mfd/rt5033.c                  |  4 +-
 drivers/mfd/rz-mtu3.c                 |  2 +-
 drivers/mfd/sec-acpm.c                |  6 +--
 drivers/mfd/sec-i2c.c                 | 22 +++++-----
 drivers/mfd/si476x-i2c.c              |  8 ++--
 drivers/mfd/simple-mfd-i2c.c          |  2 +-
 drivers/mfd/sky81452.c                |  4 +-
 drivers/mfd/sm501.c                   |  4 +-
 drivers/mfd/smpro-core.c              |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c         |  4 +-
 drivers/mfd/ssbi.c                    |  2 +-
 drivers/mfd/stm32-lptimer.c           |  4 +-
 drivers/mfd/stm32-timers.c            |  4 +-
 drivers/mfd/stmfx.c                   |  4 +-
 drivers/mfd/stmpe-i2c.c               | 34 ++++++++--------
 drivers/mfd/stmpe-spi.c               | 26 ++++++------
 drivers/mfd/stw481x.c                 |  8 ++--
 drivers/mfd/sun6i-prcm.c              |  2 +-
 drivers/mfd/tc3589x.c                 | 14 +++----
 drivers/mfd/ti-lmu.c                  | 10 ++---
 drivers/mfd/timberdale.c              |  2 +-
 drivers/mfd/tps6105x.c                |  6 +--
 drivers/mfd/tps65010.c                | 10 ++---
 drivers/mfd/tps6507x.c                |  6 +--
 drivers/mfd/tps65086.c                |  4 +-
 drivers/mfd/tps65090.c                |  6 +--
 drivers/mfd/tps65217.c                |  6 +--
 drivers/mfd/tps65218.c                |  8 ++--
 drivers/mfd/tps65219.c                |  8 ++--
 drivers/mfd/tps6586x.c                |  6 +--
 drivers/mfd/tps65910.c                | 12 +++---
 drivers/mfd/tps65912-i2c.c            |  4 +-
 drivers/mfd/tps65912-spi.c            |  4 +-
 drivers/mfd/tps6594-i2c.c             | 12 +++---
 drivers/mfd/tps6594-spi.c             | 12 +++---
 drivers/mfd/tqmx86.c                  |  2 +-
 drivers/mfd/twl-core.c                | 22 +++++-----
 drivers/mfd/twl4030-audio.c           |  4 +-
 drivers/mfd/twl4030-power.c           |  2 +-
 drivers/mfd/twl6030-irq.c             |  6 +--
 drivers/mfd/twl6040.c                 |  4 +-
 drivers/mfd/upboard-fpga.c            |  6 +--
 drivers/mfd/vexpress-sysreg.c         |  4 +-
 drivers/mfd/vx855.c                   |  2 +-
 drivers/mfd/wm831x-core.c             |  2 +-
 drivers/mfd/wm831x-i2c.c              | 14 +++----
 drivers/mfd/wm831x-spi.c              | 16 ++++----
 drivers/mfd/wm8350-i2c.c              |  6 +--
 drivers/mfd/wm8400-core.c             |  4 +-
 drivers/mfd/wm8994-core.c             |  8 ++--
 include/linux/mfd/bcm2835-pm.h        |  9 -----
 include/linux/mfd/kempld.h            |  2 -
 158 files changed, 518 insertions(+), 521 deletions(-)


base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
-- 
2.55.0.11.g153666a7d9bb


