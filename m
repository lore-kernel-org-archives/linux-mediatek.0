Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9091AC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 07:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5612F2074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 07:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l7HfBVkv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5612F2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ceXaoP9bh9pVaHMRRK9YzCEwkRG+FXKRoXi7v3qspgc=; b=l7HfBVkvOyDnWT
	neDp7MQyvorOah1DoSjqs5O5IUyT4xNACFY4IuE+MXlbg1eB7V5QCfSka/P9H4NczHrbi7+pwrAUj
	x3HLmZLGzT6jhZokpjf6Bi8lyTuVlJer3DQZzdoEEGL0ANXyCrB90SbCY9vKWbqs/OYI8++KMcosE
	UT2cZFV7NEI6XqUVchwPqat9BEn4+hCdE8EA5rGHmm5SxmocwTpPXE7dkwMJ+6u/nc9OEMZWDMbts
	NImyUsdQqRowa+FV7a0X9SXJvUkMuygJQg+L5sN47rZQNfKXfUXme57CYablguwciGseBXIYLfFFs
	gFwu08HQ8zj6P8iA1bYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOGTX-0000Jz-Je; Tue, 14 Apr 2020 07:59:19 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGTO-0000DS-Vu; Tue, 14 Apr 2020 07:59:12 +0000
Received: by mail-lj1-f196.google.com with SMTP id q22so11466622ljg.0;
 Tue, 14 Apr 2020 00:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=JdLyAccaWUmkXdTSspp6ynm82lQAH9maXmu165bianE=;
 b=I0OxgQ8I0ZPxQFzNzCVkb+AQ7RxjB1pXFMAOJ8Kl+i4HhPs/z9QtODe6USiE0HNEU6
 zXuNrJYMesP8AbDfwNcMXXOQJyw76vYmkzO6rytciisllL4Yrerm9IIJDxWpwnog952F
 II4GnbjOVPAxzXhb82TLbsbk8uGzRxOQtN+fUJ9njDatttuYj1CsZqiIuB5n9bqFqlYw
 2Ho92m8Npk04oObc5l5ZGBi/nQBnmHrhzu8AmKkgUmsYKuEuxHUVui+mrBNb9kfQXvsV
 oyywDboxESxZpdUXp1G8C5USJJYxwjsTcEG8dHhAFUlNNDRU0C+CgvU0jKRTYGyGUPZ0
 Z8Wg==
X-Gm-Message-State: AGi0PuZoJ2iF2SiTmZ3fWGyIQBSWXMZM+6KmqrqeH4uY4gmNwwlNDWpa
 A2ehbd8x5AFA3zJQhxC7ecY=
X-Google-Smtp-Source: APiQypIKVVpHV8FdmvKZHTVeW9rdWsW6z9wcz3ylvVynt+m/NXjro1ePx2JWYy6pnmuTmx+cloznQw==
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr564677ljc.8.1586851144063;
 Tue, 14 Apr 2020 00:59:04 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id t19sm9414024lfl.53.2020.04.14.00.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 00:59:03 -0700 (PDT)
Date: Tue, 14 Apr 2020 10:58:53 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v9 00/10] Support ROHM BD99954 charger IC
Message-ID: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_005911_035469_29A05FA3 
X-CRM114-Status: GOOD (  18.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Sebastian Reichel <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 "Angelo G. Del Regno" <kholk11@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-samsung-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-omap@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Baolin Wang <baolin.wang@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 mikko.mutanen@fi.rohmeurope.com, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support ROHM BD99954 Battery Management IC

ROHM BD99954 is a Battery Management IC for 1-4 cell Lithium-Ion
secondary battery. BD99954 is intended to be used in space-constraint
equipment such as Low profile Notebook PC, Tablets and other
applications.

Series extracts a "linear ranges" helper out of the regulator
framework. Linear ranges helper is intended to help converting
real-world values to register values when conversion is linear. I
suspect this is useful also for power subsystem and possibly for clk.

Current implementation does not support inversely proportional ranges
but adding support for that could be helpful.

This version of series introduces new battry DT binding entries and
adds the parsing in power_supply_get_battery_info().

Changelog v9:
 General:
   - rebased on top of v5.7-rc1
   - re-ordered patches as suggested by Sebastian Reichel
   - added few acks
 BD99954 driver:
   - Moved bd99954-charger.h to drivers/power/supply
   - fixed a typo from print
   - used devm_add_action_or_reset and removed remove callback

Changelog v8:
 Linear ranges
   - small improvements suggested by Andy Shevchenko, no functional changes

Changelog v7:
 General:
   - rebased on top of v5.6
 bd99954 driver:
   - fixed bunch of styling issues spotted by Andy Shevchenko
   - dropped ACPI table as ACPI properties are not supported at this
     version of driver.
   - added few acks

Changelog v6:
 generic:
   - rebased on top of 5.6-rc7.
 linear ranges:
   - moved to lib as requested by Greg KH
   - EXPORT_SYMBOL => EXPORT_SYMBOL_GPL
   - licence GPL-2.0, not later
   - added KUnit test for linear ranges

Changelog v5:
 generic:
   - rebased on top of 5.6-rc6.
 DT-bindings:
   - Dropped -charger extension from compatible and removed wildcard x.
 regulators:
   - squashed the regulator changes in one patch.
 power-supply KConfig:
   - fixed indentiation
   - dropped unnecessary 'default N' from BD99954.

Changelog v4:
 generic:
   - rebase and drop RFC.
 DT-bindings:
   - add I2C node address-cells and size-cells to fix yaml check errors
   - uncomment multipleOf:
 bd70528:
   - add patch which renames driver internal linear_range struct to
     avoid collision when regulator/driver.h (which gets included from
     rohm generic header) introduces the linear_range struct.
 regulators:
   - rebase to v5.6-rc2 and convert also the two newly introduced
     drivers to use linear_range struct instead of
     regulator_linear_range.
 linear_ranges:
   - Fix kerneldoc.

Changelog RFC-v3:
 DT-bindings:
   - fix the BD99954 binding (the *-microvolt Vs. *-microvolts issue is
     still there. Not sure which one is correct)
   - renabe tricklecharge-* binding to trickle-charge-* as suggested by
     Rob.
 - drop the linear-ranges helper which was written for BD70528 and
   extract the linear-range code from regulator framework instead.
 - refactor regulator framework to utilize extracted linear-ranges
   code.
 - change the struct regulator_linear_range to linear_range from
   regulator drivers.
 - refactor BD70528 to use regulator framework originated
   linear-ranges code.
 - change BD99954 to use linear-ranges code from regulator framework

Changelog RFC-v2:
 DT-bindings:
   - Used the battery parameters described in battery.txt
   - Added few new parameters to battery.txt
   - Added ASCII art charging profile chart for BD99954 to explain
     states and limits.
 Linear ranges:
   - Fixed division by zero error from linear-ranges code if step 0 is
     used.
 Power-supply core:
   - Added parsing of new battery parameters.
 BD99954 driver:
   - converted to use battery parameters from battery node
   - Added step 0 ranges for reg values which do not change voltage
   - added dt-node to psy-config

Patch 1:
	Linear ranges helpers
Patch 2:
	Test for linear ranges helpers
Patch 3:
	Rename driver internal struct linear_range from bd70528-power
Patch 4:
	Use linear-ranges helpers in regulator framework and
	convert regulator drivers to use new linear_range struct.
Patch 5:
	Use linear-ranges helpers in bd70528 driver
Patch 6:
	DT binding docs for the new battery parameters
Patch 7:
	Parsing of new battery parameters
Patch 8:
	BD99954 charger DT binding docs
Patch 9:
	ROHM BD99954 charger IC driver
Patch 10:
	Fix Kconfig help text indentiation for other entries as well.

---

Matti Vaittinen (10):
  lib: add linear ranges helpers
  lib/test_linear_ranges: add a test for the 'linear_ranges'
  power: supply: bd70528: rename linear_range to avoid collision
  regulator: use linear_ranges helper
  power: supply: bd70528: use linear ranges
  dt-bindings: battery: add new battery parameters
  power: supply: add battery parameters
  dt_bindings: ROHM BD99954 Charger
  power: supply: Support ROHM bd99954 charger
  power: supply: Fix Kconfig help text indentiation

 .../bindings/power/supply/battery.txt         |    6 +
 .../bindings/power/supply/rohm,bd99954.yaml   |  155 +++
 drivers/power/supply/Kconfig                  |   34 +-
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/bd70528-charger.c        |  140 +-
 drivers/power/supply/bd99954-charger.c        | 1142 +++++++++++++++++
 drivers/power/supply/bd99954-charger.h        | 1075 ++++++++++++++++
 drivers/power/supply/power_supply_core.c      |    8 +
 drivers/regulator/88pg86x.c                   |    4 +-
 drivers/regulator/88pm800-regulator.c         |    4 +-
 drivers/regulator/Kconfig                     |    1 +
 drivers/regulator/act8865-regulator.c         |    4 +-
 drivers/regulator/act8945a-regulator.c        |    2 +-
 drivers/regulator/arizona-ldo1.c              |    2 +-
 drivers/regulator/arizona-micsupp.c           |    4 +-
 drivers/regulator/as3711-regulator.c          |    6 +-
 drivers/regulator/as3722-regulator.c          |    4 +-
 drivers/regulator/axp20x-regulator.c          |   16 +-
 drivers/regulator/bcm590xx-regulator.c        |    8 +-
 drivers/regulator/bd70528-regulator.c         |    8 +-
 drivers/regulator/bd71828-regulator.c         |   10 +-
 drivers/regulator/bd718x7-regulator.c         |   26 +-
 drivers/regulator/da903x.c                    |    2 +-
 drivers/regulator/helpers.c                   |  130 +-
 drivers/regulator/hi6421-regulator.c          |    4 +-
 drivers/regulator/lochnagar-regulator.c       |    4 +-
 drivers/regulator/lp873x-regulator.c          |    4 +-
 drivers/regulator/lp87565-regulator.c         |    2 +-
 drivers/regulator/lp8788-buck.c               |    2 +-
 drivers/regulator/max77650-regulator.c        |    2 +-
 drivers/regulator/mcp16502.c                  |    4 +-
 drivers/regulator/mp8859.c                    |    2 +-
 drivers/regulator/mt6323-regulator.c          |    6 +-
 drivers/regulator/mt6358-regulator.c          |    8 +-
 drivers/regulator/mt6380-regulator.c          |    6 +-
 drivers/regulator/mt6397-regulator.c          |    6 +-
 drivers/regulator/palmas-regulator.c          |    4 +-
 drivers/regulator/qcom-rpmh-regulator.c       |    2 +-
 drivers/regulator/qcom_rpm-regulator.c        |   14 +-
 drivers/regulator/qcom_smd-regulator.c        |   70 +-
 drivers/regulator/rk808-regulator.c           |   10 +-
 drivers/regulator/s2mps11.c                   |   14 +-
 drivers/regulator/sky81452-regulator.c        |    2 +-
 drivers/regulator/stpmic1_regulator.c         |   18 +-
 drivers/regulator/tps65086-regulator.c        |   10 +-
 drivers/regulator/tps65217-regulator.c        |    4 +-
 drivers/regulator/tps65218-regulator.c        |    6 +-
 drivers/regulator/tps65912-regulator.c        |    4 +-
 drivers/regulator/twl-regulator.c             |    4 +-
 drivers/regulator/twl6030-regulator.c         |    2 +-
 drivers/regulator/wm831x-dcdc.c               |    2 +-
 drivers/regulator/wm831x-ldo.c                |    4 +-
 drivers/regulator/wm8350-regulator.c          |    2 +-
 drivers/regulator/wm8400-regulator.c          |    2 +-
 include/linux/linear_range.h                  |   48 +
 include/linux/power_supply.h                  |    4 +
 include/linux/regulator/driver.h              |   27 +-
 lib/Kconfig                                   |    3 +
 lib/Kconfig.debug                             |   11 +
 lib/Makefile                                  |    2 +
 lib/linear_ranges.c                           |  241 ++++
 lib/test_linear_ranges.c                      |  228 ++++
 62 files changed, 3224 insertions(+), 356 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/rohm,bd99954.yaml
 create mode 100644 drivers/power/supply/bd99954-charger.c
 create mode 100644 drivers/power/supply/bd99954-charger.h
 create mode 100644 include/linux/linear_range.h
 create mode 100644 lib/linear_ranges.c
 create mode 100644 lib/test_linear_ranges.c


base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
