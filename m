Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6B606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 02:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ROLTHIZw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jFSeaVMwmpGTscclq27CtfSibizeAw/KTTmBFbDqruQ=; b=ROLTHIZw5Ok7nxKz0Jc6L2gEz1
	1zVhUn4fBFo+h7Up2s9nr8vUk8oJ45yE5a0FCw+pjxmaMh2K1GgfVXHQZLHGZd0ZWIGtG8eD2GXgn
	SS0Fbx8rbOLqsjZrTZhMc+hUbQadExxejfwor5W0r2a1Z5ChtjnMcd/mx+mAtC7H44CQHBTnB71qz
	I5Nubp8/bsAcL44sZXRJ/31oiC5TgcBYPG8pa57XJyQhkABqs77yf69lYGOe2Jp3pW919K4oNWfCI
	8cL3X67i1dhyG28ZSyYSW6cqkgj12Tojz53w/kB7nUR8H7t65iVLNdeagZTKzKMo8JLIbrdsrdnas
	6McBlAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVcT-00000007YAa-20NI;
	Wed, 18 Nov 2026 02:41:57 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVcQ-00000007Y9o-1vIS;
	Wed, 18 Nov 2026 02:41:56 +0000
X-UUID: 96134988e2f911f1a87c2323a98e90a4-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:dc24a6dd-3bd7-4ab2-9e96-2d528ef4273b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:b7deb719-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 96134988e2f911f1a87c2323a98e90a4-20261118
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 633194362; Wed, 18 Nov 2026 10:41:41 +0800
X-UUID: 928c992ce2f911f1907ca11d1ee29896-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8a6abfec-0510-4f7d-a851-b40f4b3888dd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:7c4e0031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 928c992ce2f911f1907ca11d1ee29896-20261118
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1184630539; Wed, 18 Nov 2026 10:41:35 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 10:41:31 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 10:41:31 +0800
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
Subject: RE: [External Mail] Re: [PATCH net-next v12 1/6] net: wwan: t9xx: Add
 PCIe core
Thread-Topic: [External Mail] Re: [PATCH net-next v12 1/6] net: wwan: t9xx:
 Add PCIe core
Thread-Index: AQHddqhg75LuZMdKlE69hiLs1pbc2bczHwT3
Date: Wed, 18 Nov 2026 02:41:31 +0000
Message-ID: <12b4684bdb85447583e859b2b9b225d4@compal.com>
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com>
 <20261117-t9xx_driver_v1-v12-1-e181b616b820@compal.com>,<CAFEp6-1r=SYCSvUNj_Up346vFssTFckWX8qg_Y_AWAfNX-jUpw@mail.gmail.com>
In-Reply-To: <CAFEp6-1r=SYCSvUNj_Up346vFssTFckWX8qg_Y_AWAfNX-jUpw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-as-result: No-10--12.874300-8.000000
x-tmase-matchedrid: q6+TWfRxf4cuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EqJ63gZLKrOBDdLXYWGnDb52vFMfvZjTG9JNGx29afWgZ8/pDtedihxz2sRWlXYlsRDf
	Qxg3CHqBYMt9Q+xsAlyeZWGiWBdMv0t6Mv4G6vdYyOULx8gKEcwxMC1n35TFCxJ4cU7JLxLG2ON
	VfTpizETf8MHPNq3cEyrzRjZhtElOvngkjHjojpPe3el8uYlFT28gAxP/Ts6IH2l80MvY9heUo4
	N9PjSkTthRFAcCnfMpb1n/APLhbVUQuolBn6hB0cfI9aJm20n6QAZwSulo/5cavV3pshZuG
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--12.874300-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-snts-smtp: 6593C833C412362B8A9D2A7FB25D524E78D747E9AF9BCA07DEE724796C314ECC2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_184154_885453_60923E18 
X-CRM114-Status: GOOD (  12.65  )
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
NiBhdCAxMToyOCBQTSBMb2ljIFBvdWxhaW4gPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToNCj4gPiArICAgICAgIGlmIChhY3BpX2Rpc2FibGVkKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGRldl9kYmcobWRldi0+ZGV2LCAiVW5zdXBwb3J0ZWQsIGFjcGkgZnVuY3Rpb24gaXNu
J3QgZW5hYmxlXG4iKTsNCj4NCj4gR28gc3RyYWlnaHQgdG8gdGhlIHBvaW50OiAiQUNQSSBpcyBk
aXNhYmxlZFxuIg0KDQpXaWxsIGZpeCBpbiB2MTMsIHdpdGggdGhhdCB3b3JkaW5nLg0KDQo+ID4g
KyAgICAgICBoYW5kbGUgPSBBQ1BJX0hBTkRMRShtZGV2LT5kZXYpOw0KPiA+ICsgICAgICAgaWYg
KCFoYW5kbGUpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2RiZyhtZGV2LT5kZXYsICJVbnN1
cHBvcnRlZCwgYWNwaSBoYW5kbGUgaXNuJ3QgZm91bmRcbiIpOw0KPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCj4gPiArICAgICAgIH0NCj4gPiArICAgICAgIGlmICghYWNwaV9o
YXNfbWV0aG9kKGhhbmRsZSwgIk1SU1QuX1JTVCIpKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRl
dl9kYmcobWRldi0+ZGV2LCAiVW5zdXBwb3J0ZWQsIHBsZHIgbWV0aG9kIGlzbid0IHN1cHBvcnRl
ZFxuIik7DQo+DQo+ICJBQ1BJIGhhbmRsZSBub3QgZm91bmQiDQoNCldpbGwgZml4IGluIHYxMzog
IkFDUEkgaGFuZGxlIG5vdCBmb3VuZCIgZm9yIHRoZSBtaXNzaW5nIGhhbmRsZSwgYW5kDQoiTVJT
VC5fUlNUIG1ldGhvZCBub3QgZm91bmQiIGZvciB0aGUgbWlzc2luZyBtZXRob2QuDQoNCj4gPiAr
ICAgICAgIHN0cnNjcHkobWRldi0+ZGV2X3N0ciwgcGNpX25hbWUocGRldiksIE1US19ERVZfU1RS
X0xFTik7DQo+DQo+IERvIHdlIHJlYWxseSBuZWVkIHRoaXMgYnVmZmVyIHRvIGV4aXN0IHNvbGVs
eSBmb3IgSVJRIG5hbWVzLCBjYW4ndCB3ZQ0KPiBzaW1wbHkgdXNlIGRldl9uYW1lKCk/DQoNCldp
bGwgZml4IGluIHYxMzogZGV2X3N0ciBnb2VzIGF3YXkgYW5kIGV2ZXJ5IG5hbWUgaXMgYnVpbHQg
ZnJvbQ0KZGV2X25hbWUoKS4gIHBjaV9yZXF1ZXN0X2lycSgpIGdldHMgdGhlIGZvcm1hdCBkaXJl
Y3RseSwgc28gdGhlIHBlci1JUlENCm5hbWUgYnVmZmVyIGdvZXMgYXdheSBhcyB3ZWxsLg0KDQpU
aGFua3MsDQpKYWNr

