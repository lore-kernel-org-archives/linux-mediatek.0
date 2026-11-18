Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FFA606A33E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IjROxC7Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oMefaorIZiUogAbzrZGQsijpnbTZQvZuo03f8L5h/WU=; b=IjROxC7QSfGtKMuTvITJSL8o93
	E9GezY3kgPdCEBTP/qdtvoZvf7HSHmKDzlCYGHlo4AwMi0OFLbrdnGplyoGji4FuEcxYrhG563kW+
	d7vp5TO68i6AA/dh9Ekr2rJwVHIRyLaSEKpIH4hVme5PGuhnyMdkVDP76/c1LJJrZEXH2+n2vBvYn
	Ktf5HaHN5yWk9TLpQm6QTUapefchxCS9eWgAQ5OLfHLd0p5pHMXzsXal0bAyv+BAu0+mxTZuKwEM5
	gieMuKLc8NEYgU1PclQMREg4V2Q26mi52RL0uYaFO7hUR50qcxlJ/o1uimHBLrSIMr7UyWWMjudnk
	ltG4o9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVex-00000007YO9-00o5;
	Wed, 18 Nov 2026 02:44:31 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVeq-00000007YMR-40a0;
	Wed, 18 Nov 2026 02:44:26 +0000
X-UUID: f2785a74e2f911f1b2470fb4f881575f-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:6b5041c9-a062-456c-be6a-6867c42c28b3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:89e8b719-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2785a74e2f911f1b2470fb4f881575f-20261118
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1563602919; Wed, 18 Nov 2026 10:44:16 +0800
X-UUID: eefb6b70e2f911f1907ca11d1ee29896-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:35fdb544-3d0e-4e3f-9b29-cc40f44af535,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:1f580031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eefb6b70e2f911f1907ca11d1ee29896-20261118
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1439997463; Wed, 18 Nov 2026 10:44:10 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 10:44:08 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 10:44:08 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
	<johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"Yu. Robert (GSM)" <robert_yu@compal.com>, "Chang. Jeff (GSM)"
	<Jeff_Chang@compal.com>, Eric Dumazet <edumazet@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
Thread-Topic: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
Thread-Index: AQHddwavvOJ1mLklYEStYpskeCH+dw==
Date: Wed, 18 Nov 2026 02:44:08 +0000
Message-ID: <e415240553f24e198df67b0f7e0779f7@compal.com>
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com>
 <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>,<CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
In-Reply-To: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-as-result: No-10--9.178900-8.000000
x-tmase-matchedrid: tkB2VEODQ1cuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EqJ63gZLKrOBDdLXYWGnDb52vFMfvZjTGGG92L3YEEC4s49QZH9p6LPpmoO1x9E9p2Z8
	68ZgqJNhpKrf9DoF7ZnlvhmQt/TMQLIEf+lIlZyG5kTI8BpRqcp7EkV3V/yv7YuYLFlhZK0K5Qh
	5TcoREqjf8MHPNq3cEyrzRjZhtElOvngkjHjojpGwZG2qI2OBsWa6vTkKxwrLRSbyPS2HFdyJsZ
	0L4JGotA5sjMuzcYBZ5MplrLPgz9xWgiVbWBq4sc6LF+MWe8KcoPxmxIqavtbN5EjB1voyEzdMI
	eHnsyjs=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--9.178900-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-snts-smtp: 6BEE0141DC73C40C042717AA9F8E2E6F52367E4909DBB822EF41C843FAF952AA2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_184425_343874_79D0BD0F 
X-CRM114-Status: GOOD (  11.03  )
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

SGkgTG9pYywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUdWUsIE5vdiAxNywgMjAy
NiBhdCAxMTozMSBQTSBMb2ljIFBvdWxhaW4gPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KPg0KPiBJcyBpdCBhY3R1
YWxseSB1bnVzZWQgaGVyZT8NCg0KWWVzLCBpdCBpcyB1bnVzZWQgaW4gdGhpcyBwYXRjaC4gIFdp
bGwgZml4IGluIHYxMzogdGhlIGluY2x1ZGUgbW92ZXMgdG8NCnRoZSBjb250cm9sIERNQSBwYXRj
aCwgd2hpY2ggYWRkcyB0aGUgZmlyc3Qgc2tfYnVmZiB1c2VyIHRvIHRoaXMgaGVhZGVyLg0KDQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+DQo+IFNhbWUgcXVlc3Rpb24uDQpB
bGwgdGhyZWUgYXJlIGZpcnN0IG5lZWRlZCBieSB0aGUgbmV4dCBwYXRjaCBhbmQgd2lsbCBtb3Zl
DQp0aGVyZSBpbiB2MTMuICBJIHdlbnQgdGhyb3VnaCB0aGUgaW5jbHVkZXMgb2YgdGhlIHdob2xl
IHNlcmllcyBmb3IgdGhlDQpzYW1lIHByb2JsZW0gYW5kIHYxMyB3aWxsIGFsc28gZHJvcCB0aGUg
b25lcyBubyBwYXRjaCB1c2VzLg0KDQpUaGFua3MsDQpKYWNr

