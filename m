Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D00CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D9820848
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FWhTfjtp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLBWb4iD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D9820848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhllDn2a+kGdLVl2zJ4Zj1aC2lNjYwuz++ZxVNXidzc=; b=FWhTfjtpUfNw4AkxdKm9tspKg
	D/vfVGEhQI4gjC2+1kv2tcM9ip42T04Dm9r259Uh0gmemwqhb8TxadYYpBKDuidT66N7VPXMHgSGH
	Xzi7Rmg1WQZyQ+1TZBxJGumyq49i6jye5dLQOGh1orZikWs5CVEjilVgaUzPnryYKR+gHNHh3E8FG
	xMrulC5eS8vwYKhDwrZiYMVUv1b52D6B/HEc1ygqLy0IV0/sFTqe6yIafHMv9uOJYOJeyBK86lIV6
	DeFunFBxvPWK+V1NpmfatyHXJaJ7j5/yFOocCnBOHMNUW3hJUePsxFYczxfxCR3xB5nhvz30Effev
	8geXvZdhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSgOH-0000Kg-71; Wed, 14 Oct 2020 13:00:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgO3-0000Dx-UC; Wed, 14 Oct 2020 13:00:17 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0795208B3;
 Wed, 14 Oct 2020 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602680411;
 bh=EjQyMXBgmkGopUQIOpSQ0qJ6aFXvAlg6I7g92NkSgMQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fLBWb4iDrpBUKe6rxTTtf70Eda3+Q02E2x6UnykIAPRRGz17bipaL0LMokMsx7Hsn
 XSss2EcKy7Wg9vQcmOrQPyfZJj6y+jF9GSwl8qWWWzNNfZBONfVakXBt1e7ETe7WZK
 klZDLKm6mkfNyobaMG16UmAXDuZBsz5C46GdbmMs=
Received: by mail-ed1-f41.google.com with SMTP id cq12so3043832edb.2;
 Wed, 14 Oct 2020 06:00:10 -0700 (PDT)
X-Gm-Message-State: AOAM5332UikkYt9v8BZocyDQSkOX0/4Do+9uMupDTvl16xsQQkm4zbIi
 pQi2exw+3nHryOS8Rh1TobrI5qemwZGYEm4PKg==
X-Google-Smtp-Source: ABdhPJx3leXWo1y/6rJJ+KAWg7Fbkc30MfGqk8ihqIGPrl/962tukEUoCc8WEJHlE62caGzULO47VlzVmHwMP2PHfsk=
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr5129675edr.72.1602680409031; 
 Wed, 14 Oct 2020 06:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
In-Reply-To: <20201013181924.4143303-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Oct 2020 20:59:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
Message-ID: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_090012_689918_8740D1A3 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMTTml6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBIRE1JIG9uIE1UODE2Ny4gSERNSSBvbiBNVDgxNjcgaXMgc2ltaWxhciB0bwo+IE1UODE3
My9NVDI3MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNf
Q0ZHMjAKCkkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8g
TWVkaWF0ZWsgSERNSQpiaW5kaW5nIGRvY3VtZW50IFsxXSwgdGhlIHNlY29uZCBwYXJhbWV0ZXIg
b2YgbWVkaWF0ZWssc3lzY29uLWhkbWkgaXMKdGhlIHJlZ2lzdGVyIG9mZnNldC4gSSB0aGluayB5
b3UgY291bGQgc2V0IHJlZ2lzdGVyIG9mZnNldCB0byAweDgwMApmb3IgbXQ4MTY3LgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGhkbWkudHh0P2g9djUuOQoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAt
LS0KPgo+IENoYW5nZWxvZzoKPiB2MjogZml4IG5hbWUgb2YgcGRhdGEgc3RydWN0dXJlCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICB8IDcgKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oIHwgMiArKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiBpbmRleCA1NzM3MGMwMzY0OTcuLjQ4NGVhOWNkNjU0YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAgLTE4MzUsOSArMTgzNSwxNiBAQCBzdGF0aWMgc3RydWN0
IG10a19oZG1pX2RhdGEgbXQ4MTczX2hkbWlfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuc3lz
X2NmZzIwID0gSERNSV9TWVNfQ0ZHMjAsCj4gIH07Cj4KPiArc3RhdGljIHN0cnVjdCBtdGtfaGRt
aV9kYXRhIG10ODE2N19oZG1pX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLnN5c19jZmcxYyA9
IE1UODE2N19IRE1JX1NZU19DRkcxQywKPiArICAgICAgIC5zeXNfY2ZnMjAgPSBNVDgxNjdfSERN
SV9TWVNfQ0ZHMjAsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE3My1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX2hkbWlfZHJp
dmVyX2RhdGEgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWhk
bWkiLAo+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdfaGRtaV9kcml2ZXJfZGF0YSB9LAo+ICAg
ICAgICAge30KPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3Mu
aAo+IGluZGV4IDIwNTBiYTQ1YjIzYS4uYTBmOWMzNjdkN2FhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oCj4gQEAgLTE5NSw2ICsxOTUsNyBAQAo+ICAjZGVm
aW5lIEdFTl9SR0IgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgwIDw8IDcpCj4KPiAg
I2RlZmluZSBIRE1JX1NZU19DRkcxQyAgICAgICAgIDB4MDAwCj4gKyNkZWZpbmUgTVQ4MTY3X0hE
TUlfU1lTX0NGRzFDICAweDgwMAo+ICAjZGVmaW5lIEhETUlfT04gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIEhETUlfUlNUICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMSkKPiAgI2RlZmluZSBBTkxHX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMikKPiBAQCAtMjExLDYgKzIxMiw3IEBACj4gICNkZWZpbmUgSFRQTEdfUElOX1NF
TF9PRkYgICAgICAgICAgICAgIEJJVCgzMCkKPiAgI2RlZmluZSBBRVNfRUZVU0VfRU5BQkxFICAg
ICAgICAgICAgICAgQklUKDMxKQo+ICAjZGVmaW5lIEhETUlfU1lTX0NGRzIwICAgICAgICAgMHgw
MDQKPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMjAgIDB4ODA0Cj4gICNkZWZpbmUgREVF
UF9DT0xPUl9NT0RFX01BU0sgICAgICAgICAgICgzIDw8IDEpCj4gICNkZWZpbmUgQ09MT1JfOEJJ
VF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgMSkKPiAgI2RlZmluZSBDT0xPUl8x
MEJJVF9NT0RFICAgICAgICAgICAgICAgKDEgPDwgMSkKPiAtLQo+IDIuMjguMAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
