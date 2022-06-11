Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJzAPxMN2deXTLl8i5J7arDhcyn/BaLtld6aoy7aC30=; b=nKdWq07T1y7tmX
	aaWYILKT8FT1Qd8Q0NGdGFAg00427TqqcPqTX68PKo9wZRr5OpK83Il5GKn8LN2NsrhGOgUufWg2Z
	GJZf0o+Mz0+tp03wgCsMtPeXhJwRCs+JNlel/e0TV0JcWCUNqkC/6qIW1+rJ7H7yYGXHUkyrN+nqw
	gtt+gk2R6XjqEU+SIP35xQWENrOhmwyYU2eZ8StfAwSvfzeyx246gpIpQAsMnGyD6Ygv4LJ4BVkPV
	VNGNllhqnNxlwjAl4StyjPKkoswfRnGWnwnsGrR7dKLeym1imnLCU5NC5oaI54n691sLJbLhpYGsV
	Vv/4OIbeaJyg2ex3kN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01cy-00DBDu-Um; Sat, 11 Jun 2022 13:58:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01cu-00DBCS-Td; Sat, 11 Jun 2022 13:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C141B816AD;
	Sat, 11 Jun 2022 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FBCC34116;
	Sat, 11 Jun 2022 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955886;
	bh=nbFGh7icD9NslwLu6nhPgTSnek+SfmmZhWf7P+5Ny8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UmWdJYYOx2uNSGz9CgyVRZf7Iz8aVNIzGSC+5v8ilWDX/MiVq9rr2PzYv+k3kImhk
	 Dg5bxisg5HqmdOnOt0QDuNZzApXfOV3p8J8lXL2QeCV9gRUr0WYP6WuoiC2yG/ZiKO
	 xAJyZy93UG7Fy8bPXIowGrSbP/94Q6I6rKv0j4m2XyeThYt9nLnZnVNt2IgdcBbOs9
	 KCQ8Bt5th2zh1s0z3uYp3ec3Aq8Nwj4nkJVqhdZn64UEwVhx2n0FhfXD4fQT/JL3VF
	 OYtYVjzewS2i7BQdTpjtQwQZFDuPtaXZxyLIvSzdC8hFjiN/x/20m2kW+u9Cl8U94A
	 rMLdoTWEooFcg==
Date: Sat, 11 Jun 2022 15:07:04 +0100
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 06/34] iio: adc: ingenic-adc: explicitly add proper
 header files
Message-ID: <20220611150704.483ccccd@jic23-huawei>
In-Reply-To: <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-7-nuno.sa@analog.com>
	<CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
	<a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_065809_285469_0D8AB291 
X-CRM114-Status: GOOD (  15.48  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAyMTo0OToyMiArMDIwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjQ1ICswMjAwLCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCAxMDo0NiBB
TSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZTogIAo+ID4gPiAKPiA+ID4gRG8g
bm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVkZXMgb2YuaCB3aGljaCBpbiB0dXJu
Cj4gPiA+IGluY2x1ZGVzCj4gPiA+IGFsbCB0aGUgaGVhZGVycyB3ZSBhcmUgcmVseWluZyBvbi4K
PiA+ID4gCj4gPiA+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2YuaCBm
cm9tIGlpby5oLiAgCj4gPiAKPiA+IC4uLgo+ID4gICAKPiA+ID4gwqAjaW5jbHVkZSA8bGludXgv
bW9kX2RldmljZXRhYmxlLmg+Cj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gPiA+
IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L3Byb3BlcnR5Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4gIAo+ID4gCj4gPiBP
cmRlcmluZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3NlZCB1cCBhbHJl
YWR5KQo+ID4gICAKPiAKPiBXaWxsIGRvdWJsZSBjaGVjayBvbiB2Mi4uLgoKRml4ZWQgdXAgd2hp
bHN0IGFwcGx5aW5nLi4uCgo+IAo+IC0gTnVubyBTw6EKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
