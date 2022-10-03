Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 03:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyJ2SOxw+8E//bCdyuYqOy9wfonzThtJAvxwCRFQy7Q=; b=m/GC9gCrpcY8s8GUWPe55UsVaj
	/nW6poCDeQBJoeWx6okX1CcV9CxdAfn/iu5LFmJkluzGgzhNrvI86ptaO1BhFotWSYt+W6rifitbj
	Gc+Jfbvyhy1BxGc9D16lyRCtbrRveaWkDZxCDgliaLj5Jffys/5TsNmRb/wo1CC6qsDfoXkOHIjWa
	eFRmo6+vCnPyxskWJURnmhvFQJN+8hqw9cma9l0HSoAxqXonT/6RIBnbbJBYXNnmic9r/U9RDUO6H
	wo3zkesT2R0GITsOr7mcIPSkdeybto3o0Ap1ysaKX4FdOCVXGdFqZ2EzkOs1a//LnKnCBC/fQRM0r
	gSUz26DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofCZm-003jUC-DP; Mon, 03 Oct 2022 03:57:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofCZi-003jSQ-Kg; Mon, 03 Oct 2022 03:57:04 +0000
X-UUID: 019714994b164b1bafd8e8795a9761c1-20221002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HyJ2SOxw+8E//bCdyuYqOy9wfonzThtJAvxwCRFQy7Q=;
	b=SUesgp8xQlaLoKKMvX4z0s7pm2RMWOWU0ZKhdsPCmtxjOE3s6CFHmo6dkGWDYc9KMBIwm1N2PlhdHzmcE23ZMbjMC0dUANhqwn146p0F5kFaTAwrEPHfBMRTw0ULG1dfBBmunITgVkZujxzI0veXshI+HkilP/2bhg22SfO2naE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b7cc303d-44ea-474d-aed4-e59ef0ee508a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:3a47f7e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 019714994b164b1bafd8e8795a9761c1-20221002
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1436268580; Sun, 02 Oct 2022 20:56:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 3 Oct 2022 11:56:13 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 3 Oct 2022 11:56:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0rbBAAYVm7GOA5Ptvbry9Wwx/J0x3+pJzFYNstFMahpACRf5biQQZOpYKLXg5i65L906bZHfT7Zp28KDwo0P1AZtCKwMtVOPV2pbdbBZ6u8Q4p3WB5TH5hxSlM4chHgOOVauWPQMQeojKMabx18PzLZLl2eH1zXiujo+qN8+JZTbBameGRFn9ZBtOgtuguBqHHS5AYRI50BXNr8hPayUyYD/AakDB2JtT1f1zv1t5rPPrjvZCmNsY/fl4goaWXXmCfWObLyyjtCHVWwcSlDD1/ApJcthKT7YM5O+w9QNPpSCpyzWVYeG7UxG8xNb4mtLAVQnU5ZTKOpy51JXIvNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyJ2SOxw+8E//bCdyuYqOy9wfonzThtJAvxwCRFQy7Q=;
 b=jVzWE6LmDSOANOoPXuUoROweaC4fid9tEKwYuUoH5d6umAAuL0lpEtC046FB648qvMji1h1dOZK90tirSuGBOlEPsIR1TjD+3yCaiWvGCDScuX/tRqN7H8Xk9dVAIYisl5F7hUVpZoWcX6YslgaGgbXb/1ERnuLvGmthRKi9x8g8OXzRrPSa7p+KznjmBMJgm3gRJG0f+384VrsXBkEmQEthlk+y4L1kAS5CYDRrxgBX2CqCWz/5Ubl8nBRwtLLa+3KHvkufxr7z2+Jqz/B38VTM7FCUsbRegRJLNpQwn0bBs5EwjfCLCapGF9A2RuFO6rxW+hLBYO1slJ/PThd2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyJ2SOxw+8E//bCdyuYqOy9wfonzThtJAvxwCRFQy7Q=;
 b=RxGKzF2XrM0mySFMJNWWOAiZaAHNMtQqL+Mz8iGU5LO5XgDI+RNXCDDBISFgzmFDiQIfthoFmejf1Gq/ciAR4tLaL75fo1dtqEo/Uvi60zDXg1m39yI5NwjZtz60W9ut5rDkGHqa+qIXgqkSeJPjrooYxxU90sYeGZCfJgpo9gc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PSAPR03MB5304.apcprd03.prod.outlook.com (2603:1096:301:42::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.8; Mon, 3 Oct
 2022 03:56:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 03:56:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>
Subject: Re: [PATCH v8, 2/4] mailbox: mtk-cmdq: instead magic number with
 GCE_CTRL_BY_SW
Thread-Topic: [PATCH v8, 2/4] mailbox: mtk-cmdq: instead magic number with
 GCE_CTRL_BY_SW
Thread-Index: AQHY1OaiBEjC4clmy0yf6/ReVHnH+q38DlaA
Date: Mon, 3 Oct 2022 03:56:10 +0000
Message-ID: <f902d4bb5e741a40e3e51d22e4ee9019c0594c44.camel@mediatek.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
	 <20220930160638.7588-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20220930160638.7588-3-yongqiang.niu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PSAPR03MB5304:EE_
x-ms-office365-filtering-correlation-id: 17afdf03-ba5e-40b1-b96d-08daa4f33554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mHpkDvVwINRQv/HZPaKKb4dGew2GaWJbpYN+SBHZzQkxTOVbLi1Sy/293uK5ztod5ESBJL20b7HiMocvujSvk4BtTmRUGDGOX/3p2TGlOQ2Hozsx7m6/fC6RQs442O9Nelmjwef6mmvA+PBmCsl8jkttSN+BB8wiLvOvKbXAMAwvwcW1tOAN1a1jq9/wmFMKUeBaafuKOc7PK4629CcfbUgrBkf7n/9lr88b6GLdxv2CTJvNhKP4p9A6caFfGT5EhENz9tYADS33OqseIrX7G6UUHBp2QlcGLfman6CIv7buSSJBXkwTH/q4kA6d4SyXqrc6zPlQKQp8MKNjEFFEWngJfEJec9F4yQXcU12NSFUjRydRMkv7TW2QYw1+lgB9FFuGPqxtZvqwkrRH3lJHJVno99dtDnIW90jeaU4dcZOKppYZEag5T3xf3tyuXw95Hityo+ekQEUml9vs4WcYLqWRpIKHeGxZJpKG21MqoktOc3rnbxAS+ry7GGEHnnGfg0g/pSZPQRSE+yRJN0RCIxmh741kO+UDTph8pzr9fXO/CpLlSMbGWEhDenhwpI4qL/uaoDbB+4T92G8n3vIz8CpUyjh/H5b9c5ij0AqOnZc/6WN95jg72Jzr+bEiNJ4Y1Nc/oOv8f/ZdoLKvO2PotMymn4YZrrhtqSJQpLycZixzjMM4hYRKp540TfmpZ8a5SsNoDOq4+XmHhWDtzFxZx0hvoAIlJ0nUySHssKm+Ki4dYITO3Fjv19FyOYIPiFiVj+JTziejHG97BpdG3IUSB/792p6cA7NQhQFbuJMM3janf/bHsFzF9Imeobp4Y2V
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(376002)(39850400004)(451199015)(8676002)(4326008)(38100700002)(41300700001)(122000001)(66476007)(66446008)(66556008)(76116006)(66946007)(186003)(15650500001)(2616005)(2906002)(83380400001)(85182001)(6506007)(6512007)(4744005)(86362001)(8936002)(26005)(5660300002)(36756003)(38070700005)(478600001)(316002)(110136005)(64756008)(54906003)(71200400001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDhncGwzbXhaTGRscCtZbTFiN3hSY09HZFg4b2pZOHlsT2dBeVIzaWUwTENs?=
 =?utf-8?B?RjBlRFpyTEcwYVdPTS9XQy9oZ2RRcGNYbHA1K3FXejJjb3FBMHAyM0JGUk9Y?=
 =?utf-8?B?amJUMVFhUWduSWs2eVVGYmZ4b25FaUM1alVBUC9rSXhrQi9DKytmbGVBUzVM?=
 =?utf-8?B?S1BkamgycHRqNzAzblVmaXhCWHVxTjZDT1RveU1HY2lwekJTdjVvR2IzSmhL?=
 =?utf-8?B?TWd6NCtPTzk2U3NiZVdwV0ZNNmRPOHU4bmo5Q3puWFEvVDdYMFo5QzEyL1Rs?=
 =?utf-8?B?eDFBRW55OC9MMkFvSUJjSWFvL0h1T1JIQmlaQk9vSmhVTEJaMXRVMUl6Y2lt?=
 =?utf-8?B?MVJpaVoreEdWUFlrdC9mQk9RSWRNckhLZ0txbE1GdytFYzZPTUFsQlIrNnVS?=
 =?utf-8?B?QmplMXpIRzFiaHNwMHdKQXpkbEd5MmtuNFk4NFd3N0NyNVNQVms0WDVJS1Qy?=
 =?utf-8?B?dEsyZzVNZzQvN1FpSFlaQWovajR3cmk2ejIvV3FoTEFsTU5POVdyUmQ0MXBt?=
 =?utf-8?B?OEJMRHZ5OUdUeGx0YXJWMDRVaUtYemY1N1VVWXltTDEwS0t2K1FaVG4zbGl6?=
 =?utf-8?B?SDE1a0FWTzV5bmI2MGsrczNvaEtkYzdwbVRZS0dQNU1mQ0ExSjBRMjJDYTlv?=
 =?utf-8?B?b2Z2WllRQzFnWkZSRVk1dGdsNXExWjJTaXRIRlFsa2JzQkl1WGZJaTN1ckVk?=
 =?utf-8?B?UGduZC9PZXBBNHVzbjlMQm14cWxXaXBYYmFBZVg1NGN6WVdncCtlamhPVGdx?=
 =?utf-8?B?akZQRnRMVlYzcHhwM2M1ZmhwN081UXFGcFE1TS9aSFJ6K3BrUFR2K3hkYkhj?=
 =?utf-8?B?eGswMTZNeUY3dkxBVmZnVVhETk9hcFRaNWpadjFzS21SUk9xeTFRS29kamwr?=
 =?utf-8?B?MUdBUEF0dFo2ZWVqaEQ4MUpuYml6ZlV2SDZrelFZemVrZTZSNUFmNExjTndj?=
 =?utf-8?B?Z2tsbTEwL1MyL2JVQmhsMHZiSlhVaXVmVFNPdUNhUEM5YjFHOGVMcDQ3djli?=
 =?utf-8?B?OEFTUWtRRnd1cnR0RlErL1hxb0VuSnRiNUgrb1FHdlFuRDZXTGxYczM3bTha?=
 =?utf-8?B?cXNrZWRtWlZuQ1NBcG5ubk5lMSt5Rm1hSk9QZUgzOTFjQjBicTN2eE9FUmRH?=
 =?utf-8?B?QzNWUlp0WjhPY1VTdVdWMDRNd1pBangyZ1ExeHhHelN6Qzg2T0p1dzcwOVhT?=
 =?utf-8?B?cFBzVG5sSE8vdGZRRmY2R25YcWRabGZnSFlMdzFtQzFEdURnQTJadHBZRGM1?=
 =?utf-8?B?ZUJUa1hNK2JxNWV4VlNUbEg4blYwUHkzSnVyL1dYdy8xNVlOYmtNZHBwQ3or?=
 =?utf-8?B?cWw0ZGZIcm1EUzl3LzZLZlovRUZBSEV3MU5aYnFmbEYxR3oyVmpWS0IwcDBT?=
 =?utf-8?B?WjdxK3VXL3ZhQjd3VlR3M2J1OGlVUzhXdVpSTVlJNklCSFI1MjE5WWRvdFRG?=
 =?utf-8?B?UmVLYnZhb21pSE83RmprVVlROFMwVGllc0YyUnp0SlJCMURLRDdhbjd6T2Jj?=
 =?utf-8?B?U3ZTMHZaM2l5a05KYk9vanRTQ25rV2tmUzhLSGdoTUhTTU9sR1htUzJGSG1v?=
 =?utf-8?B?VkwrbXF3K2JNMFFMaW1pNlkrTitMREZpdjk5YjhVY2FGRU5ndkp6aEgxcFRS?=
 =?utf-8?B?MjFFbFA3U0tJUkFKQzdCNWFYblVqOXJaUDNZMXd1TlUvbUU2c1EvN2pNdmxP?=
 =?utf-8?B?V1RCeHgxZmV5cFJqc1ZtR2szWWorTmFSSXdCakd4SjU0WFBWdjdNbkdyZWxn?=
 =?utf-8?B?N2RMUlo5NGc5NGcvK2ROaXRsNlNud2xKbEE4clRRWHlHaE11V3IzTjJhT0Ra?=
 =?utf-8?B?Y1cxOVRtTVNkbzRKRkpFeEpRM2JxbU1VQ0tCclZhbWd3eU4rTE41UU5mSjVw?=
 =?utf-8?B?aVVJSzdxcm4xMEdKWDlzTHJzaXRBMThKYVMzZ2xIbng5MGk5YWVXeTI0aWJw?=
 =?utf-8?B?UzZVa1BUZFN2RFN4bDloV1NkdE5kV3BxV2FrZlBKc0t0OGVxaC9KaDZsaFlQ?=
 =?utf-8?B?cDcydUp4WmJtYXUxcWJ6MVYxOUtPTW5EeXp6WUdlVnczWGxMcXdhV25Gcy83?=
 =?utf-8?B?bURxMDZabUFGcWlHZHJVLzdJUzkyODlJcjh0VDY5aTFNWW5zMC9NQUtZYVd6?=
 =?utf-8?B?SXpMVFJUUUt1N1daa3IwQ1d4aHpnV1BEVHN1WnNrcloycUxyOHhzS0JscE1Z?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D836AD2C1EA18A4D907B5D8FEB71689D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17afdf03-ba5e-40b1-b96d-08daa4f33554
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 03:56:10.4630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZYoXC8oPZ9dUDVGcXSdJoYGtcU8LnbmZlW/AnYiC1aEQ1tnjMzkhb6T+oRWQPWWYnkFD3mS9sYvZZalJf7yXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_205702_712056_C88BC25E 
X-CRM114-Status: GOOD (  14.68  )
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

SGksIFlvbmdxaWFuZzoNCg0KT24gU2F0LCAyMDIyLTEwLTAxIGF0IDAwOjA2ICswODAwLCBZb25n
cWlhbmcgTml1IHdyb3RlOg0KPiBpbnN0ZWFkIG1hZ2ljIG51bWJlciB3aXRoIEdDRV9DVFJMX0JZ
X1NXDQoNClRoaXMgaXMgYSBjbGVhbnVwIHBhdGNoIGFuZCBJIHdvdWxkIGxpa2UgdGhlIGNsZWFu
dXAgcGF0Y2ggdG8gYmUgdGhlDQpmaXJzdCBwYXRjaCBvZiB0aGlzIHNlcmllcyBiZWNhdXNlIHRo
ZSBjbGVhbnVwIHBhdGNoIGNvdWxkIGJlIGFwcGxpZWQNCmluZGVwZW5kZW50bHkuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcu
bml1QG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFp
bGJveC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxi
b3guYw0KPiBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gaW5kZXggODhk
YjZiNDY0MmRiLi4wNGViNDRkODkxMTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMNCj4gKysrIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxi
b3guYw0KPiBAQCAtMTMzLDcgKzEzMyw3IEBAIHN0YXRpYyB2b2lkIGNtZHFfaW5pdChzdHJ1Y3Qg
Y21kcSAqY21kcSkNCj4gIA0KPiAgCVdBUk5fT04oY2xrX2J1bGtfZW5hYmxlKGNtZHEtPmdjZV9u
dW0sIGNtZHEtPmNsb2NrcykpOw0KPiAgCWlmIChjbWRxLT5jb250cm9sX2J5X3N3KQ0KPiAtCQl3
cml0ZWwoMHg3LCBjbWRxLT5iYXNlICsgR0NFX0dDVExfVkFMVUUpOw0KPiArCQl3cml0ZWwoR0NF
X0NUUkxfQllfU1csIGNtZHEtPmJhc2UgKyBHQ0VfR0NUTF9WQUxVRSk7DQo+ICANCj4gIAlpZiAo
Y21kcS0+c3dfZGRyX2VuKQ0KPiAgCQl3cml0ZWwoR0NFX0REUl9FTiB8IEdDRV9DVFJMX0JZX1NX
LCBjbWRxLT5iYXNlICsNCj4gR0NFX0dDVExfVkFMVUUpOw0K

