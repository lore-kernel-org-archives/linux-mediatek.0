Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA004CD11C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 01:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pYtO6l/CabJk/W0HRWvz5Lm8R0dTc8L/til+jGnqkg=; b=RXi+qiQUJOqHGJ7+KbVXNkdiMb
	2Ch2yx7JH1xQm4cDB3cj01kmjEgHNizWkXEyAcnpj8Ikr0TWFKIjAlMmOnTyeITmjaqZUGTWsq+tG
	gkimGkRcstd2CsHRRGfqMMhunpebjv/4f5mNa3xBTHY3ALOpXC8RDaX5NASaRj5Y+NPK04b8aE6Z8
	CNgQhjeFaHUw9b5HYWbkJXx7YteAM4t8gI2aNk6NeejklenWY+jo6iS0dKMexM8vgMpNPUrAwu/+7
	OLMAsxQp4UJp409l2WYFb6ZO9u4Gploos4+9hw8iUwsVHkEWdkhz9/+kKfQqbZ6e1OQofMrjcm3T2
	XtppwzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj9l-00000009p0w-3JQw;
	Thu, 11 Apr 2024 01:23:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj9j-00000009p0O-2EJb;
	Thu, 11 Apr 2024 01:23:13 +0000
X-UUID: 0c0d660af7a211eeac1957ae9f99f617-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=3pYtO6l/CabJk/W0HRWvz5Lm8R0dTc8L/til+jGnqkg=;
	b=ZH+fnH2MYKVruPjbIayn49njbD3hvC5KqVMBJ+5t2Hz38/+mQnk2hiqMAlUhkKn5Iz/k3ehBIMNBTfkRWoGAM410nJidNyeXJLdSm+OaEMBxGLkGVB9oRjgDZStUWbWkKP62SBDfquCMQvyCtkOOGKBVcDRn1ls2yk0NpvrwwP0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c5d057af-1d8e-4ef9-bb6c-9d0e54b239a6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:42fbc4fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0c0d660af7a211eeac1957ae9f99f617-20240410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2137512665; Wed, 10 Apr 2024 18:23:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Apr 2024 09:22:30 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 09:22:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/LhQCyRnOnvuTnGmGkftnHQlyNCwW25ELaRjK9qrkaVFsN0BCdG51RBhVM01kLrP/BnRXEwLrU49yd4iHNpOMJUf1H/QilGAd2etTvz8Uvrir8YpgRSzjH7QKs2s5xP4KMCt8k76Zk1idL4FjThkOvmD0CnJ4cbxtmXioOrRsT6JEonWDdk5SjxoJ+Mu1KH88Izp0d3Sd5izh8kRuce6RoS56XikpD3BYqUDZilTUc6E7Aa8FZwADVDEZcUOsPcLK2rrYMYBc1d5UwDZdPqbdJ2SyjsXtQuN51i7XX+8GKTO1wW+XSvF3oi0xQxWa4qo7z7I1xOD9DsFgFa+KNYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pYtO6l/CabJk/W0HRWvz5Lm8R0dTc8L/til+jGnqkg=;
 b=GutocIKoDdgGIMnYYhl0ZZgdIrVt4YamuikW6tJ07v2vxQzjvL0Ih91jM3I4s12mGxfZo8FGDdrt49UC+T2A9Y8GrUoai1EflRqeOJ29GmVSNpLFWYGO2UzL0qcidLnsSe9wEewiM69v6l/RmVg5nIqrTAPS3jN5f0DPA6oJC1lzQOp6RBcaFVTDdLXWRiYN+6tySsWklUDQQ2D9nUroYBJDpaJOlA78YgTMpLGFAFYGdYf8QaFpPK223LAGpmkwLnz1fDkXkWV73bRNTsqcxZDzHNKsB3ILs0zySyYg6KHbNosjwzm/36VO4YCnSAp39KbEjHf4qsngfQuIw7Llsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pYtO6l/CabJk/W0HRWvz5Lm8R0dTc8L/til+jGnqkg=;
 b=nasrCXkkRwpSV8Rjp+/uQiOH0gsRJqCG+LNtUUA1LKxXiDZKka6/NNhfEXu7boAkzIhEaPTj+zMZ01G5EsN9yCpB0+V4LDRmd2LwQ/Zb47s1kORp5ok6bi8NffHoRLSJz/AKpnUM0Z9Hd3kFCEHDyqKR7JutnT/cwwTzJJEK3SA=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB7675.apcprd03.prod.outlook.com (2603:1096:400:423::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 01:22:28 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3d4c:b7b0:2d96:453e]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3d4c:b7b0:2d96:453e%4]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 01:22:27 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] memory: mtk-smi: fix module autoloading
Thread-Topic: [PATCH] memory: mtk-smi: fix module autoloading
Thread-Index: AQHair8PwWfSFKKjjkqCCaNMgBtJ/LFiR+4A
Date: Thu, 11 Apr 2024 01:22:27 +0000
Message-ID: <de383c5f73468c6a7c49d215a36c5e93f81c0cb8.camel@mediatek.com>
References: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB7675:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q3mey92cf3VD8Re1TJxxNy2dBEw1OzqoQXwH0PAKUtIDXsMSw1XKWDcayFi/yGOskhbXHaCwrl0MCj3ZBTlW7QNa/WNVVmuCAXLTXBzdDGJA3mJM8teYIx4S6qx7HmE7iLTF5YjS9rBj9qO4eqqrXtYa9ekA4Tvto4ED+utARg2o77EemxF6cdSaqzOcEmSlSd8zuGV6rqFvh8xioksqtp8LDVeegdc5f0cP/rITRTBDrmCMvTF2TdQi6sFKvgRbWf1Ys0ru01NGhjexOSLdNLmO4MwWftkw7UJr7f1n2v1gglg9OM1qsmvd8gTYievUnffisYnxeHukJ9fzq72l0I/Tayfhh3o0bUKwRzR4r2p0mMKtYBqXp1eIQ0uCLAMO8Qeanly7S7IFznqW/VAdA3O59/stmCb99OZWifT0HfXlR26mhr5qvjfMesdVWmgl94eA/sEFExWrqeDaqmNd3dicUX/iwFu8W9d1TYvQXCUo110pMQrotWf77vRhvRB3j7+r+CglN/72b49TPId7t/RkmXh3imQOQ5AqwAmY7LidhxVh3LFP3IvAVqkAfIosy4lpdseMvK7cReCT5uws4PumP64Ao/Cvq+VdxbSdjeMqyJUd38635Fy9RZTDqYJ5ZQ0pAwsI4Z4G/90pye+GJ/V5IngC3e2QPcn0CnaWwpo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ump1TjBaeXVMSU1PQ0JiL09VVjhkOG9tSEZkZjVXcHFZaU1kd2d0MXQ2NzAz?=
 =?utf-8?B?REo3VlEwQmd5cTRHcnhlQXZwcjExbVRHNjNoakVtNFFsQ3pnVEJMdmk3N002?=
 =?utf-8?B?UTZEU3hlNWhMSkNIdVZmcG4xcUFjWWdKOXFZNDA1dzZDR3RnZUtjamhxK2g3?=
 =?utf-8?B?cW9EMEw5U05KSjNoMm5MbXh4VWZKMzF2cVpPVFBwUlAzRzlySEFpRVdoRG5h?=
 =?utf-8?B?S004MVZ5TkJaZWZveWYwc3FLN0JGUFVTTlM2SDBWd2NaazdGZHBIK2xrUVE5?=
 =?utf-8?B?K01FUzJaU0d3MnY3K0JnRTBpWWJJQWJHdTVzWHFBQktORUl0RFg1VnZGVENz?=
 =?utf-8?B?cVBteGZBOEhvTTg5OERsMWYycmxRQTI3cEJaNUttNDRacUgrNTltKzArZGpV?=
 =?utf-8?B?T29TbG5DbWRPcU5uSTJOQ1pZQlRwZ1RYWDdrSTZNQTl2VENTY1BSano3bWto?=
 =?utf-8?B?ZXJoaGdEMWt3cFpqM2RubXIxN04yT2hCUUVxSW9jTFp0U1hjZWRNUWpFVUw3?=
 =?utf-8?B?bG5lRWIxdzJrUEx0V2xwVGdHY2VvRkRBV0VqVC9GdDJyOGNVU2JBdnpwSGJT?=
 =?utf-8?B?VGtnVnFTMXFRenFzYnRTaFVRMnZmYVpNZ1hXOVBjMy9jc1FuMnU0RW96S0dG?=
 =?utf-8?B?TGRoSzJyaUhjN21wcXl4ekc3RFd3aDYxRE1EeENrUmtUQmZPNlJEcXhaQ0hT?=
 =?utf-8?B?WXk0NjFVZkpLWlF3WWdPQWlXVkxVVFJabnJTbm51dzlYbE5Ia0NkNW54UFdS?=
 =?utf-8?B?SVAyNHhRQUoreTVnNG1VMmo0MFB6OUE4WTZ0QmE0dEJnalljVTcydGdkM3Nk?=
 =?utf-8?B?aDg0dWt2Kys1cjVXaTErUlBBU3J2T0hRRGxZajVQcU1DaCt2Q2hIVVZ3R1Rj?=
 =?utf-8?B?THNJS0k2RDE1Q3l1UDRkRkwxdmxDU21BZmd6cVJVU1RTU1lDVnoyQUlWRGQy?=
 =?utf-8?B?NzRUMGNSOE8yNngwRGZGTVBJVUNibG93cTVPTU4zdWxid2lwN2VML0cxaGNz?=
 =?utf-8?B?S2pKVXlPUmtsQjN4MVpIQmdxQnFqLzNrdkpPT01aNjZwOU1PTFk3U3hmY3dx?=
 =?utf-8?B?SlY2cW1vMm11N24vajBSdzM2aENJZ2VDUWUrV1dZSVpUOERwcTk2dm1CalU5?=
 =?utf-8?B?WUZtbjRFZmxSbFMrZFlWdWNKUjJ0WDU0dHRVc1BEeEx5cHUyVXlkejJqUnht?=
 =?utf-8?B?UXA3SHJKWDdFeTN5K0RxMlNkbVdvaFB1U0ZHcGhJSFdyNjMxU2ZtOEhGbHAw?=
 =?utf-8?B?SHM0a09zVnRodm9IblAwRVl3VC9JdkRzOERBcGdoVFJITWY0QzNIWTRxb1ha?=
 =?utf-8?B?QnlHTkZZZGw4Q2tDNENIZzhNMWxzNlZ1L0lHc1NCU1VGbUpCaTcwd2tudzdn?=
 =?utf-8?B?aUtIcGViMFNiRUF1Z3IzRUs0VzNzVU02bjY4R0tRZ2xrVUtkSXlSOFl6enpC?=
 =?utf-8?B?Q1lrakZCUDhpcGFNVE9lbHVMV2dwejAyYXR0UE04dUYyaGdXVnNmV25mVzho?=
 =?utf-8?B?RDZuQ2RpREQzaEJJdi9sOUJqQ0wzVkkvZVVrZUFKNVZ6RmFkMnNaTDBIOVV4?=
 =?utf-8?B?QzdSQ0FHM2d5T3lpYU40TVdtSTNySmVLV3ZmcE9xN1F4d2krVkdUOEcyeWFO?=
 =?utf-8?B?UTIyZEN1d2s0TzREQTNzTDJVbGJxZEhGWlN6cjJJcEFBNFdnVVZvK0tVNGNH?=
 =?utf-8?B?cllodUJmSFdXRlZsdjNrR21KSWdDanRoZURvbzFxelNVRE9OVUF3VVZOMXR3?=
 =?utf-8?B?TjA4Y2VjdVVtUGhwU3ArRkxvSjFCZGl4Q0gybDRzTEp5Wk15SW5ybGhTc2Rx?=
 =?utf-8?B?UFN6dUFjbkZJWGFybDNwT3ZLK1haNDlaeGVLRTBzaSt6d1pqM3N2b0NvOENO?=
 =?utf-8?B?NnJja0VFdXRIdTY4dlFQOU5OaXcva2dQSzdSWDRFa0lXazVVTkppb3F4Tjcx?=
 =?utf-8?B?eXR0Wm95SzBKeVFOMXZDc0w3c1hOcEJCcVo3ZjR5NlkyazAwNFc3SjdJejZO?=
 =?utf-8?B?cFpNM1NiRVVueDhKT0hDbEloc2g1NjA0eDFyQ3VxQkU1emlQY3pvaTM0Zkhy?=
 =?utf-8?B?T0xUWkdiYlZNUWhsbDg4YVBOdnVVbTlWSUNzYnZrdTcya3BYVkhoN2hVbXRN?=
 =?utf-8?B?R2poeXVZcHBhb3B6UFFhUmpBQ0h5TnpQNHVDdnZrNFhNTC9NWlFtbVFjVXpp?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A3CAA195EA21A47B9BA0A2952B7204B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0253e3b1-9158-4af2-5c27-08dc59c5d9c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 01:22:27.6553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: que+JOrPA+CjqHDVLJhFUq+ql7Oo9zeX6SVwcFtoQTEbNnbKrc8RFklV8xg/x9YfnArXK6BWoaqlZOKMhyaJvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7675
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.606900-8.000000
X-TMASE-MatchedRID: w2TFuZOvAtfUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMoMfp2vHck9UK3n1SHen81RMu6ersnFy9f0x
	RbeegyCZpSQUUBF62MZGTpe1iiCJq0u+wqOGzSV18GfB9SHbqW2Z85c5StTiXUEhWy9W70AHCtt
	cwYNipXxRAJC2k3BZ6/tsQuVVzKWureJlQltbxFs1kVQB9AHV1ybqLqkVzVE4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.606900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 06D91EA252D0388F330DA4DBE390F16140FA8B8ED2296A50DBEB29ADABBAC4062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_182311_686791_83708A86 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyMDI0LTA0LTA5IGF0IDIyOjQ2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIEFkZCBNT0RVTEVfREVWSUNFX1RBQkxFKCksIHNvIHRoZSBt
b2R1bGUgY291bGQgYmUgcHJvcGVybHkNCj4gYXV0b2xvYWRlZA0KPiBiYXNlZCBvbiB0aGUgYWxp
YXMgZnJvbSBvZl9kZXZpY2VfaWQgdGFibGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQoNClRoYW5rcy4N
Cg0KUmV2aWV3ZWQtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0K

