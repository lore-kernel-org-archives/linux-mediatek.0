Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38193C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FHoQY8wPN7A+w/ZzqTHRtoV0g10yhSU7djeYrlH0w4=; b=ebOqsTQ8uZpHq1fS+xwPwp9Yqa
	WjGqdIfQNu2iU1Xx7vQdPidETeU1ndCb9dGr+g0zEqwDXklenoE9MlmBFHPM+HTwn9weDpXQZJSpT
	G47fNee55eNcp6cERBDexImZuDQSvevIQP1K96mZyVNuIk6Ur98Da3e33A1h0PwV9fo/tWII3qGqD
	ca2AW6UF2cch9e7FK1tjRfMFzNOTWalhPFsOu76q8GdWbVYLffwC5alozK8YSuaW0PxPjRtjiweO5
	lIy8GXw8NfEKTfXuRfRwe7hHsqvMEu2kU9R4HdjruhY1PMbEQBFd3QX4Xq9ujo6vz5F85KxzL5VkA
	JBXDFFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzfX-008bsF-MA; Tue, 29 Nov 2022 12:24:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzfK-008boz-M3; Tue, 29 Nov 2022 12:24:48 +0000
X-UUID: 3b1711e4ba76490dba8a7b613f65aeee-20221129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+FHoQY8wPN7A+w/ZzqTHRtoV0g10yhSU7djeYrlH0w4=;
	b=V4yjnFXOVQWiTo0Jzi+rXCbLCfdwTC/gsHrugJ1dGFGkSBHdaip4bvU/Z/lz7Kpf/5HoNzbve6m9fp9euWMGxuTqXFdnZQ9PNJS+YhA514hXo5+odi+8xmcNdo4LWFVOyPaa19OT/N2IHWdSNyeu6wkw5NR/MMmgOSZvoadSUYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:9b3d761d-f661-4459-9c02-a5a3a0bb4657,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:b156a11e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3b1711e4ba76490dba8a7b613f65aeee-20221129
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <henry.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1624551499; Tue, 29 Nov 2022 05:24:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 29 Nov 2022 19:54:03 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 29 Nov 2022 19:54:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJI7FECAPjSFUUN8jlXVlDxaI9Gt17FF0aICIIz4IRzthW/43oE28JjO/1xUH/LBcE4vggvqn2GPd/8i09x9RhjcuB+poat88CFF6rPzuHCalcEhmsut0Q2Bo5Udor9T5mqdbXnc30POHo7Skw5WpE+M2D+nH34u44S16DAZzeO4OPYVAjXQoYekR9BFzAYCQWlbsyMVon6J5zoNar6xdQyXOHfRj1fNmbYyZdBExtCTavyPY3QxUTRaLhWGJeAqmtBW+Qru065sXiPUZ2haK7byGlV9nXpmizxGZcugVhRVSnV5H5AZq6zKtUR5HTSu3bWd5sHJ+GJwCd+qwzt35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FHoQY8wPN7A+w/ZzqTHRtoV0g10yhSU7djeYrlH0w4=;
 b=PykcwaEKFLz4eJgQh9OKZOtvq/Oh7HJzhs1REQzevAp87+bOd/+DlA1UKOC76lne+KbmgPaXzZ2Yqq0uh3aeXhAhW47Y8MZavkmbh+tbEYMB+yE+4oKdj8iw/Vl/dagfSIn9KqyiW5FzP2/wyFLp/OYRKr4okr0QbRqX/9P70PNjY4rvaCKit+3lPTuWjNBPlc+PoVa4ixdFHX54Qa05+NTVnrQIAHO2qD910WvQdc2r57VyuLGESWPJ5LqzH2VjLqHHrEIafQZik2MyyooZXg4COjB2Y3nRiHx38SfCgV8G/TLFCcYSdW4rKxnZdy2zaghr4RyBOdiXcdlXSVk8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FHoQY8wPN7A+w/ZzqTHRtoV0g10yhSU7djeYrlH0w4=;
 b=fXChjhfAl9YLwnK0bn37sRHfJqA9bQf9IN/lOs7qj3Xc/umDR+I9YeKZSDXJmVtwPlxT+ARoPXFPlr4oQAVmpaqa4DZP2Db/9jJANZ2orwf1rpCbiksjC263Dl+gD1HKlLBLFZ1YB2RMMPxuFor9XcRIIRpzBoKL4Ud4lxWgkro=
Received: from SI2PR03MB5723.apcprd03.prod.outlook.com (2603:1096:4:151::10)
 by SEZPR03MB6643.apcprd03.prod.outlook.com (2603:1096:101:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 11:53:59 +0000
Received: from SI2PR03MB5723.apcprd03.prod.outlook.com
 ([fe80::51a8:a88:b4f7:c4c7]) by SI2PR03MB5723.apcprd03.prod.outlook.com
 ([fe80::51a8:a88:b4f7:c4c7%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 11:53:58 +0000
From: =?utf-8?B?SGVucnkgWWVuICjpoY/kv67muqsp?= <Henry.Yen@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "amitk@kernel.org"
	<amitk@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>
CC: =?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	=?utf-8?B?SGVucnkgWWVuICjpoY/kv67muqsp?= <Henry.Yen@mediatek.com>,
	=?utf-8?B?WGluZyBGYW5nICjmlrnlhbQp?= <Xing.Fang@mediatek.com>
Subject: Re: [PATCH 1/2] thermal: mediatek: add support for MT7986 and MT7981
Thread-Topic: [PATCH 1/2] thermal: mediatek: add support for MT7986 and MT7981
Thread-Index: AQHZA9k1v3hWgNbfhUSQrgvRAUAo2K5VytGA
Date: Tue, 29 Nov 2022 11:53:58 +0000
Message-ID: <997af7f23e4cf174b6fed34abfed9c972c50ff77.camel@mediatek.com>
References: <20221031230748.xRL1SJX5PchbqyD2hxlXVi5XiA2L39VKuLCwNxdN6uc@z>
In-Reply-To: <20221031230748.xRL1SJX5PchbqyD2hxlXVi5XiA2L39VKuLCwNxdN6uc@z>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5723:EE_|SEZPR03MB6643:EE_
x-ms-office365-filtering-correlation-id: f488d885-d28e-44fd-ab85-08dad2006671
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KfMHozNkvJd2+1xkv9Ki0X835/FbwNLXRd+kj3k0WtnyQYQEdhQsqcSl44XHlZSbPKv/y7kP2122kAy98qycaR5X0tRhfJZ9TmJvj7t1Rhll3cFgtFJDImZR4fUQGnYu/NgJS1vk94o6msRPe615yBVsQYxd3eSsSvP9GqSaTWt6McXdMC/6S2ktvwNH5lo9r51RJWRTETajf/kXF0btkzfqHscV5nPewVB+VNNJtSsb41JItsHVMoMPhWEkeu2FtMQ1HkEc3aTCwsbOp1wmKdFf7ID3kw2YFcB0aDRkEbteaYy4IqN/7Ob3pCSJ9uuoFZSMPhsxZcMgAbLTk7aFDcBO9x3N0HkeT6hU+/2IxmidSbbKdTjcYgfp0PYN/fa3rwDKvzfU2nxKeUFG2afYAMGP3MJuQ0k13YQnqiEUSTQ2bJEXbF804m8YHaSxcQE1iECu1bFIPXBYgqziqmVqzcRkTfA29FkQRzldgJQChB8cJdFE5UvxnEZA2v4FV2mi5pUJuS4Yuy2i91prWDz+1qYG4GKurVbGcrZJD0TSQOZBqqkuyyTkYWqPh9uORV+cN/z1SzOhRD+wc9MvyuwvVerEZf2oMDFW6kcwwl7+ak97cMltWhmJ4O9dMIaUJXNZfCjXAlW+WJAaVd1LFnq6kmOO5SUHvgHwMZSFvfgO9RopLQczCcXjTqO0yx4+DG6ZZofvUbZTeJ4UEdGNVynaMbAlMM8pcu+lkmgOlMhwcKpQicxUzgAFL4kC6IvfbXNeljOBPpG6CrsQFxK/k6iacdlio2+SWdhfx9DS4PH1QL4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5723.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(2616005)(186003)(107886003)(5660300002)(86362001)(41300700001)(122000001)(85182001)(36756003)(4744005)(66476007)(66946007)(66556008)(66446008)(38070700005)(64756008)(26005)(6512007)(6506007)(8676002)(966005)(8936002)(4001150100001)(6486002)(38100700002)(478600001)(7416002)(4326008)(71200400001)(54906003)(83380400001)(76116006)(2906002)(316002)(110136005)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzJpNDJQNjkyTjBvR09tOWpKUkc1ajgwNUdjTDVaZmR5Q2t5MmZNcGxET0I3?=
 =?utf-8?B?bFhFcXR1bDJWNE1KL2dxcW5sMlZaa3ZmR3FmMTBUNXhhZFBURzY5ZXEwWE9M?=
 =?utf-8?B?ZjIxb1I4NlJ1d0lyZm9CT3A1bGJtL09NSGpFMnRwT0NUL1d1R0ZaM3hQbnBs?=
 =?utf-8?B?UjJ0S1Z1ZDhzWERINTBFM3h1Nm1mTVRhYnZsbXFDSzZRMkxIVkJmdUwrb25K?=
 =?utf-8?B?MVdDL1JzaElhU0c0N2F1VlQySnlOdFRMbk5nNnRML1JORUdjdlYzWDJqSDYy?=
 =?utf-8?B?cGdPTkJHL01VSi90MWNxZ3NvYmZ2ZTdGekNTOWlJdnBmODlmTklWRDFaMUxr?=
 =?utf-8?B?djdyYkx6Z0UwbGhlWkVGYWZWd3g3Q1dGcE9XZWpDZTM4bzZNeGpTNVFtUTEv?=
 =?utf-8?B?a0ljbkNMMUZuc2poNldDQU9IdTlqdVFPVUE5UEdRTWc5SXVSSTU5Q1BPMXB4?=
 =?utf-8?B?SWdlYUN4dDZ1VitWSTBSMVp2NmtIR1laRlJwVFFieFFJSzRYVm5PUGFFZXM2?=
 =?utf-8?B?WXE0K0lJNWFXaFJOa1lTZnZ1a0hmQzh0ZFlxVHhEb3A1YUUzV3hFS0p0RWtF?=
 =?utf-8?B?QUloZDl0V3JEL1hUOWJJQjBBZ1M0SFJsQ1BNQ2JYb0lkVEhIaS9KVDZzRE9l?=
 =?utf-8?B?SWJyMWptTHZTbzJWSTNJUnYwY1JKVjJBTnFOaDdjVWRvbTUyaGZaRHFHbHQ1?=
 =?utf-8?B?cVpUdXVqTmZVdkREYVpnUVpvcTJUbjhkaFBKQWpyOGdTamE1bGRBTWwzQkdK?=
 =?utf-8?B?Q1V0VlFjV0pOTjd5WVpDNXlRNEFKenNraEpUSjJXTnkvZHk4YnZPYUlNTEpv?=
 =?utf-8?B?VUxoNkdlNlZicEw2aEdWMVZhblorTTVRdkpORDJkY0hHNEVlVVBJWWttc1ZE?=
 =?utf-8?B?VXhtQ1ZEZnFlaExWRVE5MzNvN0xvWFJ0SG9hL3dKMXdYUWN6UXBKRGlCUzBR?=
 =?utf-8?B?elVPZmkydTVBZTFtazZoV1JwdDlaZWVCYWJIeFhRZFdDTnBKcHlYdGlQcFht?=
 =?utf-8?B?WVJhQjVnQStHNHRONm5QYitVaWFpeXFwRHYyOU9CbmU2cFIwMjVhTkpYQUFZ?=
 =?utf-8?B?R2hGa3U0MU9LNzZlSkgzaTR5TUQ3K2VjbG5sZDRLZ2hzVlBnc1NFWlJwRjZh?=
 =?utf-8?B?aU1OYk9SSnhzT2FVUWlPTjBSUDJUNEVsN2d3NVlzby93djdER1hUTVhnRFo5?=
 =?utf-8?B?dHJzWFZacWt3dEl6STNMZ0d6V25BaDBJdXdBUWloTDlZT29vbHU3S3ZoK1JI?=
 =?utf-8?B?aHY3M1JGRzQwTVk4RFNSdmZ3b3ZGZTljN3JqOHpZMFlYVXRPOXJsbjVZWSsy?=
 =?utf-8?B?cVkvekNSQVF2dk1kYlBOMlJWTlRLeExIWXFRUE1tNkl2Qk5uVGhXSFJzS1Fq?=
 =?utf-8?B?aTQ1dUduUmYvZmNmQ25yM2l2SjhPQ2MwZnloYWhrY05Bc2NzSERBcjVZZmJI?=
 =?utf-8?B?cGVKeUpGSVdRSUxWdTRXNS9lSDgrNWNvSElsSkJpREVxU3pmUng3TWhtdWVX?=
 =?utf-8?B?UzlWSXZPMHhZTkQwOXhSTFNTMHg3ZDFJM2UvdG9oNTE3eW1CV2ZkUXlOOGkv?=
 =?utf-8?B?bXorbjBrNW1DaEJSdTRQNUUralZWdEN4VDE3ZUZhN2VEQ0E1Q1Y4clYyQ3g2?=
 =?utf-8?B?bUlRQmJVVUJNLzluUThlZkhVckhUT0xYTUFtNkU0VWhoVVdXeUxnbGJLM25r?=
 =?utf-8?B?VUQ4a3RnaTZQdzljTCtaMThkV1pxZTg2bjhRRUtDRm0xVXVEbFBuTWFLbVJp?=
 =?utf-8?B?bnBsNURXRjQvdWwrUGlGa1QrYWU3SkNJbmZQKzBjU0MrZ1ZnZW5SSlNLTTFp?=
 =?utf-8?B?VXdlZjBmM1NWTjVaZ0dSRzBQOXZpZ2t2MjdZNlkwZ3UzOW9GTmcyRVRqVTVj?=
 =?utf-8?B?UDJ0L1NtaHBwQkFPeUFnVko5ZElyVW5IVXdIblhQV0xGUFhjcXVKSU03UHR1?=
 =?utf-8?B?dUplbE9SR2pSdi9mTEs5a2NaRWxNby9tSWU4V1l3NG9LR1FwRWxqclcvTzVH?=
 =?utf-8?B?WXczM2h5K0dSSit4aUlNcWpvdnNOYmtVdEJLQjZyV09sR1dmTDJKQzF1UzhR?=
 =?utf-8?B?WWhodWZBcjl3R04yRE5aZHd1MldSc1V3cnY5cGxrc0V4NjgvVDhYYlZNeExm?=
 =?utf-8?B?TDM3VHBjbnEwT2JsK0JGSlUrT1N6dlpZTGVsTysxR21SZGJOcW1jL3FURkI1?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1513C2DBAAB52F4689806045355F165B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5723.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f488d885-d28e-44fd-ab85-08dad2006671
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 11:53:58.6592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rk7ISrkZFbGVEcJLx3GmcSs/BSp31cfnPU1ktowoWBpcZMx3PwuRV6toxJRDOSeNKIAjqcSW6FfjeDDyls700g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_042446_753484_876CD839 
X-CRM114-Status: GOOD (  12.82  )
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

T24gTW9uLCAyMDIyLTEwLTMxIGF0IDIzOjA3ICswMDAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvbXRrX3RoZXJtYWwuYw0KPiBiL2RyaXZlcnMv
dGhlcm1hbC9tdGtfdGhlcm1hbC5jDQo+IA0KPiArc3RhdGljIGludCByYXdfdG9fbWNlbHNpdXNf
djMoc3RydWN0IG10a190aGVybWFsICptdCwgaW50IHNlbnNubywNCj4gczMyIHJhdykNCj4gK3sN
Cj4gKwlzMzIgdG1wOw0KPiArDQo+ICsJaWYgKHJhdyA9PSAwKQ0KPiArCQlyZXR1cm4gMDsNCj4g
Kw0KPiArCXJhdyAmPSAweGZmZjsNCj4gKwl0bXAgPSAxMDAwMDAgKiAxNSAvIDE2ICogMTAwMDA7
DQo+ICsJdG1wIC89IDQwOTYgLSA1MTIgKyBtdC0+YWRjX2dlOw0KPiArCXRtcCAvPSAxNDkwOw0K
PiArCXRtcCAqPSByYXcgLSBtdC0+dnRzW3NlbnNub10gLSAyOTAwIC0gbXQtPmFkY19vZSArIDUx
MjsNCg0KSGkgRGFuaWVsLA0KDQpSZWdhcmRpbmcgdGhlIGNvbnZlcnNpb24gZm9ybXVsYSwgSSB3
b3VsZCBzdWdnZXN0IGZvbGxvd2luZyB0aGUNCm9yaWdpbmFsIG9uZSwgaS5lLiwgZGlzY2FyZGlu
ZyAiYWRjX29lIiBwYXJhbWV0ZXIgYXMgc2hvd24gaW4gWzFdLg0KVGhpcyBlcXVhdGlvbiBpcyBk
ZXJpdmVkIGJhc2VkIG9uIGhhcmR3YXJlLXNwZWNpZmljIHRoZW9yeSwgc28gYW55DQphcmJpdHJh
cnkgY2hhbmdlIGNvdWxkIHBvc3NpYmx5IGxlYWQgdG8gaW5jb3JyZWN0IHRlbXBlcmF0dXJlIG91
dHB1dC4NClRoYW5rcy4NCg0KWzFdDQoNCmh0dHBzOi8vZ2l0MDEubWVkaWF0ZWsuY29tL3BsdWdp
bnMvZ2l0aWxlcy9vcGVud3J0L2ZlZWRzL210ay1vcGVud3J0LWZlZWRzLysvYmFmMzZjN2VlZjQ3
N2FhZTFmOGYyNjUzYjZjMjllMmNhZjQ4NDc1YiU1RSUyMS8jRjANCg0KDQpIZW5yeQ0KDQo+ICsN
Cj4gKwlyZXR1cm4gbXQtPmRlZ2NfY2FsaSAqIDUwMCAtIHRtcDsNCj4gK30NCj4gKw0KPiAgLyoq
DQo+ICAgKiBtdGtfdGhlcm1hbF9nZXRfYmFuayAtIGdldCBiYW5rDQo+ICAgKiBAYmFuazoJVGhl
IGJhbmsNCg==

