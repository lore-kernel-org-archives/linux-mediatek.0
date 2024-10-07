Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE1CFB442
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7bII91IsmDAyw0m570Gi+i4k+Kb7J8XmofLN9HklJM=; b=Xkt/3cmRXJKi5sDZwyKdBKrWkU
	Ubs1liGEqKx3s32Fu7T+bLU0am+qD9ACuEJ9yVBo2b1fbaFrbXqliDRfKX5qB3zbbk6wIkAtK8Ww5
	Vi3w9FofpaJFKyc7NEsXxg7gVM0gatvfRAwcrL4ihC8C1ue/scbcEm/nU43/QwWRmrJwRK1IgGPnh
	fxKBYCIkXhVOy29nkx8UAseyzqeuCMwZPzQOWsK8ua08DCRzR1R0ILKNk3jyZ6UTrojZdJdXA2C0A
	+HU1j6URdc01X4o69v7Z2lBqbtVqzYsQL9/D5cFS1Hv7ZEMJuDvP8tWUewzt2/KWSy/EBqHN4Q5PP
	LSGjDsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxh1o-00000001OUW-3wBZ;
	Mon, 07 Oct 2024 06:15:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgwC-00000001NNX-0xQ9;
	Mon, 07 Oct 2024 06:09:46 +0000
X-UUID: bb2d33e2847211efb3adad29d29602c1-20241006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=x7bII91IsmDAyw0m570Gi+i4k+Kb7J8XmofLN9HklJM=;
	b=Pa96GqZWGjKu3zabtPonygIktGr9k/P7pWEn5kFUYVmOl+PWUf791bMByB9IZ4KCan2HJzQxZqPC2k5daKpjydY/7WJxl7m4xVAQ5IA+sguIMBGGus5cyKflJbxAMG91SLNvRENo1d3TNbiUiqg0MtoMc6nJy8KYiiu7yTJE7Do=;
X-CID-CACHE: Type:Local,Time:202410062257-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5be035d8-3bce-459d-b599-7c3d2d4a956d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8afdd864-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bb2d33e2847211efb3adad29d29602c1-20241006
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 44590763; Sun, 06 Oct 2024 23:09:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 14:09:34 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 14:09:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQxGQggEHkKOK4KrEYWQyCW+CoMAOJHpQ8VVawxCNlondFz1/UlMWZOPvSuNh/6ksT30ihOmAvj7083NSAMXtjmql5PB/4K2+Tj4aU5R+JUcsiHBo6IN261BVhE7Cpei+qkrKiV7D6JFbWDden6h6uoFCEtaPEWZ/cgIySHoeb+AoWg22t6TcsrnVKq+Bloz2VqvQnqWsXCL4d/k8cz37R7/wtbeIzENB69rhVOzO8noTmSPwxYa45fPRJLLmTUBuAg6mGQvvoT6aUHayoAKp+nHojM77mlBrv7nIE+C3xuDKjCfsN9jGq5nOcgQ4/t/d8tLSSLTlKV0GSRrFIc+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7bII91IsmDAyw0m570Gi+i4k+Kb7J8XmofLN9HklJM=;
 b=UDMc2XKL0BbN6R05Oc4OkkFqI6uB2ZxbCdeff5xp7MLK1zceAxMQkFojurhWpGlIRoqoQxXSEEvmtX35KpoBf92Psevoed03xb1uiq8YWAxFH//sxrCQfA+WT2guSaZPEGCLTuaJNaOd1KugO6nzTz5wB7fpZuGoGbdG5Aun6UOYI0wpJsVjW/2G3spE2G8kYX5ioYI06ChUAhzE4JqIM8mMh0QqINLkHvAexT6boFJc7d//K9w4ispGZUrqniCLFU48CBS81bF6NE/qyoSzOMSeAFQLTedSyay9u5KnxPuaCZ6akbl4fBjGP7cEyLvBBPO0k3ZH5BFwMKD2lufpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7bII91IsmDAyw0m570Gi+i4k+Kb7J8XmofLN9HklJM=;
 b=m3sDyTaI+vylz9PuERySFrYMydeb81GBf/Nq/F8KpyTpxIc2ZVHV9RbSbfCPNT1eKvBd+LD8NjPENrwG3TKgf0NzoXgnQInTK4qQt9FTnvRLNOEWnobHh5/X43oRNEJPUnO4wzaYzfxZbcryzss7V1LRC281V2DQk+Lpkl+1QDU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8625.apcprd03.prod.outlook.com (2603:1096:405:83::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 06:09:31 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 06:09:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"me@adamthiede.com" <me@adamthiede.com>, "yassine.oudjana@gmail.com"
	<yassine.oudjana@gmail.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
Thread-Topic: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
Thread-Index: AQHbFwxSlzi3cCD/xUK7LYFCxmLxSrJ6zWMAgAADdQA=
Date: Mon, 7 Oct 2024 06:09:31 +0000
Message-ID: <fe26e581f11b992aaa358141070a36360a97e192.camel@mediatek.com>
References: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
	 <fe1784eb5b64327c2a6a5836f245501b7032b1c5.camel@mediatek.com>
In-Reply-To: <fe1784eb5b64327c2a6a5836f245501b7032b1c5.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8625:EE_
x-ms-office365-filtering-correlation-id: 00f522df-8b34-4a24-907d-08dce6969be8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UDdNL0xMUE9JOHh5WGd0d2IyR1dQa21Cd01MVW8zcFZHei93eGlYYWpVUXVn?=
 =?utf-8?B?NXYvcUZoZjZTRUtzaTBEVXRGaTh1OVZFSmphdjZmTFB1TklmRmhFa0F3SUZR?=
 =?utf-8?B?MEhFWkRJOTFTTU1yRUtML1JIQXl3ZDhET2xka014Y3lDd1BUZUNYQytMZS84?=
 =?utf-8?B?TkVHNkp1MXVGdEk0b292TTNTOENyNk1XVXRIZXVGUHhVTEJCQlhRU2RheDNY?=
 =?utf-8?B?dW9YZG50UVd6bkFBS2dGNTRJMXRGbjJkRThiQnNUdnlSMUVVQ2RSYWtHRFdo?=
 =?utf-8?B?ZW1FME5MQVEvZDdQbFBTS00vMzB4cXZ2WXdFaXA2SGFMeVdLZWZ6SjFFbHlP?=
 =?utf-8?B?WWxpTWd0ZlJNVnRsUk1YZTR3T3B2VmwwTGJ1cTdTdHFTL0krRzR4YU95RXpO?=
 =?utf-8?B?NkxJME1oWEJZVUpIL1dZQ3VtTEY1STI4dHpqeTJqV1pyK2tpc0U2bmtPby9G?=
 =?utf-8?B?TUpiUi9pMWV3K3YwbHl6eUl3eEwrVVVMbVYvNUZmWEdnOUhWUnN4U1d0cXFk?=
 =?utf-8?B?OXhvTDJYU002NDFLWlBGMU02YjBWU2UvcG1RbytBLzNMR0RLUjJ3V3pxWDlE?=
 =?utf-8?B?L1J2dWpXNGJXNHZCN2VzeEZMK0dXMGNoNzY1STQ5S2Iyb1VLcldyWTBCM29C?=
 =?utf-8?B?WFBBcmhjRHp2R0dwcXVQeXk5TE5TcVNLODFCSjBpTjZPRnNhbU05NUNDYk9B?=
 =?utf-8?B?WjFpczBiUHZnVnlKTEVRKzYwdzN5K2NsZ3FwbGRMSC9BTGx6VG9DN0c3TEJF?=
 =?utf-8?B?VS82UDhiejhuVWx6SVJZTzFKb0Y5SlRTRWRIVnNzM0Myd3c0WHM4MEhqMGZp?=
 =?utf-8?B?cUZySGQ0NzlYMGhMSVUramovSkZyWitaeEpFbFkvRzJ1T3Ywb3J0Q3FOVENI?=
 =?utf-8?B?QWhKY0JrVk9FdlF2MXhPNFpORDJtV1ZPeWQvcXB6ZHZ5UnREbWwyQkpEaHhm?=
 =?utf-8?B?anlZeGMrVzRFZ0xnY1V2a0lLNGwxRDVqWUZWVSsxczZSc2o1dHRCaTNDQmZU?=
 =?utf-8?B?dzBJQVhSQjRLcnFia3c4YlIyczJSOGp0VUF2R1pFaEFwcnM0YkJyWjUveFht?=
 =?utf-8?B?SCt0UFhST2tRTm9vd285WjVNMkJ5RDQ2SERBTDdHUHhXS1VhTzJLbVhQTFhq?=
 =?utf-8?B?UDQ1SkErMG14UlRtS0tkRi9BYjRlZjdSNXpjL0EwNGYvb21DYzBnWWh4c00x?=
 =?utf-8?B?bklBVU9FeTdlVzM3U1ovc0NzRy9ZSCtaY29BTWZtUStNYTV0Rk1CWHVpNGhk?=
 =?utf-8?B?cklEcW9aRUhaRkV6Z20vN3BnTk9STGk5NTExWE5CVkNnaVFmSG5CMkV3NEtJ?=
 =?utf-8?B?ZTZuL1I5Wkl5VlBKbmlYdHY5d2thYlJ4NzNSSmhPSXRWTWxZbFBjckExbHhT?=
 =?utf-8?B?OGdta3I2ajZGTG9QVCtxMjc2WnZLSEV3azB6T1FINCtIb1BneFF3Z2p5ckFw?=
 =?utf-8?B?alRocENOOHcrVUxPRlhZeXdmWWlRTldFY2hQYkR0WUlYVE05L3RZVmtVeVBz?=
 =?utf-8?B?MERUeTkzN1hPZnh5UUxxeWtzKzVYNkg3c0lRSlNvTThWVTIxak0zVytNMzZQ?=
 =?utf-8?B?UlNoL2NGa3dWVVRxM2xYVVVVVTNhUkFUVjJKblluTDBiZzlHRDJsb2Q4Q0hB?=
 =?utf-8?B?MzRKdUhHTU8reEhBY0IyYS9oZ1pCRktMTzllRFVuMzROazlRMEtNQmE4MVFT?=
 =?utf-8?B?d3JxVVJVYWlBOWhUTGpwckZLU09sNFlUQUNCOU8xOE04T0J1b1ptZ1g2aGpr?=
 =?utf-8?B?aXJ5eC9wL3JJZTNiWTFtKytOQ01tWHc5MXpjdFh6TWlCMDRjOHJZZThCSnl2?=
 =?utf-8?B?Yjl0VG1tcWdDQllVRlVnUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWFUWGE1WEhhZ0VlaE50UWx1OU4vbEt2akFxV1BmWHkzcTZDU1NMZmlRR1Np?=
 =?utf-8?B?dS9weExiNG9XZW0zbU1ZbG9VcXFMa1hLSjBmRkFpd1VRb24waVZGdUNYYmpx?=
 =?utf-8?B?T0hGem9IMFY4OWxyOVp1QjR3UGZ5YzBZK0Z6RlhoZGc5UVN5bTFRYzZNZ0pt?=
 =?utf-8?B?L3U4SmxnTU1laVhabFZsRmFKc0htb3BxVDZUNmZmdW1hV2U1M0RsS0JaQmVi?=
 =?utf-8?B?RG90SDFaZ2FEQ25KcWpoamttRFVmUzV0SlZxZCtqMTVXTFA3VUV2MFV5T01r?=
 =?utf-8?B?SVRQS25OK0lFWnF4OG1Xb0hlQXc4cDJhRGhlZVk2L3k5WjJYUXZZdlZQYUpE?=
 =?utf-8?B?emRiOTRxTjBXcXNFbTJoOTZoS0poMGR2MTFtZlhrck82WFpWNlBRRC8zYVVD?=
 =?utf-8?B?Vm9KeXBYR2ZxU1NLUG9jYnlYS3F0dVdUTmFIODJvZ094MkxsUElPSFZDU2NX?=
 =?utf-8?B?NFlMZndDd0w2dVFLcEgrTTdSNHV0TmtEckNZelFoVnVIa0JRbFYvTGxTY3FX?=
 =?utf-8?B?RGJrdXFveHl4ekk0S01WemlsMnpDUkFMcDdoakZidUlIbU42TlQyZk5Jc2tk?=
 =?utf-8?B?cVAvNW9IWUowb1g0RS8zVDNjMFFlcU1LTkN1OE80czlXQ09ZN3M5dmxRVEhu?=
 =?utf-8?B?c0FSc2tQeDI3UVhQU2t1RW5rRy9ucTR4aXRIUEZOQ0h6U3ZMc01zamxVMExT?=
 =?utf-8?B?NXljVnd6R2RydzJqMnh5NmRtUy9ZQkoyR29OUUQ2VnkwVnpPaHVHU3A0bnV4?=
 =?utf-8?B?dFJsUm0yWUpTWTBvb2RBaDBnL3RlcGxHNXlsKytuaXJ5ZEVQNmg0VnI4Tkh5?=
 =?utf-8?B?SUo5YUI2QnU2OU00NHI3ajVRRExHZVo2TXVsalpDcGZ2ODdNMXVQR2xhOE5F?=
 =?utf-8?B?L1l5MTdiQUljU2d5VzNyMkE0ejVtZ0ZpVWZBa3B0K0svdDVFZmV1Y1hTRjhY?=
 =?utf-8?B?d2dUMGVubkY5ZTVRQm5JdE9JaVNpaHJYbkN6UWEwWTRvamx2MnVYb0dqSnYr?=
 =?utf-8?B?ak16cURLbEdFMnQ2Q1FRVkFwMisyelpyTnlCaXVZcEI1NXBvUDhYUC81NlFo?=
 =?utf-8?B?V3BBTkZVQzBPcmpxYWRPK3pGdzBQK3dPR2JES1B6WHhEc2I2Wm5IbHdnTnpk?=
 =?utf-8?B?VTgzV2daVm4zenhvZHdaOWJsTG9yZEtZOEZDeStoWDhDSEZ6MlY3V3BJcE1U?=
 =?utf-8?B?WDFBZFRIc01MT1NzTHlHaVpqQkhoTHlmSU5MdWV5eW1LbS9tcVhUbmFyVVEx?=
 =?utf-8?B?bUVPQkRjbm9MQ2t5bjZycFBWZ3FEWWJicFRtV080Nk1IY0o0UDRWWVhwMllO?=
 =?utf-8?B?RUY4MFU5VXdVN0JFUXBDUEwrRlRDUW5SR1oxb3Rja2dXeC9OZnE1c1RSWEJ1?=
 =?utf-8?B?TTVkM2tFTHRCLzBrOG9HalNuVXFqTTB5S3F4QjN4Qit2dm9NY04yUGVZd29J?=
 =?utf-8?B?ak9jMXNYb2VUWGdGNjRYTmwzUldHeXpqNEdnZm9LQkRTVVRKYVlKblZrTUR6?=
 =?utf-8?B?S1pHNER5T3gzVXpVSnZxdTJKT2VIU0J2ZVVLdFZtcGxtRXQvK0o3blRkTzla?=
 =?utf-8?B?MDBwL1RzQTRLR2pvMDlQT3oxM0pta3RnMmtEM3N4RkhmUkVScUw1Z3JRMlAr?=
 =?utf-8?B?S2dnQlhNdTNoOXVWZlZqUTFibUZWVlVUYWo1am4wM0QyQ0VOaTdNd2FCaTI2?=
 =?utf-8?B?cEpGTHhrcGJvR1pnbE5kcnRlQTkwbVNKZDlmbGpMM25sQ0lYYzc0ZmZSbG1I?=
 =?utf-8?B?MkR3cEFlY2RZN0tpdG10aFBXUVl0dWpyR2NEWUl4N2JJRU9pMVhvU3BwMzR6?=
 =?utf-8?B?Zk5DV3lBK2puZE5vM0w5THY0ZG8zV2pENFB5OExHcVVXQTBGeDFBcy9YTGRR?=
 =?utf-8?B?VmxQVWtzelBZUWFNczhGNC9JTEkrUlZNRnRYREx2cDBCTWJMSW44a08rT2x1?=
 =?utf-8?B?LzJhNldCVFNqWWl0M25BL1VralRRdDkwNlEyUlkrQ2tIQzZ5WFdVMUJvdmhh?=
 =?utf-8?B?L003TGhmUm5MNlBiZ2pkdXZEbWtMWGg5cjUxek01a2RtbWZkZC93WmhnQlZY?=
 =?utf-8?B?Y1VzMFV5RVZBY0J5RzRrWlh5S3k4MEJ5S3BOQ2YwUWtFNnRwR0VOaDdZeWpV?=
 =?utf-8?B?OWRIS01FbXNEZUVaUWhHRTZZaWg4bnU0WitoVU1taWNXdWQxQWRvME9WejBn?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6315735A1F3FED4D98918EA894197642@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f522df-8b34-4a24-907d-08dce6969be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 06:09:31.4508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN9tNGxmjhjWphbAEDTqHofz+YZfUfyVcI4pzixmMGuDF589UuPmG8duUP/Hlkr1TU2OYfBeLJLbRwyrIu1bKw1EQvUXZEArCIOOsl/r190=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_230944_302155_49E65596 
X-CRM114-Status: GOOD (  28.54  )
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

SGkgQ0ssDQoNCk9uIE1vbiwgMjAyNC0xMC0wNyBhdCAwNTo1NyArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4gDQo+IE9uIFNhdCwgMjAyNC0xMC0wNSBhdCAx
Nzo1MiArMDgwMCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IElmIHRoZSBjb25zdGFudCBhbHBo
YSBhbHdheXMgc2V0LCB0aGUgU29DcyB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQNCj4gPiB0aGUNCj4g
PiBpZ25vcmUgYWxwaGEgYml0IHdpbGwgc3RpbGwgdXNlIGNvbnN0YW50IGFscGhhLiBUaGF0IHdp
bGwgYnJlYWsgdGhlDQo+ID4gb3JpZ2luYWwgY29uc3RhbnQgYWxwaGEgc2V0dGluZyBvZiBYUkdC
IGZvcmFtdCBmb3IgYmxlbmRfbW9kZXMNCj4gPiB1bnN1cHBvcnRlZCBTb0NzLCBzdWNoIGFzIE1U
ODE3My4NCj4gPiANCj4gPiBNYWtlIHRoZSBjb25zdGF0bnQgYWxwaGEgb25seSBzZXQgd2hlbiBz
ZXR0aW5nIGhhc19hbHBoYSBvcg0KPiA+IHN1cHBvcnRlZA0KPiA+IGJsZW5kX21vZGVzIFNvQyB0
byBmaXggdGhlIGRvd25ncmFkZSBpc3N1ZS4NCj4gDQo+IEkgd291bGQgbGlrZSB0aGlzIHBhdGNo
IHRvIGJlIGNoZXJyeS1waWNrZWQgdG8ga2VybmVsIDYuMTEgZWFzaWx5LCBzbw0KPiBsZXQgdGhp
cyBwYXRjaCBiYXNlIG9uIDYuMTItcmMxLg0KDQpPSywgSSdsbCBtb3ZlIHRoaXMgcGF0Y2ggaW4g
ZnJvbnQgb2YgdGhpcyBzZXJpZXM6DQpbMV0gRml4IGRlZ3JhZGF0aW9uIHByb2JsZW0gb2YgYWxw
aGEgYmxlbmRpbmcgc2VyaWVzDQotIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz04OTM2MzQNCmFuZCB0aGVuIHNlbmQgdjkg
dG8gbGV0IHlvdSBjaGVycnktcGljayBpdCB0byBrZXJuZWwtNi4xMSBlYXNpbHkuDQoNCj4gDQo+
ID4gDQo+ID4gRml4ZXM6IGJjNDZlYjVkNWQ3NyAoImRybS9tZWRpYXRlazogU3VwcG9ydCBEUk0g
cGxhbmUgYWxwaGEgaW4NCj4gPiBPVkwiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjggKysrKysrKysrKysrKysrLS0tLQ0KPiA+
IC0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQo+ID4gaW5kZXggNzAzY2QzZjZjNmQzLi5kZTNhZGRkODk0NDIgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gQEAgLTQ5NCwxOSArNDk0
LDI1IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+
IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gIA0KPiA+ICAJY29uID0gbXRrX292bF9mbXRfY29udmVy
dChvdmwsIHN0YXRlKTsNCj4gPiAgCWlmIChzdGF0ZS0+YmFzZS5mYikgew0KPiA+IC0JCWNvbiB8
PSBPVkxfQ09OX0FFTjsNCj4gPiAtCQljb24gfD0gc3RhdGUtPmJhc2UuYWxwaGEgJiBPVkxfQ09O
X0FMUEhBOw0KPiA+ICsJCS8qDQo+ID4gKwkJICogRm9yIGJsZW5kX21vZGVzIHN1cHBvcnRlZCBT
b0NzLCBhbHdheXMgc2V0IGNvbnN0YW50DQo+ID4gYWxwaGEuDQo+ID4gKwkJICogRm9yIGJsZW5k
X21vZGVzIHVuc3VwcG9ydGVkIFNvQ3MsIHNldCBjb25zdGFudCBhbHBoYQ0KPiA+IHdoZW4gaGFz
X2FscGhhIGlzIHNldC4NCj4gPiArCQkgKi8NCj4gPiArCQlpZiAob3ZsLT5kYXRhLT5ibGVuZF9t
b2RlcyB8fCBzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LQ0KPiA+ID5oYXNfYWxwaGEpIHsNCj4gPiAr
CQkJY29uIHw9IE9WTF9DT05fQUVOOw0KPiA+ICsJCQljb24gfD0gc3RhdGUtPmJhc2UuYWxwaGEg
JiBPVkxfQ09OX0FMUEhBOw0KPiANCj4gTVQ4MTczIGRvZXMgbm90IHN1cHBvcnQgaWdub3JlIHBp
eGVsIGFscGhhLCBzbyBPVkxfQ09OX0FFTiB3b3VsZCBiZQ0KPiBkaXNhYmxlZCBmb3IgWFJHQi4N
Cj4gQW5kIHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gcGxhbmUgYWxwaGEsIHNvIHBsYW5lIGFscGhh
IHNldHRpbmcgc2hvdWxkDQo+IGJlIG1vdmVkIG91dCBvZiBoZXJlLg0KDQpPSywgdGhhdCBtYWtl
IHNlbnNlLg0KQnV0IEkgd291bGQgbGlrZSB0byBhc2sgWWFzc2luZSBhbmQgQWRhbSB0byB0ZXN0
IHRoaXMgY2hhbmdlIGFnYWluLg0KDQo+IA0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJLyoNCj4g
PiArCQkgKiBBbHRob3VnaCB0aGUgYWxwaGEgY2hhbm5lbCBjYW4gYmUgaWdub3JlZCwgQ09OU1Rf
QkxEDQo+ID4gbXVzdCBiZSBlbmFibGVkDQo+ID4gKwkJICogZm9yIFhSR0IgZm9ybWF0LCBvdGhl
cndpc2UgT1ZMIHdpbGwgc3RpbGwgcmVhZCB0aGUNCj4gPiB2YWx1ZSBmcm9tIG1lbW9yeS4NCj4g
PiArCQkgKiBGb3IgUkdCODg4IHJlbGF0ZWQgZm9ybWF0cywgd2hldGhlciBDT05TVF9CTEQgaXMN
Cj4gPiBlbmFibGVkIG9yIG5vdCB3b24ndA0KPiA+ICsJCSAqIGFmZmVjdCB0aGUgcmVzdWx0LiBU
aGVyZWZvcmUgd2UgdXNlICFoYXNfYWxwaGEgYXMNCj4gPiB0aGUgY29uZGl0aW9uLg0KPiA+ICsJ
CSAqLw0KPiA+ICsJCWlmIChibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUg
fHwgIXN0YXRlLQ0KPiA+ID5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gPiArCQkJaWdu
b3JlX3BpeGVsX2FscGhhID0gT1ZMX0NPTlNUX0JMRU5EOw0KPiANCj4gVGhpcyBtb2RpZmljYXRp
b24gaXMgbm90IHJlbGF0ZWQgdG8gdGhlIGJ1ZyBmaXgsIHNvIHNlcGFyYXRlIHRvDQo+IGFub3Ro
ZXIgcGF0Y2guDQoNCk9LLCBJJ2xsIHNlcGFyYXRlIGl0Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkgu
TGluDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo=

