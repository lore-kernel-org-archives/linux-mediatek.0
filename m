Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F360DC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:13:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48A720772
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AplMVL7B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0mv/pzeQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48A720772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sTljTgBa/36kWbIFTBlNzrzMCokIxqxaeza5h7bL3wA=; b=AplMVL7BJtjjeJtXmKItsd31u
	08SZvZmEbYYvGxQC63ivNTIxYtkjMI1QDYuPO8uXzBOHQZM3adr2d5M6Ngj915WWW8dNsZjMyePb/
	DxXuiYprY/S4YRISa7hD9woWm41zOU0LqFGxXZCd5IZ1b8Vc7SD1DioH2nNmkVR5tHePMeiBcXdE7
	J+OspAglMVY41jid6TSLFdVLsQGRyZqRYKtV1yyUXKeep+Mz3Wb0MHpMjSJhCvKhsPvPTgaPh/bJ3
	l9+0XJR3G8xCYBHkxtSmppv+n1K/ZLFS8Tdqlly1cNZ0ndJD+3/OCEDcZ4DkT6ktnihAgFbUbxotj
	zLTNkwdCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtWMN-0003Ho-9S; Thu, 09 Jul 2020 13:13:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtWMJ-0003Gb-Ga; Thu, 09 Jul 2020 13:13:04 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C26FB207BC;
 Thu,  9 Jul 2020 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594300382;
 bh=WBbJU/KkFXQZfDG744P7nPPYpZA0DJCr2tyu1VZTvTA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0mv/pzeQI/VIqe/m3D1mkdxV2+NosLJryzznIod0FRcZUjdfL6KjoJOTpqw9hFq0S
 ClUfzGM/2GSP4XyiYW7fbv2+gCv4HwSKXyhchJZS1fmPpOS7poh7q4Pn2KlgPd0JwP
 v0RFSJ1EuKrFu99hrIFt2WOf6W3JlJFEH78CkQmM=
Received: by mail-ej1-f43.google.com with SMTP id dr13so2220455ejc.3;
 Thu, 09 Jul 2020 06:13:01 -0700 (PDT)
X-Gm-Message-State: AOAM531YJfBYsB7rtmVAeEJ7u7y3IzcYkIPuZeWFLRA3YDEPIvj65pfB
 RNtVTTV8V8I43e5bS7P+crcGDzysHGWiQcMA5Q==
X-Google-Smtp-Source: ABdhPJyUxRrhc1z4ZHhofevSZxzBYzCXYv8JpRTyGRhKckyUoVMmTH4L7nw7p3INYz0y0YJL3aK6Bg1WNoVpWz1+8Do=
X-Received: by 2002:a17:906:856:: with SMTP id
 f22mr53938906ejd.245.1594300380228; 
 Thu, 09 Jul 2020 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
In-Reply-To: <20200708104023.3225-2-louis.kuo@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Jul 2020 21:12:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
Message-ID: <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: Louis Kuo <louis.kuo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_091303_689762_EA42B3A6 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 laurent.pinchart+renesas@ideasonboard.com,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= <Jerry-ch.Chen@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>, keiichiw@chromium.org,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIExvdWlzOgoKTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDfmnIg45pelIOmAseS4iSDkuIvljYg2OjQx5a+r6YGT77yaCj4KPiBUaGlzIHBhdGNoIGFkZHMg
TWVkaWF0ZWsncyBzZW5zb3IgaW50ZXJmYWNlIGRyaXZlci4gU2Vuc29yIGludGVyZmFjZQo+IGRy
aXZlciBpcyBhIE1JUEktQ1NJMiBob3N0IGRyaXZlciwgbmFtZWx5LCBhIEhXIGNhbWVyYSBpbnRl
cmZhY2UgY29udHJvbGxlci4KPiBJdCBzdXBwb3J0IGEgd2lkZWx5IGFkb3B0ZWQsIHNpbXBsZSwg
aGlnaC1zcGVlZCBwcm90b2NvbCBwcmltYXJpbHkgaW50ZW5kZWQKPiBmb3IgcG9pbnQtdG8tcG9p
bnQgaW1hZ2UgYW5kIHZpZGVvIHRyYW5zbWlzc2lvbiBiZXR3ZWVuIGNhbWVyYXMgYW5kIGhvc3QK
PiBkZXZpY2VzLiBUaGUgbXRrLWlzcCBkaXJlY3Rvcnkgd2lsbCBjb250YWluIGRyaXZlcnMgZm9y
IG11bHRpcGxlIElQIGJsb2Nrcwo+IGZvdW5kIGluIE1lZGlhdGVrIElTUCBzeXN0ZW0uIEl0IHdp
bGwgaW5jbHVkZSBJU1AgUGFzcyAxIGRyaXZlciwgc2Vuc29yCj4gaW50ZXJmYWNlIGRyaXZlciwg
RElQIGRyaXZlciBhbmQgZmFjZSBkZXRlY3Rpb24gZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcgICAgICAgIHwgICAxOCArCj4gIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWlzcC9NYWtlZmlsZSAgICAgICB8ICAgIDMgKwo+ICAuLi4vbWVkaWEv
cGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvTWFrZWZpbGUgICAgfCAgICA3ICsKPiAgLi4uL3BsYXRm
b3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmYuYyAgICAgIHwgIDk3NCArKysrKysrKysrKwo+
ICAuLi4vcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9kcGh5LmMgfCAgMzUzICsr
KysKCkkgdGhpbmsgcGh5IGRyaXZlciBzaG91bGQgYmUgcGxhY2VkIGluIGRyaXZlcnMvcGh5L21l
ZGlhdGVrIGFuZApzZXBhcmF0ZSBwaHkgZHJpdmVyIHRvIGFuIGluZGVwZW5kZW50IHBhdGNoLgoK
PiAgLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVnLmggIHwgMTQ5MSAr
KysrKysrKysrKysrKysrKwo+ICAuLi4vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9yeF9yZWcu
aCAgICAgICAgfCAgNTE1ICsrKysrKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDMzNjIgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNw
L0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWlzcC9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstaXNwL3NlbmluZi9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mLmMKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9k
cGh5LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlz
cC9zZW5pbmYvbXRrX3NlbmluZl9yZWcuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3J4X3JlZy5oCj4KCltzbmlw
XQoKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiArI2luY2x1ZGUgPGxpbnV4
L29mX2lycS5oPgoKTm8gaXJxIGhhbmRsZXIsIHNvIHJlbW92ZSB0aGlzLgoKPiArI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8bGludXgvdmlkZW9kZXYy
Lmg+Cj4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+Cj4gKyNpbmNsdWRlIDxtZWRpYS92
NGwyLWN0cmxzLmg+Cj4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWV2ZW50Lmg+Cj4gKyNpbmNsdWRl
IDxtZWRpYS92NGwyLWZ3bm9kZS5oPgo+ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1zdWJkZXYuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiArI2luY2x1ZGUgIm10a19zZW5pbmZfcmVn
LmgiCj4gKwoKW3NuaXBdCgo+ICsKPiArc3RhdGljIGludCBzZW5pbmZfc2V0X2N0cmwoc3RydWN0
IHY0bDJfY3RybCAqY3RybCkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19zZW5pbmYgKnByaXYg
PSBjb250YWluZXJfb2YoY3RybC0+aGFuZGxlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3NlbmluZiwgY3RybF9oYW5kbGVyKTsKPiAr
Cj4gKyAgICAgICBzd2l0Y2ggKGN0cmwtPmlkKSB7Cj4gKyAgICAgICBjYXNlIFY0TDJfQ0lEX1RF
U1RfUEFUVEVSTjoKPiArICAgICAgICAgICAgICAgaWYgKGN0cmwtPnZhbCA9PSBURVNUX0dFTl9Q
QVRURVJOKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBzZW5pbmZfZW5hYmxlX3Rl
c3RfcGF0dGVybihwcml2KTsKCldpdGhvdXQgdGhpcywgdGhpcyBkcml2ZXIgc3RpbGwgd29ya3Ms
IHNvIG1vdmUgdGhpcyB0byBhbiBpbmRlcGVuZGVudCBwYXRjaC4KCj4gKyAgICAgICAgICAgICAg
IGVsc2UgaWYgKGN0cmwtPnZhbCA9PSBURVNUX0RVTVBfREVCVUdfSU5GTykKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gc2VuaW5mX2R1bXBfZGVidWdfaW5mbyhwcml2KTsKCkRpdHRv
LgoKPiArICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwoK
W3NuaXBdCgo+ICsKPiArI2lmZGVmIENPTkZJR19PRgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBtdGtfbWlwaV9kcGh5X29mX21hdGNoW10gPSB7Cj4gKyAgICAgICB7LmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLW1pcGlfZHBoeSJ9LAoKV2hlcmUgaXMgdGhlIGRlZmlu
aXRpb24gb2YgIm1lZGlhdGVrLG10ODE4My1taXBpX2RwaHkiPwoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4gKyAgICAgICB7fSwKPiArfTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX21p
cGlfZHBoeV9vZl9tYXRjaCk7Cj4gKyNlbmRpZgo+ICsKPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgbWlwaV9kcGh5X3BkcnYgPSB7Cj4gKyAgICAgICAucHJvYmUgID0gbWlwaV9kcGh5
X3Byb2JlLAo+ICsgICAgICAgLmRyaXZlciA9IHsKPiArICAgICAgICAgICAgICAgLm5hbWUgICA9
ICJtaXBpX2RwaHkiLAo+ICsgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRj
aF9wdHIobXRrX21pcGlfZHBoeV9vZl9tYXRjaCksCj4gKyAgICAgICB9LAo+ICt9Owo+ICsKPiAr
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcihtaXBpX2RwaHlfcGRydik7Cj4gKwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
