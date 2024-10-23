Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0366CD2E008
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 01:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aAqJfV30VTw7zaD6M/+lKE09zB7nanoLtrjmQiUPVM=; b=s9jmHknColiEhC2tL1ZhU/JdyK
	3GfAmt/CMQ/cwwEeUGKwd1a7AgseurOfdxLsKmFqRgi360fKgHsaRFccSvaIF/U0bwxO79NX7b8Vy
	od9zKXsLLojhXO9sbtMqEuXNu4gDg+Zd5ovPg6wZzskor7xe440AnuZ6HEENB1y3Mk0/wJqrmvVge
	j6ye0ijUg324XRAesLIg6MGLOhehg/ARP3GxrPJeTmbyijh34aW9IpGYIMh1MUZ6jXjV8wFqNA/Jk
	YMb3W/xtWSkBCrqi7P9X62mLU+wgajE9WPovirO43arVQvuERs5PcEFO4aKWyMJRZwisHGxFt2OFc
	QxRtpB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3QIU-0000000Cd6s-2B8a;
	Wed, 23 Oct 2024 01:36:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3QIR-0000000Cd61-3LvV
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 01:36:25 +0000
X-UUID: 33342eae90df11ef82ff63e91e7eb18c-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8aAqJfV30VTw7zaD6M/+lKE09zB7nanoLtrjmQiUPVM=;
	b=JWSQKn/ajKssUetEGsdAq/pH6Ta+swRVXswbr+UCdAuRqchz+QyKnGTqU8NVAugjIU+luNI6AhU+v0GRiwmg+FHVx3/XVJ3YjdkJZQGpg0K0CJZruXqnncs47ab+KR2HULneeSkBMhp/5yi9Fwu5ALGKjmO++M2iuj11aEDbvyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:78fdbaab-e1a4-4821-bd78-9b068b99a03a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b90fae41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 33342eae90df11ef82ff63e91e7eb18c-20241022
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 240683956; Tue, 22 Oct 2024 18:36:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 09:36:14 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 09:36:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm7OhKJvAXDu25CTN/JPM2MqFrcgT446Xv+6VCDtNf3dqcucDfLeB7sH/tEdVqVDYoZYLVsGoA2oXdPkAJsFNba5/F83VHcjoDep66fWtOA9E8MkRk2Wyf5QhwGjhoGtt4KGdaiTPJ7Tq4VUH65f3drdi1xlASHIglI29n9loq2/aomFNaMBpABgJloMX4684QOIpKDzXiGxlmfsd0A8KVSNRYo+68VbVAPQRBWNfkH4T8iYy5oVhFftumo9+sgd/eNHW4J8lflCVb0CBtUcM2HdSOLW71b/ku15pP8uHLS8Y26q7URBgX3mVLEVXjPvP6i2Xm7IQYkIKEXFHRgR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aAqJfV30VTw7zaD6M/+lKE09zB7nanoLtrjmQiUPVM=;
 b=Vc+XXj8SPdFAfB6UNzC+39IktKmUYFPIslASKgt7SzR0IUt2maIapQbLGUSGPa+DDjEcdtdr/tZjnbWYd7gK+cpqIzoFFrSNcsoHnTWoXGwooq0ZBthBIDhWSKwxx/GeM3prN/MsPivL0gHgLdtPDCoNL/LSkMM2hCFaJa+9y/vrxH26zjRt4EA/u9gWugMkH5yL3z1VwlhZFCxiB0y5Aqt1+xiOm34WA15zYmNYEPG96kTgPzTCQAEsDGABmJHkcZ1IXP7BbWXk/Uu6EqMlc33nYtPQ29fSQDtpUJWuoPfqLcyaExmKsKNMB/JlnkvUd1LlKcBb0lkWqCmLTCZpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aAqJfV30VTw7zaD6M/+lKE09zB7nanoLtrjmQiUPVM=;
 b=S+gJCjmAK8SO4AcNy4N6nQQLzwCM7ke+/66QWzgOYvehN3nuNrdD+AyFEJzNivt9FM6Pve0PkGWW9r6eqUVJ31ovlo5S5ZfNaofzYdUslD4jXqx8bBrvyguSpgB5+XAapjQAi1Zt4TpDUSwiT4/7O+dZ8OhBECNV+nljeKENacM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8247.apcprd03.prod.outlook.com (2603:1096:405:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 01:36:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 01:36:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Topic: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Index: AQHbFYZGXQhSYURdx0Gm+WdO7yD3TbKSo3WAgAA3/QCAANFhAA==
Date: Wed, 23 Oct 2024 01:36:11 +0000
Message-ID: <18408d202e2aaf9740dc98f749b1cbd4d3fead7d.camel@mediatek.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
	 <20241003111851.10453-10-ville.syrjala@linux.intel.com>
	 <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
	 <ZxejZnvO4mlKT4j8@intel.com>
In-Reply-To: <ZxejZnvO4mlKT4j8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8247:EE_
x-ms-office365-filtering-correlation-id: e5019043-e368-4c23-e904-08dcf303132b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eEZER3c3ZnNYaVFaMXd3bUNrZnVvTEcrQlNrU0NRNnlMeTFYcDAzWnJBVlll?=
 =?utf-8?B?eHY5TEh2TzFmZnFsVFVGM09OTW9EQVczblBCMkc1QnZpelNTWC9HVkZyL1E0?=
 =?utf-8?B?cVo5TmFRS29OYWhvTjc4OW5mckx2RE01NHdrSVNZdnFtV3FvditxbGVKU1ov?=
 =?utf-8?B?QUJmR0t4aXh3R01UaEJrQzFhMzlBS2FHKzZGOWxRL3JPRzRqR2xPeUNPaldy?=
 =?utf-8?B?cDBEVHpqNDlnMmNqQ0F5Z25TQkQxR0tCUWJGaUdjVHNQek5JclM2WXM1STkx?=
 =?utf-8?B?OEJ2OWZNV2VkT3VZL0JCRGRDR1RlbUFzdXp6VExBMFhrUnhPQXErbXRCeVhB?=
 =?utf-8?B?Y1NDUnl6dXFLTS9NNURvZVJCN001VHI4KzBLOTUvYXdCbGRHRDVhZi9sNndy?=
 =?utf-8?B?b2hVY3ZWOXFhd1A1Mm0zNWczeHlnQmxqWW42b05Ba255bUJ3SEgrZThzMU5o?=
 =?utf-8?B?VmhyeE91eW1zL2FTYlczVjlVMTBsT0dSbXUzUW9pb1orUlF6KysyRlU1bUNB?=
 =?utf-8?B?TDdvK1VYcmZxSjUxSEg3azZwUC9LaEZRYWVaMUxCMlF2MEloQTA3aDFtVDV3?=
 =?utf-8?B?TFNoZlVmS0hxL2pFTUpueUVtUThpTzBWSXl1dmRLMzhueXhMV1VuQjR2T3ZN?=
 =?utf-8?B?VTNETWMrdklQekQrNHV2dExRM3NZTTB6L0pjZVV6dlhuNEJDTDJzaHRKNERH?=
 =?utf-8?B?bEVWOUFwM3BWOXMxWkRGNWVHamRWUlBZZXhLWGZCOFRqMHYwY1hyMEIvUkZB?=
 =?utf-8?B?emtxSmd5YUFtNGRINHJIWkpyK09YaWlOSHdGQU5KWHYxSzFFVVRCS3BVcjY2?=
 =?utf-8?B?ZlNhVTdUSUNPZk5TNTlNamdtM2JzanE5bHk2ekZmUGplYWpSUnNueEpseXpa?=
 =?utf-8?B?aVBqQTBXNStFNnB2YnR6S0ZQalNTeG1xVkxLUkJ2ZDlPS1pFNXgzdm9IWFND?=
 =?utf-8?B?TGc5MlRkWGQ3bm5VM1hwNzhBWjVnVndrOW9rdTc2MGRNMGsyMHo5TFR5ZWgv?=
 =?utf-8?B?NUYwdWdVTDA1blh3WDBRMXRGSFd5N3BzMjFib1FhUTNDTW9EdWpyV2lrVGFZ?=
 =?utf-8?B?Mmcva1I3NnpGMnVMU0VQMXNDN1hNZ05IVnE3Mk5JazJzVm9pbWNPOGE2T1Ix?=
 =?utf-8?B?UXR3Y29GQndha0k5eWQvdUh6OGhzbVRjMDVEaGZmVXA2NVBWSlhiZTViNmpp?=
 =?utf-8?B?MlFEMU1XL0RWZVV5VjBOdVk0WVQvRStuM1BwZXI0MEpRVWtGUUd6VEVxZk5W?=
 =?utf-8?B?bzVKVTBIcDJ2eG9MZGt3K2MxRStTbUQ0eEIxUWtzaytDMDZaQjRzYmtxNVNo?=
 =?utf-8?B?ZEhOdEJMYzEvajFXUGFYZE9HNU0yR3lGZzBpcU9rUU8xdTJnNjZUZzRWT3Bn?=
 =?utf-8?B?WGduQUFDRUJSVzh5NUhkbExUWTFNWkNFM2JRM3JBNExIQXg3a0h1WUkvejdQ?=
 =?utf-8?B?TGVmM3dxWEl6d3g3Z3dyNHhBejdObTZqcjBiZmdWYjNjQkR5YkNadEhDalFh?=
 =?utf-8?B?eFRYK2F1SWp3Tzc1ZFBldDllQ1hmcHp6cTRXajlTZkNzWFh0L1BqNmhnc0lM?=
 =?utf-8?B?a2lmZ0VxUS8vR3NCYjZWUWwxU1FUQ0RCOEdxYXhvM3JiYVQxaVF2cGNIK1RG?=
 =?utf-8?B?VVNTOTRxQUtPZUhWMUNZM0FhQXRJemxhQkw4YjZXN0xNQ2RBaXg2aVZrL3BY?=
 =?utf-8?B?L3RBSzhyUnZ5Z1g3WmVpb2lUbGM2ZW42alJrS3Frd1g2RUR1bVlJdkM1MXZk?=
 =?utf-8?B?N2p0L1J4OHJiTnFtc0VReXJhRVBQTklYQVlqMzJoODZPRXhtdlptZlJCQlRI?=
 =?utf-8?Q?DwbwOASGrFyBEPaSRVitUxiVKXGuPfQ0clPKo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnRjbVVBMVhmVVVVck1pRlVlWVdrWXRvWkthdjNRTEIvTmRqTTlSZDYwT0ha?=
 =?utf-8?B?SEFNOUdwVzYzUHNSc3NoYkw3dGw4WE42NHg1SjVGZlZEY3BwT1RlU3pJTy9B?=
 =?utf-8?B?d3pEc0RMd2ZDZjl1N3dyVFlvY3FEZUpSYTI4SW54R0twMktqWGwwQm9yb1lS?=
 =?utf-8?B?aHJzdi9DUjdUTXY1b0dVeWlzc1l2bnZUWEU1VEovMlg2VTJuQ0psSHFKdDlz?=
 =?utf-8?B?OUpMY25HUmRrMnUyNTRVL3dhTWVlcHExSTFlRktNZVl3MGtHKzZER1VVSWNs?=
 =?utf-8?B?ZXJIbGxGOC9ybUIxTE56SGFnS2g4cDZGSnN6L0NsSzU2UE5QNk1wRzVQTUdN?=
 =?utf-8?B?SEs2eXZZUWVXeUdjQUp0bmhpcExSNDdocjQyWGkyaHp2eExMNmZvb0JOZWc4?=
 =?utf-8?B?YTVMbTY1QUFSOG5tMHpjbXBpcUJ1ckVVUW9WNkpEWGRYdWRLNGVya1BKQ0I4?=
 =?utf-8?B?QXRtUWc5Z3h0bVA4akNnRHhLUnltWnR2SGpHUklRZHdONCtLUFBhQ3AyV05h?=
 =?utf-8?B?bS9CWkNCakh1OUZYODhsUTVqak9hbkFSU0FNNE0rbFpqeWJQdGJqeDdrOXFD?=
 =?utf-8?B?M1hKZVpPRmhrU2hDTit4ekpibW02eGtkUTJJQng5TVFkWVNpbkx0OEVna1lJ?=
 =?utf-8?B?aitmZVI1cHovTE1BOVBtc3QySmJsaVhxVU41S0diV0M5S1RxbDZzdnJBaTNo?=
 =?utf-8?B?bWxkdm5ZdlgwOVBiWGNNOU5IOFFUQXVMTjBpc2hIR0lDWHNGN21uNTQrQlJ1?=
 =?utf-8?B?Sm11cERRMXBNT25XMWFTVFgyQmJpOS9FeDVMalZWUWtUZGNsdG43OUJ0eXpT?=
 =?utf-8?B?U3V4Mk1JQW1OMUJ4QkpFT3pWUTVnRDhGYVdQaE5hRnFJOG13SGJDbE11NGVY?=
 =?utf-8?B?VXFBRUFCYlpNYWxSMmVCRWcyMlRhcXhEVGJXMkdQWHpaRDlkK1pHZHEzU0NQ?=
 =?utf-8?B?Y0VSMGtDWVBvRnJxUkFRWmU0UjNRR0s1cmI2UzNBemZ3Zno4OHpHb041UEpS?=
 =?utf-8?B?eFFRNUVPVWVWbnVCMm1na2ZwZytObloxYnorN0RYT2R5N0VHNzdVbitxaEVH?=
 =?utf-8?B?Y2ttdDNwQ3MzN0JGTXN6VzFpSTEvejhzc2Z4WGlYeHVYRG4wL2IzWWxpQWNx?=
 =?utf-8?B?UGZuMnR4MVlKbEV4bmVsN3IvRndrOGR6bkZSNjdJQzFlSE04QWNNbVlmS0N5?=
 =?utf-8?B?c3NYTStvaUJuelNLdlZlWm0wU2VGcFdHT0d0U21rQk5jMUpVVU1CM253UXVh?=
 =?utf-8?B?YUY5cjFuZXZjZmxvSmVVZ2lOK1BaZkF6KzVVY0JYTHNWVGxXa3hKbHlIWCtD?=
 =?utf-8?B?UHR6djNlaldUM0Yrak01Y3ZBdXZld1ZneUhscFpreEU0TUxjdzN3MHZLNlM5?=
 =?utf-8?B?TnVaaGZsRG4xMVgrVUNFL0ExV2ljaE43UUpIS0NRSGRkVTJBd1NXOGp4UVl4?=
 =?utf-8?B?dmorR2JobUo1clRVWXJBbW1LWFVqaXRiMGtLNTBYL2hHVUZOTXR2dTFpYjRZ?=
 =?utf-8?B?TWRVNk5BYWpBZ1UyWU9YbVdsSGUyVHEva1lwU1J1bC9sM04waEhJTnk1NUhh?=
 =?utf-8?B?a1NhdnNzM0lZRWU0enpjeU1FbVUyRG5mam5CcXA4c3RoR1pHSUNuNDljNU4w?=
 =?utf-8?B?TkJFSWRSTm9xem1yNHVzdkt6Nms3MTFISU9uaFFaOG8xVEFsZHJJYkl3TlR3?=
 =?utf-8?B?TTNGQjlrV3Z4YWRZTTJDQWFTM2JOQW9VWGlDZk1zTUladU9Vc05heDFrb05r?=
 =?utf-8?B?YlRBb3pMRDFobnhySTl5YnA4VnRaNTdJUjVSOEZDa2Y4QWNNV3d6MFdUNUow?=
 =?utf-8?B?NGQ4Y0h0NllSNmc3MFlhNWYyM2V4MUl3RGVoSFpTeDlHRmhzcmJpR3ZYT3g0?=
 =?utf-8?B?MHVoM0ZnWXRycnhpUE5OaUhvbXo5MXVaSisrN0tDajNPaWtLdzNSZjRydGZW?=
 =?utf-8?B?VUV2OHF5RzhTMk9FMlIrcHo5a1E2Slh3NlhjdTN5UkIyQ3VwaUlTclEraWVQ?=
 =?utf-8?B?UDM4dWpnamhiTGo2a1d2Y3p0Mk1Dcm1MRXhUYzlqZEp6RTcyMkJ1bVlvN21M?=
 =?utf-8?B?cmlwOTQ0MzEreUFWWEJVVURCajlnOUZ6M2tkZ3ljam9ubkZWMGkzSFF2ZlFO?=
 =?utf-8?Q?rbqfVPdtAPTrH0JeY171XbQ/4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <205A1D53B9A4F74781731C287EC26219@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5019043-e368-4c23-e904-08dcf303132b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 01:36:11.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JsakWZT+w3paJa6dE639BU8tjRfujQLnrcg/rWElsHq5baNRtubIpKywLRTzPYBzBbof9lDxWMqirmaYBoXM7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8247
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.975100-8.000000
X-TMASE-MatchedRID: O/y65JfDwwsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rfEt9Ay9zO7ifZYRtbOr2thK8o4aoss8pezmeoa8MJ82HtZs6e3ZMHeR7
	1CvB/hQaV8SPWQtc3qOzoPScbG9SHlGGjvxPk/0NjVtAwIy+afn0tCKdnhB58pTwPRvSoXL2ZMP
	CnTMzfOiq2rl3dzGQ1A/3R8k/14e0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.975100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 53AF8A1E82063BB180FF10C1E2DA2944A199F97415D52EA2001C3C87401EE8002000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_183623_908557_76C04CF8 
X-CRM114-Status: GOOD (  15.53  )
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

SGksIFZpbGxlOg0KDQpPbiBUdWUsIDIwMjQtMTAtMjIgYXQgMTY6MDYgKzAzMDAsIFZpbGxlIFN5
cmrDpGzDpCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBPbiBUdWUsIE9jdCAyMiwgMjAyNCBhdCAwOTo0
NjoyNEFNICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiBIaSwgVmlsbGU6DQo+
ID4gDQo+ID4gT24gVGh1LCAyMDI0LTEwLTAzIGF0IDE0OjE4ICswMzAwLCBWaWxsZSBTeXJqYWxh
IHdyb3RlOg0KPiA+ID4gICANCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiAgRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gQWxsb3cgbWVkaWF0
ZWsgdG8gYmUgYnVpbHQgd2l0aCBDT01QSUxFX1RFU1Q9eSBmb3IgZ3JlYXRlcg0KPiA+ID4gY292
ZXJhZ2UuIEJ1aWxkcyBmaW5lIG9uIHg4Ni94ODZfNjQgYXQgbGVhc3QuDQo+ID4gDQo+ID4gSSBk
b24ndCBrbm93IHdoeSBuZWVkIHRoaXMgZ3JlYXRlciBjb3ZlcmFnZT8NCj4gDQo+IEl0IGFsbG93
cyBwZW9wbGUgdG8gbWFrZSBzdWJzeXN0ZW0gd2lkZSBjaGFuZ2VzIHdpdGhvdXQNCj4gaGF2aW5n
IHRvIGNyb3NzIGNvbXBpbGUgb24gZXZlcnkgc2luZ2xlIGFyY2hpdGVjdHVyZSB0bw0KPiBzZWUg
aWYgdGhlIGNvZGUgc3RpbGwgYnVpbGRzLg0KPiANCj4gPiBUaGlzIGRyaXZlciBhbHdheXMgZXhl
Y3V0ZSBvbiBBUk0uDQo+IA0KPiBDT01QSUxFX1RFU1QgKGFzIHRoZSBuYW1lIHN1Z2dlc3RzKSBp
cyBvbmx5IGFib3V0IGNvbXBpbGUNCj4gdGVzdGluZyB0aGUgY29kZS4NCg0KUmV2aWV3ZWQtYnk6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IC0tIA0KPiBWaWxsZSBTeXJqw6Rs
w6QNCj4gSW50ZWwNCj4gDQo=

