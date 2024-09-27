Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1371CEBF86
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYG91kRiRvseDtGOeAbc0w0WStyvqkl2w50k8umpxJc=; b=TgU3PYHdTBkeBycmuaeLCdTd/M
	SnHGBI03aSpalBLqIbkhDwPP2wFzZN/daxDQKs+mj223JQZ9F20KPlm0XJeQjJc9g0RvvABhiUupD
	QoSGITgkSUFf1cP4EfLMxXwjhRs0jHGc3J+roRQE/R1/7qidJwPFQzeoUuh2zvGt+X1tfuqsarsNP
	NoOdMGRdG9daJCJqiEmgGmZEO2kj7vYHTaNxk6w2M18McQtk/Elexb/8pgNYu6wyMhb7eJ5+cRJnE
	MSas+3yVenVmF+OsuCPjPqceFVHiwpDBsF6n4UrPbxb6w7sguPqPE7efBFGhRpiK3tg8270/Dpof1
	zoNAJuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su6qp-0000000AbEo-0tk2;
	Fri, 27 Sep 2024 09:01:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su6ql-0000000AbDe-2YCf;
	Fri, 27 Sep 2024 09:01:22 +0000
X-UUID: 0cbbb2907caf11efba0aef63c0775dbf-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LYG91kRiRvseDtGOeAbc0w0WStyvqkl2w50k8umpxJc=;
	b=VMo2/jMvWRZm0E9xKMsw9iXKYCjk7NKlHIcEpbd3mgRqY/7zNiomtRIftsV4l4Nl6tDPHqLw0mgdIc0lw1rGVkE6E2yzh5zu7BY3sPFGtfM1qum5ImDz86D2ay9soMiG0hEk9YHxznx1w85qHHZB6EMi2EbU9xFjXH7e7RFVF1c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c4cc01ea-3015-4872-b303-5daaa7b88911,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d0f6a89e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0cbbb2907caf11efba0aef63c0775dbf-20240927
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127634079; Fri, 27 Sep 2024 02:01:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 17:01:11 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 17:01:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wus+92MW1d8SzcSdM8Bs9HKlExbjWkUO52/8R+fBYJJBTtYqSdcyn8hOcaVUk+0ieS4ks6EJDncc93sxHMV6rGWY8i9TgP9SKHFE6M3UfesABNfYW+8JLS1GgJaP9xJwMifexFgwFrDfj4TXCBCZI95T2Hl0Id1ndBmT+6YRfZ9s4RQ3MTADg1EExqx7k6UM3DwPXyQ1txgdWIb2mEFBao2ndznQ9gt1mWC6b37L9nTxRoxzFW3tECH59ARRxPSdi+ATQaiflv3VGpW+5i3dVTeAvuhET9Z2V0ejTekdZsRF/9bTl2GEEqm0iCPppQXySP/cNuFqMdzwyVeoIXSKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYG91kRiRvseDtGOeAbc0w0WStyvqkl2w50k8umpxJc=;
 b=c6DkLTKGmjf1akm0KPwAh1UmLTW/A6dDruelzm9kG6paK9/d0WTzVjc3c6YdFyN0qxkJ4US5++Mth+jpOVIiUtzXo9X1Ojt+qLoLgqBWOQiV39Y+jeJD8hM4uhw3aKz13vJZwaPsPTnCJ+NKfgaJExGrp1g16EHIHvduHj6ZmHwICqT8yj5YEJz1GXz+QJ7sMBdHaUjnFhhpqhxYBvlh5g/QwKglAycrULoaXKu7gdmX1LHbR5Pk6GgcKqrlhTJeVEkRm76Fup3SLF4sit2+TfckrYGNOZT8lF9PkokhnpeSRF2Wi5//wfc4yVwLK3LbMnobRnnqelXzzBHasnhjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYG91kRiRvseDtGOeAbc0w0WStyvqkl2w50k8umpxJc=;
 b=qZD7dfgpE9L4HKryHU0iNYk6UlVJsqC1JoQ7gQNovfLF98XhSkvZNsvSOKhmxQydFnCwg4k+eS+V55OKmX5U/IPAMkH0I+OCddGqZ5qah2iurxV01OILuj8V9fVQ+2esIDA8TZH1Nb8Q5saDmJI+K08LtvKse7OtfU6lGc/PbP0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7420.apcprd03.prod.outlook.com (2603:1096:101:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Fri, 27 Sep
 2024 09:01:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8005.017; Fri, 27 Sep 2024
 09:01:08 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?=
	<Macpaul.Lin@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "moudy.ho@mediatek.corp-partner.google.com"
	<moudy.ho@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Topic: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Index: AQHbEKFuj7QhBPv0hECPFyqr2VQybrJrVlCA
Date: Fri, 27 Sep 2024 09:01:08 +0000
Message-ID: <0610bf4f130f238af148334969dfc0373cdb16de.camel@mediatek.com>
References: <20240927055140.19688-1-moudy.ho@mediatek.com>
In-Reply-To: <20240927055140.19688-1-moudy.ho@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7420:EE_
x-ms-office365-filtering-correlation-id: a8f4e178-a99e-4ca5-50f5-08dcded2ed4e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aXV0MVU3UUpIZk9wTzR5dHZqZXBqdFdSRnhQbUhrSTIyaEJ6UHJndFZRTzlF?=
 =?utf-8?B?TitQUHhZZHp4Q3czMTVRaXBrS2hZMnMxdyt2TCtPYklPSitlWDhkTitRZ29V?=
 =?utf-8?B?MWY0cEZCaTZDSTJTRkRpYXJYVGhxMVQyckYwVElucDZ0UlRXWmM1NmM3ME05?=
 =?utf-8?B?bXpQWVo3cXZuSDdLRjlSNDFiRzdWMjlCNDFuSWk2azFRSXRhQU9xdGUvL3Zs?=
 =?utf-8?B?aHVXU3pKU0REcmh0YnlPK2NscXhXaVBRaG9mYkw0RUtUV3FRQ2hrd0FuS1hq?=
 =?utf-8?B?NDZSSjk1bVZ6Zmg2NlZRU2RXTlpucEZmLy8vYkt0aXFneVFIL2JsKzg4Nzdq?=
 =?utf-8?B?RFhVRFBTWDJQeVUrUXh5dktadlZia3RjbklBUDYzR1pzcC9CaVhxUzJtSEdn?=
 =?utf-8?B?ZzRncnNsRnRNa1JnWHRVL3UzYkdrbGtVa3hVTTdOWStDdUxKRHRyZlRWZG9D?=
 =?utf-8?B?VjhmTlFyZHNBdWh2TjFvaC9Mdmd0enUrdjZhOWdMK2doV2x3UEhDYUUxQXRE?=
 =?utf-8?B?bkFBUjA5SDdML1U2TU9QdjhpQklFY2p4eEVnU1NKTms3aEoxWDdjTFlQN3lG?=
 =?utf-8?B?L3I0YjQxVEROdUNUVzMyT2FFSnFidHM2UWpuLzBEaW1NelVqOWxwV2Job1Uy?=
 =?utf-8?B?K2p3bGxkVE5UNUdDa3ZsaTNieVM3cm9Cb0ZHMTJvQ1dZN1dOejFFbnZkUkVY?=
 =?utf-8?B?dVJ5TWo2dHJLVmpJbFp2MDVGaU5hUklmUGNzWVpkdkhjaXZQczkvUGkrUXQw?=
 =?utf-8?B?Kzk5VFFjQ3R3bXVjMGVUVTdLeEVlMU5JbmRpSVdRSHZNL0FRdEVYOUlWdHNS?=
 =?utf-8?B?VUxSR280MTdmWWg5RWRiY0FOMnRDRldGSVpDd1pTSFZPNWpiNy9HRXBBeWVH?=
 =?utf-8?B?RlBkckhHcUEzY3h1dGRlYVlKRmZ5UTJBWXl2VWt1dDNLMU5GWE81ZUNKUXNu?=
 =?utf-8?B?ZmpUU2wrZFhmTElIY2k4QmRmbTM1cHNEdVlWYmJWam5mcmF6Z0RtaHB6dTJ0?=
 =?utf-8?B?TjM2T0UxREIwVm00WUtERWdqRjNYUDZxZk9RWjQ1TG5CYWVrSG1jRU5Lc2Fi?=
 =?utf-8?B?R1Qrb05HTlF6Ri9tWDU5cTVzaTB2VXZWSkFCWmhJYnU1a1lsQk1sVVpJRERz?=
 =?utf-8?B?eDhiUDVTZHR6ckdrVkQ4a2xRcFk5a0FvUERpNkJHVlZSRkFHaThQcnVCaU4y?=
 =?utf-8?B?M3RCdHgwWGF0TFU5ak9EeWlBa3FnQnl2bWV4L1VxcTFnQUlsTlc1dWhOQ0h6?=
 =?utf-8?B?MXdLQ1RUQlRBRWNQdVVicmdSTW84RTFJQndheVowRVJ1ODRvMnJxRXJ6TUFk?=
 =?utf-8?B?WUlvbFpEdCtNQzYxN2ZyQzZybjlGWnE2TGpZSlUvTDZuNzdhOW1lTmZHUk05?=
 =?utf-8?B?MkY0NkRKYWRuVFIvZHVkcmpzdXdZU08yckRreS9ueDFSU0hnb3R5cWU0cjRu?=
 =?utf-8?B?Tmg2U2lqUk5aU0d3VTVvU0JBZ0ZEc3JDRHBFSlRtM3VHNk9QMGpDQ1Y1UG9V?=
 =?utf-8?B?ZkRCTmlyWitianJvdVNZRTB1bSt0WENrcndJeEhsN1FTd2UwYlpQQnlkeVJp?=
 =?utf-8?B?WVFCbzNSY0xWdG9EcXdlcVNDVkY0bXdxRFBCNzlyczZGeXZNcjcyVTVheWgz?=
 =?utf-8?B?ZGVvVUlqNVN2blAyTS9TUThMRDQ3RlFMbDVHc0c1bU9CenNYNTRua1hWVE1w?=
 =?utf-8?B?NWNjR1ZrRWorUHdUbzNkQk1Eanp5OTlUbTI2N1RSNVRTZGNDTUluUUhGQzVk?=
 =?utf-8?B?YTRsTGxVMTU1TktIZi9LMzVMZzBMVTRpWE1vV2dFMXNYZnJDaEZGeTNWS3Rt?=
 =?utf-8?Q?yksHWy17IG05LtuOxf+pEu2cYwv1tTE4wSBNw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWI4QnBLTEttZ2JZMS9PQjhtTGZsRkRnMDBkTVdtZm4xUU45ZDY3MittVTZ2?=
 =?utf-8?B?Z0V4cGMzTCtQeFJ3NDRVditmN0tvV1owcG15dUIrRmUzOGlIY0lIbU81aU12?=
 =?utf-8?B?VnNNZUM0dFQzN1JwbGZFYnM4OWNtYklLZ2RGUVBNSnRZTU1aUHYzVkl5Vy82?=
 =?utf-8?B?dDByb0lhdC9WM0JZSDJDaDJZZ3BRNUZkWDhDZTRVRDdrSVVyNEN3aEl6WDc4?=
 =?utf-8?B?UGg2c2pGMmZUT2FoWGNZY3U4OXMyU2t3UkxaUjRFZXE1SUpzL0hmT2hjWk9h?=
 =?utf-8?B?SjRUVjJ4enYwR3V2KzdXaXBzQlR4cDZxSzZLMDQzc2FSZEZidlRGY3A4dk5E?=
 =?utf-8?B?SkNPR2ZRbG1GN0dBVHBvYWJUNDB6RjZLQ05sMEQ3NWpwSXJMRXJvcE9JTDds?=
 =?utf-8?B?eWZMVFlwazZGMWNvTkxwajFab3ArQklIZUFHSWw4dkgwRVVQWFFRUjRBcFZJ?=
 =?utf-8?B?NlY1bG9nbWl4OXRZODlyZ0lzQUZJbTFSYVhud2lqTjViWHp0WFF2TWdFUkZt?=
 =?utf-8?B?dTVwdTd6c2F4bmphSmdKQWwzenJtV2xkc2hoclRjWlV3QlR5WnBVeVEvWG5V?=
 =?utf-8?B?bEJPdUQwQ1F6L1ZTTkpnajhDcGQyL1ZNelZGRkpOOUZQTFpXWGRLSDIyRm9k?=
 =?utf-8?B?THMrSUpnNkhXS0g1eHd2UWpYNDFVMkpoWDVwbGhsMnM1WlM3QTlTd1FWSFA4?=
 =?utf-8?B?dXNZN3paMVRyMHlzNE9Id0VtRWdIYXRLUmx5YUJnS0lhaUFYZTEyd08rT1J0?=
 =?utf-8?B?dzZOWVovakRhakd5cDVwN08zRVdwelhkVFVHY3ozMklJcVdiTitsWTE5Vnhk?=
 =?utf-8?B?cy9PaGl5RUZtbE40NVF0VW5DNVlIVmYvdmlvRS9IcXBTcFR5Rm1vUkNRVU0x?=
 =?utf-8?B?eU42bzJpUHJqc2hEa2ZiMSt6TkNKQ0VjS0tPOS9yT2hDZkk3eEV2elhOcnhh?=
 =?utf-8?B?dUlqY21lSWxJOUJqWkk2bmM0dHEwdXQyNmxiWXVUaVRrZWRxNEpMUXFlY3RR?=
 =?utf-8?B?WDhTdzNuTWNVT2gzbVJlaFM5RzJSNnRvS2wrSXE2RXBTKzVrMi9tb1hoeXFw?=
 =?utf-8?B?WUFzNGtzQkczVlNWNWpFcXY5MHkvSk5UdE5LVHBOWGFvQXBIVks2TTdtNi81?=
 =?utf-8?B?YU9GblEyN2VxVStGcUdFbmJGWDBQa2F3bVg4bXFCc1RrR0JHZHB2ZkRMOTVC?=
 =?utf-8?B?eEZKZjNMWHV5MFE5dzlHQ1dQNHh2M1hnTkNGWG0wMmE3VnF0eEQyN1lRYnkr?=
 =?utf-8?B?WkU4aGpndkdaR0p4bExyZWJCMjhaYlRrcEYwTkpUQ29sZXNuZW5UanFURHlj?=
 =?utf-8?B?cWVpTm5rZ1U2cDBoRFMyMllHcTRHeVlkcmx1ZitjZUluaXB1RmpQNDBNL3VW?=
 =?utf-8?B?VEFKTWNXOW8ySG1FM2NMOTg4VXJnZ2xna2JNKzNwZW5DZEUzTlJDQURLVUlJ?=
 =?utf-8?B?R0cwVXZSd0Z0bHN3SFRNb3JhWTdwOVJJOXZ0eWU1RlNLUk5OeFpZcWhLZ0NB?=
 =?utf-8?B?bEw3UDNGS1JlMzJLdzhIeE9yRUxxMjhSbWFIQUUrdUY2ZTRnVk5vcEVYbGNq?=
 =?utf-8?B?bTk0SC9nYW9DQmZERHVQUkxEbFFjbkRZc0pTeStrY1VFNkRXZFFpd2daOVQ3?=
 =?utf-8?B?OERsdXVyNUZxZHB5K0liTUFzQjhoZWlqb0VVRSswcWdHTHM0VXJ3RlBYT2R0?=
 =?utf-8?B?aTkxTVpMTWRnbThMZ0Nta09PeEhpYkNzcmdMMmJqWHFHcjI1dGZjUkJaeVhz?=
 =?utf-8?B?ZkUrUjZBa1BYcjZhbWY1Tkg4a3BtZk9lTjlGNTdVb0s3SnZ5M3pPMDJPUVds?=
 =?utf-8?B?NS9wdXdKc3ZvaTQ4Und1TkVZZktLMC8rNDhjbkQwZy8rei9uSmxoNyszcU1R?=
 =?utf-8?B?c3dlcTlKaVNOaVpXNWVDalUydThUU1gvZS9QS25UYmEvMVZIeitDMzdJK2tF?=
 =?utf-8?B?L3FwWEMwZEhTTEY4eWpFQThhSTRIL3RuVHhxVk01NTZ0azRtdEhEdXUyZ2Fa?=
 =?utf-8?B?Tlc5L1k5VDJZNXRsV25kWmllUkk4MmMxNCtXcjl3aS9CL2xUM3daUloyb1Ur?=
 =?utf-8?B?bStiM2xXbXU0N0hBZ0xvRHpRb3l4NnlTVzZZcmgwSE44MEY2dWNyTzU2MGk3?=
 =?utf-8?Q?QEKC4n9yJNOIcaDRBAGl3liBG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BDD26BC692E4F47A871CB8051D3D28E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f4e178-a99e-4ca5-50f5-08dcded2ed4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 09:01:08.5260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOZOHwx0v7Z6ZHctGxTuAfEezhSt81XwzwJzyLrviTEHtg4Z1xkzgyFPRPfLq0vtCJCYoE7d4Kp/2/LkqLmJ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_020120_204209_3B9F9153 
X-CRM114-Status: GOOD (  19.66  )
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

SGksIE1vdWR5Og0KDQpPbiBGcmksIDIwMjQtMDktMjcgYXQgMTM6NTEgKzA4MDAsIE1vdWR5IEhv
IHdyb3RlOg0KPiBGcm9tOiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29ycC1wYXJ0bmVy
Lmdvb2dsZS5jb20+DQo+IA0KPiBUaGUgZGlzcGxheSBub2RlIGluIG10ODE5NS5kdHNpIHdhcyB0
cmlnZ2VyaW5nIGEgQ0hFQ0tfRFRCUyBlcnJvciBkdWUNCj4gdG8gYW4gZXhjZXNzaXZlbHkgbG9u
ZyAnY2xvY2tzJyBwcm9wZXJ0eToNCj4gICBkaXNwbGF5QDE0ZjA2MDAwOiBjbG9ja3M6IFtbMzEs
IDE0XSwgWzMxLCA0M10sIFszMSwgNDRdXSBpcyB0b28gbG9uZw0KPiANCj4gVG8gcmVzb2x2ZSB0
aGlzIGlzc3VlLCBhcHBseSB0aGUgbGltaXQgYnkgc2V0dGluZyAnbWF4SXRlbXM6IDMnIGluIE1U
ODE5NQ0KPiBhZGRpdGlvbmFsIGNvbmRpdGlvbi4NCg0KSSB0aGluayB0aGUgbWFpbiBwdXJwb3Nl
IG9mIHRoaXMgcGF0Y2ggaXMgbm90IHRvIGFkZCBsaW1pdGF0aW9uLg0KVGhlIG1haW4gcHVycG9z
ZSBpcyB0aGF0IHlvdSBhZGQgSERNSSBSWCBDbG9jayBhbmQgSERNSSBNZXRhZGF0YSBDbG9jay4N
CkNvdWxkIHlvdSBkZXNjcmliZSBtb3JlIGFib3V0IHRoZXNlIHR3byBjbG9jaz8NCm10ODE3My1k
aXNwLXNwbGl0IGNvdWxkIHdvcmsgd2l0aG91dCB0aGVzZSB0d28gY2xvY2tzLiBXaHkgbXQ4MTk1
LW1kcDMtc3BsaXQgbmVlZCB0aGVzZSB0d28gY2xvY2tzPw0KDQo+IA0KPiBGaXhlczogNGVkNTQ1
ZTdkMTAwICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkaXNwOiBzcGxpdCBlYWNo
IGJsb2NrIHRvIGluZGl2aWR1YWwgeWFtbCIpDQoNClRoZSBmaXhlcyBwYXRjaCBzaG91bGQgYmUg
NzM5MDU4YTljNWMzICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBzcGxpdDogYWRk
IGNvbXBhdGlibGUgZm9yIE1UODE5NSIpDQoNClJlZ2FyZHMsDQpDSw0KDQo+IFNpZ25lZC1vZmYt
Ynk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+IC0tDQo+IFRoZSBwdXJwb3Nl
IG9mIHRoaXMgcGF0Y2ggaXMgdG8gc2VwYXJhdGUgdGhlIGNvcnJlY3Rpb25zIGZvcg0KPiBNZWRp
YVRlayBTUExJVCBDSEVDS19EVEJTIGVycm9yIGZyb20gdGhlIG9yaWdpbmFsIG1haWxpbmcgbGlz
dA0KPiBtZW50aW9uZWQgYmVsb3c6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDkyNDEwMzE1Ni4xMzExOS0yLW1hY3BhdWwubGluQG1lZGlhdGVrLmNvbS8NCj4gDQo+IENoYW5n
ZXMgc2luY2UgdjE6DQo+ICAgLSBBZGRpbmcgZnVuY3Rpb25hbCBkZXNjcmlwdGlvbnMgYW5kIHF1
YW50aXR5IHJlc3RyaWN0aW9ucy4NCj4gLS0tDQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxzcGxpdC55YW1sICAgICAgICAgICB8IDYgKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3BsaXQueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLHNwbGl0LnlhbWwNCj4gaW5kZXggZTRhZmZjODU0ZjNkLi5iY2UxYjhiODY2Y2UgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLHNwbGl0LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3BsaXQueWFtbA0KPiBAQCAt
NTcsNiArNTcsOSBAQCBwcm9wZXJ0aWVzOg0KPiAgICBjbG9ja3M6DQo+ICAgICAgaXRlbXM6DQo+
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBTUExJVCBDbG9jaw0KPiArICAgICAgLSBkZXNjcmlwdGlv
bjogSERNSSBSWCBDbG9jaw0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogSERNSSBNZXRhZGF0YSBD
bG9jaw0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICANCj4gIHJlcXVpcmVkOg0KPiAgICAtIGNvbXBh
dGlibGUNCj4gQEAgLTcyLDYgKzc1LDkgQEAgYWxsT2Y6DQo+ICAgICAgICAgICAgICBjb25zdDog
bWVkaWF0ZWssbXQ4MTk1LW1kcDMtc3BsaXQNCj4gIA0KPiAgICAgIHRoZW46DQo+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiArICAgICAgICBjbG9ja3M6DQo+ICsgICAgICAgICAgbWF4SXRlbXM6IDMN
Cj4gICAgICAgIHJlcXVpcmVkOg0KPiAgICAgICAgICAtIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVn
DQo+ICANCg==

