Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D17C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=; b=bCep1Wtwa8HyZwPlx8AHJur6m5
	AOCRUz6419KauINjRWXz4rR9u4GHjb40KsuImDM9gih964Dn900tS5rX3Wt2R/A8UNuJiwUvDS9p9
	oTgRKp+8Ad18kpe8qUD0ZY4MrKIoUW/wDeRDr6yhmmX2dI1TlawOqRIKg1dzTdjxERMs4a/JQ4m6T
	Z+Yk1lfUGqBtPyJUkl76152NvJzOreo80JUf8jI+qrDGq7veeeGX6E5cRNMUkHlP04cfSDTqGk8vJ
	/afk0hYLH+DgiBoaKf+x/oEEBQpFo/VHQNhjFulBd2EDl8Br/fKSNUY+yAJvPNPoUQuKWPUtPothE
	XgPp7a6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6G-000000034km-04x5;
	Thu, 09 Jul 2026 16:59:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6C-000000034iZ-07Pb
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 16:59:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-472326ca506so75601f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616382; x=1784221182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
        b=ZRaWtfANZVgw6PSlsRGukZaQGefZl7mDK+u8QFoFX61jrRTI7A2VGsC8s0Hc1WYHY6
         2shwoqoYcHd6bFjiwoRibGbF5LmpIIQJRA7/a7xsMbE6IQgSfl+tgqQjFtIxQGT4gznx
         yvISJCD7hAYZ2/vDeXU9yrhq+P7bXs3e/bJVWTbYWzOWEieThWfLW51XY1CsK5ZMNpv0
         JnGD9zUvonXHesmJP93RP3M2819iaOhrzOJ2XkoPG1jCSGJCt7VlU9try5XM6Ft5zFAF
         K4VM9+Jfuw9bqDioCtYeDjZ8kaamaiYs71cZTNRfuKuK+TmwHGlxW78P5PMxEGdtDMAR
         jDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616382; x=1784221182;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
        b=TpUeF0Y6ms1tZiOi3CJHXM+08sqyB0mIGL/ehTobqAMB0ClzQOWvSkHs8uMfWjaFQZ
         j23MEPn01cNSe3zHwlCtRs1t9y1PY1ZnyNCKynuT5Y17LAQNiHWcH20SO3yxfv1ELikw
         j+X4V38W6YxyJ4gw0fEJvNpdj3O8egpD/Yis1++G0jv4RMQeJUCYRNTW0QITGaWuoi9w
         dXG14Ne/leW6Zn4X/opUp0A0QcvmtI8srlg1rN4rBHcCPg1Pg3xghyCWU+Io2hqqjxHy
         hqshhODYQ56Sl3DxqCYaYJR8km20Qi69bEKAOeXB1Bn8FnWW4xURtxp5QbK9kqqFKgS0
         OqYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTchsuHL91bOWS+LdOJLTjkVCVn+KvoOjGwgFbQHP25W98uo07Zw8jvd7emt7hcgD046XkrqVwRo1NfPPS4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzxkRTXTsmGHcjq6uYfvjP4edZrH2ZxKyNvdncnvBMJCI77dfy
	us6ZIX07WPN1seOVRYZ+7PZdT3wEftEFmX+78KdSyc8AhgbbtDoIcnAmeFFku8Ali+A=
X-Gm-Gg: AfdE7ckEcjeUkKEMLWJs9x77tgm7B18uxOIlnfqR0kjwYUR6F/LivwefwSSZjwYfBOK
	cEMzwS9kOxCMskFHtc1NisLkArPJqrHBzGxBYqedmojaPhtr6+lExu0WF5ra3pXtKzQ9UlpP4JW
	cX9CKiNELVxJPNJ8N836NA8ips/rGtJAHo6hc0jTMZ9y9sic+6/684MozlPAQfbLMhTJDrKweNz
	0OWXHfNQmGwXLYhqIaZ73HnnBP4yLguVRqwz2up/X0ggtw0W7lOR2jzGgsMVxDPdAGYoO/8BJA5
	SDwwKq6Rx5EO5/RhCG8xx5kFqA8Gg/INU0zJCYwiWiD7X8RYDu5GqzQeTpIVZP6FU4RFX4WCqxL
	E7bnBWnKN0xmZck0/X1yOjLVZQmL0ByVkfhd/hHI7iU0i/aEAC8kRBBaGjmeZ6SbV0Yu3rueLrH
	O5rmP4P38kMcPq29zcSRlquVXUswCNq7fyhaVpEtsDaBlAfPw+GxXHWvlbFqTAjFZcevLFAv+Bt
	O6C
X-Received: by 2002:a05:6000:41fe:b0:47d:efd0:c026 with SMTP id ffacd0b85a97d-47df071e085mr8532732f8f.11.1783616382067;
        Thu, 09 Jul 2026 09:59:42 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm53752742f8f.22.2026.07.09.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Heiko Stuebner <heiko@sntech.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v3 00/23] mfd: Use named initializers for arrays of *_device_data
Date: Thu,  9 Jul 2026 18:58:19 +0200
Message-ID: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10849; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x7I7jx1xlGkYcQ0g2wKbDdhKkfSw89TrgshWMQXyV+I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9Mwgnh31BxHKY/FZjAXkPNmcm0bzYeRgOl6T cuiTlTVXeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TMAAKCRCPgPtYfRL+ TjY5B/4trUacM2VOnrdO7ml6L9pBXtZl5zaoNd5/YBFCQiq3bOhzl8d7o4FccdkGs2bFKjHkS4v Z6nqRY6Y5LACAyYQ1lTm6yna4lBkYMK+YNhz7N0wZfXi/wcumQ3qB1NUXcIqrOtVsoWzRjwIVq5 tkwaeRbvvdVgPa9JyKz68aUBkfo78fyZ778y+VJIvkbupkEfBcnfDIGtUaNg3533ZsMq8uHK516 LXGdCz3u66d8ucj/6SA+/se0nKD9+UCjj+SkVZnqkUOKZVXh+Ntr1ZeP+SKzz1RbE/MhXrQh9Ku YordR+qBAJ+oKLXaovmVD5vvRlMmuiNqGroU1DqPj32i9taA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_095944_212217_2B85E692 
X-CRM114-Status: GOOD (  16.96  )
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

v2 of this series can be found at
https://lore.kernel.org/lkml/cover.1783507945.git.u.kleine-koenig@baylibre.com
.

The objective for this series is to prepare mfd for changing
of_device_id and the others to make driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it.

Changes since v2:
 - Added the various review tags I received;
 - Sashiko found an issue in patch #3 ("mfd: kempld: Simplify device
   abstraction"). The concern was valid and that made me realize that I
   could simplify that driver even further;
 - For drivers/mfd/rsmu_i2c.c I did a wrong split. In the middle of the
   series the i2c_device_id array lacked the terminator. (Noticed by
   Sashiko);
 - The of_device_id changes were done by hand for v2, I created a script
   for that now and catched a few more issues (pointed out by Sashiko);
 - trivially rebased to next-20260708, no changes introduced by that;

Sashiko identifyed a bunch of preexisting issues, that I didn't address.
These are better handled by someone having the hardware I guess.

Andy suggested splitting patch #18 ("mfd: Unify style of acpi_device_id
arrays") into one for the pmic drivers and then one per driver. I didn't
do that as it seems arbitrary to me. Lee, please voice your preference
if you disagree with the patch separation here.

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
 drivers/mfd/88pm860x-core.c           |  8 +--
 drivers/mfd/aat2870-core.c            |  2 +-
 drivers/mfd/ab8500-core.c             |  8 +--
 drivers/mfd/ab8500-sysctrl.c          |  4 +-
 drivers/mfd/ac100.c                   |  2 +-
 drivers/mfd/act8945a.c                |  8 +--
 drivers/mfd/adp5520.c                 |  4 +-
 drivers/mfd/altera-a10sr.c            |  4 +-
 drivers/mfd/altera-sysmgr.c           |  2 +-
 drivers/mfd/arizona-i2c.c             | 14 +++---
 drivers/mfd/arizona-spi.c             | 14 +++---
 drivers/mfd/as3711.c                  |  8 +--
 drivers/mfd/as3722.c                  |  8 +--
 drivers/mfd/atmel-hlcdc.c             |  2 +-
 drivers/mfd/atmel-smc.c               |  2 +-
 drivers/mfd/axp20x-i2c.c              | 26 +++++-----
 drivers/mfd/axp20x-rsb.c              |  2 +-
 drivers/mfd/bcm2835-pm.c              | 15 ++++--
 drivers/mfd/bcm590xx.c                |  4 +-
 drivers/mfd/bd9571mwv.c               |  6 +--
 drivers/mfd/bq257xx.c                 |  8 +--
 drivers/mfd/cgbc-core.c               |  2 +-
 drivers/mfd/cros_ec_dev.c             |  2 +-
 drivers/mfd/cs40l50-i2c.c             |  6 +--
 drivers/mfd/cs40l50-spi.c             |  6 +--
 drivers/mfd/cs42l43-i2c.c             |  8 +--
 drivers/mfd/cs5535-mfd.c              |  2 +-
 drivers/mfd/da903x.c                  |  6 +--
 drivers/mfd/da9052-i2c.c              | 12 ++---
 drivers/mfd/da9052-spi.c              | 12 ++---
 drivers/mfd/da9055-i2c.c              |  4 +-
 drivers/mfd/da9062-core.c             |  4 +-
 drivers/mfd/da9063-i2c.c              | 11 +++--
 drivers/mfd/da9150-core.c             |  4 +-
 drivers/mfd/db8500-prcmu.c            |  4 +-
 drivers/mfd/exynos-lpass.c            |  2 +-
 drivers/mfd/gateworks-gsc.c           |  2 +-
 drivers/mfd/hi6421-pmic-core.c        |  6 +--
 drivers/mfd/hi655x-pmic.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++-----------
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
 drivers/mfd/janz-cmodio.c             | 14 +++---
 drivers/mfd/kempld-core.c             | 70 ++++++++-------------------
 drivers/mfd/khadas-mcu.c              |  4 +-
 drivers/mfd/lm3533-core.c             |  2 +-
 drivers/mfd/lochnagar-i2c.c           |  2 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/lp3943.c                  |  4 +-
 drivers/mfd/lp873x.c                  |  8 +--
 drivers/mfd/lp87565.c                 |  9 ++--
 drivers/mfd/lp8788.c                  |  2 +-
 drivers/mfd/lpc_ich.c                 |  2 +-
 drivers/mfd/macsmc.c                  |  2 +-
 drivers/mfd/madera-core.c             |  2 +-
 drivers/mfd/madera-i2c.c              | 18 +++----
 drivers/mfd/madera-spi.c              | 18 +++----
 drivers/mfd/max14577.c                |  6 +--
 drivers/mfd/max7360.c                 |  2 +-
 drivers/mfd/max77541.c                |  4 +-
 drivers/mfd/max77620.c                |  8 +--
 drivers/mfd/max77686.c                |  2 +-
 drivers/mfd/max77693.c                |  4 +-
 drivers/mfd/max77714.c                |  2 +-
 drivers/mfd/max77759.c                |  4 +-
 drivers/mfd/max77843.c                |  8 +--
 drivers/mfd/max8907.c                 |  6 +--
 drivers/mfd/max8925-i2c.c             |  6 +--
 drivers/mfd/max8997.c                 |  6 +--
 drivers/mfd/max8998.c                 |  6 +--
 drivers/mfd/mc13xxx-spi.c             |  6 +--
 drivers/mfd/menelaus.c                |  2 +-
 drivers/mfd/menf21bmc.c               |  2 +-
 drivers/mfd/motorola-cpcap.c          | 12 ++---
 drivers/mfd/mp2629.c                  |  2 +-
 drivers/mfd/mt6360-core.c             |  6 +--
 drivers/mfd/mt6370.c                  |  2 +-
 drivers/mfd/mt6397-core.c             |  4 +-
 drivers/mfd/mxs-lradc.c               |  4 +-
 drivers/mfd/ntxec.c                   |  4 +-
 drivers/mfd/ocelot-spi.c              |  2 +-
 drivers/mfd/omap-usb-host.c           |  4 +-
 drivers/mfd/palmas.c                  |  8 +--
 drivers/mfd/pf1550.c                  |  2 +-
 drivers/mfd/qcom-pm8008.c             |  4 +-
 drivers/mfd/qcom-pm8xxx.c             |  6 +--
 drivers/mfd/rave-sp.c                 |  4 +-
 drivers/mfd/rc5t583.c                 |  4 +-
 drivers/mfd/rdc321x-southbridge.c     |  2 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk8xx-i2c.c               |  2 +-
 drivers/mfd/rk8xx-spi.c               |  4 +-
 drivers/mfd/rohm-bd71828.c            |  4 +-
 drivers/mfd/rohm-bd9576.c             |  6 +--
 drivers/mfd/rsmu_i2c.c                | 18 +++----
 drivers/mfd/rsmu_spi.c                | 14 +++---
 drivers/mfd/rt4831.c                  |  6 +--
 drivers/mfd/rt5033.c                  |  4 +-
 drivers/mfd/rt5120.c                  |  2 +-
 drivers/mfd/rz-mtu3.c                 |  2 +-
 drivers/mfd/sec-acpm.c                |  6 +--
 drivers/mfd/sec-i2c.c                 | 22 ++++-----
 drivers/mfd/si476x-i2c.c              |  8 +--
 drivers/mfd/simple-mfd-i2c.c          |  2 +-
 drivers/mfd/sky81452.c                |  4 +-
 drivers/mfd/sm501.c                   |  4 +-
 drivers/mfd/smpro-core.c              |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c         |  4 +-
 drivers/mfd/ssbi.c                    |  2 +-
 drivers/mfd/stm32-lptimer.c           |  4 +-
 drivers/mfd/stm32-timers.c            |  4 +-
 drivers/mfd/stmfx.c                   |  4 +-
 drivers/mfd/stmpe-i2c.c               | 34 ++++++-------
 drivers/mfd/stmpe-spi.c               | 26 +++++-----
 drivers/mfd/stpmic1.c                 |  4 +-
 drivers/mfd/stw481x.c                 |  8 +--
 drivers/mfd/sun6i-prcm.c              |  2 +-
 drivers/mfd/tc3589x.c                 | 14 +++---
 drivers/mfd/ti-lmu.c                  | 10 ++--
 drivers/mfd/timberdale.c              |  2 +-
 drivers/mfd/tps6105x.c                |  6 +--
 drivers/mfd/tps65010.c                | 10 ++--
 drivers/mfd/tps6507x.c                |  6 +--
 drivers/mfd/tps65086.c                |  4 +-
 drivers/mfd/tps65090.c                |  6 +--
 drivers/mfd/tps65217.c                |  6 +--
 drivers/mfd/tps65218.c                |  8 +--
 drivers/mfd/tps65219.c                |  8 +--
 drivers/mfd/tps6586x.c                |  6 +--
 drivers/mfd/tps65910.c                | 12 ++---
 drivers/mfd/tps65912-i2c.c            |  4 +-
 drivers/mfd/tps65912-spi.c            |  4 +-
 drivers/mfd/tps6594-i2c.c             | 12 ++---
 drivers/mfd/tps6594-spi.c             | 12 ++---
 drivers/mfd/tqmx86.c                  |  2 +-
 drivers/mfd/twl-core.c                | 22 ++++-----
 drivers/mfd/twl4030-audio.c           |  4 +-
 drivers/mfd/twl4030-power.c           |  2 +-
 drivers/mfd/twl6030-irq.c             |  6 +--
 drivers/mfd/twl6040.c                 |  4 +-
 drivers/mfd/upboard-fpga.c            |  6 +--
 drivers/mfd/vexpress-sysreg.c         |  4 +-
 drivers/mfd/vx855.c                   |  2 +-
 drivers/mfd/wm831x-core.c             |  2 +-
 drivers/mfd/wm831x-i2c.c              | 14 +++---
 drivers/mfd/wm831x-spi.c              | 16 +++---
 drivers/mfd/wm8350-i2c.c              |  6 +--
 drivers/mfd/wm8400-core.c             |  4 +-
 drivers/mfd/wm8994-core.c             |  8 +--
 include/linux/mfd/bcm2835-pm.h        |  9 ----
 include/linux/mfd/kempld.h            | 12 -----
 161 files changed, 536 insertions(+), 578 deletions(-)


base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
-- 
2.55.0.11.g153666a7d9bb


