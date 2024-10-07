Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C29CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 04:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR6KU2gQKVhDAxipXrzmfcXCUceqYyaCi0Nqb1OjjQ0=; b=SrV5sr4lWsTwExUMSHXgWqRop1
	IBPfJeic3tB2ek7aEc86q4buDnNUHpMCx5+JCM3bFzqZ5tvkJm7/sphcFQ2VJc5m8u8RZXHDTQpfU
	OVd3aNM894tArTCKCIBXwWWAho9Qr1c8I8V7+3i0tqsg0I5IfkjUDX7cZRhydUhzeWfEehn7x1kp1
	jId97j1IN9ivAF4c0WNA/bbDTVdCSo02VKno1XK2Up/WC7U4uKjGCqgU/KvaoGg1Ka1PmL1CizHI8
	JpToVGXWbvdhpnreWyst8t6a4t0lye41P8OF1WlHzZ1JYV3JLFLTAyVA73NwTk2PNcv0HdDsBArWe
	13EGHLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxfO4-00000001Ecc-2fGl;
	Mon, 07 Oct 2024 04:30:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxfO1-00000001Ec1-25xj;
	Mon, 07 Oct 2024 04:30:22 +0000
X-UUID: d9b87302846411efba0aef63c0775dbf-20241006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OR6KU2gQKVhDAxipXrzmfcXCUceqYyaCi0Nqb1OjjQ0=;
	b=QKiZa4mDOTN4os3Dz0Uw7YdJR7BhFaFfJFg/a/g9XG8+bzwtIp4zxwKH72OOD1jO7+WMOlKVL66MD3AbxfAY2BkjPSzqg+gZgv3sgBYTn8cZF2El7ojwduFl2fmYReH0amSzpmtIPcyJDEIFZzY6z3cA9c3ApP4e/a554KugQR8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:06e538ac-95d9-437e-87a2-0759773cf76b,IP:0,U
	RL:0,TC:0,Content:4,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:4
X-CID-META: VersionHash:6dc6a47,CLOUDID:20456326-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d9b87302846411efba0aef63c0775dbf-20241006
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 262338983; Sun, 06 Oct 2024 21:30:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 12:30:12 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 12:30:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj6bZakutijCoIsk56gPQQJeCws0mtSHSMMwN0W77k8tuf3z96YAj3Ms8t5unsdbYrkTaLLlnDxvhKZqfez5eK8IFbf6Ci1sLbNj2rDG/wcL0lI3zhF+GAH2wm13nF4ViAToFGNqUcT+ks2BU7P6ZYiCutUjZRJOvLr8x0EqM3bjpPgVUwIbjd01Q7nkPBQD04COgsYnmZOL5NthoAurwAR1u+KTf1kqtuuVXJnxoiUE1G79T2zqq/xFSqQVEARucly8BChy8X6lEjWZhvn6VdRDHm0d6r1ENKAKnYr72EdrEUqjNO36cmrCjUcTe1ssUDBgpALAvQi7DVm3jzY1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR6KU2gQKVhDAxipXrzmfcXCUceqYyaCi0Nqb1OjjQ0=;
 b=yWGY04sZhTc59CIqWwX2HunspErPfDQ+Op8mkwItCFZrx8ZUOzwpIokti9ds6glfsWBqwt5T98KRQHuZk03mrTm8XxXd5m/NdBQ6u5JAxCUhaUALJb4OP8PtpDK3UG//ID09VYpWZha3AMe/0tAtAjM6Kpe+x5xcWiuVd4SneyOu4/+N3QXY5RLMG8Pu8ThWXCRMSGlI8+iZNRr7+JXCH9QLVEmuGaNypAV4d6jS/27tg+LUEokYeG+2xOPfc9OjD0jTfjeGnljJ6ZtRvUzNCSeg6CX7XYTMxK9dzYlitBfpulpTTihRLdy0YV3hjS+DxnPlS2n4qgmrDO8DJhhetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR6KU2gQKVhDAxipXrzmfcXCUceqYyaCi0Nqb1OjjQ0=;
 b=eDCjdpjPSzSGkRY/dndWgEljk3N/in71wAtqpGBPwRg42Y2Kt203sz6VRRTu/Gkzo6Wrv8y1Abtn5WjuHfYZKX1DiHcKmUf0Gss1gkPNoZ2GBjYHicJg+Dbh1xhyO50ck3q8nO3O3u522jTx8/v7F4ZxKKholeJkke/GVpjGXmk=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by SEZPR03MB7754.apcprd03.prod.outlook.com (2603:1096:101:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Mon, 7 Oct
 2024 04:30:08 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 04:30:08 +0000
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
	"daniel@makrotopia.org" <daniel@makrotopia.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 3/9] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Thread-Topic: [PATCH net-next 3/9] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Thread-Index: AQHbFkfaenlbp8pgpkGi6i5bnyrkHrJ6QK8AgAB17AA=
Date: Mon, 7 Oct 2024 04:30:08 +0000
Message-ID: <3f1c73ec57aefa2803df0c32c78dcdc41fed4126.camel@mediatek.com>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
	 <20241004102413.5838-4-SkyLake.Huang@mediatek.com>
	 <afd441fc-7712-4905-83e2-e35e613df64a@lunn.ch>
In-Reply-To: <afd441fc-7712-4905-83e2-e35e613df64a@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|SEZPR03MB7754:EE_
x-ms-office365-filtering-correlation-id: 3d519182-a70f-46d0-a711-08dce688b97a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ckNONk9LcjJZbi8wWXhCQ0tab3BlR0c3Qm5aSksvTXk2WlZNTkFtdjgyMTlY?=
 =?utf-8?B?NUNhVkRvVFFXV25rSmg3Sk5ua1hrY254TEZRdSswNkNNNHd4UGZZSVlaTzcz?=
 =?utf-8?B?NFZLTGgzRlUvYTN0VEpTWFlmb1FsSkRqUEZSMjQyWUg3bnMrNThIK0dqK0xr?=
 =?utf-8?B?a2hIUkhLSlUwWC9QWnpuY1Bxb0t2MHJ1a2d3ZkorcERQMXNCcGk3b3N6RFV4?=
 =?utf-8?B?VnRPeHpxOEl0Zk4rODgyUnBaM2hhZVNrV3N1TDQwOVpJYUwySndBaVgyOUJH?=
 =?utf-8?B?am5kRys5akpXN1V0L0NtZDVZSXQwSmJ5UFFmSXRZWnVZYjYwOTRoNlpBSGdl?=
 =?utf-8?B?WFo4NE1iSVFvbjl0L2MyV3JOcXRlNXd6WHo4Mm9JczZhblIwVnVTdG1vNXN1?=
 =?utf-8?B?OE5ST3RwbDlyc0pEVGw5T3Rkc1U5T3FjUkhMMThZSDlwMHl4OXJUVXY2ODhn?=
 =?utf-8?B?OVJvZStpeEVycDlsN0h5cGx0QkNrUjZnMkpIM2ZaSUJEYUdYSlBYSVlUQk1h?=
 =?utf-8?B?eFdSeHRHVkh5UytaWkloenZzYVVCQVBOZ3M1dmVMYkg5QzY3RFNBR3IvYy9E?=
 =?utf-8?B?dGtEVE50anVoUHJoTU9XSUp2cG8xSzdiTmhyNW5UZVJjT2NjWEVVZ2tLUEdF?=
 =?utf-8?B?VGVyaW1DUXNhTGlYZGpVRjFmK0o1cXlDbVplU3ZQOWxWRWNDNWZzNzI1ZS9w?=
 =?utf-8?B?K0xjTUFTbFF4dHlIbEtudDJuZlhqZzhuemttRGVSTGxRdlZPRjh1NkVDaWdB?=
 =?utf-8?B?cmRSUVJ6WDljMnBrZmFVdndNWkl2QVV5Z21EWUpPVnJ0RUMzWmhsRml6dy9W?=
 =?utf-8?B?RnBaQjFzVFRMKzFja3dmQ1pGZ2JKRFRRVUdMV3dueGdpVk11V1NOTDNuc0FY?=
 =?utf-8?B?NlpyTS9VM2RtQkpIaVJLZnFQV28zcjVpbkJJLzJqb2g1TUxRQ0tCMkh1SFN1?=
 =?utf-8?B?ckh1ZnB2cHg4Y0RHdGdwUU5OeGE5YlprUzd2cGdmUTdKSXJjS0ZvUjBMUmhs?=
 =?utf-8?B?Y3hmL1pwMklnNnJOQTMwN1NhVWplVFpaRm8yZ3ZHby84ZDhvRjZDYjF1aVd2?=
 =?utf-8?B?UEkrd3VFc2pJcVN1TElHOEphUGRTalNaQkVwL3JhSFlsSGpSRmNXWjB6emxR?=
 =?utf-8?B?alA5d2pPWDRZQVhFbkpIaHlZTmR3UkJxRXNkSU41ZDlULzJvSTFUUFduZmtq?=
 =?utf-8?B?TXYxMlI0S2hndjZ1NHk3VVVORFREZFpZWFdjNDJHQjVOc2NQVXc2UXhpWUkr?=
 =?utf-8?B?a01oQUxmdzB5V1A1STh3UTF6VVd1Nk12cUVya0dIcXZMeTJPTWxXUTQ2a05w?=
 =?utf-8?B?Y0swU1pIME95cXo0b3ZzbDBRM3NTLzM3WUVTZXd5dEUwRlBBR0hmSWxwWXpM?=
 =?utf-8?B?VTlmYUwzQytObm5obXlsNTV0VnY4N1VheUJnNEZxTUNveFBzTWlMczFPOTFC?=
 =?utf-8?B?MXhaTTJ0NHpxWTkvL3pSbnBMcWZjN0pTUkFnWjlDNHhJQmJhSjVwcmdRbGx5?=
 =?utf-8?B?c245aGpWWWljeG5zOUFQYTNYcFUvbit0VnVYaDl2UGZuZFZLTENkR3ZmUHpH?=
 =?utf-8?B?NEZXWjA2SUVQUWp3dkZjV2xoT0J0cDJweTZQWHB4ajhHckRaMWRtV0t3UmVz?=
 =?utf-8?B?amxnaE9DY2M4Rmo3M3RsQXowc0twVXNnWXhrL3RpVThYVjRwRGlZcGdQd0Ry?=
 =?utf-8?B?OUpwWW9vWkttUG9GTU9qWjA1TjhrN3NzS3IzOXhNYVdkQmxVWDVZV3RJZ2xr?=
 =?utf-8?B?WGhHanI0Q0xEc1VpSUVQdDk1dTcwL2FLQ1NJY0FGOXhQMWhtam90SHgycml4?=
 =?utf-8?B?amRrNHNaUlJUU0tnSmFyZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVcxKzlKVFFENGs3WFNiY0MwbERWR3N1ZUwrc05mdGhFRkd1VG9LT05hejBy?=
 =?utf-8?B?akwyZ2JIRXNyQ1FBRy9ZYVRlV0M5M1ltSmh6UUdWQmd0TmRkSGxIS1Z5cHhU?=
 =?utf-8?B?SkxPNjRDSUZPQzNPSzYzMFhjUmNHMzk1QnFiZm1iaElhWEpmMng4OFZiaVV1?=
 =?utf-8?B?aFBZcDZPTG1UdHMrelRZYlpCTU1lK21SN09KU1czRTJ0SnFtNkpXbnZ0cjFL?=
 =?utf-8?B?N08zSCtWUjV1SjNmOGlKRnFaR1dFK1ovZ0Z2b3NMQ0pKVWlabTRrMmRkb3lL?=
 =?utf-8?B?Q3E3emhUWldCYTFmVHlIOUc5bHJnQW82TnVSMFkrT0JNTGJZWTJJdER2ZllM?=
 =?utf-8?B?TjZsRVdiQWg0V3oxbWZLMHhnZ2NTVnRjdVFPU0NTaS9NSGp1V0dFYnBZR1NH?=
 =?utf-8?B?VkZNQVpIQ1lYdnBJZ1JQQnZSRXRVOEo0Q00rdFl4U2k0WXN0ZnhlU0pwcDdy?=
 =?utf-8?B?WnN6RlFoM3FBSEVQNENDR2p4SU4zekR1ZnVINkpqV3FjTThlQ0R6R1g1b2xJ?=
 =?utf-8?B?cThHS1R6MkZ6MForWDRDMU1LQUE0enUvb3dDYXY3MGJ1SVV2SjduVkRrNk5F?=
 =?utf-8?B?RVV2dXk0K01zbXBUUFMySkdVaGVCUE00bXRsS1JEN3lxdC9oSkdjQTN5UXFV?=
 =?utf-8?B?T2lEZzNNOXRRaGVzL3hOcWxrOUNhdk92WUVjVkNQSFdUZWJjOFVWQTl0bkVi?=
 =?utf-8?B?WllNeU8xK09Cc3NRUVRUd3VIZklsZVpNMk93amh5c29uNWw0aXZVcHZRNnRh?=
 =?utf-8?B?SUU3ZFFsOHdlbytxTDdqT3R1ZnVPZ1JiWGhDVUFSSjAraFNSb2ZqQVlWcDkx?=
 =?utf-8?B?d2NEWjZBcWVWaUpGUFBhRENsUldFcXZ3SGVlNkloc1EzenNlcStoRG9TOGg0?=
 =?utf-8?B?QTA4Ty96UG1WUDBPc1h0bUhIaGpEb3dZRU9SQzZBVUlIYkxFSTNkOFRFVEpj?=
 =?utf-8?B?Z01UVHQ1YVNVUnZGSjh5cmdoR2FWSmUwRk5MNC8waVp0cW1TTWd5WEMxS3hU?=
 =?utf-8?B?dkJVZll0ZldyNnhDcGpxcVBDQVdOckVYWm5hNnRTQ3pMY043aGFNbEU1MU5F?=
 =?utf-8?B?M04vNVBqalBteVBodnpkQ1JneTl2YnRIYWd4TnpmU3dDUmpSclBmVTRJM3JK?=
 =?utf-8?B?Rm9vdUQxWFRuOGdZV24vVkpwMVdEeXlHM1NIUndoUmlEVDEwL0ZxR1UzV2hF?=
 =?utf-8?B?bTJHZlBCRGQ5Z1F5amdzNGZWY3NQNmNPbDI0ZHh6T1RoSlVhUTZkSUVoV3ll?=
 =?utf-8?B?cGpXYzdsUnN2U2liQzBaeE10T3c1RVROUUMxYlRuNEtFYUQxTnlhRXJOSzll?=
 =?utf-8?B?RFgyV25kaEI3V0lFQkVnUDNTczhZQ1hTaWs2ZGxwbzhxZzVRSkVFRS9OMENH?=
 =?utf-8?B?eUN5Z1BsYWJCa1hOL1pBamlNTDZVRmtLU3JMRHJEbThOTWR2cHIwYzErb1Zu?=
 =?utf-8?B?d0JpaTZQVGVPL1luVU9DV3JDRXZqV2ptaTlPVmFsTjN3bHVSbWJ4QzZ6Y0RK?=
 =?utf-8?B?Sm0wSkl0TVczM0JkeFJ6ZUhaN1h2dU15dEhwYngyMDJlQ0paczRVVGdjRGl3?=
 =?utf-8?B?ODA0OVdCRkVuTXJDMk4zZ0FucnQvWHhqRit4WGgyYVBnOXQ0SXpEL3VOYXdR?=
 =?utf-8?B?MmNENDM2ZE9CR1ZmWEtRY3lHNnZUVERFdEtaTVRGbnE5ZTlXM1o2Y3o5MUwx?=
 =?utf-8?B?cHBoUWFxSHRVQVhpbk9icW9yTXJUWVZkT0FvNE5hL1BJWjdwOS9VRDYxU2ht?=
 =?utf-8?B?U3BjZWFsbFpWenovWjRIcWF0dk1vbHZxVEE1Y3dXWlcvd1c3TWd6SWMvcnVV?=
 =?utf-8?B?OFk2cTJPMXJJRE1valJnSXdZRWFvY3BPSWNScXpVU0F3dytab2NFQlZvM1pF?=
 =?utf-8?B?QnpJM291d04wWkNUb2hnZXJmTCtOY1BoZEV5c05sckFWblEzMUZ3QWkvSkdM?=
 =?utf-8?B?ZkFROE12TnhMWm5YZ1pVWE5KeEd4d1VlS0h6MGJCU21UNmp0NVZPQnYrMnVw?=
 =?utf-8?B?b2J2Qzd5QVlqZzVtcXp0aTZFUHR5NlFaVHdPTlJ5T01MSWlhelBVRU1STW9q?=
 =?utf-8?B?bXkrd3JidC9IV09ldGVGV0YyTlFvaFN1ZGxXOHlEOWtGMmlBQUxxdDR3Smt2?=
 =?utf-8?B?eU5xN0FjR2dQbDllZEh6Rm9iZjNWbWRFSEU3VHd3WFp5SHlad200MVNqU1Fm?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43B16A6E70A36F4D85960F5EE74C80F3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d519182-a70f-46d0-a711-08dce688b97a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 04:30:08.1307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgqjZgHxCyWD0k51lwyjVeYZGqjVOubzOb/nHz10EdWjlsAPxRA5i4DMvar/9CvNr7Io+KKNQTEGFJ1A3TkQ0XxLFZHIhSSbseWKnHVIEdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_213021_588125_5D329CCA 
X-CRM114-Status: GOOD (  16.34  )
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

T24gU3VuLCAyMDI0LTEwLTA2IGF0IDIzOjI4ICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICA+ICBzdGF0aWMgaW50IG10Nzk4eF9waHlfbGVkX2JsaW5rX3NldChzdHJ1
Y3QgcGh5X2RldmljZSAqcGh5ZGV2LCB1OA0KPiBpbmRleCwNCj4gPiAgICAgIHVuc2lnbmVkIGxv
bmcgKmRlbGF5X29uLA0KPiA+ICAgICAgdW5zaWduZWQgbG9uZyAqZGVsYXlfb2ZmKQ0KPiA+ICB7
DQo+ID4gK3N0cnVjdCBtdGtfc29jcGh5X3ByaXYgKnByaXYgPSBwaHlkZXYtPnByaXY7DQo+ID4g
IGJvb2wgYmxpbmtpbmcgPSBmYWxzZTsNCj4gPiAgaW50IGVyciA9IDA7DQo+ID4gIA0KPiA+IC1p
ZiAoaW5kZXggPiAxKQ0KPiA+IC1yZXR1cm4gLUVJTlZBTDsNCj4gPiAtDQo+ID4gLWlmIChkZWxh
eV9vbiAmJiBkZWxheV9vZmYgJiYgKCpkZWxheV9vbiA+IDApICYmICgqZGVsYXlfb2ZmID4gMCkp
DQo+IHsNCj4gPiAtYmxpbmtpbmcgPSB0cnVlOw0KPiA+IC0qZGVsYXlfb24gPSA1MDsNCj4gPiAt
KmRlbGF5X29mZiA9IDUwOw0KPiA+IC19DQo+ID4gK2VyciA9IG10a19waHlfbGVkX251bV9kbHlf
Y2ZnKGluZGV4LCBkZWxheV9vbiwgZGVsYXlfb2ZmLA0KPiAmYmxpbmtpbmcpOw0KPiA+ICtpZiAo
ZXJyIDwgMCkNCj4gPiArcmV0dXJuIGVycjsNCj4gPiAgDQo+ID4gLWVyciA9IG10Nzk4eF9waHlf
aHdfbGVkX2JsaW5rX3NldChwaHlkZXYsIGluZGV4LCBibGlua2luZyk7DQo+ID4gK2VyciA9IG10
a19waHlfaHdfbGVkX2JsaW5rX3NldChwaHlkZXYsIGluZGV4LCAmcHJpdi0+bGVkX3N0YXRlLA0K
PiA+ICsgICAgICAgYmxpbmtpbmcpOw0KPiA+ICBpZiAoZXJyKQ0KPiA+ICByZXR1cm4gZXJyOw0K
PiA+ICANCj4gPiAtcmV0dXJuIG10Nzk4eF9waHlfaHdfbGVkX29uX3NldChwaHlkZXYsIGluZGV4
LCBmYWxzZSk7DQo+ID4gK3JldHVybiBtdGtfcGh5X2h3X2xlZF9vbl9zZXQocGh5ZGV2LCBpbmRl
eCwgJnByaXYtPmxlZF9zdGF0ZSwNCj4gPiArICAgICBNVEtfR1BIWV9MRURfT05fTUFTSywgZmFs
c2UpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICBzdGF0aWMgaW50IG10Nzk4eF9waHlfbGVkX2JyaWdo
dG5lc3Nfc2V0KHN0cnVjdCBwaHlfZGV2aWNlDQo+ICpwaHlkZXYsDQo+ID4gICB1OCBpbmRleCwg
ZW51bSBsZWRfYnJpZ2h0bmVzcyB2YWx1ZSkNCj4gPiAgew0KPiA+ICtzdHJ1Y3QgbXRrX3NvY3Bo
eV9wcml2ICpwcml2ID0gcGh5ZGV2LT5wcml2Ow0KPiA+ICBpbnQgZXJyOw0KPiA+ICANCj4gPiAt
ZXJyID0gbXQ3OTh4X3BoeV9od19sZWRfYmxpbmtfc2V0KHBoeWRldiwgaW5kZXgsIGZhbHNlKTsN
Cj4gPiArZXJyID0gbXRrX3BoeV9od19sZWRfYmxpbmtfc2V0KHBoeWRldiwgaW5kZXgsICZwcml2
LT5sZWRfc3RhdGUsDQo+IGZhbHNlKTsNCj4gPiAgaWYgKGVycikNCj4gPiAgcmV0dXJuIGVycjsN
Cj4gDQo+IElmIHRoaXMgaXMganVzdCBtb3ZpbmcgY29kZSBpbnRvIGEgc2hhcmVkIGhlbHBlciBs
aWJyYXJ5LCB3aHkgaXMgcHJpdg0KPiBub3cgbmVlZGVkLCB3aGVuIGl0IHdhcyBub3QgYmVmb3Jl
Pw0KPiANCj4gTWF5YmUgdGhpcyBuZWVkcyBzcGxpdHRpbmcgaW50byB0d28gcGF0Y2hlcywgdG8g
aGVscCBleHBsYWluIHRoaXMNCj4gY2hhbmdlLg0KPiANCj4gQW5kcmV3DQoNCkFsdGhvdWdoIHRo
aXMgaXMganVzdCAibW92aW5nIGNvZGUiLCB3ZSBuZWVkIHRoaXMgcHJpdiB0byBkbyBzb21lDQpt
b2RpZmljYXRpb24gZm9yIG10Nzk4eF9waHlfaHdfbGVkX2JsaW5rX3NldCgpIHNvIHRoYXQgd2Ug
Y2FuIG1vdmUgaXQNCnRvIG10ay1waHktbGliIHByb3Blcmx5Lg0KSSB3YXMgdHJ5aW5nIHRvIHNw
bGl0IHRoaXMgcGF0Y2ggaW50byB0d28gYnV0IEknbSBhZnJhaWQgdGhhdCB3aWxsIG1ha2UNCnRo
aXMgcGF0Y2hzZXQgbW9yZSBjb21wbGV4LiBJcyBpdCBva2F5IHRoYXQgSSBhZGQgbW9yZSBleHBs
YW5hdGlvbiBpbg0KY29tbWl0IG1lc3NhZ2U/IGxpa2U6DQoNClRoaXMgcGF0Y2ggY3JlYXRlcyBt
dGstcGh5LWxpYi5jICYgbXRrLXBoeS5oIGFuZCBpbnRlZ3JhdGVzIG10ay1nZS0NCnNvYy5jJ3Mg
TEVEIGhlbHBlciBmdW5jdGlvbnMgc28gdGhhdCB3ZSBjYW4gdXNlIHRob3NlIGhlbHBlciBmdW5j
dGlvbnMNCmluIG90aGVyIE1USydzIGV0aGVybmV0IHBoeSBkcml2ZXIuDQpXZSBuZWVkIHByaXZh
dGUgZGF0YSBwYXNzZWQgdG8NCi0gbXRrX3BoeV9od19sZWRfb25fc2V0KCkNCi0gbXRrX3BoeV9o
d19sZWRfYmxpbmtfc2V0KCkNCi0gbXRrX3BoeV9sZWRfaHdfY3RybF9nZXQoKQ0KLSBtdGtfcGh5
X2xlZF9od19jdHJsX3NldCgpDQp0byBtYWtlIHN1cmUgdGhlc2UgaGVscGVyIGZ1bmN0aW9ucyBj
YW4gYmUgdXNlZCBpbiBib3RoIG10ay1nZS1zb2MuYyAmDQptdGstZ2UuYy4NCg0KQlJzLA0KU2t5
DQo=

