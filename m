Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7193FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 10:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E15B20838
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 10:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lT0riD0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rli980ko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E15B20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WbvJ0dtNKEC3hbj8evOCoePln7HeWBeADyxhMbiqKgg=; b=lT0riD0hmSo4zsawmHETU7LqD
	XJ+vooYcoNUJ5CVOUtbtKY27Z5xj1U8l+JuDp5ne7zaJJD9xHKU7m0SUz/JS4+sWaD5doO+ia8r3q
	YSDxsA6AEm67nl4PIosMFb3azL1s4LG5A95LcQNx0UwVZ2ixR+2a/bhJzgHna0IpPVxlY7Lw3RYBT
	Xf+hxgeU3GV1h1X6AhUBiPMz05H0VkRlGo2fztUUjj1cR/nlyI38aczqyRrq/y4mGpCQCPgdy7two
	hjostWePuGholMDEBnmbWbqDFZ8T+oe1EUZ3E+IWLdYQIbR3+c0OIAli+03QCh1AnY/V1Re7YAKwu
	n01urtakA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1SkJ-0003S8-NI; Fri, 31 Jul 2020 10:58:39 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1SkE-0003R8-WD; Fri, 31 Jul 2020 10:58:36 +0000
Received: by mail-io1-xd42.google.com with SMTP id z6so31293044iow.6;
 Fri, 31 Jul 2020 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=atvDp6J9S9UphQS2KC0AkwktCLxJNBc+ILJ3smYnHdU=;
 b=rli980koGd1kgmFsVlyqWdra6dMO4bC6Yi4MNRh/aFjXRN3u6MB4SVjncpEbbnQF/H
 pjELWlbAvBZ48IThZhDem+4gL6v1C4AneETr/pWXAem2wofMVuJwW5zr5UDwLrh7brJE
 ymiOBKCj0SoVI5Tbav8PcOzOd2z3c3TgNRA3PMTdgEq/FFCqEprvwlmUoUfaI8dgCKxd
 2MgMe81U/1R3EHnW1ZX1azw7Y3/S3Iq/e69QWRVeuyg+4xKNrltzzf7ppYnEDgQ4PN6F
 2fHI2eh5NdmGxNibPHYEdUfogGvy9mVXpJl7q7MA9/whIEerId3Hbegl/oO9hzBP8EOU
 /C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=atvDp6J9S9UphQS2KC0AkwktCLxJNBc+ILJ3smYnHdU=;
 b=aSn39iHkG4FaOj3nFVWfDez3v4RlOCwoyLe4Q1dXbWg0rF4/AZmjKLZqpaRimKn6Cs
 23yGHpgK+oUgEyJ4MQ7LPbRVCQIa0gjZhR/xmoDqf2dk5J05jdsMTgHERa8l9GY10ZCU
 VzIBZQ69tbHfU7P8yuuSli5ciMgOd3YDL9K3y9LdqhTmUnkfD+vlRTUYRJN0mSqUanEY
 A5oI98JKYOht4QfDZRnVVFPr8yK6URFQkEeSE+TVSQn6PTzA1iCKWhFNfrv/dSpLBXns
 wb5j7UWZnF/Pb2kuB+f3GbW7qcILnUXVEW1//8AaT6vhSbUtFA0JWhd1VzGNwPMXFGc6
 QqFQ==
X-Gm-Message-State: AOAM531ALtKBFCqN9vMeN1r9m+EZLgbPFzBJO/cSk7tVOngg0uoaVVLl
 iszJN0oEaEKo+ET3K3offU5384KeAp9t/G/FGso=
X-Google-Smtp-Source: ABdhPJw3IUJGVTABwss1bI3N0AsfeVswdlGTGp6kTwD01l5sJFonpgH2ry/SoQ8R0bi1Z2nP/8iAoO4Oy0c24W0+u90=
X-Received: by 2002:a5e:d519:: with SMTP id e25mr3084419iom.36.1596193113186; 
 Fri, 31 Jul 2020 03:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
 <20200727112921.GK1850026@dell>
 <CAE+NS36cxY9KqxxcmuctK_W_3ZmZnC_xK8VVVaTZqC3vSoqbUw@mail.gmail.com>
 <20200728065422.GB1850026@dell>
In-Reply-To: <20200728065422.GB1850026@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 31 Jul 2020 10:58:21 +0800
Message-ID: <CAE+NS34OFVf36zp7Nn0ETZ5KEaTet-P_VdPMuiZgqo1HfNxeYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces into
 mt6360 regulator resources
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_065835_138365_8A882C17 
X-CRM114-Status: GOOD (  19.71  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMjjml6Ug6YCx
5LqMIOS4i+WNiDI6NTTlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMjggSnVsIDIwMjAsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDl
ubQ35pyIMjfml6Ug6YCx5LiAIOS4i+WNiDc6Mjnlr6vpgZPvvJoKPiA+ID4KPiA+ID4gT24gRnJp
LCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gPgo+ID4gPiA+IEZyb206IEdlbmUg
Q2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+Cj4gPiA+ID4gQ29tYmluZSBtdDYz
NjAgcG1pYy9sZG8gcmVzb3VjZXMgaW50byBtdDYzNjAgcmVndWxhdG9yIHJlc291cmNlcwo+ID4g
PiA+IHRvIHNpbXBsaWZ5IHRoZSBzaW1pbGFyIHJlc291cmNlcyBvYmplY3QuCj4gPiA+Cj4gPiA+
IERvIHRoZSBzdWItZGV2aWNlcyBhY3R1YWxseSBzaGFyZSB0aGVzZSByZXNvdXJjZXMsIG9yIGFy
ZSB5b3UgZG9pbmcKPiA+ID4gdGhpcyBqdXN0IHRvIG1ha2UgdGhlIGNvZGUgc2ltcGxlcj8KPiA+
ID4KPiA+Cj4gPiBUaGV5IGFyZSBkaWZmZXJlbnQgcmVzb3VyY2VzIHVzZWQgYnkgZGlmZmVyZW50
IGJ1Y2tzIGFuZCBsZG9zIHdpdGhvdXQKPiA+IHNoYXJpbmcgcmVsYXRpb25zLgo+ID4gSSBqdXN0
IHRvIG1ha2UgdGhlIGNvZGUgc2ltcGxlci4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHNlbnNp
YmxlLgo+Cj4gWW91IHNob3VsZCBvbmx5IHNoYXJlIHJlc291cmNlcyB3aXRoIGNoaWxkIGRldmlj
ZXMgdGhhdCBjb25zdW1lIHRoZW0uCj4KCkF0IGZpcnN0LCBJIHNlcGFyYXRlZCByZWd1bGF0b3Jz
IGludG8gdHdvIGRyaXZlcnMsIG10NjM2MC1wbWljLmMgYW5kCm10NjM2MC1sZG8uYywgYWNjb3Jk
aW5nIHRvIGRlZmF1bHQtb24gcG93ZXIgb3Igbm90LgpUaGVuLCBJIG1lcmdlZCB0d28gZHJpdmVy
cyBpbnRvIG10NjM2MC1yZWd1bGF0b3IuYyBhbmQgbWVyZ2VkIHRoZWlyCnJlc291cmNlcyBhcyB3
ZWxsLgpUaGVyZWZvcmUsIGZvciBldmVyeSBkZXZpY2Ugb2YgQlVDSy9MRE8sIEknbGwgZmluZCBy
ZXNvdXJjZXMgYWNjb3JkaW5nCnRvIHRoZWlyIG5hbWUgYW5kIHJlcXVlc3QgSVJRcy4KCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCAxMSArKystLS0tLS0t
LQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMg
Yi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4gaW5kZXggN2NjMWI1OS4uNjY1ZTI2
ZiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+IEBAIC0yNjUsNyArMjY1LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNlc1tdID0g
ewo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9GTEVEMV9TVFJCX1RP
X0VWVCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+ID4gPiAt
c3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfcG1pY19yZXNvdXJjZXNbXSA9IHsK
PiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfcmVndWxhdG9yX3Jl
c291cmNlc1tdID0gewo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9C
VUNLMV9QR0JfRVZULCAiYnVjazFfcGdiX2V2dCIpLAo+ID4gPiA+ICAgICAgIERFRklORV9SRVNf
SVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19ldnQiKSwKPiA+ID4gPiAg
ICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfQlVDSzFfT1ZfRVZULCAiYnVjazFfb3Zf
ZXZ0IiksCj4gPiA+ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJl
c291cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ICAgICAgIERFRklORV9S
RVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X09DX0VWVCwgImxkbzdfb2NfZXZ0IiksCj4gPiA+ID4g
ICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzZfUEdCX0VWVCwgImxkbzZfcGdi
X2V2dCIpLAo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X1BH
Ql9FVlQsICJsZG83X3BnYl9ldnQiKSwKPiA+ID4gPiAtfTsKPiA+ID4gPiAtCj4gPiA+ID4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX2xkb19yZXNvdXJjZXNbXSA9IHsKPiA+
ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMV9PQ19FVlQsICJsZG8x
X29jX2V2dCIpLAo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE8y
X09DX0VWVCwgImxkbzJfb2NfZXZ0IiksCj4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFN
RUQoTVQ2MzYwX0xETzNfT0NfRVZULCAibGRvM19vY19ldnQiKSwKPiA+ID4gPiBAQCAtMjk4LDEw
ICsyOTUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM2MF9kZXZzW10gPSB7
Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1j
aGciKSwKPiA+ID4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLWxlZCIsIG10NjM2MF9sZWRf
cmVzb3VyY2VzLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRl
ayxtdDYzNjAtbGVkIiksCj4gPiA+ID4gLSAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC1wbWljIiwg
bXQ2MzYwX3BtaWNfcmVzb3VyY2VzLAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAs
IDAsICJtZWRpYXRlayxtdDYzNjAtcG1pYyIpLAo+ID4gPiA+IC0gICAgIE9GX01GRF9DRUxMKCJt
dDYzNjAtbGRvIiwgbXQ2MzYwX2xkb19yZXNvdXJjZXMsCj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZG8iKSwKPiA+ID4gPiArICAgICBPRl9N
RkRfQ0VMTCgibXQ2MzYwLXJlZ3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVn
dWxhdG9yIiksCj4gPiA+ID4gICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC10Y3BjIiwgTlVMTCwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRj
cGMiKSwKPiA+ID4gPiAgfTsKPiA+ID4KPgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4g
U2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
