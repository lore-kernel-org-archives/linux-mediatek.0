Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CA9C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 03:43:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E3D20693
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 03:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/RFO2RG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t1D6JI7b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E3D20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsLZpurIfDwcqDKo4D5Y3XapEWa/08kZG0q9kzJhP1Y=; b=M/RFO2RG4u3MHCTcp1kFSCShS
	D2ZAuMlc0ggGw1xqyxf9ThVsEi8ug+Lz8FUOGJzA3rH14sRKm8cWj2eE5gQZL2ZgRWPuPsLPahAmx
	MPoy7WVIpt6tBY57H/LsQIpWjeqCcCnMZ5016ij3vgBo1EHwie1QIvSusFwaaj9ZK/ilGUCLNXYJd
	cPTe1JD4oqvZ9PdUQQX8uOo1uin/CFsloLDC/NTLSsPvEg43QK0VsQ53/KicXMYPqxIgf/yXnFBOJ
	WYPIRh50L0DcXLagLWS0/YPU9aO2smwmBzl5Tgu3Rtjy0qM5oGQ6m6YDAkm/MMo1/YZJEdObAzwGp
	w5WKXVfiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCxCF-00048K-Gr; Tue, 01 Sep 2020 03:42:59 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxC9-00045R-6b; Tue, 01 Sep 2020 03:42:54 +0000
Received: by mail-il1-x143.google.com with SMTP id y2so3077805ilp.7;
 Mon, 31 Aug 2020 20:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yC+DH8F9S1noAz2kEtZOwWN5TObh7PkAv1zYBcxxwps=;
 b=t1D6JI7beEGd68zuDhYxtqcNutXRrlXIqf5K3TyohjpULva3QujiVHfNE8TbbX2IKN
 bOuaz55uCGQN6PQGZk2w9hWayXKyyL3X5ymDezSx6u3KXGnv1xzADtto0/i7uX25TyTF
 5Qhr8vng+zqwMhq2MO16LDolITQHuFK2tJRL2o16Jv3y79CQY4ZQJydOJOtJQoyv0sW3
 AOM8Y6G3zNJqgpt17R7CVCEBtZJiDaYToIk7s7xQkE0MNos7b1vUVkJCezp36ADiFuiW
 YCVyoQRqFan+RLMVsZVpxYQFmO4JfzMEaJMaCAFk2/hWTc8ahQuU99Vz2rQWwtQcihnb
 Sfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yC+DH8F9S1noAz2kEtZOwWN5TObh7PkAv1zYBcxxwps=;
 b=j6D16snAu+bk3br4kkYYs2v0eqoJ1r5U4SPw5I45QI8CrPP0dodAGHe8OnstWGsw9b
 jT3c5DC7fhGzJoWlyWxDRLjgkOUSFRf0HX2B5U6/osbNacQcLp0bJpaBftylrqDybvfm
 fwIffPrAHdiY+byJyrf+rmGPm8934PAJh8thsVH710NEyItLh+Dkr4645WzfqZkupDkS
 zxBYAvXZ6hINKfvpuKaUR8QSGhowqutG7l5VRoUXJTy5GgmcqlekouAbL9YD+kqwn84k
 zroeVB20Oa2b+PPkcORozpaqzmAtFjofSIa/DdM6r5PZxmV9kdcrq6HezOIAeSn0N08Y
 RlAg==
X-Gm-Message-State: AOAM532nyT5x8aq1RPAbE06+oMzfE5tDVlcay6ZJO0gBUVu1pOVBp0kq
 ZRkJEY7uKWfpSXoUC5lWUpAv0wLBhpAf379nWtg=
X-Google-Smtp-Source: ABdhPJzGnO6lLr7vGuK0BxTdFGzUKAQhk59XmWw6DxwYqiLR1hIz6LPOTbQpHMykz9ksV3rJNVz8mDaK8sZiNFdBQJw=
X-Received: by 2002:a92:6902:: with SMTP id e2mr3871563ilc.127.1598931769747; 
 Mon, 31 Aug 2020 20:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com>
 <06b19a38-6850-01b1-7a43-b61aec4079b8@ti.com>
In-Reply-To: <06b19a38-6850-01b1-7a43-b61aec4079b8@ti.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 1 Sep 2020 11:42:38 +0800
Message-ID: <CAE+NS35UiKHP62gSskmX0A3YM+GDq-snq6j52iO32qnN+mT8ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Dan Murphy <dmurphy@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_234253_270539_0FD18A0E 
X-CRM114-Status: GOOD (  24.65  )
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
Cc: linux-arm-kernel@lists.infradead.org, Gene Chen <gene_chen@richtek.com>,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+IOaWvCAyMDIw5bm0OOaciDI25pelIOmAseS4iSDk
uIvljYg3OjU05a+r6YGT77yaCj4KPiBHZW5lCj4KPiBPbiA4LzI2LzIwIDY6MzcgQU0sIEdlbmUg
Q2hlbiB3cm90ZToKPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+
ID4KPiA+IEFkZCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgTEVEIHN1cHBvcnQgb24gTVQ2MzYwIFBN
SUMKPgo+IFVzdWFsbHkgYmluZGluZ3MgYXJlIDEveCBpbiB0aGUgcGF0Y2hzZXQuCj4KCkFDSwoK
PiBBbmQgeW91IHNob3VsZCBjYyBSb2IgSGVycmluZyBhbmQgdGhlIERldmljZSB0cmVlIG1haWwg
bGlzdCBvdGhlciB3aXNlCj4gdGhlIG1haW50YWluZXIgd2lsbCBub3QgYXBwbHkgdGhpcyBwYXRj
aCB3aXRob3V0IHRoZWlyIEFDS3MKPgo+CgpBQ0sKCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENo
ZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwgICAgICB8IDUwICsrKysrKysrKysrKysrKysr
KysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMt
bXQ2MzYwLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwLi40NTk4YmU1Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1sCj4g
PiBAQCAtMCwwICsxLDUwIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwjCj4g
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Cj4gPiArCj4gPiArdGl0bGU6IExFRCBkcml2ZXIgZm9yIE1UNjM2MCBQTUlDIGZyb20gTWVkaWFU
ZWsgSW50ZWdyYXRlZC4KPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gR2VuZSBDaGVu
IDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsg
IFRoaXMgbW9kdWxlIGlzIHBhcnQgb2YgdGhlIE1UNjM2MCBNRkQgZGV2aWNlLiBGb3IgbW9yZSBk
ZXRhaWxzCj4gPiArICBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9t
dDYzNjAueWFtbC4KPgo+IEkgdGhpbmsgeW91IG5lZWQgdG8gaW5jbHVkZSB0aGlzIHlhbWwgdXNp
bmcgYWxsb2YgdGFnCj4KPgoKSSB0cnkgYWRkIGFsbE9mIHRhZwphbGxPZjoKIC0gJHJlZjogIi4u
L21mZC9tdDYzNjAueWFtbCIKCnRoZW4gdGhlIHJlcXVpcmVkIHByb3BlcnR5IGNvbnRhaW5zIG10
NjM2MC55YW1sLCB3aGljaCBsZWFkcyB0byBidWlsZCBkdCBlcnJvci4KL21lZGlhL2dlbmVfY2hl
bi9XRC91cHN0cmVhbS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVk
cy9sZWRzLW10NjM2MC5leGFtcGxlLmR0LnlhbWw6CmxlZC1jb250cm9sbGVyOiAncmVnJyBpcyBh
IHJlcXVpcmVkIHByb3BlcnR5Ci9tZWRpYS9nZW5lX2NoZW4vV0QvdXBzdHJlYW0vbGludXgvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAuZXhhbXBsZS5k
dC55YW1sOgpsZWQtY29udHJvbGxlcjogJ2ludGVycnVwdC1jb250cm9sbGVyJyBpcyBhIHJlcXVp
cmVkIHByb3BlcnR5Ci9tZWRpYS9nZW5lX2NoZW4vV0QvdXBzdHJlYW0vbGludXgvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAuZXhhbXBsZS5kdC55YW1s
OgpsZWQtY29udHJvbGxlcjogJyNpbnRlcnJ1cHQtY2VsbHMnIGlzIGEgcmVxdWlyZWQgcHJvcGVy
dHkKL21lZGlhL2dlbmVfY2hlbi9XRC91cHN0cmVhbS9saW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC5leGFtcGxlLmR0LnlhbWw6CmxlZC1jb250
cm9sbGVyOiBjb21wYXRpYmxlOjA6ICdtZWRpYXRlayxtdDYzNjAnIHdhcyBleHBlY3RlZAoKSSB0
aGluayBJIGNhbiByZW1vdmUgdGhpcyBkZXNjcmlwdGlvbiBmb3IgbWlzcmVhZC4KCj4gPiArCj4g
PiArICBUaGUgTEVEIGNvbnRyb2xsZXIgaXMgcmVwcmVzZW50ZWQgYXMgYSBzdWItbm9kZSBvZiB0
aGUgUE1JQyBub2RlIG9uCj4gPiArICB0aGUgZGV2aWNlIHRyZWUuCj4gPiArCj4gPiArICBUaGlz
IGRldmljZSBoYXMgc2l4IGN1cnJlbnQgc2lua3MuCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+
ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDYzNjAtbGVkCj4gPiAr
Cj4gPiArICAiI2FkZHJlc3MtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMQo+ID4gKwo+ID4gKyAg
IiNzaXplLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDAKPiA+ICsKPiA+ICtwYXR0ZXJuUHJvcGVy
dGllczoKPiA+ICsgICJebGVkQFswLTVdJCI6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFByb3BlcnRpZXMgZm9yIGEgc2luZ2xlIExFRC4K
PiA+ICsKPiA+ICsgICAgcHJvcGVydGllczoKPiA+ICsgICAgICByZWc6Cj4gPiArICAgICAgICBk
ZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgSW5kZXggb2YgdGhlIExFRC4KPiA+ICsgICAgICAg
IG1pbmltdW06IDAKPiA+ICsgICAgICAgIG1heGltdW06IDUKPiA+ICsKPiA+ICtyZXF1aXJlZDoK
PiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSAiI2FkZHJlc3MtY2VsbHMiCj4gPiArICAtICIj
c2l6ZS1jZWxscyIKPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiBOZWVk
IGEgbmV3IGxpbmUKPgo+Cj4gQW5kIGFuIGV4YW1wbGUKPgo+ID4gKy4uLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
