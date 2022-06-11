Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFF5C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9DEepEEyG1Plg1LXAtCB1xx3Etm7pri3wEnSusItrA=; b=ZjIcJ0XKxBpyGt
	65BuLt48sUSSWAZjADp5JbRCNRn7z+OchEQIi9N3sQkIDE4IwdY3hzImc2zXby4WgNkB1ZONHXH2B
	1Noocau3PIi7To3hw6pzPYsR7G5kkBHgK6jY/1Z1Mnu0y+fKHnW6qAG+8ty/7itAOdSS8lYNS6o/U
	V5+kc/XjtsjJvnQ+4nATUqlm+a3+GNj6UNqgKBWp28xUSelbbyymL9u9OhlyhCQJwbXEmZqCFbvjL
	lVsGkbbY55i0GYZ/bNah9y4I/CC27hiCPb2RiH32z0ON6p4quYHCYKDJY/3/1GR5QtaGSRKrn2/eS
	JppfDv51/xUlRzJd62ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01bG-00DAho-9o; Sat, 11 Jun 2022 13:56:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01bD-00DAgZ-BS; Sat, 11 Jun 2022 13:56:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85B15B816A6;
	Sat, 11 Jun 2022 13:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C20C34116;
	Sat, 11 Jun 2022 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955780;
	bh=HUk1m8Z7oVZABVRvChpbtgGXc/rMJfPU7EhN5cXmHIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YYrIasQQPKZmBdeZ81lpElWH+f0O2IRR/8TQ/RBg2D4IO2YvRf3nJMbmAU2eTdz/j
	 0ScfRNxS6zvjlrl0S3/0gBWZdd0FHx2QFjDdaLQpYTf8xKQqZt2te5beKW5IAJfTJU
	 OR5YNdTVaUc52KwA+7ATdQr6fs1jdzt56CB5yZq4xSrZs//8CHoNZLV4J5/DvhDMq1
	 xVCoP8/rXaFUMLeuSVKMSa12CqdcfmcsN7QFGCMUWgeDRrBdfuMN4ckEXAA0F8kbJN
	 Yycb6j8L49HtO6mIRfT2PulCHDYJPo0A0zbf4qraVImvotCJjb8ibAWj5nqkwmyl1C
	 +e+uhBdbVtYAA==
Date: Sat, 11 Jun 2022 15:05:18 +0100
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
Subject: Re: [PATCH 05/34] iio: adc: imx8qxp-adc: explicitly add proper
 header files
Message-ID: <20220611150518.695d1dd5@jic23-huawei>
In-Reply-To: <20220610084545.547700-6-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-6-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065623_733018_B4836B06 
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToxNiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCgo+IC0tLQo+ICBkcml2ZXJzL2lpby9hZGMvaW14OHF4cC1hZGMuYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9paW8vYWRjL2lteDhxeHAtYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvaW14OHF4cC1h
ZGMuYwo+IGluZGV4IDkwMWRkOGUxYjMyZi4uZThjOWE2OWUxMGViIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaWlvL2FkYy9pbXg4cXhwLWFkYy5jCj4gKysrIGIvZHJpdmVycy9paW8vYWRjL2lteDhx
eHAtYWRjLmMKPiBAQCAtMTksNiArMTksNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
