Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A41C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=; b=pJlXh+Fsy9/BL1eHV0Kmo13roB
	B3Xm/46qZwsz8bcgNLazB/T3ZFNUR3PHdpiod9zbgTw/JmR5xUy2MNIUqY0vjoKjT49ncwoVFX3z2
	lDFc89yu5580iJn+jBDwGHngeXEE11M1wzROIimyqM2K+eq/qF+0UGzX7AUzFvIOcf4K5t7K19YcD
	Esw0h5aZtK+e3t/O4bJfmKzjzQ5hN+/rLa2xYayCCmARGqR0s5aSRGAXnh6CHBMcG8ShH3oljTFP2
	ExQCpRifmgOh9ZBfVMAi7i8TsIPU/TknNWbALt4qzpIpP1izTA8Zd02FJaQ+As1HTon6r0kyafRTy
	QCQUdkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psHrZ-008Klb-2p;
	Fri, 28 Apr 2023 06:45:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psHrW-008KkI-0m;
	Fri, 28 Apr 2023 06:45:47 +0000
X-UUID: 493032dae59011ed83ed1395ce914268-20230427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=;
	b=RinGEcrtJl1apC8sepJ0tH2vy/p9M9Jv8gumJzyFvXzXkhDsfeJEs8sCQ+Xirvp53Wt3CpxC5gXRMVGFpyQbdSUrNwQiF240yzjtpwCBoLpO2jVIIXrS/vVT45QFx1sp0X7AYBMeSm0txm7gYG2GmWHef1HrbYE58MY3Uxb9UJM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:70039164-9921-48c9-a7bb-57a7defeb183,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:6fe837bf-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 493032dae59011ed83ed1395ce914268-20230427
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1896644545; Thu, 27 Apr 2023 23:45:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 14:45:35 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 28 Apr 2023 14:45:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZGG7dI8pnCLo0DX+gD2oNd88wAdnaruYXd4Q+bRXph8hicCtijkeBtXhn3G8b1jZilU/siC+841x8bXvlrKtu+Ne1JrKGPS4sA+TgInSaAjhn5arZMJPldmuzhcs/ufMMjByA3qjIfFNl0FHanJUH/3aiXd6kpVtZl4Yu4e1NAdirRDfprbs6BaARgaogumFy/TdJAloxM0J38XbNoLVHjQpGMnsXcOSS5I44sBgrkb6V039GYJiQwlQXp6IFRNw0XNl6ShxXfnSJtN+lBIHB+v8yWSWd7Rp2ZKpl1ilOLCJx/O1FSRqbjQaRr6d0Yyv9n+XJWpE6GWiuLQBtPIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=;
 b=cuWto3HjJKGVhQoOkSzKX8kfedTWuVoQbYpKg2KfluHvT8PUlmSqpEOpsx+DejhfUsN1wjBQHwyjNuILtz4osqvCBbPZ6wC+CWUC7u1LcdsaKlxhkiPLfcraF7+0UQap11stS7DWGQMRxOSM0oRiUm8Qzi8KvqLqjqJ/VZtP6IOP0g8KNoUjfQB+Mc87bm/lDyz1ZPtPJdI6hJGKacZsoVaGhaD9W9Q94LR+/FPS6xIMjWCct1f5dyhh7249xnJRvMmHZy4S2iFQAJX09uDzkrICGa55V1YRDxbwy9BSkVPc7wszF6VlsJzhilJOHR/nNt5EvOwhKSvVCV07Y/kR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=;
 b=DRu345e8lnjX+n7oCAA5tk7u4v0MlNCsJfGHJ6KFdTAp/34Xo4FPXbxstuHq46eNwj0FdK+NzVhVa2UCW3IQ5hnmT4cb3U/MCJ5GscdV1xDGTuCbamz1vMeOQqduuhYrcF1C81RJTvotBsmkVSSrcXlwH08IOKiF8okGxahNDt0=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by SEZPR03MB7050.apcprd03.prod.outlook.com (2603:1096:101:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 06:45:32 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%6]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 06:45:32 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
Subject: Re: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Thread-Topic: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Thread-Index: AQHYxkdKrueZqbInPkqaVhhgSOlpM68+3A8AgAHNiQCAAQPmgA==
Date: Fri, 28 Apr 2023 06:45:32 +0000
Message-ID: <e73d191f334804324dcaef882dfcb30b4e3e3964.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
	 <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
In-Reply-To: <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|SEZPR03MB7050:EE_
x-ms-office365-filtering-correlation-id: 5f8a26c5-8ed1-4269-addd-08db47b429d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4c8p/JZT7txJ0RIweOGHaCO9hRaCiufbFHy4FkMPqH06wZzIzLqhT0TaQ6MAkomd3OXsfdUwLu+Vy8DW5dzHJH8bJTLSxced4Gzi+7XuPx6AJyU7ylWXVt8oEVuQScijRpBpQvvUqvNIxM8u7YjsERB/nWjpBMhAk4cS6MIDvmBsjNFlk6kLFVDsWM1qRMsVAh0xkTQGF125w1nx9JxNijIxPUstchhHE4PLyT52M3VKWyNbhzw8nyFxlXLBlyB3OiMotqywskPLuxOlPWtFLJsxizSx5GfGi3D7IbStF7ajVhO6yKD/05ocUOEIcA1oWZ7GMl774wIkkWPtV/v9JDjKcKxNLtlYPtrj2RIuo/ip8W16VPgJFLBexZWqCmqgmjdZ/46bqLwr2XXU4glpizqQJ5QR9kfw/oBbZ7OjH244Cb9xDQBz2OZQTPcOg9EJBPMbWrfeyTyD31XsoS2XeJkBgHxMA8Bsu+mRl9yK33fNR47PzxIUFGaCGuSpHjUOmIe2vfwDTd/sOexJVWoVi0olmBlsLVO78xHhIWwt1n9B6e5qcFPMlcldeqIIAYJowk5D0JpK+jR28zv4IzDKVSQoZyVT68byNoCi/SNeoYeHXxq21uG8qtk3VP2+HXzyrLoDdCfQBWYQ6ayGuiGXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB3062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(6512007)(26005)(6506007)(186003)(86362001)(110136005)(54906003)(478600001)(966005)(5660300002)(85182001)(71200400001)(8936002)(6486002)(36756003)(8676002)(7416002)(38070700005)(66946007)(38100700002)(316002)(4326008)(66476007)(91956017)(64756008)(66556008)(2906002)(66446008)(76116006)(122000001)(107886003)(41300700001)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEhxWUJqUzU4WUFjc2pnbFF4SGRNNzIwczRHMi95dlVYeEFUT1pkU2NMeFc2?=
 =?utf-8?B?MVQ0QkxWcVNYOVAydnpBVjMvaGxuMTdhVzhucXVJZy93bG5iY1FDZ3YraVU2?=
 =?utf-8?B?dGg0b3QwREEzM1ZMMUgxZUZzb3crN1ZVUjh2emZ1dVF5WEZLV1pQejRkeUJ2?=
 =?utf-8?B?L3hvbWJsR1BhcG1jRVQxUnpiRmN6TGlaRi95dENMdlZoNDBmYlVZZGlCL3RW?=
 =?utf-8?B?MkNlMWZnOTlKMGt1QXRiZkwrZTg2UEc4NWZJSFRyQzhtUTVXRjBidjVic1RB?=
 =?utf-8?B?RmpGRFpZQ2RRU1VKaCtZK25JUjlRY08wQ1JLeWRIUFB4Qm43cVJUWFJlV1RB?=
 =?utf-8?B?R2diSGU5cHJYdnVPeng3bzEwWmwvQkVKZEgxdWtRTzFGSjBBK3ltYk0zQjl5?=
 =?utf-8?B?TkVOdTkvRVp2MFpjRDRRYUl4dERQazZQUFdLQ2NuaXhnV01xOC9BcS9XT2Rq?=
 =?utf-8?B?cEl2N0R1TUI3Qmx1ZUJmTUl1ZVAyaHc2ZFI0SE1yTnNPT2h3bFE1SHoweE5K?=
 =?utf-8?B?UVdXRFB6S2lkN1YyT3ZDeWUrcUZaOGhRZFcySXJlY3V6R3pVcjIyTnpISUE0?=
 =?utf-8?B?OEdXS0hEYUlrem9NYVRBaUd4WWRYMVEvWWFNcjFuam5wdTlzaWo4QkRzdG5M?=
 =?utf-8?B?eXVJbkZVcXUvY2NmNTN1QmcyVW1ia2hzU3BlWVEweGYrd2d0bktUZ0laMXVJ?=
 =?utf-8?B?TGhlQXZ1dnNOZ0JpK2NTU3JOSVYyTWJNMmlTRFRNQmhJL05FY1VnaXhQbVNH?=
 =?utf-8?B?VkpaRE5YVCt0bkhENWx5ZGVzeDQrRlIwSk5zaC9ndW1ZL2VBdXhENHRlVFZH?=
 =?utf-8?B?bEczRTlnTkZtTjdNVmFlWUxzclBUdDViMDVvaUVmelRVMjBndStNZ1FQTVVS?=
 =?utf-8?B?WmpJa1E1UXNEb2Fab3RKMWVQM2RuQTBKNU1ZUGt3aFIrcW5DZVRLN0taeEFw?=
 =?utf-8?B?Y3pTY1prU0JqU3FXZ1BZS3JqWW8xT0V1UEk4Yk9CRU5XU3V1SEoxMU50MjJs?=
 =?utf-8?B?eFg1ZTdNUE04YTE2ZDYxMXYxL0lCUVRXQ0VxblViZ0NMR09lenVXdHZuZFdo?=
 =?utf-8?B?ZEVKNDV1SUY1TFhzL3lwcWZhTU1LNVRFQjZXWVFQUXpmTVU3Sk9pbEN3bCtT?=
 =?utf-8?B?WXFuSnExOUJITGJxK3RxMGNJU1F1SVh4ejhPcFI3c25yYjdiMjZyZjVGZmVz?=
 =?utf-8?B?WnB1Ukd2dUlXeENmVkl4dVJWeFhZbE4yclB2ZUk0V1RxcVJYdzhCVTk1Rk1n?=
 =?utf-8?B?ZGRWYVZDMVRVQWFFeG84VzZlcHZjbGtSNkRscFNuMis3MTFLeVRwZStsUjFO?=
 =?utf-8?B?S3ZKZ2pLR0VDLy9YeTJ1dnVPVW0zd21lUDBIVU9PNVc4a1lOZk5pYWFGdGFS?=
 =?utf-8?B?RnZJcU1VOWtFVmRVZldNMmgvNFFqTjMzOU1SK1g0VVd5OHNwMjVhdTgwbkR2?=
 =?utf-8?B?dVdHMWFHR09CM1hveHQrQVBDWTF3LzI2NlVXald4NHhjK2g5eGJiYTY3STJ0?=
 =?utf-8?B?b2J0d2RzYnRMWE9KM2IrMDhDaFV1UGRQTlVud0dPbXB4N0NCeDJyaDkyZllR?=
 =?utf-8?B?bU9BOEZuRk5aYVNNRVBJdmtRRXJOV0FpTk9mTXliR0ZLMmtpazVFd0lRc1h4?=
 =?utf-8?B?Zk9rZEpnZ0JUUEpoSkJOK2JnSVBqNkxxbmpkUHpPUjVzV0RWNXEwejJjKzB3?=
 =?utf-8?B?aHJUNHBOTnNIN1o5ajBjT08zdU9tWWRZWHJZVzl4VTFQYU02TktWMWVzWC96?=
 =?utf-8?B?WC83bEdGUXBaY251NXozNE5NanJVYjNiTjBKWk1HRmFRRjVXZTA0a3JzOUkw?=
 =?utf-8?B?Q1J3eFNGVjdLWmlqSlZaMjk1bzNtNmdJcGw3S0JieHh3c2FGSlo3MFZNOU51?=
 =?utf-8?B?dU9YMkpBekNZaEpRYVZTN0tNRFcrdGVnL2ZuQzVJMm84VEppM1kyMXhJbmN6?=
 =?utf-8?B?cHZ2K2ZjK09yNnNmVnBoRWI2eUpPV09FTmVEM3F6YTYvVEtkSjJrdCtvdHV1?=
 =?utf-8?B?TEdnUFpTdlhqVm5WM21pMzlYR0pmNWtac3BJZERSRFRUVG51aVkvd1BYbTNX?=
 =?utf-8?B?MDR1MzhmQXJFS3lzL3dlVE1qUWFZMWZQRVkzb05NcTd0aG5RODAvd1BxVnI2?=
 =?utf-8?B?SjFZSytqcWpkSjF2K3FxWWhtcHd5ZjNkOUhaNkFSMi9qckNibTZUYWNhM3o4?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9C4BE3DB8F8B546A71C5F35EC4964B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8a26c5-8ed1-4269-addd-08db47b429d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 06:45:32.3808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ly2C9si1dwSgSjvSoF3b0SkdyqrGR5nzDshUy5VLRQRFfFpG9OMv3ZwlUBn2gd5Sbq6Vas9VciT1ctDSHTzlMhVV6DnlbsTTiniWLvPS84s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_234546_351362_83569B21 
X-CRM114-Status: GOOD (  22.82  )
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

SGkgQW5nZWxvLA0KDQoNCk9uIFRodSwgMjAyMy0wNC0yNyBhdCAxNzoxNSArMDIwMCwgQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjYvMDQvMjMg
MTM6NDMsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86DQo+ID4gSWwgMTIv
MDkvMjIgMDM6MjksIEphc29uLUpILkxpbiBoYSBzY3JpdHRvOg0KPiA+ID4gU2luY2UgdGhlIGdh
bW1hX3NldF9jb21tb24oKSBmdW5jdGlvbiBmb3IgcHJldmlvdXMgU29DLA0KPiA+ID4gc3VjaCBh
cyAgbXQ4MTczIGFuZCBtdDgxODMsIGlzIGRlc2lnbmVkIGZvciA5Yml0LXRvLTEwYml0DQo+ID4g
PiBjb252ZXJzaW9uLg0KPiA+ID4gbXQ4MTk1IGlzIHVzaW5nIDEwYml0LXRvLTEyYml0IGNvbnZl
cnNpb24sIHdoaWNoIGlzDQo+ID4gPiBub3QgY29tcGF0aWJsZSB3aXRoIHRoZSBwcmV2aW91cyBm
dW5jdGlvbi4NCj4gPiA+IA0KPiA+ID4gVGh1cywgbmVlZCB0byB1cGRhdGUgdGhlIGZ1bmN0aW9u
IHRvIGZpdCB0aGUgbmVlZCBvZiBtdDgxOTUuDQo+ID4gDQo+ID4gSGVsbG8sDQo+ID4gY2FuIHlv
dSBwbGVhc2UgcmVzcGluIGFuZCBmaXggdGhpcyBzZXJpZXMgb24gdGhlIGxhdGVzdCBsaW51eC1u
ZXh0Pw0KPiA+IA0KPiA+IEJlc2lkZXMsIHBsZWFzZSB0ZXN0IGl0IGNhcmVmdWxseTogYXMgZmFy
IGFzIEkgY2FuIHNlZSwgR05PTUUgTmlnaHQNCj4gPiBMaWdodA0KPiA+IChvciBvdGhlcnMpIGFy
ZSBub3Qgd29ya2luZyBvbiBNVDgxOTUgKGNvbG9yIHRlbXBlcmF0dXJlL2Njb3JyKS4NCj4gPiBB
cyBmb3IgZ2FtbWEgaXRzZWxmLCB0aGF0J3Mgbm90IHdvcmtpbmcgZWl0aGVyOyB5b3UgY2FuIHRl
c3QgaXQNCj4gPiB3aXRoIGEgdG9vbA0KPiA+IHRoYXQgd2lsbCBjcmVhdGUgYSBjb2xvciBwcm9m
aWxlIGJ5IGFwcGx5aW5nIGEgbmV3IFZDR1QgdGFibGUsDQo+ID4gcGxlYXNlIGxvb2sNCj4gPiBh
dCBbMV0gaWYgeW91IG5lZWQgdG9vbHMuDQo+ID4gDQo+ID4gV2UgY2FuIGNvbmZpcm0gdGhhdCBj
b2xvciBjb3JyZWN0aW9uIHdvcmtzIG9uIGF0IGxlYXN0IE1UODE5Mg0KPiA+IChjb2xvcmQpLCBz
bw0KPiA+IGl0J3MgTVQ4MTk1IGF0IGZhdWx0Lg0KPiA+IA0KPiA+IFsxXTogDQo+ID4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS96YjMvZ25vbWUtZ2FtbWEt
dG9vbF9fOyEhQ1RSTktBOXdNZzBBUmJ3IWliNXZzX21xS1dseUM4VmJMTlpiYzRGYzAtZTZkTDVa
LU9NNXBMc1ZSblFPV0Fja1I2RVRWMW1SWVJrei01cktCN2ZkWXZZNExyWW9IS0RsdjZqUFNLem9D
LTI0NUpUWWFRJA0KPiA+IA0KPiANCj4gTmV2ZXJtaW5kLiBJJ3ZlIGFjdHVhbGx5IGZpeGVkIHRo
aXMgY29kZSBhbmQgcmVmYWN0b3JlZCBpdCBhIGJpdCBhcw0KPiB3ZWxsLg0KPiANCj4gSSdsbCBw
dXNoIG15IG93biB2ZXJzaW9uIHNvb24uIE5vIGFjdGlvbiByZXF1aXJlZC4NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IEFuZ2Vsbw0KPiANCg0KT0t+DQpUaGFua3MgZm9yIHlvdXIgZ3JlYXQgaGVscCEgOikN
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

