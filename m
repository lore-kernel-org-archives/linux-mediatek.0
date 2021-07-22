Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CEBC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 05:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F45060FEA
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 05:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F45060FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vp5pjjRbWyp2pi284G8soM6ltUWP9FmT8Si0nQ/Y3ZY=; b=gLTzpF/+rpqEac
	l1KO/dvarQuP+viLSfJbBP1je6G0otOCuL5jX6wzqpUdiIduNi035gBicWjoZmHe9jd7GgOLykT+O
	BxVmCUyaTstNj3nR+KwQmU0e/K788izAf7wOOWdCc49+b93d49v1vzIKGk/zuhSrXj7c0GHKp/Qq3
	/pDZLqaM/GBbVJu6yLMMnt3x363ygC5sc4rTT1qPDQvjVrl8bG3IFf3Z+VwaDJVSueA26P3RTBcwH
	wfwbV4s/EzJSPXH4LyihPzT93tCMoxWWmYgw3+hSMRKBWlWodMvnI73IYhVVt1DmLxndN+OvHnzSZ
	qlClXi7yjtrdYv8rCYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6RDS-000F8q-AN; Thu, 22 Jul 2021 05:25:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6RDP-000F8L-L6; Thu, 22 Jul 2021 05:25:49 +0000
X-UUID: 114a94ae811440bf9358fac2e583387a-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bwvssxEh+WWqfF7JHzWygUD9tmJwKCWEMgEs0tG9/P8=; 
 b=KCaE7TThpr8gr58aWTZ73BIP+EAEN1L9h8YEq2zz/KJCAP7s2vePCf1M6NxssvxmyYiVdG8JyYcXcs3GPBsLCVTHPWz3RR4r4awpDoCasYWcIfB2/eZabo3RDmABOMX5xWuzo4wGjnlvlLo49gCSbOkyUPVrNsC2XOiNey+S2hY=;
X-UUID: 114a94ae811440bf9358fac2e583387a-20210721
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 164244363; Wed, 21 Jul 2021 22:25:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 22:25:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 13:25:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 13:25:41 +0800
Message-ID: <1626931541.16442.15.camel@mtksdaap41>
Subject: Re: [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, DRI Development
 <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 22 Jul 2021 13:25:41 +0800
In-Reply-To: <3f8b55c75f97e46901c9380fefd2c15a8c5a2a72.camel@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
 <20210717090408.28283-7-nancy.lin@mediatek.com>
 <CAAOTY__1iiptUgYy2G4BOyYEkqLVO3BRWhMru0p=aB3JcBzd_A@mail.gmail.com>
 <3f8b55c75f97e46901c9380fefd2c15a8c5a2a72.camel@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_222547_745419_85C49639 
X-CRM114-Status: GOOD (  24.21  )
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

SGksIE5hbmN5Og0KDQpPbiBUaHUsIDIwMjEtMDctMjIgYXQgMDk6MzIgKzA4MDAsIE5hbmN5Lkxp
biB3cm90ZToNCj4gSGkgQ2h1bi1LdWFuZywNCj4gDQo+IE9uIE1vbiwgMjAyMS0wNy0xOSBhdCAw
Nzo1NiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gPiBIaSwgTmFuY3k6DQo+ID4gDQo+
ID4gTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDfmnIgxN+aX
pSDpgLHlha0g5LiL5Y2INTowNOWvq+mBk++8mg0KPiA+ID4gDQo+ID4gPiBBZGQgRVRIRFIgbW9k
dWxlIGZpbGVzOg0KPiA+ID4gRVRIRFIgaXMgZGVzaWduZWQgZm9yIEhEUiB2aWRlbyBhbmQgZ3Jh
cGhpY3MgY29udmVyc2lvbiBpbiB0aGUNCj4gPiA+IGV4dGVybmFsDQo+ID4gPiBkaXNwbGF5IHBh
dGguIEl0IGhhbmRsZXMgbXVsdGlwbGUgSERSIGlucHV0IHR5cGVzIGFuZCBwZXJmb3JtcyB0b25l
DQo+ID4gPiBtYXBwaW5nLCBjb2xvciBzcGFjZS9jb2xvciBmb3JtYXQgY29udmVyc2lvbiwgYW5k
IHRoZW4gY29tYmluZXMNCj4gPiA+IGRpZmZlcmVudCBsYXllcnMsIG91dHB1dCB0aGUgcmVxdWly
ZWQgSERSIG9yIFNEUiBzaWduYWwgdG8gdGhlDQo+ID4gPiBzdWJzZXF1ZW50IGRpc3BsYXkgcGF0
aC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVk
aWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01h
a2VmaWxlICAgICAgICAgICB8ICAgMyArLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgIDggKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAgMTEgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAgIDQgKw0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyAgICAgICAgfCA1MzcNCj4gPiA+ICsrKysrKysr
KysrKysrKysrKysrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5o
ICAgICAgICB8ICAyMCArDQo+ID4gPiAgOCBmaWxlcyBjaGFuZ2VkLCA1ODQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5oDQo+ID4gPiANCj4gPiA+ICsNCj4gPiA+ICt2
b2lkIG10a19ldGhkcl9sYXllcl9vbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBp
ZHgsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFf
cGt0KQ0KPiA+ID4gK3sNCj4gPiA+ICsgICAgICAgc3RydWN0IG10a19ldGhkciAqcHJpdiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2V0aGRyX2NvbXAg
Km1peGVyID0gJnByaXYtDQo+ID4gPiA+ZXRoZHJfY29tcFtFVEhEUl9NSVhFUl07DQo+ID4gPiAr
DQo+ID4gPiArICAgICAgIGRldl9kYmcoZGV2LCAiJXMrIGlkeDolZCIsIF9fZnVuY19fLCBpZHgp
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBpZiAoaWR4IDwgNCkNCj4gPiA+ICsgICAgICAgICAg
ICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIEJJVChpZHgpLCAmbWl4ZXItDQo+ID4g
PiA+Y21kcV9iYXNlLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
aXhlci0+cmVncywgTUlYX1NSQ19DT04sDQo+ID4gPiBCSVQoaWR4KSk7DQo+ID4gPiArfQ0KPiA+
ID4gKw0KPiA+ID4gK3ZvaWQgbXRrX2V0aGRyX2xheWVyX29mZihzdHJ1Y3QgZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGNtZHFfcGt0ICpjbWRxX3BrdCkNCj4gPiA+ICt7DQo+ID4gPiArICAgICAgIHN0cnVjdCBtdGtf
ZXRoZHIgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiA+ICsgICAgICAgc3RydWN0
IG10a19ldGhkcl9jb21wICptaXhlciA9ICZwcml2LQ0KPiA+ID4gPmV0aGRyX2NvbXBbRVRIRFJf
TUlYRVJdOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBkZXZfZGJnKGRldiwgIiVzKyBpZHg6JWQi
LCBfX2Z1bmNfXywgaWR4KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgc3dpdGNoIChpZHgpIHsN
Cj4gPiA+ICsgICAgICAgY2FzZSAwOg0KPiA+ID4gKyAgICAgICAgICAgICAgIG10a19kZHBfd3Jp
dGVfbWFzayhjbWRxX3BrdCwgMCwgJm1peGVyLT5jbWRxX2Jhc2UsDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1peGVyLT5yZWdzLCBNSVhfTDBfU1JDX1NJWkUsDQo+
ID4gPiB+MCk7DQo+ID4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgIGNh
c2UgMToNCj4gPiA+ICsgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3Qs
IDAsICZtaXhlci0+Y21kcV9iYXNlLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBtaXhlci0+cmVncywgTUlYX0wxX1NSQ19TSVpFLA0KPiA+ID4gfjApOw0KPiA+ID4g
KyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICBjYXNlIDI6DQo+ID4gPiArICAg
ICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCAwLCAmbWl4ZXItPmNtZHFf
YmFzZSwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWl4ZXItPnJl
Z3MsIE1JWF9MMl9TUkNfU0laRSwNCj4gPiA+IH4wKTsNCj4gPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiA+ICsgICAgICAgY2FzZSAzOg0KPiA+ID4gKyAgICAgICAgICAgICAgIG10a19k
ZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgMCwgJm1peGVyLT5jbWRxX2Jhc2UsDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1peGVyLT5yZWdzLCBNSVhfTDNfU1JDX1NJ
WkUsDQo+ID4gPiB+MCk7DQo+ID4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAg
ICAgIGRlZmF1bHQ6DQo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICIlcyBXcm9u
ZyBsYXllciBJRFxuIiwgX19mdW5jX18pOw0KPiA+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ID4gKyAgICAgICB9DQo+ID4gDQo+ID4gV2h5IG5vdCBqdXN0DQo+ID4gDQo+ID4gICAgICAg
ICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCAwLCAmbWl4ZXItPmNtZHFfYmFz
ZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWl4ZXItPnJlZ3MsIE1J
WF9TUkNfQ09OLA0KPiA+IEJJVChpZHgpKTsNCj4gPiANCj4gDQo+IFRoZXJlIGFyZSB0d28gbW9k
ZXMgaW4gTWl4ZXIuDQo+IDEuIEJhY2tncm91bmQgcmVsYXkgbW9kZTogYWxsIGxheWVycyBvZmYN
Cj4gMi4gTm9ybWFsIG1peCBtb2RlOiBhdCBsZWFzdCBvbmUgbGF5ZXIgb24NCj4gVGhlIHRpbWlu
ZyBvZiB0aGUgdHdvIG1vZGVzIGlzIGRpZmZlcmVudCwgc28ga2VlcCB1c2luZyB0aGUgbm9ybWFs
IG1peA0KPiBtb2RlLg0KPiBKdXN0IHNldCB0aGUgbGF5ZXIgcmVnaW9uIHRvIDAgd2hlbiB0aGUg
bGF5ZXIgb2ZmLg0KDQpsYXllcl9vbigpIGFuZCBsYXllcl9vZmYoKSBkb2VzIGRpZmZlcmVudCB0
aGluZ3MuIENvbXBhcmluZyBiZWZvcmUgdHVybg0Kb24gYSBsYXllciB3aXRoIGFmdGVyIHR1cm4g
b24tPm9mZiBhIGxheWVyLCB0aGUgcmVnaXN0ZXIgc2V0dGluZyBhcmUNCmRpZmZlcmVudC4gSSB3
b3VsZCBsaWtlIGp1c3QgcmVzdG9yZSB0aGUgcmVnaXN0ZXIuIA0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gPiA+ICt9DQo+ID4gPiArDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
