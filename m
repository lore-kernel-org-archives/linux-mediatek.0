Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DDBC83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdIM/FCQFf+QOiYd7uGT3KTtd3R134Bzn+x9M3VxePM=; b=kRl7oJNA4evW6yoOi4vUnRiSsX
	vk1f7toKSjFSXTRIjXOYaHmYQyYJ33P0pV4gIEalXmrA3JxRHLunN6Ma8EzheDcMVqI2LdvHu59QC
	e2FaIOlO1UHNgn4R4xXSv1foI6vHSTK+HjHVdqKK1VbF+DteHXzbgiTImahaPDYTclq+JNHcHGryO
	fYXdN17yLT3Gr+qpZmfG6i/ausArZ7Al7aZaw4LKE+6sjHBm7dq6r5+c0HztneZdbBedfBtw8rwU1
	stqP5iV9YygCAqSrEaTbj8qpai76itkFmDoKXMfMkTtbBoHZm/ZCFCqzvaF0Jvq+GPoGTlp0rz8cY
	+qthJyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIVq-00000009L7F-3VkT;
	Thu, 17 Jul 2025 06:54:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIVo-00000009L6r-0H02
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 06:54:37 +0000
X-UUID: e4f28e9262da11f09eb0dd999d3936bf-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hdIM/FCQFf+QOiYd7uGT3KTtd3R134Bzn+x9M3VxePM=;
	b=fZjjs32oG2d/ef55oHGYC3yCB/Sm/UCIN3hrQSIP8WXIy19yhZKQsZ52/NPtBe3fW6gtSmOeO06qzIFGynb4bgNfCTq0+ybhUF+kR0qaxAFDUUrTEvMrjAmirof6T1UzTF7ygiZCLLxCE8jOete2MAmDPvCArNjcvtGEnirXBhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:19317cc9-45db-4d73-9942-ee82d76367c4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:763ef999-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4f28e9262da11f09eb0dd999d3936bf-20250716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1437957888; Wed, 16 Jul 2025 23:54:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 17 Jul 2025 14:54:29 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 17 Jul 2025 14:54:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9Vjw5C4Fpqb17d3aiHjrQmwtU1OZuHFY2rPNvfAU3EKXr4mQTWpczihjUlMBfpwOGrQ8NK4JDPGwqxkc4TQigVXlKvjnZKVnuo6V4JZJ8PimwJggmLAMyeF0LbgnyUGD83674lh+aL2d9bBtDpAK6MtS8eD68nXw4Qgw4lff9Cenl2MosrDxH0TiHsYWwFMcVwaX9T2E6rhsNV5pzdrX23nBG4CuT1u0W+AjSsJlEaQlV1hMixTCC/IXlhBTsz/h80k+3p5bq+1UPjZJXWp2Ph3oIbzixVYVLvzCBflBZaV7zaOeXo2ZI1HFioD/groGqoGoMoV1iw8ZP+ONOeTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdIM/FCQFf+QOiYd7uGT3KTtd3R134Bzn+x9M3VxePM=;
 b=Zn/INJCdCGP5DtmDF5UHP/h6s5fKMdFXSQABj2x235UHhfMiwTy8ADf1J0xEQHApmxs+5x0VOLGsVLsUstA4CORp8mXZsXWg1OfnfYrrhKdQ2LHKSH23C/hqX3HY4l/Q4ZHK3Z9R5Qj9o/ZXXqlPdLFRg9D2ym6N50mt1d4Ycqm0EDxdY/3yDnhNVDjt1mP9YOE4KaNtzZNfQdDE2oLUuiMZFBjsuWu8ZveHD7OtbLeQdJmr92+ELVSaFZzaLQeC2CRN9s+qN2xn/KZ2It1OsN7P4tmEid/9uuESzvHO9UlwfKHvhs4U7Z5IJHT6Lor1hJ8w1tdZs0FedyldGFgnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdIM/FCQFf+QOiYd7uGT3KTtd3R134Bzn+x9M3VxePM=;
 b=P/ntkIK9uxMaS4xptsudOyUZClxnuzunUzJujWbFktRBLbzIKpj0mI+eMakaSsVyQz/RirTQYsCpoKUCA0Yz3YGPm9voHASqsk4y+HB2xSkexNcL4Z7kqc3HpkKNIXkbOvs661L+6BFfGK/VZ5wmTyBiufBS8VyvOTGd87NmX1Q=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEYPR03MB7315.apcprd03.prod.outlook.com (2603:1096:101:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 06:54:24 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 06:54:24 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?WWktZmFuIFBlbmcgKOW9ree+v+WHoSk=?=
	<Yi-fan.Peng@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
	=?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Set IRQ affinity policy for
 MCQ mode
Thread-Topic: [PATCH v1 06/10] ufs: host: mediatek: Set IRQ affinity policy
 for MCQ mode
Thread-Index: AQHb9hr7z9/9c0OLik+5Cw27frb3yrQ04CeAgAEC5IA=
Date: Thu, 17 Jul 2025 06:54:24 +0000
Message-ID: <32415970794cf74750d8e10383f738208ec7d91a.camel@mediatek.com>
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
	 <20250716062830.3712487-7-peter.wang@mediatek.com>
	 <9de567ee-f908-41a3-bcb7-7f54ebb17f55@acm.org>
In-Reply-To: <9de567ee-f908-41a3-bcb7-7f54ebb17f55@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEYPR03MB7315:EE_
x-ms-office365-filtering-correlation-id: 38f857b8-9ecf-4da3-f4d5-08ddc4fec3d4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U3BUNzE4RmJmVTNTMUZjR1pyL256ZGY2a2VXUSsvQ3lGdzZwNWIxcXp3WnlU?=
 =?utf-8?B?amFnWWw1ZzlrQUFlU3Y0QU10MHlrQ3pXOC9oN0lsN09yZXQ1VklIZHFhMTVs?=
 =?utf-8?B?N0IvQnBBK3lia3R3cWkycWJYYnA4bjlyd0t3M0EzMnhnaFp1eVczL2ZibnVH?=
 =?utf-8?B?UmJYTGVISVVRNTZFZEpwcU9SSzQzMFE2Q3UweGVmYUxVTndKMm1JcFVjS3l6?=
 =?utf-8?B?YWtwaVAyWHpxb3dnTnJnZlM2M3VUSlRFNnBUejhzdGt6bnBhajV3dFJYSUJj?=
 =?utf-8?B?K1g0S2dDVEV0VnZkMWxHbzlUNFNrbmFQZU9hREJrbXYxYk1vZFU1elFaRWtM?=
 =?utf-8?B?SERneEczZGRldy9yQldHUWVqVjZ6RndUa0JqVEhaenY3dUFzem9QTFRsWkc1?=
 =?utf-8?B?cTQrQ2cwa2JoRm9NV1dkUjVFdldIWWwwRjlneGNjT3FoeE9OdjF3Ym43ZE4v?=
 =?utf-8?B?elhKWDA5TEpTS0dXd21JZDNnVEczNXA2eGJrNW9ockRBZjB2RnJqcVpEZzg2?=
 =?utf-8?B?dEcrMVRYaFFNbWNUb1RQTjRpVENMcXFRMVhkMjFIWHpHNkp1ZW01RWJhRXVD?=
 =?utf-8?B?aE5iN2ZEd0FSTzdtbWNSWGg3L2d4dWZQWjZWaTBrVWliM3pBSnk3cWliMEU5?=
 =?utf-8?B?NzEvTGpqUXNOSUFyaUUvR2lJUzgrRWJqOE1ja2FTaE5CZVJUYTN3K0xKY2Fm?=
 =?utf-8?B?eTVOa3J4dHFGb3ZmTGtpMFh0ckQwNytmaDAwaW5RWGxxdVlYSEM0dXNnWU1j?=
 =?utf-8?B?U2Y5dU5YTkgrS21KS3NiMHdjR2ZPcXVvZDdXWU90akxTQy93aVBBYm1Cb0pq?=
 =?utf-8?B?RHFzTWFlZTFKMTlVcnNjbjQwcHZMSytZYnpwUVFhTDdSM05pUC9CTFYzYlJz?=
 =?utf-8?B?VC9ER0lESjhZSWV4ZWJsMlFiLy9zd1ZOSEtlUXE5TkFBV2Z4b1RlNDlCbi9m?=
 =?utf-8?B?d0FoU0F6M2QvUS9Nb05BZitMYWlRMVlCSDBTa3Fnb25WVDlmbENSV2JCd2hY?=
 =?utf-8?B?VzY0ekpoM0tVUDBPN2xtamZLaVhxcFJmYnZJRHlpMjN2OHdaSGlUcFdOd0dw?=
 =?utf-8?B?OEs2NGxubENPWHZJUjRMck9yRDhPVkpMaWZwYVJIUVkxR0M5dXdxcmRsaEVv?=
 =?utf-8?B?dlR4T2E1Qm9JUVlZY3N0M29QMm5ZVFBaVHdDTTFvWFBma3kzc1FaNys4WnNQ?=
 =?utf-8?B?ais5OWZqQ3lQTGNnaEVDOUt2dnU2RUxoVFBWdGkxUVo4RDhaNUU2WUpnR1lT?=
 =?utf-8?B?WDY4SmNGVklodE1IMnRPU2FRNkZpQjhtNmdENUUzZmNmRmRXU1Z2aGo3VVMy?=
 =?utf-8?B?bWQ5YkFwakxESm1lcll0UHkya1QzOXFZSTgzL1ZGU25tWDRhTk5aWWhIQStF?=
 =?utf-8?B?NVc1emlXMWZQMG5zWVFsV2hyejR3Wm4xWm9DRzh6amQ0cjFHV2VuSC9DeXBG?=
 =?utf-8?B?Q1hNUmIybWpLbDlQa05NQUEzVWVhYWEzWXV1V1dwRjBLaHVBWGE0K2tqVWUv?=
 =?utf-8?B?MHIzL3Zrb0hpNUpacHZZSU1XWjJISDAwcUJycm83ZGEzc0l6a3JSLzl6bVR2?=
 =?utf-8?B?OFd5N1d4T0srNzloNW9UTmhTUTcrWGZLeGZhbFJzai96cGt6SXVkZDc5eTRU?=
 =?utf-8?B?UjZYYnJ6aGhpK3haYURuQlUwdTFhOGxvVnlqWDdYVGpkaWRXRmlLZldzSi81?=
 =?utf-8?B?S2U1Y0hWY3o3YkVHemRLY1VCeThFMzQxRmdyb2RkMkNXOWp5ME5UQVVGSHVP?=
 =?utf-8?B?SXdXYjQwbStSbjZiNjhSVzRVWG5IMjgzV2Y1U3hiVGkxaW1oWGxPV2orZDZ5?=
 =?utf-8?B?alNDV0F4Z0FvOExDKzQ2YkIvQ1drOThhazl5bWlsS2RmZndaQ2JuZUQ4Rm44?=
 =?utf-8?B?U1NYYzNQQ0wyK2dIZEt5VC9VWXB2cUU3V0VKcHF0djVyWEJOMmZQclVRN2g2?=
 =?utf-8?B?NHJqUVVUb3gwVEMyUUVOKzgyekQ2OWRrMVpKcm9paUtGcUNhTUMzYmRVNGVH?=
 =?utf-8?B?RVoyRmIvNWJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MS9tR0hKQjFFSThwdEx6RHVmd3lsbjFYMHdEbkdjVVdkTkh1dWkzVGxaMjEy?=
 =?utf-8?B?RTlWUEJaYWg5b1VRK3JmdEVxazZ6V0RkSjFzMXNOMU5zRWkzcmVMZGRTVmV0?=
 =?utf-8?B?MHVWMEVRTHR3Skt5aDlGbHVmenpVOUkzM1hKWGVUOXU0aUprbnBjREx2eFds?=
 =?utf-8?B?TUVyVUZFL0l1dGJLYS9iRlk5MmM1K01lbU5INDFTMDVpQnVrVUZER1Y1TWxQ?=
 =?utf-8?B?bG1vODhFNzI5bmhKWGZHMHFXM290UUNmRnFqMXl3bmM5MUVCclM4aVovWEM3?=
 =?utf-8?B?d2Y5ZjJDNnNRcURoaE1xbE5jSkVDdWNzUExDWXdDa3czZCtocmVXMi9qZTRO?=
 =?utf-8?B?Zkdyc1pkOUNBUzNOZkx5eWxoWXpNbzZOTDFISGZIUDFvNE1DS3BkSFFqNFZq?=
 =?utf-8?B?czk1TmlEV1VOb1dCaDltTVpkb0ZvMkRGdnRZajhTRXNyUm1WSVgzc2FBQnl0?=
 =?utf-8?B?dmpBV1JtSzZhd29vT2JBYkRkeTJ4SjFsQ0pYM3hCajRwaTFoWXkrWTFYbGJi?=
 =?utf-8?B?cHRGU0FaSjBpQmI3cGlpSHhDejl2Z2FuSDBObGVsVmRZUjkzWjFlTnViOXBE?=
 =?utf-8?B?a2FQdHQxV1FEbTNRQTFoSlZUMGkrWHNrMHA0TklVd211dWVzaWFKZzZCWjBk?=
 =?utf-8?B?Y3loQ1ZYcjF0MTZTWmFMdlU0dE5xTlhTY3hwU2VhOW03RzFtTWRZTVlxaHJa?=
 =?utf-8?B?anZ0ODBHS1p0NVVoTWNXOUpPSG5zY2FRaHV6ekg3NEZKcnVvRkhVYXVacXhD?=
 =?utf-8?B?VmxGaDU4S3ZXMlNFamhTa2oxcmJEK0phdFFuZGF2TUZVdDluaTErS1NSMTF5?=
 =?utf-8?B?QnB6TUJJQ212eUVFQ1pOcHRXb1Fidit3aVJJbFFXSXFhZ2tnVW5yZ0lSZHRK?=
 =?utf-8?B?VEFuQzFRNitFU3JxT3YyRFBKdDdIYlg3ajB3d3hzdjRPNkprOGE5VGh1UXNu?=
 =?utf-8?B?Smg3ZjVZQ2haT3pOa3RCWnFmejVnWWE0bnp5dDRwUTZYOFM3QWRCZTEzSmJR?=
 =?utf-8?B?b0RDaXdNWlVLQS9IN3BsUTRqNG5zSGUrOU5Ia3Y3Z3V4YUxPSTFEQ0hGdWJz?=
 =?utf-8?B?RDBLcVkxdXB3MXBsTlV6NmhWb2ZxN2Y2aTFrSmlWUDVrbjQveVlZNTJ6bUJ5?=
 =?utf-8?B?Rk5BZHpPb0pOcEI0SDlyMmhkWldxSkt3am0wbjdmcHVGSk9NekJJVnNIZm05?=
 =?utf-8?B?M1BWQ1lyN3hObnFFRUNtUTJQUUFJSEZ1dlV4OEdGSGdsUFdXMUVNWEFSTnRJ?=
 =?utf-8?B?eGd3OWlNMEsrVDY0UXU3Z29JbTZSRVZSVllLK1l0OWZpNEgzYzVnUFgyWjN1?=
 =?utf-8?B?NmNScW5ZQ3NoZGYyNUQ2S01Lb3BFdDdnL3JXd0pyeTlBekwzejR2S1JUVUZl?=
 =?utf-8?B?eU1vVVNHeFNqUkRLaDZXSW5pdkVIYkhrQUh3aG00amh2TW5XQmlCL01qa3hl?=
 =?utf-8?B?YmFkcWhmNW9ma2E5OHkvUnFwSWE3bVM4dGNZTitWSVlUcnZORFhzR2FBR3VQ?=
 =?utf-8?B?SUZxQkhCZ3lkQk44blJMOWNQMk00MmF0VVUvSGV5M0VSQ25LanRRelR2S2Zs?=
 =?utf-8?B?UjJoVUhZNlF6MnFMT21acWVjeTJDNzV0VGZwb3ZJeEpMY21DcEpEOXRDTVQr?=
 =?utf-8?B?NVZNbzB4OW1FRkVJRW9hcnl6bitMZ0d2L0R3MFVSSURiazlNRFhVWUFJcERH?=
 =?utf-8?B?T3dNZVlpSUlRSmpwRWd1ZVhSUGV3bi9NQm1FelJEbG80OE41UnlRSEMwdjVj?=
 =?utf-8?B?UVNxRHhTZW1Na2pEU3BUd3ZmVWhoSE9vTjFmSEZlWnlkYVc3V2Q3YnI5MUJm?=
 =?utf-8?B?M3Q4Qk44UmV1czRMczd0OWY1S1lKS3d2ZjFNSGVtSXNnVjhnWElPUXVkMEpH?=
 =?utf-8?B?NFh6bWd1SVpaM0kvbjJtekEwUUVRY01lSW1ydldCejRqNXozM29kSmw4MzBW?=
 =?utf-8?B?NlYzWFNBSGdyU3p2QWlMSm5Gd0xSNThIZHp6a3ZWalpjcllFS0t0MHJrd0o4?=
 =?utf-8?B?QnVWS2laeSszRG0vVTNUeXoyQTdaU1VYdS9wVlI4UEsxK2NqSWY4Um5Ja1pO?=
 =?utf-8?B?NmxyclBSV2hxOTVOUXNoR3hlbDdRaFVWenRaLzdnUkJpNldWZk1BQjh4TGRX?=
 =?utf-8?B?WmV2L0hRcWsydkN5UStPZUJvcjE3S3oxeTVYOUk3MEt1Q0crampyUGgrZUpm?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6C73BE4DB09A34898FCD0994C67032C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f857b8-9ecf-4da3-f4d5-08ddc4fec3d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 06:54:24.2210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvtkikqb2p3JTjRo9FEWX3gkGZrTbVs77kcv/YGbfsPFMtjlLZus03aQD2qyiH5Mpwd3a7gxVeu4okHMpv3S+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235436_111837_4D4E8602 
X-CRM114-Status: GOOD (  12.35  )
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

T24gV2VkLCAyMDI1LTA3LTE2IGF0IDA4OjI3IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDcvMTUvMjUgMTE6MjUgUE0sIHBldGVyLndhbmdAbWVk
aWF0ZWsuY29twqB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNldHMgdGhlIElSUSBhZmZpbml0eSBm
b3IgTUNRIG1vZGUgdG8gaW1wcm92ZQ0KPiA+IHBlcmZvcm1hbmNlLiBTcGVjaWZpY2FsbHksIGl0
IG1pZ3JhdGVzIHRoZSBJUlEgZnJvbSBDUFUwIHRvDQo+ID4gQ1BVMyB0byBlbmhhbmNlIElSUSBo
YW5kbGluZyBlZmZpY2llbmN5Lg0KPiANCj4gSVJRIGFmZmluaXR5IGNhbiBhbmQgc2hvdWxkIGJl
IHNldCBmcm9tIHVzZXJzcGFjZS4NCj4gDQo+IEJhcnQuDQoNCg0KSGkgQmFydCwNCg0KIklSUSBh
ZmZpbml0eSBjYW4gYmUgc2V0IGZyb20gdXNlcnNwYWNlLiIgDQo9PiBUaGlzIGlzIGNvcnJlY3Qu
DQoNCiJJUlEgYWZmaW5pdHkgc2hvdWxkIGJlIHNldCBmcm9tIHVzZXJzcGFjZS4iIA0KPT4gSSBo
YXZlIHNvbWUgZG91YnRzIGFib3V0IHRoaXMgc3RhdGVtZW50Lg0KSXMgdGhlcmUgYW55IGRvY3Vt
ZW50YXRpb24gdGhhdCBleHBsYWlucyB0aGlzPw0KDQoNCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQs
DQpUaGlzIGRlcGVuZHMgb24gdGhlIHNpdHVhdGlvbi4gQnkgZGVmYXVsdCwgTGludXggYXV0b21h
dGljYWxseQ0KZGlzdHJpYnV0ZXMNCklSUXMgYWNyb3NzIENQVXMsIHdoaWNoIGlzIHN1ZmZpY2ll
bnQgZm9yIG1vc3Qgc3lzdGVtcy4gSG93ZXZlciwgaW4NCmNlcnRhaW4gaGlnaC1wZXJmb3JtYW5j
ZSBvciBzcGVjaWFsLXVzZSBjYXNlcyAoc3VjaCBhcyBmb3IgbmV0d29yaw0KY2FyZHMNCm9yIHN0
b3JhZ2UgZGV2aWNlcyksIG1hbnVhbGx5IHNldHRpbmcgSVJRIGFmZmluaXR5IGNhbiBpbXByb3Zl
DQpwZXJmb3JtYW5jZSBvciByZWR1Y2UgbGF0ZW5jeS4NCg0KVGhhbmtzLg0KUGV0ZXINCg0KDQo=

