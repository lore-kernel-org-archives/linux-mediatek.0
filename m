Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j65MecM1T3+Fuq1ayGYFUGIxBxEgWGJwApt7LMl4cSc=; b=aD1r6i8lZxiDmv
	17gtiXYmlHTIGr1gy86r2F6ttVlcjp0gjCMX9604fiT0KwM+G8RZqoumrqsW/02miZOhvK+Jt5TMm
	8dezQrozbCM1LbK9F4mU9u21AFpWGSnFSeIBMCME3wCtYhwQ26lS9E/1xVEVYTotaUP12+P5yAYP9
	9FCJkAVJa8GTOa06SbT91rJUxUYXE6RAPiH1YmIOILKeqyPwykSnb3RW4HD3XqrQc7ImvIzBL7pQn
	QOP9PekjimeKgiolJyth2YgYYOCejtu2P6vwwMXIrFZM5ZRKvYAXqrUf7I9z7F62+Pd4HYuv4TGMi
	CQpXJ7pOFlkX/mqk3P4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01X5-00D9Uz-4S; Sat, 11 Jun 2022 13:52:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01Wy-00D9Sn-PE; Sat, 11 Jun 2022 13:52:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 546A060F14;
	Sat, 11 Jun 2022 13:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF57C34116;
	Sat, 11 Jun 2022 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955519;
	bh=mG9PRa/hoJU++oy2/1rOsVQjjCa+upUYtaTD+8dvzg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s0iPw9d6lhJbgaK9lLIA2OIuxQ4bl+kSAbcG0kXZDcOSUpfApg/txQldMZuYY/Q1V
	 CsqTR8iiLvTD1/+sjmf4qUb46LDL/dW+Apejlsbhs2rVCnllqOFk1AvCdRYhx+u2xz
	 584swGpqE/bG+WSc/NoyUne2IfjfyqSDh2j1QqcdQDdTotd3NVUuXfNlO6OOYeAh7d
	 Fiq78NgFxij99miG9rX+kTdenvERnOyR8G0oc2FtjoXu7ytR4Ylkzmp26mhWXKn8BF
	 Y+qZYkwNlBEpGjY7XZf+qjIeuzennmJD9NgaQh4lQRgUN3w9EsLFHRM1/QJRAN216q
	 7N9TFuuJ+en6A==
Date: Sat, 11 Jun 2022 15:00:58 +0100
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
 Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit
 Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture
 <venture@google.com>, Arnd Bergmann <arnd@arndb.de>, Nancy Yuen
 <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Thara Gopinath <thara.gopinath@linaro.org>, Avi
 Fishman <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 02/34] iio: adc: ad7606_par: explicitly add proper
 header files
Message-ID: <20220611150058.11cfc344@jic23-huawei>
In-Reply-To: <20220610084545.547700-3-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-3-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065200_935280_83C2E0B3 
X-CRM114-Status: GOOD (  14.59  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToxMyArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQKCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy9hZDc2MDZfcGFyLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2FkYy9hZDc2MDZfcGFyLmMgYi9kcml2ZXJzL2lpby9hZGMvYWQ3NjA2X3Bhci5j
Cj4gaW5kZXggODg4OGU1NmI1ZTkwLi5iOTEyYjRkZjliNTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9paW8vYWRjL2FkNzYwNl9wYXIuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9hZDc2MDZfcGFy
LmMKPiBAQCAtNSw2ICs1LDcgQEAKPiAgICogQ29weXJpZ2h0IDIwMTEgQW5hbG9nIERldmljZXMg
SW5jLgo+ICAgKi8KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
