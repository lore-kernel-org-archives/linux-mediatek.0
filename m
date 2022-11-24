Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA0C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 05:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoAdzcxtV+qdIZckisYgsEmf1gyGSH4jXhX1fFuPyOk=; b=QtkrHoNO2kmp13kiIf6Pft3Nxh
	Spg9xyAiM8l0uxQNzSZz2obvO8a5y/ubq+cOEWKJY7uhK5GeWyTPBR4qNzwwk72bXBAMEQN4u6zSy
	zyI+89rmgoN1c/16OwIcSYI96fqCoAdvpmR6CBxBtU5u7zAwC/clwvxlwRMWgddVHuJo7XedGqj89
	wU7HoflFGQzb5dGS3WHBHoBVzNqZjs+08td+lbHVOzymCFoUCEH51fVXAngULdxVufnBxCPb9Ooir
	15RnmL0jiaqXWYI4I4AtCyzm30/rrLNCmXNyTzYlvU4TLIeuPj2BRNL9Md/AgBoV7++Dtg5UnTS81
	/MQMPfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy4do-0058NP-Bf; Thu, 24 Nov 2022 05:19:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy4dl-0058Kk-T1; Thu, 24 Nov 2022 05:19:15 +0000
X-UUID: 0a1c9797ad634b27b34ebb82dae2b1b4-20221123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LoAdzcxtV+qdIZckisYgsEmf1gyGSH4jXhX1fFuPyOk=;
	b=AMuWQuAWZVxjwconcmmiN5ONawn3KtpyR49tlfGZ+mFdV/PPPRmW6mwK8m8Zlg+coALtYBQeYQf6juiZjsCrF3IMOOR5gU/fq8ZkVGnUpKwy195b+OWHKbMNIjQp2AaWdS7yd4Z4HsWfvKpiEvtWOFrYQjStiIgYDzUGwWPVrbQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e5802667-be46-4ed0-ad4c-a6f05ded1005,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:ac6819dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0a1c9797ad634b27b34ebb82dae2b1b4-20221123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sam.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1415454794; Wed, 23 Nov 2022 22:17:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 24 Nov 2022 12:47:06 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 24 Nov 2022 12:47:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRk+CxeJz1QGdoZwvHnP6APmIRkOfqj956Zi2U53oHvAuAqiAnOddjVDpfrXB5LexqIxtN16MJM/6JXjRIKzWksRyvTvTc3jjybPVXQhG5dP4cif6cjzvDdXIwUGOfumPGSwtmJindtJRdhrFPQRu7dbv3k7Du71GB8KtgoJshfq14MQwshIUjdtnlmBqwnxUCzjEaihGfmJv9Zv4mWLIJVNnZZ4TNOMPHA3boCqxBoPqXDmshV8P4LBxSmVIFRoowpwqg4ixUMQRH2Z+mf5zb7/XehKKdatrVX7M00InXfnVpzw/nJ43eW53jJA5eWXJo7Wmk+X7pYR6d7aklfgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoAdzcxtV+qdIZckisYgsEmf1gyGSH4jXhX1fFuPyOk=;
 b=Bii5z68K1Fhr0e/puAoKHqztc/cg5i10dmLQs9jS2JelyyuDBTXAfZ5LFJTuaSC9g+FwPza7HsTFbAN1Ui5qGMrTkrc7jUn9gG+gfJYa9AEWZEIs+mUpt/wIS+LK/fqQ1YUdnPsHt4N395HQyfwX9a3FVAQF4R6Q8MFwsAu7EXvVPGOFt7LKOX7kmJ+fmOM1LlBb6OEaeOYgkx+UHupIVKxXP9yqV4JXn3Jv7859/aVhPGgwCzkuR10NHM0dch1V0rUjROqRcN6svqXJzfNkQLJBSgpbKHpKHfzT5O7gqJmo9cO/vXynFzleWy9c4HyZh69Wh9i6UiFy8GBztqqisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoAdzcxtV+qdIZckisYgsEmf1gyGSH4jXhX1fFuPyOk=;
 b=lSMOAX6y8tgp0F0ViBRmX2Lu+aRJaA2dUDQdgznbH6CbTSzk2RQ7YuUYdLIQWYa4op5f7pNpIAgen8j51IzfpcrOHo1aBYhDk9P8Ij5FE1rTGVkcMWZGklQ8NDtIwFO0cIZMM/VlOghhvpe832M3K0ETA1HLlhMc1EnyPfszjWA=
Received: from SG2PR03MB3035.apcprd03.prod.outlook.com (2603:1096:4:11::15) by
 KL1PR03MB5588.apcprd03.prod.outlook.com (2603:1096:820:52::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17; Thu, 24 Nov 2022 04:47:04 +0000
Received: from SG2PR03MB3035.apcprd03.prod.outlook.com
 ([fe80::e692:7d40:92d:8189]) by SG2PR03MB3035.apcprd03.prod.outlook.com
 ([fe80::e692:7d40:92d:8189%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 04:47:04 +0000
From: =?utf-8?B?U2FtIFNoaWggKOWPsueiqeS4iSk=?= <Sam.Shih@mediatek.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
CC: "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] pwm: mediatek: Add support for MT7986
Thread-Topic: [PATCH 1/2] pwm: mediatek: Add support for MT7986
Thread-Index: AQHY6DqtqEtMSnv/kEKnb0uTLZiC/a4fLaqAgCP5GwCACohdgA==
Date: Thu, 24 Nov 2022 04:47:03 +0000
Message-ID: <ca3283fbe762db7c7f665eda15e807d7207bb578.camel@mediatek.com>
References: <Y1K5ym1EL8kwzQEt@makrotopia.org>
	 <b5ab84b4d595713588f1d8a68a1585ca3ae5521e.camel@mediatek.com>
	 <20221117115624.t2kbwscxvkvffo7x@pengutronix.de>
In-Reply-To: <20221117115624.t2kbwscxvkvffo7x@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3035:EE_|KL1PR03MB5588:EE_
x-ms-office365-filtering-correlation-id: d048ce6a-0de6-4360-6cb1-08dacdd6eed2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ywDAGPsW9FFHQ4fBNQ4IZulzt1b6kpB+nBwb7q4WfQtq6EZb7JzO0PNk/VHsrPOis0axPTvllDyWwKYNNo9jQbV7jMVYPowcyQWKZOFO60jtEucx7G07VPGtE5LLB49zYo5AwkF8UtmKYEq/ccZeU2mIJLwntLmk6gS7QbALs4o+T2Q6xi2Uhlnx6aVhR2RCjgcy4eOVh+L5BKhYXOGwyxUIoV8frXToyRY/GeFz/hQmAYb5YoelE9OydqOjcOtp2P3fO1aiIfghrLFBl4m8xiVojjwpQE9pexk430AgT/Uqmk1I+ewRuGpNLKo2JsgfivdbXIFsu6MHF9qsyIKsk2IjqJNwOf+hgdLS2EXJC5qk4xfmWL0JH/5iUjnXsCLTHOl+ONuuq+GM7IB+lI09K7Qz+lij6/WkrpkbPgdl9AnPyi03dz0ZOZExniEf4AogYomcKU0cGOx4BIa+QgzT7kJ9FPN30nmtqDSpXGFXO8rg106rJcA9BeSb1KrrbvB+Nj4MXTulRBqVa8wp805sK0cS/359HsBKKu2hwmSOe2cV+70P+pstCASh7qmbEGDr/buSoHUvT6mrZbxyfylPX8tbxZRULkezA9jU1Uwc/4z9zI6xVA6Ie8A2xmzxfIynOvm++zkRqtk4iAkDI5nIbrL/uzrP/mnygV4SoLDpLBk4udCiMHaAVjFxHEcHL9tyhKbq8lIJzhSBjnRki9v1Mlo+i3J+iqsMandODykd1xs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3035.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(83380400001)(4001150100001)(2906002)(2616005)(85182001)(36756003)(66946007)(66556008)(41300700001)(64756008)(66476007)(66446008)(186003)(86362001)(76116006)(38070700005)(6506007)(54906003)(6916009)(38100700002)(122000001)(66574015)(8936002)(5660300002)(26005)(8676002)(91956017)(4326008)(6512007)(316002)(6486002)(478600001)(71200400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cngvNnEyOVZyenVkQ045dnBJbnNSU3J4MVlNUzVpMDIvdEF4UFJUTkQ2S1Jr?=
 =?utf-8?B?aENjM2FEazRVdVJBN3ZIQ3o5VHRvTVFySlFLT1EwOGFPeWV1ay8ya0QvSlg4?=
 =?utf-8?B?dU5PWDdGWUt1QklWZlZhOTYrYTYyR0ptRE83R0JtQ0tKSEkyWmNMVGNaZ1Vj?=
 =?utf-8?B?UnE0MkxMUGhxNnZXdkN5eW5oWVBFNkw5dkRucXYxak9uVHdrTXU2YnZRclZl?=
 =?utf-8?B?V0NnSzl2SnNCbnYxeHRBbC80MjRxTlJjM1dhUjZNWXhxWFM3Rzk1SktGdFhu?=
 =?utf-8?B?OHpFYkNCY1gyOUxDL3Y1WWxTRWpkYUNPTFpEOG9nQ3lsZ2tSVXd6dkdiTExa?=
 =?utf-8?B?RFdVd0NnbHpOMFR5YkJ5V1dHSGVUZ3ZJbUJoU2YxNVQyT0dwK01JU3A3S2N0?=
 =?utf-8?B?WTh4d2Z6SldPQWVmTFpVSWJkdUNNdnJBV3pKN1gvUi9FSWRtODNvSnJGN1E2?=
 =?utf-8?B?NXhET05jWktZYUFBa2Jpc1lxczNUc2NjUEFCTDNJelRBcy9WaXkxLzYvWmZP?=
 =?utf-8?B?N1N1WXhDVjU4VzRnWThOdTdJdmNlR1FnazdYNmhMZCtMMzRJSFpBKzg1S1hn?=
 =?utf-8?B?bnNRMS9PRjg0Z0VRTnozU1RWOU11YmhPZFFxNVlGeTlRdVFwa3ZxYU5vdEdp?=
 =?utf-8?B?WUhNNVF6N1pZd1BwNTlXWXFKYTdXQ2xreTY2NlhuTzhSU2N5QWZYTS9yQjVp?=
 =?utf-8?B?OUdjRlRzdWM1VDhSbDFtS216SU1Pa1dRb2pJakJzaXRnSStud1NRblJEQ3pF?=
 =?utf-8?B?NS8wcVhuVVIwRmNhVGQ5L3VGdkI3WGNaUVdJa1I1M3FhWFNWVVVVSmdrT3FX?=
 =?utf-8?B?WlVTQ083dWx3U0RDeEQyREZuWWEwV3ZRRlZxSWkxczdyMkNDOWVjcng4ckdB?=
 =?utf-8?B?T2ZVN1JKVllxbHROeTl1WVdxZWtUQW1ySlhYV0lnMTg0MlhwWi9yVEZQdUVs?=
 =?utf-8?B?TGw2bEdITVo1bmVjOVRtRUNFbUlTUjUwMjZpQlhnd0VjNlY0RGNmc1VjdEx1?=
 =?utf-8?B?Ync3L1hScEM4ek42SzFtRVVBdHIzaVNRZU1YTFZtRWxVeVVKYTBhQUhtbDBy?=
 =?utf-8?B?QXhQbG4vMk5FNVJSWUd2RW1yK1RhcW85bEswWWhhNzcrZmZkV2pGQVVhOGNN?=
 =?utf-8?B?SFU5bTVFNjFnR3dpemlBVUs0R0IyR1Q1RERUYThUYTRnbDlRK2RTL2FIeEFN?=
 =?utf-8?B?UEtjcWczSTBFNGYxV2F4d1RHOFBRT0MwVDRBSVpaNUxGNlFSRHlLYjBWaXFI?=
 =?utf-8?B?M21BRkd6cjFwdk94Q1dUTGFIQlovWjE4aFRYU2JoamJqaTc5OExlQWdoL1Q0?=
 =?utf-8?B?RDRzNHNwU1ovcFNvbjUzNWowRm91MUp3NnZ5Z1lRYkhyR2JWUVRjK1B5NE9o?=
 =?utf-8?B?dzI4aUJVc1pPRm4vcUs3TFpEYWhMcWpUajErTWdnTlgyYWhCUjI1ZnNHVVQx?=
 =?utf-8?B?VHJlN2pyMmdvMTBBMmNZY1djLzVFbEpLYW5scDJUNmVFSFNTKzU5R0Q4bHh3?=
 =?utf-8?B?Tk1Ndm40azZqMCtmRVNLNWh4c0JTRmNwU0JpL0VUSFZTSFYrVnR5Y1JWRXNp?=
 =?utf-8?B?bi9CRFV4b2VKdHRhWnpBeWJsOWthaFdQSVV0LzgrZ2ZWWHIyUUtCUnVOOWky?=
 =?utf-8?B?RTlOSmZxVllRaW04UmMrNmxWUFUvNUg5Y3oyaHpFMmp0NzJnODZHV3VLb3VU?=
 =?utf-8?B?RFpudVJSV1lHWWFpc3BGUHFqNzg0ckpaZnFlR0VhV0l5QmtvMnVNODdmZ1F0?=
 =?utf-8?B?amtTZXpqS052YUFEZHU1bndsbHNuQzlVYnUxUEFkQ3d3NHdtajd6R3VialpY?=
 =?utf-8?B?cVVKL1hydHpjbHpjbXpJcGRONHpwYU1KUnhEeGdsdnNJRmYrUlpsRUc3NW41?=
 =?utf-8?B?bHBuZ0Y2RWpDMVQ4eG52Ui80dmllTk9lVmZmYkxjOE1ERUp1MitGazRTbzB6?=
 =?utf-8?B?bks5TmdOVVpTUHdqcENveDV3dEVkUk5Dd0kxcGFVb3ljdzh4NlBzUkErWUVu?=
 =?utf-8?B?OE02cU5KcEtXTlgwNUNNTzRNcCtjWWFlcHFsb3VTR3NZTzE2YzFhc1A0T0kz?=
 =?utf-8?B?cmduYjE0dENWVlExZzIwRVgxZE40bmh5V2M1aUpGL2diaGVwUldsc2c2QUlq?=
 =?utf-8?B?bTNsOFIyeXduWWhHRDlwRnVpZXREOUZ6akNIT2JrUVJYUUZhVU9sQVI0Z1hO?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97622F615AB9764399D9E21798514F78@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3035.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d048ce6a-0de6-4360-6cb1-08dacdd6eed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 04:47:03.9653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzolpRU7cUcG4U+Zl947qqRzXfwxur1HEnbMGjlJLfXPxL8tcw3QZDbOn8/xpAIJtbDbcB4R/3T/9wUCiAwRtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5588
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_211913_986385_7347F82D 
X-CRM114-Status: GOOD (  29.55  )
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

SGkgVXdlLA0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuDQoNClNpbmNlIHRoZSBDS18yNk1f
U0VMIHJlZ2lzdGVyIGRvZXMgZXhpc3Qgb24gTVQ3OTg2LCBhbmQgZm9yIHRoZSBvdGhlcg0KbWVk
aWF0ZWsgU29Dcywgd2Ugc2hvdWxkIHVwZGF0ZSB0aGUgdmFsdWUgb2YgdGhlIENLXzI2TV9TRUwg
cmVnaXN0ZXIgaWYNCml0IGV4aXN0cyBvbiB0aGUgU29DLCBldmVuIHRoZSBNVDc5ODYncyBQV00g
aGFyZHdhcmUganVzdCBieXBhc3NlcyB0aGlzDQpzZXR0aW5nLg0KDQpGcm9tIHRoaXMgcG9pbnQg
b2YgdmlldywgSSB0aGluayBpdCBpcyBmaW5lIHRvIG1hcmsgICcuaGFzX2NrXzI2bV9zZWwnDQph
dHRyaWJ1dGUgdG8gJ3RydWUnLg0KDQoNCkZvciB0aGlzIHBhdGNoOg0KDQpSZXZpZXdlZC1ieTog
U2FtIFNoaWggPHNhbS5zaGloQG1lZGlhdGVrLmNvbT4NCg0KDQoNClRoYW5rcywNCkJlc3QgUmVn
YXJkcywNClNhbSBTaGloDQoNCg0KT24gVGh1LCAyMDIyLTExLTE3IGF0IDEyOjU2ICswMTAwLCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gT24gVHVlLCBPY3QgMjUsIDIwMjIgYXQgMDI6MzU6
NDNQTSArMDgwMCwgU2FtIFNoaWggd3JvdGU6DQo+ID4gSGkgRGFuaWVsOg0KPiA+IA0KPiA+IE9u
IEZyaSwgMjAyMi0xMC0yMSBhdCAxNjoyNCArMDEwMCwgRGFuaWVsIEdvbGxlIHdyb3RlOg0KPiA+
ID4gQWRkIHN1cHBvcnQgZm9yIFBXTSBvbiBNVDc5ODYgd2hpY2ggaGFzIDIgUFdNIGNoYW5uZWxz
LCBvbmUgb2YNCj4gPiA+IHRoZW0NCj4gPiA+IGlzDQo+ID4gPiB0eXBpY2FsbHkgdXNlZCBmb3Ig
YSB0ZW1wZXJhdHVyZSBjb250cm9sbGVkIGZhbi4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+DQo+ID4gPiAtLS0NCj4gPiA+
ICBkcml2ZXJzL3B3bS9wd20tbWVkaWF0ZWsuYyB8IDcgKysrKysrKw0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bS1tZWRpYXRlay5jIGIvZHJpdmVycy9wd20vcHdtLQ0KPiA+ID4gbWVkaWF0ZWsu
Yw0KPiA+ID4gaW5kZXggNjkwMWE0NGRjNDI4ZGUuLjIyMTljYmEwMzNlMzQ4IDEwMDY0NA0KPiA+
ID4gLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
cHdtL3B3bS1tZWRpYXRlay5jDQo+ID4gPiBAQCAtMzI5LDYgKzMyOSwxMiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHB3bV9tZWRpYXRla19vZl9kYXRhDQo+ID4gPiBtdDgzNjVfcHdtX2RhdGEgPSB7
DQo+ID4gPiAgCS5oYXNfY2tfMjZtX3NlbCA9IHRydWUsDQo+ID4gPiAgfTsNCj4gPiA+ICANCj4g
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHB3bV9tZWRpYXRla19vZl9kYXRhIG10Nzk4Nl9wd21f
ZGF0YSA9IHsNCj4gPiA+ICsJLm51bV9wd21zID0gMiwNCj4gPiA+ICsJLnB3bTQ1X2ZpeHVwID0g
ZmFsc2UsDQo+ID4gPiArCS5oYXNfY2tfMjZtX3NlbCA9IHRydWUsDQo+ID4gDQo+ID4gRm9yIE1U
Nzk4NiBTb0MsIEkgdGhpbmsgdGhlIHZhbHVlIG9mICJoYXNfY2tfMjZtX3NlbCIgc2hvdWxkIGJl
DQo+ID4gJ2ZhbHNlJyANCj4gDQo+IFRoZSBzdGF0dXMgb2YgdGhlIGRpc2N1c3Npb24gaXNuJ3Qg
Y2xlYXIgdG8gbWUuIFlvdSBkaWRuJ3QgdmlzaWJseQ0KPiBhZ3JlZQ0KPiB3aGljaCB2YWx1ZSBp
cyByaWdodCBub3cuIFdpbGwgdGhlcmUgYmUgYSB2MiBvZiB0aGlzIHBhdGNoPyBPciBpcyBpdA0K
PiBleHBlY3RlZCB0byBiZSBwaWNrZWQgdXAgYXMgaXMuDQo+IA0KPiBGcm9tIG15IHNpZGUgKGku
ZS4gbm90IGhhdmluZyBjaGVja2VkIHRoZSBodyBkZXRhaWxzIGp1c3QganVkZ2luZw0KPiB3aXRo
DQo+IHRoZSBQV00gaGF0IG9uKSB0aGUgcGF0Y2ggaXMgZmluZS4NCj4gDQo+IEJlc3QgcmVnYXJk
cw0KPiBVd2UNCj4gDQo=

