Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6114C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 10:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E2E2072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 10:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NHwP87EB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E2E2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKtVHIdat9GEDpcL0om88XtjuavayeBT2H+cgfkP9tM=; b=NHwP87EBUx0Ht5
	qyv4hJ345ZRvqKwzxBvJppRh805lxa1iav1J0kkDcL3dGnWs9Ae7geAdQ0bzWAA++g50z/TTF+VSI
	HmK74ttyYfLv4axe3IPLdcPWa8M4vDyafGkMVF5jlK5Aq7es9T9dbFvZLdWXymbEXtggQpUlQ07f9
	RCnNLU1BDh++ObtK+ug2F/JB1aJo8OnI6UFHrgD0yss4KZqxDJtz5tyxFq/3wwibjhCJVVvrc2K1E
	bOVpfJQMewgi+wyRmFPjMu0diVSbKtYADIVMtH4Li1PASMfvOqjp/Xq6uilobctpH/Nylvg42Fguc
	L08j7wseKsXk/S1Za3KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOIY4-0003M9-P7; Tue, 14 Apr 2020 10:12:08 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOIY2-0003L0-Nl; Tue, 14 Apr 2020 10:12:08 +0000
X-AuditID: c0a8fbf4-473ff70000004419-ef-5e958c71640c
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 C2.CC.17433.17C859E5; Tue, 14 Apr 2020 12:12:01 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Tue, 14 Apr 2020 12:11:55 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v9 05/10] power: supply: bd70528: use linear ranges
Thread-Topic: [PATCH v9 05/10] power: supply: bd70528: use linear ranges
Thread-Index: AQHWEjNQTfvYVFoaLE6wmcOy1koGYKh4OV6AgAAK9QA=
Date: Tue, 14 Apr 2020 10:11:52 +0000
Message-ID: <2a3084ea1e7ec6a2328a2e79a31654e0cbb5c5b5.camel@fi.rohmeurope.com>
References: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
 <8dcf498134adb09d88bd16138cdce65e9ffa0bb6.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
 <20200414093243.GI34613@smile.fi.intel.com>
In-Reply-To: <20200414093243.GI34613@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <6417553A40A7734CAA6C938ED739F6BB@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxTH89x7215eulwKrs/qNLGJmy8TJNuHE2aY2T54nWTZ4pJlJhMu
 4442oy3rC5Htg40OB3U4UAila9GAnRU7q+XDBMWargmFAl2VMUYwC7Q6kAAGEGU63L2rCp+e
 k/P//8/vfDgPTSpmZCpaqzfzRj1XppamUjc8j/07vvq+8eDOc3fSwD3nJmEw/pgCR7+bghPz
 rSTUHmkiIOR8QMJlu08C89YhEhZdfRREArMUxEZOkdA4npDCUJUfwenQoASOtvmk4PRUwtOJ
 aQk0Vx+Gq9PtBESjl2SwNFRNQMOTcwT448MSqA8MyOBWl1MKt47GEPx49gcKFmpDCOzR6wRM
 hR4hcP8RI+DIt2+C0x0WxLmABFyLjSTMjDUJeHuUhKrukAxinkUCIlfN0F0VI6HDLzgCQ+9D
 51iYhOVglNi9g/W2eBG79OAkxc6NVMnYFu837KWJCxLWM5/Djo4dZjsdt2XsGb+F7fBsY48t
 V7CTXr+M9bfXSNmx4WtSdnZwUEj1fvQhPpC2q5gzV+zXlupz8ovSNOM1bUR5S8ahkz0RiRUl
 GBtKoTHzFr7z9xPKhlJpBTOMcO+VCUIUFEwYYVdngQ3RtJTZhW1/ysR2FrMP/zM7gkQ/ySQy
 8aOFE5QoZDJ7sGN+lkiaWDwd6H8WyMPxXt//HorZjH9PeKViLWc+wGP+AUkSfBPhkZoeUoSl
 MICdNzaIHsRswDXW5EySUWL/3YeS5NIMPnstSibrdXgqvvKsvwn/8vAiJY4hma3Y15WTjO7G
 t4/5ZMl6E244Pi5LrpCBe5sTVB162bGG4FhNO9akHWvSjjXpM0jSjrCO05aVcmY+N9vIW7KN
 Bo1OeD436Pwoeb6LV9DT4N4gImgURK/QhHqdPM/UeFDxUrGhpFLDmTSFRksZbwoiTJPqLLlP
 J2jyEq7ya95oeC6tpym1Uv76eP1nCkZkfcnz5bzxufoqTauxfNkmBDOMfCl/6AttmXlVJugU
 cXiqKsvE60t4I2cxawrF8yg0CfchSukCt+k7kWsq53RCNxntQ9vpuilXK0mHXO5WUkHpDXpe
 pZTvPy5YGdGqsehfgO4hJY3UmXIkqunCH34x556AIAREecEpEWHmViWVFRW98fP9i5GCFRQy
 b/mpvvbfyrte0748uwN9MpQ70Le3Jy882pF9MzRpj4cXfnNpizYXj/91nr7e1Z8eXNi+Z7mk
 ztrdFrDlTakmlhomP86I/XohNWIzbky8q56o/nTLTCdMb1Va8omKsoKpxOn5ndrLDRtXRpW2
 997Of823vvmd+2rKpOFyt5FGE/cfJ6IrMYAEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_031206_926949_614BA71E 
X-CRM114-Status: GOOD (  14.72  )
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
 "sre@kernel.org" <sre@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Andy,

I do agree with everything except perhaps the necessity of leading zero
in .min_sel initialization :) And I will fix these if I need to change
something else in these files. Thanks.

Best Regards,
    --Matti

On Tue, 2020-04-14 at 12:32 +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 11:04:21AM +0300, Matti Vaittinen wrote:
> > Change the bd70528 to use common linear_range code instead of
> > implementing a copy of it in this driver.
> 
> Couple of nits below which you can take as TODO items for the future.
> (Because maintainer is fine with it according to the tags)
> 
> ...
> 
> >  config CHARGER_BD70528
> >  	tristate "ROHM bd70528 charger driver"
> >  	depends on MFD_ROHM_BD70528
> > +	select LINEAR_RANGES
> >  	default n
> 
> At some point you can remove this kind of defaults (see [1] for the
> details).
> 
> ...
> 
> > +static const struct linear_range current_limit_ranges[] = {
> >  	{
> >  		.min = 5,
> >  		.step = 1,
> > -		.vals = 36,
> > -		.low_sel = 0,
> > +		.min_sel = 0,
> 
> Perhaps it's better to have it aligned with max_sel, i.e. be 0x00.
> Same applies to the rest of a such.
> 
> > +		.max_sel = 0x22,
> >  	},
> 
> ...
> 
> > +static const struct linear_range warm_charge_curr[] = {
> >  	{
> >  		.min = 10,
> >  		.step = 10,
> > -		.vals = 20,
> > -		.low_sel = 0,
> > +		.min_sel = 0,
> > +		.max_sel = 0x12
> 
> Perhaps leaving comma is a good thing to avoid potential churn in the
> future
> (if any of fields will be added here). Same applies to the reset of a
> such.
> 
> >  	},

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
