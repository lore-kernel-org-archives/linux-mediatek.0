Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837E1C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BKDM+NP3BH1pb1SXh2LpKjDtpv/m8p45WRJ1Qr7A8E=; b=TZZgE2OVL499ZD
	KXfl3DxA3fqPsMutPJgtsCYnxvE3xBexkOBcHd/JlwbLFhScsL8FMJ2fyySEknYudhtzUhEhW+9xS
	9LxKGwo+xUzhwjLEtKNBhxkKiT8FecVKQeVmfo1Hfcc+bPoqtuyQJkIkBydUN5J1wzV8G57+uw7ro
	j5c7+IXe2NQ9iJ+b20C2h0bSVa5BOJsDfNo/R8jzip+KUH4H5E0VPfLw66qBP4IZDWssA4fxM26BK
	dt82t8+kcFsuNpaV4XveLGF/B5Wa1m27TLCTuy43Mf2QFgQfWkiM0W/NNxmK8N0urawgjPtX8CImG
	ckHGeXHWdsUVgZhZiHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01Yi-00D9tZ-HS; Sat, 11 Jun 2022 13:53:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01Yf-00D9se-4t; Sat, 11 Jun 2022 13:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 149A3CE092F;
	Sat, 11 Jun 2022 13:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACFDC34116;
	Sat, 11 Jun 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955621;
	bh=wC+dRUleca+nkr3JnnArr3KV7sMFZJzv4Kf01ViW4FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SRI6ng1Q5/Z2oZCRMlIRFoa2A9NPEtvGK+heaKY9Ps//MWXEHwiT4Wnb4XXT0iqQm
	 9Nb4WXWJDKSZN5sPHJiXYyNTP/5iqIv1XS3MYmIZB/76cjlRiSg1z6GTG6NgpQtn/w
	 J5uADVuqiz/t3JNA9EWob2ccwierMscWmd+VQGI5T94QqIf0uyST4gb7YywuIdYJqe
	 YWThqM3/kMOLem9/Muid/F3CsgFrNgXVmqXKACIs7VquiTKP0qOtWH2zgk/J+4TmZ7
	 1yAy8mzvDuh9NKepKcHn1m3WYqOKPuKnIbTWS5TgA1hD1m0Gin8TZL+F5e92B2FX0C
	 63uPLcQHDgNaw==
Date: Sat, 11 Jun 2022 15:02:40 +0100
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
Subject: Re: [PATCH 03/34] iio: adc: berlin2-adc: explicitly add proper
 header files
Message-ID: <20220611150240.57136279@jic23-huawei>
In-Reply-To: <20220610084545.547700-4-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-4-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065345_584180_8E4420D7 
X-CRM114-Status: GOOD (  14.37  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToxNCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCgpUaGFua3MsCgo+IC0tLQo+ICBkcml2ZXJzL2lpby9hZGMvYmVybGlu
Mi1hZGMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYyBiL2RyaXZlcnMvaWlvL2Fk
Yy9iZXJsaW4yLWFkYy5jCj4gaW5kZXggMDM5ODdkN2U2YjNkLi4zZDJlOGI0ZGI2MWEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL2JlcmxpbjItYWRjLmMKPiArKysgYi9kcml2ZXJzL2lp
by9hZGMvYmVybGluMi1hZGMuYwo+IEBAIC0xNSw3ICsxNSw5IEBACj4gICNpbmNsdWRlIDxsaW51
eC9paW8vbWFjaGluZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+
ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
