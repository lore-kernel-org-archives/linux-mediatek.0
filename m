Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB574C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEKi9EIk06oHjP1vAFKX1Hipu9SFYlYMnHJA1GntF8M=; b=ovS+GXgoJmLH9O345NV+2iA0+6
	8RxwdGC9nuXQ/l9gt4ASD6fXwe4lW5hsyCjrXhQzctKizFC82/lNM8vnJwkkyXKoN2TU6ZkKuIrHG
	J3BYcGnGFYiuIi0+d1I0OCZ1tg9TLPW6MR7HlOKJpj4qYxBDphowiqwWWWO9ONyVhZSd3+lj76txh
	ADwliAY3H5kk5+sVNeCh9bFqEpGMXgjRPlsEzW0NhXEyQwoIoiveRHs/1RhZG6toNIdKoQqo+Mvsp
	jfsrficib9DefmzcqPU0lQy7lbuRc1Xn4loTY6rIDEoSH1cuvZLMb9/yqs1MNbMUOcSPae54Am7W/
	wEf3DsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDAV-00000003vGa-2xgk;
	Thu, 02 Jul 2026 08:53:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDAT-00000003vGB-3Oro
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 08:53:10 +0000
X-UUID: 6ea8a3ca75f311f1afed4741b24580c9-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oEKi9EIk06oHjP1vAFKX1Hipu9SFYlYMnHJA1GntF8M=;
	b=K8b8HOnUUnx1xSpVPM8JGleHmpNett3+XlewhLZgyKvjuSlKrgEoeAH6UCojlBnXLFrvQBY6EnROLCtJcCcnhj7sIGes08XoIBs6fEDn26AcjKH0jBG0hi817rNjl/uw2cjdOfKRjetZGJehhGOpfSXZQbMbgl/uyH2GV37Vq9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:640c1e36-607f-4412-bf1d-c9b0ada003a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:6b62b5c4-4062-4a8f-9776-acbccc936972,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ea8a3ca75f311f1afed4741b24580c9-20260702
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1196124305; Thu, 02 Jul 2026 01:53:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 16:52:59 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 16:52:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddDLpJ+e929hnBD0uFYrNWE3i703GJAfcmjxtZBmIJJlXyWUBkE40kjEEWFqco0mgJA+TMnpdXKWAK4lhXCaB/qUnQ8/IfDyK9mJ0RzUV6K6mQ4ZoSsPQU04Zmc+bM6WkysIKmw+9o1ulRijffCMAH6hZw0JtnuyOrueHnGPK4jXVDbnQ7kHOea/NjNc4AqcyJ1djLjHxXaXxc+v29e1anVO42ePRdZ+0/edj0myBFx89KD14EqRAr7hrST2+GFUM0Mt8afDP8SuhgTMxi+uPhrEmqr7IEIVCi936GFrI70PkQa4TvXY1D8qzwGCiDvf2LKVU4PY49G/tEYxksHmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEKi9EIk06oHjP1vAFKX1Hipu9SFYlYMnHJA1GntF8M=;
 b=kPVR0YiuTTKVbXTRVbqNrZ0aJYv7S58zDiiPSqZiKxht+hGXCk5gUrzCU87VdEUlHnECafyEwON/3Y+N0/4+XJOF4VRnj64GqbJSkrYvO+8ce+jNnXM4fPUWLcVT9bmcAJIpDraQFkA9ujU6Un7vcft02yYNtrx2tL3uq00xd5vhpDj1jVn9tPBBpHdqz0+5VhtJ0Euo034lXvzIXd/09BvG5OTG8o6bgvosNUsjsd3qS2EkRjv/3K/p+TibFbKb9lhz4cdZX8GHQIlrrdBCXhAefc+FDuql5o4W+ZwvnOB+c7hEqo2htTXCZmoC/oUSlz9EVDnydXKLhJEC5I8ASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEKi9EIk06oHjP1vAFKX1Hipu9SFYlYMnHJA1GntF8M=;
 b=kjW2bPoDXpmBHKABKI9ByllniOir1zt/DJy4zBeOr0WnECZilYsQIVk/w8ovkGcLFPOHuBKsvlVk3pNLLwpvKbrhwnLW3DEwOaQ8+rlmZfrnrgq+FwH2awlUodXdrK446T7WA41FYAFWR6WEn5VmCbRQmhsY6pxR4ATLREXnF4s=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB8215.apcprd03.prod.outlook.com (2603:1096:405:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 08:52:53 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 08:52:53 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-devicetree@vger.kernel.org" <linux-devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Topic: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Index: AQHdBUBFkhMTBcaOR0CLIaZtsVPeSrZQgmIAgAe6r4CAAK2yAIABCxEA
Date: Thu, 2 Jul 2026 08:52:53 +0000
Message-ID: <4fedff0acaa249f4ce1e874f7f791d8cbe52556b.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
	 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
	 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
	 <20260701-city-during-7d76a326f2f4@spud>
In-Reply-To: <20260701-city-during-7d76a326f2f4@spud>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB8215:EE_
x-ms-office365-filtering-correlation-id: b137b1e3-06ed-4ab1-25b4-08ded8174db7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|18002099003|22082099003|8126099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: SvchlDjBxyrG4fDKVrQCZIW8l7BTPNYenyUxooik1iU3TKumZJQsoYwZwmbuXRkqyA4HkZSaeAbCjXY2WHrcTbow6NKz3o+s0RrD+7Sx/1Pr4e88lpYHJnqpQ+i8zEXuna8Vqyo9ahFU3oxDLkVEnS4YrE6goGOO8viO3zNp9D/1adIu6eezdP+HZYSwbzS2QPE+BDDNDBZMy6CGOYK/7ip/KLP6EUw2kogOE4+nh8Qg5nacm52xLIkbIRxpa1FXXGUkLnx895/pBAuV9wpvI9TGkZ7Sk6xABtzoBcN1vpyNwowTCu72VJHUwacJjPP9k7jhG9Zw0xIQYb8kqXhybo1XhGvMQdlco4py758AcXYUyWJZCg9JhGxKGjGJlJ7Vi6hETXY16w4VG1VGIuYUL4Gp3LYVlJJcCPtzPW/6d86r0TkCVf/3D6CMxw4kjj6TQCAF87E10OfPYUBdFiDz17RSg6fxh6t8pHq7qObYcqMtzI9ZJ+9w0r7Ft0/iWfTnbxt/Qd6F9APK2Br+tRl6wCkjKNJ9YNhBC9rHe1oxbAuLJKP0XoqqXAZi2XnCilkYUYK/V0KrK1Wq+Lp11INPSPfdwTzUzqnpSliJt6rLCwJh7va9F0bqXfc9SD59iSgaUxnErQeWEkjy596bQEhBwj5zY4BmE88jNAvSuMbsowzKbrL2OC2RN9pUz+BJXhcEFrXsWC9H+7Y1Z8xGSvvoJhfXTLIDhKQrOBNa8Oxeit4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(18002099003)(22082099003)(8126099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2RiN1B3UEpFdVZ5eFBFeHYxdHROdWhvTnI0MHduTWFWcVRXcWtvVnlJTmd3?=
 =?utf-8?B?aWVMZWlCLzdXTEtUNklDNWMvcnlRZjRhMVMyUjVsUHdxMGoxT05WVGlkekFw?=
 =?utf-8?B?SFpxakNHWnR0ZDgzamlvaVBKZ3dlOFB4ZGcxUmtmbXY2d2twV3pZRkd1YzJy?=
 =?utf-8?B?NVpCSFQ1RWhiR3JKL3NoU0puaUFic24wa1plK0IxUUM4U1RDZDdQY0JOY3JU?=
 =?utf-8?B?RHArbFV6VzhXZVZ1cnlFcmxzVTZBSDROMlFxZVBBTTRENzQvSXJIaHhCRjJh?=
 =?utf-8?B?R3BPNnNjMVRtTTcwa1E1cVFhMTZZRWJnc0RLN09VRCswWG5uNFpKajZJSzJa?=
 =?utf-8?B?R3FxRUdzdXdUSXV4RHROdWFtbkVnRE51M2MremhkdDNodWRhOHVjajdSR0dt?=
 =?utf-8?B?NXlHeFB2UWJrTUVzZC9YWlRzWE8vdG53RXMvemR4S2tCK0N5NTRWWkprR0Fz?=
 =?utf-8?B?VTdTQ0FmU0p6YXlrSDFKWFhPa1dvQlVZNVcxdDZpdi9XUTEyV1RuRHRaaGtP?=
 =?utf-8?B?T0hINVhjSmRCcWhFUWkrSkxab1lSS2JQSk9NVkc3bENUdFA5clVyNVN0TUFs?=
 =?utf-8?B?R2ExMmJkaHZXOWc1NUJJYXZ0VTR0Mnk2V1BzVnh1aWVhWW1TWlplOTdnek0r?=
 =?utf-8?B?em1TMFBiNVRaam1kcTZrN1NxMndwRHJISlA5ajhCYXAyWm5CWmg1UG1PdnMr?=
 =?utf-8?B?ckxQbHJYWElmQUprN2NYSEZ2MC9Ka1NVZXNVL0c2MXlRVG00OTFXZFgweENj?=
 =?utf-8?B?OXlTSktIZUFYWTZKSGJWdE94TnlPakk0RmswTDJ4ejBoblhNcWg0TmNNUUtl?=
 =?utf-8?B?NnF6MXJIMkpGTmpRNi9VRDNZYVJWTTlGZkFHS1k2SStCeWIyaFl0cWIyNk5r?=
 =?utf-8?B?UXd0RnJYL3hqSkpaekNEQWl4QWl6MUhFR2loWTJmdWVHTElteXltR3luK1Er?=
 =?utf-8?B?cmMzUnZpUC9QUHRCQjhwL2JLRzY5TFNWVWJRbEVwVUtkRWNsYk1rYWlPdUx5?=
 =?utf-8?B?bUpwclV3MjBxTkRJR3dtOFhIMW1sNUlEZlVvbFNNUjcraWtwWmFPWDBJcGxq?=
 =?utf-8?B?ZlRsSkUzek0zRXAzL3pOWnZ4c1JycDZaSy9VS2pWZ3piTFg1Yk1reEcwK2Z6?=
 =?utf-8?B?Sng3RUo3VFhzbkxFbU1tVzVHZzlxR3RDNDZ3eWs5bUg5cmc0YmFZV3Fhekwy?=
 =?utf-8?B?YlB6Nkg5WXRnZEJGUlJzc0hLSGRxM2M1cUhLNmtQMWVSN0RVbnk1b0RVV0tE?=
 =?utf-8?B?dzlXeGZEVVpKeTM1QVBuaGlSRFhvTVZnR3dPckZaNzZWZTl6WFZKZVlUZ01i?=
 =?utf-8?B?UzlNbTF4RC9ZK3V3N3RBSVFnWGZNVjFTbVZpZmo1c28yNFozVVRla1FtTXRr?=
 =?utf-8?B?QnNiUnhHOGVuMko4MzNMSVJlZS9vdUhNYzgwNndNU01zaGFKNUtKRlprMXdv?=
 =?utf-8?B?MGZIU045M05XeDFBNWd5ZTFXcHNsR0F6b0tocndlMi9hcU9McG9la3FENVNZ?=
 =?utf-8?B?UGpVZ3RoYlRyWnJPNWpJN3l3d1JMODlGbkI3aTdMVytDYjZKbUhEYUMvSHFo?=
 =?utf-8?B?YmpmaXNzUW5xQk9HYW8yRkN5dG02Zmd4NkVydHpGTitOWDA0MHhQRDcyZEFq?=
 =?utf-8?B?L05aUW5DTHF0V1MvTUszV0k5ekplZS9hQTNVMjVMSDNJTHBQNHpmTmVkTnZt?=
 =?utf-8?B?VFlLUTZqUHFnS2ExcTFWT1VpOW1RMGI2YVZOcHNFNzZuVEVZS0VkUmJ6T2xT?=
 =?utf-8?B?UzJGOVczUEdIaWJ6TzQ5RFF5b3oyQUNMRG1ONldrZFE2SG00ZkVZaHE5Wk1P?=
 =?utf-8?B?SUZDVHFyWG4xQ2M3MWdtT04rTDNFbVZMNHZYSkEvS215OUV2VUNOdjV5T2U1?=
 =?utf-8?B?dXhzV0w4QUZTdFFCR3h0c2hMWUNmTnZIVEN1VFl1YmQxZHdWMmM3clQrT1RW?=
 =?utf-8?B?QWNSVXlaTElqYkczclVwMjU3QmVFNDN3ZjJpNlJmTnc4YnVDam0yNklHYkhu?=
 =?utf-8?B?YUFYc3N6VUJ5REhKVVA0Kzc5aE81YVB4dWJQOVhabVNlRTFFQU1rT3NKYnV1?=
 =?utf-8?B?MmdZTnRINFJHN0VhaVhZeXhlNlZlMkNvbU55amYyRzFBaXR3QzN2NFc1WEdm?=
 =?utf-8?B?Njg1bGdhRkhnSnNxcXg2S2RxYkxnRWRVVEFnYW1IZWpjdXNGRFhxalNpSUMx?=
 =?utf-8?B?aWNvY3V4MmJEOEhSRktkbStJakc5anVoWUhZODF4RmZjU3IrRzZHKzEySDd1?=
 =?utf-8?B?STFQbVlnOXBjU2daS29sYzF0c25uTjVURmp6RDNyS3h4S1RzQjIzbEhzMm1w?=
 =?utf-8?B?M2dMcmlWdFg1RGwxbnJGL0V5ZStVeGZ3ZkZsTXRlQ0ltYVliQ3NYY2RhdGxI?=
 =?utf-8?Q?rIvGqRgnR6ja6+Ts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <260106AF9FB7DE42AE01B6A60B595A40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZV1jwvafLAYt52UXZ/zk25P7U9KxzvfZVHcnMOYRLfE2iurPd7U31RcuRhumx5gavC9p2Zrujz6K58Yf/aXn6VHQ8ldF2djkYGV5dXxRiIl+epkxmTIX66Gl+JCxPySJqSAz5V9btea7fe6c01kDzja571Fa7KvWG93D3tIX2hqVnjex7wQ63/dvyEub3cCkqDm8WdmDgYFN4MtQPxQZY6ekgSNcvSU6xKT+SzZDntIITr6KLpmX94B1zkZr9HdADeKbP6TRF5kE1prIX0RNnEv0JBnD8uwcBZQFh6cFj6ol5iCeg7YO5jpO8nOBRb0snzI/rV0U1weDxP8jH6mBMA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b137b1e3-06ed-4ab1-25b4-08ded8174db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 08:52:53.2440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40zSuayY/cM5YfAtmxo8HXpFtzhygJgJrMQ+QDjsZLVMjWg2tE+qmC+/3rdFUAeepjzQNQnU8WfBqriuqDxrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8215
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015309_867430_43DBD20D 
X-CRM114-Status: GOOD (  15.92  )
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

T24gV2VkLCAyMDI2LTA3LTAxIGF0IDE3OjU3ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IEZyb20gd2hhdCBJIHJlY2FsbCwgbWVkaWF0ZWsgdWZzIGlzIGEgbWVzcyB3aXRoIGxvdHMgb2Yg
dmVuZG9yIGtlcm5lbA0KPiB0eXBlIHRoaW5ncyBzbGlwcGluZyBpbnRvIG1haW5saW5lIHdpdGhv
dXQgcHJvcGVyIHJldmlldyBvbiB0aGUgRFQNCj4gZnJvbnQuDQo+IEJlY2F1c2Ugb2YgdGhhdCwg
SSBhdCBsZWFzdCBhbSBnb2luZyB0byByZXF1aXJlIHRoYXQgZXZlcnl0aGluZyBpcw0KPiBkb25l
DQo+IGNvbXBsZXRlbHkgKGFuZCBwZXJoYXBzIGV4Y2Vzc2l2ZWx5KSBieSB0aGUgYm9vayBoZXJl
LCBpbmNsdWRpbmcNCj4gaW50cm9kdWNpbmcgY29tcGxldGUgYmluZGluZ3MgZm9yIHN5c2NvbiBy
ZWdpb25zIHJhdGhlciB0aGFuIHBhcnRpYWwNCj4gYml0cyBmb3IgY29tcG9uZW50cyBsaWtlIHRo
aXMgb25lLg0KPiANCg0KSGkgQ29ub3IsDQoNCkkgYW0gc29ycnkgZm9yIGdpdmluZyB5b3UgdGhh
dCBpbXByZXNzaW9uLiBZZXMsIGl0IHdhcyBvdXIgDQpvdmVyc2lnaHQgZHVlIHRvIGEgbGFjayBv
ZiBleHBlcmllbmNlLCBhbmQgd2UgbWlzc2VkIHNvbWUgDQpiaW5kaW5nLXJlbGF0ZWQgZG9jdW1l
bnRhdGlvbi4gV2UgYXJlIHdvcmtpbmcgb24gY29tcGxldGluZyANCnRoZW0gc3RlcCBieSBzdGVw
LCBhcyB3ZSBhcmUgZG9pbmcgbm93LiBXZSBob3BlIHlvdSBjYW4gDQpraW5kbHkgYWxsb3cgdXMg
dG8gYWRkcmVzcyB0aGUgbWlzc2luZyBwYXJ0cyBncmFkdWFsbHksIA0KaW5zdGVhZCBvZiByZXF1
aXJpbmcgZXZlcnl0aGluZyB0byBiZSBjb21wbGV0ZWQgYWxsIGF0IG9uY2UuDQoNCg0KPiA+IFRo
aXMgYXBwcm9hY2ggaXMgYWxzbyBjb25zaXN0ZW50IHdpdGggdGhlIGV4aXN0aW5nICd0aSxzeXNj
b24tDQo+ID4gcmVzZXQnIA0KPiA+IGJpbmRpbmcsIHdoaWNoIHVzZXMgYSBzaW1pbGFyIHBlci1l
bnRyeSB0YWJsZSBwcm9wZXJ0eSAndGkscmVzZXQtDQo+ID4gYml0cycgDQo+ID4gdG8gZGVzY3Jp
YmUgcmVzZXQgbGluZXMgd2l0aGluIGEgc3lzY29uIGJsb2NrLg0KPiANCj4gVGhpcyB3YXMgZG9u
ZSBhYm91dCAxMCB5ZWFycyBhZ28sIEkgd291bGQgbm90IGNvbnNpZGVyIGl0IGEgZ3VpZGUgZm9y
DQo+IHdoYXQncyBhY2NlcHRhYmxlIHRvZGF5Lg0KPiANCj4gVGhhbmtzLA0KPiBDb25vci4NCg0K
VGhpcyBzaG91bGQgc2ltcGx5IGJlIGEgZGlmZmVyZW5jZSBpbiBoYXJkd2FyZSBkZXNpZ24gYW5k
IHVzYWdlLA0Kd2l0aCBzb2Z0d2FyZSBkZWNpZGluZyB3aGV0aGVyIHRvIG9wdCBmb3IgZmxleGli
aWxpdHkgb3IgYSANCmZpeGVkIGFwcHJvYWNoLiBBbmQgaXQncyBub3QgdGhhdCB0aGUgcHJldmlv
dXMgbWV0aG9kIHdhcyAnY29ycmVjdCcNCmFuZCB0aGUgY3VycmVudCBvbmUgaXMgJ2luY29ycmVj
dCwnIGlzIGl0Pw0KDQpUaGFua3MNClBldGVyDQoNCg0K

