Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97525C5AE5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcR1PDO3XqXDhR87HlTKJdv7mMTkCWZM+ifOK3dTRv0=; b=Ry90tgS5Q9/5KRgwBc3kqVCg+i
	3kR2k/oJhzsUHlwqMgOieOK41fp432Xjl5ApTYOB0sflaAoRt9IDsaBn2KfgSsoeZck8+iLq0awuE
	Vu2i3Wt1Am6kLPlC9gJQEDXoksNA7T0DZEzoY5d8yNKE5RUgY/NCTGruZrs9+yyte8F9YEI0uxoCX
	cWlPl+9CbSErwq3WaQbCVrNbqr82/AeNpINDzhzI/zbIyXReYDQCRnzOpeaCbDksBuPi+rkT9YPd5
	28+6sYdLXMdknR4A46AzN6nZd2sngb8qBSZx1ocmVgnOl/Z7tD8HHBbN9munafnTG/iUUnWGmYSUZ
	achGlg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJHx-0000000FetW-19A0;
	Wed, 28 Aug 2024 14:04:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJHv-0000000FesD-1PqJ
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 14:04:44 +0000
X-UUID: 74275842654611efba0aef63c0775dbf-20240828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=AcR1PDO3XqXDhR87HlTKJdv7mMTkCWZM+ifOK3dTRv0=;
	b=jCOeEkMFjWZ8l7GsmRLsSLIaDe3/IkJ9ZrQxVviUM+4WxZr/+fC9HSycj0G94hqdLGXWDtM+/lCD0ME9XhKhS+zUrGpXgW/MGPm568Bq2Os1tybVGpyuBSFq7VSMiCIX8e6X8xkj5VDDNCiEpha0Bf267tfnqyHIhK/mE0QEvPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a455e60f-dfd7-455b-8951-98658c0d71be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e56c51cf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 74275842654611efba0aef63c0775dbf-20240828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 751426130; Wed, 28 Aug 2024 07:04:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Aug 2024 21:44:31 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Aug 2024 21:44:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMWYrP+DAZygy//3Ni8jFmjBNzIVfPKfguYbg/CWFFmgkKzTM68UCYB0rcLCIC5OHL0Lpsg7mkjNJbS7DFMDJMyA+ekNcGw17GeUqvR3yB3RVjsOQypnZ5bxWv04YVU6YgBmbYrP8kR5ov+4tMbFf4r4IKOjtyT2l46XCxOb76ku8cWDsJaX2ZnwtMkK4nMXEf4fMQyF9Om/voRRbc/iZNK3Cq9pfXbPSZvL+GCcDRLz5kDnMC8gz+DqjoTditqfkAfQtGWQVswKhCmYUdg11FkIYeLi9R1Ise/pxOPM4HPlY4Dn+3+pE+mOXlxXYzLBUmbXI5oLTqn/WhgxeN7Oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcR1PDO3XqXDhR87HlTKJdv7mMTkCWZM+ifOK3dTRv0=;
 b=TZNhkM/FmSiVyqZR6NIfP7lR7pwndrFBCm9yG94rO5xrc79QYlz4ZeD1qqvUSwytPu43xju4ibopQzEtRJzzU1vms2nwyJQblwhfm53BXYaI3kTBSsz4Jn2rgBGy7bmX6NkfNreTA8tFupEs1XWrFeW0hWZKEtfX1w6Z3D7tFvxqIczPzrW2PY3+pqbSDjfUPMrCDc8lQvV0kKCr6FK/Lc54R/QW67rbK8or64n86Mn8QX4Ntvc9vOnsmtUvrkk3XTF2lLCMCPZ6groyXJ6ZyEB/Xh7bkoHjUlGoBTT5ZhOE5DoXICoahaOTKU3k1fkxO79d8+XtXcrWKdxgVLl7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcR1PDO3XqXDhR87HlTKJdv7mMTkCWZM+ifOK3dTRv0=;
 b=tcIRBnaiqFE6Hx/pBMXyMmCcHR/3FYwGi4/AZt1mKrPwLIcPhc9eTsMf+XXByuckJYIl1zwz6XgbFhFd/x77hSkcP+UHs4rcw2ABRsxJrSzovwpfN5z2zRWQQ2Z/45qPOdmSap/Im7G5HWtyI/L1jDmwTYs2KPykYfxWwbYgjyA=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB7800.apcprd03.prod.outlook.com (2603:1096:820:f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 13:44:28 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 13:44:28 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
	"chu.stanley@gmail.com" <chu.stanley@gmail.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
	<Powen.Kao@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>
Subject: Re: [PATCH v2 2/2] ufs: core: force reset after mcq abort all
Thread-Topic: [PATCH v2 2/2] ufs: core: force reset after mcq abort all
Thread-Index: AQHa92p5UuXNCQQ1AUqWyHtIHaAJXrI7RC0AgAFtyoA=
Date: Wed, 28 Aug 2024 13:44:28 +0000
Message-ID: <9b3cafcfed80ec92b3935c2ce08e5839b62f35f7.camel@mediatek.com>
References: <20240826034509.17677-1-peter.wang@mediatek.com>
	 <20240826034509.17677-3-peter.wang@mediatek.com>
	 <6bf76097-bcd7-4021-936f-9ea3d6e2f4b0@acm.org>
In-Reply-To: <6bf76097-bcd7-4021-936f-9ea3d6e2f4b0@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB7800:EE_
x-ms-office365-filtering-correlation-id: 9ec30361-7c2c-475c-4a67-08dcc76789b1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RHo0WCtVQkkwL0Y5Vm15VTl4bkcvOSsrVlltaWxLZ1IzdVVhRFVvNmc0Sm1X?=
 =?utf-8?B?NC96YjE1OGQ3eWJIVTdnYmlqaUsyZzMzYjMzU1JhN29RQWw2d0JEcEcreHYw?=
 =?utf-8?B?MmdNcVJnTXNqckkrbnhRWjdNa3BFNnB0cFVOZkFZU1FlR3BVY3JydkdUUFdI?=
 =?utf-8?B?UmdTV3lmdGJuL1VsWHdzQ1FnaFdXQnlqM3ZMRzVicjZhR0pUVlJjcEhYdzlp?=
 =?utf-8?B?VDJpK2VLWWFEU1VFVitlL3ZOeDB4S0FpT3BDKzlIYnlUYXhNUEVGK3B1WTJy?=
 =?utf-8?B?TVFuMkJSVCtNd3NWdVQxczZaSEswUEVWcUZ3MWxQT2E1Rk5lL01TalJwNmw4?=
 =?utf-8?B?dHNxakdvbUNCVjErLzZ6eWcyMDZGYm1XWTJ1NUZPVW5WdEFZdThROHBRYW9i?=
 =?utf-8?B?TXR5K2N1akdPUXQxZUFjK3ZNdXE4VFVqMnN2SlVZcGYralNUWTdJOHRwSkVB?=
 =?utf-8?B?NExqZnZBNjhiUWJ5emY3WDg2S0xSR0U2OE9JRmF6dU1BbHJONXNtZU5kNUUr?=
 =?utf-8?B?QlJBekg2VlovcUJ5d1c3MlBhS3hhUGZqRWRLWVpaODBQd3JLdGZva2x0cGFw?=
 =?utf-8?B?TnpGUS9FRDU1ckJpN080ZTJYQXpOUTAwck1oWkxRSkdhcHFaek53TisxTzFK?=
 =?utf-8?B?Q1Y2Z2Q4aUFIeGdTY0NMUTltV2x0SWhJYmE5d1FXWVpySk1TMGUxR0ZlVGFF?=
 =?utf-8?B?TnVBajdCU055QThyaHNQQ3haeVhLVGtJOTBvTnc4bFZrMjJjVk9FNGJpRkhJ?=
 =?utf-8?B?aVM2ck5UT0FpMHNVY1pNNW1YK2VMZ1I5V012OUNyL2g2aXFPZExhUnNSQzZK?=
 =?utf-8?B?MlMwdU1ESzViQ3ZlaDZoY0RKV0t1Vno0TkNDSE1XbkNFZldFSjBUL3laaG56?=
 =?utf-8?B?ZktjUHpNRktLM3VHekZHZVRzK0YwQlpqeWs4dDFEYUZzNWFRc3d4R1lVVDVv?=
 =?utf-8?B?OTdTeFJmVjUyVmZJaUt0QzFxY0o2RFl0STc5bEpvL1hkU2pROFRaS21LcFVm?=
 =?utf-8?B?MXN2QnBwS0JTNmIreUhpU0hPTm5rU1ZmQW1YT0JKVTdNTlVnUk9yUUVldkxW?=
 =?utf-8?B?bHNxWXF5VUJoN1E4NzgyMzRVSmJLSWplYmJtQ3BqM0hON2gvSzVuQzVtZXhq?=
 =?utf-8?B?YXdxNmVzQVRIb2lVYzduZHJJTE5keXpqMG00MUl0N0w1QU4vOHFpZi9LWnFp?=
 =?utf-8?B?a2ZlanFHSmM2b1BJUktaMEM3SEVWa0FEck53WkxFbElhWU5la0wyYVdHdUdq?=
 =?utf-8?B?aGFtT2R1d09LNXZKUlEvM0JFUUhPT1NWZTNWYVNNaGpWbUZZS1hMcjdpSVQ5?=
 =?utf-8?B?QUtKdzBYV0luZlNjc3NvV3drVmpSS3lVeTFLRTZIc3hPQmI2cjhSdXdqcFU3?=
 =?utf-8?B?QWErUFZWQ005NUVaK2JHcGhUYmZTYi9KN0M3M0sxS3M4dGlaYmt3bFFhRHlq?=
 =?utf-8?B?Vm1IRm5uVmZoSUZLd3FDbmRaR0tHV0hHOUM3K2JZeXZYSFlmcW5RU3IyRkZq?=
 =?utf-8?B?aDFCWjVUZk51Q0hGaFFESXNlMU5UcEJPMHhEWDBXWkVvRkwyV21UU0F5dkJR?=
 =?utf-8?B?MS9oc0RmN0NCakYxRDEvR3BjZXFUNG1zcEdiMHlwbC9tdDFneDRrMUlrNEF0?=
 =?utf-8?B?SmhiYlFtRTlRRS85MFNRUTZpdHVCaStwYVphKzZHQVY0WWVYRkFiWVJMaHow?=
 =?utf-8?B?UkV1NDRORHNBQ0lIbzFEeDVOdkhMMkx5R3hScVlTaTgxQkhYVG05Mk9aWUNE?=
 =?utf-8?B?MGVlandKY2l0ZEtnMnBULytCZkJNWWp0ZEY2V1ZKM2krVGxBN1ZYcDlkcWp1?=
 =?utf-8?B?dTdTeXM5SHNWamdWMG5vWWhudjdUSm5xZXNDTEZpL2JtZ1dJWnV3TStKWUZS?=
 =?utf-8?B?L1AwTmpsUUFyWkpzTXJpNEVNb3Vaa0MybDJJcHM4dkZNTmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFVHOWlweU54eWJ3S1ZGekNXSFhUSk5VZDRmdUVxOFZoRE1ibkw2UzVpeWdH?=
 =?utf-8?B?YTR3UkMySmJRdWpHM3VtVlJxR29GSjJTZjFGTUJRQ2pSTm9lT1MyYWx2MzY2?=
 =?utf-8?B?M1cxcmdyVDVyUm1TbHRUdy9xY25MNVlRZVlZK0VrZ1JBMUVsMFh2ak9pTlBn?=
 =?utf-8?B?MDRyODdmSDNGdDNrYi9PUTJUUEFaQTV2VGdwMmV1ZDJOaDNua2hEU2hEV2Q0?=
 =?utf-8?B?c2RNZnpBckt3dlUrM2ZROUFzeDBSQ1pycnVmRlBESW5ETHExbU1MOFhmM3Vy?=
 =?utf-8?B?enozaWhBWThXL3UrNWN3dWU0ZXVKb2prSmdZODc0eHpoSkhicjYzaTFtVkNx?=
 =?utf-8?B?WkRJTFJoUUlxOUpkempsblkrb1ZJTnhHWUZ2TXhudGY0RUo4R2VranNDeDFR?=
 =?utf-8?B?SURVSDVUT2hjYkZrdUpROW44RVZMRFhOL1JiMWZ6dlp0c1NmZC82bHZtdC9Z?=
 =?utf-8?B?OWY1Sk04dlRKLzdrWUJ6R3hLRGMxeDJpOHNWRmRMTlFTWThFL3NSZkxsVDJT?=
 =?utf-8?B?Q1NKV29UOXhvaUp0YWR1OTRlNEVQdnN1SnpZZ29aN3pQbzNuWk1xSHQ0Nlgr?=
 =?utf-8?B?aWN0M3c1b0RHYjFmMVFtdnB1aXFvTXFsaWFiVnkwQktLRjJUYzk3S2wxT0pK?=
 =?utf-8?B?djl0SGVibHl4ZUpsTFMveklOaWhLenJlYk9mYkdKWmxnTDNEZVUzS2g2LzVL?=
 =?utf-8?B?Y0RwNzVvUGo2VnFyL2VYRVJNcjhQT05GU2ZEUCt4OHZhd0R3NGhDam00TUYr?=
 =?utf-8?B?dWE1R2JuNE9sZDdteWsvOU81NTBEb3ZwTUVMRCtWTm44VFpET0o5VHJFVUFN?=
 =?utf-8?B?QnE1SWVxa015RTRZMU8vK1lRS012SzNFQjd3Q0MzdkgvT3pGSXltMUJ6SFBi?=
 =?utf-8?B?V08wZWNyd2MvSEx4OE53UWZDc2kvdC81ekZEaEVPWG1TUkQ2c1V2a2FoVnVP?=
 =?utf-8?B?NS9uMzMyWVJaQ2x6UjlTVkRxZzlpejRlNEtuV1ZZcW8vaUQ0aDhOdmNEQ3Qx?=
 =?utf-8?B?NGdNN0tPa1F0RUtKZlpucXlxdGhjV1kzSW5CakVoWlpKVFdhRTNsUXNoV1NH?=
 =?utf-8?B?UUxVSEhLazRQOHRTU01XUm5La2FXaEtpWkd3TnNzZTVUK1d1ZmpsNnRrWGVV?=
 =?utf-8?B?RHpGdjRlRkF1SStVblRoenNuL01uMmpTQTNMaE9QckNpN3htZUVKY0EyNENj?=
 =?utf-8?B?SW9uamM5enBDUlJLVDZ1aFlyc3JUMXVFd2lxWHM0R1dpdi9OcG91UGxCSzBu?=
 =?utf-8?B?TDJ1UHZESkRKNU5hOHRMK0lZQ2ttUzlZbC9PaFlDTWFjWHQwMDFSaW52NlZW?=
 =?utf-8?B?UndJdVJ5cGlBZllPSndkeVlhZUR0K1FYYnlXTkZHejNXeFJsM09VUVp4eFh1?=
 =?utf-8?B?OUI0UXhxY2FieWYxY3BFWmRBVFRHdjJvZXV0ZzNJNmsrQUswM1NvckwzK0Va?=
 =?utf-8?B?dDlHaWZ6WHVqUVJ4VEplYTJjcWJhdWpxUFdpOHlqQ1ZRUWhMMmh5VnBxMFVh?=
 =?utf-8?B?ZjdBNDNlSVdCVlJoWjFpd1ZpSlNQTHY1NnJiVEhQdjNZT2ZXZ1E3a00vK1Ri?=
 =?utf-8?B?ZHNBNGVCSFZkT1h0dWVvaG1yb0ozVjRJak5salJGb1ZsQ2pwQlVrY3NRQVI5?=
 =?utf-8?B?dzF0OXpTTWdoVVVGem1MZFVPNTVRVEZrU2ltM0l4NjV0cEU4djBCOHhkd0pS?=
 =?utf-8?B?TTFSTHNlKzZwc0FiQ3I0UHk5N0xqSVl5TmptU2lVTEoyWlYzQUJQSWRVWHNo?=
 =?utf-8?B?K09XcXBKLytQZGFkb050VnV5QkdWTUlNek4xcEpobnZkSUlMajVJTTEwakcw?=
 =?utf-8?B?Q3VHRWFib2ZPMnpJeGxZVHk4QjVNRGx5NGxzek9rc2J3YjU3eU5VOGQ1bDgx?=
 =?utf-8?B?N1loLzlZRFFtZnY0V0VpZCt6WWpxSE13M2pmZG96UDNzUGd1VVFGcjJQeG9h?=
 =?utf-8?B?Vjd3NFdvVEhBbXYrZWxzdy9Xb3lQWlJINGRtdmVQSURrQWlHS1d5QkN1Nmc0?=
 =?utf-8?B?bGNPVzhSVlVKQWtmSDNRdDZTcjVyanVNamxPVWtkZnJkQUoyRmFUQ2pOdVJl?=
 =?utf-8?B?TlN6dnJOdTkxdVRlNDdzNlRxZzNFWDFZMTllL1dWSENnYlJKZkhKeW9wM1hl?=
 =?utf-8?B?cU52Q3NrZDhuemhsdFFIWXJQeWx5aTBnMzFGTFE4MitpTXNrUE16UzFXaUht?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6186FB18C251F4DA4C36CA405A92E40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec30361-7c2c-475c-4a67-08dcc76789b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 13:44:28.5303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEJmFPqE55dnzxznrXq9U7q5B7Hnr7V7N3A5+qOlH2rtE9VFXwgTAlddWQy48YFrPBhaqKS734BMs9nnnTOhLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7800
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_070443_400842_209967EC 
X-CRM114-Status: GOOD (  19.27  )
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

T24gVHVlLCAyMDI0LTA4LTI3IGF0IDExOjU1IC0wNDAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgT24gOC8yNS8yNCA4OjQ1IFBNLCBwZXRlci53YW5nQG1lZGlhdGVr
LmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBXYW5nIDxwZXRlci53YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiANCj4gPiBJbiBtY3EgbW9kZSBnZXJuZWFsIGNhc2UsIGNxIChoZWFkL3RhaWwpIHBv
aW50ZXIgaXMgc2FtZSBhcw0KPiANCj4gUGxlYXNlIGNhcGl0YWxpemUgIk1DUSIgYW5kIHBsZWFz
ZSBmaXggdGhlIHNwZWxsaW5nIG9mICJnZW5lcmFsIi4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMgYi9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQo+ID4g
aW5kZXggNGJjZDRlNWI2MmJkLi5kOWVmOGYwMjc5ZGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy91ZnMvY29yZS91ZnNoY2QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMN
Cj4gPiBAQCAtNjUxOSw2ICs2NTE5LDggQEAgc3RhdGljIGJvb2wgdWZzaGNkX2Fib3J0X2FsbChz
dHJ1Y3QgdWZzX2hiYQ0KPiAqaGJhKQ0KPiA+ICAgLyogQ29tcGxldGUgdGhlIHJlcXVlc3RzIHRo
YXQgYXJlIGNsZWFyZWQgYnkgcy93ICovDQo+ID4gICB1ZnNoY2RfY29tcGxldGVfcmVxdWVzdHMo
aGJhLCBmYWxzZSk7DQo+ID4gICANCj4gPiAraWYgKGlzX21jcV9lbmFibGVkKGhiYSkpDQo+ID4g
K3JldHVybiB0cnVlOw0KPiA+ICAgcmV0dXJuIHJldCAhPSAwOw0KPiA+ICAgfQ0KPiANCj4gUGxl
YXNlIGFkZCBhIGNvbW1lbnQgYWJvdmUgdGhlIG5ldyBpZi10ZXN0IHRoYXQgZXhwbGFpbnMgd2h5
IHRoYXQNCj4gY29kZQ0KPiBpcyBwcmVzZW50IG90aGVyd2lzZSBpdCB3aWxsIGJlIGhhcmQgdG8g
dW5kZXJzdGFuZCB3aHkgdGhhdCBzdGF0ZW1lbnQNCj4gaGFzIGJlZW4gaW50cm9kdWNlZC4NCj4g
DQo+IFRoYW5rcywNCj4gDQo+IEJhcnQuDQoNCkhpIEJhcnQsDQoNClNvcnJ5LCBJIG5lZWQgdG8g
YWJhbmRvbiB0aGlzIHBhdGNoIHNlcmllcyBiZWNhdXNlIEkndmUgZGlzY292ZXJlZCANCnRoZSBy
ZWFzb24gd2h5IHRoZSBhYm9ydGVkIGNvbW1hbmQgaGFzbid0IHJldHVybmVkLg0KQW5kIHRoaXMg
cGF0Y2ggOTNlNmMwZTE5ZDViICgic2NzaTogdWZzOiBjb3JlOiBDbGVhciBjbWQgaWYgYWJvcnQN
CnN1Y2NlZWRzIGluIE1DUSBtb2RlIikNCnNob3VsZCByZXZlcnRlZC4NCg0KSSB3aWxsIHN1Ym1p
dCBhbm90aGVyIHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlLg0KDQpUaGFua3MuDQpQZXRlcg0KDQo+
IA0K

