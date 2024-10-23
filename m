Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1030AD2E018
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib8SDEPvGgyoOxRTdtIZ8gNjeqiQz+592yadE5OJdUE=; b=f+ZvMwGABj1ZimPuEgMt5Ax8Cb
	dpjFWeZG7s00GkA2wlTV3xWO//2oBfwJIILkuHrRmgNihIcEgbi2K0hKAseCtJuyKY4IQjjU/SeA3
	x7ZxI74ol2or3iLZys2NQ/lwFCqD34tR7SeuKTDciRLKtBS4F3RJm4JOtg8pcrnx+R0sFPBlSAaOv
	bdB7H76GhdO0YJj7aNUYfOgFKwogBhlMD0YhwLgtnm0oOWApRdi3bMLKcHk51wr9nc+v5eh4LMt98
	J8DAeJ/cRk3o72Wuitph8NtUa2NfJZ1aIWrMOcvzYkP21urh8okNAGaznB71GIXBGTNAb0XlNVnqh
	EdpG6DuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Uet-0000000DAKq-441J;
	Wed, 23 Oct 2024 06:15:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UcQ-0000000D9vv-0B1A;
	Wed, 23 Oct 2024 06:13:19 +0000
X-UUID: e2c35004910511ef82ff63e91e7eb18c-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Ib8SDEPvGgyoOxRTdtIZ8gNjeqiQz+592yadE5OJdUE=;
	b=kGnhbguiTjNJVHxCWX4ysblbyNg4C6hwnzeRMIoj4NehNDtomZMA+Bh1gT1dBwshWKwmEERiuPzGUbzpZawEaLhbpeWvVYERQh0bO9c2wf5nhYs07wO1j8cngV5sEGHHRDXwiHfaRG9hOazWZtBIsz03Hw4Qqu7QjPjv/qpovfw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5a4745a6-989a-4fa7-85b7-2d73ec35a5b4,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:b0fcdc3,CLOUDID:f1f1f82d-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e2c35004910511ef82ff63e91e7eb18c-20241022
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 822519242; Tue, 22 Oct 2024 23:13:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 14:13:11 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 14:13:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCQITKguLbafXN58IxIzvVytyq6dWXmrhQ+FqhN1E0HkUQMn2fvTWN3zTJf3sV82z623d8UGrP43FUYFsO808kdhJyFmOeVkZePpZwpywx0KMkecQZ4o2lMcqFFL6Rx3plckZOAYZijVj2TJCTl8HttZGRaMoLmN6sfzMl6JpcXkjV0UCOJFI0gEYcloZcjrp4LM2cge+mViyLuz+XK8mlm5+hs7h8SDlpkrMYeT957rW3ZYDb7mLYRAZ9ykr62RNy9sj9i8JSyNtgQ0vsYowrBXapZex+OXI0ZmJU62cPbC0/DTGuBQdzTfSGfrCha4/fDK5x1tl0rw6QOC3oTaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib8SDEPvGgyoOxRTdtIZ8gNjeqiQz+592yadE5OJdUE=;
 b=pXQQzv773j9/beXyz3vt9n1EVysZJKhjPsZtVwZYaJYjD5pZFeTHuV3U+eMxvsMYXWyUHzasIZzM670dnvnaTwFvwzehXpOtOQTKSdPKFopBU2qQEYoyK8cQKE/gq9KeTtSNm0UzU4pDOmVycJ+BalQtcp5EbPDPHTiFg+u6fmIKMrqK5bO/Wy43DbVvpNzJO2B8sRL2rtYw9ds2wQfE2+oQTOzNHmZZiVwfkwxi+Fy9NFgp+/STFh8EKl17JnYD9TBpZj2QACnN2VBcZtxTnpUlEod9GXcEg5utyK6fT5x7N2DN0im09TePzNghubttA1jge0sUGoAECOrtDW6v5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib8SDEPvGgyoOxRTdtIZ8gNjeqiQz+592yadE5OJdUE=;
 b=VEnR/WLbLdmhREB+usZy/dJFQkqValEtgER2/yzkAOLjlo5D9MHwscjbuYSdPnNPJpjD7DxqE0y/LVmnWczIn7V2rgddwyNe73DQ9Gf696OtTHthF7pp2GV0kwRsvuFcM1ErBl58o84JZjn/VGZJtOOXR0pBCCCa8e16Ieg5IAg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8093.apcprd03.prod.outlook.com (2603:1096:101:188::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 06:13:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 06:13:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
	=?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?=
	<Liankun.Yang@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
Thread-Topic: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
Thread-Index: AQHbDbwvn/vjLEPv0kqq4FfT/+zIE7KUCcaA
Date: Wed, 23 Oct 2024 06:13:06 +0000
Message-ID: <7e50383f2641590dc846670aebbd9ebd753c3a5c.camel@mediatek.com>
References: <20240923132521.22785-1-liankun.yang@mediatek.com>
In-Reply-To: <20240923132521.22785-1-liankun.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8093:EE_
x-ms-office365-filtering-correlation-id: 64dfffdf-37a1-4e7e-671f-08dcf329c2ac
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?NDcrNURHTzQxNXg1RWdYQXh4VWlxd0hVQ05VaDg5WmxQNjN2Q1hCM3dZQUhL?=
 =?utf-8?B?TEt5VS8xQm92T2dTYk13N0Fkak9LZGs3K2VWMHUwTWZJSmtlQi94ZlBKOWd1?=
 =?utf-8?B?bFdZNGFUREc0cUV3OEdDVDV0OHJVWHZlT1hHRm0yZGlobEZBcUNLa01SUHM0?=
 =?utf-8?B?UmVnYmZXYkFvZ2ltZjVRZEYrdVlnK0JhdWtmSGdGRzdhS0ExM0V5cTZLZGdZ?=
 =?utf-8?B?bkFKYXBTZGJ6UmlobkFRNSswbDRhalh2eG1nbEFIbTIvSENER3o5cmZTdkZq?=
 =?utf-8?B?WkhjaWMzV3NHVVJSZGRmR2RSVStwWkMxYmFjbnlBZ3hCRmxseGlGTjdzdFlp?=
 =?utf-8?B?WXBvMDNoTzdMdWthNFJxUnNrTzAzZlZQZkNlN1N3Z3ZhdytKbmtvSFpNME9K?=
 =?utf-8?B?RUxLVmJHQXR2cUNOQnJFS25yT0lab212Z1lvREFtdnVybnlpdEtQeGR4Mkc0?=
 =?utf-8?B?dmlVMHdiV0cvUzdLbkJiS3JOWDJiUmI4Y0l6UWtVMjlPdXVra2FRVEI4UkVM?=
 =?utf-8?B?bVJFU1l5aDVMWmpzQnVZUWZWQktVKzFqcVZvdlFrSHdDN2ZOZlhvOVR4V1Yy?=
 =?utf-8?B?RWxyaWk4VU84bEZaL2xGYUgwQ2V0SU1hZi9jczMrZ0swem1pYzZaNzNNd2VH?=
 =?utf-8?B?SDZGRzJ5MG41dVc5OEIyeS9JS0VDU1FRaFU4V2VsTkZhY1M5d0M3Tm8wc2Iv?=
 =?utf-8?B?RUlDTnVqUWZoRlpyczlTcXNGdkg5RU1janYyR21jeGRSTVd0UmYwbFJHTE1t?=
 =?utf-8?B?WkRxQ2RUcGdzRW9EcmdFczB1Q3BPVi8yNDJWOGc1RFBFZmVQQlAyQXBvYW0v?=
 =?utf-8?B?MDJ4S1Y4SjYyTlRxN3ltRTFWRHBXWUphRWtoM2pTdWZiQ2Y3OUR3aWR5cnVM?=
 =?utf-8?B?MnljTk13emI2YTk3K1g2MTFpV0xDS2Q3M0tuTjFxcjNmZnpDc2I3b3dRUzkx?=
 =?utf-8?B?S0MwRlozMm8yMXY3QTF4eS9tZDdickk0QnlqeHJBMWMzc04vMGVFb1k3Y05V?=
 =?utf-8?B?akdqeE03dndsWktCT1ZxRENmd2xUak5oN0xWOEpXRU15b1JkQXZvM2piUCtx?=
 =?utf-8?B?bC9RRi8xL0tUR1dRZVFtT3NGb08vb3VvQ25RamRPMk9kVUY3RVo0UlBXUXFE?=
 =?utf-8?B?VmNqNFBVTmZpODB6RXRtSjBjZnRWSTFsYXIvWkpiVStWWVloMUJrODBCQ0JE?=
 =?utf-8?B?alZZRG5RbFNWUmF1d0lucHFFRVVZU3Jyc3BFOTFDY2hpclhOTHQ4eXBoS1VZ?=
 =?utf-8?B?L1pMdjlSMXRFcHQyRWIvc2w1MEJacVc5aE5kYUlnTGVWKzA5ZHNFeXBrRHRL?=
 =?utf-8?B?SUtZS0g5ZlBhVUFMb1ZsMnRNaWdUbFQ1VmYrcE1MV3h6a0F2TEE4a2NpQkJU?=
 =?utf-8?B?QUlVSUZjb0xOcFpseG1QUlJ0eXlxSzE1WFJESUg3N1ZHNUYwMVR5V3hiWkVk?=
 =?utf-8?B?ZFFaNDVyaUxQbEpQL05WdjZweEp1Y1FOL3I1cHhUTjM2Z3hOcDIveDhiZWVG?=
 =?utf-8?B?V21rTkZXZ2Q0em9YblV1YytTQmpndjg4MGpKRVRFSjN1YTd2TmJZVUxFN3Jx?=
 =?utf-8?B?bUpGdjNBZDlRUWdYbVRlRkxJL1FNWlhyZmNidi9OS3pEZlE2cERtT1VTcFg2?=
 =?utf-8?B?T2NmVzR5cDg3SEpxbjVlZS9QcVgrTExkS0NJSm1zNk42b2wwYVJPZmpsZThC?=
 =?utf-8?B?aCtUTVQxUDRMbVk0YU5yY1Q1QUVMUFl2YUZ0U0xZVFFNMUhySStYcWtSU0U0?=
 =?utf-8?B?WGdVZUhuc1RqbE1wbG9pWXJPZ1BBNXQ1V21xZ2M5NE8rYmZtUXp6cjVTVml1?=
 =?utf-8?B?Tk1GTkFGdmtFMU81b0F3TlJkb014Rm95eFZldThkNDN4Yzc2Sk1sN3M1dVVL?=
 =?utf-8?B?dU15N1drNndNMVFONitIdWF2T1JvZXdLWm9kMEs0bWFDWFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3ZaTVBWclB2S3RoL1hSeGJPWlduVzZQWGVBVzk2citpV25UbUxNcDdWQkI4?=
 =?utf-8?B?RjVoZW1WS0EvUXk1ZmxWQnhuMjdaY0FrcVZycUo3SmdoeGRWVlNwWDdXeis4?=
 =?utf-8?B?MzB3NTVUbUFQeVluVDhMZ21Mb0paaGJNbXJ0OGI3QVIrZC9KNjhBU0JORjI0?=
 =?utf-8?B?QVJVWVpuUFdvYWxnb09PK1RJN1hzZm93Y056cVlXT2Y4bEZwTUU0NVBTUXAx?=
 =?utf-8?B?dUZyNjRRSWN5R3BVZkhxTHdHSXVJUlU1SytGZjNqVURpei9WZEp1eHU3aUR1?=
 =?utf-8?B?ZVR6U2g3ODlYM0c2ai9ydVROMGNQbFV1Y3NoL25xT1lTKzc5cUlPckNjdVhT?=
 =?utf-8?B?cHFGUGh4VEpMcVdXV1VNYTZmZVNydjRyMTRsdEFBSU5BdENXN3B0LzRXbTlx?=
 =?utf-8?B?M2JsL05jWVhrbUNvbFl6OFZuYkdJeDJvZ25tUmJ4c1V1TDVaV1ZTeFFjRjcx?=
 =?utf-8?B?bzI1dW9sVEswU1J5WlRDeldMaElwZ3Nka1ZuUGJQaW1wdXFzcVJGV3FVNnlw?=
 =?utf-8?B?Y0FQS2xKODZTRE1ZeER0M1VZNGViSUFwL01nMk5PV0NGcDl4WmxaM2JjVHNF?=
 =?utf-8?B?YzNJSGtodGc1SXE5L2tBL0llRkpoRHdNd3BuQVBadXBPL3gxeTlpWlZ5YlhO?=
 =?utf-8?B?Vy85VTR3dXdRdEdYSzFiSUhIbzhUQXhVQkVFYVJSa3Q2RmdKcHhPZkk3NWJ4?=
 =?utf-8?B?U3g0Ym9sekZUeE9wMUVZb1B1WkdJNElDNXdETFJTNjRYV0pBQkkzVWhMNmNz?=
 =?utf-8?B?WEZpdjcrQmkwZjFXaGpRa25yQUhqbUhrcFJ5V1Fjbi80UW5jTHpYMXA0U0Rm?=
 =?utf-8?B?ejJrUXZaelp2a0VUT1RoYlYvT042MFQzR1ZxTnBMc1ZkNHdRNnpXZGozcU4r?=
 =?utf-8?B?Y2NVVTllZnJ5ck1VczBVTkxzMU85SnZPdlB1K1djb2FJa1V0VG5pSU5wM0hw?=
 =?utf-8?B?UFNrOU1DeENnZEVBMjl0MXE4RWpIQWRJTEhhVGpwd2ltcmw2M09TNWdFY05Y?=
 =?utf-8?B?RUNwUUdRL0pkMHdITjFVb3hVZEhYNGVrNHdRVjBhNjR5eGt5S2pHZ2wwbmc1?=
 =?utf-8?B?bmhBdGZEZE9BeGNuUGhZTXRXVjYyZ3JpWFdzZ0RCVWNOT2lUNFhHQ0tuK2JH?=
 =?utf-8?B?L0V4OVVOeTZnazdDZkJRQ2hFeUdUR3dkWU84VmlJdmlzVXVJQ1dqM25jRURh?=
 =?utf-8?B?NXA2ay9jZ0s4aUt6amFYai9qY2tmcHMwZXVXQ2hmNE1tM1dlTDV6TGRoOUs4?=
 =?utf-8?B?MGI4SEJmZW4rLzI5bjBiZVd0eFhGallCRDc0UFp1aDU4bjZCR0tYWVNQVk9I?=
 =?utf-8?B?Q3ozakUrSW1FOTB5WkQ4TFY3azhzTXplQlBwcTdIbmIwcGZNdXVMd040Mk5N?=
 =?utf-8?B?ejZjR1RxcThBMmtsb2NLRzZqKzRQTGc0VHdXWHhaNTk5Q0pET3FvMmo1cnFI?=
 =?utf-8?B?UERIRVozYkVLd2JrekFkYXVwTlNRV0dBQklFeEpyTVIwVVkydklDa2lKSE5E?=
 =?utf-8?B?Qlpoa2xjNTNRajRpa0V2QXJtaG53enMyR2theis0Ykt1ZWJ1QXhJWnJFaDhH?=
 =?utf-8?B?aEFWOWFOeE1ORm5WcTJsWHNibC9Qbk5LS0x1VmRaQVlDQktIWWU5dmUxcTdS?=
 =?utf-8?B?MXRhUzJuUkhFeldIVmZ3M3lkNWxuUThUQXk4TFN4QnY4cjhuVmZuT0pEK1ZS?=
 =?utf-8?B?YWNMOXZUZlhrK1ZUSldVbDduMHYra2NEbU5kRzMwdk1QMHlJb1VTb0Q2T0VJ?=
 =?utf-8?B?bnBWZUFPNDBXQ0FkVFJPaU5QbWxFQWVRbExxTzRRN01IaHlvYXJIb0NDbktO?=
 =?utf-8?B?N3oxSmZaaHVacklXODVxajV1NEZBWFpFMzdzMUlVemI3WTVsd1FXT2JrRmdx?=
 =?utf-8?B?dXpzMGxQQU9UMXRPZUtaODBoMUw4TXdmMTJXRU5SaGhUdjF2OWR0c1Y4c0Ux?=
 =?utf-8?B?VGhkaHRsTnpIM0Z2NnUrT3JJNnI2VGZzYTRDR005QUNlSTdlWWNvUzY3S3Fi?=
 =?utf-8?B?YURiL1Q3TWJqWDhnRk9nUHJwRW1DRHpLZTBwY3ZjWXh0eFZFbUhWU2pvSnV0?=
 =?utf-8?B?bHZLSjUwdFlMYVo3RE1pZXgzSndaamJkNnVqbk92NWNOQzNodlQ2UFkvdzJu?=
 =?utf-8?Q?YvCe7nLJRI7ZL4uegpivZOAXx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07DD2FB68A969045A0E062A28A875644@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dfffdf-37a1-4e7e-671f-08dcf329c2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 06:13:06.4790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSq7PJ8CiHChgh61BcVU0Rvl/7TFbrkHlbp+2/7i1pN+TIwYAuByUyn7IbB371ZqW981diJ9/kXBW9I4NCDNRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_231318_121903_84A8C495 
X-CRM114-Status: GOOD (  19.06  )
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

SGksIExpYW5rdW46DQoNCk9uIE1vbiwgMjAyNC0wOS0yMyBhdCAyMToyNCArMDgwMCwgTGlhbmt1
biBZYW5nIHdyb3RlOg0KPiBVcGRhdGUgZWZ1c2UgZGF0YSBmb3IgTVQ4MTg4IGRpc3BsYXlwb3J0
Lg0KPiANCj4gVGhlIERQIG1vbml0b3IgY2FuIG5vdCBkaXNwbGF5IHdoZW4gRFVUIGNvbm5lY3Rl
ZCB0byBVU0ItYyB0byBEUCBkb25nbGUuDQo+IEFuYWx5c2lzIHZpZXcgaXMgaW52YWxpZCBEUCBl
ZnVzZSBkYXRhLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gRml4ZXM6IDM1MGMzZmU5MDdmYiAoImRybS9tZWRpYXRlazogZHA6IEFkZCBzdXBwb3J0
IE1UODE4OCBkcC9lZHAgZnVuY3Rpb24iKQ0KPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IExpYW5rdW4gWWFuZyA8bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgaW4gVjU6DQo+IC0gTm8gY2hhbmdlLg0KPiBQZXIgc3VnZ2VzdGlv
biBmcm9tIHRoZSBwcmV2aW91cyB0aHJlYWQ6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MDkwNTEyNDA0MS4zNjU4LTEtbGlh
bmt1bi55YW5nQG1lZGlhdGVrLmNvbS8NCj4gDQo+IENoYW5nZXMgaW4gVjQ6DQo+IC0gUmVtb3Zl
IGV4Y2VzcyBuZXdsaW5lcy4NCj4gUGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhy
ZWFkOg0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0
ZWsvcGF0Y2gvMjAyNDA5MDMxMjEwMjguMjA2ODktMS1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29t
Lw0KPiANCj4gQ2hhbmdlcyBpbiBWMw0KPiAtIFVwZGF0ZSBjaGFuZ2UgbG9nIHBvc2l0aW9uIGlu
IGNvbW1pdCBtZXNzYWdlLg0KPiBQZXIgc3VnZ2VzdGlvbiBmcm9tIHRoZSBwcmV2aW91cyB0aHJl
YWQ6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9wYXRjaC8yMDI0MDkwMjEzMzczNi4xNjQ2MS0xLWxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20v
DQo+IA0KPiBDaGFuZ2VzIGluIFYyDQo+IC0gQWRkIEZpeGVzIHRhZy4NCj4gLSBVcGRhdGUgdGhl
IGNvbW1pdCB0aXRsZS4NCj4gLSBVcGRhdGUgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gUGVy
IHN1Z2dlc3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA1MTAwNjE3MTYu
MzExMDMtMS1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tLw0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHAuYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IGluZGV4IGQ4Nzk2YTkwNGVjYS4uZjJi
ZWU2MTdmMDYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IEBAIC0xNDUs
NiArMTQ1LDg5IEBAIHN0cnVjdCBtdGtfZHBfZGF0YSB7DQo+ICAJdTE2IGF1ZGlvX21fZGl2Ml9i
aXQ7DQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcF9lZnVzZV9mbXQg
bXQ4MTg4X2RwX2VmdXNlX2ZtdFtNVEtfRFBfQ0FMX01BWF0gPSB7DQo+ICsJW01US19EUF9DQUxf
R0xCX0JJQVNfVFJJTV0gPSB7DQo+ICsJCS5pZHggPSAwLA0KPiArCQkuc2hpZnQgPSAxMCwNCj4g
KwkJLm1hc2sgPSAweDFmLA0KPiArCQkubWluX3ZhbCA9IDEsDQo+ICsJCS5tYXhfdmFsID0gMHgx
ZSwNCj4gKwkJLmRlZmF1bHRfdmFsID0gMHhmLA0KPiArCX0sDQo+ICsJW01US19EUF9DQUxfQ0xL
VFhfSU1QU0VdID0gew0KPiArCQkuaWR4ID0gMCwNCj4gKwkJLnNoaWZ0ID0gMTUsDQo+ICsJCS5t
YXNrID0gMHhmLA0KPiArCQkubWluX3ZhbCA9IDEsDQo+ICsJCS5tYXhfdmFsID0gMHhlLA0KPiAr
CQkuZGVmYXVsdF92YWwgPSAweDgsDQo+ICsJfSwNCj4gKwlbTVRLX0RQX0NBTF9MTl9UWF9JTVBT
RUxfUE1PU18wXSA9IHsNCj4gKwkJLmlkeCA9IDEsDQo+ICsJCS5zaGlmdCA9IDAsDQo+ICsJCS5t
YXNrID0gMHhmLA0KPiArCQkubWluX3ZhbCA9IDEsDQo+ICsJCS5tYXhfdmFsID0gMHhlLA0KPiAr
CQkuZGVmYXVsdF92YWwgPSAweDgsDQo+ICsJfSwNCj4gKwlbTVRLX0RQX0NBTF9MTl9UWF9JTVBT
RUxfUE1PU18xXSA9IHsNCj4gKwkJLmlkeCA9IDEsDQo+ICsJCS5zaGlmdCA9IDgsDQo+ICsJCS5t
YXNrID0gMHhmLA0KPiArCQkubWluX3ZhbCA9IDEsDQo+ICsJCS5tYXhfdmFsID0gMHhlLA0KPiAr
CQkuZGVmYXVsdF92YWwgPSAweDgsDQo+ICsJfSwNCj4gKwlbTVRLX0RQX0NBTF9MTl9UWF9JTVBT
RUxfUE1PU18yXSA9IHsNCj4gKwkJLmlkeCA9IDEsDQo+ICsJCS5zaGlmdCA9IDE2LA0KPiArCQku
bWFzayA9IDB4ZiwNCj4gKwkJLm1pbl92YWwgPSAxLA0KPiArCQkubWF4X3ZhbCA9IDB4ZSwNCj4g
KwkJLmRlZmF1bHRfdmFsID0gMHg4LA0KPiArCX0sDQo+ICsJW01US19EUF9DQUxfTE5fVFhfSU1Q
U0VMX1BNT1NfM10gPSB7DQo+ICsJCS5pZHggPSAxLA0KPiArCQkuc2hpZnQgPSAyNCwNCj4gKwkJ
Lm1hc2sgPSAweGYsDQo+ICsJCS5taW5fdmFsID0gMSwNCj4gKwkJLm1heF92YWwgPSAweGUsDQo+
ICsJCS5kZWZhdWx0X3ZhbCA9IDB4OCwNCj4gKwl9LA0KPiArCVtNVEtfRFBfQ0FMX0xOX1RYX0lN
UFNFTF9OTU9TXzBdID0gew0KPiArCQkuaWR4ID0gMSwNCj4gKwkJLnNoaWZ0ID0gNCwNCj4gKwkJ
Lm1hc2sgPSAweGYsDQo+ICsJCS5taW5fdmFsID0gMSwNCj4gKwkJLm1heF92YWwgPSAweGUsDQo+
ICsJCS5kZWZhdWx0X3ZhbCA9IDB4OCwNCj4gKwl9LA0KPiArCVtNVEtfRFBfQ0FMX0xOX1RYX0lN
UFNFTF9OTU9TXzFdID0gew0KPiArCQkuaWR4ID0gMSwNCj4gKwkJLnNoaWZ0ID0gMTIsDQo+ICsJ
CS5tYXNrID0gMHhmLA0KPiArCQkubWluX3ZhbCA9IDEsDQo+ICsJCS5tYXhfdmFsID0gMHhlLA0K
PiArCQkuZGVmYXVsdF92YWwgPSAweDgsDQo+ICsJfSwNCj4gKwlbTVRLX0RQX0NBTF9MTl9UWF9J
TVBTRUxfTk1PU18yXSA9IHsNCj4gKwkJLmlkeCA9IDEsDQo+ICsJCS5zaGlmdCA9IDIwLA0KPiAr
CQkubWFzayA9IDB4ZiwNCj4gKwkJLm1pbl92YWwgPSAxLA0KPiArCQkubWF4X3ZhbCA9IDB4ZSwN
Cj4gKwkJLmRlZmF1bHRfdmFsID0gMHg4LA0KPiArCX0sDQo+ICsJW01US19EUF9DQUxfTE5fVFhf
SU1QU0VMX05NT1NfM10gPSB7DQo+ICsJCS5pZHggPSAxLA0KPiArCQkuc2hpZnQgPSAyOCwNCj4g
KwkJLm1hc2sgPSAweGYsDQo+ICsJCS5taW5fdmFsID0gMSwNCj4gKwkJLm1heF92YWwgPSAweGUs
DQo+ICsJCS5kZWZhdWx0X3ZhbCA9IDB4OCwNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZHBfZWZ1c2VfZm10IG10ODE5NV9lZHBfZWZ1c2VfZm10W01US19E
UF9DQUxfTUFYXSA9IHsNCj4gIAlbTVRLX0RQX0NBTF9HTEJfQklBU19UUklNXSA9IHsNCj4gIAkJ
LmlkeCA9IDMsDQo+IEBAIC0yNzcxLDcgKzI4NTQsNyBAQCBzdGF0aWMgU0lNUExFX0RFVl9QTV9P
UFMobXRrX2RwX3BtX29wcywgbXRrX2RwX3N1c3BlbmQsIG10a19kcF9yZXN1bWUpOw0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBfZGF0YSBtdDgxODhfZHBfZGF0YSA9IHsNCj4gIAkuYnJp
ZGdlX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQsDQo+ICAJLnNtY19jbWQg
PSBNVEtfRFBfU0lQX0FURl9WSURFT19VTk1VVEUsDQo+IC0JLmVmdXNlX2ZtdCA9IG10ODE5NV9k
cF9lZnVzZV9mbXQsDQo+ICsJLmVmdXNlX2ZtdCA9IG10ODE4OF9kcF9lZnVzZV9mbXQsDQo+ICAJ
LmF1ZGlvX3N1cHBvcnRlZCA9IHRydWUsDQo+ICAJLmF1ZGlvX3BrdF9pbl9oYmxhbmtfYXJlYSA9
IHRydWUsDQo+ICAJLmF1ZGlvX21fZGl2Ml9iaXQgPSBNVDgxODhfQVVESU9fTV9DT0RFX01VTFRf
RElWX1NFTF9EUF9FTkMwX1AwX0RJVl8yLA0K

