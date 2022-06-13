Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4849CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5IrmGgH6Dc7pYZC3mPVTJDvgOR7o1Bb9ZJ123/BJqY=; b=qpwJv0j+1UjFui
	Q5HPZ+bi9R3Icg5Itg4eWc1SY7xydYZ7hB1MZv5qNB7/EPvs4SGfJ4sSZvvnHGiV5FqOYGlZSCvpS
	GqoaoizuFdveyfBFHZty72hvzU6uVdidFCt1YVaIXBnWdNoP6oPg39TYsQx3Kzs7KurDw6lwFnpVT
	vWs91ByCKojwiZQSW9g2AUP0Ao1xg88KRNxSxz0/WBPqj8P39NwHd+76BGIcSFoi9hrLPZwhabDnN
	N86ar6d42OrksUwVuqSAK0ys9RbIhL8K2ZH5CVf39zkIgbBSyjXgy+GEFeXLQw/HmxWu+kXo71DlR
	8Zbvw7PKEOZlyStYdutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ePB-001wyj-VJ; Mon, 13 Jun 2022 07:22:34 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0eP8-001wxB-11; Mon, 13 Jun 2022 07:22:31 +0000
Received: by mail-qv1-xf34.google.com with SMTP id o43so3808523qvo.4;
        Mon, 13 Jun 2022 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
        b=lgYBehJwnc7p76Sp7QYODbs+eJsn9x/aAZca0AhE5KDXVc2emmsRxjtpfkhG0ym3jF
         +YmyjmCo8KwGowRdjt9uIvuUoTlmDmEhKvtAV4CSG4hTEjA91HAM5qlNsrTQS1SRX91R
         LFvp/Mktzkcb1CVjqHCgBxNr9WvYpOAxf+96MGlGzCOnNiSwu1/E0KM1WiGropKJpSPJ
         I1FGxJQBE5G5ow1BWz+8k8tlsSYxFVWF+sox/Wak2AzR/lG0tAdRt9KAZDThpdGND1Zh
         2o8Dtj8SUUB+OwaZDXw05iMGYlfFzStAu7j7cL8cCzdwPXdi8qQXd8eBti7wRpJI/O1K
         B+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
        b=vv92TY0nnGAIFFeqXeJNqXpKZQSW1hRkfeWeUObIMAg3XEzdyxUoiHgRTqoyRAwxrD
         F0szZpf/dwdjdCXwsMqxo244CnUchnR+HN4MmhMCUKaJLdaMEF9mEsKJZnzpLW9uWgQV
         aTNqhoCUxMdxinGoWktK/fL14fWASL3mRvqRvSKpIqpowZB+rB6nPoufbToHaS3BeKrC
         3OB0JY6oOPDEvY9Q/hsUf92pClN0iwtgRSQX9vnce1A3KMgtePo2j7CTmoWOdo7gJnIi
         yiNXIwTUqstVwhVEja7Dw7rFZuwk/24dKdpmxGrcfS+jt+oKFzp5mEkw1+OJlOyerOm3
         5ppA==
X-Gm-Message-State: AOAM5301SXHqGAzRbIkf7dToAFpMDv7i5Y72LqGbFjHO3TvOywkWIGWV
	XPSz9HEhz3FPpS73/p/pCHw=
X-Google-Smtp-Source: ABdhPJzJwQGuL0izMZeZrCmNmnxm8u/ohN3iHcmN+Ftx1/l43JyjW+szv6Fscr1wrYk++4pmje2xJg==
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id 1-20020ad45b81000000b00465ded80780mr45550533qvp.119.1655104947222;
        Mon, 13 Jun 2022 00:22:27 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id y6-20020a05622a004600b002f9399ccefasm4637163qtw.34.2022.06.13.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:22:26 -0700 (PDT)
Message-ID: <d1d465f2e828642f30bc8a2bdd49e89fdfed7caf.camel@gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joe Simmons-Talbott <joetalbott@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, NXP Linux Team <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-iio@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, Benjamin
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
 <daniel.lezcano@linaro.org>,  Gwendal Grignou <gwendal@chromium.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Thara Gopinath <thara.gopinath@linaro.org>, Avi
 Fishman <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, Zhang
 Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 13 Jun 2022 09:23:16 +0200
In-Reply-To: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
	 <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
	 <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_002230_113185_E05DEEC3 
X-CRM114-Status: GOOD (  16.16  )
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

T24gU3VuLCAyMDIyLTA2LTEyIGF0IDE5OjM5ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6Cj4gSGkgTnVubywKPiAKPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCA5OjUyIFBNIE51bm8g
U8OhIDxub25hbWUubnVub0BnbWFpbC5jb20+Cj4gd3JvdGU6Cj4gPiBPbiBGcmksIDIwMjItMDYt
MTAgYXQgMTE6NTMgLTA0MDAsIEpvZSBTaW1tb25zLVRhbGJvdHQgd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1OjQ1QU0gKzAyMDAsIE51bm8gU8OhIHdyb3RlOgo+ID4g
PiA+IEp1c3QgY29zbWV0aWNzLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4uLgo+ID4g
PiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2lpby9pbmtlcm4uYwo+ID4gPiA+IEBAIC00NSwxMyArNDUsMTMgQEAgaW50IGlpb19tYXBf
YXJyYXlfcmVnaXN0ZXIoc3RydWN0IGlpb19kZXYKPiA+ID4gPiAqaW5kaW9fZGV2LCBzdHJ1Y3Qg
aWlvX21hcCAqbWFwcykKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBpbnQgaSA9IDAsIHJldCA9IDA7
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1hcGk7Cj4g
PiA+ID4gCj4gPiA+ID4gLcKgwqDCoMKgwqDCoCBpZiAobWFwcyA9PSBOVUxMKQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKCFtYXBzKQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPiA+ID4gPiAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2Nr
KCZpaW9fbWFwX2xpc3RfbG9jayk7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoCB3aGlsZSAobWFwc1tp
XS5jb25zdW1lcl9kZXZfbmFtZSAhPSBOVUxMKSB7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoCB3aGls
ZSAoIW1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUpIHsKPiA+ID4gCj4gPiA+IFNob3VsZG4ndCB0
aGlzIGJlPzoKPiA+ID4gd2hpbGUgKG1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUpIHsKPiA+IAo+
ID4gVXBzLi4uIE5pY2UgY2F0Y2ghIEkgd2FzIHByb2JhYmx5IGluIGJvdCBtb2RlIGFscmVhZHku
Cj4gCj4gV2hlbiBtYWtpbmcgYSBjaGFuZ2Ugd2l0aCBubyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZCwgaXQgaXMgYWx3YXlzCj4gYSBnb29kIGlkZWEgdG8gY29tcGFyZSB0aGUgZ2VuZXJhdGVk
IGFzc2VtYmxlciBiZWZvcmUvYWZ0ZXIuwqAgSS5lLgo+IAo+IMKgwqDCoCBtYWtlIGRyaXZlcnMv
aWlvL2lua2Vybi5zCj4gwqDCoMKgIG12IGRyaXZlcnMvaWlvL2lua2Vybi5zIGRyaXZlcnMvaWlv
L2lua2Vybi5zLm9yaWcKPiDCoMKgwqAgW21ha2UgeW91ciBjaGFuZ2VdCj4gwqDCoMKgIG1ha2Ug
ZHJpdmVycy9paW8vaW5rZXJuLnMKPiDCoMKgwqAgZGlmZiAtdSBkcml2ZXJzL2lpby9pbmtlcm4u
c3sub3JpZyx9Cj4gCgpBaCB0aHguLi4gVGhhdCdzIGluZGVlZCBhIGdvb2QgaWRlYSEKCi0gTnVu
byBTw6EKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
