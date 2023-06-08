Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94033C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KCWviqFMdNQagLzLMQgOGdmkLyEAi4hWbnVzAq/k9A=; b=pt583DeToAPBnREvKp3eVQreGN
	gY/ptpd/2QeG9g1ZwxcauNQoH3dj5VftmNDc5VKh5i8rdjt3f/ZUL4eq1FBvLnYmWQ/uxfUnQ9/TA
	oV/eos275VobgTc6FZEGB9JDQkR9WBkC8RX0IN5eVEUapryMI6Gv4Ft4d2G65z7lI4TEwqnGZkbmb
	tipaqV7ZJonMS6dgNcAi41v0RHnji4G0fbU+/fInqCLjl2ZH0iINni+yPzMcvKcCCBdtYutJ8byUU
	EMoY/c+3CdKcTaThPW745sK+Kg/6Ku+RV9JXIoFsfnxILjnlUX1dN16FHDrlLFKeBvSjVsmqo60EL
	LV/mmrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q764l-007tdb-0g;
	Thu, 08 Jun 2023 03:12:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q764h-007tch-08;
	Thu, 08 Jun 2023 03:12:37 +0000
X-UUID: 4e396f8205aa11ee912e1518a6540028-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5KCWviqFMdNQagLzLMQgOGdmkLyEAi4hWbnVzAq/k9A=;
	b=O/BEvVi0r58sNi15dqXBwUZ8QbJ7Awi7OQgL1/Quergp0iuemr75Bp2bdIAqaAQnOw0XT+cEz1x6tbuprephSJFwTGSXpo+vAcfHmtqz6IPRoiv5DIo0eR4lVWAp6+pAik1DTpHcXt9GgGbSXDjvgPH6MRw00tMHFeJhINDj3hQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:f0fa6f4e-f099-4e9f-ab64-6eb4a0d49083,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:cb9a4e1,CLOUDID:492f636e-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4e396f8205aa11ee912e1518a6540028-20230607
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1571989852; Wed, 07 Jun 2023 20:12:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Jun 2023 11:12:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 8 Jun 2023 11:12:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+cGdkZix4vv4cu6JZvYZzEarE0bjZg9gMHAqme2gF986vv9P7/QWn+oV40aM+b48TjHWI1HEFK74gFmZF7daJne/9T4Px6UjJ/0nZ23BJaMdWfj/+2avyXrH8XcaS+mdNPdpo2OQ70hqmDynQR0Gt9twKkaxi/zh7n1aiQFqZQJAVgAEOkR2IvIzyH1Nkls87gQ+PVOtqF9LjMzDIglKeoZEwjEGCGO6e9wLdjotCByS/bsklZZcnaoaNsf72Fy2lqp4Tze1Ljj513Tg/CJ57DHJIFAyx7/4e2zoRiXbrSbUKOyw/Ledzrh7OYvCchKDZdY6YIoVxwneUEQSuiseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KCWviqFMdNQagLzLMQgOGdmkLyEAi4hWbnVzAq/k9A=;
 b=QHtPXWIt6UQiFATA72Y543l1QETpYW1xi4j3wrk74WDemL6tB0giLae4fTx6pb6GEUWL+cC7T6EF703wDKBSCpBtHljq9IYK2ltDqvnO1NYJBlFuhExPP5vIApo+Rn7+xpJvuGLIxMNiAKlBeeCG/DpebhabR1ioNd6ftsdhwq8Xt5I7GJ9/mw96VADPqaFx1OkVlT+g2W7cwiUrvaRaQK9xD1r3LTwenie5zO0IiERBg7n1aF8U0JHoRy7B8lQjNhLPh7XXHgoPayw71aOvzDlV1LhnzRJfTyjYhHV9RTTt7/eSYeOPqE88Taq8IQz44xWhWZFwfyCTKg7sKDAdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KCWviqFMdNQagLzLMQgOGdmkLyEAi4hWbnVzAq/k9A=;
 b=S+qlOwI31z/mhkkDyjBuKO9wDSbqSwWBuzCgXeP49VfYeDX5IiaHXxzXRIVrk6TYKSjus8qA4HlGknEb+fauZWp//ZGfZp11Jb0X2/UIGKpQfkR3W5caZWhaeJE1Pb2Shos3ZvvRvLoD2kRAx+XBmMRGhCJbXf/nQdPbrHahIMU=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by KL1PR03MB5539.apcprd03.prod.outlook.com (2603:1096:820:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 03:12:26 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::dbf3:d56:46f:ec66]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::dbf3:d56:46f:ec66%5]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 03:12:26 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@google.com"
	<fshao@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add
 documentations for VDOSYS1
Thread-Topic: [PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add
 documentations for VDOSYS1
Thread-Index: AQHZmQcNHWj/4EL6PUCH4oZXYjOyda9+8JsAgAFLb4A=
Date: Thu, 8 Jun 2023 03:12:26 +0000
Message-ID: <9db76b20dcd87d0406e8b26f14436431126d27fc.camel@mediatek.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
	 <20230607061121.6732-2-shawn.sung@mediatek.com>
	 <85713602-dfe1-c90b-174b-3678d91369aa@linaro.org>
In-Reply-To: <85713602-dfe1-c90b-174b-3678d91369aa@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|KL1PR03MB5539:EE_
x-ms-office365-filtering-correlation-id: 55f75815-3e7c-48e1-b0fa-08db67ce2f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qIhyNMhEFkXInesKMHQnz5tzddebg/2K+ShunSzvmdM8g7LpYkVu0/sn8GbHMqVza0tCxt/HGsHSBj0Dnh68vVKCc+Juu28Oek4D9uvUciiX79osZGDsb5znyeTC811g2yPvvpnjmomHzllzzE8ScMf/vmY/i/U4xTXW+YEooZdqI7nl6JxfanlVFfbXKsMB/snwHP2610VeFQ4Z6vkrBNCPxWJcKyoMyp/mSYWBhLNHzZq3vwMfk+ejjV7XqoxWnYQAziHUDV8eL7FoVU/MfCqWXCWimWqU0mA4TRftBSeCzOeOkoAyC/yYiFjFG5BqOoj836FfcfJy0zycClfKlv1HTpPqzABCVeOqw/QdyiSqo3Eb3VOJ2/X17TMqWWxn4VEtoQlUdWKz0AIncVGsefcKTopgmW+0tRKTF+2v9NKxtaODYWkh5EI0ETkdDDkJxIdX7SfZl/kh5Q0lLPfeAB/KvykrXnsfUmMKiX5Nl+TFWC0tt/6EUW/JpFvQZG4uqWvabNQHsdWd1kBkm9kslY2qtc4w7cg4xXtqpEsMZ2tQqtpS+GOrfn3rLP0a4DnNtkQ5aYQktkH0/gCanHszth7A5SgTH406hxyOzXsURbs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199021)(76116006)(66946007)(85182001)(8936002)(8676002)(5660300002)(36756003)(4326008)(71200400001)(66899021)(66476007)(66556008)(64756008)(66446008)(110136005)(54906003)(478600001)(316002)(6486002)(41300700001)(966005)(38100700002)(122000001)(53546011)(6506007)(38070700005)(26005)(6512007)(7416002)(186003)(83380400001)(2616005)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3lSQ0lzaTY0WGhtdlJXVDZyME0xUTU1MlA5aEhZWGNXaGprZHBLUDRMQWho?=
 =?utf-8?B?VXJHMnIvTlAvMEZBbForOEJOM0tuN2dmbEdjRUNLOGtyRnUrTUpRMEVLUVNn?=
 =?utf-8?B?Nm13TWVIeXJKSWs4UG9jUDJPWkJKQy9PQ2lWWkVVZHJwL0NpTjVwcjR6ZnY5?=
 =?utf-8?B?Qk9CTTk5QTM1dk51T3BqbktpbTBtRXlwMHBnL3VCWHdPZ1oyWGdtZUU4b0dU?=
 =?utf-8?B?MmNWUWFpN3hRdlFZV0ViN2dNeWVmOVRSeFpGOVRiUWdUKzhJQm1TQmFMUHor?=
 =?utf-8?B?ais3Z0VIQ3JjYzlUNnBKQTJ2cTZ4RUlLWjR4cGlyQytZNGhnWUQ1TnBxVVNN?=
 =?utf-8?B?MUwwT0ZwSXBVU2ZYSmRhQ2JlQ1dseVpCb01kNzUxQyt1bUFSc25pTjlBMk5q?=
 =?utf-8?B?ZUZEaEM5M3dOYzdpWHh3bVBSNU9jY0wyTVFZalpIZjI1RUJTRDJIZXdYY0xZ?=
 =?utf-8?B?eUE4RzhJdm9YZXRMMEt5eEp2eTAyUEM0a1RLRHBTL1FkVFkxVVhvMG1LZS9s?=
 =?utf-8?B?ZzNsWmZGL1NHZ0dQcWR0NjR0T1dMOE9xOGtSNlBVZjYvWkJGTjgrMkppb2Rp?=
 =?utf-8?B?U2p1TmNzN2xrbkNKQTEzUnNBcGRwS2VOakxnRVEwSDBOc3ZTT1FGZ2E0WXlt?=
 =?utf-8?B?cDFRZkhWVkUyb25HdTdaUHNscElpVU15ZDBIclhtNHQvUkxRVUh0VEhYUC9a?=
 =?utf-8?B?MW5JdGFySDMxYWlWSldHK2xVUG5aQ3BOY2FtR1VCRWgwOE5mdEhpU1hua0pl?=
 =?utf-8?B?VU9yMGZtNkhRbzB6cFlpOHlHemt5S2hqK0ZEOHcxM3JNL2krUUhZdi94ZlVJ?=
 =?utf-8?B?dDRMNzVlblJ4alJ6Z2NIZUZNeDFtemVNY20wV0NKbjJzeUZyNmsvTDRaV200?=
 =?utf-8?B?YTc2dEIwaWg0MGh6M05SZkdrUjB4L1AzbnRFdjFyRm5DYUN0dmx0Y3pjbXg3?=
 =?utf-8?B?amMyWmR5ZHh2VGNPQnFQVFcvSVBBY2F2czgzZmM2bWsrQlpqS1dOTDRxeXpM?=
 =?utf-8?B?STlkd1NDMUtHSnpXYWtuZmJTa0dXZDdGSGxkd1R4RHpLbWMzK2RRWWNJSGJL?=
 =?utf-8?B?ODRhSFBRaXNvNnhXeUU4SU1IVVh2aEtvQVZzUUNqNlh1N3pnUGp5MHNrSmQ3?=
 =?utf-8?B?QnNuWGl4WE44VXhlV0F4N1BxQTluOVNVTUloYWZDMEQwZllKb3hTbWRVdUt1?=
 =?utf-8?B?SzA4R1Z2eDl6cFZYaGN5T0ZUZUsvZkxxTzR3ZEgvR21tZ2NrSlVBdXJQbGVY?=
 =?utf-8?B?M2h4a2tzNVFyYzRuVURWWW9nT2lxNkxoZjRVL1Z4bkxUV1pISTBxbmlrVWEr?=
 =?utf-8?B?ODFTZkR4b2ZFV2VPTVVhSXBYZ1U3RUNib0gyZHFoYThFckpQeXplWVRzNjJC?=
 =?utf-8?B?MlZMaFNybTg1WFZETUFXUVI5bUtjYVBYaEtFWjQ0YXJmU1RGVXRmT3lCa2l6?=
 =?utf-8?B?SnN1S1VsNENwZ2hTSUl5MllPOVV6MHhaQkVFMXd1Vk50SGlXaG1KK1NwYWpX?=
 =?utf-8?B?L2VoblRlL1hJaEZQWEd0cnpUOVZvbGc4NC9GdW1qcFFiTkc5U0ZMZXBkclZu?=
 =?utf-8?B?Z2pUWFdnRXlGOXpvWHFhNDl1SHlNUFB2citOY2lTWGQwMlJmWUxJR3ZDc2hu?=
 =?utf-8?B?aDltWERhVHF1VUhzRVJmOTNPRVZmSnQ5ZmVMRFpPRmhuK3VMR0FkKzNwZWRB?=
 =?utf-8?B?NFlkT1l3Sldad1hKalFDeFNycE4xUlBZaTlPdk5zQmEvWExWMlBwZ3F1OERk?=
 =?utf-8?B?NnBPcjlpaVAzbWJpUk1xcWNnNzh0OGd1dFAyQjB0WjBFR3FRV2I4UTRxelZp?=
 =?utf-8?B?SWU2NzVpKzNJUmg0U0dxY2x3U1BiTVppM0Rmb1R6cEN5RDUxMWtQb1VPaks0?=
 =?utf-8?B?cU0xNFNQS1ZITTdHcTFLNHIxcGMrM3dNZUNyTGpaSXJsYUtFK1hXcjNXNG5Y?=
 =?utf-8?B?bng3bWIrRVRtaG1RbFlqZHpxSnduaDJQWkpvbmdtNjdjQlBHUlZkVFBoRHpR?=
 =?utf-8?B?VStBMnVhVEFZbTVFcmlJY3VYamNrN1VwNmM2d1J4bzMybkorTFZRVkF1blBF?=
 =?utf-8?B?c0FNNzdaOVlCcFo1ZzFvV1BOVnBFS2tTUWdZNCtuditSbXd2c3FQcjJIbThM?=
 =?utf-8?B?U0ZvcEFJdTNidmhvcXVuclZCMUE4T0k1eTVqa0lRU0dRd0FlV3BRK0IwOEJC?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7B4C590B5E04E45971BB6A8FF4A2983@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f75815-3e7c-48e1-b0fa-08db67ce2f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 03:12:26.0191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q81NwcmA7DFS7JbtJMfryb0rzgDn6JCwgolcfuHuOiwNFWS8tQP23q+UVxccIx6KwtMNC95KMCRft+Cx2pIQcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_201235_093616_62B36FAA 
X-CRM114-Status: GOOD (  20.95  )
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

SGkgS3J6eXN6dG9mLA0KDQpTb3JyeSwgSSBtaXNzZWQgdGhpcyBzdGVwIGluIG15IFNPUC4NCldp
bGwgZm9sbG93IHRoZSBpbnN0cnVjdGlvbiBiZWxvdyB0byBjaGVjayBhZ2FpbiwNCnRoYW5rIHlv
dSBmb3IgdGhlIGluZm9ybWF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMsDQpIc2lhbyBDaGllbiBTdW5n
DQoNCk9uIFdlZCwgMjAyMy0wNi0wNyBhdCAwOToyNiArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICANCj4gT24gMDcvMDYvMjAyMyAwODoxMSwgSHNpYW8g
Q2hpZW4gU3VuZyB3cm90ZToNCj4gPiBBZGQgZGV2aWNlIHRyZWUgZG9jdW1lbnRhdGlvbnMgZm9y
IE1UODE4OCBWRE9TWVMxLg0KPiANCj4gSXQgZG9lcyBub3QgbG9vayBsaWtlIHlvdSB0ZXN0ZWQg
dGhlIGJpbmRpbmdzLCBhdCBsZWFzdCBhZnRlciBxdWljaw0KPiBsb29rLiBQbGVhc2UgcnVuIGBt
YWtlIGR0X2JpbmRpbmdfY2hlY2tgIChzZWUNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dyaXRpbmctc2NoZW1hLnJzdCBmb3INCj4gaW5zdHJ1Y3Rpb25zKS4NCj4gTWF5YmUg
eW91IG5lZWQgdG8gdXBkYXRlIHlvdXIgZHRzY2hlbWEgYW5kIHlhbWxsaW50Lg0KPiANCj4gPiBk
aWZmIC0tZ2l0DQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZw0KPiAueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpbmcNCj4gLnlh
bWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGE5
ZTc0Y2JmNmRjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpbmcNCj4g
LnlhbWwNCj4gPiBAQCAtMCwwICsxLDgwIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiAr
LS0tDQo+ID4gKyRpZDogDQo+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBN
ZWRpYVRlayBQQURESU5HDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+ICsgIC0gUGhpbGlwcCBaYWJl
bCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+
ICsgIE1lZGlhVGVrIFBBRERJTkcgcHJvdmlkZXMgYWJpbGl0eSB0byBWRE9TWVMxIHRvIGZpbGwg
cGl4ZWxzIHRvDQo+ID4gKyAgd2lkdGggYW5kIGhlaWdodCBvZiBhIGxheWVyIHdpdGggYSBzcGVj
aWZpZWQgY29sb3IuDQo+ID4gKyAgU2luY2UgTUlYRVIgaW4gVkRPU1lTMSByZXF1aXJlcyB0aGUg
d2lkdGggb2YgYSBsYXllciB0byBiZSAyLQ0KPiBwaXhlbC1hbGlnbiwgb3INCj4gPiArICA0LXBp
eGVsLWFsaWduIHdoZW4gRVRIRFIgaXMgZW5hYmxlZCwgd2UgbmVlZCBQQURESU5HIHRvIGRlYWwN
Cj4gd2l0aCBvZGQgd2lkdGguDQo+ID4gKyAgUGxlYXNlIG5vdGljZSB0aGF0IGV2ZW4gaWYgdGhl
IFBBRERJTkcgaXMgaW4gYnlwYXNzIG1vZGUsDQo+ID4gKyAgc2V0dGluZ3MgaW4gdGhlIHJlZ2lz
dGVycyBtdXN0IGJlIGNsZWFyZWQgdG8gMCwgb3RoZXJ3aXNlDQo+ID4gKyAgdW5kZWluZmVkIGJl
aGF2aW9ycyBjb3VsZCBoYXBwZW4uDQo+IA0KPiBUeXBvLCB1bmRlZmluZWQNCj4gDQo+ID4gKw0K
PiANCj4gDQo+IA0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAt
IHJlZw0KPiA+ICsgIC0gcG93ZXItZG9tYWlucw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBt
ZWRpYXRlayxnY2UtY2xpZW50LXJlZw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTg4LWNsay5oPg0KPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE4OC1wb3dlci5oPg0KPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxODgtZ2NlLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvbWVtb3J5L210ODE4OC1tZW1vcnktcG9ydC5oPg0KPiA+ICsNCj4gPiArICAgIHNv
YyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgI3Np
emUtY2VsbHMgPSA8Mj47DQo+ID4gKw0KPiA+ICsgICAgICAgIHZkbzFfcGFkZGluZzA6IHZkbzFf
cGFkZGluZzBAMWMxMWQwMDAgew0KPiANCj4gTm8gdW5kZXJzY29yZXMgaW4gbm9kZSBuYW1lcy4N
Cj4gDQo+IE5vZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuIFNlZSBhbHNvIGV4cGxhbmF0aW9u
IGFuZCBsaXN0IG9mDQo+IGV4YW1wbGVzDQo+IGluIERUIHNwZWNpZmljYXRpb246DQo+IA0KaHR0
cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2No
YXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2VuZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlv
bg0KPiANCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtdmRv
MS1wYWRkaW5nIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYzExZDAwMCAwIDB4MTAw
MD47DQo+ID4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmdmRvc3lzMSBDTEtfVkRPMV9QQURESU5H
MD47DQo+ID4gKyAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxODhfUE9XRVJf
RE9NQUlOX1ZET1NZUzE+Ow0KPiA+ICsgICAgICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJl
ZyA9DQo+ID4gKyAgICAgICAgICAgICAgICA8JmdjZTAgU1VCU1lTXzFjMTFYWFhYIDB4ZDAwMCAw
eDEwMDA+Ow0KPiANCj4gV3Jvbmcgd3JhcHBpbmcuIEl0J3Mgb25lIGxpbmUuIFByb3BlcnRpZXMg
c2hvdWxkIG5vdCBiZSB3cmFwcGVkIGFmdGVyDQo+ICc9Jy4NCj4gDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCg==

