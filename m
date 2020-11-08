Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2465EC388F7
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 02:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B085620719
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 02:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPAsbt6Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTT6UkXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B085620719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2NfoTrm9RnLe1HV6kyOBkz9M8KUy1rIKUJV8yw6oSX8=; b=jPAsbt6Zp2Jb2GIv6mMW/ivpJ
	IG2Jh/ixkxc6PynrDxHA4CjvTQENZchWCFbL/1UxFvRc5Rzd69F/DGD2yUtWes5yl9LauNVXkJEtA
	P0UeM39LZR+py79xipABR81h+3gk+cU2CJ+D1pMSElehXeIyG/frKCaJeHWOxg2jCeVGLrRB4KkRV
	9WBICv+Gt1R+PcUzPi/GlPZzCTlqnZj9A5gzq5tpCyOaEQ15vW7F0rPJ9fDnm18jsktwTvZToqLfl
	WYeHYQYq7OwFtoB64GCgZpmQ5WDPHSKc/eKp0JsLQovUVZ8INR4GJB3bTdwdrX55hjMVUBhaBpM+i
	ldLFZK7AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbaua-0004Br-20; Sun, 08 Nov 2020 02:58:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbauW-0004BE-Pn; Sun, 08 Nov 2020 02:58:34 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 991602087E;
 Sun,  8 Nov 2020 02:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604804310;
 bh=sfNhlZT9sWHAz6wHIE60Y0IGc1gStzzQXPPJyfeVaW8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CTT6UkXx7QGP/1Jmi662ReTj0HRqe+ezsLZcpO4VHPY4kUGfY2IP9tOFksIRpUdY/
 ayDtplGACaNEfHObQJOX1oTGFf+NuBOIMobhR40a2hHbLTkpqzacEx/p+6oUjOLOOm
 nKwtPG+a0uJoPo+4YzDifnHTdEjmcfPLYEUSQPN8=
Received: by mail-ej1-f43.google.com with SMTP id 7so7406107ejm.0;
 Sat, 07 Nov 2020 18:58:30 -0800 (PST)
X-Gm-Message-State: AOAM533AJhnfTslLfZ5oiVrip5LQloQk2SiL5TSltuPYbYAWVxc55SU5
 Do1pJhqJk4b/zujAnl15M6q+IVqLRi5yfxVctg==
X-Google-Smtp-Source: ABdhPJxqh/Z+g8ZrVqGhyRSVVYKdQJY+9PddAI8gePCHww4scCiVWGrObsDxgbjea1CTpdbkGoNKkI2KltEkViR5CME=
X-Received: by 2002:a17:906:cc4f:: with SMTP id
 mm15mr9063951ejb.267.1604804309188; 
 Sat, 07 Nov 2020 18:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20201013085512.12857-1-bernard@vivo.com>
 <CAAOTY__r-2aQLK+oy6uRFnu3xExngBYrSAQ7jCfhWx+Ti0UgFw@mail.gmail.com>
In-Reply-To: <CAAOTY__r-2aQLK+oy6uRFnu3xExngBYrSAQ7jCfhWx+Ti0UgFw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 10:58:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-EgZuxG=6J2WgO7awAcOePXuH8a6_rHENM7C45m-H7ew@mail.gmail.com>
Message-ID: <CAAOTY_-EgZuxG=6J2WgO7awAcOePXuH8a6_rHENM7C45m-H7ew@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Optimize functions which do not need to
 return
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_215833_048552_F48B1AB1 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: opensource.kernel@vivo.com, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJlcm5hcmQ6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjDlubQxMOaciDE35pelIOmAseWFrSDkuIrljYgxMDo1MOWvq+mBk++8mgo+Cj4gQmVybmFy
ZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPiDmlrwgMjAyMOW5tDEw5pyIMTPml6Ug6YCx5LqMIOS4
i+WNiDQ6NTXlr6vpgZPvvJoKPiA+Cj4gPiBGdW5jdGlvbiBtdGtfaGRtaV9hdWRfc2V0X2lucHV0
IGFsd2F5cyByZXR1cm4gMCwgbm8gbmVlZCB0bwo+ID4ga2VlcCB0aGUgcmV0dXJuIHZhbHVlLiBG
dW5jdGlvbnMgbXRrX2hkbWlfYXVkX2VuYWJsZV9wYWNrZXQgJgo+ID4gbXRrX2hkbWlfYXVkX29u
X29mZl9od19uY3RzIGFyZSB0aGUgc2FtZSwgdGhlc2UgdHdvIGZ1bmN0aW9ucwo+ID4ganVzdCBj
YWxsIG5leHQgZnVuY3Rpb25zLiBNYXliZSBpdGBzIGEgYml0IGJldHRlciB0byBqdXN0IGNhbGwK
PiA+IHRoZSBpbm5lciBmdW5jdGlvbi4KPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBb
MV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFv
IDxiZXJuYXJkQHZpdm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgfCAyNyArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gaW5kZXggYTk3NzI1NjgwZDRlLi5mMWQ5ODdkZjA1
NTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiA+IEBAIC04NzAs
MTkgKzg3MCw4IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3ZpZGVvX3NldF9kaXNwbGF5X21vZGUo
c3RydWN0IG10a19oZG1pICpoZG1pLAo+ID4gICAgICAgICBtdGtfaGRtaV9od19tc2ljX3NldHRp
bmcoaGRtaSwgbW9kZSk7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW50IG10a19oZG1pX2F1ZF9l
bmFibGVfcGFja2V0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgYm9vbCBlbmFibGUpCj4gPiAtewo+
ID4gLSAgICAgICBtdGtfaGRtaV9od19zZW5kX2F1ZF9wYWNrZXQoaGRtaSwgZW5hYmxlKTsKPiA+
IC0gICAgICAgcmV0dXJuIDA7Cj4gPiAtfQo+ID4KPiA+IC1zdGF0aWMgaW50IG10a19oZG1pX2F1
ZF9vbl9vZmZfaHdfbmN0cyhzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIGJvb2wgb24pCj4gPiAtewo+
ID4gLSAgICAgICBtdGtfaGRtaV9od19uY3RzX2VuYWJsZShoZG1pLCBvbik7Cj4gPiAtICAgICAg
IHJldHVybiAwOwo+ID4gLX0KPiA+IC0KPiA+IC1zdGF0aWMgaW50IG10a19oZG1pX2F1ZF9zZXRf
aW5wdXQoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ID4gK3N0YXRpYyB2b2lkIG10a19oZG1pX2F1
ZF9zZXRfaW5wdXQoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ID4gIHsKPiA+ICAgICAgICAgZW51
bSBoZG1pX2F1ZF9jaGFubmVsX3R5cGUgY2hhbl90eXBlOwo+ID4gICAgICAgICB1OCBjaGFuX2Nv
dW50Owo+ID4gQEAgLTkxMiw4ICs5MDEsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZF9zZXRf
aW5wdXQoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ID4gICAgICAgICBjaGFuX2NvdW50ID0gbXRr
X2hkbWlfYXVkX2dldF9jaG5sX2NvdW50KGNoYW5fdHlwZSk7Cj4gPiAgICAgICAgIG10a19oZG1p
X2h3X2F1ZF9zZXRfaTJzX2NoYW5fbnVtKGhkbWksIGNoYW5fdHlwZSwgY2hhbl9jb3VudCk7Cj4g
PiAgICAgICAgIG10a19oZG1pX2h3X2F1ZF9zZXRfaW5wdXRfdHlwZShoZG1pLCBoZG1pLT5hdWRf
cGFyYW0uYXVkX2lucHV0X3R5cGUpOwo+ID4gLQo+ID4gLSAgICAgICByZXR1cm4gMDsKPiA+ICB9
Cj4gPgo+ID4gIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkX3NldF9zcmMoc3RydWN0IG10a19oZG1p
ICpoZG1pLAo+ID4gQEAgLTkyMSw3ICs5MDgsNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZF9z
ZXRfc3JjKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwKPiA+ICB7Cj4gPiAgICAgICAgIHVuc2lnbmVk
IGludCBzYW1wbGVfcmF0ZSA9IGhkbWktPmF1ZF9wYXJhbS5jb2RlY19wYXJhbXMuc2FtcGxlX3Jh
dGU7Cj4gPgo+ID4gLSAgICAgICBtdGtfaGRtaV9hdWRfb25fb2ZmX2h3X25jdHMoaGRtaSwgZmFs
c2UpOwo+ID4gKyAgICAgICBtdGtfaGRtaV9od19uY3RzX2VuYWJsZShoZG1pLCBmYWxzZSk7Cj4g
PiAgICAgICAgIG10a19oZG1pX2h3X2F1ZF9zcmNfZGlzYWJsZShoZG1pKTsKPiA+ICAgICAgICAg
bXRrX2hkbWlfY2xlYXJfYml0cyhoZG1pLCBHUkxfQ0ZHMiwgQ0ZHMl9BQ0xLX0lOVik7Cj4gPgo+
ID4gQEAgLTk1OSw3ICs5NDYsNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZF9vdXRwdXRfY29u
ZmlnKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRpc3BsYXlfbW9kZSkKPiA+ICB7
Cj4gPiAgICAgICAgIG10a19oZG1pX2h3X2F1ZF9tdXRlKGhkbWkpOwo+ID4gLSAgICAgICBtdGtf
aGRtaV9hdWRfZW5hYmxlX3BhY2tldChoZG1pLCBmYWxzZSk7Cj4gPiArICAgICAgIG10a19oZG1p
X2h3X3NlbmRfYXVkX3BhY2tldChoZG1pLCBmYWxzZSk7Cj4gPgo+ID4gICAgICAgICBtdGtfaGRt
aV9hdWRfc2V0X2lucHV0KGhkbWkpOwo+ID4gICAgICAgICBtdGtfaGRtaV9hdWRfc2V0X3NyYyho
ZG1pLCBkaXNwbGF5X21vZGUpOwo+ID4gQEAgLTk2OCw4ICs5NTUsOCBAQCBzdGF0aWMgaW50IG10
a19oZG1pX2F1ZF9vdXRwdXRfY29uZmlnKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwKPiA+Cj4gPiAg
ICAgICAgIHVzbGVlcF9yYW5nZSg1MCwgMTAwKTsKPiA+Cj4gPiAtICAgICAgIG10a19oZG1pX2F1
ZF9vbl9vZmZfaHdfbmN0cyhoZG1pLCB0cnVlKTsKPiA+IC0gICAgICAgbXRrX2hkbWlfYXVkX2Vu
YWJsZV9wYWNrZXQoaGRtaSwgdHJ1ZSk7Cj4gPiArICAgICAgIG10a19oZG1pX2h3X25jdHNfZW5h
YmxlKGhkbWksIHRydWUpOwo+ID4gKyAgICAgICBtdGtfaGRtaV9od19zZW5kX2F1ZF9wYWNrZXQo
aGRtaSwgdHJ1ZSk7Cj4gPiAgICAgICAgIG10a19oZG1pX2h3X2F1ZF91bm11dGUoaGRtaSk7Cj4g
PiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+IEBAIC0xMDk3LDEzICsxMDg0LDEzIEBAIHN0
YXRpYyBpbnQgbXRrX2hkbWlfb3V0cHV0X2luaXQoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ID4K
PiA+ICBzdGF0aWMgdm9pZCBtdGtfaGRtaV9hdWRpb19lbmFibGUoc3RydWN0IG10a19oZG1pICpo
ZG1pKQo+ID4gIHsKPiA+IC0gICAgICAgbXRrX2hkbWlfYXVkX2VuYWJsZV9wYWNrZXQoaGRtaSwg
dHJ1ZSk7Cj4gPiArICAgICAgIG10a19oZG1pX2h3X3NlbmRfYXVkX3BhY2tldChoZG1pLCB0cnVl
KTsKPiA+ICAgICAgICAgaGRtaS0+YXVkaW9fZW5hYmxlID0gdHJ1ZTsKPiA+ICB9Cj4gPgo+ID4g
IHN0YXRpYyB2b2lkIG10a19oZG1pX2F1ZGlvX2Rpc2FibGUoc3RydWN0IG10a19oZG1pICpoZG1p
KQo+ID4gIHsKPiA+IC0gICAgICAgbXRrX2hkbWlfYXVkX2VuYWJsZV9wYWNrZXQoaGRtaSwgZmFs
c2UpOwo+ID4gKyAgICAgICBtdGtfaGRtaV9od19zZW5kX2F1ZF9wYWNrZXQoaGRtaSwgZmFsc2Up
Owo+ID4gICAgICAgICBoZG1pLT5hdWRpb19lbmFibGUgPSBmYWxzZTsKPiA+ICB9Cj4gPgo+ID4g
LS0KPiA+IDIuMjguMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
