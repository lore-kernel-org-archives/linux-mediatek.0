Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598BDC2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 05:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A5E2075E
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 05:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCgFBvxP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A5E2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1h08JQdFCwACm29Emln4EUNWncnQ+Sym2yLT2Z/gdnI=; b=vCgFBvxPuk4kJW
	q263cTILiqI3fOYaFrRdWX0JEBdHaHob0sWj2qhVzV3q7nc4JIcQmhNv8rQsyVN4hTkV+ucyqg83l
	+wP1oFfCU0zb1LPiVS+unmbN7Ryp6eqV2GxnB9T+robpt6/uRHyReJKKng82FpmKcHLPH2lhI9cl4
	tABB4MXnA+w77Eqtvgah1XmziVTh3FJNbImDpYZiSoMyZPXXfu9eWAW3jozzQ4/Pf6UwyX0rRuinn
	sRyWVrwD869KYgDqAnz8aIeWOq2fifScS0MSoMwOmMh/e+ZbNW6HtIBMvIW8AIpAMvxyEkFH/Vsa5
	T6v7m9Ki11Qw2F0vb57g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLKDD-0000v1-Qn; Mon, 06 Apr 2020 05:22:19 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLKDB-0000uT-Jg; Mon, 06 Apr 2020 05:22:19 +0000
X-AuditID: c0a8fbf4-473ff70000004419-05-5e8abc8449a5
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 56.0C.17433.48CBA8E5; Mon,  6 Apr 2020 07:22:12 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0487.000; Mon, 6 Apr 2020 07:22:01 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v8 00/10] Support ROHM BD99954 charger IC
Thread-Topic: [PATCH v8 00/10] Support ROHM BD99954 charger IC
Thread-Index: AQHWCZNurrjQpdjIqkyw5OgYXk7rkqhpv5SAgAGyYgA=
Date: Mon, 6 Apr 2020 05:22:00 +0000
Message-ID: <3a2d1fc2e8fe7cd69d976eb2e5cacb5ea9af1916.camel@fi.rohmeurope.com>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <20200405032727.m3jz3r5age6iyqz5@earth.universe>
In-Reply-To: <20200405032727.m3jz3r5age6iyqz5@earth.universe>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <6B7C636C9441CD46B8C2A18D8B2B8860@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxiG9573tOeAdBwLjtfuI9oYN1mQmW3JE0GDyTbP/IFb9mGyZLAj
 HCmhLaQtBtwPmdopNSBuKNABI6yNDetEDokUxGFqo845CpEhLmUJwtgAhY0PGR/KzqFT+HXu
 PPd9P9f74zks1t5ndGy22SZazIJRr46kr3gWmhKOtTvSXvvCsxncE24MnYMLNDhvuWkonazH
 UHKkgoJA9QyGpspGFUwW9WCYrrlJw88d4zR0932N4czAkBp67BKCbwOdKjj6XaMaqj2FsHRv
 TAVVJw7DpbEGCoLBCww87DlBQfniOQqkwV4VnO74hYHbbdVquH20G8E3rlM0TJUEEFQGf6Rg
 JPAvAvedbgqOHHsdqt03ZHOiQwU102cwPAhVyPjKIAb75QAD3Z5pCvrHUuGyvRtDsyQnOnr2
 QGvoBoY5f5BKSeC9tV7EP5z5iuYn+uwMX+v9nPf1uxB/4d73Kt4zmcj/FjrMtzr7Gb5Oyueb
 PfH8l3MH+b+8EsNLDcVqPtTbrubHOzuZ99Z/siZ5v2A7+EF2ljlx52drDL6uTiqvlCtwDEq4
 CPVFO1AES7g3iN81ihwoktVyvYj8XlNBKYaWu46I8/5HDsSyai6ZOO4yiozldpOqcl6JY84R
 S3xDvy7HY7gdZLz5LFZ0LLeT2P+eUofz28njAK2MaW4Tqbx6Sq1oDZdKHkheFCYVkH+K/lyu
 RshrpNJhRtGIe5EUF40vr8dcHJGGZ1XhJ3PE1R7EYb2OjAw+/n++kbTMnqcVLOa2kMa2xHA1
 hYw3OlVhvZGUnxxgwk9YS36qGqLL0HPOVQTnStu5qu1c1XauatchVQMiJiHbmCXYxG1bLWL+
 VkuuwSR/MnJNEgpf77QPLfnf9SOKRX60nqX06zTJPkea9tn9uZmFBsFqSLfkG0WrHxEW62M1
 upLiNK0mUyg8JFpyn1jPs7Q+TvPywOlPtZzCyhHFPNHyxH2BZfVEU9wmL11rEbPEggPZRtuK
 TbERyvJIXaxVNGeKFiHfZkhXjiPdKl+HYkXJ3LEWua6x5gkmeRqu3kSvsmUjNfWYDdS467GW
 NueaRV2cRlBInBI15JufgkZRHIv0MZqMS7IbJf/CT/eMyghKRqjNxxWETVixdEXIta8Ju5pt
 muikq4/2dp3sejRj0rfPnQuV/3DIPj/TsiiMLuQkVJuMF1MXP45qvbJhcH4PdW3+QM/bd2Z3
 Hb+enm59KaOq7JXdMYt3L569dv6dUF/tUrTAJ6nsxg059jrdH0m+vdvtmfHDm72G93FS+b4d
 U5tSdn24xbvw1q03nxkSk/S01SBsi8cWq/Af3VuYiX8EAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_222217_801469_2630D287 
X-CRM114-Status: GOOD (  11.87  )
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
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "rafael@kernel.org" <rafael@kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "kholk11@gmail.com" <kholk11@gmail.com>,
 "hsin-hsiung.wang@mediatek.com" <hsin-hsiung.wang@mediatek.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "axel.lin@ingics.com" <axel.lin@ingics.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "m.reichl@fivetechno.de" <m.reichl@fivetechno.de>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "andreas@kemnade.info" <andreas@kemnade.info>,
 "agross@kernel.org" <agross@kernel.org>, "Laine,
 Markus" <Markus.Laine@fi.rohmeurope.com>,
 "Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "baolin.wang@linaro.org" <baolin.wang@linaro.org>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Sebastian,

On Sun, 2020-04-05 at 05:27 +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Apr 03, 2020 at 11:36:17AM +0300, Matti Vaittinen wrote:
> > Matti Vaittinen (10):
> >   dt-bindings: battery: add new battery parameters
> >   dt_bindings: ROHM BD99954 Charger
> >   lib: add linear ranges helpers
> >   lib/test_linear_ranges: add a test for the 'linear_ranges'
> >   power: supply: bd70528: rename linear_range to avoid collision
> >   regulator: use linear_ranges helper
> >   power: supply: bd70528: use linear ranges
> >   power: supply: add battery parameters
> >   power: supply: Support ROHM bd99954 charger
> >   power: supply: Fix Kconfig help text indentiation
> 
> Can you please rebase the series, so that it is ordered with the
> linear ranges and regulator patches in the beginning? That way
> Mark can take the first three patches through the regulator tree
> and provide an immutable branch to me without requiring all of
> the power-supply specific patches. E.g. like this:

I can and will do rebasing on top of 5.7-rc1 anyways :)

But the
power: supply: bd70528: rename linear_range to avoid collision 

should probably come before
regulator: use linear_ranges helper

because the BD70528 is MFD device and regulator headers get included
via BD70528 MFD headers.

What is the best ordering for the patches? Or would Mark also take the 
power: supply: bd70528: rename linear_range to avoid collision ?

Best Regards
	Matti Vaittinen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
