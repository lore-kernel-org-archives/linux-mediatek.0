Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82BEC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 03:56:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D83D64E21
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 03:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D83D64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4DxPARNZs8FZHdA0i3xAhRP7DvjUYng/AqOskO2orVQ=; b=oHmYYyD++LlCuijRI0zzTIcfP
	Ty8CGXL+xPTjHbLzoBFpFcQKW/tBhXTsuLgn8BEz0rpF3LIxfEb744CdpYStaGP/NalWlSmfRs16x
	siDKGhouBY1DDBtJecqJh1xEmXT2jmGbEM7j90rX/baf6BQrzwzHjKWXtVQvRx7rScph7V13Y1tRQ
	HvtvAg7a244xek3tnyEYVHnoSlTOZ3wGZSAKwGQxPqGVcXDc/Nok1gQDEU3WXm/Tjz+14h/55kOdU
	ZV/58iEjxkJGqexP0Tji8s+BmfqkFKsLT+hZFTdhAjEbtCwBwClyxkGzU76zqgDrAQRuPINPn2bgB
	cEzqeSJwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l63qf-000212-T4; Sun, 31 Jan 2021 03:56:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l63qb-00020N-V0; Sun, 31 Jan 2021 03:56:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A515A64DCC;
 Sun, 31 Jan 2021 03:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612065384;
 bh=o/wMeATxWK4/ovdl3osu4aT+CFWCCeBZhexp7L0XdJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B9gdXvMVCrRpgVK8SLcWUhjHJsSdGQwK5tek2ZBh65CxvFvRS0G3jn0XpLC6RbQxe
 tDFfd5tUSmmP7kIMBvMXKXXBDVNq0HB+T+J94oOEXvtA0taEy23FgXq28vGqTT2fcp
 D+jpHHyw0o6hZ4PhhhUdpIHA+hnvjXi2hz57vIIYqLIEg/eYDW2UvE7B4/C7deIbZM
 mmY5Y/pgvlmvdkVZoLsaaaFKL7qIti/eWW0u0jfIVWhyh0Gdb3E1o4GNLHS82pmYwe
 JlhL6saJunOjANhQSXuspRaJjv1uVE8IYXZXcgRviIScEyRnP6j17W3VSjZMmiBJhl
 JU6ryXYHu6pBA==
Received: by mail-ej1-f45.google.com with SMTP id rv9so18922563ejb.13;
 Sat, 30 Jan 2021 19:56:24 -0800 (PST)
X-Gm-Message-State: AOAM532mQOwvOR5vdf4QTNCzmegufeeZClhJIr7lE+NAQ892+2ZjrsTY
 CLZEfYeI8X6RzWyANHzjZRHRRRzaQY9x3Dw3Ag==
X-Google-Smtp-Source: ABdhPJxNc0ogbTJjvcRGvMFzWpYCh+9GlGCriZvuZocH6kJJP4x6oFAwWInkVL7LXNp6GnE9l1E7LPwRxCKYeiir/b0=
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr3777247ejc.310.1612065383304; 
 Sat, 30 Jan 2021 19:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-5-hsinyi@chromium.org>
 <1611908500.31184.6.camel@mtksdaap41>
In-Reply-To: <1611908500.31184.6.camel@mtksdaap41>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 31 Jan 2021 11:56:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8PhKLEuwq4u9tK7z0yfbU=La+DQ8+Ahg1OTe0d5o4qhw@mail.gmail.com>
Message-ID: <CAAOTY_8PhKLEuwq4u9tK7z0yfbU=La+DQ8+Ahg1OTe0d5o4qhw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_225626_531532_9AB909EA 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDHmnIgy
OeaXpSDpgLHkupQg5LiL5Y2INDoyMeWvq+mBk++8mgo+Cj4gSGksIEhzaW4tWWk6Cj4KPiBPbiBG
cmksIDIwMjEtMDEtMjkgYXQgMTU6MzQgKzA4MDAsIEhzaW4tWWkgV2FuZyB3cm90ZToKPiA+IEZy
b206IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IGVu
YWJsZSBPVkxfTEFZRVJfU01JX0lEX0VOIGZvciBtdWx0aS1sYXllciB1c2VjYXNlLCB3aXRob3V0
IHRoaXMgcGF0Y2gsCj4gPiBvdmwgd2lsbCBoYW5nIHVwIHdoZW4gbW9yZSB0aGFuIDEgbGF5ZXIg
ZW5hYmxlZC4KPgo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKQXBw
bGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0
L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDE3
ICsrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiBpbmRleCBk
YTdlMzhhMjg3NTliLi45NjFmODdmOGQ0ZDE1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiA+IEBAIC0yNCw2ICsyNCw3IEBACj4gPiAgI2RlZmluZSBE
SVNQX1JFR19PVkxfUlNUICAgICAgICAgICAgICAgICAgICAgMHgwMDE0Cj4gPiAgI2RlZmluZSBE
SVNQX1JFR19PVkxfUk9JX1NJWkUgICAgICAgICAgICAgICAgICAgICAgICAweDAwMjAKPiA+ICAj
ZGVmaW5lIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gICAgICAgICAgICAweDAwMjQKPiA+ICsj
ZGVmaW5lIE9WTF9MQVlFUl9TTUlfSURfRU4gICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgw
KQo+ID4gICNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQklUKDIpCj4gPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSICAgICAgICAgICAg
ICAgICAgICAgICAweDAwMjgKPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OICAgICAg
ICAgICAgICAgICAweDAwMmMKPiA+IEBAIC02Miw2ICs2Myw3IEBAIHN0cnVjdCBtdGtfZGlzcF9v
dmxfZGF0YSB7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgZ21jX2JpdHM7Cj4gPiAgICAgICB1bnNp
Z25lZCBpbnQgbGF5ZXJfbnI7Cj4gPiAgICAgICBib29sIGZtdF9yZ2I1NjVfaXNfMDsKPiA+ICsg
ICAgIGJvb2wgc21pX2lkX2VuOwo+ID4gIH07Cj4gPgo+ID4gIC8qKgo+ID4gQEAgLTEzNCw2ICsx
MzYsMTMgQEAgdm9pZCBtdGtfb3ZsX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICB7Cj4g
PiAgICAgICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
PiA+Cj4gPiArICAgICBpZiAob3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsKPiA+ICsgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHJlZzsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcmVnID0gcmVhZGwo
b3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4gPiArICAgICAgICAgICAg
IHJlZyA9IHJlZyB8IE9WTF9MQVlFUl9TTUlfSURfRU47Cj4gPiArICAgICAgICAgICAgIHdyaXRl
bF9yZWxheGVkKHJlZywgb3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4g
PiArICAgICB9Cj4gPiAgICAgICB3cml0ZWxfcmVsYXhlZCgweDEsIG92bC0+cmVncyArIERJU1Bf
UkVHX09WTF9FTik7Cj4gPiAgfQo+ID4KPiA+IEBAIC0xNDIsNiArMTUxLDE0IEBAIHZvaWQgbXRr
X292bF9zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgICAgIHN0cnVjdCBtdGtfZGlzcF9v
dmwgKm92bCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4KPiA+ICAgICAgIHdyaXRlbF9yZWxh
eGVkKDB4MCwgb3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0VOKTsKPiA+ICsgICAgIGlmIChvdmwt
PmRhdGEtPnNtaV9pZF9lbikgewo+ID4gKyAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVnOwo+
ID4gKwo+ID4gKyAgICAgICAgICAgICByZWcgPSByZWFkbChvdmwtPnJlZ3MgKyBESVNQX1JFR19P
VkxfREFUQVBBVEhfQ09OKTsKPiA+ICsgICAgICAgICAgICAgcmVnID0gcmVnICYgfk9WTF9MQVlF
Ul9TTUlfSURfRU47Cj4gPiArICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgb3ZsLT5y
ZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAg
fQo+ID4KPiA+ICB2b2lkIG10a19vdmxfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IHcsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
