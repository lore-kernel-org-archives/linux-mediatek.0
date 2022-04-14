Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JaQRstTjnpfKnbynqiUQud+Mp9ViWqbcSlrpTU67os=; b=yYrCCQE2rsskz4
	RPgaswUoEd185Ihp+t9hDyhZhbE2TlljSwoslqkJfis3m1jqeL76t4k0wFjZf3muV0Ly9v1sW3077
	OPCC+ITM6ttebS9ijGalaoXVI6QNM45gyE/1vUxrEos5zzYDdb4hQJp8um6J1tonH+ruyMpzvasoi
	L0vMPhFcunie51fu7nBQW22erJHn87Lq6fgqhODQsVZ6UIubSu7PiLCPxsV01Oc90d6ljx/uNcmuE
	x5yxxzobXWor+cGe3M+mYGHTtIx1GofA3sj0ZX7vcIvsYLXN8+pzNm4uNHwOWIYncdvUDHNyJ2wKy
	i5/RBuo4eYZQ8B9UdsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf2UN-006UiU-JV; Thu, 14 Apr 2022 16:38:35 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf2Ty-006UZX-Ej; Thu, 14 Apr 2022 16:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649954254; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Efq3hAgZ3JW72GIjcSqmPNhOXvfV0qLZnaUMdx5YXtI6lHY9j8oOWB71TPPFwpF05yK0MoXU18FA3hyw0Qeikt9BTCBKfOhYtY9EhkawPzO2Le9P5ebktcpAd1vdiX0LLhrTG9olKbj2bHm56lrrLTHNHq3tZNOvZF7y1VTXvZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649954254;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=M6x4pm1vbOy3um3QdMOsMA8jgAP9SJyU0JGvXSzrgKQ=; 
 b=kZoXga6nOdc/2RaQbkfLKPCXZnNpumUj8B6d9pGc2EU3sA+UFU64Lar9dQW2sUkvAKzk5KnkBp8PJzL5ONxgQ6ngpK/INUMhAHl3rI2CRVmGB0a6uGc44Whj8b8YH1wa7+QLf1Aqk+8DnIWTW41FMEhT2VyBvLw3qAiLi59ZK44=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649954254; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=M6x4pm1vbOy3um3QdMOsMA8jgAP9SJyU0JGvXSzrgKQ=;
 b=SkCb1ICmhSpTm8ptaGnPJ2s4AbmDHUPiDTmCtBRWilsQZHMDL0wMv2RjWabWCO6H
 QPyJ+f8aOObEv84FgwlyK3oFzu6myK1zrK7RY47vf8yyQlx4yEAYIytsTo+6mJzdhy+
 KIbGxLC1o1pf0CFHsBAwJZPzLFSltPjep3Rltn3Y=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649954252283729.6912314444173;
 Thu, 14 Apr 2022 09:37:32 -0700 (PDT)
Message-ID: <87c9bf7e-f290-7d38-0844-7a7243688f5a@arinc9.com>
Date: Thu, 14 Apr 2022 19:37:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name, pin
 groups and functions
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-11-arinc.unal@arinc9.com>
 <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
 <550b20f2-098e-0f25-ad9f-3ff523879cb7@arinc9.com>
 <YlhJGerakzbsXwnv@robh.at.kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <YlhJGerakzbsXwnv@robh.at.kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_093810_587068_F9A693A6 
X-CRM114-Status: GOOD (  19.35  )
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

T24gMTQvMDQvMjAyMiAxOToxNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMTQs
IDIwMjIgYXQgMTE6MzQ6MzFBTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gT24gMTMv
MDQvMjAyMiAxODoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDEzLzA0LzIw
MjIgMDg6MDcsIEFyxLFuw6cgw5xOQUwgd3JvdGU6Cj4+Pj4gQ2hhbmdlIGJpbmRpbmcgbmFtZSBm
cm9tIHJhbGluayxydDI4ODAtcGlubXV4IHRvIHJhbGluayxydDI4ODAtcGluY3RybC4KPj4+PiBU
aGlzIGlzIHRoZSBiaW5kaW5nIGZvciB0aGUgUmFsaW5rIFJUMjg4MCBwaW5jdHJsIHN1YmRyaXZl
ci4KPj4+Cj4+PiBXaGF0IEkgZG9uJ3Qgc2VlIGhlcmUgaXMgd2h5IHlvdSBhcmUgZG9pbmcgdGhp
cy4gcGlubXV4L3BpbmN0cmwgaGF2ZSB0aGUKPj4+IHNhbWUgbWVhbmluZywgSSBndWVzcz8KPj4K
Pj4gV2hhdCBJIHVuZGVyc3RhbmQgaXMgcGlubXV4IGlzIHJhdGhlciBhIHNwZWNpZmljIHRlcm0g
Zm9yIHRoZSBtdXhpbmcgb2YgcGlucwo+PiBvciBwaW4gZ3JvdXBzLiBQaW5jdHJsIGlzIHdoYXQg
d2UgcHJlZmVyIGhlcmUgc2luY2UgdGhlIHRlcm0gaXMgbW9yZQo+PiBpbmNsdXNpdmUgb2Ygd2hh
dCB0aGUgc3ViZHJpdmVyIGRvZXM6IGNvbnRyb2xsaW5nIHBpbnMuIEFueSBtZWRpYXRlawo+PiBk
cml2ZXIvc3ViZHJpdmVyIGlzIGNhbGxlZCBwaW5jdHJsIHNvIEknbSBub3QgZG9pbmcgc29tZXRo
aW5nIHVuY29tbW9uLgo+IAo+IFRoZSBjb3JyZWN0IG5hbWUgaXMgcmVhbGx5IHdoYXRldmVyIHRo
ZSBoL3cgYmxvY2sgaXMgY2FsbGVkLCBub3QKPiB3aGF0ZXZlciB3ZSd2ZSBjb21lIHVwIHdpdGgg
Zm9yIHNvbWUgY2xhc3Mgb2YgZGV2aWNlcy4KPiAKPj4KPj4+Cj4+Pj4KPj4+PiBDdXJyZW50IHBp
biBncm91cCBhbmQgZnVuY3Rpb24gYmluZGluZ3MgYXJlIGZvciBNVDc2MjEuIFB1dCBiaW5kaW5n
cyBmb3IKPj4+PiBSVDI4ODAgaW5zdGVhZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFyxLFu
w6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPj4+PiAtLS0KPj4+PiAgICAuLi5waW5t
dXgueWFtbCA9PiByYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbH0gfCAyNCArKysrKysrKystLS0t
LS0tLS0tCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQo+Pj4+ICAgIHJlbmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC97cmFsaW5rLHJ0Mjg4MC1waW5tdXgueWFtbCA9PiByYWxpbmsscnQyODgwLXBpbmN0
cmwueWFtbH0gKDU2JSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJs
LnlhbWwKPj4+PiBzaW1pbGFyaXR5IGluZGV4IDU2JQo+Pj4+IHJlbmFtZSBmcm9tIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGlubXV4Lnlh
bWwKPj4+PiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPj4+PiBpbmRleCA5ZGU4YjBjMDc1ZTIuLmM2
NTdiYmY5ZmRkYSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1sCj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJs
LnlhbWwKPj4+PiBAQCAtMSwyMSArMSwyMyBAQAo+Pj4+ICAgICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPj4+PiAgICAlWUFNTCAxLjIKPj4+
PiAgICAtLS0KPj4+PiAtJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJs
L3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwjCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbCMKPj4+PiAgICAk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+
PiAtdGl0bGU6IFJhbGluayBydDI4ODAgcGlubXV4IGNvbnRyb2xsZXIKPj4+PiArdGl0bGU6IFJh
bGluayBSVDI4ODAgUGluIENvbnRyb2xsZXIKPj4+PiAgICBtYWludGFpbmVyczoKPj4+PiArICAt
IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPj4+Cj4+PiBNZW50aW9uIHRo
aXMgaW4gY29tbWl0IG1zZy4KPj4KPj4gV2lsbCBkby4KPj4KPj4+Cj4+Pj4gICAgICAtIFNlcmdp
byBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KPj4+PiAgICBkZXNj
cmlwdGlvbjoKPj4+PiAtICBUaGUgcnQyODgwIHBpbm11eCBjYW4gb25seSBzZXQgdGhlIG11eGlu
ZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKPj4+PiArICBSYWxpbmsgUlQy
ODgwIHBpbiBjb250cm9sbGVyIGZvciBSVDI4ODAgU29DLgo+Pj4+ICsgIFRoZSBwaW4gY29udHJv
bGxlciBjYW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZp
dWFsIHBpbnMKPj4+PiAgICAgIGlzIG5vdCBzdXBwb3J0ZWQuIFRoZXJlIGlzIG5vIHBpbmNvbmYg
c3VwcG9ydC4KPj4+PiAgICBwcm9wZXJ0aWVzOgo+Pj4+ICAgICAgY29tcGF0aWJsZToKPj4+PiAt
ICAgIGNvbnN0OiByYWxpbmsscnQyODgwLXBpbm11eAo+Pj4+ICsgICAgY29uc3Q6IHJhbGluayxy
dDI4ODAtcGluY3RybAo+Pj4KPj4+IHlvdSBuZWVkIHRvIGRlcHJlY2F0ZSBvbGQgcHJvcGVydHkg
YW5kIGFkZCBhIG5ldyBvbmUuCj4+Cj4+IERvIHdlIHJlYWxseSBoYXZlIHRvPyBUaGF0IHByb3Bl
cnR5IG5hbWUgd2FzIGluYWNjdXJhdGUgZnJvbSB0aGUgc3RhcnQuIEkKPj4gZG9uJ3Qgc2VlIGEg
cmVhc29uIHRvIGtlZXAgaXQgYmVpbmcgcmVmZXJyZWQgdG8gb24gdGhlIGJpbmRpbmcuCj4gCj4g
SXQncyBhbiBBQkkuIFRoZXJlIGFyZSBleGNlcHRpb25zLCBidXQgeW91J3ZlIGdvdCB0byBzcGVs
bCBvdXQgdGhlCj4gcmVhc29uaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCk9oLCBJIHRob3Vn
aHQgYnkgZGVwcmVjYXRpbmcsIEkgd2FzIHN1cHBvc2VkIHRvIGtlZXAgdGhlIG9sZCBvbmUgb24g
dGhlIApZQU1MIGJpbmRpbmcuIEknbGwgcHJvcGVybHkgZXhwbGFpbiB0aGUgcmVhc29uIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4KCj4gCj4gUmVhbGx5LCB3aG8gY2FyZXMuIEl0J3MganVzdCBhIHVu
aXF1ZSBpZGVudGlmaWVyLiBVbmxlc3MgeW91IGFsc28gaGFkIGEKPiBoL3cgYmxvY2sgY2FsbGVk
ICdwaW5tdXgnIGluIGFkZGl0aW9uIHRvIGEgJ3BpbmN0cmwnIGJsb2NrIGl0IGRvZXNuJ3QKPiBt
YXR0ZXIuIFdlIGNvdWxkIHVzZSBqdXN0IEdVSURzIGluc3RlYWQuCgpVbmRlcnN0b29kLCB0aGFu
a3MgUm9iIQoKQXLEsW7DpwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
