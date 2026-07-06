Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F76C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVg78EeZjN8MfpVxDte/HuIGEDhgRot4ZyV1aiYeNGc=; b=QF5J6Hy0oYbdGdgMFecjdCZfgq
	EIn9FFsY7wcE8JuV6ksdxAIasw7b0Hq15yTwuqS+7UfC9SUFWBH7M6QYrudxoe683JNEDycBUzz01
	Ei1Z1K82kbE7Y8qJpydk5R5m0/cc5yo7TMZTARsHabao1WT2EXsVVFQEDnRd03X4b+XwO6rPkMm5+
	IMjH4/218zoAG+bylnoU5+A0JpHweN6khrSx+nTugzjkjCp8spyx/RgEhnq8rT9il0qgAIe+ZCw70
	GuY/z0DUqmsRY8zRb/sIo3UrRj3tdAhZvr5SlD6nFEpiyPSwWWrTSYw7tefNWKDFQOIHZfItX3Hlc
	f0Raru4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiq3-0000000CVdd-1IdG;
	Mon, 06 Jul 2026 12:54:22 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgipg-0000000CVcl-2R8j
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 12:54:17 +0000
X-UUID: ba674eb2793911f1acbe4559397dec65-20260706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TVg78EeZjN8MfpVxDte/HuIGEDhgRot4ZyV1aiYeNGc=;
	b=Zu66/uM273MbdQKs7wytSFBbzYx3oUq3qQA+ZYb7EjtQQRKxx9PayTrp2Tj7H9NVO3JLHQfXDoA6UOcBfXBmqvowGm8SVlu0K3zX7Hyh7djtgIqiJ+R3eHGrBa7irTDflAj/+mBWDyO5elvfHssbcYegkU6xtBpgvsEOTxaf1ZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:73955ef0-2b8f-4cd7-936d-746e5f642dd4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:1264ce14-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ba674eb2793911f1acbe4559397dec65-20260706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 799658326; Mon, 06 Jul 2026 05:53:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 6 Jul 2026 20:53:44 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 6 Jul 2026 20:53:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lV8WjLGmOaAuge7pZtLubFg1tMRM/PfdEucKQ6knPBebgM9SQF4cN+m9jkpi0Yf4xtkBFHXigCZ30vQaEpmt+PmWSRyNnP3pqkoD7TC4jWXd8jqJNArtV6fwtYL/7u1Om56b/BAEwjLSTYTxEGOno3kvBS0cXRLvbZZ6E7GD1A6/dUbMyVvUp2uBXzlQKd4/TDt+BXYMwP/W6jN/ufKKkZad2nzd8hw1i1Xmv9rxi4fsC5CxfuU6t3n7HIA8BvmDYM3s58j+zOSral++1SwgAiu1kZwpDGIPhC37J4o8o+WjSCYUkaQ0hmx0skL6nbdzN1Bc8G0z4JZwgQrxIs1MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVg78EeZjN8MfpVxDte/HuIGEDhgRot4ZyV1aiYeNGc=;
 b=X6Ac6tqiyVQXGVL2WZb2hcs4I47E4R9zpPx6GAtw+SZD4GBLggfCj2jBihO3CIdQo7eUmie5CuxHtoHoY+/PvGS1Z9UE4MHD7EDh9BzFoWPsjW/lneCCdUDCl2GUKVuGXA318f2xiANywfX4xl2ocIRwhyZ0R9Cz1UhlaGXbgFOjBSOoNcrpk6gn4r9GDlbp4Os0Ux8QYssCcxJtB7lNz4+mupWl0U7TW/Y04/lYsScrwacZMNYqUtYMPnp593qXSG0PNwS/N2e4U2mlK40a9caF1jB/nJSIo4NjY9TaihDeS8NxNPo9U2Ec0z85SEksPsOkCBPStLvsTRCjSErAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVg78EeZjN8MfpVxDte/HuIGEDhgRot4ZyV1aiYeNGc=;
 b=WuyUomQ97QAB8J0G0pMs1yfNHrhiK9VEfRa4jQbrjW+YNVgZB5+foTROXsR2/WdjtlusOrpEQ7sB2oZCWCo0n3TQUjbunL8uhYqmNxg9x69HVXfacMwgWuyglr4qLNl9c+APKV6pRC3sWi8bEazJ+RTiz7IDE7XgwcVH/pqD5Po=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by OSQPR03MB8716.apcprd03.prod.outlook.com (2603:1096:604:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 12:53:42 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:53:41 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, "linux-devicetree@vger.kernel.org"
	<linux-devicetree@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Topic: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Index: AQHdBUBFkhMTBcaOR0CLIaZtsVPeSrZQgmIAgAe6r4CAA1MYAIAE8kYA
Date: Mon, 6 Jul 2026 12:53:41 +0000
Message-ID: <3eafef7301053ff0eafc8745708b6bae221b0d8e.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
	 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
	 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
	 <0fad41a4d09d5d6e5709e66662fbc39b5a75fee9.camel@pengutronix.de>
In-Reply-To: <0fad41a4d09d5d6e5709e66662fbc39b5a75fee9.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|OSQPR03MB8716:EE_
x-ms-office365-filtering-correlation-id: 382f7561-de63-47ad-5f6e-08dedb5d9b3a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|5023799004|56012099006|11063799006|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: SSbOAF7oGxIeE4b8nN1yYZfsncb2MtTPT60zcNlF5+ZdJQMiP//aHkGTjaligOQdK1XNYF450ODZWVypv8IFKgvLZnNOY1Huzjb9122FxKO/ahsqOPxSQ0gyjnCKPU5dKv/GCnLEZJg8MRDT+lDmNZJeISa0RHryjSf1q/ia2vqxriola9TGlGOdHm0zDWVnD4LpZysBG7LP+gslMcAo4xphU4D4XIrCHdVczqy7wsJp50z5JE/p/c9HBqrUFStllVFMZHH6koSlx7MEXu7wPGdH7Q7BztCtUAWKsHaVkIb/xX+9QB/CVv1ebkAuSdTjLUicLWeUqgorpbGa7UqxKA0Qmw2FjG3JgxyXMN/AXIGNx++CixUDaw5+E9IY1WiqahDemX3VuTLN1Y7esixUvHt3OJTIdbB+r95MBxmHUBYpsaKNimXbkLWaUmxBElnccXz593zYeyNTiF8TUQo88zxDqF3aWpgtVMzM/1GgYaABGSiytDEHqe26q4BuENmN+r9jaijiY5mva6BvYkuzQFqTlSXtTkYH+mkgmYG80nx49Bw/JbWjWxSgEkPkZch5uGUX3jhEltcbc6sVdHr2fdBYAPEVHGeK6R+47DyIxJWpc5QH9xL4nE40IMt71OOT3HmyqHkmWGUQizRnrZjv7Pupc+vliVm1fJS63MwY7GZumvYdSVGTdYQJRQjGal01NJsY4Xy5kO+XsumIHMVT1+D75PORUs1FFrWOXlwQ8zI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(5023799004)(56012099006)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1o1WURJR01oR05uY09GVTA2RnFEMFZBbzl6RUZ6UEZLQVlxWXJuckQrbmRm?=
 =?utf-8?B?bWhsMnRocnJ1aXh2dkdjWTRiSU41RGtNSWlHdnIwdXpobFVxdVFlR3JpR3ZH?=
 =?utf-8?B?eVpGcHpzMFZEY0JZQXBudkgwV0FJQmVwcVlUakxZRHd2RGtLZkxLRXE3SzNW?=
 =?utf-8?B?ZlB1c0xKcGkwUWM0Ymtid3Vsc3N6NzhsVy9UbWNMdG9hM3JJSVI5RFAyT0Nz?=
 =?utf-8?B?ZFhqOW1OaHRSNk93TmpGM0NTVlE4SHZCU2gxSjlrRXFjSnhNdldmWDNvN25V?=
 =?utf-8?B?TzBCRkJuQm4xWm9sY2djYUZSUnNUaU9xTXZVRHY3WlZxUW1WV2Y3OTBkRHFm?=
 =?utf-8?B?TFhRTFkyOFdxR1p6SzhtS1YrNmZMdkhjcFdONHhwdTFoREZqNzRWS1JMWGlQ?=
 =?utf-8?B?ZGt6R3FWbTJhV2U3bWxXNy9reWluR1ZUZmp6REF4MHM1Nm1uM3dYRmNGcnlx?=
 =?utf-8?B?SlV3RUpHV0VDbmFYdHNJUDV3VzBrVS9SMGtxemZ4YXl1czZib2JEdlloQW5a?=
 =?utf-8?B?WFhCd09FREtoek1KdmVqTUp1NFNsUTVMRE9kM2xlalZUZ3NIamFuS0RMNmdD?=
 =?utf-8?B?SSthNU9hUjlVUU4zaW9OR05lczk0REF5UTYyVk9lYlpucUFzc0JiVUJQNTFa?=
 =?utf-8?B?Q0RxN05iZTFwSVF0dXh5WVIyWUpxOUZkeTVKNnU0YmUwYjArYkZlSXlZWWlv?=
 =?utf-8?B?SGtzVWlnNEkxRHRyVUxVRThhN29pa3JNOElqZllWaVNVZUs0d3dHaGZmQXRy?=
 =?utf-8?B?R1Z2TGhxK21ycHNjRmozME1rYVptK0JwWEt5dXRYRVlESmJzWGkxcDV1TGZi?=
 =?utf-8?B?SlB4a2RTMkxKN0M1NDFNU1RwVmEwMEdUM1lIQkdNT2dLSjNaT1g4OExsUmhn?=
 =?utf-8?B?YVlHcjZjWmV1Rmk4WTY2YU52T00wMU9VL25iZnhSMzV5K0prb1pSSFNlRERx?=
 =?utf-8?B?MlVES0hDZEZZeDJkcm8wZTVaR3JXSmtwR01BUnA1Y1V1Y25JajZWYm9rV3Bt?=
 =?utf-8?B?NHJoWDJNb2hadkFBWmFIMWdkZTNsdXRWSnZoeHV6dHpWMVNqeGlkV3VJUzVT?=
 =?utf-8?B?L3FuanloWGFpS3hGYzZyVG4yNkJ4UnMxVWk3aGNJdGhqTnBCWDQxWndVeng4?=
 =?utf-8?B?MmpaMUk4NFJVZ2hGZHp6Y0pIZEc3Ylc3KzU5cHdZTGtKaThMOWJkNHJnVjNF?=
 =?utf-8?B?d1BJSnFiTnUvTU9GR1RuTTlKZ1kxUzA2dUtEYTJjTGxsek40UkRBOElsUTlT?=
 =?utf-8?B?cWxXNFJvelRrSzdqYmUxTmkrQVNaZjR0K3FldkU1MHU1VXNWVVYwZHlIbTZE?=
 =?utf-8?B?MmsxbmpuSzhYRTAvZ0VodFNhbHNlOVdXcnVEYlFiT2dsTVl0ejNNQm1Lcy9F?=
 =?utf-8?B?MXNza1ZMaTN2VzhYNmFGd0FQcjN0NEFGamFwSmdoYU9JMGgrbElCcHJ0ZW9h?=
 =?utf-8?B?TzdrVHgzeTByRFlKUGdWUGpDeFozdVQ4aEUvTmltdGtPTU1ScnlXYllvRTZz?=
 =?utf-8?B?R3dwclk5WFU4M2FYYnBCT2tEZzhnOFVkeTZDWVUzODZucmlLK0VQcjVJdm04?=
 =?utf-8?B?K3JPd2JHaTJFVlZTdmxsV2NvZWZFRStpVkFpVDg2Yy9zT3NKdzdHSk9WQlNa?=
 =?utf-8?B?bXJ1MFY5U2RTc0hBREV2dFU3Tmx5eGNSZktBYmpqSUE5MDc2VE9CUXFmNEQr?=
 =?utf-8?B?bGlnWGwrVnVjN3VqNjZjZDFTMVFRamRSUXgxdDdic2h3NG5LdytTb3ZBU3hi?=
 =?utf-8?B?K1VnN2JMSFNBNUV5MVJMM1N5K3FQNGV2VmZJQ0Y0OG9hNSszOHlPWGhMQVlZ?=
 =?utf-8?B?QWhjTEl6ampHZ05USjY5REwyRHhTRjBucnZlTExtR0RZSnhGOUxYZjcreWlj?=
 =?utf-8?B?UG4waHZEeE5jbUdzU1ZyTVA4elpnZDJ4VkY5NWYrSThNQXBWeVVxOUt1QTBI?=
 =?utf-8?B?RktvN2FIQ3dWSFdiMmVIMk5Qci94WElENWI5R1czZktGbzVlQWRCV3FUWkEz?=
 =?utf-8?B?Qk5OZG9YbDc2ZEZrcjN6UzdwcWZLNU5vUDdaMU9OUzZZWmhsTnhTWmlpdGl1?=
 =?utf-8?B?ZjBacEZlNGxOaEdpOXRlVkd0WFlkcmRrMkd1TEZGejVzVVY5SUhDRVRCcnda?=
 =?utf-8?B?T21XNTQ0L3p3QTN2OWJ2bmdUMWVLOGFEOWJjeWd6OWk3L2txWFNKUzlhZGht?=
 =?utf-8?B?bG5GS0ovUTVpVDUwZ1RrMjBrQVRCNUx2MGlROHZZVUVaN3ZET3Fod2xIVEY2?=
 =?utf-8?B?RE5GSEh1VjZ1YlF4WTlEUWNJMVdVQzZ4YWc3WDA0ajhzQTRsMWErSjV3TnJl?=
 =?utf-8?B?MWtEejl0blpNdzcxR0pzWVVIdWQxdXk3SGR4cTNIS0JQOXl0WXRRMUUrVDg3?=
 =?utf-8?Q?KZV0VhKbLAYvLHBw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AD341463AF8A74993BF672986A76ED0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qKYz75bIcJI3ZzjkTSs6F/7WNNUAUEqA95FaA61dJwYslZtgyfFFBm1PKFNLmR3t6wnK691tq7FrzI3N28qgfGIolJJa2JCSWmqwLU2+w7BH0mzzKNZbXTFWRSt0x2XXM5BD0i19GK3IYp7QoxlYm4vFyU38Td0R+CsGXmKFW6Xcf3wo+mjz7htDtXdr7dBBnYwjzXD/AGkHrqiY/Wv9RcFV4V2wMh2Tj8c4a305ZEqddc6t9C3Nf4DV07RDN/4tk/Qi5cKkej4BwW53uml5U/RNGonTv/a46J+/BBhsBewTbQM6SKh6F9AmGgY8qPKt7YN4d1Fa3DZD7Ki1HbJEwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382f7561-de63-47ad-5f6e-08dedb5d9b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 12:53:41.5453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OjHk9c2j/Eu72Dl5odX2emyFrom/Ov8TBstH5Kg3Gme7Z6MXUWVm6QcMwORuPwUkO0HxD5jd6gvYvhajRz56kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8716
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_055356_642985_8569B0C8 
X-CRM114-Status: GOOD (  12.48  )
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

T24gRnJpLCAyMDI2LTA3LTAzIGF0IDExOjIxICswMjAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOg0K
PiBBbHNvIHRoZSBpZGVhIHdhcyB0aGF0IHRoaXMgd2FzIGdlbmVyaWMgZW5vdWdoIHRvIGJlIHJl
dXNlZCBmb3IgYSBsb3QNCj4gb2YgU29Dcy4gVGhhdCBkaWRuJ3QgaGFwcGVuIGVpdGhlci4NCg0K
SGkgUGhpbGlwcCwNCg0KWWVzLCBpdCBpcyBnZW5lcmljIGVub3VnaCB0byBiZSByZXVzZWQgYWNy
b3NzIG1hbnkgU29Dcy4NCk1lZGlhVGVrIHByZXZpb3VzbHkgdXNlZCB0aGF0IGFwcHJvYWNoLCBi
dXQgd2FzIHRvbGQgaXQgd2FzIG5vdA0KYWNjZXB0YWJsZS4gSSB0aGluayB0aGF0IGlzIHdoeSBp
dCBkaWQgbm90IGhhcHBlbi4NCkkgYW0gYWxzbyBjdXJpb3VzIHdoeSBoaTM3OThjdjIwMC5kdHNp
I0wxMzQgaXMgYWxsb3dlZCB0byB1c2UgDQp0aGlzIG1ldGhvZD8gDQoNCj4gDQo+IEknZCBwcmVm
ZXIgaWYgeW91IGNvdWxkIGp1c3QgZW51bWVyYXRlIHlvdXIgcmVzZXRzIGFuZCB1c2UgdGhlIGlk
cyBhcw0KPiBhbiBpbmRpY2VzIGludG8gYXJyYXlzIGluIHRoZSBkcml2ZXIuDQo+IA0KPiByZWdh
cmRzDQo+IFBoaWxpcHANCg0KVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uDQpJIHdpbGwg
aG9sZCBvZmYgb24gdGhpcyBwYXRjaCBmb3Igbm93IGFuZCBmb2xsb3cgeW91ciByZWNvbW1lbmRh
dGlvbi4NCg0KVGhhbmtzDQpQZXRlcg0K

