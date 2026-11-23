Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901B606A695
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 03:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2i2scBmZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6PdVs+GTQn7T4rIWIV+ARrJ8Rf1qul+r5kOPlnMXH0Q=; b=2i2scBmZl/7ekc0FB2Gs3kOp7U
	ps6goMZ+enAxe1UrHkAXL9jb1gtim8GrSTrjWEUk4OhXSJAzn9XXwQwcFvgoJV/a8O/NB3QutUGvo
	SBGqvXqZXchPVdtewqs9jUo/2WzZEPcCNMy0puhTY03o++4Au6zqkpzBS51R2unR1AVy52+4D0tq4
	rcCRQ8M6lbTE1VsIne+ik+LgswjqSxPFHyV92K4wRnpnAiXNgguOCYFZajU1HA3nwm0odlTJxa1Nn
	m+NCaFWV+iYp5wJDpRk6uhNsyp3kYChcfHzhviS5oSS4bk+CkkUetayVI+q7AVOZs1zFeFEyzSYJX
	mNY05cyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKOM-00000002AQC-32HE;
	Mon, 23 Nov 2026 03:06:54 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKOA-00000002AO7-47VE;
	Mon, 23 Nov 2026 03:06:50 +0000
X-UUID: e5315358e6ea11f1a87c2323a98e90a4-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:d5bdf2e0-a4d7-4e6f-88a1-d1f1a2e1d39f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:2ee7a766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e5315358e6ea11f1a87c2323a98e90a4-20261123
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 326384927; Mon, 23 Nov 2026 11:06:36 +0800
X-UUID: e276a208e6ea11f1907ca11d1ee29896-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:c970bef3-f47f-40ae-9bf3-03f82b32fc14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:cdf169bf-d29a-4186-997b-c51a4a814dc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e276a208e6ea11f1907ca11d1ee29896-20261123
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 466575618; Mon, 23 Nov 2026 11:06:32 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.43;
 Mon, 23 Nov 2026 11:06:30 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 11:06:30 +0800
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
Subject: Re: [PATCH net-next v12 3/6] net: wwan: t9xx: Add control DMA
 interface
Thread-Topic: [PATCH net-next v12 3/6] net: wwan: t9xx: Add control DMA
 interface
Thread-Index: AQHdevejkSkxAmr79ECYb5wpTv6Xuw==
Date: Mon, 23 Nov 2026 03:06:30 +0000
Message-ID: <da70577bea0f4a53bcc1482b1d0f82de@compal.com>
References: <20261117-t9xx_driver_v1-v12-3-e181b616b820@compal.com>,<179526494702.3135.6051033006782624225@kernel.org>
In-Reply-To: <179526494702.3135.6051033006782624225@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-as-result: No-10--31.646300-8.000000
x-tmase-matchedrid: nqfzPBP+Cfouv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EsdzeBfTA9wL9lU5yaPL2YZxIbLgmA75NnRTJpY7VAKcvnJK5AAeZkG1lNol0kUC8sNG
	beSbzWLn97B296ZWAlFWyUI1UQFMgD9ELvTFuUH7IUNmTDb0ad4DtxFnjyQIcS3PLJOcIhnWSIn
	AVM0EbMu08fPl0dw8siinama/z13/Ss+HwpsYJvwIXDe2zrK2C08FDvDD3d4yL12p7cZqBWLk62
	3rg79Xmkny09sKGkNMDMgKbmV44CEn81ohIL+gY+mtDRLyNCFpQKm83vawLhJt/5t6EzciJAUGa
	xRqZ8do9O4pCvhWGDR/kjSIcHjt3cdHONxLgQ1RJF1UGj9ejeeloX2DGGi+r+fxC9QBvm1iaSjm
	O++bbLXBXPG5NKXpaC3/LJ1PTmt+M7K2js6vuiJtnlFv6A7ohRXCUrhCu5WPGhmdxjnivFqMQQH
	yNC14BzPfm3fNtqgLwLM9rYknet4TOkBPw4d55EUw76ALZYKlrUDg+xHHoIfsFqaKfjkncdVjjR
	0+/MJ9rRcHITIaJZMvweDHNA/jpDqFGvqQ4pHd5JTDogbV4hJplSCvHsMVhb5QQqyvKRkBTvhet
	Hoy/kbYkVH6D/ZDeBVdU5Ce+V4b62zKhP8wHQve+18RAuG2TR3YtSWZ2aUYSCDdzAMeX/U7zkly
	hPTD9YIyQM4JfnWklTScbe2l74JsI6K9TYesLmhSzMRC1G9k=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--31.646300-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-snts-smtp: 2C7A3E3EB80EC2B458A17A64CE8ED0E67DC95A9F4A736FF6F3739037C2A58DB12000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_190646_255195_165E4ABB 
X-CRM114-Status: GOOD (  34.20  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IFdoYXQgYnJpbmdzIHRoaXMgUlggcXVldWUgYmFj
ayB3aGVuIG10a19jbGRtYV9jaGVja19yeF9yZXEoKSByZXR1cm5zDQo+IC1FTlhJTyBhbmQgbmVl
ZF9yZXN0YXJ0IGlzIGNsZWFyPw0KPg0KPiBtdGtfY2xkbWFfY2hlY2tfcnhfcmVxKCkgdHJlYXRz
IGEgemVybyBTT19DVVJfQUREUiBhcyBsb3N0IHN0YXRlOg0KPg0KPiAgICAgY3Vycl9hZGRyID0g
bXRrX2NsZG1hX2dldF9yeF9jdXJyX2FkZHIoZHJ2X2luZm8sIHJ4cS0+cnhxbm8pOw0KPiAgICAg
aWYgKHVubGlrZWx5KCFjdXJyX2FkZHIpKQ0KPiAgICAgICAgIHJldHVybiAtRU5YSU87DQo+DQo+
IFRoZSBjb21tZW50IGluIG10a19jbGRtYV9kcnZfaW5pdCgpIGFsc28gc2F5cyB0aGUgZGV2aWNl
ICJjYW4gbG9zZSBpdHMNCj4gcXVldWUgc3RhdGUsIHdoaWNoIGxlYXZlcyB6ZXJvIGFkZHJlc3Nl
cyIuDQo+DQo+IEluIHRoYXQgY2FzZSB0aGlzIHdvcmtlciBza2lwcyB0aGUgcmVzdW1lIGFuZCBn
b2VzIHRvIG91dC4gVGhhdCBwYXRoDQo+IHVubWFza3MgWEZFUl9ET05FIGFuZCByZXR1cm5zLiBJ
dCBkb2VzIG5vdCBzZXQgbmVlZF9yZXN0YXJ0LCByZXN0YXJ0DQo+IHRoZSBxdWV1ZSBvciBzY2hl
ZHVsZSBhbnkgcmVjb3ZlcnkuDQo+DQo+IEFuIFJYIGVuZ2luZSB3aXRoIG5vIGFkZHJlc3Mgc2hv
dWxkIG5vdCByYWlzZSBhbm90aGVyIFhGRVJfRE9ORSwgc28NCj4gbm90aGluZyByZXJ1bnMgdGhp
cyB3b3JrZXIuIFRoZSBvbmx5IGxvc3Qtc3RhdGUgcmVjb3ZlcnkgaXMgaW4gdGhlIFRYDQo+IHN1
Ym1pdCBwYXRoOg0KPg0KPiAgICAgbXRrX2NsZG1hX3N0YXJ0X3hmZXIoKQ0KPiAgICAgICAgIGlm
ICh1bmxpa2VseSghdmFsKSkNCj4gICAgICAgICAgICAgbXRrX2NsZG1hX2h3X3JlY292ZXJ5KCkN
Cj4NCj4gQ291bGQgUlggb24gdGhpcyBDTERNQSBpbnN0YW5jZSBzdGF5IHN0dWNrIHVudGlsIHRo
ZSBob3N0IGhhcHBlbnMgdG8NCj4gc3VibWl0IGEgVFggb24gdGhlIHNhbWUgaW5zdGFuY2U/IE9u
IENMRE1BMCAodGhlIFNBUCBjb250cm9sIGNoYW5uZWwpLA0KPiBob3N0IFRYIG1heSBiZSByYXJl
IGFmdGVyIHRoZSBoYW5kc2hha2UuIFVuc29saWNpdGVkIGRldmljZS10by1ob3N0DQo+IGNvbnRy
b2wgbWVzc2FnZXMgY291bGQgdGhlbiBzaXQgdGhlcmUgaW5kZWZpbml0ZWx5Lg0KPg0KPiBUaGlz
IGRlcGVuZHMgb24gU09fQ1VSX0FERFIgcmVhZGluZyAwIGFmdGVyIHRoZSBzdGF0ZSBpcyBsb3N0
LCB3aGljaA0KPiB0aGUgZHJpdmVyJ3Mgb3duIGNvbW1lbnRzIHNheSBjYW4gaGFwcGVuLg0KDQpU
aGUgY29kZSBpcyByaWdodCBoZXJlLCBidXQgdGhlIGNvbW1lbnQgaW4gbXRrX2NsZG1hX2Rydl9p
bml0KCkgaXMNCndyb25nOiBpdCBzYXlzIHRoZSBkZXZpY2UgY2FuIGxvc2UgaXRzIHF1ZXVlIHN0
YXRlLCB3aGljaCBzdWdnZXN0cyBhbiBSWA0KcXVldWUgY2FuIGxvc2UgaXRzIGFkZHJlc3Mgb24g
aXRzIG93bi4gIHYxMyByZXdvcmRzIGl0IHRvIHNheSB3aGF0DQphY3R1YWxseSBoYXBwZW5zOiBh
IFRYIHN0YXJ0IGFkZHJlc3MgcmVhZHMgemVybyBhZnRlciB0aGUgZGV2aWNlIGhhcw0KcG93ZXJl
ZCB0aGUgYmxvY2sgZG93bi4NCg0KSW4gdGhpcyBzZXJpZXMgYSB6ZXJvIFNPX0NVUl9BRERSIHdp
dGggbmVlZF9yZXN0YXJ0IGNsZWFyIG1lYW5zIHRoZSBsaW5rDQppcyBkZWFkOiBldmVyeSBob3N0
LXNpZGUgcmVzZXQgc2V0cyBuZWVkX3Jlc3RhcnQgdW5kZXIgcmVhcm1fbG9jayBiZWZvcmUNCnRo
aXMgd29ya2VyIGNhbiB0YWtlIHRoYXQgbG9jay4gIHQ3eHggZGV0ZWN0cyBsb3N0IHN0YXRlIG9u
IFRYDQpzdWJtaXNzaW9uIG9ubHksIGluIHRoZSBzYW1lIHdheS4NCg0KPiBDYW4gcmVxLT5za2Ig
YmUgTlVMTCB3aGVuIHRoaXMgbG9vcCByZWFjaGVzIG10a19jbGRtYV9yeF9za2JfYWRqdXN0KCk/
DQo+DQo+IEluIG10a19jbGRtYV9yeF9kb25lX3dvcmsoKSwgaWYgYm90aCB0aGUgcmVsb2FkIGFu
ZCB0aGUgcmVjeWNsZQ0KPiBkbWFfbWFwX3NpbmdsZSgpIGZhaWwsIHRoZSBzbG90IGlzIGxlZnQg
ZW1wdHk6DQo+DQo+ICAgICBkZXZfa2ZyZWVfc2tiX2FueShyeF9za2IpOw0KPiAgICAgcmVxLT5z
a2IgPSBOVUxMOw0KPiAgICAgcmVxLT5kYXRhX2RtYV9hZGRyID0gMDsNCj4gICAgIGdvdG8gb3V0
X3JldHJ5Ow0KPg0KPiBUaGUgbGVhZGluZyByZWZpbGwgZm9yIGFuIGVtcHR5IHNsb3QgKHRoZSAh
cmVxLT5za2IgYnJhbmNoKSBjYW4gYWxzbw0KPiBmYWlsIGFuZCBqdW1wIHRvIG91dF9yZXRyeS4g
VGhlIGNhbmNlbF93b3JrX3N5bmMoKSBlYXJsaWVyIGluDQo+IG10a19jbGRtYV9yeHFfZnJlZSgp
IGNhbiB0aGVuIGNhbmNlbCB0aGUgcmVxdWV1ZWQgcmV0cnkgYmVmb3JlIHRoZQ0KPiBzbG90IGlz
IHJlZmlsbGVkLg0KPg0KPiBtdGtfY2xkbWFfcnhfc2tiX2FkanVzdCgpIGRlcmVmZXJlbmNlcyBy
ZXEtPnNrYiB1bmNvbmRpdGlvbmFsbHk6DQo+DQo+ICAgICByZXEtPnNrYi0+bGVuID0gMDsNCj4g
ICAgIHNrYl9yZXNldF90YWlsX3BvaW50ZXIocmVxLT5za2IpOw0KPiAgICAgc2tiX3B1dChyZXEt
PnNrYiwgcmVjdl9sZW4pOw0KPg0KPiBtdGtfY2xkbWFfcnhfc2tiX2FkanVzdCgpIGFscmVhZHkg
emVyb2VkIGRhdGFfcmVjdl9sZW4gZm9yIHRoYXQgc2xvdC4NCj4gVG8gZ2V0IGhlcmUsIHRoZSBk
ZXZpY2Ugd291bGQgaGF2ZSB0byB3cml0ZSBhIG5vbi16ZXJvIGRhdGFfcmVjdl9sZW4NCj4gaW50
byBhIEdQRCB3aXRoIEhXTyBjbGVhciwgd2hpY2ggaXQgZG9lcyBub3Qgb3duLiBUaGUgZHJpdmVy
IGFscmVhZHkNCj4gdHJlYXRzIGRhdGFfcmVjdl9sZW4gYXMgZGV2aWNlLWNvbnRyb2xsZWQgYW5k
IGNsYW1wcyBpdCBhZ2FpbnN0IG10dS4NCj4NCj4gSWYgdGhhdCBoYXBwZW5zLCB3b3VsZCBjbG9z
aW5nIHRoZSBjaGFubmVsIG9vcHMgb24gYSBOVUxMIHNrYj8gV291bGQgYQ0KPiByZXEtPnNrYiBj
aGVjayBoZXJlLCBsaWtlIHRoZSBvbmUgYXQgdGhlIHRvcCBvZiB0aGUgbG9vcCBpbg0KPiBtdGtf
Y2xkbWFfcnhfZG9uZV93b3JrKCksIGJlIGVub3VnaD8NCg0KV2lsbCBmaXggaW4gdjEzOiB0aGUg
ZHJhaW4gbG9vcCBpbiBtdGtfY2xkbWFfcnhxX2ZyZWUoKSBjaGVja3MgcmVxLT5za2INCmZpcnN0
LCBhcyB0aGUgbG9vcCBpbiBtdGtfY2xkbWFfcnhfZG9uZV93b3JrKCkgZG9lcy4gIEEgd2VsbC1i
ZWhhdmVkDQpkZXZpY2UgY2Fubm90IGdldCB0aGVyZSwgc2luY2UgdGhlIGhvc3QgemVyb2VzIGRh
dGFfcmVjdl9sZW4gd2hlbiBpdA0KcmVhcHMgdGhlIHNsb3QgYW5kIHRoZSBkZXZpY2Ugc3RvcHMg
YXQgdGhlIHVuYXJtZWQgZGVzY3JpcHRvciBiZWZvcmUgaXQsDQpidXQgdGhlIGZpZWxkIGlzIGRl
dmljZS13cml0YWJsZS4NCg0KPiBJcyBpdCBzYWZlIHRvIHJlLWFybSB0aGUgd2hvbGUgaW5zdGFu
Y2UgaGVyZSB3aXRob3V0IGEgc3RvcCBvciBhDQo+IG10a19jbGRtYV9kcnZfcmVzZXQoKSBmaXJz
dD8NCj4NCj4gbXRrX2NsZG1hX3R4cV9mcmVlKCkgYW5kIG10a19jbGRtYV9yeHFfZnJlZSgpIGJv
dGggcmVzZXQgdGhlIElQIGJlZm9yZQ0KPiB0aGV5IGNhbGwgbXRrX2NsZG1hX3JlYXJtX3F1ZXVl
cygpLiBIZXJlLCB0aGUgb25seSBldmlkZW5jZSBpcyB0aGF0DQo+IG9uZSBUWCBxdWV1ZSdzIFVM
IHN0YXJ0IGFkZHJlc3MgcmVhZCBiYWNrIGFzIHplcm8uDQo+DQo+IG10a19jbGRtYV9yZWFybV9x
dWV1ZXMoKSB0aGVuIGRvZXMgdGhyZWUgdGhpbmdzOg0KPg0KPiAgIC0gbXRrX2NsZG1hX2Rydl9p
bml0KCkgcmVhZC1tb2RpZnktd3JpdGVzIFVMX0NGRyBhbmQgU09fQ0ZHICh0aGUgR1BEDQo+ICAg
ICBmb3JtYXQgYml0cykgYW5kIG90aGVyIElQLWdsb2JhbCByZWdpc3RlcnMuDQo+DQo+ICAgLSBP
biBldmVyeSBwdWJsaXNoZWQgVFggcXVldWUgd2l0aCB0eF9zdGFydGVkIHNldCwgaXQgcmVwcm9n
cmFtcyB0aGUNCj4gICAgIHN0YXJ0IGFkZHJlc3MgYW5kIGlzc3VlcyBVTF9TVEFSVC4NCj4NCj4g
ICAtIE9uIGV2ZXJ5IHB1Ymxpc2hlZCBSWCBxdWV1ZSwgaXQgc2V0cyBuZWVkX3Jlc3RhcnQsIHNv
DQo+ICAgICBtdGtfY2xkbWFfcnhfZG9uZV93b3JrKCkgbGF0ZXIgcmVwcm9ncmFtcyBTT19TVEFS
VF9BRERSIGFuZCBpc3N1ZXMNCj4gICAgIFNPX1NUQVJULg0KPg0KPiBXaGF0IGlmIGEgemVybyBy
ZWFkIG9uIG9uZSBxdWV1ZSBkb2VzIG5vdCBtZWFuIHRoZSB3aG9sZSBpbnN0YW5jZSB3YXMNCj4g
cmVzZXQ/IFNpYmxpbmcgVFggYW5kIFJYIGVuZ2luZXMgY291bGQgc3RpbGwgYmUgcnVubmluZyB3
aGVuIHRoZXkgZ2V0DQo+IHRoZXNlIENGRyB3cml0ZXMgYW5kIFNUQVJUIGNvbW1hbmRzLg0KPg0K
PiBPbiBUWCwgYSBTVEFSVCBhdCB0aGUgR1BEIGN1cnJlbnRseSBiZWluZyBzZW50IGNvdWxkIHJl
c2VuZCBvciBjdXQNCj4gdGhhdCBjb250cm9sIG1lc3NhZ2UuIE9uIFJYLCBhIHJlc3RhcnQgY291
bGQgbG9zZSBvciBjb3JydXB0IHRoZSBmcmFtZQ0KPiBiZWluZyB3cml0dGVuLg0KPg0KPiBJZiB0
aGUgaGFyZHdhcmUgb25seSByZWFkcyB6ZXJvIGFmdGVyIGEgZnVsbCBJUCByZXNldCwgdGhlIG90
aGVyDQo+IGVuZ2luZXMgYXJlIGFscmVhZHkgaWRsZSBhbmQgdGhpcyBkb2VzIG5vdCBhcHBseS4g
Rm9yIGNvbXBhcmlzb24sIHRoZQ0KPiB0N3h4IGRyaXZlciByZS1pbml0aWFsaXplcyBpbiBhIHNp
bWlsYXIgd2F5IHdpdGhvdXQgYSBzdG9wLCBidXQgb25seQ0KPiByZXByb2dyYW1zIHRoZSBhZmZl
Y3RlZCBxdWV1ZS4NCg0KTm8gZnVuY3Rpb25hbCBjaGFuZ2U7IHRoZSBjb21tZW50IGFib3ZlIG10
a19jbGRtYV9od19yZWNvdmVyeSgpIHdpbGwgc2F5DQp3aGF0IGEgemVybyBzdGFydCBhZGRyZXNz
IG1lYW5zLg0KDQpUaGUgaG9zdCBuZXZlciBsZWF2ZXMgYSBwdWJsaXNoZWQgVFggcXVldWUgd2l0
aG91dCBhIHN0YXJ0IGFkZHJlc3MsIHNvIGENCnplcm8gaXMgcmVhZCBvbmx5IGFmdGVyIHRoZSBk
ZXZpY2UgaGFzIHBvd2VyZWQgdGhlIGJsb2NrIGRvd24uICBUaGF0DQpjbGVhcnMgdGhlIGNvbmZp
Z3VyYXRpb24gYW5kIHRoZSBzdGFydCBhZGRyZXNzZXMgb2YgYWxsIGl0cyBUWCBxdWV1ZXMNCnRv
Z2V0aGVyIGFuZCBsZWF2ZXMgbm8gVFggZW5naW5lIHJ1bm5pbmcuICBSZS1hcm1pbmcgb25seSB0
aGUgYWZmZWN0ZWQNCnF1ZXVlLCBhcyB0N3h4IGRvZXMsIHdvdWxkIGxlYXZlIHRoZSBkZXNjcmlw
dG9ycyBhbHJlYWR5IHN1Ym1pdHRlZCBvbg0KdGhlIG90aGVyIHF1ZXVlcyB3YWl0aW5nIGZvciB0
aGVpciBuZXh0IHN1Ym1pc3Npb24uICBBbiBSWCBxdWV1ZSBpcw0KcmVzdGFydGVkIGZyb20gaXRz
IG93biB3b3JrZXIsIHdoaWNoIHN0b3BzIGl0IGZpcnN0IGxhdGVyIGluIHRoZSBzZXJpZXMuDQoN
Cj4gVFJCX0NNRF9TVE9QIGFuZCBUUkJfQ01EX1JFQ09WRVIgYXJlIGFkZGVkIHRvIGVudW0gbXRr
X3RyYl9jbWRfdHlwZSBpbg0KPiBtdGtfY3RybF9wbGFuZS5oLCBidXQgbm90aGluZyBpbXBsZW1l
bnRzIHRoZW0uIFRoZSBjb21taXQgbWVzc2FnZSBkb2VzDQo+IG5vdCBtZW50aW9uIHRoZW0gZWl0
aGVyLg0KPg0KPiBIZXJlIHRoZXkgY29tcGxldGUgaW1tZWRpYXRlbHkgYW5kIG5ldmVyIHNldCB0
cmItPnN0YXR1cy4gVGhleSBhbHNvDQo+IHNraXAgdGhlIHRyYW5zLT5hdmFpbGFibGUgY2hlY2sg
YW5kIHN1Ym1pdF9sb2NrLg0KPiBtdGtfY2xkbWFfdHJiX3Byb2Nlc3MoKSByZWplY3RzIHRoZW0g
aW4gYW55IGNhc2U6DQo+DQo+ICAgICBpZiAoISh0cmItPmNtZCA+IFRSQl9DTURfTUlOICYmIHRy
Yi0+Y21kIDwgVFJCX0NNRF9TVE9QKSkNCj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4NCj4g
QSBjYWxsZXIgdHJ5aW5nIHRvIHN0b3Agb3IgcmVjb3ZlciBhIHF1ZXVlIHdvdWxkIGdldCBhIHN1
Y2Nlc3NmdWwNCj4gY29tcGxldGlvbiwgd2l0aCB3aGF0ZXZlciBzdGF0dXMgd2FzIGxlZnQgaW4g
c2tiLT5jYiwgd2hpbGUgdGhlIHF1ZXVlDQo+IGtlZXBzIHJ1bm5pbmcuDQo+DQo+IE5vIGNhbGxl
ciBpbiB0aGUgc2VyaWVzIGlzc3VlcyB0aGVzZSBjb21tYW5kcyB5ZXQuIENvdWxkIHRoZXkgYmUN
Cj4gZHJvcHBlZCwgb3IgcmVqZWN0ZWQgd2l0aCBzb21ldGhpbmcgbGlrZSAtRU9QTk9UU1VQUCB1
bnRpbCB0aGV5IGFyZQ0KPiBpbXBsZW1lbnRlZD8NCg0KV2lsbCBmaXggaW4gdjEzOiBUUkJfQ01E
X1NUT1AgYW5kIFRSQl9DTURfUkVDT1ZFUiBhcmUgcmVtb3ZlZCwgdG9nZXRoZXINCndpdGggdGhl
IGVhcmx5IGNvbXBsZXRpb24gaW4gbXRrX3BjaWVfaGlmX3N1Ym1pdF9za2IoKS4gTm90aGluZyBp
biB0aGUNCnNlcmllcyBpc3N1ZXMgdGhlbS4NCg0KVGhhbmtzLA0KSmFjaw0KDQpwdy1ib3Q6IGNy

