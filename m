Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ON4SuSeD6MyCATLUQonby37MbNGai2AJuVIRgTmT4A0=; b=GU04R3EfOO7aoJ
	cZo+vx0KAXL9cOKOKCkyueBhAQT/nDVg5+Oz0Khwmvk3owpvda8qSgE3VRwsqaCePcMO2vxgzTqgU
	wHd/kNlAmlfDy4JBXZ5gi9pOXOpCrrc19fnSaaV0lZodPCDGU2/dkFGpLoNZSY4Ry97N36tXMEDvi
	dnVB7+EO5FUWXeBeNqiABu49TnN/kXspQqQwUx0dW7pniTMu4NxLySCGZvSGfJLTms5IkkMRfJ/aA
	LbgUeddcbpLB9WdaZR5/nwjxLElYn2GKUjYVPCOMiTEcmdWpdXnasU51CWPTRIouOJDGGObzcnWbn
	0binfapamQp6qj2GHCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXoh-00HUC1-9u; Wed, 13 Apr 2022 07:53:31 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXoT-00HU8r-E7; Wed, 13 Apr 2022 07:53:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649836378; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mKct6M+UBGyU7j39wTQrgKyzwdh0KiMVeJk80Z4LzYctoK3TgOmrGQiyfoBVUJJujqzcWW7BqtbrTf9fyQUguhC1uNUmCFnAU7YqYg7ohWVI5miE+jcrFRYe7g6sv8nCWUtMuG/Bb3GWjWNQQV8wUIaRCztSV88wbnJBx9i1F/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649836378;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zomQ5tkYUJQV/3TJDTF1FVvqyX+VAC+jOEvBXwvebdU=; 
 b=lb7QwzK65hotCejcO7hxT4y8YipfdATaywZzQshOxff7OC/Qr+3vImB4C+gZT9WMd0a9FWlcSqN2clsijrn5slsUgcipB1AJs1U2kRSJ7CTTyzt41Cpm4fMav75BM3kh1cXhpypHDPxFr83Puqfo+tyTMPBpdVtAGq/OmyCyqJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649836378; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=zomQ5tkYUJQV/3TJDTF1FVvqyX+VAC+jOEvBXwvebdU=;
 b=e89SmhNJ5FZkqrQW94QrXssLlzSV86kG+fLu1q2zzMgMavE9G/xMjsALSDHA8llN
 wb273CrdYKeR2l8CZQbKqehIC2veKw3S2gVI1cbRiRq235jizArTzPCXApRX+Ya72tU
 UtDO92ixvG8Nmvs0ZxEkhjKJ9XJsekSIhVcBFPpo=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649836376347263.13841951297684;
 Wed, 13 Apr 2022 00:52:56 -0700 (PDT)
Message-ID: <84088c4c-b4bd-30f3-ce25-d59c55d5898f@arinc9.com>
Date: Wed, 13 Apr 2022 10:52:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_005317_574203_E2B94DF4 
X-CRM114-Status: GOOD (  28.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2lvLAoKT24gMTMvMDQvMjAyMiAwOTozNiwgU2VyZ2lvIFBhcmFjdWVsbG9zIHdyb3Rl
Ogo+IEhpIEFyaW7DpywKPiAKPiBPbiBXZWQsIEFwciAxMywgMjAyMiBhdCA4OjA4IEFNIEFyxLFu
w6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4gd3JvdGU6Cj4+Cj4+IEhleSBldmVyeW9u
ZS4KPj4KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYnJpbmdzIGNvbXBsZXRlIHJlZmFjdG9yaW5nIHRv
IHRoZSBSYWxpbmsgcGluY3RybCBkcml2ZXIKPj4gYW5kIGl0cyBzdWJkcml2ZXJzLgo+Pgo+PiBU
aGUgbXQ3NjIwIHBpbmN0cmwgc3ViZHJpdmVyIHN1cHBvcnRzIE1UNzYyOCBhbmQgTVQ3Njg4IFNv
Q3MgYWxvbmcgd2l0aAo+PiBNVDc2MjAuIFRoZXNlIHR3byBzaGFyZSB0aGUgc2FtZSBwaW4gbGF5
b3V0LiBUaGUgY29kZSB1c2VkIGZvciBNVDc2MjggYW5kCj4+IE1UNzY4OCBpcyByZW5hbWVkIGZy
b20gTVQ3NjI4L210NzYyOGFuIHRvIE1UNzZYOC4KPj4KPj4gUmFsaW5rIHBpbmN0cmwgZHJpdmVy
IGlzIGNhbGxlZCBydDI4ODAgd2hpY2ggaXMgdGhlIG5hbWUgb2YgdGhlIFJhbGluawo+PiBSVDI4
ODAgU29DLiBBIHN1YmRyaXZlciBmb3IgdGhlIFJhbGluayBSVDI4ODAgU29DIGlzIGNhbGxlZCBy
dDI4OHguIFJlbmFtZQo+PiBydDI4ODAgdG8gcmFsaW5rLgo+Pgo+PiBSZW5hbWUgY29kZSBmcm9t
IHBpbm11eCB0byBwaW5jdHJsIGZvciB3aGVyZSB0aGUgb3BlcmF0aW9uIGlzIG5vdCBhYm91dCB0
aGUKPj4gbXV4aW5nIG9mIHBpbnMuCj4+Cj4+IFJlbmFtZSBydDI4OHggcGluY3RybCBzdWJkcml2
ZXIgZm9yIHRoZSBSVDI4ODAgU29DIHRvIHJ0Mjg4MC4KPj4KPj4gVmFyaWFibGVzIGZvciBmdW5j
dGlvbnMgaW5jbHVkZSAiZ3JwIiBvbiB0aGUgUmFsaW5rIE1UNzYyMCBhbmQgTVQ3NjIxCj4+IHN1
YmRyaXZlcnMuIFJlbmFtZSB0aGVtIHRvICJmdW5jIiBpbnN0ZWFkIGFzIHRoZXkgZGVmaW5lIHRo
ZSBmdW5jdGlvbnMgZm9yCj4+IHRoZSBwaW4gZ3JvdXBzLiBUaGlzIGlzIGFscmVhZHkgdGhlIGNh
c2UgZm9yIHRoZSBvdGhlciAzIHN1YmRyaXZlcnM7Cj4+IFJUMjg4MCwgUlQzMDV4LCBSVDM4ODMu
Cj4+Cj4+IEZpeCBLY29uZmlnIHRvIGNhbGwgdGhlIHN1YmRyaXZlcnMsIHdlbGwsIHN1YmRyaXZl
cnMuCj4+Cj4+IEFkZCBuZXcgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBlYWNoIHN1YmRyaXZlciBh
bmQgdXBkYXRlIERUIGJpbmRpbmcKPj4gYWNjb3JkaW5nbHkuCj4+Cj4+IEFkZCBSYWxpbmsgcGlu
Y3RybCBkcml2ZXIgdG8gTUFJTlRBSU5FUlMgYW5kIGFkZCBtZSBhbmQgU2VyZ2lvIGFzIHRoZQo+
PiBtYWludGFpbmVycy4KPj4KPj4gRmluYWxseSwgZml4IHRoZSBjdXJyZW50IHJ0Mjg4MCBkb2N1
bWVudGF0aW9uIGFuZCBhZGQgYmluZGluZyBmb3IgYWxsIG9mCj4+IHRoZSBzdWJkcml2ZXJzLgo+
Pgo+PiBJIGhhdmUgdGhlIHBhdGNoZXMgaGVyZSBzaG91bGQgYW55b25lIHByZWZlciB0byByZWFk
IHRoZW0gdGhlcmU6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcmluYzkvbGludXgvY29tbWl0cy9y
YWxpbmstcGluY3RybC1yZWZhY3Rvcgo+Pgo+PiBSYWxpbmsgcGluY3RybCBkcml2ZXIgYW5kIHRo
ZSBzdWJkcml2ZXJzIHdlcmUgY29tcGlsZSB0ZXN0ZWQuCj4+IE1UNzYyMSBwaW5jdHJsIHN1YmRy
aXZlciB3YXMgdGVzdGVkIG9uIGEgcHJpdmF0ZSBtdDc2MjEgYm9hcmQuCj4+IFlBTUwgYmluZGlu
Z3MgY2hlY2tlZCB3aXRoOgo+PiBBUkNIPW1pcHMgQ1JPU1NfQ09NUElMRT1taXBzLWxpbnV4LWdu
dS0gbWFrZSBkdF9iaW5kaW5nX2NoZWNrIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC8gLWokKG5wcm9jKQo+Pgo+PiBBcsSxbsOnIMOcTkFM
ICgxNCk6Cj4+ICAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIE1UNzYyOChhbikgZnVuY3Rpb25z
IHRvIE1UNzZYOAo+PiAgICBwaW5jdHJsOiByYWxpbms6IHJlbmFtZSBwaW5jdHJsLXJ0Mjg4MCB0
byBwaW5jdHJsLXJhbGluawo+PiAgICBwaW5jdHJsOiByYWxpbms6IHJlbmFtZSBwaW5tdXggZnVu
Y3Rpb25zIHRvIHBpbmN0cmwKPj4gICAgcGluY3RybDogcmFsaW5rOiByZW5hbWUgcGluY3RybC1y
dDI4OHggdG8gcGluY3RybC1ydDI4ODAKPj4gICAgcGluY3RybDogcmFsaW5rOiByZW5hbWUgdmFy
aWFibGUgbmFtZXMgZm9yIGZ1bmN0aW9ucyBvbiBNVDc2MjAgYW5kIE1UNzYyMQo+PiAgICBwaW5j
dHJsOiByYWxpbms6IHJlbmFtZSBkcml2ZXIgbmFtZXMgdG8gc3ViZHJpdmVycwo+PiAgICBNQUlO
VEFJTkVSUzogYWRkIFJhbGluayBwaW5jdHJsIGRyaXZlcgo+IAo+IEZvciBhbGwgdGhlc2UgcmVu
YW1lIHN0dWZmIGFuZCBNQUlOVEFJTkVSUyBjaGFuZ2U6Cj4gCj4gUmV2aWV3ZWQtYnk6IFNlcmdp
byBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KPiAKPj4gICAgcGlu
Y3RybDogcmFsaW5rOiBhZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgZWFjaCBwaW5jdHJs
IHN1YmRyaXZlcgo+PiAgICBtaXBzOiBkdHM6IHJhbGluazogbXQ3NjIxOiB1c2UgdGhlIG5ldyBj
b21wYXRpYmxlIHN0cmluZyBmb3IgTVQ3NjIxIHBpbmN0cmwKPj4gICAgZHQtYmluZGluZ3M6IHBp
bmN0cmw6IHJ0Mjg4MDogZml4IGJpbmRpbmcgbmFtZSwgcGluIGdyb3VwcyBhbmQgZnVuY3Rpb25z
Cj4+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGluZyBmb3IgUmFsaW5rIE1UNzYy
MCBwaW5jdHJsCj4+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGluZyBmb3IgUmFs
aW5rIE1UNzYyMSBwaW5jdHJsCj4+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGlu
ZyBmb3IgUmFsaW5rIFJUMzA1WCBwaW5jdHJsCj4+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBh
ZGQgYmluZGluZyBmb3IgUmFsaW5rIFJUMzg4MyBwaW5jdHJsCj4gCj4gSSB0aGluayB5b3UgY2Fu
bm90IGNoYW5nZSBjb21wYXRpYmxlIHN0cmluZ3MgYmVjYXVzZSB5b3UgaGF2ZSB0byBiZQo+IGNv
bXBhdGlibGUgd2l0aCBwcmV2aW91cyBzdHVmZi4gVGhhdCBpcyB0aGUgcmVhc29uIHdoeSB3aGVu
IEkKPiByZWZhY3RvcmVkIGFsbCBvZiB0aGlzIHN0dWZmIGZyb20gJ2FyY2gvbWlwcy9yYWxpbmsn
IGludG8KPiAnZHJpdmVycy9waW5jdHJsJyBJIG1haW50YWluZWQgdGhlIHNhbWUgZm9yIGFsbCBv
ZiB0aGVtIGFuZCBvbmx5Cj4gY3JlYXRlZCBvbmUgYmluZGluZyBmb3IgYWxsLiBJIGtub3cgdGhh
dCB0aGVzZSBTb0NzIGFyZSBtb3N0bHkgdXNlZCBpbgo+IG9wZW5XUlQgYW5kIHRoZSB3YXkgb2Yg
ZG9pbmcgdGhpbmdzIHRoZXJlIGlzIHRoYXQgd2hlbiBhIG5ldyB2ZXJzaW9uCj4gaXMgcmVsZWFz
ZWQgYSBuZXcgZHRiIGlzIGFsc28gY29tcGlsZWQgc28gSSB1bmRlcnN0YW5kIHRoZSBtb3RpdmF0
aW9uCj4gb2YgdGhlIGNoYW5nZSBpdHNlbGYuIEluIGFueSBjYXNlLCBSb2IgaGFzIHRoZSBsYXN0
IHdvcmQgaGVyZSwgbm90IG1lCj4gOikuCgpJIGxvb2tlZCBhcm91bmQgcGluY3RybCBkcml2ZXJz
IGZvciBtZWRpYXRlay4gV2hhdCBJIHNlZSB0aGVyZSBpcyB0aGF0IAplYWNoIHN1YmRyaXZlciBo
YXMgaXRzIG93biBjb21wYXRpYmxlIHN0cmluZy4gVGhlcmUncyBhIGRvY3VtZW50YXRpb24gCmZv
ciBlYWNoIHN1YmRyaXZlci4gRWFjaCBzdWJkcml2ZXIgY29udGFpbnMgZGlmZmVyZW50IHBpbiBn
cm91cHMgYW5kIApmdW5jdGlvbnMgbGlrZSBvbiByYWxpbmsuIE15IHBhdGNoIHNlcmllcyBiYXNp
Y2FsbHkgZG9lcyB0aGUgc2FtZSBmb3IgClJhbGluay4KCkkgZG9uJ3Qgc2VlIHRoaXMgcGF0Y2gg
c2VyaWVzIGNhdXNpbmcgbXVjaCBvZiBhbiBpc3N1ZSBmb3IgT3BlbldydC4gClRoZXkncmUgZ29p
bmcgdG8gaGF2ZSB0byB1cGRhdGUgdGhlaXIgUmFsaW5rIERUcyB3aXRoIHRoZSBuZXcgY29tcGF0
aWJsZSAKc3RyaW5ncyB3aGVuIHRoZXkgZWl0aGVyIHN3aXRjaCB0byB0aGUgbmV4dCBMVFMga2Vy
bmVsIG9yIGRlY2lkZSB0byAKYmFja3BvcnQgUmFsaW5rIHBpbmN0cmwgY2hhbmdlcyB0byB0aGUg
Y3VycmVudCBMVFMga2VybmVsLgoKQ2hlZXJzLgpBcsSxbsOnCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
