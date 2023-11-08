Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 05:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4NHK4sz1YFcaubaSDwJMMyBTQxMpuqgaI3wLAeCeh4=; b=HeDPMPN51nsD41aKeQXLLLkY4i
	KDCPDygBRDugLEe+kQDLgf5HPaVKQNZC5Z0h4zxfvdFuCRh4SiqpTjeQKfCdHPXmZ7I8/P3KQAZe/
	mDrxRDFp8K0xjY52QHH0A8aQGC5lzm2yi04AzE/iJHhJOD3x8vFuK/1HjULUI/U0cVu19r95ZRKCi
	nvHnzUZCm6IA15ZvU+5t8gXpPBbEgWg6GA2RknEDyQow2CaVUAOT8u+urZpuZd1bh8Y12/9RaCOa7
	AHf77hajUZQbbgvqfrO4WpODetFPD3Whn0ZGftVdMe41Krdy8hV3dxdDeXQpFjDqWURdCikDl9lFE
	4MlGjvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0b1S-002zFi-0Q;
	Wed, 08 Nov 2023 05:22:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0b1P-002zEk-0K
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 05:22:36 +0000
X-UUID: cd6fd52e7df611ee9b7791016c24628a-20231107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=c4NHK4sz1YFcaubaSDwJMMyBTQxMpuqgaI3wLAeCeh4=;
	b=JXjaudJHWpdehGfXW0XXSZDYFPxFg8l8x6orULqEqEfne9pf3BXH6rC/eKPNE0O4gn3jCzVvI+cCydEKNtXfQe9qDJrEjgoGtcl9sujNe/5fD3ELpMEULh5aU2qrS4qYRAVS+2ms5wNDKuNkvTrpDnceBYh8DNOO71XaoASRIZ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:bae7d642-55de-4286-a2ec-5ea781a9ac3c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:e2376772-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: cd6fd52e7df611ee9b7791016c24628a-20231107
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1108751252; Tue, 07 Nov 2023 22:22:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 8 Nov 2023 13:12:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 8 Nov 2023 13:12:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzoOOwaTlihMzulIoq6aMHy3TjwS8vFkEVe8nNHXf1QA1fIu+pWK9m08ClqaGvd41StL8czAKnZDWMoC9BAGfZCcqOdFp83GrkPoQGALOWI1w1k/ziFfzoU3d4ghHd4yOxafTC+7cNWQ7ciLJXG5V889psISC2GH2IpgogEepE+1o1IODt7iDncJeT2X/rH4A/NxsW0WP15myJbi+XxikTiyPiiumjwiJZhHtxQxQkUEXmAS+q0SUXS9Sw50mNZQ5OpF5oqXDOW4muczmaSwhQnf0P8SdiENbfuuYuOUtJbj8vQx1C/8JsyBmJe8A0V2zcNRBodMvhxQeAPUD4Htig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4NHK4sz1YFcaubaSDwJMMyBTQxMpuqgaI3wLAeCeh4=;
 b=ZF+f82PxcXVm8Y6bZ4PeQWdzIQXqLz6D7CipEpZuhlapg6PfOcX8GQEjrUVHGK9m51ztQkea+nbuXP89bDGw9dpuggiJhDfBTUOsUg5lIo+dkRcZ5dz6PWajJ4iLzZzgUQn8KP/BooNM9ILmLeA3ne2Hak9aWi3oM3jF4yiA+cIDIg0/OpsTuvRQfHTKfngEuaxg9SfBKrpdB7Fa6ZMhuinPp+S8rT+0HqTroA7srh915WMxR/Gwm79DiQffVR1Vk4nLgyNP5LDutjnWi0DLVHPY8LfliWz+PCr5VICwntJ7VhO8Vs2/SrBCZYtqwejpvQ4+i7uVAUarMfTq58FsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4NHK4sz1YFcaubaSDwJMMyBTQxMpuqgaI3wLAeCeh4=;
 b=dHnaXYyO2WfHnmNbqiN/D/6tXX5h6Ym4gs6C6uNgrmjVd9zmdCxZzDc3Ay1bw4XYchJC0Ny1d/DtT8uEbVh0nKBe+JnqT6cRKicMLigUkHsaWkZMvy0QgFa8qxdt9sYZOyqdZqG4VZWi8ssBU4sdEGFduMVmolF7AkNRf1jo4Hg=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYZPR03MB5629.apcprd03.prod.outlook.com (2603:1096:400:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 05:12:19 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a5d6:6ceb:3133:7f69]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a5d6:6ceb:3133:7f69%5]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 05:12:19 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
	<Allen-KH.Cheng@mediatek.com>, "zhourui@huaqin.corp-partner.google.com"
	<zhourui@huaqin.corp-partner.google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "kuninori.morimoto.gx@renesas.com"
	<kuninori.morimoto.gx@renesas.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Limit RT5682s to
 only supports dual channels
Thread-Topic: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Limit RT5682s to
 only supports dual channels
Thread-Index: AQHaEeKzkyc9wIFOQU66LjnV04O7MbBv4IQA
Date: Wed, 8 Nov 2023 05:12:19 +0000
Message-ID: <35837139c1aca2408f64b87c4eb13862e002c089.camel@mediatek.com>
References: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
	 <20231108012617.3973539-4-zhourui@huaqin.corp-partner.google.com>
In-Reply-To: <20231108012617.3973539-4-zhourui@huaqin.corp-partner.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYZPR03MB5629:EE_
x-ms-office365-filtering-correlation-id: b068f76b-1e00-4c60-18e7-08dbe0194862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZflBPVR5naHDh9opyXcDGoC+r2P0klXIaF7/NYhJtk/MoRaD9evQgmInRtRnIHrxR2Jqi2zcMDEZVX/3mSvCf4GRCWBrV/oXfbb2MJVyDBmQ+qV/mCQDrlqi9SI7kLwPz9RnMkwknlq35crF8AocfG60B7MnoE7tF7oB15/gfOtWAoRd9IMQSPW0fuPuF5GGM7EI9dVpYNx7qNLYJczS4QzkAySEEKoLAkQSx27p0z7tr50AB5jokzEx4nRwDusNoJk8Syxc6MS0C4pTf8LBgmtiriJAxS3zQbeaBO8WZq0Aih2ar4QjD2y9vIauyltzXBzy8YO7wyHjuB11JW3XncaB0ydvSyxfa4u003gAfDWJrKbfMgTEF+xaGr0nIX0h/8w+SI40xkNpQX+LQ0hKbjT9ylC16aTF4hSopEXpFEd0o1cv4E1XF8kxzLXm0mzQps8FB1T2aogqvIUgBaaQMQsAlYuf1+1cDxTMobgfS6Eci75+QtmU4XNPDr4zYD5WXXBSzx2yJ4XykzPVcRZyNmTgCCrXvHjWxOJqcZugwJys2taBjeF09Ge/9HffGoo6klpy2nl9LVUkhYSWmgZRzJybwJ40HgnNUrbGDspOzpnNcDn+08vPcbDsYLJ3EV6cawGJPBvC/0ZnUIv4K9mYpRvwnbotkTbml7QeGNe94I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(36756003)(85182001)(8676002)(316002)(6512007)(83380400001)(8936002)(110136005)(66476007)(64756008)(66446008)(66556008)(26005)(66946007)(54906003)(91956017)(4326008)(76116006)(5660300002)(2906002)(7416002)(478600001)(41300700001)(6486002)(2616005)(71200400001)(6506007)(122000001)(86362001)(38100700002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBnWmdDemw0aGo5NWdDTHQrbi9GQklPbGN6T1BLc2ExYVBnMGxqcTlKL0kv?=
 =?utf-8?B?cHZSTkdVVlZ5SEYzanhpNWpCU0pBbWZoSkJYUDRUQThST3VIbnhONkh3ZlFv?=
 =?utf-8?B?dFRvUlVSWmU2WW40ZmF4MFY0UHlxTTNON1NRNER0TVBKS1NadVVQdzNaS0lS?=
 =?utf-8?B?d3REYU5GRC9UUGFxaE9kTElXQ1B0REZKWUVkMHJkeUlaSWw4MjY3blltd3hw?=
 =?utf-8?B?bFJXS01tNVhTMEFMSEllY1YweUk4VXZPYUQzUEFYYm1scDUzdnhTS05Rb3ZS?=
 =?utf-8?B?Rlo5VEFzTWV1YkRhVHVDRC9yRldhTmVjNmh5MTloVTZJeDdxQWw4Z1VwREhS?=
 =?utf-8?B?aUlVSjBlaXliVmtBdWJNR2RERmVERXBFbVdrOXFabXFxYTVxZ2s0bHJPUjlz?=
 =?utf-8?B?UEhPUkZQYjRZK2xicklWTFowNEdFM0J0YWhsVTJReVNVRmVrNExXRzdBeHBo?=
 =?utf-8?B?YlRNdW5JOUFMcTBldUN0cGhMQ1NBSUtKeEV0U2g0L204VDY2RFkvT1M5RHA1?=
 =?utf-8?B?T1hDM2h4RWRwUWxFUnV0LzM0UklYTFVmVFZRM203cFhkL2Q3L21jUDIxN3RV?=
 =?utf-8?B?YmxJU2JJd1NKZnIwdFlLWi8rYjZXeTdlaGUzb0xXTGl3WlM5cUQzNFEvS0Vj?=
 =?utf-8?B?RFRyM1ZrUG1jV0ZxOVhvQ3ZXeGV6eDBRVi9Obk1adHpoaWZ2SjRmOGw3QXc0?=
 =?utf-8?B?MDc4YVJkTUx6Z3ZzOFpESzIrOUM3TENJNVV1WmppRmlPVE9vTG10d1RzVjBy?=
 =?utf-8?B?RnNzbS92bWtkNU9BK0NrMVJHM29uUUR0V1JSS2pJaDZrSjhxc0UzdlM2Q3Zl?=
 =?utf-8?B?QzlBK3RLc0FGVzlNT29JU1lCVkFBeXJncm8yTSswMXA3UjdwMFVBUG1IeVI1?=
 =?utf-8?B?cHN5K0JzU1Eyd0IvRDZTNGpMT0VkQjlHTEhQekV5cmZHanhXdDVQdythNjZh?=
 =?utf-8?B?ZEVzVzJGdElPTWV0cUh2bW42SGlibUx3TmROaUxVQnRTeUozeTR6Z0wvTGx6?=
 =?utf-8?B?Nmt2aWtDRTFwbitneWp3WGplOXBGVnFmZTMyS0VxQjVWT0ZiajU1RnVhcWlV?=
 =?utf-8?B?bmFaWDM4bldvOEFONU5FQXJvaCswbXF0OTM2VzZYVXpQS2hmL1p4S2Y2dk03?=
 =?utf-8?B?S3E2V1M3aWNaNFF3NGtmWi9tbU9ibzJ4SW9MdFluVGhyNmlzdkpXYzlBWnA0?=
 =?utf-8?B?bEJjcWc1bEh3NFRPejNMdmxDejliRVdSd1FIaHZGWk1iMTUzUFlyTmZ0TVI3?=
 =?utf-8?B?VElWZTRSWlBNRllPOFUxdnZJbTE1Kyt3QXUwWmphQ2lsZmFuOWtGWkMvVUpo?=
 =?utf-8?B?UjdjNVVScGtqVW51VWdxNnFOUWpEVGRYa3FsQkIwRnk0czJDazVyM25KV0VF?=
 =?utf-8?B?MGs4dVUxb0hkb01ONHozdlU4UVp3UUI0RVpLS3hQZHI0eGtIQkRtOGFRQXAr?=
 =?utf-8?B?eDlrcU93L2dueXVzR0U0YkpQTFQ3US9PeXh4c1A5RjV0RlNsMEVjYlYxalZy?=
 =?utf-8?B?SkdTTlV1T2FpeERyL3c0QjNTazFUb3BrWDFrODZVak9yaVRreDl2T0tCOEM2?=
 =?utf-8?B?RWdJUERqTEhEYXpxLzlVRklIaTZxeGxvbEVQNkc3ZXNjQWpBWVFuZGVpckIr?=
 =?utf-8?B?bjdIZUxHc1lUUlk4d3pBOU5JZTloT0FkZ1ZhUVRqSmRNMk1XckhqZlpuUTdj?=
 =?utf-8?B?V1lRL3EzWHpjdzViZjRQTTlMcU1VUU9rWXQ0VU1pZmgzbDNmTEdjOGJXYkRk?=
 =?utf-8?B?czZNTy8yNVRqMkQwamJ1cEVGcEV6eis1Ykl2b3JCQXdnWktPL3hOeE5wOWdN?=
 =?utf-8?B?NUJ6OFF4WkFvbVVSYWpUVUNRejRtaUtVN2pPa2ZHbzdpYS9hYWNTSjZ2aG1O?=
 =?utf-8?B?UXFQZHpJeksxK2ZvOEFDNCtPc0ZsWjU1QVN5Q3d6T2VENVM0dHBCZ2FvdmVw?=
 =?utf-8?B?K1RyNkNyTHR5YTJyMlF6NW4rbE5nR2tVY2lYT05paXlUN3ZLaFU5QUVsVmlO?=
 =?utf-8?B?dzQxczlSd2hMelVRVXRQZ014MGdNbEJlUmhSSVdjOXRkekpnL0szb1NoZzhR?=
 =?utf-8?B?YmV4MXZhUEpkN2h3RFh3U09IN0V0SzlMYk5IOHhnYUd0SkJVR05sNDh0czVG?=
 =?utf-8?B?aGoza1I1Y1lCTVVpVy9vTlpIWG1PRHhvVk9XT2tOeEpwMkNQaVhiNElsb3lL?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BCCFFCB971FB94F91E6C10988DF8570@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b068f76b-1e00-4c60-18e7-08dbe0194862
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 05:12:19.5664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8q4H2EaRdqLcRpxmLi+hbkv2Qv0MNw2TUjL37hPZuSk+R2CD6GWjHwJ3nBTIQI9XgFRF4+uJvFMclInYzG0abg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5629
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.273800-8.000000
X-TMASE-MatchedRID: ge9e+QLSeazUL3YCMmnG4ia1MaKuob8PC/ExpXrHizxeARTvhomDChFw
	/zDQmHu968Npu3b7wViuB6WcjahkUVEAXL0Ub1O9i/vfAS7Q3HuX0RsAdZZVkhHfiujuTbedduS
	l0OECBiYsmvr/DPyX3Od+3E2h0GvH57uLJZMteEkpoxDq3DugMkyQ5fRSh265CqIJhrrDy2/KT8
	XTcq9Z++LzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7CKFCmhdu5cX88faW7jshmTRC4
	8Ap7sFlIUjsQ9cgDI/eNAysPh4jjn0NeTxK54nOST5+TXF95kogtyjtYdlCq0e0F0P2a93JzSin
	UNQzP5S5ZyimlDMxyA56xhuba2WuZ86KY3oNT3zIO0Si2Tuenp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.273800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 40A3D759620949A1CD8A679BED5B9AD6DC423FECF8587FE9FD382F6E3EF9AD742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_212235_163263_70B15DFB 
X-CRM114-Status: GOOD (  16.57  )
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

T24gV2VkLCAyMDIzLTExLTA4IGF0IDA5OjI2ICswODAwLCBSdWkgWmhvdSB3cm90ZToNCj4gIExp
bWl0IFJUNTY4MnMgdG8gb25seSBzdXBwb3J0IGR1YWwgY2hhbm5lbHMsIG5vdCBmb3VyIGNoYW5u
ZWxzLg0KDQpIaSBSdWksDQoNClRoZSB0aXRsZSBpcyBzdGlsbCBjb25mdXNpbmcsIG1heWJlIHVw
ZGF0ZSB0aGUgdGl0bGUgYmFzZWQgb24gQW5nZWxvJ3MNCnN1Z2dlc3Rpb24gaW4gdjFbMV0/DQpJ
biBhZGRpdGlvbiwgcGxlYXNlIG1vZGlmeSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHRvIG1lbnRp
b24gc3VwcG9ydA0KZm9yIHN0ZXJlbyBNQVg5ODM5MCBzcGVjaWZpY2FsbHkgZm9yIHRoZSBtdDgx
ODgtcnQ1NjgycyBib2FyZC4gTm93LCBpdA0KcmVhZHMgbGlrZSB5b3UgYXJlIGFkZGluZyB0aGUg
ZHVhbCBSVDU2ODJzIHN1cHBvcnQuDQoNClsxXWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
Y29tbWVudC8yNTU4NDA2Ni8NCg0KVGhhbmtzLA0KVHJldm9yDQoNCj4gUmV2aWV3ZWQtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSdWkgWmhvdSA8emhvdXJ1aUBodWFxaW4u
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgc291bmQvc29jL21lZGlhdGVrL210
ODE4OC9tdDgxODgtbXQ2MzU5LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0
ZWsvbXQ4MTg4L210ODE4OC1tdDYzNTkuYw0KPiBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxODgv
bXQ4MTg4LW10NjM1OS5jDQo+IGluZGV4IGU5OTRmYWEzNTU2Yi4uOTE3NjQwOTM5NjIxIDEwMDY0
NA0KPiAtLS0gYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg4L210ODE4OC1tdDYzNTkuYw0KPiAr
KysgYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg4L210ODE4OC1tdDYzNTkuYw0KPiBAQCAtMTU0
OSw3ICsxNTQ5LDcgQEAgc3RhdGljIHN0cnVjdCBtdDgxODhfY2FyZF9kYXRhDQo+IG10ODE4OF9u
YXU4ODI1X2NhcmQgPSB7DQo+ICANCj4gIHN0YXRpYyBzdHJ1Y3QgbXQ4MTg4X2NhcmRfZGF0YSBt
dDgxODhfcnQ1Njgyc19jYXJkID0gew0KPiAgCS5uYW1lID0gIm10ODE4OF9ydDU2ODJzIiwNCj4g
LQkucXVpcmsgPSBSVDU2ODJTX0hTX1BSRVNFTlQsDQo+ICsJLnF1aXJrID0gUlQ1NjgyU19IU19Q
UkVTRU5UIHwgTUFYOTgzOTBfVFdPX0FNUCwNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBzdHJ1Y3Qg
bXQ4MTg4X2NhcmRfZGF0YSBtdDgxODhfZXM4MzI2X2NhcmQgPSB7DQo+IC0tIA0KPiAyLjI1LjEN
Cj4gDQo=

