Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2102DC5ACD6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 11:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23A92076D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 11:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SSaXbzgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23A92076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ulky+Z1GB+jqcHvcS3TPgFL6FF3kOAWurMRYpsjI6pg=; b=SSaXbzgY7BpP3q
	A7Kx0xZnRQ8pJE/ViIeJyFJ7feFifaQl4MrzbezsHay+0qBUwGvBwiut9Sna7TOzGceOlUInaw4x9
	ldrYQFOFEteWsyV7+ImGyQ/1CX2o4EP3qkQ7CiuBIpja4WRUOjeGnjjApQJSIA5VFa1sHLu6y+59l
	9QqPdh3xf7yLUgc0Lghr3t6kGetPrMn6eKH9wy+M1O8NSwg+bepa4ZOAChbi2lnlOXYsCJ+Wx76TU
	0rAyEf99SM6MeDXS88qvAtSTxySjAQsfZUfKjYFTjlr5UnPmphQdQYVyU8/87qg8zthS7gHkYFtet
	uClk0FjzET13UYAYew2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEXAR-0002wT-MA; Wed, 18 Mar 2020 11:47:23 +0000
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEXAG-0002k3-MH; Wed, 18 Mar 2020 11:47:14 +0000
Received: by mail-lj1-f194.google.com with SMTP id 19so26582936ljj.7;
 Wed, 18 Mar 2020 04:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Ab62Ifr6mdslEB8rNbBB2lyNK3id75uGbHTExJNuy2w=;
 b=JPtSA/VrJ1QkKyBdbBaZIE2ktPOtVxGj3aBFHixpTd91Sfq8UKgZXMpg77CUYhQlMy
 PHXKiqQWWSZJZr+m2eiL0+8C2yh5Vp79s8TYGLkGd+emXF92DUhloQqT6kDOKBrytoK/
 B7jNNsYxNAyeLvCWXqCMQK0/y1dNcWTshDigMrsFFO3iv/BAq/C7zLhWautk4cujQcw0
 Yo6T4CuNa2rKdkG+oIlt7LLfMpXvuxPRqf/M/1bRKswVNT7sB7reRxjaRPswYsxMm6By
 Uybe+E0kBIkYzaweZO1VNRo2Ix/NFqYMFzBALuJ63xT2Z1CHa22T9ZSD3qYrBiCOP4MK
 27yg==
X-Gm-Message-State: ANhLgQ1aCeK7/lsei7XtEt/05dTB7lvc33VrBmRP9LRQDLcWJ975W7AY
 l+hj0qkf6j5+F5W4/C+pa+o=
X-Google-Smtp-Source: ADFU+vsjikg6Y2a5KjS3oadSfQozrw8fRFUY0OAeRSoGQxPf78q4+DaqJVZpkfQhudkt2r3G0F7+Xg==
X-Received: by 2002:a2e:240e:: with SMTP id k14mr2152030ljk.228.1584532030161; 
 Wed, 18 Mar 2020 04:47:10 -0700 (PDT)
Received: from localhost.localdomain
 (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
 by smtp.gmail.com with ESMTPSA id 8sm17094lfy.21.2020.03.18.04.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 04:47:09 -0700 (PDT)
Date: Wed, 18 Mar 2020 13:47:01 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v5 0/9] Support ROHM BD99954 charger IC
Message-ID: <cover.1584468798.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_044712_728876_113495B0 
X-CRM114-Status: GOOD (  15.87  )
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Markus Laine <markus.laine@fi.rohmeurope.com>,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mikko Mutanen <mikko.mutanen@fi.rohmeurope.com>,
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

This version of series introduces new battry DT binding entries and
adds the parsing in power_supply_get_battery_info().

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
	Rename driver internal struct linear_range from bd70528-power
Patch 5:
	Use linear-ranges helpers in regulator framework and
	convert regulator drivers to use new linear_range struct.
Patch 6:
	Use linear-ranges helpers in bd70528 driver
Patch 7:
	Parsing of new battery parameters
Patch 8:
	ROHM BD99954 charger IC driver
Patch 9:
	Fix Kconfig help text indentiation for other entries as well.

---

Matti Vaittinen (9):
  dt-bindings: battery: add new battery parameters
  dt_bindings: ROHM BD99954 Charger
  drivers: base: add linear ranges helpers
  power: supply: bd70528: rename linear_range to avoid collision
  regulator: use linear_ranges helper
  power: supply: bd70528: use linear ranges
  power: supply: add battery parameters
  power: supply: Support ROHM bd99954 charger
  power: supply: Fix Kconfig help text indentiation

 .../bindings/power/supply/battery.txt         |    6 +
 .../bindings/power/supply/rohm,bd99954.yaml   |  155 +++
 drivers/base/Kconfig                          |    3 +
 drivers/base/Makefile                         |    1 +
 drivers/base/linear_ranges.c                  |  246 ++++
 drivers/power/supply/Kconfig                  |   34 +-
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/bd70528-charger.c        |  140 +-
 drivers/power/supply/bd99954-charger.c        | 1171 +++++++++++++++++
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
 60 files changed, 3018 insertions(+), 356 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/rohm,bd99954.yaml
 create mode 100644 drivers/base/linear_ranges.c
 create mode 100644 drivers/power/supply/bd99954-charger.c
 create mode 100644 include/linux/linear_range.h
 create mode 100644 include/linux/power/bd99954-charger.h


base-commit: fb33c6510d55 ("Linux 5.6-rc6")
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
