Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B95C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 01:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1WImE04Ezp8P8Ve+qejlth7pBocG+69S2LtWGw8DrM=; b=b4nOdJpxMAZeplYOMxf6KOqIBb
	MojEzLDMMkAIOBOJ6cksZSXoijkiz6DIyO0YLMFvu5810F0OA9zUdVvKCGw10J4LmD+dVNVJ6cKrA
	fb5kGiHJUtMisOYzbfr1DYJi9xtIU2Y9Bx60idjXlPS3SWHqUUASRCFUFVzQRvl2NSJasDeoDS+Qy
	Kweofk8W+qLsGEQr+2E0OMT7+qmJ8tB37L1NLg2gwWnvqmBdjH/KMzV34SfIsz9zFse/UT2jbLIeJ
	2EOwj2FRa09YylmGZBWhlAmzUJJ4xF4NHxE5pnjX2JotXkE3ZKDI+W8FLL7s8uMFC/wTS1Al+FBoT
	JdOT8oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8AdY-005FDi-SV; Thu, 22 Dec 2022 01:44:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8AdS-005FA1-Rc; Thu, 22 Dec 2022 01:44:41 +0000
X-UUID: 7adc77d2952d4795a9ed3e8b2c5bdd35-20221221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=w1WImE04Ezp8P8Ve+qejlth7pBocG+69S2LtWGw8DrM=;
	b=J7qA8Dm38xKZcTAAEAuXgYlL2FFpUd1C0mfAACBzClk4iF0qnFtz57EVlfP3Kt1gmI/vzRbeFzoxv3COy3QwHvRnUxYwCrbNE08b20ai3LilGNp1YMZWcEfrWeZ+5vtnkdHYUJ9QOhZzumTIEk7DhDNqnqCBv4K5UiJxb6kw/tE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d2921004-64c0-443b-a38c-34b4d82d7a92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:24b79bf3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7adc77d2952d4795a9ed3e8b2c5bdd35-20221221
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1443269728; Wed, 21 Dec 2022 18:44:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Dec 2022 09:43:53 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 22 Dec 2022 09:43:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR+yXLD+Leh5FfZ/n1Um1kMu9noeaojP1BWDZztzipRuw0+qeVK/zEwpibyzXxzYzSCVmekT7XvuHIf1sJuB3WxbeIVD2nC2NBlUGcDcjcdl+QKSfGr/isFZBCBiEmpgguKHrwVt1dypXRBVf4YjR2w/q8Y4yuQ/nv05hnA1q9BOptNd4Bcq9grQVkUURXiB4qEwCxjfoQln7364iq3rMlglqr1Z3n1ZYLhn7NTnRVw/pPQ+cTvatfCAEvKs2SwFYn6muTNFdEPE7QbsBHGS1eFVfB8osy9kRLR+UqEa/GY168wwUvzzEwNm44e58Jlt74JJhE+3dSR9SglZb7A/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1WImE04Ezp8P8Ve+qejlth7pBocG+69S2LtWGw8DrM=;
 b=mnPV/FQ4S7q00t0HQeRLVO3U1fqOcpByfihqvUrJXD3CChDxUz95R9qXBKWWlu+WoJI0QaMadDHV/Tr/iS8NJAzg0gvj4Tj98MFvXpOabdhZWkQzjthDeME3VkJOXzFoXXlaZo8VAjC9EejSt2ia2Aho6y3a7dCvDWQ7J3toovDqkjX5fuOYsdl3laWy7VKi+uyol1IXqat8olYOJvbE5VPMuEElCxRiDK1TJnniVvjBVy5ya8knnO6y7sgzeYXhYTm/liSJ8ndvhKcHIn5ssfOlMbdWgRAZtqmOjXfLza5rmdaFka7klC68RZO8xpwHFQQE95Ybt/kH6C//5fUfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1WImE04Ezp8P8Ve+qejlth7pBocG+69S2LtWGw8DrM=;
 b=cBIMxf2ZTeN1Uhe4gUw6H+MKGvpOYIFp2JnIqOKsRuD+3RmtGN+ujaQxVspg3c9WbCGcEsRpJXfLpZnp6wEB6IfvmbpPVwuEyTFWzxggugVfHApTWlFa4/BAewzaLcPP7pt70x3/w0GRqCID8xmKjCR7Vl3vOTKk4aysC7R8FM4=
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com (2603:1096:300:39::13)
 by SEYPR03MB6770.apcprd03.prod.outlook.com (2603:1096:101:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 01:43:51 +0000
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56]) by PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56%6]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 01:43:51 +0000
From: =?utf-8?B?QmlhbyBIdWFuZyAo6buE5b2qKQ==?= <Biao.Huang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RESEND PATCH v4] arm64: dts: mt8195: Add Ethernet controller
Thread-Topic: [RESEND PATCH v4] arm64: dts: mt8195: Add Ethernet controller
Thread-Index: AQHZFOOb0x1W2WHEIE+aRd0M35H4Q654H9yAgAEECYA=
Date: Thu, 22 Dec 2022 01:43:51 +0000
Message-ID: <e0d54746d023ace026ca1c0f9db3391ef83a8f88.camel@mediatek.com>
References: <20221221022523.8458-1-biao.huang@mediatek.com>
	 <20221221022523.8458-2-biao.huang@mediatek.com>
	 <f591f169-acd8-d408-970b-8afc66eda8cf@collabora.com>
In-Reply-To: <f591f169-acd8-d408-970b-8afc66eda8cf@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2PR03MB3877:EE_|SEYPR03MB6770:EE_
x-ms-office365-filtering-correlation-id: a876dbc8-f88e-4f71-d478-08dae3bdfa28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNMDL7+H3cLFAh6A98EFplrK394ShedqYCoH2e2PLk8q2lyQSaYl1tdx0kIUzZdHXLDSwf5cVowVkcJcCVTcwMgERfRuGXmug1gbbuNiujSsWWK9Fh240dou1W87PWsR2RuIHpivOQhTBHA/Aw/JWyPiKoktT3Mh08G7Sws1Paq3iAIjqEEKCw5JDPikTnli9Pb3i8UKKiurohGUVU6oxmUnbi2F24BlqCvIuqY9xbUq2KmsEvF1Zh714QvJgdS4S0edNVX/wQB1TTCFde6HQ7/QdypppNMWsjZv8QJqwPz1gTJUhrULZdE4mAK3g9td6Qj9Xoajn4sjNmwjjioXSyNlKCM3jOAyRFqAMIdhqMHR+c4D+zMhfD2notd8F3VgA5pe5DlDkS+sVffOCfwnSN8qNiV0xa7+rzOTZ9U71CIOK059tIJewfoP4m/CW2EabU06IBspNgTGoLvJ6d5bGuElR3MmkQeYMFWz2y/DYbMLY8QVh6Y+nDg9fvjIiXUBfXXkIunBJDWOGOLMv9TzZWdMN6fefDQc3zoIW5bsk766YLDMi13ajN5HQTdISzoS3WOW3qFS0yW1RMxJfKFmMPGldAKzQkoZcAloT8uwq4mPJa2JCJvdZmUyQBhl37YkCE9RJ6zdilkheNfynKIbQMSAtqazPZ2IteJ625UetLfngH+cAWByZchs5FHHrwe+dT2wIQEnPiUgJroyGNILxoPvL/eVXZwIduirl5+3awU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2PR03MB3877.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(85182001)(36756003)(38070700005)(5660300002)(6486002)(4001150100001)(66556008)(91956017)(66446008)(66946007)(76116006)(478600001)(64756008)(122000001)(8936002)(86362001)(83380400001)(66476007)(38100700002)(71200400001)(54906003)(2616005)(110136005)(8676002)(41300700001)(4326008)(6512007)(2906002)(6506007)(26005)(186003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9JZTFDZEw4RVVHOXFMUDRBZU85ZXpRTDVnbUFlWXRkd1hvcFZsNlBzUm05?=
 =?utf-8?B?V2hSTWZ4Z3pWRk5pOW5uVzhjcEVVbXVYWmExZVdYaXNRTUd1U0RZdHYzYm9O?=
 =?utf-8?B?cVBTOFhhamRPSjNRY2FNeStvRUIxcmh0aEs2Q2FVdFRTM2RiQWo3Q2dPb0RZ?=
 =?utf-8?B?VjU1SFkvY1FROUJOQ0FmMUZub1V3dDF0MmI2bkhJRlY5dXk1Tzl2RE0wSFJY?=
 =?utf-8?B?d3VoSER2NEorY2oxK3JFZzVQR3p6L3U0cFlaVkd5a3BEa21KUXMwbGczYldt?=
 =?utf-8?B?MnVRenhGWWpPdGd4WnpJUGRRdHhvOU1JV3JlZEFxa3VHOTJNSkhUbU1Uc0JU?=
 =?utf-8?B?T2taNHd0MGpJS2hFWkFpZFNKRG5iclVPNFVnYmtqbW5NUmMrT0MwZk8xSjRP?=
 =?utf-8?B?YkQxcGtlSjJsZ1ZTbTQ0N2hBS205NVkzMVN5VC9TYk0rS01WN0RTYlJ6RDdl?=
 =?utf-8?B?ZExSMEE5emZhY0pwYWlTbjBFYS9yN1BmRWxiZXJST2IwbHAxaU9RU0ZoSldB?=
 =?utf-8?B?cGFKLytDSnlpWnYwQWhRck5OYXZXeEdPeDJiUEV2c2xtNEwreThlb1hKZHVt?=
 =?utf-8?B?WU8ydkM2K3pMblNBbFl5NjA0d3dmMTNDSnJhbmJWR242SXFhbVRuQ210bDE1?=
 =?utf-8?B?eU90Q0g2VXlVTkdMZjc3WUIrR1hYMGs2WGJLWWZ4NW5hZWVCMVhFL0padGVu?=
 =?utf-8?B?N3k0TWlDZG1tWkUxajhtY1BZSVFudHFYYTRXaWdwdkJGOExaaVJwRXFtbDkx?=
 =?utf-8?B?RWhCb0VtMUp0dmVRcmtGbXZUaXJ3K2dMcjNhaFFOV3BJbllHYm5GWFFuckRG?=
 =?utf-8?B?VGVnejV4Mm9ya00rVGlSYXZLb3N6ZWZiL2dKMWNiVVdJY3lFb0ZMMDlkYkZj?=
 =?utf-8?B?T0lreUM5WmhVWWRxV1BQV1ZGL3h2OTJiczJmcHZxOWhNNndWdllXMTIwZVA2?=
 =?utf-8?B?NnNjNmR5UWlCUm1jUkdBUFFCdXZvMm1JRnAydkxlMmdjbTI3UXVPYXVKa2Ez?=
 =?utf-8?B?aDhIdUVwdG43d2RDeTlBSW5WT01pZTJkSnNNSnUxcWZjRjFvcTY2eFVmUjQr?=
 =?utf-8?B?Ym0xb0R0eGN0MllrT3BGdkp5eEpEZWdQZXZRd2VadlAvNTg4UC8zNlR5WmNn?=
 =?utf-8?B?RDVtWVJCdVYvQTFMTlNaYXM0RFhMZnRSeGVLa1NhRTJZL2lRVU9uek9iU0R1?=
 =?utf-8?B?b0djOFN2SFlGOVNyQ2FQdHY2Z1RVamJPQTJ1bDRVOHBUSDFqVlBrNk1YUXQr?=
 =?utf-8?B?SXNwTC9yTDR2bFp4QlhjbGFKSjhIV05KLzRJUmJTMGtVY0hDR1ZIajhZaW1z?=
 =?utf-8?B?MXhPR0xHNTNXRE5QdE0wZ09QamxNQ0xXQi9xZmlubWlreGdobGFxYzBKTUtO?=
 =?utf-8?B?L3FVOHNHWFhQTHFqbWdkaTJCbXdGdytxZndaR2pIdGk0bW9Qc1Y4Z3NDS0ta?=
 =?utf-8?B?R0g0MlVwSm0rQ0xwY3Mzb3NnMkl5UHF4TUZwNEVjbk1BaTdPdXk5UlFpRFVw?=
 =?utf-8?B?R0pybjVDWndXQmFLdS92Zy9WNXRxOW9Ldm41dnptUkhqQVdGMWdjTkJhUC9K?=
 =?utf-8?B?SFFUVW1NNmxkT3FhdnZrcHJUTVNyWWtCSUUzWk1LS3pBNXg5ZnJMTWtGeS9K?=
 =?utf-8?B?WjZOZ2VOc1ZoK2I0Q2d2SHlNY1V0OTNpVlFSZWFIOUw1TTVLUFg2bzBCelRM?=
 =?utf-8?B?OEdFQUU3MTcrU2NyTmNCV3lMZG1tL3ZEVjVRM3VPZjU4UVhaZ1pteGpPdlVD?=
 =?utf-8?B?dGt1Mzk3MURUbWo5KzBGUFNMeGtxRzBGTlFaZzBTL0Zoci90eGdKSWd3eVlN?=
 =?utf-8?B?THptQWhTUmkxMHppUkZjZXNoSjVieTRBTjZESkxWeWJISmwxNVZsVGJidUJO?=
 =?utf-8?B?RjBET2FtNjV5emRFYjdoZit2TWlXUTIxb2huVWZBZ0gzZFZoYjR5QU41VHRy?=
 =?utf-8?B?K2ZVSVFFbk1tMW9PMENSUFBqM0hUM1ZSOUxrSDEwWHRLa3B4dWlMMW5VMWgy?=
 =?utf-8?B?Vk5nVWJGdlFpYXRGcUdJQ1lSUWt5MEYxN2kvckhqMC9BUnUraDg2NTQ0bjQ2?=
 =?utf-8?B?TFVqaFM0WjhxbE51cnhCS0lTSkhmT3dURGVrTjNFTFpBTXdBaGo4VmhvdHlY?=
 =?utf-8?B?U2JCV2VyZXBGK2FtOXdoNlovS1hKZUhOdDQzSDAyNzVuSTZ1YkF6OS9VV2Ew?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21A20865F7A09645A2F2D9728CA13BC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR03MB3877.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a876dbc8-f88e-4f71-d478-08dae3bdfa28
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2022 01:43:51.1494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWOHjMM7Evtuuy3UUucOtmFYgKBViCHobR4Po4S+4W095+w5yzdFp0zYdCn5peA2o1+CCNTgxBZ8B8RrmlFmtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_174438_940405_552C1DDE 
X-CRM114-Status: GOOD (  13.74  )
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

RGVhciBBbmdlbG8sDQoJVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQpPbiBXZWQsIDIwMjIt
MTItMjEgYXQgMTE6MTMgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0K
PiBJbCAyMS8xMi8yMiAwMzoyNSwgQmlhbyBIdWFuZyBoYSBzY3JpdHRvOg0KPiA+IEFkZCBFdGhl
cm5ldCBjb250cm9sbGVyIG5vZGUgZm9yIG10ODE5NS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWFvIEh1YW5nIDxiaWFvLmh1YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzIHwgODgNCj4gPiArKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTUuZHRzaSAgICAgfCA4Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKykNCj4gPiANCj4gDQo+IC4uc25pcC4uDQo+IA0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpDQo+
ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpDQo+ID4gaW5kZXgg
NWQzMTUzNmY0YzQ4Li4wMjExMmJiZjJiZGYgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kNCj4gPiBAQCAtMTA0Niw2ICsxMDQ2LDkyIEBAIHNwaXMx
OiBzcGlAMTEwMWUwMDAgew0KPiA+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgIAkJ
fTsNCj4gPiAgIA0KPiA+ICsJCWV0aDogZXRoZXJuZXRAMTEwMjEwMDAgew0KPiA+ICsJCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1nbWFjIiwNCj4gPiAic25wcyxkd21hYy01LjEwYSI7
DQo+ID4gKwkJCXJlZyA9IDwwIDB4MTEwMjEwMDAgMCAweDQwMDA+Ow0KPiA+ICsJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgNzE2IElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiAwPjsNCj4gPiArCQkJ
aW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7DQo+ID4gKwkJCWNsb2NrLW5hbWVzID0gImF4aSIs
DQo+ID4gKwkJCQkgICAgICAiYXBiIiwNCj4gPiArCQkJCSAgICAgICJtYWNfY2ciLA0KPiANCj4g
bWFjX2NnIGdvZXMgYXMgbGFzdCBjbG9jaywgYXMgc3BlY2lmaWVkIGluIHRoZSBiaW5kaW5nLg0K
PiANCj4gT3JkZXI6IGF4aSwgYXBiLCBtYWNfbWFpbiwgcHRwX3JlZiwgcm1paV9pbnRlcm5hbCwg
bWFjX2NnLg0KPiANCj4gUGxlYXNlIGZpeC4NCk9LLCB3aWxsIGZpeCBpbiBuZXh0IHNlbmQuDQo+
IA0KPiBSZWdhcmRzLA0KPiBBbmdlbG8NCj4gDQo+ID4gKwkJCQkgICAgICAibWFjX21haW4iLA0K
PiA+ICsJCQkJICAgICAgInB0cF9yZWYiLA0KPiA+ICsJCQkJICAgICAgInJtaWlfaW50ZXJuYWwi
Ow0KPiA+ICsJCQljbG9ja3MgPSA8JnBlcmljZmdfYW8gQ0xLX1BFUklfQU9fRVRIRVJORVQ+LA0K
PiA+ICsJCQkJIDwmcGVyaWNmZ19hbw0KPiA+IENMS19QRVJJX0FPX0VUSEVSTkVUX0JVUz4sDQo+
ID4gKwkJCQkgPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fRVRIRVJORVRfTUFDPiwNCj4g
PiArCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfU05QU19FVEhfMjUwTT4sDQo+ID4gKwkJCQkgPCZ0
b3Bja2dlbg0KPiA+IENMS19UT1BfU05QU19FVEhfNjJQNE1fUFRQPiwNCj4gPiArCQkJCSA8JnRv
cGNrZ2VuIENMS19UT1BfU05QU19FVEhfNTBNX1JNSUk+Ow0KPiANCj4gDQo=

