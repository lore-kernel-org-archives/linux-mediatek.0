Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C13CC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 23:17:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCDC2206EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 23:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IhQHES5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYj8rqV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCDC2206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4QtkYGlVOmajtYFSH42rzRrLMSgbetIaxPNbnH3BjTk=; b=IhQHES5ztwTQUKWaJVd/p/Bm7
	E2UmHSGVbb7C9rj/W/kdH4wDMSGbgpZqAR09ZaQDmfZKjarGaddFdJ2vAJiJBdM0di2mo4uDI71aJ
	SxMrTurZm+leGOqGUWYlK7ySiC58yRP1nd4a9siJWNXOzhPdAsPfPyPQK7NfyjxrESFE2SUZAJ2GJ
	7EMreuI4RiVkZB94RvY4Z8q4C8VD2KgwAuz1BiSRebnb0fcmSTtUAJVy9cJl/agQf4QbDp7QIy9Hj
	fXFPtzAu4T+2T3njDWTClYY+dZiGTqpIjjnp7h9O6h66Xb5HngP+ouVDERci4zgrRb4i/ts/Q6yGL
	RCCsbW4Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDFWb-0005c0-It; Tue, 01 Sep 2020 23:17:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDFWW-0005aD-I3; Tue, 01 Sep 2020 23:17:10 +0000
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 035EC20C56;
 Tue,  1 Sep 2020 23:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599002227;
 bh=dEzwxEuUgfYnGt8tTDL/A1NPb+fEcrJH6io3xPpZIAI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZYj8rqV3HROpw6CDvgMVd5hZg5rBDjH4RSJIo5SPOM7Ja7YqDakNre623J7KNMdv9
 zpEb0CzMeczKHCD4/DAAOODJN5n6te/K7xaUjswZj03FpVUJmbOxdsGfuH5owN08yV
 Y8JxqXzezZAiQVMZxYJlE3EINQVxw7bVxJS2ykFo=
Received: by mail-ej1-f48.google.com with SMTP id a26so4029690ejc.2;
 Tue, 01 Sep 2020 16:17:06 -0700 (PDT)
X-Gm-Message-State: AOAM532UnVt/gQl/vi7GzGhqHqmEbRfWdqWN9NlbClgteDYz/IzRtPnW
 yMoWs+ar11QsKCA+egbyzqsnrYc6oOIPqQkecA==
X-Google-Smtp-Source: ABdhPJxjGeMplEAO/cPVthJXCGCEi6FG3fNO07cenYqDxG9mxyLxAmv8N/2WWybtiLb8XagSSQ/Sw0SUTCoZ0nSCAFg=
X-Received: by 2002:a17:906:119b:: with SMTP id
 n27mr3661770eja.124.1599002225526; 
 Tue, 01 Sep 2020 16:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063534eucas1p2647f5e9679f79f568e184b092f743f8b@eucas1p2.samsung.com>
 <20200826063316.23486-12-m.szyprowski@samsung.com>
 <30f20ad6-783b-89c3-17b5-30c6a2587d23@arm.com>
In-Reply-To: <30f20ad6-783b-89c3-17b5-30c6a2587d23@arm.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 2 Sep 2020 07:16:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9BaFZbiGFYjat4vJ-_kEONXxfgcTRPd6aKoeKJ7xxBww@mail.gmail.com>
Message-ID: <CAAOTY_9BaFZbiGFYjat4vJ-_kEONXxfgcTRPd6aKoeKJ7xxBww@mail.gmail.com>
Subject: Re: [PATCH v9 11/32] drm: mediatek: use common helper for extracting
 pages array
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_191708_789248_799C4698 
X-CRM114-Status: GOOD (  18.30  )
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
 Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4g5pa8IDIwMjDlubQ55pyIMuaXpSDp
gLHkuIkg5LiK5Y2IMjo1NeWvq+mBk++8mgo+Cj4gT24gMjAyMC0wOC0yNiAwNzozMiwgTWFyZWsg
U3p5cHJvd3NraSB3cm90ZToKPiA+IFVzZSBjb21tb24gaGVscGVyIGZvciBjb252ZXJ0aW5nIGEg
c2dfdGFibGUgb2JqZWN0IGludG8gc3RydWN0Cj4gPiBwYWdlIHBvaW50ZXIgYXJyYXkuCj4KPiBS
ZXZpZXdlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPgo+IFNpZGUg
bm90ZTogaXMgbXRrX2RybV9nZW1fcHJpbWVfdm1hcCgpIG1pc3NpbmcgYSBjYWxsIHRvCj4gc2df
ZnJlZV90YWJsZShzZ3QpIGJlZm9yZSBpdHMga2ZyZWUoc2d0KT8KClllcywgd2UgbmVlZCBhbm90
aGVyIHBhdGNoIHRvIGZpeCB0aGF0IGJ1ZywgQnV0IGZvciB0aGlzIHBhdGNoLAoKQWNrZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgOSArKy0tLS0t
LS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2Vt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gaW5kZXggMzY1
NGVjNzMyMDI5Li4wNTgzZTU1N2FkMzcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZ2VtLmMKPiA+IEBAIC0yMzMsOSArMjMzLDcgQEAgdm9pZCAqbXRrX2RybV9nZW1f
cHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiA+ICAgewo+ID4gICAgICAg
c3RydWN0IG10a19kcm1fZ2VtX29iaiAqbXRrX2dlbSA9IHRvX210a19nZW1fb2JqKG9iaik7Cj4g
PiAgICAgICBzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiA+IC0gICAgIHN0cnVjdCBzZ19wYWdlX2l0
ZXIgaXRlcjsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBucGFnZXM7Cj4gPiAtICAgICB1bnNpZ25l
ZCBpbnQgaSA9IDA7Cj4gPgo+ID4gICAgICAgaWYgKG10a19nZW0tPmt2YWRkcikKPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIG10a19nZW0tPmt2YWRkcjsKPiA+IEBAIC0yNDksMTEgKzI0Nyw4IEBA
IHZvaWQgKm10a19kcm1fZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
Cj4gPiAgICAgICBpZiAoIW10a19nZW0tPnBhZ2VzKQo+ID4gICAgICAgICAgICAgICBnb3RvIG91
dDsKPiA+Cj4gPiAtICAgICBmb3JfZWFjaF9zZ19wYWdlKHNndC0+c2dsLCAmaXRlciwgc2d0LT5v
cmlnX25lbnRzLCAwKSB7Cj4gPiAtICAgICAgICAgICAgIG10a19nZW0tPnBhZ2VzW2krK10gPSBz
Z19wYWdlX2l0ZXJfcGFnZSgmaXRlcik7Cj4gPiAtICAgICAgICAgICAgIGlmIChpID4gbnBhZ2Vz
KQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gLSAgICAgfQo+ID4gKyAgICAg
ZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMoc2d0LCBtdGtfZ2VtLT5wYWdlcywgTlVM
TCwgbnBhZ2VzKTsKPiA+ICsKPiA+ICAgICAgIG10a19nZW0tPmt2YWRkciA9IHZtYXAobXRrX2dl
bS0+cGFnZXMsIG5wYWdlcywgVk1fTUFQLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwZ3Byb3Rfd3JpdGVjb21iaW5lKFBBR0VfS0VSTkVMKSk7Cj4gPgo+ID4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
