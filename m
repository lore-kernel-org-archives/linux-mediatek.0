Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1462ACD6E54
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=; b=TwKz6lQevpX1N98i4LpFejD6vW
	aIVFM07F7WWWuMUu9adjqwQZ+boarfSLbpdiwbUyB37qOLy+LvbasNXz+3HV+FOQT7OOa65Deh5KN
	LDCGI4hVGeO0Tm0ndBIIZtR4u8cnIoW4LJu0fPerjCbbk0BkmRLS3e5YqpuhCHKlJBIE8zKFeKqjx
	UQG+eMYeHd/EZGbxdJqCYsIEe400QSxpOqDqAf4C1lX32y2VgsWXEaNh/n2t+EIukNLhETz0s1HbF
	uHZC3Q2TXKvrXvj1gfbnCP/kBA/g7fhFrPCmYSMW/1nTxJFHM121Hm+WKng2sDlop98p56RS/Yj9e
	hb3L7p5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVfs-00FMS1-2c;
	Wed, 11 Oct 2023 09:38:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVfo-00FMRA-13;
	Wed, 11 Oct 2023 09:38:37 +0000
X-UUID: ef83a1ce681911ee86758d4a7c00f3a0-20231011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=;
	b=IpBpwn1PuviMLk/nFs6hHcZqe2thgXBPEsqqfLEqtLxXf8nB6J8gJ+YtHO/DYFuZ+iguVUxGwEyvB4KDfiU1nAQkBdGaMjg0IKV7aiNW4kTd8TmrOgd7oVWeXEYuU8g0AQb6b8FQwUK1dZlMvql64hcXG612JnB3ODpCSUWVJFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:00789b62-efb9-4b01-a7b6-7e0faebcb83a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:bbe8cdbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ef83a1ce681911ee86758d4a7c00f3a0-20231011
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1574365512; Wed, 11 Oct 2023 02:38:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Oct 2023 17:38:04 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Oct 2023 17:38:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQpj8d+cCxpCfw7IwUa6bBZWku0KAbTqwxcbLyy7OHOBTKiswgEvZEgwJho0eTTDL46MQ+KsCAWYU/Fo42tYVCOzIyMzf1rc08yFlerUJxhTE93/bXCbyttp4YZCZwtb1DhZ2k1FiLXU7nDjQe/xHxnDBsNxz9949E4WZds8S+9eCxLjjhI4BUGZVzcvoJOPey7iWSxtgYuTDe4WfThyFKZ37hVqPIsqY8FNAZAsYxYMOjCDmWVFS8FVao5boKGDKwmIUUfRHLivo7vkwEaka0reWsmU2PN1EsuFAS/RPDOoniWFA+r5qFgOkiFpXk5Zf1cnJtk8tSUQW6Rt0nDSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=;
 b=JiOPBh4ikL3na8SdaWFLtlY5/Y2Ft1QqS/d0b/tQWqruS/tig9MzltrSxEzTeaJJBLO1vrIbJzSAv4wWGAIat6yijS12+toRS4BMb03Tsb7P4uBlGiqfF3NAp6dXaZqv1YfPdYICIytlJA0otX413sZYEZnkYvp5qFtiPvKTU5caMT4uP5VzrEIpEgctmQ7aeY62FpEujd75DowbRfQw/gVahgwQT41P5bt6Qtz3bRGJcwQFTFYrfiUpHsJn+vyTAKisdlXWu00HJuolyGIpHG0kEW0p7K0ltVLXvT0toieviXnNE+vclMiAsGq0f5BTO9RoXPAcIfx9JdjiyxPDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=;
 b=v2rJtT70n8gGgli5JlyqTwroEOpLwuzzRgW86GaDdVWI/Bm5uD5RqFBxyYAOvjl3pwQPuDBTUN26YuOEVEbEUGiQDpJ7tP6CI7yM3DKFyL2UbIQstSXkFd4juKTo6+4SmLQGzN5L0pive9AZGdRxRm+b+sN+O9lY6j0TSLnd0Kc=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB5213.apcprd03.prod.outlook.com (2603:1096:405:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Wed, 11 Oct
 2023 09:38:02 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 09:38:02 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>
Subject: Re: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Thread-Topic: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for
 MT8195
Thread-Index: AQHZ6gwiJ9IMYcSA5UyotrP5ZCP/fbAgS3iAgAADhACAJCotAA==
Date: Wed, 11 Oct 2023 09:38:02 +0000
Message-ID: <4f16a8ab0b2f5af0bf0d31ad26c83d7ab695c304.camel@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
	 <20230918084207.23604-5-shawn.sung@mediatek.com>
	 <ffcf35cb8ca1ff0fe0a0f0176e3199b9c944b3b9.camel@mediatek.com>
	 <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
In-Reply-To: <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB5213:EE_
x-ms-office365-filtering-correlation-id: 40ef0116-3506-43f1-9561-08dbca3dc3c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b05e4hvOzSvlNTG0XKostAf0E52QfHAFwGFCAtFVwc9clLd7IIIsAvVKPjTlnmhu8nBdJyJX5l/pL1IijdzZO/GFfb0kmA4TMWCIC4r5Gwe4gmDFZWocdLy6LSqhNUSW3srrVTFkzZljYuJD1D2vy+GUQuVVODe9dw72b3hgSNBpR82+82UpEvBtF41TpDC3SLlWoM419htLRyU0RemNl4ghSCqK0EOxLqIlejq259ageRMx/ZbafsM80IeUpWe1A5qDowQBKjoYiBo62jh3mI06qYpyLH7NssezY1oW0BSUa4rxjynlrfX2yfudHVQNBh8C560gxSkLoi67BBJQyTpHNCgVaCXgE1Ob5tkoi01Eb4jUuH6eFkRadVZ27UxbDVCHUjUU9f/aKygjSwVycDPhFQB0psPA37unPxuBZS9ez4M3V7HyrsvGwF6Jv4Fa2Uu2zbIPdzypvn419+ryHTselT8UXhw0D7b8R0UwahfYJFpluWURL0yeIhF48p+NO+xXX5MjWuTt+QzHowN0PCCqjE/2jSW2qM0ATJhnPfdP8gyrRF4c2wGSC0GAPnme3VTWuRJU2xqik6XCh6VKqVWTTjuKxVih2AF+oSqg6qjxbDMr12av7Y92U15WGW8+otaUZFthEgcLo0QLN5l5+iNz+KeS2v9VphGr7r5UN/c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6486002)(26005)(6512007)(6506007)(71200400001)(478600001)(41300700001)(38100700002)(76116006)(66946007)(110136005)(2616005)(316002)(64756008)(66446008)(66476007)(66556008)(54906003)(5660300002)(8676002)(8936002)(38070700005)(122000001)(4326008)(7416002)(2906002)(36756003)(85182001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXlRNnJiQkJqYnY5VWhIZTMvMUswL3ZRUWtOdWNabEZOUUVLNjYyM0lNVXEx?=
 =?utf-8?B?VW5FZm5JWXFmVk9md0FESFQ1akVoVkVWUVI0RitaVWxHdnpza1BqSmI1aktO?=
 =?utf-8?B?Y0hGVzljV0NRcXRUSDdDcHhwOGxtY0d1eHh2c0UyVUNCb3BlT1NCVXhXSTR3?=
 =?utf-8?B?cVVWbFBYdVZTVGNEOU1uOGlxS2VsWmc3R0pYOHcyMkh5Zyt1TDc1SzNHdGV2?=
 =?utf-8?B?U3MyYmkyVHBLQnQ3YnpKZnVXeWZOcExmNjFqRklVQ0lLL2x6azJ3ckVhWHZ1?=
 =?utf-8?B?NjZ5aXp1bFptRm51ODhmdUk2TEF2bm1oaDJBWHVoZG8rUjhDckpDTXQ3ckdt?=
 =?utf-8?B?RGV4bHhTdnlNSGxmZjZLOXN4VlZqZWt4eU01MlNsRzI1aXdVaDRidDBld1hL?=
 =?utf-8?B?UGIyOEh4TGg1b3ZwSzExQlJ0Yk8rSEx3QTMwdDV3RlE0L3h6UElKVnVrYkp4?=
 =?utf-8?B?cHhMT2tkTER6RGpSSUVIQUV4clNqK3o3NUJ4cENlOTh3VGN5SVh3L2oySytr?=
 =?utf-8?B?d3VxdS8xWmZ5SUUwTlFIblZhQnB0ZHV0Y2JQWUQ3MEozWXYxVTNxYUErKzVO?=
 =?utf-8?B?TmRTQzVua1lieS9JbGp1R2d0Q2ppNHkrUExhZ0d0bnB6V2l4dCsyWU54dHBx?=
 =?utf-8?B?aDBib015RGp2T2dWZXhVbWNCT21pTCtZM0ttYkczTzd2d2lpN2JxY29oSmsy?=
 =?utf-8?B?d2hoUVBqQjBKanlhWjgwVDAxVGRMM3NDY29kYlBzd0VyNm9nV2t5VE5ZdzJ6?=
 =?utf-8?B?VVdGdWdHVUtVTmFBdU16WlY0NGFsenMrNE9Gck9hNGNxMUM1REE4eGxBamtl?=
 =?utf-8?B?MWdCWEZYbWUxWE56ZE0rUUtJdWxIbHR1amxjR20reWI3L0x1amphNlNxY012?=
 =?utf-8?B?Z3EwaWxnbmhteG5lOEF3ckxVRFJnNURIaS8wRWhJUjF3TSt2cFd0ME9pQkxX?=
 =?utf-8?B?WXpTUURDeVU2b3NKTVFuZjZOZE45VmRNMWsvVzZ2ekx1UndlQ2pqWHJyK0Fr?=
 =?utf-8?B?dDBPWnRaR1dDYnBOTC9RRWtJSzI5eGl0bHZZOElGZm1EWlBSblZsUVlhZi83?=
 =?utf-8?B?bElaOS9TK2tJQTUrYkUvR2xHVTlZTTJ0YWZyMEN2cmJpOFVIUmp0SUpUTnU0?=
 =?utf-8?B?RnZ6RzNnektXQmZPUm5PbHZMTHhEd0NNMS95TFczNDF3cW1va2EwVUFYekxo?=
 =?utf-8?B?cERMNlFKdjJoSXBEQXd6eXJYR0NiYnJHNk9YNnVvRVYxcEN2TkFrVkNIdDl3?=
 =?utf-8?B?WEdhWFRubFNBK1lJU0hKS3I3OEppZTYrVTJwMlBKeTJETk9wMXBMY25NZ3Iy?=
 =?utf-8?B?ZXpSMWl5d2ZTcmJyVDFJQnNmdjNNYlc0YWZiOXEvRWFocTJ4clBEYXFuMlNp?=
 =?utf-8?B?R05XcExtUHFzYU1xRkgydlNrU1lVUUlOV3R0akdidXIzLzMvWk81SWlneEVX?=
 =?utf-8?B?WWkzdzJENVNEYU9kaWdUbkJ6Y3JuWkpVTmkvcDNPUExoeWdqOGthL2piZ1Zi?=
 =?utf-8?B?NlVvRVEyQno5VWg0aHQ5d0FOL1BXUGhXbysxeGtjQkZXcTRyMFBuNTdQZ2cv?=
 =?utf-8?B?VVNHeDl4dlJVT1c3SUhmVm5DelloRFJOaWxMTGw2Z0NkV0dGUTMxUHk4TWpz?=
 =?utf-8?B?Uk50UDk0WTdIcDR5anlSd1ZTM2w2emcxUlJrOGF4WGVsTVIxM3dLQUxDbFht?=
 =?utf-8?B?R0o5dldSZWlvT3lPeVFIOXJNbVZlMUl6eVIxVW9QYmdNOWZ4d2FLTGpGNVJt?=
 =?utf-8?B?dUREN2hDeHlXdVJsN21NVGRQRU1WUnZHQTB6c2pNR1FWc0lBSlcxUmsrZjFl?=
 =?utf-8?B?eFNIcmJzMWlTVStEZ241aUFwcG5VMzdaL29TSWRTRndZbnhlYU8vQUN4elpu?=
 =?utf-8?B?TnhWbHhDZVk2QzRuN2o5SjdWd0NtWjdGRm5Ed1IyanBFZXczblZXeWhzeTlQ?=
 =?utf-8?B?eGh2Y1JTNGlTT0wrVzB6VW0wcGRmRWl5QW0yTDQxdGZxRDRWRndtOHY4ZmFy?=
 =?utf-8?B?N0MxMXRodnVuQ2EzelFjeGgvN2FDY0xqeWZyVWV1TTRDcjhGMmFDMk9haVhD?=
 =?utf-8?B?aWl1eXhnYzBKQlJSUUxIR2dBMi84T0loYnNGSG81bmY1QmpiQmNja0hYYjJn?=
 =?utf-8?B?SThWMlhTRXRaZjFrbTRzTWUvVVRqQTAzSzJ6djJwNnIyZWNqVDNyWi8yeENS?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B3EB74A5CEFE94EA739D87B0CD234F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef0116-3506-43f1-9561-08dbca3dc3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 09:38:02.9221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSRj/7LszuUiuM2LSk8N8/kUT8xspocYQaZCI67X24sdJhWeBiy8zQmYKUXUULgyl6SOdBYMLTflfdfiEf7UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5213
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.051700-8.000000
X-TMASE-MatchedRID: F7tLedRt7ifUL3YCMmnG4t7SWiiWSV/1YefZ7F9kLgsNcckEPxfz2OLB
	DcjMHcx7UmsNbSHn8eCHw1K447s2NVhdPEiZHlm8Y1bQMCMvmn64vBuE2X0HleOxOq7LQlGLGJ4
	tqoRyLskNDfGmw9mdvh3l7vlEbA5torXvpLj1Q0cVglQa/gMvfDoSfZud5+GgYmQk5BUIinBWFs
	MQfbcNE3suQxnfs9eeEA2YfbVfiNEYB2fOueQzj9IFVVzYGjNKcmfM3DjaQLHEQdG7H66TyOk/y
	0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.051700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7432D7D9D4FFF54C10EAD33081E2588EA8431D04A3850438AF65520505DC7E722000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_023836_390060_DCE36DF6 
X-CRM114-Status: GOOD (  21.76  )
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

SGksIEFuZ2VsbyBhbmQgQ0ssDQoNCk9uIE1vbiwgMjAyMy0wOS0xOCBhdCAxMToyMSArMDIwMCwg
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IElsIDE4LzA5LzIzIDExOjA5LCBD
SyBIdSAo6IOh5L+K5YWJKSBoYSBzY3JpdHRvOg0KPiA+IE9uIE1vbiwgMjAyMy0wOS0xOCBhdCAx
Njo0MiArMDgwMCwgSHNpYW8gQ2hpZW4gU3VuZyB3cm90ZToNCj4gPiA+IEFkZCBPVkwgY29tcGF0
aWJsZSBuYW1lIGZvciBNVDgxOTUuDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gYnV0IGl0J3Mgd2VpcmQgdG8gcHV0IHRoaXMgcGF0
Y2ggaW50byBJR1Qgc2VyaWVzLiBXaXRob3V0IHRoaXMNCj4gPiBwYXRjaCwNCj4gPiBtdDgxOTUg
ZHJtIGRyaXZlciBkb2VzIG5vdCB3b3JrIG5vdCBvbmx5IElHVC4NCj4gPiANCj4gDQo+IFRoZSBk
cml2ZXIgZG9lcyB3b3JrIGJlY2F1c2UgdGhlIGRldmljZXRyZWUgbm9kZSBkZWNsYXJlcyB0d28N
Cj4gY29tcGF0aWJsZXMsDQo+ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwiLCAibWVkaWF0ZWss
bXQ4MTgzLWRpc3Atb3ZsIiB3aGVyZSB0aGUNCj4gc2Vjb25kDQo+IGNvbXBhdGlibGUgaXMgbWF0
Y2hlZCBpbiBtdGtfZHJtX2RydiwgYW5kIHRoZSBmaXJzdCBpcyBtYXRjaGVkIGluDQo+IG10a19k
aXNwX292bA0KPiBhcyBib3RoIGFyZSBwbGF0Zm9ybV9kcml2ZXIuDQo+IA0KPiBUaGlzIGNvbW1p
dCBpcyBub3QgbmVjZXNzYXJ5LCBldmVuLi4uIDotKQ0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxv
DQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICsr
DQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gPiBpbmRleCA5
MzU1MmQ3NmI2ZTcuLjc3NTlhMDZlNWMwZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiA+ID4gQEAgLTcxNSw2ICs3MTUsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+ID4gbXRrX2RkcF9jb21wX2R0X2lkc1tdID0g
ew0KPiA+ID4gICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfT1ZMIH0sDQo+ID4gPiAgIAl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLW92bCIsDQo+ID4gPiAgIAkgIC5k
YXRhID0gKHZvaWQgKilNVEtfRElTUF9PVkwgfSwNCj4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwiLA0KPiA+ID4gKwkgIC5kYXRhID0gKHZvaWQgKilNVEtf
RElTUF9PVkwgfSwNCj4gPiA+ICAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRp
c3Atb3ZsLTJsIiwNCj4gPiA+ICAgCSAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTF8yTCB9
LA0KPiA+ID4gICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGlzcC1vdmwtMmwi
LA0KPiANCj4gDQoNClBsZWFzZSByZWZlciB0byBjNmFhNWYxZmI1MDUuIFRoaXMgaXMgdGhlIG1h
aW4gcmVhc29uIHdoeSB3ZSBoYXZlIHRvDQp1c2UgTVQ4MTk1IGluc3RlYWQgb2YgTVQ4MTgzL01U
ODE5Mi4gTW9zdCBvZiB0aGUgZm9ybWF0cyByZXF1aXJlZCBieQ0KSUdUIGlzIG5vdCBzdXBwb3J0
ZWQuDQoNCldpdGhvdXQgdGhpcyBjb21taXQsIERSTSB3b24ndCB3b3JrIGFmdGVyIGNoYW5naW5n
IHRoZSBjb21wYXRpYmxlIG5hbWUgDQpvZiBvdmwwIHRvICJtZWRpYXRlayxtdDgxOTUtZGlzcC1v
dmwiIGluIHRoZSBkdHMuDQoNClRoYW5rcywNClNoYXduDQo=

