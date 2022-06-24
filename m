Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6063BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u34oY58u3xbPeB/VrExw/Zy1F22X7UiZsDcG4O9AW/E=; b=4KS6z5qnbmE8mAsw9Rq30fVR9B
	2plEBAY471VZ3Lg8J4Ik+BazK0ysgrTyR2PTMld0nncztzV/zvCduMct3vM0OAANiecAXMm2YFA8P
	ZiRgFK/i1ImOlj9zNbqdymaPjQJmaG4qIsgwaTU/tNRfIF63ud4UaBMxVjwhPnp5v/SM4FC9OlZhQ
	tsVgiBA20fVDLfpilLftZdwqB57DOggqToI6QbOi4eV+B+ledLTqvdff/UoYON5HhneKbWkEyTdjS
	aDaeulJqKMGlHTiPBfu1r7/5n3dMSD66Tg41SXMkIybTksr1vNHzG6LM843ckCjSVNwm5e3rOACpA
	H2lRx5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4glF-001pjT-HN; Fri, 24 Jun 2022 10:42:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gl4-001peT-82; Fri, 24 Jun 2022 10:41:51 +0000
X-UUID: d7a111759d624c3dbe8fc7d8ca9e908a-20220624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=u34oY58u3xbPeB/VrExw/Zy1F22X7UiZsDcG4O9AW/E=;
	b=tBM76nSwPA74gyqB53q+qFkq+/psS+pDrZymWtY8SlsU4uR/PXZW3BDJB2vqd9L7rWmRibc5z/K5IvmoFNUyWRdaZfQEg99Da/TtQ7U5owrjoH4sr80jaV+YpyzRXAWfvY9gVMnNYnxIlXDucwfIx8RP2u6/Ia4uqr5uuK9X76M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6a3dcc03-9569-46c0-b902-ac3301f2bf5a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:81c37bd8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d7a111759d624c3dbe8fc7d8ca9e908a-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1789534517; Fri, 24 Jun 2022 03:41:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 03:35:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 18:35:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 24 Jun 2022 18:35:50 +0800
Message-ID: <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
From: Yong Wu <yong.wu@mediatek.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Baolu Lu <baolu.lu@linux.intel.com>
CC: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jordan@cosmicpenguin.net"
	<jordan@cosmicpenguin.net>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "will@kernel.org" <will@kernel.org>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
	"orsonzhai@gmail.com" <orsonzhai@gmail.com>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "marcan@marcan.st" <marcan@marcan.st>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>
Date: Fri, 24 Jun 2022 18:35:49 +0800
In-Reply-To: <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
	 <20220623200029.26007-2-nicolinc@nvidia.com>
	 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
	 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
	 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
	 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_034150_342348_2E06577D 
X-CRM114-Status: GOOD (  33.26  )
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

T24gRnJpLCAyMDIyLTA2LTI0IGF0IDA2OjE2ICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4g
PiBGcm9tOiBZb25nIFd1DQo+ID4gU2VudDogRnJpZGF5LCBKdW5lIDI0LCAyMDIyIDE6MzkgUE0N
Cj4gPiANCj4gPiBPbiBUaHUsIDIwMjItMDYtMjMgYXQgMTk6NDQgLTA3MDAsIE5pY29saW4gQ2hl
biB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDA5OjM1OjQ5QU0gKzA4MDAs
IEJhb2x1IEx1IHdyb3RlOg0KPiA+ID4gPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Bl
bmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9u
IDIwMjIvNi8yNCAwNDowMCwgTmljb2xpbiBDaGVuIHdyb3RlOg0KPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2lv
bW11L210a19pb21tdV92MS5jDQo+ID4gPiA+ID4gaW5kZXggZTFjYjUxYjk4NjZjLi41Mzg2ZDg4
OTQyOWQgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXVfdjEu
Yw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3YxLmMNCj4gPiA+ID4g
PiBAQCAtMzA0LDcgKzMwNCw3IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4gPiBtdGtfaW9tbXVfdjFf
YXR0YWNoX2RldmljZShzdHJ1Y3QNCj4gPiA+ID4gPiBpb21tdV9kb21haW4gKmRvbWFpbiwgc3Ry
dWN0IGRldmljZQ0KPiA+ID4gPiA+ICAgICAgIC8qIE9ubHkgYWxsb3cgdGhlIGRvbWFpbiBjcmVh
dGVkIGludGVybmFsbHkuICovDQo+ID4gPiA+ID4gICAgICAgbXRrX21hcHBpbmcgPSBkYXRhLT5t
YXBwaW5nOw0KPiA+ID4gPiA+ICAgICAgIGlmIChtdGtfbWFwcGluZy0+ZG9tYWluICE9IGRvbWFp
bikNCj4gPiA+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIC1FTUVESVVNVFlQRTsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgICAgICBp
ZiAoIWRhdGEtPm00dV9kb20pIHsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgIGRhdGEtPm00dV9k
b20gPSBkb207DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGNoYW5nZSBsb29rcyBvZGQuIEl0IHR1
cm5zIHRoZSByZXR1cm4gdmFsdWUgZnJvbSBzdWNjZXNzDQo+ID4gPiA+IHRvDQo+ID4gPiA+IGZh
aWx1cmUuIElzIGl0IGEgYnVnPyBJZiBzbywgaXQgc2hvdWxkIGdvIHRocm91Z2ggYSBzZXBhcmF0
ZWQNCj4gPiA+ID4gZml4DQo+ID4gPiA+IHBhdGNoLg0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhl
IHJldmlldzopDQo+ID4gDQo+ID4gPiANCj4gPiA+IE1ha2VzIHNlbnNlLg0KPiA+ID4gDQo+ID4g
PiBJIHJlYWQgdGhlIGNvbW1pdCBsb2cgb2YgdGhlIG9yaWdpbmFsIGNoYW5nZToNCj4gPiA+IA0K
PiA+IA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTU4OTUzMDEyMy0zMDI0MC0xLWdp
dC1zZW5kLWVtYWlsLQ0KPiA+IHlvbmcud3VAbWVkaWF0ZWsuY29tDQo+ID4gPiANCj4gPiA+IEl0
IGRvZXNuJ3Qgc2VlbSB0byBhbGxvdyBkZXZpY2VzIHRvIGdldCBhdHRhY2hlZCB0byBkaWZmZXJl
bnQNCj4gPiA+IGRvbWFpbnMgb3RoZXIgdGhhbiB0aGUgc2hhcmVkIG1hcHBpbmctPmRvbWFpbiwg
Y3JlYXRlZCBpbiB0aGUNCj4gPiA+IGluIHRoZSBtdGtfaW9tbXVfcHJvYmVfZGV2aWNlKCkuIFNv
IGl0IGxvb2tzIGxpa2UgcmV0dXJuaW5nIDANCj4gPiA+IGlzIGludGVudGlvbmFsLiBUaG91Z2gg
SSBhbSBzdGlsbCB2ZXJ5IGNvbmZ1c2VkIGJ5IHRoaXMgcmV0dXJuDQo+ID4gPiB2YWx1ZSBoZXJl
LCBJIGRvdWJ0IGl0IGhhcyBldmVyIGJlZW4gdXNlZCBpbiBhIFZGSU8gY29udGV4dC4NCj4gPiAN
Cj4gPiBJdCdzIG5vdCB1c2VkIGluIFZGSU8gY29udGV4dC4gInJldHVybiAwIiBqdXN0IHNhdGlz
ZnkgdGhlIGlvbW11DQo+ID4gZnJhbWV3b3JrIHRvIGdvIGFoZWFkLiBhbmQgeWVzLCBoZXJlIHdl
IG9ubHkgYWxsb3cgdGhlIHNoYXJlZA0KPiA+ICJtYXBwaW5nLQ0KPiA+ID4gZG9tYWluIiAoQWxs
IHRoZSBkZXZpY2VzIHNoYXJlIGEgZG9tYWluIGNyZWF0ZWQgaW50ZXJuYWxseSkuDQo+ID4gDQo+
ID4gdGh1cyBJIHRoaW5rIHdlIHNob3VsZCBzdGlsbCBrZWVwICJyZXR1cm4gMCIgaGVyZS4NCj4g
PiANCj4gDQo+IFdoYXQgcHJldmVudCB0aGlzIGRyaXZlciBmcm9tIGJlaW5nIHVzZWQgaW4gVkZJ
TyBjb250ZXh0Pw0KDQpOb3RoaW5nIHByZXZlbnQgdGhpcy4gSnVzdCBJIGRpZG4ndCB0ZXN0LiBt
dGtfaW9tbXVfdjEuYyBvbmx5IGlzIHVzZWQNCmluIG10MjcwMSBhbmQgdGhlcmUgaXMgbm8gVkZJ
TyBzY2VuYXJpby4gSSdtIG5vdCBzdXJlIGlmIGl0IHN1cHBvcnRzDQpWRklPLiAobXRrX2lvbW11
LmMgc3VwcG9ydCBWRklPLikNCg0KPiBhbmQgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZ28gYWhlYWQg
d2hlbiBhbiBvYnZpb3VzIGVycm9yIG9jY3Vycw0KPiBpLmUuIHdoZW4gYSBkZXZpY2UgaXMgYXR0
YWNoZWQgdG8gYW4gdW5leHBlY3RlZCBkb21haW4/DQoNClRoZSBpb21tdSBmbG93IGluIHRoaXMg
ZmlsZSBhbHdheXMgaXMgYSBiaXQgb2RkIGFzIHdlIG5lZWQgc2hhcmUgaW9tbXUNCmRvbWFpbiBp
biBBUk0zMi4gQXMgSSB0ZXN0ZWQgYmVmb3JlIGluIHRoZSBhYm92ZSBsaW5rLCAiVGhlIGlvbW11
DQpmcmFtZXdvcmsgd2lsbCBjcmVhdGUgYSBpb21tdSBkb21haW4gZm9yIGVhY2ggYSBkZXZpY2Uu
IiwgdGhlcmVmb3JlIHdlDQpoYXZlIHRvICp3b3JrYXJvdW5kKiBpbiB0aGlzIGZpbGUuDQoNCkFu
ZCB0aGlzIHdhcyBleHBlY3RlZCB0byBiZSBmaXhlZCBieToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTU5NzkzMTg3NS5naXQucm9iaW4ubXVycGh5QGFybS5j
b20vDQoNCnNvcnJ5LCBJIGRvbid0IGtub3cgaXRzIGN1cnJlbnQgc3RhdHVzLg0KDQpUaGFua3Mu
DQo=


