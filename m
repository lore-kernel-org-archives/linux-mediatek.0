Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A7CD24462
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=; b=4/p+9uwvE3j1XDbRhCe5bXVU0u
	nu2XFnLNQ9NArCb38aTP/TJhNjSOwHJG9hz0xCIKSO1FzP7sqDiLUnuIZqvQ2pSgPnKu3gz8v/W7y
	SQIabmNgCRhn8vdePuowAfxu4QYZhjqhKuOm5nDdaaEN7KOkheNJ1ebQ2OicOx7nYREVwLk+o08We
	iib+3dkLdztbs9ojpNSaU8RpE6cqsM4yjTpl9Q05zGFHIJxTff9geayLJUrEWwVmCEwtFc+blAZv0
	6bJ5u/nVuCpLi8ChKPfvu2ckwMon6V60DgBjQ6Jyl2sXvAgplA7CJS1eCfajL3DEBLIuA5N8GRkXd
	2WO5IjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz4cW-0000000EwX8-2Nx4;
	Fri, 11 Oct 2024 01:39:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz4Zl-0000000Ew3i-2Zyv;
	Fri, 11 Oct 2024 01:36:19 +0000
X-UUID: 32606ed8877111efba0aef63c0775dbf-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=;
	b=kSMte5nPfv7zPttt8vQAbEQAFj3Kob1JxUduQEAyV6D8mdIcDVb7uXcvg538/bA9QCVKTmUUvsXmJTj33cIGG85NxAqkHTblfdjzK3UrIZzhkSRXsSVKjWFc27zaf8W3dOWk6ojCtN2j1kf+5EmegtFvOe0BPyevq2X5XFYeHsY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:801a94c8-af4a-438c-968f-691176c2ae26,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a3a31241-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 32606ed8877111efba0aef63c0775dbf-20241010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 463722481; Thu, 10 Oct 2024 18:36:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 09:36:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 09:36:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDcgUq/c2yWJJSzvvEDy5FYVKGukwNGhltLLzmSqQhZEpDWapwpcxqV5+REhBmHJ6jDU17cMpP3NHKhKxHzlB0ctnHkAKg4gbjXQqBQbw0Y+2LmmK/s4Fxmbr0gDJffZ7dhf2LQDJMLQqlXzgdrZbTazi8Cn3sT75l9Vw4Z0vXU5XBfBb8CJXmp6Tc/2qhDZv0OlzdkDPuVlGkao+dmZ+PHUBXdkMuhduLV5CafE7vEha9/r6YsWIgjL2wgbQtcCBQgZRZNpN0HJtLw1uS/QwJq3bJGGXWKGSwfEuDFWw6SMgkHVBO6PVXv2ctRnQP6Y03yoROPOUwz8B9oibR4koA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=;
 b=Dzo8psg6RHnSs0/aUoi+SkFs5vaZ+bhEJpO4iKs0mdXFQnm4qHH59GKHhto8UVDIKoKqK01NMShQX86n6sUn2RFr1JyQ4Qxp0vJZ/EWqPPbuBYKDVNMTjg3oY0WuHR9HH1lgHPDXT2JUfSWJAOETQ4+Y4CCx6oqqQoWvzGbWjDUAhx7Gq/BdoLS7wvuN9efHDT4/RVVm2itGaYg+PJKxUIKMhYRBEZ/buEGl+vl7XH8lZQ1J0VF8nUK1b71W1eSn7wP109Ume+fg3u8vPdvBSLhAC3ududyA/NAfbD5NXxYTsYIkW7paxHADzZjAzxDaC6tHl826tVVnqrXkjdJLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=;
 b=j69A+kIGpgNoglEDZ+oKDjALCb+7OTn9lWc37K2p7RwgCcdJTNhGss9l6L5uqDwp3I3wYNqDjOfG+30kWtBMnXxDCka11PPk/vBJsngnCL9ObhuJQZ0kcWq4AtsWPslns0OSLWJ4cVFoZIcEe6QRYxYmCKKm7WxQEX1m7i4Hpjk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7470.apcprd03.prod.outlook.com (2603:1096:101:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 11 Oct
 2024 01:36:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 01:36:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
Thread-Topic: [PATCH v1 02/10] media: platform: mediatek: add seninf
 controller
Thread-Index: AQHbGj2MNHQ5sKpEAUCTiRDvBgOUWrKAx2WA
Date: Fri, 11 Oct 2024 01:36:06 +0000
Message-ID: <2d26eade5c1394594de261d724901a68656c881f.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7470:EE_
x-ms-office365-filtering-correlation-id: c120a28f-d88f-4a6c-b15d-08dce9951342
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmdXUk1TSUpMVjFIWVVrQXRIeUJibXo3L0krN205WitkNjM5VXBneCszSlpE?=
 =?utf-8?B?ZjNmUmwyaE1MNDhtQnYwR3ZiZzV4Y0Q4VkQ0eE9ZWGg3MWtsbjlXVWdOc0Yr?=
 =?utf-8?B?TWt0YXBBNWN0blpJV3plalBzL3JPckpTS2ttbk9PSHMvVEhXSGdHd0dHTmpS?=
 =?utf-8?B?Mk1aYk91akJueFE0WXBQNnJXNTduTUNnMEE2NlNQNVVTbWkzMlBVUzdPMmZL?=
 =?utf-8?B?aGJINXBpVERpMHJQVUNEY0t3NGtaTlR1SE5Gek85Z0tzQmtSNE1OdE5KZDhU?=
 =?utf-8?B?c3B3cVpoRmR2ZmFKR1BwSnh4cXpPN3ljLzdTM0VLWXMxMURyaENmdFlHeVRh?=
 =?utf-8?B?V2kwdGJTT2VNQWgxaFBhM2pQSnJ2S0V1UmdRL0NmSTR3dURON0RaYWVxZ25G?=
 =?utf-8?B?S0tPVWRoUklxTzRrb1NUd1FKWDdVTTg2ZzlsYVFvb3NGYVBPTXRTbkpqR2xE?=
 =?utf-8?B?NkFwVEgvSFFFd2lWUnZBR3pxaWJxS1VQMnhWY3M2MFE0VXA4aHFGVWd0WEk3?=
 =?utf-8?B?dTQ3VEhoUDJ0WDVkZ3czYk9OUFBoS0FKb1pvcGlWa3dlbUQzck83cHBzSGZN?=
 =?utf-8?B?TjJ1UFNMVzRjb2JKRnNMc0pRcWVLakpod0MvS1NEZlZKMmtDbmJVcFp2MEdT?=
 =?utf-8?B?QlBpbzQ2b3VNUldlQmozVndpOEVXdmtvazhqNm54eXpieHVKVTZZbDIxTk9G?=
 =?utf-8?B?UUM1b0ZYVUpYODd3aEw2VGx3U3poZktreGRFSUVqbG90SXBGWW1sSGRVeTlG?=
 =?utf-8?B?eU81MytWMUhiZHp5R25oN1NDeUdLcXYweko2dUtNZk9Vd2h3a3J6OVl5OGRC?=
 =?utf-8?B?d0ptSE5FQ0pmVlR5QjlKS2ZYRllkRzdsaU9rL2JEdStmenJmS1V1L2czT08y?=
 =?utf-8?B?a0VNSi9ZQjhnS0M5WXM5SDRwWC9yN0ZRVDEzUEw4a1hNVjQwd1pOSjRpZUI4?=
 =?utf-8?B?ZjN4WkpsMENzSmxaMU9WenBVVTJsYVE4bFJpMGpsRndCZGNxOU9uR3pZSEFF?=
 =?utf-8?B?UmtrYXU3elY2N29lT1U0SHpwV3N3OFIwTXRDNTUrb213bUc3RTlieWhzZTdl?=
 =?utf-8?B?N0I3VEUxZWxuUFV4ZXdza2t0ak11WE9BUWNERTAzZnN0T2xZbjZPN0dEVUNl?=
 =?utf-8?B?Z0x1aTB2L1VveWwvVStSTGk3aGRsK0I1NTBpVVVlUDVsT1pKaWc3T2VQREk0?=
 =?utf-8?B?YmpGMVNYVThRWVVPMzhVRGxOY0hDY2FrZG50Sit2T25QWDV4TGw5bmxjMVdD?=
 =?utf-8?B?eTNNNTRSeGZ3cmVNTS9HR09lRzR1V0s1bnVsZnZGNzdZOUN1Mld6b1dNWFFk?=
 =?utf-8?B?UzlZSXp0Y3ZtbWx5T25mTHFkaDdONDhwUXowODVFNGdNOCt1WkwrY3VHaTN5?=
 =?utf-8?B?ZjVyb1hMb2JuUGtveENLaW53YjNva3crSlR1eE8xY3JiM2pSb1JWZ3NQdzkv?=
 =?utf-8?B?K0lnK0V3Z3loWnJ4SGF1ZWM0TjBGaGVpUExVQ3ZDaWNrKzhCMVd0WGdraWFG?=
 =?utf-8?B?MThWd2svZ1Q1R242ODhDZTBUYitJV3NJYmhiMTRDU3JRWFAyN2x3UGFDQTFz?=
 =?utf-8?B?T3NRNGFseGNTOG1NNjZaRzhHeC9WQjJ2R2tMSWtOMTJ4N054NmdtY3JsSWNh?=
 =?utf-8?B?L3VGSVA2eUxNc012SExSVzAweXd0c2NGQVpESitReHF4VWdtMnl6WGNGa2Yw?=
 =?utf-8?B?TUlzcUdadmxUbEthNlp5RHhOa3luRVRST2FwYnBtMjRVbW9XZ3BDRmRYb3hv?=
 =?utf-8?B?Z2FCRlJnZWdKRUQ0TEtYTEgzOXBScDNlM3JPdE5aRktMMlRJdEp3TTdzYmp3?=
 =?utf-8?B?Y3VHTlhTTytXQ1lSM2FUQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlJvdTRRWTdCQmFveUQyeXVKU2tEN3l4SVdxYU4xVHg5T0g5ZnhRS21KbTRH?=
 =?utf-8?B?OU1KZzRCQzJMUHMzSXpDQUEvZXl3blBFRTVOTVVDVXVTRXdaeEhJRWwxM1lv?=
 =?utf-8?B?RCtRRHJiOVRTdXIwSVRyQ0xhNEZJS1RWU2pBYlRvZ0J1cTF3T0NEbURNL2Nm?=
 =?utf-8?B?eDJPREdsRzJaanR6ZVE2KzA4YVpZRFZNTzBmbjRWSUhkQmpibG9BeUdnMjVq?=
 =?utf-8?B?eFFhV1FZYWFHSzF0WW9iS0xDN2dNcXNEZGc0MDFyakh1TzZScFFlbE9HTng4?=
 =?utf-8?B?dDJscTlrUVNxMVkrb1FOZVByMjU3U0l1VDd5K3ZiVVBVK0NLSWM4MkxPZ3VN?=
 =?utf-8?B?WDkvSXFuZklPUCtpdm1JM2VNWmc2SmZ2RU8rQ0ZsVGdKSTkxS0pBQW10WW41?=
 =?utf-8?B?azNzYXlpNkJQVXk0NFhGTVhyaGZpeGVMU3J3RFhCbWlyaGNTUFpFVjJxZnp2?=
 =?utf-8?B?NGF6ZUc3ZHdTRTFVN0xtc2ErbElreDRDdnNPSC9wU2QxNnNLSE1haG5nNUhh?=
 =?utf-8?B?bk8rdksrdTRqNitBL0JFOUVPSUpaQkdWblFhUldvWW9BR3AyUmJ6cTZYUHpF?=
 =?utf-8?B?ZDZqOFNrT1ZOWUtYV2xSVmQrY0pzTTIzdW8rcDZwNHlaSTF6TFhVL1BrTURK?=
 =?utf-8?B?TXBlWVZITndIbVg5SDhtckI4TzN6ODNqR3EzWEcrWDI3OFMrWitqNHAvU3Jy?=
 =?utf-8?B?UUwrT0RKdmorcGtHbDVjYklaY3F3N25GSWRLQ0ZUVlNxeG5YNUFCZmRrVnRG?=
 =?utf-8?B?eHV6TUtTVHloQmNTUUlHRUIvSnRhM0ZuUHNhT2luREZaUlhtN3BvM044UlZy?=
 =?utf-8?B?eDI2ckx5SElOS0NIU29nN0ZYeG9ROHk2Q0JpbkgybW40bWhKK1ViTGZXWmJq?=
 =?utf-8?B?eHJGUjVteCtyaWZuTHQrZFBTbXg1d0VkUnZuL1prR1g1RzcyWTdWODJFQ3dp?=
 =?utf-8?B?R0dKaTF2UFpOZE9rUGtCQXE4UFRZM3l2SThrS25aQTZQaEJLYitmMFhKMnE1?=
 =?utf-8?B?Ty9KZVRPMktNRjRKZ25UMTdkblpYZUVDVHJVUDRJWSszcXdndUdKMHpGdElG?=
 =?utf-8?B?dWZlU3h4WjA1bnZGUDhoQUFoUWl5UWR2SDVscGtFbjRhZVljVEhyNEVpVy9S?=
 =?utf-8?B?alNhSGxVVkcxd2tWN0xFQm9BTk9SSnFLcEZpVUxZNmpGaWNxTU1DRUd5cHFv?=
 =?utf-8?B?UUwzRHZHUzREWHR6L1lWNnBielQxNjBhWE9aZjJwNlNsdFg5RzVHaEhwdEtm?=
 =?utf-8?B?VGw3TVFTbVRMbks4cTVESjVhWVoyMldWeXFteStCMm13bjZ3VDc0UVRyTlh5?=
 =?utf-8?B?cFJacnkvSXRnczhCaVoyb2IzN1NXSUMweDdJT3cvd0x5RFFaTnl6cHBSREc5?=
 =?utf-8?B?ajFVY1ByZU5KdTJRUnFyQ3hvSWdDdlE0YkxzUHdlNU4xVFIvUnlLTzJTaXFs?=
 =?utf-8?B?ZHZCazIxMFhuQldGNlp3dnpiRXhUUmdiNFVnUE43L3NtemxPOENUa0duK3Zo?=
 =?utf-8?B?UElBUVppTkMydytUd0FqTlRFeGRHQUV6ZXgzcEtITTM4UEtTaTNOazVPWlVt?=
 =?utf-8?B?REZpWnZ2ZmNDVzF4NG5FalBoS1pjcnFlcXhpVGdtWkpla1dLcjhWVUZ4THlt?=
 =?utf-8?B?TkpScm9Ca3VCeGtJbllsMFAxZnQ0b3UwYkF2YU9naUNicTl5aVRadWxSaUVz?=
 =?utf-8?B?ZnFDSmRYYWhzSHBVMHlpL0FGMVhiZ3V6N3dxOE1BL3VGcmttMW56QjhnU0xm?=
 =?utf-8?B?cUpKZGkrdDVSK3MvVE12Y2RycHcvZTJyL2RwR3hzTWJrd29tMXpoZkdHSVlC?=
 =?utf-8?B?ZmN2QXkvWlZxejd4bytYZC9JeXZnN3hoUG1GSHBIMy9Vd0NTWFJnZ3BUNC8v?=
 =?utf-8?B?MFQ2SE5jOWtwMmhLcWUxaDZGM3JSTzVXYXRKTW1HQyt0dERsaVlqT05GSGhi?=
 =?utf-8?B?eENsR3ZicXdwbElqa2RSOTVqRUFhYzNrckhBbEFlRnFmSURYMG5ybkgwYXFh?=
 =?utf-8?B?dEJSSlhjNzVKWm4vU0RYdFhESHZOZCs2SGRwcHJTVmlDa1pCbGx5Vm9UNGFL?=
 =?utf-8?B?SVpHbUhTM1U2eXMxNkNpUUwwZ2E1OWZxdmNQTGtOdUtBU2JWd3RFaTA2T0NK?=
 =?utf-8?Q?lPrkFwlgQd553EPb6ZWXHwmPK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EF250472E056744A408DFEEF3E081FA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c120a28f-d88f-4a6c-b15d-08dce9951342
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 01:36:06.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrqIGcNyRPPOsjQ0pWtljnPnD3yp7o+Hu0KESg/zabz7dIp96gmgVIf+CAh1qvqtxUrNSJy6eQTZ6EgrEg3sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_183617_723383_94E872BE 
X-CRM114-Status: UNSURE (   8.61  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBzZW5zb3Ig
aW50ZXJmYWNlIGluIHRoZSBNZWRpYVRlayBTb0MsDQo+IHdpdGggdGhlIGZvY3VzIG9uIENTSSBh
bmQgc3RyZWFtIGNvbnRyb2wuIFRoZSBrZXkgZnVuY3Rpb25hbGl0aWVzDQo+IGluY2x1ZGUgcGFy
YW1ldGVyIGNvbnRyb2wsIG1ldGVyaW5nIGFuZCBtYWludGFpbmluZyBzdGF0dXMgaW5mb3JtYXRp
b24sDQo+IGludGVycnVwdCBoYW5kbGluZywgYW5kIGRlYnVnZ2luZy4gVGhlc2UgZmVhdHVyZXMg
ZW5zdXJlIGVmZmVjdGl2ZQ0KPiBtYW5hZ2VtZW50IGFuZCBkZWJ1Z2dpbmcgb2YgdGhlIGNhbWVy
YSBzZW5zb3IgaW50ZXJmYWNlIGhhcmR3YXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhz
aWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi9p
c3BfN3gvY2Ftc3lzL210a19jc2lfcGh5XzJfMC9NYWtlZmlsZSAgICB8ICAgIDUgKw0KPiAgLi4u
L210a19jc2lfcGh5XzJfMC9tdGtfY2FtLXNlbmluZi1jYW1tdXguaCAgIHwgIDkxMSArKysrKysN
Cj4gIC4uLi9tdGtfY2FtLXNlbmluZi1jc2kwLWNwaHkuaCAgICAgICAgICAgICAgICB8ICAgNjkg
Kw0KPiAgLi4uL210a19jYW0tc2VuaW5mLWNzaTAtZHBoeS5oICAgICAgICAgICAgICAgIHwgIDEz
OSArDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtaHdfcGh5XzJfMC5jICAgICAgICAgICAgICAgfCAy
ODc5ICsrKysrKysrKysrKysrKysrDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtbWlwaS1yeC1hbmEt
Y2RwaHktY3NpMGEuaCAgfCAgMjU3ICsrDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtc2VuaW5mMS1j
c2kyLmggICAgICAgICAgICAgfCAgNDE1ICsrKw0KPiAgLi4uL210a19jYW0tc2VuaW5mLXNlbmlu
ZjEtbXV4LmggICAgICAgICAgICAgIHwgIDE0NyArDQo+ICAuLi4vbXRrX2NzaV9waHlfMl8wL210
a19jYW0tc2VuaW5mLXNlbmluZjEuaCAgfCAgIDQ3ICsNCj4gIC4uLi9tdGtfY3NpX3BoeV8yXzAv
bXRrX2NhbS1zZW5pbmYtdGcxLmggICAgICB8ICAgNDkgKw0KPiAgLi4uL210a19jc2lfcGh5XzJf
MC9tdGtfY2FtLXNlbmluZi10b3AtY3RybC5oIHwgICA5OSArDQoNCk1vdmUgdGhlIHBoeSBwYXJ0
IHRvIHBoeS9tZWRpYXRlay8gZm9sZGVyLiBZb3UgY291bGQgcmVmZXIgdG8gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1jc2ktMC01LmMNCg0KUmVnYXJkcywNCkNLDQoNCg0K

