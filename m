Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA6E8FDC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 04:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbkxK0MK4cAvUL8jkxChNqLe6+4h4vw1DzETV9idcH0=; b=Q4tAajB5D0bxijySL5SbHiZHbV
	zQMp0SHAUokNk1jWz4jdHIoG6yiECu6EPV80HVl2B33Rro6n1Jk60VL00AG0Vi2Xed0Y8PkQ7Nwk+
	vyPizECMNvtJjX61ZFh7woZ0/2yan/VSeB54QgkWR721CaddmtXzbHW2AxUwH980dorGyxGyPWGQY
	+SalqKuT99S4d0dNWbs3RrGQrkYKmAbTCRIkp/B5wqvNJ9Qu6fYgoCd6u4DbbdjRSXvl2EAw/YOcK
	GK7YVCSx3gtaW8ODtLDKpClrAqZabSwsJNW+5HJu24KHrSh3hxfrD54SWXHQbrkrvOTnt1tbP/FJ0
	eGpV5GQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qntK2-00G7L9-0U;
	Wed, 04 Oct 2023 04:17:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qntJx-00G7IW-1g;
	Wed, 04 Oct 2023 04:17:15 +0000
X-UUID: de56480a626c11ee86758d4a7c00f3a0-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XbkxK0MK4cAvUL8jkxChNqLe6+4h4vw1DzETV9idcH0=;
	b=RCFEoJaGoA90HHUCGx8e/DXh9E+zsd3XbYuiZhhS4enKW0/Kcqpqs1XtzAbIe7OrWh1qYdBa5mTchF/VOXsj03IElLeqvz5JH59MAY0pCpq85S3fjt7tZ8ihp2bPt2ZWKspRZkCDSOy77hW6/YDsAZApZhBEFH2/mAgYn+ZMB78=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:95d138ab-0bcb-473f-9eaa-e7de24b3bef8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:70808fbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: de56480a626c11ee86758d4a7c00f3a0-20231003
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587429747; Tue, 03 Oct 2023 21:17:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 11:56:58 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 11:56:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4BywYygu2Gv6ypU5kExabAGeGHK71gP4UTNTbXvUYBmRFQEHy8Hhlw9ltHv17aX9q2sbcyxd4obcWqvyeKr87E7Tp5Zrdx9zE3zJpn9oa3qlLNLJEn5QuN3FgDIsMXkWCeZ3/z0NfxIY6HZaYzI2Uvyp8hLF0VaEBb00HR02obPAdF7WJSPcWG50vqgiTO3DNFszD5DfX1xHhrOmdzdHZfJl/VzFZjxZS3pApr5h9QFnmfhXY200j0OLhSvaXG3lYQI3WX8Rsbw0Ht9j5K1zGxN5pg1qNmYkyfXI3DhETXoomfUOTAhN+BYm13Ez7E7m/Wini0X0TtQTi3q9nqLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbkxK0MK4cAvUL8jkxChNqLe6+4h4vw1DzETV9idcH0=;
 b=NiCtn2206hsMsZqHdnyD9aN13zWzIxyjq4begbgrx3INwb6P6Qtv3DV/O1bgbJIF2ZBeiPAMkLZW+EttzrjcWy+yaKfFfxeoP0MvMrmrHBz2mj6GPfIpse7qEyzfVJD8CkgO4p1SRFtRLMetJdrJ2s6x2iDUSIupJb88vVHPxirzSO7GUv8tKLxHb9/+Jg1WF8rJortliaQuWktM5fh4Hf6bQLK6a4LdwifKahSU6ZkCBfQesSHX5gqVBl4Ed8xrnlhvHhobXm/7W7GicGmCjsRDjeZt3KNPOFM30dPudmWoFxG1aSyDDtbXe2stIny1LeL0vPRzIOU9vLbDS7EduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbkxK0MK4cAvUL8jkxChNqLe6+4h4vw1DzETV9idcH0=;
 b=W2BNiGiNLS7Hj4Ep393vzuWy0CayC0lyKmZslU4gRxdbme7ZQP5siXi+jqVSIXemna3MB3sVyL85/wd4XCacHawnBkkXVF4QZ/hrX9N8pwFnyFF39YXUAoVUEt0VTMUxIfgkP1DV2CzEbp3IS/AXBMo4ueszMfaXseW7ZsyKWF0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB5724.apcprd03.prod.outlook.com (2603:1096:4:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 03:56:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Wed, 4 Oct 2023
 03:56:57 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "ehristev@collabora.com"
	<ehristev@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 16/16] drm/mediatek: aal: Compress of_device_id
 entries and add sentinel
Thread-Topic: [PATCH v10 16/16] drm/mediatek: aal: Compress of_device_id
 entries and add sentinel
Thread-Index: AQHZxqWOVnkrMIaRGEmG+RaZLIPoILA5YFcA
Date: Wed, 4 Oct 2023 03:56:56 +0000
Message-ID: <9dff33b4016aa2f4fba45d511ac12cf9b653c418.camel@mediatek.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
	 <20230804072850.89365-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-17-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB5724:EE_
x-ms-office365-filtering-correlation-id: 14f41a53-cab0-4302-533e-08dbc48df436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDcHOM1AzkGk6eRwHOcb80BPbg2jRbxqhrSddbl063PMF9z3bzZWGOu/yMI1JqLVpwMuVkoUsXujy3eosCGPDSi3hFr/rVECxhQDJKdL7Rt4FmzwLIr9a45oI0ssKyFjCFQhrulqkIdLlQDohUCoaTAVVJHpL/QrbnOZ0EsT4gwmgDDFzQfIzyoaIZsex3nC34bRRdTZrsaN0wW0bS/v8MfDuL2oHYHI48BKqQUxDb5v8vDhozvpaK+7VF8pX6W+VxStqVn4R64keRDE3Q4mmVK5JyOOAweEaBd5xJDPozFUnm0O/OlHtGM2+coAPkxmgIHOvSmM/5b6zeVyXZHglh2nTHwskNkpOXAqjnLefePlMgump/CCroEKutQkh+AX/dOSEts76h+bCJGFFRyRuA0r8RxSAnmxMM/VlkOZmgoLYxi+DPwu6yYOY37sF/RMm2L63r8L+r1fkfF86Lk7mAIjL4f4LEtJOr97JvgMBMYbKWfSAFPGhgTjbXyYbpK4CJbeqOY4Y+5DMaDI+zirvjmklGZa8DXbgcr9ClCl0mDfbayFsHsB93M4jwI2AhyKqiawkooiu5vficiUdTDBEQdNhN8njLf7e2KR8IfCAKH0pH+ohouGXCyQwSoZTGcGxliERhP+tPF1egkzwv3PmiEeudGWKw6sZvUiZ74ZKM8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(7416002)(2906002)(4326008)(5660300002)(26005)(8936002)(8676002)(2616005)(41300700001)(36756003)(76116006)(66946007)(316002)(66556008)(66476007)(54906003)(64756008)(66446008)(110136005)(85182001)(6512007)(122000001)(71200400001)(6506007)(83380400001)(478600001)(6486002)(38070700005)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTBlQ0tYWGZjMzZRYXZsK0xmQ0puT3ZFWDllejhOS0NwMGoyWGtxOEVobEls?=
 =?utf-8?B?Q2ZNeTE0ZHU1WjZhL1pNOERPZ25EMlJQNFkwRHZpZkd4VU9RU0Z2MlZiRDc4?=
 =?utf-8?B?N1FGQXgvR3ZvNjdUWHBwU2pYQzVXN0s3a1BaMWRWRmk0eUJGVElXNVNUYWsz?=
 =?utf-8?B?OEkwKy9MMFM4cXkxWC8vTlVNUHhZZXRrTEMyTjJVMWZsUVVDZXlDWmNRaGhK?=
 =?utf-8?B?QmdQZFcwQ0RiZFlwcVowWVZFU0hPekdJV3ZVNXg0dWdXdTdrZ3kzdmJaVklI?=
 =?utf-8?B?dHZPNFhOdzRVUHFuSlVTWEUvWnVuMkU4YzBLb05KNVgyTVlqUDhqWWVuT3B4?=
 =?utf-8?B?MHBkbTh4dE9FdWdGbFJBaEJpUm1QT2NDSDJVVWJIT1lRYXp0cVYwUlJubjZx?=
 =?utf-8?B?Wll2TFlrSEFhaVlRcUp5YnpKK05YWHJVT1Z3dVgwNlRaNjdBSmdJNGIyUWFz?=
 =?utf-8?B?aDl4aFlONm5qRU9jVUhlQ1lYcnIzSk44aTVVL0JxTU9OemhjYk9HNFhkbVU4?=
 =?utf-8?B?L3cxbVN2U2xuUHlzb2lDRnZ1akRxWlkvVzdJd1I3QXRKMDRiUk5OU0crT0pw?=
 =?utf-8?B?TVZsaksyOW9VRitsWW1IN0VIK1ptMnp1WE9LWEtSNlpyQlhjaGFMdTBSWUZP?=
 =?utf-8?B?bExCZk5oSCtURFUyNlZBUkJPaFBpOEowK25tc09pa2dHQzU3RDlNOGpYTzBT?=
 =?utf-8?B?amRMREVFMkMrL3lUdGRpbVc0cHc0MVE0YlZqc1F5ZktYV21rUFRPZXJWUGpH?=
 =?utf-8?B?SlZwcDNJbXpqNG1xNXhZNitQTC9mVU50KzRmenJCT1ZhZURLU0JteFV6SUVq?=
 =?utf-8?B?MkV2eURvSmN0U2lkVnNaUytnYk5FbmRGR1pEVFh3VGZ0S3RkMmgrZ1FwVjYw?=
 =?utf-8?B?TE82ak80OHhHcE9zTk9YOHR4b0traTVKcDlBYzRlU0dSbHc3RUd3dDdKNm14?=
 =?utf-8?B?ZHFnV0FXU2d1aFJTNjNYTENJTnBKVEp5aFhDQlJZK05JM3M4bXpEam5HVGVi?=
 =?utf-8?B?dG1abVVlaVZ4c0wvTm9qUUMxK3lUSERlY1kxRGxFMFZaaE5wSEozb2pjNFht?=
 =?utf-8?B?TXltbm5PK2xLa1M1ak4xdUtUSWF6TjBHZUJPZ3VZRlRVVFN4K1RkcGNHRVlW?=
 =?utf-8?B?L1hkVVEvZGdQMHpqelJJWTRScnd5MW1UZjBOY0VEQW4xQlBVV0pKS2kwY0gr?=
 =?utf-8?B?NEFUZjlVY1E3WnJMR3ZlRlpzd2RBeGk4WS92MytxTW5hR0pIUXFQbUpIRE52?=
 =?utf-8?B?VXowWHlSWW5oWWh3cVQzSXdVa3p0cUJQL3ZxalFsRmF0cnpCRC9mMjBBdG9z?=
 =?utf-8?B?SUhTdHo0OCtGaUt6L0JiSTlheUI3eHR6TEJyUTArMmU1OFRSa3lYSjd1R0ZM?=
 =?utf-8?B?TWdTZ3lKVW1EZHlvTXVNNlB5bkxZQllua2tLeG9WcWdyNkRRbGNkdnRaWkJk?=
 =?utf-8?B?ZUxsL0V1czMxSjJtdXZ2bjFwRUxmb1RYazNFQmxnU2JONHF2SEFUZDRMNTd3?=
 =?utf-8?B?a05yek4vc1BERGZ3Wk1ObHRYZ1JpVElsU1h2QjZBZ082MFduZG5TcC9WeSs2?=
 =?utf-8?B?Y09rYS95dmhnc3BTcUNJaWY0b0U1ZlFTNm9UdFIzQ2xGMjBJRWZ1OFBRd3V2?=
 =?utf-8?B?MWpSYWdTS0pWT0N0Tjhpc29xUEpTTGxsZVZWbk5QT3VWZXd3YUlTZnJQOUFU?=
 =?utf-8?B?M01yOVh3QjB4eDRXN2ZKd2dNa2xQeThieEt2WkpqV3JvUVFNdStHN3YvSDkv?=
 =?utf-8?B?M3NtK1EyL2toWk4ya1FBNXREVjk2WjJlaWhZc21OT1l1NE10ZjkzZkI5aHJ1?=
 =?utf-8?B?Z3p0NXJGRUdmSXFQZUVkaHdFcFIvNmtESWUyUHdlald2ZnNEb1QwaVpTUFFn?=
 =?utf-8?B?aXg3Q1FtVEl2R2FZMHhSTlN6dmRQWlRZV3FLQThVUjBFbm5QaHZkTmVYcFZV?=
 =?utf-8?B?c2I2VlV6emtNYmhMQjlIOFdVU1d4eWZRVVlnMFNiQ3lLeXpGOHZOQ2xLUTc5?=
 =?utf-8?B?ckVuWDlkQnYvTjVTY0RzVzFqb3BnbG1DTktRWmFmemRFUUZJUklDT0UwS0V0?=
 =?utf-8?B?cHFBY3VuRXNIcDNGSTZCRU5WNlBIWXppMUNZdmR3eXYxZVJCU0pnQk12SzI0?=
 =?utf-8?Q?PiQlR+K17oIGCKnzKkQv7vNdw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F90C1E48EF128D418911CA71C795B801@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f41a53-cab0-4302-533e-08dbc48df436
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 03:56:56.9549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hozi3ODoFZX3l1sfRCWLdIrUqM/RFh97f8oFJW2Cd9v7HUb0pY+LF6kb38VguGVVL1hw5+PNjh78dF5Bqsdhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_211713_916383_361263EF 
X-CRM114-Status: GOOD (  18.59  )
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

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDIzLTA4LTA0IGF0IDA5OjI4ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gQ29tcHJlc3MgdGhlIGVudHJ5IGZvciBtZWRp
YXRlayxtdDgxNzMtZGlzcC1hYWwsIGFzIGl0IGZpdHMgaW4gb25lDQo+IGxpbmUsIGFuZCBmaXgg
dGhlIHN0eWxlOyB3aGlsZSBhdCBpdCwgYWxzbyBhZGQgdGhlIHVzdWFsIHNlbnRpbmVsDQo+IGNv
bW1lbnQgdG8gdGhlIGxhc3QgZW50cnkuDQo+IA0KPiBUaGlzIGNvbW1pdCBicmluZ3Mgbm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0K
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jIHwgNyArKystLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KPiBpbmRleCBlNmFiM2VhYTExMjYu
LjcwZGU1ZjMwMDdlNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX2FhbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9h
YWwuYw0KPiBAQCAtMjEyLDEwICsyMTIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNw
X2FhbF9kYXRhDQo+IG10ODE3M19hYWxfZHJpdmVyX2RhdGEgPSB7DQo+ICB9Ow0KPiAgDQo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGlzcF9hYWxfZHJpdmVyX2R0X21h
dGNoW10gPSB7DQo+IC0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1hYWwi
LA0KPiAtCSAgLmRhdGEgPSAmbXQ4MTczX2FhbF9kcml2ZXJfZGF0YX0sDQo+IC0JeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1hYWwifSwNCj4gLQl7fSwNCj4gKwl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLWFhbCIsIC5kYXRhID0NCj4gJm10ODE3M19h
YWxfZHJpdmVyX2RhdGEgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
aXNwLWFhbCIgfSwNCj4gKwl7IC8qIHNlbnRpbmVsICovIH0NCj4gIH07DQo+ICBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBtdGtfZGlzcF9hYWxfZHJpdmVyX2R0X21hdGNoKTsNCj4gIA0K

