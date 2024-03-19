Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2816BC54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=; b=k4Y1660qjZXL8g2c3ryJ54+Ais
	H4tAFD39RQMgxLEjyFE5yqcPOXwFC6slE1x7W3S0jFph4GGJECrbcNd1KvX7HtZYU1dnA27T/gqBK
	RkB0uiZvH799ePZXIVWU1dqPnnazinI6nRQvhaRBYBf8d5OavODuldKfKYD5gn5dl1UW4HEfLeOop
	kXko9osIpgRv0tsPmglYU9R+EmKZhcKOAGv1+GBp/FT7vWhgFGXL4JN6aDe1wSnZaG+z2qvsQSVly
	i/aAD8PO53qLUOzw6VUlhKGlA61Omr7IL2atIocjeq8gqbkwIwkaebdhbSxigsD1N2I6XJWgvk8T3
	45dTzaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmSXD-0000000BQkP-3EO1;
	Tue, 19 Mar 2024 06:01:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmSX9-0000000BQib-4B8l
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 06:01:14 +0000
X-UUID: 0ea0f9fce5b611eeacdb61a41848c7d2-20240318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=;
	b=MD3QTUILquCUKFCoHSlszCBBfefGubMOX5iFu54pYeJAmAys2kOKFLbUYpRP0yfEIxgzPuRnycSrvfOfdFOvcRPEnaoBCYwWeqUpiAmJBNeNFjaMQ3pypTf0QayHWEPAiWvBWJLeP8yrf1IxdBdliT4KCRcUqkich3+h4ju5uFo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b8edd4b5-4405-428d-a890-2e55416f4dc7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:b0252a85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 0ea0f9fce5b611eeacdb61a41848c7d2-20240318
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478464852; Mon, 18 Mar 2024 23:00:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 14:00:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 14:00:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnIyZBzHcqvd2fge+xW+zBwKfRBAq58f30E5QlpnJvMjjjzBle+IGiXQeWOPXLRJiw8XCF6OVNTl0vnsGa22YSYUXgm6ZU4+kXjKIWI+P8x8u8wPNBqXrFOZ7qXA8QQy1HZ5O+GutxJnixLTUQOGVM+AHPLgUEsVjzM0HRr8OsjvRl02H2ci+mNTGVO2qzfj3AFVKZjrOMtHlor9E8y1y7qml1is7v5R0B9QC9TdzWhM4pakY0bpFBirULYW2Y00Pud2fTu39CADFDDe7rEQ7ZU/Jwm0X+VI/Ogx0TTB+VH6eTzgD30TOjXoMtXKCHTdhw4DqLBVRPOP9u2/eaMHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=;
 b=XIZAivaq96JKIpMmTMOOAcOp+MuOEQIV7k0Nhsh5XZh3G5M0Pyjb2FSKIWN4UeKZGl9i6VfoVpac4skVnvYvtUmnTILnNt9v1qkdDTwCfIPpGU3JDcypFezEcAWCFnwJH00k69n7oy2y/jLDe3MdNaDVSlEMHxQ0cM+yeCaz0WVT72CBXMuNe8l4tMuB1Im1SlAmzUHBsyJnVl5un/vPHwDBjmybSZ8x8VABQKMjtEl9BexgEIyi0Ar8T4xqMW1aSRI9pQSMd/C8PRCvo4TrtVClzfG2DPC1XLyN+oxNTfLlik7dG5/cimE5fvDNwXlqMe89bQ9PXKHTppmmwVYlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=;
 b=vQMqjdAVQm7nmaOLELrWxLqfexX4KeO5plBb03XN0a81U8buY2lI57lBHXMD/YOwApZ5S8w+dAkUHJa1xutTU4qeut1IEkYPCuh10DiMzoy0GydXeBeAtApi0WjouuvTsAI7xfmUlaOQ/QJMJi0Cz0+COk3FKfYZZnQZlGcAs6I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8160.apcprd03.prod.outlook.com (2603:1096:400:47e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 06:00:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 06:00:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"greenjustin@chromium.org" <greenjustin@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Thread-Topic: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Thread-Index: AQHacLmAj8+xu1ueOEaPEJuuWj7WG7E+pAEA
Date: Tue, 19 Mar 2024 06:00:22 +0000
Message-ID: <36d6fd903f80c39f0c1250d684a472f86635ff8e.camel@mediatek.com>
References: <20240307180051.4104425-1-greenjustin@chromium.org>
In-Reply-To: <20240307180051.4104425-1-greenjustin@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8160:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjolTxct1f2JnIxOrbfFKHaaU1j2UueGwLQnHNYAyVNlCgUo5x9BaNDW3stgDPbzNxwZt5jpgITCm7rt0FLgPS3D7Z51EuHCIhTXq5R1cZdOToLprZP2zKNW/YJJqnkrhZEM5zUpxhnzO2IMtHZqVVz1n6nYOdcWhZUBkcFaitCDT2UuM7ir6U6m2myYt4SzO4nYd+eBq5aiK+Glg4B4EbrG66O5L3TgYKpALCYFnE7EEh1DN2X/WysEOUqOAPjuxReH/yqhldpDoFxBvS/oh0SlmPjR2JUxqqIvUW+auJEdKMCTDcd5xkUYgyWFlsjzuLoEJ7rfhoHF50jfHiEZ/3XclhCHNrw1zWpQFakAuke/MPbiQ96AOGHLvYAi30Ivgk830wFh6hOlTvki5ewyL8tV1Sje9NVA19g+efonwyAcFXuDuPHukyReT3IX3wHcFYxOt6J4SplvWKG8IKe0E/6lpksCs2g2E64YhJepJaPO6legQ89KiHvyg4Fy8MQWI9FcgOh+787KC2nV4xn7IbctZhjHCeMi+xuQHFgoTgVijtFt9IkxhhtvVxcHibLF0BlAx/G66gBCT8Z6KS8fPBs1GVgue0Avyn8Td8W2P1BzSQ1UbcIrYhmhraxSk4GZUH2Fk9rmGjD9bhRDysV4v4NJWZ42GzYud3OmlkXIZ2k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3hESWdjYjNyRUtyVXJiWEY5V3QreHdpQkZHZ0FwSE9pczlZM0szTDZmSWZK?=
 =?utf-8?B?QTJmd1NIUExDVTVsODhEWW5uN1I4M0pVS3hpZ3NBM1VlZ1EwcWNqZGJ3M0dM?=
 =?utf-8?B?MitnSkxqNHpjdDkyeDZJaWZaaTJ6aHBMTEY4cmg1REFadkZTdlV5YWxLVkxW?=
 =?utf-8?B?blEwUmNxMjJCdCs4RFBIZ0Q5TUFFS0xRVFdBaVpINkFYN0VQZ2tKZFl5Nm5y?=
 =?utf-8?B?d2ovYlVRdSs0MTMyb282S01seFdwM2xyZGZ2UmpvT3FRMUViOVp1enBzNWl4?=
 =?utf-8?B?dExGcG1yWHJnY3VEdXh3bVh6ZlV2K0N3UmhkeEc4ckl0Q0N1ZnRIeEpaTzBz?=
 =?utf-8?B?ekJPeUcxRmplV094UlU1d1p2NW93MldKbWM5N2xhS1VKZkpWT3VIbitFOHYv?=
 =?utf-8?B?bUx1VUQ3VmdWVkpiSGhybHBNdndLNFM3OSt1WlFaMUo2NW1wcGNIOTloOHVu?=
 =?utf-8?B?YlFFUGU1RFV0cVkwR1ZWd2toMTM0dlhQVFhWY0o5RG5lTmtwMGdTdEU5ZDAz?=
 =?utf-8?B?dDJmMVRub1hCRlJDZkRKQld2bFoxTExqbGJqcDVpVGQxVjZaSjZKN1lkUHZs?=
 =?utf-8?B?QTV5R1QwaUxTK2YvUlhNUHRQVytsUW05elh2bG5vSXlmK0tiNXFaZS9UNTVC?=
 =?utf-8?B?V1RLQ2JDWEUyaWsyUnVqN1M1b0VqTDNFa05qMDFrS09BZldheVVaZTRnREdZ?=
 =?utf-8?B?WUU5cU4yWVQwQXMxdk1LTTlZVkhHdkZydzNtenB4SEw0aERhd2dUV0dvVjVV?=
 =?utf-8?B?cFRmc3FXbEpCV3ZsR3FLUlRwQUowQmdNLy9jOFBBVXdWYUM4TmhuNGFSQ2Jy?=
 =?utf-8?B?VXFPR2JJUGRjN2xnekRsYk8vcVdRNzRyMWNQc0s4UEVGd3V2a055NmFEeWpx?=
 =?utf-8?B?WmlWVC9ZZVUrcXZ3SFZqWWIzaWsrRUdpcVV6a0xmc2dpcFRBRjZuVWNsWkpF?=
 =?utf-8?B?YnlHay8xS0Q2a09KTW5XaWlIM2Q5U1Y3VTE5WjNwUWlWTXlkc2NSY3VvTVRC?=
 =?utf-8?B?Mm1ENGR4RDd4RVYxSktnM3Y5U1A2T05ic0pEaXBIOWY3QTdDV1l4UHhRK0xU?=
 =?utf-8?B?NUZreXVJZUdOOSswYWl6QmI0Y3hzSk9pbWdqZ1kxMERMbGtvL2RHcHA3QmFs?=
 =?utf-8?B?S3djcVp0WCsyVnNSZWlyazJJRnlnK1lvWk1xL1RGenZwR3dNVFltNmQ2L0sz?=
 =?utf-8?B?Tk91WDM0ZEMwZStMeEhaTnlVZW1LUzcrblIxaHdsek1kRmtaTFBJNVk1eVhy?=
 =?utf-8?B?V09OSUNXOUEyK0dzTnp0RU5wcUpHNEZLalFrcWVOR2xYVU9ibmwyM2taZGlK?=
 =?utf-8?B?ZVFnUTlNZlNwRldHZzZETk43S3EwWjhzR2xLM3JpTHBwLzB1QnVaVWQrb3hh?=
 =?utf-8?B?VnR6dG5Mc2dabjErdHBOaktreitSaHNTbmc2ME9YZzkwblU2MTJGb1lrcVZl?=
 =?utf-8?B?a0taNzNETGF1WXoyZW1zUHYxQ3ZzaEVZZ0ZFY0RpWHloVmxVRlkxYXFOZ2p1?=
 =?utf-8?B?WlVsczdXSjZCb2xSKzFiYUdnTkZuY1Z6eW5Yc3NLbjBxZUh0QUpoRmdxV21D?=
 =?utf-8?B?T0gxcXhUcjZ4Z01hNGV4VTVUQ1A5S3IwVHVJNzVuaTRxS2ZNcmFURVd0VnU0?=
 =?utf-8?B?KzBxaSt3V2craHRSWVhpd3FoM0xpQmJOQ29nUVRqd2dHWGEwQUFNaTJlTUpY?=
 =?utf-8?B?UU91ejNMQmxYeWhBZ1c3bGtnbTk5K1BleXlkdDVVRlpWWU5pZlVjTjI2VmZy?=
 =?utf-8?B?empRUXFiZGdSbXY1dE9YY3grVjZNNXFOT1VmZlcxekVhcnJ5dExaUEp2Nk9t?=
 =?utf-8?B?ejhBMzNCbTIwVWh6VnRZbmZzckk1dktwT1U2elNVSFpYV21OaTNmdmxNRlVn?=
 =?utf-8?B?YTFnV0d5eC8zeEl4VUh0Y3lxTzNhVjZOOXdhZTFuTEhkbE9DL2VoWk1uNmNN?=
 =?utf-8?B?WWh6NlpQeXlyN25sTm9iUEd4dXZVWE1Gcm5YZDUxQTF2b1lGZG5PSTk2T3c3?=
 =?utf-8?B?eTdiOXlOazZsZFBYK1cvN001RGJFL2FNNU03MEVQTU9TVVdLQ1dNWXhydmdi?=
 =?utf-8?B?Uk05dW4xdVhid3VNWitRR3pJMUNROXNMMVFvUjBTYTllMVFMNzQrUFVRdU1p?=
 =?utf-8?Q?DmQ+iI+PgpppjJbDDNe8dzvFa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B282721465BCBC458A1F3543126325D9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5c1067-10b0-4fba-b167-08dc47d9dd6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 06:00:22.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6chAzuRgSWc9l0MIoaqYv+ZCIJIDSSqaqdgykpLlnqtdx2KdagF5A/jCYBwGozgcqb+vDDlo3yB0PNxWrrAa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8160
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.390800-8.000000
X-TMASE-MatchedRID: csPTYAMX1+EOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0qbqzDH9G7eTAMWCgdCzp+aA0ncQPC5QKUwCmrLlx+SdQZvX+0veCCc/a+
	+MkaUpSh4QDWoRVUbQDmy3T9OxCP66li7wmYeB3lDiyuN5FvFNkyQ5fRSh265CqIJhrrDy29VJ0
	ADqZV4ht+0sW3E5JtDkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJEUGi
	GWdjo9qSUU8zUQj5CS0oSqO5VwUObRIwCGshZuUftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.390800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 226037C40A92A8A9DD1F32622599AD63D63D8AD554AEF41E45299E9756781F342000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_230112_160917_7837202B 
X-CRM114-Status: GOOD (  19.14  )
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

SGksIEp1c3RpbjoNCg0KT24gVGh1LCAyMDI0LTAzLTA3IGF0IDEzOjAwIC0wNTAwLCBKdXN0aW4g
R3JlZW4gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgQWRkIGEgY2hlY2sgdG8gbXRrX2RybV9nZW1f
aW5pdCBpZiB3ZSBhdHRlbXB0IHRvIGFsbG9jYXRlIGEgR0VNDQo+IG9iamVjdA0KPiBvZiAwIGJ5
dGVzLiBDdXJyZW50bHksIG5vIHN1Y2ggY2hlY2sgZXhpc3RzIGFuZCB0aGUga2VybmVsIHdpbGwg
cGFuaWMNCj4gaWYNCj4gYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gYXR0ZW1wdHMgdG8gYWxsb2Nh
dGUgYSAweDAgR0JNIGJ1ZmZlci4NCj4gDQo+IFRlc3RlZCBieSBhdHRlbXB0aW5nIHRvIGFsbG9j
YXRlIGEgMHgwIEdCTSBidWZmZXIgb24gYW4gTVQ4MTg4IGFuZA0KPiB2ZXJpZnlpbmcgdGhhdCB3
ZSBub3cgcmV0dXJuIEVJTlZBTC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+DQoNCj4gDQo+IEZpeGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBE
Uk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MNCj4gTVQ4MTczLiIpDQo+IFNpZ25lZC1vZmYtYnk6
IEp1c3RpbiBncmVlbiA8Z3JlZW5qdXN0aW5AY2hyb21pdW0ub3JnPg0KPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZ2VtLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCj4gaW5kZXggNGYyZTNm
ZWFiYzBmLi5lZTQ5MzY3YjYxMzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2dlbS5jDQo+IEBAIC0zOCw2ICszOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgbXRrX2RybV9nZW1f
b2JqDQo+ICptdGtfZHJtX2dlbV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICANCj4g
IAlzaXplID0gcm91bmRfdXAoc2l6ZSwgUEFHRV9TSVpFKTsNCj4gIA0KPiArICAgICAgICBpZiAo
c2l6ZSA9PSAwKQ0KPiArCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gKw0KPiAgCW10a19n
ZW1fb2JqID0ga3phbGxvYyhzaXplb2YoKm10a19nZW1fb2JqKSwgR0ZQX0tFUk5FTCk7DQo+ICAJ
aWYgKCFtdGtfZ2VtX29iaikNCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+IC0tIA0K
PiAyLjQ0LjAuMjc4LmdlMDM0YmIyZTFkLWdvb2cNCj4gDQo=

