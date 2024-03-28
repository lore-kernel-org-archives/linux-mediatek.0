Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933B7C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 05:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ6tTlyiytPIw2NUDjMG3177Yw51lIgFuRaYh9RfVzs=; b=K6OI+L34/shRe8xkplOk4GJ2CL
	eW5ZNKfQqQyvtAqG4FHiiOX7EPQQkW2mQalGPiz8InRpoyo3wzMBT9OdN3L+C1i/pEUwSVhzfKkvx
	KcyxwEc4Vl7MilQSAPzHnedqBJFzYh0oyn9ezM5hwe5gGQz9iOd7UMaZQ3XNdFvVVCvXbyO7aUKGH
	+5cfTZlkVCzq4RKJX7DgMnXOfFWeS1X5qLeZbJ+AdEd0xuzn0VauisnzFYbbXbMeEPtfxCp9i1Ldf
	zX47wBEy60zWDWErtmewPJOeXAYwZwDgs0OZzfQ5eqnztrV0CZTNo5NYuRWcS/fQ4mOx8Vfy1nnJO
	V0ZwfOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiDV-0000000CY3L-2eJX;
	Thu, 28 Mar 2024 05:22:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiDR-0000000CY1Z-2Rk1;
	Thu, 28 Mar 2024 05:22:19 +0000
X-UUID: 215bea2aecc311ee96d5dfc950b7243d-20240327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lJ6tTlyiytPIw2NUDjMG3177Yw51lIgFuRaYh9RfVzs=;
	b=AUDZFG/Oo6W8G0jP+VwDieo9NSdeJ/y2ig2lSkpD8yTuWsJYSTZFgbRFJSAvPeR64G8Ww+qhHHbiRRMJAtfBFQqBRkGKra/acBh09gCiHYVNdA5QK54EIrQxd+6HWvfBwkSj868lZwF01oQ2bTXuhBE9CgWENkcBUJzTCcEyjJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ff38e91f-c374-4b1c-9e49-36c580dd07aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:33dbed90-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 215bea2aecc311ee96d5dfc950b7243d-20240327
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 359650678; Wed, 27 Mar 2024 22:22:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Mar 2024 13:21:35 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Mar 2024 13:21:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT+hbv7hYuRKQ4+uKVHpXB2Vt1xQ/SOHmLegdOaMg9jD88u9UuxitJpKMvT38zNKtAUsiAUMB+fZ5qGAI0CiWQWzlUwJOp03h6ghl9+y8eqAFt9QKSHelGh0FinTsnZnVW7Fi4v1UkoZ4MLQX0KZAs0dDZbvZ/PvHnVWEH5V8jl+PoxRMNXpzbGXJoG1n5n7jybuGlCvYHwSqnl5KoOteY689rBJTB/lGDDSU9DbUoPWcEf3/AM8VVZbwFFljH0e1i3tK/+1JP4HrqfvQEzufSG2z/SNT9VrmJQk6U1EJT6+qOf8YX69UbMyifmSbMDk2kg+V03/TdQh1XYXkWX/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ6tTlyiytPIw2NUDjMG3177Yw51lIgFuRaYh9RfVzs=;
 b=G6NRmJ18XO53PDqPT9++yxxypojcGAR8apXOfDu2etX2W3Jvp4F9vbU7Q4xLVLB5ODAmUZZx4HWeg8pHIXJmxVaI9xgwh/aEUIgHhx4Bk8QDqTZ/hcZA0O+g2RTNOkqxoncvp6EZ6R65sds63buRZq0qsV3O79rGT2bfzu5kNGh2u3Csxl7ojViwatl5lfkoem38FZVlT6kIItY/d1DVfL7CYODM0UBMBvGoOFWQZ/MLWc8f8x1pQSOK+st0ALYC9Xp4cIBf9Z09zAdAstNgkTwcgnyI5bSEJp8ooHHPqBJOC02TWSBboTXhJC7MBt35UoWwy9C/dwIMc/4FR0Cq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ6tTlyiytPIw2NUDjMG3177Yw51lIgFuRaYh9RfVzs=;
 b=aU9XuKrRZIzYknE2bID3FEJxyPWd2kvpT2BabmUOB+7/PdHUEeg96Gq/ERtyeWETorZiGmn+QP9KptT0OdR6sLNYus2J9COLL7anw+KBy3iyynK0rV0cCakyGmNMAdmvFeE5NkF13WgHaYXK+7JS8dHSNk3Z5AmnIRkwG7oox10=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6889.apcprd03.prod.outlook.com (2603:1096:101:a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 05:21:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 05:21:32 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 13/14] drm/mediatek: Support CRC in OVL
Thread-Topic: [PATCH v6 13/14] drm/mediatek: Support CRC in OVL
Thread-Index: AQHafBnuG31tmVMTX0ycMIyG4NUwXrFJkMyAgAL1N4CAACFegA==
Date: Thu, 28 Mar 2024 05:21:32 +0000
Message-ID: <dc9314b7a54813af0f89fd9da1c85a0241d81267.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
	 <20240322052829.9893-14-shawn.sung@mediatek.com>
	 <10afc2842aea3700263c4accf0593b75e7209431.camel@mediatek.com>
	 <aefd4d8dd456face2aaa69698e019345148c005d.camel@mediatek.com>
In-Reply-To: <aefd4d8dd456face2aaa69698e019345148c005d.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6889:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gCNgvsZB9lIJU+L+/xx4S6Qid3bki58otQjXDA58SP1XGaFY0j7sXgVbGlAslbAdNptAm1jSCT8np4/dgDz9RpRgOB5oiJnowmvUlGPmM4tBVR2uqaRgwhdJK8LoctR/sHqY0TsGX6hgfa7LWv20Uj2ML6cW5hp2r7C1yiW+MmyUHTuvPHkpzz3im0Wr7PshPyPalvg1syiWRKRi4n3CCAY/CPV3kQaT8pPRYddolAqVG1uE3uz6mssUo5Br8Z8eku00LbiPjzpt3eQqg/ddFercUWg6PFFKidYRpGSlo5G0TArLcwpCnFef2DX5fO5YVSjYYcTCEUVJLXIiUTrloq4bpCns82b3YPeejw3LrPgKk3ovzUqzzMClTbR9Lt0+6RVL097K5QSE8paMxesk5H1P5/s0vWYm0Wb5/J+iRtGFZdn/rCs8SPZ9pA5TS9YNCUKXg4+v2XxvT2DLXOhhGCLMjmiVWJaIAyFFKcDQzw7k0muQ+IBqFbcw0YE2BnIbnrI7qjzoOYj3E4ApY1wSaj7We9nlaVCcxEf64iEXnl7XhhyCnUkKCGZ2UDZ5e/U3KZfP2MyFIIL1G3B3j/TXygm66KK2ihRS1LUz54phWeXJE2PzkiodOwPwxb+Z85sbF8csS3Y3vaM5aCTvSi0TnBCmJeoPVqSl4QVeKaMHB5Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXBoc3hqUG5TUjJ2Mys5K2JPNnZ0OHFDV2NjazRnQnZubmJzbVpaczVrcXM1?=
 =?utf-8?B?eXByMXJoY1RmdTM2YVJQZGRtZkdKQlVaRG5iRUdYVHhwY3JBZWRWNWNHdk5P?=
 =?utf-8?B?bDJXc0g3ZVlMZDY3Wk1xc2FMM003aUc3YjN1MEJGUXRWbEdUT00yRm54S0xx?=
 =?utf-8?B?dE16cWFsY01DbGhoanNkR1Z6S3UvM3VDYWZGSEVQRmNMM1JWV2pvcXZ0TU1Z?=
 =?utf-8?B?cFQ5eWNycjRydmU0dXE4TkllYTRhUUgzYUpXREN2Vm5BT2NlbkFZMHRjMjdW?=
 =?utf-8?B?UGpYU3kxcFcrSTl0b1pxcXF0M1BkWEI4ZDM3cjBsR1VjWTBiYmIwamdzb3pr?=
 =?utf-8?B?NDBVcHJJK01TSjQ5aTRHQWtxVGIzUkVIeFJxUktKWGdiYko5UHJtZVJkRXlx?=
 =?utf-8?B?aG5Rd2tENTZNSkVwNzJ1RDFQSThXOTFvRTY0ZmptdGxLcUo2UWN3WnVGZkpk?=
 =?utf-8?B?TFY0K3BFZlRralBHdDcyR0NKL2hEZUJGZ2tIcldqSDBlZlZnSG5McW1wSEFP?=
 =?utf-8?B?OEtEMS9BTjErQ2Ziajk2STFtN3g1NGI1TmpxUWJhS3o4TTJ6Rm1odkEycmJQ?=
 =?utf-8?B?YUR0amp3d1BJWjNnMEprRUZoRjgrL2U2OE5zT0JvMFpqNW1SOThTQ3FGNmRZ?=
 =?utf-8?B?SXJVRWkxL1JpYThQeXlPOG9EYWQ0bDFlOThEelk1WjdybXNVcEtyWnFvWE1X?=
 =?utf-8?B?MVN0ZjZFc0dUVVladHJIcGRuR2tJL3R3Z2pSWWl2RCtvcWNMNXlqZlFhbzRZ?=
 =?utf-8?B?eGlrWFVZTkF4RG5YYUlRODl4TEdjSHljaTFPT3o2RFBSYVczSlhVcWpWaTJW?=
 =?utf-8?B?c2cxeVBSSE9qM1o2cFVsL0N5bUF0eE9MNExqV1JDQjM5U3QvQ2FwdzVaaFIx?=
 =?utf-8?B?UjVuZkxjbFNOaXBLZzBiUC8vL3BsMXJMZUdjMXhYekRmc2FqWnNaRTF0S2NX?=
 =?utf-8?B?SlZIanlScFRncHordlJqcm5nQkw3VkgvelUvbE4wc1hDby9VQyt2YkorY0tW?=
 =?utf-8?B?czh5UUZJanRDQkp4ck1XVkhrcUQ5T2t2UXByVjRaVjhyb3ZGQnRUS3JGQ0Fs?=
 =?utf-8?B?azl1R3dVaEdiQ3FFT09LUnBqU2JMQ3NxNFRjbGwrdU13akYrb1JuVDllcytq?=
 =?utf-8?B?c0p1ajNZZy9mMGVBczVvYjFCTlpKTk5qVFhSbnJDQ2ZEZ25acHh6MldqZ29J?=
 =?utf-8?B?RkxnYzZ5OXVCOVZxckFRclBtNkpIRHpiSzNVb2plVlVmUXFhc1lnTDBxRUJs?=
 =?utf-8?B?WlpadGEyQkYyYk9TZ0ZEajdSVDNnRXB1WGxRVWxIdWNZNHgzdVJ1TDRkSG5S?=
 =?utf-8?B?bStyNUlMMERDMWNiNi8zSXZpQS9ncTZsSFMxa1J3MVMrLzFkSXBBRjZnZGpS?=
 =?utf-8?B?VEQ0Z2dudWdacmFVQm80ckdRT1c2T1FjZStpL0pZdzk1b2hhdFNPeDFqVmRP?=
 =?utf-8?B?NHNpRUtvQ1psZmxxeS9UYWkzUVR3UHlXbzdLNUVlTWdsWmhMcm12ZE9sbDBk?=
 =?utf-8?B?TldRTDM5a0diUDFURXVUOTQxQk1ZbHN5Nk00K2NBZDBobVBwZloxNExaOTBW?=
 =?utf-8?B?eHhDTldOYnQ4ZmJ0WVpZYXpaNVM2ZnI5L2dOUVlGSk1ubUxtYTlPQnJKVkIy?=
 =?utf-8?B?clNVT1FWdFhKU3NST1o0MGsvajloQ3c1ZnlVMUc0YkFMOUMxYlNVQXp6dWpK?=
 =?utf-8?B?aFBQSHNGTWwza25qNmdPN0kycDFLRW1hVDZmU0ZwZS9FdWFxU0VXaGpPUHZR?=
 =?utf-8?B?WC9iTDJiR3hlY2J1TXY4K0FBZE03NzYyN01lalZ2YU04OWxaVnV4N0NmU2RP?=
 =?utf-8?B?TDhnMGRTMW00OGhpT0hqV2IwT0tWOUlrQW1GVWc4UzFpRld2WkowcTBtVDVt?=
 =?utf-8?B?VVVpZ1RLUEM0RnRiZXoybmMzK1dLSHZFc0JZeDhLRWxXd0NoeUtIVjBOMmxw?=
 =?utf-8?B?QnNzdm5sMWdybUtJcUhkOGV2WURqRzQ3b0ZNeDM4VkhvMEF3b3VYMFdMSkp4?=
 =?utf-8?B?N2N3QmN2Z0RJZUMrajdOclJ5d043UDdUUjN6MlFuSnlJSjBKaW1aaVJkOFdN?=
 =?utf-8?B?LzJXZVBwY01oQ1duYmxKMDdqanpzbDNjOG13MndrL1VOaGpMZ1VXd2UzRS9o?=
 =?utf-8?Q?CXf3hIFImAP031+DZ5AOF6b5s?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B9DABED61DD624B910B2325DEFB692F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f29ed0-2df5-4871-4ef2-08dc4ee6ee24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 05:21:32.4315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOI7Q4CGBR8AAyzTOlTsM1FkKrQjVJPYklv3LdP76QY/O0UTE3O0RrNc73/ly2qWSbhB2cSafnH1qEvhMafPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_222217_729712_2F82563C 
X-CRM114-Status: GOOD (  36.57  )
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
Cc: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, "sean@poorly.run" <sean@poorly.run>, "jason-ch.chen@mediatek.corp-partner.google.com" <jason-ch.chen@mediatek.corp-partner.google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDMtMjggYXQgMDM6MjIgKzAwMDAsIFNoYXduIFN1
bmcgKOWui+WtneismSkgd3JvdGU6DQo+IEhpIENLLA0KPiANCj4gT24gVHVlLCAyMDI0LTAzLTI2
IGF0IDA2OjExICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiA+IEBAIC00ODgs
NiArNTY3LDgzIEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZQ0KPiA+
ID4gKmRldiwNCj4gPiA+IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gPiAgCSAgICAoc3RhdGUtPmJh
c2UuZmIgJiYgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkpDQo+ID4gPiAgCQlp
Z25vcmVfcGl4ZWxfYWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ID4gPiAgDQo+ID4gPiArCS8q
DQo+ID4gPiArCSAqIE9WTCBvbmx5IHN1cHBvcnRzIDggYml0cyBkYXRhIGluIENSQyBjYWxjdWxh
dGlvbiwgdHJhbnNmb3JtDQo+ID4gPiAxMC1iaXQNCj4gPiA+ICsJICogUkdCIHRvIDgtYml0IFJH
QiBieSBsZXZlcmFnaW5nIHRoZSBhYmlsaXR5IG9mIHRoZSBZMlIgKFlVVi0NCj4gPiA+IHRvLVJH
QikNCj4gPiA+ICsJICogaGFyZHdhcmUgdG8gbXVsdGlwbHkgY29lZmZpY2llbnRzLCBhbHRob3Vn
aCB0aGVyZSBpcyBub3RoaW5nDQo+ID4gPiB0byBkbw0KPiA+ID4gKwkgKiB3aXRoIHRoZSBZVVYg
Zm9ybWF0Lg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJaWYgKG92bC0+ZGF0YS0+c3VwcG9ydHNfY2xy
Zm10X2V4dCkgew0KPiA+ID4gKwkJdTMyIHkycl9jb2VmID0gMCwgeTJyX29mZnNldCA9IDAsIHIy
cl9jb2VmID0gMCwgY3NjX2VuDQo+ID4gPiA9IDA7DQo+ID4gPiArDQo+ID4gPiArCQlpZiAoaXNf
MTBiaXRfcmdiKGZtdCkpIHsNCj4gPiA+ICsJCQljb24gfD0gT1ZMX0NPTl9NVFhfQVVUT19ESVMg
fCBPVkxfQ09OX01UWF9FTiB8DQo+ID4gPiBPVkxfQ09OX01UWF9QUk9HUkFNTUFCTEU7DQo+ID4g
PiArDQo+ID4gPiArCQkJLyoNCj4gPiA+ICsJCQkgKiBZMlIgY29lZmZpY2llbnQgc2V0dGluZw0K
PiA+ID4gKwkJCSAqIGJpdCAxMyBpcyAyXjEsIGJpdCAxMiBpcyAyXjAsIGJpdCAxMSBpcyAyXi0N
Cj4gPiA+IDEsDQo+ID4gPiArCQkJICogYml0IDEwIGlzIDJeLTIgPSAwLjI1DQo+ID4gPiArCQkJ
ICovDQo+ID4gPiArCQkJeTJyX2NvZWYgPSBCSVQoMTApOw0KPiA+ID4gKw0KPiA+ID4gKwkJCS8q
IC0xIGluIDEwYml0ICovDQo+ID4gPiArCQkJeTJyX29mZnNldCA9IEdFTk1BU0soMTAsIDApIC0g
MTsNCj4gPiANCj4gPiBJIGRvbid0IGtub3cgd2h5IGRvIHRoaXM/IElmIGFuIGlucHV0IHZhbHVl
IGlzIDB4MTAwLCB0aGVuDQo+ID4gDQo+ID4gMHgxMDAgcmlnaHQgc2hpdCAyIGJpdCBiZWNvbWUg
MHg0MC4NCj4gPiAweDQwIC0gMSA9IDB4M2YuDQo+ID4gMHgzZiBsZWZ0IHNoaWZ0IDIgYml0IGJl
Y29tZSAweGZjLg0KPiA+IA0KPiA+IFNvIGlucHV0IDB4MTAwIGFuZCBvdXRwdXQgMHhmYy4gV2h5
Pw0KPiA+IA0KPiANCj4gVGhlcmUgaXMgbm8gaW5wdXQgaGVyZSwgYWxsIHRoZSBzZXR0aW5ncyBh
cmUgZGlyZWN0IGJpdCBhc3NpZ25tZW50LA0KPiBhbmQNCj4gYWxsIHRoZSB2YWx1ZXMgYXJlIGNh
bGN1bGF0ZWQgYnkgdGhlIGRlc2lnbmVyLiBUaGUgbWFpbiBwdXJwb3NlIG9mIGl0DQo+IGlzIHRv
IGNvbmZpZ3VyZSB0aGUgWTJSIG1vZHVsZSB0byBiZSBhYmxlIHRvIHRyYW5zZm9ybSAxMGJpdCBS
R0INCj4gZm9ybWF0DQo+IGludG8gOGJpdCBSR0IsIHdoaWxlIHRoaXMgaXMgbm90IFkyUiBtb2R1
bGUgaXMgb3JpZ2luYWxseSBkZXNpZ25lZA0KPiBmb3IuDQoNClRoZSBpbnB1dCBJIG1lYW4gaXMg
dGhlIGlucHV0IG9mIFkyUiwgdGhlIHBpeGVsIHZhbHVlLiBJZiBpbnB1dCBhIHBpeGVsDQp2YWx1
ZSAweDEwMCBpbnRvIFkyUiwgdGhlbiBZMlIgb3V0cHV0IHBpeGVsIHZhbHVlIDB4ZmMsIHdoeSBk
byB0aGlzPyBJDQp0aGluayBpdCBzaG91bGQgbm90IGJlIG1pbnVzIDEuIElmIHJlbW92ZSB0aGUg
bWludXMgMSwgdGhlbiBpbnB1dCAweDEwMA0KYW5kIG91dHB1dCAweDEwMC4NCg0KPiANCj4gPiA+
ICsNCj4gPiA+ICsJCQkvKg0KPiA+ID4gKwkJCSAqIFIyUiBjb2VmZmljaWVudCBzZXR0aW5nDQo+
ID4gPiArCQkJICogYml0IDE5IGlzIDJeMSwgYml0IDE4IGlzIDJeMCwgYml0IDE3IGlzIDJeLQ0K
PiA+ID4gMSwNCj4gPiA+ICsJCQkgKiBiaXQgMjAgaXMgMl4yID0gNA0KPiA+ID4gKwkJCSAqLw0K
PiA+ID4gKwkJCXIycl9jb2VmID0gQklUKDIwKTsNCj4gPiA+ICsNCj4gPiA+ICsJCQkvKiBDU0Nf
RU4gaXMgZm9yIFIyUiAqLw0KPiA+ID4gKwkJCWNzY19lbiA9IE9WTF9DTFJGTVRfRVhUMV9DU0Nf
RU4oaWR4KTsNCj4gPiA+ICsNCj4gPiA+ICsJCQkvKg0KPiA+ID4gKwkJCSAqIDEuIFlVViBpbnB1
dCBkYXRhIC0gMSBhbmQgc2hpZnQgcmlnaHQgZm9yIDINCj4gPiA+IGJpdHMgdG8gcmVtb3ZlIGl0
DQo+ID4gPiArCQkJICogW1InXSAgIFswLjI1ICAgIDAgICAgMF0gICBbWSBpbiAtIDFdDQo+ID4g
PiArCQkJICogW0cnXSA9IFsgICAwIDAuMjUgICAgMF0gKiBbVSBpbiAtIDFdDQo+ID4gPiArCQkJ
ICogW0InXSAgIFsgICAwICAgIDAgMC4yNV0gICBbViBpbiAtIDFdDQo+ID4gPiArCQkJICoNCj4g
PiA+ICsJCQkgKiAyLiBzaGlmdCBsZWZ0IGZvciAyIGJpdCBsZXR0aW5nIHRoZSBsYXN0IDINCj4g
PiA+IGJpdHMgYmVjb21lIDANCj4gPiANCj4gPiBZb3UgdHJ1bmNhdGUgdGhlIGxhc3QgdHdvIGJp
dCwgc28gc29tZSBxdWFsaXR5IGxvc3QuIEkgdGhpbmsgdGhlDQo+ID4gcXVhbGl0eSBpcyBtYWlu
IGZ1bmN0aW9uIGFuZCBDUkMgaXMganVzdCBmb3IgZGVidWcuIFNvIGl0J3MgYmV0dGVyDQo+ID4g
dGhhdA0KPiA+IGluIG5vcm1hbCBjYXNlIHdlIGtlZXAgcXVhbGl0eSBhbmQgb25seSBmb3IgZGVi
dWcgdG8gbG9zdCB0aGUNCj4gPiBxdWFsaXR5Lg0KPiANCj4gR290IGl0LiBXaWxsIG1vZGlmeSBp
biB0aGUgbmV4dCB2ZXJzaW9uIHRvIGVudGVyIHRoaXMgc2VjdGlvbiBvbmx5IGlmDQo+IHdlIG5l
ZWQgdG8gY2FsY3VsYXRlIHRoZSBDUkMuDQo+IA0KPiA+IEkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9u
LiBZb3UganVzdCB0cnVuY2F0ZSB0aGUgbGFzdCB0d28gYml0IGJ1dCBpdA0KPiA+IGlzDQo+ID4g
c3RpbGwgMTAgYml0IHZhbHVlLCBzbyBDUkMgY291bGQgY2FsY3VsYXRlIHRoaXMgMTAgYml0IHZh
bHVlPyBJDQo+ID4gZG9uJ3QNCj4gPiBrbm93IHdoeSB5b3Ugc2F5IENSQyBqdXN0IGZvciA4IGJp
dD8NCj4gPiANCj4gDQo+IFllcywgZm9yIFJHQiBmb3JtYXQsIE9WTCBjYW4gb25seSBoYW5kbGUg
OGJpdCBwZXIgY2hhbm5lbCBmb3IgQ1JDDQo+IGNhbGN1bGF0aW9uLCBzbyBJIGFzc3VtZSB0aGVy
ZSBtYXkgYmUgc2ltaWxhciBpc3N1ZSBoYW5kbGluZyAxMGJpdA0KPiBZVVYNCj4gZm9ybWF0cyAo
UDAxMCkgaW4gdGhlIGZ1dHVyZS4NCg0KSSB0aGluayB0aGlzIHRydW5jYXRpb24gaXMgbm90IG5l
Y2Vzc2FyeS4gTm8gbWF0dGVyIHlvdSB0cnVuY2F0ZSBpbg0KWTJSLCBPVkwgd291bGQgZmluYWxs
eSB0cnVuY2F0ZSBwaXhlbCB2YWx1ZSBsYXN0IDIgdHdvIGJpdCB3aGVuDQpjYWxjdWxhdGUgQ1JD
LiBTbyB0aGlzIHRydW5jYXRpb24gaXMgbm90IG5lY2Vzc2FyeS4NCg0KUmVnYXJkcywNCkNLDQoN
Cg0KPiANCj4gVGhhbmtzLA0KPiBTaGF3bg0KPiANCg==

