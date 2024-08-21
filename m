Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB4AC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRmGREjEbzQK1f/MDP7KOYDdNxkYzZ6YDo5GBv7VPi0=; b=CafNySPT64JsDNoc41a2pgkCoV
	3/OYJLMJvN5Q930+NTpbUEgeujgcTPTZbsxzNgCPaFeU/q7BHW4J9tjwjXHSE4hKnb6aei/sY13R1
	o4mj7N1Nl/ForlH7Xpc2DEmNw/LFl/aDAMBn5RZBHsRVIR1ZNqx6OCJCIMKXK5e1VsQDzE/KZXxfP
	rQFZrGsCsberZpPJb7gWqSOQu7S7Mp3m+8jttifN4dqWSgsEDsK9XiPBQzma8mnQxhb5rO1KAOP7c
	qDO/r+lf+BoPckbdiPGohj2x+6xLjsLPog5bbWsVTOTanbnDC5ztHNK91fG+cDJOr20k55C4xdDsu
	xUA/kAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgiC3-00000008LPG-05Vi;
	Wed, 21 Aug 2024 10:03:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghyR-00000008Ipo-0JRW;
	Wed, 21 Aug 2024 09:49:52 +0000
X-UUID: b2095ac45fa211efba0aef63c0775dbf-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oRmGREjEbzQK1f/MDP7KOYDdNxkYzZ6YDo5GBv7VPi0=;
	b=O5pTScXyIoXxOhP4Whn9oTZ5HQwrszsNkdxDPgRbhs1JiVvmyfiDsAMCYEzSLVdtM2j76dwQXiy0zbk4XG3ycUXGd29QQL7HngTFHQBGOmNP0ctBMInILTXg2uZnf0hCLzAKCZT1JAKqv3fmLXpECYElBXEUfNQQ5QeBzjck8wQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:18f11e2d-f0b2-427a-a5b7-e8eae60334ce,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:26e9f2ce-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b2095ac45fa211efba0aef63c0775dbf-20240821
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1752260563; Wed, 21 Aug 2024 02:49:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 02:49:41 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 17:49:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0ZuDxclyXIou6OqmVBR/J8WkdTNvGGAUrHTyFsKzOFM2U+qeIWaf9dZZvLgKaWlFACx5AQ+skHdIQ07swvfZVRusvIWAcR1YkjAyTrq+NZm8qqIX5pEOj4tWa/K86Wyw818VdGYgaqp74afduLEiTit1a9l9Rsa5/2hgS7IX3hHNe6Bh0YD71XTMiQ6JwfySneVYv6ZRtLeoZjIDj0dCrnnOVLQyP7w5+5GcnYu9eRTLj5uVzoVs+cs9EcY84VGiQEh9VgiCvYyILKI7BmsNmdM1itjBxgupJphE73+GBZKIigR+rlyaSBBi8aTecQahpXGl5oPrFEwIdM+yjoAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRmGREjEbzQK1f/MDP7KOYDdNxkYzZ6YDo5GBv7VPi0=;
 b=kXD+1RoLIfmMdNQJpNuEiGyV8eVcvxxCWRZOLHD1GaozR61dgsYGug/ZrL85ZHTuWx+p/GcC14bZ1LVc3ywadZYuqGPttmJiEI1A9Y7CFj93rFGxs3mgx5rs+54wC9phcyRZFVseDyGBLsdUMxWC3Wns0F7nljPs7xUGURXZKtiI86VX8q7Kuah5QktM2rJIhM5r/stI8AJnLIhJpZ1zb91u0XsGtg1IMma169CM+IKvVP45Oy+iAbZXWAMqx9cw8ZhqrvOwUrLkjMlhB9WPg409kiXAdm+HSKwpyO+pusKmQTJnYOI24NQjv4Ugfy1D4g730hmM+uAcCwykOJguUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRmGREjEbzQK1f/MDP7KOYDdNxkYzZ6YDo5GBv7VPi0=;
 b=KO25TvNz89q9/oJ0Slms2ZBIvuSmGc7MziBjF/xdIz8TRA5Y+Kkfc7bBF/XphU9mtzLS4IrBIvaU9XiybgdNbdLPcv2Pcbe3JC6Lz8ncQp6e35f1epim+/j6YrxIRtOnBNiOeAW3p/a7an/ly6TCcbFe/bOfykE3bofSNy1I44Q=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by SEZPR03MB6992.apcprd03.prod.outlook.com (2603:1096:101:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 09:49:38 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 09:49:38 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "andrew@lunn.ch" <andrew@lunn.ch>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com"
	<edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v10 11/13] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Thread-Topic: [PATCH net-next v10 11/13] net: phy: add driver for built-in
 2.5G ethernet PHY on MT7988
Thread-Index: AQHay6W85idQ8hnfk0ODpiyAitmPOLIfNosAgBKRBgA=
Date: Wed, 21 Aug 2024 09:49:38 +0000
Message-ID: <c21fe0db83dd665d4725ffedc51db9063dbe2f3d.camel@mediatek.com>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
	 <20240701105417.19941-12-SkyLake.Huang@mediatek.com>
	 <ebeb75a3-a6b1-46b3-b1e8-7d8448eb23f6@lunn.ch>
In-Reply-To: <ebeb75a3-a6b1-46b3-b1e8-7d8448eb23f6@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|SEZPR03MB6992:EE_
x-ms-office365-filtering-correlation-id: e3ce3934-e770-449b-b98a-08dcc1c6925a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEN5Z3I4eEhVU093WloxNjAyaDZTbTlFWE9oZmJTOGdrN1l5WWlsMXIxL2pZ?=
 =?utf-8?B?elU3UjJCbE5WeVpZdXR5T1pCTHdLaDQzMVA0eWJuYm1ISm0ySk9YU3JOR2dB?=
 =?utf-8?B?MmFOcGs3SFJBd05OVEpGSmdCQ3oxRFI3S1BMRmttU2JRbENZNldSWGNHNnJk?=
 =?utf-8?B?b1BxS3hwVXo1aVFJRzFpa3liYUdRNTFnVGlVcEFGZkxCZElSc3Q2YVViUkF6?=
 =?utf-8?B?eUxBL0FSWGN1UmFBazFHcHdTRzJ0S3JvUlk5R3IxVTV1eWNGOGFQZXRLY3c3?=
 =?utf-8?B?TDRiN25tTDBuZmlnaVFCM3M3T005c1R2Y0Iwd28xdGs3MDdFbksvQ2E3dDR4?=
 =?utf-8?B?RXEwckx3YWRYbVpHdDBLOG5VZ1NCS3ZkcU1ZSnlOR0U4QUJZY3lFbmUxa0tv?=
 =?utf-8?B?RGxJWEdmZVlrT2djdVJXSUtxYk5pN0JiT01ZNHE1T2FBbG96ZWRBeUNicWJi?=
 =?utf-8?B?Z2UxUVYxa2NGRnBGZmF2Q1RjVWc4QWJscWlHNjhoNkFQNHZiK3NIMkg5b056?=
 =?utf-8?B?ZzVYSC9nOVY1TFQzNUhUcGdhNGpEMVhDaTdPUy9QQjdVYTR4V2VtZzVUU05l?=
 =?utf-8?B?TS95TFJCMUNteEZmM0laSUxzNHRvbWwrVnJyS1pKQXZxY0NXQ1lrSkk1Zitk?=
 =?utf-8?B?akZ5aEtiOVNUZjhrUnRoamFoVjFBSUJYMytxZEtiL2tsTEw1dS9UR3JKVmtZ?=
 =?utf-8?B?OUsxeVk5RDhrWnJQR0RXd0M1Z2hKdHBFeFhXSUVtcll1NndPbFdBd011Tmkx?=
 =?utf-8?B?eGg4bW4yRVlnak9jUkdUYkRMN1VpNWtlS0VjaFc3Z3BCUTFTRjNGbktPdEFE?=
 =?utf-8?B?R3lCbnVWZDZNMzhZb2hGbUkwTC95aTZzKzlKK1p2RHQyUkpRMDNaandmMzVh?=
 =?utf-8?B?c1pER09PYmdoMDlIMHAwRCtURlNmZEFjdXZHMjJ0VXh1OEVnUzg2UVNseGRt?=
 =?utf-8?B?WFNWTUNTQ0dxa2NmSG1ZNXcwRmVuSkVZSU5Sdnl5dlI4SE84SGNvT3RzTXZn?=
 =?utf-8?B?VUduRDZ2cTExVDJGRkVsQzdOK0NtSk51YkQ0cXp3SmlKTGt4OXlYdzdpbWI4?=
 =?utf-8?B?c3U2MVY3TndUUnBUaUlremh1SnduVnlwbjlWeWJtc1dHZ00rcktlMUwyV2tS?=
 =?utf-8?B?VmVWY3hmWWRnRWQ3bmFZQW1GZjZJY0lwQ1c3S1ZlWnZYRVZHeWhDUTdqdTk3?=
 =?utf-8?B?NWZhT29yblJrN01pK1pOVm9qMmJnb0VxbDFOcXVFbFZQRW5MUCtHVW9KdklK?=
 =?utf-8?B?VlcyNmFFVXNydWNJemlONDhlbjJCUDV1bVUxYlFMS0dWd2ladlFiampnQkx1?=
 =?utf-8?B?YTdRSVVyajF2cUsyM1UySkZJNk9Lbk1MQ04ySzlJZkhwWDV2cFF0em1NcE9q?=
 =?utf-8?B?MldPL1QyZ25Yb3ZuUFdEemxQY0IvRG9RMW5CNklkL1FINWM0RTRRS3dSQWlE?=
 =?utf-8?B?MWZsU0U3aEdiTlE5cDhHb3ZOODhvMjQ2bmpmWmhZU3E4WUt4cXQ0VklkTGJr?=
 =?utf-8?B?S1p5QkdCM2pUVzFDTzk5aS9UcjZGZ0hGK1YzV1cyKzZ0TXVCUThNUm15MU81?=
 =?utf-8?B?U3JpaXBkRzVneTd0YndhdVQ5MTFhdXFNcG84cVphMVVVL0E4bGRFaGlFdGQz?=
 =?utf-8?B?MzFJUkYvWFBxaXJxcVpyU3p3a3Y5ZEswczFPcE1ZOFBjdVJ4QUs3VGtJckZ0?=
 =?utf-8?B?cHV5THhmQW1MUzdQbUhMVmxPekIxZ2dLRDZIUDlVSUtOVzNDWitIOHFteklW?=
 =?utf-8?B?aHp2Z1pabjBDQ2NydHNkc1NBNm01MWRqZll1OHJ3U084aW1sb1BNdFZrWVBG?=
 =?utf-8?B?MGR2eUZDSUEzWVhDc1dwOWJVdXkzcFVVTFZOVEYzZXlsQ3pGbkJ5bkJqTGp6?=
 =?utf-8?B?U2V3Sk9OcHpIaDhpa3NFZTBadGd4V01LYlpEd1l1aS9ZdUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUxjZURVdWNTMFI4WXcrakFVeUFYaGpIcXVKNENUNXFub0ZCVGhZUy9rNWRI?=
 =?utf-8?B?UUtCRXNObEVTY2x5eTZ6dlRFZ2Q2eHBKaU5VeENqby8vTG5ybjZSVUNkeita?=
 =?utf-8?B?cFpNN0I1M0dFeXBlL1lzWHhyKy9aTVpIZ0toaW9yOHo0MGZpcGdpWEF3UUNN?=
 =?utf-8?B?VWlMSTBMYXBJSjJBU2ptYS9vYWhGNU9CLzUvNXQrSktCY1c1ZEpVWG5mOWNO?=
 =?utf-8?B?QmFMdTdBdVJINTNYc2NlL0JaQ2txNnJoMGM3Q05GSU0wY2JENUM5Lzg0Z0xk?=
 =?utf-8?B?dmdCbk1DUVRKWWM5RTJJV3VuVVlwcCtNdC9sR042MVNmektZTEJIVnRRWGxQ?=
 =?utf-8?B?V1cxdkZpNGE1K1hrd2tPREdOTnBEaDVNaFBEY04xV0tXaHNxSjlSK2piOVM0?=
 =?utf-8?B?Q3JPSVlxT3VUbnhSOVlia0FhWnZ3UUNOUENwSVFXYk80aEF5KzZzb0JFM3Jh?=
 =?utf-8?B?K1hSSUtYb2xKQWVOZ3BUS1BlVmdqdi9aSURUdCtJSk5qcUZIYzdKMytTOEpr?=
 =?utf-8?B?RDR6ZU5XWXA1VnB1OG9oUVE4VUd4RWNhZkZQeC8vdXFJZVZKekJURytYRGwx?=
 =?utf-8?B?Nk1WZEJkd3JxQlZuWEVpdWcwSTA1TTBuRXZXcDZ1czBFdnhFQWRYdnZQL04v?=
 =?utf-8?B?eHlrTjJyamI5d3BJYlhneXlQdXhzV0pDUWcrMnZ6dTlPemhJVU1aREVyRVQ5?=
 =?utf-8?B?L1huemlUQzVxaHNoSWRla3dXTitzS1dHVTYyWXI1elk0RUJNWTl6ZjdlYVVp?=
 =?utf-8?B?SXp2cHp3aGpmT09zR2dlYmxQODZHajRyenFVcFdOS0p6aTFQZmF2RGJSLy82?=
 =?utf-8?B?RnNvdkUwalUyUURLVVhmTm9acWRMZjZXK0xTNGEyR2VyNEVEdFlwNkZkbm1Q?=
 =?utf-8?B?Zk9wVWJYSEFSYVF4MzN2VFlqZXA5RHJQVEVQR2xTWGpMbVk5cktxUUpqVjB0?=
 =?utf-8?B?RDErUit1emZQVEt4MXRnYjEvcnFXbWZWMUpwUlZkVU5mKzZFZzJYdUpIWnQ5?=
 =?utf-8?B?SHkrejFYVnVWa29vUlFNQ1RRM3JjOFB2QkYyRnArcGRQZTJKcWYwajNPdzds?=
 =?utf-8?B?UklDMzRzcnNpa1YxdUxGbVdjMUpVdG00clFzZW1uVHVQdGdLVXdEbWh0WDBj?=
 =?utf-8?B?VGM0YzhwYUJUSldRM3Y1NDdJcWwrK2FrMXR3MDJkRDgwdUt3bWREWjdGdVJV?=
 =?utf-8?B?c05HVVJtbW1ra0FXTDN6dWlmc25EOFhTSjg3eW44VkpRZ3c4VmwwcXA3bWdT?=
 =?utf-8?B?WGt4Tld2LzVNV3hCRm0zdG5lN2ZJUHBhTlZ1YU1nenNIUEtHSCtDSmJiK1E4?=
 =?utf-8?B?aUVRVUxEWTlZK2RxTDZzR21Lb05yLzhlUE9EekRDcFRJTzhaZTlQMkR0RTA5?=
 =?utf-8?B?SlVPUlVHZDZnR3JFSWRiQXAybW8rUkc4Q0xvb2hIaUM3bjN1VWFZN0FkeUJz?=
 =?utf-8?B?YWU3NzBUZ1ZKVEN6OUh0SzRvaGZTbXlyUTF6QVJVVmpqMDF4bW8rVkd1TVl6?=
 =?utf-8?B?Z1hvdnBjeVFLeVNySUxDaENpNGVNZUsxaFJQalk2cWN1V3E2c2s0TTVkeEFh?=
 =?utf-8?B?QkU0Rmh2eDNTeS9LSTlGK0dweDVhMHZJMS9ia01ia0FOMit5NlFZbU9nclR2?=
 =?utf-8?B?Q2xteFJMZTdFNEl0Y3Z3NkQ5ajByTzJqaGFVTUdQRHVQczVtakl5Wm4zSi9D?=
 =?utf-8?B?OWhnOFN0K3VXdWxlSWdPeVBhOUZ4UmZIOUx2L1ZGOTg2SmV5ZjR6a1RBSGh4?=
 =?utf-8?B?ZHNsR081K0xURmJSdVc3d2VOSTUxSis2cnNVNkRucnAwaUVlN1VsbDgyZHpt?=
 =?utf-8?B?NEJkU1hMODgwcURML0pWb0VBbWIyZkZhZjhIR29NajY1bVI2azdJZitJbUts?=
 =?utf-8?B?RjRmUzlFOFJoOXpMc0ltcVd4S1Y0WnNaRTJTTHZTYkJjdHB3WmVkZ1RPT284?=
 =?utf-8?B?eGZZd0lpejc2MGllYU9JeDRlbHJkenZKWTYwd2E2QmVkTHZYWElPTUtQVStx?=
 =?utf-8?B?cGM0MzExbVQrc3VYcnNBWlRBVzM1Z1pqbjNhYUtNWFAxSDNoaXRiamUrSm1P?=
 =?utf-8?B?cUNaR2gyT2p2QzhILzRJZXZKanBNZkxlckF1VGt1WEdGZU9QWkQ1VFVhKzEv?=
 =?utf-8?B?WHpsYkcxSGI0OUQ5ajRVTU53M2cydm5wL3RwUVl2amkzRk1ReUY4N1dIeHFD?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <573EA5D62DD5534782CF3413223A40FB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ce3934-e770-449b-b98a-08dcc1c6925a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 09:49:38.2801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kpL8c/Z2TKKr9+Mx53lg8IjMz7lvsW5Wc3WbBmr6BSZVjhkASFc6wxQBNVj3+oJUrIUpqsAZKOR0VGjhqkJjb+R/VWF25NLNdZAgodEePo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_024951_169315_DA172CC8 
X-CRM114-Status: GOOD (  17.27  )
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

T24gRnJpLCAyMDI0LTA4LTA5IGF0IDE2OjE3ICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICA+ICtzdGF0aWMgaW50IG10Nzk4eF8ycDVnZV9waHlfY29uZmlnX2FuZWco
c3RydWN0IHBoeV9kZXZpY2UNCj4gKnBoeWRldikNCj4gPiArew0KPiA+ICtib29sIGNoYW5nZWQg
PSBmYWxzZTsNCj4gPiArdTMyIGFkdjsNCj4gPiAraW50IHJldDsNCj4gPiArDQo+ID4gKy8qIElu
IGZhY3QsIGlmIHdlIGRpc2FibGUgYXV0b25lZywgd2UgY2FuJ3QgbGluayB1cCBjb3JyZWN0bHk6
DQo+ID4gKyAqIDIuNUcvMUc6IE5lZWQgQU4gdG8gZXhjaGFuZ2UgbWFzdGVyL3NsYXZlIGluZm9y
bWF0aW9uLg0KPiA+ICsgKiAxMDBNLzEwTTogV2l0aG91dCBBTiwgbGluayBzdGFydHMgYXQgaGFs
ZiBkdXBsZXggKEFjY29yZGluZyB0bw0KPiA+ICsgKiAgICAgICAgICAgSUVFRSA4MDIuMy0yMDE4
KSwgd2hpY2ggdGhpcyBwaHkgZG9lc24ndCBzdXBwb3J0Lg0KPiA+ICsgKi8NCj4gPiAraWYgKHBo
eWRldi0+YXV0b25lZyA9PSBBVVRPTkVHX0RJU0FCTEUpDQo+ID4gK3JldHVybiAtRU9QTk9UU1VQ
UDsNCj4gDQo+IEkgYXNzdW1lIHlvdSBoYXZlIHNlZW4gUnVzc2VsbHMgcGF0Y2hlcyBpbiB0aGlz
IGFyZWEuIFBsZWFzZSBjb3VsZA0KPiB5b3UNCj4gdGVzdCBhbmQgcmV2aWV3IHRoZW0uIERlcGVu
ZGluZyBvbiB3aGljaCBnZXRzIG1lcmdlZCwgeW91IG1pZ2h0IG5lZWQNCj4gdG8gY29tZSBiYWNr
IGFuZCBjbGVhbiB0aGlzIHVwIGxhdGVyLg0KPiANCj4gICAgQW5kcmV3DQoNClllcyBJJ3ZlIHNl
ZW4gUnVzc2VsbHMnIHBhdGNoIHdoaWNoIGZvcmNlcyBBTiBvbiBmb3Igc3BlZWQgPj0gMUcuDQpD
b3VsZCBJIHNlbmQgYW5vdGhlciBwYXRjaCB0byBjbGVhbiB0aGlzIHVwPyBUaGlzIHBhdGNoc2V0
IGlzIHNlbnQgYQ0KbW9udGggYWdvLiBJIG5lZWQgc29tZSB0aW1lIHRvIHJlYnVpbGQgbXkgdGVz
dGluZyBlbnZpcm9ubWVudC4NCg0KQlJzLA0KU2t5DQo=

