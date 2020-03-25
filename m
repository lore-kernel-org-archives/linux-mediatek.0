Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AD8C1975A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 06:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7914120409
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 06:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBHjl1TT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7914120409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6/kWF7OUeV0zKv0VCx3sSWF5HBPgH2zba7FAd2jKdk=; b=eBHjl1TTBNgStr
	m8zYr/TuOTUvBo6W5v1k/xO+sL8yvNBqFqyuhCYyr4I+hIxeDL+hrUGeZqr215yLWxQr9WYu3bku/
	owNYHQ4sWdUIMDzk8pEkoo3b/OFrz/5fbnCHam2JJkFtM5q49AXzPU5QrChHRFLCQkJP6Iw9g717W
	8lJ5FnLkPzoAQT4ESDETP+nUwB95uuHH0WCJ0oueUFKNEQMPIDk/puQ5r5AOpk740r2i7SR2XoEHI
	MEO9G7Q7E3UCKrIWdffHF1NSzZi9SKAQTBlCvC/FxpZ/Mib/inZnrdCS7e61nuLh6tZD7vH0JJxZq
	No3y2wGIS/kYJdQUyfBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH00L-0001FI-St; Wed, 25 Mar 2020 06:59:09 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH00J-0001Eh-3q; Wed, 25 Mar 2020 06:59:08 +0000
X-AuditID: c0a8fbf4-489ff70000004419-72-5e7b0136ed0b
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 57.40.17433.6310B7E5; Wed, 25 Mar 2020 07:59:02 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Wed, 25 Mar 2020 07:58:57 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Topic: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Index: AQHWAbaPCcyAOxMqz0a76vzAO0GO3KhXu6iAgAEV4AA=
Date: Wed, 25 Mar 2020 06:58:56 +0000
Message-ID: <739a01454410a5d7acf231c92e5b3ffcae49d84c.camel@fi.rohmeurope.com>
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <20200324142427.GF7039@sirena.org.uk>
In-Reply-To: <20200324142427.GF7039@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <76E1510E2BB1084A8A4D42991D5A8097@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUZRjG/c5tD8jmccH4xO3CzliDjZLVNO+EOuZfJ7KycWymmqAlTuyO
 7EJ7iUtjEUKTMMZFcWllw9nlshkDy6LS0iK2kRGWy+qm4lANIhY0QsIqAgGdw6rw13nO9zzP
 +3v/+D6WVDjZOFarNwkGvTpTxURSZ5yz7o3Po49Snu73xsP5oVkKalqaGPhiwk7CwUILASPl
 PyCYDo0jmKs8K4PW6hYaQrZeCs51jVFQUZYAgSuHSKgavM5Aa+AnAoLFbgSWqj4ENf4iCnpa
 XRTUdp+n4W6wkoL9jhYGSkeV4Pe7ZHAn+DkBh/9rJMA9dImGiq5fZXCxo4aBi/sDCI7WlVEw
 ebAbQbX/NAH1lwMEFBY9CzX1PRQ4Gp+AxplmClxtUwRMjnfRsDB0mwZbqIqEmwMWCgLVfhKK
 O7tlEHCGCOi0NNBw7jsTdBYHSDhi65RBm1vMdgWT4fLEVTEwP03BtM8vqj8mEZy9NY22A198
 YY7hm75qQvzsTCXi79yupPjxK8Uy3nXtG5o/8XU/wTsnEnmP9XcZf+rMev6Y28y3OTfwDu8I
 wbuPH2D4ygY7zQ9c8jK7Hntr5ZY0tenD3doMfeK2d1dqPvM4ieySyFxH3whRgP6OKEERLOae
 wwvOBroERbIK7jeEh10/ovBPD8LBk17RYVmG24JL+mVSIYbbiKtmHIyUIbnxWByqC1GSEc29
 iK2HhohwaAcubPmHDOsXcNAzS0ua4tbj4e9tixk59yo+Pea5R/4F4VOWzkVCBPcMrv3TsqgR
 9wg+UDC2WCC5WOy+MUWH1+ZwnddPhvUaPDI0f+88HrdPNVPS0iSXgFs6EsPV7bjbWcSEdTw+
 XDooC++wGv/85XWqHD1sXUawLrWty9rWZW3rsvYxRB9HWKfWZmaoTcLmTQbBvMmQpdGJn/ey
 dG4Uvvmhb9GC7yUfIljkQ2tZQrVGbg/lpygeSstKz9OojZpUgzlTMPoQZklVjLxNyE1RyNPV
 efmCIeu+tY6lVLHyJwcr3lFwEmuvIGQLhvuukmVVWN48Jw5dbRAyhNz3tZmmJZtgI6ThkXEx
 RkGfLhjUZpMmVbogqUbxhkhWlMg9uSDW5cZstU48DVd70VNs+YjNTrLdtno7qaD0WXohLlY+
 J0U5Kaox6x+ARlEsi1TR8jzJjRKf/4M5oyKCEBEZ1hwJYVIvWXEF6PGjr8GupngmJ1pGrKJt
 6Tfefvlafcj1b9knyg/KPEkLwx/HFNQpo67e9e5V7r6QlJsU4LU5q9a2DfiiV8z3RJVsfQPH
 3VoXwf+1r6Ova1upXZM92J4vKHN1e5DqUU9hWlPHK1zCp70325PffN1Rm1O2Yuu+I4U7IovM
 e05oJ3c2JKsoo0a9eQNpMKr/Bya5VVy7BAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_235907_316233_F1361A3A 
X-CRM114-Status: GOOD (  11.51  )
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
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>, "Mutanen, 
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
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
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
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

Hello Mark,

Thank you for looking at this :)

On Tue, 2020-03-24 at 14:24 +0000, Mark Brown wrote:
> On Tue, Mar 24, 2020 at 10:30:54AM +0200, Matti Vaittinen wrote:
> 
> >  
> > -		if (!(min_uV <= linear_max_uV && max_uV >= range-
> > >min_uV))
> > +		ret = linear_range_get_selector_high(range, min_uV,
> > &sel,
> > +						     &found);
> > +		if (ret)
> >  			continue;
> 
> Why are these going for _get_selector_high()?  Usually we try to
> choose
> the lowest voltage we can.

I tried to maintain the existing logic - which is (if I am not
mistaken) to search for first value which is equal or higher than the
minimum. Hence we use the linear_range_get_selector_high() - which does
not return selector for voltage smaller than given value (minimum).

I don't see a problem here but I am often blind to my own errors - so
please elaborate if you still think this is not correct :)

Best Regards
    Matti
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
