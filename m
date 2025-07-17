Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62E3C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFfoYGWAkXR5DRqL+MG9ckurUsRQTzN0S2GlddOxoCU=; b=HTRX8OLyEn/N4mcdx1yId9iy1y
	0hOu7FuUGx2D0U+Y59t8RXPkbmrXhDxyImBMR5yrCac4MOlUmnGhVpyjmLbJATR9VP+Nlmu0UEcrb
	r16rBoE9MNnQ0fGi/wWXpSn++HFMd/EQ+tAD9CgraXvnl2bKUiuRu+fijY/C2LtC7PaieXiAZecI6
	7U0BBsZUsByOjVcDjUFliXkwv7//aBXOksZ2VR+f9JUcRt4rK2epPkkUJZgew2wxPlHBATMxVIlVD
	CaOv+UvMBW6YjVWB4d2tTkZ6UIVqesQyYrJuK+nhi8xbFtfg4dwkBZBGftuFqCl3MFTW3p0LqI3V5
	LB1GrH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIUJ-00000009L2W-0bJo;
	Thu, 17 Jul 2025 06:53:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIUH-00000009L1v-1WTl
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 06:53:02 +0000
X-UUID: ab809f5a62da11f09eb0dd999d3936bf-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VFfoYGWAkXR5DRqL+MG9ckurUsRQTzN0S2GlddOxoCU=;
	b=JTAxaPWeyXVwwYiL1PcrfI30fFj8oXCKx1zY1Sy/9hsidJrQluhAn9MM8Z/MOZvUUPz9WX7B9O8lNoLsgPCVsJGXQ+qi2BmlCPaZs8tiKun4+VXwds70WynYsykmgoUWQPtuGBuYCgE5Ufl/UloszWSpCX/fiSEzvD9opd310iE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:29ca305b-ad2b-4be0-8058-5257a6b36a71,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b4431b73-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab809f5a62da11f09eb0dd999d3936bf-20250716
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 596050793; Wed, 16 Jul 2025 23:52:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 17 Jul 2025 14:52:53 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 17 Jul 2025 14:52:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eERq+V9JFX/jwxHqHGsdUjn9kPsWNpJ9KDB0+3QnIt2FAwgIaIEEtSMwaIaI9829P4zckaIFTZNgFBcSqMm5UGzFH9FimwMaR2CCR89fgKjvG6boB8boaDCXR7JSZ3b+fQravUWCBa5xzkl0oGSbQ2gD2NwsLsgoRM27TzbWalN9OVhHdyEcHYgsZpDCJfpfZE9Pef2cC76w5iWxMJ1oGqbsfr3Mq7tIxYC+Szsl0aL1iwInU86e5UA18svqb+ZohyvuN2UB5bb0gCog28rzZcH02BpgFrShZ8Gjpd7DtxTBG0pqCWdngINHuafNd/8z47CLQvWlcuzYunjXVW6v6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFfoYGWAkXR5DRqL+MG9ckurUsRQTzN0S2GlddOxoCU=;
 b=lfBd1uznPumshiIjUyD7c3IEydMzZDhYcI/YWs9M13e91pTtfVG7Pj4ZAQdBvi6VoaYb85T6sINWze6Cv5a5CikKhR0lVPlpOUIsbe+zmTzN+tJvVllKgMfYpxYicrLiG1OO/9CS64vaIia8SzlDG4Wgay7YISseGxfc1Vyifq7f8/XlvFaXu4OdEebbWJFhZtSLvDyVCC3mEg/CHp73U3xk7AIYgW5zz4rCKdyFSHvDmVGadHAFHhOis8oYH8mjM2vtAG9HpGIWfn/M5XSCkxDYcVRLgegO1hqYNFSrmUGO2/SoDr38cyU4CuCBjYYAVrTB4G6Pr2aXEGplETAZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFfoYGWAkXR5DRqL+MG9ckurUsRQTzN0S2GlddOxoCU=;
 b=hdkbeT67ljMiHlSCYgkCBlLC9Zl+uFXQqNj4oJc0rxDzagcGAN+a3GsFi3fuAoB2a2jD5jOp5c4rAORPsLgMOTyCaIgG0Ad2z9BHs+WA9qWYlQlyucME+7LGId2pK9BBocp6CVL+H32EqbcJv+svQtbyfmfwvaXbXNQGyB9f834=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SE3PR03MB9465.apcprd03.prod.outlook.com (2603:1096:101:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 06:52:52 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 06:52:52 +0000
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
Subject: Re: [PATCH v1 03/10] ufs: host: mediatek: Add memory barrier for
 ref-clk control
Thread-Topic: [PATCH v1 03/10] ufs: host: mediatek: Add memory barrier for
 ref-clk control
Thread-Index: AQHb9hr4fCegxrcweEiFFYLvpHULVbQ039oAgAECw4A=
Date: Thu, 17 Jul 2025 06:52:52 +0000
Message-ID: <384d34068926f8df4f4a3cbe3c733f3826ea06eb.camel@mediatek.com>
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
	 <20250716062830.3712487-4-peter.wang@mediatek.com>
	 <da89b12d-84e2-445e-9f60-936b41418713@acm.org>
In-Reply-To: <da89b12d-84e2-445e-9f60-936b41418713@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SE3PR03MB9465:EE_
x-ms-office365-filtering-correlation-id: 348859fc-b530-4610-51a2-08ddc4fe8cf4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YmVPenVoRE5qWnBmUDhjZVhMVE9XRUJpRHRTZjQxTVp6NE94UzE5eUFNWW1L?=
 =?utf-8?B?MTVzempiVHRRQXkyZmhLaGN3Z0FDcElzZnlYSVkxMFl4R1pneVpkd3dxY1Fk?=
 =?utf-8?B?QmpzRWZWM3BDbG1aOVU3TVpBdkJFZUZPZmpTWXE5UjJJRzk0UXJ6cjlLVkgx?=
 =?utf-8?B?cFJPYTFIc2t3MHBsWWx3M0JISCtEQzYwTWJSSEs3TE52N0JvZUx3UXI2OWdk?=
 =?utf-8?B?Z2s0VGRtUnNVWm9lSFJ0QVNVb2dUWkJIVVh5VzNiN2hTbzBYV3RhUWZsRUtz?=
 =?utf-8?B?WWFzcDU3ZytiRzlRUEY3YWs0WWNqSWMrbEE0T2dISlBKejNCNE1Jd0xWejVR?=
 =?utf-8?B?UWx1bTNhQWtMdFh1cU9sUDFKZXRISHBBQUo2ZUVQS1F0VW5wU1ZTYldKVU94?=
 =?utf-8?B?N0lIbWl0emx0aTc3MDJtNytqaGM4MmkrRDZ1R2pRMDU5Tm1HVkM0bVZySTJn?=
 =?utf-8?B?ZUVKWlBYQWVFOUdEYjVwYUtGSXVJaTduZTRXUW9UWU05TXUweWlRN0RyVFMv?=
 =?utf-8?B?Rk1odVBjQWkrS0hCaXBsd0JZYW1nanFXRTF3M1dDWngvdVhkeTV3SjI0U0Iy?=
 =?utf-8?B?RS93dEpqMVdkRzBHcFRYYlgrMTN3YTdTZzVvZXhXamxQNGEwMXdzZ0pWTEoy?=
 =?utf-8?B?Ly9WeEN0MXhwS1BXZmUxUmpxL3NtbDMwY1hwMTN4SWZsRlpqSGFmTFg0SGt2?=
 =?utf-8?B?cDE4YlEvN1VURHRDNm5VWHQvV2xyTW83cmFDM1VYVUVEWGE1a3BZbklRUitr?=
 =?utf-8?B?eVFEbjU1R3hJUVNsR2FoTmVZQmFaQUhzOWNRNU5JeENtZFErU2E1cVVDSmc2?=
 =?utf-8?B?Z2VUS3MrNkhxbjZNQkNiaVhhVzNDOXhQTGlhQTN2dkp3NFM3cmxmOVVvd3Vt?=
 =?utf-8?B?YVJzTmxwSEwzME1rSGgyaHFobHFDL2IrYkhlVnBnRlZKbnREUnRXOTh4bEda?=
 =?utf-8?B?SnN2dGtFdU1FOVVEUGdUOHFKVTZrSnhuNUlDeGQ3ZlB5WU1EVkQyQWpiWU1m?=
 =?utf-8?B?QTJRV3FvZCsrWHJKM05ENUxsd1gzWEdCRDdmemlnaWJWb0RLYy81T3FVWlZR?=
 =?utf-8?B?VEVaN3RRckNRUlJuUWNoKzZKY0IrZDJsUzQ1SXdLbUU4am9JKzkrZ28rKzBJ?=
 =?utf-8?B?N0pDaFc3TUZ1RisyOFQwdmloOE9YYVB6Q09SbVN5T29IYnppNXB4NjZtRXB5?=
 =?utf-8?B?S1NkZ1FkSUoxaDRWbmt6ank2Y2pDUFJsMWtLY1pZZ2ZGL1JVMnZmTmtZSGQr?=
 =?utf-8?B?TUJRUzJWd1RRT3ZmZ3ZRRmNxUFp2T2xHc2RZbXdSaytFREVncTlUQ0FOYVc5?=
 =?utf-8?B?N2xmYktITXdxcGZBOWtmN21tMzRWZVJhVDA2TXJFd1NZWGpIOFpYTVN5em1Y?=
 =?utf-8?B?Z2FkSGorelhhY2IrTGVKYlVudTk4amQzZ1JTbnZRSUY0M3hJc0kweFhDSUZz?=
 =?utf-8?B?MWh2QlAvdWEwbXJJcFZiOEZXRVVFK2d5dUxmT3kwWXBpSksxSk9aRGwvdVZx?=
 =?utf-8?B?MVdXYXRpNnlmY1VwYVE5NTFzdlNnLzFrazl2Vm5NMlJZVU53MjVpRzg1MUtr?=
 =?utf-8?B?bXVJdXFOVlpMd0dleTlGTVp2VXM3Wi8xMisyTkxXTm1XY3pacURQWjJKckJ6?=
 =?utf-8?B?NDlGUmpiZCtqWS9ieDJPMElvMS8ycUdDb1FhaHZialVURG9DSktMdmZ6bkRZ?=
 =?utf-8?B?ZEk3ZVFnanR4Vnd0eDhRVG9XQ0xVbDUrKzZxdkIyK2pmemhLNjVNRWlTTVFs?=
 =?utf-8?B?eHlQSWlmOVlXZHlDZlpuRnF2R3VMa2FMMmxHa09zT0VyVDgwalVVZ2tpbXRl?=
 =?utf-8?B?aUxob1ErOWZwVUltamZubUZuVFhCYzhKVWtnZ0w2cmNwRDQ2QTJxRDQ5L2pX?=
 =?utf-8?B?TkpCOUR1akJ5ZU0vTm5rZWp4S08rR0FLQkVFVWdBbVpFem1NaWJHMDdDNk1x?=
 =?utf-8?B?V0N0QWN5aWU4eFBweE5tWGR6bFdTRUJNVytGTThtOXpXVHNzL2IwL2luT3lB?=
 =?utf-8?B?aUVXeWlvY3pRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1pBN2lkN3h3Y3FidkdTVE5oNTVwejdWeEQwWUlEVkU5UWgveWJCRjhjVm1x?=
 =?utf-8?B?ejE1YjNKNmk1T3dTcFNvMlJxWk5KTzgxQWZlYmhnRDFOcElTYmd3RmlWME1J?=
 =?utf-8?B?cHhsTkx1emZyRXpRQ0VTUmlOK3hJTnhyTFo3dEZYeFNRZnhHd0w3UHhmU3Nv?=
 =?utf-8?B?dG5qZmpPbzRPdUd1cGF1Q0hiVlJVeEdyV0VkOGFBN1M4R1dORnd3alVkMURY?=
 =?utf-8?B?SS8wVGZadkxkbjN4cVd0L2tuUzgxUWhKeUxDVXZPdnlkNjZLU1dzZ1VSQ0Mz?=
 =?utf-8?B?STFUR2txdmpEM3FhT0RiYjc1SUZ4MVAvbm85bnVxWlZhU1hYUnp5bngvTHgr?=
 =?utf-8?B?OE16aUIwT3dBOENVbWNpKzlmanJqME9PaWUwVWUrQXhOMjZrVXBjUE9pUS9I?=
 =?utf-8?B?dld6MnQ1MmtydHhRMWVCNUFrWnh2UENKYitzdWoxaWc3MW9yM1hOMUlrMlVV?=
 =?utf-8?B?Q0laamp6TUNnTUcwM2FjY2U5Sy81dHdiR2N2dGU3UTVkV0FaOVlwaDZJQytP?=
 =?utf-8?B?L241b1lBcUVWWGw0elhzOEl5U3EreXJGelZQVEUzWFBBYVRabGhycUVVdjdF?=
 =?utf-8?B?K25RYXIrdm5sbmIxcFFOQ256aU4zSGUwSEhJVEMweXplendRRG5abnZwazdk?=
 =?utf-8?B?K05hTUFCZ3dxZXUycUpTUUhQUmdGU2VLVUhNLzJKREU0M0xnTkIrV1lqYTdy?=
 =?utf-8?B?MjI2UjBjTjhxM015c3gzTWxiVHduOTdLQUF1a1pJd2VjS01Cb20xTGZoemVy?=
 =?utf-8?B?U2VSRHdVeDdXYjhLdTFPTUVGWXBWN0Vza0o0VWhXWktsY3E5WkdhMWhwZjVQ?=
 =?utf-8?B?OTEyMXFGcm5YWjU4eFZaZzdpdGVKWDdIR2lvcmFnajE0VVd0RWRmOU5oWHh6?=
 =?utf-8?B?b2VlVnV6Z2krYzZpVzRaeDRFOTdobXpkYloxTnJjZlpnZjd0ZHZHTHVGWTJy?=
 =?utf-8?B?Umh0YzQ1WHo5dHNuZzFYZ3Q1ZkJxcjZtb29tTkxNVTQ0VFJVV3lQeGt2UU5p?=
 =?utf-8?B?WS9LczE3T2wvTFRhelpCUFhuWS85NTc1VjQwdWJlWjZqdDNkek44ZXFmNlpE?=
 =?utf-8?B?MDlYRUhEYXZLK2ZhbEJDemVKUGZNbzlCSHB3TDZhSWN1TkN2eVd6U3RTTnJj?=
 =?utf-8?B?S0NIOUF4aEtWMjNVbHAvaitXSFBmWE9sZXNlTWx2ZjQ2SHZzUjJSVENJNmlU?=
 =?utf-8?B?ODZDSll2aUc1N05VUUJ4SjF0ZER1TUlhdmZpcE5RWXpOdEJha2IyODFsM3Ry?=
 =?utf-8?B?dmRZb1JQOGYvd2c4Z0RCVWpTeGlmSEUxamhpTk5hNGMvQ0lmZGRXOFVLYlcw?=
 =?utf-8?B?bkxVelQxVW1DNWJ0dXoyb2FsakorbHJJbUNaMWF0MHZtbnBuQ05nbmxPZzdq?=
 =?utf-8?B?MW80NWtnU2xhQWhPbU8vLzlBaHZqZjlxQ0UzRi9mUG5mclhQeDFSanIyaGc4?=
 =?utf-8?B?Tms1dDJ3U3VrVnJTVzRwaEZhM204QVIwZTEvTjkxV3d5TTNYdGxEd3FMZTdt?=
 =?utf-8?B?dS9SRVRZNGM4Q3k3SlRvalYrMGNoclJRQU91bi93Sk4vL1BMTk5LYy9uRmhx?=
 =?utf-8?B?Zk5neHMxQS9GdXMwY3U1cHV6elVsQmNGY0NYaGxmUFRRV2xmNGNkN25jYkwy?=
 =?utf-8?B?c2ZCYnkzMG5KTWlVdDBaclBDeGRTYU1zd3AwOU9rVDdSODgwMTZtTzRlbEtv?=
 =?utf-8?B?UDRWUUZ4WkNJQ3RLYmNtYUdvRFQyNVd2c1A5SDdYb0dVUy9Gcnh3YmhsSU8z?=
 =?utf-8?B?d29IOFFlbWMrNGtiT0FUTHJXZk05dkE3UGZwKzRBVXV0VG16THdUdzZMUFFU?=
 =?utf-8?B?YTN3VVFoU1VJTlo0dHAxcEplRkQ0K3BQWnRvRW1vUGVYa2JNVjBncVcvbTli?=
 =?utf-8?B?N3ZFZEdvRERTNEpuR093cnhZQmE0T1lWV3J3bWpqd0NURHUxc1ZpUTlCd2xx?=
 =?utf-8?B?RnNHeHpMbk1tSEx6dGtJRmJGOHY3VVdlaVNWUjdlRHZMRkw5NTVlMm93WU94?=
 =?utf-8?B?Z3JjWlM4K1FSdVJCbXFpdFdoVGU5Mk1lOWY3Q09UMXV0MHBKQU83ekZ3WUNU?=
 =?utf-8?B?b0haUlVwVFBOQTdUOXh6Z3pobmRwckhzUmk4YjBuWFUxVjI5aTdQemxMM3cw?=
 =?utf-8?B?eEZoSlFSRVVXTDBaNU1HQ014Vm1meklIcEd0SFowaTI2MnFZT2xZWFJxU01p?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <970776E4E8773F4DB74E6F98CFEC2D51@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348859fc-b530-4610-51a2-08ddc4fe8cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 06:52:52.1542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3gzHChy5FaXq2zUnxZm8uAbtUCh0uwruPtNfdM5Llis8w6DrbEPyJ/B8CkeyulrC429xmbfCZxMQ7QG+Qj5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235301_416706_7C54D0EE 
X-CRM114-Status: GOOD (  11.66  )
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

T24gV2VkLCAyMDI1LTA3LTE2IGF0IDA4OjI2IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDcvMTUvMjUgMTE6MjUgUE0sIHBldGVyLndhbmdAbWVk
aWF0ZWsuY29twqB3cm90ZToNCj4gPiArwqDCoMKgwqAgLyoNCj4gPiArwqDCoMKgwqDCoCAqIE1h
a2Ugc3VyZSB0aGF0IHJlZi1jbGsgb24vb2ZmIGNvbnRyb2wgcmVnaXN0ZXINCj4gPiArwqDCoMKg
wqDCoCAqIGlzIHdyaXRlZCBkb25lIGJlZm9yZSByZWFkIGl0Lg0KPiA+ICvCoMKgwqDCoMKgICov
DQo+ID4gK8KgwqDCoMKgIG1iKCk7DQo+IA0KPiBBIG1lbW9yeSBiYXJyaWVyIGRvZXNuJ3QgZ3Vh
cmFudGVlIHRoYXQgYW4gTU1JTyB3cml0ZSBoYXMgYmVlbg0KPiBjb21wbGV0ZWQuIEEgbWVtb3J5
IGJhcnJpZXIgZW5mb3JjZXMgb3JkZXJpbmcgb2YgTU1JTyB3cml0ZXMgYnV0IGRvZXMNCj4gbm90
IGd1YXJhbnRlZSBjb21wbGV0aW9uIG9mIE1NSU8gd3JpdGVzLiBXaGF0IHlvdSBuZWVkIGlzIGFu
IE1NSU8NCj4gcmVhZC4NCj4gU2VlIGUuZy4gY29tbWl0IDRiZjM4NTU0OTdiNiAoInNjc2k6IHVm
czogY29yZTogUGVyZm9ybSByZWFkIGJhY2sNCj4gYWZ0ZXINCj4gZGlzYWJsaW5nIFVJQ19DT01N
QU5EX0NPTVBMIikuDQo+IA0KPiBCYXJ0Lg0KDQoNCkhpIEJhcnQsDQoNClVuZGVyc3Rvb2QsIHRo
aXMgc2VlbXMgdG8gYmUgdW5uZWNlc3NhcnkgY29kZSBhbmQgd2lsbCBiZSByZW1vdmVkDQppbiB0
aGUgbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MuDQpQZXRlcg0KDQoNCg0K

