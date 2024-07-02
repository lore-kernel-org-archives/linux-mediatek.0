Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA720C2BD09
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 01:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfXpMvF/x+EGTgQQUu7/S+XirRXpGMyZWut+pXzaMNo=; b=v7U+0x45/CiT2PD97vFBYu6bl/
	fPQWNb+LP/A50/Bf6bEitEzr11uNRWVfSY1CxEt3HGd1zTHxwbfPIMxfZIq0/fOeUobQdXKOw8qCJ
	Ksg6+VVcxmdD0h29OzQ6ZAK3k/N0iE91BptK9vVpRz++zc/E44qzAErZhrjrBNS6i7hgFKzBZ9DtW
	6nZgA9mYEJ9fZ9SIp2KLL7p78uJx1qnWBJWtxfKkMGjayK49ndEBaZIuRYIqO5XDr6xoicFkBal0p
	uUPdztDNPzfu4k1U181+4ziJbaNuHg3aYG90ue8ZmiX7N9nzUxdzExR/aBrIIv/TWuq67qUBX0NKY
	OAb4gDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSnZ-00000005JEZ-2Ram;
	Tue, 02 Jul 2024 01:59:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSnM-00000005JD7-2VKc;
	Tue, 02 Jul 2024 01:59:02 +0000
X-UUID: a34fbcf2381611efb2966dae1f787272-20240701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=HfXpMvF/x+EGTgQQUu7/S+XirRXpGMyZWut+pXzaMNo=;
	b=AQKa5SDPoh1WaIaUdCo0oRmNbYl/4tw02DlpsZ8N4g5k+9v5K2nKpEPuOCb67nmlF5KeV3YZjVHGq6+uXe6ix3b1yn+AmoXBJTGbhGNdbPPoykmZyRJ1YhcLPi70vQXM/68xZAc/8EDICVn4Y8mHMgfq+f9DkknmvhhjyN96+ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:0c7dcb94-7a15-4bc2-ab32-6e5466213dda,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:843df9d0-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a34fbcf2381611efb2966dae1f787272-20240701
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1696402280; Mon, 01 Jul 2024 18:58:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 1 Jul 2024 18:58:18 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jul 2024 09:58:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy3XZFhyJlzIbB81pHfjgnjHziZxtPjlAIG7Kr9BWKAHcHaEX5ie3HkLg+gCTGOhxkqfrOQiPOyUks6QLCjayHy6pwxaISVlD/XOsmofBAz+RM1AxKzfXavyKZQCX8LpjXPpyskXyopZ0TrmweQvrXbeIRM4JornR63FqKd1dB6Mj1/6eWTBmZpEbyH7gXvniSEP3Z88oFHcKOAJVU1dXW6LfKVzfsLRu374iraHwZ7KlRra+kliZlltM6Z6qc441iOCjRjSKUx1FCAcbRBeX7iIzvrC+TaKitiT+lVoceotUWhcESTUtvsgEW9GAmgvoTjn98LaeC9enT2a4N2s0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXpMvF/x+EGTgQQUu7/S+XirRXpGMyZWut+pXzaMNo=;
 b=idXiQRD/NqGGpA875nnKKActUwIVGUTRWU+bqnXXw3tGBCvEIdh1kBU6OR41fIlK5hgBZAzbWdx7pXgnAGM56+rHKnWx+4Tj6HPN8r0COmrIbVX9k4Qv9x2LVQU9fHIzhQxDwBN1+YFyCLamhFv44ERaobx5Hzl0Q3ZjSAFIQHgdYPAv/9UZ5Theyt2tfCK4ufHtS78HOcU+Jnmzfz4+x87BSh46acxO2Mrntpxuot2ur4HDaEY83VFc+z1dMafQFakaIB/6WjGk82ZowIvqXqGvPwZUDgSHBSSIE/L1uWiyWtsCzatjR+3Mj5pCuNyrHw26HsuuPC51zG0yZ7nS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXpMvF/x+EGTgQQUu7/S+XirRXpGMyZWut+pXzaMNo=;
 b=G83sKqGFwkLJLs03eybqM1DBLpVO+qFLiZbG1oM9zineG+xyGrL6UaS6e7i4NG/dDHVdzYMUFmmsxSES66e9kRcJstSwyeU/G7y8qLVFiJOc22BRg9QVz7dh5GDNOCmaU1noQju20LjlFWmckMTnm7JfcSC39Du7Z0u70mZayQE=
Received: from KL1PR03MB7622.apcprd03.prod.outlook.com (2603:1096:820:ea::13)
 by TYSPR03MB7351.apcprd03.prod.outlook.com (2603:1096:400:410::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 01:58:16 +0000
Received: from KL1PR03MB7622.apcprd03.prod.outlook.com
 ([fe80::43fc:dde1:1c4f:66c8]) by KL1PR03MB7622.apcprd03.prod.outlook.com
 ([fe80::43fc:dde1:1c4f:66c8%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 01:58:15 +0000
From: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Wang
	<Sean.Wang@mediatek.com>, "zajec5@gmail.com" <zajec5@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?=
	<Yu-chang.Lee@mediatek.com>, =?utf-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
	<fan.chen@mediatek.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
Subject: Re: Duplicated bindings for mediatek,mt8173-scpsys
Thread-Topic: Duplicated bindings for mediatek,mt8173-scpsys
Thread-Index: AQHayTDQMcyJIXzjQEqDCWGzw9JOqrHitDcA
Date: Tue, 2 Jul 2024 01:58:15 +0000
Message-ID: <faa4a9a8a3f0416f3e2ebe5ecf3b3afff5f490d1.camel@mediatek.com>
References: <7614ed44-7613-4912-9b4b-62c92abbc9bd@gmail.com>
In-Reply-To: <7614ed44-7613-4912-9b4b-62c92abbc9bd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7622:EE_|TYSPR03MB7351:EE_
x-ms-office365-filtering-correlation-id: 6f369b3e-7f68-41c1-7523-08dc9a3a6fcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VGpnRzNINFQ0Q2hSVlIyYlJsWnpGdWU2NENNcHJPYlZvVDFGTG8ySVVneGdU?=
 =?utf-8?B?VGlTTFNFTlhQN1piQmIwMG9jRm03TmdxenJCUWxRa2R0RmVxc0Qwb3N3S1d5?=
 =?utf-8?B?b0VDKzNLSGhHWHhkOU1BS1NzbzBQL1dpVVJXODdhZVQ3Y21LOHVaYlVEd0dj?=
 =?utf-8?B?N1RETTNRclAxUUQ0cUZRSEd4SjlidjhSUnBNNkNwei9XVVR4cEF0WWJKMktI?=
 =?utf-8?B?RXoyR2MwWnEwWC9kTDQrUnEvaEVNUmZnNkIzZ1A0M2tGaHJyOEczWmJBekVm?=
 =?utf-8?B?YlNYVktkWmFvVDd3VWpJaElQejdwT2ZMMXRuRXdQVjViMlF5SHRWekJ4OGti?=
 =?utf-8?B?Wi8yKzJkR3krR3d4amQxL0lDS1NvT3J2c3ZneS9YaGNXanpWWkdTdlBHUzBK?=
 =?utf-8?B?WmxTOXpGZTdDQk5lWDdCSFFRUHNPVmY1RWRNYnJOK3I0RS95U3NGSjF0S1Y0?=
 =?utf-8?B?WFZaSnRLWXJYSkJEZlBQYVFmRUcveUw2dkJSNE10ZWhCNkY4YWx2R00vUXVU?=
 =?utf-8?B?d1NVV0ZIU2ozRmdiVGE2b3hQaHpuVTlyVjFJUzUrZEUweTdUU3g5YnUwKzlu?=
 =?utf-8?B?SE1yYzRzMXpGTWluVzR6MmFGTFA4ZkRucTMzeC8ySGhTaWlhei9BZVZBR1Fn?=
 =?utf-8?B?ZlYyTWc5UzhGRXNqS2tVM1Z6WVhJaEZteHRQWSt5b1B3dGpVL083NXNoL0gy?=
 =?utf-8?B?ck9GalpXOEhzR3ZvMVRXTm9VNFI0dW45ZG1WdXpaY2NNdENISUNrOFdRRUl5?=
 =?utf-8?B?cFZGdXpBQWV4Z2Q3amJQYkE5ZEROTm9Fc3B1Z1NBSHRnZE5aWlJkWGt6elE0?=
 =?utf-8?B?eVVvUVlLdk1qTWRrUWNraWRBalcwWkdoS2JFc1JJRVM5OVYzeUZzZHVaZ2ky?=
 =?utf-8?B?cmFuNnpuOEZpOVh3M0c2cElDUkM4RVMrQ0srTXlaVVJDYnRXNkRKQXEyRlNW?=
 =?utf-8?B?YWdUeUtzaDJNcWFGMFZNSlptWnhnQ2w4S2NnaDIrcGkrVUE4NDVudHVWZEpz?=
 =?utf-8?B?QVczNU9wcEdndjZHQ2Viend1UWpXaVRZOXJkblE2elkyK1pnbldxdm8zeXZ3?=
 =?utf-8?B?dmR1OVdwTDNiQUhPd1NMRDRhNTdnRWZHZDNQR2ZTS2g3R2swL09QNE5XYmRG?=
 =?utf-8?B?UlhCMEkrZWxhTDJ6czZvUEo0ektsUThRbXhiS1dmME5qM05ITEpTMytLMmdK?=
 =?utf-8?B?Vzh5VXJveVJSd2tkL3htemI2SjFwTW1mNlc5S2src0NLK3E4M2wxcWFQWUhm?=
 =?utf-8?B?T1QrSDdUa1A4T1BFeVh3UWhJM1RKNG1qbFd1VFpTbzdGWWw4d0FmN0N3ZHhn?=
 =?utf-8?B?ek5NWnZxSXlMWEJtSmRncndHdmFENEJIR2VFVWtPSHkzc3RrS1B5NVBFVTdB?=
 =?utf-8?B?TVdiT0JUREwwQW8yazI2ZFp1VnFGc01OVFIrNENmYzBpVFpVV3ZFTmNDQ1lo?=
 =?utf-8?B?YjBYTzVObm9oZ21IcDhaRG5HY1dPVHhORDB2TG8rUnJDNFdLYWl6OWk1MG5G?=
 =?utf-8?B?b25HNmJNM2h2aExBOVZJQlkxMDgxS3ZFL0R0aUNlT1ZkWW00NWZDb0NiVlk3?=
 =?utf-8?B?V3RpS0xhdGU1djZoV1JCUEdyVjBkNTFJendlOG1sNWZjajBYMzR4cmZERjlH?=
 =?utf-8?B?U05nQlpDdjV5QVJIMERzNGZEdlZKNHIxZzA5UUtKcXVEUDYyVGRKcXdQNWJY?=
 =?utf-8?B?bmpjWDJYVG9iWmxxTCtadldsUkNqUDZxZFpWSEpiSXJZV2FjUGFSSkM0OFNp?=
 =?utf-8?B?b0pJZ0RrNzlYMjRTS0N0TDFic2pVeUtRZXRUS1NNekFpYVV5aVJ5K05pU3ZV?=
 =?utf-8?B?WktwYlBtSkJra1IwcFhtV3FWdVF5UFU1Rjh1blVBQnVTOVpObFB0eHFnbWQ3?=
 =?utf-8?B?Q3hFZUxKVGpmMWduVDg0c2hManNUdEFoY0dlMlE0WDdRMkRVSHl3QUFmQ2xW?=
 =?utf-8?Q?YSsVzG/r5ho=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7622.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWhvMVRpMUdxMVQrRXh4WW5ZUU95NzJ3QVhLK0RJZmhGV3c1MXJGZGtNdEpX?=
 =?utf-8?B?RmI5NTcxWjdYMUFJQVU4dy9Wamh5V3Nqa21lSkNLUDYyMWN0MXc5TWJ4Q2hl?=
 =?utf-8?B?alNKSTRIeG9kRE02YXUxUWNNUC8rSXNOWnNIaVdCZmFYeG9RZzVhaHlOalV6?=
 =?utf-8?B?ODhlbHhkeWxBTkdOYmtSakJCU3lRSEVnNGZwMW5mVXh0a2dRRUxxVThSSXZV?=
 =?utf-8?B?Ui9VNloxSjhkdzVucC8zM0VBQlduL0h1VEVSR0hIUURDckxZc3FhcmFpWlZE?=
 =?utf-8?B?eFEzNCsrU1BGa2Y5YlpVV21IbkhzMlhJemZWYnZNWHdFT3VtODZVcE9RSE5r?=
 =?utf-8?B?czRrSXZkSWlCSENXOFBjV2hrekU4YlNkdVJnc05USFpMSWYrQjh4YTVrNzFM?=
 =?utf-8?B?b0M2MjNsemVEZjdXQVNuVERaUEVIZDkvT0tKS3lzbVUvcGU5bjQ5WDJwcndS?=
 =?utf-8?B?QmNabGZUKzA1V0wyYS90NUl1MUsrQmFaR3R6bVdnTEExcHo5alBwaTNxalRM?=
 =?utf-8?B?Y1F4RGFjUFJ3Wk9zQ000SmdvSjgrNWNLUWJyNmgycnJ2ejB6RXNUbUVJMFk0?=
 =?utf-8?B?QUxkSFdLUENLNy9KUERXSUZVcW04SXVlZUl6NGN4MVp6akh5YlBCQ1NwcTFh?=
 =?utf-8?B?RXI3UVZuYSswQncxMlRVMkhMM3BrdjM1ZmYrVEdSOU9ISnhGS2d2T1huek1m?=
 =?utf-8?B?bjQrRXMxTEJoOWc1K2ZuazBBMll0dmVmMEt3bDA3ajRxaGF2YmxKa1JFM3Vi?=
 =?utf-8?B?KzFqc0YvSnlOamFrR1NzMmtWd0NuMzFCWUpvbE1vQUhudXB5MXNTQUNMVHpp?=
 =?utf-8?B?VUhTSjlYZXFXNm42dGFHakozcVlmSURZL1o0d3U1eGhNcDhyQWtLU1QrZHVS?=
 =?utf-8?B?a05IVGpSZmU5T1Z5SDdwUTVIcTk4VVdhVzRQc3YyaWo2K2xRS3ZPM0dkbnB0?=
 =?utf-8?B?c1hQKy9UK25kV0NJTnNUU3hVbCtwRzE4ZDFrK0g5ZGtqSGlJU1h6YUh3K05z?=
 =?utf-8?B?d2dKSnNGNnBSTUVVM2NZSUtKK2NTSHF2cC9hK2FDVUtmWDdDc0lLQW9FeTE1?=
 =?utf-8?B?eUJrVjhhN2MrSjIzWE5jaEhacUF3TkNuN0VkY1VmR2drbFlhZDNwZm1talZT?=
 =?utf-8?B?OUFlOEx4YzZzMW1aUnBhMkh5SUFzVS9Hb2hTQWtUcFI0OE5JVm1KYnprS3N0?=
 =?utf-8?B?ZUpXMXV4ZXZpaHVIaDFiUytVa1BaYmN6aEkrNnJ6RDRkNklienI4OGlUcWlu?=
 =?utf-8?B?cU03clp1dUtlL2FSYUh0K2VFMGNtT2FubXdaaVlFSVEwRXZ5UitwNFFON3g0?=
 =?utf-8?B?bVhPR0dMZmV3elV3dXRLdDVZRm5ZWUViN25tajJJVjB1eCs4UnMzOCtvTlBz?=
 =?utf-8?B?NDMzSHIvdjM1Z05uVzZuTXk2TjlMWGxwWEdFL3ZOQXhUa0Z4U3Z3UERtV08r?=
 =?utf-8?B?REUrRi9CeFlEUDgwU0tyMCsrWFJkME8rODlWM1VaTzErMFNyUzNpRHdZb29P?=
 =?utf-8?B?UDFNV2NxUVZhKzdzZS9CaFNUNXpnblBLRlJwOVdoVWpSUHNEeTQ2ZlZQdi9u?=
 =?utf-8?B?MjdEMzUyZTMrYnB5TjlqdXQ1R0krMnNZZlpoZkhTY3RrWC9nWDJlaGIrUlh0?=
 =?utf-8?B?NXhGU213UWJYYjJOVlZYS2tScXBaUVNYYkZWcVJWRHRhSlExUUlMOVhtZXZF?=
 =?utf-8?B?SWljNmd1V05wclVuc3Z3MUY3OHlRRHdWSDZJV2h3OGdPYkFGZURrVkhBNFdI?=
 =?utf-8?B?ZHFuRFJnRzM1cHBpWVlVTnViamJDZHJXQ3lYSVI4dUJvRVh3Ump6UVh1R2Mr?=
 =?utf-8?B?SlZjMi9XRm4yazliM0JzS3ZIRUJqWCtVU0hYVHdUQjdaVFNsOFd5bHYyV1Uw?=
 =?utf-8?B?VCtEdDFpbzREd1drdWNTUFZXMXE4NUJXM1Q4UXA0eG5KSFdRV3BRM09jOEFs?=
 =?utf-8?B?enFYZTlhOHlLa2JNYjk2cDZGamY3Mit6Qys5VFV4SkNLZnVzdEJvaDlwOWdR?=
 =?utf-8?B?M2JUeFZxdVJvYnhFS2k5KzVVc1E1RVdyRWlyNGVmRG5YZnplMnRkUGJGRk5M?=
 =?utf-8?B?UDd4c2dTRzd6VDBJUTk2c0JXdXVJK0FEN2d3aWlERFdNVE1qaDBJV0RoSTF3?=
 =?utf-8?B?U0J4eGh3SmhaeUZLSEx0VHpabDVhLzVUYlVHVFl6QUt2MVM5S212YlhnZlNN?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3B2BE967026EC4E89C625F41B4213F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7622.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f369b3e-7f68-41c1-7523-08dc9a3a6fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 01:58:15.3589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8RTdbWJj6M3GI3HRlhxqMmR3tQprqFBs3UMu7QiRM2pngNAhYwMluPoUxJttX4IDtKBHqEAPg31YXroUuoOS14XC+ym+gAl7Y70MIQGO4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_185900_654320_C5B55FBD 
X-CRM114-Status: GOOD (  14.15  )
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

T24gRnJpLCAyMDI0LTA2LTI4IGF0IDA5OjU3ICswMjAwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6
DQo+IEkgbm90aWNlZCB0aGF0ICJtZWRpYXRlayxtdDgxNzMtc2Nwc3lzIiBjb21wYXRpYmxlIGlz
IHNwZWNpZmllZCBpbiB0d28NCj4gcGxhY2VzOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc29jL21lZGlhdGVrL3NjcHN5cy50eHQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9tZWRpYXRlayxtdDgxOTUtc2Nwc3lzLnlhbWwNCj4gDQo+IFRoZSBm
aXJzdCBvbmUgc2VlbXMgdG8gYmUgInJlYWwiIGhhcmR3YXJlIGJsb2NrLiBJdCBhbHNvIGhhcyBh
IExpbnV4DQo+IGRyaXZlciBhdCBkcml2ZXJzL3BtZG9tYWluL21lZGlhdGVrL210ay1zY3BzeXMu
YyAuIEl0IGFsc28gc2VlbXMgdGhhdA0KPiBzY3BzeXMudHh0IHdhcyBmaXJzdCBhZGRlZCBleHBs
aWNpdGx5IGZvciBNVDgxNzMuDQo+IA0KPiBUaGUgbGF0ZXIgb25lIHNlZW1zIHRvIGJlICJqdXN0
IiBhbiBNRkQgd2l0aCBubyByZWFsIGRyaXZlciBidXQgaXQNCj4gc2VlbXMgdG8gYmUgYWN0dWFs
bHkgdXNlZCBpbiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIC4NCj4g
DQo+IENhbiBJIGFzayBmb3Igc29tZSBhc3Npc3RhbmNlIHNvcnRpbmcgdGhpcyBvdXQ/DQo+IA0K
PiBSZWxldmFudCBrZXJuZWwgY29tbWl0czoNCj4gDQo+IGNvbW1pdCAyNjMzMWQyNjFmNDk5NDli
ZmY2NDc3ZmM5Yzg0NGIxNzA3NmZhMjQ1DQo+IEF1dGhvcjogVGluZ2hhbiBTaGVuIDx0aW5naGFu
LnNoZW5AbWVkaWF0ZWsuY29tPg0KPiBEYXRlOiAgIFRodSBBdWcgMTEgMTA6NTc6NTkgMjAyMiAr
MDgwMA0KPiANCj4gICAgICBkdC1iaW5kaW5nczogbWZkOiBtdDgxOTU6IEFkZCBiaW5kaW5ncyBm
b3IgTWVkaWFUZWsgU0NQU1lTDQo+IA0KPiBjb21taXQgYzg0ZTM1ODcxOGE2NmY3NmFjMGRlMTY4
MWQxNWQ4ZDBjNjhmY2RhYg0KPiBBdXRob3I6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRy
b25peC5kZT4NCj4gRGF0ZTogICBXZWQgSnVuIDI0IDA4OjE3OjA0IDIwMTUgKzAyMDANCj4gDQo+
ICAgICAgc29jOiBNZWRpYXRlazogQWRkIFNDUFNZUyBwb3dlciBkb21haW4gZHJpdmVyDQo+IA0K
PiBjb21taXQgODU5ZTQyODAwYmNmYzRkYjljZWZhYTJjMjRkNmUzYTIwM2ZlOTYxZA0KPiBBdXRo
b3I6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gRGF0ZTogICBXZWQg
SnVuIDI0IDA4OjE3OjAzIDIwMTUgKzAyMDANCj4gDQo+ICAgICAgZHQtYmluZGluZ3M6IHNvYzog
QWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBNZWRpYVRlayBTQ1BTWVMgdW5pdA0KDQpMb29wIE1U
SyBtZW1iZXJzLg0KDQotLSANCkJlc3QgcmVnYXJkcywNClRpbmdIYW4NCg==

