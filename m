Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2AC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 06:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MqCrPC7iomxswmnpXARVDfVOHOt4z1iHDgpxd8nitQ=; b=hKYv2MYPwRbg9mD/8BxeEKCv+z
	yEIwvxbH10RjAmA7XfQ5vOOksqYmi67Ld9MvMiQkNJ6UreeYxDM0yi2c5Xs9ng7nAOjwtcAJdpL78
	N6YktWDmStuwj62izU/mQKVllkay3O1A+ve2MQfW5zQxPrI4vhNzUga/2UmY06ZxDe/oShQQMqBq3
	vzMUBtthViAmsHdwgp58lP7qVLN+Y9PwbVvdMWymVXnJh6dsy4UvCYJ2iCiKNVqeLDd2GAEpAqB1P
	eMgK4FmnVdzRH+bUWBlR4Bt5vFs5ZPvTLasEPUTBGqAptSqGcUCexs2K9eCSRuosXx3oMpFufh5mO
	0yxwqSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoYo-00000000oJn-0pzi;
	Wed, 01 Jul 2026 06:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoYl-00000000oJM-0UNb
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 06:36:36 +0000
X-UUID: 31b62168751711f1acbe4559397dec65-20260630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/MqCrPC7iomxswmnpXARVDfVOHOt4z1iHDgpxd8nitQ=;
	b=J/uQXQNU36Y/Rzg9C9OYGTkAM2We4HXHZ8kNNg/o4fBRCkBxe2rC3DWQZhyuqKx97Al6yqbBMQ5EI/6O0b4YKqjK0yH/nnEUW9ybK4KmahNKQ6gsrUK8XKiyzcumnMKvvkvfIKwuoMxuUemRvzhdxoXu1jYvOFMSJp/nagoUNmw=;
X-CID-CACHE: Type:Local,Time:202606302335-07,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:e33edf63-4d8f-4dec-9be0-ac498ad7d23f,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:d497b38,CLOUDID:2abe2904-3795-4a90-800e-68e9393a343e,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:4|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31b62168751711f1acbe4559397dec65-20260630
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1714858336; Tue, 30 Jun 2026 23:36:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Jul 2026 14:36:28 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Jul 2026 14:36:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THLWBo7IdC4grHpY6tUJoBDTXn3z9/TDG5zay4gcXCITqiSinoX68NTuoAltRTuwCn9inpEl+KUW3tgeb8g2mdbsZXX8e6mFD7ZaStB0UO7n1s+R2dw0s8PumFiVSC2rTqWwQ0XWPGTgowG86xpntvVnXv3lAcWCiABo8NDXYdz+Tk3Ho3WgKNy803VEAmzqA350ABptVOifxwqn8zjJGOiUb4LHEUBUbOIQPG9kxu80zadHlRoCi3319Roibc0+UVG+Z9NyFaxwc1FHJj5aoF9jsg34LtapYRzEB5V/ZLg4uevOb4JiFmCVL6yGT3pkNt6KmMGNzMpB4yqZIzOnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MqCrPC7iomxswmnpXARVDfVOHOt4z1iHDgpxd8nitQ=;
 b=tzD4CUIogQ+DJix/sfMlLA4O1C0Ucmtn8bNg+3paSM5+g86fa1lUK/74XaORz+3R+A6V4RhwF2mPWcCf/myjDnAuWeQXiQrB6J6y2EtAJW4Mzk3AAgs1EwM4EIWWnD1S4GRGCy4YCwMiWtQ6j5ukW5jI15GQG1P30xe81SXeAKIeqTvaMEWeNursxhM3JzS9BfzBwgKingZBWv1IUcIxsh2sKEN+8XhS5sBX6pRMbLYSb7bT7OWd9WiSRVQ7PiaKxwuCioOxHkOrFLy/k+XQW4AupFStf8PGFZol1tlWeRDUsAUeXEG5G67qp1orUGT1qaCq98192m6ftmAWD/Xq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MqCrPC7iomxswmnpXARVDfVOHOt4z1iHDgpxd8nitQ=;
 b=ka6Bvwl/CXtOUIeGmuclvVsAWknlmXIrmxjTVQPfXuDrTXL+NbuP8wBVDwtEPUauYt8YZVTUHc1EYxDMYpQbtAPV/weLHdsUU/kEYzwM2zXj/cx8RrESE7JI3fxbniJ9x3ry0s1kZlbDzWPzYwTqiUhz7rs0bijzvtezVPlZX20=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEYPR03MB7861.apcprd03.prod.outlook.com (2603:1096:101:178::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:36:22 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:36:22 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor@kernel.org"
	<conor@kernel.org>
CC: =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-devicetree@vger.kernel.org"
	<linux-devicetree@vger.kernel.org>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Topic: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Index: AQHdBUBFkhMTBcaOR0CLIaZtsVPeSrZQgmIAgAB6+QCAB0AAgA==
Date: Wed, 1 Jul 2026 06:36:22 +0000
Message-ID: <e8fb727e51fa6231decee7d520d339533b705f73.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
	 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
	 <20260626-rewrap-sediment-ad9449abd837@spud>
In-Reply-To: <20260626-rewrap-sediment-ad9449abd837@spud>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEYPR03MB7861:EE_
x-ms-office365-filtering-correlation-id: 6f3b116b-ad23-4bb8-bd46-08ded73b114a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|4143699003|11063799006|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: ddxgR0OgV43OOjzZwqR7QjQq9s3GCI3n2GSBnXBQ689Z868dgK18U5Aa8KSi7G0wi6EuwyCD+A4rVmkhKJS4zXQ+kGApWyDURYQpdyWzaNVinrw0jZzJNSpHraQfB2+u5iX3R/H3L1q+A8KJRku1JvcVlbInVoNfiTs9S6pi1dPYkkKaal/X7PCqY8BbnXitVT3eFpdfyVfbe6XyoelrsgwEC77FlGLmMj1PRuz01tjGgJRBRx5ib5C588KG3CnvIVeVOGlLkga4OIKP4B/2o+NvpBpRSwCMJ3Rqwt7SdlmkaRFnM27WhmE6ELD3k5smf/oY7bfaS7K5GxIhAzrLFBtkHZvxVALsW3/Rfr1GfkYGw4r9fvKOZzrJDVDBs1i5vxAbyOIRYQI9v2OPKyJ5pQNwxEbuqbN8XR93yak+FEIX5Wr3LiS3E9gKhG4Mn8Dza5ZcAQ3W0wd3cFMldPqTAjLmVXD0VreeehcCM0dOWUn5VzAF1WQbs139vI5GDaRxYpsHrJ1IAAvOshCkVGnxlqYVRDibisMMCxR5NPvEiKfIUOZYhl3F9/AUKWBM1XZodG0VTsNCLGD+UJ9jeBfeGW6grG7YlufKT3DQM5rGedU3Rl/cr9DXnyUk1f2d8JMsJQ2MvQyiT83FIa5aS/EaZS0WAL0Eda5cw2uDk3CQ5cST1kOZWDoQKIA30T03mGeDF7NL4NiEGsd3geidPHJ77Dxqa3sGX1aBdUyLCmSXt8s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2pVR3RsY2hIOHduayszR2d3UEl2T1RuMTh2M01rRVE2a0pyQlhPYlF2akJR?=
 =?utf-8?B?enlNL0laSitXWi9LY0ZpZUdiWFhLLzVmY2pqa1F5UTc1RTlLL2ZzTExIUkMy?=
 =?utf-8?B?a0trc1VRcGMyTCtRMm53dXdHcjJYMCs0OU9JK0p3clZvREZLVEpSbmZ3cG12?=
 =?utf-8?B?cWNUYk9mZEhTYTR4WUg0bVlOdkwxOHVsUWFhNWVHZytaRjVaWEtoVWdIU2ky?=
 =?utf-8?B?dGVhZ1NnTnRTSzVrSkdua0xlMks3ZEJVdU15N0lHLzBiYzgvTWZqUnBUeEkw?=
 =?utf-8?B?Z3RsKzlHc2xvUldjRG5PVkNYdnZoWURENzB4MU8wMHh4S0ZEWDBXbGRXblhK?=
 =?utf-8?B?OThCVmlHOEpoUkR0N3l6ZDZYUUJEVC9pTk5odlhZYWw5b3QvY0o0RFRmRVlY?=
 =?utf-8?B?NlNURllsSUlLK3MzK1hQSlZEdTR1L1lsSWRyaXBLTmFsL3cwZ2doT1FvTnNw?=
 =?utf-8?B?ZkI0OUlIT3VTcDBVMkZHQlJFRTZrcmkwbHpXYkpndkRQMm1Jc3pLZkx0MTh4?=
 =?utf-8?B?ajJlK0pydVQ0KzJ4RmhvdVJHb2lrZy85R0FYNWUxMERQM3Z0ZGFraS82L2t3?=
 =?utf-8?B?NzAxVXpwdXREU2pQWUkvM0E1WWZjRWxBRzY1cWJqdkpvZ0xrOFdTem5SY21R?=
 =?utf-8?B?ZzhONUdsM2htdGt6NzNxOWsyd2VRWlNxWWJtS3pzangxNWsxMDVSd3lPOHds?=
 =?utf-8?B?WnJjTXBra3dGdDRjTE1sQlgvcU5BdHRLVlc3eGlrbVVZaXZPRlJzZ3BmVzFu?=
 =?utf-8?B?eGxTZlUya3NrYVZBVnhWYmo4TlRPT1ZsRWlGVjZieGhJNTJIQTB1eXF4V0w0?=
 =?utf-8?B?K05YL1lEU092NnFDMjJpQ2xtaTlEamRkYWlyQ01CbFBjRWc2NFduSXpIc0lt?=
 =?utf-8?B?d2hSL3A0QzBHOXRhS09pNGdtd2JvL1FzZDl5S1dxTWppNkowMktEUDhSRUNJ?=
 =?utf-8?B?NkcwZHNCM0FzYnhySklpNG5FSXpNb0RFNGh5U3c2YzRjN1dzTzdjUGhxQTB1?=
 =?utf-8?B?Zi9NQndMOE1rNWoxNGk2WW9kSGEyRzNncHRNMTRROG1ERXAveDErRURkZExl?=
 =?utf-8?B?YWxraWFZMGxoRlZPLzdjMXJlandLandlWjJ1UGsyRDhqMFgxRXFmeVlWMHIx?=
 =?utf-8?B?U1RnZ3dMU2VBamtqQ213ZWNwTFZkTklmSThVRU94WjlacDcwVTMrK0FkVEZo?=
 =?utf-8?B?Sm4wM2VrWnlZTFlXcEl6TWJFTjR5a1I1S3RJKzVlYlY4S1FwSWlSeStHc0Ra?=
 =?utf-8?B?Vm5qcC9oODVNQlRiM0ttYU5JVHd1VjhvOXFLRUZPR2Zkb0RQSHBCVXNRclFM?=
 =?utf-8?B?cHlJSkVuSVhINXZvZzQ4dGNFS3NRWUxLYXZQUzVkby9UNzFuU3hqWklhSk4x?=
 =?utf-8?B?TVdpeFlGRzZNcmNnbHhiVWduM3VHZWl0NkdFamV4azR5aXFjek1iaStka3cz?=
 =?utf-8?B?NkpVUitid1hSelVmakwvM3ZyVjVSUEc3OG5TclhXWEQ5RVYyUHVwb1ZYL3FM?=
 =?utf-8?B?dUtQeU5Obk4wRytTQjdYSitVTjJuWXVaSmpYa2p5RUtiWmNRM2hiQmVDcWFT?=
 =?utf-8?B?WGtxNFljSGNhSVVUTG8yS0wyOENyU21MWm0yd0pXUzJKMTN3YXlvelRSTmRL?=
 =?utf-8?B?K3dCTVBscm9UcVRuOHoxd1JMb2twUW5wRzZhYnBlT0hFdExObEZrV05DWERy?=
 =?utf-8?B?VTNZczEyZVRJQ2NEaStJSGlPa1laOWhTRGtUdFV1UVNXVG11UHcwSjBmRzFh?=
 =?utf-8?B?bFA1cW1ldzFPZUJnNW9NMHhvMUpYYmNiOFEwcDE4VE52eitjUCtpLzdEMjNw?=
 =?utf-8?B?Nm9RRkxRTXJ0ZWZwWHQxWFlCYTdQSVhyTUdEL1BOdDE3Wm9lSThxZmhzTURV?=
 =?utf-8?B?b2EwNlZ5Sno3NU5jdEJRYStRWkpmL096Q2t1U1duOVhFN1A3NnduTGFkcU4x?=
 =?utf-8?B?TU80TlowUFlEdnJJM3F0SjBpYitoVWVUUCtLeGFFMjNkSVMxQmFoa1EyM0Nr?=
 =?utf-8?B?NVhsTWFSbERpbGlMalFscWsyVEFMazh6bGtURTZha2thNk9uSG1aN2kvNk1s?=
 =?utf-8?B?ZEVOc08zMVQ1ek1URk04UllTU2RackVEWjhUdEIxOStSVFFjYjNqdllnL0Rl?=
 =?utf-8?B?Q0swbS83SmFyVFhManJhZDVDZnYxZzZiY29CV0hjUWU0TzJsQzhablZXSmx5?=
 =?utf-8?B?VFE1QzRYYzE1YW1BTm5ZZHMzTTNNTVEyTHk4OVVmMnNncjNVZU9ad1kxczR6?=
 =?utf-8?B?Y2szeWdMM0p1NDN0Zm54TGkwaW1uZ2JTRi9td0JkY0VzUjR5dkxrNzVBTkcy?=
 =?utf-8?B?SjlUaWMvZG9qd1lrZHJ3cWNXL3pkei9rWnFxY3UyUXJsWlpYRThON2plaFV2?=
 =?utf-8?Q?28tL/rXKBNqJx+Tw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC440ED7F4C15F4EA21F33A6C9B3D370@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eG7SLTW/wUFZvVEgQxns6Ea6RFLXTjnt7V8AdmGq7pIy/gjKJea0GnLDfhFC+5hbbJVNu9+L2pjaq07o19FWf7fclsLQKqdyYduaiIOEsx1tT+va4RkaBe0gf18sWQdnIqxXuhCi8kLLS71w0CEMJCHpkDyJ6zu/L2/vNtD1qiEUbRR/ba+jlAp4luwk3MnMYGpOR3Qzos7EiudMhq6eT+VosRszciOcJSGcB4jqiUggO9YkFIDPNtEuiqtR1slhJRNh3+1anbLdHO8J05jFG13XkJ+DJ7Rm6dsmEc7Fq6m5PWYyzdo0heWsoXHIs9fpmxkxEbvEuFLMGIxhUVrw7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b116b-ad23-4bb8-bd46-08ded73b114a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:36:22.5710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCc3KVdanBHHNxltD/cOm6ktnTmMqcJheXHf5s8rFAxpK/7ieiBuXUSKIt48qZeHtL2PNBgwQ+pBxwdTt8SItw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7861
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_233635_191504_F276FACC 
X-CRM114-Status: GOOD (  15.74  )
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

T24gRnJpLCAyMDI2LTA2LTI2IGF0IDE2OjUzICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IA0KPiBJdCBpc24ndCBnb2luZyB0byBleGlzdCwgc2luY2Ugd2Ugd2lsbCBjaHVjayBhIGZpdCBh
dCB0aGUgdW5kZXJzY29yZSENCj4gDQoNCkhpIENvbm9yLA0KDQpUaGFua3MgZm9yIHRoZSByZXZp
ZXcuDQpJIGFwb2xvZ2l6ZSBmb3IgdGhlIG1pc3Rha2UgaW4gdXNpbmcgdGhpcyBiYWQgZXhhbXBs
ZXMuDQpJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gPiANCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxNjg0MDAwMCAweDEwMDA+Ow0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgICNz
aXplLWNlbGxzID0gPDE+Ow0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgIHVmczBjZmdh
b19yc3Q6IHJlc2V0LWNvbnRyb2xsZXIgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxzeXNjb24tcmVzZXQiOw0KPiA+IA0KPiA+IEl0IGxvb2tz
IHRvIG1lIGxpa2UgdGhpcyBpcyBqdXN0IHR3byByZWdpc3RlcnMgaW5zaWRlIHVmczBjZmdfYW8s
DQo+ID4gbm90IGENCj4gPiBzZXBhcmF0ZSBkZXZpY2UuIFdoeSBkb24ndCB5b3UganVzdCBhZGQg
I3Jlc2V0LWNlbGxzIHRvIHRoZSBwYXJlbnQNCj4gPiBub2RlPw0KPiANCj4gSSBjb25jdXIsIHNl
ZW1zIGxpa2UgaXQgc2hvdWxkIGJlIGluIHRoZSBwYXJlbnQuDQo+IHB3LWJvdDogY2hhbmdlcy1y
ZXF1ZXN0ZWQNCj4gDQo+IA0KDQpUaGlzIGlzIGZvciBmbGV4aWJpbGl0eSBpbiBNZWRpYVRlayBT
b0NzLCBhcyBkZXNjcmliZWQgaW4gdGhlDQpwcmV2aW91cyBlbWFpbC4NCg0KVGhhbmtzDQpQZXRl
cg0K

