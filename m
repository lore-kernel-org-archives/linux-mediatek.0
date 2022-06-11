Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB713C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKjHsc+mqX0H4hv6j3crZEyaxMVr5NV05uF4ThMac4M=; b=aFDyiFmqMwQdTw
	kDVo7KdS2oS5wEIzhuew62TO9pN1lh5SCRUdQrAEQkuv2UrO4FrxyxTkBEbdInI24CQLWb1I310Fi
	ATyXX8aLbVJz+y6UAMwZR/FG+0KsFJCPT5M7CBwXbiGOfCMGKQTAduSQBOIxu79T7Mw7q/wsuydlW
	3Xq0pRtHqbQFaA47C8Vg/nO8X64zZ4qT9fa4pnNoeUobCu7zRb+E5XejUxqUUPePZcZESKo9w0vK7
	YyPKzXI88eZ0sLG7d3Z5h7wU5GLn0/TfIuDGzdCM6+a7IWd8G1aV/KOiiDy2xPgvrfHv/jN0/aGpe
	VsbGhBwi2vZGt5xU0sGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01ut-00DFw5-4N; Sat, 11 Jun 2022 14:16:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01sr-00DEw9-AN; Sat, 11 Jun 2022 14:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 00040B80B78;
	Sat, 11 Jun 2022 14:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F2CC3411B;
	Sat, 11 Jun 2022 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956874;
	bh=ZKyellprd64RtYJKSOQfzM4bD9hHJfuJJpfQL2HMihY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ikpsyenPeJKaBTv55xRDJbGWaBhqbW/eqk1CpAqsvzPNg66kKAjj6YxofQnOLQmXM
	 0g7pGHTElpAs/zwZAy8zDOTCEOJSl+WNBNkOhINpOqr+uSeriZeQ0/IvQu2i+aWHPY
	 qYEEOq9WHShueiogHB608ePY0hoDPOYdjHT6V61ISvVOYOnxWJB919YSpT5HBP1u4M
	 isTxwCN28IRZ61N84vBUEvvM2gJUk4rw5GPFqAtGr4lwJyyL/pMHUee8mFi8SnbmdZ
	 nQLmL3jmAegETqYYhO0IkEo2kFPSxz7XDjUiPqgvW1itemdTo8FFKQeGLeJaQxJatg
	 AxXEuI1HnXnVg==
Date: Sat, 11 Jun 2022 15:23:33 +0100
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
Subject: Re: [PATCH 16/34] iio: light: cros_ec_light_prox: explicitly add
 proper header files
Message-ID: <20220611152333.0a954361@jic23-huawei>
In-Reply-To: <20220610084545.547700-17-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-17-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_071437_682767_023F246E 
X-CRM114-Status: GOOD (  13.80  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyNyArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQKClRoYW5rcywKCkoKCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2xpZ2h0L2Ny
b3NfZWNfbGlnaHRfcHJveC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC9jcm9zX2VjX2xpZ2h0X3Byb3gu
YyBiL2RyaXZlcnMvaWlvL2xpZ2h0L2Nyb3NfZWNfbGlnaHRfcHJveC5jCj4gaW5kZXggYTAwYThi
M2I4NmNmLi5lMzQ1ZTBmNzFiNzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvY3Jv
c19lY19saWdodF9wcm94LmMKPiArKysgYi9kcml2ZXJzL2lpby9saWdodC9jcm9zX2VjX2xpZ2h0
X3Byb3guYwo+IEBAIC0xNCw2ICsxNCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9paW8vdHJpZ2dl
cmVkX2J1ZmZlci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaWlvL3RyaWdnZXJfY29uc3VtZXIuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kX2Rldmlj
ZXRhYmxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RhdGEvY3Jvc19lY19jb21tYW5kcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGF0YS9jcm9zX2VjX3Byb3RvLmg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
