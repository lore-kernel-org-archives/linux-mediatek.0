Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42B3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 02:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/wLs71OQKXyoF12UwGjmfNRe/USiM+y/3Mvud1AyPw=; b=e3ajXjekXdp8kAfPs4p8CY5mQz
	6Qw6LIkyhgcfKM/cj1wSM1L8ZKDm/yAzCAr9dEmzb0VFP+aizlHVQS6+iRkXwZ6RFUyyw4CV+MuKQ
	bx+ngkWA4RdxZ8EmAq8qF/WJKpk59oFSujxL3lNbR0QCNT2B+8yK2GMXFaUUHizr1xfrLDGSCNYCX
	QvdSOdfuaKU8n1FYTv9cxhOFZG/SsnwgQwBwmntLxAbEE7+TnwSywDzw5lYa7mSvmUA5t6gLpJ414
	CLTUFpd2IcuG7fFY38dP0lLn/NV4biD8Q6/gwDWmdhrjoYCcNILrLrI3YC4Dv1+SLKaWLQa9SInlL
	pmPQ7wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgYN-0066Wa-En; Tue, 31 Jan 2023 02:39:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgYK-0066W9-Kl
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 02:39:22 +0000
X-UUID: 737586b8a11011edbbe3f76fe852e059-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=l/wLs71OQKXyoF12UwGjmfNRe/USiM+y/3Mvud1AyPw=;
	b=Uj0fb27Zt+zAcRFArmD789LogEPmSsh+6ykw00AUy9RrALjxqmWIGlDAa/YQ09Hyy9oylbd44z4vvSg0NzXuDwvFbAAluOfsINz9vPGJE7L+3QJgdCbPKt/g09yq8GrVEKwW5fTzOLMZxm7VqxrXBJcoSwVL9S0GPGL+QsRaJ6M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:477683e6-011d-4c25-85bd-c5c73b46780e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:a2e7688d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 737586b8a11011edbbe3f76fe852e059-20230130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 566151185; Mon, 30 Jan 2023 19:39:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 10:18:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 31 Jan 2023 10:18:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf+JLsUq/zRGfjYVlCZpbdMHBYtVF4PqsA0gQxAJVScBXqLtbnost2hUyxCqNafPnEirFIE7tA2evIVLdtkOktl9kgaSdipQtz2dWbAc4V5SXXrkOHrpuVTL76vfILDU3L5NoxaeEPzBIwLa3XwswI2mv4EjamQUhu6oGgQZRVk7USukNZqBHwgRuMnsu0LlrCzPlnFhhdxzxyaUKz6gKuZjj/tx9yTMTrl0hHRt5gy2SpWD7/0fUQtMcf0MqcQst08/Nd3oahtemlk1WWUzJvQv9bgRLBXrLnbK/ufcmDCWQLE/UUvI8ERb9xgtcnOMpV8Yq14MqF1zViO6hwGB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/wLs71OQKXyoF12UwGjmfNRe/USiM+y/3Mvud1AyPw=;
 b=ARtX6iZcjZsKCKFfh1bP6/mI6ooBOku6Nbb5mSlRnZGePVMjRHfHShK73lNiWChMoNS+1c2tuB2bRDRaCQ01jNkmK/882cXGhtcD0TIxKPGh0RQbes0l/MSHS+fn4iRJwE2FC9CA7QX0dkMI/RZEm/7XpZdmkVr1SRaV9KcAlYyTZSvRS+6qOEo+wJF8FlrGrxWlI6jlCuZS8kT7Q8HKShZFJBvAMRj3N6p/N3T3B63+2wDSCxeEjyjrIVmrUup/5b4eNGJBv24B6F9IIgUlNiVskVQNQ/+S5mbarH2zFP8fWcnprIs8cMyq56Y4DaMHl3SddP016KzdKqSdEorA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/wLs71OQKXyoF12UwGjmfNRe/USiM+y/3Mvud1AyPw=;
 b=A8wnMnCyP+bbJvTovQYTtzTxH3mNneGcIqCPwo66y1pWZxRh2JK1rG8SbrPHXRjf5+xWgpDQMqWb6LtlNjE6ARrXSNEtY6zyRd4VKPMYu4qzcEMMufAZOmpO7JvxPg5qdaLbKoP4V4kXb/rHu193MG07AJgBBWg5gg/wrxMoQ6A=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI2PR03MB6590.apcprd03.prod.outlook.com (2603:1096:4:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Tue, 31 Jan
 2023 02:18:37 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::4eb5:3fc7:1e3:2f27]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::4eb5:3fc7:1e3:2f27%7]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:18:37 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
CC: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Subject: Re: [PATCH v5 02/12] media: platform: mtk-mdp3: add chip
 configuration header file
Thread-Topic: [PATCH v5 02/12] media: platform: mtk-mdp3: add chip
 configuration header file
Thread-Index: AQHZJxoE2tKZVIYBWE+Y0Al5Aj+L066sKPCAgAu9gQA=
Date: Tue, 31 Jan 2023 02:18:37 +0000
Message-ID: <f3272192528535815049fed6e3ceafc48cb7138d.camel@mediatek.com>
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
	 <20230113064104.22402-3-moudy.ho@mediatek.com>
	 <068ee5ec-6863-2c1d-39a9-b18156d4e57d@xs4all.nl>
In-Reply-To: <068ee5ec-6863-2c1d-39a9-b18156d4e57d@xs4all.nl>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI2PR03MB6590:EE_
x-ms-office365-filtering-correlation-id: 102333e3-55e7-49ee-46e3-08db0331761d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFT4mUEieZrC5sCP+9MsmF3hVbeLMG40BXso7SE2yoYNuTOt5etpQDK7B+hzz8tTmDaetROWKOrFx11FXIb8YxyMSTbF2PMguWcWXpaZTzV6cS3vI68J2I8NbVU+1hgXEHf9ClonsE9TiZTV5Mu34i7rZWlTThlJeTlwOWkL3nzQM9v4lzyIupkVqpebhKvXOZdK2erZZpl7K9AJ5obJZwRwg5s96Ocr7aDqBV63gWR3OSoLvhfuBZG3nDeumFrlhcbhK/sdNl/V0HCdJKSzAtT6zXOUT8AQEa0WsA/oqw5O8KqXCcq8/uRxorKv86gO5oCO/D5Rk6BlbwmTIUz3fTlacX551l/pm4WiBB2IuiDjbdo55QXbzUXjLsxA/ayH5EbjK6HVHexAps2zLIx29TCaWy6zzK6HRJFjOpcnGJv6fUdoQqj+rGZRqieq7YYL9hm6i+5ojcEJNGFZBKSfxaP+MWzcW9dhxF6KqaI9L6m5MJiebsiQnGCl7btEoErd0DySqia8RBYCJAe0NZ0cGLiRG12B0UgnfvoeKzGVRxV+9THajKUGR1QFgou4jm9q6kfy4q+WqQ/sDM7XPtH4SJYm5gyJq5MBOAuOAtJwaGZ3VHoItL+gVIU+KslPAdJeGEZ9o+gD4XzU+Aer39NLnVR+Sz0PBgml/UQhVF47vWm3xtWVEcXWLPnRBfWPk5WReXvgXhaMzrbS28EEUmYmG7yMrLPJqB0QVW7wuCNDaK+7effDtx3MRwjeiyzNVWTgOL2eLTJfxXvt8EFmJdg5vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(86362001)(36756003)(85182001)(2906002)(26005)(186003)(66446008)(6916009)(76116006)(4326008)(64756008)(8676002)(2616005)(6512007)(53546011)(66556008)(66476007)(66946007)(71200400001)(107886003)(478600001)(316002)(38100700002)(6506007)(41300700001)(38070700005)(6486002)(5660300002)(122000001)(83380400001)(8936002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzFub2NZUm1qUXFqeHA4ZWcwb2Q0MHNkLytUVzZPMlZsdEYzR0pVbHNnRHda?=
 =?utf-8?B?ZDIvbFNKcXl5WFNlazdpdEJkQ3NXZDNzQzQzVzV5VnVuZjhPTDhPYU1STmZk?=
 =?utf-8?B?TzJrQU5MZ0dZM1FXR0xxMUZ6RFk4VUhkZzI0QTJQWU1neG15cDd4bGpqL21M?=
 =?utf-8?B?eFAycTYwc21pbzZVb0ZQZ0xGOG1adndmaFEvS0lzbXN1di9GSVQ3Zmk5NkM5?=
 =?utf-8?B?bEkzZ0pHcnZjMFpMU2k5M0xQU0wrVytCOEV5ckRLWk4xOUdSWmhZVGVwZDFM?=
 =?utf-8?B?UmlETzdUa2ZwMDROWW5XRm5QYzlkQnVoYTdGUVZ5UmJTWUplYlJwSE91SGEw?=
 =?utf-8?B?MjFXZGtEK2QyUzVGYU1lbUttMDdYdkw3Y0c1aXp4dHpwbzBHYnRsVHFhcjZv?=
 =?utf-8?B?MDNlUzNTbjJ2dko2VXJOVUwxdXhSWnI5djI4SmtzWTRjVHBvbGxtY1ZFVVQ2?=
 =?utf-8?B?SmJGU0tCbmpNWXNlN0VVbXN2dDV6TldNUWwyUGhqdkVXRXlXNzdadnBGbXVQ?=
 =?utf-8?B?VFEyZytZb3hnMVBZMWZOZXlGN1JYNUEyS3MrbEdKaUtyLzJ0NXBrKzA3M3hC?=
 =?utf-8?B?MGpMRkxFTWJjUHRSNHB4ekhtRmg0T1dRRnY5SDFXbm9oTVF0cXoyZVFhSVZz?=
 =?utf-8?B?Q2xPbmZudjZhM0ljbnFZVkZpeFZDTWlGazQrSmZWaThSUGFlMHphbEs5aE1t?=
 =?utf-8?B?aDFGYXNjV3k1MnZsSnVTOVl4TlpWbjNlSEI2alNaTGRibUlmRURjT3A2UHNB?=
 =?utf-8?B?VlV3VDJscVhJVEsrbXJIUEVzZjgzK3BxTjFVUTNyOG93amJYWWU5anByRWpT?=
 =?utf-8?B?c3hacXNJQ2NXbTBEYzBGK1BsUEY0Sjh0M3VNRmw5MGw1QktZWFR4WFVrei9q?=
 =?utf-8?B?VzJ5WWFST084QVRwcUNKZDF5TkI1cTdWRUtDM1pzOHBCSmFlOWtFWUZxMmVO?=
 =?utf-8?B?dmh3YnVpbjl4bkFHSHpGb3lxS1Q2cWhuS1c4aGR5NkVSVTdGZFZMRmdBd2c2?=
 =?utf-8?B?UEhWblRkWWJ2aDJpZ1gvci9tVXZpelNxaVArU2QwUHNZRkZ1VWQzSy9ldUJx?=
 =?utf-8?B?OFVsUVh6WDNKcTlPWDM4MEh1Rk5HRW90NDd2L0xuUmZOL1l3a2wvc0wyOTB2?=
 =?utf-8?B?MGYzQkxVN0ZzeTY2S1hyR0F2c3Q5eXNWTm4yUVhzcTNIaWpoZklVUDQzaVlQ?=
 =?utf-8?B?Y3ZyRDg1cStsTjNJamd6OXRuemNqWHp3WHZnWVFKVG5IeDd0YlNEZmlKRjZP?=
 =?utf-8?B?UEJvRHFSREM1SWVmemUxRWp2SlcyZmEvSVFsVkZPbVFVN1ZNVnFaUDJaRnh0?=
 =?utf-8?B?YXUvaFNQRHlWNDhCR240YVdoYmJkQmNtcnN4Z3FuYlRzRUg0eGNvUTFPOFBq?=
 =?utf-8?B?R1pydGR0aGhlRjIveEpxYVp1NitZMk1vZi9xUEs3dkVXVTFzcGNkK09NVitp?=
 =?utf-8?B?dWowbGFIRUthd09mYnp0eFZOaExLM0xUa0RZbGdJNVpwMGpnbSs3eGpUWTlm?=
 =?utf-8?B?Y2lycS84V09FVzlZWE5OUE1rNElZZ3hLbXBxRjQ0VHBnTXUvMVI3L3VFakJq?=
 =?utf-8?B?UUJEWEVhVWVjMXdjcHpWLytLN1dCclhNeGF1RmxSYXZmSmtXZEE2Y1NzdXF0?=
 =?utf-8?B?MCtjU3Y5VmM5cHZOVnFxZnR2UEo3ZGVyWktPeUM4ZzJleFF0MlIxNnB3RWhF?=
 =?utf-8?B?ZzFHR0pzTDU0THBXVkJWbWNtS0w3QUVUL2g4bXg3QWlPN0pjc1gzZzZIWE5N?=
 =?utf-8?B?WnUrYVBQR0xDU3Btc0ZPYXQxTk5tbWhZMUgyMStXaDRoWkxqa1IreVJyMUFp?=
 =?utf-8?B?UmFvRFJWTXpBd2x3c09scUtFY2dVd3lEQ1ZERnJEdXQzeXIxTVBhbDI0N1Nh?=
 =?utf-8?B?dmdlZ2NXM2RGY2R0Q3VTek92VWZSWThnMVFrUnNvaGZtSVFWUysxeStqak1w?=
 =?utf-8?B?N0I0UTZQZzBuOXJIYnVrc3dhU2dxRW8zSUFTdmN6VHhmT3N0SzlJclVmYTBT?=
 =?utf-8?B?WmV6N3N4ZTA2djZONm1ETlJJdHBhMXptU0F6SXJIelZFNENDRlFOY2lvSjJV?=
 =?utf-8?B?ZEppMnM3VzFUWmRkdmNBaXM4QWlQRUY0NjVSSVhidWZpKzh4MzE2aDVYMWY0?=
 =?utf-8?B?S21KQnBFdHh1eFZvdjRLRHN3dUIrVjAxVzRXK2wyU3Y2cnVBcENEVXVlL1Vs?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0428C4BA829194DAF6DDEF45D6EFE0E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102333e3-55e7-49ee-46e3-08db0331761d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 02:18:37.2344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4TuvtNQjzcf3L9VEy8ix7jCpeRIrKNgei+JxDdEfRt/E884nvPR4ugC1JQUsMWxLTa5PJNFY1k+8QwlObGiOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6590
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_183920_719470_BA442598 
X-CRM114-Status: GOOD (  26.29  )
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

T24gTW9uLCAyMDIzLTAxLTIzIGF0IDE2OjAxICswMTAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IE9uIDEzLzAxLzIwMjMgMDc6NDAsIE1vdWR5IEhvIHdyb3RlOg0KPiA+IEluIG9yZGVyIHRvIGJl
IGNvbXBhdGlibGUgd2l0aCBtb3JlIE1EUDMgY2hpcCBzZXR0aW5ncyBpbiB0aGUNCj4gPiBmdXR1
cmUsDQo+ID4gbW92ZSB0aGUgY2hpcC1yZWxhdGVkIGNvbmZpZ3VyYXRpb24gdG8gYSBzZXBhcmF0
ZSBoZWFkZXIgZmlsZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHku
aG9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWsvbWRwMy9tdDgxODMv
bWRwMy1wbGF0LW10ODE4My5oICAgfCAzNQ0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAg
Li4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jICAgIHwgMjcgKystLS0t
LS0tLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9tZHAzL210ODE4My9tZHAzLXBsYXQtbXQ4MTgzLmgNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ODE4My9t
ZHAzLXBsYXQtDQo+ID4gbXQ4MTgzLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L21kcDMvbXQ4MTgzL21kcDMtcGxhdC0NCj4gPiBtdDgxODMuaA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMDg0ZjYyZTdkZjUNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210
ODE4My9tZHAzLXBsYXQtDQo+ID4gbXQ4MTgzLmgNCj4gPiBAQCAtMCwwICsxLDM1IEBADQo+ID4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gPiArLyoNCj4g
PiArICogQ29weXJpZ2h0IChjKSAyMDIyIE1lZGlhVGVrIEluYy4NCj4gPiArICogQXV0aG9yOiBQ
aW5nLUhzdW4gV3UgPHBpbmctaHN1bi53dUBtZWRpYXRlay5jb20+DQo+ID4gKyAqLw0KPiA+ICsN
Cj4gPiArI2lmbmRlZiBfX01EUDNfUExBVF9NVDgxODNfSF9fDQo+ID4gKyNkZWZpbmUgX19NRFAz
X1BMQVRfTVQ4MTgzX0hfXw0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZHBfcGxh
dGZvcm1fY29uZmlnIG10ODE4M19wbGF0X2NmZyA9IHsNCj4gPiArCS5yZG1hX3N1cHBvcnRfMTBi
aXQJCT0gdHJ1ZSwNCj4gPiArCS5yZG1hX3JzejFfc3JhbV9zaGFyaW5nCQk9IHRydWUsDQo+ID4g
KwkucmRtYV91cHNhbXBsZV9yZXBlYXRfb25seQk9IHRydWUsDQo+ID4gKwkucnN6X2Rpc2FibGVf
ZGNtX3NtYWxsX3NhbXBsZQk9IGZhbHNlLA0KPiA+ICsJLndyb3RfZmlsdGVyX2NvbnN0cmFpbnQJ
CT0gZmFsc2UsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZA0KPiA+IG10ODE4M19tZHBfcHJvYmVfaW5mcmFbTURQX0lORlJBX01BWF0gPSB7DQo+
ID4gKwlbTURQX0lORlJBX01NU1lTXSA9IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgz
LW1tc3lzIiB9LA0KPiA+ICsJW01EUF9JTkZSQV9NVVRFWF0gPSB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE4My1kaXNwLQ0KPiA+IG11dGV4IiB9LA0KPiA+ICsJW01EUF9JTkZSQV9TQ1Bd
ID0geyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtc2NwIiB9DQo+ID4gK307DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgY29uc3QgdTMyIG10ODE4M19tdXRleF9pZHhbTURQX01BWF9DT01QX0NP
VU5UXSA9IHsNCj4gPiArCVtNRFBfQ09NUF9SRE1BMF0gPSBNVVRFWF9NT0RfSURYX01EUF9SRE1B
MCwNCj4gPiArCVtNRFBfQ09NUF9SU1owXSA9IE1VVEVYX01PRF9JRFhfTURQX1JTWjAsDQo+ID4g
KwlbTURQX0NPTVBfUlNaMV0gPSBNVVRFWF9NT0RfSURYX01EUF9SU1oxLA0KPiA+ICsJW01EUF9D
T01QX1REU0hQMF0gPSBNVVRFWF9NT0RfSURYX01EUF9URFNIUDAsDQo+ID4gKwlbTURQX0NPTVBf
V1JPVDBdID0gTVVURVhfTU9EX0lEWF9NRFBfV1JPVDAsDQo+ID4gKwlbTURQX0NPTVBfV0RNQV0g
PSBNVVRFWF9NT0RfSURYX01EUF9XRE1BLA0KPiA+ICsJW01EUF9DT01QX0FBTDBdID0gTVVURVhf
TU9EX0lEWF9NRFBfQUFMMCwNCj4gPiArCVtNRFBfQ09NUF9DQ09SUjBdID0gTVVURVhfTU9EX0lE
WF9NRFBfQ0NPUlIwLA0KPiA+ICt9Ow0KPiANCj4gSSBhbSByZWFsbHkgbm90IGtlZW4gb24gc3Rv
cmluZyB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgaW4gYSBoZWFkZXIuDQo+IFRoaXMgYmVsb25ncw0K
PiBpbiBhIHNvdXJjZS4NCj4gDQo+IFdoYXQgeW91IHR5cGljYWxseSBkbyBpcyBwdXQgdGhpcyBp
biBhIHNvdXJjZSB0b2dldGhlciB3aXRoIHRoZQ0KPiBkZWNsYXJhdGlvbg0KPiBvZiB0aGUgbXQ4
MTgzX21kcF9kcml2ZXJfZGF0YSBzdHJ1Y3QgZm9yIHRoZSBjaGlwIGNvbmZpZywgYW5kIGp1c3QN
Cj4gZXhwb3J0IHRoYXQNCj4gdG9wLWxldmVsIHN0cnVjdCBhcyBhbiBleHRlcm4uDQo+IA0KPiBB
biBleGFtcGxlIG9mIGhvdyB0byBkbyB0aGlzIGlzDQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
dmVyaXNpbGljb24vaW14OG1fdnB1X2h3LmMuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gCUhhbnMN
Cj4gDQoNCkhpIEhhbnMsDQogDQpUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byBhZHZpc2Us
IEknbGwgbWFrZSBjb3JyZXNwb25kaW5nDQphZGp1c3RtZW50cyBpbiB0aGUgbmV4dCB2ZXJzaW9u
Lg0KIA0KU2luY2VyZWx5LA0KTW91ZHkNCg0KPiA+ICsNCj4gPiArI2VuZGlmICAvKiBfX01EUDNf
UExBVF9NVDgxODNfSF9fICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMNCj4gPiBpbmRleCAyZDFmNmFlOWYw
ODAuLjY1ODAzN2QwNjI1MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYw0KPiA+IEBAIC0xMiwzMyArMTIs
MTAgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlbW90ZXByb2MuaD4NCj4gPiAgI2luY2x1ZGUg
PGxpbnV4L3JlbW90ZXByb2MvbXRrX3NjcC5oPg0KPiA+ICAjaW5jbHVkZSA8bWVkaWEvdmlkZW9i
dWYyLWRtYS1jb250aWcuaD4NCj4gPiArDQo+ID4gICNpbmNsdWRlICJtdGstbWRwMy1jb3JlLmgi
DQo+ID4gICNpbmNsdWRlICJtdGstbWRwMy1tMm0uaCINCj4gPiAtDQo+ID4gLXN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWRwX3BsYXRmb3JtX2NvbmZpZyBtdDgxODNfcGxhdF9jZmcgPSB7DQo+ID4gLQku
cmRtYV9zdXBwb3J0XzEwYml0CQk9IHRydWUsDQo+ID4gLQkucmRtYV9yc3oxX3NyYW1fc2hhcmlu
ZwkJPSB0cnVlLA0KPiA+IC0JLnJkbWFfdXBzYW1wbGVfcmVwZWF0X29ubHkJPSB0cnVlLA0KPiA+
IC0JLnJzel9kaXNhYmxlX2RjbV9zbWFsbF9zYW1wbGUJPSBmYWxzZSwNCj4gPiAtCS53cm90X2Zp
bHRlcl9jb25zdHJhaW50CQk9IGZhbHNlLA0KPiA+IC19Ow0KPiA+IC0NCj4gPiAtc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBtdDgxODNfbWRwX3Byb2JlX2luZnJhW01EUF9J
TkZSQV9NQVhdID0gew0KPiA+IC0JW01EUF9JTkZSQV9NTVNZU10gPSB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE4My1tbXN5cyIgfSwNCj4gPiAtCVtNRFBfSU5GUkFfTVVURVhdID0geyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC0NCj4gPiBtdXRleCIgfSwNCj4gPiAt
CVtNRFBfSU5GUkFfU0NQXSA9IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXNjcCIg
fQ0KPiA+IC19Ow0KPiA+IC0NCj4gPiAtc3RhdGljIGNvbnN0IHUzMiBtdDgxODNfbXV0ZXhfaWR4
W01EUF9NQVhfQ09NUF9DT1VOVF0gPSB7DQo+ID4gLQlbTURQX0NPTVBfUkRNQTBdID0gTVVURVhf
TU9EX0lEWF9NRFBfUkRNQTAsDQo+ID4gLQlbTURQX0NPTVBfUlNaMF0gPSBNVVRFWF9NT0RfSURY
X01EUF9SU1owLA0KPiA+IC0JW01EUF9DT01QX1JTWjFdID0gTVVURVhfTU9EX0lEWF9NRFBfUlNa
MSwNCj4gPiAtCVtNRFBfQ09NUF9URFNIUDBdID0gTVVURVhfTU9EX0lEWF9NRFBfVERTSFAwLA0K
PiA+IC0JW01EUF9DT01QX1dST1QwXSA9IE1VVEVYX01PRF9JRFhfTURQX1dST1QwLA0KPiA+IC0J
W01EUF9DT01QX1dETUFdID0gTVVURVhfTU9EX0lEWF9NRFBfV0RNQSwNCj4gPiAtCVtNRFBfQ09N
UF9BQUwwXSA9IE1VVEVYX01PRF9JRFhfTURQX0FBTDAsDQo+ID4gLQlbTURQX0NPTVBfQ0NPUlIw
XSA9IE1VVEVYX01PRF9JRFhfTURQX0NDT1JSMCwNCj4gPiAtfTsNCj4gPiArI2luY2x1ZGUgIm10
ODE4My9tZHAzLXBsYXQtbXQ4MTgzLmgiDQo+ID4gIA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19tZHBfZHJpdmVyX2RhdGEgbXQ4MTgzX21kcF9kcml2ZXJfZGF0YSA9IHsNCj4gPiAgCS5t
ZHBfcHJvYmVfaW5mcmEgPSBtdDgxODNfbWRwX3Byb2JlX2luZnJhLA0KPiANCj4gDQo=

