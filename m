Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F0E82CA7
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUpiob8GjNW7lJlIytPUv6JIbuESI1CWs1PH9HYt39I=; b=3ZoLcgBYtEgwfwzlf8l6ar4TbP
	Sj22e4IDZnsVOi+A+VCQrGT9lfIzMsH7Xydu3q+DWgYDIlREr7cYMt4WLpHMB6ZxBjuZjrnYdq5ro
	AFn5aJ1BZPUV63WLwwxXFQp8+9m0SI7c5SCNRAhF4RyRIp53WT0Oy0LYWms1c+FblcdmAsyr9Xn1t
	92WFxMmjLvu3mPygqfxbt8IQ/V5+EF/va36wHHJGHM/Xg5R23F1KBnw/WQbIQVrQG1RB98+nKqYbW
	J30T7YIrOyJkQSbBemD0lUuGj45AERkviAQ1M4eVkZcD1ppdFqzoz4XfFjSItu4XYkHy0eYl0+POA
	eFo/yTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWvA-001NtO-28;
	Wed, 27 Sep 2023 15:57:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWv6-001Nrw-2x;
	Wed, 27 Sep 2023 15:57:50 +0000
X-UUID: 985bea6c5d4e11ee86758d4a7c00f3a0-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EUpiob8GjNW7lJlIytPUv6JIbuESI1CWs1PH9HYt39I=;
	b=JBdCmQd7piSUJiy391cFof2sKLw6MmFKUp+g4oe3PPDdyLQSH6UzqdxGNiHHmL1fRYK5hjQs+r3VKA3twXtdlw9hn9JJDX3aFvT9rAPgi01qBkdNj1jyHomSSZJyXGpM0rLDSToguRAovILJB8SxO+aXzJ5W+lhWotZxfdo7iSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:245d101f-5aee-4746-a7bf-40ec022bb78e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:19c388c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 985bea6c5d4e11ee86758d4a7c00f3a0-20230927
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1838633654; Wed, 27 Sep 2023 08:57:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:57:41 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:57:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeLqyqXv2PKTFvHiQsOfF4oPgv925t8XHPxkLEEVqCCuW5cBKeW1DR86YFmDdxwRQH0rYK3Qv+swXfiFDvauLmdUIMnaTRgic3YA33tfvKFNjKtKcbmU1WtUBQdH6jBjXCIxACCoqRSkxko81cW0xYcuilln2J/LdxAmP7lqsy8yHtLsji2EWrrFPSfVcU4TkezMs+ZdaERlKA5OkABZua46EZYnFI3OuG0IokVzAFh9iu0MbSH2qbGMbnRCbSO/wdPVc5Zl/bp6FhxLkv0CXCG8KEpGRcFVu83ivog1vI4PnQXj2HTwEM+piv1v3jMMq9pJJgMp+xuVpuQaVaKagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUpiob8GjNW7lJlIytPUv6JIbuESI1CWs1PH9HYt39I=;
 b=lIuSBMUE0ssgmeMWH0OeY4mJVpj19No3u0fPGDmQN/NLvPeooukHs36MEeHPwQOOLIuM/CdyZIFVFzl6rn1bT8Ee41wtbqv71C9r4f9vvIqVz5G9CFRd5/ClDoZ0j+Wu02BAAKl1zaYY+3hi6xCdoisAueEYgJeVHXmx+8EM50HZC3+2DEmOw99h9xcTX1l3xkqbFWffeeW+YtdxE8T5ktdeWNp8CQ1uAtfopRaX2YYOsvKzVmPxAHwzzI+NsN1uGEUzbN7dYmoLvjR2MTUj7UupXd5pYMR0Y1OUwTV+fHhjJGAIUO2GM8/xqImTYVXoaDLKCJxhc9ZEkrFuqRbXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUpiob8GjNW7lJlIytPUv6JIbuESI1CWs1PH9HYt39I=;
 b=GUjF5Yocn23rKfre5wBjDKheQcWhQYKtlG+jL2srfEPMHEqKv1OJvJFM7PuRpKecOweWv04bPcL9jHG3CtoZdMwA92FA7l7Jz687VDBvdrs9LD8gFaOO8rrkxs2LxjJcSJrdJpTTRWZSOx39fCEkSLOZ8BvflNgxrA1Hh9gmTbo=
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com (2603:1096:4:12e::5) by
 SEZPR03MB8208.apcprd03.prod.outlook.com (2603:1096:101:19f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Wed, 27 Sep 2023 15:57:37 +0000
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::a8c0:4146:462f:76e6]) by SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::a8c0:4146:462f:76e6%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 15:57:36 +0000
From: =?utf-8?B?S3V5byBDaGFuZyAo5by15bu65paHKQ==?= <Kuyo.Chang@mediatek.com>
To: "peterz@infradead.org" <peterz@infradead.org>
CC: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "vschneid@redhat.com" <vschneid@redhat.com>,
	"bristot@redhat.com" <bristot@redhat.com>, "juri.lelli@redhat.com"
	<juri.lelli@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bsegall@google.com"
	<bsegall@google.com>, "mgorman@suse.de" <mgorman@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Thread-Topic: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Thread-Index: AQHZ8PONNdMSrYrApES66NU/CC/LkLAuUcoAgACC+IA=
Date: Wed, 27 Sep 2023 15:57:35 +0000
Message-ID: <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
	 <20230927080850.GB21824@noisy.programming.kicks-ass.net>
In-Reply-To: <20230927080850.GB21824@noisy.programming.kicks-ass.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5580:EE_|SEZPR03MB8208:EE_
x-ms-office365-filtering-correlation-id: cfe5ec4d-7b6d-448d-11c2-08dbbf72778f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dy1Tp4GA8Fra1EZQQ4K2PXpone5B4mHvf8jC2XSrNCqMt7Ndw4lNvRgfvbrR0o3eayLV6+si5rzJ3P74IVuaRp7v/Ix50jL23gnj8XwrhgmQlpOG5iWMbXfA4ZAEv5GHeIIQ+9LQxsE44Trr480R3wCmDiW+YVUVVfT99PWAJi1s6USjR2crGkpXyR2YV/IWerSji+49pROjg75ZGuuoAeoSV66Aklua9EP1Wl0k3zl2oefEHXxFektKdlojPtxN8KJVNJwUKqFrGtri0ilAQRpKrsmJo6WBW5YThuXbljrFgQdSgdbPCtavIAMQx/SnkKbWKLpKiF7krgXTyKeVe9gvpiEef2CBuTyVhtH28ZIHff22uBpwS728P1pIh/m8Y/zFh4uNLGpz7IOLNnP5a3YAH/oljUcFZ4W3r/CfB8ixFIBHPzK3/ZH0ucn/uPz2NA/nl8y/obySRlF9wZfIkPpqEVVEMuAjI7yZB4viqLrjehWPm7Z+CHvvOTf8U2ieXdZoRsGKgXVeJcH3rERFyPHb1RrAjayggWO1H226ly1LYit0OTYXPoLyIub8+JirMTkN0rAi9V+3De1DMR811xnKU72GYZU4vGJUizh0Tx9wt+uwE4uXAXSUOnTk5VrnPZXKbUSobcMMoXIePig/+/ujnqeLvk+pvNLbJvzlZEU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5580.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(122000001)(26005)(6506007)(6486002)(2616005)(76116006)(66946007)(86362001)(71200400001)(478600001)(38070700005)(38100700002)(66556008)(8676002)(54906003)(64756008)(41300700001)(83380400001)(8936002)(66476007)(4326008)(5660300002)(85182001)(91956017)(36756003)(6916009)(2906002)(6512007)(66446008)(316002)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUZjdXJSOWZQcUpaOWV0SCtOdVMrNFhRR3FrczlVYzY2WHltNGJweHk1OVpQ?=
 =?utf-8?B?N1hrVUdWbE53VS9nUm55UXJBL3ppc1JPUnRoVzBXdEJCSFdCUGFxcjFRYWp1?=
 =?utf-8?B?MHZLRXNqNkNybmNrSlM0VXBuTFoxMTBzb2d5cEVsOE9hR0U5cEpuYThBMnBI?=
 =?utf-8?B?NmFzWGZKVDJYcUp1YU9uL0UyQzNJbTB6djQ2ZzRvYnFoRTNmaUQvaFh6Ymth?=
 =?utf-8?B?a2gydFh6SXNmSUVKWDhmcFI1V0JvRTlZWEJrZ0Q4Q2p3MWQ3S2pJSGJDYkJt?=
 =?utf-8?B?KzJ5bjAxSm90eVBoZGlCb0hKK3M4bmhFZjdvNjM3QWpWb0pLZXlUTHZBV2JU?=
 =?utf-8?B?dUxHLzJMeG1MaFZUUEtOQ080eiszWjMvN3ZtQTR1S05KTDZCeDJXWDZRQkJT?=
 =?utf-8?B?bkc1NnFHbGd5STUxakdnUUJidDcvZ24wcEVHb0pEL0VLbXBYMzh5Y1BnelU0?=
 =?utf-8?B?eHVXb1psWDd6cVlETHRod2VnalU4ZXd1ZlRwK09HV0lMMEpYcHVxajE1eUlX?=
 =?utf-8?B?SVBHMGFzNVVSNXloU1h4RnE0MFl4L0VKeERjeUV3Ull4Ujd6cmtBOVgxa3FL?=
 =?utf-8?B?eFJIeDdJVFN1c2VGYVpwS3V4cWZHUUdndURxektQZFlRVEJRU3RhSllJT01K?=
 =?utf-8?B?OE5DOXpxb1ZzTjN0ZGJVT3Z1RUNVZXdiVFBRV0RJWXd5SnRHSmNjMk5QdWxJ?=
 =?utf-8?B?MElHZTNHY0NDcmNla0sydjFIaitHMXVmUnBkZmpjbnJpMTNxZnVuRXROVnM4?=
 =?utf-8?B?RlExNDloR2NENzBhYUN1WVFmTmd4cGo4V0kyVjN0WDc1TURncEVIbWFIQmFB?=
 =?utf-8?B?WlBuRUVuczdSTmlYZTVtRkVKZk1ETFRBNVRiR2tweUJNVWtreDJQdWpuODdL?=
 =?utf-8?B?WFk4dWtwaEFVRko5SEtkRnAyNnRRTVN1dkdkZVd5MDNuZldVZWszdHlWazBX?=
 =?utf-8?B?WGtwTXZHRTltenhIR1lDMWZTdzF2NHQ5clpGSllWVkUzU2Z3ZUtEVmtydHFH?=
 =?utf-8?B?czZvcXZ2VzJ6WG9Qd1dQL1l4Uzg1bnU3aXRWZFo0SnQyV3d0enBxWXpsNFJZ?=
 =?utf-8?B?NFk4OUdTOCtOc0NJU1o0cXphQ0xkSXNMRDFqekJUbFMzVjBqZkxqbERnalRF?=
 =?utf-8?B?M1hucTJPU09nZzZQaVZLMFRqaDVYSnVOVndHUnFPSHllYmJlamxlSjI5THl2?=
 =?utf-8?B?bCt1WC84bm1FOGlOTmtNOHkzT1FXVUsrNHZONHBiY2tNMFVGUUo4SlNETmlt?=
 =?utf-8?B?TmJ4ZlJhRFVqdTltTFdxbWlqVlZhQWs0M0g5TjNOVHdkbXd1TXJEV2NqY2Iy?=
 =?utf-8?B?dURuNU9tbWNVSjR4YzFFaC9YRlZMK2l5RUY3NnNJQnZvbUxyWGZ2WXhyWlIx?=
 =?utf-8?B?b1VMaWlHbWFxZGNtTGxGK0hXL043ZGRPNXNvS29RQTRTWThuRlAxTnZzemg4?=
 =?utf-8?B?TXdhZ25RWDB0MUZBMUN4MUM2RXdwbS9uZFNXQ3hZNU00cGxDWDB1R2xuNHV5?=
 =?utf-8?B?bmhpNFA0SzVabXhiSXBaS2tGL1d6SGpxWFJTaXRjR20vVW0yVHl1YStvNVVK?=
 =?utf-8?B?bUZGbi84ZWFxeXQrbkU1U2FLbjhCQXZOVGdsWXJ2bk5EbXB4V1hmVWJOeXNw?=
 =?utf-8?B?SHVHaTdWeTlyMVc4QThSdTVZem5FdXczNXZHeFNHOEU3VHkwL2p1RDZjZXhS?=
 =?utf-8?B?RUtnNkliYzFiUkE4OWR6UHIrSFVncTBwSjJCVUdzdVFFYjZRYUhZbWx3SnRk?=
 =?utf-8?B?T0RkWUM3R1RqdFJaM0RaWVk2WmlJYjF0a1pQY0hmeVMzYmRRRlpCNTlmZGI4?=
 =?utf-8?B?Q2ozbHlhTWh0ZWhQajE0Tm80OFI3d0k0dmtRL1B3ZWVSckw1WFhtMTRYeDlj?=
 =?utf-8?B?SWdMdmxaamtUL0N6SzJqcjdCSkFadzI5UFJhSzQvREtqeXdnV3hsRitkN0lr?=
 =?utf-8?B?bEpFY3pYK2U3aWVZUnJSSHdJamMxUzhqWWNxZzROOGdTZXFzNVg2M1Z6bzRN?=
 =?utf-8?B?MVVFS0lXSWlZak1GYVRPdlpKYkJpNW5aaFZoREFqVWR2N3YwcFQvNjFaajA3?=
 =?utf-8?B?dEViK1JGWmNVaVk0aXFrdWU1YzBxSFNWd1VtMWpTUEtST3NiMDRsV01EbU5R?=
 =?utf-8?B?N3VMYXc3cjVYQ2lYNWg1cXZjTWRRSndma3RvMDZVUXRqZklydHJaWFdvNWI5?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06AD827924587949B9B3BA8B854C7221@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe5ec4d-7b6d-448d-11c2-08dbbf72778f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 15:57:35.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gC/iLkMLJsHV5h7vithqEqJastmW7atHlSNpRF+bumfQ0Ym15geHnfz0SxofLJhtxNmBzdPyQKZw9iKxUEuHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_085749_132271_CE79D0A1 
X-CRM114-Status: GOOD (  24.43  )
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

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEwOjA4ICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICBPbiBXZWQsIFNlcCAyNywgMjAyMyBhdCAxMTozNDoyOEFNICswODAw
LCBLdXlvIENoYW5nIHdyb3RlOg0KPiA+IEZyb206IGt1eW8gY2hhbmcgPGt1eW8uY2hhbmdAbWVk
aWF0ZWsuY29tPg0KPiA+IA0KPiA+IFtTeW5kcm9tZV0gaHVuZyBkZXRlY3Qgc2hvd3MgYmVsb3cg
d2FybmluZyBtc2cNCj4gPiBbIDQzMjAuNjY2NTU3XSBbICAgVDU2XSBraHVuZ3Rhc2tkOiBbbmFt
ZTpodW5nX3Rhc2smXUlORk86IHRhc2sNCj4gc3RyZXNzYXBwdGVzdDoxNzgwMyBibG9ja2VkIGZv
ciBtb3JlIHRoYW4gMzYwMCBzZWNvbmRzLg0KPiA+IFsgNDMyMC42NjY1ODldIFsgICBUNTZdIGto
dW5ndGFza2Q6DQo+IFtuYW1lOmNvcmUmXXRhc2s6c3RyZXNzYXBwdGVzdCAgIHN0YXRlOkQgc3Rh
Y2s6MCAgICAgcGlkOjE3ODAzDQo+IHBwaWQ6MTc1NzkgIGZsYWdzOjB4MDQwMDAwMDgNCj4gPiBb
IDQzMjAuNjY2NjAxXSBbICAgVDU2XSBraHVuZ3Rhc2tkOiBDYWxsIHRyYWNlOg0KPiA+IFsgNDMy
MC42NjY2MDddIFsgICBUNTZdIGtodW5ndGFza2Q6ICBfX3N3aXRjaF90bysweDE3Yy8weDMzOA0K
PiA+IFsgNDMyMC42NjY2NDJdIFsgICBUNTZdIGtodW5ndGFza2Q6ICBfX3NjaGVkdWxlKzB4NTRj
LzB4OGVjDQo+ID4gWyA0MzIwLjY2NjY1MV0gWyAgIFQ1Nl0ga2h1bmd0YXNrZDogIHNjaGVkdWxl
KzB4NzQvMHhkNA0KPiA+IFsgNDMyMC42NjY2NTZdIFsgICBUNTZdIGtodW5ndGFza2Q6ICBzY2hl
ZHVsZV90aW1lb3V0KzB4MzQvMHgxMDgNCj4gPiBbIDQzMjAuNjY2NjcyXSBbICAgVDU2XSBraHVu
Z3Rhc2tkOiAgZG9fd2FpdF9mb3JfY29tbW9uKzB4ZTAvMHgxNTQNCj4gPiBbIDQzMjAuNjY2Njc4
XSBbICAgVDU2XSBraHVuZ3Rhc2tkOiAgd2FpdF9mb3JfY29tcGxldGlvbisweDQ0LzB4NTgNCj4g
PiBbIDQzMjAuNjY2NjgxXSBbICAgVDU2XQ0KPiBraHVuZ3Rhc2tkOiAgX19zZXRfY3B1c19hbGxv
d2VkX3B0cl9sb2NrZWQrMHgzNDQvMHg3MzANCj4gPiBbIDQzMjAuNjY2NzAyXSBbICAgVDU2XQ0K
PiBraHVuZ3Rhc2tkOiAgX19zY2hlZF9zZXRhZmZpbml0eSsweDExOC8weDE2MA0KPiA+IFsgNDMy
MC42NjY3MDldIFsgICBUNTZdIGtodW5ndGFza2Q6ICBzY2hlZF9zZXRhZmZpbml0eSsweDEwYy8w
eDI0OA0KPiA+IFsgNDMyMC42NjY3MTVdIFsgICBUNTZdDQo+IGtodW5ndGFza2Q6ICBfX2FybTY0
X3N5c19zY2hlZF9zZXRhZmZpbml0eSsweDE1Yy8weDFjMA0KPiA+IFsgNDMyMC42NjY3MTldIFsg
ICBUNTZdIGtodW5ndGFza2Q6ICBpbnZva2Vfc3lzY2FsbCsweDNjLzB4ZjgNCj4gPiBbIDQzMjAu
NjY2NzQzXSBbICAgVDU2XSBraHVuZ3Rhc2tkOiAgZWwwX3N2Y19jb21tb24rMHhiMC8weGU4DQo+
ID4gWyA0MzIwLjY2Njc0OV0gWyAgIFQ1Nl0ga2h1bmd0YXNrZDogIGRvX2VsMF9zdmMrMHgyOC8w
eGE4DQo+ID4gWyA0MzIwLjY2Njc1NV0gWyAgIFQ1Nl0ga2h1bmd0YXNrZDogIGVsMF9zdmMrMHgy
OC8weDljDQo+ID4gWyA0MzIwLjY2Njc2MV0gWyAgIFQ1Nl0ga2h1bmd0YXNrZDogIGVsMHRfNjRf
c3luY19oYW5kbGVyKzB4N2MvMHhlNA0KPiA+IFsgNDMyMC42NjY3NjZdIFsgICBUNTZdIGtodW5n
dGFza2Q6ICBlbDB0XzY0X3N5bmMrMHgxOGMvMHgxOTANCj4gPiANCj4gPiBbQW5hbHlzaXNdDQo+
ID4gDQo+ID4gQWZ0ZXIgYWRkIHNvbWUgZGVidWcgZm9vdHByaW50IG1hc3NhZ2UsIHRoaXMgaXNz
dWUgaGFwcGVuZWQgYXQNCj4gc3RvcHBlcg0KPiA+IGRpc2FibGUgY2FzZS4NCj4gPiBJdCBjYW5u
b3QgZXhlYyBtaWdyYXRpb25fY3B1X3N0b3AgZnVuIHRvIGNvbXBsZXRlIG1pZ3JhdGlvbi4NCj4g
PiBUaGlzIHdpbGwgY2F1c2Ugc3R1Y2sgb24gd2FpdF9mb3JfY29tcGxldGlvbi4NCj4gDQo+IEhv
dyBkaWQgeW91IGdldCBpbiB0aGlzIHNpdHVhdGlvbj8NCj4gDQoNClRoaXMgaXNzdWUgb2NjdXJz
IGF0IENQVSBob3RwbHVnL3NldF9hZmZpbml0eSBzdHJlc3MgdGVzdC4NClRoZSByZXByb2R1Y2Ug
cmF0aW8gaXMgdmVyeSBsb3coYWJvdXQgb25jZSBhIHdlZWspLg0KDQpTbyBJIGFkZC9yZWNvcmQg
c29tZSBkZWJ1ZyBtZXNzYWdlIHRvIHNuYXBzaG90IHRoZSB0YXNrIHN0YXR1cyB3aGlsZSBpdA0K
c3R1Y2sgb24gd2FpdF9mb3JfY29tcGxldGlvbi4NCg0KQmVsb3cgaXMgdGhlIHNuYXBzaG90IHN0
YXR1cyB3aGlsZSBpc3N1ZSBoYXBwZW5lZDoNCg0KY3B1X2FjdGl2ZV9tYXNrIGlzIDB4RkMNCm5l
d19tYXNrIGlzIDB4OA0KcGVuZGluZy0+YXJnLmRlc3RfY3B1IGlzIDB4Mw0KdGFza19vbl9jcHUo
cnEscCkgaXMgMQ0KdGFza19jcHUgaXMgMHgyDQpwX19zdGF0ZSA9IFRBU0tfUlVOTklORw0KZmxh
ZyBpcyBTQ0FfQ0hBQ0t8U0NBX1VTRVINCnN0b3Bfb25lX2NwdV9ub3dhaXQoc3RvcHBlci0+ZW5h
YmxlZCkgcmV0dXJuIHZhbHVlIGlzIGZhbHNlLg0KDQpJIGFsc28gcmVjb3JkIHRoZSBmb290cHJp
bnQgYXQgbWlncmF0aW9uX2NwdV9zdG9wLg0KSXQgc2hvd3MgdGhlIG1pZ3JhdGlvbl9jcHVfc3Rv
cCBpcyBub3QgZXhlY3V0ZS4NCg0KDQo+ID4gU2lnbmVkLW9mZi1ieToga3V5byBjaGFuZyA8a3V5
by5jaGFuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGtlcm5lbC9zY2hlZC9jb3JlLmMg
fCA1ICsrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9jb3JlLmMgYi9rZXJu
ZWwvc2NoZWQvY29yZS5jDQo+ID4gaW5kZXggMWRjMGIwMjg3ZTMwLi45OGMyMTdhMWNhYTAgMTAw
NjQ0DQo+ID4gLS0tIGEva2VybmVsL3NjaGVkL2NvcmUuYw0KPiA+ICsrKyBiL2tlcm5lbC9zY2hl
ZC9jb3JlLmMNCj4gPiBAQCAtMzA0MSw4ICszMDQxLDkgQEAgc3RhdGljIGludCBhZmZpbmVfbW92
ZV90YXNrKHN0cnVjdCBycSAqcnEsDQo+IHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgc3RydWN0IHJx
X2ZsYWcNCj4gPiAgdGFza19ycV91bmxvY2socnEsIHAsIHJmKTsNCj4gPiAgDQo+ID4gIGlmICgh
c3RvcF9wZW5kaW5nKSB7DQo+ID4gLXN0b3Bfb25lX2NwdV9ub3dhaXQoY3B1X29mKHJxKSwgbWln
cmF0aW9uX2NwdV9zdG9wLA0KPiA+IC0gICAgJnBlbmRpbmctPmFyZywgJnBlbmRpbmctPnN0b3Bf
d29yayk7DQo+ID4gK2lmICghc3RvcF9vbmVfY3B1X25vd2FpdChjcHVfb2YocnEpLCBtaWdyYXRp
b25fY3B1X3N0b3AsDQo+ID4gKyAgICAmcGVuZGluZy0+YXJnLCAmcGVuZGluZy0+c3RvcF93b3Jr
KSkNCj4gPiArcmV0dXJuIC1FTk9FTlQ7DQo+IA0KPiBBbmQgLUVOT0VOVCBpcyB0aGUgcmlnaHQg
cmV0dXJuIGNvZGUgZm9yIHdoZW4gdGhlIHRhcmdldCBDUFUgaXMgbm90DQo+IGF2YWlsYWJsZT8N
Cj4gDQo+IEkgc3VzcGVjdCB5b3UncmUgbWlzc2luZyBtb3JlIHRoYW4gaGFscCB0aGUgcGljdHVy
ZSBhbmQgdGhpcyBpcyBhDQo+IGJhbmQtYWlkIHNvbHV0aW9uIGF0IGJlc3QuIFBsZWFzZSB0cnkg
aGFyZGVyLg0KPiANCg0KSSB0aGluayAtRU5PRU5UIG1lYW5zIHN0b3BwZXIgaXMgbm90IGV4ZWN1
dGU/IA0KUGVyaGFwcyB0aGUgZXJyb3IgY29kZSBpcyBhYnVzZWQsIG9yIGNvdWxkIHlvdSBraW5k
bHkgZ2l2ZSBtZSBzb21lDQpzdWdnZXN0aW9ucz8NCg0KVGhhbmtzLA0KS3V5bw0KDQo+ID4gIH0N
Cj4gPiAgDQo+ID4gIGlmIChmbGFncyAmIFNDQV9NSUdSQVRFX0VOQUJMRSkNCj4gPiAtLSANCj4g
PiAyLjE4LjANCj4gPiANCg==

