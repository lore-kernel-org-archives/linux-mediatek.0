Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DEFC3064D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 03:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=; b=JBMYDNsGfWzNJkZ32Cjn4NBs9m
	CommCk7xpofHaFWpKj6NK0UJsHEwFLVdC3Eia25Rsd8vOtAPGufkN1VhPgis6elLISn2FLHbA9SMi
	X7P6FqMsapWAV4LsQt1jproUjmxOUrckXMufWQmNDjJDBPdx1+x0MrJi44qoASS49pU98Pvqf+UIH
	diw6A6mql/MaG0XHNzzYChz3ggHPgbGq9TJNUeqfN+9pEHU0JfLbhlWBS6GL4sop0MwEd4ox9i/2u
	EasvVgCABrbjuSxmRdKWH7ujeN+RVcpgTxW8NAssq4d9UwfCWwZ+4ht6dKXbeKwr7K0mNGt4CW7XO
	JLgTIt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO7R2-00000001Y4K-0s3L;
	Mon, 01 Jul 2024 03:10:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO7Qq-00000001Y1u-3aNA;
	Mon, 01 Jul 2024 03:10:22 +0000
X-UUID: 70c0b972375711ef9daba96ee3f3cc8c-20240630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=;
	b=E7r0+06iSR/dpT+sJtQ2YWyS68S8TMNK4BiTBKy7wE4D++8w+6MkgLyYZLIohVjypYPah0PBfYQXNE7FGGHO4TEyjKwgNyI7dqLG/y4NVMSFURnbiMl2WpjtIBwLFcWo+SqqjvRyvLVUo8IRWB6g/Dv5zjVQGUJ8VOMhytFONz4=;
X-CID-CACHE: Type:Local,Time:202406301922-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:fd99f3fa-039f-4b38-a7fe-5b0f78a4a3fa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c37fcad4-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70c0b972375711ef9daba96ee3f3cc8c-20240630
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 613788397; Sun, 30 Jun 2024 20:10:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 1 Jul 2024 11:10:14 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 1 Jul 2024 11:10:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvLzDQT1Looh4zmz1xkYYT2EUdgBxmbt7X6BkF2d7+WxkBUuWUtflur2hbLQB9Zse1ACoh9l1anbuzBR6CqL2wu5eqe0y1JgLegJujdzt/RD4bS7IJ4nFvyD7+6IKxYPUPFeFhz9ajTYJY6Ge3jOSyT3fA3ocPDwhppCbx6qT95xr/DB0IiYRWcAapyHcuNTJ3pcU0J+ObJJtT2rhACBfLl6d1wOf6H4VLYALnmzqmEPyye7v3B4VJCQzA0iEFJuyoLq2jEME5py84WdE0/EdrX58IA3z8mBbqX82NxxOoVpie2EGBwrTliYO5TrSHMiSwLh9p90fnL3WH28LvQldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=;
 b=nAzgNCNhpLkntX86kqrN8VkteqWjzXstbHFXIMvQac4FJYDiD91ejIJddWcYiGifGqQU4xMVIfH7tecOjhnd91tyiKbjFBc1KeJYgdRCKQoftTckA8EH8un6tOwWZwOqQzH+62WablumkhytpFe8myhwKNIn+QwSVDhOkM3z1byioL1wPFehgULNibXeyK5cZvMJqENq+UG4jmn2qKFchSSpoBEy6U11w3D6UZkSgRT8s/JAEw7K9tmQPoZqCfk25XLc8UrIQsLAt8JcAWZ5Wcryv7+oXd+HYxZhvPCsMu/llY8MkV94htlkkGA7Eia0fFvO+bxijAKCIJcCBCrRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=;
 b=I9HSTf88vby7pd8f3qvfog37AAsyynxdoalF9AU1RWVKVga+ewZuASzbBlZSCRpDzOe95F3QijrvCDKJ5rUNo5Ux0rHEnkGrOOcsDeOuJgLa11ObywiplqfIdGkO4GASN/WCjYi+76mh9ygcFo7LYB0yobQ7plgB+Fz/dOEkDUw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7395.apcprd03.prod.outlook.com (2603:1096:400:420::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 03:10:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 03:10:11 +0000
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHawm4CehGZ7j4H80uVSodFizERF7HhQ4EA
Date: Mon, 1 Jul 2024 03:10:11 +0000
Message-ID: <2bcb715c19c8445746a00bcd4b633ceb42c286a1.camel@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
	 <20240620-blend-v1-2-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-2-72670072ca20@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7395:EE_
x-ms-office365-filtering-correlation-id: 4b5d06c0-55e6-4e94-ba18-08dc997b51ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OW40OTlIeFFvMS9pcjZXU1YvRjhWdjVnTWhUd0ZnSUZnZGZ3ZklvbFVtV24v?=
 =?utf-8?B?UmcrcWRXNG5oQ25xcnh0UUVESzZDYTVBYWdObXdOd1M3Wk9Xem55bXVVNHNa?=
 =?utf-8?B?RnVFNWE2d2N1KzBtMWdYMllrVnpMNE1GM1A5K1VBd2I2bngwa1I0Y1NQRFVm?=
 =?utf-8?B?WHF6eFBpVGIwY2NPTFI2Y1Fma0s2VUNDZ2l4VWpPdUFYOTMxNGloc2tIaEkx?=
 =?utf-8?B?enVzNEFmczFKZlBXT2ZBQjZzQUpZTm91V3VJK3prN29ZbU1uTUtidkl1K1g2?=
 =?utf-8?B?NllLR3hFeEtsL0RkVE14NUIzQUdUcFJLcG1aWnVTT3d6Um42N3hCQ3BqdVNP?=
 =?utf-8?B?YVNabkR4L2RqVGt1YVoyNEl1N1Vack9PZ0JMSVpSLzBOZ0pRaU5PZXFyaDlE?=
 =?utf-8?B?bW5EYWhCOXVBTWhpM1U3UHpRSlBadll5U2ZYalpBZllUV0l6N3VId0trS2d4?=
 =?utf-8?B?dlBkMzVERm1wQUFRWDhHRlFJcU9nNGRuc01qb0dUbmxHUGV2SFRxd0lyODVy?=
 =?utf-8?B?VWk4ODFkeWhHTGFtWWhaV0U0c3QzbjhoL1JEalZUQ25uOUF6VVBwUllDaExo?=
 =?utf-8?B?MnV4cEhxRXFHYmR1bnZpQnVyenBXeEJaMXhTMjhHWkU3b1JGTk5GYWdkRXNN?=
 =?utf-8?B?OTBwSUtWd0FLVFUvUXVadGhUNk02Ui82QU1yVzRPUnBCN3prRkd0U2ZaUS9I?=
 =?utf-8?B?bEVVSzNSODhXWmVHNEQrZWxtbnRoeHRZT1c2WGtLK1lJZ20xbXNYMWpSOFli?=
 =?utf-8?B?WW9PbTJaUVJVZzgxSVlFRlV0aEFJemNQc3MzUEhDc0tiRVNvbEZjelF5dmdV?=
 =?utf-8?B?SHRLano0YzYrOEpPU1lNc0ZrZTZySUVhdE5UUUVEMjBPWmwrZVRNY29pV3JS?=
 =?utf-8?B?b2FmbUFxQkR5OGNFNjFTZWI4QzBMUkdPVG5zd1RxanlLYSs3WWt5QkJkYTZW?=
 =?utf-8?B?am5HU1M1ejc5RnRLK1c2UkllS28zYkpMNE96eDdMK3oySi9iZkV2V081dnBs?=
 =?utf-8?B?T0VSaGtoZUloZ1JSVTgvZHQ2Z2tCV2UweGk1NzRabWk0SG5SV2J5ekllV1lU?=
 =?utf-8?B?NXJCMWwydk5QZWhxcWRmS0YxdGltVDVDSVo0VWxZMXhyVUkvbEtNdFpSM2Rz?=
 =?utf-8?B?ZHFwa1h6eUU0Y2d2eDJua1E4WThPVWFsQnZJMm1WWXdNbEI3WGlzVUxYVEs4?=
 =?utf-8?B?aHRuQVhuQi9WRTJza3JyUUc3b1FlSjd4Rzg3UjNnWmY1K2xEcllIMFdEeW1q?=
 =?utf-8?B?Ky9KL0hYaVZ3L0VXc2FSSmlUR0Zxd3NTKzRRTFJNeWJZaS83ZW0yT0FoMXg1?=
 =?utf-8?B?amd2NVpnTmxBL3lKMTNDdmRjYnIrNGhsM0NLUFk0YmtTZlRDNkNPVVRvaG4v?=
 =?utf-8?B?ZUcwT2ZyTUFNeGY1UFc2SkY2aXdmbURIS0pQd3dudjFRZW5hVVE1czF4aCtr?=
 =?utf-8?B?TjZQOWNvYkU1UnVlUkhuaTJkeFprMnFVTFdmd3YzSkI0RkQrWDh3aFBQZmRT?=
 =?utf-8?B?YXh2cmRtU3J6VWFIZnhrNUtOZWNoSDVpSVJyQjNZRTFYWFI3T1gwWTV3OEdT?=
 =?utf-8?B?V2Qxdy9UR0R0RkliMU9rb3hmQ0VLdTJtUTk3M0x3cjZIMW5vckRYeU9FR1h0?=
 =?utf-8?B?eVppdVJFODk3L05YZEgxVmxaMG5GaTlqY2dtWlR1Z0RPeFNmeWNsUkpFR2xU?=
 =?utf-8?B?c0k2Y2xISmhXUS9SZFpIWU1jcHBSRG8wK1VxT0hNZEtDL2VKYXRhVitBMmg4?=
 =?utf-8?B?cnpkSGw5NW1QWG5OMVJQTEM3RE5pRkxnODRSbFZDTlJwRkFzTDNoYlo0Ulp1?=
 =?utf-8?B?UHZVdE1Pek5sU2xDWjJTYnpNZXcvUTR3YVFvZzVJNDVkckNIcmEyS290L0Rx?=
 =?utf-8?B?U1RlYmNWMERHdUxVdkl4ZGJBUnFpcGlLd1ZWb2hLNXgvUVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm5lNURhS3JITEdFSk1UdGZVOTlmdUF0RjNSajZLZW0wQjZSQVliTVgwd1VI?=
 =?utf-8?B?Ni9NbkwvMDJPaTAvdkdGVG5icVVOWU5pemhXbWlUdU5QcUtGZS9CRGpGVUxV?=
 =?utf-8?B?N2xTamJLN1VxazdSSlZwTmZheGhiRUd1NzhHdTMxUVpRVzFpdnVyNmFUTHo2?=
 =?utf-8?B?V0Z5VXQvRjZZSTdEM1JtL29OYTF6R2l5c3NkTk5VcGJ5UE1JSHA1QzNkalY2?=
 =?utf-8?B?eHA1a0ZyMHFwd2RNQ2kxQjlBV2lqc1lteXUwaDJiNXVocVZJSlRMOVJXWDls?=
 =?utf-8?B?SnkwWFlrQTJZbTVmUWo5UG5mZW9SVGRBek9Ub3hvOTloUzlQaW5DVkhRMkZj?=
 =?utf-8?B?MG9xa3dmWFM3ZFB2dkJrYXU5NXNjM1NIOFo0ekgyVjJxOWcxeHFnaUg4WWkz?=
 =?utf-8?B?QkdRMmd3SXdHeno3MHpvSURzVUVWZWpwOEJOQ2FqKzZsb2lTbWRYTGcrS3Nm?=
 =?utf-8?B?UDlMRm5Gc3c0dXd6Q0FlemZ4OFR0S0JEcTdXMytRbVlybDJQNVVPODNCVy9U?=
 =?utf-8?B?cWV6bnF2TVI3bXJDUWpvMHhnYVA4aEdYNTIxRzl3bTNXdTUwN1N6aVAvRW9w?=
 =?utf-8?B?Wkxoc3pvcElIb3A4QmZHYzlwY0ZXQmVxYUtraUxGS082RWhSVmdUTEFGQVRU?=
 =?utf-8?B?d0pXR0JVcFp3NkJndExCQk1LSTIweS9wNzNQcHBaUTl0Yno1VVJWUzVLWEZV?=
 =?utf-8?B?VmxvV1FxaUkraEd0RjJ0LzJKU0lSUnlSeGhGQkx4dUFiOWpzcGRkelVOSmN4?=
 =?utf-8?B?dmVneUxKRmE0TGYzWTU2NExYTDJtL3pMUHJscnNjc0hrOHhUSlcwTVZxNzRT?=
 =?utf-8?B?UlB3cyswMFdFcHd4VmZia3pXQUNtMmI3c0dtRU5lTXEraDdYbTdrbWJBTXZw?=
 =?utf-8?B?WVY3cW55QldqTDFrOEw5aldnclpNbnVId3V5VjhYeXMyd2dsamV2MzZEUHI2?=
 =?utf-8?B?bERlclE3VXo1Wmc0R3BWU1JOTzNpak1sL25CNjJmbklIanE3ai80SEZ6WnJL?=
 =?utf-8?B?Qzd4QmZucXB3R3R4eVZ3UzM3NHJNVTVrbEpsZzhOYXdvNjcwaEV2Tmx2YWsz?=
 =?utf-8?B?T2ZVQ0EwRmZaL0pEMTYrbEgvZ2JkRk9zWllCNjhxRXMyeUVTbVMwdDVoTGZp?=
 =?utf-8?B?d2N6c09UQUlkellCZXUveVpJNzZUWEF3UTB4R1JJbzFYSDFFSkppM3BUeTcr?=
 =?utf-8?B?V2JudXJtZ1d4WTJuN3UyWjNRZVViYW5yQ3p6dVREOE5CbFNPTWVoanB6Z3ZP?=
 =?utf-8?B?ZlN5THp5clhLWUhoOFBiZGQyVm51a1kwNHVkbmZGRVBvVVI4RkF5WGdUdHZ3?=
 =?utf-8?B?ZGJ3RFpnMENiTDU0dkZiWGlDQmRGUW5Td05wUmRRclUvN01LQ2YxRjdpbW95?=
 =?utf-8?B?bVZzOWVhaFk4U01DRmhHeTlpVGhyVDlHSS85VXdCdWljVnZ0c29kMjAwTHUx?=
 =?utf-8?B?UE41ekwweE1pdlVYRnRxRnI1eW1teVhaWC9GbUlDaHVMN0t4aEMvZmkvakFU?=
 =?utf-8?B?empOWFZQcEZYZmFsb1Y5RitrWHJpRXpkSzMwWCt4bDM3RG40dmZncHlrVFR4?=
 =?utf-8?B?ci80MWJqM1Q5a2c0eEE2dnNRTXI4K1RRWUl6K2hHdzJBL2hvaFdvVnFQVCtk?=
 =?utf-8?B?TTcrOUZUVUtQNTd6Z1pXZllSb2h3MWdSc0xFUmFzTUNYN05jdWxCWExGd3BS?=
 =?utf-8?B?dXExMHpSd01WQnUxVXpiMm9tODBvWmdtRGhsMW1OZVlCRjBiSmRKeGY3ZUR2?=
 =?utf-8?B?RFdkckNPNncyVXNQSkRwRURaSWNiOGllUEtiK0NBcTdreG1wYmZ5WGt4NGdn?=
 =?utf-8?B?TWF1Y0M3c2o1d2VBUE5yT2RVeHNNMGZPUUFlUGlnVGl2NU52U2RkcXd3V3Ba?=
 =?utf-8?B?S3lYN1Z5eG54Q3VMWkdraEV3QWlpYkJSVjlkL3JtVTNXakloSURpR3NxSWZy?=
 =?utf-8?B?U3NMK1ZhVXFad1VreGdBb0RMcXRES2VjTkxWQzhWbnhzbVMxQVZzSWxXODRy?=
 =?utf-8?B?b09qYy9QTzdhYXNnaWwzZUZCcFpWV3FWcGFzb0tVSW9GMDBIaXRXRmNBdERF?=
 =?utf-8?B?NmkzczQrZFNtOVZXYlRLTHFYMnM1QVZvcFJKMjJVZTlXcE1FajU4djdIZnlI?=
 =?utf-8?Q?oyNPj6/22tooqqayyZmaaIB++?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82BF1118F87F1745AB626D847DD30E9F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d06c0-55e6-4e94-ba18-08dc997b51ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 03:10:11.5129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16SexT6ms0e/C2wAKoHeGFOD2caHAmYogbKKsL+YJY+rgsZNY9SjB6ZVi3scKtsWyFM9McOIsGUESGqcAbu3lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_201020_932820_61458E8F 
X-CRM114-Status: GOOD (  16.43  )
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

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMjAgYXQgMDE6MjcgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIg
YWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwgMTMgKysrKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDM2MDIxY2I4ZGY2
Mi4uNDhiNzE0OTk0NDkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
DQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAyMDIxIE1lZGlhVGVrIElu
Yy4NCj4gICAqLw0KPiAgDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2luY2x1
ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Pg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiBAQCAtMzUsNiArMzYsNyBAQA0KPiAgI2Rl
ZmluZSBNSVhfU1JDX0wwX0VOQklUKDApDQo+ICAjZGVmaW5lIE1JWF9MX1NSQ19DT04obikoMHgy
OCArIDB4MTggKiAobikpDQo+ICAjZGVmaW5lIE5PTl9QUkVNVUxUSV9TT1VSQ0UoMiA8PCAxMikN
Cj4gKyNkZWZpbmUgUFJFTVVMVElfU09VUkNFKDMgPDwgMTIpDQo+ICAjZGVmaW5lIE1JWF9MX1NS
Q19TSVpFKG4pKDB4MzAgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfTF9TUkNfT0ZGU0VU
KG4pKDB4MzQgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfRlVOQ19EQ00wMHgxMjANCj4g
QEAgLTE3NSw3ICsxNzcsMTMgQEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlkeCwNCj4gIGFscGhhX2NvbiB8PSBzdGF0ZS0+YmFz
ZS5hbHBoYSAmIE1JWEVSX0FMUEhBOw0KPiAgfQ0KPiAgDQo+IC1pZiAoc3RhdGUtPmJhc2UuZmIg
JiYgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkgew0KPiAraWYgKHN0YXRlLT5i
YXNlLnBpeGVsX2JsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkNCj4gK2Fs
cGhhX2NvbiB8PSBQUkVNVUxUSV9TT1VSQ0U7DQoNClRvIHN1cHBvcnQgRFJNX01PREVfQkxFTkRf
UElYRUxfTk9ORSwgSSB0aGluayBpZ25vcmUgcGl4ZWwgYWxwaGEgaXMgZW5vdWdoLiBXaHkgbmVl
ZCB0aGlzIHNldHRpbmc/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICtlbHNlDQo+ICthbHBoYV9jb24g
fD0gTk9OX1BSRU1VTFRJX1NPVVJDRTsNCj4gKw0KPiAraWYgKChzdGF0ZS0+YmFzZS5mYiAmJiAh
c3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB8fA0KPiArICAgIHN0YXRlLT5iYXNl
LnBpeGVsX2JsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkgew0KPiAgLyoN
Cj4gICAqIE1peGVyIGRvZXNuJ3Qgc3VwcG9ydCBDT05TVF9CTEQgbW9kZSwNCj4gICAqIHVzZSBh
IHRyaWNrIHRvIG1ha2UgdGhlIG91dHB1dCBlcXVpdmFsZW50DQo+IEBAIC0xOTEsOCArMTk5LDcg
QEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IGlkeCwNCj4gIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHBlbmRpbmctPmhlaWdodCA8
PCAxNiB8IGFsaWduX3dpZHRoLCAmbWl4ZXItPmNtZHFfYmFzZSwNCj4gICAgICAgIG1peGVyLT5y
ZWdzLCBNSVhfTF9TUkNfU0laRShpZHgpKTsNCj4gIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIG9m
ZnNldCwgJm1peGVyLT5jbWRxX2Jhc2UsIG1peGVyLT5yZWdzLCBNSVhfTF9TUkNfT0ZGU0VUKGlk
eCkpOw0KPiAtbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBhbHBoYV9jb24sICZtaXhlci0+
Y21kcV9iYXNlLCBtaXhlci0+cmVncywgTUlYX0xfU1JDX0NPTihpZHgpLA0KPiAtICAgMHgxZmYp
Ow0KPiArbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgYWxwaGFfY29uLCAmbWl4ZXItPmNtZHFfYmFz
ZSwgbWl4ZXItPnJlZ3MsIE1JWF9MX1NSQ19DT04oaWR4KSk7DQo+ICBtdGtfZGRwX3dyaXRlX21h
c2soY21kcV9wa3QsIEJJVChpZHgpLCAmbWl4ZXItPmNtZHFfYmFzZSwgbWl4ZXItPnJlZ3MsIE1J
WF9TUkNfQ09OLA0KPiAgICAgQklUKGlkeCkpOw0KPiAgfQ0KPiANCj4gLS0gDQo+IEdpdC0xNDYp
DQo+IA0KPiANCj4gDQo=

