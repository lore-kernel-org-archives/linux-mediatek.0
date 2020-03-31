Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556C4C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDB320786
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nq2ZG9QW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IB3jtMla";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu+r+Ecp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CDB320786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obuRrp0aZBrhXHMuteTkgjmizOIrB952F/bwdsfnCWg=; b=Nq2ZG9QWtuquvj
	QaruVC+lIUWqoZu7SBKcqyo9TX3F4xrUYahbHP+aYuU1gTouE2CLcF/4g2Q1TUX6OjwNv1oIch9La
	7dhutgltHhFh6mKsR6P/63HOT+qp6fLCtbtOujYiCLAdIZ3uFe4MyQmAfOBuSZnBlCpfIT9qCfFTy
	C/+xJJbOra4QdAHK/wAUKqUO9EmBBXUr50QWdPE6D/NUXI0P/0NVGvtZ4U8fwr4HjOocaS4qne3MD
	reN+0diQOz+3ki5E/DYQLBwTBgOXRUfuItOy5PI6km7kzwzK7wwcGwunN44BN7OQonenDiZ+Q6ajs
	jMlZTTiDDAXb8ybsvV9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJa3-0004PY-9w; Tue, 31 Mar 2020 16:17:35 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJZL-0003kP-CE; Tue, 31 Mar 2020 16:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fcDugmez7F6MrOwyPLO/XrjYFDSuI09NY2nDArTEAvg=; b=IB3jtMlaWlZ8y04dluix7YPfzo
 xsOJTRPfiet17UvGinUhjA4PwLpbl/0g59hJyxbSzSgp1Vry7oku9RA2lMIb6XjG2dzsFrQ5+nlas
 2pUDmNRbXgMeuVohI/10BAIsutdYm+UFcCi+bZy+hnFd0ijNQEeOHtlYllpWmejVk8TTt8fbtc8sF
 pVp4npTr804ngZlVnMyQ9IIuJmb4Y8drWRvDXxDpbkVA1yX8I9qu3WseWbl9M741I/n74k6K2y1uO
 3jJv+d6GY81m2ba7Oez58vtMLn7RKRclK/k1a9A2cbOGkZ/plUzUygBRLX6blHD1eG/6QixgBasG6
 +T0YhXBA==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJFwh-0000XO-46; Tue, 31 Mar 2020 12:24:44 +0000
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A9DF21707;
 Tue, 31 Mar 2020 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585657481;
 bh=SlDP4sMftxLy1f3sSKNmvyVHPB99D/sLxwSfT22UqCo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hu+r+EcpSAzJeVjqvtdksiNchXYtO7gWeK/5FSVSatLCNfB1Onton3/RnWVAonWKx
 zyQX0UW7Vn50eXF7erUf7lfYDRTXfmPGmJHXNhk8LTyQWEO5UQ7pabJ4TZhDzrr47J
 XIEznv2Jj89Ij7JJhyxTAPVhfniu4zXPDiY3aBUE=
Received: by mail-pg1-f173.google.com with SMTP id b1so10259189pgm.8;
 Tue, 31 Mar 2020 05:24:41 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3euqBwVRzawW0zQkh4ZEwVZkZZbSnrI/i164SYTG9j7ffOuqW3
 xD17AGUyv1H/nU/34h/f0NP7VaesWdBNIwESaKY=
X-Google-Smtp-Source: ADFU+vv8nsroUvNz9mzcqH+sJYV0TRy7NUjlM1NPPnKI2dx7O/QGrICt49VJW5dc3UJowDAuRblaboSCROVLg91IBwo=
X-Received: by 2002:a05:6e02:4c:: with SMTP id
 i12mr6178445ilr.211.1585657479762; 
 Tue, 31 Mar 2020 05:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 31 Mar 2020 14:24:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGUJpBnLUX0J-cHCMrYzvoPB38O42_WB58Z6jtnT7XZUQ@mail.gmail.com>
Message-ID: <CAMj1kXGUJpBnLUX0J-cHCMrYzvoPB38O42_WB58Z6jtnT7XZUQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Support ROHM BD99954 charger IC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 linux-arm-msm@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Petr Mladek <pmladek@suse.com>, Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 mazziesaccount@gmail.com, Gary Hook <Gary.Hook@amd.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tal Gilboa <talgi@mellanox.com>, Changbin Du <changbin.du@intel.com>,
 Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 patches@opensource.cirrus.com, Andrew Morton <akpm@linux-foundation.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Matti,

On Tue, 31 Mar 2020 at 14:20, Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Support ROHM BD99954 Battery Management IC
>
> ROHM BD99954 is a Battery Management IC for 1-4 cell Lithium-Ion
> secondary battery. BD99954 is intended to be used in space-constraint
> equipment such as Low profile Notebook PC, Tablets and other
> applications.
>

Is it *really* necessary to cc this to 50 different people?

In the future, please trim down the cc list and keep it to the mailing
list, maintainers and reviewers of the affected subsystem.


> Series extracts a "linear ranges" helper out of the regulator
> framework. Linear ranges helper is intended to help converting
> real-world values to register values when conversion is linear. I
> suspect this is useful also for power subsystem and possibly for clk.
>
> This version of series introduces new battry DT binding entries and
> adds the parsing in power_supply_get_battery_info().
>
> Changelog v7:
>  General:
>    - rebased on top of v5.6
>  bd99954 driver:
>    - fixed bunch of styling issues spotted by Andy Shevchenko
>    - dropped ACPI table as ACPI properties are not supported at this
>      version of driver.
>    - added few acks
>
> Changelog v6:
>  generic:
>    - rebased on top of 5.6-rc7.
>  linear ranges:
>    - moved to lib as requested by Greg KH
>    - EXPORT_SYMBOL => EXPORT_SYMBOL_GPL
>    - licence GPL-2.0, not later
>    - added KUnit test for linear ranges
>
> Changelog v5:
>  generic:
>    - rebased on top of 5.6-rc6.
>  DT-bindings:
>    - Dropped -charger extension from compatible and removed wildcard x.
>  regulators:
>    - squashed the regulator changes in one patch.
>  power-supply KConfig:
>    - fixed indentiation
>    - dropped unnecessary 'default N' from BD99954.
>
> Changelog v4:
>  generic:
>    - rebase and drop RFC.
>  DT-bindings:
>    - add I2C node address-cells and size-cells to fix yaml check errors
>    - uncomment multipleOf:
>  bd70528:
>    - add patch which renames driver internal linear_range struct to
>      avoid collision when regulator/driver.h (which gets included from
>      rohm generic header) introduces the linear_range struct.
>  regulators:
>    - rebase to v5.6-rc2 and convert also the two newly introduced
>      drivers to use linear_range struct instead of
>      regulator_linear_range.
>  linear_ranges:
>    - Fix kerneldoc.
>
> Changelog RFC-v3:
>  DT-bindings:
>    - fix the BD99954 binding (the *-microvolt Vs. *-microvolts issue is
>      still there. Not sure which one is correct)
>    - renabe tricklecharge-* binding to trickle-charge-* as suggested by
>      Rob.
>  - drop the linear-ranges helper which was written for BD70528 and
>    extract the linear-range code from regulator framework instead.
>  - refactor regulator framework to utilize extracted linear-ranges
>    code.
>  - change the struct regulator_linear_range to linear_range from
>    regulator drivers.
>  - refactor BD70528 to use regulator framework originated
>    linear-ranges code.
>  - change BD99954 to use linear-ranges code from regulator framework
>
> Changelog RFC-v2:
>  DT-bindings:
>    - Used the battery parameters described in battery.txt
>    - Added few new parameters to battery.txt
>    - Added ASCII art charging profile chart for BD99954 to explain
>      states and limits.
>  Linear ranges:
>    - Fixed division by zero error from linear-ranges code if step 0 is
>      used.
>  Power-supply core:
>    - Added parsing of new battery parameters.
>  BD99954 driver:
>    - converted to use battery parameters from battery node
>    - Added step 0 ranges for reg values which do not change voltage
>    - added dt-node to psy-config
>
> Patch 1:
>         DT binding docs for the new battery parameters
> Patch 2:
>         BD99954 charger DT binding docs
> Patch 3:
>         Linear ranges helpers
> Patch 4:
>         Test for linear ranges helpers
> Patch 5:
>         Rename driver internal struct linear_range from bd70528-power
> Patch 6:
>         Use linear-ranges helpers in regulator framework and
>         convert regulator drivers to use new linear_range struct.
> Patch 7:
>         Use linear-ranges helpers in bd70528 driver
> Patch 8:
>         Parsing of new battery parameters
> Patch 9:
>         ROHM BD99954 charger IC driver
> Patch 10:
>         Fix Kconfig help text indentiation for other entries as well.
>
> ---
>
> Matti Vaittinen (10):
>   dt-bindings: battery: add new battery parameters
>   dt_bindings: ROHM BD99954 Charger
>   lib: add linear ranges helpers
>   lib/test_linear_ranges: add a test for the 'linear_ranges'
>   power: supply: bd70528: rename linear_range to avoid collision
>   regulator: use linear_ranges helper
>   power: supply: bd70528: use linear ranges
>   power: supply: add battery parameters
>   power: supply: Support ROHM bd99954 charger
>   power: supply: Fix Kconfig help text indentiation
>
>  .../bindings/power/supply/battery.txt         |    6 +
>  .../bindings/power/supply/rohm,bd99954.yaml   |  155 +++
>  drivers/power/supply/Kconfig                  |   34 +-
>  drivers/power/supply/Makefile                 |    1 +
>  drivers/power/supply/bd70528-charger.c        |  140 +-
>  drivers/power/supply/bd99954-charger.c        | 1149 +++++++++++++++++
>  drivers/power/supply/power_supply_core.c      |    8 +
>  drivers/regulator/88pg86x.c                   |    4 +-
>  drivers/regulator/88pm800-regulator.c         |    4 +-
>  drivers/regulator/Kconfig                     |    1 +
>  drivers/regulator/act8865-regulator.c         |    4 +-
>  drivers/regulator/act8945a-regulator.c        |    2 +-
>  drivers/regulator/arizona-ldo1.c              |    2 +-
>  drivers/regulator/arizona-micsupp.c           |    4 +-
>  drivers/regulator/as3711-regulator.c          |    6 +-
>  drivers/regulator/as3722-regulator.c          |    4 +-
>  drivers/regulator/axp20x-regulator.c          |   16 +-
>  drivers/regulator/bcm590xx-regulator.c        |    8 +-
>  drivers/regulator/bd70528-regulator.c         |    8 +-
>  drivers/regulator/bd71828-regulator.c         |   10 +-
>  drivers/regulator/bd718x7-regulator.c         |   26 +-
>  drivers/regulator/da903x.c                    |    2 +-
>  drivers/regulator/helpers.c                   |  130 +-
>  drivers/regulator/hi6421-regulator.c          |    4 +-
>  drivers/regulator/lochnagar-regulator.c       |    4 +-
>  drivers/regulator/lp873x-regulator.c          |    4 +-
>  drivers/regulator/lp87565-regulator.c         |    2 +-
>  drivers/regulator/lp8788-buck.c               |    2 +-
>  drivers/regulator/max77650-regulator.c        |    2 +-
>  drivers/regulator/mcp16502.c                  |    4 +-
>  drivers/regulator/mp8859.c                    |    2 +-
>  drivers/regulator/mt6323-regulator.c          |    6 +-
>  drivers/regulator/mt6358-regulator.c          |    8 +-
>  drivers/regulator/mt6380-regulator.c          |    6 +-
>  drivers/regulator/mt6397-regulator.c          |    6 +-
>  drivers/regulator/palmas-regulator.c          |    4 +-
>  drivers/regulator/qcom-rpmh-regulator.c       |    2 +-
>  drivers/regulator/qcom_rpm-regulator.c        |   14 +-
>  drivers/regulator/qcom_smd-regulator.c        |   70 +-
>  drivers/regulator/rk808-regulator.c           |   10 +-
>  drivers/regulator/s2mps11.c                   |   14 +-
>  drivers/regulator/sky81452-regulator.c        |    2 +-
>  drivers/regulator/stpmic1_regulator.c         |   18 +-
>  drivers/regulator/tps65086-regulator.c        |   10 +-
>  drivers/regulator/tps65217-regulator.c        |    4 +-
>  drivers/regulator/tps65218-regulator.c        |    6 +-
>  drivers/regulator/tps65912-regulator.c        |    4 +-
>  drivers/regulator/twl-regulator.c             |    4 +-
>  drivers/regulator/twl6030-regulator.c         |    2 +-
>  drivers/regulator/wm831x-dcdc.c               |    2 +-
>  drivers/regulator/wm831x-ldo.c                |    4 +-
>  drivers/regulator/wm8350-regulator.c          |    2 +-
>  drivers/regulator/wm8400-regulator.c          |    2 +-
>  include/linux/linear_range.h                  |   48 +
>  include/linux/power/bd99954-charger.h         | 1075 +++++++++++++++
>  include/linux/power_supply.h                  |    4 +
>  include/linux/regulator/driver.h              |   27 +-
>  lib/Kconfig                                   |    3 +
>  lib/Kconfig.debug                             |   11 +
>  lib/Makefile                                  |    2 +
>  lib/linear_ranges.c                           |  246 ++++
>  lib/test_linear_ranges.c                      |  228 ++++
>  62 files changed, 3236 insertions(+), 356 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/rohm,bd99954.yaml
>  create mode 100644 drivers/power/supply/bd99954-charger.c
>  create mode 100644 include/linux/linear_range.h
>  create mode 100644 include/linux/power/bd99954-charger.h
>  create mode 100644 lib/linear_ranges.c
>  create mode 100644 lib/test_linear_ranges.c
>
>
> base-commit: 7111951b8d4973bda27ff663f2cf18b663d15b48
> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
