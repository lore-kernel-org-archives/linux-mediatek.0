Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633F606A33D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5vS6bbK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TnLydP/q0OcHaQiyLeY7n0laxjesdk+CQW1eJ2FF2TQ=; b=K5vS6bbKxgayWi7kwiS4hVH6HW
	Sb78QFLeFhN83NA2+YSOM+7ZI1Y1fZSVbERQriTSjTgA+0X9HKx3ECj2mt+T4Le1zQaFFDn5FMzsv
	9iza/tCxJLJ/9oUnVb3VRUEud2PY9I8crbcIZA4jVgQyX2nfe5cdX6ONlUBCLRHLtFFpurbu3uKVW
	wdzxcG8lkIIXPtNIfMYB8wLSjDy1ZqfewN5cE2WaN8CVejimTklUfFbYdwM2j0hD7UKjcrBG9HMAd
	2UZQ8MmjC7jf9He3eI2gc7Yiblb9KVsxVZoNNT48SqCmpwugRpGoEKxDKujJ4WbWWdgpdgzCpWUnS
	VzdN2xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKNL-00000002AF7-0eea;
	Mon, 23 Nov 2026 03:05:51 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKNF-00000002AEN-1ykS;
	Mon, 23 Nov 2026 03:05:49 +0000
X-UUID: bde101eae6ea11f1a87c2323a98e90a4-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:e236480f-81b5-4e6a-a866-a74199d79345,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:9767ee19-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bde101eae6ea11f1a87c2323a98e90a4-20261123
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2145812124; Mon, 23 Nov 2026 11:05:30 +0800
X-UUID: bad2729ae6ea11f1907ca11d1ee29896-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:428bed8c-8d26-4c2f-9d25-701d38411628,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:24e8556d-7094-42ec-b0fc-880bdbe65e51,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bad2729ae6ea11f1907ca11d1ee29896-20261123
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1716193816; Mon, 23 Nov 2026 11:05:25 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 23 Nov 2026 11:05:20 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 11:05:20 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>
CC: "loic.poulain@oss.qualcomm.com" <loic.poulain@oss.qualcomm.com>,
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "wen-zhi.huang@mediatek.com"
	<wen-zhi.huang@mediatek.com>, "shi-wei.yeh@mediatek.com"
	<shi-wei.yeh@mediatek.com>, "Minano.tseng@mediatek.com"
	<Minano.tseng@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "horms@kernel.org"
	<horms@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "Yu. Robert (GSM)"
	<robert_yu@compal.com>, "Chang. Jeff (GSM)" <Jeff_Chang@compal.com>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v12 1/6] net: wwan: t9xx: Add PCIe core
Thread-Topic: [PATCH net-next v12 1/6] net: wwan: t9xx: Add PCIe core
Thread-Index: AQHdevd54De0Y6zWOkihERTiFY38IA==
Date: Mon, 23 Nov 2026 03:05:20 +0000
Message-ID: <e0c8e3ba67c44497929214dc4af457d9@compal.com>
References: <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>,<179526494505.3135.4658538684680862441@kernel.org>
In-Reply-To: <179526494505.3135.4658538684680862441@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-as-result: No-10--6.787900-8.000000
x-tmase-matchedrid: FYPNOy2BwYguv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EsdzeBfTA9wJLyT/MN7wrGexAkh/4iTFXsX4aFYAMIYOdVbkPpTjx93ip853bfdtlrUT
	d4rjs9C9xvCC56QlYKQlMuaZyxNaOvcFcLkIKgogLOnhkOkWpfX6u8VnsVatciGVApiRLArlald
	PULa7AQCsdNWM5hW1JcgK7xmCFN17L4EjeSe7K+B1wPM2CYnhNMa2390tjr7+N7me0G16g/GhrD
	xsfTpHEfwQ1wVmT5NxM8oF1lOcJpN5xM13XxOl1prktoeU+bT7jwao3bN2eydTHFoOVTUKP/fcJ
	RwrfXvl6+Fy6rKzWhqD8aIfkI3jSRLJXbemaGaJFg2HO5lmNEJFx8VBGp0H2ED0N8WyOeXF/jW0
	J1+/nWm5okWypgcy3tZWH9XyytR6HQaA1x89VwycOunEIf0eXQahV9NsL7Q+L12p7cZqBWARb8n
	rC2fmyNzjZg+C+I37KvNGNmG0SU6+eCSMeOiOkA/lH/MvdoiYmkrgX3CciJtFJvI9LYcV3ImxnQ
	vgkai0DmyMy7NxgFv6mDCw61sljTsUVzafMt+vqmyQquMhRu65d4IbM4cXIY35lXsc1ptReheOh
	f9vXhZHs7bBd7vh4a1SF0R3OwPNaebaOpYUQ7GMZqqlp63mW39InOc4KUjGgIAoCghvZZgz+8rP
	HUa6xHcvjWJiii5la1X5Zxk7x/Q==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--6.787900-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-snts-smtp: 4C3FC59DB10D8A9E35C1569EDD467391D4C3B4065E1AAB9E488F7CCA55FFE3CF2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_190545_866673_A5695B98 
X-CRM114-Status: GOOD (  29.61  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IElzIGl0IHNhZmUgdG8gY2FsbCBwY2lfZnJlZV9p
cnFfdmVjdG9ycygpIGhlcmUgYW5kIGluIG10a19wY2lfcmVtb3ZlKCkgd2hlbg0KPiB0aGUgZGV2
aWNlIHdhcyBlbmFibGVkIHdpdGggcGNpbV9lbmFibGVfZGV2aWNlKCk/DQo+DQo+IHBjaW1fZW5h
YmxlX2RldmljZSgpIHNldHMgcGRldi0+aXNfbWFuYWdlZC4gQmVjYXVzZSBvZiB0aGF0LA0KPiBw
Y2lfYWxsb2NfaXJxX3ZlY3RvcnMoKSBpbiBtdGtfcGNpX3JlcXVlc3RfaXJxKCkgZ29lcyB0aHJv
dWdoDQo+IHBjaV9zZXR1cF9tc2lfY29udGV4dCgpLT5wY2ltX3NldHVwX21zaV9yZWxlYXNlKCks
IHdoaWNoIHJlZ2lzdGVycw0KPiBwY2ltX21zaV9yZWxlYXNlKCkgYXMgYSBkZXZyZXMgYWN0aW9u
Lg0KPg0KPiBUaGUga2VybmVsLWRvYyBvZiBwY2lfZnJlZV9pcnFfdmVjdG9ycygpIGluIGRyaXZl
cnMvcGNpL21zaS9hcGkuYyBzYXlzOg0KPg0KPiAgKiBXQVJOSU5HOiBEbyBub3QgY2FsbCB0aGlz
IGZ1bmN0aW9uIGlmIHRoZSBkZXZpY2UgaGFzIGJlZW4gZW5hYmxlZA0KPiAgKiB3aXRoIHBjaW1f
ZW5hYmxlX2RldmljZSgpLiBJbiB0aGF0IGNhc2UsIElSUSB2ZWN0b3JzIGFyZSBhdXRvbWF0aWNh
bGx5DQo+ICAqIG1hbmFnZWQgdmlhIHBjaW1fbXNpX3JlbGVhc2UoKSBhbmQgY2FsbGluZyBwY2lf
ZnJlZV9pcnFfdmVjdG9ycygpIGNhbg0KPiAgKiBsZWFkIHRvIGRvdWJsZS1mcmVlIGlzc3Vlcy4N
Cj4NCj4gQWZ0ZXIgYSBmYWlsZWQgcHJvYmUsIG9yIG9uY2UgbXRrX3BjaV9yZW1vdmUoKSByZXR1
cm5zLCBkZXZyZXMgY2FsbHMNCj4gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKSBhIHNlY29uZCB0aW1l
LiBUb2RheSB0aGF0IGRvZXMgbm90aGluZywgYmVjYXVzZQ0KPiBwY2lfZGlzYWJsZV9tc2l4KCkg
cmV0dXJucyBlYXJseSB3aGVuICFkZXYtPm1zaXhfZW5hYmxlZC4gVGhlIFRPRE8gaW4NCj4gZHJp
dmVycy9wY2kvbXNpL21zaS5jIHNheXMgdGhpcyBpbXBsaWNpdCBtYW5hZ2VkIGJlaGF2aW91ciBp
cyBnb2luZyB0bw0KPiBjaGFuZ2UsIHRob3VnaCwgc28gdGhlIGRyaXZlciB3b3VsZCB0aGVuIGJl
IHJlbHlpbmcgb24gYW4gaWRlbXBvdGVuY2UgdGhhdA0KPiBtYXkgZ28gYXdheS4NCj4NCj4gVGhp
cyBpcyBzdGlsbCB0aGUgc2FtZSBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuDQoNCk5vIGNoYW5n
ZS4gIFRoZSB2ZWN0b3JzIGhhdmUgdG8gYmUgZnJlZWQgYWZ0ZXIgbXRrX21oY2NpZl9leGl0KCkg
YW5kDQpiZWZvcmUgdGhlIHJlc2V0LCBhbmQgZGV2cmVzIG9ubHkgcnVucyBvbmNlIHJlbW92ZSgp
IGhhcyByZXR1cm5lZCwgdGhhdA0KaXMgYWZ0ZXIgdGhlIHJlc2V0IGFuZCBhZnRlciBwY2lfcmVz
dG9yZV9zdGF0ZSgpOyBvbiB0aGUga2V4ZWMgc2h1dGRvd24NCnBhdGggaXQgZG9lcyBub3QgcnVu
IGF0IGFsbC4gIFRoZSBsYXRlciBwY2ltX21zaV9yZWxlYXNlKCkgZmluZHMNCm1zaXhfZW5hYmxl
ZCBjbGVhciBhbmQgcmV0dXJucywgYW5kIGlmIHRoZSBpbXBsaWNpdCBtYW5hZ2VkIGJlaGF2aW91
ciBpcw0KcmVtb3ZlZCwgYXMgdGhlIFRPRE8gc2F5cywgdGhlIGV4cGxpY2l0IGNhbGwgaXMgd2hh
dCByZW1haW5zLCBzbyBub3RoaW5nDQpoZXJlIGRlcGVuZHMgb24gaXQuICB0N3h4IGVuYWJsZXMg
d2l0aCBwY2ltX2VuYWJsZV9kZXZpY2UoKSBhbmQgZnJlZXMNCml0cyB2ZWN0b3JzIHRoZSBzYW1l
IHdheS4NCg0KPiBDb3VsZCBwY2llaHAgdHJlYXQgdGhpcyByZXNldCBhcyBhIHN1cnByaXNlIHJl
bW92YWwgb2YgdGhlIG1vZGVtPw0KPg0KPiBNUlNULl9SU1QgaW4gbXRrX3BjaV9wbGRyKCkgaXMg
YSBwbGF0Zm9ybSByZXNldCB0aGF0IGRyb3BzIGFuZCByZXRyYWlucyB0aGUNCj4gbGluay4gVGhl
IE1IQ0NJRiBERVZfRVZUX0gyRF9ERVZJQ0VfUkVTRVQgZmFsbGJhY2sgYmVsb3cgbWF5IGRyb3Ag
dGhlIGxpbmsNCj4gdG9vLCBkZXBlbmRpbmcgb24gdGhlIGZpcm13YXJlLg0KPg0KPiBOZWl0aGVy
IHBhdGggaXMgd3JhcHBlZCBpbiBwY2lfaHBfaWdub3JlX2xpbmtfY2hhbmdlKCkgYW5kDQo+IHBj
aV9ocF91bmlnbm9yZV9saW5rX2NoYW5nZSgpIG9uIHBkZXYtPmJ1cy0+c2VsZi4gVGhlaXIga2Vy
bmVsLWRvYyBjb3ZlcnMNCj4gdGhpcyBjYXNlOg0KPg0KPiAgKiBNYXJrIHRoZSBiZWdpbm5pbmcg
b2YgYSBjb2RlIHNlY3Rpb24gY2F1c2luZyBzcHVyaW91cyBsaW5rIGNoYW5nZXMgb24gdGhlDQo+
ICAqIFNlY29uZGFyeSBCdXMgb2YgQHBkZXYsIGUuZy4gYXMgYSBzaWRlIGVmZmVjdCBvZiBhIFNl
Y29uZGFyeSBCdXMgUmVzZXQsDQo+ICAqIEQzY29sZCB0cmFuc2l0aW9uLCBmaXJtd2FyZSB1cGRh
dGUgb3IgRlBHQSByZWNvbmZpZ3VyYXRpb24uDQo+ICAuLi4NCj4gICogTXVzdCBiZSBwYWlyZWQg
d2l0aCBwY2lfaHBfdW5pZ25vcmVfbGlua19jaGFuZ2UoKS4gIE1heSBiZSBjYWxsZWQgYm90aA0K
PiAgKiBmcm9tIHRoZSBQQ0kgY29yZSBhbmQgZnJvbSBFbmRwb2ludCBkcml2ZXJzLg0KPg0KPiBw
Y2llaHBfaXN0KCkgaWdub3JlcyB0aGUgbGluayBldmVudHMgb25seSB3aGVuIHRoYXQgYnJhY2tl
dCBpcyBzZXQ6DQo+DQo+IGRyaXZlcnMvcGNpL2hvdHBsdWcvcGNpZWhwX2hwYy5jOnBjaWVocF9p
c3QoKSB7DQo+ICAgICAuLi4NCj4gICAgICAgICBpZiAoKGV2ZW50cyAmIChQQ0lfRVhQX1NMVFNU
QV9QREMgfCBQQ0lfRVhQX1NMVFNUQV9ETExTQykpICYmDQo+ICAgICAgICAgICAgIChwY2lfZHBj
X3JlY292ZXJlZChwZGV2KSB8fCBwY2lfaHBfc3B1cmlvdXNfbGlua19jaGFuZ2UocGRldikpICYm
DQo+ICAgICAgICAgICAgIGN0cmwtPnN0YXRlID09IE9OX1NUQVRFKSB7DQo+ICAgICAuLi4NCj4g
fQ0KPg0KPiBXaXRob3V0IHRoZSBicmFja2V0LCBvbiBhIGhvdHBsdWctY2FwYWJsZSB1cHN0cmVh
bSBwb3J0LA0KPiBwY2llaHBfaGFuZGxlX3ByZXNlbmNlX29yX2xpbmtfY2hhbmdlKCkgd291bGQg
ZGlzYWJsZSB0aGUgc2xvdCwgbWFyayB0aGUNCj4gZGV2aWNlIGRpc2Nvbm5lY3RlZCBhbmQgcmUt
ZW51bWVyYXRlIGl0Lg0KPg0KPiBPbmNlIHRoZSBkZXZpY2UgaXMgbWFya2VkIGRpc2Nvbm5lY3Rl
ZCwgcGNpX2RldmljZV9pc19wcmVzZW50KCkgcmV0dXJucw0KPiBmYWxzZS4gVGhlIDUwIHggMjAg
bXMgcG9sbCBvbiBtdGtfcGNpX2xpbmtfY2hlY2soKSB0aGVuIHJ1bnMgdG8gdGhlIGVuZCBhbmQN
Cj4gdGhlICJkZXZpY2Ugbm90IGJhY2siIHdhcm5pbmcgZmlyZXMuIHBjaV9yZXN0b3JlX3N0YXRl
KCkgaXMgdGhlbiBzZW50IHRvIGENCj4gZGV2aWNlIHRoZSBjb3JlIGhhcyBhbHJlYWR5IGdpdmVu
IHVwIG9uLg0KPg0KPiBUaGUgY29yZSdzIG93biBwY2llaHBfcmVzZXRfc2xvdCgpIGJyYWNrZXRz
IGl0cyBsaW5rLWRyb3BwaW5nIGJ1cyByZXNldCB3aXRoDQo+IHRoZXNlIGhlbHBlcnMuIFdvdWxk
IGl0IG1ha2Ugc2Vuc2UgdG8gZG8gdGhlIHNhbWUgYXJvdW5kIGJvdGggcmVzZXQgcGF0aHMNCj4g
aGVyZT8gbXRrX3BjaV9zaHV0ZG93bigpIHJ1bnMgdGhpcyBzYW1lIGNvZGUgZHVyaW5nIGEga2V4
ZWMgcmVib290Lg0KPg0KPiBUaGlzIGlzIHN0aWxsIHRoZSBzYW1lIGF0IHRoZSBlbmQgb2YgdGhl
IHNlcmllcy4NCg0KTm8gY2hhbmdlIGZvciB0aGUgYnJhY2tldCBpbiB0aGlzIHNlcmllczogcGNp
X2hwX2lnbm9yZV9saW5rX2NoYW5nZSgpDQphbmQgcGNpX2hwX3VuaWdub3JlX2xpbmtfY2hhbmdl
KCkgYXJlIG5vdCBleHBvcnRlZCB0byBtb2R1bGVzLCBhbmQgdGhpcw0KZHJpdmVyIGNhbiBiZSBi
dWlsdCBhcyBvbmUuICBUaGVpciBvbmx5IGNhbGxlciBpcyBwY2llaHBfcmVzZXRfc2xvdCgpOw0K
cGNpX2Rldl9hY3BpX3Jlc2V0KCkgYW5kIHRoZSBNUlNULl9SU1QgcmVzZXQgaW4gdDd4eCBhcmUg
bm90IGJyYWNrZXRlZA0KZWl0aGVyLiAgT24gYSBob3RwbHVnLWNhcGFibGUgcG9ydCB0aGUgcmVz
dWx0IGlzIHdoYXQgeW91IGRlc2NyaWJlOiB0aGUNCnBvbGwgcnVucyBvdXQsIHRoZSB3YXJuaW5n
IGlzIHByaW50ZWQsIGFuZCBwY2llaHAgcmVtb3ZlcyBhbmQNCnJlLWVudW1lcmF0ZXMgdGhlIG1v
ZGVtLCB3aGljaCBsZWF2ZXMgaXQgd2l0aCB2YWxpZCBjb25maWcgc3BhY2UuICBJDQp3aWxsIHN0
YXRlIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBhbmQgYWRkIHRoZSBicmFja2V0IG9uY2Ug
dGhlDQpoZWxwZXJzIGNhbiBiZSBjYWxsZWQgZnJvbSBhIG1vZHVsZS4NCg0KV2lsbCBmaXggaW4g
djEzIHRoZSBrZXhlYyBjYXNlIHRoYXQgZm9sbG93cyBmcm9tIGl0OiB0aGVyZSBwY2llaHAgY2Fu
DQp1bmJpbmQgdGhlIGRldmljZSBhZnRlciAuc2h1dGRvd24gaGFzIGFscmVhZHkgcnVuIHRoZSB0
ZWFyZG93biwgc28NCm10a19wY2lfZGV2X2V4aXQoKSB3aWxsIHJldHVybiBlYXJseSB3aGVuIGl0
IGhhcyBhbHJlYWR5IHJ1bi4NCg0KVGhhbmtzLA0KSmFjaw0KDQpwdy1ib3Q6IGNy

