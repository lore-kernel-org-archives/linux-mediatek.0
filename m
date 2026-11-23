Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D6E606A6AA
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wneCOK9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SsOfB+A2L4oAYTU8RVszrLkzMWRIW22HiilhHgWZid8=; b=2wneCOK9EV8pU8CyRAa4KL07I8
	kuzDu5l/6+m2yIcvMCwR/y0UM0axsrw/O1g3foVk13LE4kdZSpIyU/jCko9hCx5m6O1UB7raNh2Uv
	uUeH6pLIJ9WOfdjn9l7CpoUGM7830oyz0xc6p/A1BjI2s6e+vrcvGhBz6daxVCYHsIQteYmsALOUj
	j+Cmfd7+Ho1zoMBnoInZTZ+NWQTFKJXZfhZPFrMmKnNVC/BYzZwLEEcTVV+CdM3s8Z30H9vyIR1Qu
	NwztZVb0N9jZXz/uTWEJP8Y138Zk+/KTgo64/kQDS3rupxc5DAVOEDnNXpJee6cHFmh1ojPGn8fwv
	3ip5HBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKOw-00000002AW3-19A7;
	Mon, 23 Nov 2026 03:07:30 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKOs-00000002AV6-2QFF;
	Mon, 23 Nov 2026 03:07:28 +0000
X-UUID: fe3b6758e6ea11f1b2470fb4f881575f-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:acd933f6-2628-4f8a-839e-ea1bf839f0c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:016dee19-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe3b6758e6ea11f1b2470fb4f881575f-20261123
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1739619456; Mon, 23 Nov 2026 11:07:18 +0800
X-UUID: fad19c0ee6ea11f1907ca11d1ee29896-20261123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0cf57404-cca4-463a-bbb0-2630d6d14a67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:e9e8a766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fad19c0ee6ea11f1907ca11d1ee29896-20261123
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1556613070; Mon, 23 Nov 2026 11:07:12 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 23 Nov 2026 11:07:11 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 11:07:11 +0800
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
Subject: Re: [PATCH net-next v12 4/6] net: wwan: t9xx: Add control port
Thread-Topic: [PATCH net-next v12 4/6] net: wwan: t9xx: Add control port
Thread-Index: AQHdeve7m7B50+/Aw0aUAqvnatVtlA==
Date: Mon, 23 Nov 2026 03:07:11 +0000
Message-ID: <5ad4346ac47844bca9de6c6344394175@compal.com>
References: <20261117-t9xx_driver_v1-v12-4-e181b616b820@compal.com>,<179526494911.3135.1691599071652469894@kernel.org>
In-Reply-To: <179526494911.3135.1691599071652469894@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-as-result: No-10--21.235800-8.000000
x-tmase-matchedrid: Bh1zlSZn7l8uv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EsdzeBfTA9wL1gdTBaDcdUM9A4BdNBny91tM63VFvEPnAEu0pi7xsS13WG5Zj0joh/dk
	Mnslb4PQe67A3WrjNyziXhSM4AAJNRLn316QYZ0KGavh+mhti3BXe4MXLih6zMaJIE4jcsfqaSj
	mO++bbLfwSSKmZJcboaUH+X3Iw3oH+isiJUFLIeEu+LBodhvWxltO3ZXPfoUU2JdIqmm5YSQfm2
	RpS+ujygsEZqsxgnsPj3uTfpztp/0P6AXOijry5AZiMK6zpatUSS047Imv+B3miaGC762CcspyV
	Sx1Lnv/A8JQX5jkdSTZRY581T5wykKUi4HaZvZw70BtMXRaQwm3w6aWt6b3e1KMHTXl0Cwesj8z
	BmH06fSaI5h63eXtD4iDTS/uhxaV0EfJ9YsMxdQvpq/ti8dx848GqN2zdnsn2KxQD1xQ2y0aRgI
	pOhmCrJ8YILvUqlIvxJq0Dq/zxGaPNPTORGrtKBLWfGuAH4BXTZQrCWYE5yLxFJIykpwqD7KMo5
	XEc17R8oeVn3WCAnjW+PLef066SjHwoPiG9QEsNSuarCnh50PVUZDyWvrKuD5teccobfJUk+VN5
	SeE/CqzSbgI3g0INWjsaYI4lh3X4sfhU+lJX6+9j9/4eIKuSy4offpx2osgG/cHAXeyuhw==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--21.235800-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30338.002
x-tm-snts-smtp: A5D1E0742FD0F47B7BBF79365F18AC53BCEB86E52654CD5DB8CFDC9B2B6587022000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_190727_306509_F7A96F22 
X-CRM114-Status: GOOD (  39.61  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LiANCg0KPiBDYW4gdHdvIFJYIHdvcmtlcnMgdXBkYXRlIHRo
ZSBzYW1lIHBvcnQtPnJ4X3NlcSBhdCB0aGUgc2FtZSB0aW1lIGhlcmU/DQo+DQo+IFRoZSB0YXJn
ZXQgcG9ydCBjb21lcyBmcm9tIHRoZSBjaGFubmVsIGluIHRoZSBDQ0NJIGhlYWRlci4gVGhlIG9u
bHkNCj4gZmlsdGVyIGlzIHRoZSBwZWVyIElELiBUaGUgcXVldWUgdGhhdCBkZWxpdmVyZWQgdGhl
IHBhY2tldCAodGhlIHBvcnQNCj4gcGFzc2VkIGluIGFzIHByaXYsIGkuZS4gcnhxLT5hcmcpIGlz
IG5vdCB1c2VkIGZvciB0aGUgbG9va3VwLg0KPg0KPiBFYWNoIFJYIHF1ZXVlIGhhcyBpdHMgb3du
IHJ4X2RvbmVfd29yay4gbXRrX2NsZG1hX2Rldl9pbml0KCkgY3JlYXRlcw0KPiBkcnZfaW5mby0+
d3EgbGlrZSB0aGlzOg0KPg0KPiAgICAgZmxhZyA9IFdRX1VOQk9VTkQgfCBXUV9NRU1fUkVDTEFJ
TSB8IFdRX0hJR0hQUkk7DQo+ICAgICBkcnZfaW5mby0+d3EgPSBhbGxvY193b3JrcXVldWUoImNs
ZG1hJWRfd29ya3FfJXMiLCBmbGFnLCAwLCBod19pZCwNCj4gIG1kZXYtPmRldl9zdHIpOw0KPg0K
PiBTbyB3b3JrIGl0ZW1zIGZvciBkaWZmZXJlbnQgUlggcXVldWVzIG9mIHRoZSBzYW1lIENMRE1B
IGFyZSBub3Qgb3JkZXJlZC4NCj4gTGF0ZXIgaW4gdGhlIHNlcmllcyBDTERNQTEgc2VydmVzIFJY
USgwKSBmb3IgTURDVFJMLCBSWFEoMikgZm9yIE1CSU0gYW5kDQo+IFJYUSg1KSBmb3IgQVQuDQo+
DQo+IFN1cHBvc2UgdGhlIGRldmljZSBwdXRzIGEgcGFja2V0IHdob3NlIGhlYWRlciBuYW1lcyBj
aGFubmVsIEIgb24gcXVldWUgQSdzDQo+IHJpbmcuIFF1ZXVlIEEncyB3b3JrZXIgdGhlbiBydW5z
IG10a19wb3J0X2NoZWNrX3J4X3NlcSgpLCBkb2VzIHRoZSBwbGFpbg0KPiBzdG9yZSB0byBwb3J0
IEIncyByeF9zZXEsIGFuZCBjYWxscyBwb3J0IEIncyAtPnJlY3YoKS4gUXVldWUgQidzIHdvcmtl
cg0KPiBtYXkgYmUgZG9pbmcgdGhlIHNhbWUgdGhpbmcgYXQgdGhhdCBtb21lbnQuDQo+DQo+IFRo
YXQgc2VlbXMgdG8gY29uZmxpY3Qgd2l0aCB0aGUgY29tbWVudCBpbiBzdHJ1Y3QgbXRrX3BvcnQ6
DQo+DQo+ICAgICByeF9zZXEgb25seSBmcm9tIHRoZSByeF9kb25lDQo+ICAgICBjYWxsYmFjayBv
ZiB0aGUgb25lIHF1ZXVlIHNlcnZpbmcgdGhpcyBjaGFubmVsLg0KPg0KPiBTaG91bGQgZGlzcGF0
Y2ggcmVqZWN0IHBhY2tldHMgd2hvc2UgY2hhbm5lbCBkb2VzIG5vdCBiZWxvbmcgdG8gdGhlDQo+
IGRlbGl2ZXJpbmcgcXVldWU/IE9yIHNob3VsZCByeF9zZXEgYmUgcHJvdGVjdGVkIHNvbWUgb3Ro
ZXIgd2F5Pw0KDQpObyBjb2RlIGNoYW5nZTogdDd4eCBtYXRjaGVzIHBhdGggYW5kIGNoYW5uZWwg
aW4gdGhlIHNhbWUgd2F5LCBib3RoDQotPnJlY3YoKSBwYXRocyB0b2xlcmF0ZSBjb25jdXJyZW50
IGNhbGxzLCBhbmQgcnhfc2VxIG9ubHkgZmVlZHMgYQ0KcmF0ZS1saW1pdGVkIHdhcm5pbmcuICBB
IGNoZWNrIGFnYWluc3QgdGhlIGRlbGl2ZXJpbmcgcXVldWUgd291bGQgZHJvcA0KZnJhbWVzIG9u
IHF1ZXVlcyB0aGF0IHNldmVyYWwgY2hhbm5lbHMgc2hhcmUuICBUaGUgc3RydWN0IG10a19wb3J0
DQpjb21tZW50IHlvdSBxdW90ZSB3aWxsIGJlIHJld29yZGVkIHNvIHRoYXQgaXQgbm8gbG9uZ2Vy
IHJlYWRzIGFzIGEgcnVsZQ0KYWJvdXQgd2hpY2ggcXVldWUgbWF5IHdyaXRlIHJ4X3NlcS4NCg0K
PiBJcyB0aGUgc3RydWN0IG10a19wb3J0IGNvbW1lbnQgcmlnaHQgYWJvdXQgd2hlbiB0aGVzZSBj
b3VudGVycyBhcmUgcmVzZXQ/DQo+DQo+ICAgICBCb3RoIGFyZSByZXNldA0KPiAgICAgd2hpbGUg
dGhlIGNoYW5uZWwgaXMgZGlzYWJsZWQsIHNvIG5laXRoZXIgbmVlZHMgYSBsb2NrLg0KPg0KPiBU
aGUgcmVzZXQgaGFwcGVucyBhdCB0aGUgc3RhcnQgb2YgbXRrX3BvcnRfY2hfZW5hYmxlKCksIGJl
Zm9yZSB0aGUgRU5BQkxFDQo+IHRyYiBpcyBzdWJtaXR0ZWQuIFRoZSBjaGFubmVsIGlzIG5vdCBh
bHdheXMgZGlzYWJsZWQgYXQgdGhhdCBwb2ludC4NCj4NCj4gVGhlIEVOQUJMRSBjYW4gY29tcGxl
dGUgd2l0aCAtRUJVU1kgaW4gdHdvIHBsYWNlczoNCj4NCj4gLSBtdGtfY2hfc3RhdHVzX2NoZWNr
KCksIHdoZW4gdXNyX2NudCBpcyBhbHJlYWR5ID49IDENCj4gLSBtdGtfY2xkbWFfb3BlbigpLCB3
aGVuIHRoZSBxdWV1ZXMgYWxyZWFkeSBleGlzdA0KPg0KPiBJbiBlaXRoZXIgY2FzZSB0aGUgUlgg
cXVldWUgaXMgYWxyZWFkeSBhcm1lZCB3aXRoIHJ4cS0+YXJnID09IHBvcnQuDQo+IG10a19wb3J0
X3J4X2Rpc3BhdGNoKCkgbWF5IGJlIHJ1bm5pbmcgdGhpcyBzdG9yZSBhdCB0aGUgc2FtZSB0aW1l
Og0KPg0KPiAgICAgcG9ydC0+cnhfc2VxID0gRklFTERfR0VUKE1US19IRFJfRkxEX1NFUSwgbGUz
Ml90b19jcHUoY2NjaV9oLT5zdGF0dXMpKTsNCj4NCj4gVGhlcmUgaXMgYWxzbyBhIHNlY29uZCBj
YXNlLiBBbiBlYXJsaWVyIEVOQUJMRSB0aGF0IHRpbWVkIG91dCBtYXkgc3RpbGwgYmUNCj4gcXVl
dWVkLCBhbG9uZyB3aXRoIGl0cyBjb21wZW5zYXRpbmcgRElTQUJMRS4gVGhhdCBwYWlyIGNhbiBh
cm0gdGhlIHF1ZXVlDQo+IGZvciBhIHNob3J0IHRpbWUgd2hpbGUgYSBuZXcgLT5lbmFibGUoKSBy
ZXNldHMgdGhlIGNvdW50ZXJzLg0KPg0KPiBUaGVzZSBhcmUgcGxhaW4gdW5zaWduZWQgc2hvcnQg
YWNjZXNzZXMgd2l0aCBubyBSRUFEX09OQ0UoKSBvcg0KPiBXUklURV9PTkNFKCkuIEEgbGF0ZSBz
dG9yZSBmcm9tIFJYIGRpc3BhdGNoIGNvdWxkIHVuZG8gdGhlIHJlc2V0LiBUaGUNCj4gZmlyc3Qg
cGFja2V0IG9mIHRoZSBuZXcgc2Vzc2lvbiB3b3VsZCB0aGVuIGJlIGNoZWNrZWQgYWdhaW5zdCBh
IHN0YWxlDQo+IHJ4X3NlcSBhbmQgbG9nIGEgc3B1cmlvdXMgInNlcSBudW0gb3V0LW9mLW9yZGVy
IiB3YXJuaW5nLg0KPg0KPiBMaWtld2lzZSwgYSBUWCBsZWZ0IGluIGZsaWdodCBmcm9tIGFuIGVh
cmxpZXIgc2Vzc2lvbiBjb3VsZCBiZSBzdGFtcGVkDQo+IHdpdGggYSB0eF9zZXEgd2hpbGUgdGhl
IHJlc2V0IGlzIGhhcHBlbmluZy4NCg0KV2lsbCBmaXggdGhlIGNvbW1lbnQgaW4gdjEzOiBpdCB3
aWxsIHNheSB3aG8gd3JpdGVzIGVhY2ggY291bnRlciBhbmQNCnRoYXQgcnhfc2VxIG9ubHkgZmVl
ZHMgdGhlIG91dC1vZi1vcmRlciB3YXJuaW5nLCBhbmQgd2lsbCBubyBsb25nZXINCnN0YXRlIHdo
ZW4gdGhleSBhcmUgcmVzZXQuICBUaGUgY29kZSBzdGF5cyBhcyBpdCBpczogdGhlIHJlc2V0IG9u
bHkgcnVucw0Kd2l0aCBQT1JUX1NfRU5BQkxFIGNsZWFyLCB3aGljaCBpcyBlaXRoZXIgYWZ0ZXIg
ZXZlcnkgcXVldWUgd2FzIGNsb3NlZA0Kb3IgYWZ0ZXIgYW4gZW5hYmxlIHRoYXQgbmV2ZXIgZ290
IGFzIGZhciBhcyBvcGVuaW5nIHRoZSBwb3J0Lg0KDQo+IERvZXMgdGhpcyBjb21tZW50IG1hdGNo
IHdoYXQgbXRrX2NoX3N0YXR1c19jaGVjaygpIGRvZXM/IFRoZSBESVNBQkxFIHBhdGgNCj4gdGhl
cmUgaXM6DQo+DQo+ICAgICAgICAgY2FzZSBUUkJfQ01EX0RJU0FCTEU6DQo+ICAgICAgICAgICAg
ICAgICBpZiAodHJhbnMtPnVzcl9jbnRbcXVlLT5oaWZfaWRdW3F1ZS0+dHhxbm9dID4gMCkgew0K
PiAgICAgICAgICAgICAgICAgICAgICAgICB0cmFucy0+dXNyX2NudFtxdWUtPmhpZl9pZF1bcXVl
LT50eHFub10tLTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF0cmFucy0+dXNyX2Nu
dFtxdWUtPmhpZl9pZF1bcXVlLT50eHFub10pDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ICAgICAgICAgICAgICAgICB9DQo+ICAgICAgICAgICAgICAgICB0cmIt
PnN0YXR1cyA9IC1FQlVTWTsNCj4NCj4gU28gLUVCVVNZIGNvbWVzIGJhY2sgaW4gdHdvIGNhc2Vz
OiB3aGVuIHRoZSBjb3VudCB3YXMgemVybywgYW5kIHdoZW4gdGhlDQo+IGNvdW50IHdhcyBkZWNy
ZW1lbnRlZCBidXQgaXMgc3RpbGwgYWJvdmUgemVyby4NCj4NCj4gbXRrX3BvcnRfY2hfZW5hYmxl
KCkgaGFzIGl0cyBvd24gY29tbWVudCBhYm91dCAtRUJVU1k6DQo+DQo+ICAgICAvKiAtRUJVU1kg
bWVhbnMgYW5vdGhlciB1c2VyIGFscmVhZHkgb3ducyB0aGUgcXVldWUsIGFuZCB0aGUNCj4gICAg
ICAqIGdlb21ldHJ5IGl0IHJlcG9ydHMgaXMgdGhhdCBxdWV1ZSdzIC0gYWxzbyB2YWxpZCBoZXJl
Lg0KPiAgICAgICovDQo+DQo+IFRoaXMgYXNzdW1lcyBhIHF1ZXVlIGNhbiBoYXZlIG1vcmUgdGhh
biBvbmUgb3duZXIsIHdoaWNoIGNvbmZsaWN0cyB3aXRoDQo+IHRoZSAic2luZ2xlIHBvcnQiIGNs
YWltIGFib3ZlLiBGb2xsb3dpbmcgdGhhdCBjb21tZW50LA0KPiBtdGtfcG9ydF9pbnRlcm5hbF9l
bmFibGUoKSB0cmVhdHMgYW4gRU5BQkxFIHRoYXQgcmV0dXJucyAtRUJVU1kgKHVzcl9jbnQNCj4g
MS0+MikgYXMgc3VjY2VzcyBhbmQgc2V0cyBQT1JUX1NfV1IgYW5kIFBPUlRfU19FTkFCTEUuDQo+
DQo+IFRoZSBsYXRlciBESVNBQkxFIHRoZW4gdGFrZXMgdXNyX2NudCBmcm9tIDIgdG8gMSBhbmQg
Z2V0cyAtRUJVU1kuDQo+IG10a19jbGRtYV9jbG9zZSgpIG5ldmVyIHJ1bnMsIGFuZCB0aGUgUlgg
cXVldWUgc3RheXMgYXJtZWQgd2l0aCByeHEtPmFyZw0KPiBwb2ludGluZyBhdCB0aGUgcG9ydC4N
Cj4NCj4gRXZlbiB3aXRoIG9uZSBwb3J0IHBlciBxdWV1ZSwgYSBsZWZ0b3ZlciBjb3VudCBjYW4g
Y29tZSBmcm9tIGVpdGhlciBvZg0KPiB0d28gZmFpbHVyZXM6DQo+DQo+IC0gQW4gRU5BQkxFIHRp
bWVzIG91dCBhbmQgdGhlIGNvbXBlbnNhdGluZyBtdGtfcG9ydF9jaF9kaXNhYmxlKCkgZmFpbHMg
aW4NCj4gICBfX2Rldl9hbGxvY19za2IoKS4gVGhlIEVOQUJMRSBpcyBzdGlsbCBxdWV1ZWQgYW5k
IGxhdGVyIHJhaXNlcyB1c3JfY250DQo+ICAgdG8gMS4NCj4gLSBtdGtfcG9ydF9pbnRlcm5hbF9k
aXNhYmxlKCkgY2xlYXJzIFBPUlRfU19FTkFCTEUsIGJ1dCB0aGUgRElTQUJMRSBza2INCj4gICBj
YW5ub3QgYmUgYWxsb2NhdGVkLCBzbyB1c3JfY250IHN0YXlzIGF0IDEuDQo+DQo+IElmIG9uZSBv
d25lciBwZXIgcXVldWUgaXMgbWVhbnQgdG8gYmUgYW4gaW52YXJpYW50LCBzaG91bGQgYW4gRU5B
QkxFIHRoYXQNCj4gcmV0dXJucyAtRUJVU1kgYmUgdHJlYXRlZCBhcyBzdWNjZXNzPyBJZiBub3Qs
IHNob3VsZCB0aGlzIGNvbW1lbnQgYW5kIHRoZQ0KPiBvbmUgaW4gbXRrX3BvcnRfY2hfZW5hYmxl
KCkgYmUgcmVjb25jaWxlZD8NCg0KV2lsbCBmaXggaW4gdjEzOiB5b3UgYXJlIHJpZ2h0IHRoYXQg
dGhlIGNvbW1lbnQgaW4NCm10a19wb3J0X2ludGVybmFsX2Rpc2FibGUoKSBjbGFpbXMgbW9yZSB0
aGFuIHRoZSBjb2RlIGd1YXJhbnRlZXMuICBJdA0Kd2lsbCBvbmx5IHNheSB0aGF0IGEgRElTQUJM
RSByZWZ1c2VkIHdpdGggLUVCVVNZIGRpZCBub3QgY2xvc2UgdGhlDQpxdWV1ZSwgd2hpY2ggaG9s
ZHMgZm9yIGJvdGggY2FzZXMgaW4gbXRrX2NoX3N0YXR1c19jaGVjaygpLiBUaGUgb25lIGluDQpt
dGtfcG9ydF9jaF9lbmFibGUoKSB3aWxsIHNheSB0aGF0IC1FQlVTWSBtZWFucyB0aGUgcXVldWUg
aXMgYWxyZWFkeQ0Kb3Blbiwgd2l0aG91dCBuYW1pbmcgYW5vdGhlciB1c2VyLg0KDQotRUJVU1kg
c3RheXMgYSBzdWNjZXNzZnVsIEVOQUJMRS4gV2l0aCBvbmUgcG9ydCBwZXIgcXVldWUgdGhlIG9w
ZW4gcXVldWUNCmNhbiBvbmx5IGhhdmUgYmVlbiBhcm1lZCBieSB0aGlzIHBvcnQncyBvd24gZWFy
bGllciBFTkFCTEUsIHdpdGggdGhlDQpzYW1lIHJ4IGNhbGxiYWNrIGFuZCBhcmd1bWVudC4NCg0K
Tm8gY2hhbmdlIGZvciB0aGUgdHdvIGxlZnRvdmVyLWNvdW50IGNhc2VzLiAgQSBjb3VudCBsZWZ0
IGJ5IGEgZmFpbGVkDQpESVNBQkxFIGRvZXMgbm90IG91dGxpdmUgdGhlIEhJRjogLT5kaXNhYmxl
KCkgcnVucyBvbmx5IG9uIHRoZSB3YXkgdG8NCk9GRiBvciBhdCB1bmJpbmQsIGFuZCBtdGtfcGNp
ZV9oaWZfZXhpdCgpIHRoZXJlIGZyZWVzIGV2ZXJ5IHF1ZXVlIHdoaWxlDQp0aGUgcG9ydHMgYXJl
IHN0aWxsIGFsaXZlOyB0aGUgbmV4dCBISUYgaW5pdCBzdGFydHMgdGhlIGNvdW50cyBhdCB6ZXJv
Lg0KDQpUaGFua3MsDQpKYWNrDQoNCnB3LWJvdDogY3I=

