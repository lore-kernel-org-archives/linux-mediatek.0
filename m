Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919A5EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 04:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKCqMlWUdJ74eCGtSlMayq3+Cf1g4E/aAy3lflI64Vo=; b=op3szFrKoCdhytFd099G/hCn0S
	a6sJ8/z1uKlibUN76bui6h5hS5m8mxdGDLEHeUjkYHAW5EVDaLtKH3iA7nalmExT3jZkTiz2uqPCa
	h7rpx4lpZxxhID6kgL9srXn6F5DrJzoz38ys55OyNxGbEURNYwiMtfNUiDwm90hTfU3ozvz26u1J9
	XjpUkxjcxbKQ9kuHoBPFu64buvzDvbiquCtsPsBLDIJDqSJjG9rWGgPxe3Pl1csBvobTaJEIPGgHe
	bhGdzSSuN0xBNyzoQyMhRNJeNNpqzAI7ZCZp2m+wT8IA5fv7+fF+oQy0ZR86Pb5pP4USR6Hg+kSNf
	1QTt31QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAvq-009F4i-1L;
	Mon, 03 Jul 2023 04:12:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAvo-009F4C-1O;
	Mon, 03 Jul 2023 04:12:57 +0000
X-UUID: e030ff20195711ee83ed1395ce914268-20230702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WKCqMlWUdJ74eCGtSlMayq3+Cf1g4E/aAy3lflI64Vo=;
	b=u5OYFh6A9us8vRMYsBVddRwx2cgbXcaAnTJNvye3Q37z5+FbYlU9iilVeToxZQXwUEbrXPCvbBKZQXHYM6klc2Uh2OmYEoJSjRb+oueCVU8Xj+QBxrK1FVr8ayqGcRjM2Ad+lAnOnqPU8adMxfGIlhjGU09/wEO3vR5UOhiCQpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:45f3553d-f80c-4aa2-9d01-992539c9b245,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:01c9525,CLOUDID:893fc90d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e030ff20195711ee83ed1395ce914268-20230702
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1095832932; Sun, 02 Jul 2023 21:12:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Jul 2023 12:12:15 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 3 Jul 2023 12:12:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTU1i6JS8b9Ku+YndxMRBGKzc7YAyyqaqSbpfLDl8ZAwny+L1MsYodrS3mYqDY2DCOMLsvzfjzqO7IxzjuK0lcoZQ3maiTIhbrtOR0jksyY5Mbu7nQffwqC+pX986AFVywxKJbXMCDPGfmnhG8Gtog9ykS2h9FaS0OduWGe9betXcQQl51f/t9yfvjex66ET7oWhAwjMt7Zx72AAbk8M1wl8PJzG13JPJ7XpsddEbXBXEcXJ+TvT5iOm1fHTMCDZPb4iTe7J5uwexBMe3J+GSYb+cHFfM/K3ca0tdbV953PnxNiSnshUl4jkET6gKr/vFCE0Ie5FuGho6pDRrCNqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKCqMlWUdJ74eCGtSlMayq3+Cf1g4E/aAy3lflI64Vo=;
 b=TqLLbIRJ7N1jKAzv5g2rKj2Fvt9QN5//DFShQJ8aYjSvJN0VNt33qTIDzxJFM5PCyKvzPrYDVms6fb9pNCMZf3RslrERIxjbllp0u2ejHRbzQm0+g7ZpmetTBVT50vGKoXLHXM/VS89xUttJvDXlG68dnujqWBi+CE0EMde6hDGHk23DApHZgIZAx5t8aOMUthJXo2pFbJdLtRF9KzQ6sUfa989Am+6sCqq2QTTFMntNVZUFZmujtjTNdQ5NXf5UBnlKh+OH+8FxM0eJ9uwakkBIDfM1l5WgpImQBlVCwXij6uOAY+Wk3GQ92V7ctBXEf+59leKspjXLBSoRXm94tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKCqMlWUdJ74eCGtSlMayq3+Cf1g4E/aAy3lflI64Vo=;
 b=Fejmaho4rE8fuzI6WQ1etYqp4uWH5WRsfZXxHlj4b07fr2CK42LWKe3FHxicMnB6dE/Vj3rGwWTggBAPcY5n7aNbs8ywEx3BEQZco2AqNuGzEy/GNknYuQ58ulR/aKgt3xJNiQysC6/S1C4JUrIMgxZ/35+kkhz+5IMRJSkWzIE=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by KL1PR03MB7969.apcprd03.prod.outlook.com (2603:1096:820:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 04:11:12 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::6d6e:d439:f9d3:1098]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::6d6e:d439:f9d3:1098%4]) with mapi id 15.20.6521.026; Mon, 3 Jul 2023
 04:11:12 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Add a flag to indicate vdec_fb
 finding status
Thread-Topic: [PATCH] media: mediatek: vcodec: Add a flag to indicate vdec_fb
 finding status
Thread-Index: AQHZq/tdUnJwjXKeE0KkZqXSsj9GzK+ncNaA
Date: Mon, 3 Jul 2023 04:11:12 +0000
Message-ID: <4bd5aad43622742f1078f8bc4167803ed20f6a68.camel@mediatek.com>
References: <20230701090521.22240-1-irui.wang@mediatek.com>
In-Reply-To: <20230701090521.22240-1-irui.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|KL1PR03MB7969:EE_
x-ms-office365-filtering-correlation-id: 59974a44-ea48-4393-a87a-08db7b7b89c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X9IlyJ4j37b2MwvwfIEYi5tLpaRV3cCpdql6aBvyOcYDp+HuwnPyajK1OTWdUWEsHNGPHjI1EFShzaqmozMFlfyyn/Uk5ZYuG585IxwhIfMn8t9ExGlMxS5Zq+KsNMfNfN2auCXe/JInchz16C9YrSISFAM+C6qTBUNqVYA5w+0F2d33Of9GYmUng6VOTqxBXltHrZIf4g9bVFRYJrN7NEv5It40zQ7SV3eVqitFRQ3LGbOZvbPb2DR9l24crYu1FYiw+3QKG/IyEvmFhdNWZiUFjPtg+Vo53e7CyIzeN0YabcIdghNE2VIXUvWrPHIdQzcjFJLtEfrKRqqiPoYOwQ2kxO7cJHxVLomhP3aX0L2CgfBkDUOcff8ZBJjH1T70z1P+cInFy+E3hxn8w4O+dbWft9PjReQ9KGqph8AoNQ9UykTj+rgfjyRgSUEQBZ2U4aq/PoFw5Pei2JycHf1wfM+IEk2RcTZA7ASJnyPfUbGAIReVFn5WBuQO1Gq+6iVfgPRqsPIXeziI5qcrxpAM4W6UeGIWzaLMzF1KFmQtTzh8c3YL1Cae7bz231PdvMCgV7zotr/LTQIfRlRNvqcidtBrJTHN3r+d+sKg830v9DgPy2ieTkc29N8XLrCA++I+Mg8Thxye+kDU0P+fU6Si5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199021)(107886003)(26005)(478600001)(71200400001)(6512007)(966005)(6506007)(86362001)(2616005)(186003)(38100700002)(54906003)(64756008)(66446008)(66556008)(66946007)(4326008)(66476007)(83380400001)(110136005)(91956017)(6486002)(76116006)(316002)(122000001)(5660300002)(8676002)(8936002)(38070700005)(41300700001)(2906002)(36756003)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW5NK1NJdENsalkvdk9HWUFLNWU3UnNSeE9XRkJMWmFKL0dqY0QvTlh2OGhN?=
 =?utf-8?B?L0UyZitWRzQ1ZGorVHYvRkF3ZURVN29qL3pzZno3V0NndjZIc1E1eGdLbUtt?=
 =?utf-8?B?UlB1K2VSdXRNWUNoZUNiOHdWSkRTL0ZBcnJ0TTdLVFo4MmhIYkgxY3BBb2xQ?=
 =?utf-8?B?Wm5YYjUzSmxQWnhpcTNPU0N2S2pWYUh3UUNxQ3pQWHh4Z013NVJ2ZGpxTU5R?=
 =?utf-8?B?UXI5SjhEWGJ0YU9nMlh1NFhsTFZIcWs4OHM5ZGFSRjlJSk1IQVQ0elZrMmJ1?=
 =?utf-8?B?RkZFVWpoSWpBd1FOQW5GSGpVL3ZZTmNwODRjekxocWVmTkJCeUdkOHJtd0N1?=
 =?utf-8?B?OGFxRnhralIrV01EY2xacEwwdVNZRmZBYW5Cb0w5akxXTDdnQnM3NzNtRURN?=
 =?utf-8?B?WWxjWmJ1Q1ZhaDVtMllJUEFGbGREV2UxZWwyUEZkZWRnTE1mRXpFam5aK1Yy?=
 =?utf-8?B?VUovZW81SEVTMFhhZ0Z0b3lhZzUwcFFzYU4wUVhnVEIxVUEzeUFpZklTaGdx?=
 =?utf-8?B?Tm9JaDR3aStpOUpySDNNTktkV0lrbjQ5alBnSERySzlwMXhZdC9yL0kwWXU5?=
 =?utf-8?B?dFV0RUlRUTlIYW15VzFvVUxERjM4UlRYZUpNUHVhU2pmSnp1WDZtVkRNUkdJ?=
 =?utf-8?B?cEYvOU01aHB0SUVjaUNUcHhQVEZKUUlyWFozTUV3NllnNG1JVnhhTUpaU2lW?=
 =?utf-8?B?djZSd05WWUZvUVdDSW1rMVZLeXljbitNcjRUK1JyUlFnRzVIT2Nidmp2cTV1?=
 =?utf-8?B?ZmZ3bUtBQVZ4dVB6V0pKdzFuTkIvcCtvSjhlRUI3TngyMGUvVzcyZ2hWSU5L?=
 =?utf-8?B?R1JwRmZ4ZndEUkszVXlPd0xzWVZQNGJockp1MkxTL25EcW4yMGs0ZDBLcEwv?=
 =?utf-8?B?bG01bmRTYVREbGxNWmFEY2JRRVppelhzTmw5UDMwUTczT3FUaVlsdEJhVVVt?=
 =?utf-8?B?c2luQm1kMEl0VTBnUXNZV3lzalhNUUVpT2ZLWjArT3hvV0w3OTl4NWU3MG92?=
 =?utf-8?B?bnV6WTBCb1lCbGU4U1NrNW0yWkVvMjJYZ0U0QmJkWTdjTU9ZU3hFT3gvNWc3?=
 =?utf-8?B?NlBYWTdCQUlnUEpjZjREdGpOZEV2THdDR0g2dEdYQjF5ZHd4alBjMUUyNGZB?=
 =?utf-8?B?TDZ2TVdPK3hncWRVeW9veVl1bmhITnBXR2w5aWordmZMTS9VRE5EZVBhN1V5?=
 =?utf-8?B?SWJ6cmx3TzZxOERrN2tTbXpXei9oL21wa1dXYURseG1WMTFJTzUvcC92MXov?=
 =?utf-8?B?N21wQzhFVXYwejNBczF1MDJHM1M3aUszOVhFQUJYOVU0QjdObjB6NXF4bWhJ?=
 =?utf-8?B?R1JqL2JqcTRwWWxuTUt0QldFcVhjK05GRStNNjYxb0NzazlxMTUvUjFvcDJK?=
 =?utf-8?B?R3RVSDVtYlpjZzJTbUtsamNYL1VKVjREZHM3YXN4WTNoMStIQUtLUEF2TXFO?=
 =?utf-8?B?NllPR0hRcHFUZTZFWDdEM01LN043UjV6b3dRejR2RE1MTFJoZis4ajBSa3hz?=
 =?utf-8?B?d000dW9oL29lWXd0NzNQQ2svM0RFbzhPSUN5NXp5emxvN01HeWRMMTd2QS9o?=
 =?utf-8?B?VFFSS0RyUStJcU9ETGtsaXBucHRHaFlESDdDd25tUDBCNXhJUU1pUk5MWGxj?=
 =?utf-8?B?bktLdDlLZFNJUVZ1VjNZVi9Qc3JlVVpJN3VMcFJuSHhuSFJkbTlQQjI5Z0dH?=
 =?utf-8?B?NVgrK2RMSGxITmxOem51WXlpenY3clFnZnBUeDBWZGVpM1pHSnJuUnBSeXdL?=
 =?utf-8?B?YzkwSVplZmxNMFJVYTF0Q2I1bnc2U2JSNUxaM29WWVJnOUhTMko1V2k5cEU4?=
 =?utf-8?B?U21IeWh2aVoyNXNiZ2R6MEFIdHVKMGNBU0o1SVZaY0Nwam1lTXBFdjc0T3BH?=
 =?utf-8?B?dEU4VTQ5VUdONEU3S2hSemh4cC9FTm5qSUdrMmhpOFdaZTE4RVlqTzNyTUlE?=
 =?utf-8?B?Y2kwa2ovNm1ZMTFlZXlycUxlOC94MTB1WiswYjNhTTBaWGdrQmhUN3hCSUUv?=
 =?utf-8?B?MUxZQ09DSmRUOTFjTjlsSEdjUjJ0aW05c2UyelJrVVI4RnR6K002NE5VazBx?=
 =?utf-8?B?MFRncW5pSUxxU0E3Qk9aZENHaUdRVkE3Ylp4ZFd4SzIwU1pGeEhackM1eHE3?=
 =?utf-8?B?a2VDWWU1MXpCRG5xbmQyV1ZoYVpuRkVnMjRINHA2Ly9BcmVXMUQ5aHQ0YkdK?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAE922CB29ED194983D1FD4142924CDB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59974a44-ea48-4393-a87a-08db7b7b89c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 04:11:12.5352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDgiwquo6uDePPZR14P4cF+LpO3DLJVMHwbr5SQguZhl6YK5iSP4KT13+u45Nbd/z+PJIsz3Dxe0tRrqOczAYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_211256_478467_4B325396 
X-CRM114-Status: GOOD (  18.11  )
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

RGVhciBhbGwsDQoNCkEgbmV3IHBhdGNoIHYyIGhhcyBiZWVuIHNlbnQ6IA0KaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2xpc3QvP3Nlcmllcz03NjE4OTIN
Cg0KY3VycmVudCBwYXRjaCBpcyBzdXBlcnNlZGVkIGFuZCBjYW4gYmUgYWJhbmRvbmVkLg0KDQpU
aGFuayB5b3UgdmVyeSBtdWNoDQoNCk9uIFNhdCwgMjAyMy0wNy0wMSBhdCAxNzowNSArMDgwMCwg
SXJ1aSBXYW5nIHdyb3RlOg0KPiAiZmJfdXNlX2xpc3QiIGlzIHZwOSBzdGF0ZWZ1bCBkZWNvZGVy
IGRyaXZlciB0byBzdG9yZSBjdXJyZW50DQo+IHVzZWQgb3IgcmVmZXJlbmNlZCBmcmFtZSBidWZm
ZXIsIGFuZCAiZmJfZnJlZV9saXN0IiBpcyB1c2VkIHRvDQo+IHN0b3JlIGN1cnJlbnQgYXZhaWxh
YmxlIHRvIGJlIGZyZWVkIGZyYW1lIGJ1ZmZlci4gV2hlbiB0aGUNCj4gdGFyZ2V0IGZyYW1lIGJ1
ZmZlciBjYW5ub3QgYmUgZm91bmQgaW4gImZiX3VzZV9saXN0IiwgIk5VTEwiDQo+IHNob3VsZCBi
ZSByZXR1cm5lZCB0byBwcmV2ZW50IHVuZXhwZWN0ZWQgZnJhbWUgYnVmZmVyIGZyb20gYmVpbmcN
Cj4gcGxhY2VkIGludG8gImZiX2ZyZWVfbGlzdCIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBJcnVp
IFdhbmcgPGlydWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX3ZwOV9pZi5jIHwgNiArKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQNCj4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMN
Cj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfdnA5
X2lmLmMNCj4gaW5kZXggNzBiODM4M2Y3YzhlLi5lNzdkNWEyNDUyYzEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY192cDlfaWYu
Yw0KPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3Zk
ZWNfdnA5X2lmLmMNCj4gQEAgLTIyMCwxNSArMjIwLDIxIEBAIHN0YXRpYyBzdHJ1Y3QgdmRlY19m
Yg0KPiAqdnA5X3JtX2Zyb21fZmJfdXNlX2xpc3Qoc3RydWN0IHZkZWNfdnA5X2luc3QNCj4gIHsN
Cj4gIAlzdHJ1Y3QgdmRlY19mYiAqZmIgPSBOVUxMOw0KPiAgCXN0cnVjdCB2ZGVjX2ZiX25vZGUg
Km5vZGU7DQo+ICsJYm9vbCBmb3VuZCA9IGZhbHNlOw0KPiAgDQo+ICAJbGlzdF9mb3JfZWFjaF9l
bnRyeShub2RlLCAmaW5zdC0+ZmJfdXNlX2xpc3QsIGxpc3QpIHsNCj4gIAkJZmIgPSAoc3RydWN0
IHZkZWNfZmIgKilub2RlLT5mYjsNCj4gIAkJaWYgKGZiLT5iYXNlX3kudmEgPT0gYWRkcikgew0K
PiAgCQkJbGlzdF9tb3ZlX3RhaWwoJm5vZGUtPmxpc3QsDQo+ICAJCQkJICAgICAgICZpbnN0LT5h
dmFpbGFibGVfZmJfbm9kZV9saXN0KTsNCj4gKwkJCWZvdW5kID0gdHJ1ZTsNCj4gIAkJCWJyZWFr
Ow0KPiAgCQl9DQo+ICAJfQ0KPiArDQo+ICsJaWYgKCFmb3VuZCkNCj4gKwkJZmIgPSBOVUxMOw0K
PiArDQo+ICAJcmV0dXJuIGZiOw0KPiAgfQ0KPiAgDQo=

