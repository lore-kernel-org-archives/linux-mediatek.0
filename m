Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB382C531CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/Gnbc3fQorlaXLb5W+25X1WYjSe/g8CiQAV+nAqpRU=; b=p5c9T7nFi813UJNnaiw0pRwhaz
	wl2QUJ2W1+8GxU5LcKANGWHVM3C/IluGeMWKWE1NkemmTOO3XRhwMOycEsz4W/7MMQq7qYs3xIbWj
	x4XNooKLZL3bjeOU7nO+q4H78V/tPR7/Jzv2Hqb7HaUTzg2cx942RckHReLUTdqKGFJqWen03lJ5c
	wnD2kBppsfpSAnxCahiELlgteCUPRFlInJ4+PmbhkkZyHBMyaVnTwPhRbkF+LC3z+55dWkVtB+Y7P
	xMrS5cFFkLAM1oKuK/UJBWimksQRjr33u6xohX7EMuy04o3AVK1LqyYyJcZu5CJQIagMsHI/PF3Vp
	O0SZ/VKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtOP-0000000EMtt-321G;
	Thu, 23 Jul 2026 13:23:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtOM-0000000EMtJ-4B1P
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 13:23:16 +0000
X-UUID: a3b71306869911f1acbe4559397dec65-20260723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Q/Gnbc3fQorlaXLb5W+25X1WYjSe/g8CiQAV+nAqpRU=;
	b=PxW/AIVwhE/Aaz1kRD+FJSilRj7IODQRmtLHaEBHANhehBbbyGPegtfHsZyurVUUrX0b9MH46JJR3Dmb+hTjcd1osBAYsp1/siYMEtF/Xg051eXXm+5PB5NypHoPKdgM5JFgo+2oyyRNHXTuBe0AH2A2rsnqEVQfUtQmFXJwlmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:545505f8-ac05-4a3d-90b1-7923fa9dcdf7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:272e7919-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a3b71306869911f1acbe4559397dec65-20260723
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1150168299; Thu, 23 Jul 2026 06:23:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Jul 2026 21:23:03 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Jul 2026 21:23:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ7haEJ2dwZv7zENKi7ZzKbi5HmCg55foeVqkRwvoSYt5QBqpygDyPM+CH3BxwXT7ShafFAJ6H9Wci6p7ggsfeXi1pPcIlacfmhJkzi37yVT/W+c9H+fSoztBorUeK99qm2oGxYOfrcUmIC5aNQHO578v/kRe0MYkZqz2vllRyPK/aeLX4M8pwUxSVQVJL/t4km6uo2klFppadwPSl22lCZ+aO8vdcS8zcrtLbwNbwnDYdqAOsDqcd1/eGoKpObhzJcsP2ioMJn6TjOXbRaNhQdQWLFrjGwVtKE4xnzF+BdULOsU8HvciHqEEvpzTlFNKYixrflr3I/t8ny5hIP08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/Gnbc3fQorlaXLb5W+25X1WYjSe/g8CiQAV+nAqpRU=;
 b=CcMRozoX8ARe41VfYCocvY1VhfycwzsTWdbMcPNqUdx8DBXTNqVRDOCz9UF2Mr9vefDQ4cqob1yJkAdzbZ8K5a4yfTFy2RPHD/AOE0f2zrLGcwRUqzruvci0ltD3V5IgcBrz+WZsBi26PgNF2hR5VlqkuHVJwejnaNKwCg+55qgjTSHPYlr9z071ExFrV3Bchldhw9uY6Bf2zg9A25SMiD+gSqGlND7+Jd+O6hNxnCs4yJAt5C3jCZM/ZBlevIY4Kp6OM1CGLclapmBxgMo5jsQZ1fcG8EjGX0tB2Ln8H67BqxBk7Oh2FWk6IU+QjIU8OF4TI75Gi3YQ6aocrRB83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/Gnbc3fQorlaXLb5W+25X1WYjSe/g8CiQAV+nAqpRU=;
 b=pV32bEKiuXzHvcdGLbU0IPd/7+KlVwMHM50t/3MqSXgtaI/18oXwa9vjXtO+J5lXr1WQjgvuS+53kDHv2+askaZpGurqpibcsRU8yfrpEUjDEQ1rvKBK3XG/I8ftmG43tbGZIWcmvwqdld/mIcyTGwA7uIA2FdqumyJY8viLPi0=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by OSQPR03MB8457.apcprd03.prod.outlook.com (2603:1096:604:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 13:22:57 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 13:22:57 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "mani@kernel.org" <mani@kernel.org>, "shengchao.guo@oss.qualcomm.com"
	<shengchao.guo@oss.qualcomm.com>
CC: =?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
	<eddie.huang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?=
	<Alice.Chao@mediatek.com>, =?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?=
	<Ed.Tsai@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?=
	<Tun-yu.Yu@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Thread-Topic: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Thread-Index: AQHc9Cb93EUGOKVTq0+kTr1d74Ua7rZ31FiAgABjWQCAAOK+AIACPgAAgAAMAgA=
Date: Thu, 23 Jul 2026 13:22:57 +0000
Message-ID: <7c55a405dcc3a0a80931263bf1807c815e78efea.camel@mediatek.com>
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
	 <al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y>
	 <29b5f4368a63847b84b87e36a1e358f5991b694c.camel@mediatek.com>
	 <amAqHFOgPQQY-3rI@QCOM-aGQu4IUr3Y>
	 <yyocxatyi7bitvehm2fgltxpayomt3d6r5zyr2ugbehkvsowcz@cg4if4zdqgbu>
In-Reply-To: <yyocxatyi7bitvehm2fgltxpayomt3d6r5zyr2ugbehkvsowcz@cg4if4zdqgbu>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|OSQPR03MB8457:EE_
x-ms-office365-filtering-correlation-id: cfc7758f-a78f-4f34-9dcd-08dee8bd82a0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: b9igxeLEbz9qmvUfj77wj6a1Tx/S05o9xY0yX0E02s3Nn/wXbRVPBVzepJbsI1X9h3s38FuMchJVmsPGFkUU8eGH+csivUi8GXX3NUx60gGOsOzEfbVblWSXkLDJDLWYaqY8BBlzvcN4V48UxUYIaUnW7+KNj535mhPzT9eV5uUkCj7rgoOgqwcIRy0niL73vhgBhlgN6Z9CIfzKbWNx0qanAZwB+ospG2KRyIyg9hUGeK61fgLxKJDChWFA4xuvleJH/lVhyS+h4ixMTdDZsNfeDRdLNPKkWo9DI4VG+DIrBub4qz7SGoyQyqgabpV76ahlRmD3raxneF93hiaVs/tRlAFLuaK+2Li4rR5Ng0Lp/PodHkzlTP6E/k0QMGO6pdgGglvQaxT7Wp7smpGk42LlJz6Yhlqy/XwAetCCIy3hPhpYjYT8w52aHwjFOVUkOSlV20dv20NG/dzRPiXdkYRtoLS3EOnv6wjoLSvwtRLMbjOdajEPVtRozMAP7OYx+1F4Jdl8Mhr5M+U5RXFIYn5mvF3fhKfXvpcprFj+UCZjqMMFpxbSoNC7sNQE1OUGYEGQxsSloJliG0YIs+1QNIVcTv9FFkTGkQ+2OsIE60wDWJ5PvmL3Qyc0myoRsxsnvMDGcaEhnaGDeorMPPjmXOuXMuxAE1ld2wq/TDo/oBuN8nFAoIBf6YGiERZT+FsnK4QDLARQd3woDkMuqMZbFqvRbMo2SJ7Ue72Pf4dLfsY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmZYNklxZjhMY2dITkpUTFBwY0kyRmxnbjRoOTNTNnliT0dzYVpzL2wwM0xY?=
 =?utf-8?B?SDRKYXJPYSs4bXRDK0x1OGlYQTU1NVBTaVhubmpHZzVzbkV4M21HOHVrQlEz?=
 =?utf-8?B?VXhxQnFERS9xczR5bUdGTkt3dU9IVWpPWTVmK1RzUDBrM08wMUJGSDNhNjc1?=
 =?utf-8?B?SWliYW5BMXE0MEZRTzNNb0N0SWdPZlVVU3c0OGVGemMzQytHREF5YUs5dmo1?=
 =?utf-8?B?ZVg0Y2thTXkrd0JWeW5hY1hKdkYvQVR4NVpUZzRzOE1zYjhZNDI0ajBUTklh?=
 =?utf-8?B?ZmJnTmc5N2hmMkphbU9oTVZWa3N0QUhERGptaGYzR1Yxb3lYejhzZzBGb0ZZ?=
 =?utf-8?B?cHQ3RjdMdDVDZStHU2c0NnJWUUF6bzhQTHQ2dThVdStOVi9rUU04OFdvSlNV?=
 =?utf-8?B?SlJzak92Yjc1MTFkZXJEd011N09QY0tid0x3MUsxZUZRWmtYREpaeUU5eUkw?=
 =?utf-8?B?dDRwYnhEYXFMZGJrZkRUc2R0Q1VEZUFGNE9QYzNNWFlIMFVzTE9CRFpFQ0Yz?=
 =?utf-8?B?OUpyNDFJeWxKcml2bFlxSkhxa21ldHIvcGhVZEhuMXpPNVdBd1N2VHVWTVFz?=
 =?utf-8?B?RDdBdDQ0Kzdnek90dzNOOGpFdDVRc2xROFVOV2Q2dmF5VzN0Q0dQTk5xYkdi?=
 =?utf-8?B?YWFMaG5sY0pRQ2pBQk1pNjZaV0dBL3Nkd2Jrejh3RVJodHFodnkzNHBkNEZE?=
 =?utf-8?B?UWJweDJ3WE9xTXBBWlRiTzF1TWxXbGNuWm96MXBWSGJ6ZkhCNjd5SW1xU09I?=
 =?utf-8?B?dU01QjByUFVmdHRTTDZWM1h3bnh4eUx5ZFQ0aExzVE8xTDhjU2J5MDhwc0hO?=
 =?utf-8?B?eXFTZ0tsV2ZHVUtPR0t1VHJDdnVHcDhsT0pZblR4TG9FRHNtYkhjNW8zYUdh?=
 =?utf-8?B?aDlsZk1ZRFlaRDhsVVB5SDl1NUErRlZ4T1BRVWZHWkRTZmdTZVgvc1B2VmM0?=
 =?utf-8?B?cTlSOERVYW92aTcvLzk3aHNRWTFJeThEU3J6OXZobm5RaWVib3N1RjJndjJa?=
 =?utf-8?B?ZHFwVFZ0UlF4VmVvbXNVeHlLMFgwbEpNVEl5WEdRQWdlWWt4WjluTVFTK0dL?=
 =?utf-8?B?NS8ycHBkQUFGWkJPZlV2c1FDajZZV05tVnA0WnlUMzI4ZXN6S2M1M0ZRZjdp?=
 =?utf-8?B?cXhGL1BSWDhVdDVsaHpMN3MzbFlUcEpPNWZ4NkhTZHBPOWhEY1dWY0tidlVK?=
 =?utf-8?B?Wm1ra211MklCM1ZjSkZJOVFKVlUyMVNDV1NWalZzR1VINnJ1U3Npd1RUMDVL?=
 =?utf-8?B?MkZYOXdLN2NoRjJQa3pHWjUwSlYyU0F1MmVWaGhzcTg1bC94Z0VuUXhqcUhu?=
 =?utf-8?B?NUpUUDBJU014OHB3YTllR0hZMGVUYkhIMyt5RnZSeE9YMmxYd2JRU0JTSEhF?=
 =?utf-8?B?akNuUUlzM0hobzRRdTBTV1IzM2MwUytYNms0aS9Qc0VxbHZ0b09mRit4TGg4?=
 =?utf-8?B?WCtqN3djTlVZTVpEdmZBRUxYc0RlY2dvSDNhZE91QWlPeVlBWUtvVFRBWEl6?=
 =?utf-8?B?U1B5THE0RWtxbkR5V0x1MUNOV01hbDlmS2xEMEN2SWI4UG9YOXAxZHZuaGph?=
 =?utf-8?B?NFo5MlAzQkN5SWlndVUwakp4T2wzZHBnT2lXS3dEUDJ2QnB4S2JHem9WTXVQ?=
 =?utf-8?B?WVBlK1lQck8wYjhZMDlsanZWN0NjV1VSNXZuZzZsaEJaVCtLbWtCd010d25U?=
 =?utf-8?B?eHFrTWd3d0UyZng0WDBQTlcreU9zVGtpTCt6bFVwSmVEak5jYmNOdk1Fbnhq?=
 =?utf-8?B?enNXWjUvcUxqZlV2NncvOFRzWDNNbWxrYmd6TW5LakZLcmE1SGdOd2VuT1ZB?=
 =?utf-8?B?eHJrT2hSSGlJbVNoY0dOME5HcjZjZGJ3MDh5YTllZHFpVUNkelhDK2J5V0VT?=
 =?utf-8?B?bXduajNrNmhoOGlDYUt0WEIyUHQ0Y0MxYVZiYTI5V3puVnh3NElIb0ZaYmY4?=
 =?utf-8?B?Vko5c2REZk82WWZST29yMDlERkFFMXI2VW5Oam5GM2xoT3ZURW1nT0xVK09B?=
 =?utf-8?B?RDhBWG9odyt3MDBNZTN1ZjU1Yi9vcTQvNmlaVUQ5VWhmamlYUkdxUVNzQ3FX?=
 =?utf-8?B?NHJCeXlQSlhjVWExWlZYbVhUdFlOZGlKdGhaZ3BJY0hsT2VnOGVsR1NaUlo3?=
 =?utf-8?B?dUFjZElUN052S2Z5TDZ2NEhIS2ZVNlh3cGtYWW0xZU9YcTlCSktjQ2dsVWlx?=
 =?utf-8?B?ZlNCaFBpZCtqTnI0ZWhIR1pqK1lMeWZkb2h0RnlGY0pGMkRaR2RBMU0yTVU4?=
 =?utf-8?B?RnBPV0ZHV3dPd3JrMnVNUng4SU1EOUdoM0I1d20rdkZiMWRrS1hBekVpKzJ2?=
 =?utf-8?B?MEN2aTRBWHdzZkNTYWZMZEJxVEpNTlR4VnNpVThxcE5pYUVJazJNd1NCcS9i?=
 =?utf-8?Q?3CMS+f2skKN670AI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79FF951B5B0D8448B0EC9A8AC2DC38AF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FZA/8y5oUu5ra5Q5sxon5wsQ+tsJVGQEJ28ZAnZp3UlxhA6oyKltqw1T0q1PTYfpS+SxHlKBhiNd7qpf1ErNTsPLf+Ul1Cq0cKdJLE80bXGCE0tvN5iPhOp1b0ggZ4J7hg40/dPr51gjwCefYH+R9WZNv/KmwqODl6pqK2Mns+j213+HL8twIhNNo3nA6LCt0+yo6CwLWmtp3GmLHH+Ukqn45XSCm2CvLX4GNqq0gYjgVG4r9WhyF/j73p4GZggQHOz6G1Tu3hwcxvbYYnULUnHP/QwEZb5muYdH4kAcB9bl7p3z4m3Zqzpu/vwVtyagzTUQpgKW1UoLpAdgyAhaxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc7758f-a78f-4f34-9dcd-08dee8bd82a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 13:22:57.1010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcYzbL9/QA+1tJB7wTaRRnPPnjVkpoXQFpJrzAWee9vLV9ZYZeDd2nmNGl4a+gOii7OMOd3jz6M/XNnZpKGEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8457
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_062315_058593_FC28A526 
X-CRM114-Status: GOOD (  12.62  )
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

T24gVGh1LCAyMDI2LTA3LTIzIGF0IDE0OjM5ICswMjAwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
d3JvdGU6DQo+IFFjb20gSG9zdCBDb250cm9sbGVycyBkb2Vzbid0IHN1cHBvcnQgc2NhbGluZyBj
bG9ja3Mgd2hlbiB0aGUgdHJhZmZpYw0KPiBpcw0KPiBvbmdvaW5nLiBTbyB0aGlzIHBhdGNoIGNl
cnRhaW5seSBjYW5ub3Qgd29yayBvbiBvdXIgcGxhdGZvcm1zLg0KPiANCj4gSWYgeW91IHdhbnQg
dG8gcHVyc3VlLCB5b3Ugc2hvdWxkIGxpbWl0IHRoaXMgY2hhbmdlIHRvIE1lZGlhVGVrDQo+IHBs
YXRmb3Jtcy4gQnV0DQo+IG5ldmVydGhlbGVzcywgdGhpcyBwYXRjaCBzaG91bGQgYmUgcmV2ZXJ0
ZWQgYXMgaXQgYnJlYWtzIFVGUyBvbiBhbGwNCj4gUWNvbQ0KPiBwbGF0Zm9ybXMuDQo+IA0KPiAt
IE1hbmkNCj4gDQoNCkhpIE1hbmksDQoNClRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdGhlIEpFREVD
IHNwZWNpZmljYXRpb24uIEFzIGFsbCBTb0NzIA0Kc2hvdWxkIGZvbGxvdyB0aGlzIHNwZWMsIEkg
aGF2ZSBub3QgYXBwbGllZCBpdCBzb2xlbHkgdG8gDQpNZWRpYVRlaydzIHBsYXRmb3JtLiBIb3dl
dmVyLCBJIHRoaW5rIHJldmVydGluZyBpdCBpcyBva2F5LiANCkkgd2lsbCBjb25zaWRlciBob3cg
dG8gcmV2aXNlIGl0IGxhdGVyLg0KDQpUaGFua3MNClBldGVyDQoNCg==

