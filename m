Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9FCC3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inWuwRZxbTxWjnRPuSDQP66kXVJVdphH03wrtwB/UBc=; b=w5KlrgaT4vMI9GqkyXSbkCYaHS
	KN8OJGSz5Te7cB6Ll+2W+w+y9j0YD7kcG9GizER/JcoMbGl45OT7f7ZKtifVguhBSOpdROAV8Xa2C
	E1PNU0+LUt7EReS+PYawXJ+yIdfiGm89X9sFXbGJ/T1kROHcSr1C1Fr14sarSzVb7z46euF/aCeM9
	rl+FtMeNtEcG/R32Moox0U03MFeOdbUwgR6R1CCbc+sNokYxHJOrMciUTZkPqohKBhvTW/xXcgAyr
	uAVItjhhzHzDxWv4OEv/2cSYSHVwaK8v2VTm1dqX27iixJ66jQah24UGptTswX4vhOg4sorgcX1a4
	PzHxmzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjCf-000000027lZ-2ulM;
	Fri, 19 Jul 2024 08:43:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjCI-000000027fc-3vx1;
	Fri, 19 Jul 2024 08:42:40 +0000
X-UUID: d665a74045aa11efa6c87f6b4542ff6b-20240719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=inWuwRZxbTxWjnRPuSDQP66kXVJVdphH03wrtwB/UBc=;
	b=B5l0fw0RSltjGrUTq5MK1SA4JgMDLyu+NYj+aHMcXFHh48opBBeHeUr6bR3ye5YIxp8bl6Rafs2Fuip/hAmQlSR94XPbbdOyctgy59SpN84Hgj818ME2NbLo/oLcV34Axk1DgoiBHZkXiy0qgnp3MSmVYvJlSIF8FubXFSDMDw0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:c324d307-4579-475d-81da-ecfc7bf9c957,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:5fe97d45-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d665a74045aa11efa6c87f6b4542ff6b-20240719
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1543447397; Fri, 19 Jul 2024 01:42:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jul 2024 16:42:26 +0800
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jul 2024 16:42:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVs/rY22ZpuLPq2p4v0yQ+CP7xwUEjNOhdU0RIsq1SWNq/HgU4SrSrpw2WtCu2iAGWFyF/nS+qo2g9dxy/GmqNITcRLbAQsflzUtbmNt+ZQRxT+ZYgieCnagBparEkGP/PrIZX4S/R3QSwq9K5UK11rfCwfljQRniJgfCUwk4K8IkDgfuIS+qqfGI+T2qDLD1y/UBBMqWTtSu9c9N2lzIrCCAQ1tPw0D5Ttp7rhNRs9Bn2vtYGfMQk0gIpf3NYKWC9/g1807geD06QLdsVKdfFX0JbTavaaBPopZlpAkHdxts6/5dztpSr8+hnzhd9fKlwilwQNz0BhCCFbl6Xvf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inWuwRZxbTxWjnRPuSDQP66kXVJVdphH03wrtwB/UBc=;
 b=Tnf34qgRjIqSwnyM+pEMQlpXd/HP0+hKnlPOkydaMkkXWEnW1bWcsU91x2NFGylhFCjHDe3nwpijngBmvi/bv0qV3CBLLUQ5cwYv1SxTnJ3JBYhCKMZ8E4j1EZJHcgtSGR72ON08OyFEOEqmROhWBEbayQgqvzl1MY4RoC/Jr1wpz7QMz4i4Zqhkgf80XCxNukEYVnUrjA9FQP8s1TXlYyjJsUaNgEYiNF3uhg24UPhIiZZBRoUvbhr6BxD3JvhRTSmurtk1UQn36T19fW92plQ2rfBneUFDbURIi28kw5tSxmMUdXXXjHtyUOuEBfgPw4DOgLuefS5axlRW44CcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inWuwRZxbTxWjnRPuSDQP66kXVJVdphH03wrtwB/UBc=;
 b=EEoFpxfeDnllFagU4cDW5LNXw2YKrfVPfoPFm5N+GutN4wzQN94NU3QUTd+HVy+6Kfh/nm4jXu5beX2WOnvMcwMYpSHNSa/FGr6bOa7EkNdafeV0Czhmd9IB1gUTQ5288+161MSUzU0bcOoBypkDhmcxR+9NVVUQcUK49r6hljk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7987.apcprd03.prod.outlook.com (2603:1096:101:177::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 08:42:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 08:42:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "daniel@fooishbar.org"
	<daniel@fooishbar.org>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
Thread-Topic: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
Thread-Index: AQHa2OwJaUSUms+5gEW+ojeDAJAn5LH8LPKAgAAKpYCAAA/zAIAADNMAgAADgoCAAWVtAA==
Date: Fri, 19 Jul 2024 08:42:22 +0000
Message-ID: <e74e25b01f85fb33d95e073f18a8049288b5c70d.camel@mediatek.com>
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
	 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
	 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
	 <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
	 <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
	 <d6f20609-5127-4010-b691-40cd3b253283@collabora.com>
In-Reply-To: <d6f20609-5127-4010-b691-40cd3b253283@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7987:EE_
x-ms-office365-filtering-correlation-id: a41a7ab0-7c66-4235-9623-08dca7ceb583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emhKRzhUdHJ5K2NJVm90QVNaREdCUzBJcmtXNXZXZW1NWFlQUDUvbTdUcEw3?=
 =?utf-8?B?RHdWM09xTEltVUlsQ2JWL0RZWmFIUmhvUGJUNkE1Q1VFUE5QaXBLMVVrUXJi?=
 =?utf-8?B?RktIamhnM3VQL0h5aEpKajluM2k3ZTdtWnFqeDZUOEFZV2djd2tJNmNScnJo?=
 =?utf-8?B?UDZzZFJ6TFVrQnZHUTRJZjk2ZXZBL1A5M0N2TlBvMXZmUlhkcmhKcm1Zbm44?=
 =?utf-8?B?YnJ6RDRNQ2Y1eElINm1aK3R6VGxvaXVuYW42WTdtRmttY3RlbEIrbFV5UFcw?=
 =?utf-8?B?ZkN5UXV4bWVvcU1SQUFNUUVCb2tYUG1ScXVJV3ladno5UEc3WTc3QlVYT0xD?=
 =?utf-8?B?M0QwelZvMHJSZnVNbnJpMTVqVnNYeGdwY0o3RnNXZUpnWmNXdUdnSy9kZUZO?=
 =?utf-8?B?VDdXUWtRTmU4UnM0UnlLdytxMGtmWkRDek9wRzZuTDVnVnI0eldid0Jmek5p?=
 =?utf-8?B?bGZ1Vk5JRi9pN09MWjRjVVVPZEo2dWpndHpwSTZ3NVI0a0RranR3eHVMKzJM?=
 =?utf-8?B?VGRoMFc4NDJGdHJUQ0s0WEJPQUE4VEJNeFhnY2dJYkFDMzMveWxYbGpqTEFk?=
 =?utf-8?B?elZYR25VcjhudktsZ0lWY2lRRTJaRmRybEtZOTFON09TemJPdkZaQ21JQnBZ?=
 =?utf-8?B?R3p1U3dMaGpwei9SY3hKRnZqQjFwbXlzWlN0SzZGTUF6TzhTcjNrcDZxZE9G?=
 =?utf-8?B?QzJ1ZUZVVWpQdCtMVnBUaytKc0h5S25JOXlYTSs2T0ZlVVEwdWpsb1R4Nm1m?=
 =?utf-8?B?b1cxcG1xU2F4L1FnUFdiTlJCVXpMb2FYa2hQYjdsLzZwN3RGN1ptcFo4ajFU?=
 =?utf-8?B?c3FZWXF3LzNEdDBVRzR2aVIyemVFQXc2Nnd3TGVvdmRibVpNSGdjM0U4SHl3?=
 =?utf-8?B?LzNmRnMza1g1cVpWRS9CS0cxdHRVSXlMRVlvNjBYVXhLcFZnK0NjOFlQRW9Z?=
 =?utf-8?B?L1NlRmNxMlNMNUVVeFJNdjhsL1JGcUdBYmgwdFovM3ZXZjVzNVR2VjhEb09n?=
 =?utf-8?B?WTVSaXcxRjA4RTMxcDQ0cDBiamdWZ0xSUGMydXRFVy9iaGJYeDdvNHhCWW5C?=
 =?utf-8?B?ZTFiQnhYNWh1YzhKRUdhSW1YUHNjb1h4V0U4UE9sSzJBMEo3T0JTdlBURjNL?=
 =?utf-8?B?anJ3czM1NDFsUWJBWmxrRFc0cW9BaE9RUmg4UG1FUlA2MWFmRkd2RXlxdjlq?=
 =?utf-8?B?ZXNhSUMxSDFtUXJSUzlENzlPa3VuR0ZjUW05emduVmI1Q2xKdTUvMzd0ZzZt?=
 =?utf-8?B?THZGeW8xdTJRTXE2bXdPMzlwRE45Mi9iVlJmL1pxK2oxeW5GVFlQbFl1UUNG?=
 =?utf-8?B?bC8wTUFtWmIyKzQ4L0s3TGllaUpGS3J4L2IrRVR4SUJHWXhqVFJFUlNXNjRP?=
 =?utf-8?B?ZytHaEJyT2pIa1R3VUdkOXhVU2JYRkVhSHkxcCtwdHZGVGdoMHRQQVZPaldK?=
 =?utf-8?B?Qlg3bjFNaFdzWTEvYTZkWmlGeEZ4ZS85anNMbks0OUhwckVReW5uL1gwVnhC?=
 =?utf-8?B?TGhZY3dLKzNadjlxM01hSmRUQzN5dzFRK3dSZFQxdFJqWGFMNEJZcitEZXVY?=
 =?utf-8?B?UkJXZnhJMTNDVjJFNXFnVW0wR1dWRXZkbkZ4bWhGTE5kV1RYbEUxS1NWdUxk?=
 =?utf-8?B?Q3hTNi8yT1owOWtDR1MvTDlqQ1VSSnd5RTdCNENYU0ZSclU4Ujl5ZmdWTlZs?=
 =?utf-8?B?S1d3eDFNWTRzRlNOL3dkREl4ZTl6dlo2RjJPQkQ3S2FNYnhQMmJBajNzNERl?=
 =?utf-8?B?emxDSG1aVGd0cFdZKzBYdndUeUVCT1NYcXVTbUQweDM2M0tFTWUwSDJ1YldV?=
 =?utf-8?Q?g7cTWTKLDSNAX9mZsdNWBEkPt/dzrdSrxnTFM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elF4cUIydlpPcjZuWXhITDVYdS9hSXl3ZWdOVGt1QjRXYzFCRTN1M3VMb0Zy?=
 =?utf-8?B?NWFOQUZicm1la0tnK05KMElKNEhKQ0dQRzFLanNYclZiMWU1N2RHK1dkU3lP?=
 =?utf-8?B?NlhuMXdiTFZNbmVKSXVIbXcwOXVVeFF4OVNSa0xmamdxY3hwOWxxNTkvb0M0?=
 =?utf-8?B?MEZvdGNLL0ZidkxEOVN4a0NydUZMazVvRzB2Y2poanhoMWcvcGNiNmxuQXE2?=
 =?utf-8?B?cngwV0I3OTNrTHdxTHVPNW5leHNLaStySjZqaUN6R3NOUDZBZXVvSFhJcWxE?=
 =?utf-8?B?Zkl3eHYvcERiOERzT2kwWTJETjJxNFo5WjM5eXJWdkNNR3NBVVVvR1hQUVd0?=
 =?utf-8?B?NzU3UkV2V25jN0h6bllVS0t2WlJCc1V3d21BYlRSblJacXR6UnlzT2dMdGcr?=
 =?utf-8?B?a25BS21YUDl5bFB3RGwzd3NheGp0TUlMd1YrVGxDMXVvbjl3REFBUG15U3Nj?=
 =?utf-8?B?T1JnYitjWUoxK0JsVUcrdkhMckYyb1NRN1dKUmdGZkNuV0FXK1E4OUVrTFZw?=
 =?utf-8?B?VUJYMTV6VElaSFlDbnF5cCtuZys0VG95R3Rhcy91WDhLOUZKbzUwbjBEL2RV?=
 =?utf-8?B?VTV5ZzBqM1JERE92T0dNYmp0Y2J0UTZCcnQvSXAwUDVHcnZDMitvcU1uVlZz?=
 =?utf-8?B?QitvczRqcXFNTzIxclFscEdrZy9LaThTMEk3MlpRbmdPS1lHRUJ0bnVLajZO?=
 =?utf-8?B?SENyZm1hRDhIUkZSd0RoaVA3RW5aWGZEcG9yNUJSMTR2ZFpkSTYwV3BJeFJn?=
 =?utf-8?B?eWh1RjJDTTVVZjg1VEtLVmFKQXlhd2hzVnpLTnpMWUdlZDNKWVQxS1phRnNL?=
 =?utf-8?B?dVQvS011ZWNZOWJqank4ZFZiQzRORW9MemNKV1g5MGQvRVJpbTcrcHpTV25N?=
 =?utf-8?B?QnYvQ2c3OURVOGovZnRxYlNyNFVxM0dtMm0wVG5qOEo5ZjljeFJqd1J2QkV3?=
 =?utf-8?B?d3hyWDlVTkEzcFlLdEZpNFQvakN4NjdvY215VXQ2d2QrRU04TnpDanJTRWdh?=
 =?utf-8?B?cGFWZkNGNFltMzFHZmE3d3d2MnBGMC9oQ2ZZRHMvSHJhRWFqdzlrUzlMRnlk?=
 =?utf-8?B?cFBtdGVvN2pxQ0xjRitWTUlxOFVnWUdNRi9tUm1XcWRQcUV0Q1l1ejlDN01F?=
 =?utf-8?B?bFB0KzhBSnRMeDREOUoxYWpobkhPS1A0ejZlTXhEMGdPcUZ1WmlmQTQ2SU5s?=
 =?utf-8?B?UlFscUhTNGxrZ1FkWU9xNDd3Ni9GSkU3ZmxHYlZ3UHlRZlVqWUtENlVsTmN0?=
 =?utf-8?B?Yk8xWmR2S0loN011STRJRFVJcUVqOENUTUFlK0I4UjFXZXd2UjZxVlVWZEpw?=
 =?utf-8?B?MEpDZHQ5dHZNbFZKcVhYZWtKdEphU2dHWEdjb2N2YUpCNkdxd3JsRDFQNll2?=
 =?utf-8?B?cmZOR1RyamlQWDd1dVlKUk94OUVSTWRlQ3p3aE4wNkFzVWVrck5hL2h6dnZv?=
 =?utf-8?B?bXlzTmFxTXNsNFFZcEtOQ2pBYjlPckkxSU9GM1Z2cURJOGtJRnZlcksvejhL?=
 =?utf-8?B?NTYxaVdmbDV5QUQyT0ozWm91VC9jVlpDQ3NyaGEwMXN4SSthVzZrQzkvaFNw?=
 =?utf-8?B?VUhibE15Znd6SEtqTjkreUlMaTVIVUhIS1RocGgyTFYxL2JBUWRKaSs5aHZK?=
 =?utf-8?B?OXRmYXFzdFdzRStaN1ZZZ2VSZ0Q3QzlacWpvTzQ5c1NvTmJ6bDRkMmEraTlE?=
 =?utf-8?B?S1JJSlVNVnZPM2cvdk11M05iNnM3cnZyS1E1ejdaNzVJNHV6NUk1b1RIRW5J?=
 =?utf-8?B?eGdlMEVoQU5qbDZtRDNQK0o5QjUrM0JXcHg2MmFXd3dGc0M4bllGSTV0cnhl?=
 =?utf-8?B?NUREZi9La0E2Q2lGeWhiYmY0djltZTJwT2hPQlEzeU44a1BPR2NTZ2pRTDZN?=
 =?utf-8?B?bjYxdzIxeFJWWkFIdmlyTEw2bzhQSXVQaGtPV3VJVGthQ0dqZFJFT2ZheHds?=
 =?utf-8?B?NkdhclAwSGlsNDNIT1JHeENUaFdvOUZqcVc3YXJlWi9ZeXdYMGFEQXd3dW9J?=
 =?utf-8?B?L295US9aTUF1OVZxdFNmVG5VQzNEK2p3cVEwQW1Gc0oxby9ON2NjQjJadnNq?=
 =?utf-8?B?SnhNczB4SlM4WldTT2dYWThTNWgyT2Vkd0xmSVpWRDkyYnRHSjYrTENyaUUw?=
 =?utf-8?Q?xsDwXjMJfaVjdoaUkjPFAbeNL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C033722D3AC5F4CA22F1B28CD2DA541@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41a7ab0-7c66-4235-9623-08dca7ceb583
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 08:42:22.9596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8btSlGJlah1fZSj07xfJ8C61i2SO5jnZcr6L4nVMUWrOGXaZJPm0BvOa967FtYLZlP+zMIpuZaJYPARClCrAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7987
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.687100-8.000000
X-TMASE-MatchedRID: TmlY9+XBoTkNtKv7cnNXnSa1MaKuob8PofZV/2Xa0cJauByPtDzndbmn
	rGB/kwGMJb50BWnctI18qONnIljPVu0Uuel+YEUBY6Gjtu6/t31MkOX0UoduuRjQD3m2MCf7rhO
	hST9pKbX98XZ0SG+qCLhX/lUQGcewCKDdZHnVgHLqsFlQXzLr6Fo1rFkFFs1al5li1yyRX08yr5
	6f45o26zwvO/NL+WDe/9rvK+pLJv1tNLAj8DYO8Izb2GR6Ttd3F81qHybtKI05bxeAKHFV2NAYW
	Uo4HSIkiWeWIN8ey2+nXDicPoxAoCyYkC0b5PWKt1AhvyEKdj7RfRfl2l4F3v2TbFr0CGODeDgI
	4iMaw3Il2Wrekovy3hWuzt5TM5SUXEfwOboaqxZCxKB9Mp7mVZWr6iSXWtgPHWNaMBkegSfkmV6
	qYsN+B7BmryQscztH1Cij4RL14Mb5ovokMONXgIbBPrt55wnw+bBt5ajdC4fE3grQNcpLWBn61/
	JmBe6HuWuaqkzSX7F5OPD8XJFfpEL9tcyTZdAsgxsfzkNRlfLdB/CxWTRRuyUIayx+Skid
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.687100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9628B0EBCA006F44EDF9582369B1F87060121417216B156AB2D629F228FC6EFF2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014239_020474_5EC63BCE 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "kernel@collabora.com" <kernel@collabora.com>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTA3LTE4IGF0IDEzOjIzICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwgMTgvMDcvMjQgMTM6MTAsIERhbmllbCBT
dG9uZSBoYSBzY3JpdHRvOg0KPiA+IEhpIGFsbCwNCj4gPiANCj4gPiBPbiBUaHUsIDE4IEp1bCAy
MDI0IGF0IDExOjI0LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA+IDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KPiA+ID4gSWwgMTgvMDcvMjQg
MTE6MjcsIEZlaSBTaGFvIGhhIHNjcml0dG86DQo+ID4gPiA+IFRoaXMgbWF0Y2hlcyBteSBwcmVm
ZXJlbmNlIGluIFsxXSwgc28gb2YgY291cnNlIEknZCBsaWtlIHRvIHNlZSBpdA0KPiA+ID4gPiBt
ZXJnZWQuLi4gaWYgbWFpbnRhaW5lcnMgYXJlIG9rYXkgd2l0aCBpdC4NCj4gPiA+ID4gR2l2ZW4g
SSd2ZSB0ZXN0ZWQgdGhlIGV4YWN0IHNhbWUgY2hhbmdlIGJlZm9yZToNCj4gPiA+ID4gUmV2aWV3
ZWQtYnk6IEZlaSBTaGFvIDxmc2hhb0BjaHJvbWl1bS5vcmc+DQo+ID4gPiA+IFRlc3RlZC1ieTog
RmVpIFNoYW8gPGZzaGFvQGNocm9taXVtLm9yZz4NCj4gPiA+IA0KPiA+ID4gVGhhbmtzIQ0KPiA+
IA0KPiA+IEFuZDoNCj4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxh
Ym9yYS5jb20+DQo+ID4gDQo+ID4gPiA+ID4gT09USCwgSW50ZWwgcmVjZW50bHkgYWRkZWQgYSBm
ZWF0dXJlIGZvciBlbnVtZXJhdGluZyAic3VnZ2VzdGVkIg0KPiA+ID4gPiA+IGN1cnNvciBzaXpl
cy4gU2VlIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvNTgzMjk5L19fOyEhQ1RSTktBOXdNZzBBUmJ3IW5SZjZtZi05dG5F
N3ZMWXJhY0xFNlhxX29ibFJ2dEVOZmZGNzNmUnpnel9FM3pQYzN5eGVRUEU1eVB3OTVzai1aZW9p
WUpDUVNJUFdGWjBDM0hDWHBCa0hpa1dLJCANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBOb3Qgc3Vy
ZSBpZiBvdGhlciBjb21wb3NpdG9ycyB3aWxsIGVuZCB1cCB1c2luZyBpdCBvciBub3QuDQo+ID4g
PiANCj4gPiA+IFllYWgsIHRoYXQncyBnb29kLCBhbmQgd2UgbWlnaHQgZG8gdGhhdCBhcyB3ZWxs
IGluIE1lZGlhVGVrIERSTS4uLiBpbiBhIHNsaWdodGx5DQo+ID4gPiBkaWZmZXJlbnQgd2F5LCBh
cyBpdCBsb29rcyBsaWtlIHRoZXkgYXJlIHNpbXBseSBoaW50aW5nIHRoZSBzYW1lIHZhbHVlcyBh
cyB0aGUNCj4gPiA+IG1vZGVfY29uZmlnIGlzIGRlY2xhcmluZy4uLiB3aGlsZSB3ZSdkIGJlIGFk
ZGluZyBhIGhpbnQgd2l0aCBhIHNlbnNpYmxlIHNpemUgdGhhdA0KPiA+ID4gaXMgbGVzcyB0aGFu
IHRoZSBtYXhpbXVtIHN1cHBvcnRlZCBvbmUgZnJvbSB0aGUgb3ZlcmxheS4NCj4gPiA+IA0KPiA+
ID4gSW4gcmVhbGl0eSwgaGVyZSwgdGhlIGlzc3VlIGlzIHRoYXQgdGhlIG1vc3QgcG9wdWxhciBj
b21wb3NpdG9ycyBkbyBub3Qgc3VwcG9ydA0KPiA+ID4gb3ZlcmxheSBwbGFuZXMgKGFzIGluLCB0
aGV5IGRvbid0IHVzZSB0aGVtIGF0IGFsbCkuLi4gbXkgZmlyc3QgaWRlYSB3YXMgdG8gcmVtb3Zl
DQo+ID4gPiB0aGUgQ1VSU09SIHBsYW5lIGVudGlyZWx5IGFuZCBkZWNsYXJlIGl0IGFzIHBlciB3
aGF0IGl0IGlzIGZvciByZWFsIChhbiBPVkVSTEFZKSwNCj4gPiA+IGJ1dCB0aGF0IHdvdWxkIG9u
bHkgZ2l2ZSBhIHBlcmZvcm1hbmNlIHBlbmFsdHkgYXMgdGhhdCdkIGJlY29tZSB5ZXQgYW5vdGhl
ciB1bnVzZWQNCj4gPiA+IHBsYW5lIGFuZCBub3RoaW5nIGVsc2UuDQo+ID4gPiANCj4gPiA+IElm
IGF0IGxlYXN0IHRoZSBtb3N0IHBvcHVsYXIgY29tcG9zaXRvcnMgZGlkIHN1cHBvcnQgb3Zlcmxh
eSBwbGFuZXMsIEknZCBoYXZlIGRvbmUNCj4gPiA+IHRoYXQgaW5zdGVhZC4uLiBidXQgb2gsIHdl
bGwhDQo+ID4gPiANCj4gPiA+IEFuZCBhbnl3YXkgSSBob3BlIHRoYXQgdGhlIG1haW50YWluZXJz
IGFyZSBva2F5IHdpdGggdGhpcyBiZWNhdXNlLCB3ZWxsLCBvdGhlcndpc2UNCj4gPiA+IE1lZGlh
VGVrIFNvQ3Mgd29uJ3QgYmUgdXNhYmxlIHdpdGggYW55IHBvcHVsYXIgV00uDQo+ID4gDQo+ID4g
RXZlcnkgY29tcG9zaXRvciBpcyBnb2luZyB0byB1c2UgaXQsIHllYWguIEJ1dCB1bnRpbCBpdCBk
b2VzLCBwZW9wbGUNCj4gPiBhcmUganVzdCBnb2luZyB0byB1c2UgY3Vyc29yX3dpZHRoIGFuZCBj
dXJzb3Jfc2l6ZS4gQSBsb3Qgb2Ygb2xkZXINCj4gPiBkZXNrdG9wIGhhcmR3YXJlIHN1cHBvcnRz
IG9ubHkgYSBzaW5nbGUgZml4ZWQgZGltZW5zaW9uIGZvciB0aGUgY3Vyc29yDQo+ID4gcGxhbmUg
KGhlbmNlIHRoZSBzaW5nbGUgdmFsdWVzKSwgc28gcmF0aGVyIHRoYW4gZ3Vlc3MgaWYgaXQgbmVl
ZHMgdG8NCj4gPiBiZSAzMngzMiBvciA2NHg2NCBvciB3aGF0ZXZlciwgcGVvcGxlIGp1c3QgYWxs
b2NhdGUgdG8gdGhlIHNpemUuIE5vdA0KPiA+IHRvIG1lbnRpb24gdGhhdCB0aGUgb2xkIHByZS1h
dG9taWMgY3Vyc29yIGlvY3RscyBhY3R1YWxseSByZXF1aXJlIHRoYXQNCj4gPiB5b3UgYWxsb2Nh
dGUgZm9yIGN1cnNvcl93aWR0aCB4IGN1cnNvcl9oZWlnaHQuDQo+ID4gDQo+ID4gU28geWVhaCwg
dGhpcyBpcyB0aGUgcmlnaHQgZml4IC0gdGhvdWdoIHlvdSBjb3VsZCBldmVuIGJlIG1vcmUNCj4g
PiBhZ2dyZXNzaXZlIGFuZCByZWR1Y2UgaXQgdG8gMjU2eDI1NiAtIGFuZCBzdXBwb3J0aW5nIHRo
ZSBDVVJTT1JfU0laRQ0KPiA+IHByb3BlcnR5IHdvdWxkIGJlIGV2ZW4gbW9yZSB1c2VmdWwgYWdh
aW4uDQo+ID4gDQo+IA0KPiBJIHRob3VnaHQgYWJvdXQgYmVpbmcgbW9yZSBhZ2dyZXNzaXZlLCBi
dXQgdGhlbiBJIHNhdyB0aGF0IElHVCB0ZXN0cyBmb3IgdXAgdG8gNTEyDQo+IGFuZCB0aGF0IE1T
TSBhbHNvIGRlY2xhcmVzIHRoZSBzYW1lLCBzbywgbWFraW5nIElHVCBoYXBweSBiZWNhdXNlIHdl
IGNhbiBpbmRlZWQNCj4gc3VwcG9ydCB0aGF0IG11Y2ggKHNpbmNlIHdlIGNhbiBzdXBwb3J0IGV2
ZW4gbW9yZSwgYnV0IGRvZXNuJ3QgbWFrZSBzZW5zZSkgOi0pDQo+IA0KPiBSZWdhcmRpbmcgQ1VS
U09SX1NJWkUgLi4uIHJpZ2h0LCBJIGNhbiB0YWtlIGEgbG9vayBhdCB0aGF0IGEgYml0IGxhdGVy
LCBtb3N0DQo+IHByb2JhYmx5IG5vdCBmb3IgdGhpcyBtZXJnZSB3aW5kb3csIHRob3VnaC4NCg0K
VGhpcyBwYXRjaCBsb29rcyBhY2NlcHRhYmxlIGJ1dCBpdCBjb3VsZCBiZSBiZXR0ZXIuDQpJdCdz
IHVyZ2VudCB0byBmaXggdGhlIGNyYXNoLCBpZiBiZXR0ZXIgc29sdXRpb24gZG9lcyBub3QgY29t
ZSBvdXQgc29vbiwNCkkgd291bGQgYXBwbHkgdGhpcyBwYXRjaCBmaXJzdC4NCg0KUmV2aWV3ZWQt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCkkgd2lsbCByZW1vdmUgdGhlIEZpeGVz
IHRhZyBiZWNhdXNlIFNoYXduJ3MgcGF0Y2ggaGFzIG5vIGxvZ2ljYWwgcHJvYmxlbSBidXQgdGhl
IHN5c3RlbSByZXNvdXJjZSBpcyBub3QgZW5vdWdoLg0KDQpJdCdzIGEgZGlsZW1tYSB0aGF0IHNt
YWxsIHNpemUgaGFzIG5vIHJlc291cmNlIHByb2JsZW0gYnV0IGFwcGxpY2F0aW9uIGlzIGxpbWl0
ZWQNCmFuZCBsYXJnZSBzaXplIGhhcyByZXNvdXJjZSBwcm9ibGVtIGJ1dCBzdXBwb3J0IG1vcmUg
YXBwbGljYXRpb24uDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBDaGVlcnMhDQo+IA0KPiA+IENo
ZWVycywNCj4gPiBEYW5pZWwNCj4gDQo+IA0K

