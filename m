Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372BAC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C57020797
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPzgZTcf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyvjvOvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C57020797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eiaKFAX28qjE/xrUWSxFAgvhiXvIaJbI3mE/nuuhxn0=; b=tPzgZTcfYIGgJbtQgvf50vJmK
	cE5+BQdjCF8ddNxPHHqJNFe0gVAdVY8ayXzUTv343cv2dyl3z/ALjugsxC1bN3WtTWYPeamimYvDv
	moiVX9UT4lg7B+kLLK14XUAT4DMzEnvmdCsvqtz8GcSTQsxRquaMUNGb0zGkYhNoI9WsX/TIc9u2t
	phYTBsIs02/Zj+LiyinofQm6mVhmT3ZKZe2Oxe0dhDMaMssaaz95CldBmllDxY1oP4RMEHGVUXg7v
	BgASeh3DspybyiCWZRkIes60ZjMpU3p6OP+l5pYwL7DLAsZdJJQ2CUMYBg9CMYn92V6vTrRiHVRm1
	K3vnehqxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVzFx-0003En-8G; Fri, 23 Oct 2020 15:45:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVzFt-0003DB-4u; Fri, 23 Oct 2020 15:45:26 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A8824671;
 Fri, 23 Oct 2020 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603467923;
 bh=G6M/BTlJg0FbYXp3CDG9TBtlEGlMSzVeKa7vY6mNHfA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WyvjvOvROY+IG+DfKhwK9L8oCSrnKk8bKt9/1GzuHrmsiYW+IiqOIMkw+qft9jms4
 rqUjOjdQu0Cbn9n/AHrl1OxN4dnOwY1ssJb51bdJJ0upNNWeBvDZL4ZUzD0AB7nnQ0
 XgRSBdI4tBdHgVU+jxaLBory2RAlvJ16a/tw6mIw=
Received: by mail-ed1-f43.google.com with SMTP id a6so605585edx.6;
 Fri, 23 Oct 2020 08:45:22 -0700 (PDT)
X-Gm-Message-State: AOAM530okdw+O5W4lj5+JClD5aBPQaxE/sVPrLqyGlW3IcW74fy6nIf6
 lDyen2kx56AwzO06LtK3YXOK6wqNTDJ5pgAIZA==
X-Google-Smtp-Source: ABdhPJx0SUdWMn6Vo3xfJkuFhv02uNkzsQmCZ8hthB7UjShnrm6FmW8b0KoxznzvfpoL1Xhz7/ifyV9SXc3gShTo5t8=
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr2814992edr.72.1603467921215; 
 Fri, 23 Oct 2020 08:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-5-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-5-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 23 Oct 2020 23:45:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9QWfrExsjSaeGtA6KGZYLyscuc76jdDjHwawd8y964hA@mail.gmail.com>
Message-ID: <CAAOTY_9QWfrExsjSaeGtA6KGZYLyscuc76jdDjHwawd8y964hA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/mediatek: add DDP support for MT8167
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_114525_361535_7209C8E9 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBERFAgc3Vw
cG9ydCBmb3IgTVQ4MTY3IFNvQy4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vh
bmcuaHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVu
dEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2Vsb2c6Cj4KPiBWMjogZG9uJ3Qgc2V0IERE
UF9NVVRFWF9TT0ZfRFNJezEsMiwzfSBzaW5jZSB0aGV5IGFyZSBub3QgYXZhaWxhYmxlIG9uIE1U
ODE2Nwo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgNDcgKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggMDE0YzFi
YmUxZGYyLi4xZjk5ZGI2YjFhNDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYwo+IEBAIC0yNSw2ICsyNSwxOSBAQAo+Cj4gICNkZWZpbmUgSU5UX01VVEVYICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEpCj4KPiArI2RlZmluZSBNVDgxNjdfTVVURVhf
TU9EX0RJU1BfUFdNICAgICAgICAgICAgICAxCj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9E
SVNQX09WTDAgICAgICAgICAgICAgNgo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9P
VkwxICAgICAgICAgICAgIDcKPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfUkRNQTAg
ICAgICAgICAgICA4Cj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX1JETUExICAgICAg
ICAgICAgOQo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9XRE1BMCAgICAgICAgICAg
IDEwCj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0NDT1JSICAgICAgICAgICAgMTEK
PiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfQ09MT1IgICAgICAgICAgICAxMgo+ICsj
ZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9BQUwgICAgICAgICAgICAgIDEzCj4gKyNkZWZp
bmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0dBTU1BICAgICAgICAgICAgMTQKPiArI2RlZmluZSBN
VDgxNjdfTVVURVhfTU9EX0RJU1BfRElUSEVSICAgICAgICAgICAxNQo+ICsjZGVmaW5lIE1UODE2
N19NVVRFWF9NT0RfRElTUF9VRk9FICAgICAgICAgICAgIDE2Cj4gKwo+ICAjZGVmaW5lIE1UODE3
M19NVVRFWF9NT0RfRElTUF9PVkwwICAgICAgICAgICAgIDExCj4gICNkZWZpbmUgTVQ4MTczX01V
VEVYX01PRF9ESVNQX09WTDEgICAgICAgICAgICAgMTIKPiAgI2RlZmluZSBNVDgxNzNfTVVURVhf
TU9EX0RJU1BfUkRNQTAgICAgICAgICAgICAxMwo+IEBAIC03Myw2ICs4Niw4IEBACj4gICNkZWZp
bmUgTVVURVhfU09GX0RQSTEgICAgICAgICAgICAgICAgIDQKPiAgI2RlZmluZSBNVVRFWF9TT0Zf
RFNJMiAgICAgICAgICAgICAgICAgNQo+ICAjZGVmaW5lIE1VVEVYX1NPRl9EU0kzICAgICAgICAg
ICAgICAgICA2Cj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX1NPRl9EUEkwICAgICAgICAgIDIKPiAr
I2RlZmluZSBNVDgxNjdfTVVURVhfU09GX0RQSTEgICAgICAgICAgMwo+Cj4KPiAgc3RydWN0IG10
a19kaXNwX211dGV4IHsKPiBAQCAtMTM1LDYgKzE1MCwyMSBAQCBzdGF0aWMgY29uc3QgdW5zaWdu
ZWQgaW50IG10MjcxMl9tdXRleF9tb2RbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+ICAgICAg
ICAgW0REUF9DT01QT05FTlRfV0RNQTFdID0gTVQyNzEyX01VVEVYX01PRF9ESVNQX1dETUExLAo+
ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4MTY3X211dGV4X21vZFtERFBf
Q09NUE9ORU5UX0lEX01BWF0gPSB7Cj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9BQUwwXSA9IE1U
ODE2N19NVVRFWF9NT0RfRElTUF9BQUwsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9DQ09SUl0g
PSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfQ0NPUlIsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9D
T0xPUjBdID0gTVQ4MTY3X01VVEVYX01PRF9ESVNQX0NPTE9SLAo+ICsgICAgICAgW0REUF9DT01Q
T05FTlRfRElUSEVSXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9ESVRIRVIsCj4gKyAgICAgICBb
RERQX0NPTVBPTkVOVF9HQU1NQV0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfR0FNTUEsCj4gKyAg
ICAgICBbRERQX0NPTVBPTkVOVF9PVkwwXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9PVkwwLAo+
ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMV0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfT1ZM
MSwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1BXTTBdID0gTVQ4MTY3X01VVEVYX01PRF9ESVNQ
X1BXTSwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUEwXSA9IE1UODE2N19NVVRFWF9NT0Rf
RElTUF9SRE1BMCwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUExXSA9IE1UODE2N19NVVRF
WF9NT0RfRElTUF9SRE1BMSwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1VGT0VdID0gTVQ4MTY3
X01VVEVYX01PRF9ESVNQX1VGT0UsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9XRE1BMF0gPSBN
VDgxNjdfTVVURVhfTU9EX0RJU1BfV0RNQTAsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IG10ODE3M19tdXRleF9tb2RbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+ICAg
ICAgICAgW0REUF9DT01QT05FTlRfQUFMMF0gPSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfQUFMLAo+
ICAgICAgICAgW0REUF9DT01QT05FTlRfQ09MT1IwXSA9IE1UODE3M19NVVRFWF9NT0RfRElTUF9D
T0xPUjAsCj4gQEAgLTE2Myw2ICsxOTMsMTMgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBt
dDI3MTJfbXV0ZXhfc29mW0REUF9NVVRFWF9TT0ZfRFNJMyArIDFdID0gewo+ICAgICAgICAgW0RE
UF9NVVRFWF9TT0ZfRFNJM10gPSBNVVRFWF9TT0ZfRFNJMywKPiAgfTsKPgo+ICtzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IG10ODE2N19tdXRleF9zb2ZbRERQX01VVEVYX1NPRl9EU0kzICsgMV0g
PSB7Cj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9TSU5HTEVfTU9ERV0gPSBNVVRFWF9TT0ZfU0lO
R0xFX01PREUsCj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9EU0kwXSA9IE1VVEVYX1NPRl9EU0kw
LAo+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFBJMF0gPSBNVDgxNjdfTVVURVhfU09GX0RQSTAs
Cj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9EUEkxXSA9IE1UODE2N19NVVRFWF9TT0ZfRFBJMSwK
PiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcwMV9kZHBf
ZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAubXV0ZXhfbW9kID0gbXQyNzAxX211dGV4X21vZCwK
PiAgICAgICAgIC5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAo+IEBAIC0xNzcsNiArMjE0
LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcxMl9kZHBfZHJpdmVy
X2RhdGEgPSB7Cj4gICAgICAgICAubXV0ZXhfc29mX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9T
T0YwLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10ODE2N19k
ZHBfZHJpdmVyX2RhdGEgPSB7Cj4gKyAgICAgICAubXV0ZXhfbW9kID0gbXQ4MTY3X211dGV4X21v
ZCwKPiArICAgICAgIC5tdXRleF9zb2YgPSBtdDgxNjdfbXV0ZXhfc29mLAo+ICsgICAgICAgLm11
dGV4X21vZF9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKPiArICAgICAgIC5tdXRleF9z
b2ZfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsCj4gKyAgICAgICAubm9fY2xrID0gdHJ1
ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10ODE3M19k
ZHBfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAubXV0ZXhfbW9kID0gbXQ4MTczX211dGV4X21v
ZCwKPiAgICAgICAgIC5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAo+IEBAIC00MDAsNiAr
NDQ1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZGRwX2RyaXZlcl9kdF9t
YXRjaFtdID0gewo+ICAgICAgICAgICAuZGF0YSA9ICZtdDI3MDFfZGRwX2RyaXZlcl9kYXRhfSwK
PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+
ICAgICAgICAgICAuZGF0YSA9ICZtdDI3MTJfZGRwX2RyaXZlcl9kYXRhfSwKPiArICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtbXV0ZXgiLAo+ICsgICAgICAgICAu
ZGF0YSA9ICZtdDgxNjdfZGRwX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtbXV0ZXgiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgx
NzNfZGRwX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHt9LAo+IC0tCj4gMi4yOC4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
