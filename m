Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16B6C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 01:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1YuJFWyIKCCXT8tR2ywwQOT76z+01qeAvKQKL1uEK4=; b=bgkuwjnZ7W0NbKTZlu7Gi9XN4Q
	2SYnlBryuZ10nm6wlABVZrM32B86/V8GGVWTaAfAIq5sU0nuVm0lsFvRaxerhQRCyvcGdsVu9IB9U
	KAVFmUPOqyR+mRD9v7KQVw0ePl/83K92/X0c84n3Js17sDMbuhxlBVcCudSngiDDmn0mn7OM8FBae
	BjS+UxXo+jP6d1b5o1Wf4zouQCuestlE1Boxb7+u9+Mg4UOLVH5HWCijJuT03f46OgkLsB4SQQrae
	n2Px66fWHVl/pqYpSRSGfS595ft9HqjnSCPR3fVZzZ8YCPxEMksdy1DWOHnOcxviYa0B8Y4LXPF8d
	wGQrGcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn7ew-00000001UVp-3Cnp;
	Thu, 21 Mar 2024 01:55:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn7et-00000001UV5-3axk;
	Thu, 21 Mar 2024 01:55:57 +0000
X-UUID: 25a0da48e72611ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=B1YuJFWyIKCCXT8tR2ywwQOT76z+01qeAvKQKL1uEK4=;
	b=W7haESiGqmiArOs7st3YFeoYL4oleXpkZRcPHcnjRH0FVxbph6XpKQdiffp5sMkaXlIahwvFxUR87Y163yTGf1Zm4IVUDheKZqjjQP30jvU/za7GOI6+orfuf9eUf3UfF1Fj232capRE+Yo1f21xsBlU14Uotw4e//AXsmBMM+8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:99abc8ee-ec75-42c8-96a2-e26fb558c152,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:0eb83e85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 25a0da48e72611ee9aa9374d6d45775a-20240320
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1958621351; Wed, 20 Mar 2024 18:55:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Mar 2024 09:55:15 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Mar 2024 09:55:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dkiqr4B7d8y22xNnrfmIacgYEDKvcz/GCOGFePhHTRRM4K01FfDtomXX7y7vxH/Q7DQPmf3MqiLoeyUK5MdR8KnSlOT8cQJil9IV7KMelzqLXkkDBMwe6y4+BXWIEePH/RRsieiwZRQ5Rq/dqa93AveksDdYamIz7U+eeawXvaWKfFRNR5s0HNJzq3dqz1uipR4tz81nshOZ8c0vOG9gbcgey1mix7Tx8GOTm+0zahnQoHt6JN08HtutWfrM5P1pe4DsBJSdJKP8SYt4wWld9yfDEd+5GV/OhHs4/dAhDs1kZNAxICfiMDiS2aEAfKSQByJnOMQb1EPwE0Ib2rGS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1YuJFWyIKCCXT8tR2ywwQOT76z+01qeAvKQKL1uEK4=;
 b=iWhDTTjTw0i5eWlFhB0PpCcUdklwcR51OihFkia6PnIBRwm4fFDaJFOX+19YqSbCmK6sN08WoVNFrS3VJ1B1Iuzwx+0hDwpZW7mFykVL/hBfHGWsHupclHkkcYl9TEyFRT8hazvWteXKMLutm1tycHCRZzCZAKUg+BT3so1WkHz+SgQlk8aPYIqWRYf6fvLuZTiOeJk5RRvOgIj6wyIJUpg4fxpJxRqugE5aBW6qZRRAc5B5wcZetcx63jx9D9ckALLycbvvYoIuc7XjirDzohK6sQ3OPKqfPQWBzF8N6D/FVRMfSVeS2DqyZPFWdF5gmzmxWcgfWLmHPjjRfneR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1YuJFWyIKCCXT8tR2ywwQOT76z+01qeAvKQKL1uEK4=;
 b=bs23VTgeka4pEjFBlsA+oo8Ma6imGiVvVjESLjjnRxppuSrUp70OgW9aJx4vWaZCIr54MG6sEA8UpG3DgmKTf01R6YAVoj1+N1LNXijpwirYreLa3xguMeNSg4cZ4kaCAue2X456ksRp9+JpU9zosv6ik/Xy/kWq7KcoQr3aslE=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEYPR03MB8149.apcprd03.prod.outlook.com (2603:1096:101:174::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 01:55:13 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::e4f9:968e:f97:59ab]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::e4f9:968e:f97:59ab%7]) with mapi id 15.20.7386.031; Thu, 21 Mar 2024
 01:55:12 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Handle invalid decoder vsi
Thread-Topic: [PATCH] media: mediatek: vcodec: Handle invalid decoder vsi
Thread-Index: AQHaeo3refJcpvaXr0WpnyfUEffv7rFAWLIAgAEXz4A=
Date: Thu, 21 Mar 2024 01:55:12 +0000
Message-ID: <bb8d4b6d205e64f3f9d32f424bf6c25d0254ccdf.camel@mediatek.com>
References: <20240320061336.2615-1-irui.wang@mediatek.com>
	 <c09b063f-a11a-4bc0-8b12-3d66f692c48c@collabora.com>
In-Reply-To: <c09b063f-a11a-4bc0-8b12-3d66f692c48c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEYPR03MB8149:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1dAQMf+H6JUcCyALufUdr1/smi+eaZ2k58TD+b/RwOrvFrhe2v7+VJ1kG26mu34+65ty3z574aTTVkqNn7/G+Dz0GPQASB152RiA8zrHnO6XCNS/0AND49qx56O9e+34iiASrb1Ql9waIP/YHbZnbs1s6hKXltEHC1zqgXVpUzjopEDTA7HKvha/Pw7lQIhrtbfDFDofYBUvKAlbOD9U2MXZFT2RH8xFaP1gF+22nK87Aoi3IXR7J5+km9ZDMDhXlgRIODSgVXqsZ4/ETLtO8WdPCU6TYizsCRawa6y5/mfCkvW8Eo+QHBP8w1n4/EypusZPh5B1VJqHeMS9CihIjad4WBI66WacwIeOLXnyfpk7Hgo1V7/Y6ZFHhEcGJ68GqP1IuzSxRze1NYuRJ74ah08PxAo73G5YWnNF3ZFdOPJJUYT7RKQlDFNov3SKSzY5DoMegWU38uKB2babkVsuv1z1+m8DAuiGsJluZ/MQjso9yHpClrh5Wii8xEQUsncHPlrD0/unOZbQ2qjHhx/ocPwTVBk3DcHcyW9gRxVDNBb2RtFtsZaQVF+E3cmQ0olwgOUJ5NBIRFtCF0rcDBiDvTnt0aG14f0hDHqA//Wl+SsxTFiQqcOGbqtfusK/s+m3eI3sihQwXjqSXy6LyogkFIECi49oRjsc6J5DvYYtbk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0t0NHlCK2l5WmxISk93U0llbWtsalBGRHI3Rm5GTkwyWTZuZUVScElCeGc2?=
 =?utf-8?B?UTB3RE5idDJPek9jamgvUjJja3ljUnlPSEhhdi9ock5YbEdLdzV0eDJyQUpU?=
 =?utf-8?B?eldEWEsxcjVBeWlkdVBaTktDYWpkUzYybEw5aVFvN0ZndGwvWDhTYVpyclNx?=
 =?utf-8?B?cXN4UVMwZnlNQ2syQy9FQXhFY29PaW5vRTdmejFFZGUyc1JLUUU0NCtsTmFl?=
 =?utf-8?B?c2hPdUdtTXR4RDB1c01TMzA1amgvZUZjdzgrVDRFL1FnOC9hZlFNbHpWRzJD?=
 =?utf-8?B?cDBuM01aNG1rNmZGNmZSQUxLOGN5SHVuSGxWMWQyVHdLOUdlY3BCaXF3SGhG?=
 =?utf-8?B?L2g5K1hBaFg3YUY4TXp2eGhsQXo0UGJTRXUvSGtkUkl6ZllXRndmUVVQQnZt?=
 =?utf-8?B?TjVxdGNwNmFrMEVpSSsrT1hObFByWVhEblgwM3hTczRVT0pyQmdXOEEwVU5W?=
 =?utf-8?B?Z3ZseWZtVXl0OUt3MldZTURNcFpRNjJxQ01wVW05UTByNC9ybjJOWkZTRmt4?=
 =?utf-8?B?OGNQMHVUZWFuWHJOUGZadnZCRDA3blY0Uzl3SHdTOXkyK3ArMHh0N2lNVlhm?=
 =?utf-8?B?VjFvZmMvQVdGS2h1c2liTG1wajdlalZubFJSWGJNcEVnL1BXcGlxUzBZYlVI?=
 =?utf-8?B?L28ySnNDYndENUlWd0dtQ1RzaU5hTUJXL0xQS2hQWHZMVC80RWQ2UWJ0SWxw?=
 =?utf-8?B?MTJhMTdzelJrV05LbmtSRFRLRW8wT1k0emcxVSt6ODRsaFBFTEZGNkllcWRD?=
 =?utf-8?B?ZVFpeUdnWittS1lFUlhyZm45QmoxWERVb1p5WjVzMXBPeXhvSDNSVFFaWk5v?=
 =?utf-8?B?YTFLckgwRzJPOTk1Nml6SWppN0lrMU91MU1FQ25qYlM3N2c1QUxqNGhjTnBa?=
 =?utf-8?B?ZkE0OHF5Z0FnakJSdU5WSldzWkxycE5mT2Z1UFJGTzZBbTR1bHBiRGh6NlM2?=
 =?utf-8?B?dmJjMkwvdHJRZkJWbm1mWFpuOHZsQURReXpGZ0lnbDJuZlRrdk8wZFd6NHpE?=
 =?utf-8?B?cmJTOGN2M2pnZzc2RTI5blpyUkpHZHhvTEo4YVc1T1JOMS9DTGNJUHd6dDU0?=
 =?utf-8?B?eFRpbnFoNHNyUFN5dVhqcy9OamkwM0llZHZjeXMrb29RdDRoRzlOSldyNU9h?=
 =?utf-8?B?ZXRGOW9IK0U0K1U4bWVxRWVOQVVMeFVQSFBQUDNEQy9Tc00vQWNnYzFqSkJL?=
 =?utf-8?B?dFh0czNZY2gvcHRRK3l0NUpkWmZJS2t0M3g1WTJHQ1lqNFJsMW1qS2tDS1pI?=
 =?utf-8?B?bWNobzVxMGFiRzVMVXRKemUyUUZydXR1dmphbEVubUVYRDlxVGtaUFNDZXZZ?=
 =?utf-8?B?aVdzYTVMSTdqQk9VMllKOWNKOUsyVkFnYTJkeUsrcVlmZWhjZ0FEbUJaNXlE?=
 =?utf-8?B?bXhjU3ZQZFh1TUwrRnhFeFAxQ1JSK2NSZmZRT29peVh6ajIyc0N2ZDlxdlpl?=
 =?utf-8?B?R01vU05Id3dieDFoSjkzd3RkaHhzVnM3Q3Vzb0hGQjF2ditoZjdLbXVnSjJi?=
 =?utf-8?B?d0xaOVpLMjNiY3lVTXBFNGlFQnh1YUxmUEpoOTZVdXN5WldiNXh2bzZNRFli?=
 =?utf-8?B?ZUdqSUhaaW5LZm5PZkJpMG1NNm1ZOHIxT0xKbWMzZmwvK2tKbTZ4aEhZNEhy?=
 =?utf-8?B?Q0p1UGhVSHV5WFNiMTVHM0txL0Y5bHBYTnhVSkxSMG5EUE5CNFo5dDVPQlVr?=
 =?utf-8?B?a3RNMjJaaldIS0FlcllmL3RzQWNFN1o0RisxK01rRG54M0g0Q3Z2UUdHYVh4?=
 =?utf-8?B?SmZkWmVteHRQdlNLZklZODVLRzc5dC9UbGYraW1lVitLZm1aQ0VmMk1lNzRD?=
 =?utf-8?B?WUVvdjdLS3VmNFRqcWRoMUszb2lBQXRkYVh2V1l5NWkvNmo5ZHlDK2RHVmcw?=
 =?utf-8?B?S0VZelR3a2QvWlR4NGx4Y1cxMUNwTVZGajdDZHB2aXFOd3M2djRqcWpEaDd1?=
 =?utf-8?B?NCsxbzd3dk9uRmNIRWlHd1NZZFZJTWc4QlQvWVJZdGFKMWJNaHdWVlVqSEhJ?=
 =?utf-8?B?Q3ZuOVlKbmFNMHlXV0ViZ2JMaXliQ2l3T212SHV2cWNWd3ZsNzh4UDVhUEhL?=
 =?utf-8?B?RjVXd04rL280c0RpYnkwZlMvbm13cVJLUDl5WkpubDhLTmVOUnR2SVZHSEUx?=
 =?utf-8?B?V0RDWlU0ZXhYVWZ1cGQyL1gwaHdkQVJjVXYyVUZnSEhnb0JXdCtHZUcvZ1Yv?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ACACB0CF2E83E44AAEC93DA8BD0221F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e6a4e8-dc60-4b4a-571a-08dc4949f261
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 01:55:12.7163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J6DDYelVqkbW/L2jJ2uAazAmgUfz0wM+xYsq03DDct30tb92tQqRuc8Q2BOQbwq6oanwBzBx6g+tVHzJheHFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_185555_912335_CCC8A7BF 
X-CRM114-Status: GOOD (  18.00  )
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

RGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcsIHBhdGNoIHYyIGhhcyBi
ZWVuIHNlbnQgd2l0aCAnRml4ZXMnIHRhZywNCnRoYW5rIHlvdSB2ZXJ5IG11Y2guDQoNCkJlc3Qg
UmVnYXJkcw0KDQpPbiBXZWQsIDIwMjQtMDMtMjAgYXQgMTA6MTMgKzAxMDAsIEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAyMC8wMy8yNCAwNzoxMywgSXJ1aSBXYW5nIGhh
IHNjcml0dG86DQo+ID4gSGFuZGxlIGludmFsaWQgZGVjb2RlciB2c2kgaW4gdnB1X2RlY19pbml0
IHRvIGVuc3VyZSB0aGUgZGVjb2Rlcg0KPiA+IHZzaSBpcw0KPiA+IHZhbGlkIGZvciBmdXR1cmUg
dXNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlh
dGVrLmNvbT4NCj4gDQo+IFRoaXMgY29tbWl0IG5lZWRzIGEgRml4ZXMgdGFnLCBjYW4geW91IHBs
ZWFzZSBhZGQgdGhlIHJlbGV2YW50IG9uZQ0KPiBhbmQgcmVzZW5kPw0KPiANCj4gVGhhbmtzLA0K
PiBBbmdlbG8NCj4gDQo+ID4gLS0tDQo+ID4gICAuLi4vbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvdmRlY192cHVfaWYuYyAgICB8IDYNCj4gPiArKysrKysNCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWNfdnB1
X2lmLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvdmRlY192cHVfaWYuYw0KPiA+IGluZGV4IDgyZTU3YWU5ODNkNS4uMTc3NzA5OTNmZTVhIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvdmRlY192cHVfaWYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlY192cHVfaWYuYw0KPiA+IEBAIC0yMzEsNiArMjMxLDEy
IEBAIGludCB2cHVfZGVjX2luaXQoc3RydWN0IHZkZWNfdnB1X2luc3QgKnZwdSkNCj4gPiAgIAlt
dGtfdmRlY19kZWJ1Zyh2cHUtPmN0eCwgInZkZWNfaW5zdD0lcCIsIHZwdSk7DQo+ID4gICANCj4g
PiAgIAllcnIgPSB2Y29kZWNfdnB1X3NlbmRfbXNnKHZwdSwgKHZvaWQgKikmbXNnLCBzaXplb2Yo
bXNnKSk7DQo+ID4gKw0KPiA+ICsJaWYgKElTX0VSUl9PUl9OVUxMKHZwdS0+dnNpKSkgew0KPiA+
ICsJCW10a192ZGVjX2Vycih2cHUtPmN0eCwgImludmFsaWQgdmRlYyB2c2ksIHN0YXR1cz0lZCIs
DQo+ID4gZXJyKTsNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCX0NCj4gPiArDQo+ID4g
ICAJbXRrX3ZkZWNfZGVidWcodnB1LT5jdHgsICItIHJldD0lZCIsIGVycik7DQo+ID4gICAJcmV0
dXJuIGVycjsNCj4gPiAgIH0NCj4gDQo+IA0K

