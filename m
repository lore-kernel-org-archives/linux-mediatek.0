Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCFEE645B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v219WNHbehBqYy7sD+dCeqAKOJqLCGmW1UaoI7LrCVw=; b=p/g+JMMdnPEcSoWinpXe/ZbmnL
	t2XDIfgxJpdfHdSYUwFIU3QZEo9EyiIBDt4jFYWhAnfFbXbez3HGps6BRM+I60bow31v43qFnCvX3
	9QdOosgu9Fa9XNHj7hsUmEmcvYmbDoh4yWJGY5Ntt3Ouhf0MmFTT2RTqHWDw4MjmyU83Tp2P7QtPl
	+H1MEixz9Pi7sRuk3LqMHnMNdMgSX8mLBVwp7rTMfMslj6EYydPSsTC9w9ysUfb3Xn1kgUUbVPB7y
	BkwWxD3/5i56hQAxv4JCmcaSvgua/GDOo5+fhl0iJvnnFfEakJGiSwwZ+r3tK0yTPDUX1sqngqSt3
	Sk51d38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeij-0000000CHMH-06wD;
	Thu, 12 Sep 2024 07:58:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soegv-0000000CGsI-3tGh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 07:56:39 +0000
X-UUID: 86a80b3c70dc11efba0aef63c0775dbf-20240912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=v219WNHbehBqYy7sD+dCeqAKOJqLCGmW1UaoI7LrCVw=;
	b=XWHuhdSwyFW0jdSyykS2yHJrm4FKesx9+7kW/DiZPuGEXg4WcU00TJgS4QFSVz+Or0DzjwnSG+aJQkxtyYfez4A4/hIgmTkcFTqem0w0C69l67fOETAf4nWFT4dearNexRqhwj7eHviB9RO7VuyQEyy4Zhryef8YlqJaUDMkcuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e9b80956-70cf-42d5-8a74-171216e14788,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cc12e6b6-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 86a80b3c70dc11efba0aef63c0775dbf-20240912
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1513745414; Thu, 12 Sep 2024 00:56:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Sep 2024 15:56:30 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Sep 2024 15:56:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWSBroqz1Isntl/sc4HtxtrNhEtPMvJ0+QwbcD9/24aT5WE1hq/bcWH9VwrfaeS+noCZ5sLzKa8PafDzhEWj23wmjdDPQqVb5wmNQzmS4meo3Qlt/qQxk8WsmVREgOXCLcakXVFk/x8DHte5UXX6eYLz7qT8D37seV4cBie8QEQyOXDLg5jqrk4Pju8kRrdbRw6+VJeNPqryd9KAj9JgTNhAe0n2Uoe1oNmXXhl1Q9EbMiSjObikw87pzkDapCFAF9MPk19BYU3IzUXEtFg/khGFoPYWHWSdvExfEkopuwZSuxIdiTExzgzHv4Uk19stNj/OOiZiIKpJD67llSUK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v219WNHbehBqYy7sD+dCeqAKOJqLCGmW1UaoI7LrCVw=;
 b=Wf+OZ0p2zd7SWxo1gbeOJQ9CAsvuxJci2jNgtJ7/KXQfQgtfdsR1Ph7BTRsz3AGyMBTa4Ajp3p9lbqBN2MS35GhSx1SrlfSZQ6vvJ1R+mYrL583JqWjXBf+jGkOx/KDxhLNbuZjgF5qTaNZc9WLuPgev6dCQBhlL6hNW8A3vVL5yJgHNAiEHylpvImtYr52UaomtdKykrKBArpTFvviktaAOgfvzOnDYL0bFM+XTeAPSkVQd2qJ+trIETJHLHnSj1D63Pz3BDgpTUrWYP3MBE+4rF4mHgS3fflgHmWQ5dw+98Yc8ZaiUwr2eEAgPXdhSUBJkN/3yr0dTv9U2XO8Avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v219WNHbehBqYy7sD+dCeqAKOJqLCGmW1UaoI7LrCVw=;
 b=QY0PmsYsC9ie2Zcj8+W6TeE3mHXFE/S9R2xrj6C40+odzX4ubnjfl74To/Zv89jfQ9eQ6SgkD80D4ftSkQl61lpghYTSxwqkQ92Bxsr5FTctQjQwXgVWN0ayxf7w6Ecrini9p6+RffAis2XIZwwLo8/NYuvsvUs18+AMWZYW1DA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7917.apcprd03.prod.outlook.com (2603:1096:820:f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 12 Sep
 2024 07:56:27 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 07:56:27 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Thread-Topic: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Thread-Index: AQHbBDo2mGVV8TfBlEyeXNjISmhpNrJTyhQA
Date: Thu, 12 Sep 2024 07:56:27 +0000
Message-ID: <fd3890987a56a01be8954f3d10d6e744918c62d7.camel@mediatek.com>
References: <77b85cdc-ecfe-42c7-a3f3-a757566b6f5f@stanley.mountain>
In-Reply-To: <77b85cdc-ecfe-42c7-a3f3-a757566b6f5f@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7917:EE_
x-ms-office365-filtering-correlation-id: bbbb8f11-df4d-4035-cbb1-08dcd30067b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VWp3M2Vud05WVzZidWU0eitDTElOei9PdGQzZ0hFc1VpZEFvdFlzUEl2bExh?=
 =?utf-8?B?SXROclZ5MWg1U1hTcitNUjByN3J6SXRqV0JHa0RoOEhVR25CUWpEM0dJN09a?=
 =?utf-8?B?RXdMWnNKRmNEb1hXaHBDTUhyS0V3UTBRZ2ZBTVZQZlFjeElsa2dYcUo4RUww?=
 =?utf-8?B?ellmUkVZNmRGZWo2VWtza2E1UDdIbkFWS3A3WDZsN3dEY0hBeWRsemV5RzRL?=
 =?utf-8?B?blFPRjZibW9aSEM0YXpqN2w1Z1NxZWtpZndGa1c3V2tVTzZ3RmJFUUxQUTBL?=
 =?utf-8?B?bVJQKzhxWTdseUNvTnRnOEZPMXhkNG9HRE1xOFdwZ1RHWGhWVmg1N0M4SHUx?=
 =?utf-8?B?cGJmSUJWV0FUZ3oyNFhVejMzWHA3RGxuc2dJS2lLazJaa09NV0JTT2xwazlu?=
 =?utf-8?B?QkpRMm5tZUwzWmJGcm52WUNUM0hseWc1Rzk1cS93ZjhZUXJhajQ1bEJDWlRY?=
 =?utf-8?B?NUJ6WUE5ck0rK3NoV29FVVV2QUV6ZU5ZMXFvTlk3ZnNOUmtPZllrN3VaVmxr?=
 =?utf-8?B?eFVYZUM3UWNYWGlPMVRjbjhCVFVRcE5HVnBFZUxTQmpqMUhacVN3Q0FPRDlj?=
 =?utf-8?B?dndXQWc5SkxDbnhkNWgvMkh3MDZKZ0pWKzlsY1ZOcWRtMnJkbGM1QTJIdTZN?=
 =?utf-8?B?UllpUlYrb2Uxc2RMNzVld2p2eC9hNlJTRTNwaUMyVGJUMSs1UlJnK2FsT0xX?=
 =?utf-8?B?bVBRQ29Lb0RCTnloRUZjbkJvNnluZ2pwNFY4eVpNZjZ0NUFtbkZSOFdVUG9t?=
 =?utf-8?B?aExGZExkU2JBRjcwallpdmVCNGxONXJKODdlOG9SRHAwQmF0d1I2YjJnREFj?=
 =?utf-8?B?cXcvZWJaRmpNc2FwWmU1OGxEeldxcGdRREtaZ2NqdkdKZEF1TFoweVQwV1c5?=
 =?utf-8?B?Z0s3bTA4NmFTOFBac1BIZjRLYUNxL0krL3Bpa2dadmwwbUhNOXJSLzZYVWdJ?=
 =?utf-8?B?YXpVYkd0K3hlMStkVzRBYW9XNXVpM2RyWGUyREZVVUoyem0wbFFxREM1T2Fw?=
 =?utf-8?B?TC85VXpGMnF2SU8xak05ZUpNaWVhU3M2VndxbU5MTG8vSHBaQlJJT3g1UVkr?=
 =?utf-8?B?anhOcm4xL3hlZ2Q4RjhNYldZU3FNaGo1Z1JMVFhDRUEzUTZlbEJtWTBKTFUr?=
 =?utf-8?B?Q1NIcnpLRXIzZk1pOUwrc3doS3UvNzV1dnlHN2xzNzhQUXNDcjc4NDY1SEp0?=
 =?utf-8?B?akNJUTlRRkxteURSZU5aOWx3TjQzYWhJN0wvbzFyQVZCTUdnWmdjbTk1WVpp?=
 =?utf-8?B?YVJCYU9BUm1iVUJWNmtlS1dQRE0vRHNYTktvcExLK2toNmhEUUdMZERNQ0Mv?=
 =?utf-8?B?S3Y0SzhyL2FKNzQ5aGIyblZoM1pmMUdpVFpIcjBLSWJWREw1N2g5dkZNa3dV?=
 =?utf-8?B?WE85WndUYkR5UW1EemJSM1JQL3grZ1FHVFVXRnBDTUliVkx0MDFsVFpZSjl4?=
 =?utf-8?B?bmMwdVNEOWkzYUYrcXpxZzNsVDVqVHpIdG5JM1F0VWRkL3NidEpVdHZwbkFv?=
 =?utf-8?B?RTVHSWRmR2ViSTFXRnhSWVFueW1BQ0hMZlNtMFRtNzdHM0VIZkM4NTlJNkRV?=
 =?utf-8?B?Yit5QWlKQXRzN2RtcGZvT2hQK2lOa0hvQ0lRZXgvUm9NcUlwRnQ5YTZLTW9F?=
 =?utf-8?B?Vm9ZZFM2UkdNa0ZXSnVFVVV1RjJGdysyMTJWQzY0TjUvU3Q5RDgxZWcxeW9Q?=
 =?utf-8?B?ayttdUtCWFJtYW9BOWt5WncxZmNsb2ZPaHU5ZDVMYlpCTmlMc2wxRnZ5c2RF?=
 =?utf-8?B?Rlg0Rmd6WFV3Q243NkJlcVhzUDRiRFVvaU9tSWFzUmV4azRHNEM0TisvcTJM?=
 =?utf-8?B?ZTg4VFY2dGl6Zytyci9tanBDeUdBUDFLVXhHc2t6cUpxL3NsVDdlMi82SlJR?=
 =?utf-8?B?dEoyek5HQU9vSml2MUhwejM0YzFkeS9VbVlIOXpUQTNsZ0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVY3Z2JUMmI3VDdVQng2MEhaZndqWmJlUlgvVlNUZVQ0S1ZFbXA4Y1FlWVRI?=
 =?utf-8?B?b2tnazltellMZmpEaUxUbWZweWZBcUd6VFBjSUtzSUpKRnZSNXladDJIS1lh?=
 =?utf-8?B?WUQzOWdjYzFIaDd1UXQzVUQyaU5uQXZhN2prMFNHSmVEbUlMcHVkSm9JazJ0?=
 =?utf-8?B?V2FlMXNWQ1Jmd1U2UmhlclV1Sm9ZRjRrcnNEU1NVeG8xSlJ0SmZhdHppYjJ6?=
 =?utf-8?B?eEJiZnprbjN6SytSTS9HZ0dmUXVKQWJsT2l0N1JFTjVLU3hCdlV1T0Zmc3R2?=
 =?utf-8?B?UjNFampCUE1zeTlHZDBZdVpXb2FBV3BoSVozbDd4M3VxNGRjUXZwNklpS1Zz?=
 =?utf-8?B?WUxvOEw1am1GbDRvTkFTSnVBQXBRVGpZYzZqcllIT1l0eFBWcTZjSFU3dWVq?=
 =?utf-8?B?TSszUW43UHlZdE1vNkIzRDMza0FqZnNRdXVJVGo2d1VHK1VSenFwRkowUlFl?=
 =?utf-8?B?VTYvTHZDa3d2NEhPYXZPTUd6d0d4TXp4cUZYZEJWaTNZSVVaQWZXbTdPVEMr?=
 =?utf-8?B?ZEYrNWFqcnNNTHA3YjZZWENhRzFpU0s1YXozQWhKRDNCY2crb2doNkJWM2h4?=
 =?utf-8?B?OXJyTng3alpraGkrTDJVN0RMTnhoY09qdDVHT0JSZ04rdlI1dU5GSDh0Skd2?=
 =?utf-8?B?dWpnTTAxMW9wYTI2WmhCNURjN2w1Q24wb0poNXdFbmt1MTJJV1hUcmE0L3ph?=
 =?utf-8?B?MEd0MGxlS0Q4dkpKTlpzUGhhK1gyTG56ajRaV2dnWEpzUnVxejRoUEdwamc4?=
 =?utf-8?B?STJ1ZjF3RFVkS0puNzJ6RmpSc0NMTWd6bFExaC9ac011L1hHMXZkOHFJM1Jy?=
 =?utf-8?B?YnJ2MGZFckg1a1o5UlZCNzF1VWV0aXFPellHbjU3MFJkYUlVc2EyVXdsbWtX?=
 =?utf-8?B?VGcxcmZUcHpZcmdpcFRPajc0WmZRUEpOcGZKMEhIWW5La3VXQVZBREV3UFha?=
 =?utf-8?B?dk8wdzU3UVB2RVBoU0Y4QzRYTG1UaHdOMXF2MTJCYmVBRW5rMHZsSHdQUDhm?=
 =?utf-8?B?cFlZSFlZSU9DVkVZM3BWUGR0MTVwKzVVcVlaNmJ3TC9WNkxRUnZhenVPQXlR?=
 =?utf-8?B?WllpR1JYSysrTHpOZElvMTJUbUhHeklHc1JEOTZPd1gyM20yMGlsSnIzb2d0?=
 =?utf-8?B?NkxzdEVidnZtK3BXZDlFMlZLa293bitWdC9qd0wyYzBNY3NLQUpZWVFEaXcy?=
 =?utf-8?B?OGUyakR1WStMejVkUHdJcjdGOGVtcCtvVCs1S2FCZExadWJEOGE2RVZEdlBh?=
 =?utf-8?B?YnpCN1VmaXlHRWVmbFRTN2tYL2ozSHVFOGZUL0Q3azlwTEMycHlKMnJoQkRU?=
 =?utf-8?B?c0FURFI4L2U2TmVpVGN0NkNpM1UxdnF4U1pDMVc2MUd1WFRMcDZIdkhTNE5s?=
 =?utf-8?B?UUZkOExjaU9UYTRzSm83ZHJzRTl4SlZxUzRzRGZxQXRSaDRSS3BPQW9aekJ2?=
 =?utf-8?B?bndJc0dNNmNYaENqOFRVY3BXRUJFVHpaOTRDOUlEQUxmZE5zeXQ1WEJmd1R4?=
 =?utf-8?B?c3VHNFZxaGlTQkVCeHhkMXhsY0ZucU1YSjdJYzdKV3ZxTUUrd1dqYWRxSndl?=
 =?utf-8?B?RlhObG1UZ2RkUTFncjBsNnBuamc1MFlHVUVsdWR2bVFRWGMvQnNYUlRxTzNK?=
 =?utf-8?B?ejRoRlh5a0FVQUV0UHh5bFA1NTlWTEZuOHkwZlptQm9mRHhnYnBKOHBkTDhT?=
 =?utf-8?B?NjJ0enFmZG9qV1FtNVp0Q3VTWXhkZ0NyU0s5MU14Q3FROGJmN0dwdUg5VkdR?=
 =?utf-8?B?ZWUrR1pHZ3EyZzlzaCthWVFVYnRSZE1WamZMUVRmSk9oK0xVUHA3ckJ6YzRK?=
 =?utf-8?B?bndzS28wdm1tZWhReW5HU1h2aVhIaDFRYTlnMTN0ZGU2UzQwdzRsOEVqczF0?=
 =?utf-8?B?RW9hRTFsY2NQY2Y5eWtTaTJQSGxEaU1UOUV1ZHdRd1c4dUYwY0pneG9sczBG?=
 =?utf-8?B?SEJvakJYbmtuR25yWVZxdnRxbWdKN0RSa1ZKLzJjK3pISEhXYXhjNEdVNGYw?=
 =?utf-8?B?Z3cvYm9YRFpMWWhRSGdZalp5cFNZQjZTVzRJdDQzQ3hWM080YVl5Nm9QNkUv?=
 =?utf-8?B?dFJROXVRam1sSG9vbFl5ZVhDcENVaDFRVjlSZEtHUmZmUWZQZzVRbzJ5a01z?=
 =?utf-8?B?VW9qWjM4cUdRQ0VHZWNYU3pFUUxROUpya2tvZHA2SDFpLzZnQkJqNzNnekEw?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2D7B13FFFCA6E49AC5FF5C176FB80CF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbb8f11-df4d-4035-cbb1-08dcd30067b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 07:56:27.2744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LMEhR1HNpz9smniOA/lQPEZS8B/V9A4ok3s78t+Sby0mxAPTuL0CrPZM/YB+V4JHacntxZ5ghM7vwtdmy4jj4Zl89O/A5BNKeUkJD9weLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_005638_020194_8C1C47D4 
X-CRM114-Status: GOOD (  14.58  )
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

SGkgRGFuLA0KDQpUaGFua3MgZm9yIHRoZSBidWcgcmVwb3J0Lg0KDQpPbiBXZWQsIDIwMjQtMDkt
MTEgYXQgMTQ6MDIgKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5h
bCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAg
SGVsbG8gamFzb24tamgubGluLA0KPiANCj4gQ29tbWl0IDU5M2I2NTVmMDUyMyAoImRybS9tZWRp
YXRlazogQWRkIG1ib3hfZnJlZV9jaGFubmVsIGluDQo+IG10a19kcm1fY3J0Y19kZXN0cm95Iikg
ZnJvbSBPY3QgMjgsIDIwMjEgKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUNCj4gZm9sbG93aW5n
IFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPiANCg0KSXQncyBhY3RhdWxseSBjYXVz
ZWQgYnkgdGhpcyBDb21taXQgZDdjNjZiNWZiYzcwICgiZHJtL21lZGlhdGVrOiBVc2UNCmNtZHFf
cGt0X2NyZWF0ZSgpIGFuZCBjbWRxX3BrdF9kZXN0cm95KCkiKS4NCg0KPiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2NydGMuYzoxMzIgbXRrX2NydGNfZGVzdHJveSgpDQo+IHdhcm46IHZh
cmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ210a19jcnRjLT5jbWRxX2NsaWVudC5j
aGFuJyANCj4gKHNlZSBsaW5lIDEzMCkNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfY3J0Yy5jDQo+ICAgICAxMjMgc3RhdGljIHZvaWQgbXRrX2NydGNfZGVzdHJveShzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpDQo+ICAgICAxMjQgew0KPiAgICAgMTI1ICAgICAgICAgc3RydWN0IG10
a19jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KPiAgICAgMTI2ICAgICAgICAg
aW50IGk7DQo+ICAgICAxMjcgDQo+ICAgICAxMjggICAgICAgICBtdGtfbXV0ZXhfcHV0KG10a19j
cnRjLT5tdXRleCk7DQo+ICAgICAxMjkgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEp
DQo+ICAgICAxMzAgICAgICAgICBjbWRxX3BrdF9kZXN0cm95KCZtdGtfY3J0Yy0+Y21kcV9jbGll
bnQsICZtdGtfY3J0Yy0NCj4gPmNtZHFfaGFuZGxlKTsNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiBEZXJlZmVyZW5jZWQgd2l0aG91
dCBjaGVja2luZy4gIFdlIHJlY2VudGx5IHJlZmFjdG9yZWQgdGhlc2Ugc28gdGhlDQo+IGRlcmVm
ZXJlbmNlDQo+IGlzIGRldGVjdGFibGUgYnkgc3RhdGljIGFuYWx5c2lzLg0KDQpjbWRxX2NsaWVu
dCBpcyBhIHN0YXRpYyB2YXJpYWJsZSBpbiBzdHJ1Y3QgbXRrX2NydGMsIGl0J3Mgbm90IGENCnBv
aW50ZXIuIERvIHdlIHJlYWxseSBuZWVkIHRvIGNoZWNrIHRoaXM/DQoNCg0KUmVnYXJkcywNCkph
c29uLUpILkxpbg0KDQo+IA0KPiAgICAgMTMxIA0KPiAtLT4gMTMyICAgICAgICAgaWYgKG10a19j
cnRjLT5jbWRxX2NsaWVudC5jaGFuKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl4NCj4gQ2hlY2tlZCB0b28gbGF0ZS4NCj4gDQo+ICAgICAxMzMgICAg
ICAgICAgICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKG10a19jcnRjLQ0KPiA+Y21kcV9jbGllbnQu
Y2hhbik7DQo+ICAgICAxMzQgICAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudC5j
aGFuID0gTlVMTDsNCj4gICAgIDEzNSAgICAgICAgIH0NCj4gICAgIDEzNiAjZW5kaWYNCj4gICAg
IDEzNyANCj4gICAgIDEzOCAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2Nv
bXBfbnI7IGkrKykgew0KPiAgICAgMTM5ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9j
b21wICpjb21wOw0KPiAgICAgMTQwIA0KPiAgICAgMTQxICAgICAgICAgICAgICAgICBjb21wID0g
bXRrX2NydGMtPmRkcF9jb21wW2ldOw0KPiAgICAgMTQyICAgICAgICAgICAgICAgICBtdGtfZGRw
X2NvbXBfdW5yZWdpc3Rlcl92YmxhbmtfY2IoY29tcCk7DQo+ICAgICAxNDMgICAgICAgICB9DQo+
ICAgICAxNDQgDQo+ICAgICAxNDUgICAgICAgICBkcm1fY3J0Y19jbGVhbnVwKGNydGMpOw0KPiAg
ICAgMTQ2IH0NCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg==

