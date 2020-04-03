Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5B3C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 15:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD96206A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 15:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q0gvpOc3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl+CUr5g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD96206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTlsAQRJtZZfmzKkkZw7CHGEQh6bCDn252q1AIaTs+Y=; b=q0gvpOc3if1TDm
	mLCWSYgDQ/oaZN/YzXbGFX6ksn49RL3n4GN/vBVLFlRXJ7huq1znWcbThN1cxMr80x0fSHf9L8ox0
	8cxgGm9uwvFSwAxP6Qx04TeZVkNe7DJGcKQSWGPuLG48aHiRWoeXCDQiDE8T7XWUxf8lCizRq+HFh
	tpFKc6hzC57vzj0vQVRJVsXrE3+19wnGZoe6HYLIqhcu9RLoL3EPN3pH3sQpM8RkK2bxamiDx4iJy
	zwn49I9xk/U/w7KuSRlnO2pBz2cUdaXppTLBZtApQiMTlfKTUr+wV8wOhkDaJfsPz7lLg+Ywf6mjz
	ktIQZK+fqVUWocXOEDVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKOA8-0004Rw-W7; Fri, 03 Apr 2020 15:23:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKOA5-0004R5-VK
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 15:23:15 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEEB02145D
 for <linux-mediatek@lists.infradead.org>; Fri,  3 Apr 2020 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585927391;
 bh=VgTn9bcNOSD9uXQoi/BYbHBZqU6U/bPHJOYKAow0HLw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fl+CUr5gI6cRDR2adWBoB4qmj+hGFXzEB++RrxblKX0YtD3VLO2fG8HyTwfPcILL7
 x9gG27AIrqDFkdEEzQx/uwW7kzuA6L71lbR91fIcfhVQkDJuq+b0tXxkg7BdPQPKmJ
 mlbG7UyLIwePKt6n1iFtJM1u5p00hPDJCK+S1vGE=
Received: by mail-ed1-f48.google.com with SMTP id e5so9704650edq.5
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2020 08:23:10 -0700 (PDT)
X-Gm-Message-State: AGi0Pubg0bhnMuGChf0oP8sPpPQn/rvfMwF/Lv50BaV6oiXN9Z2Wvyv1
 QTvWidi6Q/YXJytSWywpRgmJRQpO9i/BMFRuVw==
X-Google-Smtp-Source: APiQypJsws5ySCftPDCOmhjHI+FJoUbQYXzRxrRyf+OUeN3WHz0vnMQk2MtzJASwrlmS4sQX4+CE2CF2Mz8EKBf3/38=
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr8077145edb.48.1585927389063; 
 Fri, 03 Apr 2020 08:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-2-chunkuang.hu@kernel.org>
 <1585707361.28859.19.camel@mhfsdcap03>
 <ceae861b-b5ee-1d33-67dd-0a2ff4af2816@gmail.com>
 <CAAOTY_8EScidYVri=fn+sdteyD1TGSZ4AnYkp7kz2RozriSk=A@mail.gmail.com>
 <1585882773.28772.7.camel@mhfsdcap03>
In-Reply-To: <1585882773.28772.7.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Apr 2020 23:22:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9OsJQNU4rceXN0sg9igH_hWo=m1TWzaO26NJ=wg8NGLA@mail.gmail.com>
Message-ID: <CAAOTY_9OsJQNU4rceXN0sg9igH_hWo=m1TWzaO26NJ=wg8NGLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy
 to mtk_hdmi driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_082314_048768_EBC87CF5 
X-CRM114-Status: GOOD (  25.09  )
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
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDTmnIgz
5pelIOmAseS6lCDkuIrljYgxMDo1OeWvq+mBk++8mgo+Cj4gT24gVGh1LCAyMDIwLTA0LTAyIGF0
IDIwOjQ5ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRoaWFzOgo+ID4K
PiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAyMDIw5bm0
NOaciDHml6Ug6YCx5LiJIOS4i+WNiDExOjUz5a+r6YGT77yaCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4g
PiA+IE9uIDAxLzA0LzIwMjAgMDQ6MTYsIENodW5mZW5nIFl1biB3cm90ZToKPiA+ID4gPiBPbiBU
dWUsIDIwMjAtMDMtMzEgYXQgMjM6NTcgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+
ID4+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+ID4+Cj4gPiA+ID4+IHR6
X2Rpc2FibGVkIGlzIHVzZWQgdG8gY29udHJvbCBtdGtfaGRtaSBvdXRwdXQgc2lnbmFsLCBidXQg
dGhpcyB2YXJpYWJsZQo+ID4gPiA+PiBpcyBzdG9yZWQgaW4gbXRrX2hkbWlfcGh5IGFuZCBtdGtf
aGRtaV9waHkgZG9lcyBub3QgdXNlIGl0LiBTbyBtb3ZlCj4gPiA+ID4+IHR6X2Rpc2FibGVkIHRv
IG10a19oZG1pIHdoZXJlIGl0J3MgdXNlZC4KPiA+ID4gPj4KPiA+ID4gPj4gU2lnbmVkLW9mZi1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+ID4+IC0tLQo+ID4gPiA+
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgMjIgKysr
KysrKysrKysrKysrKy0tLQo+ID4gPiA+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX3BoeS5oICAgICAgIHwgIDEgLQo+ID4gPiA+PiAgLi4uL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X210MjcwMV9oZG1pX3BoeS5jICAgIHwgIDEgLQo+ID4gPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCAx
OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPiA+Pgo+ID4gPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gPiA+PiBpbmRleCA1ZTRhNGRiZGE0NDMuLjg3ODQz
M2MwOWM5YiAxMDA2NDQKPiA+ID4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMKPiA+ID4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiA+ID4gPj4gQEAgLTE0NCwxMSArMTQ0LDE2IEBAIHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFt
IHsKPiA+ID4gPj4gICAgICBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMgY29kZWNfcGFyYW1zOwo+
ID4gPiA+PiAgfTsKPiA+ID4gPj4KPiA+ID4gPj4gK3N0cnVjdCBtdGtfaGRtaV9jb25mIHsKPiA+
ID4gPj4gKyAgICBib29sIHR6X2Rpc2FibGVkOwo+ID4gPiA+PiArfTsKPiA+ID4gPj4gKwo+ID4g
PiA+PiAgc3RydWN0IG10a19oZG1pIHsKPiA+ID4gPj4gICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSBi
cmlkZ2U7Cj4gPiA+ID4+ICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOwo+ID4g
PiA+PiAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yIGNvbm47Cj4gPiA+ID4+ICAgICAgc3RydWN0
IGRldmljZSAqZGV2Owo+ID4gPiA+PiArICAgIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mICpj
b25mOwo+ID4gPiA+PiAgICAgIHN0cnVjdCBwaHkgKnBoeTsKPiA+ID4gPj4gICAgICBzdHJ1Y3Qg
ZGV2aWNlICpjZWNfZGV2Owo+ID4gPiA+PiAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqZGRjX2Fk
cHQ7Cj4gPiA+ID4+IEBAIC0yMzAsNyArMjM1LDYgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfaHdf
dmlkX2JsYWNrKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgYm9vbCBibGFjaykKPiA+ID4gPj4gIHN0
YXRpYyB2b2lkIG10a19oZG1pX2h3X21ha2VfcmVnX3dyaXRhYmxlKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSwgYm9vbCBlbmFibGUpCj4gPiA+ID4+ICB7Cj4gPiA+ID4+ICAgICAgc3RydWN0IGFybV9z
bWNjY19yZXMgcmVzOwo+ID4gPiA+PiAtICAgIHN0cnVjdCBtdGtfaGRtaV9waHkgKmhkbWlfcGh5
ID0gcGh5X2dldF9kcnZkYXRhKGhkbWktPnBoeSk7Cj4gPiA+ID4+Cj4gPiA+ID4+ICAgICAgLyoK
PiA+ID4gPj4gICAgICAgKiBNVDgxNzMgSERNSSBoYXJkd2FyZSBoYXMgYW4gb3V0cHV0IGNvbnRy
b2wgYml0IHRvIGVuYWJsZS9kaXNhYmxlIEhETUkKPiA+ID4gPj4gQEAgLTIzOCw3ICsyNDIsNyBA
QCBzdGF0aWMgdm9pZCBtdGtfaGRtaV9od19tYWtlX3JlZ193cml0YWJsZShzdHJ1Y3QgbXRrX2hk
bWkgKmhkbWksIGJvb2wgZW5hYmxlKQo+ID4gPiA+PiAgICAgICAqIFRoZSBBUk0gdHJ1c3RlZCBm
aXJtd2FyZSBwcm92aWRlcyBhbiBBUEkgZm9yIHRoZSBIRE1JIGRyaXZlciB0byBzZXQKPiA+ID4g
Pj4gICAgICAgKiB0aGlzIGNvbnRyb2wgYml0IHRvIGVuYWJsZSBIRE1JIG91dHB1dCBpbiBzdXBl
cnZpc29yIG1vZGUuCj4gPiA+ID4+ICAgICAgICovCj4gPiA+ID4+IC0gICAgaWYgKGhkbWlfcGh5
LT5jb25mICYmIGhkbWlfcGh5LT5jb25mLT50el9kaXNhYmxlZCkKPiA+ID4gPj4gKyAgICBpZiAo
aGRtaS0+Y29uZi0+dHpfZGlzYWJsZWQpCj4gPiA+Cj4gPiA+IFdvdWxkbid0IHdlIG5lZWQgdG8g
Y2hlY2s6Cj4gPiA+IGlmIChoZG1pLT5jb25mICYmIGhkbWktPmNvbmYtPnR6X2Rpc2FibGVkKQo+
ID4KPiA+IE15IGRlc2lnbiBpczogaGRtaS0+Y29uZiB3b3VsZCBub3QgYmUgTlVMTC4KPiA+Cj4g
PiA+Cj4gPiA+ID4+ICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoaGRtaS0+c3lzX3Jl
Z21hcCwKPiA+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZG1pLT5zeXNf
b2Zmc2V0ICsgSERNSV9TWVNfQ0ZHMjAsCj4gPiA+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHg4MDAwODAwNSwgZW5hYmxlID8gMHg4MDAwMDAwNSA6IDB4ODAwMCk7Cj4gPiA+
ID4+IEBAIC0xNjg4LDYgKzE2OTIsNyBAQCBzdGF0aWMgaW50IG10a19kcm1faGRtaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+PiAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gPiA+ID4+Cj4gPiA+ID4+ICAgICAgaGRtaS0+ZGV2ID0gZGV2Owo+ID4gPiA+
PiArICAgIGhkbWktPmNvbmYgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiA+ID4g
Pj4KPiA+ID4gPj4gICAgICByZXQgPSBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBwZGV2
KTsKPiA+ID4gPj4gICAgICBpZiAocmV0KQo+ID4gPiA+PiBAQCAtMTc2NSw4ICsxNzcwLDE5IEBA
IHN0YXRpYyBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ID4gPj4g
IHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhtdGtfaGRtaV9wbV9vcHMsCj4gPiA+ID4+ICAgICAg
ICAgICAgICAgICAgICAgICBtdGtfaGRtaV9zdXNwZW5kLCBtdGtfaGRtaV9yZXN1bWUpOwo+ID4g
PiA+Pgo+ID4gPiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1p
X2NvbmZfbXQyNzAxID0gewo+ID4gPiA+PiArICAgIC50el9kaXNhYmxlZCA9IHRydWUsCj4gPiA+
ID4+ICt9Owo+ID4gPiA+PiArCj4gPiA+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1p
X2NvbmYgbXRrX2hkbWlfY29uZl9tdDgxNzM7Cj4gPiA+ID4+ICsKPiA+ID4gPj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1faGRtaV9vZl9pZHNbXSA9IHsKPiA+ID4g
Pj4gLSAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1oZG1pIiwgfSwKPiA+ID4g
Pj4gKyAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1oZG1pIiwKPiA+ID4gPj4g
KyAgICAgIC5kYXRhID0gJm10a19oZG1pX2NvbmZfbXQyNzAxLAo+ID4gPiA+PiArICAgIH0sCj4g
PiA+ID4+ICsgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtaGRtaSIsCj4gPiA+
ID4+ICsgICAgICAuZGF0YSA9ICZtdGtfaGRtaV9jb25mX210ODE3MywKPiA+ID4KPiA+ID4gV2Ug
ZG9uJ3QgaGF2ZSBhbnkgZGF0YT8gVGhlbiB3ZSBzaG91bGQgc2V0IGRhdGEgdG8gTlVMTCBpbnN0
ZWFkLgo+ID4KPiA+IE15IGRlc2lnbiBpcyBkYXRhIHdvdWxkIG5vdCBiZSBOVUxMLCBzbyBJIG5l
ZWQgbm90IHRvIGNoZWNrIHdoZXRoZXIgaXQKPiA+IGlzIE5VTEwgaW4gZHJpdmVyLgo+IEJ1dCB3
ZSBkb24ndCBuZWVkIC5kYXRhIGZvciBtdDgxNzMsIGl0J3MgYmV0dGVyIHRvIHNldCBpdCB0byBO
VUxMLgoKT0ssIGluIHRoZSB2aWV3IG9mIHJlZHVjaW5nIHRoZSBjb2RlIHNpemUsIHNldHRpbmcg
aXQgdG8gTlVMTCB3b3VsZAptYWtlIGNvZGUgc2l6ZSBzbWFsbGVyLgpJIHdvdWxkIG1vZGlmeSB0
aGlzIGluIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPgo+ID4gUmVn
YXJkcywKPiA+IENLCj4gPgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBNYXR0aGlhcwo+ID4g
Pgo+ID4gPiA+PiArICAgIH0sCj4gPiA+ID4+ICAgICAge30KPiA+ID4gPj4gIH07Cj4gPiA+ID4+
Cj4gPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlf
cGh5LmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiA+ID4gPj4g
aW5kZXggMmQ4YjMxODI0NzBkLi5mYzFjMmVmZDExMjggMTAwNjQ0Cj4gPiA+ID4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuaAo+ID4gPiA+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiA+ID4gPj4gQEAgLTIwLDcgKzIw
LDYgQEAKPiA+ID4gPj4gIHN0cnVjdCBtdGtfaGRtaV9waHk7Cj4gPiA+ID4+Cj4gPiA+ID4+ICBz
dHJ1Y3QgbXRrX2hkbWlfcGh5X2NvbmYgewo+ID4gPiA+PiAtICAgIGJvb2wgdHpfZGlzYWJsZWQ7
Cj4gPiA+ID4+ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+ID4gPj4gICAgICBjb25zdCBz
dHJ1Y3QgY2xrX29wcyAqaGRtaV9waHlfY2xrX29wczsKPiA+ID4gPj4gICAgICB2b2lkICgqaGRt
aV9waHlfZW5hYmxlX3RtZHMpKHN0cnVjdCBtdGtfaGRtaV9waHkgKmhkbWlfcGh5KTsKPiA+ID4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlf
cGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5jCj4g
PiA+ID4+IGluZGV4IGQzY2M0MDIyZTk4OC4uOTlmZTA1Y2QzNTk4IDEwMDY0NAo+ID4gPiA+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5jCj4gPiA+
ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMK
PiA+ID4gPj4gQEAgLTIzNyw3ICsyMzcsNiBAQCBzdGF0aWMgdm9pZCBtdGtfaGRtaV9waHlfZGlz
YWJsZV90bWRzKHN0cnVjdCBtdGtfaGRtaV9waHkgKmhkbWlfcGh5KQo+ID4gPiA+PiAgfQo+ID4g
PiA+Pgo+ID4gPiA+PiAgc3RydWN0IG10a19oZG1pX3BoeV9jb25mIG10a19oZG1pX3BoeV8yNzAx
X2NvbmYgPSB7Cj4gPiA+ID4+IC0gICAgLnR6X2Rpc2FibGVkID0gdHJ1ZSwKPiA+ID4gPj4gICAg
ICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfR0FURSwKPiA+ID4gPj4gICAgICAuaGRtaV9waHlfY2xr
X29wcyA9ICZtdGtfaGRtaV9waHlfcGxsX29wcywKPiA+ID4gPj4gICAgICAuaGRtaV9waHlfZW5h
YmxlX3RtZHMgPSBtdGtfaGRtaV9waHlfZW5hYmxlX3RtZHMsCj4gPiA+ID4KPiA+ID4gPiBSZXZp
ZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+ID4gPiA+
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
