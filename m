Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056B606A32C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sY7bcCHN;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AWNS8Ex6;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=IW0ER0Gh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1pCgMy4TwuK/YYP+gfxzlRhIgQZsP4Pyfye3mcuBK0o=; b=sY7bcCHNTIfQI98piRVDTX2ZBT
	aFCvn2lc52wAJ1YwxgvLYrRMFqM0NOaPXSH+Z4Jk14MXm3dGhfM0P5sEoAFeHvMSX+FMOiTyXTw9n
	FLW9svOd7RQkfLJqJo+ohIWfTbE3S7XiXZ0RLJpEksbAhIwuz+JjNPjQLghBtXRVHChtcP633YQqP
	fkBdIWrCbqGSEkFYEQP+V5CnjfYQ32GSRUrVQuQSAnHew9DPVEKXZBYuIy1pA6o0+6JZEuxo8h53R
	h+oFYWIi6h+jq2W1o1CAhOAm6wfmeXHgW0/WsNM1lLYg9JmXDA0W4Gamd7R590dH38yf08865t/1q
	rJYNi/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWy3-0000000Cltl-4231;
	Thu, 26 Nov 2026 10:44:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWy0-0000000Clsz-2F8u;
	Thu, 26 Nov 2026 10:44:41 +0000
X-UUID: 5d1d7d72e98611f1a170bf5142e12a73-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1pCgMy4TwuK/YYP+gfxzlRhIgQZsP4Pyfye3mcuBK0o=;
	b=AWNS8Ex685QWBx07dJJvJltSANbJM/GfKTv/Yr214LhId+1CVsn5ZYMlb6zcv5WfF2nFXW3ZZZjc8+FFSbdoLHbbJJ5MJzjxvGvqk8dyVV9laidCM/iW0dYltXPA2lv7GGFinjKNv6GJdmrWa0RzBN7/UZxKJThATyBpNpiAjUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c0d9a9a8-4d8b-43b7-aaff-5cb309578d14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2202181a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|51|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5d1d7d72e98611f1a170bf5142e12a73-20261126
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1398214400; Thu, 26 Nov 2026 03:44:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 18:44:29 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 18:44:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWsPEmwwzDDOhCOXbF6f/Q7g1MKi8LoHjnDHuLWUDa0x72xMSWPqAgWTqz9QwnxNeffzfnOHKVvXBBflHRvB9j0pA0LKj5htxXp6ad0WcEgwVSpxHelkntby7YGQZm25nH1tPvgelbPnoFLVH5ab6jkGbSKUds3xDfU9AR+dch2JLgo9OsYPOBWY0a/x7ckKNesdjFXYyShxKhv/Z6vq791QqYRq9aZeK3C2UiBcWDunsjzIWMiaUhq2WgfbxevDupDwzCZW98Zlqs+vGGxWTfvYG4SZIqQREcsJ11OZbYxDW6e6GcUM6hYTE+QFt62PCYP3vq7bwCMqPwfsz4Bu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pCgMy4TwuK/YYP+gfxzlRhIgQZsP4Pyfye3mcuBK0o=;
 b=XRXM9XLvudsI6z2KKZJWf4FR/CegbxZCiH6ZFudQCIlseSelc445HjEJuUx7vorokLFKb1dfJpy+IU/vWZV3DBLc8Jmk/UpNaEGFrHW9JdUFlKTK00lsuM4uPvqg4fC7j0V7hFk0MT7+JIomeoaKx5ldmoS7gAdlvvS0JDWDHovd0wVbSvjIdX0t5ZxOi84CaUXS8RoOwyspfeq97+Ph8xtYv+dSPygIAcPg3fGO82WTfjg1/pnrINqVNZ9WAvUASWXX6TVxzpJefRIloRAX2spZTDzmJ3EeoWlbyFmeBMMzIQk5WSFwB6OclmCjc/1lIxklw0W1LO2X7GUZZZ4t+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pCgMy4TwuK/YYP+gfxzlRhIgQZsP4Pyfye3mcuBK0o=;
 b=IW0ER0GhL0h1UZzFxxvbpZF7OUCko33Inc0gf2dQ08UVIntgpCvyDS+C96DDX7PLkF4NiJFrR+2r4z3Sr7SA0yvTWrlmie7sY5AFmFRya3SViPzxN2RnIEhNZudIICaQUKgEROPduuRtR29dskqGY+OpU+Y6UOTI4dfsSaK0wnU=
Received: from TYSPR03MB9067.apcprd03.prod.outlook.com (2603:1096:405:bf::14)
 by KL1PR03MB7408.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 10:44:26 +0000
Received: from TYSPR03MB9067.apcprd03.prod.outlook.com
 ([fe80::e898:c669:3d82:ed4f]) by TYSPR03MB9067.apcprd03.prod.outlook.com
 ([fe80::e898:c669:3d82:ed4f%5]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 10:44:26 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?Q29uZ2NvbmcgWWFvICjlp5rogarogaop?=
	<Congcong.Yao@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?=
	<Friday.Yang@mediatek.com>
Subject: Re: [PATCH v13 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
Thread-Topic: [PATCH v13 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
Thread-Index: AQHdeJ7HLosctI1X9UyUok6FpsxwULdANPYA
Date: Thu, 26 Nov 2026 10:44:26 +0000
Message-ID: <f35c79f29c02007fe4f189e21f8ecece6ff715d8.camel@mediatek.com>
References: <20261120-8188-smi-clamp-reset-v13-0-9a9516e81c1d@mediatek.com>
	 <20261120-8188-smi-clamp-reset-v13-2-9a9516e81c1d@mediatek.com>
In-Reply-To: <20261120-8188-smi-clamp-reset-v13-2-9a9516e81c1d@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: TYSPR03MB9067:EE_|KL1PR03MB7408:EE_
x-ms-publictraffictype: Email
client-request-id: 0232330c-503b-4188-a715-4f01d9365a2d
request-id: 8639f0be-0ef7-4e6e-2afc-08df4baa3ddb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|261022115727099003|10067099003|261022075727099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 85kKwVLg/rSq/yXKz7dlmxcPBj/N/E9Hk3XcYQdfej3RDdWQitEt0jj05A451Eh56WaYquR+7wgsEA0AkBoUU5UCqByTF2EVou2eAAzW1AsrsMGBkNalgFPUWR3aQ6FzcRgcBn/J/OQotONQr6ZImOFVKzGtvRRk+Hv7H3vIb+M9DTGMZwAeAheDPRO17ZXILBuE2OYvRE37jACe74pCvN/lodrGucoBZjZ+8vdbaEU3exzbndMGYE36d6+9X3vyxT/vm3eis/1IxobC3z6fcIsWcytuMuHZGdaFNZw//7jIoZaqhEROLaAdc6t2836nWSNsZSZItB4YhRMDtAqVdEW15kpb3ET7YL7K3wk+JrXtbiZUDKWeQbuGINjEf+3BC//reVI25aF2LxZXNUA7jnPSl5GPcrtlm5Shz8vE0qbZ0OSc7ZGP4ZUUKLtdDRETRHSRU2K1cwmFH9Mhnou4IA5nsnetzBnBRW1ee/e8cQm44o5gIvotSTSaDZYn8v76zaoC1eDcupPtR7dAW3t/+x0dZwzDu9jJH9RjIpaUNmcNY4ixb0KgSpPtvrKiNy9BFedocjCv0qli24M232oxobfHGkUuCgmjKQo1IQKQqgxc39W1Sk1RqlIi0CRo1KV5vwu52HCn/8MxkV5NcbYy12vWQL0eu2AylfdEraIwr0I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(261022115727099003)(10067099003)(261022075727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1hGOTAzQ2ZvWlhhWkpYU3BrUmIwT252d3RmUFZ4S1Myek5KYWx2UHdmTGl2?=
 =?utf-8?B?M3ZGQ0pDbzRPUnd5U2NDaVF4R09Iekp6ZWY1ZVZGQlY0UjRyN1NheG5ReEpV?=
 =?utf-8?B?Z2FrZTl4am9XRlQ1Wms5Z2JvT3NyRUNKcUE3ZjdONEtiUEpuSGFYbVJ4SnpC?=
 =?utf-8?B?aEthWkQwRmx5NTRBRG9QeTd1bWxkU21TR0I4c3crZlhxV1NZaTVGOUpBRFgy?=
 =?utf-8?B?aWhWMmFjbWkvR245NEE4M2xxRmlYeDdZK0M1b2prRlpQZ05keVZhSy8zYzhQ?=
 =?utf-8?B?b3BsU3l1YlNuSkYvVjQ4cm83THBpMDNNeHJXbFU0UFVwUVl2dGtaNlJaaHZs?=
 =?utf-8?B?ZmxwNHB3L0RJSVVOUXRuQmdTSS96OVl3MnlCRE16NHhGWXNLL2l3RXdHc0Jz?=
 =?utf-8?B?em9kTFJlc3BSWkF5a3Npa0l3SGxiKzFWWEVtN0FRUVNLT2lsd25PMjh1a1lr?=
 =?utf-8?B?VlhtTDdoajNzYmgzZm5mVEprbWMwaW5uaTVkT0tZZHhSTkt6YitINEo5MG5r?=
 =?utf-8?B?Nk1SUkRDb0NKemZkZy9CU1dTWXJNU1dBWkszNVNScFR2b0dnZTNwUTBzR0dz?=
 =?utf-8?B?ZFVUQWpsU1Y3bGMxRU9qK2pIZWR3WDhDZkNPMDRnenNBbU1TZDViT2txcFdU?=
 =?utf-8?B?MkdiVzAvOGNlY29DQ0Y5Ym5GNFNFdXN4dXg0ZUlUS1NSWUx2Wk9mcEVmRXNn?=
 =?utf-8?B?cmRzWHRZcm5Hc3FObDdaZTB6bE0zMW5ENzRUcCtPZ2EyNTNxVmJMM2oxaTJX?=
 =?utf-8?B?TzlGTHpab2ZHanFrYXRSSlZKdkZBUzY1ck4yQjRIVnRtNngzQU5qem15U09z?=
 =?utf-8?B?aTUramo4TFJ2b0tyMzZYT3prS3ZlWDZST0N0TjN2ejJPQXhnQnd2ejVBYU91?=
 =?utf-8?B?YjVrWmV2UDAxQ1ptNGVISDAySUlTVHNhMm9reTNqdHQ2bHQyZXlnWEhua25u?=
 =?utf-8?B?cmhJVjF3c2p4aEhNTzNPVmRNSGJMN3crWnMrL1dGMEgvNU13MVNCUkRLWmlR?=
 =?utf-8?B?TzA4azBnNDhMSDJSZ25xbWliZzg5TFBqU2lNWHlqSmh4eUNhV3pTSWNYRnRW?=
 =?utf-8?B?UW1FQXBUSHAzSUI2U29uNVpoZEpRTXdzb0UvRXhJaTlYS0NaQ2U0eUowOVVT?=
 =?utf-8?B?dU5Cclh1WXc5ZXoxUmZpZnkvRVlLSTV0TVpwa0Q5eHdHM1FlcnlIeU1neVlC?=
 =?utf-8?B?bWdBQm5IcVh5cXYxNkMvWDJraWxSQm9vVW1WdjFRQ2crNFF1d3NjdDE0RGY5?=
 =?utf-8?B?aDc2QTJJb0JTSGo0RXpoaVhwTkpBeElMaGdEckIwZjUwQ201ZWZqUXNpSWVX?=
 =?utf-8?B?UU1FbkZPUk45WnRsS293c1hGUnQ3VE5tN0RUb1lLaGFOSEw3ZXVPYjZpako3?=
 =?utf-8?B?emtqdC9qVjNaQTU0S0lybnltTnIyYTI3WklTOEcwSWsveGt2N0Fac01BREhG?=
 =?utf-8?B?MFJTU1hSSXRpQURWRXo3Zmx1L0tTVHNPUnRob0NQSERQQmY3ZU45ZmwxY0xo?=
 =?utf-8?B?am51cStsdlRRWU5vRnFxUVpLUW9IR1A0NDYzNVRnYnlLVjBnUUQ0STFjYnht?=
 =?utf-8?B?SFJycXUzL1pnaVJFN09TdzNYNjJKNGE5Yi9ySXd6dHJHVUVmV0dRUUFxRS96?=
 =?utf-8?B?UDM4dDNXWGhZQW9OeHpnL3VmU0YwdUR1alM2TmpZZ1BrWU00OCtiaTNwMDR3?=
 =?utf-8?B?TzNiU0d0LzJQNE1TdThhODM0MUZWc0VZUS9pbGFheHYwOUw2cEUzVUNRUGt1?=
 =?utf-8?B?cDVLU0NKM0JIVG1nUlJPRTJhOXpkK3RJbmE3a3NubkpkN2lrNHgvUHE2WmlO?=
 =?utf-8?B?QlRqRkFjb01hU05VOFNpU1hwT3JLTUFJWVozOTVmckdaNk5rbFhsQmxhdVFa?=
 =?utf-8?B?OVU5L2ZxTGttSFd4TUlvWHMwR2M4dFBxVm5XZUZpLzk5WUlPZURFTXc1LzdV?=
 =?utf-8?B?M3Z4VnFla0hxRUhXUDdteTc1bUtPZUpORk1CYlUvWnBNQkVxbzJJRTN6YmVB?=
 =?utf-8?B?a2cxNStXaENHblpWVmVYSFlROFZ4Q1VOUm1wc1FCU1lTV0kySlFkU3A4b1NR?=
 =?utf-8?B?UjlKcXpNN2JyMCtRM1pjQmdUQ2x0NEZpUGUrejRRb3BlRm5hRmhKd3FQUk1p?=
 =?utf-8?B?UE9NRWp6WjFMT0ppUTFoU3graHBxTE5LMzQ4YTRPY0w5bTdpN2ttbUY4bGQ2?=
 =?utf-8?B?MVBSOTQ1dm5hSXVqb2RHUlIveFR2QkJwenZKUis2OWI0eWR5ZkJEUW9QOWZ3?=
 =?utf-8?B?U21BV0RWS0t4VEhtQ1AwRmZNaG9kWlhTblRRRTd4bFNOQnA1UDl4dFhpWUxD?=
 =?utf-8?B?bUh1WUkweTZzVEhjdU1BSlBBald1VEdMdXZqQlFuRGlGc1o5MVI0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <546E0B2163BEF9479120F90855C8B58B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XhA3xKTgrPQ2ylVHavpzGZp43eKtLZGu8MAdgeY6truSA8r3NmXhQg9QrOJqu6RaE5LbhrEp9ATD2PdhVC2qOjkCeWnAjXbFL4bmQTd7yK1+HUDwd7Ne8rM0Sa3KnmD7VYwzEqlBdTdxd0zCbQ8LAoJgmxtBnapNJ9R9d8DUkT0G9iANY+iyuSIBO6TqZ/H7cpFgONQiVTGStClyBLM9ZiU4jwGlVvm/oT9+oE8MLar+yzMqqlTo6aV4chrSaxJpR3QMQlV76zFmv+m9e+HPSz5CRxMb8xK0EjGpI3fQjrDbbDws8Fttskn3djTwoBseH53byze0i6kq+A7Bjmg1AQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB9067.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8639f0be-0ef7-4e6e-2afc-08df4baa3ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 10:44:26.3455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ej1AaHRWWVd0vdWbWOrzZ/NoLvZTHKI3jUV+dDohPJx5LWGNyVmBuDLT+dAb+JyACI1gDJrUCJWVc7RrYh0REQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7408
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_024440_589506_5BF91E82 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24g5LqULCAyMDI2LTExLTIwIGF0IDExOjI0ICswODAwLCBDb25nY29uZyBZYW8gdmlhIEI0IFJl
bGF5IHdyb3RlOg0KPiBGcm9tOiBGcmlkYXkgWWFuZyA8ZnJpZGF5LnlhbmdAbWVkaWF0ZWsuY29t
Pg0KPiANCj4gVG8gcHJldmVudCBoYW5kbGluZyBnbGl0Y2ggc2lnbmFscyBkdXJpbmcgTVRDTU9T
IG9uL29mZiB0cmFuc2l0aW9ucywNCj4gU01JIHJlcXVpcmVzIGNsYW1wIGFuZCByZXNldCBvcGVy
YXRpb25zLiBQYXJzZSB0aGUgcmVzZXQgc2V0dGluZ3MgZm9yDQo+IFNNSSBMQVJCcyBhbmQgdGhl
IGNsYW1wIHNldHRpbmdzIGZvciB0aGUgU01JIFN1Yi1Db21tb24uIFJlZ2lzdGVyDQo+IGdlbnBk
IGNhbGxiYWNrIGZvciB0aGUgU01JIExBUkJzIGxvY2F0ZWQgaW4gaW1hZ2UsIGNhbWVyYSBhbmQg
SVBFDQo+IHN1YnN5c3RlbXMsIGFuZCBhcHBseSByZXNldCBhbmQgY2xhbXAgb3BlcmF0aW9ucyB3
aXRoaW4gdGhlIGNhbGxiYWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJpZGF5IFlhbmcgPGZy
aWRheS55YW5nQG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ29uZ2NvbmcgWWFvIDxj
b25nY29uZy55YW9AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL21lbW9yeS9tdGst
c21pLmMgfCAxMjANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCg0KDQpSZXZpZXdlZC1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo=

