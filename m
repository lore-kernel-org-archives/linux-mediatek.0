Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28A16115B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F28A16115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK7t5UWC32ku6z6EeZ+LPP5vIUbxziFoWicgPlwtgjg=; b=jnvt2DQnXLEYB5
	NZuued85NoAJuAnFwGlTTHIeQGnr28bfRPHclrmtv5NSGYAewWV0spCGEpbY6+0LVosNWIPfbF0AD
	+4VBkW+Zkz/tT1YJfiSjYpQPSkNhes7GYUrW97sXv70Xz9JJcNEbkj836VJbD0KeevLn4EcJ9wrn9
	gx1iBYG3l1y0iRxEoxCN2kj7ynFiUxV9gAVhGJzafrw3GN2t4B3pUAw/QlnZsWSH1DdZzgR61cloA
	KlrZg00WfCXmb3SvTHZwfVufyeCQhKnNvoUXoWg8DZLs0Hg9KQDEISzK7+iwehYdK9l7379KaWGZv
	uwB5lMhgo1ZzQx/qL6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mniVY-0088ky-V3; Thu, 18 Nov 2021 14:35:24 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mniVV-0088iF-BA
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 14:35:22 +0000
Received: by mail-il1-x130.google.com with SMTP id e8so6629810ilu.9
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Nov 2021 06:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=5x6WOv0CKzpTKeVpOGLcGQsyAj8+hoUmQ/3ATUXLpb8=;
 b=2MjgmgAmYj3REgChVDTJNGL8QHEsE3+PPtuxSgy8vINofW4UBAhQVUcw4UOU+d8RrC
 a+o1tqz/hCpB5Io69nP6zofw75T3ZIYm6pMlzC58nltc6hmvlzVj+qSxaLROmDMJ3lNl
 ndAA2rW6VoMneSsjVXvkzg5W4VGDGgyg07TRjaj7XrfUxY2Nny9b2ly8pmP2D03Bmt6E
 inHnNp6UPRKLQD1ObvQbTZoUFp5y2hhMX1m4dOrgEYK2YxKhF0qegikWVdiB5t1rs1r/
 ASfO/0pXelf/7EPCloQv1ThLO3dne7GKkbE/GHlaLoncdi8DRfRL2nqvsJYSVPnuPIDx
 +4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=5x6WOv0CKzpTKeVpOGLcGQsyAj8+hoUmQ/3ATUXLpb8=;
 b=SDQ1pS43jG8PTS7fn/Fe0nPF2adG+3ZwP5NVKb06oIyJodbsk5Vg+JzICf1iWC7N03
 ecY8muIPzhD2afJI9WEXOVRgbX1t73UPTFuVK/TYFsbKY4wB0CB2ulUNlRsXNdcT2cMo
 IYo0UbppN9oYLjEtkRWB8zHt1DCp/xzxT/qAOdgJAQIM8F4ftl/1SB4PgfpCRfUKcJXB
 0L+kMj1JwyeK/NrEBcDS4GvV6iSQnPx9vp+LnDsvEYQPVKsP35UX4ymwqJ+4WQB9//BG
 7+/xwHc9jsdvbbV5UFg5W+WwVCjVXWi3LKgsYHb8sEUSas4KH5hEDdA6f4yL5s7+R3JZ
 Q/zw==
X-Gm-Message-State: AOAM532vvr7yKieIfS0iWz+/CO2LAGsl1UDv6O1ZUrp1Q4CrUH274DLy
 zB5LQfnnRo3unhMufICYdEdmkg==
X-Google-Smtp-Source: ABdhPJymz8ch3wnyxVw+4PkayYCDASDgAlJyqmmui95LJS0hfJMxUv7Ja6tfW2gCUadmUgqQ6wiY2w==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id
 h30mr16455668ila.138.1637246120025; 
 Thu, 18 Nov 2021 06:35:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 f2sm2476811ilu.54.2021.11.18.06.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:35:19 -0800 (PST)
Message-ID: <873eced9623809200c2d97e488a2a14df070d8f9.camel@ndufresne.ca>
Subject: Re: [PATCH v2 7/7] meida: mtk-vcodec: remove unused func parameter
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-media@vger.kernel.org
Cc: kernel@collabora.com, acourbot@chromium.org,
 andrew-ct.chen@mediatek.com,  courbot@chromium.org, dafna3@gmail.com,
 eizan@chromium.org,  houlong.wei@mediatek.com, hsinyi@chromium.org,
 hverkuil@xs4all.nl,  irui.wang@mediatek.com, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, maoguang.meng@mediatek.com, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 tfiga@chromium.org, tiffany.lin@mediatek.com
Date: Thu, 18 Nov 2021 09:35:17 -0500
In-Reply-To: <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_063521_425039_D6B694B2 
X-CRM114-Status: GOOD (  12.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SnVzdCBub3RpY2VkIHRoZSBoZWFkbGluZSB0eXBvOiBtZWlkYSAtPiBtZWRpYQoKY2hlZXJzLApO
aWNvbGFzCgpMZSBtZXJjcmVkaSAxNyBub3ZlbWJyZSAyMDIxIMOgIDE1OjA2ICswMjAwLCBEYWZu
YSBIaXJzY2hmZWxkIGEgw6ljcml0wqA6Cj4gVGhlIHByYXJhbWV0ZXIgYnNfc2l6ZSB0byBmdW5j
dGlvbiB2cHVfZW5jX2VuY29kZQo+IGlzIG5vdCB1c2VkLiBSZW1vdmUgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuYy92ZW5jX2gy
NjRfaWYuYyB8IDkgKysrLS0tLS0tCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy92ZW5jL3ZlbmNfdnA4X2lmLmMgIHwgMyArLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL3ZlbmNfdnB1X2lmLmMgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1X2lmLmggICAgICAgfCAxIC0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuYy92ZW5jX2gyNjRfaWYuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jL3ZlbmNfaDI2NF9pZi5jCj4gaW5k
ZXggYjZhNGYyMDc0ZmE1Li5iZjAzODg4YTgyNGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmMvdmVuY19oMjY0X2lmLmMKPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuYy92ZW5jX2gyNjRfaWYuYwo+IEBAIC0zNjcs
OCArMzY3LDcgQEAgc3RhdGljIGludCBoMjY0X2VuY29kZV9zcHMoc3RydWN0IHZlbmNfaDI2NF9p
bnN0ICppbnN0LAo+ICAKPiAgCW10a192Y29kZWNfZGVidWdfZW50ZXIoaW5zdCk7Cj4gIAo+IC0J
cmV0ID0gdnB1X2VuY19lbmNvZGUoJmluc3QtPnZwdV9pbnN0LCBIMjY0X0JTX01PREVfU1BTLCBO
VUxMLAo+IC0JCQkgICAgIGJzX2J1ZiwgYnNfc2l6ZSwgTlVMTCk7Cj4gKwlyZXQgPSB2cHVfZW5j
X2VuY29kZSgmaW5zdC0+dnB1X2luc3QsIEgyNjRfQlNfTU9ERV9TUFMsIE5VTEwsIGJzX2J1Ziwg
TlVMTCk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IEBAIC0zOTQsOCArMzkz
LDcgQEAgc3RhdGljIGludCBoMjY0X2VuY29kZV9wcHMoc3RydWN0IHZlbmNfaDI2NF9pbnN0ICpp
bnN0LAo+ICAKPiAgCW10a192Y29kZWNfZGVidWdfZW50ZXIoaW5zdCk7Cj4gIAo+IC0JcmV0ID0g
dnB1X2VuY19lbmNvZGUoJmluc3QtPnZwdV9pbnN0LCBIMjY0X0JTX01PREVfUFBTLCBOVUxMLAo+
IC0JCQkgICAgIGJzX2J1ZiwgYnNfc2l6ZSwgTlVMTCk7Cj4gKwlyZXQgPSB2cHVfZW5jX2VuY29k
ZSgmaW5zdC0+dnB1X2luc3QsIEgyNjRfQlNfTU9ERV9QUFMsIE5VTEwsIGJzX2J1ZiwgTlVMTCk7
Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IEBAIC00NTEsOCArNDQ5LDcgQEAg
c3RhdGljIGludCBoMjY0X2VuY29kZV9mcmFtZShzdHJ1Y3QgdmVuY19oMjY0X2luc3QgKmluc3Qs
Cj4gIAltdGtfdmNvZGVjX2RlYnVnKGluc3QsICJmcm1fY291bnQgPSAlZCxza2lwX2ZybV9jb3Vu
dCA9JWQsZnJtX3R5cGU9JWQuXG4iLAo+ICAJCQkgZnJhbWVfaW5mby5mcm1fY291bnQsIGZyYW1l
X2luZm8uc2tpcF9mcm1fY291bnQsCj4gIAkJCSBmcmFtZV9pbmZvLmZybV90eXBlKTsKPiAtCXJl
dCA9IHZwdV9lbmNfZW5jb2RlKCZpbnN0LT52cHVfaW5zdCwgSDI2NF9CU19NT0RFX0ZSQU1FLCBm
cm1fYnVmLAo+IC0JCQkgICAgIGJzX2J1ZiwgYnNfc2l6ZSwgJmZyYW1lX2luZm8pOwo+ICsJcmV0
ID0gdnB1X2VuY19lbmNvZGUoJmluc3QtPnZwdV9pbnN0LCBIMjY0X0JTX01PREVfRlJBTUUsIGZy
bV9idWYsIGJzX2J1ZiwgJmZyYW1lX2luZm8pOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3Zl
bmMvdmVuY192cDhfaWYuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5j
L3ZlbmNfdnA4X2lmLmMKPiBpbmRleCA4MjY3YTljNGZkMjUuLjZiNjY5NTdkNTE5MiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuYy92ZW5jX3ZwOF9p
Zi5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmMvdmVuY192
cDhfaWYuYwo+IEBAIC0zMDIsOCArMzAyLDcgQEAgc3RhdGljIGludCB2cDhfZW5jX2VuY29kZV9m
cmFtZShzdHJ1Y3QgdmVuY192cDhfaW5zdCAqaW5zdCwKPiAgCj4gIAltdGtfdmNvZGVjX2RlYnVn
KGluc3QsICItPmZybV9jbnQ9JWQiLCBpbnN0LT5mcm1fY250KTsKPiAgCj4gLQlyZXQgPSB2cHVf
ZW5jX2VuY29kZSgmaW5zdC0+dnB1X2luc3QsIDAsIGZybV9idWYsIGJzX2J1ZiwgYnNfc2l6ZSwK
PiAtCQkJICAgICBOVUxMKTsKPiArCXJldCA9IHZwdV9lbmNfZW5jb2RlKCZpbnN0LT52cHVfaW5z
dCwgMCwgZnJtX2J1ZiwgYnNfYnVmLCBOVUxMKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJl
dDsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92
ZW5jX3ZwdV9pZi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1
X2lmLmMKPiBpbmRleCBiZTZkODc5MGE0MWUuLmU3ODk5ZDhhM2U0ZSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYwo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jCj4gQEAgLTIyNSw3
ICsyMjUsNiBAQCBpbnQgdnB1X2VuY19zZXRfcGFyYW0oc3RydWN0IHZlbmNfdnB1X2luc3QgKnZw
dSwKPiAgaW50IHZwdV9lbmNfZW5jb2RlKHN0cnVjdCB2ZW5jX3ZwdV9pbnN0ICp2cHUsIHVuc2ln
bmVkIGludCBic19tb2RlLAo+ICAJCSAgIHN0cnVjdCB2ZW5jX2ZybV9idWYgKmZybV9idWYsCj4g
IAkJICAgc3RydWN0IG10a192Y29kZWNfbWVtICpic19idWYsCj4gLQkJICAgdW5zaWduZWQgaW50
ICpic19zaXplLAo+ICAJCSAgIHN0cnVjdCB2ZW5jX2ZyYW1lX2luZm8gKmZyYW1lX2luZm8pCj4g
IHsKPiAgCWNvbnN0IGJvb2wgaXNfZXh0ID0gTVRLX0VOQ19DVFhfSVNfRVhUKHZwdS0+Y3R4KTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1
X2lmLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuaAo+
IGluZGV4IGY5YmU5Y2FiN2ZmNy4uZjgzYmMxYjNmMmJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5oCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1X2lmLmgKPiBAQCAtNDUsNyArNDUsNiBA
QCBpbnQgdnB1X2VuY19zZXRfcGFyYW0oc3RydWN0IHZlbmNfdnB1X2luc3QgKnZwdSwKPiAgaW50
IHZwdV9lbmNfZW5jb2RlKHN0cnVjdCB2ZW5jX3ZwdV9pbnN0ICp2cHUsIHVuc2lnbmVkIGludCBi
c19tb2RlLAo+ICAJCSAgIHN0cnVjdCB2ZW5jX2ZybV9idWYgKmZybV9idWYsCj4gIAkJICAgc3Ry
dWN0IG10a192Y29kZWNfbWVtICpic19idWYsCj4gLQkJICAgdW5zaWduZWQgaW50ICpic19zaXpl
LAo+ICAJCSAgIHN0cnVjdCB2ZW5jX2ZyYW1lX2luZm8gKmZyYW1lX2luZm8pOwo+ICBpbnQgdnB1
X2VuY19kZWluaXQoc3RydWN0IHZlbmNfdnB1X2luc3QgKnZwdSk7Cj4gIAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
