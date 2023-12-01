Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB794C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=; b=A+n54di9gBAiUfaux5Eyu0eOBJ
	E1RYkXur8pxzwFUqYBnbj4AL4u7kpc8IRRcbHM5itFbW0+U69QKxM34d6OD1xmsAOApltQtrit6SK
	r+YxMhmTMNn9+IfoeuN0z67Jr2Umv7grbgJ+7eBCMvDZy3abOPDj/cuJ01rYassmaXxIYuPb2XKUP
	LEmgHRQAXrqYp0RsGl7MDUzY8l92qORfxfq8spvk2L8ixKmchBorn35u+4HzqolHOrHZAgMNYMpvg
	bVPlHEjLvx60v76rIkR9VCmeb0EdqbzEMFOtvRyqRkBkX0feppfTmZH2C/WokwJf7R2gWvXN5Hzwa
	xsQ8LzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8syi-00CPJg-24;
	Fri, 01 Dec 2023 02:10:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8syW-00CPFa-2S;
	Fri, 01 Dec 2023 02:09:54 +0000
X-UUID: b293abea8fee11ee86758d4a7c00f3a0-20231130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=;
	b=mbOX6c9VY5+WWBUWtW9nyf8oAkXvIicC/b8o1cfF9EGYsBGAFn4fUtBaWzM+ASTKotX3Yigt1Wy9nC2EPCDduMI2bqFAISmK3A7PsO6bMV+9naQ4FWPtjucs8/zAwvqC+923Ba1e2fuEfuvugOwEsYs/UVrVsxoHSsMbL2uOyQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:34aedf20-c4bf-4af1-bcd9-71e63465d29d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:4ffa27fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b293abea8fee11ee86758d4a7c00f3a0-20231130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322764690; Thu, 30 Nov 2023 19:09:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Dec 2023 09:59:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Dec 2023 09:59:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV5gtMpeUjGyq/bwHFZcXAsg6Nm7aGOgpyqadoqGUl+XPxbsK7meI86QuOKAIk2vCts7F5ef8sm8uaeRYWw05aQ7O+WZ5+WfQ4I7dYktdt+Bi6F48XcE+CEUHq49urQI1ok17k5ZC5PF31L02CABu2dZkWVK5FWZZSrOPzpmEjF1/+IOaKedgcX/8AAnKhQXMHlk+ffdnGccYoOh3HaQYFmFrXuK/3mgmYm2yz1glwF4PhXfPVphXguEMzeimExOW5nZekjcqSTNDPphyAVk+5mGEU4QmgekFIUzvZvbhDgNia5/XIG96D71pNoKrPKxWoMrOx2+ildQcMcsRLLt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=;
 b=QvpksM6CIdjmyBhjWTdGC7+L1OgbITIRcBdJzzw5lRKttkpXWhrD7Tb/oz52ejZECUjWsaTHeHep4JuOZBANZnre1eiFRTw9zS5gosbjaXInsp5AoNnTBEyP0mZEb+Ohz9dUU5XdMFp9B/jmE8MkYIvu1J0BO95fjUYuUeCpLeuaQ26VsASjC+t43U9TwdOCJNoNyPUiGzIYu7m1zjE6gCQQwrvqBCWbGxs+4o1YRVNmqSXw/AETNBItdECTxEqHHc1JocI5mqgC8hO5ocRsZjiOxEOs5LqGOEUe0xRCn24oKqnISskBoO+YPOVpMZuO/AcYDMFdFTqySAVAMAQTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=;
 b=pL+J4vQyar5QcHBENWxdzLi3dxsyXWW1Bixr7E2hQfnwkjBt19Lku9ugjMANC8DPfokSeEiL0LQimzlZ3dRDeomC+qsmHjgiUj8YhzkSZp8CLbH3waV7AdaSsDW+0AMQ+S2kP/Hxsx+qxGfHwCm/YloHc2ENslUBs+CwZ48B2XI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7303.apcprd03.prod.outlook.com (2603:1096:990:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Fri, 1 Dec
 2023 01:59:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 01:59:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrCTtquA
Date: Fri, 1 Dec 2023 01:59:38 +0000
Message-ID: <acb94c6918cf9f212d0d9fadd414e66e132b5e11.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7303:EE_
x-ms-office365-filtering-correlation-id: f86ee3d0-229a-47a9-205f-08dbf2112cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PpQj5CdvHIVNEg/lIhQQbXLZtg4YjFaxqMz8E1Y8ldRPYGAhzvtWZGO5cnYk1nO606RDfwsLSn0VtVzKLgkImLupuw+sFQ1XbxUZ2tf0CDXgufCJirL4GREVPYrw6FFzti+qu+34ISwEx6jOZfiS4oFL2wLqBzt8huPKado9hQXpM66jE8Id3EQErrsLUERm38nWOzGMvVN703pLIF5ZT3ij8H8qeZe6iEjuenQ65GylTczy9tEK5Z07WGsty3plSDhoQaCSNqxh0yCEz8dmHPwxnQhPs8/hEzgLeI3FPo/dUfanniNGlQxX76+lAYfIkvAc/SKF50IPRuPRYUaMDteTi0yPsX8pbDzr4NPcQZqL95vZ4Ag5TqR/TufPGTQjK/HqJPMLKB3J4/+QwrjE7ygvqusdTc4ex255/yZBKSuBnMStmsXJF4tVgLMySZ801/LciFx9nR0XUdAQAyKKMHvzkVYwGqJRdnvgnTQzdNGhiFWWl9u0qtX/UTqSkEsnXR+lA7nF2fZhcPfUpndm1SFKOKa+wAdrYAXF6AKGdMKyN5qV1lb2nnogx5GABgoYMaghb3agD6QHyGO/CNgixwPwEf+qK24MDFjLULK0h7n9ckTDirtayuWsTAMoNkYX7SVGV1b77abgB3IXS4/ascfWVNrs4EfmOnUCR5utJJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6512007)(107886003)(4001150100001)(54906003)(6486002)(478600001)(66556008)(76116006)(316002)(4326008)(64756008)(66446008)(66946007)(66476007)(110136005)(8676002)(8936002)(71200400001)(5660300002)(86362001)(7416002)(85182001)(41300700001)(36756003)(122000001)(6506007)(38100700002)(26005)(83380400001)(2616005)(2906002)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlEcjlzU1JYVnFOQnFhMHBGalBhVEtSZ2hxM0N6NTNacUZaMUlEbEpqVmZQ?=
 =?utf-8?B?dVpKR0o3UXRhS0tWZEpUTFRQRUVxUjAyOHpUWXZycHZXaHBDTTBqdXhQZnFR?=
 =?utf-8?B?ODhsYVlJQjRzOExHaENMS3NBZ0h0Qy9OeVJoRkZ1eGVKOWc3MitrTDhUbHVL?=
 =?utf-8?B?RGh5amhyYmRnanQ5bDc1SXZGTmI0VW9jNTgxbzlIT3NVSUdwSlNZd2pKVjF3?=
 =?utf-8?B?UGZUQ0dhU3NxVWVVOC9hVmR6Tzk2cDRwNmZTWWljTStpZVVGdzZ2K1hyeURi?=
 =?utf-8?B?WWN5K2hPcm05TFl6amdVQVVKc0tsbVVjcmxFZGZKU08vREppSHNJYkthb1Bk?=
 =?utf-8?B?WFY4ck9NQUxVNzRodytXMVMwazlRakw4Z3hWVS9HdFBmVHl1Q2o4cTM3dU44?=
 =?utf-8?B?eVVlbnZTcTFmdkhnQ29LRVRNS1J5NnpEQ1JzMElJeFdPVDZQZkNOZDc5alFC?=
 =?utf-8?B?VnR3dlR3V1pPM2hydElybGhrcEVsdy90RTVyQXpyN200TzhWMmpUa2cyaUpt?=
 =?utf-8?B?LzAvZUZYN3FxMFljVGorMGxGWDV2dUYvY0Z1bGZ5SFRWUTgrRWEyeFd2TGJq?=
 =?utf-8?B?eXYxQzlvVWpVMWwzWEJYaVB4M1VpK3IrY2t2S1BNaXVvd2lGZGVxSDJhNkt6?=
 =?utf-8?B?MVBJRmsyVGEzaG43aXJWSWthNy94c0h0cndIekVyajdnNzBGdVIxVFZrcHQr?=
 =?utf-8?B?cHMzRUM2MWV3RjM0ZlduM0FodEUwOG5MR1NocVVEbWZObVRYaUw5M1lQT3lK?=
 =?utf-8?B?Z2J1WTNVV2k0d3NuNFl1SEhqQjVSckx1aXpVVHBYMkNybUJ0Vlk3WldPckl2?=
 =?utf-8?B?Wms5VHpRQ1Z4TWI2S3BxOVpHMzFRMkVuWU5jSEVjWWhYUmF0RzBIZ1pndml4?=
 =?utf-8?B?NGE1SEtyWlpWR08vNTBVUXdpRnloVUtINHdzajF1ODlhZWVxbVUwQ1RBTDVa?=
 =?utf-8?B?S3NLY3FYeEE1VUw4T1FZeDc2SkdVMkExMy9xa3E0VDRoNVNxMmR0Smgzd1NG?=
 =?utf-8?B?SzdOQXIrVk5OQTlKZzlhSFY5MEpLNWZWTzNibDExRjVlTzZOREVxekJoQzhK?=
 =?utf-8?B?SmhPVTdTRU1GdHljQUhRZ3BkeDNQb3NiUlhHdHljby9vTVNaVlp6UHlQT1B1?=
 =?utf-8?B?Rkx4MjYyWjFGdWpkUDMzQk8rd3IzK3FlVk0xRHMzQVFZaFp5T3dlS0MxVUg5?=
 =?utf-8?B?YkRUM1owV2hpV2VvTTc0WFpsdXF5WThqRE01VXhJRiszREJJZ0hLOHdYTXBV?=
 =?utf-8?B?aFQ4enJzTm1ZenhXUFduaHdDSFU3emFGb0Z6YjdGNWhrczB6blZKTHo5NW5U?=
 =?utf-8?B?eVh2ZU90MWxVVXRmMzNDeGo1TzcxaWpKUjVrbm5SWXFxYUo3WDBFVTA5ak1R?=
 =?utf-8?B?Z21iM0tLN1VFNDNNNEdnN0UyNHpxaUxJV2Vybit5aEpqMGpaaldSQjZRemFn?=
 =?utf-8?B?R3F1dlRWVTRwaCt5QTRKNk5kd2gwaHJnNVhBUWJsZWwzZkp3UGpBNFNkVWRG?=
 =?utf-8?B?WS90eWk3Vll4QVZDL0hjQVl1K1BITklBUE1wY3FEbi9mdVpjeHNpeG8zWUlP?=
 =?utf-8?B?NTRURVlQcmdwc09VUys0bm1SQ0NvUzZ6VkswcW1GeXloRDQ5am41RGlielUw?=
 =?utf-8?B?OVM2bnhHYnFBN0RzY3k2ZUdRbm8ybFNzRUQxbGEvMGxQVTBIMXBxMktBazBi?=
 =?utf-8?B?TnY4b05BdzVCYTA4aW1qQWdWZ25NVWw1V3dNNmpPTTgrcmFmZzhsR09HODNo?=
 =?utf-8?B?NFNVbEhzYmV3S3hlMCtTZTNvNk9Fa1pMNzVDREdONzJaK1RrOEZaaitPRk9h?=
 =?utf-8?B?c3FFVEhQaDBiSDVvSVJscDYvaXRuS2R5aDFGNDIwaDhlSTRjZ1NNckpCajlG?=
 =?utf-8?B?eFZkbU1pL1Fua0l0V3hreG1GM0JRMW1qKzRmeDhkSXpWRFZMOFNYekRXeU5L?=
 =?utf-8?B?dHY3UVJkVVpROFQ1MHZFbTJvN01HUytlQWs4N0xZRndvMDMvMGoyaUdtbExo?=
 =?utf-8?B?eGFsT1NaWGtmR2Fkdjg2dXkxWkl6RnhlempvdWEzL29Tc28ySmpjM0ZpdVB3?=
 =?utf-8?B?L2NkTWpMZFFIa0t2eVZrMW56ZU5RS2x5ZjJpMGZQZ1UyT2hzU3VTR3grdGQz?=
 =?utf-8?Q?DpxWCOZ706GjuYn5pwHhy6cmh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC1B0812E15E8C41A1D7964516E27102@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86ee3d0-229a-47a9-205f-08dbf2112cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 01:59:38.0516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB4oSwudP+yhhsUZyPnvufX7O4M7iuQegTTL0u28XpWb9FahPgLFCQbBNN/eUbTTWRmprUak2QCa+P0IIq4ciQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_180952_812992_D61AF6F9 
X-CRM114-Status: GOOD (  11.48  )
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

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAg
fCAgICA3ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmggICAgICAgICB8
ICAxNDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGxEUEhkY3BDTUQuaCB8
ICAgMzYgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL2NhL3RsY0RwSGRjcC5jICAgfCAg
NjM4ICsrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bGNEcEhk
Y3AuaCAgIHwgIDMwNSArKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMgICAgICAgICB8ICAxNTkgKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cC5oICAgICAgICAgfCAgIDE3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBf
aGRjcC5oICAgIHwgIDE1NCArKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
X2hkY3AxeC5jICB8ICA2NDYgKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcF9oZGNwMXguaCAgfCAgIDU1ICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwX2hkY3AyLmMgICB8IDEwMDgNCj4gKysrKysrKysrKysrKysrKysrKysrDQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmggICB8ICAgNzUgKysNCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmggICAgIHwgICAgNiArLQ0KPiAgMTMg
ZmlsZXMgY2hhbmdlZCwgMzIzMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmgNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGxEUEhkY3BDTUQu
aA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bGNE
cEhkY3AuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9j
YS90bGNEcEhkY3AuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBfaGRjcC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcF9oZGNwMXguYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBfaGRjcDF4LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmMNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmgNCj4gDQoNCltzbmlw
XQ0KDQo+ICsNCj4gK3N0cnVjdCBjcnlwdG9rZXlzX3Qgew0KPiArCXU4IHR5cGU7DQo+ICsJdTMy
IGxlbjsNCj4gKwl1MzIga2V5Ow0KPiArfTsNCg0KVXNlbGVzcywgc28gcmVtb3ZlIGl0Lg0KDQo+
ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9pbml0X2Zvcl92ZXJpb25fdCB7DQo+ICsJdTMyIHZlcnNp
b247DQo+ICsJYm9vbCBuZWVkX2xvYWRfa2V5Ow0KPiArfTsNCj4gKw0KPiArc3RydWN0IGNtZF9o
ZGNwX3dyaXRlX3ZhbF90IHsNCj4gKwl1OCB0eXBlOw0KPiArCXU4IGxlbjsNCj4gKwl1MzIgdmFs
Ow0KPiArfTsNCj4gKw0KPiArc3RydWN0IGNtZF9oZGNwX2NhbGN1bGF0ZV9sbV90IHsNCj4gKwl1
OCBia3N2W0JLU1ZfTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9nZXRfYWtz
dl90IHsNCj4gKwl1OCBha3N2W0FLU1ZfTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRf
aGRjcF9zaGExX3Qgew0KPiArCXUzMiBtZXNzYWdlX2xlbjsNCj4gKwl1MzIgbWVzc2FnZV9hZGRy
Ow0KPiArfTsNCg0KVXNlbGVzcywgc28gcmVtb3ZlIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAr
DQo+ICtzdHJ1Y3QgY21kX2hkY3BfYWtlX2NlcnRpZmljYXRlX3Qgew0KPiArCXU4IGNlcnRpZmlj
YXRpb25bQ0VSVF9MRU5dOw0KPiArCWJvb2wgc3RvcmVkOw0KPiArCXU4IG1bTV9MRU5dOw0KPiAr
CXU4IGVrbVtFS01fTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9ha2VfcGFy
aW5nX3Qgew0KPiArCXU4IGVrbVtFS01fTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRf
aGRjcF9lbmNfa21fdCB7DQo+ICsJdTggZW5jX2ttW0VOQ19LTV9MRU5dOw0KPiArfTsNCj4gKw0K

