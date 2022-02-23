Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C22DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHNJ6RHrwbvkgW7gFVUM96JhnkmyQL/2r5JNudNCXkM=; b=rAX4T4kUCyroNI
	uxjc9HheeSH83/v8hsoC70npAihUTYoP2l4ZqTNN5TcXBWjYGzKpogW+hDOek0io3E1fRFt3cncBV
	V3VNUmk+khsOlcS9Kw/7q4kWCyvmnNAAvfaRP0+Uo7oQ5/h1u0grsekZIcezo/5FYCIkFzE9nNc5m
	SOCGUyTg3w6bx4b5cxmD05ZZ957ThsKJ7P3t4ovJu+ytK55RPgphHA+wFuXjAjCIQ2H6eefvU07T+
	+ynFYdBF5mcsdpRAV5iJQPegSmOECJpg88JAXAV8vphlFQpoBogWBtsZldi9TCrX2224bR3X2YA48
	TQ23CGWbqJcbCPSHd5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrXD-00EQjT-7q; Wed, 23 Feb 2022 13:18:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrS0-00EOU1-Ic; Wed, 23 Feb 2022 13:13:03 +0000
X-UUID: 61fb26288e344029bea5d161cede39eb-20220223
X-UUID: 61fb26288e344029bea5d161cede39eb-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 893725802; Wed, 23 Feb 2022 06:12:52 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:12:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 21:12:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:12:37 +0800
Message-ID: <d82cd71f06c803d15c1f2b86123c0ba63e7c5ed7.camel@mediatek.com>
Subject: Re: [PATCH v2 22/23] arm64: dts: mt8192: Add gce info for display
 nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:12:37 +0800
In-Reply-To: <20220222232439.dhsvnut3phudlsls@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-23-allen-kh.cheng@mediatek.com>
 <20220222232439.dhsvnut3phudlsls@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_051300_665240_B2D99CF6 
X-CRM114-Status: GOOD (  19.12  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE4OjI0IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjozMlBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCBnY2UgaW5mbyBmb3IgZGlzcGxheSBub2Rlcy4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlh
dGVrLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LmR0c2kgfCAxNiArKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIu
ZHRzaQo+ID4gaW5kZXggMWYxNTU1ZmQxOGY1Li5kZjg4NGM0ODY2OWUgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBAQCAtMTIyNiw2ICsxMjI2
LDkgQEAKPiA+ICAJCW1tc3lzOiBzeXNjb25AMTQwMDAwMDAgewo+ID4gIAkJCWNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTkyLW1tc3lzIiwgInN5c2NvbiI7Cj4gPiAgCQkJcmVnID0gPDAgMHgx
NDAwMDAwMCAwIDB4MTAwMD47Cj4gPiArCQkJbWJveGVzID0gPCZnY2UgMCBDTURRX1RIUl9QUklP
X0hJR0hFU1QgMT4sCj4gPiArCQkJCSA8JmdjZSAxIENNRFFfVEhSX1BSSU9fSElHSEVTVCAxPjsK
PiA+ICsJCQltZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlIFNVQlNZU18xNDAwWFhYWAo+
ID4gMCAweDEwMDA+Owo+IAo+IEFzIGEgc2lkZSBub3RlLCB0aGUgY3VycmVudCBtbXN5cyBkdC1i
aW5kaW5nLAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssbW1zeXMueWFtbCwKPiBkb2Vzbid0Cj4gZGVmaW5lIG1ib3hlcyBvciBtZWRpYXRl
ayxnY2UtY2xpZW50LXJlZywgYnV0IGxvb2tzIGxpa2UgdGhlcmUncwo+IGFscmVhZHkgYSBwYXRj
aAo+IGluIHRoZSBNTCBhZGRpbmcgdGhvc2U6Cj4gCj4gCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMjYwNzE5MzIuMzI2MTUtMi1q
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IXpOZlFrTi1ZWWpp
cVBDZDVtOURzTGhyUUR5bWdFWkpvWTRvU2wyNG5DM1I5NVAwZ0lYRW1OanlKTWhqUVpYa1dYN21a
UGE1UVM3S0lNbEdYTWJEakRBMV8yQSQKPiAKCkhpIE7DrWNvbGFzLAoKVGhhbmtzIGZvciB5b3Vy
IHJlbWluZGluZywgU2hvdWxkIEkgbmVlZCB0byByZW1vdmUgdGhpcyBwYXRjaCBmcm9tCnNlcmll
cz8KCm9yIEkgY2FuIGFkZCB0aGlzIE1MIHRvIGJhc2UgYW5kIG1lbnRpb24gaXQgaW4gY292ZXIg
bGV0dGVyLgoKQmVzdCByZWdhcmRzLApBbGxlbgoKPiAgCj4gCj4gPiAgCQkJI2Nsb2NrLWNlbGxz
ID0gPDE+Owo+ID4gIAkJfTsKPiA+ICAKPiA+IEBAIC0xMjM0LDYgKzEyMzcsOCBAQAo+ID4gIAkJ
CXJlZyA9IDwwIDB4MTQwMDEwMDAgMCAweDEwMDA+Owo+ID4gIAkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAyNTIgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiAgCQkJY2xvY2tzID0gPCZt
bXN5cyBDTEtfTU1fRElTUF9NVVRFWDA+Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1ldmVudHMgPQo+
ID4gPENNRFFfRVZFTlRfRElTUF9TVFJFQU1fRE9ORV9FTkdfRVZFTlRfMD4sCj4gPiArCQkJCQkg
ICAgICA8Q01EUV9FVkVOVF9ESVNQX1NUUkVBTV9ECj4gPiBPTkVfRU5HX0VWRU5UXzE+Owo+ID4g
IAkJfTsKPiA+ICAKPiA+ICAJCXNtaV9jb21tb246IHNtaUAxNDAwMjAwMCB7Cj4gPiBAQCAtMTI3
NSw2ICsxMjgwLDcgQEAKPiA+ICAJCQlpb21tdXMgPSA8JmlvbW11MCBNNFVfUE9SVF9MMF9PVkxf
UkRNQTA+LAo+ID4gIAkJCQkgPCZpb21tdTAgTTRVX1BPUlRfTDBfT1ZMX1JETUEwX0hEUj47Cj4g
PiAgCQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0RJU1A+
Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhY
Cj4gPiAweDUwMDAgMHgxMDAwPjsKPiA+ICAJCX07Cj4gPiAgCj4gPiAgCQlvdmxfMmwwOiBvdmxA
MTQwMDYwMDAgewo+ID4gQEAgLTEyODUsNiArMTI5MSw3IEBACj4gPiAgCQkJY2xvY2tzID0gPCZt
bXN5cyBDTEtfTU1fRElTUF9PVkwwXzJMPjsKPiA+ICAJCQlpb21tdXMgPSA8JmlvbW11MCBNNFVf
UE9SVF9MMV9PVkxfMkxfUkRNQTA+LAo+ID4gIAkJCQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0wx
X09WTF8yTF9SRE1BMF9IRFI+Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZn
Y2UgU1VCU1lTXzE0MDBYWFhYCj4gPiAweDYwMDAgMHgxMDAwPjsKPiA+ICAJCX07Cj4gPiAgCj4g
PiAgCQlyZG1hMDogcmRtYUAxNDAwNzAwMCB7Cj4gPiBAQCAtMTI5Niw2ICsxMzAzLDcgQEAKPiA+
ICAJCQltZWRpYXRlayxsYXJiID0gPCZsYXJiMD47Cj4gPiAgCQkJbWVkaWF0ZWsscmRtYS1maWZv
LXNpemUgPSA8NTEyMD47Cj4gPiAgCQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJf
UE9XRVJfRE9NQUlOX0RJU1A+Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZn
Y2UgU1VCU1lTXzE0MDBYWFhYCj4gPiAweDcwMDAgMHgxMDAwPjsKPiA+ICAJCX07Cj4gPiAgCj4g
PiAgCQljb2xvcjA6IGNvbG9yQDE0MDA5MDAwIHsKPiA+IEBAIC0xMzA1LDYgKzEzMTMsNyBAQAo+
ID4gIAkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTggSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4g
MD47Cj4gPiAgCQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlO
X0RJU1A+Owo+ID4gIAkJCWNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfQ09MT1IwPjsKPiA+
ICsJCQltZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlIFNVQlNZU18xNDAwWFhYWAo+ID4g
MHg5MDAwIDB4MTAwMD47Cj4gPiAgCQl9Owo+ID4gIAo+ID4gIAkJY2NvcnIwOiBjY29yckAxNDAw
YTAwMCB7Cj4gPiBAQCAtMTMxMyw2ICsxMzIyLDcgQEAKPiA+ICAJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMjU5IElSUV9UWVBFX0xFVkVMX0hJR0gKPiA+IDA+Owo+ID4gIAkJCXBvd2VyLWRvbWFp
bnMgPSA8JnNwbQo+ID4gTVQ4MTkyX1BPV0VSX0RPTUFJTl9ESVNQPjsKPiA+ICAJCQljbG9ja3Mg
PSA8Jm1tc3lzIENMS19NTV9ESVNQX0NDT1JSMD47Cj4gPiArCQkJbWVkaWF0ZWssZ2NlLWNsaWVu
dC1yZWcgPSA8JmdjZSBTVUJTWVNfMTQwMFhYWFgKPiA+IDB4YTAwMCAweDEwMDA+Owo+ID4gIAkJ
fTsKPiA+ICAKPiA+ICAJCWFhbDA6IGFhbEAxNDAwYjAwMCB7Cj4gPiBAQCAtMTMyMSw2ICsxMzMx
LDcgQEAKPiA+ICAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjYwIElSUV9UWVBFX0xFVkVMX0hJ
R0gKPiA+IDA+Owo+ID4gIAkJCXBvd2VyLWRvbWFpbnMgPSA8JnNwbQo+ID4gTVQ4MTkyX1BPV0VS
X0RPTUFJTl9ESVNQPjsKPiA+ICAJCQljbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9ESVNQX0FBTDA+
Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhY
Cj4gPiAweGIwMDAgMHgxMDAwPjsKPiA+ICAJCX07Cj4gPiAgCj4gPiAgCQlnYW1tYTA6IGdhbW1h
QDE0MDBjMDAwIHsKPiA+IEBAIC0xMzMwLDYgKzEzNDEsNyBAQAo+ID4gIAkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyNjEgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiAgCQkJcG93ZXIt
ZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0RJU1A+Owo+ID4gIAkJCWNs
b2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfR0FNTUEwPjsKPiA+ICsJCQltZWRpYXRlayxnY2Ut
Y2xpZW50LXJlZyA9IDwmZ2NlIFNVQlNZU18xNDAwWFhYWAo+ID4gMHhjMDAwIDB4MTAwMD47Cj4g
PiAgCQl9Owo+ID4gIAo+ID4gIAkJcG9zdG1hc2swOiBwb3N0bWFza0AxNDAwZDAwMCB7Cj4gPiBA
QCAtMTMzOSw2ICsxMzUxLDcgQEAKPiA+ICAJCQlwb3dlci1kb21haW5zID0gPCZzcG0KPiA+IE1U
ODE5Ml9QT1dFUl9ET01BSU5fRElTUD47Cj4gPiAgCQkJY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1f
RElTUF9QT1NUTUFTSzA+Owo+ID4gIAkJCWlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0wwX0RJ
U1BfUE9TVE1BU0swPjsKPiA+ICsJCQltZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlIFNV
QlNZU18xNDAwWFhYWAo+ID4gMHhkMDAwIDB4MTAwMD47Cj4gPiAgCQl9Owo+ID4gIAo+ID4gIAkJ
ZGl0aGVyMDogZGl0aGVyQDE0MDBlMDAwIHsKPiA+IEBAIC0xMzQ4LDYgKzEzNjEsNyBAQAo+ID4g
IAkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNjMgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47
Cj4gPiAgCQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0RJ
U1A+Owo+ID4gIAkJCWNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfRElUSEVSMD47Cj4gPiAr
CQkJbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZSBTVUJTWVNfMTQwMFhYWFgKPiA+IDB4
ZTAwMCAweDEwMDA+Owo+ID4gIAkJfTsKPiA+ICAKPiA+ICAJCWRzaTA6IGRzaUAxNDAxMDAwMCB7
Cj4gPiBAQCAtMTM3MSw2ICsxMzg1LDcgQEAKPiA+ICAJCQljbG9ja3MgPSA8Jm1tc3lzIENMS19N
TV9ESVNQX09WTDJfMkw+Owo+ID4gIAkJCWlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0wxX09W
TF8yTF9SRE1BMj4sCj4gPiAgCQkJCSA8JmlvbW11MAo+ID4gTTRVX1BPUlRfTDFfT1ZMXzJMX1JE
TUEyX0hEUj47Cj4gPiArCQkJbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZSBTVUJTWVNf
MTQwMVhYWFgKPiA+IDB4NDAwMCAweDEwMDA+Owo+ID4gIAkJfTsKPiA+ICAKPiA+ICAJCXJkbWE0
OiByZG1hQDE0MDE1MDAwIHsKPiA+IEBAIC0xMzgxLDYgKzEzOTYsNyBAQAo+ID4gIAkJCWNsb2Nr
cyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfUkRNQTQ+Owo+ID4gIAkJCWlvbW11cyA9IDwmaW9tbXUw
IE00VV9QT1JUX0wxX0RJU1BfUkRNQTQ+Owo+ID4gIAkJCW1lZGlhdGVrLHJkbWEtZmlmby1zaXpl
ID0gPDIwNDg+Owo+ID4gKwkJCW1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lT
XzE0MDFYWFhYCj4gPiAweDUwMDAgMHgxMDAwPjsKPiA+ICAJCX07Cj4gPiAgCj4gPiAgCQlkcGkw
OiBkcGlAMTQwMTYwMDAgewo+ID4gLS0gCj4gPiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
