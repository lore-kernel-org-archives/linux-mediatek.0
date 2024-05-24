Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38614C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7JZlptwLNi+y1FmyDm0hFj/tIsCO1ShdjHMY9kFjcw=; b=KRMMI44dCaH+hvl0SwspDy6x5j
	DkbQZ+dW1nFuoMKLTs7vYYCLLsoRh22Nwuk7tTiiN8xBC//lvOU6/gOOr+cRSFySbU5aenrz4S0Jm
	GlcekNtqD5cH698spLj5d8yGWHU2JZdDrykOLKxsv09WCauHdYarD+Xx66mPxRKDAdCnW1J4UbVPh
	BZ/45T5i90QPiAn7Zw4bNiSYQ1+qQRfWAxOi6ayrW0DKSupP83BeeVjvH6iOE4/ai4AmGiO9yyDIM
	AcX4V/McK5YdbNWMsilZDCRdBIGl5JWDjHp/4tMvdUxg6e8Uj6nkwhmV8P8mBTXuebR3e7KO/hng2
	z/mwVq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQoE-00000008SKk-3MFa;
	Fri, 24 May 2024 09:01:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPnK-00000008KMi-0Dlm;
	Fri, 24 May 2024 07:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
	From:Sender:Reply-To:Content-Description;
	bh=s7JZlptwLNi+y1FmyDm0hFj/tIsCO1ShdjHMY9kFjcw=; b=Q9X8qh7TgFUh+Qf92xm9UpEXtH
	ZAYwI5bo7rofeC16z/zAe2z9rCVX4jsUfG+YX7KwP+L2Iz4KIdqJ+scrk3uudSiIMmcb3lZDhjIv4
	YBKqeOcnQdMoD38c/vMh3L7AxL05NbGabcHu/61a3mhUdrX3yiOikRPBnhSQTJm1kEKgs8FbCVBFp
	wyLIDPH/j7BN+aurpJPmHIPO6IKAoSJGvNpoc0ItpkpXZiofu3r2C1EwtmCQ7TnNd7HZfd0zFfK9b
	cjHgMJikL2TP/N2RIig9+l6sV3+wYrAhDKC8jSldRdGEfQjn3Ba0YfrvXexyvnhc1Qz18mF9uokQd
	XIk95Euw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPnG-00000002UyF-1iPr;
	Fri, 24 May 2024 07:56:53 +0000
X-UUID: f74e27c219a211efbf6c7d4f5c147266-20240524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s7JZlptwLNi+y1FmyDm0hFj/tIsCO1ShdjHMY9kFjcw=;
	b=Dqu1rZekUtS5BaOPmcRQTFw55NrMNEcJINIdAyY7bVPSjXpO6+qfOKbdAzRX5MsizLi9AY1SALpnlv+fazpB0TL3ij5ozI7zqTnVhcQzvaYwuR2gaATbPG6XqaTwQbjnPBZjKBPlenE5GsVIcmzP5dieYxtZBqkPji/vqR9fbKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:d62d11c0-5563-4607-90c3-e977641e56e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:99a5c387-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f74e27c219a211efbf6c7d4f5c147266-20240524
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1460884995; Fri, 24 May 2024 00:55:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 May 2024 15:55:15 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 May 2024 15:55:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEI9QEs7vAmt+VuI3AJg7MptO1FZy0li30Oyur/miQkS0eUQyio9UB+5q5CL4pZpjJBx4Jv0ULlTsPX83RvTC6JoKJxuzVczXl+6y5AzWo9zqB1C6qj7OmegoLY1vT0UHeU8qlmL0UhavbRr1XhUTGaRj/JP6o+9qOAdVGmU3GfQeXW9aedv99cMtIMfdCpWFV4qK7DFn+dW/PsRY2eN5/cmv9zruhXhgBO1E4q9d9fq5BrfjCRsfGBZPWOqq1aPjs+OZsXHfq8Na7jLV6iBIctQ0S9H1a7U6EVi9UBYpvN/WvS9Lgbx0JeL2waQOD+0LhJX4U55LhSriiVTwDz1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7JZlptwLNi+y1FmyDm0hFj/tIsCO1ShdjHMY9kFjcw=;
 b=TYlkdnrqhnc8AUjlN8ZHVs9EvuhM4A/8YBl74FBNv39RbpoTL26VZsMVJ0LPRc71ba27HeqI9yScK0FqD/NNgtwyCDBSnew3ayH1Grni8d6t3NxDx9oFihADbETox6TPac8dN6H0mtHPiAE1Bk6LX3rN0TLAL0SlrOoumMeg1itL/AHtloqU/kvk9cj3jt1VB9K/AKau96Oj83cvygNYtuLPjs4qYsPe89PKOdoRB8j56ijgGzk4/m+G0+SexEGnVA+mWkmOlbdRMKIynCzxrVtH9yB4tEetOvv4cdvuxpdFA7zs9qRkRuQXn1UTuzzO26Iq77j1Poi6nz79jHhodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7JZlptwLNi+y1FmyDm0hFj/tIsCO1ShdjHMY9kFjcw=;
 b=jb3dNfmYzxuEVAhO4ZNR9wGz1fzOzsgPF9qQWWg3aC3TtE9g73POT+ZhVlZnEfr6Cam00f7zxljGKDKIHmBgdZwnns8ekoc+ig3LB1b4eEEdDVGxsc/pATnXYchOVW0cmk9JcslY6tW9MSpb4SEao9VAsJYvLYfDUFsNQasNmGg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Fri, 24 May
 2024 07:55:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 07:55:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
	"robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "will@kernel.org"
	<will@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 05/15] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
Thread-Topic: [PATCH v4 05/15] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
Thread-Index: AQHarQ/Hmo75p+qQMEWQzOVZmfq8zLGmBUqA
Date: Fri, 24 May 2024 07:55:13 +0000
Message-ID: <dd46c3e486b68d34a3fa8c7b42273523017f8bba.camel@mediatek.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
	 <20231023-display-support-v4-5-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-5-ed82eb168fb1@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6732:EE_
x-ms-office365-filtering-correlation-id: 633fa4aa-7f7d-41c7-239b-08dc7bc6d7e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|7416005|376005|366007|1800799015|38070700009|921011;
x-microsoft-antispam-message-info: =?utf-8?B?aDJQWW16Y1I1Mm5vMkRnbi9PZDBVaFEyNU1MQnZodnREUXo0c3hzZmxWQ0xj?=
 =?utf-8?B?WHpTYVNoQ2dET1gzYlVFamlncWUwUVQwWXlPZVRXQ215UWZ3MXdJeVA2bmxY?=
 =?utf-8?B?Q1ErbFhLY216eWI2eWkxMHVNUVJSZWJjc1NGcmZkNC9IR1pxbGt6VzVscGU1?=
 =?utf-8?B?UHh1VU5HYjhZYUdSNCtnaExzWXR3cC8zWmZ4OXBISm5IeCsrTVBGSnQvYUUw?=
 =?utf-8?B?VlZDRytQWGE5WjFjTFNDc2wyTDhkdjRDWXo0V2hTT0I0YkQ4NFE4eExoWEdD?=
 =?utf-8?B?UWNwRGtDVW5vSGJ0VmRVbC90TmFydUdJR2FIeFZHOUd3amhBZk45NFBXcURE?=
 =?utf-8?B?bXd6WjRCR2xLNVo0d1N0djdhWFpySVprOHNzbURtY2NiK2VJeUUzOWdVNWNU?=
 =?utf-8?B?eDR4Q0szeDQyNmxGc1RmVXBnOXFtQjEzQkhnQzhoMC83NzRGNlBzb09nOG42?=
 =?utf-8?B?dUZZOGxhckFNekNzSHkrcm1XeGk3WVBNaVU5NVNrZDBHVTdwMEFIVlF3Zkh1?=
 =?utf-8?B?WGVONko3SUYzNjU3eW00dFNaazVCYUR2emxwNTFvSEFtalJRSytjMGtMQ1NG?=
 =?utf-8?B?ckl3N3YyWVZIWGFkS0ZKUzFqQnJJb0ZCSmtZT0pPcTY3bHQ4WFZ1UHR5ZTYy?=
 =?utf-8?B?WW1FVXIwd0xETGNKTnFCY2hPOWthVTFOYmpDY0dnS215WU4rQXlRKzd2ZE5I?=
 =?utf-8?B?K05BZDRRaEVmUXg2Sm8rL1R4N0Q4RHZ3S3hYclFoTHovQUkrZzRRcjR5NWtE?=
 =?utf-8?B?L2VuNDFRaVMzWWxjck1EQ1ZmRndOWkRlM0VzN3FUMC9QOVNWRE4zK0VGR3c2?=
 =?utf-8?B?cnp3WmNzMEk3ZEVBc3A2NkZreE8vUjVCNEJqd0FqbFN4RW5USllDV3o4NUJZ?=
 =?utf-8?B?eFEyTm9jbU1RRjdIVUNBTXF4L3NSb0ZROE5VNlB5Z0c3ZCt1NDErS0Q2aW5V?=
 =?utf-8?B?Qzd2Wmg1ZUZUaGMvZEFYdHVQc01SclpZVUlvWFZHUkhSRWVMWEFRUWt2TEZp?=
 =?utf-8?B?WUxUSzJhVnU0b3FVR05nY0huUzFwaUtGOUdjVStQRzRYWmNPNnpSdkhBdTEz?=
 =?utf-8?B?OE5hQkRQTndlWTZpL3B2SmRFODg5SG9oelJzTThaL2VaNTRKTUR6MUdEY21x?=
 =?utf-8?B?S1p1bkxBcDliMm8rdDA3OG1hNU4vWmtnai9ha2FuWTNvNzB2TDI0QVdFZ3hm?=
 =?utf-8?B?RnVyQnorR09WcTU3cnlQc3J2ZnlrenBROVpmU2M4TDBuSDFUQmxjK2E3dndQ?=
 =?utf-8?B?R3J5OU1laHpydUtGa01DdXBIUkZiVndyTmZKQnNIL0RKeXprWnF2OURNZEls?=
 =?utf-8?B?c0JyU2pySVhSc1BFYTJ6UTZvb2lid0ZsbkIzTmxjcVVweXpJWEp1VzdHdXlM?=
 =?utf-8?B?ekpKeHZNOHJOaEc1SDNkbUNZSjZyS01TYzNZRE55dE9oc05sUXdTdHVKNUR4?=
 =?utf-8?B?b1I1R05zQlFRdHdFbnQ4dXpMMmtRdjJzTEUwV0VYUGdUc2tEa05oTGJvUjhS?=
 =?utf-8?B?SGcyc0VMQW5zY3hUQU4xRjRNallNbjlQQTJlTks4T2JvclZVSHorRHBVeSt6?=
 =?utf-8?B?Yy9pdk9FZENnUVNZZ3pNTVl5NTJ5S1R1Ni9MOXdLdDNBR0dwK0NtNnRlS1Qy?=
 =?utf-8?B?T3NBeGRkcjJBeG1pQlVEUm9UQ0RZSjFINDQ2cTJhdDlFR0lBYVZ2M29vU0Zx?=
 =?utf-8?B?aW1QQVBqaUdIS2JpWEVRSENSTDVmd3B4UndMa0JCOWhFTXo0NFNXTWVPcTlj?=
 =?utf-8?B?MXYxaDZYNmw3cnA0ODhibWRoNVEyRmxUQVVIcDZQQ0M3ZktiM2RpV0xFbkRD?=
 =?utf-8?Q?18P2LHc2BY/JqXcxstdmqN9eBOA2rMGsRlHjg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UURsZVZFOTYyOUdwYkRsMzRXZDhOY0JYVERsN3lYck1yOWpIRW53QUpsZk0y?=
 =?utf-8?B?dUljVXhNbXNDbno0NXlreTBRd2VtWnUvVDRUeTUvd1lsdU04SlpDcE0yS3Y0?=
 =?utf-8?B?UHh6eTdHRysvdUFUR1o1NUNTY09vczB0eXB3MnlBV1dDM2kvVFdPYjF4RFM3?=
 =?utf-8?B?eDVCTkM0a0JYbUZQQ083YWJxTlFvN29DT3grZGxmM3lHVUYwNEp2MG5sWW16?=
 =?utf-8?B?QUYyUkN3d3d3emlaSElDTVdrdmxtMzY4YUM4dVlSRFdXMDRramVhUWh2OFZM?=
 =?utf-8?B?SVZNa1FFbkJ0TU1wOUhEb1NPZmVBSGdkZkQ4WTIwbE9nZTlwOC9BQjdsYy9i?=
 =?utf-8?B?SnVrQk91QkpwbC82TXJtSFRKNzZjOU43NFBuMXhxZVVsQ3BpQUV5TGVRc25O?=
 =?utf-8?B?OWljZWRiL1pwdkU0RE9URUVYK1J0M1Q4eHp5c0Z6aS91OW83ZVpNYnVpTFBB?=
 =?utf-8?B?WFZhaHZyQkZIZkNOR0ZxT3VtWHYyL01YTGJLWmQ5MDRPb3IySlRHVDllZWZo?=
 =?utf-8?B?d3BxaERWcFdDRzc0c2ZiSlFFWDVRcFZQUTFoOVlwTlVNS0dhak04NS90RWlR?=
 =?utf-8?B?ZVNibzBoSFppbWVHK21zMXAyL2QzM1c0RFlyaWRDU0lRTHFqT1F4YVVJcFZ1?=
 =?utf-8?B?cnhlK2haM3NlNUNXRjhybGpYZFpadlFWdXM0dlRvc0haN01YNC9tNURmalV3?=
 =?utf-8?B?bEZYRFQzanJFdnZzYVRnNTdFdHhzbmNaWFlsanFQQ3pyZXhLNDdGLzE3bVp3?=
 =?utf-8?B?Yk9uK1RWQTZKSk1GbFdCWkoxUkd2b0ZVNUloTzhQTlZKRXZRc1h1b21KaURz?=
 =?utf-8?B?NFpYSGdLRmJuc09kRmZWV1VOSUc2d2FxQ3ZzVDJkL0tBaXZQSlZ5TEllaTBm?=
 =?utf-8?B?Qkg3WXJJbnJIZndlMlJBMXVCQTRGMTd2N09wbFNXZk9PUkhRUFQxR05LUlQw?=
 =?utf-8?B?SjJnYWJBYmlMa1h5WTFNREZOZThLWW1aNERjcUhlV3lteG10czgrQ3Q0T0VY?=
 =?utf-8?B?aUQzNkZWNkM2MTJBQ3FxNCtpZk9kYitGQ2xMcmF5anNpMzhJTm9HbzZQOTM5?=
 =?utf-8?B?V2dRWGx2ajJDeTU5aE43NzVTUTFLbHRndmExZkllM01TWUtNUjlJZkk3UGR5?=
 =?utf-8?B?WmhTenhaa0FZNldML1hQSDRWTU9EUGY0SGlwMnhHTllzV0hkNlBNUVBNOVV6?=
 =?utf-8?B?UTdOT2lKUVkwL2xBZ3d6ZjRES2h3WmJIQWdIbjlvWXQxNHBzY3Z2bW1ka3NP?=
 =?utf-8?B?cGMvQVNpSU0vS2VTR1d5YmZFWmZLUFQyL3B1enRTMzlZdjVXRy9od2xtR2ho?=
 =?utf-8?B?UCthSTF1TzNoNGxnV3QzeHhzdStZVFBVVXNxMFNYTWRGN3JFTGpIYnRUSjhT?=
 =?utf-8?B?c3pvbnhIbUhDMS94VzAvcmJrNmtUVzdBNXhVY3R5T1pudHlOK1FuWXJ2ZC9G?=
 =?utf-8?B?ZTNTYnJqYXlReFFHalNhendCTmdldys1Tm9qTHM5S25wMGZOOG1iK1JrdVRX?=
 =?utf-8?B?TXhyREhtVGNVS0RCcG0xdmRLUXA0UTllT3QyS2hKS1RSUmI0R1kxeHdMY0ZD?=
 =?utf-8?B?MmZFemtFNEJxc3gwR3RuZWg0MGxEVEJKSUVjRkZEUjJSbFFCOXpOeWtHRGtN?=
 =?utf-8?B?aU9TSWsvSjBuRjVNa2F4L0Z0N3NZUWkwdlVqcXZ6MERDWEM1UkhqL3NNcTMz?=
 =?utf-8?B?ZDgvaUVrUG1GUEZIR3FZRTdRYm1ydkd0V013R2szWHBSajVPRzg2THlKa1Zv?=
 =?utf-8?B?T2hlaW1HQXZnNjJrcGM1KzFlY20rWlJ3Z1NEZExPdTYyWlI3M2dFTWJ0MytK?=
 =?utf-8?B?RE9WTGxSQzk5NVNULytmWTNucXI3bGRRMFF6b0M1K0lQUEFBZWhKSGZ2eGNa?=
 =?utf-8?B?cXJkMkZlQlh6cndCWDl2WVFONCtmaGdjaTY4NVcxNHV5d3Q3Ynd3SE9hU1hF?=
 =?utf-8?B?TDBUcDdwL2ZibU5GYW9xeU9FUnpvNGpQN05IK284dkh6NDNaOGRLTGdmRFNM?=
 =?utf-8?B?dHhaQ24raUtpT3pLY0xaVmh6UW1nYi9lN3FPTlVCM1E1SFl3MjVVelVKQTJt?=
 =?utf-8?B?Zmh0Ni9YK2x4QjQyaURIQjFILzhzYitGM3pFQ0FtNFNCNGpYNnlLeXN5VWoy?=
 =?utf-8?Q?Tv5wU6WhqoL39sgngyNmGBUVE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A904DE5309CBB349BB575947BF681CA8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633fa4aa-7f7d-41c7-239b-08dc7bc6d7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 07:55:13.5277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k2U0WfItQ9dpqeo3xreKbydlF5ndIO21pSC3xrpusLcFDcN02qNQtHB3/FK5BvLkbC+wdW3CQq75SxzoSWUeMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6732
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.855500-8.000000
X-TMASE-MatchedRID: wQVy7q402w0OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0qAvh/bpK+BVBnY2g+sHKWUY1bQMCMvmn5h59nsX2QuC2HZ+cd7VyKXFVk
	w4X07kmjmj+ti9Uv6J5GTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIfiAqrjYtFiQGqM
	yqhuHewqhv9PPdcdR70WYJKc+25t0MsxLh8OJIDn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.855500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 97B40FA7DFA2F88A0256DC914C02946282EEABF204DA09C21388DFA87DD562D32000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_085650_775601_7F70421A 
X-CRM114-Status: GOOD (  13.70  )
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

SGksIEFsZXhhbmRyZToNCg0KT24gVGh1LCAyMDI0LTA1LTIzIGF0IDE0OjQ5ICswMjAwLCBBbGV4
YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBEb2N1bWVudCB0aGUgRGlzcGxheSBT
ZXJpYWwgSW50ZXJmYWNlIG9uIE1UODM2NSwgd2hpY2ggaXMgY29tcGF0aWJsZQ0KPiB3aXRoIHRo
YXQgb2YgdGhlIE1UODE4My4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBBY2tlZC1ieTogUm9iIEhl
cnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IE1lcmduYXQgPGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kueWFtbCB8
IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZHNpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkc2kueWFtbA0KPiBpbmRleCAyZTlkM2QyM2NiYzEuLjI3ZmZi
Y2NjMmEwOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnlhbWwN
Cj4gQEAgLTM3LDYgKzM3LDcgQEAgcHJvcGVydGllczoNCj4gICAgICAgIC0gaXRlbXM6DQo+ICAg
ICAgICAgICAgLSBlbnVtOg0KPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1kc2kN
Cj4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgzNjUtZHNpDQo+ICAgICAgICAgICAgLSBj
b25zdDogbWVkaWF0ZWssbXQ4MTgzLWRzaQ0KPiAgDQo+ICAgIHJlZzoNCj4gDQo+IC0tIA0KPiAy
LjI1LjENCj4gDQo=

