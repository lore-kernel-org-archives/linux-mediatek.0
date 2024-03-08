Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59411C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rcOZVe9FSffHDj0Oh0v56sY8/5OpAzm7K4YgnaiVoU=; b=4VZJ6yEJvySg0e55o8yzAwVrCM
	froA4jfr67kmkSQvXAxiw+PVr1Hp4LZyYDxhN9HfQTa5f7Kb5gI3RAZS06/r4gTUS4AkNxXSJMnYD
	e2NHEQCEN8R7A4x9lhIsEwHShpU9hx601lYwUABOfz+NziIRL044ZmTRbg1Ullgkesxi6vIwb9pm/
	C8GSsCur73id8tz/EHaB9TxdUQaCW9OG8yhlAwkLT1kqAm3Ibacakncr3nS3F3oYQ3Yxw/aaoNLnA
	jzryu59+m4QTJWEvtL0bn/voc7VE874l/6wUbW7qtwjQmZSMzU4/jW2aKIumCvnh83cwXEmm9Z9IH
	i4evNd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVyG-00000008R3J-3NVA;
	Fri, 08 Mar 2024 08:52:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVy5-00000008QwM-1Lf8
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 08:52:50 +0000
X-UUID: 3780ad6cdd2911eea8a22560583bddef-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+rcOZVe9FSffHDj0Oh0v56sY8/5OpAzm7K4YgnaiVoU=;
	b=jvMrytX/2WRjv8lux3kMKLA2MXVzyq9eGHTzRnBkLlviVOFd6zFsHGZZdOxJLRlLOT4GyTF9ZD+RFge9jFSEXWvs36rJGD4OhKuw8t6c2ob13tPb9wGNfIWpkwJt3gPZX9o7To8K/2FeSGRJb6BeH4AJhJIWVZZHaM7Ab6ruEmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:69472a0f-24b9-4e03-b833-a9708a711328,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:d647c584-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3780ad6cdd2911eea8a22560583bddef-20240308
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 667545980; Fri, 08 Mar 2024 01:52:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 16:52:22 +0800
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 16:52:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndF8Cxfj79IBTAvsejQuFLpuSYb+hTV20R1H5puPJ1v9iCtYjdKOWBdCW1A+r4f+2ES5Dl1H/K7qgAWYnZbfco0BXXp0Fi9+p/IlimyBfrDpm0Tm/EMluuNNrIwN2J/MCXoD4UbuTIoZAKJrlkcBQccCJRN5DhABWVVuRVsc/ZTJ4Jf83rYwH2ETKW4at9ovdF0diCmqsKAKmqAudZSSiC7NjL1bi4TVssDHIlBNQH7ZKhKgzA3/MgJ/LCSh1EeJRD8ep//LiXvL4gRxO39IDOolC9Kt7wvEdvLQ69HUhnEf2we7l3jK2fYOQCL95EDMh3o8FFPRfCm9hZepRRA2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rcOZVe9FSffHDj0Oh0v56sY8/5OpAzm7K4YgnaiVoU=;
 b=OGqIRXnofcrvEp0XvcX13IMtGJmnirWNP9rQVryKkHfYKsE0UdvfoBVI7u3HjY8LM1SuduBBWCeYd+ijTT6lxGSHoUJCupRcX2kuwkkHnFwgTl8QGZwusmQzQ7IAai8Ns2CKsLe8rgzOiN4tv3TsMx3IV4kD3gl1sVXWcz3SUwoiYyK4YAdVjE8s1Wjmjjk4QdCLyt/O0ETBdPONlSwQyhxci8yKva2Lf4/x+LcGllX1vOyW2Oa+634cKKFY1jCePNmc2scwyWzUXn0Ew9f7Lw/JKNr1my7cWClfq0wdwBJfmn+dCvYsjUByOdCZUr+TWao9UZ09LLlfe7CNuNAk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rcOZVe9FSffHDj0Oh0v56sY8/5OpAzm7K4YgnaiVoU=;
 b=D09Og1rJ+iMAPC4CG29RHygYKaJDdCtnI/ACSkKW+QnQfUJQx3lhydZ2ZHaXpQELbNTti1kI8UyKSLK/ih8eOzo7ESTvhTi8c44TmfzoPmw7uZleL8H+Ean48t4a2Xz+qwJsYF3panlGiy0HMicIbX2W8c8F2QTv7liaI+YVo8E=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SI4PR03MB9135.apcprd03.prod.outlook.com (2603:1096:4:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Fri, 8 Mar
 2024 08:52:20 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::9756:b4e8:ff47:55c4]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::9756:b4e8:ff47:55c4%3]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 08:52:20 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Avri.Altman@wdc.com" <Avri.Altman@wdc.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
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
Subject: Re: [PATCH v1 2/7] ufs: host: mediatek: tx skew fix
Thread-Topic: [PATCH v1 2/7] ufs: host: mediatek: tx skew fix
Thread-Index: AQHacSa71H3f95WFOkivuaC0dvWxw7EthoGAgAADDIA=
Date: Fri, 8 Mar 2024 08:52:20 +0000
Message-ID: <9285052a4c903ae02a21a6d46639b36531281b15.camel@mediatek.com>
References: <20240308070241.9163-1-peter.wang@mediatek.com>
	 <20240308070241.9163-3-peter.wang@mediatek.com>
	 <DM6PR04MB6575155021E474B0A5CF4642FC272@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6575155021E474B0A5CF4642FC272@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SI4PR03MB9135:EE_
x-ms-office365-filtering-correlation-id: 624f68c9-e36f-412f-6f90-08dc3f4d10a9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3FWLsYsdL4cIuTT2mP81TOY0oAvAvXASdWL6coYGtXa2HL78PFHIlKFZpw4zEmJkfADuuhaOYgEK+6USMMwgKWmJ4+5bhtcTn7110e6EWXJktnsXc2V8Bf/6RUoBtoTIfMZQ4D9pBQ5/RqmkupQxNYJKQ8wJ2zu+oyu+1XJ1w1uu/067esqcUUv0tVo4eQhXDFuCKMszh+PP27JIDicSs3KH+M/7WS/cRMldjxrffwdP3Kn2eYIFG0+9c29eenmadAthlzZedwfM4ZoA9J+E8Pp+vP/amtl6Prue89N02RPA6jcVPzX+6Rwym3+gB+Ft1eC75hloaQQRVUiQcamgf84BtJFMb90Wt0F6EY2np3konJWUdsqeMaoOIoWId4Xp0ZREqNtq05d2vmK2NlPY9Z2buYF1cd0YQrVTN5FQAr+qgIqvQB+WGysYhj8G4ouWUd/Z5vcnpjEg4/U2WqbebmnUs2uttiE0FetGrShSyL59hgLmi2e7vi/8khqn+XdYaHurBsGSlXlO2ggpeZ4xtZxzbYTuyHg6+jWG2SJo8dVdBrEAhEr3vm9xQ/GO0U8YJXd60szCbQoXrBmJNCwFATjPobd/mAQdxExo+ahugy3rqMLyxDeiXjDEzEWu8+cbJ+ImNr/KzJfu6KIWrQhK9meBaemLFs8QbeGOU7RgqM351u3Sr+zhI0jL1V4BiR0ytEqv2unNhwPP+cngpsjsskA19Q/soibFxQ5TYPR9epw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1Ura1Z4Vk5KNWQrQnNsYTVSTGFsMWo3V3JzT1BWU0NMZHhCdEJzdXpMVFl2?=
 =?utf-8?B?WEVFVU9nVGxaSjJQYm93R0JtcjFld0pxbzVKOFYrSktXVnpTVFhMSnk4c1Qv?=
 =?utf-8?B?UjhITm1TUjMyaWFiMko0Nk0wTWV3WHA4djdOb0diZzdrdzJTSHVvVno2OUM0?=
 =?utf-8?B?dHZTOFZiQXY4SWFzMHF2RDFZV3NQU3hpZmdQRnlPRzlLaFhZaWpnUXR0QkdP?=
 =?utf-8?B?c01oY2NlN2Y5NGVEWm5OSllteUs1V0F5SHNIemVHejZ2RVpzL04zakEwQjhX?=
 =?utf-8?B?UGQzWnJGcU02c29sTlYvaEtuOWtzY0VkakttWTB4TlR0TFZWRlh3S1NrV2xq?=
 =?utf-8?B?OHZCNS9iUGEvQkV0aXFXTDlnKytMZnNRMnIvS1JRdGZlY2NnVXRSYU8yZlAx?=
 =?utf-8?B?dlhjOE9TbTNqQ0oxYVdRLzdFcThJMlhwaEJ1RnlhdVNjc21jQnVCVXZreWMy?=
 =?utf-8?B?UFE0ZU1nWVJiWkxmUU5zMkJzNTB6QUZsQk5SYmczd0x0aUhnSkQ1UkV4N2dB?=
 =?utf-8?B?bWVIakxmSjVNdTZORHdEeVdrMnNBaWRYNlpWSXBnTjZ0OTlpNEl2WjZkeTdw?=
 =?utf-8?B?TG5JTm5zT3ArTVpVVm1pUDM3L2ZDV0J3TWo3SXUyeFozODZoUUpDenVkNER4?=
 =?utf-8?B?UW5WaXFlaUlMb0dIZVl6VHREMm9LSFBPUG9Ddnl5VGNCWmx2eFZVNndvZ29E?=
 =?utf-8?B?OG0vMEJQS2hicVN1MnNvTFNpblBXMW9ycmwzUU5IN0hGK3NDSlF3bGxrckZx?=
 =?utf-8?B?c0NDUWFKZG1WcHVqMGpYaGFrRnJIU0REbStZb2dkdlhtb2RqS2R4dGNraXBs?=
 =?utf-8?B?YWhLRlVQNjhIVjJhZTlYS2lBcHhicENzbi9JTE5OMFVnTytFcjNVYXlYRmFy?=
 =?utf-8?B?emFtOHJQb1R2R3dVdnhFdEFpVmtXdXBkUnZFN3ZKcnNXU1FHQ2VQcDVlMVV0?=
 =?utf-8?B?NEpxRW55Tm5PVFNqTVMvdEwvMmFmTjhDZjdWcUdBeGhJZStXbWJFRjB2YUFh?=
 =?utf-8?B?TDlZR0pBT29LNFQ4RmRhUHFpTzZtOUFyWG51dlpsRzFMamlJYWdUbkVqK3Y2?=
 =?utf-8?B?aVNsRGRoRFVxS24xNDNsRFU3bFg2T1JFSkgxUUxINTVnY2NZR0JLQkk5aXl6?=
 =?utf-8?B?cUN0TmpuSzNJSUEySkJHb1ZSZzI0VlowNW9abTlrUzI4OFBKd1RqZ2RmRkZy?=
 =?utf-8?B?azB6ejNRNk9BSE13M05oQ3o2OWhWdnBpcW5RUXJXVWdycEdIeWpUTUlTUU9M?=
 =?utf-8?B?SmdHOXArUUNGKzVJalpzODN1MVhaRDlEaW0wNWpFelFVN210c3NBTy8zM1ZQ?=
 =?utf-8?B?U29XMzNqWVRPemJLTUF6ZXMwS2hYc3FyeG1oamNJS2xwdFJ3RUtYOWozVGVB?=
 =?utf-8?B?cjBlaXdsWXl1Ym1ucFYwSXNtWEFSR0NweEdwVzJWZ2pTSmtteEFsQWZoczQy?=
 =?utf-8?B?NkQxQXNQYklJeXJQR1ZtSVIxcWxPS0NKNlhjRitLMkpIcHJocnBFaGY0TVVa?=
 =?utf-8?B?RUl6alEvUFFhUmRHZWQrZG9jZld2UklGdTZKbHQyaUlDeDFsM3B4TGI0Skgw?=
 =?utf-8?B?WEEvbnVXenA2bTdYSjRWa2UvUEpZRzhaNHpBSlpoMTRIc0FOSU0xQ2p3Q2Jk?=
 =?utf-8?B?Q0FXaEg1enZ5dkZUZTFORHQwM2gwWjUzOG5nM1pNT1k4a2U0b0V6a21rdy9F?=
 =?utf-8?B?WUpNNk5QY1hWOWxFeHVMeTRqczQvWWFZaTc4elFsVmJ2T2hzQTlNT3NlZUJH?=
 =?utf-8?B?d0FETDdZU1RLUTBnUVVObVdBOVBkZGFYUE5YSWFyRFVndnNGTmJpS0hWbHZ3?=
 =?utf-8?B?alBDT2U3NHJWS0FxeXVkMDFQWHh5WVlPMmJhOXhWUUhIdDhrRlFGSHB1NCs2?=
 =?utf-8?B?ZmppbkxEMHZiWHRvRm9HVmhxNy8yRFgxcUdvSGVDNGptNmtkZkI0clF4bmFC?=
 =?utf-8?B?ZllXM0YzRHUrRGpyYmVJNTM2SmRlODMzZ1NsYTI4eVU2YnBQR3B2SUg2dEtu?=
 =?utf-8?B?Y2V3UUp1ajJONm13SU9HVnorbU92bFU4Z3UyZFQ3TWRpSmhpU2ZUS1RmYytu?=
 =?utf-8?B?TVd3STBRamJYTTRyV0J5bDFqUGNZbERrSW9hczhPRzRudGdWV1dkVFJxeklp?=
 =?utf-8?B?bStBM0VaSmZLV0xPek9HV25xSHVwNzYzRXZrYmlYSlR2ODhLVC9JNG82djFo?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4C561B7CF045148A8C0E60BD0948901@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624f68c9-e36f-412f-6f90-08dc3f4d10a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 08:52:20.4050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPSYhGB9m4gKXeOhjy5ShUiVo3oI8jiI8ZAmTGhworxsi7iaHPX/DxdJa/QZ0Olw3fGnJWId6813rgo+FCbV1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9135
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_005241_527715_5CA3D39C 
X-CRM114-Status: GOOD (  10.62  )
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

T24gRnJpLCAyMDI0LTAzLTA4IGF0IDA4OjQxICswMDAwLCBBdnJpIEFsdG1hbiB3cm90ZToNCj4g
DQo+IElzIHRoaXMgYSBxdWlyayBmb3IgbWljcm9uPyBXaHkgbm90IGltcGxlbWVudGVkIGFzIGEg
cXVpcms/DQo+IEFuZCBnbyBmb3IgYWxsIHRoaXMgdHJvdWJsZSBzZXR0aW5nIGl0IGluIHRoZSBk
dCBldGMuDQo+IA0KPiBUaGFua3MsDQo+IEF2cmkNCj4gDQoNCkhpIEFydmksDQoNCkl0IGlzIG5v
dCBmb3IgbWljcm9uIG9ubHkuIE1heSBoYXZlIGFub3RoZXIgZGV2aWNlIG5lZWQgdGhpcyBwYXRj
aC4NCkJ1dCBjb3JyZW50bHkgd2Ugb25seSBmaW5kIG1pY3JvbiBkaXZjaWUgbmVlZCBob3N0IGNo
YW5nZSBUQUNUSVZBVEUNCnZhbHVlLiBBbmQgaXQgaXMgZGVwZW5kIG9uIGhvc3QgZGVzaWduLCBz
byB3ZSB1c2UgZHRzIHRvIGNoZWNrIGlmIGhvc3QNCm5lZWQgdGhpcyBwYXRjaCBmb3IgZGVkaWNh
dGVkIHVmcyBkZXZpY2UuDQoNCg0KVGhhbmtzLg0KUGV0ZXINCg==

