Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zcKgTWe0Tz485mFaYf4nWtUMR2c5Yh+IDhNvz0VLko=; b=hzExbE5ABfG9I8
	zIXkleBR4f9b9CPFRvDDFvK3IGNTCBaRlp6XWliPuLjw5371uSYSiGuR1UbR3RfViJ5GKyMP8dpQ5
	mVXNc7vU8yCdWYZPoh3Xc4HS8V/CpbXl4GxthkxKK1lMvG6dAe3nuflJqt9jkFZ1lx0YlT2Mscej8
	+U8ta1SUTQWTO+tfSiBzwBu+4juVKe3FSBKgCYQo1r/pSYP1o8SfJeOkdKQUMWAHn0k8NQcOCs30D
	Bxcsn5bvkOnitr3BoPsh0V24vlE7/3TgHkIGnXL2BtGeKKr/Lm+SXgYwOYLa7s0IjAy7I81YrTZp5
	0cHdjss/EYENWUV2GeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuwW-004Zfp-Kx; Thu, 14 Apr 2022 08:35:08 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuwK-004Zco-7i; Thu, 14 Apr 2022 08:34:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649925279; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bK5Oi1eK1Ot4P/WIk25uibXlw1HpAFV0BLpK1vE8f+UtFCwJCDn5uyimVMT74+L3Pl7PBnHMUkIHyg0hBzCR9gly97etErUWUYd8FW9SLVCU2jFCcpr9oj8gnu9pe9QHPRZdzDHONFqNsO/uf8WZrAQ1Ni0gAUNXwoM0vuqEZN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649925279;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=yDHyQQxfNMEnTd2E3yyM7UTuJ1wsjaiRDNpz9ZFlCLE=; 
 b=QGPvJmBysj/SmHpGSuqHcz7/f2LUP4LhaTlQ6gR7c9+hyqT1wqrJEEDh97sVyP3NEQ1QI7E7rhOFQ1l6p5jVUUdfS6wt1pkV5Bvr/UA24Tfh6HlaCnjxB9AJ5i8QXWPkLMQElosEGH9qSAAb58kMpdcNbcD6B+wTviPzE0upDNw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649925279; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=yDHyQQxfNMEnTd2E3yyM7UTuJ1wsjaiRDNpz9ZFlCLE=;
 b=NzE9qnfnUYwkYCqHU95IzqVChcoaxcIuKwcaeDYubTHX/xq/71ydVL44+9zqeTYu
 jMbW94YQ1qgEc3g+Iy8Dt7/h8O87LDR2nDsfFwRATKebVRUZZR036yv8XzLgA7QR8al
 DMX+MiTUPGopIKxrKqj9cjc250MX53mkA9OMGFlY=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649925277018325.6447048364738;
 Thu, 14 Apr 2022 01:34:37 -0700 (PDT)
Message-ID: <550b20f2-098e-0f25-ad9f-3ff523879cb7@arinc9.com>
Date: Thu, 14 Apr 2022 11:34:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name, pin
 groups and functions
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-11-arinc.unal@arinc9.com>
 <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_013456_374031_ABF95575 
X-CRM114-Status: GOOD (  15.25  )
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

T24gMTMvMDQvMjAyMiAxODoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8w
NC8yMDIyIDA4OjA3LCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+PiBDaGFuZ2UgYmluZGluZyBuYW1l
IGZyb20gcmFsaW5rLHJ0Mjg4MC1waW5tdXggdG8gcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLgo+PiBU
aGlzIGlzIHRoZSBiaW5kaW5nIGZvciB0aGUgUmFsaW5rIFJUMjg4MCBwaW5jdHJsIHN1YmRyaXZl
ci4KPiAKPiBXaGF0IEkgZG9uJ3Qgc2VlIGhlcmUgaXMgd2h5IHlvdSBhcmUgZG9pbmcgdGhpcy4g
cGlubXV4L3BpbmN0cmwgaGF2ZSB0aGUKPiBzYW1lIG1lYW5pbmcsIEkgZ3Vlc3M/CgpXaGF0IEkg
dW5kZXJzdGFuZCBpcyBwaW5tdXggaXMgcmF0aGVyIGEgc3BlY2lmaWMgdGVybSBmb3IgdGhlIG11
eGluZyBvZiAKcGlucyBvciBwaW4gZ3JvdXBzLiBQaW5jdHJsIGlzIHdoYXQgd2UgcHJlZmVyIGhl
cmUgc2luY2UgdGhlIHRlcm0gaXMgCm1vcmUgaW5jbHVzaXZlIG9mIHdoYXQgdGhlIHN1YmRyaXZl
ciBkb2VzOiBjb250cm9sbGluZyBwaW5zLiBBbnkgCm1lZGlhdGVrIGRyaXZlci9zdWJkcml2ZXIg
aXMgY2FsbGVkIHBpbmN0cmwgc28gSSdtIG5vdCBkb2luZyBzb21ldGhpbmcgCnVuY29tbW9uLgoK
PiAKPj4KPj4gQ3VycmVudCBwaW4gZ3JvdXAgYW5kIGZ1bmN0aW9uIGJpbmRpbmdzIGFyZSBmb3Ig
TVQ3NjIxLiBQdXQgYmluZGluZ3MgZm9yCj4+IFJUMjg4MCBpbnN0ZWFkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4+IC0tLQo+PiAg
IC4uLnBpbm11eC55YW1sID0+IHJhbGluayxydDI4ODAtcGluY3RybC55YW1sfSB8IDI0ICsrKysr
KysrKy0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4+ICAgcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3tyYWxpbmsscnQyODgwLXBpbm11eC55YW1sID0+IHJhbGluayxydDI4ODAtcGlu
Y3RybC55YW1sfSAoNTYlKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5tdXgueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGluY3RybC55
YW1sCj4+IHNpbWlsYXJpdHkgaW5kZXggNTYlCj4+IHJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwKPj4g
cmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGlu
ayxydDI4ODAtcGluY3RybC55YW1sCj4+IGluZGV4IDlkZThiMGMwNzVlMi4uYzY1N2JiZjlmZGRh
IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGluY3RybC55YW1sCj4+IEBAIC0x
LDIxICsxLDIzIEBACj4+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZQo+PiAgICVZQU1MIDEuMgo+PiAgIC0tLQo+PiAtJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwj
Cj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcmFsaW5rLHJ0
Mjg4MC1waW5jdHJsLnlhbWwjCj4+ICAgJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICAgCj4+IC10aXRsZTogUmFsaW5rIHJ0Mjg4MCBwaW5t
dXggY29udHJvbGxlcgo+PiArdGl0bGU6IFJhbGluayBSVDI4ODAgUGluIENvbnRyb2xsZXIKPj4g
ICAKPj4gICBtYWludGFpbmVyczoKPj4gKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFy
aW5jOS5jb20+Cj4gCj4gTWVudGlvbiB0aGlzIGluIGNvbW1pdCBtc2cuCgpXaWxsIGRvLgoKPiAK
Pj4gICAgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29t
Pgo+PiAgIAo+PiAgIGRlc2NyaXB0aW9uOgo+PiAtICBUaGUgcnQyODgwIHBpbm11eCBjYW4gb25s
eSBzZXQgdGhlIG11eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKPj4g
KyAgUmFsaW5rIFJUMjg4MCBwaW4gY29udHJvbGxlciBmb3IgUlQyODgwIFNvQy4KPj4gKyAgVGhl
IHBpbiBjb250cm9sbGVyIGNhbiBvbmx5IHNldCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11
eGluZyBpbmRpdml1YWwgcGlucwo+PiAgICAgaXMgbm90IHN1cHBvcnRlZC4gVGhlcmUgaXMgbm8g
cGluY29uZiBzdXBwb3J0Lgo+PiAgIAo+PiAgIHByb3BlcnRpZXM6Cj4+ICAgICBjb21wYXRpYmxl
Ogo+PiAtICAgIGNvbnN0OiByYWxpbmsscnQyODgwLXBpbm11eAo+PiArICAgIGNvbnN0OiByYWxp
bmsscnQyODgwLXBpbmN0cmwKPiAKPiB5b3UgbmVlZCB0byBkZXByZWNhdGUgb2xkIHByb3BlcnR5
IGFuZCBhZGQgYSBuZXcgb25lLgoKRG8gd2UgcmVhbGx5IGhhdmUgdG8/IFRoYXQgcHJvcGVydHkg
bmFtZSB3YXMgaW5hY2N1cmF0ZSBmcm9tIHRoZSBzdGFydC4gCkkgZG9uJ3Qgc2VlIGEgcmVhc29u
IHRvIGtlZXAgaXQgYmVpbmcgcmVmZXJyZWQgdG8gb24gdGhlIGJpbmRpbmcuCgo+IAo+IAo+PiAg
IAo+PiAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+PiAgICAgJy1waW5zJCc6Cj4+IEBAIC0yOCwxNCAr
MzAsMTIgQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4+ICAgCj4+ICAgICAgICAgICBwcm9wZXJ0aWVz
Ogo+PiAgICAgICAgICAgICBncm91cHM6Cj4+IC0gICAgICAgICAgICBkZXNjcmlwdGlvbjogTmFt
ZSBvZiB0aGUgcGluIGdyb3VwIHRvIHVzZSBmb3IgdGhlIGZ1bmN0aW9ucy4KPj4gLSAgICAgICAg
ICAgIGVudW06IFtpMmMsIGp0YWcsIG1kaW8sIHBjaWUsIHJnbWlpMSwgcmdtaWkyLCBzZGhjaSwg
c3BpLAo+PiAtICAgICAgICAgICAgICAgICAgIHVhcnQxLCB1YXJ0MiwgdWFydDMsIHdkdF0KPj4g
KyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgcGluIGdyb3VwIHRvIHNlbGVjdC4KPj4gKyAg
ICAgICAgICAgIGVudW06IFtpMmMsIHNwaSwgdWFydGxpdGUsIGp0YWcsIG1kaW8sIHNkcmFtLCBw
Y2ldCj4+ICsKPj4gICAgICAgICAgICAgZnVuY3Rpb246Cj4+IC0gICAgICAgICAgICBkZXNjcmlw
dGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxlY3QKPj4gLSAgICAgICAgICAgIGVudW06IFtn
cGlvLCBpMmMsIGkycywganRhZywgbWRpbywgbmFuZDEsIG5hbmQyLCBwY2llIHJlZmNsaywKPj4g
LSAgICAgICAgICAgICAgICAgICBwY2llIHJzdCwgcGNtLCByZ21paTEsIHJnbWlpMiwgc2RoY2ks
IHNwZGlmMiwgc3BkaWYzLAo+PiAtICAgICAgICAgICAgICAgICAgIHNwaSwgdWFydDEsIHVhcnQy
LCB1YXJ0Mywgd2R0IHJlZmNsaywgd2R0IHJzdF0KPj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9u
OiBUaGUgbXV4IGZ1bmN0aW9uIHRvIHNlbGVjdC4KPj4gKyAgICAgICAgICAgIGVudW06IFtncGlv
LCBpMmMsIHNwaSwgdWFydGxpdGUsIGp0YWcsIG1kaW8sIHNkcmFtLCBwY2ldCj4+ICAgCj4gCj4g
VGhlc2Ugd2VyZSBhbGwgaW5jb3JyZWN0IGZvciBydDI4ODAsIEkgdW5kZXJzdGFuZD8KClByZXR0
eSBtdWNoLgoKQXLEsW7DpwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
