Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6Tt/YrGgVV6wxhPW/+xHUORmEH34kE8cOZAKQXZmtg=; b=FvIjfjcIbcG2Qy
	OGfyveTjFoRZt0BpEupW1XgJ+3Nt/+lX3DQ9vDUsRaIwHaWDiy3++PxypRfwdz0Xvm/g3nim5tbT9
	ASnC5Ho2zdVT7T8fvmKmuj+3Atxk/yLOzq3TkMnoWcwRXnO4DLczTRSsxSH5wESo+w7Epfq7sCQxq
	O2qE4Vo7gDxw1WcmoGZtjYPqZl8FMnklbnsrMyw1WXmpxMvY+IT29dGBYMmOJBWX2e1kJAKrHFx08
	fSw7X21+Y+EBqIHX0npPscUoP0KWlIGe4vXwZGgnkhxuY6TURuFrRqIuVdoYaGRP+XdzHJjzq2EK/
	jQpgGNRAm80MRo4bd/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01zQ-00DHXc-Na; Sat, 11 Jun 2022 14:21:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01zN-00DHW3-01; Sat, 11 Jun 2022 14:21:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54E41B816A6;
	Sat, 11 Jun 2022 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454F6C34116;
	Sat, 11 Jun 2022 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654957277;
	bh=lfyWxTdm+9DA2o5Gv4TMOK79YAUDNtuhApIhJjT70sc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oCVbMFgyFX6oFH9u3+7f5Hm4+q5RYHvp3rgC4dsE0IEQZXvrtnPlXfQnAAnejz0xR
	 lkmxE/CIR1fCuZZ1eU3ZYl5amkKuaOVsuPrh6pXb2TtzM4ufNY7k1LT1YVEAZ0QUc9
	 8kFKGWJz6+JPx7xwmpXMHQ0suVKcRhwqQiando1XDqH+x4ErQgXo+eWTv7qOtiS2Kk
	 7sEjS2O1A+ImNtfVji8lSkOMnMR/LIKBCWMg10V5/81/grKwvV8ar0Y3R0FBH7igf4
	 Hx1sU60YSsy+PE4LPbaCFaBA840/DS4NcKtTAOlTrHnPRvu+fg3VnT5Fr7aAFuXBk8
	 iv+MSeL9C6Jnw==
Date: Sat, 11 Jun 2022 15:30:15 +0100
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
Subject: Re: [PATCH 19/34] iio: core: drop of.h from iio.h
Message-ID: <20220611153016.2f91d7e5@jic23-huawei>
In-Reply-To: <20220610084545.547700-20-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-20-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_072121_575265_2B52B575 
X-CRM114-Status: GOOD (  18.29  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NTozMCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGluY2x1ZGUgT0YgYXMgd2Ug
b25seSBuZWVkIHRvIGZvcndhcmQgZGVjbGFyZQo+ICdvZl9waGFuZGxlX2FyZ3MnLiBQcmV2aW91
c2x5LCBzb21lIGRyaXZlcnMgd2VyZSBhY3R1YWxseSByZWx5aW5nIG9uCj4gdGhpcyBmb3Igc29t
ZSBoZWFkZXJzICh0aG9zZSB3ZXJlIGFscmVhZHkgZml4ZWQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ClRoaXMgb25lIGRlc2VydmVzIGEgJ3dvb3Qn
IDopCgpJIHdvdWxkIGhhdmUgZ3Vlc3NlZCB3ZSB3ZXJlIG11Y2ggZnVydGhlciBvZmYgYmVpbmcg
YWJsZSB0byBkbyB0aGlzCnRoYW4gdGhlIDE4IHBhdGNoZXMgZWFybGllciBpbiB0aGlzIHNlcmll
cy4gR29vZCB3b3JrIGZyb20gQW5keQphbmQgeW91cnNlbGYgdG8gZ2V0IHRvIHRoZSBwb2ludCB3
aGVyZSB0aGlzIHdhcyBwb3NzaWJsZS4KCkFwcGxpZWQgdG8gdGhlIHRvZ3JlZyBicmFuY2ggb2Yg
aWlvLmdpdCBhbmQgcHVzaGVkIG91dCBhcyB0ZXN0aW5nIGZvcgowLWRheSB0byB0YWtlIGEgbG9v
ay4gIEknbSBwcm9iYWJseSBnb2luZyB0byByZXZpZXcgdGhlIHJlbWFpbmRlciwgYnV0CmxlYXZl
IG9uIGxpc3QgYSBiaXQgbG9uZ2VyIGFzIHRoZXkgYXJlIG1vcmUgY29tcGxleC9jb250cm92ZXJz
aWFsIHRoYW4KdGhpcyBpbmNsdWRlcyBjbGVhbnVwLgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gLS0t
Cj4gIGluY2x1ZGUvbGludXgvaWlvL2lpby5oIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2lpby9paW8uaCBiL2luY2x1ZGUvbGludXgvaWlvL2lpby5oCj4gaW5kZXggNGUyMWE4MmIz
NzU2Li5kOWI0YTljYTlhMGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9paW8vaWlvLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L2lpby9paW8uaAo+IEBAIC0xMSwxMyArMTEsMTQgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L2NkZXYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2lpby90eXBlcy5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgLyog
SUlPIFRPRE8gTElTVCAqLwo+ICAvKgo+ICAgKiBQcm92aWRlIG1lYW5zIG9mIGFkanVzdGluZyB0
aW1lciBhY2N1cmFjeS4KPiAgICogQ3VycmVudGx5IGFzc3VtZXMgbmFubyBzZWNvbmRzLgo+ICAg
Ki8KPiAgCj4gK3N0cnVjdCBvZl9waGFuZGxlX2FyZ3M7Cj4gKwo+ICBlbnVtIGlpb19zaGFyZWRf
Ynkgewo+ICAJSUlPX1NFUEFSQVRFLAo+ICAJSUlPX1NIQVJFRF9CWV9UWVBFLAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
