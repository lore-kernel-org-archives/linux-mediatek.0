Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C27EC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 22:59:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D22206C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 22:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3qx5O4u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w3AXvs40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18D22206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q+0lN2VueiXil3y0RAf3gGVF0ySBedzwMwLJ6ye0S7c=; b=o3qx5O4uywRKkx2KcCvIRKolc
	0r9xZVWTozOxzcCkQHsemK90tuCkeh9x/S4PjhFmJxj4thO1o6nosMRCuYwGx32M43qiPAUBTzpOX
	FKSyj7b5PVnUHUejYw2sYWdiCoSb8pps1ig9Kz1cTDWCCekt/53bwKsNf7Nt6h+hghK+qkiB9n69m
	Z2lXrbEm8A0qMV9N6TGSanCQIu2eJI7TM94I0OqZ/5tjPy++It55tApNHxDMqDjqRwgXkbgz45t3r
	Rds1ggLSNgkEa+oqjE7lmLX9FF0m677jaRHCGsQ1+R7Fo9F6AV2CFmwrz9tB5VmbQz2dSQGy7pUQa
	Rjwl6UupQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDFFU-0004Oy-NG; Tue, 01 Sep 2020 22:59:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDFFR-0004Nv-5J; Tue, 01 Sep 2020 22:59:30 +0000
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20A59214D8;
 Tue,  1 Sep 2020 22:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599001167;
 bh=6+prf8hd/dD/hqUCmuKJ8TIy6p+8/B1mAtJifqlir+A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w3AXvs40WAjhXqbXqQI1GI9Yf7hMmKxb/eEPBdI1ctXxmiKOG5KwrJHt7sbbu9Re4
 4sgXHSx9tWBEQYbqv9Pjkq506kssAi0Zcp7Cv+il7ZTLRd/z6hHjzlDnpX/M0hpjIY
 EmThNZ/vhzh/HMmvip5IgkrHvzr7gvSKWbKBXIAc=
Received: by mail-ej1-f48.google.com with SMTP id i26so3919162ejb.12;
 Tue, 01 Sep 2020 15:59:27 -0700 (PDT)
X-Gm-Message-State: AOAM530EOY7/Z+8v7IND6EVgi0glhZHsxo2s7Wyp6gIr0WmwvLF6e9+p
 Hv7ktk90KYRP36rCda/TYMusczMOYMZxL61zVg==
X-Google-Smtp-Source: ABdhPJzjHDOXSGz7glhl+6OiZP2SWKZjyjWU9LL5WqhptcI1ntuiSPhKiGIOKRXMhN7HiiRtHc6HA76qv/dWjb/Q6CM=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr3598885ejl.375.1599001165547; 
 Tue, 01 Sep 2020 15:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200826063533eucas1p1fad2f2afb117b026081468d2d840ab0f@eucas1p1.samsung.com>
 <20200826063316.23486-1-m.szyprowski@samsung.com>
 <20200826063316.23486-11-m.szyprowski@samsung.com>
In-Reply-To: <20200826063316.23486-11-m.szyprowski@samsung.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 2 Sep 2020 06:59:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=GFMW2QQKjxWHeZLYTDo3+=j=wZ62t9LrSkfD79ji9A@mail.gmail.com>
Message-ID: <CAAOTY_9=GFMW2QQKjxWHeZLYTDo3+=j=wZ62t9LrSkfD79ji9A@mail.gmail.com>
Subject: Re: [PATCH v9 10/32] drm: mediatek: use common helper for a
 scatterlist contiguity check
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_185929_344820_728889A7 
X-CRM114-Status: GOOD (  21.51  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hcmVrOgoKTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiDm
lrwgMjAyMOW5tDjmnIgyNuaXpSDpgLHkuIkg5LiL5Y2IMjozNeWvq+mBk++8mgo+Cj4gVXNlIGNv
bW1vbiBoZWxwZXIgZm9yIGNoZWNraW5nIHRoZSBjb250aWd1aXR5IG9mIHRoZSBpbXBvcnRlZCBk
bWEtYnVmIGFuZAo+IGRvIHRoaXMgY2hlY2sgYmVmb3JlIGFsbG9jYXRpbmcgcmVzb3VyY2VzLCBz
byB0aGUgZXJyb3IgcGF0aCBpcyBzaW1wbGVyLgo+CgpBY2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dz
a2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZ2VtLmMgfCAyOCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gaW5kZXggNjE5MGNjM2I3YjBkLi4zNjU0
ZWM3MzIwMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Z2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+IEBA
IC0yMTIsMzcgKzIxMiwyMSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVf
aW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFi
bGUgKnNnKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RybV9nZW1fb2JqICptdGtfZ2VtOwo+
IC0gICAgICAgaW50IHJldDsKPiAtICAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqczsKPiAtICAg
ICAgIHVuc2lnbmVkIGludCBpOwo+IC0gICAgICAgZG1hX2FkZHJfdCBleHBlY3RlZDsKPgo+IC0g
ICAgICAgbXRrX2dlbSA9IG10a19kcm1fZ2VtX2luaXQoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6
ZSk7Cj4gKyAgICAgICAvKiBjaGVjayBpZiB0aGUgZW50cmllcyBpbiB0aGUgc2dfdGFibGUgYXJl
IGNvbnRpZ3VvdXMgKi8KPiArICAgICAgIGlmIChkcm1fcHJpbWVfZ2V0X2NvbnRpZ3VvdXNfc2l6
ZShzZykgPCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSkgewo+ICsgICAgICAgICAgICAgICBEUk1fRVJS
T1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOwo+ICsgICAgICAgfQo+Cj4gKyAgICAgICBtdGtfZ2VtID0gbXRr
X2RybV9nZW1faW5pdChkZXYsIGF0dGFjaC0+ZG1hYnVmLT5zaXplKTsKPiAgICAgICAgIGlmIChJ
U19FUlIobXRrX2dlbSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfQ0FTVChtdGtfZ2Vt
KTsKPgo+IC0gICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFfYWRkcmVzcyhzZy0+c2dsKTsKPiAtICAg
ICAgIGZvcl9lYWNoX3NnKHNnLT5zZ2wsIHMsIHNnLT5uZW50cywgaSkgewo+IC0gICAgICAgICAg
ICAgICBpZiAoIXNnX2RtYV9sZW4ocykpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLQo+IC0gICAgICAgICAgICAgICBpZiAoc2dfZG1hX2FkZHJlc3MocykgIT0gZXhwZWN0ZWQp
IHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoInNnX3RhYmxlIGlzIG5vdCBj
b250aWd1b3VzIik7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9nZW1fZnJlZTsKPiAtICAgICAgICAgICAg
ICAgfQo+IC0gICAgICAgICAgICAgICBleHBlY3RlZCA9IHNnX2RtYV9hZGRyZXNzKHMpICsgc2df
ZG1hX2xlbihzKTsKPiAtICAgICAgIH0KPiAtCj4gICAgICAgICBtdGtfZ2VtLT5kbWFfYWRkciA9
IHNnX2RtYV9hZGRyZXNzKHNnLT5zZ2wpOwo+ICAgICAgICAgbXRrX2dlbS0+c2cgPSBzZzsKPgo+
ICAgICAgICAgcmV0dXJuICZtdGtfZ2VtLT5iYXNlOwo+IC0KPiAtZXJyX2dlbV9mcmVlOgo+IC0g
ICAgICAga2ZyZWUobXRrX2dlbSk7Cj4gLSAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ICB9
Cj4KPiAgdm9pZCAqbXRrX2RybV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
