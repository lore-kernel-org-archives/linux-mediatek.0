Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212BDC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=; b=eliql7oxMHf+n0e8i5/RAAlspD
	FuKLgA+1AOFStV3oxiRthskbvg+ir2HNluFcjjX3WfUS57WGMgD9CmOviI7s73tkV2D/I3nykSmlX
	SeiELPrP6il3n+EuxV1jJ2Wz0CQVdT8mK8HZTcvArO6Hjknp4hC+dtLkjR3vIQUnJqY/YpcDXFbSW
	/rV+6xbODW4OS4k+liK5du5ha+VgXSoKNvxUivPX2ceG2Sc5SxUQn244Q4pWA222FZpnxLcm3vJbw
	nHAwCipdQ+m3qlhXybrufnsxrJCx5KNtHwHLo+56pZoboB4kMB1sdtRqg5QSA2oIZx9BENxasxZpL
	bJ7LWzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Eu-00C6mb-2R; Mon, 06 Mar 2023 09:34:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7EJ-00C6Wd-In; Mon, 06 Mar 2023 09:34:05 +0000
X-UUID: 045d5802bc0211edbbe3f76fe852e059-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=;
	b=FCJ5B3YlCIy9XSjWR/gPSucRxMoFxndZTCL+yyDOiHIgdLoIxLu+E4R2ea/WwnqFriPy5GwAkjw/+QKs/LnutVTsMdr4hY+KjzTOzQdciSON7wHY1tyUZO7IX2PxlWxZ7DV9HjDPHxvnqmO5Fy7g+m+AFd6QfFzCiy+6mWdlQJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:f71997ad-f1fc-4e7d-b60e-e40dceb042cc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:0064e5f4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 045d5802bc0211edbbe3f76fe852e059-20230306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87385532; Mon, 06 Mar 2023 02:33:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 6 Mar 2023 17:33:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 17:33:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdoRVeZiMFaHnWHupJdG09YBYW0ztL0LnhHeiTPGVnrsE4LH12YBw1eeDYcDog36avMviUvVKJo9Q9nTNP5JyAb+pMlL08fpVCzFgKC4zTR0WHu6iR5LtvgEZewbGcHLJPsEOcG+IGLeuKo3GBTxI5TPO8UupG9knWuUHjIefwxoN8CUEAes5ebjBLAE3aQY4AuRuF3TTDACvkwTsGzGsIC/H3TfIrZLWBXxKRryK9AgYg0GwMCWq8OTQjIPGBC7f7XFYKy87cITpSpirMzJfzj1z6ZRucOO0vXMmVYmUId1nMkzqZpZldlf8BwhckOq+0nW1B28A0UZm2P+PAlESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=;
 b=bni4Zl04y1EcPd3QgS0jGfolAefavoeJKpf0aeyT3Q71F+HiTgS7de6l4nHXfJGCaxRat3cZND8tMwFm3y19iT2gZX9IDoxn2k83wCuzUCnzjkCZx7qGrzJ852PgEq2NktnH9RAsHa/TQB7xleyC3vI+syoWIagUOvtNL59RKA19IpTeO9ini/XSL5a012i7cqP/BmIQVKY5X8tM+HW1QA7hYgIHV5mUwnyUbVi0AOBdOSR/ZxY0TVuXQ7zZbTO8DsQgo86K8OiINzW7viF0MIDppaThN9KXHYrZOa8c9oU1lWPVCDdQmcAqA5nwBZgEe+8neAccPLkgNFTwt4KgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=;
 b=acTbqO9J6nJ6dNt7LM1rreGGeFrSDWj6+i3/MFkgm31AXBNghoPnS06hSS6MufIZg7nOlDCJLelxekvUQ4JNVszrsV+wRqlPNQ7ybZuvlgicZjAPgQ/SW0IA1pIdQtxoWPht22z9mc+Av8lM5pCW2vZlRDvDhG1BanjANf7q+QA=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by SI2PR03MB5498.apcprd03.prod.outlook.com (2603:1096:4:123::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 09:33:18 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::f560:14f:26e3:74d8]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::f560:14f:26e3:74d8%6]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 09:33:18 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?=
	<Rex-BC.Chen@mediatek.com>
Subject: Re: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Thread-Topic: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Thread-Index: AQHZGce/MnRAbIbkqEmJgEyroyqYVK7bIZoAgBLIM4A=
Date: Mon, 6 Mar 2023 09:33:18 +0000
Message-ID: <f1376c4bc859b17a2d40203747b8362108f29d9e.camel@mediatek.com>
References: <20221227074759.5216-1-jason-jh.lin@mediatek.com>
	 <20221227074759.5216-2-jason-jh.lin@mediatek.com>
	 <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
In-Reply-To: <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|SI2PR03MB5498:EE_
x-ms-office365-filtering-correlation-id: c281081d-a7ca-44b4-f9e4-08db1e25d1a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xgaNWqTN6Q/gKFrQsdtFQ0Hm91IuB53lBhuR2qhvdhfx6q3nsO6QUCv43NMKOJJ3urnOGRdWff3ALQOYumjH+gmnguzAMM5DElr54UbQS6YgYAB++Y5RaC986ngrohyXcig7RKZOlsRqIAPvWwQr17q2XG6xuHR8FOecqwhQQkSybH6jjkivhlKhDn59uXGz0I/NTffUVMtJjsYmfqtIzrU01z9yfQOBepKhypyYmO9oRIWx1289xQ23M1d15lhA6VEKb/32tCnw+enDE4qcTrxy8nQV4ADXmkQXtIW7MYQAL5S4oiWi9RaZliR9/Dv1TpS06KmkF137QvR0UhZOTageMfIu1VA8ma1K736FxtVH2TDkcSo6JG4tDBwop3PZObddzRURH4OUmXTh16HteO+KdN6FoJKrUDAiYG1tVDj1m+VrGhBJde7iqGzgJFFgI1fufeNWq95t+GigMM3FKDOHhGhY9TJXDcm2Gjcwg+EmHKiKp6aBhUVT+HIfuOhh+X+Q7qM2LZQ/eOGfo9Rx3XIMw6k02OPBF1kFi2/PyQfNJjO0UGJcjOiEeKpIjtdxqfbVuA7DYHrduh0PObEnAn7hfxwOC2uSvvdQzmIrKgtiYNsr2s+D1bvYf5q9gs6AFB2qphYYflYzjUOmx/HdAlJxAMZnGCCanHTxE0eNLfczrvwZKRuVKudWKC5ak5TI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB3062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199018)(186003)(122000001)(38100700002)(91956017)(38070700005)(8936002)(41300700001)(4326008)(66556008)(66946007)(8676002)(64756008)(2906002)(5660300002)(76116006)(71200400001)(478600001)(107886003)(6506007)(2616005)(66476007)(26005)(6512007)(966005)(6486002)(110136005)(316002)(54906003)(36756003)(85182001)(83380400001)(86362001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmNnb1BwSEZkWUtiVUtKQnVqNTVzdUJldGdDLzFWNTBoaHBwVytyWGZSaTB1?=
 =?utf-8?B?QW9QNU9DWWJDeXFtVWdWUllGV2xBY0pLL0pPVUNBSmE4NzU3UjNpT212Y1V2?=
 =?utf-8?B?L0FvL2g5RXNDVk9sZlRPZk03RFh4NEhhZW9oZkNkNDlKSHJRWkhrUzFyZ2Yw?=
 =?utf-8?B?c3FUREhzY0JKYzYrVndQOVNRemhHWXJBNS9aZTVPZ21Jc2ErTW0rdmpJZzJK?=
 =?utf-8?B?ekRtZFptOXVKUUppMXRyVGp5YXpkZ0tZak5IR0d2WWNOME5hMmpTbnV0STlY?=
 =?utf-8?B?NElDUkt1Z3c2MU9HckNvUFQ1TjltSXdQVGJNaWtvOElSbFJaR3NrSTRKaDVF?=
 =?utf-8?B?Rk5sUzdkdzBUTURaY1lFQkdVK0c0R0d6MGdFS2daNE5EV0Z1Z0MyTjhtMDBM?=
 =?utf-8?B?MkQ0TGl3OE5PYW9JN2p6Wk4wUndHdTJGUEpCTzlmeXdSZTVVeTgweDVEZ1Ns?=
 =?utf-8?B?U0tJc3lWVk5NT0RRWmE5czhKVG9vdWJCdDhPYmlESzJYbVdaaUpkMnVZc2lv?=
 =?utf-8?B?Z3FMQWR1WHYrekl3d2JFVW5ITkZoV2hvUGVPckVNTTVFNGRsblNLUFNMYmFJ?=
 =?utf-8?B?WGl4MDJOUEhLQVhUcDJRWllmbVFGcUdCTmdhck5JcmV5OHhLRkIySHZOVVdZ?=
 =?utf-8?B?YmZYSWlyL2pWSXk4YXkwam1hMXlDOXNzNjMxZGMraUxFU2VYb1kxYjR3TTRK?=
 =?utf-8?B?MlhlUnNZeEFCbjdCM3hRaHhjUGZrMm5sVTd2Rkdvd3Exb1RFcUtObUFlVEcx?=
 =?utf-8?B?MDJOeExOMnRwTCtrVmhGZXVxYmNyaWMrck1vaUpMWTc1K2UrWU45djdQcGFV?=
 =?utf-8?B?S21uMkp0Y2tiMTNpV2lHSDVtRlM3aWRGRGpacW5mTWpFNHV6L2xrOFQzdmF6?=
 =?utf-8?B?ZFRpTFB1YlF3NzhBOG5CZjh5YXpKZXJXL0N0bWpqaG0xOERsSGJTNHBqK2d5?=
 =?utf-8?B?ajVDVlRxcFByVE5XSytpbFB0bGNOeW1SeEhFQ1FYcUxBQXg1MEd6VkRQUkFk?=
 =?utf-8?B?bUtnNmcxWFNoejNrNWtrSGsyK2FSdmtCYnF6c0pQUkxpSUlFYjM1bFNQWEM3?=
 =?utf-8?B?V0ZPc0lzeGltVE9RZmJLWFA1b0VGNHROL1NOTFRaZmtMRDk0a2doMHcrOU9D?=
 =?utf-8?B?eTJERzdFQVVmSnJ1RkFCWjlmWVlUNkVEWXNDcE1BYk5tbGZRREw3RGtRZSs1?=
 =?utf-8?B?WWJYYjBkdmVvcXA5TVRVS3FRa2Y2QVZYR05NN2VNSXphaFlSbXkxSjJUdGxY?=
 =?utf-8?B?cVgydDhtZHdCbGh5OFp5QnNQTWlWTXVkUmhvMWFHckdwaFBPcDdBblZjYzc4?=
 =?utf-8?B?SlByaFQyb0FHclhQeUtvMnZHN1M5dEcvbk44ZWY4QldtcXZtT0hvZGVmZVJM?=
 =?utf-8?B?NDlXVE9qMnhKYnFaN0tvVzhIc1Z1NHpRNFZZeVRpd25DbEdZTWZqTFhPUkVK?=
 =?utf-8?B?VllQLzFZWmpLZ3NZTTBRMkZRMkhlMms4N1E4VmZONitTa29ZcVJJWGJLTnhp?=
 =?utf-8?B?NCs1cVU5TStzSXFaUnVBMVl1dDdsTDRpbjZJaEh6aHMySjNDSHZmdmdLKzlr?=
 =?utf-8?B?S2hjcXhpV3V3TVg4djdEdUY3dXhTTjdkYjFGMFlHK21aSXRIclJQUXRLeVRL?=
 =?utf-8?B?a1pkL0JMT3lkWUFPUWt2dkJWWFErVDd3ZG1OeUg3QTQ3aExaUmNKNWN6Z0Vy?=
 =?utf-8?B?c21KeDZRbjhYQjROYm9TLzdDb2lFSFZxazhMUzBaZ1JUYXFQS0hHbVF0dStW?=
 =?utf-8?B?Z0FmcTBXT3NHZ3BISHVEMS9EYUdyMTRuTmFVVGxXUVRDSEo4dE8wWm9OOFc3?=
 =?utf-8?B?R2pqZEplWm0va0dOYWFWL2swN3h4UWt0WU81K3FlZGt4SURRMHRRc3lhMEcv?=
 =?utf-8?B?ZklQNktEeGgrdzRIU0hqZVB3eUlsK3R6TTdqeCs1amJTcDFXVTUvekVndEJW?=
 =?utf-8?B?ZmpPdWNXeGdCUVhEbzA4aHZ0Tk1hTkdzdnZBZmFIM3ptOVBrK3NhVWJsY0M0?=
 =?utf-8?B?dU9QeVVMeUxwYlJ0VTNVOE5uTjZFbTZ1Qlg5dmJFSzBzK0V3ZWM3b1JqdjVn?=
 =?utf-8?B?NEcraklJenJ0Zno4dFUxcERyYUt0ZXBxcW9qbmFZQlo2eVNUcHN2MlEyMnhD?=
 =?utf-8?B?TElpSlJmVy84ejBjenJjUnpnSDloTHlvNHlBdFRXZzhwdG1lSHRKenI4L3Q3?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCEB970D2B1AFE499A17770686902447@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c281081d-a7ca-44b4-f9e4-08db1e25d1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 09:33:18.2199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pa4hsHsTGdhUMLlz/Q/0SRnUwQ+L52jq9UBlGnqtKYZpBDU7ZWOKswEMlgXwDX9yA0Qr6TKfMNllMa0WP33B5oO1MXfdEoLUaIZSOi+0G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_013403_873830_CD6746BB 
X-CRM114-Status: GOOD (  17.00  )
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

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzIGFuZCBzb3JyeSBmb3IgbWlzc2lu
ZyB0aGlzIG1haWwgOicoDQoNCkkndmUgcmVzZW50IHY4IHRvZGF5Og0KDQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMzAzMDYwODA2
NTkuMTUyNjEtMi1qYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KDQpSZWdhcmRzLA0KSmFzb24t
SkguTGluDQoNCk9uIFdlZCwgMjAyMy0wMi0yMiBhdCAxMTo0NCArMDEwMCwgQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IElsIDI3LzEyLzIyIDA4OjQ3LCBKYXNvbi1KSC5MaW4g
aGEgc2NyaXR0bzoNCj4gPiBCZWNhdXNlIGNvbXBhdGlibGUgb2YgbXQ4MTk1IGlzIGNoYW5naW5n
IGZyb20gIm1lZGlhdGVrLG10ODE5NS0NCj4gPiBtbXN5cyINCj4gPiB0byAibWVkaWF0ZWssbXQ4
MTk1LXZkb3N5czAiLg0KPiA+IA0KPiA+IFdlIGhhdmUgdG8gcmV2ZXJ0IHRoZSBtdWx0aXBsZSBj
b21wYXRpYmxlIGZpbmRpbmcgZnVuY3Rpb24gYW5kDQo+ID4gYWRkIGRyaXZlciBkYXRhIG9mIG10
ODE5NSB2ZG9zeXMwIHRvIG1lZGlhdGVrLWRybSBhbmQgdGhlIHN1Yg0KPiA+IGRyaXZlci4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
cmRtYS5jIHwgICA2ICsrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyAgIHwgMTI4ICsrKy0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgIHwgICA2IC0tDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiA+IGluZGV4IDBl
YzJlNDA0OWUwNy4uNjZjZGQwYmMxMzExIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+ID4gQEAgLTM3MCw2ICszNzAsMTAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGENCj4gPiBtdDgxODNfcmRtYV9kcml2ZXJfZGF0
YSA9IHsNCj4gPiAgIAkuZmlmb19zaXplID0gNSAqIFNaXzFLLA0KPiA+ICAgfTsNCj4gPiAgIA0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX3JkbWFfZGF0YSBtdDgxOTJfcmRtYV9k
cml2ZXJfZGF0YSA9IHsNCj4gPiArCS5maWZvX3NpemUgPSA1ICogU1pfMUssDQo+ID4gK307DQo+
ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGEgbXQ4MTk1
X3JkbWFfZHJpdmVyX2RhdGEgPQ0KPiA+IHsNCj4gPiAgIAkuZmlmb19zaXplID0gMTkyMCwNCj4g
PiAgIH07DQo+ID4gQEAgLTM4MSw2ICszODUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZA0KPiA+IG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoW10gPSB7DQo+ID4gICAJ
ICAuZGF0YSA9ICZtdDgxNzNfcmRtYV9kcml2ZXJfZGF0YX0sDQo+ID4gICAJeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1yZG1hIiwNCj4gPiAgIAkgIC5kYXRhID0gJm10ODE4
M19yZG1hX2RyaXZlcl9kYXRhfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWRpc3AtcmRtYSIsDQo+ID4gKwkgIC5kYXRhID0gJm10ODE5Ml9yZG1hX2RyaXZlcl9kYXRh
fSwNCj4gPiAgIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kaXNwLXJkbWEiLA0K
PiA+ICAgCSAgLmRhdGEgPSAmbXQ4MTk1X3JkbWFfZHJpdmVyX2RhdGF9LA0KPiA+ICAgCXt9LA0K
PiANCj4gQ2FuIHlvdSBwbGVhc2UgZHJvcCB1bnJlbGF0ZWQgY2hhbmdlcyBpbiBtdGtfZGlzcF9y
ZG1hLmMgYW5kIHNlbmQgYQ0KPiB2OD8NCj4gV2Ugc2hvdWxkIGFpbSB0byBnZXQgdGhpcyBlbnRp
cmUgdGhpbmcgKDgxOTUgdmRvc3lzMSkgZmluYWxseQ0KPiB1cHN0cmVhbS4NCj4gDQo+IA0KPiBB
ZnRlciBkcm9wcGluZyBtdGtfZGlzcF9yZG1hLmMgY2hhbmdlczoNCj4gDQo+IFJldmlld2VkLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gDQo+IA0K

