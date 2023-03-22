Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D0C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkAyObfBWvpmO3MTih/t4Sj8wL6a2RURSnjIbGgTIbQ=; b=SdRpd4HdPewHR/8+vrCZUcqdfz
	x5/DHbYSWFy8CBFO4MHSifgbycsunYepdG2UEIPSsp5kc7wuPx4Yj/H2yv9L/ZrK5fF3/WDSURLsn
	1bqNS3pwzdnQfCQNPK0Dh2/KA+ZFaMHiAvdTgAnaNt2x4eS5WE/CAH5Fyd1l24txdtQyfhJER14um
	GQm/YbRKfa566ldnzFIMFA8fKmU6Hw2fJJ5MIGMK0nEs8L/J0oqrUn7WZBZk1HJIzO6Ltbg4vLyJ1
	CsvkLgw8i9nJzGr/zSttW8fyjcGVEtwKvvoHGizuq4Hxaxmy6bhfyDgO+i8RlbdtiMJsa6t3mQoRA
	rJ6/hy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peuuE-00FSjC-0L;
	Wed, 22 Mar 2023 09:37:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peuuB-00FSgt-0g;
	Wed, 22 Mar 2023 09:37:17 +0000
X-UUID: 1eb6f768c89511ed8687db9d93187ff1-20230322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=gkAyObfBWvpmO3MTih/t4Sj8wL6a2RURSnjIbGgTIbQ=;
	b=fgzXhnG3zZ0cUuYi+znjWLNjLQheko2W4mCuIu3wHXtgKRHm/tz3UZm934FN/ItSN5XtGXLrevkYUXAOt+uDsOVd8hbxA8HEjPQGbwA7dO9gwjtLlDOP5IJDcyOKTGSzLwO7uvAk5coRYb1rzLpY3vxTSzgk9KcCsk7XweDn7iU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d8c7e957-ed1d-4bb0-b947-a58498bd9c19,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-29
X-CID-META: VersionHash:120426c,CLOUDID:003805b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1eb6f768c89511ed8687db9d93187ff1-20230322
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryan.xiao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1977684437; Wed, 22 Mar 2023 02:37:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 17:37:08 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 17:37:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzfnAG8WFrAp78lYFNdtpxpDlTXMvEYXMt55YZP/KCFLgoYAvqRGV50iQH2H9GvCdFu75UXFbMxB4yVscAknDFuN2ayZs4ozQzbXZdhA7AFaxROFLAkABgUfVfUjMnAMA1sroJgNCLDTpnQ0ftaVtmIyAJEKaknT1jA2ZWru8oaMPUe3UQMzgSYlWUaoax4iJdWT+l0Ykxdc32FPKHua2CKvPPJ0bUxonHuECVcDk6bXNk4mZ8xT97lOp9IucQao1HwyjewZizGgGdkVVI2z0ox3FIp1A+A7RCdaD8UjrVHzYGcQ3llObN+9UBF133v/G/pc/5UyEjIeGhMeH/YR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkAyObfBWvpmO3MTih/t4Sj8wL6a2RURSnjIbGgTIbQ=;
 b=giDgOHNyF5RgltpaUuUKp+45NzG4uKGGHPEkXBt33Nlb8XAmOuZ83jtdJ/LqsPh4LFGucAJIr2FLluJvG1759mlBnlc9xJBSUO15jJtJM97IYYjNgb98+G84K9pGyxMwsLZpmmM20p5XqnBlx+WG+bPvWsmD0ba7jS9ETS7r2jA5zXpyrgSXjJ67SIToz6LdzUomKJ92IvfME+D2pDbQQUPXtUtzIlkA4KjmNmtj8ORw0H/wU0taoAAKeD0ZsqPMaUj+0NJzzVs2yQCPpNVU67PwH0UhhZGMxPST443orzbG1GzJHC13ySTJRHgi3QGDSgClF9I66erCSCSfHl7gGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkAyObfBWvpmO3MTih/t4Sj8wL6a2RURSnjIbGgTIbQ=;
 b=G7OOqRj89OIHv5vDSsfRRBY++ezY4RpzLFPhyBGqTWrdNTwHoaqL5gwBjuwheOPDYZVvPFfq59O8XG1l1V0UWryeUKzE50QB8WaKBpcc3yqmQXE6bVbPzKJkhMgrm3qiYDt5/eqIdJBYEGvtEQAA5D53chBOp4VQhJq5OIoTi7Q=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR03MB5836.apcprd03.prod.outlook.com (2603:1096:820:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:37:02 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::f497:1db:7e78:fcfe]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::f497:1db:7e78:fcfe%3]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:37:01 +0000
From: =?utf-8?B?UnlhbiBYaWFvICjogpbmsLTmnpcp?= <Ryan.Xiao@mediatek.com>
To: "tj@kernel.org" <tj@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "vschneid@redhat.com" <vschneid@redhat.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WW9uZ2p1biBMdW8gKOe9l+WLh+WGmyk=?= <Yongjun.Luo@mediatek.com>
Subject: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Thread-Topic: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Thread-Index: AQHZXKHaCEisPEX/hka7ctaBtar8UQ==
Date: Wed, 22 Mar 2023 09:37:01 +0000
Message-ID: <a578623ecbae88433876381d3b28ec494f479ab3.camel@mediatek.com>
Accept-Language: zh-HK, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR03MB5836:EE_
x-ms-office365-filtering-correlation-id: fb54c432-576e-4710-0f7a-08db2ab8fd61
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSjEIrzWtitCDgAHoDlzHgh3SRR9eYXJWf+7XX9Xoa9/b41RpEs7/2QNyEYR6dbRtjYDtrpEeBShXCcVcppr29sPJdj3oHHFK7SCHnYS4CoHOvaQCVbjYjnDMJZp3q320m740TEwu2LxFDYXRZjuxZpPp12Do/fOMjSFrnMLmvqsB0sEpHRcVBH8dZA3Sb/e2fVoPlTy9+9gOY/hVJotp91Sa7iliareI9dZJcKmevcOLDIcCWJ5pCp6oosHkZw9Mk4jsmAxO8gPvNu0bsE4pVWuNJQXscfkhu3XrywbSLNdn2SI0mWGhrA3fGWEG4FXG+hH2bZKRfAlIb1AnhyfwZ1Q+9IYz0le9tFCzl92dxZ4C0g667dTPrMrRf7l/ejzIAjQxXzNYf2wbZjoaBxvq1C0e3Hes/24diJN9/TNq3kkEDDB998N1aNVb1lQYJSVUmB5IZ+6EKDWSIK8bIUKAthPO9vbJB8FhwkiypEfJ7Ng/slUxQxkd59i41PVLCpVKEHQUy4lM4CgxenXqybb6tZTYw7nujrzd0Z1IR9BmGqiV2sHPI5qTbuHPPBo9D1S5wGiGvjLYRBVb/M18YiE9LVWSKkwKtCSoBhMeK3WE1xR3f1isx+3OSvRruAXXndd5gXWSxMfye8LzpnRZp2TNpbwHzlQPGK28+FrwE1HDsBMhWH2S1NyTHseEuRBoonilKaHje3DmiHjyyh5MgjVuwJ82UyeeAedIAO9VQUo1jU+K94P4jemSKW9qOMRdB6K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199018)(2616005)(6512007)(54906003)(86362001)(91956017)(38100700002)(38070700005)(122000001)(110136005)(71200400001)(66476007)(8676002)(64756008)(85182001)(36756003)(66446008)(2906002)(8936002)(4326008)(66556008)(66946007)(41300700001)(76116006)(5660300002)(107886003)(6486002)(6506007)(26005)(316002)(478600001)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THZjRnc0WHJGcVBUYzBMWXd6WEY4MDE2R2Y5cUNlSk56ajJBc2p2Mmc3a0hj?=
 =?utf-8?B?OXRlZmYvTXVJWURqcEJmVkR1SGw5cVhEdUZKbE1UV0VFTVNxcnhvbG54elBB?=
 =?utf-8?B?ZXN4ZkVuZ1hETzZyZzFTaE52cnpJTVhaY3R3eXpXSGZDZG1XbWNuUjNSbnlx?=
 =?utf-8?B?dVNTNFNRbldKSUdGZGxJaTVKYVlVZFdrWnNzZ3NRaVZjNjJVa3RmaUZER2E2?=
 =?utf-8?B?aVpkdEg4cXdHYlo2dWQ0UmJNK2J2bnVQTzcreTI1TnQ0OWtJcHkyV25iendV?=
 =?utf-8?B?SDZ4bzJENklGYTJRZWRvN2VXeVlFUzRRVDRLNlJHTGxZS0QveEdiSmEzcGFu?=
 =?utf-8?B?c2FyYXNVbHFCR09YSmJ6aHpSVW9lWjFjTmw4VHFHSEJWM3lnbkJ3Mnp0YzlV?=
 =?utf-8?B?eTFUUkwva1dPS2J5WVlVbWhPWHFOaHBNQ0VxUXRSQUppNUVnbVZub213N1Yr?=
 =?utf-8?B?M2E0TndWV20vamowcUFET0FYd054Vm12MnhUMkhuZjVkSEZnaFNrU2V0eks5?=
 =?utf-8?B?UDF6Wk94WUhYNjN2NEJHWTZvYzFXRTJBcUpLNlhzd3JBR0dCazRFbEVOc3Y4?=
 =?utf-8?B?NWt1UDR4YnlWa2prSzZMR3hhYlYvWFdTSTRKYVg1TTQwdFNZQ204aVZGUkti?=
 =?utf-8?B?eVlBNExpKzd5OUNsUTNzQ0FGaUhyYjY1alhReFdkb1pvU2gwSElOT1p1Vnp4?=
 =?utf-8?B?TUFBVHF3QkUwSWZ2Y3Zta3hMN0F6cmtuZURleXhGRFdhdnFKSDlaZHNSTndk?=
 =?utf-8?B?eWJ3VHFXVDdGOVNOSWhsWGFWZVNkZ21JK2k3UVk5d0JBN3FNclNPL1R4V2Fw?=
 =?utf-8?B?NkFyVCswNjF3MVQ4cFdiVUdsQWRZVzRsMFNrY1phRVpxK0kwcElGNzRpdHRC?=
 =?utf-8?B?bHFKT1Boa1hqVVZkK2tmbkZKWTlHT29nazF2ZHhaVGZTN3lTOVJqekxBOExN?=
 =?utf-8?B?blAwaXEzenpscS9vN1IrZzJkSUkxbi9xL2o2a25PbmhwWkc0VkV3eExVeTM2?=
 =?utf-8?B?VUxZbkd6Q2tyRVFrTzdwUGlGSC9pUEowbUtpQXVrelRVSXVVWEdFMGEyc3FH?=
 =?utf-8?B?ZjNZV2x0VmRDU29FdDY2RmJtNnZvNjNUQkZKN20wbW1CWGc2Q1VpeWxzL1c1?=
 =?utf-8?B?N1BqSlJoQk8vdXJ3YW9FS3VabUY0OWFtV0lLcW9jbkh6RktkT09uL3Q4QWFZ?=
 =?utf-8?B?MUNhNjBoS05XeTcvQTlIeUVGMlJYZmc0TDMrYU9PNGFOT2tORmw1c0UvYWZa?=
 =?utf-8?B?cFJBKzA4cFFzSG13VWwzSkR1OHVQU3dKbXQzN0FRby9SRUFYNEdmdlI0eUtY?=
 =?utf-8?B?N2VINzRXTWpOTUR5VWFMZTczL3ZQODJtZ3dzR2JjaXVqSWZCMElwanh5VkZj?=
 =?utf-8?B?cXdtOXBKS1phOFh4S2htMWlJei9PTlVEaTUwOGVjMGp2N21hT3BaTFcvVjNx?=
 =?utf-8?B?RUJ6aEt0NmFObXBoNU11ZFJObHlCWmY4eXlqMnF0elJXNlBnMzRZTkF2VmtD?=
 =?utf-8?B?SUh3V1kvZzRnL3A2a1RrNUVSK0s1UEJrOUUvcFZLV3pDNmNsaElub280emRV?=
 =?utf-8?B?SzFUYzE2cmtOekhjQnNKUjZTSVFHT3p0MWJ0MlBYYUhxRTFtdVBzb1Ywa1NI?=
 =?utf-8?B?ZUt4ZkhySmpSaENxQlZ6N21OZW9NRmJ4aURIQmp5Y2IvUFI0TnJNMnBQWjlQ?=
 =?utf-8?B?aWdheURGWUpucWh0dkNiWDYwTjVjZTNXYmxOQjU2RlFPYm16YUk4QmlNSFlO?=
 =?utf-8?B?cFVGbkplVmJCS3ExTFc2a1BDL1dhTmZRNTNaeVFiUXJEWFd3V3JwckRKelFY?=
 =?utf-8?B?dFllTjRoM012Ym5VMjFab0lueDF3MDhGMlZUNWdEeUF4Yy91Q1Z1Z283S1h4?=
 =?utf-8?B?YzRxTTFrT2YxYUxXNEpSTjd1WmlmUEVZNzAzZkx0L0FzLzljMDdDLzI0Qklm?=
 =?utf-8?B?N3g5ZGt6c1VqcnY0NWQvdDdTNmRtekhDNlJFcU8vL3R2a00xckp5YTVYZThG?=
 =?utf-8?B?M24zS3l5cHpNWHJFSGxML3VnRTVENWVDUGo1blJISEhGRmV2VWtrS1J2TVBv?=
 =?utf-8?B?VmtvNCsvU0NUY3VTclVYZkxYcU9xbUNtbUNqbUdlRFNxZ04vS3JsaHpkSS8r?=
 =?utf-8?B?YkFQamkwa0w4QjcwU0paY3VScng3Sks1ODZZUysvYXNJRFVZS0JZd2lHNDhC?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CB9A53FEDC0C445BCADAADD7142B0ED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb54c432-576e-4710-0f7a-08db2ab8fd61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 09:37:01.5934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDXRswiuEkU/kXjA8zhJSdYRZspud//gvaDv5lVXcqkebQg1BPiN1SMrIcB2GeR5a9ZTsBf1+FCk4HDWQkDBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_023715_597633_561ECE76 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

SGksDQoNCldlIG1lZXQgdGhlIEhBTkdfREVURUNUIGhhcHBlbmVkIGluIFQgU1cgdmVyc2lvbiB3
aXRoIGtlcm5lbC01LjE1Lg0KTWFueSB0YXNrcyBoYXZlIGJlZW4gYmxvY2tlZCBmb3IgYSBsb25n
IHRpbWUuDQoNCg0KUm9vdCBjYXVzZToNCm1pZ3JhdGlvbl9jcHVfc3RvcCgpIGlzIG5vdCBjb21w
bGV0ZSBkdWUgdG8gaXNfbWlncmF0aW9uX2Rpc2FibGVkKHApIGlzDQp0cnVlLCBjb21wbGV0ZSBp
cyBmYWxzZSBhbmQgY29tcGxldGVfYWxsKCkgbmV2ZXIgZ2V0IGV4ZWN1dGVkLg0KSXQgbGV0IG90
aGVyIHRhc2sgd2FpdCB0aGUgcndzZW0uDQoNCkRldGFpbDoNCnN5c3RlbV9zZXJ2ZXIgd2FpdGlu
ZyBmb3IgY2dyb3VwX3RocmVhZGdyb3VwX3J3c2VtLg0KT29tQWRqdXN0ZXIgaXMgaG9sZGluZyB0
aGUgY2dyb3VwX3RocmVhZGdyb3VwX3J3c2VtIGFuZCB3YWl0aW5nIGZvcg0KY3B1c2V0X3J3c2Vt
Lg0KY3B1c2V0X2hvdHBsdWdfd29ya2ZuIGlzIGhvbGRpbmcgdGhlIGNwdXNldF9yd3NlbSBhbmQg
d2FpdGluZyBmb3INCmFmZmluZV9tb3ZlX3Rhc2soKSBjb21wbGV0ZS4NCmFmZmluZV9tb3ZlX3Rh
c2soKSB3YWl0aW5nIGZvciBtaWdyYXRpb25fY3B1X3N0b3AoKSBjb21wbGV0ZS4NCg0KVGhlIGJh
Y2t0cmFjZSBvZiBzeXN0ZW1fc2VydmVyOg0KX19zd2l0Y2hfdG8NCl9fc2NoZWR1bGUNCnNjaGVk
dWxlDQpwZXJjcHVfcndzZW1fd2FpdA0KX19wZXJjcHVfZG93bl9yZWFkDQpjZ3JvdXBfY3NzX3Nl
dF9mb3JrID0+IHdhaXQgZm9yIGNncm91cF90aHJlYWRncm91cF9yd3NlbQ0KY2dyb3VwX2Nhbl9m
b3JrDQpjb3B5X3Byb2Nlc3MNCmtlcm5lbF9jbG9uZQ0KDQpUaGUgYmFja3RyYWNlIG9mIE9vbUFk
anVzdGVyOg0KX19zd2l0Y2hfdG8NCl9fc2NoZWR1bGUNCnNjaGVkdWxlDQpwZXJjcHVfcndzZW1f
d2FpdA0KcGVyY3B1X2Rvd25fd3JpdGUNCmNwdXNldF9jYW5fYXR0YWNoID0+IHdhaXQgZm9yIGNw
dXNldF9yd3NlbQ0KY2dyb3VwX21pZ3JhdGVfZXhlY3V0ZQ0KY2dyb3VwX2F0dGFjaF90YXNrDQpf
X2Nncm91cDFfcHJvY3Nfd3JpdGUgPT4gaG9sZCBjZ3JvdXBfdGhyZWFkZ3JvdXBfcndzZW0NCmNn
cm91cDFfcHJvY3Nfd3JpdGUNCmNncm91cF9maWxlX3dyaXRlDQprZXJuZnNfZm9wX3dyaXRlX2l0
ZXINCnZmc193cml0ZQ0Ka3N5c193cml0ZQ0KVGhlIGJhY2t0cmFjZSBvZiBjcHVzZXRfaG90cGx1
Z193b3JrZm46DQpfX3N3aXRjaF90bw0KX19zY2hlZHVsZQ0Kc2NoZWR1bGUNCnNjaGVkdWxlX3Rp
bWVvdXQNCndhaXRfZm9yX2NvbW1vbg0KYWZmaW5lX21vdmVfdGFzayA9PiB3YWl0IGZvciBjb21w
bGV0ZQ0KX19zZXRfY3B1c19hbGxvd2VkX3B0cl9sb2NrZWQNCnVwZGF0ZV90YXNrc19jcHVtYXNr
DQpjcHVzZXRfaG90cGx1Z191cGRhdGVfdGFza3MgPT4gaG9sZCBjcHVzZXRfcndzZW0NCmNwdXNl
dF9ob3RwbHVnX3dvcmtmbg0KcHJvY2Vzc19vbmVfd29yaw0Kd29ya2VyX3RocmVhZA0Ka3RocmVh
ZA0KDQoNCkluIGFmZmluZV9tb3ZlX3Rhc2soKSB3aWxsIGNhbGwgbWlncmF0aW9uX2NwdV9zdG9w
KCkgYW5kIHdhaXQgZm9yIGl0DQpjb21wbGV0ZS4NCkluIG5vcm1hbCBjYXNlLCBpZiBtaWdyYXRp
b25fY3B1X3N0b3AoKSBjb21wbGV0ZSBpdCB3aWxsIGluZm9ybQ0KZXZlcnlvbmUgdGhhdCBoZSBp
cyBkb25lLg0KQnV0IHRoZXJlIGlzIGFuIGV4Y2VwdGlvbiBjYXNlIHRoYXQgd2lsbCBub3Qgbm90
aWZ5Lg0KSWYgaXNfbWlncmF0aW9uX2Rpc2FibGVkKHApIGlzIHRydWUgYW5kIGNvbXBsZXRlIHdp
bGwgYWx3YXlzIGlzIGZhbHNlLA0KdGhlbiBjb21wbGV0ZV9hbGwoKSBuZXZlciBnZXQgZXhlY3V0
ZWQuDQoNCnN0YXRpYyBpbnQgbWlncmF0aW9uX2NwdV9zdG9wKHZvaWQgKmRhdGEpDQp7DQouLi4N
CiAgICBib29sIGNvbXBsZXRlID0gZmFsc2U7DQouLi4NCg0KICAgIGlmICh0YXNrX3JxKHApID09
IHJxKSB7DQogICAgICAgIGlmIChpc19taWdyYXRpb25fZGlzYWJsZWQocCkpDQogICAgICAgICAg
ICAgIGdvdG8gb3V0OyA9PiBpc19taWdyYXRpb25fZGlzYWJsZWQocCkgPSB0cnVlLA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc28gY29tcGxldGUgPSBmYWxzZS4NCiAgICAgICAgICAgIC4u
Lg0KICAgICAgICB9DQouLi4NCg0Kb3V0Og0KLi4uDQogICAgaWYgKGNvbXBsZXRlKSA9PiBjb21w
bGV0ZSA9IGZhbHNlLA0KICAgICAgICAgICAgICAgICAgICAgc28gY29tcGxldGVfYWxsKCkgbmV2
ZXIgZ2V0IGV4ZWN1dGVkLg0KICAgICAgICBjb21wbGV0ZV9hbGwoJnBlbmRpbmctPmRvbmUpOw0K
DQogICAgICAgIHJldHVybiAwOw0KfQ0KUmV2aWV3IHRoZSBjb2RlLCB3ZSBmb3VuZCB0aGF0IHRo
ZXJlIGFyZSBtYW55IHBsYWNlcyBjYW4gY2hhbmdlDQppc19taWdyYXRpb25fZGlzYWJsZWQoKSB2
YWx1ZS4NCihzdWNoIGFzOiBfX3J0X3NwaW5fbG9jaygpLCBydF9yZWFkX2xvY2soKSwgcnRfd3Jp
dGVfbG9jaygpLCAuLi4pDQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGZvciB0aGlzIGlz
c3VlPw0KVGhhbmsgeW91Lg0K

