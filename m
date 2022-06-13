Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A790C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAPri0EFUKHN6hPuYViroL/AirI5V0tDKzxe6pqgRUw=; b=bUO2k8PphNPwa4
	puXg1/BrqUCCOYgD5lQw+i5J4OIw1ElD2zrlbylRHhCD41OuJ3AiIo+wbABqKjebG7fMxm71HbAhj
	oLEocMi4qPp8jvzy9+6EVvj+JgvtlI9C8H/q0ywdi8TPi0Mxz9lAGtduyMXyDftVzNyrJRsZIdhrP
	r/IGPHGErRZYDw+RR8/+G4lvLTdXuNoXW0JGriWo1/v8Z0iMk2Pd4nstjKpASloUe4gxkNfEXhYI0
	Ac9b5/CPWiJAXFUP1E2R4nQFAhHZ3x2v4J0E/awz9QzoKyyU7OALQAJxm5BhqjxaLPW7YFGZjUdjC
	0yPirZo1No4aCRqjO2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0e9H-001sdP-JN; Mon, 13 Jun 2022 07:06:07 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0e9E-001scK-3w; Mon, 13 Jun 2022 07:06:05 +0000
Received: by mail-qt1-x836.google.com with SMTP id k4so3299008qth.8;
        Mon, 13 Jun 2022 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
        b=BeUQU7At5w8QXnQumv31sTGFNuryglGKvde6SoIxLoHOJ5t/WGMn1AXz3Eknm6h5AI
         kNL4PEd0uMir3gUr1z6XGSGK1rVD3INLVDD+LZJQYc8d9+62lYvyaguTm78kNak/rSak
         T3okK5/4ndABoNywbeazmrsJmzecZtZstWGrOW2kSrrZPWoL+4bF34YazBYZMgWZX4Tb
         Bt9W4HzigonIOzfvWB+W869hPSh+dfOJ4Kquh0y9Dsp8gm71SNYKkMAx9kDUk/JCp9Zv
         0D3K88QtgS+P4vXBJD6FFG3yQbdUH3SbzIbxx14i72EO5NKMHtU9uCEpi/JGyYCXjqA1
         +OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
        b=6QYaFtdcW1HVO+2MvnGVyldCXxTPDfp0A1WpzcSXtGtaiFxS5BfYVphwS/XXjfwUfX
         j3xATTDl052CvltxqeK7cssh6+arxeQBGNIIyyAYX//D+VRdlIDGPiZAvA/AAqzTfel7
         tYowHZBr0ONjDG4cvsQyFttqmY8+NbhAnjxo2fCSPGu4coS+aY/oJBCRv+MIpxIgtWoB
         M9rWy85hu8gWEj2l8fLgb0BoRGD10YyqOGw4NACJ9CpcyvD4E3QoF1iIbeRyk1SkbmAl
         xKCERA4wiU88hdT4xWXQX3R7eP6FxnZlaBFTcqS2raXMiLOzOCiDnuABasR6ZwC79U4r
         YHRQ==
X-Gm-Message-State: AOAM532t3xjr1MAUOwyMd7NREZ2tIwt5+oWKd3LQuGlea5wM8Otf1PBj
	rWhwBpRzFDuf+BYsnfrEwoA=
X-Google-Smtp-Source: ABdhPJx1ATSZFfuRWjaAT70y9WnEKuNuBqF1XmR5jBeGYYoq9SJ4nRAMyKQM1AWqPTp0l7HO6v7YKg==
X-Received: by 2002:a05:622a:311:b0:2f3:ddb0:4ae6 with SMTP id q17-20020a05622a031100b002f3ddb04ae6mr46319206qtw.140.1655103961023;
        Mon, 13 Jun 2022 00:06:01 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a240300b006a6a1e4aec2sm6086602qkn.49.2022.06.13.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:06:00 -0700 (PDT)
Message-ID: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Branchereau
 <cbranchereau@gmail.com>,  Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Mon, 13 Jun 2022 09:06:49 +0200
In-Reply-To: <20220611161701.46a68837@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-23-nuno.sa@analog.com>
	 <20220611161701.46a68837@jic23-huawei>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_000604_230135_D1670530 
X-CRM114-Status: GOOD (  28.74  )
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

T24gU2F0LCAyMDIyLTA2LTExIGF0IDE2OjE3ICswMTAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3Rl
Ogo+IE9uIEZyaSwgMTAgSnVuIDIwMjIgMTA6NDU6MzMgKzAyMDAKPiBOdW5vIFPDoSA8bnVuby5z
YUBhbmFsb2cuY29tPiB3cm90ZToKPiAKPiA+IEFQSXMgbGlrZSBvZl9paW9fY2hhbm5lbF9nZXRf
YnlfbmFtZSgpIGFuZCBvZl9paW9fY2hhbm5lbF9nZXRfYWxsKCkKPiA+IHdlcmUKPiA+IHJldHVy
bmluZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVycyBiZWluZyBOVUxMIHRoZSB3YXkg
dG8KPiAKPiBwb2ludGVycyB3aXRoIE5VTEwgYmVpbmcgdGhlIHdheSB0by4uLgo+IAo+ID4gIm5v
dGlmeSIgdGhhdCB3ZSBzaG91bGQgZG8gYSAic3lzdGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBU
aGlzCj4gPiBtYWtlCj4gPiBpdCB2ZXJ5IGNvbmZ1c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFz
IGNvbW1pdCBkYmJjY2Y3YzIwYmYKPiA+ICgiaWlvOiBpbmtlcm46IGZpeCByZXR1cm4gdmFsdWUg
aW4KPiA+IGRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSIpCj4gPiBwcm92ZXMuIE9u
IHRvcCBvZiB0aGlzLCBwYXR0ZXJucyBsaWtlICdpZiAoY2hhbm5lbCAhPSBOVUxMKSByZXR1cm4K
PiA+IGNoYW5uZWwnCj4gPiB3ZXJlIGJlaW5nIHVzZWQgd2hlcmUgY2hhbm5lbCBjb3VsZCBhY3R1
YWxseSBiZSBhbiBlcnJvciBjb2RlIHdoaWNoCj4gPiBtYWtlcyB0aGUgY29kZSBoYXJkIHRvIHJl
YWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9paW8vaW5rZXJuLmMgfCAyNCArKysrKysrKysrKy0tLS0t
LS0tLS0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW5rZXJuLmMgYi9kcml2
ZXJzL2lpby9pbmtlcm4uYwo+ID4gaW5kZXggODdmZDJhMGQ0NGYyLi4zMWQ5YzEyMjE5OWEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ID4gKysrIGIvZHJpdmVycy9paW8v
aW5rZXJuLmMKPiA+IEBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5l
bAo+ID4gKm9mX2lpb19jaGFubmVsX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5k
ZXgpCj4gPiDCoHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUo
c3RydWN0IGRldmljZV9ub2RlCj4gPiAqbnAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBjaGFyICpuYW1lKQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW4gPSBOVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGlpb19jaGFubmVsICpjaGFuOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBXYWxrIHVw
IHRoZSB0cmVlIG9mIGRldmljZXMgbG9va2luZyBmb3IgYSBtYXRjaGluZyBpaW8KPiA+IGNoYW5u
ZWwgKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAobnApIHsKPiA+IEBAIC0yMzEsMTEgKzIz
MSwxMSBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwKPiA+ICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFt
ZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY2hhbiA9IG9mX2lpb19jaGFubmVsX2dldChucCwgaW5kZXgpOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJf
RVJSKGNoYW4pID09IC0KPiA+IEVQUk9CRV9ERUZFUikKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gCj4gVGhpcyBvcmlnaW5hbCBiZWhh
dmlvdXIgaXMgJ2ludGVyZXN0aW5nJy4gSWYgd2UgZ2V0IGEgZXJyb3IgbGlrZSAtCj4gRU5PTUVN
Cj4gd2Ugc2hvdWxkIHJldHVybiBpdCByYXRoZXIgdGhhbiBjYXJyeSBvbi7CoCBEbyB3ZSBoYXZl
IGVub3VnaAo+IGtub3dsZWRnZQo+IG9mIHBvc3NpYmxlIGVycm9ycyBoZXJlIHRvIGJlIG1vcmUg
ZXhwbGljaXQgb24gd2hlbiB3ZSBrZWVwIGxvb2tpbmcKPiB1cAo+IHRoZSB0cmVlP8KgIEkgdGhp
bmsgd2UgY2FuIGdldCAtRU5PRU5UIGZyb20KPiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygp
Cj4gCj4gVGhhdCByYWlzZXMgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24gb24gd2hldGhlciAtRU5P
REVWIGlzIHRoZSByaWdodAo+IHJlc3BvbnNlCj4gZm9yIHRoZSBwcmV2aW91c2x5IE5VTEwgY2Fz
ZSBvciBpcyAtRU5PRU5UIG1vcmUgY29uc2lzdGVudCB3aXRoIG90aGVyCj4gb2ZfIGZ1bmN0aW9u
cz/CoCBObyBkZXZpY2UgY291bGQgYmUgdGhvdWdodCBvZiBhcyBiZWluZyB0aGUgY2FzZSB0aGF0
Cj4gbmVlZHMKPiB0byBkZWZlciAoaW4gaG9wZSBpdCB0dXJucyB1cCBsYXRlcikgd2hlcmVhcyBu
byBlbnRyeSBtZWFucyBpdCB3aWxsCj4gbmV2ZXIKPiBzdWNjZWVkLgoKRnJvbSB3aGF0IEkgY291
bGQgc2VlLCBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIGVpdGhlciByZXR1cm5zwqAKLUVJ
TlZBTCBvciAtRU5PRU5ULiBXZSBhbHNvIGhhdmUgdGhlIGludGVybmFsIG9mX2lpb19jaGFubmVs
X2dldCgpCndoaWNoIGNhbiByZXR1cm4gLUVOT01FTS4gU28gSSBndWVzcyB3ZSBzaG91bGQgb25s
eSBjb250aW51ZSBsb29raW5nIGlmCndlIGdldCAtRU5PRU5UPwoKVG8gYmUgY2xlYXIsIGRvIHlv
dSBzdGlsbCBwcmVmZXIgdG8gZXhwbGljaXRseSByZXR1cm4gLUVOT0RFViBpbiB0aGUKcHJldmlv
dXMgTlVMTCBjYXNlcyBvciBzaG91bGQgd2UgaG9ub3IgdGhlIHJldHVybiBjb2RlIGZyb20gCm9m
X3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKCkgYW5kIGp1c3QgcmV0dXJuIGNoYW5zIChhbmQgdGh1
cyBFTk9FTlQpPwoKLSBOdW5vIFPDoQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
