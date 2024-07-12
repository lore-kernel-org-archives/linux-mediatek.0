Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E839C3DA45
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 01:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eicvsSjeoobP+xiwboSkmxq2kIAFPswGtaFZzEfti1Y=; b=2uaVnGjTJxkfiLJBxYnWC9mzR6
	XSuSggHsdgN5lgwgT7h4KJAGAPy6owBhvxMnDa/U/50OGlRtfsl/chYm6jWCGxNNI1xdLDtI7BQGZ
	sAwX1K9HSEhqeczUxTDE1K/BLXWxKbw20T07dLL+R5uuqXZqKFka2tw1glp8kxwbp7dSqng/43M1c
	dMRJKWEsAhv+UjlhfskQL6ESZ68NuB9KhLNt4kntU/qzbG6QeZkYL6RhxqifKob9V1FN3MQPp618j
	GdevneBDSZSH5UwVTiQlLv5QTpnWEhWEaZKyVTnVagrbOy2kQeaIWYsRCRa5IRIHJTklRd0wC8BLs
	8U6gm98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS5Gm-0000000G44D-3e4j;
	Fri, 12 Jul 2024 01:40:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS5GU-0000000G40D-3Mkp;
	Fri, 12 Jul 2024 01:40:04 +0000
X-UUID: a43a71803fef11ef955bff358274dad2-20240711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=eicvsSjeoobP+xiwboSkmxq2kIAFPswGtaFZzEfti1Y=;
	b=DNGkkQdmpqWly22fprIliv1Vm0XlU8IQTyXtCCX1xIjb7lJ+6935CSPBCDJgoutvfj/GPwm6hvlEkN+RcC9NKK6Ro5+30o0r+LuqY/KNx3iCtjvYV9y249imEHaPdhCicleusTYGk9Yr42AnGaO1ffb3Ojg+kEjc1VE5b9VhOz4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:cb8d38ad-b3de-4131-a846-7ac0a4a8aff3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:22d93ed5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a43a71803fef11ef955bff358274dad2-20240711
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345712413; Thu, 11 Jul 2024 18:39:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jul 2024 09:39:53 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jul 2024 09:39:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY2+YYgm05ugxNYSijedD9TI9FuYXV+B3rVzISzBrqmuih12/D3nmhGJYVgONUVTqjO6wVYUxx4CNjhf1SGoGi9vD7aNzum3bvac0p/mlgciwlneb+PrFWejLj60Ha/XRolL+T3wqnkDAxljSH0S9DQShnA3GVciPh0SwbKfmATALhG25EX4fA2Z7DGq9FfRtXidAf6ZPa29/JdDH0g+4XcGqkwKVr13KWnbusomOIuqgSL2vu5k0t8+Lp8ZYZzcTq2Z8jJWZgLPw9vQjV9vSMJ2h+5JA10lbC1ZPfwTIOiyFxbuhC0UgAhCbNfIfVUTC52I+08EQ11+aa8PiAd0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eicvsSjeoobP+xiwboSkmxq2kIAFPswGtaFZzEfti1Y=;
 b=c3cpmcmkaSAkLB4PewWFVDY2pjTsknaGPXwHJ6tj/fMpH/xgYQamx4Yolim74JbpbZCYn6cJNe8RsUwcmAOufhC5izL0xS79KR+cYtjNh7pkoocwlGKBbJcfglrwDza5kc3sRz4H52AWb/lwbTTt3cnApKe9YlufPnWyzQcAW0WwHfhPLTJQjoyB0+MYKBNp3fXFYWvxENSqOBLoS8RPTf7JqlO8Fm4k+j6cf7f6uIHEXzkS0mZ7AvcffRs1tz5TYAuLuFo/kD4BoUxoP4Vd2e2BztPdTmUksKRtgRsvy2IAbcJjWqLcnGUXfwLoYIAwNM/W0fou6nqakO0HJ6tRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eicvsSjeoobP+xiwboSkmxq2kIAFPswGtaFZzEfti1Y=;
 b=KO/d1RJpXnAiAC9/PEpCKOm/T36iryubntHY3SwrDnNswRutSvrnzCyHsnHNvTgz3OD+pJOf/gOA5zyXd4qS1EjfCSoyoxDyVn085ycvx0O+N+RkNHNXs8B+32RlazgaIrKlbADJp6hUaUlPk21R8bCZ6V6eWIpWSkzF9cJCeP4=
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com (2603:1096:400:465::7)
 by SEYPR03MB8532.apcprd03.prod.outlook.com (2603:1096:101:1fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Fri, 12 Jul
 2024 01:39:51 +0000
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::f95:7de7:753d:4b9]) by TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::f95:7de7:753d:4b9%6]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 01:39:51 +0000
From: =?utf-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>
To: "tj@kernel.org" <tj@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"boris@bur.io" <boris@bur.io>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "cgroups@vger.kernel.org"
	<cgroups@vger.kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>,
	=?utf-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Thread-Topic: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Thread-Index: AQHa0pBR30AINLT9pky6tv6t6Zyx7bHwh18AgABGsACAATg2gIAATVoA
Date: Fri, 12 Jul 2024 01:39:51 +0000
Message-ID: <70c37035f006de3a4fde895ceeee92826cd280e0.camel@mediatek.com>
References: <20240710061334.1888-1-boy.wu@mediatek.com>
	 <Zo8HTD2AD-b51q0C@slm.duckdns.org>
	 <6114fbad7bce9b15806bb9fee25a1075ecb53dd1.camel@mediatek.com>
	 <ZpBIfwThiVwstlXL@slm.duckdns.org>
In-Reply-To: <ZpBIfwThiVwstlXL@slm.duckdns.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7867:EE_|SEYPR03MB8532:EE_
x-ms-office365-filtering-correlation-id: cc518121-a923-42f0-9669-08dca21385c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OEtUR1hZaG92SURKci9vRWhrL2pFaTZaV09ZUU0zNUwyQm5wOWVFTk1IMkFm?=
 =?utf-8?B?Rzd1OG9MVzd2TTYySDdabFhQQWtYZldUQWZSNm9XcUM1NDR4RElWZ0hkSjdK?=
 =?utf-8?B?NVl2WE9Sa21xTytnRzVNWXN0OUtjb1FLcTRmeEVEVWY0TXVERHFtL2tBbmhK?=
 =?utf-8?B?VzkxZDJUbVdiSCtIUzFqUlFHRDlId09FUDB1dFZCNGxxOEMzRE82TllBVVdY?=
 =?utf-8?B?TDZnZDNtTzJmQ3RPcDhhdGtMWTNEdHlzSnhjNjBSdnF2bDZCYXRHQXQxd1dY?=
 =?utf-8?B?TzdTY29xb0sxWG1wSlNkRk9Bc2RTa0xFWk9ISy9TNWhvRE9VbHdYV24xZmZZ?=
 =?utf-8?B?OHI0b2ZUQ3dhYUJxMEpWMzUwQjJxeHFwcWhyQ1FEMTNBaGozMGJBYXBZeXlW?=
 =?utf-8?B?MFFvZGlCSzg4SGhTcWVwcnh1SkRZK2RLTEtERlpQVHp4QVhoM2hhWWpnbjZM?=
 =?utf-8?B?TUs5YkdkTENSTHAwcjVaSVg5cVNXRkt6a0R0N2E0bXNveXBFSTQ0bWEyY3A0?=
 =?utf-8?B?OHlHbjNIMUdaZjVEN1pSbkI1ek5iR3NTeTVsUFl3SVRVV3hCb1JLTnF2Yzkx?=
 =?utf-8?B?bzY0WUduZVhLS1pWWUE5eEFXdU5XTEhYaW0wL2xaWTJ5U1VyVk5tMWNpMWwy?=
 =?utf-8?B?ZEhhbllHL3hua2lSLzNhTngzS3pQRWpOYmxBVlJIWkZkK2hoN1lwaGVYcUxw?=
 =?utf-8?B?eEk3K2toeVQyS0lwNmk1dzNKcTBoU3BvVC90Y21IcEpTOVRZL05ESTVCSDlu?=
 =?utf-8?B?OVB5cEJ0T3ZPNGh1ek81blZIcm1rdEx6ODlNSTZJQ2RSTU9GYjRzS2VoVTFw?=
 =?utf-8?B?bzB6QWFjZEpFeHhRYWdIM0VPTDZ5T0ZoQUw0N2R5ZnR0RWhhOXZEQzRFN291?=
 =?utf-8?B?MXBIalo0dHpRUDJSY2kxWXhFRVpBc3Z2b2t0cnRHZW5LemJrTDRtZDlLYjRa?=
 =?utf-8?B?emJZUDhrbFRjTUhsRkQ4SFk5ZGF2RjVJQVh0ck1CaUhNZXJHV3loYVJFdldv?=
 =?utf-8?B?OU15b0ZZampaSUJXVEVyRks1VnFuWVZwZWp5Ym50bCtOc1dpTDRkZ2lYR2Nh?=
 =?utf-8?B?bUQwWnUwRHJZZkFjdVBJKzZMM1o0aURQS2U1Uk00cTF4aG9sZ0EzWEhkV3lY?=
 =?utf-8?B?M2dqc3JXSVVGb3FieXU1T3NaVk1KUFRtYVBUUXZtdDI5b0xVaW8wa0J5eEJp?=
 =?utf-8?B?ckdOTjJXcmxNV2dEbnMxMGJ5STNJUHlTRVY4REJVMUtMRDVHSXRKMVMvcVVo?=
 =?utf-8?B?UmtCdSt0MnBSS0hVa2QxYzBYVVJwRE85TS9VdFFiTDV5Q2hMQWFzRnB1cEdz?=
 =?utf-8?B?MW04cEJmTXpBeVdUM09FWG1nRmVTcGs1QTU2aTZIcGNPZlA3U1ovTjdXeVNS?=
 =?utf-8?B?c0NTdFMvZkNZOS93SWlGZERIRm8wOVpvK20wRzMrSkozTE1jL3o5aVk2ZUx1?=
 =?utf-8?B?bHFMbjYyUGw1dUF3RHRzTXdSeVFrRktncmNNSzhCdDIxSThKY05UNGJNZGFa?=
 =?utf-8?B?QmxQV2FpVU95Vy9KUVdxdUtyYXB5WnNIMGRmOHJZVWhaNjdpcHZPYUprL1d3?=
 =?utf-8?B?Q2pTOG9nNmVnU3pESWNaU1cyeVpVdmpoQVljWm5Qc0FwTksvbzF5V2NkUmZZ?=
 =?utf-8?B?YTl6ZW5KQnl2a0tET3ZsODB4WEE2NjFWYkxMeTZGbzE1Ry9PMGRpRFpqT0RT?=
 =?utf-8?B?ZmNBUnc2VXpVVXFEWlo4NDBkM2tybzdqdXRrbnpQNmlOb0lKSjBWZytmdUho?=
 =?utf-8?B?V2Nsd0NCWTY3V3lrMldSUzFvZ2k3YjYySk9iQkpuMGVFOXFxaStkOHFHZzRp?=
 =?utf-8?B?T0d6cmlrMnQ5Z09acUxhUU9KbjFaZVpXZCttU0JRZDJyckhMcU9vNHFNTFFr?=
 =?utf-8?B?N1FHaTdlM2h2aU1QV2krWG5iQm1Cakp0VWJwdXBqa3hMWHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7867.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dld6aUN3NXVLaGIvN3VQTC9EZVJnaWc3NUk2U1BiQmVHbStVTzdqYmlzQTVy?=
 =?utf-8?B?OFVzRlJkeW5EVDRQU3lKTmVHM3hpU09oeUNobTRqWTNoMkJJWEhLMm9pM2NG?=
 =?utf-8?B?aFZ4ZUhvOHZ3K3U4SjN2UDZSakg4VlZPd05tK1FKM0Nyb1FYUU9tOExlTnEy?=
 =?utf-8?B?aU44YUZacFBrYVFsemsrY3M0OGVOcUp0Q3VzN0xLNjIwZzVqTk9zSlNIMkl3?=
 =?utf-8?B?QmR1bFhKMGlMM3d5VGJ0VmFBSmh3SHlRNkozUFRDcjhLUDU0V09Ed3EvTENE?=
 =?utf-8?B?TnZMTk5pVlhLcXcwZU5BWGU2Nm44RVFyRk90S3NZMGYvSXlSSnJBdGdYTnhy?=
 =?utf-8?B?elM1MlZXVHhBZEN2SWFqT0d0K2hsUTY5YmVvc21JaHdQVlF6WWUwSms2dnp1?=
 =?utf-8?B?dmRxeFlKZUR5ajZPb3k3M016eGZXUHZxV3VKSGtFNnliVnc5SzdIUFdYQUNX?=
 =?utf-8?B?UlZjTjhqMEFJdURsUzhhdTVKdTNHV1FzWkJkRUNrc1hycmk2WEg3RUpvck5U?=
 =?utf-8?B?SjZRZUFjT2RtOEZsMXpCTS9YOWxNb2FvNWY3bFpPVEVPaTJSTFhTZSt2T1Rm?=
 =?utf-8?B?RHRzby96RlEvdiswTWxxckZENDI1Ynd3endoWDJ1S2RMT0t3K3NvSnBxZ3li?=
 =?utf-8?B?Y1k1SU9YNm1wcUlDUjFPOStVVmZGZlBHeFFmdlVWWGVEaWxoL2w2cEVjYWk0?=
 =?utf-8?B?WVluYXZhSG8xaXFkZ0JCYmdNUjhva09qYUV5RTM0Z0ZPanNBT1pMT0RrSzRv?=
 =?utf-8?B?RFdpNXFXSHhnZy85UWh0M2J1ZVVONnNqMTFURGsydEhFWXE5YW1tUTQxaDNM?=
 =?utf-8?B?cDlwZFRGUS9EQ1RqSFE0Zk1jWGwwODQyZU84bFYxQUVrVTNtOEtremJheDQ3?=
 =?utf-8?B?b3IvV0ZnMGM0VW9OT3VLdk9jNXRmTVpVdjJhMEFURFhKL3BQbDlrSGVqdFZF?=
 =?utf-8?B?ZUlDWGlRa3YyMml1VXUyZ0hETG5KREtFUGhrSGR0aDRFVU5TM2llNWlWNlBB?=
 =?utf-8?B?dWFrbVF5WndvSXBoZXM1aHVaKzlTdHIzUmdkM1dSNXIydFdSNDZreVJXR0Ns?=
 =?utf-8?B?UWVsb3EzSmRnRmc1REpZVCtEbkdUdlRKUXdUdXZOTk54eEQ1ZW1Ndk8wQ01X?=
 =?utf-8?B?UUw4S2VWcktoYksvK1RRTklNdFdvSjYwVGJlSVpQQmIxQi9GdkZ0VldKMjdy?=
 =?utf-8?B?Smx5bnNlQXg5SjdmM2dQS0FSQ01Sdk5YL29wRWFXZ3ZIU3lhSjJ1NmhuYzUx?=
 =?utf-8?B?UHN5dzRrTm1RamhCaE9lN0QxeWdERW9uR2RhdFpUWTZUamZ1dFBSWG5lNFlu?=
 =?utf-8?B?QmtJVE4rYUQ4L1JjMHVPdUc4cXBlQlpYMG9iUU9mb3JsdERwUkZGa0hZZk10?=
 =?utf-8?B?MDFRc1hlZTNwSS9jY2cwS0xHZndGbTNCQW8vQ3FCMUdBQTkxYVcyVnYxTmd4?=
 =?utf-8?B?aFhmVWQyOGYrZ0J1bmY4ajhUL3ZaU1dIU2Vmc0tPZksvRVFCWUhrUDZkaEhT?=
 =?utf-8?B?anMxSmEvaG9aRWs5TTcvbW16R0c0ZXd3WHFTR1hnUW0rRFdmalNiRkRHbU5C?=
 =?utf-8?B?bWlKYTUxWnJXbU1JR2VrNXdpcVlQTk00c2Z0aFlwTWxvcGp3NzRyaTBhN3Vl?=
 =?utf-8?B?SHpvWFFhalVod25lbWVKMmE3WUphSTJJcVltaFR6cXdUWEt3blhyd2xxTWpD?=
 =?utf-8?B?SWFBdDlTSTI4UGxVN3FhOFNlbDlBUlN1ajVOblAvdHF1dWVzSDVFYWRDZUpC?=
 =?utf-8?B?dXNjOGh6ZDFQWi9XR015eWdEdFIvN25Sdm1UaVZIakNTMEtsYWZGK3o2dVJr?=
 =?utf-8?B?QllIUVZvdk1DYmJ4RTE1YVdLM2tET2lmd0d5SHJnOXBnY1N6Qk1GZStycDRK?=
 =?utf-8?B?TzY1TUFHQjIwSjZaVmx3c3JWcEpDM05lN09sZTI2NDZUeUVZNG1BQjB3TC9W?=
 =?utf-8?B?WGZPRlkzaXJQam1mS3laSElvMmRXWVFRVzUxbjlMaGN2K0hMWXNWblhSaWJm?=
 =?utf-8?B?K3NNREFKOXZ3VHhvOVFkUUtxTE55UkFBWXVhbHlqWGNKc05pS3N0T3pmOHNh?=
 =?utf-8?B?K0tDWU5NSjRHNWpSMXkzRld6Ry9XU1lRS2Z0THowRUcrR090d1FLbUpEZUhR?=
 =?utf-8?Q?eF4F2TujBZEe/G9CC3+Ns5/AF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A8C10CE13643F42877664B197E81119@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7867.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc518121-a923-42f0-9669-08dca21385c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 01:39:51.2146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQ2PHx41ZL9Aa07nxRLKpLWx+bG3tRZ62rXNUu6UPBcbD+d14MvQTVvTrLWREa2GAFO9RHW/UwEjpt4Rr5weKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_184002_904724_9CA30594 
X-CRM114-Status: GOOD (  19.03  )
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

T24gVGh1LCAyMDI0LTA3LTExIGF0IDExOjAyIC0xMDAwLCB0akBrZXJuZWwub3JnIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIEhlbGxvLA0KPiANCj4gT24gVGh1LCBKdWwgMTEsIDIwMjQgYXQgMDI6
MjU6MjlBTSArMDAwMCwgQm95IFd1ICjlkLPli4PoqrwpIHdyb3RlOg0KPiAuLi4NCj4gPiBJIGNh
biByZW1vdmUgdGhlIDMyYml0IG9ubHkgZGVmaW5lLCBidXQgSSB0aGluayB3ZSBuZWVkIHRvIGFk
ZCBiYWNrDQo+IHRoZQ0KPiA+IHU2NCBzeW5jLCBiZWNhdXNlIHRoZSBzcGluIGxvY2sgYW5kIHRo
ZSB1NjQgc3luYyBzZXJ2ZSBkaWZmZXJlbnQNCj4gPiBwdXJwb3Nlcy4gVGhlIHNwaW4gbG9jayBp
cyBmb3IgaGFuZGxpbmcgY29uY3VycmVudCBwcm9ibGVtcyBmcm9tDQo+ID4gZGlmZmVyZW50IENQ
VXMgdXBkYXRpbmcgc3RhdHMsIGFuZCB1NjQgc3luYyBpcyBmb3IgdXBkYXRpbmcgNjQgYml0cw0K
PiA+IGRhdGEgYW5kIGZldGNoaW5nIDY0IGJpdHMgZGF0YSBmcm9tIGRpZmZlcmVudCBDUFVzIGlu
IDMyYml0IFNNUA0KPiA+IHN5c3RlbXMuDQo+IA0KPiBIbW0uLi4gc28gd2hhdCBJJ20gc3VnZ2Vz
dGluZyBpcyB1c2luZyB1NjRfc3luYyBmb3IgdGhlIHBlci1jcHUgc3RhdA0KPiBzdHJ1Y3R1cmUg
YXMgdGhleSBhcmUgZ3VhcmFudGVlZCB0byBoYXZlIG9ubHkgb25lIHVwZGF0ZXIgd2l0aCBpcnEN
Cj4gZGlzYWJsZWQNCj4gYW5kIHVzZSBhIHNwaW5sb2NrIGZvciB0aGUgc2hhcmVkIGlvc3RhdCB3
aGljaCBjYW4gaGF2ZSBtdWx0aXBsZQ0KPiB1cGRhdGVycw0KPiBhbmQgaXNuJ3QgYWNjZXNzZWQg
dGhhdCBmcmVxdWVudGx5Lg0KPiANCj4gVGhhbmtzLg0KPiANCj4gLS0gDQo+IHRlanVuDQoNCkkg
YWdyZWUsIGJ1dCBmb3IgbXVsdGlwbGUgdXBkYXRlcnMsIHdlIG5vdCBvbmx5IG5lZWQgYSBzcGlu
IGxvY2sgYnV0DQphbHNvIG5lZWQgdTY0X3N5bmMgZm9yIDMyYml0IFNNUCBzeXN0ZW1zIGJlY2F1
c2UgdTY0X3N0YXRzX2ZldGNoIGlzIG5vdA0KcHJvdGVjdGVkIGJ5IHRoZSBzcGluIGxvY2sgYmxr
Z19zdGF0X2xvY2suIElmIHJlbW92aW5nIHU2NCBzeW5jLCB0aGVuDQpvbmUgQ1BVIGZldGNoZXMg
ZGF0YSB3aGlsZSBhbm90aGVyIENQVSBpcyB1cGRhdGluZywgbWF5IGdldCBhIDY0IGJpdHMNCmRh
dGEgd2l0aCBvbmx5IDMyIGJpdHMgdXBkYXRlZCwgd2hpbGUgdGhlIG90aGVyIDMyIGJpdHMgYXJl
IG5vdCB1cGRhdGVkDQp5ZXQuIFdlIGNhbiBzZWUgdGhhdCBibGtjZ19pb3N0YXRzX3VwZGF0ZSBp
cyBwcm90ZWN0ZWQgYnkgYm90aCB1NjRfc3luYw0KYW5kIHRoZSBzcGluIGxvY2sgYmxrZ19zdGF0
X2xvY2sgaW4gX19ibGtjZ19yc3RhdF9mbHVzaC4NClRodXMsIEkgdGhpbmsgd2Ugc2hvdWxkIGtl
ZXAgdGhlIHU2NF9zeW5jIGFuZCBqdXN0IGFkZCB0aGUgc3Bpbg0KbG9jayBibGtnX3N0YXRfbG9j
aywgbm90IHJlcGxhY2UgdTY0X3N5bmMgd2l0aCB0aGUgc3BpbiBsb2NrLg0KDQotLQ0KQm95Lld1
DQo=

