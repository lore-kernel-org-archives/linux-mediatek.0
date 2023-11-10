Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5F5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 02:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=; b=obzTOWpI0MrR86CkCjU09pIJGj
	ZKvOBOPsA9szkEdv81zzCxtkh/FokpDa1X0SI8MTXhxyeOA+FhyzIsmOo2brJY7p6WrepBGqPBb1R
	kLW4JoaN6wQUWdsvn1udpZCLOsSoElDRv4bX9nU/ufF7dI7glE7h6AOQkhePgvjdAQM/W36Qp9zqM
	mc/B5EwNfDLMETNvlen4+fSyY4Asd19iAN2KzhwgLahkKtuf0t82d2D9VTBjfWs8GzxXxT1GGX0Vl
	QDKHkpRoGCpx843mhpMqcNelHWP3XyBvblC8i+Tgyj1Uamuc3iIH1hoT0RlgFTfX7HpIyUIJXKABS
	ndsvmEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Gpf-007d5I-0Z;
	Fri, 10 Nov 2023 02:01:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Gpc-007d4j-1i;
	Fri, 10 Nov 2023 02:01:13 +0000
X-UUID: 037b17ec7f6d11ee9b7791016c24628a-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=;
	b=O5NPsLhGRbCShRRtEILzTiTM9RV82f8WYMXYkLAQiXb/aCpceQUdmWbiXj30JkF989RGG+dEqBslAByPA3Ma/+ogSUCQA7/1bv+MVRxAr3gY3T4VLE9ohTX3nE7CoL13xIkkUZ11s7TMGDIGLFeSbF31CS54sJwu7iAAPH9ZvN0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:6b976c34-71fc-4dd9-9338-1d76a1abe380,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:28733995-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 037b17ec7f6d11ee9b7791016c24628a-20231109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 318924524; Thu, 09 Nov 2023 19:01:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Nov 2023 10:00:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Nov 2023 10:00:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUEBCVNOCIDlVELleAJ8a+MRBblkk+nbNn3O0Gu8sQwMmiat2hkknHv7vrMDJ8pbqfKipeNwVUM9jsBGvA+ZnkfqpqgAKr/3y1Y4CN1nQdJTmg5dnuoRt5nrzGGv8m97Sy6P3SIP+DWLMDkWjuwc+tSxDHYv9ku8+lCkq2vEjTVp6wVoc0os4xU4wX0boosmus8T4ty0DAeBxj9WddDTBuW6SO4ZG/yNUXqIkdiLo1RH1Z50wq5tvFmmWo2ENsRPqWurH3v6mgl1SHvZOhns+412lBA7XI5eknFpSYPRaEFUsYmMAkyea4lypRWb+5FS1Lo14/ycRPlYObhR1GY1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=;
 b=f2ZEZnUhMh2C3uQsjVvZlC1QRKITHdb8tlxHJwHlv7gP+1FcQHBY+TuIptMj3nGJsIps8kv2/4SPscM1mjugGF0nyhJJ1bAnThJLijNI9l1C6AmHHFVIur8Eo9uyae0K4dxHTgsapY14C4gmPZs7Dlr/6qRwGWt494mJBRxOPxFY1Rvftpg/b+3ibBsV4TlUIK/vlMNa89Mh088CXsdKFFoSpbjW3PTqDTRyGpkytxiTmZsPJ4cXzZlJC3ZiGh6vQJ3y1xmvPjMuiziUJb99GK1w/M4+CXALBJA//QPkfYg3YJWJ9I6D0WS082jOuUCWwrTeGAs+OOpt2FAiOiHuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=;
 b=n8yFJdQbsovD1RSVeWRF4c2402pjii8YKSuVTUU58JDd3mzHJ1XcUAuhu69rigog85QxyNtUluvV7nh/dL4LPqg7DkXYxSYeWQEdAEggzv76gpFqKkZSAohiaf9fXbFDKrgKfOmeVLbyBiydjmjeY6YfydsMb4DzqQVitGmkgak=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6877.apcprd03.prod.outlook.com (2603:1096:101:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 02:00:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252%4]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 02:00:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
	<Lancelot.Wu@mediatek.com>
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Thread-Topic: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Thread-Index: AQHaE3WCy9+Bd6OJs0Kv90rK6TQPY7ByzG8A
Date: Fri, 10 Nov 2023 02:00:29 +0000
Message-ID: <f7c0a90a7f2302a53029c1cafd0b64271b2e546c.camel@mediatek.com>
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
	 <20231110012914.14884-2-stuart.lee@mediatek.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6877:EE_
x-ms-office365-filtering-correlation-id: 2709bcf3-af3c-4312-fe29-08dbe190d08d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8Wh/lZpxlJJwpPnI7BaL+a9vf3CFKLdxjdIBJRWjsVfJAxv9rq/09H8TAjKeUQ3w/ws5Bc2/EVEN8+e4U7JiK4k7roINair6/e8yJhhMyPS6NY5ooPMBkKnz9/suH2YiGH/cmtFx/YTph39ZScqAzEgmhJRfslQPEOas0iqB2fsQnKDTRGGtPkm+VORGmgUPpUUZ6epWlOgBlJIUvezqW1Ndv3jpT+JPI413Z8Ky3khZIsVQC+DX8ZemPkpSxkGOltf79ieGBGsjidy560dUuLjmxQ6aGETbCHZQTkQWEp1EipWagqEzG8BLu52R7g+2Da3a5by0LgKt0slPTup9sUm7B4Jhv8NpbH4eygvX8+GkKw2IujWd91AkQMcnFLPJuelFGltUfX4Cvt6SQu27bGjAtumUR0xeO4jn1/rNSWsMQNQBeW3snR/uselChzM/E72T7j0+fdHQmbV/ntEumX9NgwIMaNyYaASxN9xXnWBJTYn2Uwp5x1EJI3A7SxF+iil50eQmfHwyExuc65VdpfOB9Ne4Sin0rHIgXQjWhY+iGwtF9U2GLN21DyAce3cz8wM2OvZucBF+XCG/B4WFDZe2YZAZ/AuTrFiSQ/ZoTDDjWBOhp72giyAWQVFvA+OY3daalK0AMl6kbREicw1T6Y33S594cyvkfUREBfNPTU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2616005)(26005)(107886003)(6512007)(122000001)(86362001)(38070700009)(85182001)(36756003)(38100700002)(83380400001)(478600001)(2906002)(5660300002)(7416002)(6506007)(71200400001)(54906003)(8936002)(8676002)(76116006)(64756008)(4326008)(66946007)(66556008)(66476007)(66446008)(316002)(4001150100001)(41300700001)(6486002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEdSMGd3WTJvbmRQQTZSbytWVWt4dFJWRnFyYWNjSGkza0hkb3ZVTFN5Vm1K?=
 =?utf-8?B?Umt2NGNCbmVQTzRERXkyeUZ3VDE4V1FTSVVldHhuYnNLNUNnaXgxZmZpVEZ6?=
 =?utf-8?B?cTB3VVJUbTJwQ0VxMjlQMVltU054cDM3NXllTm1WQnFMNFR3dmdraFFDRFA1?=
 =?utf-8?B?RGZkNmVoblBka0ZycnQzN3owZy94VkZMYXV6U3ZFd0JtWmtvZzlDcy9nZ3Nr?=
 =?utf-8?B?SGx0a1BRTm5NN1VkZzl4SCs0aU5RWkEyKythVHJJRDh4T1dmQ0dycG9kaDFQ?=
 =?utf-8?B?QnRxYjk2dkgwMWg5b0xMeU9PTkN0eGFNb1V5cTJiNWJGQ21Oam1YOUZZWU8y?=
 =?utf-8?B?aUdUNjNkekpDSHprd0hERkt1a0VmRHZubVNoYTRsQXNHQUl1c210cVRJQlVI?=
 =?utf-8?B?WXB6NWdKN1JjMkVFNmNkSi9VT2taVURmZGI5bHJDZlAyeUlWcXI4cG14M0l0?=
 =?utf-8?B?YUM3VWVZZXZWQ1dlUFg4R3lWbFN6dk5ueWZJbG9yVE5WN0Z2dU5YTjlCYkMz?=
 =?utf-8?B?dHJ0cVdSd202WFNpMmFWdjJpRDA2eVBBdno3WHRtMVMvaGNlcXJDQnQyWUhB?=
 =?utf-8?B?NkFXTERaZEFTRk9iV3RMd1ppWFh0cHNJRU1NNzNQblh5RTZGeVF3WmNnNTVx?=
 =?utf-8?B?eGt2eDBBR3JVSWZhT0F0SFVZTkF3OGNhM1dGazAwUzVPdEg1c2kxL0FiQkpI?=
 =?utf-8?B?TXFGT0pxWE15bHFaZXdJakpVQlBXQzVBWFUvSHBPVElRdkdwL1FiejdhQi9y?=
 =?utf-8?B?K0V5TmExeWFzQkcrTjNpOEN3eG1jUnVFaGJHUXNnMUpLY0YycW5zTGFLL1Nj?=
 =?utf-8?B?UHp4bWl3bXdla3RaMWUweUozMzFwZ0ZDeC81WFBXSTBNbkRmbUUxRUhFYUJT?=
 =?utf-8?B?a0VPbUcycEQ5b1M2ZTVPVjIxMXZKeVpSMkk3ZVpMU0JnaThFcklOSEl1V09a?=
 =?utf-8?B?bTdHVUlqUjBIS0c1TFZheG9jaEZwUldFZWlYcll5T21SUkkwK0pXamNyQzVk?=
 =?utf-8?B?VVhuVjVnK1hwbk9HRlVLa3lYUzFtR0FDWFZUVVBWcUNhM1JKU2NsbWZWRDh0?=
 =?utf-8?B?Y1kveGNuN3QzYzVPQVA2NU45MER5ZUxSSmdXL2dpbWNHV21Ma1BCYVcwSTQ2?=
 =?utf-8?B?dkJJc291b0hMejJnbXFoQ0hVZmc5d0NnSldxMEdQbmNXZEVLaWxldkhOWXFC?=
 =?utf-8?B?UWJ1OXBMVytoYnplZ0dadHNFWkdvam1wajNqSEt4aDQ2S2RIQ0JKNnc2TU1q?=
 =?utf-8?B?T3V1L3ZpNXJNM295RjR3NFh1QXFsTkpMMG5yR0lpQXRCWm1uQjh0UGJ5RWxn?=
 =?utf-8?B?V2JCeGpjMktVaFU4cUhST2d3OWRkeE9PMFI5TGwyVlJWWmZSS2FUVVlaTllQ?=
 =?utf-8?B?V2R4NDVnMWphRzEwYjVabG5xU09PVWx4TlhjclY3QTVyQkUwVVFGWlgwakJO?=
 =?utf-8?B?WGhmOW8ycjkxSUhYNzJPM2JUWHpVWnozaCtLOEhMeitRZnlCOVJ5NzAvcFNK?=
 =?utf-8?B?S25sc3g0L1BkU3BleDEyVzkvWWhUMTdDU2lzK3IwdUNkRnhJKzI2TlBNV2kx?=
 =?utf-8?B?MC81UWdZeEFuWkhqeTFPeDNxMjJwaXN4THFuQ0IxTFZESDBxQUVkWkJGUTJz?=
 =?utf-8?B?cGxRK1ptN0FLWkhVVlBMUFIvRVJuLzREMUtoUzFzdmlYS0h6TEszaWFiUnhT?=
 =?utf-8?B?ZkNmMUVJeE5XRUxsQW94NGs3WEF3ekY4aU5vdFB3cWI5djV3VnVaSWwwOGwx?=
 =?utf-8?B?eVNvVU5IeGNQdlVWZGloNDNUb2ZBMnRDSHNEcWZzN2FnYzgwNWVLbXlNODlN?=
 =?utf-8?B?TWNVRWttOC9tTzYxRWc5VHYrNnlyeXdMWjNlTGZkQVdWTUE3U3JhekJVbHNG?=
 =?utf-8?B?MjR0clg5ZUVKU1lua0NvQ0NqRFZIZEdBZWdhRStsQmo4MGs0dmdOS0NXV1A2?=
 =?utf-8?B?Sm43UzFScVhZalhhK3NZWSt1eHpsMktCeGhtd29sY3ZaSVRFWWVNWmdEVjI4?=
 =?utf-8?B?emptR1RGNG9PdGdEdTV3aHNrclRrbW82ZzdnSm5uZ2hsV2MyU3lscGpxYWNp?=
 =?utf-8?B?ZU0wZW82cmxFQk1uWGJYSDlaT0p3NnlxQ3J3MDZEQWw5eDA3OHRkRTE5QlVo?=
 =?utf-8?Q?muXyQqvg9Fr1UnE5koY437VmK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E17A0E6AF0834FBB589BD09BE07A92@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2709bcf3-af3c-4312-fe29-08dbe190d08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 02:00:29.3010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1+MInX8Bk86GDmKBWX08lDXYZ65x+WyVwGFVJz7LlhEJApsp0pQyxI2y00xl4mewm4yCBL2xvPkTjTWsG2TNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_180112_572877_CA6167C9 
X-CRM114-Status: GOOD (  18.89  )
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

SGksIFN0dWFydDoNCg0KT24gRnJpLCAyMDIzLTExLTEwIGF0IDA5OjI5ICswODAwLCBTdHVhcnQg
TGVlIHdyb3RlOg0KPiBBZGQgZXJyb3IgaGFuZGxpbmcgdG8gY2hlY2sgTlVMTCBpbnB1dCBpbg0K
PiBtdGtfZHJtX2NydGNfZG1hX2Rldl9nZXQgZnVuY3Rpb24uDQo+IA0KPiBXaGlsZSBkaXNwbGF5
IHBhdGggaXMgbm90IGNvbmZpZ3VyZWQgY29ycmVjdGx5LCBub25lIG9mIGNydGMgaXMNCj4gZXN0
YWJsaXNoZWQuIFNvIHRoZSBjYWxsZXIgb2YgbXRrX2RybV9jcnRjX2RtYV9kZXZfZ2V0IG1heSBw
YXNzDQo+IGlucHV0IHBhcmFtZXRlciAqY3J0YyBhcyBOVUxMLCBXaGljaCBtYXkgY2F1c2UgY29y
ZWR1bXAgd2hlbg0KPiB3ZSB0cnkgdG8gZ2V0IHRoZSBjb250YWluZXIgb2YgTlVMTCBwb2ludGVy
Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4
ZXM6IGNiMWQ2YmNjYTU0MiAoImRybS9tZWRpYXRlazogQWRkIGRtYSBkZXYgZ2V0IGZ1bmN0aW9u
IikNCj4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IExlZSA8c3R1YXJ0LmxlZUBtZWRpYXRlay5jb20+
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgOSArKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gaW5kZXggYzI3N2I5ZmFlOTUwLi4wNDdjOWEzMWQz
MDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gQEAg
LTkyMSw3ICs5MjEsMTQgQEAgc3RhdGljIGludCBtdGtfZHJtX2NydGNfaW5pdF9jb21wX3BsYW5l
cyhzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZHJtX2RldiwNCj4gIA0KPiAgc3RydWN0IGRldmljZSAq
bXRrX2RybV9jcnRjX2RtYV9kZXZfZ2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gIHsNCj4g
LQlzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KPiAr
CXN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gTlVMTDsNCj4gKw0KPiArCWlmICghY3J0
YykNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwltdGtfY3J0YyA9IHRvX210a19jcnRjKGNy
dGMpOw0KPiArCWlmICghbXRrX2NydGMpDQo+ICsJCXJldHVybiBOVUxMOw0KPiAgDQo+ICAJcmV0
dXJuIG10a19jcnRjLT5kbWFfZGV2Ow0KPiAgfQ0K

