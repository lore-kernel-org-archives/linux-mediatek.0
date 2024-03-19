Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A73BC54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX03dTUcGIDIsDGXnyHUYnh0uTTcr9mXBRcobhmvOkA=; b=TpiZZlZUoU04GXHmF7VaBAEjGL
	vPrqbqXTI9YMuWe5tfTBxY/PYEF5UP3/eep2q2ajoWvzB3z6jScEFQ3jG8gVh0YXvaxFhAGRPyK9a
	9xIi+EjP/EmdHD9banHVsbujnuLUK4BeZ4EPzUETc/rlE2ANzzXb9ZNe2YUPsOLFRlLG6rRpqL7pC
	W+iQc1qApAXdWukkdP/JddvfcLWH+AFEPhG456GPPkaZTxcEy0Vkcy/T+HOE4IscW7AJ/P8CiUwW/
	X2w7TPtisHArsar8JK8dl+Kl5rcbT0NTD2fIJKfIeuqpUtSbekJaf9wiOZ8Pl22eQvapBRjrw2PD8
	AdhuCVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmV91-0000000Bz0T-1HfA;
	Tue, 19 Mar 2024 08:48:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmV8x-0000000Byyk-2tDq;
	Tue, 19 Mar 2024 08:48:25 +0000
X-UUID: 7020fb5ce5cd11eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=bX03dTUcGIDIsDGXnyHUYnh0uTTcr9mXBRcobhmvOkA=;
	b=hjUT9jtc+cXu9l1R77RW9Jz+CtQkWooXRMG/QSm92XEK7pe6/7W0oLNc2Xsys+II3otwIt80461TzwKlAqiQbkVeN4o8mxpxSWtEifjUmo//iBPEnkq3/PPZWMew/EL1EGGwXXsIzaaO/nJuhlZbEm2BUPHTKYeUy5+shlAShPA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6c61cc7a-86e0-4364-8042-435f0039b5e4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:55de1000-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7020fb5ce5cd11eeacdb61a41848c7d2-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 133212684; Tue, 19 Mar 2024 01:48:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 16:47:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 16:47:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtG7gWE5pN5xEjbyH7eal8jlPzh0BzsZzyqyyKl/hWn322aW6Df2GJxzSPtedC2n7O5aulfJrN1eEpS8dThcIm3IxEdMk5O0TitqcLcArivUAle9euQV+FgJDqZaF9dGfk2J4H0qzjWu9cR+ZfKv6YFNst2P0ItK4iDwxiJvyAS07uDp9AorY9fPhqxAS/PpNGRrEaEgci8cBTcWtq0YrbT5R7Mm0pwDrqR1sh9ahGRU7/FYT3JzwtvVoVIC6tu+fMWWZ75Y82WObFFu75M67pJXq1PQ/RsGHXSlgqotf+WBWoLh1537QxGfo85qHDb/OipDLLP1cTyVUyVjTobMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX03dTUcGIDIsDGXnyHUYnh0uTTcr9mXBRcobhmvOkA=;
 b=FJ/ot83zsYROliGFA4aKAynhXWTokceAeMfOktXrde2LmGRsus1Bhaug8lVxTOaCd9L+RzvwM/8QgrCCFfrtRZkZQCT5u5raugdFtV9/dmFkKkcTh1XC01KCxjrJRKVD2TiXpnI/4DutwjcYFhwZd9zprvHKh6uBhFSo2nxRWmS6bBghO3NJmbUT/hTuikuLS1PUj9HV280ROfMpPTMqsvoT7k6+ilkF20o4vrNMSW5kbJ+ygqz6T3SY28wIBQMwnGfmUmRrY+WZyP/Jf2wv0TqPaWXKp9dgEZObNueldh4CesLqLOqQg9ULtuV8bApf1a9VnGYsoq/HHDZz+vP5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX03dTUcGIDIsDGXnyHUYnh0uTTcr9mXBRcobhmvOkA=;
 b=EhMcz1HJ3zRkSt3e+X8WAXEyaZA39+OLC17ftcfUEfzNGKWxwT4sDT1cJZz9SUAkkiZytnZ5Y4Mh8IUakf3XO2PAf3b5Oq80UFF/Ng6hbIIM/eg893qNSV6LL0q6Q3soho+4i/sQ2lFZhG6lwf9njeAqzUrYZOBRvi70a69eoME=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8754.apcprd03.prod.outlook.com (2603:1096:820:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 08:47:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 08:47:39 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "paul.elder@ideasonboard.com"
	<paul.elder@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, =?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?=
	<louis.kuo@mediatek.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v4 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v4 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHaQ8+pgBL6pTKEqkml+zYix0rfyLE/LJEA
Date: Tue, 19 Mar 2024 08:47:39 +0000
Message-ID: <b7b986a8941261f63bf4caa45c54ac9a27966d05.camel@mediatek.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
	 <20240110141443.364655-5-jstephan@baylibre.com>
In-Reply-To: <20240110141443.364655-5-jstephan@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8754:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CmTSHuU0QdQQrdcIQ7tPnsMD683akowy12Am7F4pSEOnWSfFV050LNwnCc/v2rlpAfxTdZxrN6DfEO8esWVTUUwskVx3p33MdnJPFVgBtli9EXIiMynkO9iaHTcmTYMe/iNbytxMmjmyvTu3Szj/j9rx9Lu9Aa6/JxZ/U7zQcigxheo4cvxIaPs3a3Kow6e9oB5IES4WG9avGN5UditsMONJWeMMBPcLuKkaLLRJDvWUl4yrDCYchL3XavTbiHR+Ma9HHLealsyHwgu+4mHUog/d31bXDoR2m3c8/Kvd+x+STkc1cvkuSIi4AuzP560dOJY4O20Z1VmoZlWsYef6mt+U+DTSpYmGMVcK49WtInG+GZobI1YDiVrcAMggRvphaTxDrg7cs5eIhcI8FC1gwKon9mrOJtkQbdZQR2rGXtoDNX0Ji7TUQa5Fo+vhcA8fmFLDmj885lAHNdXknDHzCSEG3mxn2OcEG1pO0Evci+8hLz8e7CM7E5b6ehjvbxIRPpfyg0bwSIpYLAwRwghw04nx8LY4O0fI3WmS6/bkcCTOfzzt0POP2+5ANkKcUugewUlY9dhbgPeUj95+gNuduccIPI7WoNRKwV1IRS+4D5egxUIXPNEUOrHwlw1M9bg/W+TMOtTqulFpd48S/x3ABqp5wdLvAYeUPo8Ak3RPY8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlQvU3lBb3lTVG9uS1A4Vkl2ZWF5cmtRWjdKazJJQytYYmpqbTdPVjRNUDBR?=
 =?utf-8?B?V01RODJQSDA2cE9sUkFKTzFTYlBlU29TazNMdW5GandYZ0FjNjJiOEgzVFI2?=
 =?utf-8?B?d0Y5aEh4T25rUjcrbzJNV1NyOU02a1Zyck5yQXk5SW5PcUU2UGN5ellMYUdW?=
 =?utf-8?B?VlA3WEplYUJUNWRqYWo0VmVrMGVwQjA5ZkRjMnNzSHcvTkVLcVZoZ1ZjdjBX?=
 =?utf-8?B?akFPOUp3WGZhQW1VUnlMN2FLdGF1RzdmSnd0NWtCQVRaNWR1OU5qQlB0Z0dh?=
 =?utf-8?B?K2lTQVR5bHZYSEkyVXNKNEJ1UUJXV1hHYy9pS0NzckF5Qmx4V3JPV2R2Q2c4?=
 =?utf-8?B?MlBxYm1ZMGtaRUlQMXd2R1I0a0tFWUdhK3AyZVRvc2ZYNE5XSys1VDNScG5n?=
 =?utf-8?B?M2ZUMml2Y1hySGthMDdIamw2Zkhxa2dVWUVlU0JqYUVDeWpBMENKWm1jZ08w?=
 =?utf-8?B?SndDMDU2QUU1WnlnM1ZUTlRvZ0w2N24xSEVtYTRrWHZaVlZ0ZnJ4SkFvY1Na?=
 =?utf-8?B?Um5oYnFlYnFRRmliMkxRY1daV2wycHZZRlArcUswWW9DL0o2bURaSE9JTHpm?=
 =?utf-8?B?NGRnQm5USTA5Q0dvZ2pqdEJIaXgrbnZ2ZkkzVk1NL3laWVArenZnL1pNamkv?=
 =?utf-8?B?bFpsN2pJODFmYi9DNEsydmxkYlBxL3Joa2lQNWV2MzRIQXZPUGp1OE9LTGdK?=
 =?utf-8?B?NGVqSTF1aFVCbk9tdXpRNlA1c0RDOGN2YVZma3Q5VEJxNVJvaTIydmZUbXEx?=
 =?utf-8?B?K2IyV2xkS3lIY0I5elp3YWJyWmxna3NPbzdRZE8wYVBjRmxlTjJYWHRnNXhr?=
 =?utf-8?B?ZlNCZVlhcy9SaEFUU2IyWTZZenZvd3NMV0RWMXFRSTROYlJEMjRmOWZhdXdJ?=
 =?utf-8?B?ZHY0dGFWbGZXMkhrOTlqcVJqY0xUbnRhaVcwZXVyNVEwbmlQL08waXpSTUN0?=
 =?utf-8?B?VnA5KzN4Z3ZROXFUQlAwTXR5ODRFTWpCSDB3SGZqdGVlZkE1T09WWmVZRlYw?=
 =?utf-8?B?dnFaZUJERHJLMDg1S0dpVUZaQ2VJcU9maDF2bTBJRkRNS09rVkQxdyt0YmNZ?=
 =?utf-8?B?c0tkQWtuZTh1SW5hZHpmQlQrZ1dJT0ozendqUkZiN29LLy83SFBjdE1wZVEv?=
 =?utf-8?B?TmlEODI0Qi9kTnlKdHVneU5sZUw4UHBZRXpVckV0UnZhRkFwYXFEVFU3bHEv?=
 =?utf-8?B?eFd2K1RHT2c1L0FoYnl6NXpJdHEwOGRUSWpqdWVRWFJoQjdHTmxwejJrbUw3?=
 =?utf-8?B?L0s3ZDkxT2RkZmFtblczaVVBcU5Td2FIN3h2Z1FwMU4yR2U3aHBpQytXUi9J?=
 =?utf-8?B?YTRkbm9FRUtNZ21OZm5IT0NRS2FMKzZVRzFPZk9hdWkvK1cxUzE4MEk4ZEtx?=
 =?utf-8?B?VGVMVzl6RU8vWEdhNGhYT1R2c0NEUGV6ZHVKQzh0ZVVpMDZnN0NucnV6YkFk?=
 =?utf-8?B?VTl6UVIwOXVnWGxNZVo4T3BFYTh5Zm5OREZXN2VuRUZCbkNaT0F0d2lBQjlD?=
 =?utf-8?B?cjRIem5neDJYL0VlYlJZajVXbU02Mk5rTG9XM2hPMFB5Z01QaFVXb3U1dXZB?=
 =?utf-8?B?WHdIU3E0RmI3VmZub3haU0l5K2E2V0hkRTkxQ2lTMmZIMkUxL0dhTi9KOC9u?=
 =?utf-8?B?NHZmN3F2RnREMnNBVGlxalNqSHJuZDJGckdHby9EQ0tBeWU5M2dNaUZzQTJZ?=
 =?utf-8?B?Y0wvZTVNQkVvV09neURGT3pBV3BZOHREUWhnQmZTeWRnb1IvRWQ0bDBjL0pQ?=
 =?utf-8?B?RWFoNm5mVWZNK2czVmhJWHZtMEsrSzVRT3RnNEt2Szc5Zk0wK3FIN2NLNUVZ?=
 =?utf-8?B?TjRpS3kxSFV6UVAyc0dITnVGb2EvSWZIUTA2eXQwTGZTcjlIa3dYdDdmZmdi?=
 =?utf-8?B?TWFIMEF4MEFqZkhhcXF1ZUUxS0xYenlLZjMzRHArQ0NFQmZrREpjVEs0Wk1i?=
 =?utf-8?B?UmNKZEo0R24venFCbDYya3IvcTVJQXVaMXU3eFM5SFR5Y2FvcEFRTE9pd0VW?=
 =?utf-8?B?S0RkNzlIeTg2SzFmT0MwKzBhOExRdDUyMG9LeUZCQmpLbzJxNVFMS1EzcmR5?=
 =?utf-8?B?b1ZJVzlodEp1Z3NScDlMU3JGK0lLdDB0RUo1YjVycmptcTZqbzc0ajhIU2N1?=
 =?utf-8?Q?PLc0gtBZfv2rzyyFzfNDXmUJ6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6096D97CB7C2BF45A69F8ECC55C6D2C0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d3026-dee1-480a-596c-08dc47f13b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 08:47:39.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgoYJBf5806YPrMkXVcvpVqQMowS4o0zPPy0Z2kRc6NFR0BgIyz8D4lrPtl8kwpGgKC/cFJ70SArl9T3VXX4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_014823_742342_8907A2E3 
X-CRM114-Status: GOOD (  13.87  )
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

SGksIEp1bGllbjoNCg0KT24gV2VkLCAyMDI0LTAxLTEwIGF0IDE1OjE0ICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBu
Z3V5ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRv
IGJ5cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhl
IFNFTklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4g
cHJvY2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5j
b20+DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1
bCBFbGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBi
YXlsaWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBi
YXlsaWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICsjZGVmaW5lIElNR19NQVhf
V0lEVEgJCQk1Mzc2DQo+ICsjZGVmaW5lIElNR19NQVhfSEVJR0hUCQkJNDAzMg0KPiArI2RlZmlu
ZSBJTUdfREVGX1dJRFRICQkJMTkyMA0KPiArI2RlZmluZSBJTUdfREVGX0hFSUdIVAkJCTEwODAN
Cg0KV2h5IGRvIHlvdSBkZWZpbmUgZGVmYXVsdCB3aWR0aC9oZWlnaHQ/IERvZXMgMTkyMHgxMDgw
IGhhdmUgYW55DQpiZW5lZml0PyBJZiBzbywgYWRkIGNvbW1lbnQgdG8gZGVzY3JpYmUgd2h5IGNo
b29zZSAxOTIweDEwODAuIElmIG5vLCBJDQp0aGluayB1c2luZyBJTUdfTUFYX1dJRFRIL0lNR19N
QVhfSEVJR0hUIGFzIGRlZmF1bHQgaXMgYSBnb29kIGNob2ljZQ0KYmVjYXVzZSB3ZSBjb3VsZCBk
cm9wIHRoaXMgcmVkdW5kYW50IGRlZmluaXRpb24gYW5kIGxldCBoYXJkd2FyZSB3b3JrDQppbiBp
dHMgYmVzdCBxdWFsaXR5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArI2RlZmluZSBJTUdfTUlOX1dJ
RFRICQkJODANCj4gKyNkZWZpbmUgSU1HX01JTl9IRUlHSFQJCQk2MA0KPiArDQo=

