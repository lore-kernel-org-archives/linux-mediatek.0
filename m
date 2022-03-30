Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90386C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZJTAEFFvRa55nhq+otBwcKpxAodRvVd5wBicWqi8Ss=; b=bDpj6R8kSnJqlW
	WicBq5e34Z5MMxt+hZ+cmItbTQMm5LAitBcGw11ydCATJZq1I+7RvH8+rzj3ApHqUl0qYe1fm3MYw
	qFIitrh2yEO+gEwUpmSPqsx6vT3gVAitkhyjGsBDTK2gvFm16QSagHlHGkD+DyYRCp4jd/D+WO7mo
	nOk4koaBtqyhWveU2W6xcXHJPbgxJSJJIMCU6YNxV8JaAnrDW5i7OUa9qf9gy6AHxaIwv1eleuUx7
	0ax7zIWnBkCCd8/GpmRfsDdD0/bv7lcnpaQ+wuDM+nTdD54uPtGYOE/0uw6aBtxoRvqh7nKMMoCoN
	CzIZifIwheI6edtl6+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZbAI-00GpYn-Ks; Wed, 30 Mar 2022 16:27:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZbAF-00GpYE-9a; Wed, 30 Mar 2022 16:27:20 +0000
X-UUID: f26201abfc624395bceea8217fd70f40-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fRcGCRDibrKUTzpHfn7Fat9nZaD71QGCmsWsOZeoNNI=; 
 b=MBzTBVyMAM32mibZT9igVY4ZYAUvulWWnAfl2TtkowgqYR1/zm2LovZdsphYzIeg900+rsbbYM80Z57xo4TI1Ea1ky94jzSacXdmLcS4aI1WMlTQXX2DjYo8GNYkf+PHPoGnwnCsBYdroPv4g9ZZFhzw75E4BfhzHqA1eVxCGMQ=;
X-UUID: f26201abfc624395bceea8217fd70f40-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 49205113; Wed, 30 Mar 2022 09:27:14 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 09:20:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 00:20:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 00:20:09 +0800
Message-ID: <7462933d959bd8ed1b7e3259f607a2e47436371c.camel@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@kernel.org>
Date: Thu, 31 Mar 2022 00:20:09 +0800
In-Reply-To: <20220330152026.6nuigsldx46lue44@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <20220330152026.6nuigsldx46lue44@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_092719_365311_49DD7B9B 
X-CRM114-Status: GOOD (  31.91  )
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

T24gV2VkLCAyMDIyLTAzLTMwIGF0IDExOjIwIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCg0KPiA+ID4gPiAgc3RhdGljIGludCBtdDgxOTJfbXQ2MzU5X2Rldl9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4gPiA+ICpwZGV2KQ0KPiA+ID4gPiAgew0KPiA+ID4g
PiAgCXN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQ7DQo+ID4gPiA+IC0Jc3RydWN0IGRldmljZV9u
b2RlICpwbGF0Zm9ybV9ub2RlLCAqaGRtaV9jb2RlYzsNCj4gPiA+ID4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKnBsYXRmb3JtX25vZGUsICpoZG1pX2NvZGVjLA0KPiA+ID4gPiAqc3BlYWtlcl9jb2Rl
YzsNCj4gPiA+ID4gIAlpbnQgcmV0LCBpOw0KPiA+ID4gPiAgCXN0cnVjdCBzbmRfc29jX2RhaV9s
aW5rICpkYWlfbGluazsNCj4gPiA+ID4gIAlzdHJ1Y3QgbXQ4MTkyX210NjM1OV9wcml2ICpwcml2
Ow0KPiA+ID4gPiAgDQo+ID4gPiA+IC0JcGxhdGZvcm1fbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUo
cGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gPiA+IC0JCQkJCSAibWVkaWF0ZWsscGxhdGZvcm0iLA0K
PiA+ID4gPiAwKTsNCj4gPiA+ID4gLQlpZiAoIXBsYXRmb3JtX25vZGUpIHsNCj4gPiA+ID4gLQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiUHJvcGVydHkgJ3BsYXRmb3JtJw0KPiA+ID4gPiBtaXNzaW5n
IG9yDQo+ID4gPiA+IGludmFsaWRcbiIpOw0KPiA+ID4gPiArCWNhcmQgPSAoc3RydWN0IHNuZF9z
b2NfY2FyZA0KPiA+ID4gPiAqKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0NCj4gPiA+
ID4gPiBkZXYpOw0KPiA+ID4gPiANCj4gPiA+ID4gKwlpZiAoIWNhcmQpDQo+ID4gPiA+ICAJCXJl
dHVybiAtRUlOVkFMOw0KPiA+ID4gPiArCWNhcmQtPmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKwlwbGF0Zm9ybV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShwZGV2LT5kZXYu
b2Zfbm9kZSwNCj4gPiA+ID4gIm1lZGlhdGVrLHBsYXRmb3JtIiwgMCk7DQo+ID4gPiA+ICsJaWYg
KCFwbGF0Zm9ybV9ub2RlKSB7DQo+ID4gPiA+ICsJCXJldCA9IC1FSU5WQUw7DQo+ID4gPiA+ICsJ
CWRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiUHJvcGVydHkNCj4gPiA+ID4gJ3BsYXRm
b3JtJw0KPiA+ID4gPiBtaXNzaW5nIG9yIGludmFsaWRcbiIpOw0KPiA+ID4gPiArCQlnb3RvIGVy
cl9wbGF0Zm9ybV9ub2RlOw0KPiA+ID4gPiAgCX0NCj4gPiA+ID4gIA0KPiA+ID4gPiAtCWNhcmQg
PSAoc3RydWN0IHNuZF9zb2NfY2FyZA0KPiA+ID4gPiAqKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0NCj4gPiA+ID4gPiBkZXYpOw0KPiA+ID4gPiANCj4gPiA+ID4gLQlpZiAoIWNhcmQp
IHsNCj4gPiA+ID4gKwloZG1pX2NvZGVjID0gb2ZfcGFyc2VfcGhhbmRsZShwZGV2LT5kZXYub2Zf
bm9kZSwNCj4gPiA+ID4gIm1lZGlhdGVrLGhkbWktY29kZWMiLCAwKTsNCj4gPiA+ID4gKwlpZiAo
IWhkbWlfY29kZWMpIHsNCj4gPiA+ID4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gPiA+ID4gLQkJZ290
byBwdXRfcGxhdGZvcm1fbm9kZTsNCj4gPiA+ID4gKwkJZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2
LCByZXQsICJQcm9wZXJ0eSAnaGRtaS0NCj4gPiA+ID4gY29kZWMnDQo+ID4gPiA+IG1pc3Npbmcg
b3IgaW52YWxpZFxuIik7DQo+ID4gPiA+ICsJCWdvdG8gZXJyX2hkbWlfY29kZWM7DQo+ID4gPiAN
Cj4gPiA+IFlvdSdyZSBtYWtpbmcgaGRtaS1jb2RlYyBhIHJlcXVpcmVkIHByb3BlcnR5LCBzaW5j
ZSBub3cgdGhlDQo+ID4gPiBkcml2ZXINCj4gPiA+IGZhaWxzIHRvDQo+ID4gPiBwcm9iZSB3aXRo
b3V0IGl0LiBJcyBpdCByZWFsbHkgcmVxdWlyZWQgdGhvdWdoPyBUaGUgZHJpdmVyIGNvZGUNCj4g
PiA+IHN0aWxsDQo+ID4gPiBjaGVja3MgZm9yDQo+ID4gPiB0aGUgcHJlc2VuY2Ugb2YgaGRtaV9j
b2RlYyBiZWZvcmUgdXNpbmcgaXQsIHNvIHNob3VsZG4ndCBpdCBiZQ0KPiA+ID4gZmluZQ0KPiA+
ID4gdG8gbGV0IGl0IGJlDQo+ID4gPiBvcHRpb25hbD8NCj4gPiA+IA0KPiA+ID4gSWYgaXQgaXMg
cmVhbGx5IHJlcXVpcmVkIG5vdyB0aG91Z2gsIHRoZW4gSSBndWVzcyBhdCBsZWFzdCB0aGUNCj4g
PiA+IGR0LQ0KPiA+ID4gYmluZGluZyBzaG91bGQNCj4gPiA+IGJlIHVwZGF0ZWQgYWNjb3JkaW5n
bHkuIChBbHRob3VnaCBJIHRoaW5rIHRoaXMgd291bGQgdGVjaG5pY2FsbHkNCj4gPiA+IGJyZWFr
IHRoZSBBQkk/KQ0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+ID4gPiBOw61jb2xhcw0KPiA+IA0K
PiA+IEhpIE7DrWNvbGFzLA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50LiBJbmRl
ZWQgSSBtYWRlIGhkbWktY29kZWMgYSByZXF1aXJlZA0KPiA+IHByb3BlcnR5LA0KPiA+IGJlY2F1
c2UgaXQgaXMgYSBtdXN0IGluIHRoaXMgbWFjaGluZSBkcml2ZXIuIEkgcHJlZmVyIHRvIHJlcG9y
dA0KPiA+IGVycm9ycw0KPiA+IGR1cmluZyB0aGUgcmVnaXN0cmF0aW9uIHJhdGhlciB0aGFuIGR1
cmluZyB0aGUgdXNlLg0KPiANCj4gQnV0IHdoYXQgZG8geW91IG1lYW4gdGhhdCBpdCBpcyByZXF1
aXJlZCBpbiB0aGlzIG1hY2hpbmUgZHJpdmVyPyBUaGUNCj4gY29kZSBjaGVja3MNCj4gZm9yIHBy
ZXNlbmNlIG9mIGhkbWlfY29kZWMgYW5kIGlnbm9yZXMgaXQgaWYgaXQncyBub3Qgc2V0LCBzbyBp
dCBkb2VzDQo+IHJlYWxseQ0KPiBzZWVtIG9wdGlvbmFsIHRvIG1lLiBBbHNvLCBJIGhhdmUgdGVz
dGVkIHRoaXMgZHJpdmVyIG9uIG10ODE5Mi0NCj4gYXN1cmFkYS1zcGhlcmlvbg0KPiB3aXRob3V0
IGhkbWktY29kZWMgc2V0IGluIHRoZSBEVCBhbmQgdGhlIHNwZWFrZXIgYW5kIGhlYWRwaG9uZSBz
b3VuZA0KPiB3b3JrcyBqdXN0DQo+IGZpbmUuDQo+IA0KPiBCZXNpZGVzLCB0aGVyZSBtaWdodCBi
ZSBtYWNoaW5lcyB1c2luZyB0aGlzIGRyaXZlciB0aGF0IGRvbid0IHN1cHBvcnQNCj4gSERNSSwg
YW5kDQo+IHJlcXVpcmluZyBhbiBoZG1pLWNvZGVjIGluIHRoZSBEVCBmb3IgdGhlbSB3b3VsZCBu
b3QgbWFrZSBhbnkgc2Vuc2UuDQo+IFNvIGtlZXBpbmcNCj4gaGRtaS1jb2RlYyBhcyBvcHRpb25h
bCBzZWVtcyBsaWtlIHRoZSBtb3N0IHNlbnNpYmxlIHNvbHV0aW9uIHRvIG1lLA0KPiByZWFsbHku
DQo+IA0KPiBUaGFua3MsDQo+IE7DrWNvbGFzDQoNClllcywgSSBhZ3JlZSB3aXRoIHlvdS4gSW4g
dGhlIHBhc3QsIGlmIHRoZXJlIHdhcyBhIG5ldyBib2FyZCB3aXRob3V0DQpIRE1JIGF1ZGlvLCB3
ZSB3b3VsZCBjaG9vc2UgdG8gYWRkIGEgbmV3IG1hY2hpbmUgZHJpdmVyIGFuZCBhIG5ldyBkdC0N
CmJpbmRpbmdzLiBCdXQgbm93LCBpbiBvcmRlciB0byBzaW1wbGlmeSB0aGUgY29kZSwgd2UgdGVu
ZCB0byBzaGFyZSBvbmUNCm1hY2hpbmUgZHJpdmVyIGZvciBib2FyZHMgdGhhdCB1c2Ugc2ltaWxh
ciBjb2RlY3MuIEFuZCB3ZSBhcmUgZG9pbmcNCnRoaXMgbm93Lg0KDQpUaGFua3MsDQpKaWF4aW4u
WXUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
