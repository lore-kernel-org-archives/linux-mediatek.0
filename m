Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B5D0BB4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 01:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBQaNcB27hPLM4tc3eYqf6OFPsmCkVBInZ57WYbl/sU=; b=ucRFCzbbYdJaDe9XuEFiyzutOh
	IcrKKnFJtNf+SFII85VaTgwhHL1WZwZYrN31zNO0tqkJpoqdmelGKAY5MtInc22Z03GVFLNvNaKPg
	WeSAIUtdD3yFcNI/CT4aXF69BOf+a1WVr1oNNIobWEM1PM/PDCOwOofi7Z+XrHP0BQBA9xxblqye+
	ZcWPhSue1izpwsxJxRWyyQThIhHa+z7mUcKjFqB3hUXIfhY9gSFahQlcEvrInj7jDZGmCLdV+9Jkv
	fWTCnCnz/DnyMTBYQkbQLCLiPOjhoiKnz0WUwbRJAG/HQ4Gz5qttsnzvn4FOgliHHDBAlf/53GAe3
	ty9NhU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n2G-0000000GSyJ-2M7n;
	Thu, 24 Oct 2024 01:53:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n2E-0000000GSxq-0vUV
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 01:53:11 +0000
X-UUID: b774fa4291aa11ef82ff63e91e7eb18c-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VBQaNcB27hPLM4tc3eYqf6OFPsmCkVBInZ57WYbl/sU=;
	b=P7CAxXtfqgpSE/jq6Vrv5DTEbh33wFNUG2PLLrxJ3fSR8noMsT1cuOmsrq0yvfI1JtmJAVUWWZCRUwvTAHReCoVO/Xo/JFDbGkHewnBP1pNxoLk289FCR+AODkT0YTElRWx/ZsgyUQvhu81pRjd9WRRpoYv/hctFXA5VFRlQbEI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:06a1f141-b7dd-4184-bd75-4ff1093112f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7155042e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: b774fa4291aa11ef82ff63e91e7eb18c-20241023
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2145329938; Wed, 23 Oct 2024 18:53:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 09:53:05 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 09:53:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D46A1Li4Oa7pLcr5Dv+SGkKxlK4HvmMGP/97CuUCO7X7RymMpnS0ajUEAUm9KMCGjfmLui5TUoxgT46O1aTs8+QlqgQhAjtkDrJhJmYeSUppRfLn5HJtdH3RZGm20hHzIGF9LwcJA9gzuZ9LtsuHG4rcyXco5g2JDDn4zd8j1ioIhA//UuDiELfzqbrHX/VhSRZDtwgxVQiOYIsaHQcHbwNGie65fuwQqRzIH1hphDVbSluCsQ2Xgf7ahcIWz2nvYimNpyea8jQd1aO7nknM85EXGDt+LHlVE/wH09VHWdcsNudmq9BxfagbUpeiZseWMOCW1PyENAULyUlyhc+e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBQaNcB27hPLM4tc3eYqf6OFPsmCkVBInZ57WYbl/sU=;
 b=JZ7ELdzBgSFA1sGJyG4lJZkulKJwiTkQYGutFwfrYrhMvSSOWhrHzuDJ0t2rW8+/Iw6SbnpRBH9YAfOMd+/Azalfy/lE7VY8VtRgTabV/RpAH6Ay46EHGJfVC2QNZcyMpxw2YjIkGBaC6rCqYJKUKp+yiAi261mAFhZh+zo9k4Px7LLqSOAZdCIKUg1CPVqTjyhLstu8DelAe8F6snkLvyNW/vzAVhfCsIdgfClrCoPYanTIQanOdheHI5sQcbkSk3uZdCzZ4tz+7INPU68e3CQorTtw5/Brp9ZEk9m2HxR7Q9CrOEj9R2dC4ESdaFgSBKXsOFT5+ssa0OWBQdS71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBQaNcB27hPLM4tc3eYqf6OFPsmCkVBInZ57WYbl/sU=;
 b=UE4kkRxvE3A7iIOYT8FlHJ+pkol0nimU5kXussggS0gamJo4avgVmwesxTdyPYz05GsVMd6EgLihQY+GA6z79qPsy/1frlN6P6QCXQpb84Jwy9P5fo8UgHwJRk2b8LjGkBLVmpAGQ7SiclZm3O5xiB9wGtYJzEQ5XWkOOVW4QrM=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB7390.apcprd03.prod.outlook.com (2603:1096:820:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 01:53:03 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 01:53:03 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"beanhuo@micron.com" <beanhuo@micron.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>, wsd_upstream
	<wsd_upstream@mediatek.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, =?utf-8?B?WWktZmFuIFBlbmcgKOW9ree+v+WHoSk=?=
	<Yi-fan.Peng@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?=
	<Tun-yu.Yu@mediatek.com>, =?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?=
	<Lin.Gui@mediatek.com>, =?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: fix another deadlock when rtc update
Thread-Topic: [PATCH v1] ufs: core: fix another deadlock when rtc update
Thread-Index: AQHbJU4mtRrRjX5yZEGMYAnaEQUnpbKUunQAgABp2YA=
Date: Thu, 24 Oct 2024 01:53:02 +0000
Message-ID: <6444047577ea2aa506140264b574d9933e750560.camel@mediatek.com>
References: <20241023131904.9749-1-peter.wang@mediatek.com>
	 <9805c64f-70ab-4693-aa49-b3659ebb38be@acm.org>
In-Reply-To: <9805c64f-70ab-4693-aa49-b3659ebb38be@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB7390:EE_
x-ms-office365-filtering-correlation-id: 10aefe04-0b0e-4f38-1e01-08dcf3ce98a3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bkhpRTBCN2lZbjBjRUZuaDdhb0JxMDZZdmhtYzRqRVJYMUdSRENFenRGdW1w?=
 =?utf-8?B?SlAwRFBYS202VHRpRk1IUWt3aEkwWCtpNVE0b05uZDZySGo0NHlSeGQwSTQ3?=
 =?utf-8?B?QzN0dk1rMmdMN2hpMzR2a3hHaXE0WGdSQWR2M2VuYUkvUGpicTRITDA4OHdK?=
 =?utf-8?B?TTcxTEJQTTJ1NER5RmU2YStkQ2lwZzRQTEVzVFdDTWlaYjgzMlYzcDFMY3E4?=
 =?utf-8?B?aGxBbUp1ZjV5UXJrdkRQNDNtSjRWZTBpUkdCeHQ0d01ITmNkVG84MFVHU3ZL?=
 =?utf-8?B?NXNibXB0cVV5MDV1S2tNSGUvNFdleE02M29DMXAvcXZaaCtIT0l5cDBML2hK?=
 =?utf-8?B?N1ZpbTRpS05wRlZORWJEYjFlNGhOUkIwbkFwYVZ0bGhZb09sNkxqZ054K1Zm?=
 =?utf-8?B?ZWZUSjNRaW1QeGN1QThIRUZaZTFIbDB5MXVoTkN1aVFOY2FyOG5TeGZkVUY3?=
 =?utf-8?B?c2ltVStSSndwdGJjekYzME5JRlg2SEx3TG93MVpDMWhPTFMvNnk3TDE3N2ND?=
 =?utf-8?B?V2xMM29BVnJscmJaL3d4ejRlMGlXamtBdGtIYVZSS1Z3N3pGVG5HRERHbU1h?=
 =?utf-8?B?VndmYzJaWVNBSVhiM1Y3M2pnMGdDTVBZT3diVHZ0aDNSbHl0QnUzbEtoTGJv?=
 =?utf-8?B?RFFIM2d1NHh2RERIM2NjQVdwTFhkQmhXWGhHRlV0UTlHM21zd1ZjbG1qMnp6?=
 =?utf-8?B?L3hVNU9IVGpyWnF5SkNpM256a3ptYUswYmQwbzgyTXdNbis2YmpMTFR4TU0r?=
 =?utf-8?B?dFJSTWFvYzU0OERsemMrRW9ZQnpJOEtRaFFoL2RCd3VLT0lveGhuR3NYd2ow?=
 =?utf-8?B?THoxaHM0NEhBZU1wMkNZeFM2WTR0MDVQd0JYOXo5Zkd5OE9EWlpGNWNrQWtm?=
 =?utf-8?B?czc2ME93dStnemgra2FZVTUvdG52emhZRVZvbW5uMTYvZlJpeFJaRndJdi8v?=
 =?utf-8?B?Tk9NaXVSOG9RdnBmUTFKTjVtTVhhNUI5QWJNUmx4RWk0cXd2NEJ3M29IV0hD?=
 =?utf-8?B?RHlCQjkwVUcwT3BYSzI5azR6VXllaXVTVmVxeEd3SkJHZGR4UG5MZTM2eVRG?=
 =?utf-8?B?YjZxNEFZb1NyOVVyMGFyOUNLU2FTM3pBWVBxNllPbHRIR05PMTYvRXNwQUUw?=
 =?utf-8?B?WjZaMGltSnhZUHJISUROOHJkWkhiRUk2Y2NuVHkxOXQ2eSszbkFnU1BzMmly?=
 =?utf-8?B?clg2emhWT1hUdjVlOE9mTStKUTlwZjc3TzEreGVNMHoycG9Nb1lFZDhOQWZo?=
 =?utf-8?B?OEJwazdiWjE3VjEyYkovYVVjNFh0b082N1lrbnN6VXNOTlJ1QmJZYmJQWTJj?=
 =?utf-8?B?bVpLbDArcVRvU2pjMml6dGk0cnhtR2VNWE5hRHFlNUhBbVJMU1dFMVZRNHNP?=
 =?utf-8?B?eU80NWdoTlJhMDFaSTRnM3BpTnFZMGkvRzYvWExVYW9FQU16Qm5HTDdXU0kw?=
 =?utf-8?B?djdEL0wxSFVaTitkNm83TlNZVmdzL3VOUjRjRzgwQlQ3aEhNWkVXUC9aenZw?=
 =?utf-8?B?SGZuODhldDRQdThUQTRKRWNrRzhJY2JBU1FzYnFnTVVaaTFSNHIyZ1dIRUtj?=
 =?utf-8?B?YWZzUnp0RzdMcExyLzNqNEI5Z2xZZ0x6WkNqeGlUTUFaZjZ2eHJPYk00ZkFV?=
 =?utf-8?B?S2g0V1hDSzJRUE45bzBqbWx6QVpKRUl4Zno1cTRNbDhWc3paTUtVczJPdFly?=
 =?utf-8?B?WG9rWEdHSFQrdkxiY3Z4czNkU3VxczF0dFdCZ0Y1MXhkOFBudVI2OHMya3lu?=
 =?utf-8?B?Q1E1WVZtWFQwUUp6R2RycVMrOEllcnc0TU9TL3ZCUkxpeVBsV0h1RmZQdlhB?=
 =?utf-8?Q?ug9oxmgIPaBIH9n78B/ne8fqkPghNnS6BXyJw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlZwYWZDVmF1aWF4S05PWW1KYm14MzJqeFFIa2xWNU5ydTVQaElIL0ROUEpv?=
 =?utf-8?B?dE03bDFCRmN2VFkwaURocHlPZ24rRkZSREdOU21mZ0E5ZFoyenR2TlQ3Sm11?=
 =?utf-8?B?Z3psMTI5enVtalBQZTgzVWVjaC9VVGZObmJXend5bnFCZ01RY0pDZ0hnRWR2?=
 =?utf-8?B?QW9YVUtoRTdVVjdGMzBNdFRGRlVTM1pYZFN0T2ltMGpNV3RIOHZ4Y1ZHWkRj?=
 =?utf-8?B?cUlYZGxtMEhkSUx6bWxaZ2drWlNVZmViN3JORlRSZUd3VEJDK0J4SXF2OWlq?=
 =?utf-8?B?VzJ6UDRCOVVnbURnNzU2S1JGRnZnTmx1NGZicDVyVjZubFBXNG9FS01uVUxC?=
 =?utf-8?B?V3orcVNvSEg5RlI4Q24yQVEwSDV1Z3huTUNqYzBIbmFTV2NiRWx3dFdmVEVK?=
 =?utf-8?B?OGJpUWdMRVpmZUkxa3FmUDFHM00yTjUveFE3bEdPU0RaMkxqMDJEY3Z5azNk?=
 =?utf-8?B?QXFWajR2V3ZCaDdxZ1FVQ213M0hCM0RhUHJyUnFvZWxZSm1tRmVRTE0wNE1y?=
 =?utf-8?B?bmJKZkJtV01ENXhrNFUvVGdTRC84NGVHT2JNcFoxelhqTDZZR0JmWDZGWjY0?=
 =?utf-8?B?b3I4aUNRaVRvVUFoUTN5NE1tYm5iWnZleThsMWdSSGtlVDdrYTBtY0YwL0N5?=
 =?utf-8?B?ZG03UStJUFF2VEF2cWVsQkVmMEFiOFJDcUhyUmFRRHI5MDNyWVZTVWhkOTBP?=
 =?utf-8?B?M3VVZGIwYlJUOHZIREFqOCswLytRYVRjQ2thNjlvK3loY1ZOTTJDWWtSK3Iz?=
 =?utf-8?B?UW5ZOEtmWllIQ2ljeWxHMFlzUGJsenBmUjhOWE54a2p0cjFRclpLRlZHeDVE?=
 =?utf-8?B?c1Z4eHR0UUFTSS85ZXFsQjV1ZTQwSjljMzFldzgwYk9xQ0NRM0RtYko0V1R2?=
 =?utf-8?B?cFFaVmo0eU5YQTdoY1dXOG1hY2dDNjE1M1JBVUZjR0UzZDByRVdQMDNaR3Bn?=
 =?utf-8?B?bnJWSEFGUW83ZUl3SC9sMWw4cWVGOHBSK3hGQkFjOW1PMGhMS0xHeWdDUFpY?=
 =?utf-8?B?YVg5NGRFUTlHWCtpK3QyUmpVaWk0STMyWEpKQlpsSzFhaTV2OVk5c293SXZY?=
 =?utf-8?B?UEdFcjRlZ2ZmcEVNUWkyTWg0aDJTb0xxU21DVmJOMXpaYUZyQ2c1S1Y3M0Vl?=
 =?utf-8?B?WGJ6LzdPSFhuRFpMREozb2RHYnhnK2VTN0p2S0U2a3BGSVpqQ0dpMHQvTXYr?=
 =?utf-8?B?TG1DT1JvOHMralc4alphd29zZWIra1Vjd3hOQTJsbXFYNXlrZTB5TVlIaS9L?=
 =?utf-8?B?eUNjWitYQmNqNXR4UUdtMXZ3TTFMaTBkdmo1bXRHNGF4NGowS2RNd2loMzhz?=
 =?utf-8?B?OUJPM3pXNU50OHd4WVhkVXAxa3ZCSUN5aitQbHJkMys1eDMrVkVkdVFjdDRh?=
 =?utf-8?B?dnQ5YnlWN20wdWdtN0dsWGJldnhOMVBiM0w1dGxubWhyMHRWSDdsdlpkdWE2?=
 =?utf-8?B?ajh4cmVGU2lEYWQ4UGRPTWdtZFF3MVNmWHdicXBNNUZJSXRTMjI1enlCM0dG?=
 =?utf-8?B?dCtBa2VpVUpOLzhGKzhDck5EdU83QSt1bzhiaXZReE1obzdOdU1oRHFvWE5q?=
 =?utf-8?B?dVhGN3pVdkZ4ZVUwUXZ4YU8vN0JvZzRYK1hwZWtrOHNlQUQ1R0ZPaDhTaTc2?=
 =?utf-8?B?V0tsTWdYS0hvck5lZFMwOTBuUnhRUjQraEtJV0grRTNKQUJ3cHNBTEV0Wkg2?=
 =?utf-8?B?OHBlOHhSOXNOeWQycUZTS250UFJNaGxmRC9QdEN6QllzcXEwa2RGM0Z1eDha?=
 =?utf-8?B?dDNnMU5HOTRsVDFrNUdtR3RJcFFGUkdyWkpvTFgwbWhicVBSd0lLTzlqRlI3?=
 =?utf-8?B?ZkxheTlZMHd5Z0lxa1EwT0NiaXBYbGZCdEtacUlIQ0d5MHg5SWIwamN1Q3BW?=
 =?utf-8?B?eGM1ME43NDdlTEQwZktUeGh0aWV1VXNhUGJQNmo0aVNvSC80MXdQNWZRU0tB?=
 =?utf-8?B?MzQ3bGR3UVZFQm1yN0F5bERMc1gydGVranl0ZHZuckZaNVlkaGc2cVd0OGJR?=
 =?utf-8?B?aTBiaUZmRkJRTldDUFBLUUtCTFdmK3Irbml2djA1UElyUXBQQldJVUpsU1FQ?=
 =?utf-8?B?dFpsT2dibk9wY2N5M3NyWGs2YmVDMlNvUlMvTFZkM3J5V2NSMkExcEZ6VjJq?=
 =?utf-8?B?bys3NndtUjZ0dDZBLzdwSjhabnExWS9SeTBBUXhzQ2s3MkRvczR0bldSdndO?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4728FCABAFBD084A8E4FEBC3C066B4E7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10aefe04-0b0e-4f38-1e01-08dcf3ce98a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 01:53:02.9064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0ezBwneKsX3ZCgoWJel/ea5xPqmlw2Zo0y2a/r9fsvzHIPgv7LAZYitp2Mwf2a5BXXx44VdfdQYtTxVt2D9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7390
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_185310_293826_29CB3944 
X-CRM114-Status: GOOD (  13.45  )
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

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDEyOjM0IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgDQo+IE9uIDEwLzIzLzI0IDY6MTkgQU0sIHBldGVyLndhbmdAbWVk
aWF0ZWsuY29tIHdyb3RlOg0KPiA+IEZyb206IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0
ZWsuY29tPg0KPiA+IA0KPiA+IFdoZW4gdWZzaGNkX3J0Y193b3JrIGNhbGxzIHVmc2hjZF9ycG1f
cHV0X3N5bmMgYW5kIHRoZSBwbSdzDQo+ID4gdXNhZ2VfY291bnQgaXMgMCwgaXQgd2lsbCBlbnRl
ciB0aGUgcnVudGltZSBzdXNwZW5kIGNhbGxiYWNrLg0KPiA+IEhvd2V2ZXIsIHRoZSBydW50aW1l
IHN1c3BlbmQgY2FsbGJhY2sgd2lsbCB3YWl0IHRvIGZsdXNoDQo+ID4gdWZzaGNkX3J0Y193b3Jr
LCBjYXVzaW5nIGEgZGVhZGxvY2suDQo+ID4gUmVwbGFjaW5nIHVmc2hjZF9ycG1fcHV0X3N5bmMg
d2l0aCB1ZnNoY2RfcnBtX3B1dCBjYW4gYXZvaWQNCj4gPiB0aGUgZGVhZGxvY2suDQo+ID4gDQo+
ID4gRml4ZXM6IDZiZjk5OWUwZWI0MSAoInNjc2k6IHVmczogY29yZTogQWRkIFVGUyBSVEMgc3Vw
cG9ydCIpDQo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiA2LjExLngNCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBXYW5nIDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
DQo+IE5vIGJsYW5rIGxpbmVzIGluIHRoZSB0YWdzIHNlY3Rpb24gcGxlYXNlLiBBZGRpdGlvbmFs
bHksIGEgaGFzaCBzaWduDQo+ICgjKSBpcyBtaXNzaW5nIGJldHdlZW4gIjxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPiIgYW5kICI2LjExLngiLg0KPiBPdGhlcndpc2UgdGhpcyBwYXRjaCBsb29rcyBn
b29kIHRvIG1lLiBIZW5jZToNCj4gDQo+IFJldmlld2VkLWJ5OiBCYXJ0IFZhbiBBc3NjaGUgPGJ2
YW5hc3NjaGVAYWNtLm9yZz4NCg0KSGkgQmFydCwNCg0KSSB3aWxsIHVwZGF0ZSBjb21taXQgbWVz
c2FnZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rcw0KUGV0ZXINCg==

