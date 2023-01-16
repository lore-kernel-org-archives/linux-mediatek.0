Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79504C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Pr+d2QUKJGGuESF4lgFenadO+Tgw1zrccU3gT5y/0s=; b=CLgH9UKZLn6VyWc7oKQHQTb/a1
	wH+RbPRXkW/EHYInkIgBnYuwbmB/OZX9xOb8csBdM+aFbonqYxdQyjBQw5mx2nM3fuuhwXECc0j2Q
	3h+c63DWdSXA8L07eD86vLL3w22puRlHtQtfILMGp9NXrt7RZrBG6LsFWYzq7I2jeM2kT54HZ3KuC
	7ChspfOzDx0geRybyR+hVVQ7cmGP3OIBdPO/oWtxtEngnDJ7NobpgDXnOCxFEbQUJbgdJTLoqHX3V
	F4lXX82UlkpMMXAE081Lgqjw3pE7xdVOxqdnO7aCyrC+W7AtCK0rHk7ZNa6vc4uvimizzpnlFanJg
	/Zoyy5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHFSe-008Nby-0m; Mon, 16 Jan 2023 02:43:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHFSa-008NbE-3O; Mon, 16 Jan 2023 02:42:58 +0000
X-UUID: 76799a54954711eda08d4d6090ec5a5c-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/Pr+d2QUKJGGuESF4lgFenadO+Tgw1zrccU3gT5y/0s=;
	b=qRL0ssPIZQQbfNNtKDf0EUgQekEZq0zdPNu+UMCLjINo+LBSbLR1WFK+jQhLmDHWrDuHiIJNwUbdHLFeMiF1CkKWnIPv7z6xzStadkCQyQwgWzgQ+G4YjMnCG9bzis3mXANQN5PAbO7uWCCobEb90vegUvk9/S/eKyeH+ax41ZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0b543fed-30bb-436d-ac11-95baaa27e30d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:f15db954-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 76799a54954711eda08d4d6090ec5a5c-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1809586963; Sun, 15 Jan 2023 19:42:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 10:42:45 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 10:42:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+8BENQ0ia+K5q+/htYTiKYCDA/KRF42q12BjjPIYP7WiAbURDYltvY7sAdUjqPL9P7heDwrbQ/Q5cY5Ljv61s/vwYkOXlpG9KPbJ40QVKcs1gUkhxlCrRaLGDVhwhIqdE4mRN0UXtn+lv7HaBUoYO93p9ih8DeDjv6Rdo6rzyiaFoAv23hde0B/kApUIiNZmQy/a2XfFqhJhwxUA0B2H/p8xYRpNRbQAIb5m78p2hzSR2BT57KKgoApcSGbQTY21Jo+bqmrFkwe5M5mFMERUPgUJfsx/Uprg+47Q5OqDa1N6S9etzNoOSOhe4GZzN8dOM1Oa3wPzjXKZaX6L1NuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pr+d2QUKJGGuESF4lgFenadO+Tgw1zrccU3gT5y/0s=;
 b=F2MGy5v5d3g0HMUsnC9mhvQUqQpl4f7BJCnPlgYZ8AdhIhRWoKP9tOHOKocOXJZmfMxzk/Ecc7TS+/gNQH5lawKc2aHoExBqtVZMZRLKlkdJQOMkCRZjntyb7ISv542swa4MbTg/Z0ZiGmyXYe/b+Z59wDJpCnVZgJlg2/y6ACpmyRLtaGSNXWiIhffMqkLc6Xc6DT2JvsNNPLQ6xOnqDdQF1aadwH0ZnMPmYKtY21UzrnAHFx8PbuAClJyg/SAkKasZ+owdRSJ4+fFiqQouQvXB7pv/urkgicroJ/CKKwnWEO2bsB1S1Pd8BqEetPI11m13uPShfwiHWP0inix2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pr+d2QUKJGGuESF4lgFenadO+Tgw1zrccU3gT5y/0s=;
 b=etCUnv1LtaWOvEIPBq4+y6N3KjA+jONT4ZTF+YE3nLlKGJrvMah0ypD3KbhKaaprfnleEEHNoqXX9PwJsdMa0JkXyEIqK/dXknciz8ymTNG6xvb+54NcS8X+dlZ5e5237MVlhj5M7tokXm+nZvvN9FTcJxXB6+waH81JQCZGVzA=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by PSAPR03MB5319.apcprd03.prod.outlook.com (2603:1096:301:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 02:42:43 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::eb3c:770d:783d:352d]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::eb3c:770d:783d:352d%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 02:42:43 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Thread-Topic: [PATCH v5 01/10] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Thread-Index: AQHZJxILUyhKsU0HSEOH8wZhL0XGK66cPnYAgAQbzwA=
Date: Mon, 16 Jan 2023 02:42:43 +0000
Message-ID: <fa386a3ab2f2ed0c963d5fdec8bbea56ba276169.camel@mediatek.com>
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
	 <20230113054304.21841-2-moudy.ho@mediatek.com>
	 <329aed63-4522-9859-4359-2a450c46dcc0@linaro.org>
In-Reply-To: <329aed63-4522-9859-4359-2a450c46dcc0@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|PSAPR03MB5319:EE_
x-ms-office365-filtering-correlation-id: e98a232d-36ca-46b7-7728-08daf76b57f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ESdN0bJa8y62Qsa4awucSGtu9FiQEF+vQTQf9Js1NxB9zDrh5EzGzZq+i/hkMinrm1pG5r8bzFrIORmF/aTonGxXZxn0J8UfAMKGkWRnAuWFwyl9GlfV55VUN70BSPLLW+M6xFe1mXLe5qd+Ab5jbnMxBYA4a8KzXWv4rORMlY4jTwPS5kY0IEMO0wimpyrb48YsllObPqP9/GPQQXoqZNf0UR8Uc3XNwVfUc9xFSobNs2+dXSykAkpROG5mBY/LLTTwPGnEVmFldcd1zOCvLMmIYrvyT7Ym/Uboa0JyB+Jo45WB60Hi2fshUKgU00ktKRZO5Nm0dUgjQQzq1a9fJtPC1kw6ZPc6X9I8Onv65UvJjXnERC73zZKSHUCZc/p8xzfG45TVeb27piJCSPeZ3HO3aPyZMHb7EKv5L/399htOG73UxufyI1Rpfy5W7uM4Mtwq+CvuI1ZXxw39R4K6KSx+KaW2gXGULclHwwrEHrnLFP24DsniQ/DwH0RZ3WUz7KxYYG+yNwKgX60BRxs9s1mD1+6GmXAR4I7VOgBgUSE4BiBg8ekMz4N77gXBINdv/ZXuxQPkZxb3Z1QIs8s6NmbccO0tsBY+Tj4/gNSav2033hP9c4T9g0GZAirrNx3dGN9QFuGjx1E9bhLZAsvPtISW3wc/5K4nBZ/7wppDViG7VnpwW96+XWKOaT2vK6O5IJdunOR+ouGsEjTDyCzA4lYHaWGqfz159y5afPgpI07WQe1koz4ivX78VzSq5Q2g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(71200400001)(54906003)(2616005)(110136005)(186003)(66476007)(64756008)(8676002)(4326008)(26005)(6512007)(66446008)(76116006)(91956017)(66556008)(66946007)(478600001)(6506007)(41300700001)(8936002)(5660300002)(4744005)(107886003)(2906002)(83380400001)(7416002)(53546011)(316002)(122000001)(38070700005)(38100700002)(966005)(86362001)(6486002)(85182001)(36756003)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEI3aUpBVllwejFkM1NJUFZKOUUxUDlQTlJqeFJiZWRuWGRnWGladlhaNFp3?=
 =?utf-8?B?MnR4QmtmZ0I1c0Y0dHNvVVlVNEYyK0xPMXY0aWhocGtWeDcvOUNhODdYaVdG?=
 =?utf-8?B?U3UyWUVBZlFKRTZZNll3NkdjZW5NNUJvYVlJeUpHZ1dzcjgxdDYyK210U0tI?=
 =?utf-8?B?NWZnMkxPNWtaajVEK0VVU0NrNWNQWFVWR1ZBM3BJbDdZYTFsTWRNRFZhMVlK?=
 =?utf-8?B?QWt1TUN4NEp4WnJPSjR3WkVRZEd0TFBTVWFDcGZuRzk1OWpJZzBYdEpjWE5U?=
 =?utf-8?B?R05PaUZVdUtiUC90U3I5NHB4TTR6REQzQTFpUXUxZUhYa1J1Uko1M241WXhF?=
 =?utf-8?B?T2NKOGdMbnhUVThEbTVhS29vZzh1Szh0eWovQjUzSEN4a2N5QTA5VzJLeGZq?=
 =?utf-8?B?bWE0azJsVkZkQlRWRVhqUlhWbEIwNlVuNXVkY1NkZkYxSVZvY01rRFgzMmxs?=
 =?utf-8?B?RUsrUk1SRENLM3I0NzJGMlJFOVlZVTNObHJjSzZmVEg2RWdBWDVCOSs4NlNx?=
 =?utf-8?B?Qml5SFo0eERTMzBlMnJyekVQcmFmenJLNWhtQktxbjRNZXBUNm00dGhyVi9T?=
 =?utf-8?B?eHhkWG9XZWJBU2hRQkkxby9helRWaXZnWTZqNG5qYlBVK3NkMEg1VktSRXZ5?=
 =?utf-8?B?dzVMNE4weWs5K2IzT1BraVhWZDlSQzdoaTRDR0cvM3B4L3VYSWdKb2VYdlY4?=
 =?utf-8?B?RGFaNUFzTVZnajBLdkdzdkg3cDN0ZENrL3gxRWgvYjZCTFp3VHY5M0sxWlhC?=
 =?utf-8?B?UnAyOE1qcDVYQmc1ank3YzFidEN6UnMyWVo3TWlxcVFKSHNJYUo3SW5PN05R?=
 =?utf-8?B?MkFoWFJtRWdFUmhlS3dMWHJvUE9SUDl2T013My9jdjBIRkplWC8yM3VYMXJr?=
 =?utf-8?B?UHppSE9SMlRHNVhyalZYcEVQc0FKWTdCbHVqUW5VbUZOT2tlVnZtMkMwTWJO?=
 =?utf-8?B?SlZROUZOaUFRTU1UcGlKVm1UWE9yQ1M0dDJySXBoMllxaFBrMlovbmVRZXQ5?=
 =?utf-8?B?bVdlUDJ4eFJEd1VOS3JwYktOV3E1a1BZYkRQRDVueVM2YjVOVWVGVk4rSXdO?=
 =?utf-8?B?QVhTcWdVYW90Si8wcE9lNWZmTVBmczFqTnpQN3d5T2VlSk0xK2RkZG5Edkw3?=
 =?utf-8?B?NGFWdkVmbk8vY056VUdIall3Z2UvaUlsVzFOcklqdm9zRkRrNEdMTVVBYXBr?=
 =?utf-8?B?ZFJnNXpWN2F5V25Xck9YdXdFZkIwUG8zRFVUankvKzZaa3JwU1BFaTVnM1VD?=
 =?utf-8?B?eEowWDhCS25xVTdSZm1WSFpjbjJsclYrZGxoUS9pMzVUZy83RUVmMUs4c2pI?=
 =?utf-8?B?bDFoNDNCUzNjZnZrTzRaMHVLY1BiRmpwVWh5YW1mRkdTNWtibExaSU1WbGNz?=
 =?utf-8?B?YXJDWkxhT2xuOUdRZTFERTluT21ZOWN0MlAwekNaRTZVLzEyM2YwQjFuMlpj?=
 =?utf-8?B?OU9VMkR2dWRhcnlUYmd1QVA4KzRIN0tmOVpqaStlQURoMThJMWkweUdhQW5F?=
 =?utf-8?B?YkN2OGZSZlIwS24vQ0IzK1EvVmJnVzZHUy9Yb1poT08zNk1yT25abGhRcnpx?=
 =?utf-8?B?dVJrbHo3V2RNc0lKcXBpVHhyS1NrR3ljNTRnS0lwUysxUzBtN2owYWhIU0FN?=
 =?utf-8?B?dlRtVmR0a3U4aXhmS3NSTmF6amo1R0tOUVFETDBpRFp5SWllendSdndDYUxq?=
 =?utf-8?B?WEhUQmxtUHAvQ3NXTC9HTlpNVTJ6MEk1RmZjelFrQVlHNjJKZDNKdUlvREpR?=
 =?utf-8?B?T0NuZDd0NzRPTVNHbllDTDM2cnYwVFNkdXZuSy9KcTJvb3dIMEJnRHYwUnNo?=
 =?utf-8?B?RHVrQVpVWi9OblVQS2YzV1pVbHp1Qjcrai9sUzROTHFqMDZZaGMvelNOZ05R?=
 =?utf-8?B?bnFYZDNubjU1N2tWM0VVV05TaTNkeU1Ua0N4NnMzVGRTa2JyV3NVcmQ0bUlq?=
 =?utf-8?B?U3ErY1RaT0JtSlBhWUxZU2U4MWlrQU5kd0tsUXFiQ2lWOW9ITkJXZ0xOYTFZ?=
 =?utf-8?B?YmlUSEJreGxkUTZGSjhyK0s3UC9NM0ZPdnhpV1dRaS9BbFNFc0toS2RrRHRN?=
 =?utf-8?B?SU1NaDE5Q2E5RzBPT0VZRGJub3hhV2FJQkJzREhsMGNXU28ya2dLY0lTRnhD?=
 =?utf-8?B?NGVQVjBjcE9iTmtUa1prOFQ3S3Z2N1IweU1NQ2Q2M1lxUWJYRHQrUE51Zkp5?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99C85795479D2C40A1E7A64E9143EDAF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98a232d-36ca-46b7-7728-08daf76b57f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 02:42:43.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpxIZ0xqLIrpz1Jr9PnCqtPwR6Bqbe9JBdykXjOvqpfNp2v6xnIKYmevKObmOOIo9BHEIyG4BK7FvoUCkeDByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5319
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_184256_973077_2BD5F3D6 
X-CRM114-Status: GOOD (  15.61  )
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

T24gRnJpLCAyMDIzLTAxLTEzIGF0IDEyOjU4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxMy8wMS8yMDIzIDA2OjQyLCBNb3VkeSBIbyB3cm90ZToNCj4gPiBNVDgxOTUg
dnBwc3lzMC8xIHNob3VsZCBiZSBwcm9iZWQgZnJvbSBtdGstbW1zeXMgZHJpdmVyIHRvDQo+ID4g
cG9wdWxhdGUgZGV2aWNlIGJ5IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhIHRoZW4gc3Rh
cnQNCj4gPiBpdHMgb3duIGNsb2NrIGRyaXZlci4NCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB0aGlzIGp1c3RpZmllcyByZW1vdmFsIG9mDQo+IGNvbXBhdGlibGVz
Lg0KPiANCj4gSG93IGRvIHlvdSBwcm9wYWdhdGUgb3IgaW5zdGFudGlhdGUgZGV2aWNlcyBpcyBu
b3QgcmVhbGx5IGNvbm5lY3RlZA0KPiB3aXRoDQo+ICB0aGUgaGFyZHdhcmUgZGVzY3JpcHRpb24u
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KSGkgS3J6eXN6dG9mLA0K
DQpSZWZlciB0byB0aGUgY29tbWVudHMgb2YgMC84IGFuZCAxLzggaW4gdGhlIGZvbGxvd2luZyBz
ZXJpZXM6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0
ZWsvbGlzdC8/c2VyaWVzPTcwMjUxOA0KDQpUaGlzIHBhdGNoIGlzIHVzZWQgaW4gY29uanVuY3Rp
b24gd2l0aCBhbm90aGVyIG9uZShNZXNzYWdlIElEID0gDQoyMDIzMDExMzA1NDMwNC4yMTg0MS03
LW1vdWR5LmhvQG1lZGlhdGVrLmNvbS8pIHRvIGZpeCB0aGUgYmluZGluZw0Kd2FybmluZ3MgY2F1
c2VkIGJ5IG5ld2x5IGFkZGVkIGluIE1NU1lTLg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KTW91ZHkN
Cg==

