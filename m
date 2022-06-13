Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C108C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bfPF1d5i5IdJ3o2iupVNWgJzCa0awXA5A1bb9wDdNQ=; b=D3TAN5/PLGKEJC
	kL8nwT62CxbYy61UDNnNN9sSfuYUJP45uwKhdfj8NCVguZbGAaDZ+3SlQR3RnJgD49iTC3dMgSDlk
	SPLM+EmMBt28igNm1xG7T8f98FeXGw4uqQ8NNFXYE/6Ot7Oaz0/EiS47JryHggu7i2LyUKLALz7dE
	ecyWfYMB7AmdMhbm2hODepGQX/B9HRst0+iNW+4hb6ZnZzALGXIJMDSfSV+oIP1ecLoBeRICaBCPK
	LMtx7WlkAJ1DWCGbN5ytlbyTCdiiUY1ayOeHVKI47OsHs52b8uQCnGicuL5Ymbte4fbTUMWaLlP7T
	VgzFR35CpqFr2HqpYhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cbe-001TN6-SE; Mon, 13 Jun 2022 05:27:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cbT-001TKr-OX; Mon, 13 Jun 2022 05:27:09 +0000
X-UUID: e74414bcc77048c1b2257a9c08f4449f-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7307c06c-88b4-4666-9da9-c0c73f89a006,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:c7157d37-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: e74414bcc77048c1b2257a9c08f4449f-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2101021311; Sun, 12 Jun 2022 22:26:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 22:26:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 13:26:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 13:26:52 +0800
Message-ID: <5e557269561d62972f8e44490bf7a6f97088f56b.camel@mediatek.com>
Subject: Re: [RESEND v8 00/19] Cleanup MediaTek clk reset drivers and
 support SoCs
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
	<nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
	<wenst@chromium.org>, <runyang.chen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 13 Jun 2022 13:26:52 +0800
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_222707_846051_D545E3D4 
X-CRM114-Status: GOOD (  20.73  )
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

T24gTW9uLCAyMDIyLTA1LTIzIGF0IDE3OjMzICswODAwLCBSZXgtQkMgQ2hlbiB3cm90ZToKPiBJ
biB0aGlzIHNlcmllcywgd2UgY2xlYW51cCBNZWRpYVRlayBjbG9jayByZXNldCBkcml2ZXJzIGlu
Cj4gY2xrL21lZGlhdGVrCj4gZm9sZGVyLiBNZWRpYVRlayBjbG9jayByZXNldCBkcml2ZXIgaXMg
dXNlZCB0byBwcm92aWRlIHJlc2V0IGNvbnRyb2wKPiBvZiBtb2R1bGVzIGNvbnRyb2xsZWQgaW4g
Y2xrLCBsaWtlIGluZnJhX2FvLgo+IAo+IENoYW5nZXMgZm9yIHY4IHJlc2VuZDoKPiAxLiBSZW1v
dmUgdGVzdGVkLWJ5IHRhZyBmcm9tIE7DrWNvbGFzIGZvciBNVDgxOTUvTVQ4MTg2IHBhdGNoZXMu
Cj4gMi4gQWRkIHJldmlld2VkLWJ5IHRhZyBmcm9tIEFuZ2Vsb0dpb2FjY2hpbm8uCj4gCj4gQ2hh
bmdlcyBmb3Igdjg6Cj4gMS4gVXNlICdlbnVtIG10a19yZXNldF92ZXJzaW9uJyB0byByZXBsYWNl
IHU4IGluIHBhdGNoIDUgYW5kIDYuCj4gMi4gVXNlIGxvd2VyY2FzZSAnMHhjJyBpbiBwYXRjaCA3
Lgo+IDMuIERyb3AgInNpbXBsZS1tZmQiIGluIHBhdGNoIDE2IGJlY2F1c2UgaXQncyBmb3Igb3Jp
Z2luYWwgcmVzZXQKPiBjb250cm9sbGVyLgo+IDQuIHY4IGlzIGJhc2VkIG9uIGxpbnV4LW5leHQg
bmV4dC0yMDIyMDUyMCBhbmQgQ2hlbi1ZdSdzIHNlcmllc1sxXS4KPiAKPiBDaGFuZ2VzIGZvciB2
NzoKPiAxLiB2NyBpcyBiYXNlZCBvbiBsaW51eC1uZXh0IG5leHQtMjAyMjA1MTkgYW5kIENoZW4t
WXUncyBzZXJpZXNbMV0uCj4gMi4gQWRkIHN1cHBvcnQgZm9yIE1UODE4Ni4KPiAKPiBbMV06IAo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0
Lz9zZXJpZXM9NjQzMDAzCj4gCj4gQ2hhbmdlcyBmb3IgdjY6Cj4gMS4gQWRkIGEgbmV3IHBhdGNo
IHRvIHN1cHBvcnQgaW51cHV0IGFyZ3VtZW50IGluZGV4IG1vZGUuCj4gMi4gUmV2aXNlIGRlZmlu
aXRpb24gaW4gcmVzZXQuaCB0byBpbmRleC4KPiAKPiBSZXgtQkMgQ2hlbiAoMTkpOgo+ICAgY2xr
OiBtZWRpYXRlazogcmVzZXQ6IEFkZCByZXNldC5oCj4gICBjbGs6IG1lZGlhdGVrOiByZXNldDog
Rml4IHdyaXR0ZW4gcmVzZXQgYml0IG9mZnNldAo+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFJl
ZmluZSBhbmQgcmVvcmRlciBmdW5jdGlvbnMgaW4gcmVzZXQuYwo+ICAgY2xrOiBtZWRpYXRlazog
cmVzZXQ6IEV4dHJhY3QgY29tbW9uIGRyaXZlcnMgdG8gdXBkYXRlIGZ1bmN0aW9uCj4gICBjbGs6
IG1lZGlhdGVrOiByZXNldDogTWVyZ2UgYW5kIHJldmlzZSByZXNldCByZWdpc3RlciBmdW5jdGlv
bgo+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFJldmlzZSBzdHJ1Y3R1cmUgdG8gY29udHJvbCBy
ZXNldCByZWdpc3Rlcgo+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFN1cHBvcnQgbm9uc2VxdWVu
Y2UgYmFzZSBvZmZzZXRzIG9mIHJlc2V0Cj4gICAgIHJlZ2lzdGVycwo+ICAgY2xrOiBtZWRpYXRl
azogcmVzZXQ6IFN1cHBvcnQgaW51cHV0IGFyZ3VtZW50IGluZGV4IG1vZGUKPiAgIGNsazogbWVk
aWF0ZWs6IHJlc2V0OiBDaGFuZ2UgcmV0dXJuIHR5cGUgZm9yIGNsb2NrIHJlc2V0IHJlZ2lzdGVy
Cj4gICAgIGZ1bmN0aW9uCj4gICBjbGs6IG1lZGlhdGVrOiByZXNldDogQWRkIG5ldyByZWdpc3Rl
ciByZXNldCBmdW5jdGlvbiB3aXRoIGRldmljZQo+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IEFk
ZCByZXNldCBzdXBwb3J0IGZvciBzaW1wbGUgcHJvYmUKPiAgIGR0LWJpbmRpbmdzOiBhcm06IG1l
ZGlhdGVrOiBBZGQgI3Jlc2V0LWNlbGxzIHByb3BlcnR5IGZvcgo+ICAgICBNVDgxOTIvTVQ4MTk1
Cj4gICBkdC1iaW5kaW5nczogcmVzZXQ6IG1lZGlhdGVrOiBBZGQgaW5mcmFfYW8gcmVzZXQgaW5k
ZXggZm9yCj4gICAgIE1UODE5Mi9NVDgxOTUKPiAgIGNsazogbWVkaWF0ZWs6IHJlc2V0OiBBZGQg
aW5mcmFfYW8gcmVzZXQgc3VwcG9ydCBmb3IgTVQ4MTkyL01UODE5NQo+ICAgYXJtNjQ6IGR0czog
bWVkaWF0ZWs6IEFkZCBpbmZyYSAjcmVzZXQtY2VsbHMgcHJvcGVydHkgZm9yIE1UODE5Mgo+ICAg
YXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBpbmZyYSAjcmVzZXQtY2VsbHMgcHJvcGVydHkgZm9y
IE1UODE5NQo+ICAgZHQtYmluZGluZ3M6IHJlc2V0OiBtZWRpYXRlazogQWRkIGluZnJhX2FvIHJl
c2V0IGluZGV4IGZvciBNVDgxODYKPiAgIGR0LWJpbmRpbmdzOiBhcm06IG1lZGlhdGVrOiBBZGQg
I3Jlc2V0LWNlbGxzIHByb3BlcnR5IGZvciBNVDgxODYKPiAgIGNsazogbWVkaWF0ZWs6IHJlc2V0
OiBBZGQgaW5mcmFfYW8gcmVzZXQgc3VwcG9ydCBmb3IgTVQ4MTg2Cj4gCj4gIC4uLi9tZWRpYXRl
ay9tZWRpYXRlayxtdDgxODYtc3lzLWNsb2NrLnlhbWwgICB8ICAgMyArCj4gIC4uLi9tZWRpYXRl
ay9tZWRpYXRlayxtdDgxOTItc3lzLWNsb2NrLnlhbWwgICB8ICAgMyArCj4gIC4uLi9tZWRpYXRl
ay9tZWRpYXRlayxtdDgxOTUtc3lzLWNsb2NrLnlhbWwgICB8ICAgMyArCj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgICAgICB8ICAgMSArCj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kgICAgICB8ICAxNSArLQo+ICBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQyNzAxLWV0aC5jICAgICAgICAgfCAgMTAgKy0KPiAgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10MjcwMS1nM2QuYyAgICAgICAgIHwgIDEwICstCj4gIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDI3MDEtaGlmLmMgICAgICAgICB8ICAxMCArLQo+ICBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLmMgICAgICAgICAgICAgfCAgMjIgKy0KPiAgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcxMi5jICAgICAgICAgICAgIHwgIDIyICstCj4gIGRyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDc2MjItZXRoLmMgICAgICAgICB8ICAxMCArLQo+ICBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3NjIyLWhpZi5jICAgICAgICAgfCAgMTIgKy0KPiAgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10NzYyMi5jICAgICAgICAgICAgIHwgIDIyICstCj4gIGRy
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc2MjktZXRoLmMgICAgICAgICB8ICAxMCArLQo+ICBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3NjI5LWhpZi5jICAgICAgICAgfCAgMTIgKy0KPiAg
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODEzNS5jICAgICAgICAgICAgIHwgIDIyICstCj4g
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyAgICAgICAgICAgICB8ICAyMiArLQo+
ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLmMgICAgICAgICAgICAgfCAgMTggKy0K
PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4Ni1pbmZyYV9hby5jICAgIHwgIDIzICsr
Cj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTIuYyAgICAgICAgICAgICB8ICAyOSAr
KysKPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5NS1pbmZyYV9hby5jICAgIHwgIDI0
ICsrKwo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXRrLmMgICAgICAgICAgICAgICAgfCAg
IDcgKwo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXRrLmggICAgICAgICAgICAgICAgfCAg
IDkgKy0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyAgICAgICAgICAgICAgICAgIHwg
MTk4ICsrKysrKysrKysrKystLS0KPiAtLQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5o
ICAgICAgICAgICAgICAgICAgfCAgODIgKysrKysrKysKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9tdDgxODYtcmVzZXRzLmggICAgIHwgICA1ICsKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9tdDgxOTItcmVzZXRzLmggICAgIHwgICA4ICsKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9tdDgxOTUtcmVzZXRzLmggICAgIHwgICA2ICsKPiAgMjggZmlsZXMgY2hhbmdlZCwgNTIz
IGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaAo+IAoKSGVsbG8gU3RlcGhlbiwKCkdlbnRsZSBwaW5n
IGZvciB0aGlzIHNlcmllcy4KSSBhbHNvIHB1c2hlZCBhbm90aGVyIHNlcmllcyB0byBtb3ZlIHRo
ZXNlIGRyaXZlcnMgdG8gZHJpdmVycy9yZXNldApmb2xkZXJbMV0sIGJ1dCBJIHRoaW5rIHdlIHN0
aWxsIGNhbiBsZXQgdGhpcyBzZXJpZXMgbWVyZ2VkLgoKSWYgeW91IGhhdmUgYW55IGNvbW1lbnRz
IGZvciBbMV0sIHBsZWFzZSBsZXQgbWUga25vdy4KClRoYW5rcy4KClsxXTogCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIyMDUyNzA5
MDM1NS43MzU0LTEtcmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tLwoKQlJzLApCby1DaGVuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
