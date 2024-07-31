Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06449C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjGwjyc6fxPrzbkc4sE/Ch8gMirbK3Ou/U9LdoAyKPU=; b=WcpzFlIQ5jD6oirme9uQ+eN+QL
	dvxHj21ig4of4q4zkzWVgruWikv7vwJarvcs2tXjPeBKLljwi3b9x8z5aM+zrhFaqTg2Z0mkXMv3u
	L+KTuvh1vNxsjWJFgwyqt/iwzJADHSHP77Z8C0KLty37LCP6+a0/e0smgocBjtOkaGUHSIbZ1B03e
	cwO8HdGCvB2HG6cDFJbGZj0IBnff10ZeLC567BMZG2jnxOMhr5JqFZw2+u5LvuR5Snj5LXtSKcYXq
	vdSYsfT3zDUB5JHe23L18L6F81wtQIAZ+zafSPQC+Mrvi1fguW7n783aO4h5CXbnpwY9drutP5zU+
	2sxXP63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9ae-00000001LDV-1gRL;
	Wed, 31 Jul 2024 13:42:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9Zw-00000001L0h-03g7;
	Wed, 31 Jul 2024 13:41:21 +0000
X-UUID: 8f7dc7764f4211ef955bff358274dad2-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZjGwjyc6fxPrzbkc4sE/Ch8gMirbK3Ou/U9LdoAyKPU=;
	b=migSppYJDCcBQO0kqKVXjiW/PXm8Yzn05rGqcxV6nKpBlP7yhxNtol2DWDVk5iomn59O+l/oMUyEh+OtT4//CDS547i0SFw4tRCa6+EYqeZEnnz9zQUo9SRerNJ09ujT3+KpHq4Ro6YCnffkWrSDdofWTrlCik5wC6sq9CQlKus=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2ad17a3d-1e78-4c96-b45b-a5b5ed0d605c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:160e20d2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8f7dc7764f4211ef955bff358274dad2-20240731
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1209164804; Wed, 31 Jul 2024 06:41:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 21:41:13 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 21:41:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J79ZH6uZ8/TLNB2RRvMdyDlJjgOWAtWfHWj9M5wW1Fm9x7vv7xH/sVcYKpWELdRaHJ0OMQ9JVMBDbiMuhWqIMAk/wSbUnpT83E068O1TH4ieeB3+pOao7lRt2e1jZ0oLhVjar1G8YBSIIl5cHdTyd/z8tCXFSeV/y7GT7ur4Fd2OzS8emhqZ0gzB3/+0e9y8ODJdJKqzZlE25vFzS3HoDW5SLkU80x6B77f1rleqefSFtOnsxSI/LTK7ijrPDv9T/CAkyY9qiNeIhK5BmURaVn4r4imjpAxHCFE1YLOFgTvBejwk0Htoqdxj8AioeIqJc7trCOumxK9nWxhps+SH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjGwjyc6fxPrzbkc4sE/Ch8gMirbK3Ou/U9LdoAyKPU=;
 b=xvkZl0GZ998pxccg3cHvu7MEBhY3FYc4IjsIoO4n70TJv8y5W2vWAanbBUM93F5IuXdKk2fwQv5Es9p/WZum8LUYlcZkdrV83wZEqmQnxX+NoQmJi7NbqnRFSxySmC7srX2KcsuZcqWi2NQl9WhbqJF7aq9oVPSxpwsaB7IXIdYJNZ41P92vsR8fLmo+kmhcSDRMm//d66OPR0XaP3XsSUKOwNin5j07DK6f2JLq+IG7S7TXB7RS+1ocSdQw8lgQSYF5PiV+ptUxseZoGBwmVTyqQMF5e1wHr14RrWj/jdKtHFi0J/VgBjKTO5NkgnxAumtZWDqi/NG0QDMcjPFEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjGwjyc6fxPrzbkc4sE/Ch8gMirbK3Ou/U9LdoAyKPU=;
 b=OOIffItJQ6m0vsGUIvqFaxrYaPUh8Nu9pRV3UHmFkQNOAIxuoeum01TZ3xNLauy77o6ijzaRNGtfPXFypdCr4G+QmyLR3nGofKhanl76QCRwwMliKAbtbYUoHYWWY1buxsxmJfoQstMpFWIJhCkOcwfTqsHBb1pBcNYY1gMQIKg=
Received: from KL1PR03MB5835.apcprd03.prod.outlook.com (2603:1096:820:80::12)
 by SEYPR03MB7021.apcprd03.prod.outlook.com (2603:1096:101:df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 13:41:10 +0000
Received: from KL1PR03MB5835.apcprd03.prod.outlook.com
 ([fe80::e06b:e5ff:d96c:f9c1]) by KL1PR03MB5835.apcprd03.prod.outlook.com
 ([fe80::e06b:e5ff:d96c:f9c1%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 13:41:10 +0000
From: =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?= <Shun-Yi.Wang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "andersson@kernel.org" <andersson@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Support multiple reserved
 memory regions
Thread-Topic: [PATCH v2 1/2] dt-bindings: remoteproc: Support multiple
 reserved memory regions
Thread-Index: AQHa40PUdWKuHY0ix0m3F8MLdRxc1LIQxzSAgAAQ3YA=
Date: Wed, 31 Jul 2024 13:41:10 +0000
Message-ID: <6163500e4457715e04d520b7287517acf2ab1dc7.camel@mediatek.com>
References: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
	 <20240731121730.1196-2-shun-yi.wang@mediatek.com>
	 <daadc099-4c07-4dda-9caa-662583629cde@kernel.org>
In-Reply-To: <daadc099-4c07-4dda-9caa-662583629cde@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5835:EE_|SEYPR03MB7021:EE_
x-ms-office365-filtering-correlation-id: 26f12526-0b76-4a45-afb3-08dcb1667041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q05lTkdUeE9iY3I3OHFYN2tXOHF1eHJadXFQMjJZN3daZnFvZzhZeHozMmEy?=
 =?utf-8?B?dGExSDcrSWtYVndCcUtKN0FSdlAzQXlBbkEwYlpZdTgralpPVGZ1OTJrNEFY?=
 =?utf-8?B?WGxSekw4VjgzRzFqVW1BZzFTemxMS1JLSEFNa05ka01lZ1ppelZBMTlpSjgw?=
 =?utf-8?B?d1Bmb3l6ZHZkMHZFSUlhcUlFSGYxczNtaXBPMm9Vb3RpWm5icEtHdXZTMS93?=
 =?utf-8?B?bUVCdFJ0bFZHTnIwcWFYbUtIY1BSUXduSnRJbHV4K3cydThXM1Q0bDlzcWVv?=
 =?utf-8?B?b2lrRVJ0VVNJakV3NHRtc25xYzdmK25NZWxoNXJWR0RJWlVCeEliVUdBblRR?=
 =?utf-8?B?VUoyek5nYjBmWHBKd3hlem81T3V2OXVMQUxOZVZDdHNLOEFHaGt2dFdhN21I?=
 =?utf-8?B?UFFDTStVUFJTbExCK0ZRN3J1Uzl1dXR4STdpbXhIaTJBeDdwNkdFMTV1azZF?=
 =?utf-8?B?WmRNNnZwbXJYdTU2S3phRDVXQWpuSE9NVHVDNnJPZHpWMjVTb3JDNnBqTXNY?=
 =?utf-8?B?SHZ1ZGpUbk85V3dsU2FHSmtXaEJBcFJrd3AvQnZocTZ3NFl4N3Npa1l0cCtB?=
 =?utf-8?B?SDR1V2kySk1uRVpHU3Z6MEVzeW42N2Z2Y3BmQXF5RVdxdGdlN1V4OFJicnNY?=
 =?utf-8?B?ekNuVTVEaUg5bzIxSllsZzZTMFQySVVhYXhOcUFpb0ZoendVOThBVlZybHJo?=
 =?utf-8?B?S3hGRllEdEV0OU1HNGpmQnJDcXhlUWVwYUxnMzFXSUwvQnJGWU53bUExaHA0?=
 =?utf-8?B?NG8xcUp3SVRoY0JrMW1idmxFM3FIUGptWTVkZmwvYkoxRlR1Q1Fac2txdFV4?=
 =?utf-8?B?Y0xKSmgvZjJwUG5obWIrR2ZSdzZIV29IOGRlRWVqazR0L3QySStXNmxNVjk2?=
 =?utf-8?B?UkkzTFJ4MTlET20rdVk4R3ZkNlNKNGJ4N0ZQeEhoVTZ1dDk1a0VJeW91aUYw?=
 =?utf-8?B?YUs3NVRZNmFXek1ZaWVnVXpYNmpUSnNubmhwamJTMTZIaWluQ3pmZlUvckUr?=
 =?utf-8?B?UnM3MzM0Nkt5cFdvckdwd2k1b1ZQcW9ONjA2dnlFUlN1aFRXMXVlSXRYMEJ4?=
 =?utf-8?B?UWYwcmtBaXlKOW5hK0M2RW1GN0lEZFh3SU94RkdHcmVQSnJ4UURZNW11akhE?=
 =?utf-8?B?K21XNU9WL29sV0N4c0hNOE0wTGY3aWVXQVpVNStuRG95d21CemhaOFl0YmVJ?=
 =?utf-8?B?S0tnbE9tUW1ROTdXT0VBWU83SlhTMll1N3VzSWZ0RFZCd2x2QXlGNTBBUS9M?=
 =?utf-8?B?VWQxMUVYcm1WRjNkUzhwQjYxMlMySmZ4YThsM3BESUphWVJwNlRqNGkvWnhW?=
 =?utf-8?B?NzNXbkZpakNFTkdsN2Y2TVc3c1AwWGt5dmJjRmFWNDJHbW5QYml0RTQ2RWVv?=
 =?utf-8?B?L0o4RmFNUGFoMGExMXBrSXFpeWlpdU5XZmEvZXN5ZzdXczh2US9LRmNaMTRQ?=
 =?utf-8?B?ejhQQ1lBU1puVEV4ekt0ZEphb0ErQ0dybEZrSllFZ3UyRnNQamtUQUhSUmhP?=
 =?utf-8?B?N0FDMk1mK0Q3TTZKMVdkU0lYSFNBTm9ROWd4UzNCcUlTTU5mSlIvRFdFVzZM?=
 =?utf-8?B?enkydTVVNkJ6dEpYclhFRFZ5Q1pPMmJPaEo4SlgwRmY0aWRvTFlYQiswejU0?=
 =?utf-8?B?eTN3YVZwU2ZkMXYyT0RmMG1pZDQzV0l3bkJPWU5kb0txa2VFenRoL1R2aTNO?=
 =?utf-8?B?VTRuaC8rcEFFdkkrd0ZjQmMwT2kvRWtrV3Nmb1Z5SjljbXpWRmxDVlZkSHl6?=
 =?utf-8?B?NVk0KzRoQjgxQWs2b2Zwak9odVVNU1VxUUJqSlBaNSt4SlBLTUdWdTlOVVp0?=
 =?utf-8?B?dXF1dTNPa0lydXY5V1YwTC9XNFc2ZzJVS0dFSzFUU1BzSDdVamNvY0hyVEJk?=
 =?utf-8?B?a2RSaGVXWmppMzVZMHhRUnRrUTNrZGk2bVpUQ1hRbXRtY1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5835.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YW51cXhzYkpoWDVCMzdWa0xLaE4xdmVRMkRVSDZnVndXajhFUlgvaHdENWIz?=
 =?utf-8?B?eU1aMEN1d2NDR2RuUk5EY1BXNC9yN0oySzUwYTliTjE0WE53UTZVU3k3WEtz?=
 =?utf-8?B?dm1UWU5GYzZ5emVYWlZKbEE1MTBZWXJENURjTE9rZVJBNVNJbExxVHFFNmtu?=
 =?utf-8?B?ekhYWjBkNzhVTW5mNmZ4TVhHVk5iN2Z3TkN2eUlvRFBidEdDdWo5M29KM3RC?=
 =?utf-8?B?S1VCSTFGc2pZRjVyTUQxQWVPaGpzQmtoNURKMk82SkI1STVZTzkvTmo1Mmhj?=
 =?utf-8?B?TFUyaFUwN084QUI3RG1kdHc0b1dmREMrWCtkbEFFQzR5allBci9uWDVac2VK?=
 =?utf-8?B?SHY0SkVtdVp3ak13ZjlhNWNDbGRMbTV2UVkxVldiV3ovTytHNFZubHRxcThr?=
 =?utf-8?B?d3lOb2x1SVZheGlVZGhTTFlhdyt4VEVja0dMbVB3eVVtdWFaNi9Ob0J0eUNt?=
 =?utf-8?B?TjRWSkIrOUh1RTFORlN4S000NDdsTkpjMU1XVEhRa3RjcjhHbm56MUFJcVZm?=
 =?utf-8?B?eC96MDlwVCtKNlFpYnh2ZEVzRVpaWUxJaE4xUGZRYlF1OVN6b0lpdmxWeUlO?=
 =?utf-8?B?eEt4eWlLYXRpZmx5Tnp3UG9kTFNRM2o3Z1dnTm4zSlNKaGFjeUJLSk4wU0k4?=
 =?utf-8?B?aVBKWFpxZ3FESTZWREFpY253OTJQRTg0RnBsUzVUQ2JyOHVjNWQ0SUR3OWhl?=
 =?utf-8?B?SEF3dlZ3cG1ZWEpTRnB2cmJQcTFPb0NsdkFzTytuK1l5bFN0N1dyYysrNERk?=
 =?utf-8?B?MXJVMmJpNE9oay9sOWliamd5MWJwSDVKUTQyMXRRbDM3ODluL0ErUUtCbmd5?=
 =?utf-8?B?Z09FeVVMaDR4cGFyMCs4THBhZmgwNDNxbDlCMDV4MVgxamtjdFpJRVN0K2I4?=
 =?utf-8?B?cjNoSGV5RHpLTVdFVUdDLzBKby9jVlRFcEpaL0VmU2twSWd6UW94WVR5UlBB?=
 =?utf-8?B?MmF2MGMrUWpnZ3A3YzN0MklkZklBbmtua1piaDg4YjVWNjZOSHhXdkNYVm1M?=
 =?utf-8?B?MVg3MHZzbUJQWFJmSXNCN1FCZmN1eU9CSXIvWnVBZmtHY0h2eUZjTFQrZi9M?=
 =?utf-8?B?QWlGYzZSeGJPaGI3ajdsc25vMkRtd1d0OWxpcVdpaURKUHpDQnF4SXdtWEZZ?=
 =?utf-8?B?Sm1RM3BKM09yQnVDb0JJVHk0STBUQWUyQ2VNZVM0Q0JwZmIvUDV4YmxINGJZ?=
 =?utf-8?B?d05ad3MzYnZzSy9Qd0RmTm4reXljTG9ITmk4UDY5ck1abHA5MDZDZXc3RWMz?=
 =?utf-8?B?bzg0TitFNHc5enVmUm4xalpFRXppOFk4OXZoTWFORUZkRkQ4OGRsQlNpWEZQ?=
 =?utf-8?B?VzQ5akRPL016aW81LzFwRmUzUGlVaXhHNnF1MExrNXBMVmE0OUEwUktHUnZZ?=
 =?utf-8?B?eVhHNUlxcFc5YzRENUc1WWVvemwxcmtFNDBaMlNwUkFMVnd4SWxhVDBuclh0?=
 =?utf-8?B?UHMyOEJSbXcxbnM3Z2VRUnNVQU8wNjZwOERVa1ptTGhBaVIwdkE0K1A3UUlp?=
 =?utf-8?B?TTRMNStlRjhOUTlmK3RFRkhORm9uYnVRN3IvczZ2QTVTS3c1UDVUTzh6Z2RC?=
 =?utf-8?B?K1I0a2Y0TU1WdUl0cW9oWHp5eWtKOExZOG91a0V1M1hPZ080dXNGT3RHOXdC?=
 =?utf-8?B?Um85L1BWZHVtTDBmVVZzZitpM1NydllVV2V6bk9ldVMxM3FKeXBLUGc0b0ps?=
 =?utf-8?B?NzNBME4rWjNXOW1uUnFabXMyM0RSRk9hbXU1c2NoZGhDWVRNVTJaaWNyTm5R?=
 =?utf-8?B?L0Zvc2VuY0pudWN2YkF2WUlGTDVQNURSNWcwTWdnbkJWQnhIcFBCaU5mM3Rk?=
 =?utf-8?B?UEJQMWtISGt5dXRvdTBCaHU4ekREM2d2aVNScFROeU1xVjdodTVZRkNBbUZV?=
 =?utf-8?B?ZVpFM0dUeEdTTk1QM3c5Rjc2N0ViT2lGeXhhc1U0KzBNdVd6Y0JWcmJRR2xr?=
 =?utf-8?B?Q2NsNmkza2tkdTdRdkt1UjgzWmJCZFpDVzd5clhvL2dzTUtPZDdjTUpZbzJH?=
 =?utf-8?B?Z2JLVUZjMGtrejF1UEYzTWdOY0RaMThtMEhyN3grRXBTRlJPcFpJZlJnSktI?=
 =?utf-8?B?a1BGaFhkbUZIM215MjFRT2VaUSt2Z0E0UFl5VjFzcWx0aHdFVXBRMWpQUEFW?=
 =?utf-8?B?aC9uZzI4WitLUlpRWUpyY2txMGNwa3NKbHZPNmJ3dm9Ldy9ZY0drcnRpa1Jl?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7DDC4D5745DD741A06F37AADA951203@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5835.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f12526-0b76-4a45-afb3-08dcb1667041
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 13:41:10.7623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cbf5Auj2s0EJ9fboDBDjg7ntMzKvZK9PmvNJZNhCfU/P7SNS26ehKobLIJwkmN/RY2gdtyAHDbxTE4EdrimzSDg8AduRno7RiSw1U2yJHeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_064120_092181_A58B801B 
X-CRM114-Status: GOOD (  24.92  )
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBXZWQsIDIwMjQt
MDctMzEgYXQgMTQ6NDAgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgT24gMzEvMDcvMjAyNCAxNDoxNywgU2h1bi15aSBXYW5nIHdyb3RlOg0KPiA+IEZy
b206ICJzaHVuLXlpLndhbmciIDxzaHVuLXlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+
IFJlbW92ZSB0aGUgbWF4aW11bSBudW1iZXIgb2YgMSBmb3IgbWVtb3J5IHJlZ2lvbnMuDQo+IA0K
PiBXaHk/DQo+IA0KDQpGb3IgZnV0dXJlIGFwcGxpY2F0aW9ucywgTVRLIFNDUCB3aWxsIHJlc2Vy
dmUgbXVsdGlwbGUgcmVnaW9ucyBmb3INCnNwZWNpZmljIGhhcmR3YXJlIHVzZS4NCg0KPiA+IElu
c3RlYWQsIGFkZCBzb21lIGRlc2NyaXB0aW9ucyB0byBlbnN1cmUgdGhlIGludGVncml0eQ0KPiA+
IG9mIHRoZSBkb2N1bWVudGF0aW9uLg0KPiANCj4gV2hhdD8gSG93IGlzIHRoaXMgcmVsYXRlZD8N
Cj4gDQoNCk15IG9yaWdpbmFsIHRoaW5raW5nIHdhcyB0byBrZWVwIHRoZSBtZW1vcnktcmVnaW9u
IG9wdGlvbi4NCkJ1dCBjdXJyZW50bHksIHRoZXJlIGlzIG5vIG1heGltdW0gdmFsdWUgbGltaXRh
dGlvbiwgc28gSQ0KYWRkIHNvbWUgZGVzY3JpcHRpb24uIFNob3VsZCBJIGp1c3QgZHJvcCB0aGUg
ZGVzY3JpcHRpb24gZGlyZWN0bHk/DQoNCkJlc3QgcmVnYXJkcywNClNodW4teWkNCg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IHNodW4teWkud2FuZyA8c2h1bi15aS53YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90
ZXByb2MvbXRrLHNjcC55YW1sIHwgOA0KPiArKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGss
c2NwLnlhbWwNCj4gPiBpbmRleCBkMDVkMTU2M2VjMTkuLjMzNjJjOGZmZGNjYyAxMDA2NDQNCj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGss
c2NwLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVt
b3RlcHJvYy9tdGssc2NwLnlhbWwNCj4gPiBAQCAtNTUsNyArNTUsOSBAQCBwcm9wZXJ0aWVzOg0K
PiA+ICAgICAgICBpbml0aWFsaXppbmcgU0NQLg0KPiA+ICANCj4gPiAgICBtZW1vcnktcmVnaW9u
Og0KPiA+IC0gICAgbWF4SXRlbXM6IDENCj4gDQo+IE5vLCBubywgbm8uIEJpbmRpbmdzIG11c3Qg
YmUgc3BlY2lmaWMvY29uc3RyYWludGVkLg0KPiANCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+
ICsgICAgICBMaXN0IG9mIHBoYW5kbGVzIHRvIHRoZSByZXNlcnZlZCBtZW1vcnkgbm9kZXMgdXNl
ZCBieQ0KPiA+ICsgICAgICByZW1vdGVwcm9jIGRldmljZXMuDQo+IA0KPiBObywgZHJvcCwgaXQn
cyBlbnRpcmVseSByZWR1bmRhbnQgYW5kIHBvaW50bGVzcy4gWW91IGRpZCBub3QgYWRkIGFueQ0K
PiBuZXcNCj4gaW5mb3JtYXRpb24uIFRoaXMgaXMgYWx3YXlzIGEgbGlzdCwgYWx3YXlzIHBoYW5k
bGVzIGFuZCBhbHdheXMNCj4gcmVzZXJ2ZWQNCj4gbWVtb3J5IHJlZ2lvbnMuIFNvIHdoYXQgZG9l
cyBpdCBicmluZz8NCj4gDQo+IFBsZWFzZSBkbyBub3QgdXBzdHJlYW0gcmFuZG9tIGp1bmsgZnJv
bSB5b3VyIGRvd25zdHJlYW0ga2VybmVsLiA6KA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCj4gDQo=

