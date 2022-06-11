Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D63C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5uCnjySxS38v/hdsxz3STdQPqHSHCoHhSODefPcmLc=; b=yKHpVp0DmJ7jhH
	AbE1N9fgZbxBxvJCQx+xO0hgdEUdyMf8DogRKXJjpyVNLUY1Ll+KUuG5FBdoRxIH+GUdbOHQE6t37
	U6TORmm+J+671JhgpX+NpyUZsH+F454bY0Ul1bXaDayp7ye/GEUGkNgjuuxwYLpz/IVu6rgh/tmIe
	DtDkfZeLqwer4F54HY+PoE5uD/AFmi/mjuhmO9ZGRRsc9O7FQZcPKSVTRtEaA3Dds5rBPx/+jrnIv
	oBAAWauj+3hzA9zzsiTdtXtT1ULSTYdKXhZo4D9uRKm6c5l/e/QF6KZfJarVOovY5fGCj/STTm9tT
	m2xkud3zryrEUaV4j9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01nF-00DDUC-0n; Sat, 11 Jun 2022 14:08:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01nB-00DDTK-Rp; Sat, 11 Jun 2022 14:08:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F52F60F2F;
	Sat, 11 Jun 2022 14:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CAEC34116;
	Sat, 11 Jun 2022 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956524;
	bh=Q7uH/mCGyoXGFFwms09+N94nX0bdHOZzM/yZaIfh6Ek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mZj2i59NBcNyLK9USNCmcc1bzITeUpD3QKgVzEY4jDQIz3WyWb6loWFtj2/B4PMnV
	 Q2NnH0i0Eelnp6LRaQ89gn6nnMVd8wNTmcqIFfRtwMucJpn6Cp9yrVjEOXo8baKh9b
	 t1ECjO/F1j4lQ5dz216APLJEvHRTQkGFrYNxLWvlieRy7+mmPVhnp/wOiaoGoMHQI1
	 OlsPe3saDNO9pHRjsqt8/u/8bos4Ws3iejxRgUWDoqpx3cPpXi/V7eBfh4kleZI9CB
	 T+Z1QKjXbYYgWAgjJVB+VG7qiuKScjMZdk+FcBTpA5wbP03GYVXNg5QJrq0SgrSa/O
	 XkUC1hJaP07FQ==
Date: Sat, 11 Jun 2022 15:17:43 +0100
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
Subject: Re: [PATCH 13/34] iio: dac: stm32-dac: explicitly add proper header
 files
Message-ID: <20220611151743.25da39e2@jic23-huawei>
In-Reply-To: <20220610084545.547700-14-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-14-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_070846_013208_55DEF556 
X-CRM114-Status: GOOD (  14.07  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyNCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQKCj4gLS0tCj4gIGRyaXZlcnMvaWlvL2RhYy9zdG0zMi1kYWMuYyB8IDIg
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMgYi9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMK
PiBpbmRleCBkYWE0MmJjYmFlODMuLjBkZTFiMDliOTJmNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2lpby9kYWMvc3RtMzItZGFjLmMKPiArKysgYi9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMK
PiBAQCAtMTIsNiArMTIsOCBAQAo+ICAjaW5jbHVkZSA8bGludXgvaWlvL2lpby5oPgo+ICAjaW5j
bHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cG1fcnVudGltZS5oPgo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
