Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B92AD0E6C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM2LGrmeP/3+RQunGvms4umvf2IUBtlaBAmtfxYc880=; b=WkdRr0+I/sjLnxLATd0/LFOYgT
	5sr9BwT/9Lw6f+z2yjQw13c6xVT2/8VBcIO9vFVnAD/sP+jdyjNRV9QLzHH+3RjwtQ2abg9ckfBzl
	MDFq5FhXhCqYFBbmaWggiSCECMZgCvAckmpx/tbi/3juNa15ZwEk564RJKA4+eWC3n2wsPfOy5gbo
	jJNQx0sRStLq7hIO/zywNmKRDfemrlU0TxzCT50NfJD8II1N5rqwkCkLHDRktf2FftJQUiJl9kTl9
	RehN6gDS7Sq0SYVj5s41iPh9Co8taJhArE/h2wvC6ZijGOIXUYAstjvsZ6bOJAgK0M/5x5mT/xlCJ
	1sR4ePww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nS9-00000006UYY-0Vvg;
	Mon, 21 Oct 2024 08:07:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nQe-00000006UOI-1Q6P;
	Mon, 21 Oct 2024 08:06:17 +0000
X-UUID: 5472c0ec8f8311ef9048ed6ed365623b-20241021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zM2LGrmeP/3+RQunGvms4umvf2IUBtlaBAmtfxYc880=;
	b=C8Jw9BSS73lS6z1S1Wrp9tAL0AjSKTmwBsxUdAg8xn2CoHY01mgFFndc5QcrrWGYF7JmOtv0HS4nVl/HlM/WL5c4pFbbTzYjVsXx0ct7F9F+nyOlIHR60dwK5ZSVgpPAOWwExb6CJG6PUT2vyX0kGgjmttYZLyiMJHRJ9k+SFw0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:769d072a-860e-4bd1-90ce-63ace2c1b438,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:74539441-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5472c0ec8f8311ef9048ed6ed365623b-20241021
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2068506950; Mon, 21 Oct 2024 01:06:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 21 Oct 2024 16:06:06 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 21 Oct 2024 16:06:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4HJcHQQyXF5TciYWZN6Jvdw4ws/TCWdIUre6wfcYTnPcHZdpiuj4IfI/eDn4Gqasxp5bDv5m92BMKkuhR+vm5FYjhEvvdjV31QIeGTaV/X53mouUGWGdZaiROHvNnnJ6O0CWDz2jJ55gsY2eUUOrX4mY+X1ZRmiZxVXHkPQpPbcezTF4ynLrQeYELdEFJJiX53wYzJeUOw+GXyyvHVEIoRHIbnJJtyivvZHXnyQMnP50NyHuT9oqjDf4n94Sx9gO4NHidcSNM99IJwroT2pQXjauwT7LUaj8wmSBA9Lqo56rIYhwMAJrPzE+LLTHhz2DEPcen+gEDLG9PngEk70WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM2LGrmeP/3+RQunGvms4umvf2IUBtlaBAmtfxYc880=;
 b=YzmykAzRkbuBx60qzlyalpr/Vm5QpEYMrDyYZStEcOomcPw6IEcZGhCd97zjeRdVWwcBXM8J8dQNx7fbJ87jOL59A9bAcMTgmOF1F8NuBQDME75F4WJf4RqxMLwqgKHHk3LmRrQPl8yfNjcx5/9NGrmyglpTa/iFStWes9m4wkyFrmfOAXYC39+z++/0hMq+4LqtU+o3d7ORKhDyR3/s2tPcSBklrxBBmO+jJP/2g/U+C1UFbVDqJUxbM68AtxvBCCbT55DT4iwBbTSO50uew21j5y/V9sMO/JGuu6mXl2IzI4UictiYdsYUxM/TWL1+4X1X9fPHluey62LZjxaZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM2LGrmeP/3+RQunGvms4umvf2IUBtlaBAmtfxYc880=;
 b=kR7lhdrB0lcyRBl0GvVKTacJoegWjw0dHaYlzKQuo26cMueyBn8PU+Ls2E04AX1RMFuDPbcd7OX/qbXQQ7Xz3063DZejhPr9/0bUznbWdYJQRu82SG+nPKCtr5CyeQrY4KMTRhyc/pDLv0Bq1T1dFYqlBxD6bwbhNDV0HC+a35Q=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB7725.apcprd03.prod.outlook.com (2603:1096:101:13d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Mon, 21 Oct 2024 08:06:03 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 08:06:03 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "konrada@google.com" <konrada@google.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wmacek@google.com" <wmacek@google.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH] iommu/mediatek: Add PGTABLE_PA_35_EN to mt8186 platform
 data
Thread-Topic: [PATCH] iommu/mediatek: Add PGTABLE_PA_35_EN to mt8186 platform
 data
Thread-Index: AQHbIIasc/lq9DUx0UiaA/0COpb4z7KQ3yWA
Date: Mon, 21 Oct 2024 08:06:03 +0000
Message-ID: <f671f8d84b72ffff1d3b66bd2c48b4ffe81df79a.camel@mediatek.com>
References: <20241017112036.368772-1-konrada@google.com>
In-Reply-To: <20241017112036.368772-1-konrada@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB7725:EE_
x-ms-office365-filtering-correlation-id: faa52c6e-019b-4ca7-f875-08dcf1a7352d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVp6dnVWTjlGbkRQM2VlTS95VmNjQjQrK1NrRERtbWcyRXFRSElKYStxcXlL?=
 =?utf-8?B?dUhYdzNzSk5iRGhPRGFpVml0cG1hWGdmdndKdkZha1pkaWV6YUFUT0VPYzZq?=
 =?utf-8?B?dWZBYzZZbTRJMU4rS1hXWXptSnJOYlkxM2pkWFI4bkxJUFRGcnZUSi9sTFlT?=
 =?utf-8?B?MS9RRklaWWE3ZFBmbzBiL0ZoYS9WOSttbzFnK2NxSjRkblBndm9mMGU0dm9Y?=
 =?utf-8?B?N1hPZTR5Z3lHWVBEMTZ0aGVNM2RCOTBXWjU2UnVuR3U3S0hKYkVpVE9jdEhh?=
 =?utf-8?B?RndXdWhyWFliWlNuN09FejdEVkRhNWUwTjRNemVWTmVIVG5iSEJ1TVo5V3Vu?=
 =?utf-8?B?cUJtdHY2MGF2VkRFTnZQY3dYQ2ZmRkxieUVoc0N0QWUyV1pHT2VnZTVCczRB?=
 =?utf-8?B?MHRBNEZ6bnE4K1NZNWRtdU92OVk3TjlvZmdMR2xkejZjWnFhUm0zaXk2WDJw?=
 =?utf-8?B?NUxYOTl3MjY0NWhRYXpJbFpyQjRQOG1oQVBZV2p3V3dRc0Vaekxac0tuYnU2?=
 =?utf-8?B?cUNXRlZLaE93VlBHeDZzbzVzUmF2KzNLR0hqT2JYTUJSRCtDdTdrRml1Y2hS?=
 =?utf-8?B?MG5TU1F4YVBPdHBVdGUxYXRaUERMaWMvOTBqVjN4QXE3M3FsMlByRjhwa05Q?=
 =?utf-8?B?V1hkNUFBdnZ4aU9BaWJ2WDg5ZXZCLzQ1TVFFdzQyeGx2WmQzT2ZpYVRVT3Iy?=
 =?utf-8?B?Y09qY3VwYmE5dHl0SU51d2V2ZXVhclQ4VENWZU1jeXltZDBTQjgvMEN1ZUxF?=
 =?utf-8?B?N1d4cVVFUjFsSW9TK1VIOGlrZ002Y0xpUTRLZkFSODNxUzFmUkNkdlhSNWd2?=
 =?utf-8?B?SVJ2RmNPSTNObUhGTUV3U1FjS0JIa0RhWUVRZm5iZ3VKVXAvWHNOQUE2R1Qz?=
 =?utf-8?B?VGs5bm40dnlMQ3NEQzJ3cEU3U0lRVEZZYWZqUHhBT3paa0lWdGcyWENOZC9v?=
 =?utf-8?B?MnlxU1UxNkUrdUNKN1ROa051bHlBVHRDZ0VZZEhJRUV6TDFqNHZaOHRaYmwr?=
 =?utf-8?B?aUxpWExad0NzeUhRY0c1RVZRSytaUnRFTzFCNXYvdlM0bVlrb2diOUlVRUJj?=
 =?utf-8?B?bldPeXRhL3dSdVhpeEF4bXQ3d1dWVTVZZUMyQ3FvQ1VLYlNvUTZURDd0UTRF?=
 =?utf-8?B?elYxMVFJQk9FUk81MFJZS0NOWDhKSWcxZW5FNHNqR0FYbDhwUTQ5OWkyZjl4?=
 =?utf-8?B?RDNQc1EwWitGZm1jb2hNYkFjdEpSaE9KdFlyWTlnWjBxU2M4LzkvT0YwZkFS?=
 =?utf-8?B?UlQwTEF1eS92Wmo0aUF5TmFxbGpKR0ZuYU1XODNQU1BSK21NYTdMQklHMGww?=
 =?utf-8?B?UEQybVk2KysxRVdpNmI3emFianFyZVJ2cUFkdDUyN1VlbW1MekFBaWREVDVO?=
 =?utf-8?B?T09vR0lpRGJGc2FkT0hpaitKZ0VFM3ptcHk3OXI3aHNoQkREd0tXdXRRTUVZ?=
 =?utf-8?B?ZzV1RjJNYzR0eE01b1I5MVJTL29qM2NGcC9ScHg4NHN2eUJqM2k4c2Q1LzBJ?=
 =?utf-8?B?dXgxdTh5WFJ4NXJPSmpmMmY0OVROU2tjRVVlVG14eW9lYVdzSUovRUV4TjNs?=
 =?utf-8?B?dnlQbzE5T0NaaGRrQ2I1NytnZzJGbUd5eGMzYWIwcFNYODdVRThHeE1CUnBh?=
 =?utf-8?B?UjZKcTVpN2F4cjBUSjYraGROOGNKVHZrK2tzODgreWxIOUJsMVdOZk1xY3Zk?=
 =?utf-8?B?dnhacnNCUVNWb2trOXJkQVVtUWN3MlU2blA1SGYyQmE1b3J2NlJINm9hdStD?=
 =?utf-8?B?bVFqSTQ5QkllaTN1TTJ3VGhJZkdMSFRoQ2lUc3h5dGhZRmppaDBWRkJBUDhZ?=
 =?utf-8?Q?4kc8ySocIJDqKgx74s8Z4C3rMRAIJ+8CTVpW4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDBlc3N4UmViSDRkVkcxaExIR1FNd3N3anpzMVVNQ2ZXVXlMeDl5SjFWTXFW?=
 =?utf-8?B?NGhmRUJkckNKb1BlWUtWZm5VaHJnSVo1RnVTSUg1NERjTm5uaTVHWUFIM05I?=
 =?utf-8?B?dVZFWS9vT01vVFdPblg0MFZpVytvbXFrUWdlRUNVTWNOSmwwOXNwdDNkNERN?=
 =?utf-8?B?U3JGMjVTcHlOUGRVcDRaRHlWZUJOSGc3VjhRdE1Bd2JxUks0cEJKbDEyWHlk?=
 =?utf-8?B?eER3N3RZb0xzaDNIcmFaOFlGcldCc0ZONDlyQ3dodlZId2o1Y2FCcHZ4U0VB?=
 =?utf-8?B?cVFJWllLQlIyRisvTHBlUy9aYTVXdXZhOXd3UVgwN2JRb3NGR2FGTm9CU21E?=
 =?utf-8?B?SlR6VEV0bSszTjg1STA5cXAvU2I1WXRRaHlGS0Y5TlpPOXRWUVRqV2JnWElK?=
 =?utf-8?B?Q1F0bEZLQUxWVUo3WlJLaDBQRWRFSlgySGlpVUFLa0tUdFk0cW1pWVVvZ2Rr?=
 =?utf-8?B?RHE0Um1WV1hIQlF4WEk1UVozK0FVcXR2L1JxbUl3cS9sZ0FPWjJWck8wMEFq?=
 =?utf-8?B?WjZMNm93MjRnMFB3cFJQNXZ0OUxZVzhQZS96SzJpUmhVNExDaG9jK3g2VlFt?=
 =?utf-8?B?STVrR0pQZk1GejBySWYwYTI5R1A0SE5WYTQ4WWc3WVl0QlcvcjNFL2wzejda?=
 =?utf-8?B?d1JVSDhyNjhFQXZSeWxZeHlLenpUN3NGRFlickJGd20rNDNMMml3S0ZVSTlz?=
 =?utf-8?B?UU1xK0VzM2l2V3VLNXc0aWthRGQrRVV4YmNwaS9JTmVqdVhPbCtxNGFoQ2Vk?=
 =?utf-8?B?R2RpcERYcW4yc2VUN0d0d0RyRXBzdTYzQmJXeXRobFMvVmpYRjNRSUJWN202?=
 =?utf-8?B?ZkhoTU9sSE9IR3lDT1lrODk5dmdhb1FBL2RUZFpZak9ib01WME1vTWptZzdF?=
 =?utf-8?B?UUk2OVNzZTZqaVhseWpLNWlCeVRMdVhxc1hNZ2hsUG13N2hsUXA3K1hncnZT?=
 =?utf-8?B?NlV3SG9iQ1N1WFBVZ0FIQ1ZDa1ovM0NDRHZUcCtDQTFCNHlyWGhZWTV2dUlj?=
 =?utf-8?B?QUZZMk1TQ1BVT0pHdUtReW1zQlFJQUFJR2ZFVmVpNnB0empzakVBeTAvODdv?=
 =?utf-8?B?QlpHeWd1N09NcDBPVHNwYysyenBtUWdweC9RN25KREVvYUlBci9Vamh3R3hh?=
 =?utf-8?B?b2s2VWlhOGJXN2xtaWhEUW13dE0zRnlJaTVlOHJ6a0VPcVlsWkgvQlN6NDZM?=
 =?utf-8?B?WVZLdHNHRitjcVhWQk96L3dwZ0xMYnhsRTFaZGthZElwb0FCOHVoSFlma3VU?=
 =?utf-8?B?ei9CMHhqemlHSHdtM0p0ZHBDbGZrQ1FZZ1g2Z0JKWEFpbXJVYzVBZ25aTmxL?=
 =?utf-8?B?K1FEREZzU3VrdWRNVVN4aS9SY1BIQ2dqSjR6SGxnMkVHNDYza2p3MmJyanMy?=
 =?utf-8?B?R1NScWhHellsM3JqWVpyYXJwY3NBWGpSZzdkeU01NG5yY1BQeklUYVgvRHFI?=
 =?utf-8?B?YjNSbkdUblE5T055c1J3dHExUVBRTExPSjcyNkVBL0lPdFlHZ3lYdmg0cVdo?=
 =?utf-8?B?NWRGRWttNXgvQWExWUxZSDg3eWcvZ0V2WHBCa3ZaY3VER2dCOUdxR2FvdkNp?=
 =?utf-8?B?Tk4vcmxxaUh6cFphbHdJOFJmRjZEREtkeHB4VDV6T1FCa2laWUxMNEh3emFs?=
 =?utf-8?B?R3VuS2xONDhKWmFEbjJzcE14c1ZxcjI3MnpkQUNzY0RJMmFmanhQK3Zna3FS?=
 =?utf-8?B?cFFWb2daVUlzb0QyK1IwZnc1aGpEakh4eG1ISkVZUmVDRnl0b0FlZEVmR0RP?=
 =?utf-8?B?dW81OXBna3hiZHZjWXZiL29OR1dTbTU2MHhnaDF2bHZwM3cwT3JpVnpNY2U1?=
 =?utf-8?B?M1Jid0Zic2hxdVFIZnNFaUhnaldCem9YV3F2cTErTTBRVGV5Y2MrMUdxNUdy?=
 =?utf-8?B?QWorTmZFelFPOU1OMmcyZWcvR0dXNG1QMnZPcDQ1K2RPYVIrQ3pYVjhQQW00?=
 =?utf-8?B?blZNdXd0K1RPMW5lQW9JYWRFY1BLclhremY2RGRxaG44eCtJZVB2QjRzT2lS?=
 =?utf-8?B?RVBQMXZZdHUxbTZndDZYYVdjbnd4cmlwWUo5QW54dUdpNVl5aytPSFFoa0pW?=
 =?utf-8?B?Nk1LQ3R4b2oyVjhwWDJjbWFtRjV2bVd6U2JpZ2NsR1ZTMWZBbUJhVDl5NDZv?=
 =?utf-8?Q?P0mCqAtkNp3Gk9+9VMJ2dpCsy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E31FF77935FAC4EB08C5D90842EB15A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa52c6e-019b-4ca7-f875-08dcf1a7352d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 08:06:03.3441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rel/GV+TAb0lbhdI7k5HWk4oL3lKSDzEG9LOcyBie4lKvYUJiLjTsS5jS/Ma1/5yY3S5opGTZWfbeO51oqA3TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7725
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_010616_448402_373FD8FF 
X-CRM114-Status: GOOD (  17.19  )
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

T24gVGh1LCAyMDI0LTEwLTE3IGF0IDExOjIwICswMDAwLCBLb25yYWQgQWRhbWN6eWsgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgVGhlIE1UODE4NiBjaGlwIHN1cHBvcnRzIDM1LWJpdCBwaHlzaWNh
bCBhZGRyZXNzZXMgaW4gcGFnZSB0YWJsZQ0KPiBbMV0uDQo+IFNldCB0aGlzIHBsYXRmb3JtIGZs
YWcuDQo+IA0KPiBbMV0gTVQ4MTg2R19BcHBsaWNhdGlvbiBQcm9jZXNzb3IgRnVuY3Rpb25hbCBT
cGVjaWZpY2F0aW9uX3YxLjANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBBZGFtY3p5ayA8
a29ucmFkYUBnb29nbGUuY29tPg0KDQpSZXZpZXdlZC1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRp
YXRlay5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2lvbW11L210a19pb21tdS5jIHwgMiArLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvbXRr
X2lvbW11LmMNCj4gaW5kZXggNmEyNzA3ZmU3YTc4Li5jNDUzMTNjNDNiOWUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gKysrIGIvZHJpdmVycy9pb21tdS9tdGtf
aW9tbXUuYw0KPiBAQCAtMTU5OSw3ICsxNTk5LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGlu
dA0KPiBtdDgxODZfbGFyYl9yZWdpb25fbXNrW01UODE5Ml9NVUxUSV9SRUdJT05fTlJfTUFYXVtN
VEsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2lvbW11X3BsYXRfZGF0YSBtdDgxODZfZGF0
YV9tbSA9IHsNCj4gIC5tNHVfcGxhdCAgICAgICA9IE00VV9NVDgxODYsDQo+ICAuZmxhZ3MgICAg
ICAgICAgPSBIQVNfQkNMSyB8IEhBU19TVUJfQ09NTV8yQklUUyB8IE9VVF9PUkRFUl9XUl9FTiB8
DQo+IC0gIFdSX1RIUk9UX0VOIHwgSU9WQV8zNF9FTiB8IE1US19JT01NVV9UWVBFX01NLA0KPiAr
ICBXUl9USFJPVF9FTiB8IElPVkFfMzRfRU4gfCBNVEtfSU9NTVVfVFlQRV9NTSB8IFBHVEFCTEVf
UEFfMzVfRU4sDQo+ICAubGFyYmlkX3JlbWFwICAgPSB7ezB9LCB7MSwgTVRLX0lOVkFMSURfTEFS
QklELCA4fSwgezR9LCB7N30sIHsyfSwNCj4gezksIDExLCAxOSwgMjB9LA0KPiAgICAge01US19J
TlZBTElEX0xBUkJJRCwgMTQsIDE2fSwNCj4gICAgIHtNVEtfSU5WQUxJRF9MQVJCSUQsIDEzLCBN
VEtfSU5WQUxJRF9MQVJCSUQsIDE3fX0sDQo+IC0tIA0KPiAyLjQ3LjAuMTA1LmcwN2FjMjE0OTUy
LWdvb2cNCj4gDQo=

