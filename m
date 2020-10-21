Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C663AC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A0922206
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5Xmhe+P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxJScN2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A0922206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FrzT3EhyqAZ0Or7bsuChsN4ls7bIbJMeh06ATwhMQZ8=; b=Q5Xmhe+PJyzhQp+Ro9+imph77
	H9buawYO/DX3pwAj/P6Qnma16XXKG1aKh2K1gG9VQfrtiXvxJqAfXTa39v8nAqZyyMdXvChaXmWsh
	p7oGW3yzgwucdslw4TeUEsQrra9Zy3c9KceDjEuFmOqWDO8onUS6M9E845q06HRERcjPn/C5QPlWM
	rrfwfWv3jJqdylfXtN/sC7Exo3JQuX4mcwYDeVd2qDSDEKXEJjtGSR4rBAK3rAUYJpKEZ6vo0aqvu
	ZB5NtVHIWxYC1MPtJp8K7ByhpVWz0JW7P+Q7H/Dy0OrHe9j5fPEAvOZAPm8WtFMRo/a2311GMWfvc
	WvWj0UJsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVNyg-0004UC-Hl; Wed, 21 Oct 2020 23:57:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVNyb-0004Sq-MF; Wed, 21 Oct 2020 23:57:07 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E2DE24181;
 Wed, 21 Oct 2020 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603324624;
 bh=HuPgG/EpMuudB6wgOjUMyK3yRkdusBP6RAcW9Z00jTg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IxJScN2DN41Z2gF+TVA10G6719EgpV6E9wMAUNfwpWkNmZIuytf3rYtnfWllGKW8E
 vpws50Xd+oUoKJfaztb42PhvZqxlrVwT9hjXiFHqe3PLWTC0dQyVNTu0ZLK0M+b2dR
 Rv3/6nhBV8yT6RIl28nsGMnEdP/U//jB1yUR/xpc=
Received: by mail-ej1-f54.google.com with SMTP id lw21so5732944ejb.6;
 Wed, 21 Oct 2020 16:57:04 -0700 (PDT)
X-Gm-Message-State: AOAM531BnYyOxDnL08LoGQ8wNGupWZeWFj+GWTnERYEOKhpvWatnXoDC
 BVw6G98WsH3ksd6KBKTN9Up5Ty2aVSlCZlPLOQ==
X-Google-Smtp-Source: ABdhPJw8wh74mYS0cNZ7CtZqEbM8YS6eHI1BZzuScIJU3AknqOhCN6b9uRO9FnG0S+bXoDdfAVZRlnZpG95G07AeejA=
X-Received: by 2002:a17:906:7fd7:: with SMTP id
 r23mr5676868ejs.310.1603324622646; 
 Wed, 21 Oct 2020 16:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-8-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-8-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 07:56:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8V9JRwTFEZWHi9iRFhM1LnTAW1Mf40ZOAV7NC4UJosuw@mail.gmail.com>
Message-ID: <CAAOTY_8V9JRwTFEZWHi9iRFhM1LnTAW1Mf40ZOAV7NC4UJosuw@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/mediatek: add DDP support for MT8167
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_195705_894062_A193465F 
X-CRM114-Status: GOOD (  18.48  )
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
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IEFkZCBERFAgc3Vw
cG9ydCBmb3IgTVQ4MTY3IFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZw
YXJlbnRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYwo+IGluZGV4IDAxNGMxYmJlMWRmMi4uYmI2MmZkY2YzZDcxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBAQCAtMjUsNiArMjUsMTkgQEAKPgo+ICAjZGVm
aW5lIElOVF9NVVRFWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+Cj4gKyNk
ZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX1BXTSAgICAgICAgICAgICAgMQo+ICsjZGVmaW5l
IE1UODE2N19NVVRFWF9NT0RfRElTUF9PVkwwICAgICAgICAgICAgIDYKPiArI2RlZmluZSBNVDgx
NjdfTVVURVhfTU9EX0RJU1BfT1ZMMSAgICAgICAgICAgICA3Cj4gKyNkZWZpbmUgTVQ4MTY3X01V
VEVYX01PRF9ESVNQX1JETUEwICAgICAgICAgICAgOAo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9N
T0RfRElTUF9SRE1BMSAgICAgICAgICAgIDkKPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJ
U1BfV0RNQTAgICAgICAgICAgICAxMAo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9D
Q09SUiAgICAgICAgICAgIDExCj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0NPTE9S
ICAgICAgICAgICAgMTIKPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfQUFMICAgICAg
ICAgICAgICAxMwo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9HQU1NQSAgICAgICAg
ICAgIDE0Cj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0RJVEhFUiAgICAgICAgICAg
MTUKPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfVUZPRSAgICAgICAgICAgICAxNgo+
ICsKPiAgI2RlZmluZSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfT1ZMMCAgICAgICAgICAgICAxMQo+
ICAjZGVmaW5lIE1UODE3M19NVVRFWF9NT0RfRElTUF9PVkwxICAgICAgICAgICAgIDEyCj4gICNk
ZWZpbmUgTVQ4MTczX01VVEVYX01PRF9ESVNQX1JETUEwICAgICAgICAgICAgMTMKPiBAQCAtNzMs
NiArODYsOCBAQAo+ICAjZGVmaW5lIE1VVEVYX1NPRl9EUEkxICAgICAgICAgICAgICAgICA0Cj4g
ICNkZWZpbmUgTVVURVhfU09GX0RTSTIgICAgICAgICAgICAgICAgIDUKPiAgI2RlZmluZSBNVVRF
WF9TT0ZfRFNJMyAgICAgICAgICAgICAgICAgNgo+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9TT0Zf
RFBJMCAgICAgICAgICAyCj4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX1NPRl9EUEkxICAgICAgICAg
IDMKPgo+Cj4gIHN0cnVjdCBtdGtfZGlzcF9tdXRleCB7Cj4gQEAgLTEzNSw2ICsxNTAsMjEgQEAg
c3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDI3MTJfbXV0ZXhfbW9kW0REUF9DT01QT05FTlRf
SURfTUFYXSA9IHsKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1dETUExXSA9IE1UMjcxMl9NVVRF
WF9NT0RfRElTUF9XRE1BMSwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10
ODE2N19tdXRleF9tb2RbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+ICsgICAgICAgW0REUF9D
T01QT05FTlRfQUFMMF0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfQUFMLAo+ICsgICAgICAgW0RE
UF9DT01QT05FTlRfQ0NPUlJdID0gTVQ4MTY3X01VVEVYX01PRF9ESVNQX0NDT1JSLAo+ICsgICAg
ICAgW0REUF9DT01QT05FTlRfQ09MT1IwXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9DT0xPUiwK
PiArICAgICAgIFtERFBfQ09NUE9ORU5UX0RJVEhFUl0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1Bf
RElUSEVSLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfR0FNTUFdID0gTVQ4MTY3X01VVEVYX01P
RF9ESVNQX0dBTU1BLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMF0gPSBNVDgxNjdfTVVU
RVhfTU9EX0RJU1BfT1ZMMCwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX09WTDFdID0gTVQ4MTY3
X01VVEVYX01PRF9ESVNQX09WTDEsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9QV00wXSA9IE1U
ODE2N19NVVRFWF9NT0RfRElTUF9QV00sCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9SRE1BMF0g
PSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfUkRNQTAsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9S
RE1BMV0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfUkRNQTEsCj4gKyAgICAgICBbRERQX0NPTVBP
TkVOVF9VRk9FXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9VRk9FLAo+ICsgICAgICAgW0REUF9D
T01QT05FTlRfV0RNQTBdID0gTVQ4MTY3X01VVEVYX01PRF9ESVNQX1dETUEwLAo+ICt9Owo+ICsK
PiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDgxNzNfbXV0ZXhfbW9kW0REUF9DT01QT05F
TlRfSURfTUFYXSA9IHsKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX0FBTDBdID0gTVQ4MTczX01V
VEVYX01PRF9ESVNQX0FBTCwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX0NPTE9SMF0gPSBNVDgx
NzNfTVVURVhfTU9EX0RJU1BfQ09MT1IwLAo+IEBAIC0xNjMsNiArMTkzLDE2IEBAIHN0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgbXQyNzEyX211dGV4X3NvZltERFBfTVVURVhfU09GX0RTSTMgKyAx
XSA9IHsKPiAgICAgICAgIFtERFBfTVVURVhfU09GX0RTSTNdID0gTVVURVhfU09GX0RTSTMsCj4g
IH07Cj4KPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDgxNjdfbXV0ZXhfc29mW0REUF9N
VVRFWF9TT0ZfRFNJMyArIDFdID0gewo+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfU0lOR0xFX01P
REVdID0gTVVURVhfU09GX1NJTkdMRV9NT0RFLAo+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJ
MF0gPSBNVVRFWF9TT0ZfRFNJMCwKPiArICAgICAgIFtERFBfTVVURVhfU09GX0RTSTFdID0gTVVU
RVhfU09GX0RTSTEsCgpNVVRFWF9TT0ZfRFNJMSA9IE1UODE2N19NVVRFWF9TT0ZfRFBJMCA9IDIs
IHRoaXMgaXMgY29uZmxpY3QuIElmCk1UODE2NyBoYXMgbm8gZHNpMSwganVzdCBkcm9wIHNldHRp
bmcgZm9yIGRzaTEuIERpdHRvIGZvciBvdGhlcgpub24tZXhpc3Qgc29mLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9EUEkwXSA9IE1UODE2N19NVVRFWF9T
T0ZfRFBJMCwKPiArICAgICAgIFtERFBfTVVURVhfU09GX0RQSTFdID0gTVQ4MTY3X01VVEVYX1NP
Rl9EUEkxLAo+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJMl0gPSBNVVRFWF9TT0ZfRFNJMiwK
PiArICAgICAgIFtERFBfTVVURVhfU09GX0RTSTNdID0gTVVURVhfU09GX0RTSTMsCj4gK307Cj4g
Kwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDI3MDFfZGRwX2RyaXZlcl9k
YXRhID0gewo+ICAgICAgICAgLm11dGV4X21vZCA9IG10MjcwMV9tdXRleF9tb2QsCj4gICAgICAg
ICAubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiBAQCAtMTc3LDYgKzIxNywxNCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDI3MTJfZGRwX2RyaXZlcl9kYXRhID0g
ewo+ICAgICAgICAgLm11dGV4X3NvZl9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMCwKPiAg
fTsKPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDgxNjdfZGRwX2RyaXZl
cl9kYXRhID0gewo+ICsgICAgICAgLm11dGV4X21vZCA9IG10ODE2N19tdXRleF9tb2QsCj4gKyAg
ICAgICAubXV0ZXhfc29mID0gbXQ4MTY3X211dGV4X3NvZiwKPiArICAgICAgIC5tdXRleF9tb2Rf
cmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCj4gKyAgICAgICAubXV0ZXhfc29mX3JlZyA9
IE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwLAo+ICsgICAgICAgLm5vX2NsayA9IHRydWUsCj4gK307
Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDgxNzNfZGRwX2RyaXZl
cl9kYXRhID0gewo+ICAgICAgICAgLm11dGV4X21vZCA9IG10ODE3M19tdXRleF9tb2QsCj4gICAg
ICAgICAubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiBAQCAtNDAwLDYgKzQ0OCw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGRkcF9kcml2ZXJfZHRfbWF0Y2hbXSA9
IHsKPiAgICAgICAgICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJfZGF0YX0sCj4gICAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1kaXNwLW11dGV4IiwKPiAgICAgICAg
ICAgLmRhdGEgPSAmbXQyNzEyX2RkcF9kcml2ZXJfZGF0YX0sCj4gKyAgICAgICB7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLW11dGV4IiwKPiArICAgICAgICAgLmRhdGEgPSAm
bXQ4MTY3X2RkcF9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE3My1kaXNwLW11dGV4IiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX2RkcF9k
cml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAtLQo+IDIuMjguMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
