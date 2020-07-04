Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6331C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC23F20826
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBtTqAHQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qphErv5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC23F20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=17Xv1zM2sbX3Nuqbd8+z5PN9ETXmoMs/ic7Bz6JVpoc=; b=ZBtTqAHQkEM3yOxNO1d5EGmyF
	v8Z/BxTO9184wZFoqHYxCVI9cyrnQmFJPI/Rw+uaZBZlFW0rJTe+avG2V+/HKlChfV9tluwuvKI1O
	fqw6ek/taQGDOj5C7APkuGWQWgCKE0WZJK7tP9K4yk8WtPf4h/BdS6mbMWXCZ0qmS8RGKApZ5GgFi
	tP6KNg02l7QAIcjtUsal0UTdYtEjmkYZDIyv0kIvHVJ9/i8/74bvbvqiG7zlRdSTbenjysOnOY96o
	4lLcJq6+bfwvV90s3dtg6U1MTnPoiyPD9PUU6ciM3RYEwWmqq4IKm+Q0XsbHt9pyJ61rymCkc/NPI
	1jETz20LA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrqtr-0002yM-W5; Sat, 04 Jul 2020 22:44:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrqtk-0002wi-E5; Sat, 04 Jul 2020 22:44:44 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B77E20936;
 Sat,  4 Jul 2020 22:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593902676;
 bh=HGgSGquftIEg+O3/L960Fq3DtgWEkOJkDhrJBDZ15I0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qphErv5n9g0GvoBYXQMXIxdFmSYJv9MRdqzYgkgOW6kCBxJuVcZ5LoAaMkQRCChIS
 cgW3VjMz/lnfDZeoerPe4KwpW7I2miJo9oO3mbgh2P/3wV1Byaei14mzz40N7AebKa
 wF+KCjp/Aa8EPSfXv+LKssogIOAOjlUwAgissddI=
Received: by mail-ej1-f43.google.com with SMTP id dr13so38453225ejc.3;
 Sat, 04 Jul 2020 15:44:36 -0700 (PDT)
X-Gm-Message-State: AOAM531UfgI23oIO3Bcav8GEkK5RGVoUtj5DHRwu7XuOkIzJTph9fwE7
 phiI9ira7Lo84FmtJ3Q2tOSpRqlWHtn8xWuDBw==
X-Google-Smtp-Source: ABdhPJyGI56CJJUopDRfi2PrXRe3yWPzbIO1JJLs8s76xIF7oTwpZgYAInIO0RajCi/gzZAVRX1ZkGSFDc4OfwrwIMs=
X-Received: by 2002:a17:906:1044:: with SMTP id
 j4mr37065923ejj.187.1593902674921; 
 Sat, 04 Jul 2020 15:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094115.2448092-1-enric.balletbo@collabora.com>
 <CAAOTY_-uyJiBEDNDv8OvGD6MT6jx-jiH1hM4kc6d1v9f2a525g@mail.gmail.com>
In-Reply-To: <CAAOTY_-uyJiBEDNDv8OvGD6MT6jx-jiH1hM4kc6d1v9f2a525g@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 06:44:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9TA=DVm3Bx8o6HyuPeNGH49oN2nhxYfOVkimDj9Zn1wA@mail.gmail.com>
Message-ID: <CAAOTY_9TA=DVm3Bx8o6HyuPeNGH49oN2nhxYfOVkimDj9Zn1wA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: Remove debug messages for
 function calls
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_184443_409715_3D48AD5C 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NeaciDE55pelIOmAseS6jCDkuIvljYgxMToxM+Wvq+mBk++8mgo+Cj4gSGksIEVucmlj
Ogo+Cj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNv
bT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDHlr6vpgZPvvJoKPiA+Cj4g
PiBFcXVpdmFsZW50IGluZm9ybWF0aW9uIGNhbiBiZSBub3dhZGF5cyBvYnRhaW5lZCB1c2luZyBm
dW5jdGlvbiB0cmFjZXIKPiA+Cj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1maXhlcyBbMV0sIHRo
YW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNl
cnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPgo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICAgfCAxMiArLS0tLS0tLS0t
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jIHwg
IDQgLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiBpbmRleCBiMDU1
NWE3Y2IzYjQuLjE3MmQ2NzI5NDQzNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYwo+ID4gQEAgLTE2MzQsOCArMTYzNCw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVk
aW9fc3RhcnR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCj4gPiAgewo+ID4gICAg
ICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+Cj4g
PiAtICAgICAgIGRldl9kYmcoZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsKPiA+IC0KPiA+ICAgICAg
ICAgbXRrX2hkbWlfYXVkaW9fZW5hYmxlKGhkbWkpOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7
Cj4gPiBAQCAtMTY0NSw4ICsxNjQzLDYgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfYXVkaW9fc2h1
dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+ID4gIHsKPiA+ICAgICAgICAg
c3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPgo+ID4gLSAg
ICAgICBkZXZfZGJnKGRldiwgIiVzXG4iLCBfX2Z1bmNfXyk7Cj4gPiAtCj4gPiAgICAgICAgIG10
a19oZG1pX2F1ZGlvX2Rpc2FibGUoaGRtaSk7Cj4gPiAgfQo+ID4KPiA+IEBAIC0xNjU1LDggKzE2
NTEsNiBAQCBtdGtfaGRtaV9hdWRpb19kaWdpdGFsX211dGUoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhLCBib29sIGVuYWJsZSkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBtdGtfaGRt
aSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4KPiA+IC0gICAgICAgZGV2X2RiZyhk
ZXYsICIlcyglZClcbiIsIF9fZnVuY19fLCBlbmFibGUpOwo+ID4gLQo+ID4gICAgICAgICBpZiAo
ZW5hYmxlKQo+ID4gICAgICAgICAgICAgICAgIG10a19oZG1pX2h3X2F1ZF9tdXRlKGhkbWkpOwo+
ID4gICAgICAgICBlbHNlCj4gPiBAQCAtMTY2OSw4ICsxNjYzLDYgQEAgc3RhdGljIGludCBtdGtf
aGRtaV9hdWRpb19nZXRfZWxkKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgdWludDhf
dCAqYnVmLAo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Cj4gPgo+ID4gLSAgICAgICBkZXZfZGJnKGRldiwgIiVzXG4iLCBfX2Z1
bmNfXyk7Cj4gPiAtCj4gPiAgICAgICAgIG1lbWNweShidWYsIGhkbWktPmNvbm4uZWxkLCBtaW4o
c2l6ZW9mKGhkbWktPmNvbm4uZWxkKSwgbGVuKSk7Cj4gPgo+ID4gICAgICAgICByZXR1cm4gMDsK
PiA+IEBAIC0xNzcwLDcgKzE3NjIsNiBAQCBzdGF0aWMgaW50IG10a19kcm1faGRtaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJy
X2JyaWRnZV9yZW1vdmU7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGRldl9kYmcoZGV2
LCAibWVkaWF0ZWsgaGRtaSBwcm9iZSBzdWNjZXNzXG4iKTsKPiA+ICAgICAgICAgcmV0dXJuIDA7
Cj4gPgo+ID4gIGVycl9icmlkZ2VfcmVtb3ZlOgo+ID4gQEAgLTE3OTMsNyArMTc4NCw3IEBAIHN0
YXRpYyBpbnQgbXRrX2hkbWlfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICAg
IHN0cnVjdCBtdGtfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4KPiA+ICAg
ICAgICAgbXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8oaGRtaSk7Cj4gPiAtICAgICAgIGRldl9k
YmcoZGV2LCAiaGRtaSBzdXNwZW5kIHN1Y2Nlc3MhXG4iKTsKPiA+ICsKPiA+ICAgICAgICAgcmV0
dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IEBAIC0xODA4LDcgKzE3OTksNiBAQCBzdGF0aWMgaW50IG10
a19oZG1pX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgZGV2X2RiZyhkZXYsICJoZG1p
IHJlc3VtZSBzdWNjZXNzIVxuIik7Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+ICAj
ZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3
M19oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNfaGRtaV9w
aHkuYwo+ID4gaW5kZXggYjU1ZjUxNjc1MjA1Li4xYzM1NzUzNzIyMzAgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jCj4gPiBAQCAt
MTU5LDggKzE1OSw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfcGxsX3ByZXBhcmUoc3RydWN0IGNs
a19odyAqaHcpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3Bo
eSA9IHRvX210a19oZG1pX3BoeShodyk7Cj4gPgo+ID4gLSAgICAgICBkZXZfZGJnKGhkbWlfcGh5
LT5kZXYsICIlc1xuIiwgX19mdW5jX18pOwo+ID4gLQo+ID4gICAgICAgICBtdGtfaGRtaV9waHlf
c2V0X2JpdHMoaGRtaV9waHksIEhETUlfQ09OMSwgUkdfSERNSVRYX1BMTF9BVVRPS19FTik7Cj4g
PiAgICAgICAgIG10a19oZG1pX3BoeV9zZXRfYml0cyhoZG1pX3BoeSwgSERNSV9DT04wLCBSR19I
RE1JVFhfUExMX1BPU0RJVik7Cj4gPiAgICAgICAgIG10a19oZG1pX3BoeV9jbGVhcl9iaXRzKGhk
bWlfcGh5LCBIRE1JX0NPTjMsIFJHX0hETUlUWF9NSExDS19FTik7Cj4gPiBAQCAtMTc4LDggKzE3
Niw2IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3BsbF91bnByZXBhcmUoc3RydWN0IGNsa19odyAq
aHcpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSA9IHRv
X210a19oZG1pX3BoeShodyk7Cj4gPgo+ID4gLSAgICAgICBkZXZfZGJnKGhkbWlfcGh5LT5kZXYs
ICIlc1xuIiwgX19mdW5jX18pOwo+ID4gLQo+ID4gICAgICAgICBtdGtfaGRtaV9waHlfY2xlYXJf
Yml0cyhoZG1pX3BoeSwgSERNSV9DT04xLCBSR19IRE1JVFhfUExMX1RYRElWX0VOKTsKPiA+ICAg
ICAgICAgbXRrX2hkbWlfcGh5X2NsZWFyX2JpdHMoaGRtaV9waHksIEhETUlfQ09OMSwgUkdfSERN
SVRYX1BMTF9CSUFTX0xQRl9FTik7Cj4gPiAgICAgICAgIHVzbGVlcF9yYW5nZSgxMDAsIDE1MCk7
Cj4gPiAtLQo+ID4gMi4yNi4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
