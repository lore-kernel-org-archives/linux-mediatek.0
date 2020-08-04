Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD44BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 23:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AE520792
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 23:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zYcjEZoR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAEtWlpJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AE520792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yw4DyPVb2QKOV+WBEWVIaLN5Ach0M6AiyzYUsgP+ZZQ=; b=zYcjEZoR2FPl5xCUGyb3KviaS
	4sgPHcd0Gno+IdJXk78a0r9J7Tw2vft1kRKfx/Ozxip+uaC4fzmckopzIT4DA5h/Ie2FO4b/7h7Xi
	g6AF0hZcpshIC4s15aUrIcOIzEcJaKWPSb6joX45Gudh7vGmBnIKSsh9jzB2UNrMhiL+6IGdg1WKi
	931dMXaK8+3gJG9YEV84xcojgPtvax/bkTQ228yHybJRxcPoyYoreC5y7SGjdT7CzPD/u5LxlqNwy
	RRBnklP9b7PPWy8liViJQJoZe7jFqSixRHVLelu3vMMjrydqMtP9Mn/lXX0o0qWURCVKhZV2fTBf9
	Qa0K8RpZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k35wa-0007DV-S5; Tue, 04 Aug 2020 23:02:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k35wW-0007CT-Cw; Tue, 04 Aug 2020 23:02:01 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE87D22CA0;
 Tue,  4 Aug 2020 23:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596582119;
 bh=G0QXhj8uvE6uFG6LEZRUpWEjC9R2zkgt7jzZ8pwDd9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CAEtWlpJUCItzCh0R85X2nUmruZ3t3Ig3+reCj6xaQeikD1+DGcFEWHZb85MDCrIX
 7/xVZw/mxS+fQsvaHRl8suTRwNYGM85ckttn036gSG26IjnYeI/kBXaOW9BIzkcYH5
 EVFouvvLMRXFZF241KforHyr19RuJfcTkEsiQVhY=
Received: by mail-ed1-f47.google.com with SMTP id c10so1380078edk.6;
 Tue, 04 Aug 2020 16:01:58 -0700 (PDT)
X-Gm-Message-State: AOAM533C/X4JM8kp2IL9v3HUBalXXG+T/0mS7H7NGMdmjcxtyG6xeQov
 V90D7o7ikgQNK3FBMr5FsAEqwt3OehKljMY4pw==
X-Google-Smtp-Source: ABdhPJyiqhWgjKSgZozGPp1jl9K0B7+yb2PKS2guwR3ob296qpnBATjzZoDka004lYrqOD1qk897url6EerXEvu419k=
X-Received: by 2002:a50:e109:: with SMTP id h9mr207114edl.47.1596582117170;
 Tue, 04 Aug 2020 16:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-4-linux@fw-web.de>
In-Reply-To: <20200804165555.75159-4-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 5 Aug 2020 07:01:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8VB6wkKLCAcJtwbhzOxN8R3=FzdJhab5NzmpOxyLEmeg@mail.gmail.com>
Message-ID: <CAAOTY_8VB6wkKLCAcJtwbhzOxN8R3=FzdJhab5NzmpOxyLEmeg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/mediatek: add ddp routing for mt7623
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_190200_694682_0ACB3A7F 
X-CRM114-Status: GOOD (  15.75  )
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
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg15pelIOmAseS4iSDkuIrljYgxMjo1NuWvq+mBk++8mgo+Cj4gRnJvbTogRnJhbmsgV3Vu
ZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4KPiBvbiBCUGktUjIvbXQ3NjIzIG1h
aW4tcGF0aCBoYXZlIHRvIGJlIHJvdXRlZCB0byBEUEkwIChoZG1pKSBpbnN0ZWFkIG9mIERTSTAK
PiB1c2luZyBjb21wYXRpYmxlICJtdDc2MjMtbW1zeXMiIGFscmVhZHkgZGVmaW5lZCBpbiBkdHMK
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyMyAr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCA2YmQzNjk0
MzRkOWQuLjExZTM3NTJjNjcwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jCj4gQEAgLTc0LDYgKzc0LDE5IEBAIHN0YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29t
cF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAgIEREUF9DT01QT05FTlRfRFBJ
MCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210
a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkwwLAo+ICsgICAgICAg
RERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+ICsg
ICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0RQSTAsCj4g
K307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210a19k
ZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUExLAo+ICsgICAgICAgRERQ
X0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IGVudW0gbXRrX2RkcF9j
b21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKPiAgICAgICAgIEREUF9DT01QT05FTlRf
T1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+IEBAIC0xMjcsNiArMTQwLDE0
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcwMV9tbXN5
c19kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5zaGFkb3dfcmVnaXN0ZXIgPSB0cnVlLAo+ICB9
Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10NzYyM19t
bXN5c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5tYWluX3BhdGggPSBtdDc2MjNfbXRrX2Rk
cF9tYWluLAo+ICsgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9t
YWluKSwKPiArICAgICAgIC5leHRfcGF0aCA9IG10NzYyM19tdGtfZGRwX2V4dCwKPiArICAgICAg
IC5leHRfbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9leHQpLAo+ICsgICAgICAgLnNo
YWRvd19yZWdpc3RlciA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAg
ICAubWFpbl9wYXRoID0gbXQyNzEyX210a19kZHBfbWFpbiwKPiAgICAgICAgIC5tYWluX2xlbiA9
IEFSUkFZX1NJWkUobXQyNzEyX210a19kZHBfbWFpbiksCj4gQEAgLTQyMiw2ICs0NDMsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1fb2ZfaWRzW10gPSB7
Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1tbXN5cyIsCj4gICAg
ICAgICAgIC5kYXRhID0gJm10MjcwMV9tbXN5c19kcml2ZXJfZGF0YX0sCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMy1tbXN5cyIsCj4gKyAgICAgICAgIC5kYXRhID0g
Jm10NzYyM19tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10MjcxMi1tbXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcxMl9tbXN5c19k
cml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1t
bXN5cyIsCj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
