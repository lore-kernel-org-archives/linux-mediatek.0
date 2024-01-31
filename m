Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7936C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cq3+JwJMrcIlSIb5RP20Wignuiy6g/f8/k8cSPFK2k=; b=13mVivaFbCypa/bI7eywbdN1un
	FvDgjiOgJGPnkW1jR9jDrIvCSME63jcrcUMeWKfTxrIcZpUuxzVK1LHWzBtkF3Z+TKrKoYqBluGg8
	y9g9Vvm89kFQYW8pqHWul0wItY8PWEo8SlVfgfmM8WfsBnfzALmmIkZlOmfuNkQLcFpGTqJ8ludoQ
	Ad/JbgZOQm9V75t8t0KhnbuzyFHavp1V4D9+y8lsQCy+01OF4/1jOMa255nt3e6SVNlDbRSU29Yr0
	8JexwxQtku0sBLwEPM9CygF8JlkH5Fr15qdgfArqxMQIIoPefjWQu/+QBdNkqGsQD+5M7owWynY89
	0InHpT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4t2-00000001mQp-1yo9;
	Wed, 31 Jan 2024 07:19:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4sy-00000001mOP-46Ye
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 07:19:54 +0000
X-UUID: 1e2360b8c00911eea0bf134e88e6c2dc-20240131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/cq3+JwJMrcIlSIb5RP20Wignuiy6g/f8/k8cSPFK2k=;
	b=Caa1qtkJqS0Uoo/B2vBs73OKtI4Ev6Fvgas6+Adw67aVvQGb7YbB0oHiqWAkb+0xvKvu8KKHWsnnKtdCyYPY8k7nq0fywvIjwRsBxXjjj0Q33dl3k43zkeSyqs4B6m7fpE4JkHq53p4hMBYUjRm2d6JvGDN7i0U7dqy1F/Vhcbs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:3a023b00-0fc6-45ed-b6f4-749b743e8398,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:a6ceda8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e2360b8c00911eea0bf134e88e6c2dc-20240131
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 984057400; Wed, 31 Jan 2024 00:19:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jan 2024 15:19:07 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jan 2024 15:19:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWgL9QtiB9F1qtdmrCTOV2FsBD0HQPcLKFnmNgWfP/CsFUnL0neFxlBZY33mFEleEqLV+rbDUccLyHTxWnfaJ0LBkkmQp092GJ3u4MMtUJHDHCTUk9NShZkyZh185kNuRBXrCV6yriXQX/GAFPw8eJW2Ah2ZLHJO7eZdJvsO+0d+KCSwra4MXSImg62Es7poJLtehOuLHdQS4SVxATKunOLq8LuzsBY1fGdBn/slgPfB0zi2bS3loEOl7zOMRg/aJvFgIPEfBo+v34k85AgRdfGytD2gMhKjCQve9vFaMWwRfmNsiDg3Bkv0TKny13CFscpGvNkXXPc4G8EwsADO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cq3+JwJMrcIlSIb5RP20Wignuiy6g/f8/k8cSPFK2k=;
 b=iueTE1u+Htec22pGRnK5sY3D5m9D8FtECz/Zdxjj3tIGpprsYBEPneh7A1xamRJ6ZvTtSQXrCVrEftyMiVegHeCNhgdHoyVjRvrOc0/5BsR/m9rbZGzoZ7j0DcMe0rAxVy8TxRsqpEy6GXKuHSQ1+gH0ObUKiXu/tPhdrK4+5OLOoETXt2ivKSiI9SaD06AfrguHVNEWSe3ZVzZvc1bss7+gBB+Shtk/x5esc/qUzT8XuLOm79JjtopI7lX7n4V4kAP4vlQljC9qPdPkOPXC2qJ9/ybrSezLYTi4+s6dnMsOqC+RXTu8+DsBU902kxnW/w4DXpyOIRyXXS5MNv/Jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cq3+JwJMrcIlSIb5RP20Wignuiy6g/f8/k8cSPFK2k=;
 b=ussx9m2xHuLC4xoZlkhQLMxaQiuyYVm8gLwxA2byo6jTPY2koD7A/+ZSNB6sc6D2MwlFbBWe4Vsmc6S3pjn2w4boYIGZa1JAaTv3/0Q3vSGYeAJX6589L0X1F35Sv4bAVGrXMgPVjHnbecbxSR4hAd9KaNOiqSJYQB674I6V3Ak=
Received: from TYZPR03MB5406.apcprd03.prod.outlook.com (2603:1096:400:39::8)
 by SEYPR03MB6650.apcprd03.prod.outlook.com (2603:1096:101:82::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 07:19:05 +0000
Received: from TYZPR03MB5406.apcprd03.prod.outlook.com
 ([fe80::f5d8:dac0:bfdd:a5f1]) by TYZPR03MB5406.apcprd03.prod.outlook.com
 ([fe80::f5d8:dac0:bfdd:a5f1%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 07:19:05 +0000
From: =?utf-8?B?V2lsbGlhbS10dyBMaW4gKOael+m8juW0tCk=?=
	<William-tw.Lin@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "srinivas.kandagatla@linaro.org"
	<srinivas.kandagatla@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/3] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8183
Thread-Topic: [PATCH 2/3] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8183
Thread-Index: AQHaU2K2Wsm+ijlVAkK0nQu35h1embDzhMQA
Date: Wed, 31 Jan 2024 07:19:05 +0000
Message-ID: <f53b3752195fb4c351a2ebf5ff0387d369a949ac.camel@mediatek.com>
References: <20240130095656.3712469-1-wenst@chromium.org>
	 <20240130095656.3712469-3-wenst@chromium.org>
In-Reply-To: <20240130095656.3712469-3-wenst@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5406:EE_|SEYPR03MB6650:EE_
x-ms-office365-filtering-correlation-id: 1677a262-9b5f-4e95-c96c-08dc222ce870
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgS+Gio8dMBYyevq0NeDXxuRJOt11pMvf8aYrLS7p1Ze42EhCM7WiMkoQvmdjp+xzHPkn5t3Sgd1hTTZ6ugu/HOsMni8JaIdsaMC38zhp4N0lgUOI/e78UKmHq5csM/rBWKDRIeDjT2yZW/kNDbxmvVBHve8orASBhoySXMJDKhH9KWgvfpV6vtsSJtDD0c7tuYIILdteyAvtdKSiWYphxytcZjjXSSZWxKHmH9lCGaXE9o3nD1n1THPVvYlje4ctQjQ4jZsyQvgtYnqJeG5Ac1XbqwUVwilCFgasjPqMXrHp0D8eVElBkiP0pN/UU74vygMLuXH0XxwdTnL+3UJ2wWjlu5tDudSzwQB349g8yz98Jn7gwmBADVL1y2QkCfCYOj3cesEeeBGrMoF4Kz/ptSpJqhR/Z5h17Ps87NMzxlkgwKBkic4QY/4xffVCoU4xslfqzlo5TaS5IPSu+oNnJv3kDndbnksHJiyBzb5gGCSxo8HvIsrnh+Nzhuruzywve8A8gKkdnjQ7Te/nnNQdBz8NRQFk2gJy7IBX4OjIr8r1WJMnF5RCjJxQhomN/f3z2zUyGZ/HKuA8wDfg61o/4Z4aboeTbcokFAYnK/IvjzJW5zGFOiTo2BIdK9xaW0G/rHJcEtpa1MapEWHIt0vr3ONstHJa5UmicIa0o2FiuY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5406.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(83380400001)(26005)(6512007)(2616005)(38100700002)(122000001)(8676002)(8936002)(5660300002)(4326008)(478600001)(2906002)(6486002)(6506007)(71200400001)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(110136005)(76116006)(38070700009)(86362001)(36756003)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0t4WDNrN3VuL09RYTFMajZxK3NlN3BxblpMU2JSbHlEV3grYXI3b25zNEZk?=
 =?utf-8?B?ZlNhNFZFMXFnVDUzaTMwK3hCYTNXa1g0bFVwcitlMXBrWWVYd0grR1BEWFlT?=
 =?utf-8?B?YnUzbXhPR25xRm9NTmszLzIwZTg0d3pXVUJNL2tyc3k4cXZkKzVwRXNjOFht?=
 =?utf-8?B?Y2lUS3Ezc2xOV2VxMFRxc25vY0sxSGx2dGYycGV0M2FVMEtPWXR3Mk93cVdS?=
 =?utf-8?B?MmdRTWZ6RU9GVmxPcUxzQVZTWmI3bUplSStVUCtrYUd5S3NjNEhFTXord1Ix?=
 =?utf-8?B?eldsNm5maWI3bWtUdExRQkpEeldMVDVTN2FlMU12bjNoaVNEVE51N2pYb0E1?=
 =?utf-8?B?b2tZSktnakVOQUhIOVdJZXhDaDREd3dmV2s3SFZ2Q3FBMmhpbDc3N0ZIQ0xR?=
 =?utf-8?B?ZmJvTWNSYnBndlpxY0VYakR3ZHVNSnEwTjBWK0ZSRlZaVVJ2bnNrMlUrUWl5?=
 =?utf-8?B?S3V5Y2hzZ015YnRHakZQVHNxRWVFQ1p2THVYVE5ZZ1ZIZ0kyMFRMWmlzb2dO?=
 =?utf-8?B?clZBYWJjOGRBeVJJVDNDeXY2MElTYVdnaDk0VjAyYlJxY012d0JrLzljaExp?=
 =?utf-8?B?NjFxRlQzeTR3L1ZUTjNsSjNZT0xPa0s1aE9TUThyeUErNG16aXgyYWxvaDdR?=
 =?utf-8?B?SkU1c0loMjdLV2R5MU9PUndsZ0lsOURzUXNyZEt4MEErYVNDek5lUWtuSk80?=
 =?utf-8?B?OWhqWlVhTFp6UmYxQXNuMFpFempBZG51Nnh6STBvZjQxV01IMjNPRUJWalBF?=
 =?utf-8?B?VmUyZWp2VFFCbWw1cmN2bHhOMGlRSk9yTjBiKyszNWpjb2hkNUoybkRIMWtC?=
 =?utf-8?B?anI4VXJpUmpSZTV3VW0zR3RqOG9NMm5pemxnNlhNeW9pL0c1c2liSXBnNVZX?=
 =?utf-8?B?Qk1TWXZQYmFTUS9kcWhhblF1ZFBJQk1lOVFHR1JDNGNtdXBHM08zQ2NqOUZS?=
 =?utf-8?B?NFpMd0Q4K1NGeE12YnlMSjBDZHkzSS94NGkrUVpENjNqMlliZGR0YU9aSEtG?=
 =?utf-8?B?Q0hFZlNtZGxVb0RWS3hjaEUvVUtrMHNPMDhyYkwxYTZIcEVjSnhYa3Uzc2kz?=
 =?utf-8?B?S1lPYnhyTUMwSmMvSFp3TnpPWkpKeDNBc2JPbGVHeXd1djNlNjB3cTE2bzR2?=
 =?utf-8?B?RGJoZ1JqOVRJcXE3VG5CT3hFLy9yTVJCNGhkNU93dGs1a3lwM3VwWHQzTnJ1?=
 =?utf-8?B?U0d1d3VjdVdoeEN4SFFmUEJhRzFGN2xZTUFiczhUNEg0bk9MVHFhZjhMTDk2?=
 =?utf-8?B?Z0d6cGNIUlM5YlVnTEZPMDJ3TmtRcENleDc0WlJxWnJnb2l3dzl4V0Q5Ymxv?=
 =?utf-8?B?RFFGb0wyS05WaGoyR3YrSmN2QkRPOUU4VG9GSHoyNE9aMElsRWx4RWxOZFNo?=
 =?utf-8?B?aG5FYUQrUDNmc3h3K1NudWtSdE9tbXdQaVM5Kzhsc2FHcGtzeXJEUG9LdVpS?=
 =?utf-8?B?c3dYYitCQUwrODFlQkdEclc2dFJlOWJkK2Z2Y0RhU2pjVDFnZ244bDluczVC?=
 =?utf-8?B?alJZWURHOTBZUDhVRllmRERSeE5jcUlnSElZUjVseVRKdGtZSE1VTitVQmRy?=
 =?utf-8?B?YmpKWnFvVnZCeHVYOGQvSFpKVjlnUm8yMndGRTBTdlRtaHRacWx2bi84S0Fr?=
 =?utf-8?B?ajlqTVZRc0wzNDdaYUwzZ0JvWU9ESzk2ZnZDYm9UQzMrcWpaZEM2dG1NbjVm?=
 =?utf-8?B?V3dDRGJhMmp5Ulp4eGlsTFp4V2FEbVBHQlBtL0ZhT1o1dm8yUkRCTlJmc05H?=
 =?utf-8?B?TmtZbEdRSmVjRVovaFptZjFObE5RSnpneUJqQjQ3dEVMUUZLb3FaVEw2KzNI?=
 =?utf-8?B?WG9WSVBVUzh6UFBocjBmTlp2bjN1OUQvN1B0aDg3STFHUkdoWk1aUTVDYWZx?=
 =?utf-8?B?bFdDTkRkbGxuRFA3MGxvNTJwcURCRnhYc3FUUUtRT2trM21tRm0zL2lOYkQ1?=
 =?utf-8?B?NVppendsZ0tOeUNtZVJwK0xkaGY3Z3c2d2FBcklDWTA5R0w4WVBqaGpad3h3?=
 =?utf-8?B?c3BaY0dMbDM4cFhTMzllZWY0bC94a2puK3F3SDNHYmtZY2hMa0xad2kydzRa?=
 =?utf-8?B?a1JXakpQZ2IvK0lQVGU1alpnSjR1YnZFNmpxUEdqRmRzdit0RVh1ZnEvUEV0?=
 =?utf-8?B?dnJ2SlE4c0h5SmtZbEtUTXlQWHZ4YXkrTmE1ZlZPc1F5dHhmL0U1emxOcThK?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <645AA3EA74DB2E4EA374C329E061CA3B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5406.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1677a262-9b5f-4e95-c96c-08dc222ce870
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 07:19:05.3340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjnbmyLAG4jZKT5zO5+11DU3IfNkDjfiR0l/oP4mgy+hhb10ZLcGIcYExQtXnQvKR9DBnpgeOXETiz7IGVtyT75BEvP9pD5Uh30viCpTdGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6650
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.704200-8.000000
X-TMASE-MatchedRID: w2TFuZOvAtfUL3YCMmnG4na57ruHAnHxT9kSL7SwB1gNcckEPxfz2DEU
	xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+CxBrawMcuRDTnrjo3X9e+DHT/d
	mRd5jU4C/6KjX40XJjQG2ORx9EyapkfRhdidsajPSBVVc2BozSlkMvWAuahr8+gD2vYtOFhgqtq
	5d3cxkNZd/mwLf2BVU2iOglrdvXDFUTYvv7Ks+T/9WE4H/IUiq6lUFZ1i6s4hLDBwYotNgRw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.704200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7B36096C7232936CDE1AD0043B684A85E0FBCD00E6A2A1B79911A5672A74ACC32000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_231953_074958_F08E5A0C 
X-CRM114-Status: GOOD (  16.73  )
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

QWNrZWQtYnk6IFdpbGxpYW0tdHcgTGluIDx3aWxsaWFtLXR3LmxpbkBtZWRpYXRlay5jb20+DQoN
Ck9uIFR1ZSwgMjAyNC0wMS0zMCBhdCAxNzo1NiArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIFRoZSBNVDgxODMgaGFzIGFub3RoZXIgc29jaW5mbyBtYXRjaCwgd2l0
aCB0aGUgc2Vjb25kIGNlbGwgb25seQ0KPiBkaWZmZXJpbmcgYnkgb25lIGJpdC4gQWRkIGl0IHRv
IHRoZSBkcml2ZXIuDQo+IA0KPiBGaXhlczogNDIzYTU0ZGEzYzdlICgic29jOiBtZWRpYXRlazog
bXRrLXNvY2luZm86IEFkZCBkcml2ZXIgZm9yDQo+IGdldHRpbmcgY2hpcCBpbmZvcm1hdGlvbiIp
DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAt
LS0NCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1zb2NpbmZvLmMgfCAxICsNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1zb2NpbmZvLmMNCj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc29j
aW5mby5jDQo+IGluZGV4IDM5MDlkMjIwNjJjZS4uNDI1NzJlOGMxNTIwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc29jaW5mby5jDQo+ICsrKyBiL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1zb2NpbmZvLmMNCj4gQEAgLTQ1LDYgKzQ1LDcgQEAgc3RhdGljIGNvbnN0
IGNoYXIgKmNlbGxfbmFtZXNbTUFYX0NFTExTXSA9DQo+IHsic29jaW5mby1kYXRhMSIsICJzb2Np
bmZvLWRhdGEyIn07DQo+ICBzdGF0aWMgc3RydWN0IHNvY2luZm9fZGF0YSBzb2NpbmZvX2RhdGFf
dGFibGVbXSA9IHsNCj4gIAlNVEtfU09DSU5GT19FTlRSWSgiTVQ4MTczIiwgIk1UODE3M1YvQUMi
LCAiTVQ4MTczIiwgMHg2Q0EyMDAwNCwNCj4gMHgxMDAwMDAwMCksDQo+ICAJTVRLX1NPQ0lORk9f
RU5UUlkoIk1UODE4MyIsICJNVDgxODNWL0FaQSIsICJLb21wYW5pbyA1MDAiLA0KPiAweDAwMDEw
MDQzLCAweDAwMDAwODQwKSwNCj4gKwlNVEtfU09DSU5GT19FTlRSWSgiTVQ4MTgzIiwgIk1UODE4
M1YvQVpBIiwgIktvbXBhbmlvIDUwMCIsDQo+IDB4MDAwMTAwNDMsIDB4MDAwMDA5NDApLA0KPiAg
CU1US19TT0NJTkZPX0VOVFJZKCJNVDgxODYiLCAiTVQ4MTg2R1YvQVpBIiwgIktvbXBhbmlvIDUy
MCIsDQo+IDB4ODE4NjEwMDEsIENFTExfTk9UX1VTRUQpLA0KPiAgCU1US19TT0NJTkZPX0VOVFJZ
KCJNVDgxODZUIiwgIk1UODE4NlRWL0FaQSIsICJLb21wYW5pbyA1MjgiLA0KPiAweDgxODYyMDAx
LCBDRUxMX05PVF9VU0VEKSwNCj4gIAlNVEtfU09DSU5GT19FTlRSWSgiTVQ4MTg4IiwgIk1UODE4
OEdWL0FaQSIsICJLb21wYW5pbyA4MzAiLA0KPiAweDgxODgwMDAwLCAweDAwMDAwMDEwKSwNCj4g
LS0gDQo+IDIuNDMuMC40MjkuZzQzMmVhYTJjNmItZ29vZw0K

