Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A18C54798
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5vZpjX5aqGvt5dA6/HUlBW3YQa2wRRMw5v6xLif4Zw=; b=GgZIYAuIrcsBYfNFNd2zMmjyHX
	ktV4CHz18VFvumZuhbm6oq4kSmykSnbNPF2y+LjOtIrnbzJ1CHDHriGboV92Pvfg+imgdys1dPwjr
	WiDXqTFlg7iyYx4zp9r/Bt4vnz4pIUUbCWYPnIIKn+MyPN7iFio7pjMSEf6vNSyQCAe9E5vYm4V51
	Cr8/yrlmT75GHz71asJdRKL2j5CViKvH+BF/MMH/faHRIIGPTPxdl2rkDesZzjTTABWRIbKC5mU/f
	igU2NznwulC7UZ2i4iJgl0QiISp8ZHcxGtt4oIEKSM52WeoAXCLQYzu2PmfRKWbI9vYa5DhG2tXDK
	Dr8/aFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riQFf-00000007Oa3-3zED;
	Fri, 08 Mar 2024 02:46:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riQFd-00000007OYY-2y1A;
	Fri, 08 Mar 2024 02:46:27 +0000
X-UUID: 0be75d6edcf611eea8a22560583bddef-20240307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L5vZpjX5aqGvt5dA6/HUlBW3YQa2wRRMw5v6xLif4Zw=;
	b=qgiSraMFIU+gfo/0kwYf9qESTYlEbD7wPRkjHwipAgvuTGY0jkI73N0kwKB/3+kpnft1O+aql9Br8/lQSQi3A3Jm7midfT0H13EFuXiOPWezOc4O9uUDNlRQI7wnpDar2gdbXEneIHCXkZRuHDVqkVNyvxgLJbIlB3y9g616OpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ee67b8b1-459f-4019-8fde-8b29f56440b9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:ca18c184-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0be75d6edcf611eea8a22560583bddef-20240307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 633166355; Thu, 07 Mar 2024 19:46:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 10:26:17 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 10:26:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQKGJ1DqpInmOnHf8w7wvArOzbKBVor40b2dJfd+NSB/WpR/m75XY3B8s9Q7gqj0t5czafnQ+F58sNpD+t3DSlXR9sDvzWlYTk+/eJmL9rk5IUwiawbZ/U21lro0jPMD4GsDJR2Du57rJ66Z85bShrO9Ylmi2etBjJS4MGaWp1LSmZ4uE9wPEvXvlSWz9/g9XC7TWd/WloeXsTSbrAsENt7pEdl/+iXdvlQhq/LlVudcREx/6rBvJRnBsfkq/+AusJglNjKmLf/NwOd4Yj8tQ/RYGMpGeKCjnV39j31MCTFTchSlSNpX7/vo73wo092YTacbppSpOA7Yn52kUIiTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5vZpjX5aqGvt5dA6/HUlBW3YQa2wRRMw5v6xLif4Zw=;
 b=CdU/WiMX0MKTh7UdI2amhpdtgI33RhXEuGgPmc4HUoVBhtBDfLpUmCLheZiqMClg1PtLuZlr7m6Jfm+ilZgLt81SzdkI67eHcktToKRIakTGXL0q4A6eo5xaVBQDRDKKu9AcUh4kgCb/SySkpsN2+vG0W8g8OJhXdJ6+Nr7D9l6KiCnaPz0hXkAUjQFkVhM+c7UVYdt2tVorrmR4KbvsLfF/7mo1EOP9mZlK+rO67HVVQa804nnsERZ8B0wvx5aI3ZaneU8cOwwMyfAiDAW8th3WGzUiJGjPsEPqbOi1X9OzlHq+ia3xobtKEeEhZ2YwTKLM1rrlU7g6ru/800Lv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5vZpjX5aqGvt5dA6/HUlBW3YQa2wRRMw5v6xLif4Zw=;
 b=cC2LAJTxGh/p8uTJ5a/An6WkYi18v1CKpBreWkpzFVaIHmDt8MGUugwzRHGIcoTWNBk2lvxV/AUsJ2VZaHP9g2TfJ8OylixJI/ffeDh0a/wRPklY7poPb+5RPfK0Og9lXaLgbtFkorAp8SRIRH5OgtX1JcbJrtXMcVkrn+dfjc8=
Received: from SL2PR03MB4537.apcprd03.prod.outlook.com (2603:1096:100:59::17)
 by OS8PR03MB8907.apcprd03.prod.outlook.com (2603:1096:604:288::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Fri, 8 Mar
 2024 02:26:15 +0000
Received: from SL2PR03MB4537.apcprd03.prod.outlook.com
 ([fe80::f638:72f7:d063:8eac]) by SL2PR03MB4537.apcprd03.prod.outlook.com
 ([fe80::f638:72f7:d063:8eac%3]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 02:26:15 +0000
From: =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
To: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?= <Chaotian.Jing@mediatek.com>
Subject: Re: [PATCH v1 1/1] mmc: mtk-sd: Remove unused of_gpio.h
Thread-Topic: [PATCH v1 1/1] mmc: mtk-sd: Remove unused of_gpio.h
Thread-Index: AQHacITwK7xLSJpKYkWxgbcCa6yvorEtHu8A
Date: Fri, 8 Mar 2024 02:26:15 +0000
Message-ID: <083923c204bbfaff770d0c8e9274fea4cf31fe74.camel@mediatek.com>
References: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4537:EE_|OS8PR03MB8907:EE_
x-ms-office365-filtering-correlation-id: b6b1dc59-2969-4e01-dc4b-08dc3f172134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cG1nfLirUPufbeGUpV2Cb8EPb64oQdCfEjgA6lRKwT7WJ8jwwQCr6AGoxwGDnqzFDv5dzvrsViVTP2SguurxlAi78Vmzs/gjyYQFnNVNd9hcRhV8thjev2I42i7TYke8llqZ4eUr+xgiGsTnPkRxNA/P2/ZasfY1yghcHL/7EYAtPqtRXiN0J09KyvGS5y0B47osq2Gp+tXwEpvqsGxQpLA80D+Fvpxr+w/an8YFjOa5AO0hVNYAW27VwxYQ7TwdrVhlX0xcHZP8gcHMl4nuWSyKKkXiU1uOT8Q03UsRG2tbohOdOlQyhiWWpVuqXfZ03UH6VtVcBgq4wmTiMrEq4GGtt4u39id5ohW5SZeR8oEjR+BZefmizjSjUy7Dr3Q8A6Ftf1xVqNeYNIM0ID+lcn4oB2id3l0BywZokkIGcfUDCpDJtn4TviX6UUgnBajsr1bjZ9VN7dey3SPof6gnKCm2YqKO5ludFYspQgQ0EU55ntqoFLzPUgmvgEZRhy2tqQe1AGtQp8r23gSPY86ktdMZHAEYsTvRsAnBs7M+uQAfCDrcXE/qH3Qee91C9OcEKWM/8HGi5mP3SIJjzQUk73Dz9jZ9ZW0gA07tuNcnpierG5MLkGrX1edKJDCAFabcdDYuSrTnub8EjsYhpz7OKUzu9JsVHngIDvrvXMfY9V15gRflGqapgP5ecRIN8MSH84z8S6dZNBGchFx9Dk+F3I/4OTEXGVMbbkz6G8GurcQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4537.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVQ3dXEyZng4cXI0dDFRTjRKSysxQytqRnJYQ1VEWDNlMTJ4Zmd5L2JXMHBG?=
 =?utf-8?B?UnYzeU1sOTZBTGxrY0pmVFR3cmpuYVNOUzB5QWxiclNsVWRaMmNoQnhoMFI0?=
 =?utf-8?B?cU8rTElwZkxPM2tteTltZWMwQWdVNUQ1NmpDOE1MbWtMWWJVTC9IZUplU2lT?=
 =?utf-8?B?RVFYSUdRTndvdFhJWWgwcXJVWWdrcXJmUVNyODRLNWdaN2RGdnlsd2w4M1hV?=
 =?utf-8?B?ZklEWlYyWTdxL0xTamsvOE5KWUdvd0prWVF4VkdGTXVXUnFlODVUM29XMERX?=
 =?utf-8?B?NkZQcTQydjdSV0grcW0xbjBzSTY2Y3ovbUhFaU5jTDFLMVZFbE05a2hPamo5?=
 =?utf-8?B?YU5nTGh0S0RFazhOS2F3Um5nUUZmbTVpczJLUjBxSTcza0w1L3BOVG9ZTi9j?=
 =?utf-8?B?N0xBbEdCNmVndGhpNnprTlpRREV3SllyeWc3eVk4RUlJL0xleG9pYm9LbTVB?=
 =?utf-8?B?UngvbUl4NUg1YXh2cHNWVThDNTl4cjVNdmVUcVdHc0o3VVhuM2NJTVFpQ3RP?=
 =?utf-8?B?VmF4V2Fwb3hVd2h4WTZ1UGRkQzhhZDdnK3hKWENXMkV6SXIxT3UwZXJZOHNL?=
 =?utf-8?B?bHh3UlFrTHg5aXVXOGozVDQ0M1d0dVVoUHhjN1Fqc3Q3MHorODhsYlVjSUZ6?=
 =?utf-8?B?VFBjTEdhS05tOWY3ZmhPaTUzdzVaTlh4eFh4SGpvYzlrMS8xYU1tRGgvU085?=
 =?utf-8?B?aklmZS9WK2xaY2E0Q0VscXZ6Mk1Lci94cVA3YUxXbVhvWkVFekhsRTBseEtV?=
 =?utf-8?B?N2M2bGljcnVjMFJsT21FOHY2Mm9LaFJ0TDVVQkZnL2djQVlxY1VER3NlWFFs?=
 =?utf-8?B?VG83Tmd6U1g0bUJVWncySE95aVZuRjNJb3lJMjZTZ3Jsb3crWUsvdGFRVktR?=
 =?utf-8?B?SitvNDR4K2syZDlZWWRUUGdMWjFDTGpQdWdJd2ZlUC82SHhseXZYMWlTUzl0?=
 =?utf-8?B?TDM2bGEyZHBuSXptN3FoaWJCMjdtQjdqYW1pTkVtOUk1bWNWRVFnbjlPWkY2?=
 =?utf-8?B?d3MzY21Nc1N6MGl2UWVReTdMZlIydUh4eS92RHJBMTJMMGFEMkV3bnVQRGdU?=
 =?utf-8?B?YVRNS2h1SHNxeTBsYTJ0aWhERytJRlgvNEFqVG1SeEc5QTZFd0lDOTFhVmFv?=
 =?utf-8?B?ODR0ZXBicU9HUTUzRlVzT042WE4wYjUxT1dpbE9WdUV0dVFLaUpXenJ6WUUr?=
 =?utf-8?B?MDRMbWNKZDk2ZmxSMXpNM0NhakRyYjI4a3R2U1VpY1V5VFhpdlRVd244SVZj?=
 =?utf-8?B?UjBqaVhDNVVBMy9Rb200SkFhMVZjRGFTSVJxTy9TR0lqREk1ME9remZzQzdy?=
 =?utf-8?B?UFpwYUxMdTRpeFhNMjRXRG4zUUxjaVMxUHhMZVVyVXBGblV5azRUc0xMTlZr?=
 =?utf-8?B?NElGSGxreXB3T3BBWStVMnFDbzA1ZWsvRmgzTnFSMmxLNmlpcEk5TDB4UnBC?=
 =?utf-8?B?T09VZ0xaV0ZIREE0T3pVdXJjNmFCVEpHNFcxRU9ublNUTklDeTQ4b2JWQTE3?=
 =?utf-8?B?bHhJdUFvcFBOU0JtUTZmd1BNWDNPNy8wbHBOZmUxVUF2dlEyUTFEQjRIWUNX?=
 =?utf-8?B?Q3FQeUkwQWRWd253SDVCVWRzVkFTR3dIdXhYZWpNc3BaTFhoWWt0UWw5c1h4?=
 =?utf-8?B?ZFh4M1ZoOUpxTmM5NWlTbFRRK1ZBL1NnMGhVM1VINDdibEVPMlBRNUt3SEpy?=
 =?utf-8?B?NC9SWEVmcFhsdmNXV1MvZTJ2YW1taGRZUUhxRzVEbWxSQU5BRDYrWEhsQUZB?=
 =?utf-8?B?LzQxeXRKREtOaFVHS0hXS2IwTDVkMEIxeFFUZkI2R2Jyc2YyVHd0RnNNL21K?=
 =?utf-8?B?OUZoREhXd1hmaXFyeFl6bmM0L1lkaXVtRitjQ0RscEZWZHBMS0RWaldTODFP?=
 =?utf-8?B?UkZUYXZVTGg5eFVaRGJZMC9xeUVLVzZ6K0ZXOHIxOWFBRGJQUk5IZkN6cXR0?=
 =?utf-8?B?Z2U1NHR2QjJDYXJWOUxMNkxWNFY0VTJ1OW5tQlRMZ1dSdUxLYllGcVh3SFg0?=
 =?utf-8?B?QVhPb0xxa1EvTnE4d3FBODdxZ1NLMitVTlVaY1h6MHVBVW5Zd0ozQlBncDQz?=
 =?utf-8?B?TUFVWlhld2VDNFFPd0VPQ2NlYVdzQWJGM3V3U0I3b21RMXJLVGdLOUJWKzdZ?=
 =?utf-8?B?ZWN6YjczUGMwYmhqY01yUzZkNkJNY3B5Z1lESzVQam9lSXdWR2tQcDdyMkwr?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB17BA37BA6BA942A1EDD5D22F66AFD9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4537.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b1dc59-2969-4e01-dc4b-08dc3f172134
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 02:26:15.3125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e02NeAZmxni6qFx2ujh7noVy66zG5FCDCIeh8rB+PHgZB3DNDIk15HbBKwmV7LsvvYXrpnT/qySTJvd57ArNEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8907
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.672200-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0q9Pv57+mndRTbcsMCH+ZLFbc297PAGtWYsCc2iFTIxrfgnJH5vm2+glSB
	IvH74wfK4jdYERBG/3tsIe/TXUbL1bn83JMqUbr1jVtAwIy+aflwOE1lcCXqFmyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AExAtD/T72EbdB/CxWTRRu92KvEVWmYr1Hhdj37to05otGq8SCs6SOv13V
	5FJ8ONqyKfKnSUWPbp9kPU3Xq4Sxw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.672200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5895BEBC7F1F9504FD563C9FD16611A58CC3521EF0ECE048631D2B87475B77442000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_184625_761747_98AD8057 
X-CRM114-Status: GOOD (  14.93  )
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

T24gVGh1LCAyMDI0LTAzLTA3IGF0IDEzOjQzICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgb2ZfZ3Bpby5oIGlzIGRlcHJlY2F0ZWQgYW5kIHN1YmplY3QgdG8g
cmVtb3ZlLg0KPiBUaGUgZHJpdmVyIGRvZXNuJ3QgdXNlIGl0LCBzaW1wbHkgcmVtb3ZlIHRoZSB1
bnVzZWQgaGVhZGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tbWMvaG9z
dC9tdGstc2QuYyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jIGIvZHJpdmVycy9tbWMvaG9z
dC9tdGstc2QuYw0KPiBpbmRleCAxNjM0YjFmNWQyMDEuLmE5NDgzNWI4YWI5MyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYw0KPiArKysgYi9kcml2ZXJzL21tYy9ob3N0
L210ay1zZC5jDQo+IEBAIC0xMyw3ICsxMyw2IEBADQo+ICAjaW5jbHVkZSA8bGludXgvaW9wb3J0
Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4N
Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGluY3Ry
bC9jb25zdW1lci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L3BtLmg+DQo+IC0tIA0KPiAyLjQzLjAucmMxLjEuZ2JlYzQ0NDkxZjA5
Ng0KDQpSZXZpZXdlZC1ieTogQXhlIFlhbmcgPGF4ZS55YW5nQG1lZGlhdGVrLmNvbT4NCg==

