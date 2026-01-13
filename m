Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D9ED29DDE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bcHLKuEhwkqokrcsFSM/v9QPK5guyRTR+jJlkTE2sY=; b=KIEsYbKp40K1A65oq5ylDnhNVc
	WEOh37NhoS73mdSQtTCarWJSWifQWygCHGaQWb4hVGByUb43sTybcXNcKh1bLrDoQmnRgdlum+Vmu
	ctqgaweQqS/MvUVzHo8Oqf0xBLeiiFfHYdJGeKogfQ0nQpAJ8IRQuSKqfZvj4BP6t3B+XIcxKzwsG
	tFdJGZWFab9BO4IGCzQp88bpiZ6gCce5uSNAvqO9UHFbssLNkZB6dHPvLHHoCyiKacEAz78VM/yAO
	6ox5a3jarEI5kIrCcLKyq/4qsUOEERvoAZMztiV9U0HHnt6aS6lRwpYHKNUhrSIcJjo2Su+kA5Ifx
	dQxuwYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ51-00000006fum-2678;
	Tue, 13 Jan 2026 07:44:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ4x-00000006fu9-16Ik
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 07:44:41 +0000
X-UUID: b565d6f0f05311f09f706fa2197c6ceb-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6bcHLKuEhwkqokrcsFSM/v9QPK5guyRTR+jJlkTE2sY=;
	b=tlYlPPMEjF0LLUYv4gH556+3Kgnfy/NRG1r8lCJwGHYalDq+KzQ3+BFVQrkd5txgWmg9h136OTFksAy4IzZTFPFg4tAx/Rouz/uk9IsYbm1Nhrh2lwp85GB2VHbg5U8UVkmI6aEOeO/DuUjHwJZe9NUqNb3peo7U8JcEgd9hQQA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:121c5adc-d0f2-4729-b7c4-6b9998330b7f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:64b573e8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b565d6f0f05311f09f706fa2197c6ceb-20260113
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1064231944; Tue, 13 Jan 2026 00:44:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 15:44:34 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 15:44:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTyIzdXsstAGMA+xzZsY1efrqXv8BHb/LtL1WGejc3mkz9z6jC0RM5e3vLXzP5jklx1fnv6rRCa354K2rv1KCFUZWhRHR69jDsAVtPEzyJw/DZD/QC8b4fxcjRezS4xLmr3lb0nSNu51aG9skOQcR4mwkV9sYGzEWwLt48U7Kpwf9XfUKjGUkUvNgUWmGEdCIFLB7ESHucQicxhKyvPFkEWXvP/IKvhrLBxUuPjUlTr1xq5Y7lLx8h1V9CjN8pIz/i8QkHTLj+tNIdGlEprQIv+3CdErlkm6PME6p2TJssr6O84arq3Sto+X77Kw1pre1+t1lvj9+UT7NqbDFtKnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bcHLKuEhwkqokrcsFSM/v9QPK5guyRTR+jJlkTE2sY=;
 b=i37JeARrB5ZT74JhBwR1+TCZesLmY7HrMAeR0sDuvDsY/LFVr0uFzQll3cs9e8VcjwsDQ0LhkZmr6MmhrmRRT3ejPfyN5DeSeUSQzQqcNFoCFIRv6XgM4WALgJw71i5SrdlSF7oSrK7MzxwIMGWZA2zIJnhVatlTA/cbFqSWIPArIYez01TftepjXCnIyeK0jF4wlp8tuA9wIuCpK6R3NuRD5qKS55FvMDH5R+YIsCe851SzFuzKS2g6K402lFKAgl3qHo0JHCKbc5SGvLFp/R25MfTVhI/vUmLrivemoy3+pHyMruaVvoJcl6oHaznAlT3f92TVJbXo5Gnz1+gnpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bcHLKuEhwkqokrcsFSM/v9QPK5guyRTR+jJlkTE2sY=;
 b=PB18F23+eDaRh8D1yPLFfWsVaFR17lW9u3qfn6y6SWHyZJJsZFs5y+q7mlo+NPe4qz6ABbWOcc8W13wqCbiml1f77CoP+VkqzRQPTThnkiplEY+QGcX3yxLzPf3K8vsTt2iwSB0U1MlTJ0YBJ5gXhsV3hYzndBjZuVEBTICDVds=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SEYPR03MB7119.apcprd03.prod.outlook.com (2603:1096:101:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 07:44:31 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 07:44:31 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"wenst@chromium.org" <wenst@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, Nicolas Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
Thread-Topic: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
Thread-Index: AQHchDG/005k+PqkxEqfAOifG31WDrVPjteAgAARf4CAABgtAA==
Date: Tue, 13 Jan 2026 07:44:31 +0000
Message-ID: <d924bcc5b0fc71cdd76fb8d51af8d5d10c326557.camel@mediatek.com>
References: <20260113020959.2377348-1-moudy.ho@mediatek.com>
	 <20260113020959.2377348-2-moudy.ho@mediatek.com>
	 <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
	 <or7l3unt5unsxzktzvgqj2sqzkdalwt6uojbbcclzmnrcqhm2j@qzbdazvmvswt>
In-Reply-To: <or7l3unt5unsxzktzvgqj2sqzkdalwt6uojbbcclzmnrcqhm2j@qzbdazvmvswt>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SEYPR03MB7119:EE_
x-ms-office365-filtering-correlation-id: d134d2a6-4918-41f9-74fc-08de5277968d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?c2MxRkUxUEUydXpvbEEzWGdZY3krNzBVeXltQ0xSYW9MbURTU01ZUGlJNXdV?=
 =?utf-8?B?ZGlHZnRiOHpZVk02djl6ZDhINFJyWW5LRU1xL1N3bkVRZVFKWHExY1JJY3ZD?=
 =?utf-8?B?c3pXa1hRdlNETnQvczYrMFZIZ2MwbzVLWHRrM1paSHZTaXUyN2JxSzFpT1lt?=
 =?utf-8?B?VjBKdGxFdGdtRGdNR2tyVTFRWVh5ODE1MjR2WWZnRkVnYXhId3JYaFgrcVI0?=
 =?utf-8?B?NHNMYTdja1ArVHhuSk9SVmtlcmlSRGFzaytTTFlmS0N0bHYvRWJZNDIzbVkv?=
 =?utf-8?B?SkdZNkNPeDBRam1lS1FHdXN2QnlNWTlqekFYam42eU1ta1doU2crZEJqQ1pY?=
 =?utf-8?B?SG14U0xUQy82azMvU0RpcG4yTUVPK0pZQ2FUMkJlMDdydFQ1bUtaVTg1cStS?=
 =?utf-8?B?Q2xVdWlnSTB3d3NxdDNlcGJmU1FWYUZkRCtPYTQ5VEdLTjBERE9wNXVCYytB?=
 =?utf-8?B?b0tqcDlvWmFGeDZDZ29sZENZdUQrM2UxdmEraDJnRTFLbEJoQzA4cFpUdU9I?=
 =?utf-8?B?ZUdlOEIzWWNMc09yWGtmWStzLzU0N2ZKcC9neGJQNGh1RUVPZ3NkZC9ZdnFv?=
 =?utf-8?B?eWhlQXpmV1V6TEkxbFdWMnBLdjY3ZTdYM3FOWmFCK2hkQXV5bk5vcm9NdGUw?=
 =?utf-8?B?VnJHMDBCN0hWSTE5a2RhQ0xXVmsyNThTVVJXR3g4ZngyMVZpQ3l4dG9kMHNy?=
 =?utf-8?B?cnRySjl2WVdONis5WS9CeU93aFVDdDM2c2x1ZVZFdE5tdUVzV0UzK0d3eW4v?=
 =?utf-8?B?N0hMODdLbW83dStwU2xIMmhWRUxTa1N6aFA1VVFvWVREb1cvb2hzbmJwbDdu?=
 =?utf-8?B?ZVd2Z0N5enIyVUNIRmpFVWt5L0gveHFpUW1qaUdHT05qcGxvRUFiZzlhcStj?=
 =?utf-8?B?UG5NMGxzcE9Pa2IxTmpnRmRMS3c0ZE52Y2xzL2JFcDdNMXJvby8zbEthQWZG?=
 =?utf-8?B?OG15T3I4RWZyQSsvREpUVlBuVTZDUnkxUHBxdmtESEhHRjFlZWtaNng5aEho?=
 =?utf-8?B?NXRHQ1A4ekVPelF3NWxPTVVNUjdtckphV0FwVk5kUUhEZWUwaTBFbHdRRGhh?=
 =?utf-8?B?TndieUNWL0VBQUV6QW9BVy9jcldkTnN2UDR4NTEvVndGNDdFZ2ROcEN0ZkJ3?=
 =?utf-8?B?ZXpISVlGNFF6aHI5UVRJODRKK2ZxZGhkM0M3QTFURWRFcWQwdHBPZW1DdGR3?=
 =?utf-8?B?ZDVYOUNzcTZoYU1VTzlJUHZhZGlKcHcweStKc2p3MmVZZGZTd0lxOHY2bXlT?=
 =?utf-8?B?WVFDMmo0Q0REakdSYUszdFhpWTFVSHNpNUJWbEZsTTNzblBxSGVPNWJLSWlo?=
 =?utf-8?B?WEoxbDNEZ283RFVPZTdYU1VkMzB0TlpienlkamJSOHJDUEVtdlVwNktZeUd3?=
 =?utf-8?B?aXNkanduaE9PNVZsTGYzMWtENWxLOWtxWWRScUdkaGpmL29LM3pOVTNpNzgw?=
 =?utf-8?B?UlRXVTFVMlJzTkcxTCtUQnlhUHdXNGtzS1E5TUxwQ3EwYzVaN1hFYTV5WlV5?=
 =?utf-8?B?U1d1aWhVWkVGUTFTOFFMMXZrTnRjN3JmejdTRUF5aHQ4cWd3NDg2TmhFRDFY?=
 =?utf-8?B?cDRNaFcrLzhYdVBTQTNpT0pZS0tscU5ZNUZhRlhRME05bzRJejBCYjBSaWpp?=
 =?utf-8?B?TGdLaEU3QU9zVVk5cncwM1NUMWR5YitEQ0N0VzJpUmxRYzlaZUh3Y3NUanF5?=
 =?utf-8?B?Si9SY3V1TjJ3T0JXTDRyaGR3d1g4VWZvMlJ6RVpaejhnNi9PeDBNdmJEYkNi?=
 =?utf-8?B?NGxVMnJuZGRLVk5Iam54b3dLMWtRdU41aW5nbmt0TjFEZ3RqSUhtdUFjN3hG?=
 =?utf-8?B?YXc3dU5PQzYwUXpTZDM2dDI2bVpyWDBGbkduV2tveHRPbzZQd2lxQ203Vmxq?=
 =?utf-8?B?dnQxZmFYaTVzS2MyVzIwZ0pQRTZnZjJlZ09RcElJSTlPa2VGM01VQ1A2WnB3?=
 =?utf-8?B?RTg4VWp5MU5lYzIyWTFXR1lDNnA5YWdHcXpvQmJwS09FcUUzS2pjRG45Szdj?=
 =?utf-8?B?M2U5azdZVnovOTFrK0ZoVFBhTWQ3UTMyYTB4T3JQS2FDQXhSUDFjWWZHYmtU?=
 =?utf-8?Q?+dGqh8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTY1YjZoNUMxNlRkbStrNXo1L2dqbXRmdEpINEoyL1A3SHNKcFBXWVhhRTUx?=
 =?utf-8?B?TkZhcTkzZkxPSWdUd0F5OUYvRnNBSW80ZUR2K0haQkJ6aTZSVGExZWNXd3Zy?=
 =?utf-8?B?REovdmRvcVVzSllHZmR5U0x3blp0RVFDb2VDV1MwU3k0UmxLc2xVMW05emc4?=
 =?utf-8?B?YlVIUlNuYzNnVW51OVZ5SmVjMlNaZFRIVkgrT3FycXNuazJkTFp3R0tyVGVx?=
 =?utf-8?B?b21McTFsZzVPbkFYZzlJSm9zSzgxczg4ZUg3Y3JPY3gySHJ4VWoxcW1yVWZG?=
 =?utf-8?B?cGhEVitKSjVaeXRPSDdqd0U0VGR1aEFuOFRPUVJkUlEreVRpS1d3MkVxTXhv?=
 =?utf-8?B?bWJvVWtXVlNaaFFiaGFEVXFqbkxTcTU3QTArM0NOV01LcWpiMzQ1UlRmOUYx?=
 =?utf-8?B?YU1aQjJab3hObSt3eHZzblJXTUZCRFNUdDMzMkNSTCs2SVE2T0pydmh5Uisw?=
 =?utf-8?B?eWsvTTlOL0JNM3J2MmtYdjhjZTVxZzlGWFlETm1zZTc2RFhLN2xZMHBGdDY0?=
 =?utf-8?B?c05OOEoyUXpCOFRvbXArSm04b084ZVFPd2tLbHNvS3NoaGNlcStkSTJaWEQ1?=
 =?utf-8?B?Mk96QUI0S05CcVA5Q0pydWM2VGI3UHVQR0pPK1FvRzZsR0dERjFxMTJZRG0y?=
 =?utf-8?B?dXRvaHU4b2djUVNSTG5BbyswSkJNZmMybHh0bDZCTTBOYmlRSHFVcUthRDBF?=
 =?utf-8?B?YmgyRVBTc2YrTGs1RlgyZEVIVTJqcGVNQkV6Zm8xTWtjV3ZLcFpoZG5YclF4?=
 =?utf-8?B?Y1NYdHltUkxCbTNEUVN3ZEYwWEFSR29pWFR3SHhDMGRUZlViQUtsMkg0SzJp?=
 =?utf-8?B?bGh0YUphc3g4YmZETCt5dzhuR2U5SVcwbjFTMnFmOU9pL2hQWlpnZ2l2MFJp?=
 =?utf-8?B?SGpXQUZqeUtjMG1QejlVWFBwQUpHRjdzcmlKeWIvWGRvK0FqWUdPNTBRZDBQ?=
 =?utf-8?B?RGRhaFdhcWoxd3lTeno1VktVekR6dlgrMCtuMi9YajB0aGZlaHR2akxueVZv?=
 =?utf-8?B?bWtVbHpqMUgzbnVPS3I1MWRXSmxRZVZ0eFVGbkhieFUrTTdzS0N3emdOTEdn?=
 =?utf-8?B?WnVxQ3M2ZjVNWjFJdGU2WTUybzBwd0hIbEpxNlZXT1I4cDZXa2VQZkl1MDh0?=
 =?utf-8?B?MUxod1B2MWk2VTE1eGNiVGZscHlDcTZReEV2TlF1NEFtbDlHcVVyUm9uVVJP?=
 =?utf-8?B?L1UrcUpiL2tlYmRWZXUzRU1hclA4ZmRVWE5BU1lSRmx2UVFxdDZkUTRIN2hL?=
 =?utf-8?B?OVVGdEJ5cEZUdmFUOGVtNk9zSXFaaERZK3JvbEpzWWllZCtzMS91dEs1eFFW?=
 =?utf-8?B?ZmwxQTRMczdMRndBYTdwUXVoWnloaHFmODVLa3FMQ0ZOUHpIK2h4d0FNbWZJ?=
 =?utf-8?B?SnV0VVFsSjI3Z0xYRzErTVZzUDg3RVVvcU12c0ZNekpYM3FqTVE2dzNvaW5Z?=
 =?utf-8?B?elFkQ3gvYkw4Mnc0SkJOYVFQb0NrZmsxdmFINGdIMWlZNnQ3bmVRMEpBTnM4?=
 =?utf-8?B?VHNIRXBkUzljR3ZHNnZKV3kwWDRoOWx1amxkU25temxvc0w0Qkc2amRJdUxF?=
 =?utf-8?B?bjhMNGgvbDhHYTZyMW1ETlZDSU5QMWxUcGlGajBYQ1M4S29XdGdkU3hkdDhw?=
 =?utf-8?B?YVFJeWpZcHloa1NMYVU2bVduMmltL1lmUlhORkNJenl4cFpVVzg3QStlYS9x?=
 =?utf-8?B?NHNabzVONUZsK21qakFrTUVIWFhqL1FaK1c5cGJnQ29abmNTTWxjQWV3UEVD?=
 =?utf-8?B?bWFXc0F6SklDT1pITVVsL2k2N2JXZWJMakNTc3pIUGNzYmt5bWlNQUlpSXla?=
 =?utf-8?B?UGQrd3pMc3c2NkJ0V3pQMzFnTjVhMjAxWk1raDVaUGRqYkZOSHF4dDV3QzNo?=
 =?utf-8?B?Q0JEbEdXRVkzbml2QTJYbGIrczh4b2E0VWhHTzYza0pnYzJwN2VPOWRYUzlS?=
 =?utf-8?B?dnJsb2xSYmpMeVlrOFlWRzdhajBDOWpCTEc4RStreHR3S1EwaDJnYk5kOUt6?=
 =?utf-8?B?aUZQeGprZ0xrVzM1dlZYTWR0aXk1STVLQWtVSmVMZzRFSVVwcWtnRWFyZktL?=
 =?utf-8?B?SW1pWTBLQVg4WDNiMGdEeE4wZkx0ck9Od3R4ZGM4RGNXVGMvV2hLMVR1Si9S?=
 =?utf-8?B?enBmZmJHbWRFRldUME1HN2Jvc1hJeW1NZ1M2VjZNSnpIL253RnhZaS9kWGdK?=
 =?utf-8?B?ZnExMDhXaDVQWkVWaTVTQWxMbXV5WVNpcDNXdkN3THVoMC8rQ2duejNTRWoz?=
 =?utf-8?B?aDcxZzd0b0dqQ0Njbk02WGhFeHJkcDU3dmczM3ZscFRmY21vdlI3RHpEai9r?=
 =?utf-8?B?Y0N5UTRYR2Q5MmVBQlQ0NFJtNWcvb3RTb0pEOFdTYjA5cjFoU2tiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9045AB198830584A992126051AE7ECE9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d134d2a6-4918-41f9-74fc-08de5277968d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 07:44:31.3361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlkc5RV+5H+Eyfxh3Bl/xFFuR74QO/P7S+rStFbLjFR0q3+Y1EcM4aF8nt+MDWqOTQGFq67FCpwfrP2xQGn0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7119
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_234439_318024_0A72B2CF 
X-CRM114-Status: GOOD (  29.99  )
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDA4OjE3ICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAwMToxNToyMVBN
ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+ID4gT24gVHVlLCBKYW4gMTMsIDIwMjYgYXQg
MTA6MTDigK9BTSBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPg0KPiA+IHdyb3RlOg0K
PiA+ID4gDQo+ID4gPiBUaGUgTVQ4MTg4IGRldmljZSB0cmVlIChEVFMpIGlzIGNvbmZpZ3VyZWQg
Zm9yIGR1YWwgY29yZSBTQ1AsIGFuZA0KPiA+ID4gdGhlDQo+ID4gPiBkcml2ZXIgYnkgZGVmYXVs
dCBhdHRlbXB0cyB0byBsb2FkICJzY3BfYzAuaW1nIiBhcyB0aGUgY29yZSAwDQo+ID4gPiBmaXJt
d2FyZS4NCj4gPiA+IFdpdGhvdXQgdGhpcyBzeW1saW5rLCB0aGUgZmlybXdhcmUgZmFpbHMgdG8g
bG9hZCBhbmQgdGhlDQo+ID4gPiBmb2xsb3dpbmcgZXJyb3INCj4gPiA+IGlzIG9ic2VydmVkOg0K
PiA+ID4gDQo+ID4gPiDCoCBbwqDCoCA3OS40OTQxMDVdIHJlbW90ZXByb2MgcmVtb3RlcHJvYzA6
IHBvd2VyaW5nIHVwIHNjcA0KPiA+ID4gwqAgW8KgwqAgNzkuNDk2MjE3XSByZW1vdGVwcm9jIHJl
bW90ZXByb2MwOiBCb290aW5nIGZ3IGltYWdlDQo+ID4gPiBtZWRpYXRlay9tdDgxODgvc2NwLmlt
Zywgc2l6ZSA2MzY1NDgNCj4gPiA+IMKgIFvCoMKgIDc5LjQ5NzI5OF0gcGxhdGZvcm0gMTA1MDAw
MDAuc2NwOiBJUEkgYnVmIGFkZHIgMHgwMDBmZmI0MA0KPiA+ID4gwqAgW8KgwqAgNzkuNDk4MDEz
XSBwbGF0Zm9ybSAxMDUwMDAwMC5zY3A6IElQSSBidWZmZXIgZG9lcyBub3QgZml0DQo+ID4gPiBp
biBTUkFNLg0KPiA+ID4gDQo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYSBzeW1saW5rICJzY3BfYzAu
aW1nIiBwb2ludGluZyB0byAic2NwLmltZyINCj4gPiA+IHVuZGVyDQo+ID4gPiBtZWRpdGVrL210
ODE4OC8gdG8gZW5zdXJlIHByb3BlciBmaXJtd2FyZSBsb2FkaW5nIGZvciBkdWFsIGNvcmUNCj4g
PiA+IFNDUC4NCj4gPiANCj4gPiBJdCBzaG91bGQgYmUgdGhlIG9wcG9zaXRlLiAic2NwX2MwLmlt
ZyIgaXMgdGhlIHByb3BlciBuYW1lIHVzZWQNCj4gPiB1cHN0cmVhbSwNCj4gPiAic2NwLmltZyIg
aXMgdGhlIG9sZCBuYW1lIHVzZWQgaW4gb2xkIERUQnMuDQo+ID4gDQo+ID4gU28geW91IHNob3Vs
ZCByZW5hbWUgInNjcC5pbWciIHRvICJzY3BfYzAuaW1nIiwgYW5kIHRoZW4gYWRkIGENCj4gPiBz
eW1saW5rDQo+ID4gInNjcC5pbWciIHBvaW50aW5nIHRvICJzY3BfYzAuaW1nIi4NCj4gDQo+IEFM
c28gcGxlYXNlIHVzZSB0aGUgTGluazogc3RyaW5nIGluc2lkZSBXSEVOQ0UgZmlsZSBpbnN0ZWFk
IG9mDQo+IGFjdHVhbGx5DQo+IGNyZWF0aW5nIGEgc3ltbGluay4NCj4gDQoNCkhpIENoZW4tWXUg
JiBEbWl0cnksDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9ucyEgSSdsbCBtYWtlIHRoZSBu
ZWNlc3NhcnkgY2hhbmdlcyBpbiB0aGUNCm5leHQgdmVyc2lvbi4NCg0KVGhhbmtzICYgUmVnYXJk
cywNCk1vdWR5DQoNCj4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5o
b0BtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbWVkaWF0ZWsvbXQ4MTg4L3NjcF9j
MC5pbWcgfCAxICsNCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4g
PiDCoGNyZWF0ZSBtb2RlIDEyMDAwMCBtZWRpYXRlay9tdDgxODgvc2NwX2MwLmltZw0KPiA+ID4g
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWVkaWF0ZWsvbXQ4MTg4L3NjcF9jMC5pbWcNCj4gPiA+IGIv
bWVkaWF0ZWsvbXQ4MTg4L3NjcF9jMC5pbWcNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTIwMDAwDQo+
ID4gPiBpbmRleCAwMDAwMDAwMC4uOGQxZGNkNGQNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+
ICsrKyBiL21lZGlhdGVrL210ODE4OC9zY3BfYzAuaW1nDQo+ID4gPiBAQCAtMCwwICsxIEBADQo+
ID4gPiArc2NwLmltZw0KPiA+ID4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+ID4gPiAt
LQ0KPiA+ID4gMi40NS4yDQo+ID4gPiANCj4gPiA+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdp
c2hlcw0KPiBEbWl0cnkNCg0K

