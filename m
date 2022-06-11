Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21541C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HOHDNeKXQqVAAuY0JbeaEWFdtwx/iblv2cVOje8qtU=; b=PuKkIj6O6rIERo
	BmLh8xI9Aphf0ably4jaSaMX931Ddc+SosFDCdd0quU13Ff35JC0ygpTTJlJvD7sWIOV9Vuq7Cdqs
	G3PNs4k8VtF0sz/xgzjY6Cwjr5bXodRk8jR2gno2Wt/LTyygR5RZicj2JtvctWzYIfI7rp1Seo8sg
	V7BQgaBMdI6Wcot7pUCHC3vtTGbYVqXA8J3XsnkrVKZL88m1fgZtcLvtxjzKhHCn9Lfr+5zxd+3z6
	j61mxTPyRGcPRgC8fccUA+Cz+Gpl6CQXnmtOpx+eha/LgBorIgbiLrGUBvJYjtxBQG1lR98MCsOoh
	rQczG88AlqyKmjs6JrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01ru-00DELS-Hu; Sat, 11 Jun 2022 14:13:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01ri-00DEFu-N0; Sat, 11 Jun 2022 14:13:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54048B816AD;
	Sat, 11 Jun 2022 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A775DC34116;
	Sat, 11 Jun 2022 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956804;
	bh=nyZvL91oFCb9bthQSadgYmYYNFgPdHqKzIod7PSvXoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C2tuo46TtbrdY2D19m2dgc8qWZXkB9kD9XOOUf+g2P6r7or/YShlN3zfieoRbi1Vk
	 mRI7PO6xQMBBZDFZ33JtIn/6IVQn/VTxVQXaJO1ADbDwlQfv3ugfoK+SZ2wWPnkBEe
	 NQN0YnkPwxplxSwb5TPXK7nCa4EcaM5XEQsCru/WIGnRxSEQ5MOC6fJr8zRFIfBTyu
	 tLwN+T41I7UHRhABICFeESgCC5Pk7w7sag45jDCofg7ENDt7w2JsMMV2UnrL0YRNvo
	 0EPVDiII3hAp7sPmFQsLP0zYudeuY2ortQ78I2x55E+QAmRNr9FxfNDMWR9mLxN2JJ
	 ED2zAMUfpL0uQ==
Date: Sat, 11 Jun 2022 15:22:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, dl-linux-imx
 <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 15/34] iio: humidity: hts221_buffer: explicitly add
 proper header files
Message-ID: <20220611152222.43ab685e@jic23-huawei>
In-Reply-To: <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-16-nuno.sa@analog.com>
	<CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_071327_104244_147872C1 
X-CRM114-Status: GOOD (  15.81  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxNjo0NzoxNiArMDIwMApBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCAx
MDo0NyBBTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZToKPiA+Cj4gPiBEbyBu
b3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRlcyBvZi5oIHdoaWNoIGluIHR1cm4g
aW5jbHVkZXMKPiA+IGFsbCB0aGUgaGVhZGVycyB3ZSBhcmUgcmVseWluZyBvbi4KPiA+Cj4gPiBU
aGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmggZnJvbSBpaW8uaC4gIAo+
IAo+IC4uLgo+IAo+ID4gICNpbmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+ICAKPiAKPiBZZXMsIEkgc2VlLCBidXQgeW91IGNh
biBtYWtlIGxpZmUgZWFzaWVyIGlmIHlvdSB0cnkgdG8gc3F1ZWV6ZSB0byB0aGUKPiBtb3N0IHNv
cnRlZCBwYXJ0LiBJIGRvIG5vdCBzZWUgZnVsbCBjb250ZXh0LCBidXQgaGVyZSBJIHdvdWxkIHB1
dCBpdAo+IGJlZm9yZSByZWdtYXAuaC4KPiAKV2l0aCBmdWxsIGNvbnRleHQgaXQncyBjbGVhciB0
aGUgbGlzdCBpcyB3YXkgb2ZmIHNvcnRlZCwgYnV0IG1laApwdXR0aW5nIGl0IGFib3ZlIHJlZ21h
cCBwcm9iYWJseSByZWR1Y2VzIHRoZSBmb2xsb3cgdXAgZGlmZiBhIHRpbnkKYml0IGFuZCBJIGRv
dWJ0IE51bm8gZmVlbHMgc3Ryb25nbHkgYWJvdXQgdGhpcyBzbyBJIHdlbnQgd2l0aAp3aGF0IEFu
ZHkgc3VnZ2VzdGVkIGFzIGEgdHdlYWsgd2hpbHN0IGFwcGx5aW5nLgoKQXBwbGllZAoKVGhhbmtz
LAoKSm9uYXRoYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
