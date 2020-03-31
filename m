Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09318C2D0EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC2F20784
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6V8Afyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC2F20784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Tf3LjWPX/YRTMn01aL85crcH5VsEYigNTHAWjfpoig=; b=S6V8AfyfrRFx9i
	wPDSaxnL2sVuzgKRCUW4rvwTvzAlqG/MaE0+QjbOihVHGXjSR6Lq87TeP44xOOYNePcfs6ALlsmBY
	sMLKToLiE9ghs6NDH9PenDs3Wfv94bwlRkqkXrMgkKTSSMmz75z3QElN0nJh8UREzNZSqlydYHP0n
	6HLsUW4bAjzTcpoeZ49lfmrpqfH5lZS6BIcFCusvrjVro6GDbEv1VMCmK1Y+E+9xsTKtsLBBvw/9a
	2DRfY9vMZKUPR18fOa3fHhf+gEGaSlubvZUS6H0vnBRdqAjXprN8phDTePJiyDK2h0PCOsmrhNNiC
	XV719OkODL+d0CuyZzWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJK0v-00017A-Lq; Tue, 31 Mar 2020 16:45:21 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJK0d-0006vY-DH; Tue, 31 Mar 2020 16:45:05 +0000
Received: by mail-lj1-f193.google.com with SMTP id p14so22716612lji.11;
 Tue, 31 Mar 2020 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=/vSuGnmrrGeIUoH6AoRSurgIle90vcl4Ilte618e9r8=;
 b=oOhBVjQ7D5zEkxf03m/McmegpAQ5b7q229wvgyhxdAj9EaSKqX6vqWtT0PkTTT1LJp
 aRlZ2zKtkTBgZ7i1J8gsB+rjt5M7Wqv7Wbe7UYj/mfkPmc/o0f4rNvGF7jziSYdZVd4N
 x6AsV9B2K8L872E04Save6ZL0WrWaIkcCixXsiD9H5SBy1L7wVB1itF+xNNfZ3f5Almz
 JKn3EvKkes3M9/ZTLxyIWEqmgY66dzjg05HyLSKTMtQdhJ7/cvF9fB5iIrUvJG32KZaK
 BTtnyJoCahzgdz9WENCNZGn6t6SLEO085l4L8HXjN5Iz7KhZmAm57XH0Dqpx5OGiWFL2
 DvtQ==
X-Gm-Message-State: AGi0PuYpEsU0h0PovqIAOzbsPOjsv+uD1r/+ome8IDO807r+Fvb13oY+
 sR8tJmrUfAsFzpMuP0pczhJHn0b6iFs=
X-Google-Smtp-Source: APiQypL0PnLMulYujW4uQnTkqXCDz3vTuV1qPue+MHfJU372626AjFfaHgsmhecbhMryanfZOTjpsg==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr9675212ljh.258.1585657255812; 
 Tue, 31 Mar 2020 05:20:55 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id d27sm6346704lfq.73.2020.03.31.05.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 05:20:55 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:20:42 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v7 00/10] Support ROHM BD99954 charger IC
Message-ID: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_094503_465922_5FB0CAB7 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-samsung-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 linux-arm-msm@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Petr Mladek <pmladek@suse.com>, Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gary Hook <Gary.Hook@amd.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "GitAuthor: Matti Vaittinen" <matti.vaittinen@fi.rohmeurope.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Tal Gilboa <talgi@mellanox.com>, Changbin Du <changbin.du@intel.com>,
 Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 patches@opensource.cirrus.com, Andrew Morton <akpm@linux-foundation.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
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

This version of series introduces new battry DT binding entries and
adds the parsing in power_supply_get_battery_info().

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
	DT binding docs for the new battery parameters
Patch 2:
	BD99954 charger DT binding docs
Patch 3:
	Linear ranges helpers
Patch 4:
	Test for linear ranges helpers
Patch 5:
	Rename driver internal struct linear_range from bd70528-power
Patch 6:
	Use linear-ranges helpers in regulator framework and
	convert regulator drivers to use new linear_range struct.
Patch 7:
	Use linear-ranges helpers in bd70528 driver
Patch 8:
	Parsing of new battery parameters
Patch 9:
	ROHM BD99954 charger IC driver
Patch 10:
	Fix Kconfig help text indentiation for other entries as well.

---

Matti Vaittinen (10):
  dt-bindings: battery: add new battery parameters
  dt_bindings: ROHM BD99954 Charger
  lib: add linear ranges helpers
  lib/test_linear_ranges: add a test for the 'linear_ranges'
  power: supply: bd70528: rename linear_range to avoid collision
  regulator: use linear_ranges helper
  power: supply: bd70528: use linear ranges
  power: supply: add battery parameters
  power: supply: Support ROHM bd99954 charger
  power: supply: Fix Kconfig help text indentiation

 .../bindings/power/supply/battery.txt         |    6 +
 .../bindings/power/supply/rohm,bd99954.yaml   |  155 +++
 drivers/power/supply/Kconfig                  |   34 +-
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/bd70528-charger.c        |  140 +-
 drivers/power/supply/bd99954-charger.c        | 1149 +++++++++++++++++
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
 include/linux/power/bd99954-charger.h         | 1075 +++++++++++++++
 include/linux/power_supply.h                  |    4 +
 include/linux/regulator/driver.h              |   27 +-
 lib/Kconfig                                   |    3 +
 lib/Kconfig.debug                             |   11 +
 lib/Makefile                                  |    2 +
 lib/linear_ranges.c                           |  246 ++++
 lib/test_linear_ranges.c                      |  228 ++++
 62 files changed, 3236 insertions(+), 356 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/rohm,bd99954.yaml
 create mode 100644 drivers/power/supply/bd99954-charger.c
 create mode 100644 include/linux/linear_range.h
 create mode 100644 include/linux/power/bd99954-charger.h
 create mode 100644 lib/linear_ranges.c
 create mode 100644 lib/test_linear_ranges.c


base-commit: 7111951b8d4973bda27ff663f2cf18b663d15b48
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
