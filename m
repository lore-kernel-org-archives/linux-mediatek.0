Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AAAC35FFC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqInrJS5UA3mRiMx0Y+vkAfCc35UVRBHB5AiWNUAUgs=; b=aCbTMJAQxKzVeAC7D1YgN3FDQw
	YYTdMxUOqhNP8ZxgWu7oBSoHGN9D2QLMJLis6fNmKceGsYXt0g9Nnr5QRBX9hJRrws2fM30VFAERt
	vS6I6t/SYX4RWPJIX8fMlOYQMLp7PwYZ7Zqm1T7O7+rhWL3wMYJcLPY7XM5HGImTM9gi90v9v0o2x
	5/D3BmBWKjrFXPsy5FZPJe0wh/G7ATMWKDmHlAV3DJ1cHmebG0tKHD0vLFCz9h5YzSaTk3HwvPy5A
	k3mHX+SwmP/H0PmPMQdJgGyoJ0X1Uo6DQSd1IbvOxT/cJlchz9Q2LSZGEdEitSWeTB/CQr6wJB1/6
	hyn1sjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunEk-000000089mk-10rf;
	Wed, 19 Mar 2025 06:49:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tumE0-0000000850F-1uHx
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 05:44:21 +0000
X-UUID: 30cdba76048511f0a1e849db4cc18d44-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kqInrJS5UA3mRiMx0Y+vkAfCc35UVRBHB5AiWNUAUgs=;
	b=P/t7OfCi8FeyzJ/9SgCeYUSvFgm39/YmewlyzTi/HEVrELN+9ZLN9QDk0GdvxTV6Rdq12qDbzUDphti4PSMarSwjc1YF8jHWO8kmMKL2EQQ+vHdQajJ/LczmNRtlKT21S089J33eW9EnHaZKNOlXUJ0A+1kcVrs6gaVVkZscBJA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7dfdf98d-b890-4954-9c2e-8cbd8e84aa4e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:74294b4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 30cdba76048511f0a1e849db4cc18d44-20250318
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 137704340; Tue, 18 Mar 2025 22:44:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 13:44:12 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 13:44:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bfp16hE+9yjqa9bAk3rX3b3QDY6yCSWgz4WfCp5LeNWHn26JLBamaM3iQP9N0GVT3YJyOwFpJ41maExU3nPneYReQp1gHM0pwyF6dUsSrOVBkkmj5qE0dAA87jt3eoGPwkw94hGMclXeVP5MsXCBFoo+3gSBLN3bNiLopmVKU6mrECD90BhabGOWYOAO28PxCRNMzmFoyvt3V0KvOEPcHTx8BWrkKrHVU6VPDiQn4TC5ipRUAwik/9vJ3kyf4KM69UtdMzJP5HBaiGuarrxwugR9iopC57d23qDJzbY1vTue3z1PJl8RHjhskOV9E6z9tSywUlSD4FWyddBZTiTS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqInrJS5UA3mRiMx0Y+vkAfCc35UVRBHB5AiWNUAUgs=;
 b=e/Lbbia91OLR7/cdJ/yaUn/LUE24CT0mM5TfOhw6yFiutpd5norlxFfH57qKnS1IK60sJKDprexnGLHePWz1/YQ8Z1UmR4+ddxjVeh2zqx3EoKVOCuOqa9ujr6NBr0pd8LMvcRBgeEX+aHutYVFQbOCEhRHBe10j7kJYiUM8iKaDOnPAkf1LnI7rBbt35l0iVO8N0s9mclN+sScPSXG4ex+I8vtTcLw+To+0cZqJTv5QpnpR5GLitirOdub6fdUP82brZeImV3R/yV0bSTLQcyWJc9U8Au+4RFcefrxDToDxtudWlkOPudNL7CPKqjT1Ltc+MSH9K3C+S/U8XZmpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqInrJS5UA3mRiMx0Y+vkAfCc35UVRBHB5AiWNUAUgs=;
 b=LGIJB+6g6X4O3Brehx/dafh4dSxquWFTlaGewrF2ybxNSB2EssxjKiMBbEmhe3rkXFAIkOYfzFnE1tg7ecRUrFmTm9JqHi6UoaQjy3OZalkTtSf8T4DtsWONlTusECwvutPyW94jYJ//0NT/+MqNdeCFqt0z0ySptdHOjEkJJ+E=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by OSQPR03MB8624.apcprd03.prod.outlook.com (2603:1096:604:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 05:44:09 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 05:44:09 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: Nicolas Prado <nfraprado@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
Subject: Re: [PATCH] mediatek: Add MT8188 SCP firmware
Thread-Topic: [PATCH] mediatek: Add MT8188 SCP firmware
Thread-Index: AQHbl+rpNnU8rCXHIU2rZ303kRdN67N5ee2AgAB6GgA=
Date: Wed, 19 Mar 2025 05:44:08 +0000
Message-ID: <28ebba0df2347f076c4e0476435bbf8d6ec971f7.camel@mediatek.com>
References: <20250318094809.3540043-1-moudy.ho@mediatek.com>
	 <20250318094809.3540043-2-moudy.ho@mediatek.com>
	 <2f7b538f-c868-4f7b-8fe5-cec2227996a5@notapiano>
In-Reply-To: <2f7b538f-c868-4f7b-8fe5-cec2227996a5@notapiano>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|OSQPR03MB8624:EE_
x-ms-office365-filtering-correlation-id: 580fdc6b-2eb8-43dd-b1fb-08dd66a911c7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dDVsWjJrN0QzbW5HS010dnV1d05CVHRSS2dHTFZyakxpcm4zSGI2dzMwbWRZ?=
 =?utf-8?B?ME56ZERGc2d2YVU1QzBsMFkvTlY3dFBUUUZKRmFqZlJnQ0FabmlqdWYyaXdL?=
 =?utf-8?B?RlVOT0pKRFZOMWRnclQvVnZNZDFXYWZKV1BvQ09JQk92ZHJMSTU3bFp0cGh6?=
 =?utf-8?B?ampIcTJXNnVla3FXbFFyRW1SN2REdmxoUXVBNnZNYytWbXIwQWQ3ajJ1UTFu?=
 =?utf-8?B?c1QvV2tPLzFmcWtNa3RHT0lhNDRSNVBxMTJIekpoeHg3R1ljVm9VZk1nUEQz?=
 =?utf-8?B?ODlydmtyREtUd2x3SEtMNDZHRFBPZHovODVJVmhUTlR3NTFNWE1DeFpneStT?=
 =?utf-8?B?QnByV2pCV2JxWW1MUXZhYkNtVk1NbW1ldHl0R2xhOUlrZGtmMjlLZXJPc2FY?=
 =?utf-8?B?VGdmOW5acWFVOXhORm82TUVhUFBlZm9QVkVaV09WRHM2VUg2N0JLWnQ5Y0kr?=
 =?utf-8?B?TEJOMnl2V3o5UFIvYzg4TTg4WVYybDgxUGxiSDVEWm81RVpwRlNTbmhYeVlx?=
 =?utf-8?B?eThUR2JMMGdzZHpWbk10enNMU3dvSVdFeG9qODNvRzVRMTFhTitoU2JPWXNJ?=
 =?utf-8?B?SHREejY0WTMrRjMxbDVncmwrbXJuUkhrNkdGMVhESlh2dDFrRmVyQUMwVUFa?=
 =?utf-8?B?a3MwZXdROFlKMGJHY0J3dHhXT0xzenNCZmtNT3ZrMEVDcFZmUVhqWXdqNDN2?=
 =?utf-8?B?VkFyVGY3R3VTcTZuSFp5NHllQjdISXo3SjhCQ1g2cGZhS2RsdE14ME1MakRO?=
 =?utf-8?B?Z3JLU2tXc2xiWDFPSnhldWw2T2tUU3FJZ2xadGlNWnV6K3JSeERxZlJCbk5D?=
 =?utf-8?B?ZTBiV1dkckxYd3VHZldHcjhuN1E0S1NOQzZ4RTYzZVBSM0dZUTBFS1p6cW1E?=
 =?utf-8?B?RENHOEgxb0NQaTZPNE9GZmNDc003d0ZyMDBJSmREb0pNS01yWTJ4U0VqcG02?=
 =?utf-8?B?UTl6eUVkN1ZqNm1naTB5Y2plQytzYzFIN3R4OS94WnlhVitKVGdoNFlQbmVz?=
 =?utf-8?B?c2pxWW5GRitGTXZ5aVdOVkVzS3BoQWhwSWx0YVZoZVBwOFR6WmpoTnRDbkNk?=
 =?utf-8?B?NkFIMEVJQTJGT3Q4QnNPOVdtNll2a0l1a2MzbnNNZ20yKzZRQ3REaUU5cE5E?=
 =?utf-8?B?bXA3RHpUNEtMc0tsRjVRa0ovNVVnNk1EdGM5emc5djU1SXUxa2crTC8vS2pV?=
 =?utf-8?B?S2FVWDc2THJQN0pvV1hHU01RTElRNExhakJNbU9SVS8wbHkvVU8vUXhiejdF?=
 =?utf-8?B?bFl0elJuYzFQam1oeEhlUDRCTGNWVk15OTlVaFY0QmdHdUt5VDlzSmh6ZGpk?=
 =?utf-8?B?REJnc1g2U2piZkJiS1VaUHZObHJxTDlSN0RCdTB0NzBhRkFTSmNPZmVQazlr?=
 =?utf-8?B?RzZWcjNKZjJxMDNZUm50QW5WMk4ra3czMEV5bzFmaTQzLzJtK1VTaGFrRVBC?=
 =?utf-8?B?WXRKUHJia09wNzc2Rnord1R3ZUZCckNCRE1BTzJlQm1nZjZvRDBqSXIyOUVt?=
 =?utf-8?B?Q3BoWXV3TWtJanp3N2VnbW9sVTR2dG5ZVGpFMmdiaE1MRkNhU2YwV2gzaDdX?=
 =?utf-8?B?ZnQrUkY5WS9USC91aTRKMnZYMC9zSmFKZjdockJuMHMrVThNZTBvWDlPdFB5?=
 =?utf-8?B?Um1TZnZzbUFnWjBnSnNNV1FIUm9CV29wYUgzS0hONFIzVUVvQUJPR0tESHNR?=
 =?utf-8?B?RXlsTWhBcVRZSjVXNktiTlliekRUQ0RvUUdDQ3FxQmlGK1NCOWYvYVB2Ti9N?=
 =?utf-8?B?QTNCZHRQM2xjQmF4c0VqQzhndzFEMXRic0Vkc0dmVTkzZ2twazVGaXVqTGhB?=
 =?utf-8?B?YmtYMmlQd1BsZnVZUS9ZR1JJTE1DQ1dGMUpvVUZFbFFVZjNtTmVsRm8ySkVq?=
 =?utf-8?B?WjJqM0IzeWNKZndmdEp0ZENTNTRWVDByWHVkZko1a3BjY1NHbDBpMXlrSjhr?=
 =?utf-8?Q?SA5KNW1M6500VfZO8FTEyfliPqpNU1Wo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1huQi9FSkdDRTJTYjJTS2FqZXdYRTlqSWhnOHlxSFRPUTVEVVp2Sk44YWVR?=
 =?utf-8?B?UEt0Q1k0VXUwYmYyQU1qdkRZc21QUG1CYnYzU2pYK21uNkZPdDMydmtmMk9z?=
 =?utf-8?B?YlQyL01wTk9CQjl1TzFvSUE3QzdlbEx6MEdFYm9Ua0w2aldHUVU3c0V3N3Ev?=
 =?utf-8?B?TVBOSHRUc2lqR0d6L0lTOTc4b0RnWHRvUzZFYVE0R25hdFpTbTJ6S3k3UjhY?=
 =?utf-8?B?YVRrQXVYSXZMemxESlVDdWJEemszZzFJU3RDdS9YYm1Xa254anpQMzk3TFVl?=
 =?utf-8?B?dkhYLy9HcnpBbGFQYUI0ZzRGaDVRY0NVL3h3Y0pueDdKZUx6Q0ZVei9mRDZ2?=
 =?utf-8?B?THRsVU8zZXphSG5Gd25NRytySmdYc0Z0V0oxeklWTGRmRitqVVY2Y0swU0gy?=
 =?utf-8?B?V0pVSHVHMVBJZ0VNbGVmWERMYTJzQ0VURGt1RmRubXIrZ3JsQm5kV243eDJi?=
 =?utf-8?B?Slk3Q2FhNGorTy9nZEMxODlwVFhoK2tLcDM3M1dtU2FERCtKRXBwazBhM0tL?=
 =?utf-8?B?UE9uNjd6SFZBdGNxRTdoeEtTcE1PMlNQejU0YVl4Z2V3OExlSUxmeExEc3JI?=
 =?utf-8?B?R3dqY0FvdnE3N2JBdTQrdmQ0TjZJTlNiQklIU2RwWGJWZkhtK04yU0dsNmtB?=
 =?utf-8?B?MGhndHMwaEdiY2FudWQyMWVpWG5keDhHUzYzemtKdlpRR1VzbktPZnFTZ1Vh?=
 =?utf-8?B?NWJDbXZoUU5HSzJxWVRmTCt6UGM3RnNyMlRmYitCZFpXSFFnMVVqMTNmeExF?=
 =?utf-8?B?SE93TldiL1hkeDhFaDF2SjJLbE4vU05Oc0l5c2lQTkpMclZRZjNQWmx5UmVW?=
 =?utf-8?B?MWVrRlErVHdXQllNb0RRd0dwK0pXSkhydmU5TzNtdkhPcVpiQ2ZOK1k5OXp5?=
 =?utf-8?B?OXg0SVhqUHZ2VjBMNlBrQ0dBMXdveU9MRVUvdk5KOG5RQ2FPM1haRmRNeEpI?=
 =?utf-8?B?V3NodFdOWjVTek4xbWxyZHloSUtxU0pLTHA3TWtldlpzcHY0ckpMTDlVcW5v?=
 =?utf-8?B?M3FVVkNLcXVUbVZUSnMwS0xsTzk2UHQ4TlNJbmVIT3IzZUI0RHh5enEvQjY3?=
 =?utf-8?B?VUZsdEJmdnZRNTdCL3FKMnBYRC9HczFWOENPdkZHUE55NEhYNlFRVTMrZXhi?=
 =?utf-8?B?bUdZd3FBVmx4NTBDWXdkbFZMVzZRaW4ySUxOU3MyYnhUZWR1b1Era0RqazBX?=
 =?utf-8?B?TnBWVGlKVmtNbDdoTXpYNzNoRFoxc0ZtR3ZBOExRZzNXYjBXRGRNNnF0RDFZ?=
 =?utf-8?B?SnFyckNFTUxHZ1FTWC9kV3RVZWZnbGNjVWs1elU2R3JBcm9OSlBieWpNbEJi?=
 =?utf-8?B?SlY0VjFuZ1pQd1FGTkEwUmFwL1dySnhGL2wxb1JhQ3pzUFZNVEVaRW5kQ1pq?=
 =?utf-8?B?TkZXUUNtSUZTS0Q5N3hWVFB6NS9ncWR6NWViN3FjcEg0QjFNZWNSeW5waVdZ?=
 =?utf-8?B?ZkQ4UW1RSnQ4WlhadkViUGJRRnRGeFora29BeklXZUg0QTFVR0pMWG9YcU8v?=
 =?utf-8?B?QUV2N0o3YWhiN3lpWi9xMlpqdE9wYnY4b0RuRG5tTHhOVUtiR2lYREI5cDht?=
 =?utf-8?B?VWdmdjBxV2IrbDRNRkxoR1hubE9yQ05PY21CSWVWU3JhVzNQVllDZlpxRGFZ?=
 =?utf-8?B?ZU1mN1BjbTNuRTFRL1llZ2pycjZFUTY5eTBZUXh4VzZJWU1DVURsUzc1VitY?=
 =?utf-8?B?L3MzMDA3dEtrb3B2TXRsN0h6c0RLUlVxR3JKS1dvSzExc0FvcWRDd3RtWDZB?=
 =?utf-8?B?TzVtYzBrdk8wbXNDWUNrWXhnU2poUWVBUHVueHRuQ1JWb0NQUEtVNFdkdm1F?=
 =?utf-8?B?NHRZRGNuUmdGZWkwUHFoTy9NUERoR0RwbUpzaDNzUG5Ub2ZRYjdVZnFpTzNo?=
 =?utf-8?B?K2s0SGFZMUlnazNHcjNtemFjWndxdE9sU0NBL3UrcHRWMWJzZzVUNjN5RGtJ?=
 =?utf-8?B?Y0haM3kvaTZIVGpSQm9KMXpIMU5Ed0NxV0hwS2ZNQW9LcWs5dkpocmV2VGFs?=
 =?utf-8?B?T1JRQmc3eWNJdTcwNjBwaDZZdXFyUk9LU1dYS0Y2WUduNE4zTkRtTHZGR2V1?=
 =?utf-8?B?ODV6bkYxUmhQamc5VXdvVXRtTnJyaDMyR0VWTk4yek9SRFl4THpmSks2ZnVx?=
 =?utf-8?B?VGozemp0aUVpMUloVkdBZFpKcUF1MUZZNzQ4bXZtT0JvSGtsNmtyZkdvMlFP?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBFE5AD3732E924FA271BD65DFC9381E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580fdc6b-2eb8-43dd-b1fb-08dd66a911c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 05:44:08.9700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vz95uopxOwzAShHk9N8k/2n4X5QpExU+c7T4k4JkfoVdZ+bY4jnQQ3NMgb55nkuRCljvnTPREmxuus0pA+XEgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_224420_504618_CB424F76 
X-CRM114-Status: GOOD (  18.82  )
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

T24gVHVlLCAyMDI1LTAzLTE4IGF0IDE5OjI3IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gT24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMDU6
NDc6MTlQTSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gU3lzdGVtIENvbnRyb2wgUHJvY2Vz
c29yIGlzIGFuIFJJU0MtViBwcm9jZXNzb3IgaW4gTWVkaWFUZWsgTVQ4MTg4DQo+ID4gU29DLg0K
PiA+IEl0IHN1cHBvcnRzIHZlZGlvIGVuY29kZS9kZWNvZGUsIE1EUCBhbmQgQ3JPUyBFQyBob3N0
IGNvbW1hbmQuDQo+ID4gDQo+ID4gSW50ZXJuYWwgdmVyc2lvbjogZ2VyYWx0X3NjcF92Mi4wLjI3
NzQ5LWIwMTJiMTdiYg0KPiA+IFJlbGVhc2UgdmVyc2lvbjogdjIuMC4yNzc0OQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4g
wqBtZWRpYXRlay9tdDgxODgvc2NwLmltZyB8IEJpbiAwIC0+IDYzNjU0OCBieXRlcw0KPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZWRpYXRlay9tdDgxODgvc2NwLmltZw0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9tZWRpYXRlay9tdDgxODgvc2NwLmltZyBiL21lZGlhdGVrL210ODE4OC9zY3AuaW1n
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleA0KPiA+IDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmQ3ZDdiMTgxOGI3NmI1OTlmYWZiZmM1M2UNCj4g
PiAwNWRjMzAxNmUxY2JiMjgNCj4gDQo+IEhpIE1vdWR5LA0KPiANCj4gVGhpcyBmaXJtd2FyZSBm
YWlscyB0byBsb2FkIHdoZW4gdXNpbmcgdGhlIGR1YWwgY29yZSBTQ1AgRFQNCj4gZGVzY3JpcHRp
b24gWzFdOg0KPiANCj4gwqAgW8KgwqAgNzkuNDk0MTA1XSByZW1vdGVwcm9jIHJlbW90ZXByb2Mw
OiBwb3dlcmluZyB1cCBzY3ANCj4gwqAgW8KgwqAgNzkuNDk2MjE3XSByZW1vdGVwcm9jIHJlbW90
ZXByb2MwOiBCb290aW5nIGZ3IGltYWdlDQo+IG1lZGlhdGVrL210ODE4OC9zY3AuaW1nLCBzaXpl
IDYzNjU0OA0KPiDCoCBbwqDCoCA3OS40OTcyOThdIHBsYXRmb3JtIDEwNTAwMDAwLnNjcDogSVBJ
IGJ1ZiBhZGRyIDB4MDAwZmZiNDANCj4gwqAgW8KgwqAgNzkuNDk4MDEzXSBwbGF0Zm9ybSAxMDUw
MDAwMC5zY3A6IElQSSBidWZmZXIgZG9lcyBub3QgZml0IGluDQo+IFNSQU0uDQo+IA0KPiBQbGVh
c2Ugc3VibWl0IHRoZSBmaXJtd2FyZSB0aGF0IHdvcmtzIHdpdGggdGhlIGR1YWwtY29yZSBTQ1AN
Cj4gZGVzY3JpcHRpb24uDQo+IA0KPiBUaGFua3MsDQo+IE7DrWNvbGFzDQo+IA0KPiBbMV0NCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMzE4LXNjcC1kdWFsLWNvcmUtbXQ4Mzkw
LXYxLTAtODczM2UxOTJjYzczQGNvbGxhYm9yYS5jb20NCg0KSGkgTmljb2xhcywNCg0KTXkgYXBv
bG9naWVzLCBwbGVhc2UgaWdub3JlIHRoaXMgcmVxdWVzdC4gSSdsbCByb2xsYmFjayB0byB2Mjc3
NDgsDQpyZXN0b3JlIHRoZSBzaW5nbGUtY29yZSByZWxhdGVkIGNoYW5nZXMsIGFuZCByZXN1Ym1p
dCBpdC4NCg0KU2luY2VyZWx5LA0KTW91ZHkgSG8NCg==

