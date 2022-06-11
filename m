Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22998CCA480
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xm0IUMXYQoZ/xhIpA5UbhMYDeEnk028dG7y+JFTXYfU=; b=2sH6Ue4kJbYOYw
	LpSp06czKlI/W0AaGfO2NSXwsdrIIh8i0Z+KPDPikVeTrNlUmPOR4kpf3x7u2+zlK+u7TTlkuEala
	2EA5gnHrNCxXzicEzRoORkL629Z3cW7AYFMygyySbOmJSk+TX3DVtHxhOudwt7I/GU4cwEtwmgkT+
	mSRNR3/nvqyIbmBXz30OAq9oZ0cAxmzm82eqzUBBXEmeea1CBpVZEJ5I9p2UZvCmpRUKSOXH/iY8B
	tCJmbYLZrAANtF8ZV7pk9W541EZEa+RknNZBHkQBCpjKT/ALwvLveXjPC2+ZxgEZWnsBNGojVHquv
	jCsAIgHpSJ5iqaguR+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01VG-00D8xl-0w; Sat, 11 Jun 2022 13:50:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01VC-00D8vz-QB; Sat, 11 Jun 2022 13:50:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2298660F16;
	Sat, 11 Jun 2022 13:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49FDC34116;
	Sat, 11 Jun 2022 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955407;
	bh=axWYZgHjU+vWL39otfQyFw7n1cGND5pHaeO608w9aDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kXEFWai8vIb/IcKUCUsY5h6FQ5HgBYwoNoO6x0MjQtdX9+M+TxIqv68GybTf+JOgW
	 q/rV4SV3/m1/STeXQ+UhMBbZQgylp8pVkzRVphpH0I9ytGjY804Yv+Hfj7kFzrY8FN
	 dQ5Bsv9xQ4YGPIVB0zHbP6oKxuv28f0GR5JQljdn7j5Hm/k4wwQwu/0bq5LIzb7kGO
	 qiRF8DBvDKq57IzKjPeCW9Uc/oQWQ/I3eyGpG4r9iA19/4Xzgt4xaW5KPrZqH+YdYX
	 CvRdaHxByHiYYFDF3o0LpHQcmqIK+hK/B8HUt9XKFV7g3A47bKyk80WnlHX4RfshFk
	 IyGi7XrE4Zc2A==
Date: Sat, 11 Jun 2022 14:59:05 +0100
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
Subject: Re: [PATCH 01/34] iio: adc: ad7606: explicitly add proper header
 files
Message-ID: <20220611145905.55e9b074@jic23-huawei>
In-Reply-To: <20220610084545.547700-2-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-2-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065010_958038_5DE3EF41 
X-CRM114-Status: GOOD (  16.75  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToxMiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkhpIE51bm8sCgpOb3Qgc3VyZSBob3cgZmFyIEknbGwgZ2V0IHRocm91Z2ggdGhlIHNl
cmllcywgYnV0IHRvIHRyeSBhbmQKcmVkdWNlIHRoZSBub2lzZSAvIHRyYWZmaWMgZm9yIGFueSBm
dXR1cmUgdmVyc2lvbnMgSSdtIGdvaW5nIHRvCnBpY2sgdXAgYXMgbWFueSBvZiB0aGVzZSBwcmVj
dXJzb3IgcGF0Y2hlcyBhcyBwb3NzaWJsZS4KCkFwcGxpZWQgdG8gdGhlIHRvZ3JlZyBicmFuY2gg
b2YgaWlvLmdpdCAod2hpY2gganVzdCBnb3QgcmViYXNlZApvbiB2NS4xOS1yYzEpIGFuZCBwdXNo
ZWQgb3V0IGFzIHRlc3RpbmcgZm9yIDAtZGF5IHRvIHRha2UgYSBxdWljawpsb29rIGFuZCBzZWUg
aWYgd2UgbWlzc2VkIGFueXRoaW5nLgoKVGhhbmtzLAoKSm9uYXRoYW4KCgo+IC0tLQo+ICBkcml2
ZXJzL2lpby9hZGMvYWQ3NjA2LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hZDc2MDYuYyBiL2RyaXZlcnMv
aWlvL2FkYy9hZDc2MDYuYwo+IGluZGV4IDNiMTkzZGMyNjQzOC4uYmEyNGY5OTUyM2UwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9hZDc2MDYuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2Fk
Yy9hZDc2MDYuYwo+IEBAIC0xMiw2ICsxMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+ICAjaW5j
bHVkZSA8bGludXgvc2xhYi5oPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
