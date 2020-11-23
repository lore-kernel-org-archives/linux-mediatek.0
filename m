Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7407EC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:25:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F069020758
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+Sk+H/d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7Cl8QLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F069020758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kr5reGSekQwljgc/oXjKnIOT23lh4SKr1QRaOoheYVU=; b=l+Sk+H/dVtfg+N8MsTQ71S2U4
	Naky/JRJ1ZR6jyBRbj7wLGnpwbHCPy0Y9FIchgh9EU8cpXHHrboYNKvwVnfd+bDebEs4pD+VShkcZ
	etYO5SjeQVmgYMhhg9GsHpZUhzmYSck9y9UfmI9EqJVhMbIoODai6DDocrcOYxA6ZTJZlWIA06FQt
	+uxTpR7c4OZToMFCDWOdfSa0fH8S3V29g4llnCMTVTpj6GM6fTPLtouk6MqKoVabS/HAB2NZul/Gu
	mwR3ocJXFUUOrytJB9lnWkLl/QvgwYizB4VcAtlcMEd2w1Cjm0S6thlsceGmr3yYMGnJWfsJUFyt9
	Q2n50WOUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCm3-0005uf-E6; Mon, 23 Nov 2020 14:24:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCly-0005sj-Id; Mon, 23 Nov 2020 14:24:55 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFAA02080A;
 Mon, 23 Nov 2020 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141492;
 bh=lZCzl0johvQt4EzTRuzuNOP1KrMWLVUidQpy3aajsgI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P7Cl8QLhNbYBIQgtslh8lQHuMSb5dwsxLuIMs471DjcfDe77f731+wCIaQtkt4lE5
 6v4HWbmA9N8ofbbC9L7dBJTZ2RrjUH7xO/KvD2C2flmYMHJVmcqEE6yIoDEnue6W4S
 etwFgMU6Y0Gj/NoGkwTdMGIoEwyxaCkY9nH9T9oY=
Received: by mail-ej1-f46.google.com with SMTP id mc24so2447007ejb.6;
 Mon, 23 Nov 2020 06:24:51 -0800 (PST)
X-Gm-Message-State: AOAM533R8xDIHq8wBgHuz5m+PhjbbI0YRzuNtODPad2lbjxNCT9xR2pX
 0YU4g1VZ3jAv4cjNbN3NQiNEVmfXIcMNld/pwg==
X-Google-Smtp-Source: ABdhPJyoAB6xM6vm0HI3JsU62A3qbHNDSlXsLXP70jZX/dBoCx2jDlI/HbodoBhD1sIO1TUirrsog/XvxZvpcsWvhTo=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr42478451ejy.63.1606141490066; 
 Mon, 23 Nov 2020 06:24:50 -0800 (PST)
MIME-Version: 1.0
References: <d6f1943aaf58bb0ca527e048406e09cf387a12b0.1599166624.git.robin.murphy@arm.com>
In-Reply-To: <d6f1943aaf58bb0ca527e048406e09cf387a12b0.1599166624.git.robin.murphy@arm.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:24:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9TObKy8j+A1Wzo61dhqeWwfxW2NY6wTN_obGL6-fveww@mail.gmail.com>
Message-ID: <CAAOTY_9TObKy8j+A1Wzo61dhqeWwfxW2NY6wTN_obGL6-fveww@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop local dma_parms
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_092455_077706_333D5973 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJvYmluOgoKUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4g5pa8IDIwMjDl
ubQ55pyINOaXpSDpgLHkupQg5LiK5Y2INDo1OeWvq+mBk++8mgo+Cj4gU2luY2UgY29tbWl0IDk0
OTViN2U5MmY3MSAoImRyaXZlciBjb3JlOiBwbGF0Zm9ybTogSW5pdGlhbGl6ZSBkbWFfcGFybXMK
PiBmb3IgcGxhdGZvcm0gZGV2aWNlcyIpLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIGFscmVhZHkg
cHJvdmlkZXMgYQo+IGRtYV9wYXJtcyBzdHJ1Y3R1cmUsIHNvIHdlIGNhbiBzYXZlIGFsbG9jYXRp
bmcgYW5vdGhlciBvbmUuCj4KPiBBbHNvIHRoZSBETUEgc2VnbWVudCBzaXplIGlzIHNpbXBseSBh
IHNpemUsIG5vdCBhIGJpdG1hc2suCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFd
LCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4u
bXVycGh5QGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmggfCAgMiAtLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYwo+IGluZGV4IDA0MGE4ZjM5M2ZlMi4uMzk0MWY2ZjZiMDAzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtMjIxLDIxICsyMjEsMTAgQEAgc3Rh
dGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4gICAgICAg
ICAgKiBDb25maWd1cmUgdGhlIERNQSBzZWdtZW50IHNpemUgdG8gbWFrZSBzdXJlIHdlIGdldCBj
b250aWd1b3VzIElPVkEKPiAgICAgICAgICAqIHdoZW4gaW1wb3J0aW5nIFBSSU1FIGJ1ZmZlcnMu
Cj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICghZG1hX2Rldi0+ZG1hX3Bhcm1zKSB7Cj4gLSAg
ICAgICAgICAgICAgIHByaXZhdGUtPmRtYV9wYXJtc19hbGxvY2F0ZWQgPSB0cnVlOwo+IC0gICAg
ICAgICAgICAgICBkbWFfZGV2LT5kbWFfcGFybXMgPQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGRldm1fa3phbGxvYyhkcm0tPmRldiwgc2l6ZW9mKCpkbWFfZGV2LT5kbWFfcGFybXMpLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiAtICAgICAg
IH0KPiAtICAgICAgIGlmICghZG1hX2Rldi0+ZG1hX3Bhcm1zKSB7Cj4gLSAgICAgICAgICAgICAg
IHJldCA9IC1FTk9NRU07Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyX2NvbXBvbmVudF91bmJp
bmQ7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgcmV0ID0gZG1hX3NldF9tYXhfc2VnX3NpemUo
ZG1hX2RldiwgKHVuc2lnbmVkIGludClETUFfQklUX01BU0soMzIpKTsKPiArICAgICAgIHJldCA9
IGRtYV9zZXRfbWF4X3NlZ19zaXplKGRtYV9kZXYsIFVJTlRfTUFYKTsKPiAgICAgICAgIGlmIChy
ZXQpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkbWFfZGV2LCAiRmFpbGVkIHRvIHNldCBE
TUEgc2VnbWVudCBzaXplXG4iKTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfdW5zZXRfZG1h
X3Bhcm1zOwo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jb21wb25lbnRfdW5iaW5kOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICAvKgo+IEBAIC0yNDYsMTYgKzIzNSwxMyBAQCBzdGF0aWMgaW50
IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgICAgICAgIGRybS0+
aXJxX2VuYWJsZWQgPSB0cnVlOwo+ICAgICAgICAgcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwg
TUFYX0NSVEMpOwo+ICAgICAgICAgaWYgKHJldCA8IDApCj4gLSAgICAgICAgICAgICAgIGdvdG8g
ZXJyX3Vuc2V0X2RtYV9wYXJtczsKPiArICAgICAgICAgICAgICAgZ290byBlcnJfY29tcG9uZW50
X3VuYmluZDsKPgo+ICAgICAgICAgZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybSk7Cj4gICAg
ICAgICBkcm1fbW9kZV9jb25maWdfcmVzZXQoZHJtKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4K
PiAtZXJyX3Vuc2V0X2RtYV9wYXJtczoKPiAtICAgICAgIGlmIChwcml2YXRlLT5kbWFfcGFybXNf
YWxsb2NhdGVkKQo+IC0gICAgICAgICAgICAgICBkbWFfZGV2LT5kbWFfcGFybXMgPSBOVUxMOwo+
ICBlcnJfY29tcG9uZW50X3VuYmluZDoKPiAgICAgICAgIGNvbXBvbmVudF91bmJpbmRfYWxsKGRy
bS0+ZGV2LCBkcm0pOwo+Cj4gQEAgLTI2OSw5ICsyNTUsNiBAQCBzdGF0aWMgdm9pZCBtdGtfZHJt
X2ttc19kZWluaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgICAgICAgIGRybV9rbXNfaGVs
cGVyX3BvbGxfZmluaShkcm0pOwo+ICAgICAgICAgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24o
ZHJtKTsKPgo+IC0gICAgICAgaWYgKHByaXZhdGUtPmRtYV9wYXJtc19hbGxvY2F0ZWQpCj4gLSAg
ICAgICAgICAgICAgIHByaXZhdGUtPmRtYV9kZXYtPmRtYV9wYXJtcyA9IE5VTEw7Cj4gLQo+ICAg
ICAgICAgY29tcG9uZW50X3VuYmluZF9hbGwoZHJtLT5kZXYsIGRybSk7Cj4gIH0KPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oCj4gaW5kZXggYjViZTYzZTUzMTc2Li42YWZk
MGI1ZjJiOTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaAo+IEBA
IC00NCw4ICs0NCw2IEBAIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgewo+ICAgICAgICAgc3RydWN0
IG10a19kZHBfY29tcCAqZGRwX2NvbXBbRERQX0NPTVBPTkVOVF9JRF9NQVhdOwo+ICAgICAgICAg
Y29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSAqZGF0YTsKPiAgICAgICAgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdXNwZW5kX3N0YXRlOwo+IC0KPiAtICAgICAgIGJvb2wgZG1h
X3Bhcm1zX2FsbG9jYXRlZDsKPiAgfTsKPgo+ICBleHRlcm4gc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBtdGtfZGRwX2RyaXZlcjsKPiAtLQo+IDIuMjguMC5kaXJ0eQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
