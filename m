Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03241C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mm6c9H897hNlD2OqiW+hnY+c2QueoDyPJLvC9dmY/Fs=; b=1J03Gr1zRO282c
	oiGYYFYX+U3YSQ+sc6c5V8IMyTuFCND2BzJ//fZpxpHaUD1wXmkAKsZYvD+XGS5oGT18SJMyScT+d
	82TrHx7oU/G6AW6PErvMgqK2tElpgmtrQ+gnPl4LAqMU/39CeCP3lQzCizBcLySquvyW4qe1qr4d4
	J3b2rJHa65vp5JMqq0oBOjtF4CvEq6cFv/TzoxJN5fDWc2Pqx7gsZPajhBOM9RlGhzq71sXve2omJ
	C2wcQoRsi0MgDP4+IyM5PNiWvBBzGto5+qGRvw0teSd9VRwi26ZHrBUMUsDbvuwdLiwIls4SkmYIb
	eAuiGsniLoP6pJHzBYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01lt-00DDEt-Mz; Sat, 11 Jun 2022 14:07:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01lo-00DDDr-Rg; Sat, 11 Jun 2022 14:07:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 537C8B816AD;
	Sat, 11 Jun 2022 14:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6736C34116;
	Sat, 11 Jun 2022 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956438;
	bh=sYrcnctOT1kg2rtUoj2m7nGi8WnuwpUPezuz5OO1NN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bbXSpdcwgal7gAnf16jULcsmRlfACXBw6a77ZvEr6NSlsLv+8lH4Yw73ue78Q7laW
	 1x5yo0RCc5QtnxdmW3e85EDzoCUuj1EM/CPL4UXXvN0gL7/o3gzK/BLN1gcY/2KMvt
	 +9rTVuTl2t+2wYPgXvmT+Jh482GId+ORxUmnhvhy9ArQJqsF5uUxR+hXwJLMyYjLG6
	 W/p4U5bCmJNubnlMpHySZnyO7oo2IqtsZ+KTMcIZXQL6OXcCZvpOdCg3rJlO1eFh0U
	 7Bnf5TWv+Mnf59isUCSVFHpCkbFmjMmtcFTFcdusioLsSrRcxByVGMRo8q8SAuLUf/
	 wj9VhvuX6sEcA==
Date: Sat, 11 Jun 2022 15:16:18 +0100
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
Subject: Re: [PATCH 12/34] iio: common: cros_ec_sensors: explicitly add
 proper header files
Message-ID: <20220611151618.10be5e3e@jic23-huawei>
In-Reply-To: <20220610084545.547700-13-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-13-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_070721_216497_08FBEA5D 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyMyArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQKCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNv
cnMvY3Jvc19lY19zZW5zb3JzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMv
Y3Jvc19lY19zZW5zb3JzLmMgYi9kcml2ZXJzL2lpby9jb21tb24vY3Jvc19lY19zZW5zb3JzL2Ny
b3NfZWNfc2Vuc29ycy5jCj4gaW5kZXggMzc2YTViMzAwMTBhLi42MWUwN2E3YmIxOTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9paW8vY29tbW9uL2Nyb3NfZWNfc2Vuc29ycy9jcm9zX2VjX3NlbnNv
cnMuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19lY19z
ZW5zb3JzLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaWlvL3RyaWdn
ZXJfY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lpby90cmlnZ2VyZWRfYnVmZmVyLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZp
Y2V0YWJsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kYXRhL2Nyb3NfZWNfY29tbWFuZHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RhdGEvY3Jvc19lY19wcm90by5oPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
