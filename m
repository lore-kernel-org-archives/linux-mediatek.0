Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B88C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMjAK1JVQiKyedPtI7861RA7YnqxMnde54pE4Hhxv4E=; b=RHCVh2meJr5r7uqs9g0T1vG7hX
	q5Z4VIkg5tYJ+VAFKd49K0R9wWnpSXTBHaB2zwWuuynBybzMor95V1o7Zi18yipM5380TBn9oylnz
	w5oKOjusBFFw4Bz2zlcuZD5+hvtn8QvORNLOE5B1McWnv0JTXsBrtH3+ifJmTtl9efKTUZ9bkHlwc
	1LAfrlxFQSUlVKCYIFEL4H0uTLxfczXOyKGFOEsI+j/4WW3n0RB6/RP83O8faPXJHy6iMmCdVu2i8
	xWz2P7arTRz6dgqojKNBm6qiMBrLOFxK9ix3+lt01pj18eBFs3JN6ITkDFdQzd4c16DhmP/ackhb9
	tathaTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqjI-005U60-6s; Tue, 29 Nov 2022 02:52:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqiC-005TaF-UJ; Tue, 29 Nov 2022 02:51:10 +0000
X-UUID: 7fa83afc135d40b0a1059293ce15efd0-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zMjAK1JVQiKyedPtI7861RA7YnqxMnde54pE4Hhxv4E=;
	b=eGV/eVdX4FoJmERchT62qh/S3nMTaWbe1REI8z2NtDRtl9B8F9E9kpF6OAWpn1Ikw3d03+YoivF6g33feMvf3f+NhHtLq5R6s0PSZNsujhAw3wn6N7RDPSbgDCab/66rYt8HstJBe6ca91lr1fw0bE6cL7HU9rMHrOu07doL3nI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5ff1823a-d5a8-4d50-93e2-1ded39b4ebeb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:9853911e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7fa83afc135d40b0a1059293ce15efd0-20221128
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 429884457; Mon, 28 Nov 2022 19:51:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 10:50:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 29 Nov 2022 10:50:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM2ICiBRqtoOCSFGlsDuuGuCiWzDPsQFpmXOqQgTbqPlrKi56lXqvs+w2MMBvHa1Tmc+hkGdRPDhx9g9w0gYCj/SmTVbcrCiTywS0kMdCkR17M0Xm5o4yUYgHx25X0TouZyQ03gKvu0Tf/g1n4hkUTkWJUVHR5ztseIjbjgJf3ytZ+Q2j0Cba7Gkd+Ah4yzS0edeS1+iHsppMU4U9V1F20BfyDSz1P1TpHyxjZy5K0Du1gauhov8uTjQgFs0y1OfXbZdc+CY+SUZfKQHahULN6bhFCDbt91T3eg29vXz96uFKo53kxk3zNzivRsHWPOT65urW0wCKNg/qnqhbaLXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMjAK1JVQiKyedPtI7861RA7YnqxMnde54pE4Hhxv4E=;
 b=lO+BQjWMszc98WsGW0tgyWgHphV09AZ8Uw/WQCarIlVeBBaDqfj5K/YC9m8RRWpygZgJcL6yvXjnOFjOxpwN4skno1wouBbOtRbN4i6Y/MZCqqVWxkRl12innX5AD5uhH4timEiEDmh3vTFiOnNEEXVrRyRPgUGr51qApttKht5x/QZgAgYk4ohGjcYDjC9SOQm/vdNf4FiCRo6ARhmHDyfRn/o52RGOnonSYhiNmGTGoN9d2VMugkp0RnDogsGj5uDNHxB3OIbnLqDizhqPoHE4kG5BLVm6sjdA8bkV9rOrfXJqqAgtAj0DRtDQIfewou33VA2DJNkIfoISvfecpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMjAK1JVQiKyedPtI7861RA7YnqxMnde54pE4Hhxv4E=;
 b=X0X+uw8IY6JAOA+YAzKB6B0UenFbin0A/WUnM6y/E7I01pnanCGnk0UkaXdR4dDpTPU76igx8q8QhuomTOL4b+Tn37eOzQlw1Xr1UcPKU/0+k90IgQCmcsIzrWQwVoZUVa9hbZQvZBvWM2aARXMwnpqdFotMS9v9hA1fYNYSwTg=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 KL1PR03MB7040.apcprd03.prod.outlook.com (2603:1096:820:dd::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 02:50:26 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 02:50:25 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "gch981213@gmail.com"
	<gch981213@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at"
	<richard@nod.at>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
Thread-Topic: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
Thread-Index: AQHZAs5U3hXZdqvH5kqzlnM2fDcg7K5UC1yAgAEpsIA=
Date: Tue, 29 Nov 2022 02:50:25 +0000
Message-ID: <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
	 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
	 <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
In-Reply-To: <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|KL1PR03MB7040:EE_
x-ms-office365-filtering-correlation-id: 8bafcfd8-c6a2-40b2-61bd-08dad1b4779b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mi3m2dJWo3bJ8ll8WAdXFI+6IMgrnmtdJvbaOafzRYUGY5BSvIQUkPe6+JxB7ak1rtDBHenZeUWxhiUBdAFqP4pfhrB6YL21vW2/82NuCW+FI01umUCasx+w0Q4qoJQr9CipehhTIAaTRvr5gS/aKY5wtdnjhbSqcqzt4favK7ra7dUkD/0bjbbTwV53Kmdc2hzek/VdPJt6cTTgF8M/bwaQpsPVtTmL2MjR1bll3/BXdU6FAXyL+citHiyuMBIaykUUZ+MwgAyunx+CZFxCeF+EsP9WA76GEgev77BScp06L0GKm3FQ87n+vXMnuVon6GVcOgBhPMJmDMjPirMArT7KkpsEGGdYtD8tJyJcsBVFSEG5UUl+O2R9x138hS29RvzkK7aGgLV0gSWFlLveBIOGqu968AMn5gPFISqWvFYw9pNvWGT+hpZwcZme7zE+tYWHw7m31ZxjPM1eH6ahrAvNuNkZVFdwDkUVRfnJX+wtL8P9KRmOcoQZXi88iMfnckaL3SX2uxvxqgGCuphfdRQxGPFnyewzI9r85g5Hf4Hi8o6o7KJkBe2Az7HypAQATIsVjT3sUzIESnVtpfirmNA9PRExwv+Rf3sNWWicxMGXJ+CotfPKMLiOb1BCk0n1wnIGEe0aW8hdqvOAHUbnnTpwOoej0EX+4JjLFfr8XUzsux4W/IwShBYSKmLypl6fTifzuiXGSRCVoPrv/P//hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(478600001)(71200400001)(6486002)(6506007)(53546011)(107886003)(54906003)(316002)(6512007)(26005)(41300700001)(76116006)(2616005)(36756003)(4326008)(8676002)(66556008)(64756008)(66946007)(66476007)(66446008)(8936002)(186003)(85182001)(5660300002)(122000001)(38070700005)(38100700002)(86362001)(83380400001)(110136005)(7416002)(2906002)(4001150100001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkw5bEpDekl1SmJaRmRJM2U1eXRGY3hRK0VOa29pUHRndzFlaFp5WnNJZWtW?=
 =?utf-8?B?eENuUE1UQ21WRVFLOE5uNyt1a3QxU0hmN042TDBEak16aWFhazlER3pudFlk?=
 =?utf-8?B?WTRyTkdmU0NLNXFwckFiOUgvL3FPZjVxVzR1ekdNdnZkMG5kRm9SQy8wZEIz?=
 =?utf-8?B?QUFYTUcrM0NEcGZtVnplSDhRTFpNVG1ub0g3THJENW00M1RvZTRORGNrZXQr?=
 =?utf-8?B?b2d0RHZHVFVsdU9xSkFyUXVqVlVKZ1prY1kxbFJ4amlEVW9UbWdubnZnOG9T?=
 =?utf-8?B?eEYwUnVUY0dEY0hyNlBDdUNteFR0YjlzRUl1cmozZEgwZ2hUeTc1WjI1SVJ1?=
 =?utf-8?B?Nk02LzJVWkEwajFJcG9ZdHRHTEd1bHExbit3MTJ0WVRFcmVFR0Q0OWNpQUx3?=
 =?utf-8?B?NWJDYWlSanU1U1o4TmtCcTZWU2tWdE9pVForU29adlEzbzBkZlVOVW82VFRZ?=
 =?utf-8?B?OFMrWmZTcElEejErcFUwdmdJTk1HVldoVjhXWXdYUDlYbFRRVVVndlBGdUEv?=
 =?utf-8?B?Q3lMQ1VhVkFCNTRQb2tIVmVIQ05kdHNodlR1S3Q2akJ5eENsOTc1Rjl5UXdj?=
 =?utf-8?B?SlZQc1JHL1B3REMrN2JQckZGWFl4RXZBVld5THVCVkw5ekRyeUhoa1p1SWpO?=
 =?utf-8?B?RXdxVjZ3Z0hvQllBc3ZmNUFKbkxPaU9UajhJVzZUeXRkNVg2c3VBcDN6dEN0?=
 =?utf-8?B?QVMveEUwYm1VTFh6T0Rwb0F5SXVWcEY4aWVheWdBM0RDT0sxdmJMZjF6Q0E3?=
 =?utf-8?B?R1g1OXV3dXdLSkhtKzBwNEhjU3RYQ2JhVlBjY3FWb2thd1FvYUpRMlE4RkZx?=
 =?utf-8?B?cGdrU3AyOUJ3Wmo4TUR1dDNkT3M1OGNqQmdTT2hFa2lxSXZpdTE0b3BxSU5z?=
 =?utf-8?B?amsyYVBBSzdkQWVCZUNvMk1NT3B0UTBXUThteWM2cXZ5UnpYV05mc0pmOUdk?=
 =?utf-8?B?Mm5EMW9VUmxMaXBkWEl6TVY2UEttN1kxY0ZYSmNuODJBYVpRSlVDM1JGSE9W?=
 =?utf-8?B?RG0va1BGZStGTnQ4MjJRNnBqejZtbHJ3YlBXU2JJOFhrQyszUGVnWXNKOFBu?=
 =?utf-8?B?R2ZWMUxnMXA5ZUlGeXBWczFsTDduajMvbzVveG9jbnY3a0hENXlxbC84UVpt?=
 =?utf-8?B?aHJCRFJqZkFYN1JVamxqSGZFVmZBUnJGd1VMTm1PVGdnT2NwRWUzOGNaRFFa?=
 =?utf-8?B?Vk9PbGYvdXJvbzFoVVBWMlJjYjlDNC9QQzBhaTU5VWlqQUlyRnkxNEFCSE9p?=
 =?utf-8?B?dk9jYUU5MXYxRTZ1M1V1T0dQTG40VUFmalBHanVCQ1RuamVpRXpiWUd1L0tj?=
 =?utf-8?B?NDdhczFUdE5KWkJpWmFkWGRwbzdMTE5CaW1yQ1JNNitXRVZvcHF1QUVJc1o5?=
 =?utf-8?B?TVBYaWZ2eFV0T0cvczNRTmp0YTRCNmRpMHlubkdnV25XYi9DMDI2SWVlVFpn?=
 =?utf-8?B?QjdLRlU5ajI0aVRvMzlhOWduVDBhMlpEM0hjdXhhejVEanRjUE5kNEFaRU5j?=
 =?utf-8?B?UUIrZ09QaXJlRzU1cWlrY1lIc1RUbURxQ2FTSkl2SDFGNHdEZ2x2YlhGc3k4?=
 =?utf-8?B?VmlocHFuTlJOVDljQlJ2M0h5RStNK0Y2cmx6N1Bra3FBenl6cWl6WldWSXE5?=
 =?utf-8?B?UVNSM0NTZWpEKzE0dUgvQkt5NFpMSW9RSzdvU1FQSGI1eUlhZFVSUVdib3Zl?=
 =?utf-8?B?Q1Bma1JuOERMQ28xYkJubWEyQU1wbUdrQkluT2lqK2tILzJlWWJMZitpdWVr?=
 =?utf-8?B?bG1FRUl4cGpiTzJNR0ZZWTBlckRDemZmbU5EMnUwUDhncThvK0dOT2xzeUg0?=
 =?utf-8?B?ZWM4NEJqcHRPMVdQTGFEWGUzR210U3c2QU1KVGdQTFJreFU4cGJ3MHQra3h5?=
 =?utf-8?B?cCtuSVc2WXBSWXk2TXBLVGszSWorYWh2VEtaYi8yM2hTVlFnZFJHVnBPaVB3?=
 =?utf-8?B?Z0xmUkJJZkxlbjJrbjVqME5NVU9kSndJRXdYazloWlN1bEdVT1JiQ1ZwUFJJ?=
 =?utf-8?B?YmlyZUdUcXc1ZWRyZlU1RzVxMXh5bFJoK1orK081TTFsUjhNUjVyY1MzUkQ4?=
 =?utf-8?B?RlFLb0ZoVytQU2h0dWJaME16Zk9nZE9MdDg1bE5xZTN1WFZiOHNVSjlCUndx?=
 =?utf-8?B?d1NnK3N4OVVJSld6TnRGVjJaaVZqc3RSS2ZRRXE4SEt3RjFobkkvQVF5Yklt?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <334D709184DF0F4B953C05292E0797EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bafcfd8-c6a2-40b2-61bd-08dad1b4779b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 02:50:25.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEURvgPQFxBSP4cHIWh/SPIwBfWfWO0IloU8S8XTOm5t3idQFrAuwBp8gTQeBs+w5dOqFqgnOa1e67KkTcLXpJF4b5YsCOhBzptXmI6MDTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_185109_074966_0335AFAC 
X-CRM114-Status: GOOD (  16.30  )
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

SGkgS3J6eXN6dG9mLA0KDQpPbiBNb24sIDIwMjItMTEtMjggYXQgMTA6MDQgKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDI4LzExLzIwMjIgMDM6MDYsIFhpYW5nc2hlbmcg
SG91IHdyb3RlOg0KPiA+IGFkZCByeC1zYW1wbGUtZGVsYXkgYW5kIHJ4LWxhdGNoLWxhdGVuY3kg
cHJvcGVydHkuDQo+IA0KPiBTdGFydCBzZW50ZW5jZXMgd2l0aCBjYXBpdGFsIGxldHRlci4NCj4g
DQo+IEhlcmUgYW5kIGluIGNvbW1pdCBzdWJqZWN0OiBwcm9wZXJ0eS0+cHJvcGVydGllcw0KV2ls
bCBiZSBmaXhlZCBpbiBuZXh0IHNlcmllcy4NCg0KPiA+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10ay0NCj4gPiBzbmZpLnlh
bWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlh
dGVrLHNwaS1tdGstDQo+ID4gc25maS55YW1sDQo+ID4gQEAgLTU1LDYgKzU1LDIyIEBAIHByb3Bl
cnRpZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogZGV2aWNlLXRyZWUgbm9kZSBvZiB0aGUgYWNj
b21wYW55aW5nIEVDQyBlbmdpbmUuDQo+ID4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gIA0KPiA+ICsgIHJ4LXNhbXBsZS1kZWxheToNCj4g
DQo+IE5vLCB1c2UgZXhpc3RpbmcgcHJvcGVydHksIGRvbid0IGludmVudCB5b3VyIG93biBzdHVm
ZiAtIG1pc3NpbmcgdW5pdA0KPiBzdWZmaXguIFNlZSBzcGktcGVyaXBoZXJhbC1wcm9wcy55YW1s
Lg0KV2lsbCBjaGFuZ2UgdG8gb3RoZXIgcHJpdmF0ZSBwcm9wZXJ0eS4gVGhlIHJlYWQgc2FtcGxl
IGRlbGF5IHdpdGgNCk1lZGlhVGVrIFNQSSBOQU5EIGNvbnRyb2xsZXIgY2FuIGJlIHNldCB3aXRo
IHZhbHVlcyBmcm9tIDAgdG8gNDcuDQpIb3dldmVyLCBpdGBzIGRpZmZpY3VsdCB0byBzYXkgdGhl
IHVuaXQgb2YgZWFjaCB2YXVsZSwgYmVjYXVzZSB0aGUgdW5pdA0KdmFsdWUgd2lsbCBiZSBkaWZm
ZXJlbmNlIHdpdGggZGlmZmVyZW50IGNoaXAgcHJvY2VzcyBvciBkaWZmZXJlbnQNCmNvcm5lciBJ
Qy4NCg0KPiA+ICsgICAgZGVzY3JpcHRpb246IFJ4IGRlbGF5IHRvIHNhbXBsZSBkYXRhIHdpdGgg
dGhpcyB2YWx1ZSwgdGhlDQo+ID4gdmFsaWQNCj4gPiArICAgICAgICAgICAgICAgICB2YWx1ZXMg
YXJlIGZyb20gMCB0byA0Ny4gVGhlIGRlbGF5IGlzIHNtYWxsZXINCj4gPiB0aGFuDQo+ID4gKyAg
ICAgICAgICAgICAgICAgdGhlIHJ4LWxhdGNoLWxhdGVuY3kuDQo+ID4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gDQo+IERyb3AgJHJlZi4NCldp
bGwgZG8uDQoNCj4gDQo+ID4gKyAgICBtaW5JdGVtczogMA0KPiA+ICsgICAgbWF4SXRlbXM6IDQ3
DQo+ID4gKyAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICsgIHJ4LWxhdGNoLWxhdGVuY3k6DQo+
IA0KPiBTYW1lIHByb2JsZW1zLiBEaWQgeW91IGNoZWNrIHNwaS1wZXJpcGhlcmFsLXByb3BzLnlh
bWwgb3Igb3RoZXIgU1BJDQo+IGNvbnRyb2xsZXIgc2NoZW1hcyBmb3Igc3VjaCBwcm9wZXJ0eT8N
Cj4gDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogUnggZGVsYXkgdG8gc2FtcGxlIGRhdGEgd2l0aCB0
aGlzIHZhbHVlLCB0aGUNCj4gPiB2YWx1ZQ0KPiA+ICsgICAgICAgICAgICAgICAgIHVuaXQgaXMg
Y2xvY2sgY3ljbGUuDQo+IA0KPiBJIHRoaW5rIHRoZSB1bml0IHNob3VsZCBiZSByYXRoZXIgdGlt
ZSAoZS5nLiB1cykuDQo+IA0KWWVzLCBJIGNoZWNrZWQgdGhlIHNwaS1wZXJpcGhlcmFsLXByb3Bz
LnlhbWwgYW5kIHRoZSBkZWxheSB2YWx1ZXMgYXJlDQpkZXNjcmliZWQgZXhhY3RseSB1bml0IHdp
dGggbnMgb3IgdXMuIEhvd2V2ZXIgdGhlIHVuaXQgb2YgTWVkaWFUZWsgcmVhZA0KbGF0Y2ggbGF0
ZW5jeSBpcyBjbG9jayBjeWNsZSBhbmQgaXRgcyBkaWZmZXJlbmNlIHdpdGggZGlmZmVyZW50IGNs
b2NrDQpmcmVxdWVuY3kuDQoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZW51bTogWzAsIDEsIDIsIDNdDQo+ID4gKyAgICBk
ZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNvbXBhdGlibGUNCj4g
PiAgICAtIHJlZw0KPiANCkJlc3QgcmVnYXJkcywNClhpYW5nc2hlbmcgSG91DQo=

