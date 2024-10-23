Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE17BD2E010
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 05:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RRioYjMN0hE8LzRqQpXXXR3XTlylwI+9dNlDwstuhE=; b=1+yrbeWHWVlczMM003rgp2fC10
	GpLwmNzxFmA5g/e9UIZgQZJawN/X56ueQVKoM6bcYuU88gXPaL0DnAMUS6rzPh6fboxTJy1JNwlK3
	jmwQ+RskmnyOQpjMyOEUfwWsgoFwt16zW2u2ZQQLiWmIp/ToC81qaB6eKxzC9Ki09wU1zFRWJi3Hm
	W2RAT78t1in3W/0kfr8fAmCal/X1hoZc3cFcb/WZ+S0OHIMw0b8+isTvxlBs2ymab7OiCLOr8UYZU
	cw6JZEDOLXaYslJbdIMiJdTOlNc8Q3DxfKFUgdC0wxx9yiO/iZhrv2DQPdgUODTZfLBywhYCRuCks
	jDuGxq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Tn2-0000000D1wb-2b1T;
	Wed, 23 Oct 2024 05:20:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Tic-0000000D16n-20uj;
	Wed, 23 Oct 2024 05:15:40 +0000
X-UUID: d40c159e90fd11ef82ff63e91e7eb18c-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3RRioYjMN0hE8LzRqQpXXXR3XTlylwI+9dNlDwstuhE=;
	b=Hk4nJjD4IVizbGe6tQ6853JqN42pKj7hJAFnAtrRkZLpxPpxij0V0/bovJjAfB4BBfWYsDaSYl28etL88mPxkVFw884B1qrtU6tCe34U8ett7QMPtpUKZDhbFq2bJi+n47L1dC6tjXLQT/romsgayWP6GURFmYspMH6SGyhw+Cg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0158da1c-8c2b-4975-a82f-d3725460ae4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9754b141-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d40c159e90fd11ef82ff63e91e7eb18c-20241022
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 752965727; Tue, 22 Oct 2024 22:15:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 13:15:28 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 13:15:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpIzJj8KUcdSGXbWOCxAG2RiDP2xkswgqWYaeGqgXhUAugRZSgtSSqgr+hz19/f73JZHp87OchzL4e34uvrRBPW5pLdKQG7MNXuRx8e4sXnp/wzF/7sQ4M7blBSPXvEQhkuK/hnqQtQgYtg7BFMQi6vtrQoAonlI7t+vuLImxj9A2dfxlKPb8P4W51ZINzDFgjAaJXcRAi6bZLe3HyXfCXAVjvQMBMTrjtSeuNpC7sjZk53GtvLGaMA8og2ThYA1GimtUb57529j0mZMkA046yxbaOltuU/eO8IOoxogw6nFOWmQrAyMrVNd/4ziCcyKkJtFdzzjyE9I6i1I6hvY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RRioYjMN0hE8LzRqQpXXXR3XTlylwI+9dNlDwstuhE=;
 b=QI4Og1IQiMsFNeryRHhvCByDhVCaHof/GFQJ7P8EsMbvUg/qW7V5JghKgzn72EPTW3Y3EdHTBTe3FzI5je4//9ZhAB8+JLVDja03Wohr1zNATR+njdbn0jjbHTYf7wGdVY9JvgG0xdnIhHaPeCwf/mVK8joGRw8YimYcdL+cfh5Ba+joK6iagNg0kWqpZuPxX5Kv7XeSGoUNZmRtkMU/MkmV0hjDJ/Urtl/gGBEN1lfj7LPV3bK4Zsn80ghesW1VA94fRiy2BXY/rLJi3aHAaT1Sz67FhyD3PXs95FgyqRPax3Xn28gLMeCN61500fJHBM3x5Nvq886Mklv2xhGaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RRioYjMN0hE8LzRqQpXXXR3XTlylwI+9dNlDwstuhE=;
 b=Lb8c0ljD0h3EIAwpeWgw78sd3x8r5zUeOmZlMFR24MDiIRBYxNlx+N2AAfYEgXSMxzJmJZYBiXx+Xea9mDEs8CUd7apgWOnqYKn8aVcL746VoaX6us7QjfZPUnpPWNzDVzcv2R4OYkUOC+B4XNbeKOdQdapnCwuSCLmCp6Fg/co=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8814.apcprd03.prod.outlook.com (2603:1096:101:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 05:15:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 05:15:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?=
	<Liankun.Yang@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "granquet@baylibre.com" <granquet@baylibre.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "msp@baylibre.com"
	<msp@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
Thread-Index: AQHbEPKmmJufNcOn1kqtGJvppfuu27KT8zeA
Date: Wed, 23 Oct 2024 05:15:22 +0000
Message-ID: <5445a85890e411c02a69a2a8608779abb84a5ce4.camel@mediatek.com>
References: <20240927153305.27642-1-liankun.yang@mediatek.com>
In-Reply-To: <20240927153305.27642-1-liankun.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8814:EE_
x-ms-office365-filtering-correlation-id: 4c3773bf-f1f8-4ef9-c826-08dcf321b1ea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?ejNlYlZCVXJqaUZZWUFuSHFiTk01V08yNmo2Mm1GbXpKdEpDdEpBVDdZcmMx?=
 =?utf-8?B?aUs3YzJCOFYvUU83bzRxSnFjVkZ2d1Jib3VwN2Y2WkYrM0xtcXBhRGY5cFNN?=
 =?utf-8?B?NlpNdzFrNndZUkJYc2FONUk1YXBIOGhrYUUrL2dETHpuVFFkeFZJWmxnRUps?=
 =?utf-8?B?RW1PTFF0d1EvVnRyby9UUlJmZFZlYXlmeHI0TXluR29SYnBkM2wyYXdMQmNM?=
 =?utf-8?B?MU1CbDFCTFZGQURzb1k0VHpMd1hvV1I5OGhaSzg4SGk1SE1EVk1aaHV6dFY5?=
 =?utf-8?B?NFc5ZEFRajVMZFVwVHdBVEpNZGd5YjJxNlJFcTJRUDF5MmJPby9oRzcyZVFn?=
 =?utf-8?B?dzM5ZHdxRVBjLzNJcVdXbU5CYU1ablBMZUhRSEdsR3RvMXdMakJaTG5TSmtO?=
 =?utf-8?B?MGRKVmpUNHVLc1VzU3dSR2dLalQ0RXFuREF5cG95Y0pkN3ZBZnZzL2o3c1ZV?=
 =?utf-8?B?MTBIUlFpVTFRTk15eTEwcG95YWt0UmE4cy9YWW51T2RPanBPSHJqZkZTM01Z?=
 =?utf-8?B?cWFNcFNsVlNQb2ZHS2dwQTVrbmx1VTBncnJ0cE5qYktRTC9aM1VKRWkyR3Nq?=
 =?utf-8?B?WU9FZFRDZWcwUjJiMldITS8zb25uNStqKzRMZWtIMmZ5MnlxRXovYmNUTnJL?=
 =?utf-8?B?aWV3U3BSSXNsYVZXN085YWw5eHVnaUxmcFA4S3ZtWUV0VEZ4MjdxNXQ0WGoz?=
 =?utf-8?B?cFBlTnRjVDh0aE1zN3NMQWs5TGRKZm9wQ1c1ejZtMitobWI2V1YvenpmOFcr?=
 =?utf-8?B?Y1ovTU14bmtFK1VXZVJGOGZvQThoZTFKcnlhOEtaTU9uMFRhclhvbkZVZU9W?=
 =?utf-8?B?UnNqZmJzUlJmSUhHZXlRWDJFUkU3TXp5THlEQ2VJT2M1VFk2bFN3eWJpeDVm?=
 =?utf-8?B?VVFjaEJiZC93aVg1WlhWa1RyWlRTcmc0VzlFaEkydWtvNi9KYjZna205Q081?=
 =?utf-8?B?R3NtdUtMVW5mT2xMZ1FPVWozWGVCM1AzcmlZTXZ1YnVjVThLenBYekNIandM?=
 =?utf-8?B?a096RDNrc1dmWUQ5NnFMZGI2dVg5RVVSajlRczUwemRIUmJmaTMraUdheUI5?=
 =?utf-8?B?WUxUSVBPZ3hQT3BuekhXZXQwa051aGk0K1hKdmZsZk9YZE5RVFpuMnNpL1o3?=
 =?utf-8?B?R2dVdnRYUFJoWloxMUpmYlBGSkhvY3VodlRaWFZZN0kzc1QwTHBqL292ZTkx?=
 =?utf-8?B?d3Vqa1FvQXYvTDVQem1PMUtNS0tlWHBCTmVhdkgrSEd5eGt2WFdNR2hOQ1NM?=
 =?utf-8?B?YldBdUFsdEdjVExVanprRWlXUzBzVHh3Z2E2RGUzVHF1NkcydVdOR0I2SFFT?=
 =?utf-8?B?YXJ5eExDd2c2ZndNb3ZERWFGbDVQbjgybUlRakZ6YkkrSCtDS1pSdWZFM1pM?=
 =?utf-8?B?MlNpdUV4Q3hLcURGNVNKVDQzNEdQSG1JczNjRGZQR3gwaVJWVm8vbSt3NEYr?=
 =?utf-8?B?Y0k2RDhFSTRXdnAwbnJGTThUd0NYOWNQTW56VEFuMFR4dStFdHNyVUxFMWlR?=
 =?utf-8?B?aTVTV1JQMHVkVVNvU1lTZ0Nia3RCRldnMi9nMHBqc3ZBSlZFbnBla0pmNWxh?=
 =?utf-8?B?VGlEbU5XdHhhNGhIOFE0QWQ5SFJWVFlsR2JMUjdKTnFXUU9BMjMzcHdkWHo4?=
 =?utf-8?B?VmRyS3RKTVB4N2lTMWs3UG9uZ0NVdmUvcGpxMEhDNVMyd3BxSlZsRWFMbVAr?=
 =?utf-8?B?cWVnV0pIem91VzFVc2lLWkJlc3ZkMWFwVXhxZUpuQ3IyVzNNaUtKcUVObk1t?=
 =?utf-8?B?SXhQenZuTDRtcHloRlZDamZmTWU3ZEx3OUtSZzZ0cC9LckFlT0s2YnhLOHlx?=
 =?utf-8?B?SXRSNnp1ZzJZd09Yd2ZtKzcxQVdPeTUveWRkSkhWUCtSaEZVdUFvcXJFc2xt?=
 =?utf-8?B?S3ZxUHVUN3d3Q3hoQkpYaHkwMDhQSUxveUE3NGxSZzlrU0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3VGNlRkWm83RTJQMjhaN3JlM21jTXZpZWxCVm92QkZCRTdZQS9YcER3Rzg2?=
 =?utf-8?B?aW5ad281eDVTU0RGbjVYaFZGRzdqYUkraDRzRUR6R1pSd2FRMlNxNnJHMENF?=
 =?utf-8?B?Nnl2WW9sM1dOLzRkcVlOMStFV0ppZEZZUHRLYWFWSmNtU243VyswWDR0VkdI?=
 =?utf-8?B?RG9HMEZqZ3dlZXpmZ2N1aFdHSXowRVJFMGtFdVBuZWJNU3F3Q04yODE1SUx6?=
 =?utf-8?B?YU1hSWxIMzJnL0YwOHJNcUNFZksrMXkzaUUvRnF4Q2YvTWtZTEIvUkV6VTRG?=
 =?utf-8?B?T0xyOGZKL3JXU3UrekFZNzB3L1ZENGQ0MUhsZFc4WlduR0c0eGg5RUJQaFRj?=
 =?utf-8?B?YTVpM05pMWk4VFVyZXRmMERSdVA0RTluVjZwdEt0VWxySDNxTjRHbzNDVVov?=
 =?utf-8?B?c3BLUCsvOUZTTW53enp6TEZaUjNQNm1NbVJEbEJtVEtHaTJ6Sm5XaWRuUCsx?=
 =?utf-8?B?M203elBzSVpyWjNWOXVLODl5NlBUbzcyNmNnYUR4OTZ1aXFaVlZua2lMYmN5?=
 =?utf-8?B?T2JlT3dmNjZOUUZJMURrTmdwckIxby9PYlhlR2QySFNrN2w0MnNwWWNCc2lW?=
 =?utf-8?B?RXhFT09RdzhOc1h1LzE5TzMycTljUi9aYjRrRDB1citCVVpYTzhHVTZUZUtD?=
 =?utf-8?B?SkZMUWRFc1BObVNhZjFFWUFZMDZ3a2Y3NmJrRW54RktGOHFaQmJBbUc5U2cr?=
 =?utf-8?B?K1pRYTVxRkplemZkUzd6aTdFYVpzVnE0Y3VoaTV4TjRWMmlaQ1pIUHU2MFFp?=
 =?utf-8?B?dVEyRzdpSVBJZWxFbitYaE1xUEQ0eEpsRUM3WHZDcjVwenhrajJTVGN4cUlm?=
 =?utf-8?B?TlRUQmtpSWdJUklWaGlCTXczOS9IQzJTT3IySk9sS05lRWJOcmhkcm9JV0cr?=
 =?utf-8?B?R1BzZ3FuTGRqZktTNVNaUEdWRThEdFVUVi80SnR1OWRma0QwM1F1T1kxWEQz?=
 =?utf-8?B?c0oxOEdYUjFXNm5oMGdUbFF0Tng2ZkNaSHNCWFVXM09yUVZBc2xyUzVSZnAx?=
 =?utf-8?B?LzhKTHRYTTJyeSs0OTZVbm1UcDlHWmNVTEQ1eFN5bitlNUVqcXU5M3lZdFJO?=
 =?utf-8?B?ZkZjOEt1SmhiZUQ2aWxBY2EvZXo1MlhtdDF4Nmtqb3pZWlNQNVVJL1hLaWty?=
 =?utf-8?B?MnpkcTRiVVJ5VkVRRjV0aU56L2lnL0tYSzhWbnJzTDF5aFNxN1ZnM0UvVU4z?=
 =?utf-8?B?THpMOEU0emdXeWdSbHV6dkg4R1F6SG1HWmZqSXpRQUp6WEdwQkQ0WkVuSXNa?=
 =?utf-8?B?cFlMK2F6N0dnbnUvTGIvS25rb0lEWGlxU2Z0cHgxSE9YNVRtZmFjM3BZVzh0?=
 =?utf-8?B?STUxSlZBQ1FXVVdlOVhmN2dXU3BlQ2w4SzVHaGtQVlRudm1KMFJabnRCSkZB?=
 =?utf-8?B?Ryt1OGFIZGpDUVNJcVgrWDgzWUZuS3JOaWs3Nm8xYUFOcTJMeHN0WWJMN3RR?=
 =?utf-8?B?alhPb0xXUVNBdEZOYmhuTStZQTBiM3dmcnQzM05EdWlOV3YvM0N4RHA1aFZF?=
 =?utf-8?B?UGc4SDM5Z3JaSkZGQ3hQTnpsVWhyazZzR0NwZ1pwSVJrdkF2MkRCTUIra2Z3?=
 =?utf-8?B?Z2Frb0hlV3pWdzNLRDVPdnVhNEtzaVRxdWI1VlBsdmVQVXovQ055N0w5em93?=
 =?utf-8?B?WlhNMlZQbnRaakxYQUorRDNONWhvVDN3VFljM0V2S2c1SVFxNWFiRG9YL3hS?=
 =?utf-8?B?T0cvQ3Rkb2NBRW5kV3BCeHpVM0t6ZzlGSUp0WmtWanhtR01zaW5FZm9GUnp6?=
 =?utf-8?B?NnhYdUVVc2hVandBa0RaRDg2ekUrUVp4djh4Mys3NmtpSmxHWnFRTU1LOCtR?=
 =?utf-8?B?RVA5c3EwdmFaRFZzNWFHOTZSaW55UzZrdFZYUjZ0dlE3Nmp3dzBicVpwMmtU?=
 =?utf-8?B?SWZzRFN0aTZJMHRBc0VUSDJidGRLczdtdGhMT2hoZ1JxZVBObkI5ZUNBTzJM?=
 =?utf-8?B?cW9jQXBUOStHSWZMZTFhTzUwL3o4MmJqYThSNFNnZGdSTnlXa0xjTmVaa25Z?=
 =?utf-8?B?dHRzbXM3VitMTTBtNlNpUGt5cVNWR1pXYmtMSzFIRExZK1V6bDI5YThmRkhM?=
 =?utf-8?B?UlFoSDZtMkVCdnNTU3hEZ1hkakREckJaYTkyWnV0K1dUanczaVNkSlhqUVo3?=
 =?utf-8?B?UlNMc2M3KzJQb0ppMzN1MU1kQjNKbytPZHFHOEM0L2lqZGJRU2tMbjJkb1lT?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15692FC359034044BD7C83ECE39FB98E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3773bf-f1f8-4ef9-c826-08dcf321b1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 05:15:22.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZ79REutGd07JHW/Ao1dO1izH3bnjFherTPE5LYDcOwbnzi6o27W2xHpr9SaQw3d7xVU/yW3sWIlT+MGcagMIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8814
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.482900-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQOwH4pD14DsPHkpkyUphL9Z/rAPfrtWC1h2fnHe1cil8Ht
	HEmxq9+YzZ57coBobHl+XHMTeEdcYUttpN+KVVd9l1zsjZ1/6awYR+gKWoGXzhHfiujuTbed4nz
	kw7itaMiHjyc2ZeuhtKLnTnkrGDspsEBAuoaUqK/il2r2x2PwtSY6ALX8FNLOImUW5RRsfvDmyK
	Mkdi4AheLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7CKFCmhdu5cUdrxa8CQKZBF7bK
	ix5RX8bmCdHFOR/SPHSlKAryivoN45EThDjdEKMrWQYxCykYTk5GRYIzlrqBcqo/J5ia4URcp0q
	jMDK5D25ZyimlDMxyA56xhuba2WuZ86KY3oNT3zIO0Si2Tuenp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.482900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3471FD3DF08F25F1359ABD8C4A6C5C006DFA766A03C2E6A96700404CECD165D02000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_221538_572640_5817A63E 
X-CRM114-Status: GOOD (  17.89  )
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

SGksIExpYW5rdW46DQoNCk9uIEZyaSwgMjAyNC0wOS0yNyBhdCAxNzowMyArMDgwMCwgTGlhbmt1
biBZYW5nIHdyb3RlOg0KPiBJZiB0aGUgbGVuIGlzIDAsIGtlcm5lbCBjcmFzaCB3aWxsIG9jY3Vy
IHdoZW4gcGVyZm9ybWluZyBvcGVyYXRpb25zLg0KPiBBZGQgdGhlIGxlbiBjaGVjayBjb25kaXRp
b25zIHRvIHByZXZlbnQga2VybmVsIGNyYXNoLg0KPiANCj4gRml4ZXM6IGY3MGFjMDk3YTJjZiAo
ImRybS9tZWRpYXRlazogQWRkIE1UODE5NSBFbWJlZGRlZCBEaXNwbGF5UG9ydCBkcml2ZXIiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBMaWFua3VuIFlhbmcgPGxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20+
DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIFYyOg0KPiAtIEZpeCB0aGUgY29tbWl0IHRpdGxlLg0KPiAt
IFJlbW92ZSBibGFuayBsaW5lIGJldHdlZW4gdGhlIEZpeGVzIGFuZCBTaWduZS1vZmYtYnkuDQo+
IC0gTW9kaWZ5IHRoZSBqdWRnbWVudCB3cml0aW5nIG1ldGhvZC4NCj4gUGVyIHN1Z2dlc3Rpb24g
ZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA5MjUwODQxMTYuMjg4NDgtMS1saWFu
a3VuLnlhbmdAbWVkaWF0ZWsuY29tLw0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBpbmRleCBkODc5
NmE5MDRlY2EuLjllY2RmNjIzOThlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
Yw0KPiBAQCAtMTA4Miw3ICsxMDgyLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RwX2dldF9jYWxpYnJh
dGlvbl9kYXRhKHN0cnVjdCBtdGtfZHAgKm10a19kcCkNCj4gIAlidWYgPSAodTMyICopbnZtZW1f
Y2VsbF9yZWFkKGNlbGwsICZsZW4pOw0KPiAgCW52bWVtX2NlbGxfcHV0KGNlbGwpOw0KPiAgDQo+
IC0JaWYgKElTX0VSUihidWYpIHx8ICgobGVuIC8gc2l6ZW9mKHUzMikpICE9IDQpKSB7DQoNCklu
IG9yaWdpbmFsIGNvZGUsIHdoZW4gbGVuID0gMCwgbm8ga2VybmVsIHBhbmljIG9jY3VyLg0KTmFj
a2VkIGJ5IG1lLg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQo+ICsJaWYgKElTX0VSUihidWYpIHx8ICFs
ZW4gfHwgKChsZW4gLyBzaXplb2YodTMyKSkgIT0gNCkpIHsNCj4gIAkJZGV2X3dhcm4oZGV2LCAi
RmFpbGVkIHRvIHJlYWQgbnZtZW1fY2VsbF9yZWFkXG4iKTsNCj4gIA0KPiAgCQlpZiAoIUlTX0VS
UihidWYpKQ0K

