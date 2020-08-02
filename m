Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 03:03:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 291A22072A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 03:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puOMGy6m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmpfRrTq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 291A22072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IMtbemv10c3g9LNSHvsGcKtc4SAJBqqBzlTvZVrWif0=; b=puOMGy6mr8sPfP3CrZO8pHto2
	Mx+umSnfEHYhbij0e3jlddGYygdS466cqe+ayzbd+GFsSQZ5aEfdku5HzK/re9jwVdKslNOQt7f8M
	IzkLJo3XAIsAZyPDB18BkUoRmEwUzgJhVvsIhTkHsMefyzr4wLYwc6I+AIwELqhmGunzbzKCbpUty
	WRczNaayYTQfSTOqLXISHAihlhm9c9sGYXhUholjLj8i+k3Z0tadNvhMHcBNJGjvg4f2BOoQZvzEL
	GhhSzIwD7ndHrUNnXXPznakdVU2odmczinuj0Dv6Tw1HFY6Y4MtyiVR3WOG5m/zMn1RhxREWKM58o
	rkWMsYPGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k24H1-0004HA-0J; Sun, 02 Aug 2020 03:02:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k24Gu-0004GP-Rr; Sun, 02 Aug 2020 03:02:50 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DA7A2076B;
 Sun,  2 Aug 2020 03:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596337367;
 bh=69kZjUSWNDziqCdzHTUc/4mOGEuEQGCa68+3zSX0jzA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SmpfRrTqdw7ywZ7jaI8zkGknqoIz3Z+lsCw+09LoYxUbxA8u697/wKTfJYsUscfI7
 ZvfWIuoCJ/7PMpR9eZBmFy3ouzl0V2QHhQOTMrLMW8plbtkUUBn+EFuR1KXV6kFPQ4
 Jyd/LDpSM9vxF2InbTRM/zoja6e78/kMuIxIzdBo=
Received: by mail-ed1-f48.google.com with SMTP id n2so24922228edr.5;
 Sat, 01 Aug 2020 20:02:47 -0700 (PDT)
X-Gm-Message-State: AOAM531IHWxAaqPZyhdgNAFntSyWm8UEFSxC+JuoVA84cy+bxQiL4zFq
 bYUGZtQkW8/xG0VRpva7dgnJn2TYevQPG/UUGg==
X-Google-Smtp-Source: ABdhPJxL3YzWx3FUUHJpPDKfq2eX1uVtVJzwi0mwaMzX1YCSOIhARaM52Fb4jPnqPRqSLl73JS5FF123RAsYJKlKGDg=
X-Received: by 2002:a50:9e6f:: with SMTP id
 z102mr10521268ede.300.1596337365962; 
 Sat, 01 Aug 2020 20:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-4-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-4-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 11:02:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY__QCoV62OZO__6Dg+r0sbJK3AgV7FzFPFYoz_DvXMj7uQ@mail.gmail.com>
Message-ID: <CAAOTY__QCoV62OZO__6Dg+r0sbJK3AgV7FzFPFYoz_DvXMj7uQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: Add get_possible_crtc API for dpi, dsi
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_230249_154057_789D1C73 
X-CRM114-Status: GOOD (  24.21  )
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
 Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE45a+r6YGT77yaCj4KCkRlc2NyaWJl
IHdoeSBuZWVkIHRoaXMgcGF0Y2guIEkgdGhpbmsgdGhlIHJlYXNvbiBpczoKCkZvciBjdXJyZW50
IG1lZGlhdGVrIGRzaSBlbmNvZGVyLCBpdHMgcG9zc2libGUgY3J0YyBpcyBmaXhlZCBpbiBjcnRj
CjAsIGFuZCBtZWRpYXRlayBkcGkgZW5jb2RlcidzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4g
Y3J0YyAxLiBJbgpzb21lIFNvQyB0aGUgcG9zc2libGUgY3J0YyBpcyBub3QgZml4ZWQgaW4gdGhp
cyBjYXNlLCBzbyBzZWFyY2gKcGlwZWxpbmUgaW5mb3JtYXRpb24gdG8gZmluZCBvdXQgdGhlIGNv
cnJlY3QgcG9zc2libGUgY3J0Yy4KCj4gRnJvbTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0
ZWsuY29tPgo+Cj4gVGVzdDogYnVpbGQgcGFzcyBhbmQgcnVuIG9rCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+CgpOZWVkIHlvdXIgc2lnbmVkLW9m
Zi1ieSB0YWcuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgMiArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jCj4gaW5kZXggNTdjODhkZTlhMzI5Li5hNWYyZmY2YmVhOTMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtMTMsNiArMTMsOCBAQAo+
ICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+
Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gKwo+ICAjaW5jbHVkZSAibXRrX2RybV9k
cnYuaCIKPiAgI2luY2x1ZGUgIm10a19kcm1fcGxhbmUuaCIKPiAgI2luY2x1ZGUgIm10a19kcm1f
ZGRwX2NvbXAuaCIKPiBAQCAtNDEyLDYgKzQxNCwyMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19kZHBfY29tcF9tYXRjaCBtdGtfZGRwX21hdGNoZXNbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0g
ewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfV0RNQTFdICAgPSB7IE1US19ESVNQX1dETUEsICAg
ICAgMSwgTlVMTCB9LAo+ICB9Owo+Cj4gK3N0YXRpYyBib29sIG10a19kcm1fZmluZF9jb21wX2lu
X2RkcChzdHJ1Y3QgbXRrX2RkcF9jb21wIGRkcF9jb21wLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgKnBhdGgsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGF0
aF9sZW4pCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgICAgIGlmIChw
YXRoID09IE5VTEwpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKClRoaXMgY2hlY2tp
bmcgaXMgcmVkdW5kYW50LCBzbyByZW1vdmUgaXQuCgo+ICsKPiArICAgICAgIGZvciAoaSA9IDBV
OyBpIDwgcGF0aF9sZW47IGkrKykKPiArICAgICAgICAgICAgICAgaWYgKGRkcF9jb21wLmlkID09
IHBhdGhbaV0pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICBpbnQgbXRrX2RkcF9jb21wX2dldF9pZChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfdHlwZSBjb21wX3R5cGUpCj4gIHsKPiBAQCAtNDI3LDYgKzQ0NSwzMCBAQCBp
bnQgbXRrX2RkcF9jb21wX2dldF9pZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiAgfQo+Cj4gK3Vuc2lnbmVkIGludCBtdGtfZHJtX2ZpbmRfcG9z
c2libGVfY3J0Y19ieV9jb21wKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19kZHBfY29tcCBk
ZHBfY29tcCkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9
IGRybS0+ZGV2X3ByaXZhdGU7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgcmV0Owo+ICsKPiArICAg
ICAgIGlmIChtdGtfZHJtX2ZpbmRfY29tcF9pbl9kZHAoZGRwX2NvbXAsIHByaXZhdGUtPmRhdGEt
Pm1haW5fcGF0aCwKPiArICAgICAgICAgICAgICAgcHJpdmF0ZS0+ZGF0YS0+bWFpbl9sZW4pID09
IHRydWUpIHsKCicgPT0gdHJ1ZScgaXMgcmVkdW5kYW50LCBzbyByZW1vdmUgaXQuCgo+ICsgICAg
ICAgICAgICAgICByZXQgPSBCSVQoMCk7Cj4gKyAgICAgICB9IGVsc2UgaWYgKG10a19kcm1fZmlu
ZF9jb21wX2luX2RkcChkZHBfY29tcCwKPiArICAgICAgICAgICAgICAgcHJpdmF0ZS0+ZGF0YS0+
ZXh0X3BhdGgsCj4gKyAgICAgICAgICAgICAgIHByaXZhdGUtPmRhdGEtPmV4dF9sZW4pID09IHRy
dWUpIHsKCkRpdHRvLgoKPiArICAgICAgICAgICAgICAgcmV0ID0gQklUKDEpOwo+ICsgICAgICAg
fSBlbHNlIGlmIChtdGtfZHJtX2ZpbmRfY29tcF9pbl9kZHAoZGRwX2NvbXAsCj4gKyAgICAgICAg
ICAgICAgIHByaXZhdGUtPmRhdGEtPnRoaXJkX3BhdGgsCj4gKyAgICAgICAgICAgICAgIHByaXZh
dGUtPmRhdGEtPnRoaXJkX2xlbikgPT0gdHJ1ZSkgewoKRGl0dG8uCgo+ICsgICAgICAgICAgICAg
ICByZXQgPSBCSVQoMik7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBEUk1f
SU5GTygiRmFpbGVkIHRvIGZpbmQgY29tcCBpbiBkZHAgdGFibGVcbiIpOwo+ICsgICAgICAgICAg
ICAgICByZXQgPSAwOwo+ICsgICAgICAgfQo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArfQo+ICsK
PiAgaW50IG10a19kZHBfY29tcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZV9ub2RlICpub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wLCBlbnVtIG10a19kZHBfY29tcF9pZCBjb21wX2lkLAo+ICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzICpmdW5jcykKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBpbmRleCBkZWJlMzYzOTVmZTcu
LjFkOWUwMGI2OTQ2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaAo+IEBAIC0yMDIsNiArMjAyLDggQEAgc3RhdGljIGlubGluZSB2b2lkIG10a19k
ZHBfY3RtX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAo+Cj4gIGludCBtdGtfZGRwX2Nv
bXBfZ2V0X2lkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnVtIG10a19kZHBfY29tcF90eXBlIGNvbXBfdHlwZSk7Cj4gK3Vuc2lnbmVkIGludCBt
dGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IG10a19kZHBfY29tcCBkZHBfY29tcCk7Cj4gIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY29tcF9ub2RlLAo+ICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCBlbnVtIG10a19kZHBfY29tcF9p
ZCBjb21wX2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9j
b21wX2Z1bmNzICpmdW5jcyk7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
