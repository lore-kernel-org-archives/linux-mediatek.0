Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00420C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 03:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYnUo3fSvFCwbRLOn/FLsDQIOwfE01kTlrScSFk9gl0=; b=iYg1Q4DqREI2ufTGAo7W+Ln1O0
	2yasMGT61XPWD9aIc0akdBn+AIwOxKd+pv/HkTKZCFgzPIyALuv14xY/z6UGm5JNNHtEEiBLTEhB1
	p8RuYacfACum2KwK344ahCLEGBkSJy5TfnVN0lHXi+GQAnbr1jRhcNv2u+My+5T6E6qRFwQzrBSAI
	PPs7mWM5xLPevYj8+IZUhBA35X4A36AUPiAVjiNgctTJkTPINva5yS8tE8UNi/rEgE0sncxTYfCwO
	4glClHbE3oDrzi5ZlzDghl55AyKLDVeTPBd+DhF4up40PnK6TMuWIfLeLK++C/8rAwDTLoplHXExh
	sfPoHQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5flf-00FBXv-F7; Mon, 27 Jun 2022 03:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5flU-00FBUw-At; Mon, 27 Jun 2022 03:50:22 +0000
X-UUID: 8fda8a7e68ac4c548a3ec631b8e48c40-20220626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=cYnUo3fSvFCwbRLOn/FLsDQIOwfE01kTlrScSFk9gl0=;
	b=Nr2ix/uWJ9IzHayUuBMyVFRS/GTtN/41PaZGsLDwxDY0c4+fBCM5jhNsLNdx8WdC2yE/PuFQiaJMUga4p5F0sAd3D0Un36ya3Y0tTz/AFzJVqXEkx3ei7z+7I+7RN0A9eDKr3nrAsZZX6+mTLfKaehhFJN+kI5Usx0ewn36eov0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ffe81a96-1b96-4b56-9760-be35ce6c911d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:513292ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8fda8a7e68ac4c548a3ec631b8e48c40-20220626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 729734370; Sun, 26 Jun 2022 20:50:14 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jun 2022 20:45:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 11:45:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 11:45:12 +0800
Message-ID: <d89fc641de1c73bbb9680db8a19c6c361bd71682.camel@mediatek.com>
Subject: Re: [PATCH v8 2/8] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, <aaronyu@google.com>,
	<alsa-devel@alsa-project.org>, <angelogioacchino.delregno@collabora.com>,
	<broonie@kernel.org>, <devicetree@vger.kernel.org>, <julianbraha@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<robh+dt@kernel.org>, <trevor.wu@mediatek.com>, <tzungbi@google.com>
Date: Mon, 27 Jun 2022 11:45:12 +0800
In-Reply-To: <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
References: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
	 <20220625190852.29130-3-jiaxin.yu@mediatek.com>
	 <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_205020_430284_CA47E3C2 
X-CRM114-Status: GOOD (  30.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIyLTA2LTI2IGF0IDEwOjMzICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6DQo+IExlIDI1LzA2LzIwMjIgw6AgMjE6MDgsIEppYXhpbiBZdSBhIMOpY3JpdCA6DQo+ID4g
QWRkIG10ODE4NiBwbGF0Zm9ybSBhbmQgYWZmaWxpYXRlZCBkcml2ZXIuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSmlheGluIFl1IDwNCj4gPiBqaWF4aW4ueXUtTnVTNUx2TlVwY0pXazBIdGlr
M0ovd0BwdWJsaWMuZ21hbmUub3JnPg0KPiA+IC0tLQ0KPiA+ICAgc291bmQvc29jL21lZGlhdGVr
L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICAxMiArDQo+ID4gICBzb3VuZC9zb2MvbWVk
aWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gPiAgIHNvdW5kL3Nv
Yy9tZWRpYXRlay9tdDgxODYvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMTkgKw0KPiA+ICAgc291
bmQvc29jL21lZGlhdGVrL210ODE4Ni9tdDgxODYtYWZlLWNvbW1vbi5oIHwgIDIzNSArKw0KPiA+
ICAgLi4uL3NvYy9tZWRpYXRlay9tdDgxODYvbXQ4MTg2LWFmZS1jb250cm9sLmMgIHwgIDI1NSAr
Kw0KPiA+ICAgc291bmQvc29jL21lZGlhdGVrL210ODE4Ni9tdDgxODYtYWZlLXBjbS5jICAgIHwg
MzAxMQ0KPiA+ICsrKysrKysrKysrKysrKysrDQo+ID4gICA2IGZpbGVzIGNoYW5nZWQsIDM1MzMg
aW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRl
ay9tdDgxODYvTWFrZWZpbGUNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVk
aWF0ZWsvbXQ4MTg2L210ODE4Ni1hZmUtY29tbW9uLmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg2L210ODE4Ni1hZmUtY29udHJvbC5jDQo+ID4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE4Ni9tdDgxODYtYWZlLXBj
bS5jDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiArCU1UODE4Nl9EQUlfSE9TVExFU1NfU1JDX0FBVURJ
TywNCj4gPiArCU1UODE4Nl9EQUlfSE9TVExFU1NfU1JDXzEsCS8qIGp1c3QgYW4gZXhtcGFsZSAq
Lw0KPiANCj4gZXhhbXBsZT8NClllcywgaXQncyBhIHR5cG8uIEluIGZhY3QsIEkgc2hvdWxkIHJl
bW92ZSB0aGlzIGRlc2NyaXB0aW9uLg0KPiANCj4gPiArCU1UODE4Nl9EQUlfSE9TVExFU1NfU1JD
X0JBUkdFSU4sDQo+ID4gKwlNVDgxODZfREFJX0hPU1RMRVNTX1VMMSwNCj4gDQo+IFsuLi5dDQo+
IA0KPiA+ICsjZGVmaW5lIE1US19TUEtfSTJTXzBfU1RSICJNVEtfU1BLX0kyU18wIg0KPiA+ICsj
ZGVmaW5lIE1US19TUEtfSTJTXzFfU1RSICJNVEtfU1BLX0kyU18xIg0KPiA+ICsjZGVmaW5lIE1U
S19TUEtfSTJTXzJfU1RSICJNVEtfU1BLX0kyU18yIg0KPiA+ICsjZGVmaW5lIE1US19TUEtfSTJT
XzNfU1RSICJNVEtfU1BLX0kyU18zIg0KPiANCj4gT3V0IG9mIGN1cmlvc2l0eSwgd2h5IG5vIDQ/
DQo+IE9yLCBpZiByZWxhdGVkIHRvIG10a19zcGtfaTJzX3R5cGUgYmVsb3csIHdoeSAgNiwgNywg
OCBhbmQgOT8NCg0KQmVjYXVzZSB0aGUgTVQ4MTg2IGRvbid0IGhhdmUgSTJTNCBoYXJkd2FyZSwg
c28gd2UgY29udGludWVkIHRvIHVzZSB0aGUNCmhhcmR3YXJlIG5hbWUgYW5kIHNraXBwZWQgdGhl
IG51bWJlciA0Lg0KSG93ZXZlciwgdGhlIE1UODE4NiBkb2VzIG5vdCBoYXZlIEkyUyA1LzYvNy84
LzksIEkgd2lsbCByZW1vdmUgdGhlc2UuDQoNCj4gDQo+ID4gKyNkZWZpbmUgTVRLX1NQS19JMlNf
NV9TVFIgIk1US19TUEtfSTJTXzUiDQo+ID4gKyNkZWZpbmUgTVRLX1NQS19JMlNfNl9TVFIgIk1U
S19TUEtfSTJTXzYiDQo+ID4gKyNkZWZpbmUgTVRLX1NQS19JMlNfN19TVFIgIk1US19TUEtfSTJT
XzciDQo+ID4gKyNkZWZpbmUgTVRLX1NQS19JMlNfOF9TVFIgIk1US19TUEtfSTJTXzgiDQo+ID4g
KyNkZWZpbmUgTVRLX1NQS19JMlNfOV9TVFIgIk1US19TUEtfSTJTXzkiDQo+ID4gKw0KPiANCj4g
Wy4uLl0NCj4gDQo+ID4gKw0KPiA+ICtlbnVtIG10a19zcGtfaTJzX3R5cGUgew0KPiA+ICsJTVRL
X1NQS19JMlNfVFlQRV9JTlZBTElEID0gLTEsDQo+ID4gKwlNVEtfU1BLX0kyU18wLA0KPiA+ICsJ
TVRLX1NQS19JMlNfMSwNCj4gPiArCU1US19TUEtfSTJTXzIsDQo+ID4gKwlNVEtfU1BLX0kyU18z
LA0KPiA+ICsJTVRLX1NQS19JMlNfNSwNCj4gPiArCU1US19TUEtfSTJTX1RZUEVfTlVNDQo+ID4g
K307DQo+IA0KPiBbLi4uXQ0KPiANCj4gPiArc3RhdGljIGludCBtdDgxODZfYWZlX3BjbV9kZXZf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsJc3RydWN0
IG10a19iYXNlX2FmZSAqYWZlOw0KPiA+ICsJc3RydWN0IG10ODE4Nl9hZmVfcHJpdmF0ZSAqYWZl
X3ByaXY7DQo+ID4gKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiArCXN0cnVjdCByZXNldF9j
b250cm9sICpyc3RjOw0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4g
PiArCWludCBpLCByZXQsIGlycV9pZDsNCj4gPiArDQo+ID4gKwlyZXQgPSBkbWFfc2V0X21hc2tf
YW5kX2NvaGVyZW50KGRldiwgRE1BX0JJVF9NQVNLKDM0KSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+
ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJYWZlID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCphZmUpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghYWZlKQ0KPiA+ICsJCXJldHVybiAt
RU5PTUVNOw0KPiA+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgYWZlKTsNCj4gPiArDQo+
ID4gKwlhZmUtPnBsYXRmb3JtX3ByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmFmZV9w
cml2KSwNCj4gPiBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghYWZlLT5wbGF0Zm9ybV9wcml2KQ0K
PiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWFmZV9wcml2ID0gYWZlLT5wbGF0
Zm9ybV9wcml2Ow0KPiA+ICsJYWZlLT5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsNCj4gPiArCXJl
cyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4g
KwlhZmUtPmJhc2VfYWRkciA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMp
Ow0KPiA+ICsJaWYgKElTX0VSUihhZmUtPmJhc2VfYWRkcikpDQo+ID4gKwkJcmV0dXJuIFBUUl9F
UlIoYWZlLT5iYXNlX2FkZHIpOw0KPiA+ICsNCj4gPiArCS8qIGluaXQgYXVkaW8gcmVsYXRlZCBj
bG9jayAqLw0KPiA+ICsJcmV0ID0gbXQ4MTg2X2luaXRfY2xvY2soYWZlKTsNCj4gPiArCWlmIChy
ZXQpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgImluaXQgY2xvY2sgZXJyb3IsIHJldCAlZFxuIiwg
cmV0KTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gVGhlcmUgaXMgYSBtdDgx
ODZfZGVpbml0X2Nsb2NrKCkgY2FsbCBpbiB0aGUgcmVtb3ZlIGZ1bmN0aW9uLg0KPiBTaG91bGQg
dGhpcyBhbHNvIGJlIGNhbGxlZCBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBiZWxvdz8NCj4g
T3Igc2hvdWxkIGEgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgYmUgdXNlZCB0byBlYXNlIGVy
cm9yDQo+IGhhbmRsaW5nPw0KPiANCg0KWWVzLCBtdDgxODZfZGVpbml0X2Nsb2NrKCkgaXMgcmVx
dWlyZWQgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGguDQpJIHByZWZlciB0byB1c2UgZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KCksIHRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50Lg0KDQo+ID4g
Kw0KPiA+ICsJLyogaW5pdCBtZW1pZiAqLw0KPiA+ICsJYWZlLT5tZW1pZl8zMmJpdF9zdXBwb3J0
ZWQgPSAwOw0KPiA+ICsJYWZlLT5tZW1pZl9zaXplID0gTVQ4MTg2X01FTUlGX05VTTsNCj4gPiAr
CWFmZS0+bWVtaWYgPSBkZXZtX2tjYWxsb2MoZGV2LCBhZmUtPm1lbWlmX3NpemUsIHNpemVvZigq
YWZlLQ0KPiA+ID5tZW1pZiksDQo+ID4gKwkJCQkgIEdGUF9LRVJORUwpOw0KPiA+ICsNCj4gDQo+
IE5pdDogbm8gbmVlZCBmb3IgYW4gZW1wdHkgbGluZSBoZXJlLg0KPiANCg0KR290IGl0Lg0KDQo+
ID4gKwlpZiAoIWFmZS0+bWVtaWYpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiAN
Cj4gWy4uLl0NCj4gDQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnJfcG1f
ZGlzYWJsZToNCj4gPiArCXBtX3J1bnRpbWVfcHV0X25vaWRsZShkZXYpOw0KPiA+ICsJcG1fcnVu
dGltZV9zZXRfc3VzcGVuZGVkKGRldik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtdDgxODZfYWZlX3BjbV9kZXZfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfYmFzZV9h
ZmUgKmFmZSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICsNCj4gPiArCWlmICgh
cG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQ0KPiA+ICsJCW10ODE4Nl9h
ZmVfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOw0KPiANCj4gT3V0IG9mIGN1cmlvc2l0eSwg
aXMgaXQgbm9ybWFsIHRvIGhhdmUgc29tZSBwbV9ydW50aW1lIHJlbGF0ZWQgY29kZQ0KPiBoZXJl
IA0KPiB0aGF0IGRvZXMgbm90IGxvb2sgdGhlIHNhbWUgYXMgdGhlIG9uZSBpbiB0aGUgZXJyb3Ig
aGFuZGxpbmcgb2YgdGhlDQo+IHByb2JlPw0KPiAoSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgcG0s
IGJ1dCB1c3VhbGx5LCAucmVtb3ZlKCkgZnVuY3Rpb25zIGFuZA0KPiBlcnJvciANCj4gaGFuZGxp
bmcgaW4gdGhlIHByb2JlIGxvb2sgcXVpdGUgY2xvc2UpDQo+IA0KDQpBcyBJIHVuZGVyc3RhbmQg
aXQsIHRoZSAucHJvYmUoKSBmdW5jdGlvbiBpcyBsaWtlIGJlbG93Og0KDQogICAgMS4gYWxsb2Nh
dGUgcmVzb3VyY2VzIGFuZCBpbml0aWFsaXplIHRoZW0NCiAgICAyLiBkZXZtX3BtX3J1bnRpbWVf
ZW5hYmxlKGRldik7DQogICAgMy4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOyAvKiBl
eGVjdXRlIHRoZSBydW50aW1lX3Jlc3VtZQ0KY2FsbGJhY2sgKi8NCiAgICA0LiBkbyByZWdtYXAg
aW5pdCB0aGF0IG11c3QgcG93ZXIgb24gdGhlIHJlZ3VsYXRvciBhbmQgY2xvY2sNCiAgICA1LiBw
bV9ydW50aW1lX3B1dF9zeW5jKGRldik7IC8qIGV4ZWN1dGUgdGhlIHJ1bnRpbWVfc3VzcGVuZA0K
Y2FsbGJhY2sgKi8NCg0KU28gdGhlIGVycm9yIGhhbmRsaW5nIGlzIHRvIHByb2Nlc3MgdGhlIGVy
cm9ycyBmcm9tIHN0ZXAgNC81LiBJZiB0aGUNCi5wcm9iZSgpIGV4ZWN1dGVzIG5vcm1hbGx5LCB0
aGUgZGV2IGlzIGluIHJ1bnRpbWUgc3VzcGVuZCBzdGF0dXMuIEFuZA0Kd2UgdXNlZCBkZXZtX3Bt
X3J1bnRpbWVfZW5iYWxlKCksIHNvIG1heWJlIHdlIGRvbid0IG5lZWQgdG8gZG8gYW55dGhpbmcN
CnRvIHRoZSBwbV9ydW50aW1lX3h4eCBpbiB0aGUgLnJlbW92ZSgpIGNhbGxiYWNrPw0KDQpEb2Vz
IHRoaXMgY29uZGl0aW9uIG5ldmVyIGVzdGFibGlzaGVkPw0KCWlmICghcG1fcnVudGltZV9zdGF0
dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQ0KICAgICAgICAgICAgICAgIG10ODE4Nl9hZmVfcnVu
dGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOw0KDQo+ID4gKw0KPiA+ICsJbXQ4MTg2X2RlaW5pdF9j
bG9jayhhZmUpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiANCj4g
Wy4uLl0NCg==


