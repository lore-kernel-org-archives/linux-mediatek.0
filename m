Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7BCFB446
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=; b=PAyFUDCSyPQFWZag6kt8Dr8p4v
	BOj2gdf60jz5jnE9bhSo7+INRhbXZ58AGHsF7myh3Y8i4RBQHhU4Wa5mFQnW7unbRNWNDrAI15ZW1
	0mydUsiWcoqWVc2EmI2tfQnZnt2oP1dtsl4LpDcN3q+rQbV+OHJnWNs509mlsT38/T7bgbEDCm/3A
	McFVMM8YcgZrrwbchPRMz4ALumrHy5l2WMS8dPA/Pbjd6te8bI3ewdFzS7W7LjSOlNiujH90qdm4x
	/x23rWGTeovRUsoKAynY+ZNyW7vKM53qFWt2jcaySQUCmDJtJH90DTejGixqF7zxYgJSjp/5gIS8F
	HvcHU+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxiyA-00000001ixI-0Zq2;
	Mon, 07 Oct 2024 08:19:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxi4l-00000001aDA-2aAG;
	Mon, 07 Oct 2024 07:22:50 +0000
X-UUID: ed2be3b6847c11efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=;
	b=u4nKL9tMnt3QRrchgOXubR8DqYjfJxrUR2BlKbD7KuzqnYbjQGERHj53rOSidVCBv36TX5Lm04Dp08vvYJ/tYgt5Cs/7ZdKxkwSofIpt5cI570WrEd1R+VIVJ06qmMNALMj5eSQCmHwBS10JijAZh+lmV1QYLESmNSz5PY4C1+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:115a24aa-0bb4-47ea-92e0-11f17cf97225,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:f2bcdc40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
	P:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ed2be3b6847c11efb3adad29d29602c1-20241007
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2004570518; Mon, 07 Oct 2024 00:22:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:22:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:22:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0qSAohRCm3mXx4aqKY/1vdbYk6HpdHqd9e/B6w29/xeINxzlDFqTqlx+OKHC45yUWhpk+tMgyMeYeUiYFeROOYhyz5LeBrHdpKkRxO23EBXcX6B0eSNFnraKLlfMXksElTmZmCHwzZ1spqcVaOKynFdviQeLEWvvT6BatIaoIF4QyxRPP9/i1DGe/ilZn5WfkhFZYmn9neU8l+JeU3F7ZId89yt/CwtCQsxTfZjgWN7Cz4sIm2kQJD2wDODkyei7+S3aWrSi+GPPzyz10Zhqa7Gi23oM/Q7+n3Pj8PJKtANISPFpXc28pJEaYCYULpdNyee//RUI/UnJ7AKaNEfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=;
 b=CoVtUMmJD8vuGWXuqR+zYGC3RVMIiN9IeK/Lx+OIL4hYFgaa/8YAwvF6VzrDzv1mzKpLRlGSHyfSQc44xgNNQgTvhGJCCBQBI08pj2gx/in4J29f6v9gsEh0teFsyah7C8c+bGYPCzCniH9TleS+jlwVPra4dl7O9GSjwRsP4M1gtO/LvIqCNWb8VHemJT8Luvmg/5D89rCjIjxoV/dEHTecEFOgVbney71CyhJ2zw9fAiOXPAEeyoFrwNp79riq7G6XbTkroVClX+yrobO89ZcehqICs9TRopZzyJA7LO+evXNnrRKQpU+h+5wRpd257rc0JywASaRQYqaf/lg6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=;
 b=MZJduA42xk34Mggxff+XP2nulydpJjOAoX/BpDdEiJaUtXpciUKCPMA0zXfn72za/ceAOGLs+jsZV74OaEfiEizZ7dj0BrCCzUYw9qXmGrzVzI5XfppsHc+NbFsaqPHY53PM+YEHgXmcwdvdYC1GKijhSUWyq0S3nENsmcl7JgY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6916.apcprd03.prod.outlook.com (2603:1096:101:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 07:22:27 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 07:22:27 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org"
	<djkurtz@chromium.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "me@adamthiede.com"
	<me@adamthiede.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "littlecvr@chromium.org"
	<littlecvr@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Topic: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Index: AQHbFVPlNViRsB+fWkG+2zWvYOwE6rJ3tjcAgAA6owCAAH2HgIACekgA
Date: Mon, 7 Oct 2024 07:22:27 +0000
Message-ID: <429db3b66919e67ef765eef220608cb3d3d9db65.camel@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
	 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
	 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
	 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
	 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
	 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
	 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
	 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
	 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
	 <d820e8be-c525-4435-99a3-b0eb076b3282@gmail.com>
	 <b8fb4f241b2d248ca4c2c57b98588e1be0642b76.camel@mediatek.com>
	 <fd6fc10e-d0f6-4c53-8561-bdfd047e45f2@adamthiede.com>
In-Reply-To: <fd6fc10e-d0f6-4c53-8561-bdfd047e45f2@adamthiede.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6916:EE_
x-ms-office365-filtering-correlation-id: 19b67677-9ad2-47c5-6091-08dce6a0cc44
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dy9Qb0JDMU83ZTZhSkdXVEFCOUl5QW14QmdyQWYxOElzZmFsT3lMZkxtZXRm?=
 =?utf-8?B?YlVlaHY3WHBFTG1EeE1HSkRuSzlCSVpWMWFzZXl1T0R3YksrZE15a1V2Snlq?=
 =?utf-8?B?d0MzUjFZVWcxYkI1UXgyWk9wNkkzRC9TZ05zWkxhT1hIYzBjeVRWaGwyejJC?=
 =?utf-8?B?dTVVODVhZnBQWGo0czZyZW8rYjhLWnBOMDBGL0tyZ3BnWUw4a25seG9zSXFt?=
 =?utf-8?B?eFlMQmJxTVQxNERvYmp2VTY4bWgwSGtmSUFGSkx6UEpqV3RFVDFvRDJQQW82?=
 =?utf-8?B?elZNUUxNdGpQNFYyek5SS0VSN3JYRXRqUjQ0WG5USUduNUlQM3ROZGkwRXJn?=
 =?utf-8?B?SFR4TnZYdlZXUXNHTlVpeTNtUmhLekdnK3N4S2tOWlpLQ1BkRG8vdytHbGZH?=
 =?utf-8?B?dlIvL0hoV3lYU1ZsbWkvVWZKdzFlVzBpQ3RRS1RCNDVzbFRWZjBWbVo0V3U1?=
 =?utf-8?B?akFzbnFHZlZObXBhcFRxSjVHeFNQR3BBOEdDQ0lkZDQ0dHdFT1pwd0d4ZDdl?=
 =?utf-8?B?ZFBRYmw4OTJ5Y1pyMGtuSVp4UHRidEliWmZHbjNMY2IxaEs0SVNMeEpWMUUv?=
 =?utf-8?B?ZXlGUnRWNEd5aG1xSXQ1dlpzRm51enE5RXViQm55QkdxbWxWYWR5S2k0V0gr?=
 =?utf-8?B?eDIvdkx4TXM4Q3l6NGdSc0dZSGFRem1sMXhQUEUzb2w4VzN0cEEySW4zbTV0?=
 =?utf-8?B?WmRhU0lRL3hzVnUzRithSmc0RWI0VWZLblJLU0wydTBYV1R1bDBkRHI1bkY5?=
 =?utf-8?B?T0NSY1hJRUNoV2ZLWGtBblVEWkI0aU5GU3oveEJhb3VTTDcwSEFJVDk3aW9J?=
 =?utf-8?B?WkV6elY2TXN3cnJYZndaMFdBeHBTZXBQd2hXMnlPaGRzNVVOQVdrTlk1QjRB?=
 =?utf-8?B?QXl5dXc5ZVR4bDJ3N0tYd0tEZk5KZW9NTFZqTE1ZRTczOUkzeHo1bittVnA1?=
 =?utf-8?B?V2tXOVRlUjNaNVd4R21oNFd0MmNSaGJhNitvOTByck9YVUJ0aW5oak1ycG11?=
 =?utf-8?B?U2NZSVlsUXcrbGpaVVNaN1hmUkNvSUl3MXN5eUhTMnh2QkJpODdzelAzN1pP?=
 =?utf-8?B?bVY4VXJDeG9nQ0RFUUZsVUdkQ21mY3AxMU9jc2dLWEhJY2pHWlJsMUdYQWpC?=
 =?utf-8?B?NVFLNFdiNUx0N2MwQ1ZoT3llOThCa3BtdXJUMUI1ZjNZUDY0clJJa1ZjMTZ6?=
 =?utf-8?B?cmRXcDc5N3I0NG9XdEErRjFCbFFZMVVXTW5nblJmdG1pKzZPRmVzZGovQ1ph?=
 =?utf-8?B?cGpDVjNEMndUZ1Qra282L1YzMlc1WmFrS2RKQjRXQmtmSDhTL0UxeVh1V0pW?=
 =?utf-8?B?ZGt1N1BHR21IRVJubmJDdklXbEY0bHUwMGIzQ0Nhb3k5Qy9LTnNnT2FpUWs5?=
 =?utf-8?B?ejNWTXV1bCtBeWlBcHRBd3hXSG8zWm84MjAzc2JlL3ozWndDbk9raXE2dS85?=
 =?utf-8?B?dFpSbkhPNERHYWtKOU9keEpWM21MNGtWNGt1ZUVmTThYVTF2R1pKMEhOaFFC?=
 =?utf-8?B?ditRVUNxdklyZjNuV2o0WCtSSVJRRnFtS3QwakNXV25EbzRJV1FjNWxIYWdL?=
 =?utf-8?B?ZVhpZlBlM1lwUFd0bGgvVFJBOEw3S0EyUVBkeFhPdjJjZ3FTd0l0VFVMVnB3?=
 =?utf-8?B?d0U3TXhkM2c1UDEyWVhvdXhraXpQVkdxUWQ5bDAzY0FWVUFBaklLb3pHeGRE?=
 =?utf-8?B?djNFZ2Q2VEpkQ0pOZjUyd1FuNFhPNXRybm95cEZqR0FqMHJUYW91dE5Obk1l?=
 =?utf-8?B?Rno3WEdLZ1YwWTZJeldPT0tQaE9ENzNoY29sQUVhTzUvNFUyaXk3RUI3b0Ix?=
 =?utf-8?Q?vJCOSAXabt3I4EHwEYnWEpvjP+Rw5+DF52oZs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cThmUmV0c1hvbUFLNGpTV1REeWdKc2ZKOHlMekNRdG91dm9LdDlrRE91bGdj?=
 =?utf-8?B?aXNOazlSS2tSdTZzMUYwdnFzdFNIbFloU0svMStUQ2Q3VU4yR2NFTWllYWtk?=
 =?utf-8?B?V2xTaHZxc3dNcWMwWENBc3U2Q3VpZXl5ZEE1aUhmK2NwTkNFTFJ6VldIbjFM?=
 =?utf-8?B?Ykl3U005TDk5dHkxRy9Md1BpTmNBaUVxZTZ5NXo2RFhVOVU3SVBvVzBVRllP?=
 =?utf-8?B?VWppUEY1cDRHUElRYXdOd01SejNtNDNVbEw2M2VDaVRLOVBwS2ZRYkdLb1Vj?=
 =?utf-8?B?aDFsbWtHcGQyVG05dVo0OWhISUhmOHZic0g1ZGlCdkRIYjlaTXgxMlVsc2Rx?=
 =?utf-8?B?cUkrVk5mOVNXNHZHRmRaOHpJdytaSWpkekR3WHNLRVFmRlQ5V25SQmswWDZK?=
 =?utf-8?B?dnlwWjk0UTFLRjUrd1VPczM0aFRBTjgvQktUeWxqU0YrQkNWS1hrM0tpSHgr?=
 =?utf-8?B?ZDhVZDdpa05NNnM3d1h4RkhXRUt5NXVuaEF2M1d3cm8wMzJWbS9CUlBqU3Qv?=
 =?utf-8?B?RG5rNWdvNkxwc1ZaV1ptbTl6OXBObXYzTWMvdGtxdElyTVUyUTBReDFOOXNE?=
 =?utf-8?B?aGFNdnNnelJPMURvczl2ZldTSENJYVc3cmhGSzJSaHF6STByZDJzUzI2RHBm?=
 =?utf-8?B?ZkEyMi85QS9qQmtOM2JHN0dTd0huWi83QmdaaGVuUnBhaWNxaDk4T3VBdzN4?=
 =?utf-8?B?cHgybEdoNWpodGk5Y2YvR2x1TGJtaThqMUU2Z3pDMlYzK0ZyM0Mva1lrUWc3?=
 =?utf-8?B?VHlKMStwV3VTYVgzSFZ4bGR4akZ2WW9heFI0YlB5ak5pd01nYzdoeWpKQ0Nn?=
 =?utf-8?B?V2U3MitoZjIvOVRFbGFkbCs4UmYzamdZYUVnN1lJeEtQQVFQNjVjZC9VNG15?=
 =?utf-8?B?M1cxME5MRDduNUQxL21NZTJGeEtrTDlUWGV0Ri9tMVI4WVhNVzA3UVBJOVpK?=
 =?utf-8?B?TFd3ckFlaG1LcFQ4aGV2RHBTOVAySUk5U1I1N0FwNUtncnNzbGRhTVdtZzVh?=
 =?utf-8?B?cS9xMzhMaHNBcjRsa3d3MUxLVk9sSi9IcTlLU01aVG4yZGZKUGM3QzRvV1FQ?=
 =?utf-8?B?SkVtTE5sY2tmbFpvenVVV1pnM2FKa0tvZ0tCWGFvV0VTYlJRaGRzTGJmRDVn?=
 =?utf-8?B?S3IydW9JMi8zS3NuUmZSNmVxS1BJdHp3OTZOQndVd29aNUQ4N0F1SW5kTzIx?=
 =?utf-8?B?TWhydjBZM21iSWJNQkszdW16UlFDVlhIU0ZvREVPa0cwaXZ1QW5VMXNrZ2lz?=
 =?utf-8?B?Z3V6ODdycVlHWGhQYXJNV0ZUTnBSUVhYZUhqQUZKc0FTUUwwNHI3eHJyNm5P?=
 =?utf-8?B?RFRRSnZYR2FDVERVcm5vOW9wVGt3UUFlQ2pieVpGNDIxL2YrMWtuOHlqUFFD?=
 =?utf-8?B?WnNoVFRTUEltMmFKdXl2OTB1ME1oc2hOYlZZcUNIekV4aEtjdm9SeG5UVmRB?=
 =?utf-8?B?UmZ4emtrNnJUS1MvaGRqL3RmaEU3UlQ3TXNQYVJLM3JjbHdFb2I5MHEzTDBD?=
 =?utf-8?B?eWwzZFdreC90ejh0RjVXZTlEYnBpVXFReEoyU3phZmd5OE51bXBUdXQ5NExw?=
 =?utf-8?B?czkzWXIzZFI1K0NyV0EzYzJ4R05HOXhYVXV5eklDMUR4MUljTHNxWUFCVjZr?=
 =?utf-8?B?U1BaUjYraHdpWDRJTmdYUXBiM21sOGtCV1g3RDl5RmVVSFgyeEVpcFdGRmUv?=
 =?utf-8?B?NnMwZXBNVlNya3Jha0RudjZmU1ZrMkJrNmpBWURvWFErbGxod0NxTmJLRFE3?=
 =?utf-8?B?VEpmcnliNytEVGhaVjdMbW5kalJRR291Rmk0dlpQUEdUcXhuS0VjRG9HWDNm?=
 =?utf-8?B?SDhsbzVZT1c2a0JIdXlaelpXVzY0bmdCRVg0ekxyMTV3NWN5dUs2SXdYQXE5?=
 =?utf-8?B?NFJpNmNEcmtuRlo1aVFKTEY4R0lWcUxpYlh1TW8vNER5L3NJK3Z2WmtsYWtD?=
 =?utf-8?B?VWJNTGg4bHlGSVdZT1pTLzZoVlhwT3k5dWRIR3ZVNWg5TmVxTzJNekJBVzNh?=
 =?utf-8?B?THBSQ3hsayt0dklJYjAveWs1TTJxQWF2VE5LSlVIY0E5MENEdWVOWjcvdUZG?=
 =?utf-8?B?V1V5and0RERDZUZySFhEYjRTcFYvU3pLNWhRY1E0bTkzQk9CamlYRmwzSkRz?=
 =?utf-8?B?UUNyZ0NveTFvczhMV1ovbk5qNCt0K3lEdVZ2S1g2N0hFcDNWeVphc1lhSTU4?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C982D95F012671488A6A5D36E4027517@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b67677-9ad2-47c5-6091-08dce6a0cc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 07:22:27.5821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuVI68jXzffzgcN4jO8r+aXPkIkmvURexzB23jh2HZbQAiS4AKc5Ees8gKb5CULSwYAlnXzxDArH6cQB9xp6Tdn8yRBicuhxHyVFcr6BPdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6916
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.323400-8.000000
X-TMASE-MatchedRID: csPTYAMX1+En2WEbWzq9rbxygpRxo469BGvINcfHqhfOS3qd4Dd5VsWl
	hj9iHeVpCCnHlGqray1N2wDbewri3vZ+/QtM9+8znVTWWiNp+v8oUVkB7ifJnlksP1I0n2wSoo0
	Wua1h8Xa5/3lyq6X9HaijHQaCNMQZybIb5tEHptMTDJnK4xDjXZPFJV0Myxm82+mPn502VC+RnE
	JOP6CIAsN2z5M+5vbynagtny7ZPcRC/bXMk2XQLIMbH85DUZXy3QfwsVk0UbtuRXh7bFKB7lhMn
	7ngJcdCNpDAu70fG0zhR6JSHlNAbhtA6rteOsi8NkUSDDq742k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.323400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E01FC4BF24ECF9948722F100F1131E884180EC70F3CDE6FA76DE1CFB8467D4F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_002239_763597_C8EE7109 
X-CRM114-Status: GOOD (  14.20  )
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

PiA+IA0KPiA+IEhpIEFkYW0sIFlhc3NpbmUsDQo+ID4gDQo+ID4gUGxlYXNlIHRyeSB0aGUgcGF0
Y2hlcyBiZWxvdyBhbmQgY2hlY2sgaWYgdGhleSBjYW4gZml4IHRoZQ0KPiBkb3duZ3JhZGUNCj4g
PiBpc3N1ZToNCj4gPiBbMV0gRml4IGRlZ3JhZGF0aW9uIHByb2JsZW0gb2YgYWxwaGEgYmxlbmRp
bmcgc2VyaWVzDQo+ID4gLQ0KPiA+IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTg5MzYzNA0KPiA+IFsyXSBkcm0vbWVk
aWF0ZWs6IEZpeCBYUkdCIGZvcm1hdCBicmVha2FnZSBmb3IgYmxlbmRfbW9kZXMNCj4gdW5zdXBw
b3J0ZWQNCj4gPiBTb0NzDQo+ID4gLQ0KPiA+IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDEwMDUwOTUyMzQuMTI5MjUtMS1q
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gSmFzb24t
SkguTGluDQo+IA0KPiBKYXNvbiwNCj4gSSd2ZSBidWlsdCA2LjEyLXJjMSB3aXRoIHRob3NlIHBh
dGNoIHNlcmllcyBhcHBsaWVkLiAoSSBhbSBhbHNvIG5vdCANCj4gcmV2ZXJ0aW5nIHRoZSBvdGhl
ciBjb21taXQuKSBUaGlzIGZpeGVzIHRoZSBpc3N1ZSAtIEknbSBhYmxlIHRvIHNlZQ0KPiB0aGUg
DQo+IGNvbnNvbGUgbm93LiBUaGFuayB5b3UhIEhvcGVmdWxseSB0aGVzZSBjYW4gZ28gaW50byA2
LjEyPw0KPiAtIEFkYW0gVGhpZWRlDQoNClllcywgdGhleSB3aWxsIGdvIGludG8gNi4xMi4NCg0K
DQoNCkhpIEFkYW0sIFlhc3NpbmUsDQoNClNpbmNlIHRoZSBtYWludGFpbmVyLCBDSywgaGFkIHNv
bWUgY29tbWVudHMgYXQgdGhlIFsyXSwgSSBtYWRlIHNvbWUNCmNoYW5nZXMgZm9yIGl0Lg0KDQpD
b3VsZCB5b3UgcGxlYXNlIHRlc3QgYWdhaW4gb25seSB3aXRoIHRoaXMgc2luZ2xlIGZpeCBwYXRj
aDoNClszXSBkcm0vbWVkaWF0ZWs6IG92bDogRml4IFhSR0IgZm9ybWF0IGJyZWFrYWdlIGZvciBi
bGVuZF9tb2Rlcw0KdW5zdXBwb3J0ZWQgU29Dcw0KLSANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTAwNzA3MDEwMS4yMzI2My0y
LWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQogDQphbmQgc2VlIGlmIGl0IGNhbiBmaXggeW91
ciBwcm9ibGVtPw0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCg==

