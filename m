Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1BFC001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=; b=vXLzxkmtns7RMSkleAf12FFiGv
	+mtH4LzNLpIiLialYE+O5yhTm1ka2YVMTuIDh0tbptFkTHIfMcGETiexZQ0gGerStX9FFoF14Smpv
	Ia2HH2AnMEvwFWLfP+CAVZ0RA/vS9Q+MQ3Xwo3yuDY0WpvtcQjIJioP2H2xdSK7uOc6cjUxdV9CGU
	O+5KMx2xxWl+BNtu+WlpT9XtAY1tPt0JiM88+SY0T2psUpOrz7jvtx+jBd6LH28w4mKvfdlrW1W9A
	H4GvP/AZKgeFTdWBw4Elf3cyePM2idgHJ1g9ThL5PJ8alXeM8UvNicOkRHlHoNBZYsWTionRZCTqY
	zpoRUtdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVbp-00GY3x-1f;
	Mon, 31 Jul 2023 16:19:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVbm-00GY2u-0L;
	Mon, 31 Jul 2023 16:18:59 +0000
X-UUID: ef57daec2fbd11ee912e1518a6540028-20230731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=;
	b=Gy14wEJp9UFu6Mfsw83udIalHE3DOlvdKOV4xh6xhu3xUNzyzedlPYFMh3tTz9KslnhjkXboJBfJxEDFZnu21TV9FkJCa0DXTSLYgaKl4h9pYeMieuOYaXM/uJ2wqtBHahqVnwZK1LujQeR9PjWd5p/7xpk4XpmHg+nI/ADiTIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:d17a5fbe-78ec-47f6-b6ec-5583244df672,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:a45aa742-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef57daec2fbd11ee912e1518a6540028-20230731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2103746134; Mon, 31 Jul 2023 09:18:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 00:08:47 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 00:08:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWwWRCtzW5rYQrmzqxZfOFlzh4/pnfmiYX3FPL7SB2NYTnBEddcOyc181ltl3KNLgr0KebtpCMnBMaXGo3J3nKj40rKOgckcg1mOvtv2O+MzxdlbIqin90C1ipo+RPLyqGBsm+CMGvvNZw1yEJOERMBpUUG8eWEA7ssa7HYBP+Iq3SblwIUrTOaC/WreSOrFgRckNSfiy11iAk49QuWm1S2xkkNxEf/AqJ6JUypMwn1GkRRN55V0Thae6xV8EqNMEPJ9jo9aFuUbVV5u3re7NywkAt5hXoFWVbJJu/4Q94DGKEccBjYOzeGY+7A5YY7OVM5sOAYWtL8pfs+4Kk6ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=;
 b=iRakJ3TuRMQ4NsOMgvNU+EC4l2JYQsVVnPTo//3BR3SJfZFY4VkWoyuAhtMfBDY1XL3cEk+NdTDoOd85rn8JUqAsFQk6Q3EPKVZeGp3w5Ntlm/g38z3TK9Cgm7TA86rQ4316Dg28QNMCeFBntdD8Xuk6geOmoJM15rXbj2AZZdF/Y5A9/vfhATNEYcbV27cCcMUBPbSXVMzoSHvH0NhbBXjacW6BJygFBmsmjY0NS4Ycg3r+TdaWGMmMws9yYT0GeZmxEDkZppZdsubwB3E0BQN1RSDopWXxe6QMBSQTMONLo7EHLhpImVnLqg0fzj40giRpLKfeiCCTvKiIKNOylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=;
 b=KH9B90kzKRZ3rJXhVIncohYuqdI5s0hZwowpMgRLY9+ww6WdqPwiJdWNIq9IDGUPMXYJxRbI3vWfFemJfp9stNPIuR79W1l/ULrm0sToImFTpI9Uv49ywQQ02PTd+xgkxRH2Zh5+EgrQCAPBVgOqNfXE7A7uFImaCazop9W+A2g=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7287.apcprd03.prod.outlook.com (2603:1096:820:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:08:44 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 16:08:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 4/4] drm/mediatek: Add DSI support for mt8188 vdosys0
Thread-Topic: [PATCH v7 4/4] drm/mediatek: Add DSI support for mt8188 vdosys0
Thread-Index: AQHZwKk9rCnXfbM4+UmRlCb5hS3iHK/O1deAgAU7ZIA=
Date: Mon, 31 Jul 2023 16:08:43 +0000
Message-ID: <a1ec3ad4c5714d9e75375decf272ec677c05a5e4.camel@mediatek.com>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
	 <20230727164114.20638-5-jason-jh.lin@mediatek.com>
	 <3dca39b3-b152-34e7-8959-78fe68e1a899@collabora.com>
In-Reply-To: <3dca39b3-b152-34e7-8959-78fe68e1a899@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7287:EE_
x-ms-office365-filtering-correlation-id: 981ef1b1-9ecb-41f8-7d0e-08db91e069cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2qymbzK62t+QGOTXJIt2Mn6zM0/QxSc24ET1pFEzAucImr8m0bznurU8M5Mt2ZKt9ZPGJbA1PpPczg93KkLJvXmGh2wfxCWS3bbJc241pxqJ5yTTsF+hla9BW4MNgPFmmjUGHZgd087VoEC4zVx3VWCKsb38sxjeaXpOXrlH2IOQGtqMX0qSk1kApdkk8mRKplYjUvwPTP4818x06VnAtoChYcGwbER7zS41xRC13Vs5gIDBvhHFfRIboD15Cu5+sl2ocT/rrogE1BD9Qg3WCoyhL+92bKF8abYdadZTkfx9hsCLnZwIhN2Fp6JmwmQhBgkofZbzFcTRZlTxP7Fx6H3/tUR/OVDiPTjOcX6N7I4YqZ6IKeE6YNObvGtEPQtrqGSrQURQBmTToNwu1Z5mXTGDP44InO55/JWmJECVPSv/myoJw276wygmZ4W7gQm211CdlcfxjJx3ZSJolSdrpvSMtEMgUU5hAHTNguv8qh0MoOnKVBOwgMjgxzpP2EQ1CLK45SeimVRBxHbiiOoeqeIwQ/7IJtlY2rmzlevsrvJudlHO+5TrpRdYutVCoxQke2C4sqmweR7Ba/AXvNiyokoxX10sT25XcjDeyeDmxbfFGDyVqdQnSQKs7KY7VJbh5Kmoac4R7jZUnXd0wlHSB2PlWTDOzabZtJVF3J211A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(71200400001)(6486002)(83380400001)(2616005)(36756003)(85182001)(26005)(186003)(6506007)(6512007)(316002)(4744005)(41300700001)(38100700002)(122000001)(64756008)(66446008)(66476007)(4326008)(66556008)(2906002)(66946007)(91956017)(76116006)(5660300002)(86362001)(8676002)(8936002)(38070700005)(110136005)(54906003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VNRVFHMkxJSjVEZXFVRGl3VnU4MmU5cFBsamdwa3RqZ1dBaDUybXlmcEE5?=
 =?utf-8?B?UlVkRC9pVy93b2UrREJDbGtJUXFEV2dHYnNqeUR5anpkdDFzLzN5RWxwcUxi?=
 =?utf-8?B?WGVyb3cvNVowTE9VS1IyTXMrU3ppRHlMYWhwdGhZMTZxRFhJWTJPQnFzeFN1?=
 =?utf-8?B?YnZydElLWEhUd1AzblE0ZjUvQVpXOEVRd0hlNkFwVGhJL1EyUEVoMGE0aW82?=
 =?utf-8?B?UVdkZEhOejJlR2IybWVHZ2VtSkVoaHNFWjBIcS9YeDNzakZQVjV1bXVUMlhC?=
 =?utf-8?B?YkQvNGZObUdvdmwvQ1RoVk9EYzRoditSdGM1UCt0TkttUVNoZkZYSzlpS0pD?=
 =?utf-8?B?Q2lOTlVZYWVNOFBIbmt5dGE3TExLTjd1TlNIVDF2WklkOXNUMnk2RmV0V3Zo?=
 =?utf-8?B?Y3NpWWJwdjlGa1Q0VDZQbk5FQXJpNEg2WTVNZFZJQ09uck9Jc0U1UXovWThk?=
 =?utf-8?B?Njd6L0dYd3FEVUJ5eXdxZWtNMmlRY0hKTmdZZHBYeEtEN21USmUxZi81Qjdn?=
 =?utf-8?B?eFVUUzY5bnlUbHowOVZSbGFtZUR4ZEs0elRNVGErSU1EanZXdVduVFZnc1Qw?=
 =?utf-8?B?KzlhK09SSXlQK2d4djRXQUhVWWtqQlAycExnRkM2S3o4aDRjT3ZMRkxLWGFk?=
 =?utf-8?B?T2tJN1dnSTF6dGNQaE1meG9vdmhSTWJmMWxuai9leTNqU2JXQnBCZUZjNWN0?=
 =?utf-8?B?RGdlY29MTUphRGJXdVRwcGIzTVlFZGMvQUZpYXBIcnRFSU1hK3ZNYjkzbm1C?=
 =?utf-8?B?YU9JTjJ5ZngxZEdTN21qeS9NbjA0OUNPSXV2REFmZ2FyVDJPQUgyRWdnSXAw?=
 =?utf-8?B?RjFyTEQycmF0TDdVVFBPTlBCSERwR0YwdjIwSDAvbUt4aitFOUI1dzV3NTF6?=
 =?utf-8?B?U1BYQkhZYnZPSWUyRk5xaG9DcDhJeEtRUHNKNnl2VS9tam05UTlLbDNJUVl5?=
 =?utf-8?B?ZnVuUDhLU3hrTzZxMVk3VWtmMTZuNWpsLzhCSFFxQXBvcVlublRJMXI4UmJT?=
 =?utf-8?B?Z1ErdHQ1dlVDOU9BcjFOcHRYaHVhRGQyZ0gwbUkzcG51M2NNOGdwYU1CMDRR?=
 =?utf-8?B?dGZ3SzYzTnh4REtuYmtZKys1RnkwV040N1pvYzlzSnBKL2Q0UGhrUXdTSERy?=
 =?utf-8?B?NDJDVFVLdlFHSWhjaGpuL24xNW5LOW5YaFVrY2pYdERkcVByVkpqSVVtUEd3?=
 =?utf-8?B?bWs0VUc3ampxRHlyajZMWFRXQnI3c2JjMWpTN3N3WVFTcE4rc0F0MFhoeHo5?=
 =?utf-8?B?Qk95T3FBUTBwa254ai9tN3l5RHBBakNXUXRxb2w4dE1OSjA3MWV3QlNoME9k?=
 =?utf-8?B?L3kvaG5zOFhoZnlpV3hQNHZVa1hjTHZiTGRGSXpyMDhBUkp1Q0JDc1pSNjZn?=
 =?utf-8?B?enRHT2NRRWducU9qRCsyWGt6K3RGQzF5eUZFK0JST1dKNHpEVmpaSzJseDdo?=
 =?utf-8?B?TmZZR0ZKTFdvajVLaVh4bGJ1b3VsQVF4ZTJlYlJIK29PSWtjTVR6V2NzaWdz?=
 =?utf-8?B?N0FnQjl3T1RUZFpTd2NQSVJDQUlTM0Uwbm96SWJudW5oMGZDVWdFa1RzSFAy?=
 =?utf-8?B?ejUzWSsyNi9OSXg1UW9hT29OTndUMlA4L0JGWnl3ZTVpVjc0VXQ1ZVFuaEJZ?=
 =?utf-8?B?TE1pSVNGZ01HN3U0VXloTEIwQk5lUUtra29aZUV0eGd0UU1pS09aclhwRnBU?=
 =?utf-8?B?dmVGTHNVdHhtV2tTWkhKcEwxTTNqdDE1RWFZdTdaV3N1RnBpNy9KbVhCT3li?=
 =?utf-8?B?eFZOd2IybXlxNzdZWTBLZGhya2p5V2s0Nk1TbzRaNEJ6SUlWSDVpT1N6VlBU?=
 =?utf-8?B?ekNPU01VK1IvdHJIeitkWEhFaTBkZXQ1WFNDbTFYVGVPZVZXMkFQeFMzbk5C?=
 =?utf-8?B?dXloV3BadUk1Wll0RVljZW9ONWx3MlU5eWpiVWFTdE84cFowN3VHblFHUnZ6?=
 =?utf-8?B?MDNKa2k3Kyt5aUQvb1V2RG50aHJKQnFRTGxKTHV3YXR1ZTc2Yit4NmlITFIx?=
 =?utf-8?B?dy9YVmtCYUFMdHZ4b2diekM4Z0pnWTVRdGQ5bTFPTnlqYjRoWkljbitYbFMv?=
 =?utf-8?B?ZWh4SzNoUFNwbEpIaWY5N0tBcXZxVC9lRWttVGhPclZWZGMvdnZKaHF4MjN2?=
 =?utf-8?B?dGc5SXhmQXVsY2pVWEdmZTlhV1FSUWlEdDlYUDNSTXBsaDhZckZYSDlnTnNS?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8B86956CC54EA4FB609FD9C0D5788E4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981ef1b1-9ecb-41f8-7d0e-08db91e069cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 16:08:43.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmVSurtC3/G1bcBI8tkLXcxqg9fmdbSTQu+ytBzEGrMSa7KFfmgkc6+s8FAUAuP5OY2Qx9xtkIdA6HdBOs4ExNFxc2gwSrURakuiQAHD4EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_091858_159398_D63EE09F 
X-CRM114-Status: GOOD (  14.52  )
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

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBGcmksIDIwMjMtMDct
MjggYXQgMTA6MTQgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAyNy8wNy8yMyAxODo0MSwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gQWRkIERTSSBh
cyBtYWluIGRpc3BsYXkgb3V0cHV0IGZvciBtdDgxODggdmRvc3lzMC4NCj4gPiANCj4gDQo+IEkg
d291bGQgc3BsaXQgdGhpcyBjb21taXQgaW4gdHdvOg0KPiANCj4gMS4gZHJtL21lZGlhdGVrOiBk
c2k6IFN1cHBvcnQgZHluYW1pYyBjb25uZWN0b3Igc2VsZWN0aW9uDQo+IDIuIGRybS9tZWRpYXRl
azogU3VwcG9ydCBEU0kgb24gTVQ4MTg4IFZET1NZUzANCj4gDQpPSywgSSdsbCBzZXBhcmF0ZSB0
aGlzIGNvbW1pdCBsaWtlIHRoaXMuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBXaGVy
ZSB0aGUgZmlyc3Qgb25lIHNldHMgdXAgdGhlIG10a19kc2kgZHJpdmVyIGZvciAuZW5jb2Rlcl9p
bmRleCgpLA0KPiBhbmQNCj4gd2hlcmUgdGhlIHNlY29uZCBvbmUgaXMgYSBvbmUtbGluZXIgc2lt
cGx5IGFkZGluZyBgezAsDQo+IEREUF9DT01QT05FTlRfRFNJMH0sYA0KPiB0byB0aGUgTVQ4MTg4
IG1haW4gcm91dGVzIGFycmF5Lg0KPiANCj4gVGhlIHJlYXNvbiBpcyB0aGF0IGlmIHlvdSBzcGxp
dCBpdCBsaWtlIHRoYXQsIHdob2V2ZXIgcmVhZHMgdGhlDQo+IGNvbW1pdCBoaXN0b3J5DQo+IHdp
bGwgaW1tZWRpYXRlbHkgdW5kZXJzdGFuZCBob3cgdG8gYWRkIGR5bmFtaWMgY29ubmVjdG9yIHNl
bGVjdGlvbiB0bw0KPiBhIE1USyBEUk0NCj4gZHJpdmVyLCBhbmQgaG93IHRvIHBlcmZvcm0gdGhl
IFNvQy1zcGVjaWZpYyBjb25uZWN0aW9uLi4uLg0KPiANCj4gUGxlYXNlIQ0KPiANCj4gVGhhbmtz
LA0KPiBBbmdlbG8NCj4gDQo=

