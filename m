Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B196C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 07:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE902071C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 07:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IgNre9MK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJY872Vk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEE902071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzCa8pAnFYFaAqEEZb0Y77YeMRVof6AOgBc1++wtIOA=; b=IgNre9MK36O91/
	e4BwS/JfoiROU1KqoWHGRxLpNF6zvDqSNYGzqkHpAaVOovF7va/rXKb7kWQPnivGMqB7VxQe4uhjA
	HiIOfZ6QKc4UPTqEj9yq2Y2PAGX3zPcb+QXQtClvx82GRUP7F17aSPCGXyRSCkqaNuuffDmuJ7WHB
	ZEagzbJnUCREZw6Syy+J6X2oPSM0cKMXXoX6hzx2Y1rJ4BRVOjkMoCJ/2drEmyrEm8WonHMzfQXzT
	7mhg/S0Dfyq2s63HpPz8FE+kqA+hHhY/L1TQu51hKnYYH3d6jZ9WnFvuMW1njnxYc+Lg8+1pv8uOd
	32SB5uX4fz07IFmH3j9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCIV7-0006WT-BF; Thu, 12 Mar 2020 07:43:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCIV5-0006Vn-6S
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 07:43:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id a25so6099709wrd.0
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2020 00:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cBmBbvO3DHaF6ZM0Ex0exZ5k7RaaVlRVHw8bBFWLk68=;
 b=zJY872Vk0ENk8O9d1/vF4yt70XpjK4CvqiV/jZntDVQUqS80bWe8M3JDoQzVB2mdAr
 Qc9DIw3jkmvCLCE4pWVQlGw7esiFPP18VbCIapmO8bV1ZJyYLWeUB4/pbD7zJWNuDI6l
 m8Dq+6Z+4xikqbyHkN0QJkXNKYQdT0ZwUYnVO7fF12DVmV3UIQATSea0lhdWYZr7Rj6V
 +1pxYJsfUUeUpc3rdNrXcVqazEDQvQ8muPih69KFxJrwguJJy23f2cEXiVM3A2I+Kmca
 2EoYdG3eelt6WlAUGye4Y3+/wsWgbqoIIt61Pdoju38ymhdHYPghCFAcZtG9v7zloTcN
 II5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cBmBbvO3DHaF6ZM0Ex0exZ5k7RaaVlRVHw8bBFWLk68=;
 b=K+WNohUnK4v3Jy0s7mFwogwxXhtg7LG/AbnB01zLC2H+TNt5y0X2ZZdLJL224wdx9V
 wjamvHXV8Tox5sTMARkq0hbV9jNw0dfuMNuXRbu4Z0R9CeeT22P+Sz4d+t4ppHZ8q2Zo
 95Nws+l9VYskDgy8aXLvHlsv6oWgB+wNDSVyXPGkpJw4yiMJSPDtyBcAOKRIe8vEXALy
 23NAfRiFNcXflZjB/WAuwZUUcwLtvN3yISERmx+vRnqg5fifzaX+QXVAIn97p0iu1ivP
 HIW2bvX2/I8xjvMeUuPQjpmV5N/XCzF0Jts2Jk1i1ezMiuzzXYM60mIT03S5i6vUdkQ8
 Sg5Q==
X-Gm-Message-State: ANhLgQ0z8DJ3BX3PZHTs80akJegiJN+kMujImOmrcw2dpjXl0rL/91bJ
 cB0wpZlYv8/nVFD0gDbmLJr/Rg==
X-Google-Smtp-Source: ADFU+vtvxDiPA/GMHD+H5t3DWhluKuQ2jWG2EYeSH9Gtd2RzLo/KFy2SCx51K12MuuqOtu0airE3Hw==
X-Received: by 2002:adf:e64f:: with SMTP id b15mr6233670wrn.424.1583999005153; 
 Thu, 12 Mar 2020 00:43:25 -0700 (PDT)
Received: from dell ([2.27.167.19])
 by smtp.gmail.com with ESMTPSA id n2sm5659471wrr.62.2020.03.12.00.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 00:43:24 -0700 (PDT)
Date: Thu, 12 Mar 2020 07:44:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v10 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200312074407.GA3142@dell>
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_004327_241632_8C74F0DE 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>,
 Josef Friedl <josef.friedl@speed.at>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMSBNYXIgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gRnJvbTogUmFu
IEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+IAo+IFRoaXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBN
ZWRpYVRlayBNVDYzNTggUlRDLiBEcml2ZXIgdXNpbmcKPiBjb21wYXRpYmxlIGRhdGEgdG8gc3Rv
cmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4KPiBUaGlzIHJlcGxhY2UgUlRD
X1dSVEdSIHRvIFJUQ19XUlRHUl9NVDYzMjMgaW4gbXQ2MzIzLXBvd2Vyb2ZmCj4gZHJpdmVyIHdo
aWNoIG9ubHkgbmVlZGVkIGJ5IGFybXY3IENQVSB3aXRob3V0IEFURi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSYW4gQmkgPHJhbi5iaUBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1I
c2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvcG93ZXIvcmVzZXQvbXQ2MzIzLXBvd2Vyb2ZmLmMgfCAgMiArLQo+ICBkcml2ZXJzL3J0Yy9y
dGMtbXQ2Mzk3LmMgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0KPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oICAgICAgICB8ICA5ICsrKysr
KysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2VyL3Jlc2V0L210NjMyMy1wb3dlcm9mZi5j
IGIvZHJpdmVycy9wb3dlci9yZXNldC9tdDYzMjMtcG93ZXJvZmYuYwo+IGluZGV4IDFjYWY0M2Qu
LjA1MzI4MDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wb3dlci9yZXNldC9tdDYzMjMtcG93ZXJv
ZmYuYwo+ICsrKyBiL2RyaXZlcnMvcG93ZXIvcmVzZXQvbXQ2MzIzLXBvd2Vyb2ZmLmMKPiBAQCAt
MzAsNyArMzAsNyBAQCBzdGF0aWMgdm9pZCBtdDYzMjNfZG9fcHdyb2ZmKHZvaWQpCj4gIAlpbnQg
cmV0Owo+ICAKPiAgCXJlZ21hcF93cml0ZShwd3JjLT5yZWdtYXAsIHB3cmMtPmJhc2UgKyBSVENf
QkJQVSwgUlRDX0JCUFVfS0VZKTsKPiAtCXJlZ21hcF93cml0ZShwd3JjLT5yZWdtYXAsIHB3cmMt
PmJhc2UgKyBSVENfV1JUR1IsIDEpOwo+ICsJcmVnbWFwX3dyaXRlKHB3cmMtPnJlZ21hcCwgcHdy
Yy0+YmFzZSArIFJUQ19XUlRHUl9NVDYzMjMsIDEpOwo+ICAKPiAgCXJldCA9IHJlZ21hcF9yZWFk
X3BvbGxfdGltZW91dChwd3JjLT5yZWdtYXAsCj4gIAkJCQkJcHdyYy0+YmFzZSArIFJUQ19CQlBV
LCB2YWwsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyBiL2RyaXZlcnMv
cnRjL3J0Yy1tdDYzOTcuYwo+IGluZGV4IGNkYTIzOGQuLjdhNWE5ZTIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jCj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5j
Cj4gQEAgLTksMTggKzksMzggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9tdDYzOTcvY29yZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tdXRleC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcnRjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvbXQ2Mzk3L3J0Yy5oPgo+ICAjaW5j
bHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19ydGNfZGF0YSBtdDYzNThfcnRjX2RhdGEgPSB7Cj4gKwkud3J0Z3IgPSBSVENfV1JUR1Jf
TVQ2MzU4LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgbXQ2
Mzk3X3J0Y19kYXRhID0gewo+ICsJLndydGdyID0gUlRDX1dSVEdSX01UNjM5NywKPiArfTsKPiAr
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10NjM5N19ydGNfb2ZfbWF0Y2hb
XSA9IHsKPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzIzLXJ0YyIsCj4gKwkJLmRh
dGEgPSAodm9pZCAqKSZtdDYzOTdfcnRjX2RhdGEsIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10NjM1OC1ydGMiLAo+ICsJCS5kYXRhID0gKHZvaWQgKikmbXQ2MzU4X3J0Y19kYXRh
LCB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzOTctcnRjIiwKPiArCQkuZGF0
YSA9ICh2b2lkICopJm10NjM5N19ydGNfZGF0YSwgfSwKPiArCXt9Cj4gK307Cj4gK01PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIG10NjM5N19ydGNfb2ZfbWF0Y2gpOwo+ICsKPiAgc3RhdGljIGludCBt
dGtfcnRjX3dyaXRlX3RyaWdnZXIoc3RydWN0IG10NjM5N19ydGMgKnJ0YykKPiAgewo+ICAJaW50
IHJldDsKPiAgCXUzMiBkYXRhOwo+ICAKPiAtCXJldCA9IHJlZ21hcF93cml0ZShydGMtPnJlZ21h
cCwgcnRjLT5hZGRyX2Jhc2UgKyBSVENfV1JUR1IsIDEpOwo+ICsJcmV0ID0gcmVnbWFwX3dyaXRl
KHJ0Yy0+cmVnbWFwLCBydGMtPmFkZHJfYmFzZSArIHJ0Yy0+ZGF0YS0+d3J0Z3IsIDEpOwo+ICAJ
aWYgKHJldCA8IDApCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gQEAgLTI2OSw2ICsyODksOSBAQCBz
dGF0aWMgaW50IG10a19ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4g
IAlydGMtPmFkZHJfYmFzZSA9IHJlcy0+c3RhcnQ7Cj4gIAo+ICsJcnRjLT5kYXRhID0gKHN0cnVj
dCBtdGtfcnRjX2RhdGEgKikKPiArCQkJb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5k
ZXYpOwo+ICsKPiAgCXJ0Yy0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAgCWlm
IChydGMtPmlycSA8IDApCj4gIAkJcmV0dXJuIHJ0Yy0+aXJxOwo+IEBAIC0zMjUsMTMgKzM0OCw2
IEBAIHN0YXRpYyBpbnQgbXQ2Mzk3X3J0Y19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICBz
dGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXQ2Mzk3X3BtX29wcywgbXQ2Mzk3X3J0Y19zdXNwZW5k
LAo+ICAJCQltdDYzOTdfcnRjX3Jlc3VtZSk7Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBtdDYzOTdfcnRjX29mX21hdGNoW10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10NjMyMy1ydGMiLCB9LAo+IC0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDYzOTctcnRjIiwgfSwKPiAtCXsgfQo+IC19Owo+IC1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBt
dDYzOTdfcnRjX29mX21hdGNoKTsKPiAtCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG10a19ydGNfZHJpdmVyID0gewo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJtdDYzOTct
cnRjIiwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oIGIvaW5j
bHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oCj4gaW5kZXggN2RmYjYzYi4uNjY1MzRlZCAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgKPiArKysgYi9pbmNsdWRl
L2xpbnV4L21mZC9tdDYzOTcvcnRjLmgKPiBAQCAtMTgsNyArMTgsOSBAQAo+ICAjZGVmaW5lIFJU
Q19CQlBVX0NCVVNZICAgICAgICAgQklUKDYpCj4gICNkZWZpbmUgUlRDX0JCUFVfS0VZICAgICAg
ICAgICAgKDB4NDMgPDwgOCkKPiAgCj4gLSNkZWZpbmUgUlRDX1dSVEdSICAgICAgICAgICAgICAw
eDAwM2MKPiArI2RlZmluZSBSVENfV1JUR1JfTVQ2MzU4ICAgICAgIDB4M2EKPiArI2RlZmluZSBS
VENfV1JUR1JfTVQ2Mzk3ICAgICAgIDB4M2MKPiArI2RlZmluZSBSVENfV1JUR1JfTVQ2MzIzICAg
ICAgIFJUQ19XUlRHUl9NVDYzOTcKPiAgCj4gICNkZWZpbmUgUlRDX0lSUV9TVEEgICAgICAgICAg
ICAweDAwMDIKPiAgI2RlZmluZSBSVENfSVJRX1NUQV9BTCAgICAgICAgIEJJVCgwKQo+IEBAIC02
NSw2ICs2NywxMCBAQAo+ICAjZGVmaW5lIE1US19SVENfUE9MTF9ERUxBWV9VUyAgMTAKPiAgI2Rl
ZmluZSBNVEtfUlRDX1BPTExfVElNRU9VVCAgIChqaWZmaWVzX3RvX3VzZWNzKEhaKSkKPiAgCj4g
K3N0cnVjdCBtdGtfcnRjX2RhdGEgewo+ICsJdTMyCQkJd3J0Z3I7Cj4gK307CgpEbyB5b3UgZXhw
ZWN0IHRvIGFkZCBtb3JlIHByb3BlcnRpZXMgdG8gdGhpcyBzdHJ1Y3Q/CgpJZiBub3QsIGl0IHNl
ZW1zIGEgYml0IG92ZXJraWxsLgoKPiAgc3RydWN0IG10NjM5N19ydGMgewo+ICAJc3RydWN0IGRl
dmljZSAgICAgICAgICAgKmRldjsKPiAgCXN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGNfZGV2
Owo+IEBAIC03NCw2ICs4MCw3IEBAIHN0cnVjdCBtdDYzOTdfcnRjIHsKPiAgCXN0cnVjdCByZWdt
YXAgICAgICAgICAgICpyZWdtYXA7Cj4gIAlpbnQgICAgICAgICAgICAgICAgICAgICBpcnE7Cj4g
IAl1MzIgICAgICAgICAgICAgICAgICAgICBhZGRyX2Jhc2U7Cj4gKwljb25zdCBzdHJ1Y3QgbXRr
X3J0Y19kYXRhICpkYXRhOwoKJ2RhdGEnIGlzIGEgdGVycmlibGUgdmFyaWFibGUgbmFtZS4KCldo
eSBkbyB5b3UgbmVlZCB0byBzdG9yZSB0aGlzPwoKSXQncyBvbmUgdmFyaWFibGUgd2hpY2ggaXMg
dXNlZCBvbmNlIEFGQUlDVC4KCj4gIH07Cj4gIAo+ICAjZW5kaWYgLyogX0xJTlVYX01GRF9NVDYz
OTdfUlRDX0hfICovCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
