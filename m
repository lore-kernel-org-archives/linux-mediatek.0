Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA602C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 06:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6o8SDcV8bUoiW2z/3Rcb2llHVFsu+hL8IWSEETpTe0=; b=2Hr683wm7imweiEEY6ZYyP2Ys2
	0EkIAgmosohApMgK7FHhDIwI5odwEV9Y+mV8GP+lO8u895iZRs0y9j6azV5CJjw/zHiMN27u+/htJ
	49DMDEZ462NBlcWjStVV3x/4hkLgbU6Ewnz3xyZFckFljH0zBm1oRowh5zMj6ZdqVvTwNyjSkMVJF
	BWMUtWJp00i0MHbsnLa+M7BMFjwbzaOhxwhmgShdQsMGGA2XrIN6oR3fl6KsUxAuX8MPKS5ISz2PG
	aiZ6L/1NSz//fsXyVhWeEvsAo1R9naM/3wRGbqL25Tj2a2V1QGEj1cZTLRFqJkptiS7YrCpiqxhQZ
	gvoL5Spg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUKYT-0000000FwdJ-082u;
	Thu, 18 Jul 2024 06:23:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUKY6-0000000FwV8-0kNP;
	Thu, 18 Jul 2024 06:23:31 +0000
X-UUID: 3b177c6444ce11ef955bff358274dad2-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=l6o8SDcV8bUoiW2z/3Rcb2llHVFsu+hL8IWSEETpTe0=;
	b=bnYC9M0UnBkfT2t0YFdR8cmP+mgp7ZvwBfEKKtX6rhEmASvbrRrrcJjPl8BYTo7xALW3huGnuyM8CdWVL1PAljY39nsiayu5WoAjrK0ZieF7nEfIwb/kzmjrXsS8gPQvrhh+oF626Mt1wg9IeVKzurt7tweGp+ITQ5a7ixyGpzw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:f9ce4d5c-23c8-46a0-ba32-71c226043c94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:bfcb7045-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 3b177c6444ce11ef955bff358274dad2-20240717
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 281496376; Wed, 17 Jul 2024 23:23:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 14:23:17 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 14:23:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORCY0BxSaS9CamEtX6EgoTxNYT0D3kB7jwx1PBIP4U2BVcqse8cuGmqlWCjpJFqj5zjojU5BjM/lTa4381bA4WB43LjN/cs9roYmF/Gcd5bcy+6X3wFyU/k0SpWxP/+gfHATKHWLOGlVWBRcv2xh0up5sfQItwP15AAarXzXFFtwkwiWHRYVbrO8Utx0eX9ZWXHU6FhlUwH1X/uoO28M7U9L2RPPi5BNEkP5AOq8XXUklEt/mleVAKT9N/gbF+7Y7VgLE3G8V2Zemp23qp29yuLWZE6l+ZWSjjz98WIcAdPBfON+0vjMun7QWX111hvPL5g/MPRHm+QUx6KqigaQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6o8SDcV8bUoiW2z/3Rcb2llHVFsu+hL8IWSEETpTe0=;
 b=g/auvPjypw01pea/D1sfon1XGmIZ9xec1UFwBV+TI5El+Otf693/zYbU3yMU5s737TyIggRgcZl6HG6P4X5ZPWyp898pAEDWk/1P1U7K43Xh/w2OnOQmgaHTyJzhRIf/g7Vs5OxHW9+3fH+P+Dupv3neR1DdS07fvm6x1QEwv59N54Npe6hRY6S/+CVWQFxfeFofpN3/166icJb4AesvS3zUm7h0c+9PFCvXR6KCAnkD+7A/iZPXEpVl/rcfv2oqxE60SM/XVQZiP76hsEsnfadW66qT9EVd5Fbf0Pjgz294Cq2h0U0jgBYF1fcDfvpqjldTDmRP/z7pXduwmNtURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6o8SDcV8bUoiW2z/3Rcb2llHVFsu+hL8IWSEETpTe0=;
 b=NvAUZz2UamiCnyakcaIuHA974oJOcXhXqQyGR8LWDsdttyhAuuzzt8P/cYgB4RahaEPblOyu1Db2MrdEjs6VvmAdZ6YkSbCkFKAkFsBHjXszWf2fnnlG5w7JeAs5vaEdpjt5s7gV4Sd8huLsIxh3ynT96H8gNvwKJbvFE4ydLRI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7222.apcprd03.prod.outlook.com (2603:1096:820:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 06:23:14 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 06:23:14 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLH8QreA
Date: Thu, 18 Jul 2024 06:23:14 +0000
Message-ID: <2fd0c2ffd18bb9ab26a033c9e308626d70a9edbf.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
	 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7222:EE_
x-ms-office365-filtering-correlation-id: 4665736a-0613-48b2-5db9-08dca6f21ad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTFPVmhPSlltTXdVZkNJeWhiRTNSRkM4K0d1QytwbEYvSll4WDB2TnhyVFNZ?=
 =?utf-8?B?NEhsYWZCWDJOYTJma0ZRak1HdUprZnY2VEs2K2tyblFORFFMZmJCRTQrQjA3?=
 =?utf-8?B?d3ZEK2xvZTIwSjk3dmdUNUF5T3M4aWsvb1l4TDhBZ1JYT1Y1a0hKdnErOGl0?=
 =?utf-8?B?ZlN4NVpoQSt4bHRLbXlSdnFRYmFXekdZM3Zsa0xhdUVScFQ4VWZ1UW9rWEZ2?=
 =?utf-8?B?MWVhYVV1MEhtdmIyRDZ4NVordjRPSHBrWXVMc2QweGMvWmx0L05VY1NqeUFm?=
 =?utf-8?B?NVZrSnk5bWhxOURnSUpFSnZyaFQ1ekZzOU9BaVh4TnNLODN3aUhMa0lwR29Q?=
 =?utf-8?B?U2c5L2lZWHN0NHB1bWZ3TmVtRUJKM090WEdqTmtqeWRpb1JoYlJsKy8zbjNV?=
 =?utf-8?B?Wm5VQS90eWhXNC9DclBFNmlLY21GNVlzUlFtb2VvZHU0K2VzdU9iYysvSGV5?=
 =?utf-8?B?RTcxR0Q1L0xpMWxrYTFmYk9wTnV4MG1Ka2xNTGVYQUNhUjltYmVxK1FTYTE1?=
 =?utf-8?B?YnZ5UXV3RlVnUUZOa2lxS3I1M1RYbThFalVCQm1Sbmh1TjBvY2ZFTWFwQzFY?=
 =?utf-8?B?elhnLzNIY0I2cUYxcHlOaGcwdzJmVTBwakxYd1Jnb1lUOUFEVEdRd25GNi9M?=
 =?utf-8?B?QzAvaG1CT0kyTlJUcjYySVpxaUpXRXFDVVI1M0t2K3REVEVzdlpNSFJ2Rk9G?=
 =?utf-8?B?MVlBNDJzbXU5SERLMVJ4blV0QTVSbWRwQUJJNGZYU3J1UitpRG1JQlh5Yjdu?=
 =?utf-8?B?aGV4OUNibytkUGFZQnU0Y2pFeWhOMGpYR041eXFlRVlhM05COVNqTkF0QVd6?=
 =?utf-8?B?RzhkZHdXRk92THVQNXZBSkxuRU52MnU1bHNTallqeFo1UGpSbzhvZlVxUjRr?=
 =?utf-8?B?SE5kUlJKTUdsQ1IyVDNzdnBQQ0dySGduUTJIdlJKMFA1Ri82WERWbjdXLzd0?=
 =?utf-8?B?TWZQdmtXOThDbFNCdVpzMzJtM0x1QzQ2RFdYRHN6U2N1a3pSbDBzY0J2eXhs?=
 =?utf-8?B?dHdwcXZvWWhabS96TGFmZzdaRjdsSWNmTUpiRGZFRjhKUThRSFMwLytjT2RZ?=
 =?utf-8?B?T1hHTEM2TkZ5WFo3VEE5aWdaVDAvRkRReGRoVnJ4Kzc5aGlNYzNTRmVIVDhs?=
 =?utf-8?B?Um45Z1d3c2pBQjVJN3MzV3NJUHpCM0FFUUdpc3JkTC96M285T2dDbDF0c2JM?=
 =?utf-8?B?N25qaFB1NzVwOUtZbS9XNzJoNEo0RTM5eWpGYTZIOFpiVW95cEJHYmYzUGNI?=
 =?utf-8?B?MU1ZV0xuNUpzYUlWcUpuNERXSVhTMVl2L2NaWWpscHVXS3VCQ05HUk9yUGIz?=
 =?utf-8?B?UGVIWEc3S090NUFITmNmN1pkZmZleGYzc0VCa1U5T2Z5dmVQMWlUUmt1OGJN?=
 =?utf-8?B?THRnU2l4MFJjbnMxODBLRTdxaGlodXVOZkJnQ0NpbTV3alhnTTZmTmphcUp3?=
 =?utf-8?B?bXNXUW1BSjlOZmNyQmY3UXU3cHFVeXdJcFMrcGRMTDB1U2JRMnkwWEFXZFZz?=
 =?utf-8?B?c3pmRlhob3gvSlVqTDZMNEN3cDhPU3IwaHJ6OFg4SHQ1aXJ4TjNsVXV4ZDY1?=
 =?utf-8?B?YUNGR3JhcXVJMDhYK2hRZFFDT1V6Q2FySXhKUnpBYzRabzFOTktsQnhYdkFa?=
 =?utf-8?B?dXBtQ3NQUkhabnpISHNPNEZ6VUlPLzdnZGRTdUJHTkFTandMSmFvT0JlbGw5?=
 =?utf-8?B?NnF6VE9iRzNaZnJ4cDloNzJyWks2aGZOckx5T05Td3hFelI3LzZETCtUTHpi?=
 =?utf-8?B?MERlVXVaNHZrMDVsZlhrL2x6M3hsK2YySnRVaWhkYVdPaklmRDVsNUVWR3h4?=
 =?utf-8?Q?DVDH+p3Oug0O/nTqBmnxiO0oS3tc4ym7eUGrY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXlla1pQZlpYMmpDYVpCZGsyaXFQSXZNbXRHcVk5ZkNPQjU1NlpQUkVHU1E5?=
 =?utf-8?B?K09tSVJMN2NnU28wd0lCSHVValBQNDlVRG42WXFqV3ZFS3YyTzBUcW9lR3R3?=
 =?utf-8?B?SnZtMGo3QnZJQ3JIcm9BTG5lNUdnOHhQWFFQcTJEeTBrelhYbmNFNmhmcE1G?=
 =?utf-8?B?VXFDc1ZGNHM5L3ZZQ1gzV2d5S01VNUV3ekZjcmRpdzFrTEVnMi9MaWNmYVVK?=
 =?utf-8?B?QVZyZ1dLSUZwbGluNzY0cG5IbVVHbWtZZXJtamhkTE05dEJOMkRMdzdDQWJ4?=
 =?utf-8?B?L0pOQnZLLzRNN05WVDJTS2VHbzUrSUpIVWhMRGdLa1U0Wk8yU1djKzVYMEg4?=
 =?utf-8?B?Nm9La1Y5Nnc0bWljT2ViV0Joam9WdGJRUVlrcjdSOUhsYTFYR0lQVnJHUU1x?=
 =?utf-8?B?T3o0RDNwbFJUdEk4YVEyVDZhZVhjbkh3cEc5OUE0YmIwdCtQbzEzU0hicjNr?=
 =?utf-8?B?TkFGVkhSMm1LUXZ3WUd0TUh3cDJlajArTU9jcDVHR2hCYU91OVZXZ3JJTlZs?=
 =?utf-8?B?REN3TmcvMlVEWTUwcW9ycmliSlQ5TThya1hXNXBMSnVJMEtTa0ZFR0ozalBk?=
 =?utf-8?B?L3ZTY1BXcERHTk53RUNQenZmYlE0R1B4ZGpXbHNzM3NWbWlEYmt0bytzZXF3?=
 =?utf-8?B?bENib2pxcDVFVG9MZzhWT3paZGpWL20xZFVMZWZ4K1RCQUZ5MENIcitDVUhE?=
 =?utf-8?B?YkpjdVB3NDdqNXhMR3BURnBLelQ0eWJhQkNVR24zZTJaWElIa1NkbUJuWDlk?=
 =?utf-8?B?bzU4dGhYMFIwN2MxT0hUMFVHNmZ2c0JtYzh0RVZkNENyM1Z6R2xNS2JNcTBs?=
 =?utf-8?B?cEQ5enRNYWY5NDVwNGUydWlwMk4rVENpQzY5VkRXaS9laVV6M1pRWnpRcC96?=
 =?utf-8?B?L3JxVk50UXNvUUpIemZMSnJxaHI3K0VRdjBSYWdYM2VKdkI2QTdsZkJTbmRw?=
 =?utf-8?B?endYUHR2RWF3MkhqLzB4blI3eUlEbmtqYzluM3BETW5odjg3Z1gxcEFUeEoy?=
 =?utf-8?B?aWV5T2VZNUZaVXFLREZsKzVqZTZ2bm9WNncxNmNTWnRmaVU0VWRyY1hSeWtU?=
 =?utf-8?B?bGc2TWF1YVRaZVp3N2c4ZkVwL2V5dXRsSHZ4ZXhRRjRneEpzN2V1cGdFaFBq?=
 =?utf-8?B?ZUlGRXBNYS83cE5GcXFqeUlSbHhTbHFhVXROR3I4bGQ1MGlXbWFYOWhyNnkx?=
 =?utf-8?B?RmdzL1NmYVdqd0tTb2M2Rm9OOEZoOCtIMXpYYzJYdkV4T0kzNzNEZ2ovdWFY?=
 =?utf-8?B?NmllN3J3eHE5MFFlemlDQ3pzcyt4U0tlR3Z2MVBPd0Uzd2ZSWHJHN0hxSkl4?=
 =?utf-8?B?UzJrT2RCYVNOKzNiQ3IyT3hwYzBESDIxSHFkdjRDRiswR1haRlVrbmFHLzdz?=
 =?utf-8?B?bUF6TzJuNWROVnRJSE5oUE16eCtJSzRiUFFxYXhhcmtpeUxNcFY5d3J6VnIw?=
 =?utf-8?B?Wm1WcVNuMkhvUEwva1lDUlBxekRlbnRsM3VnN2VISHJNcG81cFJPK3ppbTB2?=
 =?utf-8?B?ZUdhQ0g0RDE4aFkyK2IvOXRQN0E4UmdkTzFqc0tOT2szUXc2NHd2cjhkeDhI?=
 =?utf-8?B?ZnFWTnNadUVqeWlBNEFuOGhlenVGb0N2T1hPZXRuanM0ang5d08rNGFENkhs?=
 =?utf-8?B?K0dPRkh4SGhWTXVpSnZXUnRYdkdsb2Q0YjNITXNaamF0U200cnVpakZ6cEoy?=
 =?utf-8?B?NVlWRm1BU0xwaXhUMjJWSWJoaUlSb2pORXpVcHgxNDR0aUVYTy9STVFxRnNq?=
 =?utf-8?B?UkVjVGg4TzU5VzVLTlRUUmhXcGk3cEdzMmNwT1JXTnM0d1c0S2pwbUxMbDFm?=
 =?utf-8?B?blZkVG44SzJxYlNxWjI0WTRtcml3TW4xa1k2cDRNaDNZWW4vTEpNbmdNZ1ZG?=
 =?utf-8?B?bmhEc2liZTlyZmtEK3NGdGRLK1VSR1ZFU3JPbGdVd0JUSnhTNU1BS09IeFpv?=
 =?utf-8?B?TndUcVhBajU0OEplRGVTclBlc3FGM0tlRWtZczVuZzlscEJyWVFHalJXdHor?=
 =?utf-8?B?MXQxcW4vRFREUFhLYUgrZkg0akl1em5wS1A2a2hkSDlHYTRJMmpHeUJ2RnhK?=
 =?utf-8?B?M1ZQbmtEa0kwbkIyQUVURC93dTcyR0JsamhrSG85ZlZRTkpVQjU1T1lrRGQv?=
 =?utf-8?Q?Fh8Xu9zGjO36ytkTJpbXweKuU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE1DE745AC8130428CE59E220C9EF8F6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4665736a-0613-48b2-5db9-08dca6f21ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 06:23:14.1203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUC9+8guhgW+vY9LM+BiAlNBJcftgZDvIpH6wVIlZD0oUk3U/BLvNBjuEEcjkpCmVs24qNW7WxGMmnU9HRdNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7222
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.596500-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfvPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
	/V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRhM1C
	hvk6h7ClCzDbZVAsyuuZGr412mQtcAvP4B9GVGgfUWdZik3yrYYnsgRUxNfnHHzB6p8SFnxGBAV
	U596mb9m9BwlhbWjjNs8F0Ait7tCW77rpLLmM7ApYsKSXWWrsHfS0Ip2eEHnylPA9G9KhcvbLn+
	0Vm71Lcq7rFUcuGp/FYF3qW3Je6+0H5ESnMBi8z7nu+PIEb9LPp92QMTwdUF0OLdBiSih1Q49Ov
	qSdqRArNcUB9rxOaQUx4cXuOAFlIIiHLhKYC6Go02ibmlJy4hvwNgAzF8116xNxlEFDc5GXHtMB
	P/jXy2fh0UMxNN2q2VGMhh6J/ibp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.596500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2A1002F7220D87A88BC4C9773B51E4BDB5BE7E8F0BF58ADE6D2F99E0372DE7F82000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_232330_259561_D39138EC 
X-CRM114-Status: GOOD (  13.66  )
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

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gKy8qIEF1dGhlbnRpY2F0aW9uIGZsb3cgc3RhcnRzIGZyb20gaGVyZSAqLw0KPiArc3Rh
dGljIGludCBkcF90eF9oZGNwMnhfa2V5X2V4Y2hhbmdlKHN0cnVjdCBtdGtfaGRjcF9pbmZvICpo
ZGNwX2luZm8pDQo+ICt7DQo+ICsJc3RydWN0IG10a19kcCAqbXRrX2RwID0gY29udGFpbmVyX29m
KGhkY3BfaW5mbywgc3RydWN0IG10a19kcCwgaGRjcF9pbmZvKTsNCj4gKwlib29sIHN0b3JlZDsN
Cj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJaWYgKCFoZGNwX2luZm8tPmhkY3AyX2luZm8uY2FwYWJs
ZSkNCj4gKwkJcmV0dXJuIC1FQUdBSU47DQo+ICsNCj4gKwlyZXQgPSBkcF90eF9oZGNwMnhfaW5p
dChoZGNwX2luZm8pOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwly
ZXQgPSBkcF90eF9oZGNwMnhfd3JpdGVfYWtlX2luaXQoaGRjcF9pbmZvKTsNCj4gKwlpZiAocmV0
KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0ID0gZHBfdHhfaGRjcDJ4X3JlYWRfYWtl
X3NlbmRfY2VydChoZGNwX2luZm8pOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+
ICsNCj4gKwloZGNwX2luZm8tPmhkY3AyX2luZm8ucmVwZWF0ZXIgPQ0KPiArCQlIRENQXzJfMl9S
WF9SRVBFQVRFUihoZGNwX2luZm8tPmhkY3AyX2luZm8uaGRjcF9yeC5zZW5kX2NlcnQucnhfY2Fw
c1syXSk7DQo+ICsNCj4gKwlpZiAoZHJtX2hkY3BfY2hlY2tfa3N2c19yZXZva2VkKG10a19kcC0+
ZHJtX2RldiwNCj4gKwkJCQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3Bfcnguc2VuZF9jZXJ0
LmNlcnRfcngucmVjZWl2ZXJfaWQsDQo+ICsJCQkJCTEpID4gMCkgew0KPiArCQlkZXZfZXJyKG10
a19kcC0+ZGV2LCAiW0hEQ1AyLlhdIFJlY2VpdmVyIElEIGlzIHJldm9rZWRcbiIpOw0KPiArCQly
ZXR1cm4gLUVQRVJNOw0KPiArCX0NCj4gKw0KPiArCXJldCA9IHRlZV9ha2VfY2VydGlmaWNhdGUo
aGRjcF9pbmZvLA0KPiArCQkJCSAgKHU4ICopJmhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4
LmNlcnRfcngsICZzdG9yZWQsDQo+ICsJCWhkY3BfaW5mby0+aGRjcDJfaW5mby5ha2Vfc3RvcmVk
X2ttLmVfa2hfa21fbSArDQo+ICsJCUhEQ1BfMl8yX0VfS0hfS01fTEVOLA0KPiArCQloZGNwX2lu
Zm8tPmhkY3AyX2luZm8uYWtlX3N0b3JlZF9rbS5lX2toX2ttX20pOw0KPiArCWlmIChyZXQpDQo+
ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwloZGNwX2luZm8tPmhkY3AyX2luZm8uc3RvcmVkX2tt
ID0gc3RvcmVkOw0KPiArDQo+ICsJaWYgKCFoZGNwX2luZm8tPmhkY3AyX2luZm8uc3RvcmVkX2tt
KSB7DQo+ICsJCXJldCA9IHRlZV9lbmNfcnNhZXNfb2FlcChoZGNwX2luZm8sDQo+ICsJCQkJCSBo
ZGNwX2luZm8tPmhkY3AyX2luZm8uaGRjcF90eC5ub19zdG9yZWRfa20uZV9rcHViX2ttKTsNCj4g
KwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkJcmV0ID0gZHBfdHhfaGRj
cDJ4X3dyaXRlX2FrZV9ub19zdG9yZWRfa20oaGRjcF9pbmZvKTsNCj4gKwkJaWYgKHJldCkNCj4g
KwkJCXJldHVybiByZXQ7DQo+ICsNCj4gKwl9IGVsc2Ugew0KPiArCQlyZXQgPSBkcF90eF9oZGNw
Mnhfd3JpdGVfYWtlX3N0b3JlZF9rbShoZGNwX2luZm8pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJ
cmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSBkcF90eF9oZGNwMnhfcmVhZF9ha2Vf
c2VuZF9ocHJpbWUoaGRjcF9pbmZvKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0K
PiArDQo+ICsJcmV0ID0gdGVlX2FrZV9oX3ByaW1lKGhkY3BfaW5mbywNCj4gKwkJCSAgICAgIGhk
Y3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LmFrZV9pbml0LnJfdHgsDQo+ICsJCWhkY3BfaW5m
by0+aGRjcDJfaW5mby5oZGNwX3J4LnNlbmRfY2VydC5yX3J4LA0KPiArCQloZGNwX2luZm8tPmhk
Y3AyX2luZm8uaGRjcF9yeC5zZW5kX2NlcnQucnhfY2FwcywNCj4gKwkJKHU4ICopJmhkY3BfaW5m
by0+aGRjcDJfaW5mby5oZGNwX3R4LnR4X2NhcHMsDQo+ICsJCWhkY3BfaW5mby0+aGRjcDJfaW5m
by5oZGNwX3J4LnNlbmRfaHByaW1lLmhfcHJpbWUsDQo+ICsJCUhEQ1BfMl8yX0hfUFJJTUVfTEVO
KTsNCg0KaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguYWtlX2luaXQsDQpoZGNwX2luZm8t
PmhkY3AyX2luZm8uaGRjcF9yeC5zZW5kX2NlcnQsDQpoZGNwX2luZm8tPmhkY3AyX2luZm8uaGRj
cF9yeC5zZW5kX2hwcmltZSwNCmhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4Lm5vX3N0b3Jl
ZF9rbSwNCmhkY3BfaW5mby0+aGRjcDJfaW5mby5zdG9yZWRfa20sDQpoZGNwX2luZm8tPmhkY3Ay
X2luZm8uaGRjcF9yeC5wYWlyaW5nX2luZm8NCg0KYXJlIHVzZWQgb25seSBpbiBkcF90eF9oZGNw
Mnhfa2V5X2V4Y2hhbmdlKCksIHNvIG1ha2UgdGhlbSBhcyBsb2NhbCB2YXJpYWJsZSBpbiBkcF90
eF9oZGNwMnhfa2V5X2V4Y2hhbmdlKCkuDQoNCmhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4
LnR4X2NhcHMgaXMgY29uc3RhbnQgdmFsdWUsIHNvIHVzZSB0X3R4X2NhcHNbXSBkaXJlY3RseSBp
bnN0ZWFkIG9mIHVzaW5nIGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LnR4X2NhcHMuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+ICsJaWYgKHJldCkgew0KPiArCQlpZiAoaGRjcF9pbmZvLT5oZGNw
Ml9pbmZvLnN0b3JlZF9rbSkNCj4gKwkJCXRlZV9jbGVhcl9wYXJpbmcoaGRjcF9pbmZvKTsNCj4g
KwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoIWhkY3BfaW5mby0+aGRjcDJfaW5m
by5zdG9yZWRfa20pIHsNCj4gKwkJcmV0ID0gZHBfdHhfaGRjcDJ4X3JlYWRfYWtlX3NlbmRfcGFp
cmluZ19pbmZvKGhkY3BfaW5mbyk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0K
PiArDQo+ICsJCS8qIFN0b3JlIG0sIGttLCBFa2goa20pICovDQo+ICsJCXJldCA9IHRlZV9ha2Vf
cGFyaW5nKGhkY3BfaW5mbywNCj4gKwkJCQkgICAgIGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNw
X3J4LnBhaXJpbmdfaW5mby5lX2toX2ttKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiBy
ZXQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCg==

