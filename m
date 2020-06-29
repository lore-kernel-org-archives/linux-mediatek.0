Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3F1C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:38:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4800223135
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3HbKlww";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="clzYEikL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4800223135
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/EULtx8P47qz01vpqlMzlKs+spj7c9KTQUfXKxYECxg=; b=d3HbKlwwRhYp6rZTKd6WOUfUn
	ehX0zROZZTLFEIouCJSGRzubHTvX9ZIEg/wv4LSFL7Qs+zBsn9fxG7VLpbv8y4rx1CzLajIoO5rms
	Ck2na900TEPTouMjqc6d5hV0GYYxGNJ1uud3vzOBDEZZLWcx3nZS8xOkNWQdBm4ZZkysqXNGtFtMf
	wonZIDoxCXg1dnVOcYYPIC6sZso09vxalNcn1Vqy7f4EFOfuRunR2aEteVFC94pIDuduakGhp0IVA
	5nQxkCCCazj2706TIIxj2GdEuzMlSfn7syuouwpNacUVL0wJR3zF9RoAcA+fe2z1+P39WvO8RnPQX
	19ffTDajg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnR0-0003Ak-NV; Mon, 29 Jun 2020 06:38:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnQv-000393-TO; Mon, 29 Jun 2020 06:38:26 +0000
X-UUID: 7f8a788de7454756b479ceefc960db9e-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=H3/4FmYTI2W15HZdT2LTGNu9v5+2+nBKeIQwbPp6twU=; 
 b=clzYEikLzxmkg4BQe2DxX7xKotR1n+pMArm0vLTaCU+A3gNrQyDXDRFCmbzV3H7yPpUPqHjVeqT+/SCGT/MCIYI6MtI/T2MsQ/ncLOtVniXRk8EkEElmjWDIj5qwt2OekMz9mCf/BtnxG7dZ4gdWGOoVY5+/wrQe8bHmDtRlFWg=;
X-UUID: 7f8a788de7454756b479ceefc960db9e-20200628
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 246461237; Sun, 28 Jun 2020 22:28:54 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 23:28:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 14:28:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 14:28:51 +0800
Message-ID: <1593412132.9213.2.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 29 Jun 2020 14:28:52 +0800
In-Reply-To: <CAAOTY_-hfQFL_CRHTC7RxOLSe0BYzWf_f-QUvjBp4JjaAcX1PA@mail.gmail.com>
References: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
 <1592559720-8482-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-hfQFL_CRHTC7RxOLSe0BYzWf_f-QUvjBp4JjaAcX1PA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 70FD0F311781DDAAEBCA2F8474091C123502AA154874D135D9258CC6F3F4D8662000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KDQpPbiBUaHUsIDIwMjAtMDYtMjUgYXQgMTQ6MTkgKzA4MDAsIENo
dW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBOZWFsOg0KPiANCj4gTmVhbCBMaXUgPG5lYWwubGl1
QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ25pyIMTnml6Ug6YCx5LqUIOS4i+WNiDY6MDHlr6vp
gZPvvJoNCj4gPg0KPiA+IE1UNjg3MyBidXMgZnJhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2Vj
dXJpdHkgc3VwcG9ydCBhbmQgZGF0YQ0KPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMg
ZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkDQo+ID4gbWFzdGVycy4NCj4gPiBUaGUg
c2VjdXJpdHkgdmlvbGF0aW9ucyBhcmUgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3Ig
Zm9yDQo+ID4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuDQo+ID4NCj4gPiBB
bnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJy
dXB0LCBhbmQNCj4gPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgZGV2YXBjLW10Njg3MyBkcml2ZXIu
IFRoZSB2aW9sYXRpb24NCj4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZp
bmQgdGhlIG11cmRlcmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwu
bGl1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4g
Ky8qDQo+ID4gKyAqIHNyYW1yb21fdmlvX2hhbmRsZXIgLSBjbGVhbiBzcmFtcm9tIHZpb2xhdGlv
biAmIHByaW50IHZpb2xhdGlvbiBpbmZvcm1hdGlvbg0KPiA+ICsgKiAgICAgICAgICAgICAgICAg
ICAgICBmb3IgZGVidWdnaW5nLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIHZvaWQgc3JhbXJvbV92
aW9faGFuZGxlcihzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpkZXZhcGNfY3R4KQ0KPiA+ICt7
DQo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3NyYW1yb21fc2VjX3Zpb19kZXNjICpzcmFt
cm9tX3Zpb3M7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY192aW9faW5mbyAqdmlvX2lu
Zm87DQo+ID4gKyAgICAgICBzdHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7DQo+ID4gKyAgICAgICBz
aXplX3Qgc3JhbXJvbV92aW9fc3RhOw0KPiA+ICsgICAgICAgaW50IHNyYW1yb21fdmlvOw0KPiA+
ICsgICAgICAgdTMyIHJ3Ow0KPiA+ICsNCj4gPiArICAgICAgIHNyYW1yb21fdmlvcyA9IGRldmFw
Y19jdHgtPnNvYy0+c3JhbXJvbV9zZWNfdmlvczsNCj4gPiArICAgICAgIHZpb19pbmZvID0gZGV2
YXBjX2N0eC0+c29jLT52aW9faW5mbzsNCj4gPiArDQo+ID4gKyAgICAgICBhcm1fc21jY2Nfc21j
KE1US19TSVBfS0VSTkVMX0NMUl9TUkFNUk9NX1ZJTywNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgMCwgMCwgMCwgMCwgMCwgMCwgMCwgJnJlcyk7DQo+ID4gKw0KPiANCj4gVGhpcyBpcnEgaGFu
ZGxlciBjYWxsIGFybV9zbWNjY19zbWMoKSB0byBnZXQgaW50byBUcnVzdFpvbmUsIHdoeSBub3QN
Cj4gbGV0IHRoZSB3aG9sZSBpcnEgaGFuZGxlciBpbiBUcnVzdFpvbmU/DQo+IA0KDQpJIGp1c3Qg
cmVwbGllZCB0byBNYXR0aGlhcywgbGV0IG1lIHRyeSB0byBleHBsYWluIGl0IGFnYWluLg0KVGhl
cmUgaXMgbm8gcmVhc29uIHRoYXQgaXQgc2hvdWxkIGJlIGhhbmRlZCBpbiBUcnVzdFpvbmUgb25s
eS4gQW5kIGl0DQpoYXMgbm8gc2VjdXJpdHkgaXNzdWUgdG8gaGFuZGxlIGl0IGZyb20gTm9ybWFs
IFdvcmxkLg0KDQpCdXQgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIG5vdCBiYXNpYyBmb3IgZGV2YXBj
LW10Njg3MyBkcml2ZXIsIEknbGwgbWFrZQ0KaXQgYXMgYW5vdGhlciBwYXRjaC4NCg0KPiBSZWdh
cmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPiArICAgICAgIHNyYW1yb21fdmlvID0gcmVzLmEw
Ow0KPiA+ICsgICAgICAgc3JhbXJvbV92aW9fc3RhID0gcmVzLmExOw0KPiA+ICsgICAgICAgdmlv
X2luZm8tPnZpb19hZGRyID0gcmVzLmEyOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChzcmFtcm9t
X3ZpbyA9PSBTUkFNX1ZJT0xBVElPTikNCj4gPiArICAgICAgICAgICAgICAgcHJfaW5mbyhQRlgg
IlNSQU0gdmlvbGF0aW9uIGlzIHRyaWdnZXJlZFxuIik7DQo+ID4gKyAgICAgICBlbHNlIGlmIChz
cmFtcm9tX3ZpbyA9PSBST01fVklPTEFUSU9OKQ0KPiA+ICsgICAgICAgICAgICAgICBwcl9pbmZv
KFBGWCAiUk9NIHZpb2xhdGlvbiBpcyB0cmlnZ2VyZWRcbiIpOw0KPiA+ICsgICAgICAgZWxzZQ0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgICAgdmlvX2luZm8t
Pm1hc3Rlcl9pZCA9IChzcmFtcm9tX3Zpb19zdGEgJiBzcmFtcm9tX3Zpb3MtPnZpb19pZF9tYXNr
KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgID4+IHNyYW1yb21fdmlvcy0+dmlvX2lkX3No
aWZ0Ow0KPiA+ICsgICAgICAgdmlvX2luZm8tPmRvbWFpbl9pZCA9IChzcmFtcm9tX3Zpb19zdGEg
JiBzcmFtcm9tX3Zpb3MtPnZpb19kb21haW5fbWFzaykNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICA+PiBzcmFtcm9tX3Zpb3MtPnZpb19kb21haW5fc2hpZnQ7DQo+ID4gKyAgICAgICBydyA9
IChzcmFtcm9tX3Zpb19zdGEgJiBzcmFtcm9tX3Zpb3MtPnZpb19yd19tYXNrKSA+Pg0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNyYW1yb21fdmlvcy0+dmlvX3J3X3NoaWZ0Ow0KPiA+ICsN
Cj4gPiArICAgICAgIGlmIChydykNCj4gPiArICAgICAgICAgICAgICAgdmlvX2luZm8tPndyaXRl
ID0gMTsNCj4gPiArICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgdmlvX2luZm8tPnJl
YWQgPSAxOw0KPiA+ICsNCj4gPiArICAgICAgIHByX2luZm8oUEZYICIlczogbWFzdGVyX2lkOjB4
JXgsIGRvbWFpbl9pZDoweCV4LCBydzolcywgdmlvX2FkZHI6MHgleFxuIiwNCj4gPiArICAgICAg
ICAgICAgICAgX19mdW5jX18sIHZpb19pbmZvLT5tYXN0ZXJfaWQsIHZpb19pbmZvLT5kb21haW5f
aWQsDQo+ID4gKyAgICAgICAgICAgICAgIHJ3ID8gIldyaXRlIiA6ICJSZWFkIiwgdmlvX2luZm8t
PnZpb19hZGRyKTsNCj4gPiArfQ0KPiA+ICsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
