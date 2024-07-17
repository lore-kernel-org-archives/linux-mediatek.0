Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96A8C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 05:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=; b=yj5V/ePpbv4EO+jIHggUelThX5
	7PJaj420Olg+M3RTr9nKLDDsJYlHwcDfebp3Kipo+KOvVNLD8zkzH7ljrHjgrAMKRS3Tx9JIa5XjO
	DxVoYft+hZ6ZWf2UIPPCK7LPQaYFtwk9vz1xq4O4e3vlt2ZQQlAYmpI/ix5Qbmkvnwce7909xJZk6
	2uboJ7Huc2f/TKeDT/pEaGJntxhb2kU6uQc933sKXQuDPQTuAGs/cipEJrcImhb9x14OTkyP4X0YN
	oJ8aDQ44DqplwZZrIaKi2xVAd7lBSZWGL4Pi/ijPkMsdzFWI52oePt97rI/8aLcb9NCWIz7a6ODDf
	XyFHortQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxgb-0000000CkU9-0JaK;
	Wed, 17 Jul 2024 05:58:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxgF-0000000CkPy-1KUP;
	Wed, 17 Jul 2024 05:58:25 +0000
X-UUID: 8f57a132440111efa6c87f6b4542ff6b-20240716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=;
	b=jOBue4uDbI0U72XOVP90ZZeMhzJVFwDe1Me1r9VlbsyvpmlPX8jIXICFYIC1HLNcK3Fm+vo1AJO55XKfFoDlro0j7aSiyO3/O7qGreQjv0fKThv6vxb/xnbXFuq5zns53tClKnZBvb7+XR4THLvgmImEJoofrnhG2pKB/dmglSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:f1e45b03-061a-4b67-85e3-642f6a1114e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:b68570d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 8f57a132440111efa6c87f6b4542ff6b-20240716
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1157152293; Tue, 16 Jul 2024 22:58:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 13:58:12 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 13:58:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLEpreSXcDVjHFNlkSw1YoOXsCxvMzKmruZFHuy0bo5hmnap7m3/291b7BvQB4d8wKtX6IBQjDddBnscKr1idTeP60Gbm1jZloOdrhN3RqicVNKPavRINyvTTpqegu7epD64EgqIjGfkD1zMscWQb/Q/mVCPg6PGujNSKwtCp4ftfk+NTFX5x7FdeUpj0ck8pGRC2fBtzQHpbJq1mLFMNm4kKM1mjjJ3rMItXuNRnc7n5SMKggjqWl0JEj0ZRdtCICJbbbsjbS4euFIWTOzSwqcEn/YPPYBoiNHCojUP8prx8thfWQl5vMczQLUE/8IDrKZNyTqhXMmFbFU7SZyuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=;
 b=dqfIp5aS3VAEivzKGNqI9chWBwPwhSAETnqe9FQAwyKIVwfOsbM+aSIndidQ2hkawPT3EZQYk/z/upIPIZO7/iPntH3t5GEoHxSlkyCrTVfRPSobRie7hJiiCi2qFOSOqBsDlMfFrA49lEyoyjCD4odHPKqnylxYoTIh3Dz8yzHkEHyFzsR8mwIL6RPg/eYXZUkMiX89ezrx1LFApa5q/sbilRcdEFQFeismAtiizgR6apUDfnwj/06978BlB8ZYJRMqQUOhTR8X/QdFTzyKgCldnLRrrge4I3Nz22HSbLz/MYhu7Jjrkq2RqasQo2zKUdH0rF3h9G2iF4ur6HdSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=;
 b=ulYTK81iGc1+BYNyJf9KTizJdjPevO8bVqJ6USwDfD2kUMW6K7R3/p29ZEJuWGELNUE7r03JGPy7kf2v6yN1Z0Y+47kSbURmVVq5517vtj/lSdUtI4MQbA8WZ7qy89EL7/6RDvK0LE3jLsLFYQqJqxmr3OhFUHzEznqjLv+I9ls=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8799.apcprd03.prod.outlook.com (2603:1096:820:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 05:58:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 05:58:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"shawn.sung@mediatek.corp-partner.google.com"
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v4 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH v4 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHa2Am3A02oj/oD7Eajzek/9/n6PbH6bIcA
Date: Wed, 17 Jul 2024 05:58:10 +0000
Message-ID: <6d2300bbe467a929dc3cb8017464c4a069b3b8a1.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
	 <20240717-alpha-blending-v4-2-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-2-4b1c806c0749@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8799:EE_
x-ms-office365-filtering-correlation-id: aa273155-7611-4b44-bee9-08dca6257038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUwxdGlNM1ZyY252S083K0hndUFrbG4rWWdSYitXZEFsKzh2ZnNLUU9KRHZq?=
 =?utf-8?B?VHRxQkZWZmt4VUZxSFRxdXpDQ2t2eUZwMlJXTUdIemgxRDZZWEpRd1JKdlhM?=
 =?utf-8?B?cFg5ZUUwNndoNytvSllxR0J6d3JnalB1L2xZM1NWdStKL0hseGRSK2RIWFZT?=
 =?utf-8?B?VnJuVDBkQXlSNENRci9ibjBGZ08zZ1FGUStEMTlKbC80OWhRYm5jNEptbVVR?=
 =?utf-8?B?eFpqYjJKMDVRcUhXOGFtcExjYmMzS0U0aE43N2x1NDk0TXN0MDU3S0VEREkw?=
 =?utf-8?B?NTRVSTZWUDNkVW1oMmdldzdwbVhWZmZzalFGSFBEM2R5bmZpb21JNFhnWGlz?=
 =?utf-8?B?SEg5OVl4KzFmbDV2VmNTRnZZMit0Z3BWZjBlWnBBZ0w3WHJ3R2J5TVZ5S0pp?=
 =?utf-8?B?Sy9TN1RtNXpZNVNzUUEydG5QN0hweVVzaTBQeWU0NTZBN0s5RFB6dTEwcEFO?=
 =?utf-8?B?NlNpV0UrbU1ZZDhzeWh3cGFHZ0g2WDJuWkZzSG8ybEFjSklZbWhhcEluaHMy?=
 =?utf-8?B?VzVqbC8vcGZ0bEI3WHJjR0lIUWtMMzB1RjJEZzh2L2paZjgzRWUzdTVJdzRv?=
 =?utf-8?B?bTZmVExHTE83cU5mY0VmZDBIdjF4bkdyNC9NME8wdUdGWER0RExBbllCeGhn?=
 =?utf-8?B?empvUXJxeDJzdk5va1pKS3JOWCsra21ONzJ2SUc4ZTlvMGt1bEVvNFcvSjVV?=
 =?utf-8?B?RmZyTnFieURiaUlyeEJPZ2ExNmNaakJ1enVSZEV6emJLL3Jrcnprai90MVN1?=
 =?utf-8?B?MEhpb0dxY0lza2FWZVJ4MVVvM2dzZVVyczF2NStYa2dBbXNjRXJTUU1JZ09o?=
 =?utf-8?B?M0g1dEFSbDlPOU5MNVoxVlgzR1NFdDVpczFPa1ZCOVRZS1UwT3F6VUNnUGVz?=
 =?utf-8?B?cjIzSGJCUHhOZzVvbEJsK2I4S1gxOHVvYllXMWNxQVZGb3FETlBaY0V6L0tT?=
 =?utf-8?B?bFJ3eE4zU1YxbjZlKzZxdVdWK2V3RHFNdjhiZ2t2cEo4Y2xGdDJhYlYrTEM1?=
 =?utf-8?B?bDEwdElmZ2tpY21CTWZYVTJjZTIvSThPdVN6Si9uM0dOTTcxcGg5TVA1czBw?=
 =?utf-8?B?L2hPNjFXeHVQcUhtN1B2NDhvMlRNZ1d0Ti8vek11ZDVHSjBsQkVjbk1XVFpy?=
 =?utf-8?B?TXdLTDREMllmRDN0cUNDdVlmVDdoajI5L0hZejF5SUNlTGkvWGlUanc5d0c0?=
 =?utf-8?B?a2hrSnFPLzJUMndEMDF3dGgzUnhVRDVsT3BCRFNDb3BIZERBd0VpaTJOZndM?=
 =?utf-8?B?UDdEYXlzNlZ0emhBdmFhS0hRNzFMT0REQlFoVHlldlBvUWpRQlUyRUg0VXB6?=
 =?utf-8?B?WjEwSTh3dHZKeXlRR2g0Yy9PU0NTblRYVnNGbTFpWlpUQ3FSbFJHazcvMGc2?=
 =?utf-8?B?VEd5Y1hKcnJiYTBwd251ZWI4ZkIrVlIvc09CUFVRWFhwYzAyaTVaQTZKZFA2?=
 =?utf-8?B?bFNVUUplK016Y1NmR0prWE13b3FYOTVaVm82MWVpNVA4VDcvWFk1RnBaMy8z?=
 =?utf-8?B?WExaTVRWYnN4amdwZGNMcFlEL3dFeG81NTJVNWRPY0x5UitKQ3dvYlRHdXh4?=
 =?utf-8?B?UUVtekZzSnptS2xPSmd1a2FyOGpkNHVjd09ML2M3d1FzajkyT3p1bTVOUDFr?=
 =?utf-8?B?NVBTdEtJamtQNWdCVG1IU3JiQ0t5SHBIelRycTlyUytvNzlBWkIxWm5idndo?=
 =?utf-8?B?UHZWRGJqakpNaFBHOWZmdWMyc3dMUkwvY29HWlM0NVRsdjkvaEFMZzFWZGxn?=
 =?utf-8?B?WDJlWVcveTZpd3pROXd3a1pNcnNNQ0wwekxEenI1ZEo0WkE4d1FKK3pJSmlV?=
 =?utf-8?B?L3BGUWpNbythaUFiaGFWdlJNNGJxYWd3OUdwN1JyYkkyVDVBUm0zNk8ybHJG?=
 =?utf-8?B?MWtOQWxXL3c4c21BdDVPSlEzZjVlOEVDQ1JySmVSemZHclE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3RZMXoxcS9aUFU2T2ZoSW9RWENwSFJkaDMzbjVIcng2b2p0VDA2Y1hOOW1C?=
 =?utf-8?B?NWNkcG9UNERNVCs1cUFtdDREeWVrQXpkRVVPN0p1RTRySXphS3hvbTd3SHI5?=
 =?utf-8?B?WmZJdUw3bUVnNjgrckJkK0dOS1dzUVZlRXNYaTVtZ2FMaG4reWE2WVhia21Z?=
 =?utf-8?B?eDkrQmkwZVVkUXNmWW9ZUVZFK2JYRmdYVWgxa01XdFlneW1hbklzc2R3SnNM?=
 =?utf-8?B?bEY0UEUvdlNrdmtNUlJyTFJOTGhZMGdGVHhQVGhVT1dWT3Bpd1NkbzhnZlFi?=
 =?utf-8?B?MFRtVjhrK0tScFhzWGxJdSs4SllYRnF5Z0FHL0FxT00vUG5ZKzJROTlnMHM3?=
 =?utf-8?B?OXpJRTZGQlNqdDE1S2ZkT2lyY3F4cktyeURUcVMzemRjR1N0Ym13WHU4Vnlm?=
 =?utf-8?B?SStQUU5GbitsOThlUHlwRk13TGE3VVFHUy9mc0pKbExHMUdXWHdTb3VBS3VT?=
 =?utf-8?B?K3F1SEtQZk1kNktZbGRZbUE2Y2p2WENVc0Q1NXNQSU1NNWJtTUFmZkVJd05Z?=
 =?utf-8?B?cXZNZzZkZzM5U1NiLzNYZEJmbWc2bmlVaXBXQlhybndjZE04a3NCWTU0V2VD?=
 =?utf-8?B?VEhjUU4rTEFxZVRUU21pVHVJWlhZMWhVdVY0ZTI1cVlrWXFHb0RWVXhnRW9F?=
 =?utf-8?B?RmFYRVlVVW5NL2hNYmxvNkFBWlA2WHFZS256ZFRSV3RlYVdZMjlXazIvVVVp?=
 =?utf-8?B?RTh2S0NzMzB3M1pGMENWMUliRkNUaWRTOTRWY21oVmgvMkZ1eUxUbkIwYzds?=
 =?utf-8?B?cENycUJFbDBVLzZoNWhLQlRGeXl2SGdFUk1XMkJUQnB6NHhpMUhtYy9RTURR?=
 =?utf-8?B?aDd1MUlDWEdsY0lDbXRuUWZpL1hEaldSelZzWmUzODBJU0pSNmpOTXlTWjg3?=
 =?utf-8?B?Q3E0b3RjRWhqK2hDTVZHNWMyWm9jRG5VVmlzSEE3aXFRakxBeDdZN2Qwc21k?=
 =?utf-8?B?Q2NWSHpleldJVVdnM2tjejBwWVA1Z2F0amdkbVVSeURyZEoyQWJ4RFVQNGhz?=
 =?utf-8?B?NUNDME5Dc0NZSzNRSUdqMkxLSm1POXFEUUw0UnZQeFFLVzNoWXF5bmYzazJq?=
 =?utf-8?B?c2ZWYjFHK3ZlOEdGTjZMMGpSNE1YVHMrNXZxZStabmRNQjYzWDZhWUdOd3pP?=
 =?utf-8?B?NVpxQkpVOXFtTHU1U2VKNlNrSWUvMEx2QWtENXlBaHZBUzJldEVaRk9mYjRW?=
 =?utf-8?B?Y1E0c21EakRDWWphMkpmNGE1aWxDc1c2eklzaVVVZDh1dEw3UmYyUEcrbE5X?=
 =?utf-8?B?elUvT3pDc08xRjdWQmdyYUZtTnBvcWxDUEtnNFpMT0gxNFBnMHFGTWs5dnV3?=
 =?utf-8?B?OW1mTDd5a3o2UVk4TjhtZ1dtR01pRi9BdUpCRXFQL0ZSYXpzNEF6Um0wK3ph?=
 =?utf-8?B?emJVaWpKL1Z4dGt5ZmtuZ1RoL0Y5NDRpUmZrMmh6b053VUo3RVRaN3lUTXJV?=
 =?utf-8?B?UE9FVHM1VTBtY3dTeldwOVF0T1k0dkE4a3pOYVJXSVdqckxiUkMxRlM3UERE?=
 =?utf-8?B?QkRwWGQ5RlhmajFNWGY3bllyV0VtZms2R2ZZNllkczdMRmpISkN1Zmcxc2ZK?=
 =?utf-8?B?YS9RTEtaQmhYMkkwbjRaSmZFVzZ5OVN6OXZzcXNPdS94aTVVY0tHTjNGTk5W?=
 =?utf-8?B?cXlCWGhONFUzQ1NmcWtyTlRZNVNGbEo1cjdSQ1BQc0IvQ0haM1RRKzRKNzFh?=
 =?utf-8?B?aUR3cTJhV25uSk1WY3d2V1dteUVoZnNaWVMydVFjRmJDUm5tWC9PcFBPNUpM?=
 =?utf-8?B?RWFGVXR4aTRUMityaVN2U3F6WllEbngrdFZjNlNqMkQ5VVNYODZjWkF1SGtS?=
 =?utf-8?B?QTZUMmsyRmQyVTdyRUR1UWptU3hvdlZ3SEJXWWV5TXJzT2FpZ091U0FVam14?=
 =?utf-8?B?YUFRR091bG15eksvWmc5eUJLMkVuSGt4K3lId1RxWjZ6Z0d2d2x1QjVTcUZm?=
 =?utf-8?B?ZmpCd2ZvN3dBaTVYUS93cVZMOTJhcjJpa2l2b0ExWHIva3p1NTd2NXIvV294?=
 =?utf-8?B?eG8wMTBUTDM3VC93UVY0MGVjV1NMQnY1M25mc2UzRCt1c2NCcS8xSjVCOVFH?=
 =?utf-8?B?bXZtRitVbGRkRVhzN3Q0ajdMMnd0N2dsWVlNREc4QjdISnVZVlJ6WVpnL2lH?=
 =?utf-8?Q?3jNMSom5Y+O5GCjRQKuzvs1Be?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <894DDFE625E36D469628CAC439ABFC87@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa273155-7611-4b44-bee9-08dca6257038
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 05:58:10.6462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeeHyABnAe+smOxo9QgRhPDQy1f0NPD0708WWVuf2Whinj7L0GobCR5jI4NdW7UhwBDkgzRSlqrDTGnUMbqG/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8799
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.399800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQ/XHdICuW5rya1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCks3z3wljuVXxQvMEFMAcCVaNaxZBRbNWv96+aVV/3FmpSh
	LJWs0HZyORmg3vGx7V9sIe/TXUbL1VJTV35UngiMVglQa/gMvfAreImldQ5BDHFSQk97VYGqEkN
	peaxt2NOLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge5sxB6vvd5JH/CF4
	ilfCqx6EnIzhwBsKz882aWxVOBv6uulxyHOcPoH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.399800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 88F29F253F8AD5F3322FC6D627CF9EED1184F6A1F97E35FD642F1989CC9D81562000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_225823_434110_D05694C7 
X-CRM114-Status: GOOD (  15.43  )
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

SGksIFNoYXduOg0KDQpPbiBXZWQsIDIwMjQtMDctMTcgYXQgMTM6MjQgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIg
YWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBzLg0KDQpSZXZpZXdlZC1ieTog
Q0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0
ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyB8
IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBpbmRleCA5ZGZkMTNk
MzJkZmEuLjgwY2NkYWQzNzQxYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRo
ZHIuYw0KPiBAQCAtMyw2ICszLDcgQEANCj4gICAqIENvcHlyaWdodCAoYykgMjAyMSBNZWRpYVRl
ayBJbmMuDQo+ICAgKi8NCj4gIA0KPiArI2luY2x1ZGUgPGRybS9kcm1fYmxlbmQuaD4NCj4gICNp
bmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fZnJhbWVidWZm
ZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gQEAgLTE3NSw3ICsxNzYsOCBAQCB2
b2lkIG10a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgaWR4LA0KPiAgYWxwaGFfY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgTUlYRVJfQUxQSEE7
DQo+ICB9DQo+ICANCj4gLWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJhc2UuZmItPmZv
cm1hdC0+aGFzX2FscGhhKSB7DQo+ICtpZiAoKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFz
ZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHx8DQo+ICsgICAgc3RhdGUtPmJhc2UucGl4ZWxfYmxl
bmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSB7DQo+ICAvKg0KPiAgICogTWl4
ZXIgZG9lc24ndCBzdXBwb3J0IENPTlNUX0JMRCBtb2RlLA0KPiAgICogdXNlIGEgdHJpY2sgdG8g
bWFrZSB0aGUgb3V0cHV0IGVxdWl2YWxlbnQNCj4gDQo+IC0tIA0KPiAyLjQzLjANCj4gDQo+IA0K

