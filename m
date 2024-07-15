Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9343CC3DA45
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3/4a89PlWrw7QKpfuKsINvs4KG00ze3CBIUN1ovkJ8=; b=ZyUST66eQYwqJjSMwDvlrP5R3U
	cVm/pd5qZwc4L4Ms5OI16NSxuezwDPtcaxeWH0Uvs9KqWpVT2+Kw95/iwUl3LBfoPY81jnj8lSIhT
	kRmgM6tFBJnJU/sjAwFvd3o2lLYebaYJ/ZDooJC3RAz5DBwRJUq1Vpu7rd7hKMi+nK+L7Ro9D4pnR
	RqPJ8m5XyiYV1lubDWVt7O7xPozrGLfU8DuRuWq7cMHPPz9/q/PmrAQSoWjGBgBKtafekBP1knMsQ
	3eTUztBN2IaT/Syv6mMdt5thNd12Ix752F5KSsDrzakkFXrfVHOuqbE5Iaq4iCUVQVILKoYBHN/rJ
	WKYe++3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFD9-000000061zz-0koh;
	Mon, 15 Jul 2024 06:29:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFD6-000000061zL-1JHh
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 06:29:21 +0000
X-UUID: 8f4c640a427311ef955bff358274dad2-20240714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b3/4a89PlWrw7QKpfuKsINvs4KG00ze3CBIUN1ovkJ8=;
	b=Kc5XJkC5/2VwXKwJd+U+a8M78OzeI1K75yN16JBHVswJYG2MFL8nFSlGr6hqJoT33SB8KSOcEH61VpNFevFOhBQIaYyB+yYTAn7DnQDk7XMmaYToNBlNogLbWPXQUaEOB8Qyuz45eaP87Q1XLIcFiUIewIkQIz860ezhfZxcaYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:ef975e32-52ef-4c59-abdb-7ee1733c7844,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c172760d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8f4c640a427311ef955bff358274dad2-20240714
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1182305748; Sun, 14 Jul 2024 23:29:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 Jul 2024 14:29:14 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 Jul 2024 14:29:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9YuIHIoj0pFoSC4mkzdIDc30G9/IzomPJZb0GVM1LXjOrZiK6BGQ0NgHIG8V4OSClRHgDF3ODKlLvApmjOCSvUMCqpRLKoNecXVO66tWNUtZN76pwQAeSAvGndG4ANSQJpXvJzKe9me3y5ZP2+6dBw9iAhEWpj6T+ZTWhUm4bRFwfYTNfxJCcxn+e5SmXJA1snzAutZp997H5ozaFFNkJZ4A8ZfKKj537EV1KqYz7zPT2x8p7a57oup3NkTvEWVAH+v/A2cFiKCtEmPQHFH1FiNNCS/bHt0EaC7RUPQ8d7x4LJpgoZ6Yz8nbX0efzY/osqGFPqWnN8Cs8B7rUiLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3/4a89PlWrw7QKpfuKsINvs4KG00ze3CBIUN1ovkJ8=;
 b=HSNxSKZqZHALV6lIg8s+NIq6blKcysQ7BO1/QUpIrDLbcLZ/k2ZLNY4qfki+oFODvIpxpe8f54jRK8fQP/NhQ52yKevRA/s/KXNGrkzPwHuZ5U79HoFWHC2mQu+FYA6QsWP34jX9HSOQP4bLtwwDtdstBbEODPmt6/oMn7FJ4v5gTDklWKf0jMkqhz++WNXtpDmXfUk2fdYN8M2oF0a9Dh0/0q5ST/eui9MCEplJICodb4zV71gWxsISeainQKmsz5OKXnitBzNlNDzHQfFIs60+mnTqgdSX1WgE0KCCai6fqBH+gqREiJZz4Lb6h/wnd6uM794DH1gTv687j+9+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3/4a89PlWrw7QKpfuKsINvs4KG00ze3CBIUN1ovkJ8=;
 b=WzfPKKy5+nRj3K3g/3dV3FFRjG2NRuvVwEctlP6OPUepL+pMcXOunQSRUULozUTtNdd1oQLWmOade91yEGsEsefwgYzD8xsqQQTO2QyXu3DomWkh76hM3jxlYj5mW4U2XzV0/qf7SNXdmCLfYo2eh0ktSFS1FMx5p9ywZAf3tHU=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SI2PR03MB6757.apcprd03.prod.outlook.com (2603:1096:4:1ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 06:29:12 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 06:29:12 +0000
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
	wsd_upstream <wsd_upstream@mediatek.com>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
	"chu.stanley@gmail.com" <chu.stanley@gmail.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
	<Powen.Kao@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
Thread-Topic: [PATCH v1] ufs: core: fix deadlock when rtc update
Thread-Index: AQHa1EAILL2v5M5cn0eBJ19m5454I7HzWwGAgAP9GoA=
Date: Mon, 15 Jul 2024 06:29:12 +0000
Message-ID: <dc0713a6b3fc077cc6a49677aea156739e2ec351.camel@mediatek.com>
References: <20240712094355.21572-1-peter.wang@mediatek.com>
	 <d1d20f65-faa9-414f-b7fb-4b53794c0acb@acm.org>
In-Reply-To: <d1d20f65-faa9-414f-b7fb-4b53794c0acb@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SI2PR03MB6757:EE_
x-ms-office365-filtering-correlation-id: 14da45a1-dbb1-4aa3-2322-08dca49770de
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QjhLeWkxUmNIbDBZVS9rUG80dzZqMlNQT2F0T0dGTzBqSlRYQ2J3aTNVaXE3?=
 =?utf-8?B?aDFTVCtBWjA0RHM2OW51a203NHdYdFd3citsM01mSFB3RDQwS1ZvdUo0YjJv?=
 =?utf-8?B?QUpNaG9QTnQrQ0ZNYVJRSmdYaXBtUzVINVBpNUcyYUQ5akt2RU56OHM4S1Nv?=
 =?utf-8?B?bzl0b21xdVNQQ1FFaHZaMzNlSGdJcDFxeUJSTlBYanpOOUV6M3VjVWlxR2ow?=
 =?utf-8?B?YXNMajRtUmoyb2VSVTNnZ2l5cEplQ0htMkYxUFovYUNSRWVta253bU42aER1?=
 =?utf-8?B?ck16MXMxK0locE9jbXdiTS9EYVMvYjc2NHFhcDRUQlpWamJDNUZWZmNhRmdI?=
 =?utf-8?B?eXowbjI0YkdROS9nT2ZwSXpFK2txOGxWN1BpV1ErZS8yWnV4SFVtcDd2QS84?=
 =?utf-8?B?Vk1UK3dCRSs0L0pBOVZvSWZRb2VjdlVDdHFpaU5TQUZtR1c0eW5ka0NRWlpy?=
 =?utf-8?B?aSttbk9ZbHVuM3JndHpUeGNLRnZncGczMTU5LzhXMlVuRkhoU1E3WDdxeExj?=
 =?utf-8?B?VS9aeXpwZnN2aVhLd1o1aWdJbXBQVnhBUHZkNjkxRS9EeWREV1owVEFKaStx?=
 =?utf-8?B?K1NoT2J1dlJlMUdRK0VvWWhZRVV1VSs0M1BDZjNtZWg3cTMwdFVQL0p0OGtZ?=
 =?utf-8?B?d2lnVkRVcjJNTUt4QWd6YnUzNGIzeTdmOWF2bzlhSnZCc0lKTlVXS0tYbWpU?=
 =?utf-8?B?bGNQdXNIQVVWMHdha2k5TTB2OGFhSFJoSDU0Y2ZNNXEyRk1sYlFJaWVjcHln?=
 =?utf-8?B?cUxnaldUdmRUODkyeUVmNkpTYXV4TEFidEVVa1pnV2lOZWFWT3dUSUtLL2NQ?=
 =?utf-8?B?dlZNSDBBWDJVZ3d3NlpFS2lQMDdpa0dOM0xaTEV2MFROeVZERG5JcWZKRXVo?=
 =?utf-8?B?QmVrNVZadlA3NXJSalFLNERwRFNhVUtCUjV5alZWS0Nob05BSThhb2JoaFE2?=
 =?utf-8?B?ajc1R2loTVVmRjQzMC8zc0FqUlFacjhqdnJ3Rlhocm11RVJFM1hQdzhaTDhy?=
 =?utf-8?B?enJIYVY2V1IwaUJZU3YzVm81cElxOUJxVjlhMUpsbEdVSG9RVEp3NW5NSVJv?=
 =?utf-8?B?YzAzbFo2OFJwQUowaGpnM01YRTE3Y0UxZTgyL1JaVEtJb1l1OCtIZEtVSXZE?=
 =?utf-8?B?KzlaNUxSL1UwQ2FWZ0xRWm5JL0xpd25MMElPdzROYkRwQUhPcm5VMlhxYU5Y?=
 =?utf-8?B?MTN1MDFYN0RteXAzNkRrb003bWNicjRhTUEycHlHOWFYemFlZmpWVStGTHpR?=
 =?utf-8?B?QjZ6OXJxdi9RbW94WFNNNTJ6MlNhaUJWNWVDZnlPSjVPRzB4bFl5MzZmY0dP?=
 =?utf-8?B?ZVNQbkttam85OEdJL2tIdko2VTVHRGZud05BMFAyRGhRclRZU1lYaURsQWFC?=
 =?utf-8?B?OVNDVGxxKzQxc3lmVXNTZmJWQXM2UkFCNFhHQmZ3dFpKK1FpdmtBTUpSK3Ru?=
 =?utf-8?B?Ty9zcjM2b0YrYnRJUEVkSlF3cnlNNTlRVTF4VTM3OGR2WHBkSHF1K3hrc3JJ?=
 =?utf-8?B?akRmRXpMZ2FCQkp5b2FxcHlIMG1RT0JqZzZPcXh0SmpleU1zcmtoMlJPcC9O?=
 =?utf-8?B?Uk1HeTRkdXIxQjVYS08wRkNmczlmMmJSeDFZcmFMb3VWbVJyb3gzTm9Uc2ZR?=
 =?utf-8?B?dDBGek05RGVkMjluYTBOSzJ4MmZlRTR2bDZxY3pMSzdOQ08rUGdjc0ZLWEN2?=
 =?utf-8?B?VmtTVGlEbVJWS0dPbGhsZzFNMkorSFpQSThqdk82d0VUdHFFMS9xNnpiTWR3?=
 =?utf-8?B?VTZLQ2M4dmNEVDdXMEVpbjRhTzkwVDN4TzIvWThWWVkxa1FFVUFXcmxtNUVD?=
 =?utf-8?B?clVoSlRWLzYweitHRCsrZDhJRURjVm56ZWdvNlVUbzFEWVpvcFRhT25PSm1v?=
 =?utf-8?B?OVZ1bzh2bUJNaUcxejlhRDA3bEw5UkNxTzNrems3K3ZTY1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFZYOVNtQ3k0eUh2cThtRS9VeE92ZU1SOUs4ejZOSWtqa2tJM1VIUzFvU3Rz?=
 =?utf-8?B?TGpva0UvQUJuQWowTzdZWkw4UC9LMk5OWTVyZ21HaGVSSWpGQW9QZDVkeWUx?=
 =?utf-8?B?VTIzdklMQ0I1RmVwV3JjSTNBOHIxTExGVEpwWTRCQVlYRTBGRU1nQWkyWnhz?=
 =?utf-8?B?OEMxV3YwNXZNby9UM2RBNzREd0ZUQnl1TERQUkd3aXQyeWhCenlNbTQyR0RH?=
 =?utf-8?B?aGJnb3F6eUFlOXE4emxhMnU1OTN3NHM1Y2xsdWxlQ25TdmpRSCtRMHd6OVhU?=
 =?utf-8?B?ZlRJUEVybEQxY1Z4RmQxb1MvVzB4OHJhYkFpS0g3VGFOUzAzU0Z1bWNTUVQv?=
 =?utf-8?B?MnE1RUMraDgrMWF5U3FRSitBbTN0T3FPdlZFeTV4ek9EWUZBbzd5U3lxWFlt?=
 =?utf-8?B?SDIzcUJCTkEzTTFNa1VRazlzZEFOUVc0UlByZ2h2amJ2elNsUnVCRVA1RTJD?=
 =?utf-8?B?RlRyUTFtRU9lTGFPdGhScGVza3RzTE4yREl5Zk1pRUZreWtKUnd3SFhYNnVK?=
 =?utf-8?B?bEh3VFdWWGVyM2ZsNzJ1SitqRVEvRWZKVXhWZFRwdyt3bVhTa2xIVTl2dGx1?=
 =?utf-8?B?ZkZCNGJxWCtDd1NYRHV1YTNlbnZSUWtTUkIxT2E4aklyZ2FWOG05SWhiaEVP?=
 =?utf-8?B?TFZhdmhTNVRrYUJtZXk5eUo1Y0NtZFd4UVFrSERvZ1FNS3Z2TkRML01qZ0dU?=
 =?utf-8?B?cTh0VG5SY1NCSEI5VldQUTQvT2hkT1NNSzBSNVN5aEVRTXZQSlFXazVnWEpa?=
 =?utf-8?B?STBreWNiaDBBWG96T29SWExJbEMrTUZ0bEpZZ1hqMFRma2JiQW1zeFp2Y1Bj?=
 =?utf-8?B?UkFHWkhJMjBpTVliZnM0STdtTm5hbkdnR21TWEhxbTlnZVVEUUVBSDEzdTA2?=
 =?utf-8?B?ZDlzazJIclprUmkwK1VoaEdERG9OamJ6ZlhFMkl3dUlmL1dpNjQ1cFo4dFFW?=
 =?utf-8?B?eGxnMEhGanVWOUxKYmJWS2REQjh4WU14ditxcXNUam1Lb0d4ZzR4WjQ5a3pv?=
 =?utf-8?B?SVdkclVpWXRQanhUa3UrS2o5cFVVTGZDWTZ4QTlkREpWNlo2UlVyM05ZdEVP?=
 =?utf-8?B?UWx0RWRTTE9FcEhiRzZGYXkya25VcVlCVDRnQUJTSFlCTmRKRHBwZmxtUUNZ?=
 =?utf-8?B?bjhEU3NudGhTOTJKTlVDSmYzVGczN0xEL2lSOXNsKzRMTmh1dzUrUTVrVGJu?=
 =?utf-8?B?eE9od3RLbWowNkM1U0c2TXYxaEx4U083OWgzUjdMMVRhWnpJZlFyRm1KdnBy?=
 =?utf-8?B?WkVZOEJmR2hLZHQ1ck51NVZGNjg4RWpBNm1sMUl3bHRQNktKM3NWUm53c0dS?=
 =?utf-8?B?eU9acy84M3VtbHB6YUtONzZya0VBeXhqTVVSZ1MyZlJJZnoxZ0MvZkFCcDlS?=
 =?utf-8?B?S0I0SUhMUHlNcGkvQ0hMSzNNTTNRcFErQ043dXZzMzNkRVVsM0VMYnZLSXp1?=
 =?utf-8?B?Z0FMRGlzaE9vb0dYY1o2Sm9kZXBrWTlmcHVRQVErWWUyMHZFdEg3R3NJODVl?=
 =?utf-8?B?OUQyeHhtdDY1LzdPSUJhaDBwa25HbHdEcm5DV1FVVVI2eW9Hci8vdGQ1amd1?=
 =?utf-8?B?N2d3d1FkVldFanlGZDBRZkVzQS9iUERyYTlPQUhTQllJUCtjYWhyckRWajFq?=
 =?utf-8?B?VmxtYkRVWmhIZzFWYWgwVW0yZ0NsUWhnOGt4cS9ISDhNeTBaTFpENWFZc2ZW?=
 =?utf-8?B?b1hDaFNTL1RaRFBaQ2t2YkxoS3ZmMXoyWXRoK2oyYkxKZk9NeXN3MEZJeEho?=
 =?utf-8?B?Yjk0VStkSUFDWmVwUmJDT3JKU3VVLzlWVDR1M0VMeVVYODV5TnBMTWFOaFRC?=
 =?utf-8?B?QzhFYnYwZXNIeFJueXJkTVI0aWgxbENOaEFNVXRXUVlNazZXOWozOFAxV1hw?=
 =?utf-8?B?UFREMldjZXVockI4dTFGNk90OTZZVCtlZ256c1Y0b3BKSWtYeDZlb1kxZzkv?=
 =?utf-8?B?R2YzblBVRE5WK3VMUEF6QS9lekM5bmd4TFJkcGw4aDY0aWJtS3BqbUk3TWZv?=
 =?utf-8?B?K2xHZ3hYWk4zMHNKbUVSMFZOTVA4YmxnQWE5SzVUZjRlNHJOckV5NVdmZWxv?=
 =?utf-8?B?czBvbUFRWlB2K1RlUEdkdVdpZHVtVmI4bHplTWlvMkxKZ3ZTY0xoNHNGc1ND?=
 =?utf-8?B?SGk0Sm9lRk0xeHgyK2hUdEtoQWtDOXBTQ0hiU0xWZWNjZU5JSWJzNlRJMHJi?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8601E0942076A04989FC9399619416C1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14da45a1-dbb1-4aa3-2322-08dca49770de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 06:29:12.0191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92yflboSm+gNV0NrlmZtLeZ9/SE6+F3E9hIevFQbN4y+Sm7qF1v9aLmRpb/FDbANzZEprqISnO4h+IfE7rHRRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6757
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_232920_390375_4BEEC18E 
X-CRM114-Status: GOOD (  18.87  )
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

T24gRnJpLCAyMDI0LTA3LTEyIGF0IDEwOjM0IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgT24gNy8xMi8yNCAyOjQzIEFNLCBwZXRlci53YW5nQG1lZGlhdGVr
LmNvbSB3cm90ZToNCj4gPiBUaHJlZSBoYXZlIGRlYWRsb2NrIHdoZW4gcnVudGltZSBzdXNwZW5k
IHdhaXQgZmx1c2ggcnRjIHdvcmssDQo+ID4gYW5kIHJ0YyB3b3JrIGNhbGwgdWZzaGNkX3JwbV9w
dXRfc3luYyB0byB3YWl0IHJ1bnRpbWUgcmVzdW1lLg0KPiANCj4gIlRocmVlIGhhdmUiPyBUaGUg
YWJvdmUgZGVzY3JpcHRpb24gaXMgdmVyeSBoYXJkIHRvIHVuZGVyc3RhbmQuDQo+IFBsZWFzZQ0K
PiBpbXByb3ZlIGl0Lg0KDQpIaSBCYXJ0LA0KDQpTb3JyeSwgd2lsbCBpbXByb3ZlIHRoZSBkZXNj
cmlwdGlvbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gLSAvKiBVcGRhdGUgUlRDIG9ubHkgd2hl
biB0aGVyZSBhcmUgbm8gcmVxdWVzdHMgaW4gcHJvZ3Jlc3MgYW5kDQo+IFVGU0hDSSBpcyBvcGVy
YXRpb25hbCAqLw0KPiA+IC1pZiAoIXVmc2hjZF9pc191ZnNfZGV2X2J1c3koaGJhKSAmJiBoYmEt
PnVmc2hjZF9zdGF0ZSA9PQ0KPiBVRlNIQ0RfU1RBVEVfT1BFUkFUSU9OQUwpDQo+ID4gKyAvKg0K
PiA+ICsgICogVXBkYXRlIFJUQyBvbmx5IHdoZW4NCj4gPiArICAqIDEuIHRoZXJlIGFyZSBubyBy
ZXF1ZXN0cyBpbiBwcm9ncmVzcw0KPiA+ICsgICogMi4gVUZTSENJIGlzIG9wZXJhdGlvbmFsDQo+
ID4gKyAgKiAzLiBwbSBvcGVyYXRpb24gaXMgbm90IGluIHByb2dyZXNzDQo+ID4gKyAgKi8NCj4g
PiAraWYgKCF1ZnNoY2RfaXNfdWZzX2Rldl9idXN5KGhiYSkgJiYNCj4gPiArICAgIGhiYS0+dWZz
aGNkX3N0YXRlID09IFVGU0hDRF9TVEFURV9PUEVSQVRJT05BTCAmJg0KPiA+ICsgICAgIWhiYS0+
cG1fb3BfaW5fcHJvZ3Jlc3MpDQo+ID4gICB1ZnNoY2RfdXBkYXRlX3J0YyhoYmEpOw0KPiA+ICAg
DQo+ID4gICBpZiAodWZzaGNkX2lzX3Vmc19kZXZfYWN0aXZlKGhiYSkgJiYgaGJhLQ0KPiA+ZGV2
X2luZm8ucnRjX3VwZGF0ZV9wZXJpb2QpDQo+IA0KPiBUaGUgYWJvdmUgc2VlbXMgcmFjeSB0byBt
ZS4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgbWVjaGFuaXNtIHRoYXQNCj4gcHJldmVudHMg
dGhhdCBoYmEtPnBtX29wX2luX3Byb2dyZXNzIGlzIHNldCBhZnRlciBpdCBoYXMgYmVlbiBjaGVj
a2VkDQo+IGFuZCBiZWZvcmUgdWZzaGNkX3VwZGF0ZV9ydGMoKSBpcyBjYWxsZWQuIEhhcyBpdCBi
ZWVuIGNvbnNpZGVyZWQgdG8NCj4gYWRkDQo+IGFuIHVmc2hjZF9ycG1fZ2V0X3N5bmNfbm93YWl0
KCkgY2FsbCBiZWZvcmUgdGhlIGhiYS0NCj4gPnBtX29wX2luX3Byb2dyZXNzDQo+IGNoZWNrIGFu
ZCBhIHVmc2hjZF9ycG1fcHV0X3N5bmMoKSBjYWxsIGFmdGVyIHRoZSB1ZnNoY2RfdXBkYXRlX3J0
YygpDQo+IGNhbGw/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBCYXJ0Lg0KDQpZZXMsIGNoZWNrIHBt
X29wX2luX3Byb2dyZXNzIHN0aWxsIGNhbm5vdCBndWFyYW50ZWUgdGhlIGFic2VuY2Ugb2YNCnJh
Y2UgDQpjb25kaXRpb25zLiBCdXQgdXNlIHVmc2hjZF9ycG1fZ2V0X3N5bmNfbm93YWl0IG1pZ2h0
IGJlIGEgYml0DQpjb21wbGljYXRlZC4NCkhvdyBhYm91dCB1c2UgdWZzaGNkX3JwbV9nZXRfaWZf
YWN0aXZlPyBJIHdpbGwgdXBkYXRlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLg0KUGV0ZXINCg0K
DQo=

