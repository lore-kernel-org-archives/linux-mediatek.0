Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6616DC072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 03:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPCvclS62DA7axM6lL8dspsd2PXHkMWykfvBfpJTbPI=; b=OG7bbK22iWhQzVrtHOQGbOfmWb
	ds5w1KT6cbV5YRQii0+9RF0IarCq1JCa3RpdhDZrHXxGMxDNVi0mf3M4t8ERpF/Fjvzuvgy0DFn5w
	jPbcyWGnEUHDANIA9NfYXtELfu2f0bMb0dN6Sf0gLQrmITmAdXTYLbEfhfSEalxxdksGX0ZMAAi2N
	p9V/l/5F3frmDr0fe56SNYu0DNSVkfqfIL5T+mU4RfX2Y41GajiB3eMa8PW71YdfUKHPxNLE11mID
	JAVFPGAnSfEB22liDAi+TWPmFEhcRAhAtFLr9thdQTtGT+IKUOpWFDlgojfIcERrShlgDFG1NQsKM
	xEBgwPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dyB-000Y0n-0B;
	Wed, 22 Nov 2023 03:32:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dy7-000Y0I-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Nov 2023 03:32:05 +0000
X-UUID: ae904bd888e711ee9b7791016c24628a-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DPCvclS62DA7axM6lL8dspsd2PXHkMWykfvBfpJTbPI=;
	b=mtlvq1uWj9+UBAM/dezY6IqpncKivFm4amkCnhfHgf+fCYUYRW7NdVZSJphEI3OQMigeqBYPo5bQZQF5qa1o/wzGR/zCggaW4+TMACaD5w8mIwj1jCtswY945OGZu/whGLqmaPuq+VCN2XnpkE45M13fsIutbBsoLsvjMw97su8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:fb6506dd-b83b-4391-bf88-5bc708c5d9e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:a6fc5560-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae904bd888e711ee9b7791016c24628a-20231121
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 869411795; Tue, 21 Nov 2023 20:31:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 22 Nov 2023 11:31:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 22 Nov 2023 11:31:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLjtVu9i4xZhB6uAS+ma9/zx0ge/VmK+HGIpKZKjxWlmHL5WR2c4BbcjgRjw6JKy1G1LLupVXrJV36G1FcAsYgBYeC4cU+cdvy5R6d2cvxScCimt8xPN70/f3bUN6YNKuufQ31Tiua+IpZxP16IY0tXEUOAEOLtk05lbRYZjqQQkwaJOCU5kffmV9r1BcufuCKBDxpXeYAspbo31M+sOG2+KJqNkEOREnegCQBzYB6gDALJBxHBsOdAIW0OyuF96G8Ouqd/vnNtfiKsQwQbWMliozM/YhNnGZ6BjHXyYgClrQPvxQQnRL1b5KypUopYpw9rawf62pylM2r0ed3cSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPCvclS62DA7axM6lL8dspsd2PXHkMWykfvBfpJTbPI=;
 b=UOu6UXelEdwiaHC4KM1bAqRtU2+woW2ZP+w3MDg+OvQnnGcniqAf2AyZX1xAwEQWs67YV03gT6/k2U0xmOBaamNu6DyChKWUj90BztImK1dNbRXRAGVydMWR7VX1qKY1S2Zs1y1Pj1qWhzpXLVdQAzXmgRF67/cdBXWdY+nLoqMmOxSxjxOajoV9fv1mEiZB6bnlT0YCyW2GBI9qAVSl4d+Z77DtR51Ktj432RyxUUC3nC5wx4dj9kslTKgekmcDjAWb9jNhs4riU1C9ILNm4yK+UShf2VftKFHGKluHJCagtO4hwhggsXvZLUh+Xodoms5uefzxlu+9GXcHDJ96KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPCvclS62DA7axM6lL8dspsd2PXHkMWykfvBfpJTbPI=;
 b=Rz5Vqv2Pb1WZ3TQ504RypGjyb93TRnt+W31Cnq5NAAm9hQflKJu/d7RqMTtR8QhSiTku5ZgD4rTIEhniX3i7U2OWmjwS3nbsA2uVa38JPAvgln+nDMdrtw9miFf9eVM2z45HLQk+4/4WFJeRqLcgn5l3viCBY4qFXgcmEijyfG0=
Received: from TYZPR03MB5965.apcprd03.prod.outlook.com (2603:1096:400:125::12)
 by SI2PR03MB5611.apcprd03.prod.outlook.com (2603:1096:4:122::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 03:31:48 +0000
Received: from TYZPR03MB5965.apcprd03.prod.outlook.com
 ([fe80::b591:5afa:6d11:b5d]) by TYZPR03MB5965.apcprd03.prod.outlook.com
 ([fe80::b591:5afa:6d11:b5d%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 03:31:48 +0000
From: =?utf-8?B?Q2h1aS1oYW8gQ2hpdSAo6YKx5Z6C5rWpKQ==?=
	<Chui-hao.Chiu@mediatek.com>
To: "kvalo@kernel.org" <kvalo@kernel.org>, "zajec5@gmail.com"
	<zajec5@gmail.com>
CC: =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TWFyay1NQyBMZWUgKOadjuaYjuaYjCk=?= <Mark-MC.Lee@mediatek.com>,
	=?utf-8?B?U2FtIFNoaWggKOWPsueiqeS4iSk=?= <Sam.Shih@mediatek.com>,
	=?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "nbd@nbd.name"
	<nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>, Sean Wang
	<Sean.Wang@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: mt76 DT binding: undocumented interrupts
Thread-Topic: mt76 DT binding: undocumented interrupts
Thread-Index: AQHaGRc/U5jqMGULs0uZkIFqcQj9X7CEv2kPgAD3QIA=
Date: Wed, 22 Nov 2023 03:31:48 +0000
Message-ID: <01656a596070b6aa721652e3a1f6a2f6b959d290.camel@mediatek.com>
References: <CACna6rwZ8q1Zoz4UAryipsZ90yVD86BrcTNv1yKyS8F4DXsuSQ@mail.gmail.com>
	 <87zfz76zq5.fsf@kernel.org>
In-Reply-To: <87zfz76zq5.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5965:EE_|SI2PR03MB5611:EE_
x-ms-office365-filtering-correlation-id: 4d00446c-90e0-47b4-da37-08dbeb0b8f65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9XEpKrnt9UZhTu8OTv32JuYE8MfEg5yNNWjOSgl3/TpVgUPeivMccR2X5osqNOpY55c/Q3EcwfOql9zO8KoN127c6Kt//x7EYEsDk+FR6jMGQUj9wcg9wZxEi4jMmw8+2kGFRiGLx74P/eaTLUtLcKgpfzJbeuVciUukEL6GA1gM8h1jmanXxVlLYM/s5zRv8proxxcQnAmniK/8TS0PEdN8lIdymLY2prOLHBpuTNiIoFpMKr7M/IhHWOaloQf1E5ShFQY1LeRDWyHrWcx11OJXL5fcQDr9lHNw3ASs/Xq6a7x9tD/IaLNquQ+9kZM5E/YZidsl4VgMzNSwOsY4bPwfOt5iR3CZrJhwMa2pvy4GIomoqMSXQFkghmeLd2lrfvjcPXJZ/d33ACgOUiC5eF4P1FYbapXSZIBeqr9Wk72iPeW9h+2XO6oisthgXAR+Yf3uCjxXgU+8H6w75P0MgCiYEaw9vWsNl2BhbERtv7qMJEblpWaNbDnK5KWM6PJzUxqrkpBmozMv4lVsMcKzW2fFnmdSsV0X330mV5jSC777IgTygePsf+TOD4vUTTauF4Ebp4vVuYlZt4Wd7Y1aXdaUxJRoFudCDYtsQ76Pky2hMgkI+9AOpC84Ab5+BpaSV//JG3/HcCe5H62mbXyIqK5xO4QXKPFRMkSTp4+wzC/EOG/4+YX0KKwO7WOGT7IdiEviwwz9Z5EwoDYfjERlOfSv96QlxXETsirVtyVWXxg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5965.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(186009)(1800799012)(26005)(110136005)(4001150100001)(4744005)(2906002)(83380400001)(66574015)(54906003)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(85182001)(86362001)(41300700001)(4326008)(6512007)(478600001)(6486002)(122000001)(5660300002)(6506007)(36756003)(71200400001)(2616005)(8936002)(38070700009)(8676002)(38100700002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW1VMDdSeXoyYklYRktpS2Z1emlvcXphYVp0dWpuSU5XVXNkRmluYjZKU3Mw?=
 =?utf-8?B?eXhSeVdtVFkxdDdnTktVRVArQmdsb2xOY3NSZ08xMmRLOEYxVTIvWUVuUG5L?=
 =?utf-8?B?bE5LNFNIRDB6cGFYVXVJMFAwL1A0MUZnTUdvdVprcytvMUlQM2hUVE9HYXVL?=
 =?utf-8?B?bDJ6aEFkdkFhRlQrVUJzUkIvQjZzYWdvbDFhMG1qdlhLWXFjNWFsVVpmMlBk?=
 =?utf-8?B?c1RlOElxN094Tllxa1NUcUU5emY3NXRMVFQxTmdUZFBTZXNjRkY3aTl0UG42?=
 =?utf-8?B?L05JSDVGUVVaZ2IxM3VIZll1NGxOZ1ZJdDVEcmRzN0s3RGNvTHdDdEdBMTNo?=
 =?utf-8?B?azNYTjBTUTFrZ2xxU2UwV1g4dmtxRFhRTlN6OVZhaDNCUGFGbzgzSzdkMit0?=
 =?utf-8?B?cW9nMXJWVlpXNWVzODIyZGVTVjlkRjRoS3djaWRBcmsrMnQySjBVYnJXMGh2?=
 =?utf-8?B?WXRYaU13MlMreUJwVUJJTDJtK2FnRllKZGgxbUdKYnlSMkYwUWVPMGpyQyth?=
 =?utf-8?B?R20wcHJ5dmNFbWkwSi9JRDU5Y0VnWVhYZnF2VFRreEg2d1RZUkhLYWlqWUcx?=
 =?utf-8?B?UVpaUmJqMFhvek9VK2YzaU9BMDBDd2s5MTVtQkxVKzgzZjRhK24rZ1RjTTYy?=
 =?utf-8?B?QkJRdXF4WkUyb2FmWDdrakhHNDJsc2liV2krbjNwZlU4dVBSdTB6OE1WQWIz?=
 =?utf-8?B?d2pPaWlCQ2VCdnN0SGxpTnhQamVkVU9uRWZvWllHTFZvSUs1RjNkUlpxNVBx?=
 =?utf-8?B?NnVYU3JkU2crMHRJSENrbStyOEc2aDQrRnhPUGFVazJGZjZySkY3djNTbjUr?=
 =?utf-8?B?cFJiWXdjR0ZWSmQrcGU3dER6MlF5eTlRTW51ckFaTit4MjRlYk80K0xnRm11?=
 =?utf-8?B?bVo4ZUZMc3hqaGxkWCtTMWZlVmloZEVjRnkzRFhJMzRYZWNZY09sNFdSQmpz?=
 =?utf-8?B?SEhLNzRzYjRSYUZGZ1dsYWRnOGRKSDVzYTJHT1BvOUpBbG0rVlg0RG1GWFVW?=
 =?utf-8?B?aERveHA2eTFHMHVvNlptbHYzTWxTY1ZiSGM2V2cxa25jOUMrb01BcElUMTBR?=
 =?utf-8?B?YzN0VHA4QjkyM1BvUlpRRTdBYUkwRkczOVg4RDIvVjFoOWNjcHcxZGFMUmdC?=
 =?utf-8?B?UDgyKytDQ08zdE1ZVW5xaSsrN3Bid2p4YW5QQU1CdGg1bElFQVBkYjZSR2Zu?=
 =?utf-8?B?dnhVaE1NZ3RKb3dXRWlkYW9xVzRBUHFvYlFnQmhNcWdGbU94UDZqUkFodDkw?=
 =?utf-8?B?SzZUdzBVNVc5NXFhUmJaRFYrRVdibmpTTno4dVVMWk9EdXlJdXdncWJrYWZi?=
 =?utf-8?B?YktpelBKT1ErZGZmb0RYT012dVhORS9vaWp2V216VnBUckVKNDduejBCNy85?=
 =?utf-8?B?V0tRTW5Fa1NXV1kxcDVsOWwyOUY0ZDdKa3lsQTZ6NHAyUnFOZ2MrdUpVVFox?=
 =?utf-8?B?TEFoR3BRYkZ1Z0oxUkpKOHRkdHVCV0xickFvSGpiNTRiYjFUbE4yWFJwcUtS?=
 =?utf-8?B?SmkwRmVPUzdIL0F6TUVOQ08vaDdFa3RKRVYrMU16bHh4UWdjNlhQRVFNTXRi?=
 =?utf-8?B?c3padXU1cFY2ZVdGc29TcEIwMzB2WnhIZTdvclEzN3hodnB4QVQybGZNYVFG?=
 =?utf-8?B?bUhpdnk0MXhybFZpcE5YT0d4ME5QdzlPKzZqbWtrMHRpNUNpS215U2JUU3RN?=
 =?utf-8?B?RDgybFdNeklIY0VKVURFa1lNT3BKR29yM1V6WGhsT1hHMkFUNGpoOS9TSGpL?=
 =?utf-8?B?b0dLQUVvSVpsNTk2ZTN4NDdWdnNYWGpqTDZKbVQ5aXFNcElsL2hIcDljbkVE?=
 =?utf-8?B?MTZNZWJlQ29wMnY3aEg4Qm1KbzZDVURsNWttUlNBVE12MXl6ZzdJTWFMd2tl?=
 =?utf-8?B?QlFKbGM5T1g0Q1NoQWdqN2gvVTBrcVpqTUhNWDViMitGNjdSNUNZQ0pQeHpT?=
 =?utf-8?B?NlNHNzhvK3hZZ2MzTGY0UVcxdEIzOTlMZURMN1piVmhoWnhnYWdYNEZRWmRk?=
 =?utf-8?B?eExVOVNHZm8yUFUrOFRVZGdPNC9PemFOdkJlV0xYWDVGNndubjRsd2Npd0xv?=
 =?utf-8?B?TC9sSnhpY1puYjlCRjkvc1hKWlVxMVdtNURSd0gyenBQWDVGWGdvcnpOMGxs?=
 =?utf-8?B?OXlCMDhXMFJNM0luc1E3Y21TNnQwSk5oR1lOWENkQUhKWVNqMkxVbHM5aGVW?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <865D4082E0D49E4CA30C549A016C1A95@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5965.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d00446c-90e0-47b4-da37-08dbeb0b8f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 03:31:48.5910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYcYugXajHpB0OI1qBGImM8zOpMpIXtnJk6dxI6GzCOie4UN6ZPY/qBaV1FZlnIj26pUVC8A2YVnlgA5Ak9QRC9UhgPolfvPL6ZK6Re4k74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5611
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_193203_842458_92D8008C 
X-CRM114-Status: GOOD (  13.85  )
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

T24gVHVlLCAyMDIzLTExLTIxIGF0IDE0OjQ2ICswMjAwLCBLYWxsZSBWYWxvIHdyb3RlOg0KPiAg
CSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gIFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JpdGVzOg0K
PiANCj4gPiBJIG5vdGljZWQgdGhhdCBXaS1GaSBvbiBtdDc5ODYgaGFzIDQgaW50ZXJydXB0cyBp
bnN0ZWFkIG9mIDEuIFNlZToNCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4
NmEuZHRzaQ0KPiA+IDMwMDIxOGIwNTAzZCAoImFybTY0OiBkdHM6IG10Nzk4NjogYWRkIGJ1aWx0
LWluIFdpLUZpIGRldmljZQ0KPiBub2RlcyIpDQo+ID4NCj4gPiBUaG9zZSBpbnRlcnJ1cHRzIHNl
ZW0gdW51c2VkIGJ5IExpbnV4J3MgbXQ3NiBkcml2ZXIgYW5kIGFyZQ0KPiA+IHVuZG9jdW1lbnRl
ZCBpbiBtZWRpYXRlayxtdDc2LnlhbWwuDQo+ID4NCj4gPiBDYW4gc29tZW9uZSBleHBsYWluIHdo
YXQgdGhvc2UgaW50ZXJydXB0cyBhcmUsIG9yIGp1c3Qgc2VuZCBEVA0KPiBiaW5kaW5nDQo+ID4g
dXBkYXRlIHBhdGNoLCBwbGVhc2U/IEknZCBsaWtlIHRvIGdldCBEVFMgbWF0Y2hpbmcgRFQgYmlu
ZGluZyBhbmQNCj4gPiBwYXNzaW5nIGR0YnNfY2hlY2sgdmFsaWRhdGlvbi4NCj4gDQo+IElzIGFu
eW9uZSBsb29raW5nIGF0IHRoaXM/IFBldGVyIENoaXUsIHdoeSBkaWQgeW91IGFkZCB1bmRvY3Vt
ZW50ZWQNCj4gaW50ZXJydXB0cz8NCj4gDQoNCkhpIEthbGxlIGFuZCBSYWZhxYIsDQoNClRoZSBE
VCBiaW5kaW5nIHdhcyBub3QgdXBkYXRlZCBhbmQgd2Ugd2lsbCBzZW5kIGEgcGF0Y2ggdG8gZml4
IGl0Lg0KVGhhbmtzIGZvciB5b3VyIHJlbWluZGVyLg0KDQpCZXN0IHJlZ2FyZHMsDQpQZXRlciBD
aGl1DQo=

