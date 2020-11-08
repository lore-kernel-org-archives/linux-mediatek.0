Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11F1C388F9
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:56:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712D120704
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pziSpeiW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERvnSqzO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 712D120704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dVGqxmAdhfXUo/ZyIhp1905RFvwz8Os2JX3/eDX3R/M=; b=pziSpeiWtXOwoA9VcuwJNUkU5
	PUAs6mWoSAXIRdG5rLssLM/xnCVEg7Ck9fgmKK/CKZMz2Mc0dGc0Mrw3nDMf39SeHoupD5Wemc9wk
	VtGL+DND64XL36eRH/bGnPFmPbSXNzxSgpARv+DJddl1Zetu0spiUxj+9FgS3Lif4EnrSXNKdJgGV
	EzDm+q61fgHItraex+YMj+rZ4tVNZcrvi58kQNb2soeMM9CY582zcUXYZQnGQWmQc12zjoC7TBH6b
	tPmEny8rJJB12jf806bZ/Jm61NhZsexAbGDLpiIEM/DC3iFuautbzvlO62WihWEm7Clou3ofdIEJD
	r+K6PpbIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbZw5-0000mO-9A; Sun, 08 Nov 2020 01:56:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbZvz-0000jo-6t; Sun, 08 Nov 2020 01:56:00 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3C1E207C3;
 Sun,  8 Nov 2020 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604800558;
 bh=T67Iufr0uPKu+Md6jDu5kMdpCLS8mxT7AldzdaCHeB4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ERvnSqzOzvAsT1/vwyFBNFosjYr4/0pzuvB0gPmJnXKD+WHnK6gKfhPIvxk6q1Hts
 WuC7L0SdTPwAVjOonRosQcawMT6hY/P+LYkYt0dnPFIj2SkULvPpeJOvE7zhHgMDgt
 JhKo3+vJYPwLIfGUjzeTdvqLsFktnNZphNf4Ar38=
Received: by mail-ed1-f45.google.com with SMTP id k9so5098587edo.5;
 Sat, 07 Nov 2020 17:55:57 -0800 (PST)
X-Gm-Message-State: AOAM530dIWzZoqkkEjr8Yo7l/n8K2CZB37Q+vk7+hwtgLnxLEIwq8oAs
 +dVTDnprr9B1CyuwcwXEt651TIzSJMldrTadLA==
X-Google-Smtp-Source: ABdhPJyCiEXaygWJ+gT0prVAlkWmDoA7xyXwqbJnDIZD3XSYHBiBe7IHfOG4ddXSUnQD8AMLb3LmmuYv6NAUU6mB03g=
X-Received: by 2002:a50:d587:: with SMTP id v7mr8709048edi.38.1604800556313;
 Sat, 07 Nov 2020 17:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-5-fparent@baylibre.com>
 <CAAOTY_9QWfrExsjSaeGtA6KGZYLyscuc76jdDjHwawd8y964hA@mail.gmail.com>
In-Reply-To: <CAAOTY_9QWfrExsjSaeGtA6KGZYLyscuc76jdDjHwawd8y964hA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 09:55:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__FPenM6-vKiW4mjMo1m+5K7bGAc++dSJ3gdra4LiC4jg@mail.gmail.com>
Message-ID: <CAAOTY__FPenM6-vKiW4mjMo1m+5K7bGAc++dSJ3gdra4LiC4jg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/mediatek: add DDP support for MT8167
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_205559_459384_CEB9B216 
X-CRM114-Status: GOOD (  19.97  )
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwg
MjAyMOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDExOjQ15a+r6YGT77yaCj4KPiBIaSwgRmFi
aWVuOgo+Cj4gRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+IOaWvCAyMDIw5bm0
MTDmnIgyM+aXpSDpgLHkupQg5LiL5Y2IOTozMeWvq+mBk++8mgo+ID4KPiA+IEFkZCBERFAgc3Vw
cG9ydCBmb3IgTVQ4MTY3IFNvQy4KPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4KCkZvciB0aGlzIHBhdGNoLCBhcHBsaWVkIHRvIG1lZGlhdGVr
LWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVr
LWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
aWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBDaGFuZ2Vs
b2c6Cj4gPgo+ID4gVjI6IGRvbid0IHNldCBERFBfTVVURVhfU09GX0RTSXsxLDIsM30gc2luY2Ug
dGhleSBhcmUgbm90IGF2YWlsYWJsZSBvbiBNVDgxNjcKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwLmMKPiA+IGluZGV4IDAxNGMxYmJlMWRmMi4uMWY5OWRiNmIx
YTQyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gPiBA
QCAtMjUsNiArMjUsMTkgQEAKPiA+Cj4gPiAgI2RlZmluZSBJTlRfTVVURVggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBCSVQoMSkKPiA+Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9E
X0RJU1BfUFdNICAgICAgICAgICAgICAxCj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJ
U1BfT1ZMMCAgICAgICAgICAgICA2Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1Bf
T1ZMMSAgICAgICAgICAgICA3Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfUkRN
QTAgICAgICAgICAgICA4Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfUkRNQTEg
ICAgICAgICAgICA5Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfV0RNQTAgICAg
ICAgICAgICAxMAo+ID4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0NDT1JSICAgICAg
ICAgICAgMTEKPiA+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9DT0xPUiAgICAgICAg
ICAgIDEyCj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfQUFMICAgICAgICAgICAg
ICAxMwo+ID4gKyNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX0dBTU1BICAgICAgICAgICAg
MTQKPiA+ICsjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9ESVRIRVIgICAgICAgICAgIDE1
Cj4gPiArI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfVUZPRSAgICAgICAgICAgICAxNgo+
ID4gKwo+ID4gICNkZWZpbmUgTVQ4MTczX01VVEVYX01PRF9ESVNQX09WTDAgICAgICAgICAgICAg
MTEKPiA+ICAjZGVmaW5lIE1UODE3M19NVVRFWF9NT0RfRElTUF9PVkwxICAgICAgICAgICAgIDEy
Cj4gPiAgI2RlZmluZSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfUkRNQTAgICAgICAgICAgICAxMwo+
ID4gQEAgLTczLDYgKzg2LDggQEAKPiA+ICAjZGVmaW5lIE1VVEVYX1NPRl9EUEkxICAgICAgICAg
ICAgICAgICA0Cj4gPiAgI2RlZmluZSBNVVRFWF9TT0ZfRFNJMiAgICAgICAgICAgICAgICAgNQo+
ID4gICNkZWZpbmUgTVVURVhfU09GX0RTSTMgICAgICAgICAgICAgICAgIDYKPiA+ICsjZGVmaW5l
IE1UODE2N19NVVRFWF9TT0ZfRFBJMCAgICAgICAgICAyCj4gPiArI2RlZmluZSBNVDgxNjdfTVVU
RVhfU09GX0RQSTEgICAgICAgICAgMwo+ID4KPiA+Cj4gPiAgc3RydWN0IG10a19kaXNwX211dGV4
IHsKPiA+IEBAIC0xMzUsNiArMTUwLDIxIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQy
NzEyX211dGV4X21vZFtERFBfQ09NUE9ORU5UX0lEX01BWF0gPSB7Cj4gPiAgICAgICAgIFtERFBf
Q09NUE9ORU5UX1dETUExXSA9IE1UMjcxMl9NVVRFWF9NT0RfRElTUF9XRE1BMSwKPiA+ICB9Owo+
ID4KPiA+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10ODE2N19tdXRleF9tb2RbRERQX0NP
TVBPTkVOVF9JRF9NQVhdID0gewo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9BQUwwXSA9IE1U
ODE2N19NVVRFWF9NT0RfRElTUF9BQUwsCj4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX0NDT1JS
XSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9DQ09SUiwKPiA+ICsgICAgICAgW0REUF9DT01QT05F
TlRfQ09MT1IwXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9DT0xPUiwKPiA+ICsgICAgICAgW0RE
UF9DT01QT05FTlRfRElUSEVSXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9ESVRIRVIsCj4gPiAr
ICAgICAgIFtERFBfQ09NUE9ORU5UX0dBTU1BXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9HQU1N
QSwKPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMF0gPSBNVDgxNjdfTVVURVhfTU9EX0RJ
U1BfT1ZMMCwKPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMV0gPSBNVDgxNjdfTVVURVhf
TU9EX0RJU1BfT1ZMMSwKPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfUFdNMF0gPSBNVDgxNjdf
TVVURVhfTU9EX0RJU1BfUFdNLAo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9SRE1BMF0gPSBN
VDgxNjdfTVVURVhfTU9EX0RJU1BfUkRNQTAsCj4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1JE
TUExXSA9IE1UODE2N19NVVRFWF9NT0RfRElTUF9SRE1BMSwKPiA+ICsgICAgICAgW0REUF9DT01Q
T05FTlRfVUZPRV0gPSBNVDgxNjdfTVVURVhfTU9EX0RJU1BfVUZPRSwKPiA+ICsgICAgICAgW0RE
UF9DT01QT05FTlRfV0RNQTBdID0gTVQ4MTY3X01VVEVYX01PRF9ESVNQX1dETUEwLAo+ID4gK307
Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDgxNzNfbXV0ZXhfbW9kW0RE
UF9DT01QT05FTlRfSURfTUFYXSA9IHsKPiA+ICAgICAgICAgW0REUF9DT01QT05FTlRfQUFMMF0g
PSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfQUFMLAo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9D
T0xPUjBdID0gTVQ4MTczX01VVEVYX01PRF9ESVNQX0NPTE9SMCwKPiA+IEBAIC0xNjMsNiArMTkz
LDEzIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQyNzEyX211dGV4X3NvZltERFBfTVVU
RVhfU09GX0RTSTMgKyAxXSA9IHsKPiA+ICAgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJM10gPSBN
VVRFWF9TT0ZfRFNJMywKPiA+ICB9Owo+ID4KPiA+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IG10ODE2N19tdXRleF9zb2ZbRERQX01VVEVYX1NPRl9EU0kzICsgMV0gPSB7Cj4gPiArICAgICAg
IFtERFBfTVVURVhfU09GX1NJTkdMRV9NT0RFXSA9IE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKPiA+
ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJMF0gPSBNVVRFWF9TT0ZfRFNJMCwKPiA+ICsgICAg
ICAgW0REUF9NVVRFWF9TT0ZfRFBJMF0gPSBNVDgxNjdfTVVURVhfU09GX0RQSTAsCj4gPiArICAg
ICAgIFtERFBfTVVURVhfU09GX0RQSTFdID0gTVQ4MTY3X01VVEVYX1NPRl9EUEkxLAo+ID4gK307
Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzAxX2RkcF9k
cml2ZXJfZGF0YSA9IHsKPiA+ICAgICAgICAgLm11dGV4X21vZCA9IG10MjcwMV9tdXRleF9tb2Qs
Cj4gPiAgICAgICAgIC5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAo+ID4gQEAgLTE3Nyw2
ICsyMTQsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzEyX2RkcF9k
cml2ZXJfZGF0YSA9IHsKPiA+ICAgICAgICAgLm11dGV4X3NvZl9yZWcgPSBNVDI3MDFfRElTUF9N
VVRFWDBfU09GMCwKPiA+ICB9Owo+ID4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBf
ZGF0YSBtdDgxNjdfZGRwX2RyaXZlcl9kYXRhID0gewo+ID4gKyAgICAgICAubXV0ZXhfbW9kID0g
bXQ4MTY3X211dGV4X21vZCwKPiA+ICsgICAgICAgLm11dGV4X3NvZiA9IG10ODE2N19tdXRleF9z
b2YsCj4gPiArICAgICAgIC5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAs
Cj4gPiArICAgICAgIC5tdXRleF9zb2ZfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsCj4g
PiArICAgICAgIC5ub19jbGsgPSB0cnVlLAo+ID4gK307Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQ4MTczX2RkcF9kcml2ZXJfZGF0YSA9IHsKPiA+ICAgICAg
ICAgLm11dGV4X21vZCA9IG10ODE3M19tdXRleF9tb2QsCj4gPiAgICAgICAgIC5tdXRleF9zb2Yg
PSBtdDI3MTJfbXV0ZXhfc29mLAo+ID4gQEAgLTQwMCw2ICs0NDUsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBkZHBfZHJpdmVyX2R0X21hdGNoW10gPSB7Cj4gPiAgICAgICAg
ICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiAgICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+ID4gICAgICAgICAgIC5kYXRh
ID0gJm10MjcxMl9kZHBfZHJpdmVyX2RhdGF9LAo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE2Ny1kaXNwLW11dGV4IiwKPiA+ICsgICAgICAgICAuZGF0YSA9ICZtdDgx
NjdfZGRwX2RyaXZlcl9kYXRhfSwKPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxNzMtZGlzcC1tdXRleCIsCj4gPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX2RkcF9k
cml2ZXJfZGF0YX0sCj4gPiAgICAgICAgIHt9LAo+ID4gLS0KPiA+IDIuMjguMAo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
