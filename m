Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6FFC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql2fIFCUGBwDoEusR5Xqs9Y1BN1nDfOwyGmb62kP5/U=; b=GnbBYXB1rtCfLz
	e0SCHgVXkeH6yCq2RChqrDm22LhwDQ3KYxcXGz3OB1y7wbtVxsm4alxCfX975Y7YyFfjnkLhrIGR3
	FEOWFQ8LpSv6wqlum9oN5EwQIsdfqwXWwmjF40gBsqSFdG1zFVygZB5V4mLFNDV7zGJtTZymaW2u2
	cEwo4I//3HHtY8Df7S1FuqCFUewysPsxfUsondso1wxsES9kJ9TEqHGMD/JZlmNM89+J8CmhwckRy
	7qWiroHnQv+UEYnULUG2hTeWG6OY+O1Ibf27ju9gmyGmNa73x3POUcbjwRTUHnyUNTmGxAlRZ5bCp
	kJ5Bx0JTWKjfWtFWSN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01Zx-00DAL4-Rp; Sat, 11 Jun 2022 13:55:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01Zu-00DAJg-M9; Sat, 11 Jun 2022 13:55:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A50ED60F29;
	Sat, 11 Jun 2022 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2793C34116;
	Sat, 11 Jun 2022 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955701;
	bh=E5mI7o1cs//oFirqI8X6UXHtswkBDQ5E09lOKGSge4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wk2TDbXGLR90Vb3xiKGQ+OTvyWQ+gs5bNkxwDY1K04lXiBlXF5t40jk3aO/Saezwf
	 tMJHrQLZn5tuC9ATAQuMRM1Vf9gcxOIcKdTofr8UBty4GFI9k5NjSfwbEPqiPLPHmV
	 luhVSoHiDSWhMSiEU9K2G6QNkW0H+/DN40VmwlEVowLv/aLwm55NfKtkcCb4k0cghq
	 XoiqIcR/uq89IEEPrczKcMr3Gx1ebIIOUEPhgYRmHqWN6rnchhLLNuqTilTbEOHxox
	 gFsgF54vAtkU66fc7MCBCTuiBPjAflO1K/wkTabARQJnfe9Lokp9B24EdZ5xA00sZw
	 hGJBGTlBmRmEA==
Date: Sat, 11 Jun 2022 15:04:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, Benjamin
 Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit
 Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture
 <venture@google.com>, Arnd Bergmann <arnd@arndb.de>, Nancy Yuen
 <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, "Gwendal Grignou" <gwendal@chromium.org>,
 Saravanan Sekar <sravanhome@gmail.com>, "Tali Perry"
 <tali.perry1@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul
 Cercueil <paul@crapouillou.net>, Thara Gopinath
 <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, "Olivier Moysan" <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 04/34] iio: adc: imx7d_adc: explicitly add proper header
 files
Message-ID: <20220611150400.6dc79369@jic23-huawei>
In-Reply-To: <20220610084545.547700-5-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-5-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065502_843529_B1B936FF 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToxNSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy9pbXg3ZF9hZGMuYyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9paW8vYWRjL2lteDdkX2FkYy5jIGIvZHJpdmVycy9paW8vYWRjL2lteDdkX2FkYy5jCj4g
aW5kZXggMTJmNWI4ZTM0Yzg0Li4xMTkyMTdhZjJiZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
aW8vYWRjL2lteDdkX2FkYy5jCj4gKysrIGIvZHJpdmVycy9paW8vYWRjL2lteDdkX2FkYy5jCj4g
QEAgLTExLDYgKzExLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5j
bHVkZSA8bGludXgvaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cmVndWxhdG9yL2NvbnN1bWVyLmg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
