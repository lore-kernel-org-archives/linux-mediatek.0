Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01338606A338
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jI0YQggV;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ta5xkLSd;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=HGCQHmWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5TqhKUPMf/jVTQ50UK9oRslRDbnpd6BesP/kf3PT/pQ=; b=jI0YQggVREHMh/sO9YdKf/wUqr
	gz8oynA4g19ZvnYJ5xUM6r8tbQ5ymeqf5vcbwKJqfQJcTG3kwv2ZYHH3DnW0Q102lTrtsPYCqFZxJ
	cqLLdMvTTbufVfCwQ1Bg2/6LU1VNnQ9qHnHQt/sfBw4m2VH6EN7EO+ltYEjyi0KwPMWVMomPOKOhO
	3UcS+UwXn5psDF1BV5ua35GYRICUbFAa7OYmYtf3uCXL8M7XwLUIIUiMnJybqDBDxRV0DeLakgHEt
	Zb5SWMLIZeKgjKiMw0I28rVUOi2QvHyjnFevZi74JrOAVKsXJqRwe0Ks+iTyydIK5g6wk5utYPeiJ
	wSOxmusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8KT-00000006oK9-37kb;
	Wed, 11 Nov 2026 13:25:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8KQ-00000006oJY-3tbx;
	Wed, 11 Nov 2026 13:25:32 +0000
X-UUID: 5b5f76a2ddd311f1acbe4559397dec65-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5TqhKUPMf/jVTQ50UK9oRslRDbnpd6BesP/kf3PT/pQ=;
	b=ta5xkLSdG5Eau6ebd270Yboa+HunyS6qaoWG9A70bcML+lvcEeeKhAUAnH19m8tZDV4vuPLDunA13KQfhxrwz92Aw4NMv4RmxiKr2kGX5wpL9rvRBB83Ud5Z6vSE4kA/yCK/4zYbeaXOUsfLEMHFKzLaRz/5aoTY4X9htYg+1A4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:204fae29-209e-46bd-85ed-de8392111f41,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a0d0b530-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b5f76a2ddd311f1acbe4559397dec65-20261111
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 946153558; Wed, 11 Nov 2026 06:25:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 21:25:24 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 21:25:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmwcxYyFF4vpUCLZhs/oBt5P0PCWGwrqfOYTFQGM+2q/kWozB636I7Is71vz6ElHDE6tlu5033TowIDtV6kjao1bpVlbFQrzJeioDPPZsTWdEOtvAG0V+PUFitkSfU3IwkKnvCHvZXSL5qqMHsFubzcED95gyBTpn8PmXe0Rxu2GSXjuidI+KNUFnyfy4JAxcSgZU/Y8/jOuNfTmICD2Cj6SC9K24ixkNziGIOfQSLw4+5pxMtW2edMxA+4iI6+gJgPPj1VNItqLFQw78c46v5/oAj+u+bHRjpjINtgPLHJ0OGN7PnGsXPW8UOCPL9a5Xhgnc+ep+uND3Kq6QiGbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TqhKUPMf/jVTQ50UK9oRslRDbnpd6BesP/kf3PT/pQ=;
 b=hsLjwHrlHF+/mnwFSlYJZze0/vLSADisyyXOUvkOI7dQO7UgNWbC3gfItIIe36UCqCfYAVemcCWoXjAb14MBBKgaTrf7VxCa+3tQYUtjB/z0y2EkM2cEdAEZ1Tna7eBUopIyNRHzFLQPH64PvKDRhB03m/8cv9N7+FT8ZMJQ9lxIa4lTvVp+UBm8nWB0Xf9u73SU740yWWHaXXhnEJL8Y3LNff5UMjD+EvKLJLTwYXNOtLFDBLfNtdnVU5+jFKOibPTTeI4fRK471jFRjWDFrdnDwiKtbWtmCaPTbtKMjqx2AhQ6+JOtk5Ck6QGPZ+AVpshU/s1lU90TL9/gABPHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TqhKUPMf/jVTQ50UK9oRslRDbnpd6BesP/kf3PT/pQ=;
 b=HGCQHmWaOmOHj3bywhiKLEhv+AfDK4vxMJpubs4UlICaXrVYeZsU5Be77diZVUEF3u8AJ0OC1EGgMoNUZpBuo37DnXRzOlCK/onQw+o30s3uTI3UdDaEgbFuoEIl9RdWA7I3Y9w8KGHfDb2NZhPtVql/jIY2698My5LBi6HMPDk=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB6721.apcprd03.prod.outlook.com (2603:1096:101:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:25:19 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:25:19 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"sven@kernel.org" <sven@kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Topic: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Index: AQHdaEhJ4pguqtEuU069KUF8fxIinrcjBRKAgALOu4CAAxvSAA==
Date: Wed, 11 Nov 2026 13:25:19 +0000
Message-ID: <7113cfd5e83bd2319f7cd85ee49dadf5a4cbf86f.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
	 <179407827117.165429.11777170722243752189.b4-review@b4>
	 <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
In-Reply-To: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB6721:EE_
x-ms-office365-filtering-correlation-id: 88a05f14-5a0f-42af-3461-08df3ff73b31
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|22082099003|3023799007|56012099006|11063799006|5023799004|10067099003|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261021135927099003|261026140227099003|261021121427099003|38070700021|4143699003;
x-microsoft-antispam-message-info: iR6xrY/gVcXRAygQMjI8ny1ZncIPpLPRfKJ+lBvh/vAYZ4fLdAqrPiXoHMJy9BYQ/A3mFlZ5lI9HTJ/eXa/8OOo6b6CDMxXO4nKVIDuBMn+po0WABxp0abOjiZHmGP2mjp09PcjKKeS2+Y0i3/vjkDLYXbyMqq5il1XZaJbY74g+koiKEmsIGgC+0N3FNZvM1G69RzF+uSHXk6KOkm92HWW942gdtM625PmsKRENk6yOKfj7r2Iudt44DWk6zpPbIbJ/bPk93CyTy8WqXhK+K1xDhCY4JAdYBQntChevVRYNqoLWIcxBvx/0Y9Qm+9e2Q2CtpW+SMh/mu6vX16oawkn/3Xmgm3cD9joPqg9ST0dqCfBZbt93IPdxl4efDSOG60HwvYU3juQ6dtNMjZCWvQwrbpx/IC5k0M4rp66u/IbHh4wwWGA1GVh8KiyJLfkspK/Od01WArbE0hKLNkQS+bp/LAuaWcL1el6/wviGBTvt+992201Zu94KCH+OcZLLV4SahCPwJw0lXNcIN2LDQeAC5iFUPLnAMoilZoWOYLr89VCU0VEzMnDnPSrgIZIvi7cJTR7zdvqwL9tmzzRI2LiKB0jCf4NcwUvabx6IedOyAhw6inlCWhv4xojLRBdp2we+gkq6UZ4tGYD4EHFcv3ItPthmPxHsahz44NgqaHjs/1dSYREWBiWCeMQgxGwFly+GqXUNduVwBnHVhgNTHMrmn1NHyno2d119apnOO1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(5023799004)(10067099003)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261021135927099003)(261026140227099003)(261021121427099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmRDZnhlNW1Vbk1lcHFvSUYzWGdOTEE2dForaEhGZFFYZ2tvaVR1WHIwR3lk?=
 =?utf-8?B?bWhHSjM1blk5V2ozOFBDM2tXbCtxVjIzUFFNdU5ncDhPRXBBZkNCUE55TXV4?=
 =?utf-8?B?MGZUb00rRnhiWUo1WHlWM3lkbjdlUXFBaW94MmZ6OVhpaU1vem9iNGUwNGg3?=
 =?utf-8?B?dm9MT0ZrNkljU3JnU3A5a3RndVdxM2xkRUpHbmFDeGhEYlZCWlI3S2JhVDd5?=
 =?utf-8?B?cENUaFM2Y3kzU1UzR29SSkM4aG1OcVlOcEh6RGkxQ05HaWt6Y2FNeGRaZUxB?=
 =?utf-8?B?R2l6YXF4ZVJuNVZmOStaSXY3ZXZCTWVFc1JneER4dHpiSW53ZjAxZW5RZHRa?=
 =?utf-8?B?V083dlVyQk94TzNmTG9pcFVPK0FyQkdsdVNpRFg4anV0SnVwWW11TkNBSFk2?=
 =?utf-8?B?TkZMam50aXp0UlZrUjVRYXBXN1RCcTZSU1ZsNE1TN2FPVlF2eFpFR1JUTjZ0?=
 =?utf-8?B?QmhxNFBaMnNNaGJ0bjVGalQ5aDV0b3NDVkk2WmVFR0FlSHVidTdRR3JxL25X?=
 =?utf-8?B?S3BWc2hCNERWeU8vWTdpNFl6MFUwOVJ3V3U1S3hCZHNHUWVlTkg3LzFGSnV0?=
 =?utf-8?B?bFkzOUlJSFlIc1BteThjSEtMa2JZRlZRUU5SNW5WdHpJOXpsRHBJZTdRWFI4?=
 =?utf-8?B?OFJHb1NMWjF0UFQ1WUlCbUZMV284UmlVa0c1RTZGSlVTZ0kvOU1BS0RNRDA0?=
 =?utf-8?B?WEFnTnJUb2t1eDlnZ3ZQb1EyYXljQ01pZE5RUGQ0dkp3VEFNTzBkRTdjd1Ns?=
 =?utf-8?B?V1VEREUvT1JCSWFUa29rQWFnY3BQSzE2UzBzUmFZc1VybXBJeitsZzZXNkFs?=
 =?utf-8?B?c3Z4MkRHcmJqRG9BcHFvZXg5b2NtRXRNOEx5d29DaUFFRlA5QzFrZW1VK2ht?=
 =?utf-8?B?Wjdod3NNU1NwRDczeThuUDVGT3FCS0o3SVgzVnkvek1GS3RPUU5lR2JLeXQ2?=
 =?utf-8?B?cnBWMHAyUWVGdlQvdHpxSm1ya3hHT01ZVmpwWkZRWDVidHY5YnNlb1F6QkJr?=
 =?utf-8?B?QXdDdFhuVzI5cjRKOG9HdFJVSmtNWHpFWllMZE10NDFndWFoUWkzbVUya2g0?=
 =?utf-8?B?OUhkblZQV01tTlM3eXgzVHh2ZmkvSTEwb2lGOGxOT0FlWUVlbVdiMFRXNU5a?=
 =?utf-8?B?eVUyQXl0bmQ3SWg5ZEpWOVBSTE1YRVN6OWw0WDBXdmhCSU51UkRXYXNVMTRI?=
 =?utf-8?B?NGt0QjBUdXFWMWdsd0Q1OFl4MnJwS3g0a1p4djdPaGpoRC9UeDZ2aEErQTJY?=
 =?utf-8?B?RmZIZmwwYkhqd0lWREZ3ZThxaGprZkNTTFdEelNvWE1mZXBMWUVVdklsclFW?=
 =?utf-8?B?NTFyZ0FiUXdpbmhrZkJlbW5UNExSZGU1U3ZWTDdlTFRRTzNjMDZKSi9UQVZ4?=
 =?utf-8?B?amkxQWFCUVZTY00wYnRJc25HeXd6RjRCaTVyWXN6Mm1QekdvUHlLaUQ2NDhp?=
 =?utf-8?B?ZFN0UTdzOVR3TDRwRm5wYXRTYlBGUGFlRFRWNFE5dWJ5MFhkWDVwWkZ5WGRM?=
 =?utf-8?B?LzlXWSt3aElUdXRzNlFzeGJTR1dudGExTmpDTEQzaWhEenFtRzMzNUtudDJB?=
 =?utf-8?B?MGZPcXVNNGNTOTc0Tlhhb0tjZWNvQzgxM1c2L0JrZE41N0E2NjdMZVgzSzFU?=
 =?utf-8?B?ZXE2d01vbCtaNE9Zb1cxREsxTWo2UmkwS0FQeklXRWZYWGZUK0JXazJrUVBQ?=
 =?utf-8?B?K1F1bXJOU0lLc2prSnY3ajJBU2FsUlR5cHlWVVRLMFZOWmh1VzNHcXFudDdV?=
 =?utf-8?B?emc4NU53enZBZ1hBRTdNNmZOaC91ZDU2VDh4Y2ZOZ0Y3Y1ZyOElqZXFxUjFu?=
 =?utf-8?B?YWRTb2hsYlhkelZLbit0VExoM2dHUWxKa0JvZm5CRjIwa1laYUxCN21yQUVD?=
 =?utf-8?B?NFdZM1RVTUpvd0pwMjdlMGxtV0ZSOUpaMHFUOWtBbVJBeFQzdGRUTVJ2UFFj?=
 =?utf-8?B?NVlrVHVEOGN1Sk5hQnNWdnplWmZxVms0QUtHYm55RXM0SFhVMUI3MjZRcWk4?=
 =?utf-8?B?S2lPVFVnN3RaOHAyS2wyRm42dE5nZ3YveGppamFGbVdjbFpLYWc3U1ZYRmJh?=
 =?utf-8?B?aVdGU05CMEZCZVIrMWdQMXNCWWhFWFdNUmk1cndub2RjSDRPeUtBNDlnSmRw?=
 =?utf-8?B?b2hmSlRpczFlWVVBcSswZWp0d1ZuVjhhc1F3Q2sxaVZhUmRrOG9iOW4raUpW?=
 =?utf-8?B?ME9RQk95V2MvV3VQWGhZMk0xUUlpbnFLelBmakl1emJrc0lRSjJlenVQS1lP?=
 =?utf-8?B?VHE2TmZUei9iTTdTREpGZVRHVllQM0RFUXZsNFE2VHM2V1NIN3J5cHB3NzVi?=
 =?utf-8?B?WVBzdFBKNkNjNjZ6alZKbExvbDN3bk1GVkdRd2xGbGRWR3ZHQ1BBVGhDamhH?=
 =?utf-8?Q?tgDGeUxeYeXOGrFA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <095CBB877C265B4DBCD769C36B3B7EB7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jAQ80/cH4qRqZqE4y5KBoA+WHBv4tErYJf7tOeKd1QN4WwS8e0jBkN3xA5ZV8MOVbk0DGF7xdyGh1C8HBoXcUCXLviW6uqTp6O7VBUAGFrTZgkEOMFtmx/NExT1rGWaKlswUK/S6Uo5VcSwsf4ommRj93LQj5E17OKEJCz/m1wu7oHZ+dUFw9cRi4MvGgcpngIuGrzNd2DOUz4XfFPgsgICtxsT+IupnVwdLMWqv9elG7Rlj3VCmXMSsOZ09TDViqG17GofSmzWUO9h9hv/xYhh3CVlgydMgSfLlXCM6dJmG6g3B0BKE7fR4PgNL522FwBkWShi4dbbqikWthBxgNQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a05f14-5a0f-42af-3461-08df3ff73b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:25:19.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoJKillRVR4Z15R8E14wRGCRpPK6P/vY3YLIS0tYlQYfdR0w6yMSLgSJNDpRpc6eWK5etBCQDwLAuTxAM7ix3gQXrwpY9Bg9Hcye28vCxOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6721
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_052530_983101_F8C902CC 
X-CRM114-Status: GOOD (  33.53  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24g5LiALCAyMDI2LTExLTA5IGF0IDE0OjU2ICswMTAwLCBLb25yYWQgRHliY2lvIHdyb3RlOg0K
PiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiAxMS83LzI2IDg6MDQgUE0sIFN2ZW4gUGV0ZXIgd3JvdGU6
DQo+ID4gPiBBZGQgYSBuZXcgZmlsZSBwbGF0LmMgdG8gcmVnaXN0ZXIgcGxhdGZvcm0gTkhJIGRy
aXZlciBmb3INCj4gPiA+IE1lZGlhVGVrDQo+ID4gPiBtdDg5MDEvbXQ4OTkyIFNvQ3MuDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlh
dGVrLmNvbT4NCj4gPiA+IA0KPiA+IA0KPiA+IFsuLi5dDQo+ID4gDQo+ID4gPiArDQo+ID4gPiAr
c3RhdGljIHZvaWQgbmhpX3BsYXRfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiA+ICt7DQo+ID4gPiArwqDCoMKgIG5oaV9wbGF0X2RvX3JlbW92ZShwZGV2LCB0cnVl
KTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArDQo+ID4gPiArI2lmZGVmIENPTkZJR19PRg0K
PiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG5oaV9wbGF0X29mX21hdGNo
W10gPSB7DQo+ID4gPiArwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAidGh1bmRlcmJvbHQtcGxhdGZv
cm0iIH0sDQo+ID4gDQo+ID4gRG8geW91IGFscmVhZHkgaGF2ZSBoYXJkd2FyZSB0aGF0IHByb2Jl
cyB2aWEgZGV2aWNlIHRyZWU/IFlvdSdsbA0KPiA+IGhhdmUgdG8NCj4gPiB3cml0ZSBiaW5kaW5n
cyBhbmQgZ2V0IHRoZW0gcmV2aWV3ZWQgYmVmb3JlIGFkZGluZyBhbnkgY29tcGF0aWJsZQ0KPiA+
IGhlcmUuDQo+ID4gR2VuZXJpYyBvbmVzIGxpa2UgeW91IHVzZWQgaGVyZSBhcmVuJ3QgdXN1YWxs
eSBhbGxvd2VkLg0KPiA+IA0KPiA+IElmIHlvdSBkb24ndCBoYXZlIGEgZHRzIGJhc2VkIHBsYXRm
b3JtIEknZCBwcm9iYWJseSBkcm9wIHRoaXMsIG5vdA0KPiA+IG11Y2ggb2YNCj4gPiB0aGlzIGNv
ZGUgaGVyZSBpcyBlLmcuIHJlLXVzYWJsZSBmb3IgQXBwbGUgc2luY2UgdGhleSBsaWtlIHRvIHRo
aW5rDQo+ID4gdmVyeQ0KPiA+IGRpZmZlcmVudCwgc2VlIG15IHNlcmllcyBpbiBbMV0gdGhhdCBJ
IGNhbiBwaWNrIHVwIGFnYWluIG5vdyB0aGF0DQo+ID4gd2UNCj4gPiBtYWRlIHByb2dyZXNzIG9u
IGhvdyB0byByZXByZXNlbnQgY29ubmVjdGlvbnMgYmV0d2VlbiB0aGUgTkhJIGFuZA0KPiA+IHRo
ZQ0KPiA+IHByb3RvY29sIGFkYXB0ZXJzLg0KPiA+IA0KPiA+IE5vdCBzdXJlIGFib3V0IHF1YWxj
b20gc2luY2UgSSBoYXZlbid0IHNlZW4gYSBzZXJpZXMgZm9yIHRoZSBOSEkNCj4gPiB5ZXQgYnV0
DQo+ID4gSSdtIHN1cmUgS29ucmFkIGNhbiBjb21tZW50IHRoZXJlLiBJIGtpbmRhIGV4cGVjdCB0
aGF0IGl0IHdvbid0DQo+ID4gaGF2ZQ0KPiA+IG11Y2ggc2hhcmVkIGNvZGUgZWl0aGVyLg0KPiAN
Cj4gV2UncmUgaW4gdGhlIHNhbWUgYm9hdCByZWdhcmRpbmcgdGhpbmtpbmcgZGlmZmVyZW50LiBU
aGlzIGRyaXZlciBpcw0KPiBmb3IgaW1wbGVtZW50YXRpb25zIHdoZXJlIHRoZSB1bmRlcmx5aW5n
IGhhcmR3YXJlIGlzIGFic3RyYWN0ZWQgYXdheQ0KPiAoYmUgaXQgdGhyb3VnaCBhcmNoaXRlY3R1
cmUgb3IgaW50ZXJtZWRpYXRlIGZpcm13YXJlKSBhbmQgdGhlIFRCVA0KPiBsYXllciB3cml0ZXMg
YXJlIGVub3VnaCB0byBlLmcuIHBvd2VyIHNlcXVlbmNlIHRoZSBjb25uZWN0ZWQgYnVzZXMsDQo+
IGp1c3QgbGlrZSBvbiBJbnRlbC4NCllvdSBhcmUgcmlnaHQsIG9uIE1lZGlhVGVrIHBsYXRmb3Jt
cywgYWxsIHZlbmRvci1zcGVjaWZpYyBvcGVyYXRpb25zDQphbmQgcG93ZXIgc2VxdWVuY2luZyBh
cmUgaGlkZGVuIGluc2lkZSB0aGUgZmlybXdhcmUgYW5kIGhhbmRsZWQgdmlhDQpBQ1BJIGV2ZW50
cywgc28gbm8gdmVuZG9yIHF1aXJrcyBhcmUgbmVlZGVkIGluIHRoZSBrZXJuZWwgZHJpdmVyDQpp
ZGVhbGx5LCBhdCBsZWFzdCB1bnRpbCBub3cuIFRoaXMgYWxsb3dzIHRoZSBleGFjdCBzYW1lIGZp
cm13YXJlIHRvDQpzdXBwb3J0IGJvdGggV2luZG93cyBhbmQgTGludXggKFVidW50dSkgdXNpbmcg
YSBnZW5lcmljIHVzYjQgZHJpdmVyLg0KDQpUaGFua3MNCj4gDQo+IEZvciB0aGUgT0YgY29tcGF0
aWJsZSwgd2UgZGVmaW5pdGVseSBkbyBuZWVkIGJpbmRpbmdzIGFuZCBJIHRvbyB3b3VsZA0KPiBs
aWtlIHRvIGtub3cgaWYgdGhpcyBpcyBhY3R1YWxseSBleGVyY2lzZWQgLSBpZiBub3QsIHdlIHNo
b3VsZCBjdXQgaXQNCj4gb3V0IGFuZCB0cml2aWFsbHkgYnJpbmcgaXQgYmFjayB3aGVuL2lmIHRo
ZSBuZWVkIGNvbWVzIGFyb3VuZC4NCj4gDQo+ID4gVGFrZSBhIGxvb2sgYXQgZS5nLiBtb3JlIHJl
Y2VudCBkcml2ZXJzIGluIGRyaXZlcnMvdXNiL2R3YzM6IFRoZXkNCj4gPiB1c3VhbGx5IGFkZCBh
IGR3YzMtJHZlbmRvci5jIGZpbGUgdGhhdCB0YWtlcyBjYXJlIG9mIGFsbCB0aGUNCj4gPiB2ZW5k
b3Itc3BlY2lmaWMgcXVpcmtzIGFuZCB0aGF0IGVuZHMgdXAgYmVpbmcgbmljZXIgdGhhbiBhIHNp
bmdsZQ0KPiA+IHBsYXRmb3JtLmMgZmlsZSB3aXRoIHRvbnMgb2YgcXVpcmtzIGFuZCBzZXBhcmF0
ZSBjb2RlIHBhdGhzIGZvcg0KPiA+IGVhY2ggYW5kDQo+ID4gZXZlcnkgdmVuZG9yLg0KPiANCj4g
WWVhaCwgdGhpcyBpcyBhIG5pY2UgcGFyYWxsZWwuIEFkZGluZyB0byBpdCwgdGhlcmUgbm90IG9u
bHkgZXhpc3QNCj4gZHdjMy0kdmVuZG9yIGRyaXZlcnMgdGhhdCB0YWtlIGNhcmUgb2YgdGhlIGFk
ZGl0aW9uYWwgcmVnaXN0ZXJzIGFuZA0KPiB3aGF0bm90LCBidXQgYWxzbyBldmVyeXRoaW5nIGFy
b3VuZCB0aGUgVVNCIHN1YnN5c3RlbSAtIFBIWXMsIHBlcmhhcHMNCj4gc29tZSBOb0MgZHJpdmVy
cywgYW5kIGFsbCB0aGUgaW5mcmEgdGhhdCBmZWVkcyBpbnRvIHRoZXJlLCBhbmQgaXQNCj4gY29t
cG91bmRzIGJhY2sgaW50byB0aGUgc2l6ZSBvZiBzb21lIG9mIHRob3NlIGR3YzMgZ2x1ZSBkcml2
ZXJzLi4NCj4gDQo+IA0KPiBUaGF0IGJlaW5nIHNhaWQsIHRoZSBtYWtlcnMgb2YgdGhlIHNwZWMg
cHJvYmFibHkgd2FudGVkL2V4cGVjdGVkIHRoZQ0KPiBoYXJkd2FyZSB0byBoYXZlIGV4YWN0bHkg
dGhpcyBuZWF0IGxldmVsIG9mIGFic3RyYWN0aW9uIGFuZCBJDQo+IHdvdWxkbid0IGJlIHN1cnBy
aXNlZCBpZiBtb3JlIGRlc2lnbnMgZW5kIHVwIGJlaW5nIGNvbXBhdGlibGUuIE9yIGlmDQo+IHRo
ZSBwbGF0Zm9ybSBmaXJtd2FyZSBtYWtlcyBpdCBhcHBlYXIgc28uDQo+IA0KPiBLb25yYWQNCg0K

