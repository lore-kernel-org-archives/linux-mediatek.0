Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A96CCD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOkBy4dyfTMnmONnNOOYut3puV/9BhbDv3v0B0L5crY=; b=AVtGDhursW6bR2kNLYpnTEP9/f
	SBQpW0OMl6QDg3jENOErDLO+vlIYRA2MJshofFueU40ar1Cd3H5Z8PV/8PHUaMjK5fTjU1v1KFB0s
	GIHrMDpGu5QsmrDhUOvBzzjakdHvu/+nxc0GUQG6XJYNGF2bz8BuwG27WmOg58/QudEatyRaTD+iZ
	8m7HPaJtF6Hm+VGiFxKRRXmu94IjGXFK0C6u8U6L3T0073f/pg7dcJ++eYrag2l5zE/5A57aojVxM
	W4vb3TXSb8HxDUOG1RPUXdOQhwREpi0moQxpCYMlF1OLvdsivzE86pmgzravJf5d2RXyhPMhJMsWY
	tDSeiScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmDJ-00000003eKv-3FS4;
	Wed, 04 Sep 2024 09:22:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllfU-00000003VBL-2wJZ;
	Wed, 04 Sep 2024 08:47:14 +0000
X-UUID: 44efb16a6a9a11efb3adad29d29602c1-20240904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VOkBy4dyfTMnmONnNOOYut3puV/9BhbDv3v0B0L5crY=;
	b=gH0sWoTzjpQwTb+2tl/KAMYQQ4iBOMSSMWInZybv3MKdWawnKPA0HBbRt1paQEj+T69DXLRZWfR/uiJdphWSu8WPda+9imUq8q18GYNTMgNCsY4eElNcc/I728swB5wYJ7cYbmOIIXgGMFFzUnc7fQUBHk1mPBsIDnueFF/SNtk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2ec8533b-15b0-4a96-b4b8-5b1b2f25f934,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:0461accf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 44efb16a6a9a11efb3adad29d29602c1-20240904
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 256389260; Wed, 04 Sep 2024 01:47:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Sep 2024 16:47:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Sep 2024 16:47:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNKYHr5juTwoBL7Qah1e3vb8N6EtgF3Ji1uFDzm1LvbLLKeRFKXXwvQ97tkQHYC8UECLfSAr/lzrUdi2SHV6naT60X22iwMFnnKFXWn/roAFAjIrUPZwC+kyBg2oE6fFISEtjP+Ti+k+mn6EcUYZ9TCME0+NqPswr2JGN4rYDb4WhApnwbaa+vMz0H+RlLNr+fC4VDk/j8EKDiqfyDwzVEeljDLG0nQ9D0OQn7/Qv5l1ONYgMYypmWc6hr2T26qAyaptWyKxbIltdmOC18SOm9LiuQuKo01wFUBr+YzeVDrTa4+ZqRojPJUyghoQIrF+xpwY31x/pmeFgW9OH2zyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOkBy4dyfTMnmONnNOOYut3puV/9BhbDv3v0B0L5crY=;
 b=yBsAjzTFLD+LNCWpGeZS9HPa8FW1W1q75W0muTSVuPilYZoCnJ+czVBdBG9R+FNvDrH1dBGcV5TIeT3onj0VUFutE7AzWpsb2zrly8O+GA1hG8QY8L3bfdeG7l0o+xqBc7W84ECbvyRE8e5OQ1vOs8S/rgE6eSXRoRVWBqe+y6wPhgiIXjjaCJvWTN7nXNsnqo0h2U3cZBn9ORc+HEE9T/gDNg05fE3YBQ8LAUAuidcpJf0x3StDgMvrvbA8xrwxKg+wncB5cdX/ubLRyOUtcBsAqgUADAbMuct2Cj29tLrzYwQSfP/dXtRZXL60wbS4vy2YyNv7lzBIQOubckHITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOkBy4dyfTMnmONnNOOYut3puV/9BhbDv3v0B0L5crY=;
 b=mWjyX2MWXHB+jfhOyWv5zc8zXfzvLPqd/Leb5bpkvLgDfb1YSmEdFdiGzy2YhffCg9hXEcOe8jsiuy8CJOmyDtzuYrlVAUdSVbeNErZzN3TzmnRI2qsbfAodlfVimBBdUr6dKwdBoaN4PeI/fIWqWC8r8HMDWOxWY55K5L9+SJg=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by KL1PR03MB8072.apcprd03.prod.outlook.com (2603:1096:820:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 4 Sep
 2024 08:47:01 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:47:00 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "daniel@makrotopia.org" <daniel@makrotopia.org>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com"
	<edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v10 00/13] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Thread-Topic: [PATCH net-next v10 00/13] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Thread-Index: AQHay6UIK15WyHKxQEyRACJD3XBCyLIyq/EAgBUKxoA=
Date: Wed, 4 Sep 2024 08:47:00 +0000
Message-ID: <92e7f44fc597b1df93aad8551e1533f088bd2369.camel@mediatek.com>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
	 <ZsZ3wpPXrbwZJXEh@makrotopia.org>
In-Reply-To: <ZsZ3wpPXrbwZJXEh@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|KL1PR03MB8072:EE_
x-ms-office365-filtering-correlation-id: 48512b79-d586-4b44-915e-08dcccbe2492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T3FzRU03VjJkL0swa3U2UGFOdCtQRG9QOUU4Z3U1OTFqM0xQY1RnUS85bC9p?=
 =?utf-8?B?STlGbnZWeklhbmppWDkzbzFSeldpT0xYMEZYbC9CVThCWUNYKzgzUDRlRXNH?=
 =?utf-8?B?Yy9DS24rTGsxelBSRTVDNHlxSTROdGFJQlRaQ1hDMjhPY292cnNMS1RTRmpM?=
 =?utf-8?B?MUZUem0xSU42SmZsU3kvMkQ5QVA0VzQ3Y3NRZXFBQWRhdERjRVJsa0xBdzdp?=
 =?utf-8?B?UHR2eE9MQU5aRm1sdUlFdzRBYTEvd2h3eVdyb2hDeVQzYWZlSkdmQXpvbnVu?=
 =?utf-8?B?RDFQUElzYVg4c25ZeEFQbXpocGowZzVVaU1PUm1VNFlpL0tlcG5KVUZOa21y?=
 =?utf-8?B?dlVmQkQ1dWpnQzVaWGJycTkrSDl5dWUzMlU0OUxoTjhvZklscENqNklHK21h?=
 =?utf-8?B?VkRrOHloTEdVS2h3V2pNQm5abGJUM2x2RUIzY3RHbjBvOU55L1pnY3hkRm1N?=
 =?utf-8?B?T1pQVTFOOG1TdFpwQThRZVRZZkNBUkQvUENOYnNyQWV6dFY4K2gwSllITWpC?=
 =?utf-8?B?REx4UzJDT2ZMbm80dFNrMVdMMmxMWDJvaW5nR1FIbUxNRzFmTmlsSXpWWXZQ?=
 =?utf-8?B?empBMVZYQmNKeWFpeHZUM1lPdDVRalhiV2VVSEhZMDRtei96aWdWS2s1MUYx?=
 =?utf-8?B?dDdWT3B4YTg4NTRnY2FsN0grc2F0eEd6WCt3Ti9tTnpIL1J1VnpRR0ZIQzZN?=
 =?utf-8?B?OE1icFhWSFVoWHZ4bmFaczJwSUlENnBOckZNK2VCaFdKc0plb2lucWY3a1Jk?=
 =?utf-8?B?SG16N1NUTkxBNWxCOWtwR1cvSVNuRFBFTW11UFA3Y0g5VTJzaEhpa1A1clZD?=
 =?utf-8?B?VmVCdmh5L0wrYnlkVEs5QnFkaWt5Wm13N29vOUlNb0NJaFpIa1BpV28rM3hC?=
 =?utf-8?B?VFZoNkF6TURwOU1paEFUbkFPUTRtT0lyWVYwSzUvQWVHVUt1N3hRc1kyaldJ?=
 =?utf-8?B?RWErQUFpNnZyY01OVEJMY0lEUHNKVVZiaHBDenZjYnNXTHhxckhBNnppSVFz?=
 =?utf-8?B?R0FCaGF6UnpWQnU1aGg0VlQ0MHpEdFRwWGY3Y1V6ajJhdDkzVFZocWgzN0Vr?=
 =?utf-8?B?WHZ4SWxlK0RmTUxocVNMcWpHOGZ2aGkyMXhDaEJINGRDSzFkOHdDbWpJQ3g0?=
 =?utf-8?B?cnBFakdidGtjQmxNRTAyV1hxajZGY3VZdStsd1RQcUV0Um5QanA3Uk1HTlZJ?=
 =?utf-8?B?R3M3a0RTU0FrWjAwUGp5aGhXMGZkWXFtazVTN1gyWWpoR1BnbjNNR1BxdkJX?=
 =?utf-8?B?QjRFZTZvUU1zMnFRcHlTa3ZNTjBHek9VdUtSTHVWalFkd05jaFZiNkRjMjlC?=
 =?utf-8?B?SnhwbC9odUlSN2xGU1NiYXVvY2Q4ZGJHWXpIK2pJQndSa0pNL2tFNy9hYVZv?=
 =?utf-8?B?VmdKRXVHRFNXM1BuT3dtWXU2c2JXQ1ExU0tUbnNIWjc5ZVZMeW82YWhlaGd3?=
 =?utf-8?B?eDNkVXdPaHR1dG9KYUk3NFRoRElQV1N6N1BTNUhxSlJCTWtLbHcwNmJOSFNj?=
 =?utf-8?B?V29HUllFWDZvaWtZemY1R01jaWQxK0U1b0FkSm1vU3NEV0t5WE03QnBnZkFy?=
 =?utf-8?B?RFd1b0k3TmR5QWdTZEpJejFXek55cXlRMTBlaHdEajZkUFVQTXlpTkpQSHVV?=
 =?utf-8?B?cDcwRXFHV2ZqT2dVWkd5K0hpMjJJeUNtOFVtRU1rek05cEl4VHU1bTZKNzNq?=
 =?utf-8?B?WlcxbVlkSEU3VEh3MjhLZUJDWWF6cFpHYS9iS05LMzI2SlBBNHdiZWQzSWIw?=
 =?utf-8?B?RE9MYW1EMTRHMXFLUW5OWlRGUnRNRWl3OGJXZHpWcHlsS3M0VWQxYTBTR1V1?=
 =?utf-8?B?WWY0S3Qvd3FucTBzNFFxcnRMYlVIbXg5MzBRRjNoc1hXbXR6bWRydHJXY1lx?=
 =?utf-8?B?cFo4TzV2QUJ4NmJMNVhFRTJZZERxZmk0LzY0blRlUjJ4WXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmhnbHBycFBDbHlWK2RGTmo5aWNla1MxQ0QwUkFjVERpQU5pQ1pKTGdQYkF0?=
 =?utf-8?B?aFNOLzRPdG9sM1kwVXUrc0lhUjBVL1EvVmRjMFZTTkxoQVY0Q2IxU2tuV1dv?=
 =?utf-8?B?TFQyMm1mN1JxYlg2OGMyTnM0bFVKMGNuQVJ4YVdxRnVSazBGaktGR3dRSUNH?=
 =?utf-8?B?R3pQNkRpbVpSb0NCbFFGNjBkZWpBa1A1anFHdlBrTXJaU1ZDOVdRZXljSzYy?=
 =?utf-8?B?RzFkL3BvYi9JTC9nc0xFcnVXVGpZRURFMUVwTkFlMkYyaHpxbkc1NVkrc3NO?=
 =?utf-8?B?dUV2QmE3OUVYQzE2cG5EN2NMd1hLZGFUeDl4cVhjSzdmVXBCZWlsZlNxdUMz?=
 =?utf-8?B?dG5yVUFDcjNFOGRKSldGa1p0T3dJc3ZDZnpmUHU4U2w3MDJPb1c5Y2V5SFhD?=
 =?utf-8?B?bkJmNjlaN2c3dURRVHI3aUtpdW1GUC9Kc2VTQXRMZXZ5QXdKZkluU0VaMjBm?=
 =?utf-8?B?RDhvWTJyVkczaTNoQlZnZGQwVjUySXFRSGJwcWhuaUh4UjJRZDlSaC9IQXhO?=
 =?utf-8?B?cmRML3ZkanNveDdzV3R0Qjl1eUR5TVprQWppZUtjaks3elViSmM0NlBXMXJw?=
 =?utf-8?B?YkxVbHdPU1Y1WlNlc3poTmR0RmZXdGVmcVhYcm5vOGY0QStaR0JWWHVQMkMy?=
 =?utf-8?B?S2IyTjBNSXZuc25MT3RiK2xRbVRtaG5NSWxaOXlnYVJkdDB5Rmt5NkxXTjc0?=
 =?utf-8?B?Nnk3OVUxVkdIbGxqU3Rzc1FUN1hrdjBmbjA2bFMzVXRFdFJHaU5QTE1Mb2hi?=
 =?utf-8?B?eU1mR1p6QjBDVVFJcHdzMmVSODA1Sk11MktXd2JNamdXME95a2FaNk8rWWpP?=
 =?utf-8?B?L1hUanBrU3hRaHNtdTRsYkJOaTBHVkV6NTd6Sm5rWEhPYzZpMGdIYUtpdXMx?=
 =?utf-8?B?MWVrQXVFcXd0aWJVRzAyQTg0MkptWEZtVno1UkJUQjcvN25TMVFYczVsR0pj?=
 =?utf-8?B?QUxENGdXczhCNGZoTUJaeU1tQjExczR4WllQV2ZPeUhBeHhHM01NY215ajdp?=
 =?utf-8?B?d2tXYnM4QXZEeFRLOEV0bVpYQUtCcGc4MFAwUXJEelNlcFRGV0ZSMUxtbnlG?=
 =?utf-8?B?clh2VjNIUzBtYUFQVENvMGVIL216NTZXaHJwdXZtWEFFVGEwdjBlMTBMNytN?=
 =?utf-8?B?bTVsZTJLTHowZGxhaFowSjd6R2FyUDRTR0lIWVMvWFE1RElubmxnNUl5cTQv?=
 =?utf-8?B?MXdPWFZVTENkTDBVZzBjeWpjQmZlUW5kUkZOZFl3M3RtZ3dhZ3hzS2dENVln?=
 =?utf-8?B?Mzh4L1I4ZjU1Tzk1RXg2d3NSVlRRU2J0QWh4azdBRGJ5b1RIdEZUbkRXWFlC?=
 =?utf-8?B?MTZHWFk0L2NSQkErUW4za3lMdkMxN21Yc3dDQldNUmQvOTh4ZlhhRWJ2S1M0?=
 =?utf-8?B?ejBXc0xoSmloUnNOWFV4QWxvc3dxU3lqMWRsVjVsVmNFMkR5aEFNQVhlNmlL?=
 =?utf-8?B?ZlV0NnJYam5hdFpRdFlBQUZScUZ2TytIYUdjVXVHbXd1bU1tR3p3OFlYano0?=
 =?utf-8?B?UmdXbkNhTmk3NXNXbGZaNlRabTBLUEJoYnVKWWZGZXMxTmdzM01lNHFEdDYz?=
 =?utf-8?B?b0NZUFU3NC9Ma2hkL0ppV1ZaWGlmOWpYM2lsbFcwSmFSL0tSekY0Q0I4ckc3?=
 =?utf-8?B?d0hWWVJrZk9NYXhkNzhzOUFLQzJPeXQ2cGIyeXg5alZYSUxPaStFeC9QT3BZ?=
 =?utf-8?B?YTlzNEVtSTVralZJdGRsWWNFVFpCdnRUTFdEOG81UWoyMnBKOGVLbERITnlr?=
 =?utf-8?B?dlJ3TTZVQmdSK01MbW1HN1pJZjRSVmtLdnBwVXJOL1BZZ2JtcjNwT3dERmMv?=
 =?utf-8?B?SGt4WmlSVkVJN05ydFE2VlRtK0xkc2RFWDB4SmV3OTVIM0FhRWlNclJmN3hM?=
 =?utf-8?B?bXJEWU5LNEZNVjRnTWora1pvRmFScExNZXJoSlk4azJlUWErSitzOEFHS2NO?=
 =?utf-8?B?T0trQTlZb2cxOFI1NCtBYzZoUzdzN0NWU0VlQW9uQTdMV0xKVFVRS0NGM0VQ?=
 =?utf-8?B?K3Bnck5NcG95L3ptLzJZYTMvMURMQkJHMTAwVWxYTkRaY1VxT1pieEJ2elh4?=
 =?utf-8?B?QmxNLytMNDJIdnRDcndPeVUzRklLYkxIcjVDYkl6bjcxYmtXU3d0RFhLeTE1?=
 =?utf-8?B?TUM0WThnOGFBMzAyOWhEZmdnRmx0M09QM0Jxak9zcnl1Y3EzSXhweEc3dmxt?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE811E0A0F77F64FBCD4ECC0663F22D3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48512b79-d586-4b44-915e-08dcccbe2492
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 08:47:00.8743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mvs4lHJ9YSgco0dQ2YGg1A0PmNZXnPRA5+uEuGYkcFMq6g5HPbvoHvg3rN8DDOag5L6L3XQAmCdxhOVzEtOkLj+kstOfyI770bVwj5MH+iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_014712_790047_1C72500C 
X-CRM114-Status: GOOD (  15.24  )
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

T24gVGh1LCAyMDI0LTA4LTIyIGF0IDAwOjI2ICswMTAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgT24gTW9uLCBKdWwgMDEsIDIwMjQgYXQgMDY6NTQ6MDRQTSArMDgwMCwg
U2t5IEh1YW5nIHdyb3RlOg0KPiA+IEZyb206ICJTa3lMYWtlLkh1YW5nIiA8c2t5bGFrZS5odWFu
Z0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50ZWdyYXRlIE1l
ZGlhVGVrJ3MgYnVpbHQtaW4gRXRoZXJuZXQgUEhZIGhlbHBlcg0KPiBmdW5jdGlvbnMNCj4gPiBp
bnRvIG10ay1waHktbGliIGFuZCBhZGQgbW9yZSBmdW5jdGlvbnMgaW50byBpdC4gQWxzbywgYWRk
IHN1cHBvcnQNCj4gZm9yIDIuNUdwaHkNCj4gPiBvbiBNVDc5ODggU29DLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFNreUxha2UuSHVhbmcgPHNreWxha2UuaHVhbmdAbWVkaWF0ZWsuY29tPg0K
PiANCj4gRm9yIHRoZSB3aG9sZSBzZXJpZXM6DQo+IA0KPiBBY2tlZC1ieTogRGFuaWVsIEdvbGxl
IDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+DQo+IFRlc3RlZC1ieTogRGFuaWVsIEdvbGxlIDxkYW5p
ZWxAbWFrcm90b3BpYS5vcmc+DQoNCkdlbnRsZSBwaW5nLg0KDQpCUnMsDQpTa3kNCg==

