Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDC2C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4xS7TIF+XXLZJY8et9sXi5qtbsGBFNo/Q6bOOQ4ntY=; b=31CHUWRe3QR1cC
	N5pZDLcuE2XCthkfqqYNBfTqvQGnxlParlh0xP0yQxf1/DQeoAP3Yt1IfuDG4IkcncFga0BQuGfS6
	Ih4PFkYvn3CQwJaA5JaXwyWhrzsp4sxDKCV3uzY99Fyc3rdEjnO5F72mtncoDWAEVpsVON39GpmwJ
	PR5LSMXHwOQkCOIjwmelxb5WA5/dVQc/812m1h8JPbRbJUeZ8zsgy702PuI83yF0kqvZP+22rOgsO
	9j47mcTuHSFFMvo8zmrGeDcnca9TL8/S2JBUXMfymf5a45MyoN1eVfPqyJOTuvNiMiPRHGtuoBdHW
	doO/eqlQ1cKMFKH/Hhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o02RG-00DPer-EC; Sat, 11 Jun 2022 14:50:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o02RC-00DPdk-MP; Sat, 11 Jun 2022 14:50:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A88AB80123;
	Sat, 11 Jun 2022 14:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC62CC34116;
	Sat, 11 Jun 2022 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654959004;
	bh=LX+rtX5P3mKqmVMa/tJgwQ4uwQTtTzZC0lJMO9c+uKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NozNRnZ9eVVMlh3i/YFnXyveVGFVoLy0j6zJGUcdi8rJ4t2MDdOBT4MXOdmzJVbc1
	 ZIKXXfLH89Q8gM33/AvmEkMy7rRJRm4wLuFmzjkNryddMmxJ0F2puXoi1DHkqKnEe7
	 BMw3tDXb1LdjCJv0ZwsNznU5FKt/MnWP7qW7wg4BxhiFAu9Kgcsl40fmseyFCTpUIr
	 irqOYi+V8FtnEYrtIDDJq5R6/OmDksOY9wgPTCNXsn8yQGMxmJq3ghGfhFOXEXv/SZ
	 8mQiUM2KswJhVPFAsaXxGO2zwsjGSn8/KxZl6/iv+Lc9WGRXVQ578HMjv3GoAbU3KS
	 d8lBUX9EjQXSA==
Date: Sat, 11 Jun 2022 15:59:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?UTF-8?B?U8Oh?= 
 <nuno.sa@analog.com>, dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Thara
 Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Zhang Rui
 <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
Message-ID: <20220611155902.2a5a7738@jic23-huawei>
In-Reply-To: <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-21-nuno.sa@analog.com>
	<CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
	<ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_075007_052164_907EE197 
X-CRM114-Status: GOOD (  34.55  )
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

CitDYyBNYXJrIEJyb3duIGZvciBhIHF1ZXJ5IG9uIG9yZGVyaW5nIGluIGRldmljZSB0cmVlIGJh
c2VkIFNQSSBzZXR1cC4KCk9uIEZyaSwgMTAgSnVuIDIwMjIgMjI6MDg6NDEgKzAyMDAKTnVubyBT
w6EgPG5vbmFtZS5udW5vQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIEZyaSwgMjAyMi0wNi0xMCBh
dCAxNjo1NiArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTAs
IDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6ICAK
PiA+ID4gCj4gPiA+ICdvZl9ub2RlX3B1dCgpJyBjYW4gcG90ZW50aWFsbHkgcmVsZWFzZSB0aGUg
bWVtb3J5IHBvaW50ZWQgdG8gYnkKPiA+ID4gJ2lpb3NwZWMubnAnIHdoaWNoIHdvdWxkIGxlYXZl
IHVzIHdpdGggYW4gaW52YWxpZCBwb2ludGVyIChhbmQgd2UKPiA+ID4gd291bGQKPiA+ID4gc3Rp
bGwgcGFzcyBpdCBpbiAnb2ZfeGxhdGUoKScpLiBBcyBzdWNoLCB3ZSBjYW4gb25seSByZWxlYXNl
IHRoZQo+ID4gPiBub2RlCj4gPiA+IGFmdGVyIHdlIGFyZSBkb25lIHdpdGggaXQuICAKPiA+IAo+
ID4gVGhlIHF1ZXN0aW9uIHlvdSBzaG91bGQgYW5zd2VyIGluIHRoZSBjb21taXQgbWVzc2FnZSBp
cyB0aGUKPiA+IGZvbGxvd2luZzoKPiA+ICJDYW4gYW4gT0Ygbm9kZSwgYXR0YWNoZWQgdG8gYSBz
dHJ1Y3QgZGV2aWNlLCBiZSBnb25lIGJlZm9yZSB0aGUKPiA+IGRldmljZSBpdHNlbGY/IiBJZiBp
dCBzbywgdGhlbiBwYXRjaCBpcyBnb29kLCBvdGhlcndpc2UgdGhlcmUgaXMgbm8KPiA+IHBvaW50
IGluIHRoaXMgcGF0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gICAKPiAKPiBZZWFoLCBJIG1p
Z2h0IGJlIHdyb25nIGJ1dCBmcm9tIGEgcXVpY2sgbG9vay4uLiB5ZXMsIEkgdGhpbmsgdGhlIG5v
ZGUKPiBjYW4gYmUgZ29uZSBiZWZvcmUgdGhlIGRldmljZS4gVGFrZSBhIGxvb2sgb24gdGhlIHNw
aSBvciBpMmMgb2Zfbm90aWZ5Cj4gaGFuZGxpbmcgYW5kIHlvdSBjYW4gc2VlIHRoYXQgdGhlIG5v
ZGVzIGFyZSBnZXQvcHV0IG9uIHRoZSBhZGQvcmVtb3ZlCj4gbm90aWZjYXRpb24uIE1lYW5pbmcg
dGhhdCB0aGUgbm9kZSBsaWZlc3BhbiBpcyBub3QgcmVhbGx5IGF0dGFjaGVkIHRvCj4gdGhlIGRl
dmljZSBsaWZlc3Bhbi4gSWYgaXQgd2FzLCBJIHdvdWxkIGV4cGVjdCB0byBzZWUgb2Zfbm9kZV9w
dXQoKSBvbgo+IHRoZSBkZXZpY2UgcmVsZWFzZSgpIGZ1bmN0aW9uLi4uCgpJIGhhZCBhIGxvb2sg
YXQgc3BpX29mX25vdGlmeSgpIGFuZCBpbmRlZWQgdmlhIHNwaV91bnJlZ2lzdGVyX2RldmljZSgp
CnRoZSBub2RlIGlzIHB1dCBqdXN0IGJlZm9yZSBkZXZpY2VfZGVsKCkgc28gSSBhZ3JlZSB0aGF0
IGF0IGZpcnN0IGdsYW5jZQppdCBzZWVtcyBsaWtlIHRoZXJlIG1heSBiZSBhIHJhY2UgdGhlcmUg
YWdhaW5zdCB0aGUgdXNlYWdlIGhlcmUuCk1hcmsgKCtDQykgb3V0IG9mIGludGVyZXN0IHdoeSBh
cmUgdGhlIG5vZGUgZ2V0cyBiZWZvcmUgdGhlIGRldmljZV9hZGQoKQppbiBzcGlfYWRkX2Rldmlj
ZSgpIGNhbGxlZCBmcm9tIG9mX3JlZ2lzdGVyX3NwaV9kZXZpY2UoKSBidXQgdGhlIG1hdGNoaW5n
Cm5vZGUgcHV0cyBiZWZvcmUgdGhlIGRldmljZV9kZWwoKSBpbiBzcGlfdW5yZWdpc3Rlcl9kZXZp
Y2UoKT8KU2VlbXMgbGlrZSBpbmNvbnNpc3RlbnQgb3JkZXJpbmcuLi4KCldoaWNoIGlzIG5vdCB0
byBzYXkgd2Ugc2hvdWxkbid0IGZpeCB0aGUgSUlPIHVzYWdlIGFzIHRoaXMgcGF0Y2ggZG9lcyEK
Cj4gCj4gQWdhaW4sIEkgbWlnaHQgYmUgd3JvbmcgYW5kIEkgYWRtaXQgSSB3YXMgbm90IHN1cmUg
YWJvdXQgaW5jbHVkaW5nIHRoaXMKPiBwYXRjaCBiZWNhdXNlIGl0J3MgYSB2ZXJ5IHVubGlrZWx5
IHNjZW5hcmlvIGV2ZW4gdGhvdWdoIEkgdGhpbmssIGluCj4gdGhlb3J5LCBhIHBvc3NpYmxlIG9u
ZS4KClRoZSBwYXRjaCBpcyBjdXJyZW50bHkgdmFsaWQgZXZlbiBpZiBpdCdzIG5vdCBhICdyZWFs
JyBidWcuCkdpdmVuIHdlIGFyZSBkb2luZyBhIHB1dCBvbiB0aGF0IGRldmljZV9ub2RlLCBpdCBt
YWtlcyBzZW5zZSBmb3IgdGhhdAp0byBvY2N1ciBhZnRlciB0aGUgbG9jYWwgdXNlIGhhcyBmaW5p
c2hlZCAtIHdlIHNob3VsZG4ndCBiZSByZWx5aW5nIG9uCndoYXQgaGFwcGVucyB0byBiZSB0aGUg
Y2FzZSBmb3IgbGlmZXRpbWVzIHRvZGF5LgoKTm93LCBJIGRpZCB3b25kZXIgaWYgYW55IGRyaXZl
cnMgYWN0dWFsbHkgdXNlIGl0IGluIHRoZWlyIHhsYXRlIGNhbGxiYWNrcy4KT25lIGRvZXMgZm9y
IGFuIGVycm9yIHByaW50LCBzbyB0aGlzIGlzIHBvdGVudGlhbGx5IHJlYWwgKGlmIHZlcnkgdW5s
aWtlbHkhKQoKVGhpcyBpc24ndCBhICdmaXgnIEknZCBleHBlY3QgdG8gcnVzaCBpbiwgb3IgbmVj
ZXNzYXJpbHkgYmFja3BvcnQgdG8gc3RhYmxlCmJ1dCBJIHRoaW5rIGl0J3MgYSB2YWxpZCBmaXgu
CgpQZXJoYXBzIGFkZCBhIGxpdHRsZSBtb3JlIGRldGFpbCB0byB0aGUgcGF0Y2ggZGVzY3JpcHRp
b24gZm9yIHYyLgoKVGhhbmtzLAoKSm9uYXRoYW4KCgo+IAo+IC0gTnVubyBTw6EKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
