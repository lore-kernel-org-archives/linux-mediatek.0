Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFC8C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 15:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6BE20848
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 15:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4UdBJcV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6BE20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtDdm9DS1od7r6b3i/UlWQBTv7/7kKtRXpMdA+IX9tA=; b=p4UdBJcVlptms2
	omK8+BERhhGvppwGCB9YMXV6L0M8Om8LrXeLdVtdKoXlMwx5IDgBW47W/hiPqVtP4acrgKae1pWWn
	JCWyTgURxMqXPSQTspHGoVTWabMopcVNBEIp7sQthlWv+hewiE6IGIFaSF6AfeY9uIxmUAA5cD+2E
	TWWPA7sSUPUg+UWQEQnLUr8by/9Xl4lwyaN/1z1E3Lytq4LwMsixsVJ921p4sbwz8W2EqK1/Z95xh
	xU/n6fMNyk597SHNUGF/2JX299jRNOw/XzRHa1shp2v9zYceFJx4Gk+qCJvNaRnpYIkFNosMcz+yl
	V1Ch5zm5AQOajY6UY0qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJ7m-0006dC-AR; Tue, 31 Mar 2020 15:48:22 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJ7b-0006Ov-M9; Tue, 31 Mar 2020 15:48:17 +0000
X-AuditID: c0a8fbf4-473ff70000004419-48-5e834d98d918
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 93.50.17433.89D438E5; Tue, 31 Mar 2020 16:03:04 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Tue, 31 Mar 2020 16:02:57 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "ardb@kernel.org" <ardb@kernel.org>
Subject: Re: [PATCH v7 00/10] Support ROHM BD99954 charger IC
Thread-Topic: [PATCH v7 00/10] Support ROHM BD99954 charger IC
Thread-Index: AQHWB1bSV+aovpsYykurh4FZlZTmdKhifnAAgAAbhwA=
Date: Tue, 31 Mar 2020 14:02:55 +0000
Message-ID: <168c9184cd4781f27a3d53339610849894263800.camel@fi.rohmeurope.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMj1kXGUJpBnLUX0J-cHCMrYzvoPB38O42_WB58Z6jtnT7XZUQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGUJpBnLUX0J-cHCMrYzvoPB38O42_WB58Z6jtnT7XZUQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <3EAC366C829A74439618106BB8D5987A@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUVRyfc197QVcuK8oRshk2SLFRcirnnwOOM1ld1HyMTMM0BS1xYylY
 aHcptQ8yLIyySerKY9kgjTdELiz4AHkkLUoysqxsiEZOiGODozAB8ka7l03h0/md/+91PvwP
 SyosrB8br9ELWo0qQcl4Ur9WzNo2mj8wRL1ef8kfugZnKSiwVjPw/WgRCVlpeQRMj48gmDdd
 lUGt2UrDeOF1Cjpbhyk4dSIYnH2nScgZuM9ArfMaAa4MG4K8nG4EBY50Cjpqayg4Y++iYcpl
 osBQbGXA4aiRwYTrGAHZc+UE2AZ7aTjVekMGPY0FDPQYnAh+KDlBwViWHYHZ0UJA6S0nAWnp
 b0BBaQcFxeWvQvnMOQpq6iYJGBtppeHZ4BMaCsdzSHjcn0eB0+wgIaPZLgNnxTgBzXllNHRe
 1kNzhpOE3MJmGdTZRG2rayfcGr0jCp5OUzDd5hDR3TEEV/+dRtu38Bk35xm++sdqxM/OmBA/
 8cRE8SN9GTK+5t7PNF9feZvgK0ZD+AbLXzL+rC2Fr6vYwBc3DRG8rSqT4U1lRTTf39vE8MNd
 XbJ9L3+0LDRGpf/6QHycJmTbp8vU1pFcJrnp/YPZRdfIVNT9rhGxLObexLlVQUbkySq4XoQn
 O88zRuQhXjoQrrq5T9IwXCg23pZJYx9uHW5M6yIkPcnNr8a9dX8jSbOSC8OtdoUEfbht+EJt
 pFu+FV98UEpImOKC8FRWNy1hObcHt5y5QrlrjyN89J6JkggPbj82Ps5cMCBuLc5MHV7AJOeL
 bQ8mF8yY43BJk4N041V4aPDp//MAfHHyHCW9geSCsbUxxA234+MlyJ0SgLO/G5C5n+CNf8+/
 T51Eqy1LCiyLZsui2bLEbFliPovoKoQTVfEJcSq9sHmTVkjZpE1SJ4rHZ0mJNuTe9fFL6Flb
 eBsiWNSG1rCEcpXcO9gQpVgRkxR7SK3SqaO1KQmCrg1hllT6yJm9qVEKeazq0GFBm/Sc8mcp
 pa983cCpTxSc1PWlICQL2ufsSyyrxHJqlxjqrRXihIOfxyfoF2mC9ZDCPf18dIImVtCqUvTq
 aGk1onXibkjUcrE3PVy0y3XJqkRx6rZeR6+xJ4cKi0jWXlhaRCooTZJG8POVB0hNnCRVp2he
 FD1EvixSrpT37RTZ5eKHf5HzUKwgxIr9hiNShV61SPmlogNjNTL7N1emZv7Z3T4Tbc5vbAja
 yL3VZ97bfr4kPyJuR/CFR/O7PX7ZFbij0tzbWflxqEJzxMvl5Rm2ZjLit7I/O+ciL8fdMTYJ
 /luDk3t0gez6u698aPAaCHs77b31M2tpK3PDdczrnYjA/hWHJ7ZElsc07PmK/PZRe/jcF0f/
 qP8prEVJ6dSqzRtIrU71H16f/Y+tBAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_084812_051951_FD03D2B2 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "milo.kim@ti.com" <milo.kim@ti.com>,
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "Gary.Hook@amd.com" <Gary.Hook@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "Mutanen, 
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "Laine, Markus" <Markus.Laine@fi.rohmeurope.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "bp@suse.de" <bp@suse.de>, "pmladek@suse.com" <pmladek@suse.com>,
 "zaslonko@linux.ibm.com" <zaslonko@linux.ibm.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>, "davidgow@google.com" <davidgow@google.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "talgi@mellanox.com" <talgi@mellanox.com>,
 "changbin.du@intel.com" <changbin.du@intel.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Tue, 2020-03-31 at 14:24 +0200, Ard Biesheuvel wrote:
> Hello Matti,
> 
> On Tue, 31 Mar 2020 at 14:20, Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > Support ROHM BD99954 Battery Management IC
> > 
> > ROHM BD99954 is a Battery Management IC for 1-4 cell Lithium-Ion
> > secondary battery. BD99954 is intended to be used in space-
> > constraint
> > equipment such as Low profile Notebook PC, Tablets and other
> > applications.
> > 
> 
> Is it *really* necessary to cc this to 50 different people?
> 
> In the future, please trim down the cc list and keep it to the
> mailing
> list, maintainers and reviewers of the affected subsystem.

Sorry Ard (and others). This is the list get_maintainers.pl gave for
the series. Partially the large amount of receivers is caused by the
regulator framework change which impacted bunch of individual drivers.
Please, see the amount changed files from summary below. In addition to
that the linear_range code has been drifting from one place to other
during the review iterations until it settled to /lib. For example Greg
gave me some comments while linear_ranges was still heading to
drivers/base - so I did not drop Greg off from new revisions of the
series even if it was no longer changing drivers/base

It's hard for me to decide who of the fellows are relevant and who are
not. I know email flood is annoying and thus I did not send all of the
patches in the series to everyone. And - personally I do like receiving
whole series if I have been added in one patch. But I admit my mailbox
is not as crowded as it used to be so maybe that is why it is not so
annoying for me to delete mails.

Anyways, I will drop everyone who asks to be dropped from subsequent
patches but other than that - I guess it's better to accidentally
include someone who needs to press delete - than drop someone who
want's to have a say on changes.

> >  .../bindings/power/supply/battery.txt         |    6 +
> >  .../bindings/power/supply/rohm,bd99954.yaml   |  155 +++
> >  drivers/power/supply/Kconfig                  |   34 +-
> >  drivers/power/supply/Makefile                 |    1 +
> >  drivers/power/supply/bd70528-charger.c        |  140 +-
> >  drivers/power/supply/bd99954-charger.c        | 1149
> > +++++++++++++++++
> >  drivers/power/supply/power_supply_core.c      |    8 +
> >  drivers/regulator/88pg86x.c                   |    4 +-
> >  drivers/regulator/88pm800-regulator.c         |    4 +-
> >  drivers/regulator/Kconfig                     |    1 +
> >  drivers/regulator/act8865-regulator.c         |    4 +-
> >  drivers/regulator/act8945a-regulator.c        |    2 +-
> >  drivers/regulator/arizona-ldo1.c              |    2 +-
> >  drivers/regulator/arizona-micsupp.c           |    4 +-
> >  drivers/regulator/as3711-regulator.c          |    6 +-
> >  drivers/regulator/as3722-regulator.c          |    4 +-
> >  drivers/regulator/axp20x-regulator.c          |   16 +-
> >  drivers/regulator/bcm590xx-regulator.c        |    8 +-
> >  drivers/regulator/bd70528-regulator.c         |    8 +-
> >  drivers/regulator/bd71828-regulator.c         |   10 +-
> >  drivers/regulator/bd718x7-regulator.c         |   26 +-
> >  drivers/regulator/da903x.c                    |    2 +-
> >  drivers/regulator/helpers.c                   |  130 +-
> >  drivers/regulator/hi6421-regulator.c          |    4 +-
> >  drivers/regulator/lochnagar-regulator.c       |    4 +-
> >  drivers/regulator/lp873x-regulator.c          |    4 +-
> >  drivers/regulator/lp87565-regulator.c         |    2 +-
> >  drivers/regulator/lp8788-buck.c               |    2 +-
> >  drivers/regulator/max77650-regulator.c        |    2 +-
> >  drivers/regulator/mcp16502.c                  |    4 +-
> >  drivers/regulator/mp8859.c                    |    2 +-
> >  drivers/regulator/mt6323-regulator.c          |    6 +-
> >  drivers/regulator/mt6358-regulator.c          |    8 +-
> >  drivers/regulator/mt6380-regulator.c          |    6 +-
> >  drivers/regulator/mt6397-regulator.c          |    6 +-
> >  drivers/regulator/palmas-regulator.c          |    4 +-
> >  drivers/regulator/qcom-rpmh-regulator.c       |    2 +-
> >  drivers/regulator/qcom_rpm-regulator.c        |   14 +-
> >  drivers/regulator/qcom_smd-regulator.c        |   70 +-
> >  drivers/regulator/rk808-regulator.c           |   10 +-
> >  drivers/regulator/s2mps11.c                   |   14 +-
> >  drivers/regulator/sky81452-regulator.c        |    2 +-
> >  drivers/regulator/stpmic1_regulator.c         |   18 +-
> >  drivers/regulator/tps65086-regulator.c        |   10 +-
> >  drivers/regulator/tps65217-regulator.c        |    4 +-
> >  drivers/regulator/tps65218-regulator.c        |    6 +-
> >  drivers/regulator/tps65912-regulator.c        |    4 +-
> >  drivers/regulator/twl-regulator.c             |    4 +-
> >  drivers/regulator/twl6030-regulator.c         |    2 +-
> >  drivers/regulator/wm831x-dcdc.c               |    2 +-
> >  drivers/regulator/wm831x-ldo.c                |    4 +-
> >  drivers/regulator/wm8350-regulator.c          |    2 +-
> >  drivers/regulator/wm8400-regulator.c          |    2 +-
> >  include/linux/linear_range.h                  |   48 +
> >  include/linux/power/bd99954-charger.h         | 1075
> > +++++++++++++++
> >  include/linux/power_supply.h                  |    4 +
> >  include/linux/regulator/driver.h              |   27 +-
> >  lib/Kconfig                                   |    3 +
> >  lib/Kconfig.debug                             |   11 +
> >  lib/Makefile                                  |    2 +
> >  lib/linear_ranges.c                           |  246 ++++
> >  lib/test_linear_ranges.c                      |  228 ++++
> >  62 files changed, 3236 insertions(+), 356 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/power/supply/rohm,bd99954.yaml
> >  create mode 100644 drivers/power/supply/bd99954-charger.c
> >  create mode 100644 include/linux/linear_range.h
> >  create mode 100644 include/linux/power/bd99954-charger.h
> >  create mode 100644 lib/linear_ranges.c
> >  create mode 100644 lib/test_linear_ranges.c
> > 
> > 

Best Regards
	Matti

> > 
> > 
> > --
> > Matti Vaittinen, Linux device drivers
> > ROHM Semiconductors, Finland SWDC
> > Kiviharjunlenkki 1E
> > 90220 OULU
> > FINLAND
> > 
> > ~~~ "I don't think so," said Rene Descartes. Just then he vanished
> > ~~~
> > Simon says - in Latin please.
> > ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> > Thanks to Simon Glass for the translation =]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
