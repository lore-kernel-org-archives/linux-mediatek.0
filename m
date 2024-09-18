Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0580CCD1A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObW83nGHmjDv3Ju9sNKWd3YlzlVdDRMRf1cUdEl0Q+Q=; b=v6E4ch2VgmiEbRD1OXEWVF6dcc
	wd5ScQuVi2anDOTdq8M8cNG1AlThAwd5DaPUZZWBGWfou7PjLW/uPmjdQ+LfRKx9E5XShtLiZRUR3
	afIFtuNMxQA09BIjCpzDgxn56rcUS0p6VaX1wAS4/b18LSvYBlM+KDND9Z3s7PZGpUzQjoWMr2ULJ
	3H22F18/l+I5L6EnJiOeRt9eD5lL1sDuAq2W8i05ZIAD9p4OnA0wocjf6RFbgedikLlIX1Aaq223N
	nDK3ERdx1MuG/nghlhv++TzGUeeFaVoCfRMsV0v+OicuOr3GfNi6nJ35KPMc4ZGYhRGSUaYXb5zhA
	YT9ZRjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1squld-00000008KsJ-23bk;
	Wed, 18 Sep 2024 13:30:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1squla-00000008Kru-2z8f
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Sep 2024 13:30:48 +0000
X-UUID: 336f9cba75c211efba0aef63c0775dbf-20240918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ObW83nGHmjDv3Ju9sNKWd3YlzlVdDRMRf1cUdEl0Q+Q=;
	b=DzCm6qsxoFoA7fGtcRQYrELSX+hGcMVdRrkH5l52tpusC9Y2ZeTN9fxwUtCNjsqtVnLHogzRAPwZvHBXp3d3QVAyBNAy/dJYQqz8+YLw2Cj7ws05nSC0z8no4K22KTNA2Kzc4T0vb5S1seqDE/hMYbpFqIcx1b/Nb5OWk8d7eXk=;
X-CID-CACHE: Type:Local,Time:202409180630-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:df45df47-ec33-4aa5-9c17-94f238686dfa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:ea4063d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 336f9cba75c211efba0aef63c0775dbf-20240918
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 283955949; Wed, 18 Sep 2024 06:30:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 21:30:38 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Sep 2024 21:30:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLVD2SS/omgRPA5zPBmOEieS/UvG5W6SFQ+YDLOwSqbwCeXzpUDGo1i34CV7Y8DodxqCkTu7f0YgkxYpeWoX6pRlkXphRAsWdv4xMp5TMautSog4FS4jh4Cy3jZ73rlkp0qxNi0q0uX/o3hDgtkNXm2fNA2LyHdeb2D9ctwH4yfWaeafzRODTof1AUXOZZYxi3fD/CQ5y4u4Cp5x29P7ukpu60O7LiMHCkYQkSNxsN1QQNzmvkwnO1YRwmOrISnHrTT58eRMt7syqAdRyMyUh0/FJxd3/P3FSXXnTJ9q3e91pyYBsbbzICPWD35D82AzFn2qaWpzNytoDFgTrQzH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObW83nGHmjDv3Ju9sNKWd3YlzlVdDRMRf1cUdEl0Q+Q=;
 b=CCZZvKAY6tyZRR3r9dI4yMeAKvFiXUJjdajyNZwCVWwPueHzhEpHZ2Jd3/sK5q/e7RTnaz2laW7w6J1iMObTS4tnob+cy9rcZtub2ikmxfwLmf1QtBepFBzEjQ9zt6ufrkjKoTOJKZk9iRdZCnyHgYYLNZPQzejNqIFIEUaGDlVcGhtoEnq8FO5UEBprLALMKCA9E0I2lZDPpnkdBFkF4Hmbim6yRdmlTHU8pyDB2EnknP9KHSZDsMjMcYqcZotU176kTY1oW1fLV8rdUFrbGIHwYQoj6az7uY022jyBnY8WEa3aUUcNEfPap0ARVzD0M02Z6aPLhM9RkXKxUBdY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObW83nGHmjDv3Ju9sNKWd3YlzlVdDRMRf1cUdEl0Q+Q=;
 b=FuKOUvXUEsoDwnFQmT9SEtt0JBsK6bhB2wJeIi65jYJ/vFKyCIcXZ9eRYBeEACiRVRt15RCZhc5ydCaq1u1PPlXSsMSEscUFelgBP/Cq4WDnpI4UEswOd9EMvCG/yYdHAj3cSFrE4RMslMcrrYZ4kUD5DsSoZdYpF60sQZTEz7E=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB8490.apcprd03.prod.outlook.com (2603:1096:405:6c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 13:30:36 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 13:30:37 +0000
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
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?=
	<Ed.Tsai@mediatek.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
	<Powen.Kao@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>
Subject: Re: [PATCH v4 2/2] ufs: core: requeue aborted request
Thread-Topic: [PATCH v4 2/2] ufs: core: requeue aborted request
Thread-Index: AQHbA1N1RX6n4EeryE2vN/rAxATc77JRT7iAgADKYQCABWFmAIAGG70A
Date: Wed, 18 Sep 2024 13:30:37 +0000
Message-ID: <0fc1ef86ec25f413cc9a0d229417b5888d4237e1.camel@mediatek.com>
References: <20240910073035.25974-1-peter.wang@mediatek.com>
	 <20240910073035.25974-3-peter.wang@mediatek.com>
	 <e42abf07-ba6b-4301-8717-8d5b01d56640@acm.org>
	 <04e392c00986ac798e881dcd347ff5045cf61708.camel@mediatek.com>
	 <9ed20622-c228-499f-80d9-23760e79af1c@acm.org>
In-Reply-To: <9ed20622-c228-499f-80d9-23760e79af1c@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB8490:EE_
x-ms-office365-filtering-correlation-id: 7eeea258-9b71-4fcf-ffdd-08dcd7e614fc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHZpaU12NVFVVUEydlZ3OTlOdHIrSThWSGFoTXYxQ0tpRkl2M2xQMlY1UEY4?=
 =?utf-8?B?bmpNMXRzb2FJZUF2MXNmYjE4bjVKaU1IMXgvS3M3MkpIUGpLU0xyUjBnb3NP?=
 =?utf-8?B?M0Jubkx4S0Z0L2lFS2xhZWIvcGhDcTR1ZVRHcXpVZ2hoY3JaVUVOWk5rSDFC?=
 =?utf-8?B?OXVPZ2QzSVJBNjRtbnU2UEUxSU5sRE0vRktmSzRvSGRyKzJ5N1JDWE5qS1V4?=
 =?utf-8?B?Wk1ueTZDazlIYVpqMVRya0lDQy9VMm9IeDhGUGNzOHU1MHl2cEdBWFcvRXBm?=
 =?utf-8?B?eTVuLy9TQm5oN1JEKzZDYTd3RDBzQ0p2K04yV3k3WWc5Umw3ckYxVlluZzFG?=
 =?utf-8?B?aExpdzhDZ05NUy9tRGxMbDlXRTlMWisxTm9teFJPTWRUaTVyTERxbnZxMkph?=
 =?utf-8?B?aUlEZXRvdnZKamw0bkFWenhKTkpTbjV6RzhiVDdSNzBzVHp3V0pzakNxMkFh?=
 =?utf-8?B?QjVpc3Z1QU9XTzNlcnV1UnIwa0dkWlVsMDYrQ3hYOUo2eS9mSjd1bWtlNlhN?=
 =?utf-8?B?YjFWR2RTRU8ySTJ5RldQNHRaQWJlaHMxTThBUXF2eURXNzFxeWd4OFlKWllJ?=
 =?utf-8?B?TGQvRTlwU2tNOVlwWDFKZENHYTRDdGVha3ZweVgwZVc0dTNBTkRSeFdWbjhp?=
 =?utf-8?B?NHhHOCtyYWtKNm1qUTlBcG1vdkFvREZkZzZHWWEzMmkvOGJYeFVyRUg2TEE3?=
 =?utf-8?B?MDJXZjkrSU55cEZrdHhsL2VwV25JcTlnNzR6VCtKdTRBVlJHMFdYbHhvdDB4?=
 =?utf-8?B?R25wWTIxNEVLQys0blRIMFJRR2tIZW9YTzU3L0xqQ0R1R0ZwWXNoRjlvOHJV?=
 =?utf-8?B?K21DZ3ZrcHJ1SEFHMGRob0ErN0FNL3Noakc5U2lrcXlIUUlvSXRiYzdkZU8x?=
 =?utf-8?B?Zk5Wb25LeCtaZGdsRlpDWDFPNUZxZGtqb2c0d1VRV2h5aDVoV2NFWDlkVENW?=
 =?utf-8?B?QS9pSGVmR2dsWTJ1OVRIS01YV3dKaW9QdkEwSzVhQlRqOGFweTJ5WkRQUGJY?=
 =?utf-8?B?LzFTL0I5MWxJUHJLcnFISE5oODFVUmNSS2FoSis0dG9QYTl1ZFA5WFZpNlhE?=
 =?utf-8?B?Q2NUaHZHeEFYWGFpWk96ZzZaSVlXMGVjOFExUktrNGxKUjB6bG9rNjFTRUhX?=
 =?utf-8?B?UlF5UExNeFk5SE42eTlmZ2JJb2c0WW9uVWtxaHBaalJFUE01cWd0WUwwQUNM?=
 =?utf-8?B?R003Ym1mL25zYTdwNGhWRWZ1ekw0M3k2QmFMK2VFeHFDTmtUa3orQTdmc3R0?=
 =?utf-8?B?ZUM4MTY1eURoOENhcjY4NWYvb0RhSjdsbkpXRk5KRVdWUlZPZWpCWkRieEZG?=
 =?utf-8?B?WnpKSDNLVWFSWHYweUpWVWZlaWtMYkFjZjFqYURYcUJwNXVmR0k2aG5FSkd4?=
 =?utf-8?B?NWNNaDFqa1UyL0thL2RGZ201R0I5dlhJTnhibjl3T3R0ekRPMHBRTXIwakoy?=
 =?utf-8?B?RlFQQXNTSHNtbEwyNDBwU0tqZGFBQkVwcXdCS1JIcVdaSDJGNVZ2YTd4UXpm?=
 =?utf-8?B?SUVpN1ZZQXBnUHo4VE10dldnTmZaYXdTSis1a05qdlJTLzRvdFlPczE3NWhP?=
 =?utf-8?B?Tkk1Vk9MQjRNMVVIeERZZXdqNFNSeEFDOGdELzZRMHRTUUg3NjB6bFlqbk1B?=
 =?utf-8?B?OGFybjBwWEtia2ZmQ3llallzaHpUVmZXZW1VeTlBck9oSEhsTk84ZXJPK3or?=
 =?utf-8?B?cmw2TllyS0w4WEExUnM4enJncTdNQWdvQ2ZKbm5DeXZBWFBZbFNhVUhrNzd0?=
 =?utf-8?B?UVhYQm9KNENsRWptamJCajZtRndyaG5xaXNOMm5Ka20yZEEySS8rY3g2Q0V4?=
 =?utf-8?B?VElVNjRObnRwRTkzNWxodz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUVUbVBsdWdnK1laaURYWWJDeWswbmZ2WEsxV1dCNU9QQ0QxWVprU3hpWUsx?=
 =?utf-8?B?aVlhcmd6VURNdHZMb0Q2Nzg2aWhkSGtyV2hxRUJJWkVyZ0hvLzVvNXdkSU9J?=
 =?utf-8?B?VUExUkhUQ0tsRFErVmlvVWJHdWdESWJBL3RZK3ZGRTIreEZFMnBpUEhudzlv?=
 =?utf-8?B?cExwU0xobkFUQWM2WnNQMkVseFJZTk4xWjNHWDZERkFoRVRuNjExbnh1UWxx?=
 =?utf-8?B?OEwxZWZlUWdLNjJmTnJzOWNRdDJhbmxQSXNPYzlNd1g0SlBsS1JwZVJ5bjBG?=
 =?utf-8?B?U2R4M3dYL0xlMmdHVVpISmR1T0xOTEhBNFJNdWxxTmFBbzQ0RXJsY2NkWjJ6?=
 =?utf-8?B?V0ZwNFVsSWd1bnFFYVYvQ2I0eVVid3NhVFFIeEppOUEvRFNEbjBrOHgzMzZ6?=
 =?utf-8?B?cXdncy9ta29LMTJUWjk4Q2NLVGxRcTd5M014elpPTWx1bjNOS2FxajUyRGRq?=
 =?utf-8?B?NFFnSGMydDZScDEzRStCRmc5bHpwMm9NNkRFUExGcHZuaCtqWnNqVjRmeWln?=
 =?utf-8?B?WGdhYW9lQWJhQ3NaZktKeEJxMmZhcnhpOFd2bEM2bnNvSk8xajJrSGVwZVJq?=
 =?utf-8?B?b3Y5VTEwa1ZPYVBncGk0b2dVdFRJdkNKbU9wd3E1eG9IWFlLQ2FhdG56MzZ0?=
 =?utf-8?B?dDU0Q2lSUTZjcitmbGdJa2lYYlE4VzJTVW5PZk5LYlNxeGFJZzRqREhnbDhw?=
 =?utf-8?B?UlVXS2tubEFDTjJNd0hLc2dudGxsYXJoRmJ6TVpUYTEycGFmUDJUTlY1UVNM?=
 =?utf-8?B?am5QZ1o5K1NOSlZpeG9LYTNHQng0alltMTJSOUxzSjZVWGlWV05WNG9DY01i?=
 =?utf-8?B?bTk4WUYzUVB3ZFY5VjdNbmVDN3BONndCUjJzMTRyRlJjUVFyM0p4dERMc05y?=
 =?utf-8?B?emxnTjFDRUxGNllNemozSDV1Qjg3NXIwS2poTmJrSC9DMWV6c3kvcW1kTUhL?=
 =?utf-8?B?RFQ0eDcyQkFVSU5ZQlZVUXhrV0JHTkJPR0Y2dEplQlliNHBaTWhhQkhaRE13?=
 =?utf-8?B?Z0ZNQ1prQno2MXhCelp6eStKcnJKMVZUQVZ0c0RmZ25SWmpHS1E3eFM4Tm5E?=
 =?utf-8?B?bDFyZGNXWFZ2L2J2R01vc01VaE5vVTZoMXdaSUJkVWdub3hKUjF6MkM4dUUz?=
 =?utf-8?B?WW54YVo3WVJHd2RreVR6UmlRQ3pGT2tKanRKQVZKbThZOXJPaWRWWmZIWEIx?=
 =?utf-8?B?aUt1UDBwZnl5VElyQkNscDA4cFpjT0RMR2d4cUtOYmllQkFzd1ZCOHlrQVU2?=
 =?utf-8?B?REZvZnFGRjlvbFZqS1JKS3hqTUowSXM2endXKzBhMkpBUXFML3ovTVZzTXFr?=
 =?utf-8?B?Q0ZBellwektjSDBDVGROV0h1R2lncWFwaGtTem0xZk9pSGxJUlhBZjdEdVBP?=
 =?utf-8?B?eHoxRlJmclM5bG5OWG14Zk54TkdCVnh2RkdiM3NIbzJ4Um5UR2grK0hPcmVY?=
 =?utf-8?B?STF3VEIvZFQ3c29tVnlORy9TaHEvUWVGRE0xNjU1WGxpR1dzN1J4U3FNMWdN?=
 =?utf-8?B?YnpiSUhzMlJFTkRBTzJTb2U1V0RhN3NmRnVvRkt0bElBT2RxNHpqRDlrYkRT?=
 =?utf-8?B?MjJEY1J6ditMYUk1N0FJWThIS3lVeTRORW1wQnR4SFVkWWdJS3JUMzVYSE1y?=
 =?utf-8?B?VHh0dW04b0hYbHhIM3VxN0h6anZjS280RExuOEVRWkwvWWxoWTZxeW9lVjNh?=
 =?utf-8?B?aTYzbCt5L3NET3dtRjdGZWk4NmpCdndORk9JNDJCWFFtMGd5QkFZZENKTTEz?=
 =?utf-8?B?TWwvQ3JZTnFiUWdhdFZ6cXFTdDQ1dG16Y254clJkRDRJcEYrZVUrWVpQUXFY?=
 =?utf-8?B?MFZzZU9vWW85MnFWaTlsODlmK0dVZC9KTmJzTEl4U3pEc1AyZ1gvbEdGd1la?=
 =?utf-8?B?R05jcEpvRnpmMGhHTERLdC9XbGMyUkEzVnNCK24yZjVwSjFVR3JBYlRUcGxN?=
 =?utf-8?B?cit5NTd5OVl4L3NMMkhRSHlqTjR1ZFpVc0ZaVEFCdWZRVEpPL044ZW5Ub1hn?=
 =?utf-8?B?QlhkSktQWkJ0U085WDF0ZFhmajFQUDZlMUhnbDUrazc2K05jaFowOFNVL2U3?=
 =?utf-8?B?OTJqWnpueGdEK0JxWnl5Ni9lQ3ZPMEU1OGtRS2d0RU1raTFVYnVqWlJ6aUdF?=
 =?utf-8?B?RVZNY2VNUVlSQ2RvUS9iOHVCREV1WDUweU9vcU5WOXUvLzFqM3IvQjVPeWI3?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD158619F355E5419BFDFF2966305CE5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeea258-9b71-4fcf-ffdd-08dcd7e614fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 13:30:37.3712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMWtIhtsYv8UgS3fw7HCo0ze9Z/I+kIza2s38BYc849U1UbMPu18fPAQXmvhS39bVqNByaIKztPXe/uo//k/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8490
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.277300-8.000000
X-TMASE-MatchedRID: GBgFBUqwD4HUL3YCMmnG4qCGZWnaP2nJjLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2h6L+ZkJhXC75VvfCjIxlu5722hDqHosTZ10
	wKXUWXnLrUWEjTM9FIKO6ZRZSGwC3TdxlgyoTjkhCnGIuUMP0VS6GDroi1vrlBlt4RZwvTdWjsJ
	ubkXeTFH6NXjp8cvmKpS/wt6jzbhbMG1GHgLZ3o+YAh37ZsBDCfS0Ip2eEHnylPA9G9KhcvcWxr
	5jPZ4+TUEhWy9W70AHCttcwYNipXwKmARN5PTKc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.277300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 54BEBA03E947BBC133F2C9B9338A1720DF3011E2D3D846F6670F1E83010A22FA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_063046_784408_C4224055 
X-CRM114-Status: GOOD (  14.13  )
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

T24gU2F0LCAyMDI0LTA5LTE0IGF0IDA5OjEzIC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgT24gOS8xMC8yNCAxMTowMyBQTSwgUGV0ZXIgV2FuZyAo546L5L+h
5Y+LKSB3cm90ZToNCj4gPiBUaGlzIHN0YXRlbWVudCBpcyBub3QgcXVpdGUgYWNjdXJhdGUgYmVj
YXN1ZSBpbiBVRlNISUMyLjEsIFNEQiBtb2RlDQo+ID4gc3BlY2lmaWNhdGlvbiBhbHJlYWR5IGhh
dmUgT0NTOiBBQk9SVEVEICgweDYpIGRlZmluZS4NCj4gDQo+IEkgdGhpbmsgSSBmb3VuZCB3aHkg
dGhhdCBzdGF0dXMgY29kZSBpcyBkZWZpbmVkIGluIHRoZSBVRlNIQ0kgMi4xDQo+IHN0YW5kYXJk
LiBGcm9tIHRoZSBVRlMgMi4wIHN0YW5kYXJkOiAiVEFTSyBBQk9SVEVEIC0gVGhpcyBzdGF0dXMN
Cj4gc2hhbGwNCj4gYmUgcmV0dXJuZWQgd2hlbiBhIGNvbW1hbmQgaXMgYWJvcnRlZCBieSBhIGNv
bW1hbmQgb3IgdGFzayBtYW5hZ2VtZW50DQo+IGZ1bmN0aW9uIG9uIGFub3RoZXIgSV9UIG5leHVz
IGFuZCB0aGUgQ29udHJvbCBtb2RlIHBhZ2UgVEFTIGJpdCBpcw0KPiBzZXQNCj4gdG8gb25lLiBT
aW5jZSBpbiBVRlMgdGhlcmUgaXMgb25seSBvbmUgSV9UIG5leHVzIGFuZCBUQVMgYml0IGlzIHpl
cm8NCj4gVEFTSyBBQk9SVEVEIHN0YXR1cyBjb2RlcyB3aWxsIG5ldmVyIG9jY3VyLiINCj4gDQo+
IEJhcnQuDQo+IA0KDQoNCkhpIEJhcnQsDQoNCk9rYXksIEkgdGhpbmsgdGhpcyBpcyBhIHZlcnkg
Z29vZCByZWFzb24gdGhhdCBleHBsYWlucyANCndoeSBVRlNIQ0kyLjEgaGFzIGRlZmluZWQgT0NT
OiBBQk9SVEVELiBUaGFuayB5b3UgZm9yIHNoYXJpbmcgDQp0aGlzIGluZm9ybWF0aW9uLg0KDQpU
aGFua3MuDQpQZXRlcg0K

