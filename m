Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F162AC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgAaHdvy1jfl9spAe/Xj/R7FdoUBXSoVWIzyP67PmX0=; b=LHH6Umw4SrEdCUHVsJs8wkFTkG
	R94hv3kI0IvHG9VFrfhYZBcgRz+MLsjAVMrVGubpbooyyW+4ssaXkF+z0kRnLj7nTVLDQWby4baxv
	90toQDziaiQBDbwh0lPEJuN6uV4kQz+E9b15fqjdLZQIip+WUUtCsjiTzPBr6yggxhCO9+havlYBK
	qZT/CKdTnxuWkFuoveU9+j4T9vPQC4r0NuKldq8TnTdUg5gEL75Nj/fQa68OQGLeN33OS4ySHsg0j
	7H6HRY2yQZJUdwNJNXt5j2x+xrmW7m51lzzsmB/qegFIadZN9cvYJLwUviaMUh2leQEVXk4RmlYbH
	MbOQ6Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOCV-007Drf-34;
	Thu, 20 Apr 2023 06:55:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOCS-007DrA-2U;
	Thu, 20 Apr 2023 06:55:26 +0000
X-UUID: 509a6cc8df4811edb7d8d11f642b8e78-20230419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RgAaHdvy1jfl9spAe/Xj/R7FdoUBXSoVWIzyP67PmX0=;
	b=dj3JaxkZ+dS3y1Dd3AOr0yHYkJO53jZeqMVvHk7Urf657Zyq71tyfbFw1k1WcE5j51BHJLRfP/cOZ0k8cgSN4ioF6SKMoJYJWEIpDEAXzfOv8eGpwSaB8f6uWl2hpBgXiT+qIOnA0/SUuAZcODja8Zd+uKwsd5IgpSuykaxMeNw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dc31b141-575a-48ec-8d64-b487f83ddad6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:ff2794eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 509a6cc8df4811edb7d8d11f642b8e78-20230419
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 478432288; Wed, 19 Apr 2023 23:55:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 20 Apr 2023 14:44:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 20 Apr 2023 14:44:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR0XxmDbUC7L2c4DBk2f0jNzlwVz3qz6biWU/aTIkbFc1Op6qiN4Mziprwz337YHjjiW49enXO4bztZbd3VlUmpBxRG7v3prmMroTHT65zVBmYfF+/3fKoTIT3Hgdvmpf2dn+MdtLPq1oX1NKTUaN3w+IzzFmsfgq4Nwp2VHltfIiRRqmDqCGzrWbSrIFa0I9PVCdUGURZtpHvFKnFkiRcOzApr8FMaBDzMgdGjc/BQ4CD+EY3OHj7/y9B+d5vDbm44Vdu22CYYhBBiu8hYXxG8OuQkl8ngXHCb04mPmUTLtbAz3mjW9XLgH+uxUGENxP2kDJDp5NBmWNtO9dgT3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgAaHdvy1jfl9spAe/Xj/R7FdoUBXSoVWIzyP67PmX0=;
 b=G4iRv5fdw/L2RpJkrqwkUOacAH/ouzXsYUL+7Y9PIa5/aaEQEsibAm+uPsMAg8XsCyZwwVWBJ6iQoWLZg8BEkgvK/knytXUd5sExKIrNkZWU5Uf4XmXMvGHpSVvL9qK0rD5CnGYsRtMob8a+t9UWbfwHu2hjhL5+G2e497sMhhI0bZYfMCrhZB18wBSv0Wk1G7FvzW9FpJ+bhs5yl9cf+m6LTGe1G5GfNCNEXxzyG6nFOlUc7k6GfKOIKhqTuI6rMLY64KDrw6PjF2l9Aa1Cvesed9gJUm93qV2aH7EB7HML0FsSPL9N3OMikPajkebhz9p6thoK3yEZhLDNWenqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgAaHdvy1jfl9spAe/Xj/R7FdoUBXSoVWIzyP67PmX0=;
 b=tEcHmvlf8EV/PAHeeS9lF4GKXRh/t5rW5tYF/OuQSxl27YePLWxMAJaxpNZHeaG7N5Tys8alAsPqZ/H8+KiProRKRo0vMYNmPloSxfK5n0tqsSckDGTtBFtBOpNr/wNvG36rsozUR81ecx2vsOFVvq/d0ebUupwQUlGGyGclUnI=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by KL1PR03MB6170.apcprd03.prod.outlook.com (2603:1096:820:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 06:44:41 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 06:44:41 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Thread-Topic: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Thread-Index: AQHZbfV8ohCKT3VrdkWPI+xYfDpUTK8pOV2AgAqR4QA=
Date: Thu, 20 Apr 2023 06:44:41 +0000
Message-ID: <72bf4e967ad1949e98ee67d29e8fc0a3ee0d75fd.camel@mediatek.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
	 <20230413104713.7174-7-trevor.wu@mediatek.com>
	 <23dea66b-27cd-dbeb-37f5-ad9566e50962@collabora.com>
In-Reply-To: <23dea66b-27cd-dbeb-37f5-ad9566e50962@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|KL1PR03MB6170:EE_
x-ms-office365-filtering-correlation-id: a4e281a3-6c81-4f56-bdcf-08db416ab82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dvKS1VvIER40DNnpqjhv7rrtfIvLMT+f7scbzqsKkniSNKXfbwaZw6I90gooy87uLZ8R20ni6nuer00JuVLHNvnIW0bLoq5VmLNRJZhSUgvS1QaXYvN3gdZgzQQ53x9WSQZla6b/K1kSD2JslRoV69X7H2rIAXLcxaz0XBaaseKQr0/pt/qymDm1XJooxFqr4FuPmQCEXPInrzuR+0Fp32C3ZDDr+mspToxuD42BLoqIiUr1dgXqHdG2VmIOYNK87CiFSnL8/7DVOVj4crgFf1Voh8tnhxoYysImDpRfUoSv2wg3U0R/cxieu0QBs9MCbgDAwefR65hVg/e8gNCua+VTQQvEBtEsNFC/xKIgWOKpsdeBYje0OHgw1z8lyW6sKqW25kl2SuELoW5xR9MtVm6SiCCe3Nna34hklUlwu4t02AwAaoNwv61/D6g9bbFCk0hzgJ4eONs5QQ26HTnrRHQVU1P/Zs/e5ltgJfp3zxW8YPD6k2DtQdxH8xKfbAwWCNQJSbkc1aEWzQFMg428lNGiXUc/hlduxbhC262sh2m9fz/XDKZeQ0nhtX0SVJ5kTUc2X+bf/Io6uphZ/VN9lolNfsqjsfMkqLpR45FzL8PT9El7LztrFq6iHJy5b2yVUthmTUn/mQOkqhYCeI4cqrz90SfrKNB25UhKQzD0NWEZ6CuoeiGiKyHlEx7VtJkv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(478600001)(110136005)(54906003)(5660300002)(36756003)(8676002)(8936002)(38100700002)(85182001)(2906002)(38070700005)(86362001)(7416002)(64756008)(66476007)(66556008)(66446008)(4326008)(66946007)(76116006)(316002)(41300700001)(122000001)(6506007)(6512007)(26005)(83380400001)(2616005)(186003)(6486002)(71200400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3FDYyt5UzQ1OTg3c1RJNm83R0tQMFdWaFZ0OFdFeWtxK292N0llTlNVK29P?=
 =?utf-8?B?dXN4YkhMUXhRUHlueFYrYlZ1MURUaTkrVjY3SnN0azljK2QxVndRMEI2d1dv?=
 =?utf-8?B?WHBubSs1UjAvMlV6WGlzdHNrNXZDL0cyTlh5bitMeE00WXVLZFJMc0FqM1Rl?=
 =?utf-8?B?cmJPejF0bXFQaWRQM2hCQUFaWXNqc2UyQlBLdXVZTkJNZDlsWnRWTVFydTJo?=
 =?utf-8?B?TVFYNEhCVmFuTWt1UHkzRjRoQTlETFExVkxrWGFDUExSYzZXM29NbHJKbTRi?=
 =?utf-8?B?WFhVcXgyc2hVS1I5ZjZjSGpZOEhMRDZCc1RxeGhQd0hJYm5WekJ3K2E0TFJR?=
 =?utf-8?B?dmtGanRPNXlSSEF4dmszUVlhNXU4K1FDTHZucGM5Y3VJK1UyRmVxUTVOVzMy?=
 =?utf-8?B?RXpKaXhwMXhHL2lqUlRPb2xWYTUvSmRQblRUemhGaVcwUlBQWjdQWmZRTjYv?=
 =?utf-8?B?VFk5K1hoSWV4V1VucUFoRCtaZDQwalVsUFZkTTBob011QStQMkU1bitQRW5s?=
 =?utf-8?B?S1dkME5iY1NRMVhJb3RRWVNGaFR0NWRPM2xjNWx4VitzcmhHZDN4d2dXN0R0?=
 =?utf-8?B?Y0R3Wll2ZUZVVmVoMEU1VDk3bnVRZXBrSkFHRGo2T2xzNHE5YUg3ZkZhMHlm?=
 =?utf-8?B?Q29GSHoxa0s4dlhwblhwcFR6VkF2WkYxeDlyL1ZwWkw5VnBIVUUxdithQnlX?=
 =?utf-8?B?eTNKaXcyNHRPNnRoUDRKcElPQnkyWVAwZm9IdjIwZTlGbGl4RnRTWGlNU3gw?=
 =?utf-8?B?RjQ2ZCtVQVd4a29nQzd6WDl0L1FxR1B3Vi9UR2pJQ3ZEYVlWc0ZKaGxuVy9G?=
 =?utf-8?B?OEdLdDRmM0dPaEZHOVo5STNLYlRHZlMzcVlxNGhaaVltZ25pZTVRMVhiUHda?=
 =?utf-8?B?bUM3T1ZlSkxScUROeUhpRG5rNEJiUlVocldNL2tKSGxzeDBTVi9BYmg0WEZ2?=
 =?utf-8?B?eTBoeVpCWFcvZ1F5NDdMTlZpRmhNTjNoeE0waWpaY1p3UlFnM3hQYzRzWHpq?=
 =?utf-8?B?UVBZSENqMUVmcmdxVzlXTFZ6YVZ5OFdmZFUySlZuemhnRW5xcGNMRHZmSm5o?=
 =?utf-8?B?RDRpTHY3ZllOeEJkVmRYYWppSE4xSy9xUnpjenNWc3RQZko5OE16d3o5aWd2?=
 =?utf-8?B?UEVFb0U2VzFneC91TWpHTENHSzJjWDc1RVF1SExrVWtsd0dXbDhXVnVnOERn?=
 =?utf-8?B?T3JtanNLbnhrQk9HZHdNWFgyRzE5SWpUV285MERZd1BFdjloSDhlQlhvYUQ4?=
 =?utf-8?B?OFpJSFpwU2tkTDZmNG9XOEluQTlqZnJYaHlsQTdDVW04ejAxenRYTTVzVXhq?=
 =?utf-8?B?dGhDV0xiNVBBTEtyTUYzTFVNNjBXbjdvbG8wVW1rM0NCVUFlSld6QkdPTll2?=
 =?utf-8?B?bVV4TGZvWXBRdThGRjRHdDJoQWVCeGo3RGREaXZtV051YU05Uyt6emIwd05R?=
 =?utf-8?B?NnBBajFyVkhEZ0NCcTgzSUlSM1NETjBMY1oreWdUQkRYZmh0V1RiZ0M2TXdT?=
 =?utf-8?B?dWw3NW8yejBJQjNhUkE1S05ZQVl5Z1RzT1p1b2lpMjRyUlNFTmYxTFpzWW5B?=
 =?utf-8?B?VUtSLzQvZlFuMW9qa1ovMkpqRCthdjVZc2VmV0hKQjBJZ01HQit6TnNYalFl?=
 =?utf-8?B?Ukt4b2phdDc0UlVNVkRDQkNWSXVjanVtbGtuZU42VTNYNEVsd0FRWG5mc3NN?=
 =?utf-8?B?Nko0UlIrOGR2NjNwR0w4SDRNbzRnbmZOM0tPckN0MTFYcGE3bEZldVF2NC9v?=
 =?utf-8?B?OUsxcDNXVWlweHVVU3dWVkFScGhha1ArRHl5UkxCUHBHL2RjMTJicmxiSUxu?=
 =?utf-8?B?VzdqbWVBMVBPSzlDS1pWY094OUJLS3E3VG1mSFhCT3J0Mm5hNUlpdjJFb241?=
 =?utf-8?B?ZFhiTWJZdzRxWmxoaC81VDJSdzA5MWRvQmV1VGNoLzdKSDNwaitFS0tudE54?=
 =?utf-8?B?VlpJS1cvcTh6NFpkbkRFWU9KbVFZa09aQkxGWGtSQ2sxNU1IOFhVd0wvWURo?=
 =?utf-8?B?c3lDQnpxclg5T05FWEpyOVM1dDYwY3lSenhjTm5qMElYcWJia1piU1YwY2w0?=
 =?utf-8?B?TWI4RE8wUk50bDJwL2d5UlFtY0huZ3dKOVR2Mll5Y1dWcktFSVdFR1lBcndm?=
 =?utf-8?B?NDFRaS9ZZ3UzQmkzaE93dndKY2NzQnErakMyZWdjcHRIZTFWZmxkdzRUZ3dJ?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DD49399A85BF64BAFF7127760BCBBFC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e281a3-6c81-4f56-bdcf-08db416ab82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 06:44:41.4933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YoDgIC6mXNTD/qZslUkZCNJTbgfAVpUm6VcJ+huQmi1Pj9zNM/UF6EBI3ooVxBJH09nrRVbpIWAUTMAZRQi/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6170
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_235524_845535_19C8E26E 
X-CRM114-Status: GOOD (  14.70  )
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

T24gVGh1LCAyMDIzLTA0LTEzIGF0IDE1OjE5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMy8wNC8yMyAxMjo0NywgVHJldm9yIFd1
IGhhIHNjcml0dG86DQo+ID4gQWRkIGJ1cyBwcm90ZWN0aW9uIGZvciByZXNldCBjb250cm9sbGVy
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBXdSA8dHJldm9yLnd1QG1lZGlhdGVr
LmNvbT4NCj4gDQo+IElzIE1UODE4OCB0aGUgb25seSBTb0MgdGhhdCB3aWxsIGV2ZXIgdXNlIGJ1
cyBwcm90ZWN0aW9uIGZvciByZXNldCwNCj4gbm93IGFuZA0KPiBpbiB0aGUgZnV0dXJlPw0KPiAN
Cj4gLi4ub3RoZXJ3aXNlLCBJIHRoaW5rIHRoYXQgdGhlIGJlc3Qgc29sdXRpb24gaGVyZSB3b3Vs
ZCBiZSB0bw0KPiBpbXBsZW1lbnQgdGhhdA0KPiBpbnRvIHRoZSByZXNldCBjb250cm9sbGVyIGl0
c2VsZi4NCj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KDQpIaSBBbmdlbG8sDQoNCk1UODE4OCBp
cyBub3QgdGhlIG9ubHkgU29DIHRoYXQgd2lsbCB1c2UgYnVzIHByb3RlY3Rpb24gZm9yIHJlc2V0
Lg0KSSBjaGVja2VkIHdpdGggdGhlIG93bmVyIG9mIHJlc2V0IGNvbnRyb2xsZXIuDQpUaGVyZSBh
cmUgc29tZSByZWFzb25zIHRoYXQgdGhleSBwcmVmZXIgdG8gY29udHJvbCBidXMgcHJvdGVjdGlv
biBieQ0KZWFjaCBtb2R1bGUgd2hpY2ggbmVlZHMgcmVzZXQgZnVuY3Rpb24gaW5kaXZpZHVhbGx5
LiBGaXJzdCwgcmVzZXQNCmZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBieSBmZXcgbW9kdWxlcy4gU2Vj
b25kLCBidXMgcHJvdGVjdGlvbiByZWdpc3Rlcg0KZm9yIHRoZSBzYW1lIG1vZHVsZSBpcyBwb3Nz
aWJseSBkaWZmZXJlbnQgaW4gZWFjaCBvZiBTb0NzLiBGaW5hbGx5LCBidXMNCnByb3RlY3QgYml0
cyBhcmUgZGl2ZXJzZSwgc28gaXQncyBub3QgZWFzeSB0byBpbXBsZW1lbnQgaW4gcmVzZXQNCmNv
bnRyb2xsZXIgZHJpdmVyLg0KDQpUaGFua3MsDQpUcmV2b3INCg0KDQo=

