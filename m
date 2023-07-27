Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1426C001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 03:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0BZ08HOkpVj+8ZN5IIEckSxBPJDerCFgrGG/BXiMzk=; b=mR+AJjDbiaDYt/RRSEiSxN/b/n
	wY8QlxUYOs1MGYnZyT9fFPklPx5rYkId3Xmn2xox5stOeL1HB4o4TmheA+/Eopf+6wbJWcE6IWsYt
	zg1fFJ5qOFyGSieMjq5yUB8b9IgZfvRiLtML4b+IY9xaq4Vf3e0jvDADST2XiqioAHr+QHUNGjnvU
	Fir3EaMk3Frftj9/9dh2Q1CugHORE5ScfMcnPh/LgH8LRExGLB9LxrBPMH70MPTNXnRjQlW/6E0ro
	/jxQHAXSPSe3+fkHWI2jkLRCw3C7vc1OS4a49Ktsj7Gy4EM+BrCy7pY8d476Gn2jGAlJ/1G4lNbfG
	sOO/HgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrnt-00C1vk-1C;
	Thu, 27 Jul 2023 03:36:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrnp-00C1u8-1q;
	Thu, 27 Jul 2023 03:36:39 +0000
X-UUID: c64f1a8a2c2e11ee83ed1395ce914268-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K0BZ08HOkpVj+8ZN5IIEckSxBPJDerCFgrGG/BXiMzk=;
	b=O6tR+f+tAcEEWEzf6iJp1IP69tLW5R06w9mm2DI+W8C3xl2jRSF5otKdqDt1HsS26cAFUbdyIQIll0Tt1pStxv1S2uvuUKofko14mHhF4COIirh5DAFxzLHA24N4NifyzR6wwVzlYRtg/8oPCJ9ZsMlSO06hBLHrBEW5YU39Kr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:f5b6d629-3fa1-45e0-8a7d-e683062a2edb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.29,REQID:f5b6d629-3fa1-45e0-8a7d-e683062a2edb,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:e7562a7,CLOUDID:8c7b94a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:23072710532737Z6Q7OY,BulkQuantity:14,Recheck:0,SF:38|29|28|17|19|48|
	102,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:41,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM,TF_CID_SPAM_FAS
X-UUID: c64f1a8a2c2e11ee83ed1395ce914268-20230726
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1819141797; Wed, 26 Jul 2023 20:36:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 11:36:27 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 11:36:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab9572HrmOem6o6sgTU3Dound/E4nYP6xER6zHujyvqaCj2fzY5J2HdcRk/W4vPT6bN8nosWGW1jotZWxWoZHVziupL2Tv7b+2I05qwdJsTuFufIevkv1WanddADNLWkdEqKE0fy5LxrHU/rM/TnaQmGNmVFGbpQUeGqlAeiu9wfZHhBXQOBGPh5o5rClDyfVMQoqXAR72YE4sHImKWUCEu6i+haFSP10YN4DL35dHqT1vUUAqo+IRKzor99LdjH2XxWrGxnLYkM8+BIjbN/Tu9lXGBcyBIKSv/7Rkgj8mpBRNF5EO+4N2xf4zhydEfYu1NpIcyCWCw0Re3LVb0Gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0BZ08HOkpVj+8ZN5IIEckSxBPJDerCFgrGG/BXiMzk=;
 b=VXfbCtJDM3GTvZ+QhqiflGUTgiN2Z/yaTZBp0Yvgh2yHaCeU3VoxoX98itfUTg1aM7O7YqtRTdpbZK9PlvR4EQT9jFh6GG/hxUA5HpNh8Yy4BqbWiNg3A52yAyAgP8zWi+Zw0GhSJTA7MjaygelB2N4lwiOMTnaHcuGqTX5ZgtK5FEyK+A94oMAptmZiOlOzky/ELN0ifAOC/7aW8FZVr5mBl61NgkH3/PZnVy1Fg8IvB950VTldikjDCb0icoPSqdwVPgUehD5C8TyNSanGAFEAvFmYwGQtTZSILDYoV4s9iQN1E6kJt4FZA1AfYm3To4cjNVNnkwqSZvMP24wwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0BZ08HOkpVj+8ZN5IIEckSxBPJDerCFgrGG/BXiMzk=;
 b=G+nwgwCq+GEfG9yEL1VwO1KLM4v01PuMyM04Ps/HasIXVJnPqEUdGTRqyUeh+wO0LMfZPadqdi7O9I6L4bWwGoq0qic79MEFsbrfKXMqyVaE9bc61Gt+T09J9H/PorbdIJDYgKnyalNcNTeg4T2m/B6s960dR6P/TwsaKRt0eTE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7723.apcprd03.prod.outlook.com (2603:1096:400:426::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:36:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:36:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "amergnat@baylibre.com"
	<amergnat@baylibre.com>, "ehristev@collabora.com" <ehristev@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: Re: [PATCH v7 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Thread-Topic: [PATCH v7 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Thread-Index: AQHZvspnqLUGlNhvFku0imFs3HvyIK/M+XKA
Date: Thu, 27 Jul 2023 03:36:24 +0000
Message-ID: <17b6150d22280f994116d529dd11a47bace158a5.camel@mediatek.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
	 <20230725073234.55892-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725073234.55892-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7723:EE_
x-ms-office365-filtering-correlation-id: 5132ee0b-ff91-433f-0de9-08db8e52a6da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +haSoVHwXVvcZtCpuKk9I9CIUXkS8wIUuxlOHfEj7xVQ9ja811C4lRCcOpqatOUFe4/7gt18xJDtozdUIhbeIWKadu/1NwPwG2KxOp4543tLmTbCsUQlGy/RtFAMRznebhne86aOhfiqvkkurw4jFmQSa+CfxpUxxxMo2FZYg6tujh8BhIsY+7hs6ImT6fPjNym//XLQ+CljBoLrY4hLFygpg8e+uSBp6+FbIESRcE5nrW8VGMJ4Nqj4+MZroywIgCOQ1gwhyTiItodV9daVhEal5No3UVU1aeHAqLE/CjuONVgnSBwdoQdWIQZ0TnmOBQIku3/IGbWchR89tZFoCjjDPNDNVQvjjJ47jt0RpqdpiyC6tgD4jA1MUHIZqOtagXsC6xjZW2bueoMe/03Iwc+kccnq93nMUBH5SSXOKd1oSri9CJt7tUutgn+Pkjxx1ATmG0qtcMa/d1QKoegjOhgTZXcckGEMV6iZOxpvkZ4WgYUsS53rpzJfVJMTINe9AC7RVsyg0VQXHsQeu0DF9/+dmT9P89RxsuLO2CQclhe+69InB2ePhzFrchF/EIsCPaEsOdlQzvMKPsbAgzD07+uecgwtcFYyuc0ufpuArvVI+jQr8Ofzk0rz/MfBjwmhSxPjcji1L09GlsDhEMh0ARfdwwMLjUvydYyebp7mYbA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(110136005)(122000001)(6486002)(6512007)(478600001)(38100700002)(54906003)(41300700001)(2616005)(5660300002)(76116006)(66946007)(66556008)(64756008)(66476007)(66446008)(8676002)(4326008)(316002)(8936002)(71200400001)(186003)(83380400001)(6506007)(26005)(86362001)(2906002)(85182001)(36756003)(7416002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmJUS3pYeHF0bmZRM09RTGNxYzJZcHRKRjdSNytKaFlQODdsdVJTai90YXZP?=
 =?utf-8?B?RS9YUUFsUnNYZ09KYXluZ21wQ01NalhadkxwYXlyZ0w2ZlJtZkI2RWFaUXE1?=
 =?utf-8?B?d3RSZTJXanNSMWY2VzlXbEdhZHd2M2pTZ1N0dVNCOFRaUmROck5PZ2V0bXMv?=
 =?utf-8?B?eHNjNUE4MTNQUlhXaTlIY1R0OUtBZU9SZXRjWENpN21SN0owdXhJVU1IT2Zx?=
 =?utf-8?B?M0NZRnJaMS9vTlhXdWVHYmtCSWhUM2hEZGwvL3NkK3FpRWNIT2VzWmNYOG0v?=
 =?utf-8?B?V0lSQnRSNVlub3VwN3dNRytxTUg4MDFpb09Eb041ek4yM0dWS2RJY0xSMEEx?=
 =?utf-8?B?NjJHMm0xamdsb1lhM0ZkdjBBazJvenFaS0ZhdWhabWN2azlYaDJ1SWtLMWZq?=
 =?utf-8?B?RXNIWmNHWjQ0MnNzZG9peHZSR2xNY2pkTXFLY2x2eGFFc0hDY3ZNeGMvSGFx?=
 =?utf-8?B?TFY3bytCQk9mTm1veFk2RGtWZUZhSkVOQ3VNcWRWRm5RbXJyRFNpSVplVm1j?=
 =?utf-8?B?S09vQktqKzNwb0wxcjZ6cWRxelQ4bUVvQkRKYi9LaEFkVUw0WVBYNzl1TDhS?=
 =?utf-8?B?c2lXUlN1MXFZNTMvVmQvYTBHY2pjYlZGRnJFTjQ3bHEvaU8xdVY3cG9LUEdZ?=
 =?utf-8?B?QjZsZzU5eG9DcE0rTXlYSFRncTZnRkVwSFdxd2hLaTVjeVY3QkYxWjJBTFIy?=
 =?utf-8?B?ek1ZREJFQTBDVk5BV3UxdlFQa08wYW52Q3FOd3VJZlpwMjgvTFZQQzhwRTR3?=
 =?utf-8?B?cG9WTEV2a3p4V2xRWUN0UlN1Y1JySUJUNnRZRytwbVo2Nit1dVFtRUNnRm9y?=
 =?utf-8?B?ZVE1MGQ4YURPdk5SMHRqR1hEYmlaRXRHaEN3TUdKbWlUNk1JUFQrVnNOUFZ1?=
 =?utf-8?B?TUNWOVVvRk5nVXhMcHdDcVhJd21tc2VXWkFHTW9EaDdXMTJLdkJVQyttTit6?=
 =?utf-8?B?RWJvZFc5TXdPR2h3SjZxdlNHMjVtNVArd28wME45WnFEcklBTkhvTnJMSElB?=
 =?utf-8?B?VVpZalNKWm43QVRzS0xtTWxxczI0amEvcHpLRHRUaUY1ajdmaWtWcy9zSFgv?=
 =?utf-8?B?Tm1BL1dwUjRhUFI4Qm1HUnRUWUVOUGMyVkI1N0RrcmZRSGhLZGdISm1FZ0pi?=
 =?utf-8?B?ZGRRM0RNRkhyUlBkaEdoM3ZTRVZlZWZabjVybU9oSjlkZTkxQm9yZmNYYlZO?=
 =?utf-8?B?OE9DUkJGWXVSWFVncFdJbW5GbnJLaUNRM3RyOVh2dVZ4RHM2eEpVNEQvSE1D?=
 =?utf-8?B?Y3VQOWp2UDh5bDJsb1l3T3RhV3Y1K1B5RW51M0lYZHdhbU9qc2FVVHcva1Rs?=
 =?utf-8?B?UVZWanJDcFlKVTFCdlJyVkNVSU9GUm1GTytiOGRBQ3FDUWpoalpPY1lFVGM3?=
 =?utf-8?B?YThJVTV0Nk43UndyNjhnNGZVckk5cHl0N1VEZ1pRZHBCTzFMU0NIRkJ3eHJD?=
 =?utf-8?B?bmhVNzdSSG1VNVlQM1pQZHNVUVk1RERvdzVBVDJXTEp1WERIN3dTZjhFNWxH?=
 =?utf-8?B?WXRGN0xRakxqWTR3NEJTT2FSM3cwdURsRU9Pd1Nra2hrdTl4Y2t4K0t0ZVVI?=
 =?utf-8?B?WCtCMjJpTkhiVzk2SkZwRVdwUjZzQm84V1p1ZTFkOTBHcUxnMVBxeFo0aHdt?=
 =?utf-8?B?WVoySjdtQmtLMlFCcDdhZTlidGZ3ZmJub1E1QmFxKy95aW1qdXdpeVJRMnRv?=
 =?utf-8?B?UTRlaCtWVlppczhIWW0waWUvOUZOSCtmSlVIcTNxMG1GU0ZiTkVHbklmN1A3?=
 =?utf-8?B?L0NJLzErRDZtZFJWSmZLMWhDdmQyNk4yWEx5RUVHaStkSTVpbk5MR1V3bllj?=
 =?utf-8?B?ZHYwV2pkM0M3SzREQzF6SnpVUUZZdm4wSDY0bEcxYzR1OXNjQjV6RkxVZXNL?=
 =?utf-8?B?ZE04Slp4Z1E3ME5QQy9FQnZRQlhGU1FLZ0p2bDlQYloyRmZBNlpJdWRQUDYz?=
 =?utf-8?B?M3ZDWTJZSmZQWUg0UmNPSHpnMjluOU1hbHZvVTRxenBmUnN2cmpSK0lTdGxF?=
 =?utf-8?B?V0w0ekw1T3RSZlVGMGt3ODVkTUFqbzZ5eE43SjdxbDNnUWRETzF1bzQzc0w4?=
 =?utf-8?B?a05aTkE4RWdwelF1TmxlMjlVN2ZnVVRkWTdYRUd3UTl0ZUUwZXdkVmhEdXo0?=
 =?utf-8?B?akVYZWJRV2o5NkVpZThVd1BNSGNvZFNVUHRnOFZrN2VlaGtEaGhDaitJZ0hT?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70226CB08B45F2489D04C645BBB65DA3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5132ee0b-ff91-433f-0de9-08db8e52a6da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:36:24.0822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBoi0Jrinmbnpw8YaiqYkgF6ZeJz4Yx+3K5K+eorSbkjwbBqW8q+RXJueQzoLP9/C15FdG6zPZzC4rCwcRvc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_203637_613162_456D8C34 
X-CRM114-Status: GOOD (  19.68  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDIzLTA3LTI1IGF0IDA5OjMyICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWYgcmVhZGluZyB0aGUgUlggY2FwYWJpbGl0
aWVzIGZhaWxzIHRoZSB0cmFpbmluZyBwYXR0ZXJuIHdpbGwgYmUgc2V0DQo+IHdyb25nbHk6IGFk
ZCBlcnJvciBjaGVja2luZyBmb3IgZHJtX2RwX3JlYWRfZHBjZF9jYXBzKCkgYW5kIHJldHVybiBp
Zg0KPiBhbnl0aGluZyB3ZW50IHdyb25nIHdpdGggaXQuDQo+IA0KPiBXaGlsZSBhdCBpdCwgYWxz
byBhZGQgYSBsZXNzIGNyaXRpY2FsIGVycm9yIGNoZWNrIHdoZW4gd3JpdGluZyB0bw0KPiBjbGVh
ciB0aGUgRVNJMCBJUlEgdmVjdG9yLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IGY3MGFjMDk3YTJjZiAoImRybS9tZWRpYXRlazogQWRk
IE1UODE5NSBFbWJlZGRlZCBEaXNwbGF5UG9ydA0KPiBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9t
aXVtLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBNZXJnbmF0IDxhbWVyZ25hdEBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jIHwg
MTUgKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gaW5k
ZXggNjRlZWU3NzQ1MmMwLi5jNThiNzc1ODc3YTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMNCj4gQEAgLTE1ODgsNyArMTU4OCw5IEBAIHN0YXRpYyBpbnQgbXRrX2RwX3BhcnNl
X2NhcGFiaWxpdGllcyhzdHJ1Y3QNCj4gbXRrX2RwICptdGtfZHApDQo+ICAJdTggdmFsOw0KPiAg
CXNzaXplX3QgcmV0Ow0KPiAgDQo+IC0JZHJtX2RwX3JlYWRfZHBjZF9jYXBzKCZtdGtfZHAtPmF1
eCwgbXRrX2RwLT5yeF9jYXApOw0KPiArCXJldCA9IGRybV9kcF9yZWFkX2RwY2RfY2FwcygmbXRr
X2RwLT5hdXgsIG10a19kcC0+cnhfY2FwKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJu
IHJldDsNCj4gIA0KPiAgCWlmIChkcm1fZHBfdHBzNF9zdXBwb3J0ZWQobXRrX2RwLT5yeF9jYXAp
KQ0KPiAgCQltdGtfZHAtPnRyYWluX2luZm8uY2hhbm5lbF9lcV9wYXR0ZXJuID0NCj4gRFBfVFJB
SU5JTkdfUEFUVEVSTl80Ow0KPiBAQCAtMTYxNSwxMCArMTYxNywxMyBAQCBzdGF0aWMgaW50IG10
a19kcF9wYXJzZV9jYXBhYmlsaXRpZXMoc3RydWN0DQo+IG10a19kcCAqbXRrX2RwKQ0KPiAgCQkJ
cmV0dXJuIHJldCA9PSAwID8gLUVJTyA6IHJldDsNCj4gIAkJfQ0KPiAgDQo+IC0JCWlmICh2YWwp
DQo+IC0JCQlkcm1fZHBfZHBjZF93cml0ZWIoJm10a19kcC0+YXV4LA0KPiAtCQkJCQkgICBEUF9E
RVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SDQo+IF9FU0kwLA0KPiAtCQkJCQkgICB2YWwpOw0KPiAr
CQlpZiAodmFsKSB7DQo+ICsJCQlyZXQgPSBkcm1fZHBfZHBjZF93cml0ZWIoJm10a19kcC0+YXV4
LA0KPiArCQkJCQkJIERQX0RFVklDRV9TRVJWSUNFX0lSUV8NCj4gVkVDVE9SX0VTSTAsDQo+ICsJ
CQkJCQkgdmFsKTsNCj4gKwkJCWlmIChyZXQgPCAwKQ0KPiArCQkJCXJldHVybiByZXQ7DQo+ICsJ
CX0NCj4gIAl9DQo+ICANCj4gIAlyZXR1cm4gMDsNCg==

