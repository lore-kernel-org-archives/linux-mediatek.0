Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:35:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8261B2065C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJIZRCaW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="INn72nCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8261B2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+4FmIxyPfCNiJxUYpku/FXKF5v5W/xFsIHRVFxg3r08=; b=DJIZRCaW5tjQ4Kh78ec4OHQmb
	4eNvxITMPGzMHTSOVH/67X/miDMPj5si16v/QNcvagSgAzx6fgdjnjfw4KDaS4s8PYgBIjrMjY4yd
	h4PnClJL4FGzfLnsLjfHruu+0h2ltVp3ZdZv7Vhsd9jVKVKqOfPthHncNn1tiUbmbCHLSHg2nPTsf
	y/wteZqXmJTqiOBCrZpsxGRKk6gn9W4E49s4AfdXrQ6lhuCPsS3rTqYoMfX4+VX7w8X3xUoOy34+v
	G3uB4/VXowlDsqlEdC6b9NTlfzUiITGxsGhg0Q7rqQllbqVUhEM3h9faRn74SV1XSWrke8qX1XuLt
	wNmKXSItQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2y20-00078x-Lr; Tue, 04 Aug 2020 14:35:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2y1w-000774-3i; Tue, 04 Aug 2020 14:35:05 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2846722D03;
 Tue,  4 Aug 2020 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596551703;
 bh=msyy9aG35H4DSGIygANUzGiwZ9bmaHBVupY0hOPK2nA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=INn72nCnUGfrwDf/6D76PRUMF4gh/ThIG+NjSmuyJEdM2wunn48TfTl7XUWx5gt4/
 G12DNFSI9KhHI6U2jb50EL35hvUSFb9I+5ZtGF7XWjcPOgvVR0rhI0QOE0Ic0RsVuW
 6zf43KDoWpiNSUXYFszZaAyXWhVUfEgU2maMm2pY=
Received: by mail-ed1-f45.google.com with SMTP id l23so16325674edv.11;
 Tue, 04 Aug 2020 07:35:03 -0700 (PDT)
X-Gm-Message-State: AOAM531sTfNwghIlisiMhXgFUVsVZypVNMJO5e0muj3wpiuRLl3VswvW
 nhRsC7FqJwHzam6xHUHG8q/MFvuVvMZ8FOM7Cg==
X-Google-Smtp-Source: ABdhPJxtAkBWkUbp57xqa5KFEP+7l8fLYyFpHi+fJGBL3okYbOQpXuKQ7hFcornheF7wFTIcTsqN1xDf/iN0Ar3JdVQ=
X-Received: by 2002:a05:6402:38c:: with SMTP id
 o12mr21504828edv.271.1596551701677; 
 Tue, 04 Aug 2020 07:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
In-Reply-To: <20200804105849.70876-2-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 22:34:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
Message-ID: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_103504_334755_CDAD0462 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg05pelIOmAseS6jCDkuIvljYg3OjAw5a+r6YGT77yaCj4KPiBGcm9tOiBGcmFuayBXdW5k
ZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPgo+IG9uIEJQaS1SMi9tdDc2MjMgbWFp
bi1wYXRoIGhhdmUgdG8gYmUgcm91dGVkIHRvIERQSTAgKGhkbWkpIGluc3RlYWQgb2YgRFNJMAo+
IHVzaW5nIGNvbXBhdGlibGUgIm10NzYyMy1tbXN5cyIgYWxyZWFkeSBkZWZpbmVkIGluIGR0cwo+
Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMu
ZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKPiBpbmRleCA2YmQzNjk0MzRkOWQuLjllNDE4YjgzYmU0OCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTc0LDcgKzc0LDIwIEBAIHN0YXRpYyBjb25z
dCBlbnVtIG10a19kZHBfY29tcF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAg
IEREUF9DT01QT05FTlRfRFBJMCwKPiAgfTsKPgo+IC1zdGF0aWMgY29uc3QgZW51bSBtdGtfZGRw
X2NvbXBfaWQgbXQyNzEyX210a19kZHBfbWFpbltdID0gewo+ICtzdGF0aWMgY29uc3QgZW51bSBt
dGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NP
TVBPTkVOVF9PVkwwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIERE
UF9DT01QT05FTlRfQ09MT1IwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAg
ICBERFBfQ09NUE9ORU5UX0RQSTAsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtf
ZGRwX2NvbXBfaWQgbXQ3NjIzX210a19kZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX1JETUExLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiArc3Rh
dGljIGVudW0gbXRrX2RkcF9jb21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKCldoeSBk
byB5b3UgcmVtb3ZlICdjb25zdCc/Cgo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9DT0xPUjAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX0FBTDAs
Cj4gQEAgLTEyNyw2ICsxNDAsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJp
dmVyX2RhdGEgbXQyNzAxX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLnNoYWRvd19y
ZWdpc3RlciA9IHRydWUsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNf
ZHJpdmVyX2RhdGEgbXQ3NjIzX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLm1haW5f
cGF0aCA9IG10NzYyM19tdGtfZGRwX21haW4sCj4gKyAgICAgICAubWFpbl9sZW4gPSBBUlJBWV9T
SVpFKG10NzYyM19tdGtfZGRwX21haW4pLAo+ICsgICAgICAgLmV4dF9wYXRoID0gbXQ3NjIzX210
a19kZHBfZXh0LAo+ICsgICAgICAgLmV4dF9sZW4gPSBBUlJBWV9TSVpFKG10NzYyM19tdGtfZGRw
X2V4dCksCj4gKyAgICAgICAuc2hhZG93X3JlZ2lzdGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcxMl9tbXN5c19kcml2
ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5tYWluX3BhdGggPSBtdDI3MTJfbXRrX2RkcF9tYWluLAo+
ICAgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDI3MTJfbXRrX2RkcF9tYWluKSwKPiBA
QCAtNDIyLDYgKzQ0Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19k
ZHBfY29tcF9kdF9pZHNbXSA9IHsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
bXRrX2RybV9vZl9pZHNbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQyNzAxLW1tc3lzIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQyNzAxX21tc3lzX2RyaXZlcl9k
YXRhfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIzLW1tc3lzIiwK
PiArICAgICAgICAgLmRhdGEgPSAmbXQ3NjIzX21tc3lzX2RyaXZlcl9kYXRhfSwKPiAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwKPiAgICAgICAgICAgLmRh
dGEgPSAmbXQyNzEyX21tc3lzX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiwKPiAtLQo+IDIuMjUuMQo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
