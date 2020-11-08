Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398E8C388F7
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:54:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A583220704
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xDQqP85F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQRexxsW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A583220704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J96rdFQj/GWGMj7fvBTiT2Adsbc+Hf1wjaay41x7JMs=; b=xDQqP85FIPp/A7ehgg1diNncz
	GxhLSpOf2KVZ+Q2orkYZ9/QxxIfLe+c65mtWT4eTs+52kt8Gg60/iEoBY9qKPf0+/345b1HidYr0t
	TG9lVjEIhW1cWDueXLAlF1u3RVhxbzh2M4RGuatdtbhHOWqTvfzWAQYCXTYMKXaZfayD8f1Tob3Ue
	aVwqz/lD4p3ALYBT9SChZEi99IowW70gP76Ehd0gETKxpex2JD3Z3TSl/hXKOA30prj1kXzUUlqmF
	mLiFIV8W5JRi6IHFw0eo0EE8+WKg+0WP3XXbYAy0rRgyvuVCBl4y2cTiD80DXAZaii5nMFJuMxvkH
	k1JK+2JrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbZuZ-0000Xl-9g; Sun, 08 Nov 2020 01:54:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbZuV-0000W2-6L; Sun, 08 Nov 2020 01:54:28 +0000
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C39320885;
 Sun,  8 Nov 2020 01:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604800466;
 bh=5N/oNzrmeu3aOtDAHcU54Nt3NGOMRnUUf8OnNnCXcWA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YQRexxsWat85DKj1qNwAszWih5nB4XBXAT4Q8jHuBplQNSlCR7sedt8rn8EdmR2XX
 8JUBFzJnb6WTa+ChRgM1m7sXKKq4zcFtaRjASABA0klqF6iWY09q6gt45UeC0zIL2c
 IzKLPIHYiLedvAtL6T0f4tppdwTf9CqIz0Q5bPHI=
Received: by mail-ed1-f44.google.com with SMTP id t11so5064752edj.13;
 Sat, 07 Nov 2020 17:54:26 -0800 (PST)
X-Gm-Message-State: AOAM532fu+eDq9QYG7mnOiCzr4GpaBlG7A2jsLX1BwRzEPVJ1+58KqwD
 9rN/UO7jV/AjwQwbYcCXqWlISeFDPKovjZF4EQ==
X-Google-Smtp-Source: ABdhPJz9PLvOVHmdu2y0FOkaVh+eRhblRF0PoRpr3EGHovwbntqZAc8CKlK37k+KXdox0EpoWbXJydOn5iVXuc0kGs0=
X-Received: by 2002:a50:8745:: with SMTP id 5mr8862319edv.49.1604800464719;
 Sat, 07 Nov 2020 17:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-4-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-4-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 09:54:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EhnZaLT8hXqQ-ndS_3A391kSDZWKgVEd5tziPfiNs-g@mail.gmail.com>
Message-ID: <CAAOTY__EhnZaLT8hXqQ-ndS_3A391kSDZWKgVEd5tziPfiNs-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: add disp-color MT8167 support
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_205427_412501_D72B0C17 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBkaXNwLWNvbG9yIG9uIE1UODE2NyBTb0MuCgpGb3IgdGhpcyBwYXRjaCwgYXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBSZXZpZXdlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2Vs
b2c6Cj4KPiBWMjogTm8gY2hhbmdlCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2NvbG9yLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMKPiBpbmRleCAz
YWU5YzgxMDg0NWIuLmExMjI3Y2VmYmYzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9jb2xvci5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPgo+ICAjZGVmaW5lIERJU1Bf
Q09MT1JfQ0ZHX01BSU4gICAgICAgICAgICAgICAgICAgIDB4MDQwMAo+ICAjZGVmaW5lIERJU1Bf
Q09MT1JfU1RBUlRfTVQyNzAxICAgICAgICAgICAgICAgICAgICAgICAgMHgwZjAwCj4gKyNkZWZp
bmUgRElTUF9DT0xPUl9TVEFSVF9NVDgxNjcgICAgICAgICAgICAgICAgICAgICAgICAweDA0MDAK
PiAgI2RlZmluZSBESVNQX0NPTE9SX1NUQVJUX01UODE3MyAgICAgICAgICAgICAgICAgICAgICAg
IDB4MGMwMAo+ICAjZGVmaW5lIERJU1BfQ09MT1JfU1RBUlQoY29tcCkgICAgICAgICAgICAgICAg
ICgoY29tcCktPmRhdGEtPmNvbG9yX29mZnNldCkKPiAgI2RlZmluZSBESVNQX0NPTE9SX1dJRFRI
KGNvbXApICAgICAgICAgICAgICAgICAoRElTUF9DT0xPUl9TVEFSVChjb21wKSArIDB4NTApCj4g
QEAgLTE0OCw2ICsxNDksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9k
YXRhIG10MjcwMV9jb2xvcl9kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5jb2xvcl9vZmZzZXQg
PSBESVNQX0NPTE9SX1NUQVJUX01UMjcwMSwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19kaXNwX2NvbG9yX2RhdGEgbXQ4MTY3X2NvbG9yX2RyaXZlcl9kYXRhID0gewo+ICsgICAg
ICAgLmNvbG9yX29mZnNldCA9IERJU1BfQ09MT1JfU1RBUlRfTVQ4MTY3LAo+ICt9Owo+ICsKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhIG10ODE3M19jb2xvcl9kcml2
ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5jb2xvcl9vZmZzZXQgPSBESVNQX0NPTE9SX1NUQVJUX01U
ODE3MywKPiAgfTsKPiBAQCAtMTU1LDYgKzE2MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2Rpc3BfY29sb3JfZGF0YSBtdDgxNzNfY29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kaXNwX2NvbG9yX2RyaXZlcl9kdF9tYXRjaFtd
ID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1jb2xv
ciIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcwMV9jb2xvcl9kcml2ZXJfZGF0YX0sCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLWNvbG9yIiwKPiArICAg
ICAgICAgLmRhdGEgPSAmbXQ4MTY3X2NvbG9yX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3IiLAo+ICAgICAgICAgICAuZGF0
YSA9ICZtdDgxNzNfY29sb3JfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gLS0KPiAyLjI4
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
