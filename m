Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05549C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:33:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C444620848
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IY2qr1Zw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0INqP1XW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C444620848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tLNHkh9mXDJebjJDo9d875iUrD5wKsGGE8B5Pcyp1Rs=; b=IY2qr1Zw1PDzeoID0mFKdGLB7
	vGIrj6zBBEolQxYtiH6ELZ5PSvNv6lPXWveAOGSKfwpQLqv1eyTd/YP31IDQUL+B6Wszodt0ZRM3l
	MI8wnTtt57mlawXCEG3yDzixgMNTGfbZe15NwBM9zQ/HH+m/2NSRjv3mKtxbLs1TBfRa2F7iaS1Ai
	fjlMGpLgxVkJCKanjQ3+z24EU4lK10U+aNFFzLomSkLrWdncf3xBqomPbBUL4bxG8eBnVf+isENjj
	OSroqKdhfw/z5GDmdl4hZDtknjxczMf1f/lKPGY1sUz8OvYZ9dcicrg5Lub61iv0bOBwY4kPshFOm
	W/sOELQ2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBROB-0005QP-Gr; Thu, 27 Aug 2020 23:33:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBRO6-0005Oa-Ve; Thu, 27 Aug 2020 23:32:59 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8B4208D5;
 Thu, 27 Aug 2020 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598571178;
 bh=CxkE/q++Eo2vJZXF0frHIrwwj8Su9GHTDl44/EylMxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0INqP1XWALFFZC20VHK8xYB2tSGPjASUk4GIkFKOcvuFubYdz5GfetLVTTTBWPFBU
 PdqSaWjRJGPExZnMjjlZ3Q8OwLC8eMfWLP0qCGJOz8LSo4eWkthsMxP8ZGCF3ZoFsJ
 dZ9gjHsPJ6BSUjnhwXkmUIajxFUVWdeop8pHEDPw=
Received: by mail-ed1-f53.google.com with SMTP id n13so182081edo.10;
 Thu, 27 Aug 2020 16:32:58 -0700 (PDT)
X-Gm-Message-State: AOAM531GOHZNFZPqOkP/jG0kj/pAo4OxsSCVSpj6FHLjTaS9YPcaI4k0
 ODn0pMYHtRfM+nvpM45PyKsxXMWygzLYM4+sPg==
X-Google-Smtp-Source: ABdhPJwTJAXoXtZdq1zZz3alAlq9lDJ0l2Ct9XsjXhjUW3fXtj711OBC1IZNyN5F5962joWUZrBnuIu2GzAzLaEVIWs=
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr21170877edy.61.1598571176689; 
 Thu, 27 Aug 2020 16:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-3-linux@fw-web.de>
In-Reply-To: <20200819081752.4805-3-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Aug 2020 07:32:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__SVKF=9CDeyHyKoAZ1fhRK+R0y0S5wMYz+ovqRN8Xtjw@mail.gmail.com>
Message-ID: <CAAOTY__SVKF=9CDeyHyKoAZ1fhRK+R0y0S5wMYz+ovqRN8Xtjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/mediatek: add ddp routing for mt7623
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_193259_134925_BFC67DF2 
X-CRM114-Status: GOOD (  18.38  )
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
tDjmnIgxOeaXpSDpgLHkuIkg5LiL5Y2INDoxOOWvq+mBk++8mgo+Cj4gRnJvbTogRnJhbmsgV3Vu
ZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4KPiBvbiBCUGktUjIvbXQ3NjIzIG1h
aW4tcGF0aCBoYXZlIHRvIGJlIHJvdXRlZCB0byBEUEkwIChoZG1pKSBpbnN0ZWFkIG9mIERTSTAK
PiB1c2luZyBjb21wYXRpYmxlICJtdDc2MjMtbW1zeXMiIGFscmVhZHkgZGVmaW5lZCBpbiBkdHMK
PgoKRm9yIHRoaXMgcGF0Y2gsIGFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdA
cHVibGljLWZpbGVzLmRlPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBp
bmRleCAwNDBhOGYzOTNmZTIuLjIzNTBlMzIwMGI1OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTc0LDYgKzc0LDE5IEBAIHN0YXRpYyBjb25zdCBlbnVt
IG10a19kZHBfY29tcF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAgIEREUF9D
T01QT05FTlRfRFBJMCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBf
aWQgbXQ3NjIzX210a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkww
LAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRf
Q09MT1IwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX0RQSTAsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQg
bXQ3NjIzX210a19kZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUExLAo+
ICsgICAgICAgRERQX0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IGVu
dW0gbXRrX2RkcF9jb21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKPiAgICAgICAgIERE
UF9DT01QT05FTlRfT1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+IEBAIC0x
MjcsNiArMTQwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRh
IG10MjcwMV9tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5zaGFkb3dfcmVnaXN0ZXIg
PSB0cnVlLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9k
YXRhIG10NzYyM19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5tYWluX3BhdGggPSBt
dDc2MjNfbXRrX2RkcF9tYWluLAo+ICsgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDc2
MjNfbXRrX2RkcF9tYWluKSwKPiArICAgICAgIC5leHRfcGF0aCA9IG10NzYyM19tdGtfZGRwX2V4
dCwKPiArICAgICAgIC5leHRfbGVuID0gQVJSQVlfU0laRShtdDc2MjNfbXRrX2RkcF9leHQpLAo+
ICsgICAgICAgLnNoYWRvd19yZWdpc3RlciA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEg
PSB7Cj4gICAgICAgICAubWFpbl9wYXRoID0gbXQyNzEyX210a19kZHBfbWFpbiwKPiAgICAgICAg
IC5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQyNzEyX210a19kZHBfbWFpbiksCj4gQEAgLTQyMiw2
ICs0NDMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGRwX2NvbXBf
ZHRfaWRzW10gPSB7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1f
b2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1t
bXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10MjcwMV9tbXN5c19kcml2ZXJfZGF0YX0sCj4g
KyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMy1tbXN5cyIsCj4gKyAgICAg
ICAgIC5kYXRhID0gJm10NzYyM19tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cyIsCj4gICAgICAgICAgIC5kYXRhID0gJm10
MjcxMl9tbXN5c19kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE3My1tbXN5cyIsCj4gLS0KPiAyLjI1LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
