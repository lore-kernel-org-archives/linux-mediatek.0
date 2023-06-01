Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1771C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06Qd0K9YnYrwnXFD+ed7Y/owvkGdavroC+1Nk5oAa1Y=; b=qHKftYMcf0oACwn2q1SIPrtpiX
	gHml7FdOShid82OE/S/rftO6jkhw7bm/7VFfrBlkKx1TBnerft2MNI2OSYvgsY14cphR1fp6pJhgj
	R7FJvZJsfyjNUurIILPxwJgrLitCmvZwwUmeomytte0wagwPowAhfXECI4AnBfDtYFhZT9oFTmFBk
	zYIQNjDuzL3udvxsTTC9UrUOOvDq6IYa597KE/GGgRYJz5+5tLScb+lJFsp606CPBhWBRB3obpHKD
	hHXKduI1SSZC2/qpeEgJ8N/8gp8WyHnBYDS8YyQx5vfB9EsEiKbKr+wle6xyw0BTOYqYEZVfJ//rY
	QHkaBG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Y5T-001iph-0v;
	Thu, 01 Jun 2023 02:30:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Y5Q-001ins-03;
	Thu, 01 Jun 2023 02:30:49 +0000
X-UUID: 47aacc5a002411ee912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=06Qd0K9YnYrwnXFD+ed7Y/owvkGdavroC+1Nk5oAa1Y=;
	b=SxxoP/WG2VIKehDkqsF78spPtg7n6qD9kA12diZNPLyGgC4oS9Qpud4HO6kreLMvadUzqzGAZA+2ffgBNvzD34VriZvl3tq4tXCthKL0Fivz9c+OAJ+rE7g5vL0yp0LQBmGxO9gDQBUR3v7KjE60mpgKZ8famYTESdO1Mss5VHw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:1e180f75-cd67-4a35-be47-097f0bd6d2bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:642c323d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 47aacc5a002411ee912e1518a6540028-20230531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 865837391; Wed, 31 May 2023 19:30:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 10:20:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 10:20:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmOZyqqxDJgjVC1iEKLAJayEfM/fGRpHY6exicdnKQpYOVtpzJa2bsMe2hJ+RvoFleJ9H8jLR+j5S+2B/JgM9a2jNqqWqtJT5wAmpzY3dicd0V73DSMZ29BWxqkjf/jVvXTGdVK0agEJzkL7fiwc2LQMKMmnnneXPWYfxgFzML+FhaTKN6T2+2WGszpwiqKUZ+3mqjYhXDikhlz3Cy105OYmAtIdhA2cdvsU7ExZM6XJ4+aMoQkba9lI4MeMjWhO7VkG+i+rIhCAE7r+vwzfbDyXYRFe2o1Uz7sP9DaXOPvVX1oaumJSOfnCmHKn20qI2dkimIYJiSlLcn3ukFffug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06Qd0K9YnYrwnXFD+ed7Y/owvkGdavroC+1Nk5oAa1Y=;
 b=iPFnugwi2TKp2CkBHIo71I1dapJlJwDOufKF2sIe3qLn+UbdVlDhhsZ1peE1BolcNSTo1V0r7yKodxzJp5Wnh0zjJn5YiuMvWxplpKI4uKjDPuw+Kuu64+2B4+LEuOvwUi53Myuo72FW6lwrMPAxV3VoX0W4nxV7OcYyryZ6IQUlN6ul9Wr1O7wZy/9d0FQsTBopKwGlnuNlNqjVeYPx/a0wiMCVyvbiMMgFjSxCPew6zupGMCYS/Kr1EEBMsoSpU66sUdMs4UDWFwUw9NeYAtrOg1h9tFh2fJdXLLnYsp6L9UhGxETSaBLDLz2m2keP8w8CdNF8YU5M6UyG9M46jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06Qd0K9YnYrwnXFD+ed7Y/owvkGdavroC+1Nk5oAa1Y=;
 b=Y13FnsvZHuCgzhjZHWOOcHK3tLqumd/7Jwm4fnQfqiUAuNIgbDTVM3pi9Wgih59gLN+2OFjNGJCAaQgQuZyPtXUEK5r5vmi+XK1w3971nPuXbeSc+8Vxu8cmRXw0Ya9/FzvjcbOW8mNMU9N0dUcH9CNVGeZAHErBACHA7ZkCucQ=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYZPR03MB7770.apcprd03.prod.outlook.com (2603:1096:400:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 02:20:26 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 02:20:26 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "dianders@chromium.org" <dianders@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver
 remove path
Thread-Topic: [PATCH 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver
 remove path
Thread-Index: AQHZksflwx8BAIG670qzUAoEq4H4ma91DxiAgAAql4A=
Date: Thu, 1 Jun 2023 02:20:26 +0000
Message-ID: <9f328fb3d6716af9d6372d1715b4860c937628fd.camel@mediatek.com>
References: <20230530072514.22001-1-trevor.wu@mediatek.com>
	 <20230530072514.22001-3-trevor.wu@mediatek.com>
	 <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
In-Reply-To: <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYZPR03MB7770:EE_
x-ms-office365-filtering-correlation-id: cd34ed6f-b316-4ad0-9c23-08db6246c317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qCGJTsUwl/efuYaZUmRZ5QhN/jkl6OllYQaOXomzIboLVUN5r+zRjeTqIANfImAhIX/lQffZvZhIOplb3Z/SA8TXNG865rj2XrfGQg97fNJqqukOtFr3239Mexq5BBDueQuYHMybJNnbZXUmxT6zFQ1fKi4Z5IIOlqpoN0zpUnUXBqTbvzKwpUIp0KmMKlsytQOloK8nx2YzT4a9PiEY1bplovk0JTGaDmfcF5Mt4qywvEnah+55qbDdImn5swkoNaA9+k5N4sK+xH/yVqMRJBsFkPpzCI7V8aKwEk7H1MXJmqpM6lkgXTyhqVZcfg6aTl7DD1MjeKPsohjkb55g+zbu+Ih3R0lAt+cL94KJUgwWOm6YEnCTH4yEtvkcvSpuXfyZHtzJH2TicLEyFfqZJs9NxoSHiK556VG2ViZhWqj4uc/nVZcfoaytvK8U/MMWgbuIoDunhzvbkMjRjmvWFgR8cmzSXu4C6rrF3589ImWvcftD+Qaet2hCGtfwz5gsm90VsgD3yXuL4CjphwRb2DMZLhRXiFTFFjvAs3bOJFYRIzFz0CijAIIf/29rjXkmq1vKkjaqFtCoeg/xMm0uaYFWa+mZj3u1T293jcQtbX2lXRmx34RwJuaIrxl5gIKoOZSwe0I43kFDUZppoG6YsRWJLN87JUyHdS00IZGOeOda46Sv3IJTqZxk+fWdvwuZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(41300700001)(478600001)(54906003)(38100700002)(122000001)(66446008)(64756008)(66946007)(38070700005)(76116006)(66476007)(6916009)(66556008)(36756003)(4326008)(85182001)(71200400001)(91956017)(86362001)(316002)(6486002)(2616005)(6506007)(26005)(53546011)(6512007)(2906002)(7416002)(4744005)(186003)(8676002)(83380400001)(5660300002)(8936002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnFBaXZ6a1NSc3FGQWxFZFJrY1NaWFpibW1Kb2xiNDd3MWZERENHeC94NWtT?=
 =?utf-8?B?RmtuNS93b2VMVVdQazZoTVU3WjhaelA1SC9KYm1YVFRSQ2FSZUpobithVXg1?=
 =?utf-8?B?d0k2cHd1NlhiS2dnUDZ2QnFmSU9EV2hlTUlSQ2l3dlNrbFBoOWNDci9ib2d4?=
 =?utf-8?B?Qk1iWjBRakg1WE9lOTFXeW0vMHowYXVJWWJjVlYyZzJ4dEdqQkxJWUw1dWRk?=
 =?utf-8?B?dDQzSzhFUW5YRmVneTl5S0J0ajJXOFhPRnJSWTRzOEpBWjc1NzJNaCtnQUVD?=
 =?utf-8?B?ZTBEUDJRdWs5dlhoeFZXNEgzNDR6dGdsRitTNWw1ZURQK2xsZ0NYRHEySGsz?=
 =?utf-8?B?WHAwRkU3WEl3UXhLWTl2dWxNUVFxRmE0NEJBdEtXRFd0NnRqbisrcURGVGRX?=
 =?utf-8?B?eWpQS1ZSWG9sa2liSFNZeU9IS2JybDkwWUkyVVhWUENiVldMNHE5TWQ1bnky?=
 =?utf-8?B?MHptYk14c3dBWEZXRnZmVnVBcVNIYUp5WUVMbnNoZGM4UDBxZjlaczhHSnQx?=
 =?utf-8?B?c0ZReVIrdTlZQkZ2aXliMDZlSVhHNkd4SGtGbk9VYXpLYVpnd3RYamNWRGps?=
 =?utf-8?B?QmdqMUhuWERzelJDQWlPOEdhbFNtcTlPeE5hZVU2alp2OU1iTUxHbmZZbmZY?=
 =?utf-8?B?NGVzUWtUT2hmSm5lc29leER4RjRCOVlCSERHRXRweDFPd0Urb2s4QXo4a0Rx?=
 =?utf-8?B?WUVnTUQrY3p6aVFiTTlVaGhRVUdIRkFONTdYV0VxQmp5eFNuV3JMYThSNFBa?=
 =?utf-8?B?MDRzQ2o4eHpwOW1GRy85NEFUd3p6M0hQRXQwbW9OdGpUbFE1aUc1Z0J5eWpN?=
 =?utf-8?B?OTNqeHA1dmhnNEY3dExrcVovd0lpeEowVTZDMEJqK0s4UkdhYWtnNGRza1Vx?=
 =?utf-8?B?czY3ZXZiV3dPeVBydzZoK055TW4wM0lTbDJzcVliRXVXak8ySVNVdkJuRkQ4?=
 =?utf-8?B?NktJUGFRTFhOektacWVGMGtKNk1ZbVFvSFJQSWo4QndRblVtejNIV0Q2cTNN?=
 =?utf-8?B?amt2Qzl3Ums3NUdLNmdYcXVkMDZob2JUUVgxT3NOS0RPV1hXaTJKZjZYS2Jx?=
 =?utf-8?B?WmhDckJXUldkVlhhY2s4c0lEVURZOG5wdzNuUUlnY1VMYlNuZlhDWHJxdkR0?=
 =?utf-8?B?ODRwTFVXUTRuR1hwWHJTTHVhOWZ2bjluM2x2WmtqZWNDcmVscGx2K1kyd2pv?=
 =?utf-8?B?MGxOazZ0d1BvYXV5QTJ0K3AxL0JBeEd0VEl2cXZUQnVIL0Ezbkh6OFdSdjQw?=
 =?utf-8?B?WmpPeVZZQUVaODJJazVmLzFKcGlmM01HUWRIUm4xdEhGbEl2Q2k1M28wcTNW?=
 =?utf-8?B?MFBCaG83bUVad3J0UzF5c0JxWmMyUzJyY09UdWtYWHNzWm5oZW4wdUUzN055?=
 =?utf-8?B?UWIzR2dwSkt4dlc5L3pFaWk1Mnl4cDBJYUxiS3g0aTBKYUZIWElpZkhqekVC?=
 =?utf-8?B?RkRJVk5mcklLam5HTGswczhkMzRzMDdsajc4STBWa25RSWF5dnBMbjR3MTJF?=
 =?utf-8?B?dWJLSUVsS2paTnNQZk9GYnBWdHBaNHJheUhjOWFINUQySzE1YmRYWmROcjBp?=
 =?utf-8?B?bTRpM29BYmVwR291N00xNS9GWW9CTkwxQi9JN1NLNDZFV1FEZFlhelRMcjNR?=
 =?utf-8?B?VUpYNUdCMVg0SzBLMXNFQ1AwVGhJNzhwWWxCTXpXMVJoNXZSNitSNURWMTNZ?=
 =?utf-8?B?dExZUTFJWmd0RFc4NUpUQ1FiZHRtbnVCYy90Q0k0MEVzUE5La0x3bmlFeUJa?=
 =?utf-8?B?bmR3RjZkQng5eHczb05VdHV1QzQ1TE9OWVB5VkFGbEh6VmMwVU1VZHdxeEhp?=
 =?utf-8?B?cEFOY0dwYVFuRXZRTkNkRkNuQ1FNcld6Y0hOSHFiUDE4aHlhWTRtQUFtRlN3?=
 =?utf-8?B?SXkxK3JrSC8zZk05TkNiUjR4VDIvdFYzS3pCcktxTlJXZGt1ei9NU2M4REl1?=
 =?utf-8?B?RVBzc2xxRXZuVFhwN2o4L0RWdWE3VXNlOHhIKzYvdmFKd1c5TkZPNEw0V1hi?=
 =?utf-8?B?NUMzQzJmdVE1RThQZk05dm5IUjJ6NGFxNndNVEJ1TUxZQUxEMHJsSFRPUEhR?=
 =?utf-8?B?NEtFTGFEMjZwUjBCdXhwN1JBRUlqUWJ5NUlQa042QStIK2lnYU5sSnpnY0Z2?=
 =?utf-8?B?S1lpZW9RSS9iNHdnSXB2b2FXenRvbGRqeEdaczV1MmJMSDBBM0RKU1Q5UWlQ?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AAF8F27656C6C48ABAEBB8F57D0E35E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd34ed6f-b316-4ad0-9c23-08db6246c317
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 02:20:26.2762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hyVD8I+Dr/ev1NoypG1K+JUTBy8qwGsDeJ8kvfbwLAY/LxCeSsN1wQl2lnZkrHisAUilY1v3CBCntWckUOp3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7770
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_193048_067244_FA888AFE 
X-CRM114-Status: GOOD (  14.62  )
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

T24gV2VkLCAyMDIzLTA1LTMxIGF0IDE2OjQ3IC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIEhpLA0KPiANCj4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTI6MjXi
gK9BTSBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWF1ZHN5cy1j
bGsuYw0KPiBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWF1ZHN5cy1jbGsuYw0K
PiA+IGluZGV4IGUwNjcwZTBkYmQ1Yi4uMDliZDFhMDIwNDIxIDEwMDY0NA0KPiA+IC0tLSBhL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWF1ZHN5cy1jbGsuYw0KPiA+ICsrKyBiL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWF1ZHN5cy1jbGsuYw0KPiA+IEBAIC0xNDgs
NiArMTQ4LDI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWZlX2dhdGUNCj4gYXVkX2Nsa3NbQ0xL
X0FVRF9OUl9DTEtdID0gew0KPiA+ICAgICAgICAgR0FURV9BVUQ2KENMS19BVURfR0FTUkMxOSwg
ImF1ZF9nYXNyYzE5IiwgInRvcF9hc21faCIsIDE5KSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0
aWMgdm9pZCBtdDgxOTVfYXVkc3lzX2Nsa191bnJlZ2lzdGVyKHZvaWQgKmRhdGEpDQo+ID4gK3sN
Cj4gPiArICAgICAgIHN0cnVjdCBtdGtfYmFzZV9hZmUgKmFmZSA9IChzdHJ1Y3QgbXRrX2Jhc2Vf
YWZlICopZGF0YTsNCj4gDQo+IFNhbWUgYXMgaW4gcGF0Y2ggIzEsIHRoZSBhYm92ZSBjYXN0IGlz
bid0IG5lY2Vzc2FyeS4gT3RoZXIgdGhhbiB0aGF0Og0KPiANCj4gUmV2aWV3ZWQtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCg0KT0ssIEkgd2lsbCByZW1vdmUg
dGhlIGNhc3QgaW4gVjIuDQoNClRoYW5rcywNClRyZXZvcg0K

