Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C02CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:40:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712C82075D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bSGhWfWR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYg4yyMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 712C82075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QwOrLzZwFYcKKtNlDnGi+ufxRns5+/rMBpGnSu7hXu8=; b=bSGhWfWReJk5d5M05ZYYHea3a
	JPRRXwDX3dP8DPF2Tb/97uNSWiObsD8CPH+jbGxEv2Hk1Sa0BSTWVZp2gWVWFHoH6gWGsmnP92/mQ
	znxrTCZ4T5Lgndq4CZ+yq6PIxAp4/EmcO7CqHishG0YKFlTx5PTteWssqCyNBJlqqP5qJW7oPor+9
	UEHvv9lMzZeh5/Ojh/pcporp3FGeETOYzUYk9fxYJ1WeaVrwlo1I/oVnTopL1hiUGW+DqjzZDCp58
	usbm0n77rSkyDgx5FsGWngz2M8VAWUTOdPdBa7eNaA6RXgB4FpYmfDsutf069cxvBk6Nrd+2ygWUx
	NVNZ9Uqkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2y7L-00082f-G6; Tue, 04 Aug 2020 14:40:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2y7G-000819-HZ; Tue, 04 Aug 2020 14:40:35 +0000
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A84B421744;
 Tue,  4 Aug 2020 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596552034;
 bh=nkLqM9VlA8FHpZy8NwqZmUC37JV95B0bjtqMzww6cWs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IYg4yyMRvQvJjQAtufiU2yKutH8FTciw5RoDowXZwc2OqkcpszzDol4aNF+s77lfn
 tJ6sDMGs5brTIajOtbnMNwLduAP3oK9i8d/DVqqakhtgB40MQ5XyhBhDDX75KkIOU1
 toZE6TOSH7kmXeaLcYRsqQoinD6ljDZiU1sP7Hu0=
Received: by mail-ed1-f46.google.com with SMTP id bs17so11300280edb.1;
 Tue, 04 Aug 2020 07:40:33 -0700 (PDT)
X-Gm-Message-State: AOAM533aXMBMyJ+gWJmsO43seB9178CvK2XFhh8ZSBxi0BcRAjwCxbNB
 Pm5UNz0AShcX6uxe09jS4wwRvY9KBGJSif232w==
X-Google-Smtp-Source: ABdhPJzWsvc2uOluoSCcVdo0tNqnkAV63f2SDu0qjVLgSdaB7LNVXcw1IBpC1jNQcHVAPoQg8i6Oocdo+1cNikzAvHg=
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr15847530edg.61.1596552032198; 
 Tue, 04 Aug 2020 07:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-4-linux@fw-web.de>
In-Reply-To: <20200804105849.70876-4-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 22:40:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8OqCNuv1Wx+79jO85zo_KJ_v+26=mGiyA+TcaUbDa4yA@mail.gmail.com>
Message-ID: <CAAOTY_8OqCNuv1Wx+79jO85zo_KJ_v+26=mGiyA+TcaUbDa4yA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm: Add get_possible_crtc API for dpi, dsi
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_104034_724329_1E623017 
X-CRM114-Status: GOOD (  25.32  )
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
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg05pelIOmAseS6jCDkuIvljYg3OjAw5a+r6YGT77yaCj4KPiBGcm9tOiBTdHUgSHNpZWgg
PHN0dS5oc2llaEBtZWRpYXRlay5jb20+Cj4KPiBGb3IgY3VycmVudCBtZWRpYXRlayBkc2kgZW5j
b2RlciwgaXRzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0Ywo+IDAsIGFuZCBtZWRpYXRl
ayBkcGkgZW5jb2RlcidzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YyAxLiBJbgo+IHNv
bWUgU29DIHRoZSBwb3NzaWJsZSBjcnRjIGlzIG5vdCBmaXhlZCBpbiB0aGlzIGNhc2UsIHNvIHNl
YXJjaAo+IHBpcGVsaW5lIGluZm9ybWF0aW9uIHRvIGZpbmQgb3V0IHRoZSBjb3JyZWN0IHBvc3Np
YmxlIGNydGMuCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZp
bGVzLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmggfCAgMiArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
Cj4gaW5kZXggNTdjODhkZTlhMzI5Li5hNWYyZmY2YmVhOTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtMTMsNiArMTMsOCBAQAo+ICAj
aW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+Cj4g
KyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gKwo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYu
aCIKPiAgI2luY2x1ZGUgIm10a19kcm1fcGxhbmUuaCIKPiAgI2luY2x1ZGUgIm10a19kcm1fZGRw
X2NvbXAuaCIKPiBAQCAtNDEyLDYgKzQxNCwyMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19k
ZHBfY29tcF9tYXRjaCBtdGtfZGRwX21hdGNoZXNbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+
ICAgICAgICAgW0REUF9DT01QT05FTlRfV0RNQTFdICAgPSB7IE1US19ESVNQX1dETUEsICAgICAg
MSwgTlVMTCB9LAo+ICB9Owo+Cj4gK3N0YXRpYyBib29sIG10a19kcm1fZmluZF9jb21wX2luX2Rk
cChzdHJ1Y3QgbXRrX2RkcF9jb21wIGRkcF9jb21wLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgKnBhdGgsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGF0aF9s
ZW4pCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgICAgIGlmIChwYXRo
ID09IE5VTEwpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICAgICBm
b3IgKGkgPSAwVTsgaSA8IHBhdGhfbGVuOyBpKyspCj4gKyAgICAgICAgICAgICAgIGlmIChkZHBf
Y29tcC5pZCA9PSBwYXRoW2ldKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVl
Owo+ICsKPiArICAgICAgIHJldHVybiBmYWxzZTsKPiArfQo+ICsKPiAgaW50IG10a19kZHBfY29t
cF9nZXRfaWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGVudW0gbXRrX2RkcF9jb21wX3R5cGUgY29tcF90eXBlKQo+ICB7Cj4gQEAgLTQyNyw2ICs0
NDUsMzAgQEAgaW50IG10a19kZHBfY29tcF9nZXRfaWQoc3RydWN0IGRldmljZV9ub2RlICpub2Rl
LAo+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIH0KPgo+ICt1bnNpZ25lZCBpbnQgbXRrX2Ry
bV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtf
ZGRwX2NvbXAgZGRwX2NvbXApCj4gK3sKPiArICAgICAgIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUg
KnByaXZhdGUgPSBkcm0tPmRldl9wcml2YXRlOwo+ICsgICAgICAgdW5zaWduZWQgaW50IHJldDsK
PiArCj4gKyAgICAgICBpZiAobXRrX2RybV9maW5kX2NvbXBfaW5fZGRwKGRkcF9jb21wLCBwcml2
YXRlLT5kYXRhLT5tYWluX3BhdGgsCj4gKyAgICAgICAgICAgICAgIHByaXZhdGUtPmRhdGEtPm1h
aW5fbGVuKSA9PSB0cnVlKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IEJJVCgwKTsKPiArICAg
ICAgIH0gZWxzZSBpZiAobXRrX2RybV9maW5kX2NvbXBfaW5fZGRwKGRkcF9jb21wLAo+ICsgICAg
ICAgICAgICAgICBwcml2YXRlLT5kYXRhLT5leHRfcGF0aCwKPiArICAgICAgICAgICAgICAgcHJp
dmF0ZS0+ZGF0YS0+ZXh0X2xlbikgPT0gdHJ1ZSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBC
SVQoMSk7Cj4gKyAgICAgICB9IGVsc2UgaWYgKG10a19kcm1fZmluZF9jb21wX2luX2RkcChkZHBf
Y29tcCwKPiArICAgICAgICAgICAgICAgcHJpdmF0ZS0+ZGF0YS0+dGhpcmRfcGF0aCwKPiArICAg
ICAgICAgICAgICAgcHJpdmF0ZS0+ZGF0YS0+dGhpcmRfbGVuKSA9PSB0cnVlKSB7Cj4gKyAgICAg
ICAgICAgICAgIHJldCA9IEJJVCgyKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAg
ICAgIERSTV9JTkZPKCJGYWlsZWQgdG8gZmluZCBjb21wIGluIGRkcCB0YWJsZVxuIik7Cj4gKyAg
ICAgICAgICAgICAgIHJldCA9IDA7Cj4gKyAgICAgICB9Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+
ICt9Cj4gKwo+ICBpbnQgbXRrX2RkcF9jb21wX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtf
ZGRwX2NvbXAgKmNvbXAsIGVudW0gbXRrX2RkcF9jb21wX2lkIGNvbXBfaWQsCj4gICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgKmZ1bmNzKQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+IGluZGV4IGRlYmUz
NjM5NWZlNy4uMWQ5ZTAwYjY5NDYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5oCj4gQEAgLTIwMiw2ICsyMDIsOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgbXRrX2RkcF9jdG1fc2V0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsCj4KPiAgaW50IG10
a19kZHBfY29tcF9nZXRfaWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX3R5cGUgY29tcF90eXBlKTsKPiArdW5zaWdu
ZWQgaW50IG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbXRrX2RkcF9jb21wIGRkcF9jb21wKTsKPiAgaW50IG10a19kZHBfY29tcF9pbml0
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpjb21wX25vZGUsCj4gICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIGVudW0gbXRrX2Rk
cF9jb21wX2lkIGNvbXBfaWQsCj4gICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBt
dGtfZGRwX2NvbXBfZnVuY3MgKmZ1bmNzKTsKPiAtLQo+IDIuMjUuMQo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
