Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C1CC35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Q9+Jna1JWvy/QZtNBZAyQQQWLC6kcbv3SDc+S3M8M=; b=NaiOjAQVZ5HhTgvsh4cGul2SIW
	wy86g7jZoOFEMcHSVma9yLUL8eulmB4gq6UTwrN6FvCPL1l7ocvaAGXi7eWaJzYGEesbpDikin9Za
	mTouMGrskF5Kw0z2b42kQxf/uRpmp+QrPTUFbnKGOGIdFDa18rFIVAhm2fNcdr7zLDdYvQt80k6f/
	W4l7slTZaY00JO3B6q/AToF1hRPLoG3jB8JXsDazeGGL7BK/+MuFt6JhHgYY8sf82VPQ97go5Cgsd
	A1uLqt1EryE0EI1Ky861rRgD6kluH1iztr4ijT29iAeeZ/LJCfjJ0O0yGRDy70eyNfZtHlty9MLNh
	w3Pc3L0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGElE-0025hR-20;
	Thu, 21 Dec 2023 08:50:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGElA-0025f5-22;
	Thu, 21 Dec 2023 08:50:30 +0000
X-UUID: f9365f589fdd11ee958cff29c719f35b-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=//Q9+Jna1JWvy/QZtNBZAyQQQWLC6kcbv3SDc+S3M8M=;
	b=QbRkUQFl0dMbpyHO6zB0QhZlvZHI4g8E+/lCAzZ81CEUipsSx366qw/4LVkh26rd8FlUQ/yDgS/oCQW3z8N/eak/0mvptRZh2CUCvsCQAKFlJgktpeelLodwOZBxfXUZcq7w6g7metJ8w69Xx47dkRMM5DZBcr2487IKPOKuz88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:dc352fed-0c53-48bc-85fe-ce664dfca977,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:1caa0482-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f9365f589fdd11ee958cff29c719f35b-20231221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 212482556; Thu, 21 Dec 2023 01:50:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Dec 2023 16:29:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Dec 2023 16:29:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBByrIAMxxltfC0jNnxlNHpTDNz5IPRCCTOUJroKUdEhLJVumr34W/m8Hfn8JMLVptVtv6ias46tJDN9GM8HRsau0l8CKyvajvhaeJ5o+96leMN7PkgIvEDH/mTxh28p8/R8ZD8z+UcQC7H3xzr0VA8NA0lreDWpTEc0LvrfT902D4zHrkmgydcxEyGiUfvyxLun5e3a9Y6HKiNDpf7qOjpvMM3Z9KTNEZW+CYFCrdr/A1WZzHq95qChyhR8L22GV42bQMeQXsmK753LwFjbiUrCCDe/wsVFpPFVkLRg7B+8axzJ1FAZg3W/mQfF3sLCim2CbhneuJdQcEs7D1AgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//Q9+Jna1JWvy/QZtNBZAyQQQWLC6kcbv3SDc+S3M8M=;
 b=N4tL+dr3yJaQ9k1c7GMCCR01C+EIPbXiexA0BKEK6u1/uLfz+HViou2jaUjM8xkkmoDGQUdq0YWrZLkV0xIBcOp92uIsABeZHwmih5ZaH+mCzb9DfHAHdFDkrdNDk/z24MI8ZxdeE6OrdqpSOFfrWTYePIkr6lhWyUcE+nU0CTBFaZKBhrwnT1cL3P/FnDFeBlXlAxY3R2E4dBv3C9nvg5NXzl1vuFoCa2yz8f2rHDso5KFHqu/azsHPzW+2eKzGd6LSR485fuL/2jtnZTA2xjNy74/LgAtRCA5Bi4xhMKTOyIvga1DhiCpMvnKer4CxlqQdL9lW0/XGIJLgkW1aSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//Q9+Jna1JWvy/QZtNBZAyQQQWLC6kcbv3SDc+S3M8M=;
 b=kguFe1nuxpC9fjI/vXk8ecHINxxDi1lT/DZamWXcpNy9Ent1hO4xUzbIechJzh2A6NjWu+JXDxM9k5z2YfcAA9Z9tZtK5a5yf6nQ1o9RozSsoYHTimA+74QxOP1bv95Wu5Gaj2QOR2Y18NdAJVzfc5zq1MRzj5h+RNZtp93Lfzk=
Received: from KL1PR03MB7366.apcprd03.prod.outlook.com (2603:1096:820:ea::9)
 by PSAPR03MB6283.apcprd03.prod.outlook.com (2603:1096:301:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 08:29:39 +0000
Received: from KL1PR03MB7366.apcprd03.prod.outlook.com
 ([fe80::abaa:4817:8b51:4e2f]) by KL1PR03MB7366.apcprd03.prod.outlook.com
 ([fe80::abaa:4817:8b51:4e2f%3]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 08:29:39 +0000
From: =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "msp@baylibre.com"
	<msp@baylibre.com>
CC: "fparent@baylibre.com" <fparent@baylibre.com>,
	=?utf-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
	<Chris-qj.Chen@mediatek.com>, =?utf-8?B?QmVuIExvayAo6Zm45b+X5oGGKQ==?=
	<ben.lok@mediatek.com>, =?utf-8?B?TG91aXMgWXUgKOa4uOaUv+mMlSk=?=
	<louis.yu@mediatek.com>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
	<bear.wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, "afgros@baylibre.com"
	<afgros@baylibre.com>, =?utf-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?=
	<Xiufeng.Li@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
	<fan.chen@mediatek.com>, "abailon@baylibre.com" <abailon@baylibre.com>
Subject: Re: Discuss Mediatek Power Domain Driver Support Mulitle Smi Clamp
 Protection
Thread-Topic: Discuss Mediatek Power Domain Driver Support Mulitle Smi Clamp
 Protection
Thread-Index: AQHaMyf3Pw5T92RR2kOvGPBTY4rb8LCyJcaAgAFDlIA=
Date: Thu, 21 Dec 2023 08:29:38 +0000
Message-ID: <f8150ce2859bc8d22d2fa7cbc671bf2d43d4a86d.camel@mediatek.com>
References: <a3aaf3180fdb3da117132089bd160ba4d5cebc17.camel@mediatek.com>
	 <b4fa9b7f-512f-4a34-884a-a99a3b035d34@collabora.com>
In-Reply-To: <b4fa9b7f-512f-4a34-884a-a99a3b035d34@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7366:EE_|PSAPR03MB6283:EE_
x-ms-office365-filtering-correlation-id: f415eda8-26fd-4ee1-e943-08dc01fef8f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6GhoEdXJ3bXiGG3RefUcPBtK7HxLNRPIJALNchWY20CS7lxCn+Y0hMcV33x7LmtaMhbDcTNTwziFMOKFY3+hqm39Y2DMa6Wyj5Yi2PtGchJHoOb9fntS/dpo687X2tI4Q2fUKblUnuEZuXLa3GdpmayRXTI84loF8YCLiImncQYELvHl7ZBh6sGko4nDn+ecP0htIVMWf+wzC3B63um06GxGR0kWhUmOl2B/wc0Y+1zY6sgWvKryojcAeLP3J15KoX9ZFvtntZ55DZaZG/ErbordQ+nnwEnj0PvWpmBHclPR4au+14zq3Kdwe5gUHsVctx49e40az0LWadIo7CsKEmS05nrdQ2CCaENKXBPIOf5+N2ktmd9ayHMOGJ9SHjZVVHQZ/PmNIoJsi+dG+tht7UjsjtGkYK6ue5TeHuvvI8rPlZZspNjiZE01hVd++x2Em61y65HD6cD98/qskDB2A43pz/Guy9kFfNyWBClr7ZQA7NZUYBpWjL62s4rPIc58b87FiY39EmQoecWtD6bC19SIIslZ7kzuJjX5b67HPeRrsmIJ8D/C9famGk2PVxN2pg1P3iHtBu/C8vYKz9sacvnDmilsGu/S21tQxkEA8dTKXIYSi/WHypsmNnBAmpw2O4F/arWeKYh48ZoE3kGU3y2aNBvDf1Sk3PfdKqNezZomXQtgYneCVoqRaHncSish
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7366.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(478600001)(71200400001)(6486002)(2616005)(966005)(5660300002)(8676002)(4326008)(91956017)(83380400001)(110136005)(38070700009)(8936002)(38100700002)(122000001)(4001150100001)(2906002)(6506007)(6512007)(316002)(64756008)(85182001)(36756003)(54906003)(76116006)(66446008)(66476007)(66556008)(86362001)(41300700001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NExCeVpxL1BVdXJudzRYTGNpNmRLTDJIUmR6cW9ybFhoT016c0VUcTRaUHZW?=
 =?utf-8?B?eVFnRkp6UlZoWnBsUVJPUnJnVW1iL3VBaVRXRUFUVnh4Y3U3b0F1QXUxYTF0?=
 =?utf-8?B?dFdTVGo4b1RHV2xnV2xEUWpkV0xjZitZajFQald5U0lMUXBTQTBMS0EzZ0NL?=
 =?utf-8?B?ODVhRWdaUWhzYmpvUkdXNmdVRTZybXYva1d4alR0Tlh0WjB2VWRwU0dLT244?=
 =?utf-8?B?OGZMUnNEL0Rtbm9HcThlbGJORDVLNzJEek10YkJRRW9zSXF2RzFZT2x1enFT?=
 =?utf-8?B?ajVoUmhNaVREQm84NnlCNXBUa2RsOVVaRVRpOG9NOENHVVQyZ2FFTjBrNC9p?=
 =?utf-8?B?Ri90ZitON0F5WEM5VzVRT3Y4SGlid3cxQXIvKzFydXBXSFhlNzBkb2VaRHJQ?=
 =?utf-8?B?L2d2N01FLzNCUTMxLzd5QzFzMmNtVno1TE1GY2VYeG84N0lOUHRyZjFkRXIv?=
 =?utf-8?B?WXpCMXdhNUZDd0dwTEIyWTVyMHo4MGF1RUNQSXlFbERpbHhxWGxVR2t1a0dF?=
 =?utf-8?B?NnJ3VEZTZDVXKzd6OEQ0UHpYRUxxUjVCK1JTSDBpR1lldVJZQUlVa0s3REdQ?=
 =?utf-8?B?djNqYTgvNE5UZ25CU1ZUY2tYUXo5NTk2QjMzT1pkeThXbkZvOVVPVVI2ZTFM?=
 =?utf-8?B?bmxZSWcxM2tWV0ppOUJaSDBjaGxsaDdERFYvTWdxNUlhYVQ3c2RoU2xpVnkw?=
 =?utf-8?B?bmRrQjVxbWI3YXBLNHBtNlpPNzVDMWI5dUlCbGlROXhFTzJSc096TjF6aTB2?=
 =?utf-8?B?d1ppaVhqOHg2a1o0M3RIYkNXenhxY2QrV2l4aWk5VGcrNUpIbHgzT3VQUVoy?=
 =?utf-8?B?aFFHVU1BclN0djNSNDRSbjhka3hhWUpMR2F2N0RMQmpMV3VkQkFpTElVVWtw?=
 =?utf-8?B?VjJqand2RTA4dDZsNWh1RC9DOUx5NlVhc0JzMXRUcUtRck04ekNZSnEwaTMz?=
 =?utf-8?B?bDkwU0JXSllKOWlnb2Y2c0xNQlc0K011VHovb1NYT1NNSjJRZXlNeE1GamVh?=
 =?utf-8?B?T1VxOGVDdzI0ZDFyQmEyMUV1aXlFSytvcmc2WVU1a2RtVENOMWJBU09lUWhl?=
 =?utf-8?B?cHhhcDB0V3daRmhrNEdialFhaEhrclJIVlJ1d09iN3lsQ1M1OG5mZmo0ejhr?=
 =?utf-8?B?c2hyUVQwRnlNOGQwVVR2aWNYd1p4dldGRk5VVWlvS0ZiMjZyYlVuUU5jU01r?=
 =?utf-8?B?YmJZWDRVS3dMRUNSNlBqWktOUXFZY1JIUjRvSTFGWFVJTDlscVlYeWt5RjNn?=
 =?utf-8?B?QlppcTBPakhUdHQ1a2FzZm0zbnVuZVg4VlRJWjhFSWVBZ29adk81d2ZGaDRG?=
 =?utf-8?B?cUcvQThZL05qY0MrRlVJUHVFdm9yZjU1UEgrbWdXa0QwNXg3Q1dJRkswSFIz?=
 =?utf-8?B?QWZIVGl1R0xPbEJZK1ZrY3REb000MnhoWDFxSFNDeXhKR3VMU01OYmZadkt6?=
 =?utf-8?B?Y0Q1TVVVeXczRWhkcGlxbHJ6cGg0cnI3OExGd3F5bVZrWEFmRDZUenVjMWQ3?=
 =?utf-8?B?N3UwaFZWNnVVQWUyRTdJZmxKQ2NBUzRheWNVNVVmK2xSZDEybHd1QWZGeWtN?=
 =?utf-8?B?Y3ViRTZZdXNiK045cGZ6eVpjWEp2QWR4aGY4S0tMbDZkLysxTDdhSzdveE03?=
 =?utf-8?B?NWhQN3B4NWVxakpIVXFMeWt1TFN6eDNSL1gybW90TmFxNkJjTUlBdkJTZ0J2?=
 =?utf-8?B?Vlk5VWZpN2ppQTB6aUdhaFVjRVBBRkFRdk42ZkZveG5yQVhWMVNRZk1vaXVZ?=
 =?utf-8?B?c1VjV2ZVSTlRUGFicld0V0UzekExVCt1bzZzRUtqR2ZFZG9Va1h3S3NEV0Q1?=
 =?utf-8?B?YjN3blU5T3pnSVY0VnFRcWMxdzRoMVVlYlFLZlkzY3FvU1VsWm9BMXVyaE1s?=
 =?utf-8?B?YXVVL0YvRlBjM2ZwSjlxdjhuTTQyckZLcmxBWlBYMUlRU1NIQldSVHV6bC9D?=
 =?utf-8?B?SGVRRTZrMFdySEk4OWVqajdvcFJ6RDBLc3N0VXdKSnRHSmk3V01WVytOWVhq?=
 =?utf-8?B?QjNGWi9UWGEzK2gwN2RJQXlpOElSN29NOEloTVhVczJ5WC9nWHNSRjcxSmpK?=
 =?utf-8?B?MmZzc3N2NncxQ0hxc0swOFNuV1lRUlNzVGo1M1BUU3VJWDdka0pkU3lwUDd4?=
 =?utf-8?B?d2N4aG9QVDZXcDlZZS8wTmNxUCs2RWcybjRaQ29teFJkMmVET09YcUNKc20r?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B77144CD4C0942BE890E65D04FC219@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7366.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f415eda8-26fd-4ee1-e943-08dc01fef8f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 08:29:38.9635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VTY7u6gwETEESBWodakozvQWTOe7212G7Fwi7HlvDaCy35/kq3ow87Uj6cQTpihTtqpcqc+coB3BdPDRyburLOcOjWJuPeO/pZ+RHKG84+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_005028_682358_97B4D6BE 
X-CRM114-Status: GOOD (  32.78  )
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

T24gV2VkLCAyMDIzLTEyLTIwIGF0IDE0OjExICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjAvMTIvMjMgMTA6MzYsIFl1LWNoYW5nIExlZSAo5p2O56a555KL
KSBoYSBzY3JpdHRvOg0KPiA+IERlYXIgTWFya3VzLCBNYXR0aGlhcywgQW5nZWxvOg0KPiA+IA0K
PiA+IEkgYW0gd3JpdGluZyB0byBzZWVrIHlvdXIgZXhwZXJ0aXNlIGFuZCBhZHZpY2UgcmVnYXJk
aW5nIHRoZQ0KPiA+IHJldmlzaW9uDQo+ID4gb2YgdGhlIE1lZGlhdGVrIHBvd2VyIGRvbWFpbiBk
cml2ZXIgZm9yIHRoZSBNVDgxODggcGxhdGZvcm0uDQo+ID4gU3BlY2lmaWNhbGx5LCB0aGUgZGlz
cGxheSBwb3dlciBkb21haW4gcmVxdWlyZXMgbXVsdGlwbGUgU01JIGNsYW1wDQo+ID4gcHJvdGVj
dGlvbnMgKHJlZmVyIHRvIFsxXSBpbiBtdDgxODguZHRzICJNVDgxODhfUE9XRVJfRE9NQUlOX0RJ
UCINCj4gPiAibWVkaWF0ZWssc21pIikuIEhvd2V2ZXIsIHRoZSBjdXJyZW50IHZlcnNpb24gb24g
dGhlIG1haW4gYnJhbmNoLA0KPiA+IHdoaWNoDQo+ID4gaGFzIGFscmVhZHkgbWVyZ2VkIFNNSSBh
bmQgaW5mcmEgYnVzIHByb3RlY3Rpb24gKG1haW5seSBbMl0pLA0KPiA+IGNvbXBsaWNhdGVzIHRo
ZSBtYXBwaW5nIG9mIGluZGl2aWR1YWwgU01JcyB0byB0aGVpciByZXNwZWN0aXZlIGJ1cw0KPiA+
IHByb3RlY3Rpb25zLg0KPiA+IA0KPiA+IFdoaWxlIG5vdCBhIGNvbXBsZXRlIHNvbHV0aW9uLCBJ
IGJlbGlldmUgdGhlIHBhdGNoIGluIFszXSBtYXkNCj4gPiBiZXR0ZXINCj4gPiBpbGx1c3RyYXRl
IG15IGludGVudGlvbnMuDQo+ID4gDQo+ID4gTWFya3VzIGhhcyBwcm92aWRlZCBzb21lIHRob3Vn
aHRzIGFuZCByZWNvbW1lbmRhdGlvbnMgdGhhdCBJIHdhbnQNCj4gPiB0bw0KPiA+IGJyaW5nIGZv
cndhcmQsIGhvcGluZyB0byBnYWluIGZ1cnRoZXIgZGlyZWN0aW9uIGJhc2VkIG9uIHlvdXINCj4g
PiBleHBlcnRpc2UuDQo+ID4gDQo+ID4gMS5NeSBpbml0aWFsIHRob3VnaHQgaXMgdG8gcmV2ZXJ0
IHRoZSBjaGFuZ2VzIG1hZGUgaW4gWzJdLCB3aGljaA0KPiA+IHNlcGFyYXRlZCB0aGUgU01JIGlu
ZnJhIGJ1cyBwcm90ZWN0aW9uIG9wZXJhdGlvbnMuIFRoaXMgYXBwcm9hY2gNCj4gPiB3b3VsZA0K
PiA+IHNpbXBsaWZ5IHRoZSBtYXBwaW5nIG9mIG11bHRpcGxlIFNNSXMgdG8gYnVzIHByb3RlY3Rp
b25zIGJ5IHRoZWlyDQo+ID4gb3JkZXINCj4gPiBpbiB0aGUgRFRTLiBIb3dldmVyLCByZXZlcnRp
bmcgdG8gYW4gb2xkZXIgdmVyc2lvbiBtYXkgbm90IGJlDQo+ID4gZGVzaXJlZC4NCj4gPiANCj4g
DQo+IFJlbHlpbmcgb24gdGhlIG9yZGVyIG9mIGJ1cyBwcm90ZWN0aW9ucyBpbiBEVFMgY2FuIGJl
IGZsYWt5IGFuZCBwcm9uZQ0KPiB0byBnZW5lcmF0ZQ0KPiBmdXR1cmUgbWlzdGFrZXM7IHJlbWVt
YmVyIHRoYXQgd2hhdGV2ZXIgd2Ugc2VuZCB1cHN0cmVhbSBpcyBzb21ldGhpbmcNCj4gdGhhdCBu
b3QNCj4gb25seSBoYXMgdG8gYmUgd29ya2luZywgY2xlYW4sIHNvbGlkIGFuZCByZWxpYWJsZSwg
YnV0IHdlIHNob3VsZCBhbHNvDQo+IHRha2UgY2FyZQ0KPiBvZiBhdm9pZGluZyBmdXR1cmUgbWlz
dGFrZXMgdGhhdCBjb3VsZCBoYXBwZW4gd2hlbiBzb21lYm9keSBmcm9tIHRoZQ0KPiBjb21tdW5p
dHksIG9yDQo+IG90aGVyIE1lZGlhVGVrIGVuZ2luZWVycywgaW1wbGVtZW50IG5ldyBwbGF0Zm9y
bXMuDQoNCj4gUmV2ZXJ0aW5nIGNvbW1pdHMgaXMgbm90IHByb2hpYml0ZWQgYXMgbG9uZyBhcyB3
ZSdyZSBub3QgYnJlYWtpbmcNCj4gc3VwcG9ydCBmb3IgYW55DQo+IHBsYXRmb3JtIChzbywgYXMg
bG9uZyBhcyB3ZSdyZSBub3QgcmVtb3ZpbmcgZmVhdHVyZXMpLCBidXQgc3RpbGwsIEkNCj4gZG9u
J3QgdGhpbmsNCj4gdGhhdCB0aGlzIGlzIHRoZSBiZXN0IHNvbHV0aW9uLCBob25lc3RseS4NCj4g
DQo+IEJlc2lkZXMsIEkgZG9uJ3QgZ2V0IHdoeSB0aGUgb3JkZXIgb2YgU01JIHBoYW5kbGVzIGlz
IGltcG9ydGFudCwgY2FuDQo+IHlvdSBwbGVhc2UNCj4gZXhwbGFpbiB3aHk/DQoNCkkgYXBvbG9n
aXplIGZvciB0aGUgY29uZnVzaW9uLCBUaGUgYnBfY2ZnIG9yZGVyIGluIG10ODE4OC1wbS1kb21h
aW4uaA0KaXMgaW1wb3J0YW50IGJlY2F1c2UgdGhlIG9yZGVyIG9mIGJ1cyBwcm90ZWN0aW9uIGlz
IGRlcG5lZCBvbiBpdC4NCkhvd2V2ZXIgc21pIGNsYW1wIHByb3RlY3Rpb24gc2hvdWxkIGJlIGRv
bmUgYmVmb3JlIGluZnJhIG9uZS4gU28gcmVseQ0Kb24gdGhpcyBpcyBhbHNvIGEgbGl0dGxlIHNo
YWt5IEkgdGhpbmsuIEFsc28gaXQgd2lsbCB0YWtlIHNvbWUgb3ZlcmhlYWQNCnRvIGxvb3AgdGhy
b3VnaCBicF9jZmcsIG1peGVkIHdpdGggaW5mcmEgYW5kIHNtaSwgdG8gZmluZCB0aGUgY29ycmVj
dA0KbmFtZSBzbWkgdG8gZG8gY2xhbXAgcHJvdGVjdGlvbi4NCg0KVGhhdCB3aHkgdGhlIGZpcnN0
IGFwcHJvYWNoIHNlZW1zIHN0cmFpZ2h0IGZvcndhcmQgdG8gbWUgYmVjYXVzZSBpdA0Kc2VwYXJh
dGUgc21pIGFuZCBpbmZyYS4gQW5kIHdlIGNhbiBkbyBkaWZmZXJlbnQgcHJvdGVjdGlvbiB3aXRo
IHRoZW0uDQoNCj4gDQo+ID4gMi5UaGUgc2Vjb25kIGFwcHJvYWNoLCBzdWdnZXN0ZWQgYnkgTWFy
a3VzLCBpcyB0byBpbnRyb2R1Y2UNCj4gPiAibWVkaWF0ZWssc21pLW5hbWVzIiBhbmQgY29udmVy
dCAibWVkaWF0ZWssc21pIiB0byBhbiBhcnJheSBvZg0KPiA+IHBoYW5kbGVzLiBXZSBjb3VsZCBh
ZGQgYSBuZXcgZmllbGQgdG8gdGhlIHN0cnVjdA0KPiA+IHNjcHN5c19idXNfcHJvdF9kYXRhLA0K
PiA+IHN1Y2ggYXMgY29uc3QgY2hhciAqc21pX25hbWUsIHdoaWNoIGNvdWxkIGJlIE5VTEwgKGZv
ciBkZXZpY2UgdHJlZXMNCj4gPiB3aXRoIG9ubHkgYSBzaW5nbGUgcHJvcGVydHkpLiBUaGlzIHdh
eSwgd2UgY2FuIHVzZSB0aGUgc21pLW5hbWVzIHRvDQo+ID4gc3BlY2lmeSB0aGUgZGVzaXJlZCBT
TUkuIFdoaWxlIHRoaXMgbWV0aG9kIHJldGFpbnMgdGhlIGN1cnJlbnQgY29kZQ0KPiA+IHN0cnVj
dHVyZSwgdGhlIGltcGxlbWVudGF0aW9uIG1heSBub3QgYmUgYXMgc3RyYWlnaHRmb3J3YXJkLg0K
PiA+IA0KPiANCj4gVG8gYmUgY29tcGxldGVseSBob25lc3QsIG5laXRoZXIgb2YgdGhlIHR3byBh
cHByb2FjaGVzIGFyZSBzdGF0ZSBvZg0KPiB0aGUgYXJ0LA0KPiBidXQgdGhlIG1lZGlhdGVrLHNt
aS1uYW1lcyBvbmUgaXMgYmV0dGVyIHRoYW4gdGhlIGZpcnN0LCBncmFudGVkIHRoYXQNCj4gd2UN
Cj4gcmVhbGx5IG5lZWQgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIFNNSXMgYXJlIG9yZGVyZWQuDQo+
IA0KPiBCdXQgYWdhaW4sIG15IHF1ZXN0aW9uIGlzOiB3aHkgc2hvdWxkIHRob3NlIGJlIG9yZGVy
ZWQ/DQo+IENhbid0IHdlIGNsYW1wIElNRzEgYmVmb3JlIGNsYW1waW5nIElNRzA/DQo+IA0KV2Ug
Y2FuIGNsYW1wIElNRzEgYmVmb3JlIGNsYW1waW5nIElNRzAsIEkgYW0gbW9yZSBjb25jZXJuZWQg
d2l0aCB0aGUNCm9yZGVyIGJldHdlZW4gaW5mcmEgYW5kIHNtaSByYXRoZXIgdGhhbiB0aGUgb3Jk
ZXIgYmV0d2VlbiBzbWkuIEFuZCBJDQp0aGluayBjdXJyZW50IHN0cnVjdHVyZSBtaXhlZCBzbWkg
YW5kIGluZnJhIG1heSBhbHNvIGludHJvZHVjZQ0KbWlzdW5kZXJzdGFuZGluZyBpbiB0aGUgZnV0
dXJlLiBNYXliZSBzZXBhcmF0ZSB0aGUgYnBfY2ZnIGFuZCBtYXRjaCB0aGUNCnNtaSBuYW1lIHdp
dGggc21pJ3MgYnVzIHByb3RlY3Rpb24gc3RlcCBjb3VsZCBiZSBhIGRpcmVjdGlvbiB0byBmaXgg
dGhlDQpwcm9ibGVtPw0KDQpUaGFua3MgZm9yIHlvdXIgdGltZWx5IGZlZWRiYWNrIQ0KDQpCZXN0
IFJlZ2FyZHMsDQp5dS1jaGFuZy5sZWUNCg0KDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KPiA+
IEF0dGVtcHRpbmcgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCBJIGZpbmQgdGhlIGZpcnN0IG9wdGlv
biBlYXNpZXINCj4gPiBhbmQNCj4gPiBtb3JlIGRpcmVjdC4gSG93ZXZlciwgSSB3b3VsZCBncmVh
dGx5IGFwcHJlY2lhdGUgaGVhcmluZyB0aGUNCj4gPiB0aG91Z2h0cw0KPiA+IG9mIGV4cGVydHMg
b24gdGhpcyBtYXR0ZXIgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCB1cHN0cmVhbWluZy4NCj4gPiAN
Cj4gPiBJIGxvb2sgZm9yd2FyZCB0byB5b3VyIHZhbHVlZCByZXNwb25zZS4NCj4gPiANCj4gPiBD
aGVlcnMhDQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IFl1LWNoYW5nLmxlZQ0KPiA+IA0KPiA+IFsx
XToNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2Nocm9taXVtLmdv
b2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwvKi84NzIyMjY2NWM4
Zjk3NGU0ZmY5ZGNhNDA4Y2VkZjZiNTQwYTllNzcwX187S3chIUNUUk5LQTl3TWcwQVJidyFrRE5k
REhlakpuRFJjNkhnWXAxLUxPdlU3SWo0bTIzVUppemxRT0dnYUpFVF9ySDFqTmVnZzd0WW1oT2Y4
WGtIVlpGX2RxRzk0LWtIeWh6WDZuWkVfNmFHTkJ2MkNTeXg2ZyQNCj4gPiAgDQo+ID4gWzJdOg0K
PiA+IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwOTE4MDkzNzUxLjExODg2Njgt
Ni1tc3BAYmF5bGlicmUuY29tLw0KPiA+IFszXToNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvY2hyb21p
dW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwvKi81MDk4Mjk1X187S3chIUNUUk5LQTl3TWcwQVJidyFr
RE5kREhlakpuRFJjNkhnWXAxLUxPdlU3SWo0bTIzVUppemxRT0dnYUpFVF9ySDFqTmVnZzd0WW1o
T2Y4WGtIVlpGX2RxRzk0LWtIeWh6WDZuWkVfNmFHTkJ2bUwySGlhdyQNCj4gPiAgDQo+IA0KPiAN
Cj4gDQo=

