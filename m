Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323F2E6C617
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4fbJphqplgQPFv4iSRRnQcx7wxuEQqMEa7vix6TdHo=; b=yyXZ1PugsNbBtNjk10VsV+R/PC
	4JRgCykwfBXWfd7x7mnuBbJXLTCqbFBOp+kZazR3yrGr4NjpcjhyXovBABiBdiK9mjv+9oA5hhV+p
	RweoarHvc5J6Lm5SaETkNtiQuPh57xD+wps/jWOOnln7Luo3WklJaJNQ/fbh4BtHkvi8uZCsghOcK
	Ft5WNTPskfW8YFbzAyYSrVr4OM+A0Wej8cgrJdsqiN8oC9CAIEctp5uyQoNgm/s6iACcSWVOFZmle
	ycaVVdBr3pRA3mApC3qKZG/xSuAclr2tV8xd09ZlxNe+dI1ZFVd9MoYcIesxHWMTBLMQXONB956Ta
	fbfThUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIO5W-00000008f9u-0jzd;
	Tue, 03 Dec 2024 08:16:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIO5T-00000008f90-2Z1K
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 08:16:52 +0000
X-UUID: ee41104cb14e11ef82ff63e91e7eb18c-20241203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=p4fbJphqplgQPFv4iSRRnQcx7wxuEQqMEa7vix6TdHo=;
	b=OGwbOH1xtWIX1sxQfUysq/n0lYnG//XahnyGRAfhrKt7QhtlIcLeBFXPYks+01YCiqAm0EqB9ayO6I5FDYB3SznJ73RYC1C1Ab5enpeimC2MRGhg6wswBMDvVc4CGKZBKa6e6B7XDGrlV/H8jVxefqOY5lbVKllsfZdi5ITZYAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ce6772be-35b2-4643-8601-37b52b6c02f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d4ece223-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ee41104cb14e11ef82ff63e91e7eb18c-20241203
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2006372079; Tue, 03 Dec 2024 01:16:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 3 Dec 2024 16:16:41 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 3 Dec 2024 16:16:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuzYFTgQp1bYMTsQJwoNN7tAJUiWlUzTQ8dGQBFZj7GG1DpPYKLN0O1t/Py1NFMTF7bDouhwSoqBOM/h0cV2J0uLvLy+jZNVkghaF1Fwba/DrPByu9SqDzcW/xl6HU46HkaE0TkmTA5T4p3zSrm5mBPqgRPfvzacte8+XyuKAklnnyVoCVPCPQSfsvCj88UoBbmASxRVB7h91hgOVJd621ZgqII5xs8hHW+tT9Ov6B6f6etAJ6fbCKbVekMw7EA9wqAGJS+YrvqOKMb6JtI4nY8RMj4i9BP12/W8vIdieMQ/jaMKccq7FhZrD12VapKwgOXJP+8DgQLdXtZBqqA8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4fbJphqplgQPFv4iSRRnQcx7wxuEQqMEa7vix6TdHo=;
 b=PksrlSStywXjqLk/krSijI0bVtCmP8fymurZeJvDusLlFnc+C6B8YsjOhdMXDMA/WtVkAdmxgkHMIk4/vIB2pTT+Rgg0CZ9hyXGpYv2vFhtgcZg69iLignaWW2HoK6ZDnWIwYqtZotFHfcBNoXjC3wclOFQZIZlzE01xIY9+KkSsHLww8QKM+fXpUAvgVTj1jzqgvn8owOeXghro1iX4csXMemwkpaAdBnndV3RBvdI3xuePsUzbInAp+GwYthXLgJCKHOoGPU8oipdWW6vv1i9RBrNUKpdM5jG7jVw75/8MJWhfGMO+oHDTmGfIswwR14KO2m6tOpLBfzlG64fZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4fbJphqplgQPFv4iSRRnQcx7wxuEQqMEa7vix6TdHo=;
 b=sKPGJqcuTuWMKMi97F1ZqCmELMrZ/qz+mnAkjKLS+zE3nyB5+I9jCDrxxJEl++j1e2cuWxHuRQwnv2Klc7IH7dKFdT5vlGN5TZi/33umxoME+ueWaBJ2EGVnQ3tuWdJ+Vduy8eFEksr7ujbpjD9SJioJyMDYBdVth89DdveNosY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7297.apcprd03.prod.outlook.com (2603:1096:101:12e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 3 Dec
 2024 08:16:38 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 08:16:38 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "michal@nozomi.space" <michal@nozomi.space>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com"
	<2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com>
CC: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	=?utf-8?B?U2hpaC1jaGUgTGluICjmnpflo6vlk7Ip?= <Shih-che.Lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?RGF2aWQtWUggQ2hpdSAo6YKx6Yi657+UKQ==?=
	<David-YH.Chiu@mediatek.com>, =?utf-8?B?SmFtaWUgQ2hhbmcgKOW8teWNmueakyk=?=
	<Jamie.Chang@mediatek.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Index: AQHbRGCSkTEGink4kEKH6qQz95YK8LLULpeA
Date: Tue, 3 Dec 2024 08:16:38 +0000
Message-ID: <26a311d6983012b2ac6d782eb9cbb32005dd79bd.camel@mediatek.com>
References: <7QZPNS.0SWJEBP013RP1@nozomi.space>
	 <b38ade853c9fa01369fe8e400c693d20e8b2256a.camel@mediatek.com>
In-Reply-To: <b38ade853c9fa01369fe8e400c693d20e8b2256a.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7297:EE_
x-ms-office365-filtering-correlation-id: 93c0b652-7ee7-48aa-8e88-08dd1372cfab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzVObDZ1b0hWZEFsZklUeWJ4cXdUZ3FqWUYrWFFZMFFJMHZVU3BjdWs0ZVRB?=
 =?utf-8?B?K21kOWttMGNCaWlGRmI5d3pNSW1vVlpMYTZTSTV5amwxTEgwQ3BaZnN5ZmhI?=
 =?utf-8?B?a3B4Zkh1eG95Y3pVOVJvVURucDNPcUs2RmF2aGthcTBwbEkvWFRBajcyWWxN?=
 =?utf-8?B?S3lZaHhyeGpGazhBQlphZVY2aHBJdExoSlBpRllqNTRlNm83UEpGOXF2dC96?=
 =?utf-8?B?dm8za1BPdHNWeGVtSnVDVStwaHJncWp6Q3RZZHViSlYzbzJUMGkwa09XNjB2?=
 =?utf-8?B?TUZ0T1FhWkIzZ2QwUk1zdEpobDdkM3pRZER1WXlwazZ6d0QzRlEzbW5JVjMx?=
 =?utf-8?B?NFB4NTlxKy9BWjZmNCtwOE5TS2VqaFRrdGdyVldaRTVQTmxyWXAySEx4L1li?=
 =?utf-8?B?RmJHV2tyWi9nWk5nQ0JyRWgycCt6REpYTURPY3VXZUNJWEZXd21oYVY4WDFG?=
 =?utf-8?B?NTk2SnZCTS82SHhPdHZYa3VEYVBjMWF6aWVyNGxaTVE1TTMyYmgxaU5GUjlo?=
 =?utf-8?B?MjVQeDZ0N0piSVQyOXI3TXlJMDZrUjhyNHZ1WVROWmV0WkpJU2ZySVFnd1hq?=
 =?utf-8?B?TUhsTlpmUm1GRVUwKzFEZThGSGRES3hEdnFrT2ZjQjhlR0xIY1duMlkxSmZ6?=
 =?utf-8?B?NWc3VGV6ekw5SXRuaDM3Y25JWHJMZGp3ckh1MHBHSmwwVEd1NThYcWdkTFNh?=
 =?utf-8?B?eGY5b1o5bTlzNUR3S0VtRFZNQUo0aTJldUx4K1ZGcG9iRnh5b0tXNm5LUGND?=
 =?utf-8?B?ZzB6Q3RCMXFGM3pRTkpiVFhPUDZYcFhWQitNeFcxSFVEWlBFbStaWmRKcE8r?=
 =?utf-8?B?UU1FcVA3cW5SajhLbFV2UVVzRmU0bnlGdk5ubGFjWUhldUQxN25QUEVHNnRV?=
 =?utf-8?B?VXVjTEQxVDh1bjlOM0dkK1Bqd1d5czZGaS9INXJNdGp5alIyWlVJOStMMHRo?=
 =?utf-8?B?ZmlIQmtVd0VjUStsZWVWZ3EvTnNCSGNKdDJMNVpoZ2ZhT2N3Y3cydFNnTTN6?=
 =?utf-8?B?WmlDUE1FWlZMZHRGci93WTNUaDloZE1qT2hEM2M2K3RDQnZhY3BqZStBMmFG?=
 =?utf-8?B?S3kvR2xPcVVwckZuQ3VXdzRqMGpXcm9ZNjFib3FUaE0zNVFMY1pNcVQrWUJr?=
 =?utf-8?B?TGRDWVJYOUw3aG5FUTJQZFMzR2Fmc1Q2eFloU1pxZ0lEZlZYdkgrN0d3Zkp6?=
 =?utf-8?B?WGNLVkh6Rm1xM1MzZ3Judk80Qlk1bldTdzR5RWNVczV2Q1lBZ3RHeG53TkpW?=
 =?utf-8?B?UnVsSXRHMTJNQVhINTg5cmhaNWFuaHJOSSs5eXRQZVJZTVMrc2ExaGpBWGJk?=
 =?utf-8?B?c2ZmSkNtUjV5dUE4Z21MRFdTZzFiblR2c0trMDhGNEFQQlhma0w0dUJWRmp1?=
 =?utf-8?B?NjNnS00vaHp1R2V4ZXFjdm5NMHJRM2pxUklGcG1iSllNc2lMamJWY0dMRFVP?=
 =?utf-8?B?cytESk4zZHVkc3Q1bzVXbk5td1Q0OEdubnIvTGZOUitUaXVjNGI3S29YTUwy?=
 =?utf-8?B?ak42ZnNKUlRNb2grS3crYlVBMzlVamplZ2kyVHo5dnJTaGJQdVF2T0pCRC9W?=
 =?utf-8?B?UUlzZjlUZ2RyY0xnNDNoYjBTeDBJWis3Q3J1S3Y2RDU1ZUE3anRjNU5pVXFR?=
 =?utf-8?B?aGdodVdkL29odTZzVlFYVUl1SzN2NmpSSDZ3R3BLSUFGSHMvK2ZHUHY3amNZ?=
 =?utf-8?B?SnFvbGtIMmc2WVc2K3BPRllPYVBNbHZ2R0hnU1R2Mmc0T2I4RHpBSjZra25Y?=
 =?utf-8?B?VW9zcHdUN2FYbWFrQVNiUkFNSEdSRjZnRXc2RTlYUEFieGlLdjlubkVXSlJF?=
 =?utf-8?B?b0tGaHVzNU0yTVNtWVpkRDlwWkdVb3EyMXc4ekZ3cExSNjF4a0VqcktXVDdO?=
 =?utf-8?B?UWs2RFF1amVVV2JaZ3ZBbUJHN2tLTTBaQmd4SDRJMEZRY1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVF6SlhzQUhNWWhWODhEQmZZZ0lPczVSV3Z6bUc3dHc2b2JyeW42dVhtc1Ux?=
 =?utf-8?B?NlNId2xXbER4SzdjWjVSb2N6VGsyNWRLc0I5dUhoVU5VdVZWZDJEcGRHWmFG?=
 =?utf-8?B?eU1wY3p4cWZ6VjdmOHBnRWU0UXRxWGMrMld1L3d6ZEF5UXovVlZQZ2I3bXBQ?=
 =?utf-8?B?eUVrdlVUc3A2ME12SmJRUkpOa21EUzFWN3JXbkx0TUluM1R1aXNFNVBVcjZx?=
 =?utf-8?B?ZmhmQzRtZjdFRUJ5dlhWcURkc2hhWURibFVkUlEyekpabDNMKy8yanRrUmNn?=
 =?utf-8?B?UktGUEV5eEt1QTlCbUY4S04vZG5HcjhyaFQrRk1hdzY4cHdUamtsSGlibHJx?=
 =?utf-8?B?OXJwVnBIL2lsb3NPVUt2RitZYXdOUGg1eXZERFVRRTNMZ0Rab1E0SFNneUNQ?=
 =?utf-8?B?MURoS2VTUm9Qa21nZXgySUduV1FzMFJVekI0ZlE2cXRRMlkrdTVqa1Q5NVBm?=
 =?utf-8?B?RW0zckNaMXdybk1LbmJvRzZOK2pOOGg4eTRtWVJRRW1nSVIwT2k0aGlIT25j?=
 =?utf-8?B?SXBnNWt4WkI2WU5MTEJJNVRwZlpscVE1ZWFFM3pkOGxMUDVwcVBEckRMbisw?=
 =?utf-8?B?alhNbzBPVHBvVjFPN3NDNFJySkxBejZ2eTRKT1ZsOUtlVEJuV1htQkF3QkFP?=
 =?utf-8?B?ZXBrOGJ2V3pJL21oRE5rTXNJUjVsaHV0S0NnNXY4eE5NSFNxdU0vMEM2bTNC?=
 =?utf-8?B?cmxlcm1PQzk5bE1xRGptaW83YWxNNEF4NGlDN0REdEZBZUNCNzNQd1oxM1hn?=
 =?utf-8?B?QlNlNlZWMzBIQXhnUHNXMUJWc21aNzAwa2EzSGlscjJwblNIRzN4YmorUEls?=
 =?utf-8?B?Z29MNDZzenh2aGlGNkZMUWFQN09TNDFJWHBYZ1NCNk1aN3NXTjlBT1R5MUFx?=
 =?utf-8?B?eVp0OW01eUplempaNWQ0YmJGMXRoNTBXR1lHaUhUUzM4ZldrUnBjaFVPTm1k?=
 =?utf-8?B?My9SMGJJMnlhMU85WnU5d0M1eVRqbG5pM0wxdzQzbVFCZG5NdjlsSUVrZVA1?=
 =?utf-8?B?MGo1Vm9tbXdxcG9SeFZJdFI2UjZLYWd2WjNsUThpUWxORzYzOG1CL3JGUWFH?=
 =?utf-8?B?TU9idDdSUUduYnZzeUJ2VHZCWmVoYmxpb0lhVTlWd0piTGtrT0tIMkVTNTRZ?=
 =?utf-8?B?YkU4TFZ1MTU0SnZRMlA0NWJhNEpUY1d2OFQvN0hYVGc4eGVqWlRSVVpiRVBO?=
 =?utf-8?B?Zk5CU0lBa0lFNHBkU0NZM0VwRTFWTnNGYTRtUDY4dkZyUVJUdi91WnZISTZX?=
 =?utf-8?B?NjRZMFBGUjZsVGd0MDc5a0E1QWpKYWFvU1BDMzRCYTRvMDkxdzgwTWdSVCtD?=
 =?utf-8?B?SzNuejNwYnlZUTM2eUdIOVFrTmFxM2xaQk9ERmhYbEgxOXBYQlp5UWgrVXlC?=
 =?utf-8?B?US9ydG1NWm9IMW1CbXdKY3M1ZTBmUjNNNWlrSStuVWRycHZVN3FjQ2hvNWFS?=
 =?utf-8?B?VVFCLzFhcDhIZ1JmeGIySXdCcm41Z3N5Qzd3Uk1aclIwekpWQ01ia09Pck5Y?=
 =?utf-8?B?NU1hYjlHWFFaWVNBWWtjRDFYcXF2eGZudzJCYWl3Mm5Zais5QmZlR1VsMU1G?=
 =?utf-8?B?WUlJVllEeDB0cDlrWWhveVlnNVJxVXJJcDh0Rm9FODZyWGpLZnVLa3VkZzBp?=
 =?utf-8?B?M2FKL052TVBtM0tLclRoRXZnbVFZS2RTRkdCN3NDL3pGQVJRenNGaFp0YXVq?=
 =?utf-8?B?QkNjNmhybU1hQTlzOTFwUDlCRlZNMVFwdllMaWdURSt2aGR6Q0I5M1g1QXdK?=
 =?utf-8?B?ZXByQWxWaXRxZGdSSkpQdERQR2JPNGNqaWMrQjhMR1ZtK0ZTUk1qazE1QkIv?=
 =?utf-8?B?OVduREovTG5sb2s4VHRmYi9JeWpiSFhRTnZnMUNvNXYxMWRQT3lDSTJYcFVU?=
 =?utf-8?B?bUdqUmxtUjJ4VmFneWl6ZFI0K203MlFTa05HRlJxSzFySWFnbjdxODZWTnYv?=
 =?utf-8?B?L0srWmtnZWZyOHpUSDgwU295YWtYWG0yUk9lVDgxWjZENlRadGhidUY3VHBi?=
 =?utf-8?B?TktyVWFBamtDbnB5aEgra0RNTFhSZWlEYXZkSjdyMmlNMGVoaVJhVi8rOFc3?=
 =?utf-8?B?czhjeE9OVC9FZXhGRHpRVWV4ek9lVnNQN3lUUEpYRlIwcEVKOXZ2R21lZnZI?=
 =?utf-8?B?ZnFtTmFjdWtPSTJPaEVacEZjUEw4b25LYUQyVDZ3ODFjRmVGdG9KTW14U3F3?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2E65C117E0C8F4188E3FE32AE23179B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c0b652-7ee7-48aa-8e88-08dd1372cfab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 08:16:38.7696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x608vy+3E/DXhdXUs+K9eSbQrZ5+8uNqDG2fYK5OVZcsAa30D3vCj4RbBrnDxZRkwz/m+QcrakpKS6sUXVOI2Q9C+Tt7OguY7RHiDbs+bkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_001651_655626_B3D237CC 
X-CRM114-Status: GOOD (  29.58  )
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

SGkgTWljaGHFgiwNCg0KW3NuaXBdDQoNCj4gPiAgPiBUaGUgcmVmZXJlbmNlIG51bWJlciA4MjUw
IGlzIGVzdGFibGlzaGVkIGJhc2VkIG9uIG91ciBoYXJkd2FyZQ0KPiA+ICA+IHNwZWNpZmljYXRp
b25zLiBOdW1iZXJzIGhpZ2hlciB0aGFuIHRoYXQgbWF5IGZ1bmN0aW9uLCBidXQgY291bGQNCj4g
PiBiZQ0KPiA+ICA+IHVuc3RhYmxlLiBGb3IgZXhhbXBsZSwgdGhlIG1vbml0b3IgbWF5IHNlZW0g
dG8gd29yayBwcm9wZXJseSBhdA0KPiA+IGZpcnN0LA0KPiA+ICA+IGJ1dCB5b3UgY291bGQgZW5j
b3VudGVyIGJsYWNrIHNjcmVlbnMgb3IgZ2xpdGNoaW5nIGZyb20gdGltZSB0bw0KPiA+IHRpbWUu
DQo+ID4gDQo+ID4gVW5kZXJzdG9vZC4gSSB3YXMganVzdCB3b25kZXJpbmcgaWYgaXQgbWlnaHQg
YmUgZGVwZW5kZW50IG9uIG90aGVyDQo+ID4gZmFjdG9ycyB0aGFuIFZicCBhbmQgcGl4ZWwgY2xv
Y2suDQo+ID4gDQo+ID4gID4gTWF5IEkgY29uZmlybSBpZiB5b3UgYXJlIGdvaW5nIHRvIGltcGxl
bWVudCB0aGUgcGF0Y2gganVzdCBmb3INCj4gPiBsb2NhbA0KPiA+ICA+IHRlc3Rpbmcgb3IgZm9y
IHVwc3RyZWFtPyBBcyA4MjUwIGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhlDQo+ID4gID4gc3Bl
Y2lmaWNhdGlvbnMgYW5kIHdhcyB2ZXJpZmllZCB0aHJvdWdoIGEgc2VyaWVzIG9mIHByb2NlZHVy
ZXMuDQo+ID4gQW55DQo+ID4gID4gY2hhbmdlcyB0byBpdCBtYXkgcmVxdWlyZSB0aG9yb3VnaCB2
ZXJpZmljYXRpb25zIGJlZm9yZSBiZWluZw0KPiA+IGFjY2VwdGVkLg0KPiA+IA0KPiA+IEkgd2Fz
IGdvaW5nIHRvIGluaXRpYWxseSB0cnkgdG8gaW1wbGVtZW50IHNvbWV0aGluZyBmb3IgcGVyc29u
YWwNCj4gPiB1c2UNCj4gPiBidXQNCj4gPiBJIHdhbnRlZCB0byBldmVudHVhbGx5IHRyeSB0byB1
cHN0cmVhbSBpdC4gSG93ZXZlciwgZnJvbSB3aGF0IEkNCj4gPiB1bmRlcnN0YW5kLA0KPiA+IGl0
IG1pZ2h0IG5vdCBiZSBlYXN5IG9yIHBvc3NpYmxlLg0KPiA+IA0KPiA+IElmIEkgZGV2ZWxvcCBh
IHBhdGNoIHRoYXQgd29ya3MgcmVsaWFibHkgYXQgbGVhc3QgZm9yIG1lLCB3b3VsZCB5b3UNCj4g
PiBiZQ0KPiA+IG9wZW4gdG8gbWUgYWRkaW5nIGEga2VybmVsIG1vZHVsZSBwYXJhbWV0ZXIgdG8g
YWxsb3cgdW52ZXJpZmllZA0KPiA+IGRhdGENCj4gPiByYXRlcywgd2l0aCBjbGVhciBkZXNjcmlw
dGlvbiB0aGF0IGl0IG1heSBjYXVzZSB1bnN0YWJsZSBiZWhhdmlvcj8NCj4gDQo+IEFzIEkgYWxz
byBoYXZlIGEgaGlnaCByZWZyZXNoIHJhdGUgbW9uaXRvciwgSSBjYW4gY29tcGxldGVseQ0KPiB1
bmRlcnN0YW5kDQo+IGhvdyB5b3UgZmVlbC4gQ291bGQgeW91IHBsZWFzZSBjaGFuZ2UgODI1MCB0
byBgODI1MCAqIDEuMDVgIGFuZCBzZWUNCj4gaWYNCj4gaXQgd29ya3MgaW4geW91ciBzaXR1YXRp
b24/DQo+IA0KPiBTaW5jZSB0aGUgb2ZmaWNpYWwgY29uZmlndXJhdGlvbiB1c3VhbGx5IHByZWZl
ciBhIG1vcmUgc3RhYmxlDQo+IHNldHRpbmcsDQo+IHdlIGhhdmUgaW5pdGlhdGVkIGFuIGludGVy
bmFsIGRpc2N1c3Npb24gYWJvdXQgdGhpcyByZXF1ZXN0Lg0KPiANCg0KSGVyZSBpcyB0aGUgcmVw
bHkgYnkgaGFyZHdhcmUgZGVzaWduZXIgYWZ0ZXIgYW4gaW50ZXJuYWwgZGlzY3Vzc2lvbg0Kd2l0
aCB1czoNCg0KRHVlIHRvIGludGVybmFsIHJlZ3VsYXRpb25zLCB3ZSBhcmUgdW5hYmxlIHRvIGRp
c2Nsb3NlIHRoZSBhY3R1YWwNCmhhcmR3YXJlIHNwZWNpZmljYXRpb25zLg0KDQpUaGUgY3VycmVu
dCBhcHByb2FjaCBoYXMgYmVlbiB2YWxpZGF0ZWQgYWdhaW5zdCB0aGUgaGFyZHdhcmUNCmxpbWl0
YXRpb25zOg0KMS4gcGl4ZWwgY2xvY2sgcmF0ZSA8IDU5NDAwMCBLSHoNCjIuIHBpeGVsIGNsb2Nr
IHJhdGUgLyBWQlAgIDwgODI1MA0KDQpXaGlsZSBpdCBpcyBwb3NzaWJsZSB0aGF0IGV4Y2VlZGlu
ZyB0aGVzZSBsaW1pdGF0aW9ucyBtaWdodCBzdGlsbCB3b3JrLA0KaXQgY291bGQgcG90ZW50aWFs
bHkgZ28gYmV5b25kIHRoZSBndWFyYW50ZWVzIHByb3ZpZGVkIGJ5IHRoZSBEUkFNDQpjb250cm9s
bGVyIGFuZCBIYXJkd2FyZSBSZWFsLVRpbWUgKEhSVCkgY2FwYWJpbGl0aWVzLCBsZWFkaW5nIHRv
IGEgcmlzaw0Kb2YgZW5jb3VudGVyaW5nIHVuc3RhYmxlIHVuZGVyZmxvdyBpc3N1ZXMuDQoNCkkg
dGhpbmsgdGhpcyBzY2FsaW5nIHBhdGNoICh3aXRob3V0IGhhcmR3YXJlIGd1YXJhbnRlZXMpIGlz
IG1vcmUNCnN1aXRhYmxlIGZvciB0aGUgc3BlY2lmaWMgcHJvZHVjdCBsaW5lcyBhcHBsaWVkIHRv
IENocm9tZSwgbm90DQp1cHN0cmVhbS4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+ID4g
DQo+ID4gID4gUmVnYXJkcywNCj4gPiAgPiBTaGF3bg0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4g
TWljaGHFgg0KPiA+IA0KPiANCj4gUmVnYXJkcywNCj4gU2hhd24NCj4gDQo=

