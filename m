Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DDFC43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jun 2022 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMtr/T5xCzDSZf0R2i7AgRcD0DTSk2EzDmc3PvhKXbc=; b=aud/YPZ6EAor1K
	IMcapALt2TdrmZI/xM6X7LWafncY+y7hqgUfB2HwZksDe+jvYbi5OAa3HpG/iW+Wmlcttgr4k6hbo
	toNliKBZYq0H8jRuTYkklGr6+gR2DcMCxPRy1hBG14BmAIYZfIvNFOUbEwlF12ZqP1veiI/cI/36B
	Xl3yqiTIgyn+Y7KPihhxIrMhcDy/jUpI1pj+ko6t742zs9COBnf/iChTA6j/ufyjnRPhRSjVrVxQX
	AVPq/AXD+ihSNk/2OYxBbd4ddrGetNBAKKvKnVJQ7kaCWtl2uHsh4+hVzHEoW1RYboCyXFbL0Assw
	pWRu/gBGAfNwHLfqLo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0RZ6-00HElm-4W; Sun, 12 Jun 2022 17:39:56 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0RZ2-00HEkL-Jb; Sun, 12 Jun 2022 17:39:54 +0000
Received: by mail-qv1-f50.google.com with SMTP id a9so3002637qvt.6;
        Sun, 12 Jun 2022 10:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xNhFuNm1nmnzKrxqQuO4XyzP0cAuS/p9Ps9ar4/pkNA=;
        b=sp9UgitNeflzgBVwd3qrjZ0WMZpgmGpobz8Jd0uaIrZ1A/0CaBuzWpTuSMCobxg0rx
         NsfBWtp4XD55+xs36zDcZuxArbB9GmYDZpXg6EUUc82WR6KOtODuzOYP88zdn3OBLqro
         3DqhwYvPwZHEdOdtGj6SOS8qmCSvqQxTrrK4MJIknno0Yqs5SP1EfbSkwB87ibULaP6z
         pDJnDuhjvwkAVp0ORPPa4YeqzKqqikLCqXhZKlRoDlErCZatviUhqGxqFR/uKNPRo/uX
         8eF9iESYJCc+e3/Y7zG8Vyp3W2G39MJpYektbNeUfMWQfYI9OG0yU8zhfVeiVCt1zbKt
         NxbA==
X-Gm-Message-State: AOAM5319sSnRbvlEptkfDl0F09wStNUQpi26lMKWZIecYwwu6abv6F3U
	kVRnftzNdsJfWqIU1ahJjaGUxQbK4ro=
X-Google-Smtp-Source: ABdhPJwirwW/GgbDcLK6ysDSFbHWiNYIe0vrrXUlCooEInK4GdpEYAEuTncZI27GdC6//xHDtXwomA==
X-Received: by 2002:a05:6214:1d25:b0:464:55a9:48df with SMTP id f5-20020a0562141d2500b0046455a948dfmr52555060qvd.113.1655055590155;
        Sun, 12 Jun 2022 10:39:50 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bq31-20020a05620a469f00b0069fcc501851sm4724428qkb.78.2022.06.12.10.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jun 2022 10:39:49 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3137c877092so31262587b3.13;
        Sun, 12 Jun 2022 10:39:48 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr60597100ywa.47.1655055588159; Sun, 12
 Jun 2022 10:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-35-nuno.sa@analog.com>
 <YqNo6U8r80aNFzUr@spruce> <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
In-Reply-To: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jun 2022 19:39:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Joe Simmons-Talbott <joetalbott@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Benson Leung <bleung@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_103952_690289_FAFD6920 
X-CRM114-Status: GOOD (  22.06  )
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

SGkgTnVubywKCk9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDk6NTIgUE0gTnVubyBTw6EgPG5vbmFt
ZS5udW5vQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAyMDIyLTA2LTEwIGF0IDExOjUzIC0w
NDAwLCBKb2UgU2ltbW9ucy1UYWxib3R0IHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTAsIDIwMjIg
YXQgMTA6NDU6NDVBTSArMDIwMCwgTnVubyBTw6Egd3JvdGU6Cj4gPiA+IEp1c3QgY29zbWV0aWNz
LiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4uLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKPiA+ID4gLS0tIGEvZHJpdmVycy9p
aW8vaW5rZXJuLmMKPiA+ID4gKysrIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+ID4gQEAgLTQ1
LDEzICs0NSwxMyBAQCBpbnQgaWlvX21hcF9hcnJheV9yZWdpc3RlcihzdHJ1Y3QgaWlvX2Rldgo+
ID4gPiAqaW5kaW9fZGV2LCBzdHJ1Y3QgaWlvX21hcCAqbWFwcykKPiA+ID4gICAgICAgICBpbnQg
aSA9IDAsIHJldCA9IDA7Cj4gPiA+ICAgICAgICAgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1h
cGk7Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKG1hcHMgPT0gTlVMTCkKPiA+ID4gKyAgICAgICBp
ZiAoIW1hcHMpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gICAg
ICAgICBtdXRleF9sb2NrKCZpaW9fbWFwX2xpc3RfbG9jayk7Cj4gPiA+IC0gICAgICAgd2hpbGUg
KG1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUgIT0gTlVMTCkgewo+ID4gPiArICAgICAgIHdoaWxl
ICghbWFwc1tpXS5jb25zdW1lcl9kZXZfbmFtZSkgewo+ID4KPiA+IFNob3VsZG4ndCB0aGlzIGJl
PzoKPiA+IHdoaWxlIChtYXBzW2ldLmNvbnN1bWVyX2Rldl9uYW1lKSB7Cj4KPiBVcHMuLi4gTmlj
ZSBjYXRjaCEgSSB3YXMgcHJvYmFibHkgaW4gYm90IG1vZGUgYWxyZWFkeS4KCldoZW4gbWFraW5n
IGEgY2hhbmdlIHdpdGggbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGl0IGlzIGFsd2F5
cwphIGdvb2QgaWRlYSB0byBjb21wYXJlIHRoZSBnZW5lcmF0ZWQgYXNzZW1ibGVyIGJlZm9yZS9h
ZnRlci4gIEkuZS4KCiAgICBtYWtlIGRyaXZlcnMvaWlvL2lua2Vybi5zCiAgICBtdiBkcml2ZXJz
L2lpby9pbmtlcm4ucyBkcml2ZXJzL2lpby9pbmtlcm4ucy5vcmlnCiAgICBbbWFrZSB5b3VyIGNo
YW5nZV0KICAgIG1ha2UgZHJpdmVycy9paW8vaW5rZXJuLnMKICAgIGRpZmYgLXUgZHJpdmVycy9p
aW8vaW5rZXJuLnN7Lm9yaWcsfQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
