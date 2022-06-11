Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7545C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Snlbh8yxUDk9qJbjuc5tA/jRIVwyxcaHIpH2jLEpxo=; b=fqz80+dGZ9kK3I
	1GvAPtpQXiYI7vEIoeQjZ3GBgAYCJs8cRzkQikVEm52FR42LSqW1ocjmHcGwZhLJv+EecMpRKh8+G
	JlJLfCvmbgioH/L9LPVNXAfE4CUYufaxIGelv/kUjX1HDiwmTDxAn1s8VUGol287EHQ8p+4+arIkj
	xw6DRVTW+nQAA2Vdnrnxg0NW+rcMdTDz1mzmf1CF3vGQ/LnZ8fsLIp1DydY2cdSPlc+ZEu2xT/UUM
	mzQ9OpXy6w+SfRl0QmiTEfCnJV7d1+LPjR44xsRHYZKBwMnPoAUJ/dNSVNCNyG2uaQ91kwMrjgO63
	bX1t8JRZ9nDE/udEPCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01oc-00DDiB-Gd; Sat, 11 Jun 2022 14:10:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01oZ-00DDhS-PC; Sat, 11 Jun 2022 14:10:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 376F160F30;
	Sat, 11 Jun 2022 14:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FFAC34116;
	Sat, 11 Jun 2022 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956610;
	bh=lIxJ3iJVM+1p7CtplUeJSv9W5eDu2M7fwRokuvhwC4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dtQ5fTpbGGAyoh5JcVae0m8IhNrijJxO79uHxDsYGXPOBNCOLHeYK5EqRI4RSdPMZ
	 dSjcEppeh8XDwmPNd9cfChgrlLjm+xCEkaemXLNf3KaA9MYMRwDh9hJMq6asx3CFoZ
	 v0ju5Vk0Vwm9RDX4JYzBNT45l/qHJOKsQVIlQ4W41ierKjQu6HUeft4eC2Z2PCRoVP
	 nG0sSUmZopFMR5w1GnIly7xOexoTJ+7y0f1wHQKPtRY1c8go5oTZBiubaQlN77tplr
	 WOzyVUWsVn3h5gRK4aINYcqlOvyNoXIV41Swcd7l9znGA36nrrYBKcVULE90UjS4E6
	 gan5PLmqtrofQ==
Date: Sat, 11 Jun 2022 15:19:09 +0100
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
Subject: Re: [PATCH 14/34] iio: dac: vf610_dac: explicitly add proper header
 files
Message-ID: <20220611151909.76f55ea2@jic23-huawei>
In-Reply-To: <20220610084545.547700-15-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-15-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_071011_935583_30D28109 
X-CRM114-Status: GOOD (  13.64  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyNSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCgo+IC0tLQo+ICBkcml2ZXJzL2lpby9kYWMvdmY2MTBfZGFjLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMuYyBiL2RyaXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMuYwo+
IGluZGV4IDkyNDI5YzBkMjY4NS4uZmMxODIyNTBjNjIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aWlvL2RhYy92ZjYxMF9kYWMuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMuYwo+
IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3JlZ3VsYXRvci9jb25zdW1lci5oPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
