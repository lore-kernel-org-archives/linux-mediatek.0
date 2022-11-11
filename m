Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D051BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHCQr4z4L/rpSaMIqDfjf7s3KM2HwDue5i4mbc/zGxY=; b=FJdNeR/XzcFhC8G5dhwK6XT02q
	5I8ZaOlJ1pZNhnlSJVnKhVzjkCXqQWeGtZgkKn4RzH3yfXCbpDDqQ1SzsxmCUqRHLqEDLWoWIzUx5
	mTeBQItY+QuHvfofme8IP1sz6qqi2wM/bnGmJMQG1oslZALnxhy2mIgn969ELJrEtLf/gu991j1+s
	j44Q6XZr5CC9sAtfFLsktsnb+PfJfnNUpBvwyRpUzfo5STbOJSKs2kLBQzXDnehkdQXiGPLakpSU1
	apeyZqlQjssFH/07QGhl51X6BehbctStzSc7FOGvwqTTCovyI7Bl1Plcxn5tssjFNGbJJJPPoJBsl
	eNvuyt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otJUM-00C45L-26; Fri, 11 Nov 2022 02:09:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otJU9-00C413-L9; Fri, 11 Nov 2022 02:09:39 +0000
X-UUID: 489f54dce76041f79e5dfcd31691330a-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lHCQr4z4L/rpSaMIqDfjf7s3KM2HwDue5i4mbc/zGxY=;
	b=mX/+LraLy5S9fl51gmpvTWPo0Leho+tiXFsypPeGMR2OOe9TWeM9siOcNsKSiO8jHvJZsO9mj9Edgt8q+aZ/FlAws5W9mA7YpqLU492nKI4J5nz1noc/1/3YoAhbr07Ev6UHoaAUx2xKwiEK1s9Ela3ETQyCVIB6Rc1DrLHpnUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:abd5b127-9773-4b00-80b5-705ea0e779be,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:c0a1f485-088c-4756-8f76-577be701e693,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 489f54dce76041f79e5dfcd31691330a-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1677428517; Thu, 10 Nov 2022 19:09:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 11 Nov 2022 09:39:16 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 11 Nov 2022 09:39:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNtVTzsybnQ8m2aF8G/76BVJ4aa6bmS1FpwkGATksnlS2IWjBl4q/C74mN74WCzv3PaGKfvo1IQDAfYc8vSShMa4UUwFVgAu58SnP7VgiJDPH7THHL6v4OHyFhpR/sqScQDygdFbk08VNnmQHaXFib3w/cnWZrbFflhkLg7DqZALeZZeLwYil1YOajaLSflHW30tYG33TGx8wKpoUShYW4uhB9g0poz0qalxVZ17DWEEl8j2FK9Jssq+48Ww+vysvQfIJnGglq4xekEc4pec/0llIwL6c+OoJ7eN+hJTybvNEKI2eAOuqg5qe9xigNKf1qTL8U4PVDWZP8+97U3P/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHCQr4z4L/rpSaMIqDfjf7s3KM2HwDue5i4mbc/zGxY=;
 b=F8nUQdL6KXXgQ7AqSm105KnVNpF0baP8wPYZN43pDVC/Spxoq3Osx/okzEbS+E1SEgQtL7zlWBYM3cesgqlenwczk6CTFzQ8e1Kb/WUK9/xuhuivgn9ql3O3AM7t6cUKSz0FZp2XkyUfRimR03GXVBajm67PkQ6qUKBQqgI4X9EBvdZkYNdRaHX35wIqam/+MQeXw7xlYkBs1WVJz+l+WQ+e5yfXtHugOd0fsKUydEvWi7mTi4DccihUswuTfBF1d4ShBiLs1Nfhq7B3byuBus/HkHwLiSzdoGWe5beD1FNiWCBFiHETBE024RBVyQi1rYWSX3pA5Kgb7xVMODOL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHCQr4z4L/rpSaMIqDfjf7s3KM2HwDue5i4mbc/zGxY=;
 b=NgkhamjOOYIbGRs9WqXmPL0ChOpQJfF/w7qzZFEpv6bzHk8zl7cvIcc5+8eWgjnBx5P/mV7MIGWf0Eds1O4xcSM+zIOekwJIj3iMM0lSoNKkto/RqhrA1Y53boH2i7fl2WoYzinpN8mUH07jXeoEQGOfovrkYsH0sWLlvwZYDQs=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by PSAPR03MB5543.apcprd03.prod.outlook.com (2603:1096:301:66::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Fri, 11 Nov
 2022 01:39:15 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::a0e1:17bd:db1c:f57b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::a0e1:17bd:db1c:f57b%6]) with mapi id 15.20.5791.025; Fri, 11 Nov 2022
 01:39:14 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stevecho@chromium.org" <stevecho@chromium.org>, "wenst@chromium.org"
	<wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?=
	<tiffany.lin@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "benjamin.gaignard@collabora.com"
	<benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: mediatek: vcodec: Change
 the max reg value to 2
Thread-Topic: [PATCH 2/3] media: dt-bindings: media: mediatek: vcodec: Change
 the max reg value to 2
Thread-Index: AQHY9A3s5UobTKtD5ESIsMOIykLWOa42ji6AgAJmhIA=
Date: Fri, 11 Nov 2022 01:39:14 +0000
Message-ID: <d30226978dc26c683ac55c5b77e7f17e3ad8c5ce.camel@mediatek.com>
References: <20221109073529.26765-1-yunfei.dong@mediatek.com>
	 <20221109073529.26765-2-yunfei.dong@mediatek.com>
	 <166799859988.1535647.9867651548903188009.robh@kernel.org>
In-Reply-To: <166799859988.1535647.9867651548903188009.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|PSAPR03MB5543:EE_
x-ms-office365-filtering-correlation-id: 52bd9cba-6291-4bc4-e808-08dac3858a71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xHwy42InB4yihPWQ5E1IceAM3VOzdwIsuCaCBUbw4oPkqmwyw+sMoyNx4zYFrs1hGZtdEMd93jZzsDInIOzjklJl5zQB9bSSOVew6Ua405e1ehgUSQNxw85mxRA3EAmripxZtE9IwLJQ2ReuoIteFrH1CI+03STjBc+cUdfn9JgP1tvA1TIgEEx8Cy1oVceWKN6p117QPGJcVybh4YeQN6+zDdK4MByf89ZJ89L4nnGG2Y+4CZ/wTrciODycGjmSA2B9eFFKLHGGa+2BTwumK/JKlxMo6Yhho6H144aSGjomse/Gui6sdZxuIyJEGkWD/hJPhY49tCXsOHlC1McAWgGw56BFrXb5dAyMBYRRelKVN4UDnt/a6CJTNE+WXo3PRCvXypwHWi/EhhAT+tZ4J/kcYoNZgPbBc4xR90DBnLLVyjSiRys9op3qOAns5YmFCijRW+UnkQEdPTO5AjbbCEoZBLvevuPhs0WE0kLsi6iqda8peZz3+2SBeFUyfZNrRBCGt3SA50Y0qL4NGJSijHqLQes21yq+TaV6q/+DPF9IhjhtqCK6Kj7ScULctQ7wrdbyjEcDIt6cHpUJ+nUveLnlFrfeCEnMF5WbxBDbBrE9AflUVqk8t3JS5/5AaDHgU+PMWky1nCB6BFx1wGd7knw1jfN1yji/AcKNZT1mgCld2KYXMOJjOgj08DR5N1FFV6udjbc2pMVJ5ckBFbwhR2DuY6IfDNv2OR3Az+UBu0fzp/o3UYDQnCVD+f4IOEDsa7LXK0QteommcfHaXkSsYL4FiMghRsbvykjR8d3cvNMV6vAdLjtpGnVfCYcw9ZL1vFo5S7GxjFKxlyDwHOwBGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(8676002)(4326008)(66946007)(66446008)(64756008)(7416002)(66476007)(91956017)(316002)(6512007)(2616005)(76116006)(66556008)(71200400001)(8936002)(966005)(5660300002)(83380400001)(6486002)(2906002)(478600001)(41300700001)(38070700005)(26005)(54906003)(38100700002)(122000001)(86362001)(6916009)(186003)(85182001)(36756003)(6506007)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0ZvYXdraGJHeWFuWEhHNTZiN3ZuamdiUzVKWWZackZZSlpPNGZFYUpETnN6?=
 =?utf-8?B?SXBHemJmY2FHSkdUMGUwUE91MDdaYm45eUFNZkM5QUl0bDV1ZVZVemVkeDYz?=
 =?utf-8?B?SXRTUlRQcWZJV2QydHhBK0VGMWxOR1J4UDVTbkRHcEJiMkRZUUFHM1NwQUZO?=
 =?utf-8?B?dFU0YVRudmZYcWtHWFpZYkczTVdoVGJpVmVEemNkU1doL2JBcGc5WEZRbHM5?=
 =?utf-8?B?TU0yOVRjVVFNbFhkNHA0QVJwOUt3YSs0VGdNYUt2c3E5N3VxZCt4cUk4MGNn?=
 =?utf-8?B?YTRZU1lLTjV0Umh1ekUvYnBRRHhIUkh4SGJtZ3ZsVVFoTjYvTHVHcTBZQXBG?=
 =?utf-8?B?N3gwbnlnbGJQcGZuTWZYTjVrN29LVEQwL0tuWlhGZkE1enlNdm5hQWFaYkJn?=
 =?utf-8?B?MnBsVm5SekJIbHcyUzBSb1pvMHdCWE12ZnJzWjZ5eE1zWjFOWlExTTA3ZE9H?=
 =?utf-8?B?WE5WakZpMTJyaWNRdWZ4c0VCdHZZdDVZM0ZnM05WUENqcDVXMVhCbldQQnBH?=
 =?utf-8?B?NENUQ1N5VkZ4ZDU4Y2wvekJrK2F5MFRoSVJNSXRLMzR0TFB4WmhZR1VpS0Vq?=
 =?utf-8?B?akZLdTEzeE9xR0pxZUhaNkNvWjZjb0poL1liUTB3WHFpdWpjWjh3YTlJR0xO?=
 =?utf-8?B?NWFOUnlzc2lMeGNMcUc4VGIvZXZZOUk4U21KRDI0YjcyNnpMVUFha0xKRE9P?=
 =?utf-8?B?OUxXRmtyZUxVc085dGhBOFFhVnZBeUpkTzd4SzFsNndWOU05Ty9xSnpHSUtj?=
 =?utf-8?B?d3E0SzJHUktiTGJnNHU4ajF0eDhiQXcrQVRHc3Z5NUU0RlcxdGFpRzROdGtX?=
 =?utf-8?B?OUhrZEt4MzN4TDk2ZTNxVkNvdVJmMXJMUUx5NXg3YXQzV0dwMDlaTWxjRkll?=
 =?utf-8?B?ZUl2NFhkZmFPdytMQXhpOXRKZ1dYTy9sMnlWQTNLUXoxZVc3OWxMa0MxV3Qr?=
 =?utf-8?B?TlBWLzJNdFNYeDdNVFdPcUNpcWVoYWdNY2o1RHQ2clhzUmplWGp3U3BNYnha?=
 =?utf-8?B?Ynk5bkJUTEpzSnNVMUJzRlJyeml1UVlHMzhqOWR2V0puNTVBQ1dxZWViQ3dq?=
 =?utf-8?B?MkVLYTB5WHFkTU1Kcmpici9YOU9JUDc4TE9JVENXMzdsMlRMT0xzNHpacTE0?=
 =?utf-8?B?YXdnVXhkME05SjIyeHI2QVJZZEh4UnAxNU1iNzV4RFF3ZFFOWHY2ZTlhMmpi?=
 =?utf-8?B?dXVBc0R5RVpZVWZXc0hDL3lSKy9ZcCtyempVekdrOUdxSFpwbGlqUXBweFNI?=
 =?utf-8?B?OUtqRFlNM0JsNmV1bDRlamxrZ0wzL0JoQWd2aUFycG5EdU16UEhTMG5rMHJN?=
 =?utf-8?B?VHZLL0NuV2hyWmFldndWUDlsRDAzZGhFeG9IQkdTTXNTSzFGVDN2aWZ3U3F1?=
 =?utf-8?B?TGNvYjU0eUQ3cVlGb2dhOVZPMXhHaGFRNDY0dTg2SDlJR0xIUGxiTS92VENZ?=
 =?utf-8?B?Ykd2OXpSTzF1c0kxRVQ3QTBtQjM4OTk5ZWpaL1BwbmVOQy93Rjg5YzhWTEYz?=
 =?utf-8?B?N2xrREtsbVQrQ2ZwbFBhcEtIVFRaQ1VESUdsbFFYZU9URXlEYVdVV3lZWTBT?=
 =?utf-8?B?MDZVV0JVNkZ1aFN3YUhpaVpDb05WQzlSUWpLcWplaXRaalZyNUdobXR2bjl1?=
 =?utf-8?B?cVJtRXdmTDgwMUpld0JFTUd3WGVoOExvQ20yYVB2L2JtWkhVN2J5d1ROcEpV?=
 =?utf-8?B?SzZ0L1hkZWQ0czkwUGlrOEJjcGl2L21uTHRsRHZFNWFTVXlMQ2JvMklRd1Zw?=
 =?utf-8?B?L0tXV24veWZoL2Vsall3eWlrYUJZY1JDanBRdlpTWE03Y0RMd3JYYTNSQ241?=
 =?utf-8?B?OGJSTWxEeVNZbzJQTnlOOEU4UzRObFZNMDFsd2lTalZrQ011VmFhcHBKYVN3?=
 =?utf-8?B?ejdOdVVzRXc5QkxYbmNIdnJjWFhiVS9CdUhVVGowTGRCQWQ3OVNPbHNWUWtl?=
 =?utf-8?B?RXYySTYvelVldUlJeEg2YXhscmxSNkVINXhneEZpamhSTHMvSWNUV2lmRXBR?=
 =?utf-8?B?UVlDRGNvOTdscUZVa2dzWldoTGRBS05acWp1akRBeUIyU3ZOMHU0Z2g0WnZy?=
 =?utf-8?B?S1dSMHBFcy9EaU9QektWQWk4ejJyR3VMZzZQbFNXUEwvVmpncTNqdklmazdI?=
 =?utf-8?B?c0tkdzhBSzNmUXJGUW8rSVNYTWt0QTA3RVpOUjVDaWlDc3hDS1FqTUhpcVRG?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FEFA587DBB5F147B946220BB4605773@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bd9cba-6291-4bc4-e808-08dac3858a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 01:39:14.6665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j86jawqnZQxyiTcuEIPkra+TflnS/kSJ5GPXEbQg84EYfPpEiifAm6hiZtegbJitxizY1ccjyxE75U5PkLempAficimvd5/r3iYQmJYKY+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5543
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_180937_739361_AB7FF534 
X-CRM114-Status: GOOD (  19.11  )
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

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsIGFscmVhZHkgZml4ZWQgaW4gcGF0
Y2ggdjIuDQoNCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQpPbiBXZWQsIDIwMjItMTEtMDkg
YXQgMDY6NTkgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBXZWQsIDA5IE5vdiAyMDIy
IDE1OjM1OjI4ICswODAwLCBZdW5mZWkgRG9uZyB3cm90ZToNCj4gPiBOZWVkIHRvIGFkZCByYWNp
bmcgY29udHJvbCByZWdpc3RlciBiYXNlIGluIGRldmljZSBub2RlIGZvciBtdDgxOTUNCj4gPiBz
dXBwb3J0DQo+ID4gaW5uZXIgcmFjaW5nIG1vZGUuIENoYW5naW5nIHRoZSBtYXggcmVnIHZhbHVl
IGZyb20gMSB0byAyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5m
ZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRlY29kZXIueWFtbCAgICAgICAgICB8DQo+ID4gMiArLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiAN
Cj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdT
PS1tDQo+IGR0X2JpbmRpbmdfY2hlY2snDQo+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxB
R1MgaXMgbmV3IGluIHY1LjEzKToNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4g
DQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMvcm9iaGVycmluZy9k
dC1yZXZpZXctDQo+IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+IHN1YmRldi1kZWNvZGVyLmV4YW1wbGUuZHRiOiB2aWRl
by1jb2RlY0AxNjAwMDAwMDogcmVnOiBbWzAsDQo+IDM2OTA5ODc1MiwgMCwgNDA5Nl1dIGlzIHRv
byBzaG9ydA0KPiAJRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctDQo+
IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRl
ayx2Y29kZWMtDQo+IHN1YmRldi1kZWNvZGVyLnlhbWwNCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJy
b3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+IA0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC8NCj4gDQo+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFu
eSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZvciBhDQo+IHBhdGNoDQo+IHNlcmllcyBpcyBnZW5l
cmFsbHkgdGhlIG1vc3QgcmVjZW50IHJjMS4NCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFr
ZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3Iocyks
IHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMg
dXANCj4gdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUN
Cj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0Lg0KPiANCj4gDQo=

