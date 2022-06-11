Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8frhk8xmaMSCnBaL+iRiMYS/hA0WJ+Elq7mKX2EPGA0=; b=aD1dOJ1TiMQNFo
	r0JcvJCf/nMdLNFsDiahZrExxpga8w0i/ZWZUqhECoeen3jy0mlHmA1wJQyse1wv8BMzSluLJZEcx
	k0qoUlRGylib0IwfNUWNhnTSiu69A1cA6MkZwpQ7yPCG9SvQTyWa3IC3t0vlOqmjjaSGRmQSYHcdB
	HvkiIAzqQVFnybxQOaOjDUpFVe6ceuacJJoGKRr4NPHZU22vVMXlie8jYPtpMYaU9C1aQiqh7XVKm
	7VcE/bviDcBD8ZUbiH6uBpttkosC+zevYCIFfspizdsESr+Uc5CxVo82TRGkHi+vq1CIArHAQMsB5
	SoGlqZqXl8iGT29syHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o02id-00DUj7-Qd; Sat, 11 Jun 2022 15:08:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o02ia-00DUi8-2U; Sat, 11 Jun 2022 15:08:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3953861001;
	Sat, 11 Jun 2022 15:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43331C34116;
	Sat, 11 Jun 2022 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654960082;
	bh=EKJoSxvZYNzgGAFmHi7iG2ynvSq/HPXxuHetTKr9pBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HhAeJlE9d10Rja9kdwI4GCHTGlTiTq7oU7PaoamRWAGpdIt+QuvcIlGnBezmOYYP2
	 pEHqdmxBs/DvwlzV6jGI6snaGa/BWHb+sgeKfMGta2ne1iyLKEgLAsrQ2ooxkvEx4b
	 fjX6mazu1WcOiDuKllQ012dJktz+He5+Av7oQqRBqlnCmhE9WyCETz0AH2tkBtKvmw
	 RZtcI6/3EvhhE6ooGI2zs6kzEWBlh0Omkf1NkdNGomu3nOxcQQGD/RRGfbi/nACeLh
	 a99U2nK3JUkuZiF1tNbUsMpOhmC0ROFpxQ+e/LRCdItjmnT5ZHi+Qhwaw53ogkD3ki
	 OIZ1e2fgNr16A==
Date: Sat, 11 Jun 2022 16:17:01 +0100
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
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
Message-ID: <20220611161701.46a68837@jic23-huawei>
In-Reply-To: <20220610084545.547700-23-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-23-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_080804_235575_2D602C64 
X-CRM114-Status: GOOD (  31.38  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NTozMyArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gQVBJcyBsaWtlIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkg
YW5kIG9mX2lpb19jaGFubmVsX2dldF9hbGwoKSB3ZXJlCj4gcmV0dXJuaW5nIGEgbWl4IG9mIE5V
TEwgYW5kIGVycm9yIHBvaW50ZXJzIGJlaW5nIE5VTEwgdGhlIHdheSB0bwoKcG9pbnRlcnMgd2l0
aCBOVUxMIGJlaW5nIHRoZSB3YXkgdG8uLi4KCj4gIm5vdGlmeSIgdGhhdCB3ZSBzaG91bGQgZG8g
YSAic3lzdGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBUaGlzIG1ha2UKPiBpdCB2ZXJ5IGNvbmZ1
c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFzIGNvbW1pdCBkYmJjY2Y3YzIwYmYKPiAoImlpbzog
aW5rZXJuOiBmaXggcmV0dXJuIHZhbHVlIGluIGRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25h
bWUoKSIpCj4gcHJvdmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMgbGlrZSAnaWYgKGNoYW5u
ZWwgIT0gTlVMTCkgcmV0dXJuIGNoYW5uZWwnCj4gd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5u
ZWwgY291bGQgYWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+IG1ha2VzIHRoZSBjb2Rl
IGhhcmQgdG8gcmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lpby9pbmtlcm4uYyB8IDI0ICsrKysrKysrKysrLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9p
aW8vaW5rZXJuLmMKPiBpbmRleCA4N2ZkMmEwZDQ0ZjIuLjMxZDljMTIyMTk5YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4g
QEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgc3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hh
bm5lbF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50IGluZGV4KQo+ICBzdHJ1Y3QgaWlv
X2NoYW5uZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCj4gIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gIHsKPiAtCXN0cnVjdCBpaW9f
Y2hhbm5lbCAqY2hhbiA9IE5VTEw7Cj4gKwlzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW47Cj4gIAo+
ICAJLyogV2FsayB1cCB0aGUgdHJlZSBvZiBkZXZpY2VzIGxvb2tpbmcgZm9yIGEgbWF0Y2hpbmcg
aWlvIGNoYW5uZWwgKi8KPiAgCXdoaWxlIChucCkgewo+IEBAIC0yMzEsMTEgKzIzMSwxMSBAQCBz
dHJ1Y3QgaWlvX2NoYW5uZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsCj4gIAkJCQkJCQkgbmFtZSk7Cj4gIAkJY2hhbiA9IG9mX2lpb19jaGFubmVs
X2dldChucCwgaW5kZXgpOwo+ICAJCWlmICghSVNfRVJSKGNoYW4pIHx8IFBUUl9FUlIoY2hhbikg
PT0gLUVQUk9CRV9ERUZFUikKPiAtCQkJYnJlYWs7CgpUaGlzIG9yaWdpbmFsIGJlaGF2aW91ciBp
cyAnaW50ZXJlc3RpbmcnLiBJZiB3ZSBnZXQgYSBlcnJvciBsaWtlIC1FTk9NRU0Kd2Ugc2hvdWxk
IHJldHVybiBpdCByYXRoZXIgdGhhbiBjYXJyeSBvbi4gIERvIHdlIGhhdmUgZW5vdWdoIGtub3ds
ZWRnZQpvZiBwb3NzaWJsZSBlcnJvcnMgaGVyZSB0byBiZSBtb3JlIGV4cGxpY2l0IG9uIHdoZW4g
d2Uga2VlcCBsb29raW5nIHVwCnRoZSB0cmVlPyAgSSB0aGluayB3ZSBjYW4gZ2V0IC1FTk9FTlQg
ZnJvbSBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpCgpUaGF0IHJhaXNlcyBhbiBpbnRlcmVz
dGluZyBxdWVzdGlvbiBvbiB3aGV0aGVyIC1FTk9ERVYgaXMgdGhlIHJpZ2h0IHJlc3BvbnNlCmZv
ciB0aGUgcHJldmlvdXNseSBOVUxMIGNhc2Ugb3IgaXMgLUVOT0VOVCBtb3JlIGNvbnNpc3RlbnQg
d2l0aCBvdGhlcgpvZl8gZnVuY3Rpb25zPyAgTm8gZGV2aWNlIGNvdWxkIGJlIHRob3VnaHQgb2Yg
YXMgYmVpbmcgdGhlIGNhc2UgdGhhdCBuZWVkcwp0byBkZWZlciAoaW4gaG9wZSBpdCB0dXJucyB1
cCBsYXRlcikgd2hlcmVhcyBubyBlbnRyeSBtZWFucyBpdCB3aWxsIG5ldmVyCnN1Y2NlZWQuCgo+
IC0JCWVsc2UgaWYgKG5hbWUgJiYgaW5kZXggPj0gMCkgewo+ICsJCQlyZXR1cm4gY2hhbjsKPiAr
CQlpZiAobmFtZSAmJiBpbmRleCA+PSAwKSB7Cj4gIAkJCXByX2VycigiRVJST1I6IGNvdWxkIG5v
dCBnZXQgSUlPIGNoYW5uZWwgJXBPRjolcyglaSlcbiIsCj4gIAkJCQlucCwgbmFtZSA/IG5hbWUg
OiAiIiwgaW5kZXgpOwo+IC0JCQlyZXR1cm4gTlVMTDsKPiArCQkJcmV0dXJuIGNoYW47Cj4gIAkJ
fQo+ICAKPiAgCQkvKgo+IEBAIC0yNDUsMTAgKzI0NSwxMCBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwg
Km9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gIAkJ
ICovCj4gIAkJbnAgPSBucC0+cGFyZW50Owo+ICAJCWlmIChucCAmJiAhb2ZfZ2V0X3Byb3BlcnR5
KG5wLCAiaW8tY2hhbm5lbC1yYW5nZXMiLCBOVUxMKSkKPiAtCQkJcmV0dXJuIE5VTEw7Cj4gKwkJ
CXJldHVybiBjaGFuOwo+ICAJfQo+ICAKPiAtCXJldHVybiBjaGFuOwo+ICsJcmV0dXJuIEVSUl9Q
VFIoLUVOT0RFVik7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwob2ZfaWlvX2NoYW5uZWxfZ2V0
X2J5X25hbWUpOwo+ICAKPiBAQCAtMjY3LDggKzI2Nyw4IEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2No
YW5uZWwgKm9mX2lpb19jaGFubmVsX2dldF9hbGwoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJCQli
cmVhazsKPiAgCX0gd2hpbGUgKCsrbnVtbWFwcyk7Cj4gIAo+IC0JaWYgKG51bW1hcHMgPT0gMCkJ
Lyogbm8gZXJyb3IsIHJldHVybiBOVUxMIHRvIHNlYXJjaCBtYXAgdGFibGUgKi8KPiAtCQlyZXR1
cm4gTlVMTDsKPiArCWlmIChudW1tYXBzID09IDApCS8qIHJldHVybiAtRU5PREVWIHRvIHNlYXJj
aCBtYXAgdGFibGUgKi8KPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiAgCj4gIAkvKiBO
VUxMIHRlcm1pbmF0ZWQgYXJyYXkgdG8gc2F2ZSBwYXNzaW5nIHNpemUgKi8KPiAgCWNoYW5zID0g
a2NhbGxvYyhudW1tYXBzICsgMSwgc2l6ZW9mKCpjaGFucyksIEdGUF9LRVJORUwpOwo+IEBAIC0y
OTUsNyArMjk1LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxf
Z2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBp
aW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
IHsKPiAtCXJldHVybiBOVUxMOwo+ICsJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gIH0KPiAg
Cj4gICNlbmRpZiAvKiBDT05GSUdfT0YgKi8KPiBAQCAtMzYyLDcgKzM2Miw3IEBAIHN0cnVjdCBp
aW9fY2hhbm5lbCAqaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCWlmIChk
ZXYpIHsKPiAgCQljaGFubmVsID0gb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoZGV2LT5vZl9u
b2RlLAo+ICAJCQkJCQkgICAgIGNoYW5uZWxfbmFtZSk7Cj4gLQkJaWYgKGNoYW5uZWwgIT0gTlVM
TCkKPiArCQlpZiAoIUlTX0VSUihjaGFubmVsKSB8fCBQVFJfRVJSKGNoYW5uZWwpID09IC1FUFJP
QkVfREVGRVIpCj4gIAkJCXJldHVybiBjaGFubmVsOwo+ICAJfQo+ICAKPiBAQCAtNDEyLDggKzQx
Miw2IEBAIHN0cnVjdCBpaW9fY2hhbm5lbCAqZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAljaGFubmVsID0gb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUobnAsIGNoYW5uZWxfbmFtZSk7Cj4gIAlpZiAoSVNfRVJSKGNoYW5uZWwpKQo+ICAJCXJl
dHVybiBjaGFubmVsOwo+IC0JaWYgKCFjaGFubmVsKQo+IC0JCXJldHVybiBFUlJfUFRSKC1FTk9E
RVYpOwo+ICAKPiAgCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1faWlv
X2NoYW5uZWxfZnJlZSwgY2hhbm5lbCk7Cj4gIAlpZiAocmV0KQo+IEBAIC00MzYsNyArNDM0LDcg
QEAgc3RydWN0IGlpb19jaGFubmVsICppaW9fY2hhbm5lbF9nZXRfYWxsKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAgCj4gIAljaGFucyA9IG9mX2lp
b19jaGFubmVsX2dldF9hbGwoZGV2KTsKPiAtCWlmIChjaGFucykKPiArCWlmICghSVNfRVJSKGNo
YW5zKSB8fCBQVFJfRVJSKGNoYW5zKSA9PSAtRVBST0JFX0RFRkVSKQoKSG1tLiBXZSBvbmx5IHdh
bnQgdG8gY2Fycnkgb24gaWYgdGhlIGVycm9yIGlzIC1FTk9ERVYuICBBbnl0aGluZyBlbHNlCnNo
b3VsZCBiZSByZXBvcnRlZCB1cCB0aGUgc3RhY2suCgpUaGF0IG1pZ2h0IGJlIHRoZSBvbmx5IGVy
cm9yIGxlZnQsIGJ1dCBJIHRoaW5rIHdlIHNob3VsZCBiZSBleHBsaWNpdC4KCj4gIAkJcmV0dXJu
IGNoYW5zOwo+ICAKPiAgCW5hbWUgPSBkZXZfbmFtZShkZXYpOwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
