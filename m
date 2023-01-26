Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E250EC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dKWFEC1kWyb3EmuK7Zh3wU7fkjvKPnwHRC0ByIs4AE=; b=YkGf4RvRLq99m6RxrnZ0aldJfl
	T9Q0zXJUowtxxjZWQuiK6MEjuJxUIHlu93wwhnzT3DxUTv++c0ct4OC8oFTWIISprypkpgKF+Wyp2
	Oa13As11E2240yvWJTwqurFkxTRRmMepcOo6UDIuttWovSyHzjMGbdWKkGdUQCo092SGmjxiMBJ8j
	deLKq0BUz4U+nud2IgA56Jp3w6PvzZzBeCfv5aU8nOK3hEZ2YKa51lQbFSxY3JF5xxp/F6J1bHHCA
	yED3oZWNI6WlS8v5CZ2GAo77OOyqLYFWCDQeepCRDBiI0VM14M0cbHpMTP/nJ2tLgrH1gKbmkLPx/
	kO+bK/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4WT-00Bc5k-Mk; Thu, 26 Jan 2023 15:50:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4WR-00Bc4F-Ij
	for linux-mediatek@bombadil.infradead.org; Thu, 26 Jan 2023 15:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=3dKWFEC1kWyb3EmuK7Zh3wU7fkjvKPnwHRC0ByIs4AE=; b=jJdBRzfsDsyjCo8gKelQjyKxSj
	Ex99Seaye4WDcbsc1sNhRXpwNBPQto21B8MOiDId98erEp9sp/+rX/mLt+b7vhRWJRIzlcBQDt9PB
	0HmvazvhrnR62RWxvtWf4qWn0m8ZnSiggCu4HUr8gMdbaDovMT7WqdgzfpL2+nvMqpnUfbQl3Zf8T
	bTaypI3AndkzfPSEmcTVxIWYBbeMlDhfxfbDUmwHY6l7LkPPCRTa8mSXfo9lidRQ1l4GuTifUkz7g
	0YLGfnCIutoMfQL6iQYROp/TslGEi9Gm/9j4ILZFWCmEdiS1QYg/IzCQKvAtY3x0ueQXpkiy6mQeO
	t0zgNVIQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pL4Vp-002UVt-2X
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Jan 2023 15:50:10 +0000
X-UUID: f867ab929d8e11edbbe3f76fe852e059-20230126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3dKWFEC1kWyb3EmuK7Zh3wU7fkjvKPnwHRC0ByIs4AE=;
	b=oQpKYG3Vo3Yv2ENjzS66TUk55KYhWDkSFPWLrL+cvksGjfAAZ7JUsZRZ0Ear4kkOMzlscdh+lZDwnS1lOSHZeUblQQa6OmZmnlEwAMFxjiiQbUm/clVLfQl71PjxC5bn0xliUNGF3Zvo8tvZUo8lteaARMS8gJUgMpuSo7FA3Gw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:331c7372-e219-4e84-a534-a4b1c4c29bc0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:b8d7abf6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: f867ab929d8e11edbbe3f76fe852e059-20230126
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1547284512; Thu, 26 Jan 2023 08:34:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 26 Jan 2023 23:24:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 Jan 2023 23:24:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POZGo12J8JYpazKo4vWL3/6wdVv9E+2eNwMJWYbXaiUgOrgAEFLMeK6x5hBaocj9jPWhs+hRvVFTT0vlJrnYBnbht1TzomXaAt3XaqUYUrUDWsLwEf1COJDyphruNFQcaQESn6itviqD+D0PTuUCCJ4RC3dt2amDJ4X80tn7Rb42Xs7dqCY2amkJeCl9xcRwDfeYU4rUAvMfYyq475BRLTlvVh2aCHl1AJqxD0PLDRZw9iB7AQUn1PtKHq/Da8GWiixC2wRWvnmPM/R7sMiVukvvLVlIwD9kKmK5EMkK56UJHHqPuIBxsPFc/RLnU+OBQgXz+W5SM/3JmZIBcfqJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dKWFEC1kWyb3EmuK7Zh3wU7fkjvKPnwHRC0ByIs4AE=;
 b=kS32IwnE/6glQPtf/JGWVK3fAJ5W/SH5qCfPw+wsNlHqAoFd+B5b35nppTCmDHk6aDop0CzU+8JeMfMc1XxYc7v1gI+LUVDPlTJKLmbskyS/BXhJfFSntrHT14+eKhzlaE8VVjLJ09x7JqP804wifbSN4b5pHBRu2bGoS4QyCS7Yp/kIo9DVfysGXqGRTN+S9rxLjS/LulupDOEyrESVb6EGKUYCeGPjny63cfgn2aWiIrtnFxz3TJNnu4umPdCPO79Vc/676HEzE/AY3SuF2QKECkzBrDnplAqjPJ6yN6iP0moVWaK1aQIUG6Fs6AGoS62Lc34gqBLe9Ml+2Chxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dKWFEC1kWyb3EmuK7Zh3wU7fkjvKPnwHRC0ByIs4AE=;
 b=oMhcVaixFHCh0xPP8JhQDdarDX/0p5KO89ok6Hbbt4iVrQUyxdNKpNyQdCFauxCYnFKYRKpBVWt/eTq/lr9ysGBs6al8t+kKJr0J6oy7okDjjSjsK1ZAWY+smafBUPAsuAyy3zg6YV7H623q8Ftbrg844qvGUFUCGcPtx7UTUfY=
Received: from SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9)
 by TYZPR03MB7204.apcprd03.prod.outlook.com (2603:1096:400:33a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 15:24:44 +0000
Received: from SEZPR03MB6468.apcprd03.prod.outlook.com
 ([fe80::56e7:bf25:29f9:18c0]) by SEZPR03MB6468.apcprd03.prod.outlook.com
 ([fe80::56e7:bf25:29f9:18c0%6]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 15:24:44 +0000
From: =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nbd@nbd.name" <nbd@nbd.name>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
	=?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH 06/13] wifi: mt76: add EHT rate stats for ethtool
Thread-Topic: [PATCH 06/13] wifi: mt76: add EHT rate stats for ethtool
Thread-Index: AQHZK1fjyrDdAAPw/E+Nqi2wW/3JY66w3fGA
Date: Thu, 26 Jan 2023 15:24:44 +0000
Message-ID: <8250eae28a0cb2d130baf87b771fd17f3cc5e61b.camel@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
	 <20230109165731.682-7-shayne.chen@mediatek.com>
	 <Y8gaqTqI/un8dgZd@lore-desk>
In-Reply-To: <Y8gaqTqI/un8dgZd@lore-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6468:EE_|TYZPR03MB7204:EE_
x-ms-office365-filtering-correlation-id: 257e5928-aa74-432e-30ca-08daffb173b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hGm+F8bz3lkqCGETSV+qNIplBJBEwjBjPC2NAV1jT2K5+HqVhkoOS/1DkHWoMwvuwBmPa+XYSiv/JZpPsi7gRIiAiuyMmMvc7vVD6s7DCQoJwTYXADLvR8Y7PmC2jo07VUjDnsBvtK0IxZdHikk4htlneHWG0w19A6GtLVX9FZ7bgfqZM4W4x1oUKeNxZAMgBtHZ3v8L+aJ80P4oIePba2n00b1Nbky1bS1UTl3md4kUl7zyc4cmF9nhKX7EHJncAoLgFW6JvCAxptseP/wFX/dGg01zsvaDiNRRfp34/+TCBAjyPfPN5tC6lI46mwte0iPstMbsl08KuUtW31yEwJb1TSVfVb2viRwtYVFzO4+xQq+wVSrflP+i6/AClsI6c6Uv8hHQEUDx2UiSB/n70JXCl+YnOWS9itDkw3OsYq6i1HYhhA3qXzHj0hf29SzItetY2JB0uNWzVKCLy5HiO6rHhpznIs2CMzYJp+ScAv5CWroCj75feyT/Iko1E8xjh6w4eeGFdT0/vx9ihU6gkpR5OpKe1652Oyx6+KgRtIib3YrSU5V6piNCXHRqs+LDPN0zEewmI728JcPmaW9prb1pTcUzGDL/9htm1HEtHxawCItIumUqC/4KpQD7x/vuUjP9bxi6Sk6slwre4n92l76fSAqVHKahNJ3hZTGQktIwCuA9iHIWh75OOMQlFCR4d7R6voYW/8ax6zzavBSiLMzejLIWphhJCu+kjw8S48rCjVFjxEpc1ZiEtmz/DhpLgE+Xmk2ZHWSbvgkxt5r8mg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(451199018)(186003)(26005)(6512007)(38070700005)(83380400001)(54906003)(107886003)(86362001)(71200400001)(36756003)(85182001)(8676002)(6486002)(478600001)(6506007)(316002)(91956017)(64756008)(66556008)(4326008)(66446008)(66476007)(6916009)(66946007)(38100700002)(122000001)(5660300002)(2906002)(76116006)(8936002)(41300700001)(2616005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTVDR0JQVEExVHpYeTFCVWdBZW1RVmgyTXR6dC9YTTBCaGlKQUdXNXhEeUJh?=
 =?utf-8?B?S0UxeFNzd1NDSEJDd3BwK3VqSGZITGJRQytCamhYaG9CYytoTTBNMU5YQXRo?=
 =?utf-8?B?RitZakxkUUxQcVBIK041a21JUWJFaVdGSXdETVRKdlpWVHhZc1dvQnhseXZz?=
 =?utf-8?B?MXJUcEZJODVrK0tJN3l6OVh4RjljR3ZZMDcyWTA2bHRuTjcxL2xoZmx4Mjdn?=
 =?utf-8?B?bmgvY29ubWhzcjFKQXVEUDk4NHRFd1BnQzdEaGRXMlBaNmI1ZlJxMkVOMytE?=
 =?utf-8?B?eC9VdDRRR2RTa0NsOE40YlRLVHJjcGI2VnFxOGtUWDJCNm5jYk8rQjlBbzlU?=
 =?utf-8?B?UklwV3B5QnFpRTVkNGVpYkRKQUJZQTk1Mk5IWGQ4OG5RdnlIQi9LeXlRVk1K?=
 =?utf-8?B?QUtqUmJmRUtIcHpheTAvdVlHQ1BQc1dTajJ2K3ZpS0psdkJwRHlGRElVQmla?=
 =?utf-8?B?aDVvVzdlU0EwTUhIRW9VVWF1ZkwzVkZPUEVUbnZNSm1mMFZQWVcyWHRqY2ZQ?=
 =?utf-8?B?UUFObzR0Q3RaVG5kbjlheUhUT3hpRGdhblhJcW9PVlA4ZWlYTlErRWdlenRS?=
 =?utf-8?B?dS8zWWhIWk5sZlN5VUNFOHV6REtuK2NzVno0a2RZc2pVR0hMbm1RWUQySEp1?=
 =?utf-8?B?WnVUa016S0k5QjZqZTEvMDc0b0pGSi9MelNtSzdWa1FlM25CcmpvSzdlM1d6?=
 =?utf-8?B?S042NlFOUFdWRDBFMEIwalZuSC9EMUtjdG0vMkIwdk9JNnVkWGhIR1JZczZX?=
 =?utf-8?B?MDByam5VY0lkczYwU0taNGtrckN0M3liNDA5MjlQSmNjU2F2eUpSNWJLeFcv?=
 =?utf-8?B?Uzd5SGJ2NS9VWmhnTG9UajFCa0NRNlE0M3lDd1FaeWJmamdoVmc4ejNFaU9n?=
 =?utf-8?B?TXpPODQ2NnlOQldUNy9BazRheWt1L0tGcitTV3d1dXhkVXptbkNxU2JzWDJu?=
 =?utf-8?B?NmtURlZiMy9CY2ZvbzNUTkM3TGllTk50UmdtZW1iQnYxY3ZpVlBCeVBVVmlG?=
 =?utf-8?B?THJnUkYyaUVmdER1UEpnczFCUXcrV3VBajFTWDBsMGhQS1cxTTVYc1BFVjVY?=
 =?utf-8?B?T1E4NC9TRVpMYktmVDltaThYRFExNDdaRFRzUFhubXQ1Sy9oZ3V5c0ZxM3RV?=
 =?utf-8?B?eTV2Sm5HTi93c1NDSnRlVy85dFYvVlRjaTZWVVNKN3lXMHJhS3kveHVUc2Zh?=
 =?utf-8?B?cDdrWFRMb2JQdzcxMTVRRXVlclBRZHg1dGFFbFhSQXRUZldqemUvV1Nwc1RE?=
 =?utf-8?B?WThPekwzMlhwMjJaR1JVOHh5clZ5RWN2UkUxa1Q1K25iQmRWMDIwSmZZK28r?=
 =?utf-8?B?YzlkM1dpWWVYcVV4V1ZvTEJ5dFV3ZzJvQ1gyeEhjU2o4NnF1eEQzdlpNZFpn?=
 =?utf-8?B?dHlLQ29yd1BVK0hTTm1zbHdFNFJtUnYyNlFGcjUzVnhQVDVIVGdrWUtXRzRL?=
 =?utf-8?B?ZW5rRzlnMFNNZ1c2b05BOXdXQmtqLzFMSWRRYTlsM2djOUNmazhqVEhBWmpM?=
 =?utf-8?B?WHdxNThYYVpQbEttTVdZcDBwZXZnN01SOUpmTmhWMkQrQkpFVkYvQ2srWnpB?=
 =?utf-8?B?T0xWekc1RGlyNjlPQXdLWGtlQ2l5RkllZ0pPSWFWTDYvN0dqQXVuenMvWE1T?=
 =?utf-8?B?Y3QyUERrR0ZaV1RIYlJsVWtwSHpzVHh5K0E5NklUU09xMFlOQytiak9HRk9K?=
 =?utf-8?B?ZmhNaVl4Tkw5eTlRRzhUbGtpbldWL0g4eXY1WXJPc3pyT253eUh2S0NZMmZQ?=
 =?utf-8?B?SjdKb21DaXhNbnNkQm9nYzlXdm9nakRTQ2grZFhMR2lxOG02Z2xzNWVwaHZM?=
 =?utf-8?B?Q3JtSkFKSkdPMXBubXFqYk1Gb2JGUE9vTTNxWVRibFQyMUZ2YjRjYlFiNElP?=
 =?utf-8?B?WnRxa0czRHNacllqS0w3eTZRdytNK0ZrNGEwZ3g5Y3VWYjc4bDg1SGUySkM1?=
 =?utf-8?B?YkxpTzFGdXQxUnVVTmU4SG1xRVJiN091MEhqdXdsbHZpZDhzSkpuQlpQTGxw?=
 =?utf-8?B?QUUzZEhKOGh6WHBRM3pzMWxQcFIzUHJ0c2EzZ29QZW9zNG9ETWlyRFlZc2JX?=
 =?utf-8?B?MDRub1FxNjM0QkIvcmt2Q01yQ0FaQUlkV2ticWNJRWJZN2M1cXdsZmxrN2Ni?=
 =?utf-8?B?b1BNRFMxRHY2VFNxSlBRN1YySVJ3ODc4aGcwRENkQTIySERJZ3JxeXRyZ29K?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F1CDACA55657243A115E7C544BB7AF8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257e5928-aa74-432e-30ca-08daffb173b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 15:24:44.1647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmuHq3ooY0UR+K/fO6QrDV2zEPbiiWzZBKmoV8Ub2q2PSSoStuXyTTiXVZsbWOf/kE56E0CQqml9u9++tSpPW/KrgXo1BEqHvk6e3MoAMM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7204
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_155006_838778_EAFCD6A9 
X-CRM114-Status: GOOD (  18.59  )
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

T24gV2VkLCAyMDIzLTAxLTE4IGF0IDE3OjEzICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiA+IEFkZCBzdXBwb3J0IHRvIGdldCBFSFQgcmF0ZSBzdGF0cyBmcm9tIGV0aHRvb2wuDQo+
ID4gVGhpcyBpcyB0aGUgcHJlbGltaW5hcnkgcGF0Y2ggdG8gYWRkIEVIVCBzdXBwb3J0IGZvciBt
dDc5OTYuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2hheW5lIENoZW4gPHNoYXluZS5jaGVu
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc2LmggICAgICAgIHwgMiArLQ0KPiA+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210Nzk5Ni9tYWluLmMgfCA2ICsrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzYuaA0KPiA+IGIvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2LmgNCj4gPiBpbmRleCBiM2ZkM2FiZmRk
OWYuLjNkM2M2OGI5ZTFjZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210NzYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlh
dGVrL210NzYvbXQ3Ni5oDQo+ID4gQEAgLTI3Miw3ICsyNzIsNyBAQCBlbnVtIG10NzZfcGh5X3R5
cGUgew0KPiA+ICANCj4gPiAgc3RydWN0IG10NzZfc3RhX3N0YXRzIHsNCj4gPiAgCXU2NCB0eF9t
b2RlW19fTVRfUEhZX1RZUEVfTUFYXTsNCj4gPiAtCXU2NCB0eF9id1s0XTsJCS8qIDIwLCA0MCwg
ODAsIDE2MCAqLw0KPiA+ICsJdTY0IHR4X2J3WzVdOwkJLyogMjAsIDQwLCA4MCwgMTYwLCAzMjAg
Ki8NCj4gDQo+IEhpIFNoYXluZSwNCj4gDQpIaSBMb3JlbnpvLA0KDQo+IEkgdGhpbmsgdGhpcyBj
aGFuZ2Ugd2lsbCBicmVhayBtdDc5MTUgZXRodG9vbCBzdXBwb3J0LiBJbiBwYXJ0aWN1bGFyDQo+
IGl0IHdpbGwNCj4gYnJlYWsgdHhfYncgZm9yIGxvb3AgaW4gbXQ3Nl9ldGh0b29sX3dvcmtlcigp
Lg0KPiANCkknbGwgZml4IHRoaXMgaW4gdjIgYnkgYWRkaW5nIGFuIGFkZGl0aW9uYWwgZWh0IHBh
cmFtZXRlciB0bw0KbXQ3Nl9ldGh0b29sX3dvcmtlcigpLCB0aGFua3MuDQoNClJlZ2FyZHMsDQpT
aGF5bmUNCg0KPiBSZWdhcmRzLA0KPiBMb3JlbnpvDQo+IA0KPiA+ICAJdTY0IHR4X25zc1s0XTsJ
CS8qIDEsIDIsIDMsIDQgKi8NCj4gPiAgCXU2NCB0eF9tY3NbMTZdOwkJLyogbWNzIGlkeCAqLw0K
PiA+ICAJdTY0IHR4X2J5dGVzOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9tZWRpYXRlay9tdDc2L210Nzk5Ni9tYWluLmMNCj4gPiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L21lZGlhdGVrL210NzYvbXQ3OTk2L21haW4uYw0KPiA+IGluZGV4IGM0MjNiMDUyZTRmNC4uOWVh
MmUxMTk4NDc3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzYvbXQ3OTk2L21haW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlh
dGVrL210NzYvbXQ3OTk2L21haW4uYw0KPiA+IEBAIC0xMDg0LDEwICsxMDg0LDE0IEBAIHN0YXRp
YyBjb25zdCBjaGFyDQo+ID4gbXQ3OTk2X2dzdHJpbmdzX3N0YXRzW11bRVRIX0dTVFJJTkdfTEVO
XSA9IHsNCj4gPiAgCSJ2X3R4X21vZGVfaGVfZXh0X3N1IiwNCj4gPiAgCSJ2X3R4X21vZGVfaGVf
dGIiLA0KPiA+ICAJInZfdHhfbW9kZV9oZV9tdSIsDQo+ID4gKwkidl90eF9tb2RlX2VodF9zdSIs
DQo+ID4gKwkidl90eF9tb2RlX2VodF90cmlnIiwNCj4gPiArCSJ2X3R4X21vZGVfZWh0X211IiwN
Cj4gPiAgCSJ2X3R4X2J3XzIwIiwNCj4gPiAgCSJ2X3R4X2J3XzQwIiwNCj4gPiAgCSJ2X3R4X2J3
XzgwIiwNCj4gPiAgCSJ2X3R4X2J3XzE2MCIsDQo+ID4gKwkidl90eF9id18zMjAiLA0KPiA+ICAJ
InZfdHhfbWNzXzAiLA0KPiA+ICAJInZfdHhfbWNzXzEiLA0KPiA+ICAJInZfdHhfbWNzXzIiLA0K
PiA+IEBAIC0xMTAwLDYgKzExMDQsOCBAQCBzdGF0aWMgY29uc3QgY2hhcg0KPiA+IG10Nzk5Nl9n
c3RyaW5nc19zdGF0c1tdW0VUSF9HU1RSSU5HX0xFTl0gPSB7DQo+ID4gIAkidl90eF9tY3NfOSIs
DQo+ID4gIAkidl90eF9tY3NfMTAiLA0KPiA+ICAJInZfdHhfbWNzXzExIiwNCj4gPiArCSJ2X3R4
X21jc18xMiIsDQo+ID4gKwkidl90eF9tY3NfMTMiLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAgI2Rl
ZmluZSBNVDc5OTZfU1NUQVRTX0xFTiBBUlJBWV9TSVpFKG10Nzk5Nl9nc3RyaW5nc19zdGF0cykN
Cj4gPiAtLSANCj4gPiAyLjI1LjENCj4gPiANCg==

