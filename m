Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ACDC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038622063A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QakKlc/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038622063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QN4kdSSxzPtYNhQjRiopSpERtRgYLGMfmbdQnKJpoEc=; b=QakKlc/1wng1Jt
	mS/Fe2+Gyx7Up7+PerX3SqxxQSIMT0BjA4oNIM0U6bkDPxRSqTnFJ1IF6IbWoBJlyXIozGuug2C3i
	dHlzIaLOrpVsC+4CqHw2Sns1iojOqNfLkACl2dIIpPRvflsZEMbU8kojmsIUZiweQiYq6rkH6vHZe
	8Mt2pKqhUvmUEyXRjHWXRNX97Vwd9vG67ty4znhJWI+UNoDSs1owc+AA+yHDHT60R/xgIcdNqbKnF
	Fpb7psaivVwABF1m723fkidB1Z+3hJlQtFU/0d72sr3iQvbySkWz7Ppbxk7ldMc3Qz4vren2Jchmu
	q/HwrGqdOYVFOA9ADUbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLOXL-0005vI-D3; Mon, 06 Apr 2020 09:59:23 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLOXI-0005uZ-Lk; Mon, 06 Apr 2020 09:59:22 +0000
X-AuditID: c0a8fbf4-473ff70000004419-d0-5e8afd75cde5
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 27.3D.17433.57DFA8E5; Mon,  6 Apr 2020 11:59:17 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0487.000; Mon, 6 Apr 2020 11:59:05 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v8 09/10] power: supply: Support ROHM bd99954 charger
Thread-Topic: [PATCH v8 09/10] power: supply: Support ROHM bd99954 charger
Thread-Index: AQHWCZSbKj2cmrJL+U+GBPNSQgTBAqhpvjOAgAIBK4A=
Date: Mon, 6 Apr 2020 09:59:04 +0000
Message-ID: <334ae92d62a32675bc18f331c9981e169e33e5e0.camel@fi.rohmeurope.com>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <10b40f9bca727e790d891f6442a879bfeca68624.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <20200405032233.btlwo5wvzmrrw65k@earth.universe>
In-Reply-To: <20200405032233.btlwo5wvzmrrw65k@earth.universe>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <6785965BAD2C094A829E9DBBECE6AE2E@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUwTZxzPc3ftHehtZ8XxULclNDOoG6CRuH8Wt5jMzZMoIyFxycxgxzha
 MmhJX4xsWSAqU0pA0IJQCyNIZ0UEKdGhQzGkCS9DOiby4toPvGQT2CBjgAgydken8On5Pf/f
 2/Ph/zCk6k9azaTpzaJRL6RrlMHUfddSY6Rl2Zq4q8GrBOe0k4Se0SUK7N1OCgpnqkkoOHmR
 AI9jjoTGsgYFzOT0kTBb0UXBz61TFPQOXiChZHhMCX25bgTfe3oUcOpygxIcrixYGZlUQPnZ
 bPhpspYAr/cGDfN9ZwmwPb9CgHu0XwHFrQ9oeHjHoYSHp3oRXKo5R8E/BR4EZd57BIx7FhA4
 B3oJOHl6DzicHRI53aqAitkSEv7yXZTqy7wk5N710NDrmiXAPxkHd3N7SWhyS4rWvli47esg
 4Vmbl9gfyddV1iF+fu48xU8P5tJ8Zd03fLO/BvE3Rq4peNdMNP/Yl83ftvtpvspt4ZtcO/nv
 nh3nn9S5ad5dm6fkff0tSn6qp4eOD/tsw75kwXw8IU2rj/7giw06Z/68ItOBT3jODRM5qDvU
 ioIYzMVgj99PW1Ewo+L6Eb7W94AIXNoRXiyclhiGUXL7sHVoFYZwB3G5jZclJGcNwc1jjwh5
 vpk7hG1/GAOSWGzrOijHh3DvYVvneULGFPcWHqwpJWUJy8XhujxtoGgA4SZ/MS1rgrj3cf2F
 9lWMuDdwXs7UqpfkQrH796eKwJM5XNPiJQN4Cx4f/ff/eTj+8Wk9JeeT3A7ccCc6YN2Pf/NV
 0gEcjm35w6uY5TbhzvIxqgi9Zl/XYF9z29e57evc9nXuKqSoRThDSEvXCmZxd5RRtEQZDboM
 6fjSkOFGge2dbUYrbYfaEMGgNhTGEJotbMkTa6LqlWRDSpZOMOmSjJZ00dSGMENqQlh1QV6i
 ik0Rsr4WjYYX1FaG0oSyEcPFn6s4uesrUcwUjS/Y1xlGg9nmJSl0k1HUiidS09LNazTBBMnh
 weoQk6hPEY2CxaxLkpcjySRth0xtlHpNi5KdNWUKGdI0YO1CbzNF4xXVJOOpcFaTKkpv0Ivq
 UPbN55KUk6U6i/5l0QQKZZBmM5stv2Oj9IVf5kxIFYRUodSfkSvMwhqlzkFV9Z27oqYmRtJi
 mhpHtiYh7aOFiANHt+mv3tt7xT9w89OuqyX5qR2lmbFTo77Cv8/YEzKOXdoedjNmqJVdiDR1
 F7WrPy69PlYfv3RkuWWx9LI/anvcragfEva+azlyeujAh5OfRBQN7Pnol3dSV8LjH1+/n334
 Vd2vy8mDsKPC+e2xW2hOQ5l0wu6dpNEk/AeeDufYfwQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_025920_862385_54F34B03 
X-CRM114-Status: GOOD (  16.59  )
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


On Sun, 2020-04-05 at 05:22 +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Apr 03, 2020 at 11:48:05AM +0300, Matti Vaittinen wrote:
> > The ROHM BD99954 is a Battery Management LSI for 1-4 cell Lithium-
> > Ion
> > secondary battery intended to be used in space-constraint equipment
> > such
> > as Low profile Notebook PC, Tablets and other applications. BD99954
> > provides a Dual-source Battery Charger, two port BC1.2 detection
> > and a
> > Battery Monitor.
> > 
> > Support ROHM BD99954 Charger IC.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > 
> > No changes since v7
> 
> Thanks, the drivers looks mostly good to me, I found some minor
> things. Please fix before sending the next (and hopefully final)
> revision.

I will :) Thanks for all the effort when doing the review. Much
appreciated! And I'll rebase and send the next version after v5.7-rc1
gets tagged. I'll fix these at that version.

> 
> >  drivers/power/supply/Kconfig           |    9 +
> >  drivers/power/supply/Makefile          |    1 +
> >  drivers/power/supply/bd99954-charger.c | 1149
> > ++++++++++++++++++++++++
> >  include/linux/power/bd99954-charger.h  | 1075
> > ++++++++++++++++++++++
> 
> Please move this header to drivers/power/supply/, the public
> include directory is only needed for platform_data and MFD.
> 
 
Makes sense.

> > +	dev_info(bd->dev, "Found DB99954 chip rev %d\n", bd->chip_rev);
> 
> DB -> BD?

Right. Well spotted :)

> > +
> > +static int bd9995x_remove(struct i2c_client *client)
> > +{
> > +	int ret;
> > +	struct bd9995x_device *bd = i2c_get_clientdata(client);
> > +
> > +	disable_irq(client->irq);
> > +
> > +	/*
> > +	 * Reset all registers to default values. This should also
> > disable
> > +	 * CHG_EN bit. If this is not required we can get rid of the
> > remove.
> > +	 */
> > +	ret = bd9995x_chip_reset(bd);
> 
> You can register this using devm_add_action_or_reset() before the
> devm_request_threaded_irq() call in probe and get rid of the remove
> function :)

Yep! That was a good point! I think I had never used
devm_add_action_or_reset() - this is a handy thing for my toolbox! :)

Best Regards
	Matti Vaittinen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
