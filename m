Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9FEC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHSpjPW8l9ygnPFXVCgSQVbB4BEenIRgovZ2kudIR24=; b=dFo+wAcJGq4QicYJHo0S5eIwtX
	nO5WXiR+t7NaMuwXZVz17+jIjk7Nk4scylIA4JD8e2j83QNTyJU4wrXyZUwYLA7SL80NkRakW3q/d
	mP0SzIcWvL1bFLp98lKrhvhfG/ez7NCm825Op+xyXzrsYc9i7e0AVVFG4HdPpAxOhhIZJXx2UaOkd
	fXPdSXMr02kcTCdEAHL+9Z50Aj81IrZ9nts/Sr1j0vWEZiP0ODYhZnC/cLbgXNDCYWdcE3f70Y3Iq
	gxphS/r3Kcb1Ja9UHecBjKUnJ4VPK1sbcfTjMMvv5WWh01TPsBx6M0Vck7cl0WyZbs/SoxT1vyDdP
	dDXbZGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDtv-000000044i2-0MDR;
	Thu, 02 Jul 2026 09:40:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDtt-000000044hW-0NUp
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 09:40:06 +0000
X-UUID: ff258e6275f911f1afed4741b24580c9-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wHSpjPW8l9ygnPFXVCgSQVbB4BEenIRgovZ2kudIR24=;
	b=NgTHuOD7FeprbpzBwNoPuLyWp4EarvjkzsUoADH9U8hFXa65DWgrFfC/CJc9RN/m/vOXsqv0ff+tiX9K1WjIZLu2ImfmzycEoDjYgpMXS94pw7aiujOyTfau4RLj6MVBkctW5ZqVdFTOUHg6KxgXt7taL2sDgtq8pJvdEeYErdo=;
X-CID-CACHE: Type:Local,Time:202607020153-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c7529497-9bef-4535-88f3-c8930bf47b53,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:e2533604-3795-4a90-800e-68e9393a343e,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ff258e6275f911f1afed4741b24580c9-20260702
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1969155476; Thu, 02 Jul 2026 02:40:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 17:39:59 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 17:39:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcrLHWWttqgZG/qYLnAD9eb+oG6qoQX4UQd0vLH5SEoHHHMCHSKDgXIBOSvlzZtRQtZ0dlS+WTZrCsNxGYaTVt05+cYKwj5WE+TqroV8gWn/Jb1dgM8PFld/17LkvLrSt7xhXV32NZjGJ1i4qKCCKAJgqJzJMCd09+/QVeGPa5igs8/RzmJeA/cM/jqWMq3+jQHuQ7onNoo5b3YKfPBbXM0YVLPwofPE1BETRm8izzxroGw5xHnv52KFrOPnXevI9Ei9dX+W9eMBx6CmlvgNel4bPusii+QdK1rPwW5G38tfgjQeajyP5I010oy/bMyZ7/CRMjnBFwW7iJW+Z8wH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHSpjPW8l9ygnPFXVCgSQVbB4BEenIRgovZ2kudIR24=;
 b=U1ZJlwLh+igLsxKodrRm5euK74fhJ6O7QNEbQdPBrSPthZbQUIBC5xRCG4KdUy8ZuM4PIbQXSs1wZSFAJC3A3hH4iQG28m1ufK22E2RvqUNBk5uuHj8H1x38XaiKK/MajJOIc3FaMsW0smBvC6CibSE81/oHti5MBmrl6pMsWcAPcJ1HIm6tzxE/7jGvsaC3RYiiE4bptMBwlhoUZzL+5EdWI4t0zNkuJSiKkH6vGRS7vi1qNf0O8i+v62FIVwmPc/xldA/B9bS8v6OgShpiwNN/RD00+pluqpA4vcDr0A9+ERCH+3CY9rNXYOrztljIrmwIMlqdVW39ynMoz6BusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHSpjPW8l9ygnPFXVCgSQVbB4BEenIRgovZ2kudIR24=;
 b=ELPmsUG1wbnUXjZPA87AYeTJdqVvhEFHua7TllXurVlOyTHXJtivkjJdR0hmVVWML6q/LLlUsHBT9tZ215AinISzjyD2PqSTKrrIApZrWdEvID1vS5chWVlhWm3H7aTBr+yia5YRu80KpqMiDWPwLeagcQmtAFkdmizI7tFhqXM=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SG2PR03MB6802.apcprd03.prod.outlook.com (2603:1096:4:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 09:39:48 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 09:39:47 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, Arnaud Ferraris
	<arnaud.ferraris@collabora.com>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, "linux-devicetree@vger.kernel.org"
	<linux-devicetree@vger.kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Topic: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Index: AQHdBUBFkhMTBcaOR0CLIaZtsVPeSrZQgmIAgAe6r4CAAK2yAIABC92AgAAMTgA=
Date: Thu, 2 Jul 2026 09:39:47 +0000
Message-ID: <01cde7f4677bed30bbdad67a09af989ddbe128f5.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
	 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
	 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
	 <20260701-city-during-7d76a326f2f4@spud>
	 <7ad86380-6fc3-40d0-8908-22ab2943ac55@collabora.com>
In-Reply-To: <7ad86380-6fc3-40d0-8908-22ab2943ac55@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SG2PR03MB6802:EE_
x-ms-office365-filtering-correlation-id: 2582261e-c717-4938-5033-08ded81ddaf9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: mWsWTlOJFnTplefNdSF3GsKyvLh2add5ZL70v38JZkj/mgxLRUDuD2QJ67gwEysCQB7s0PaCseMTIbdRBFiel/H0903RjeyMHr1KlJIHL+URxwCZ5rGHvZt/PZ9U9ngKyNPN9hPYRdlshS2/w6CNoQ9s0Hx4W1tqoqg8LrrC2zFqIY8OX0yoJonCslPPEOGgOhQwtv7ffZA0ZoLOUIFhcT+C2R2dD/RwUYDkiJRKpn8BJq0IWgQ049/Oym/nsVKFdLEEibzfJ4KlOiLALSebx0qz4BteqvMeUjorwB/xLk/Wylml8kj5y9qWXef9fwXQ8661SVF9yZHPBunfknHt/OY++oLL3VwI0zEIyzs3l1asbnRFqG76uZqx6RESb3Sx28hEkOTwpq3lZuvswT2h7383C1dGUMNYbjRPNyF4RGkEUP5NCimgAXB5ZtbaCZ45oxqO+xKHoOcu1X5r52TDoHxkXo69y7bdHkxCwzzBApneArJ5rIWdPfYb0xns/+fGPUDWxzhfgrGw7q7I4875vPWz8hS7vliAo9HNCX6jyvFp5PTieng9fah5nQhZ1NRWlGyqc5iloh4krfKRjrYkSkDS6Wfmasv8vOZnHO+LHepMzDot4cjvk5JkIf9ltIzZ11nmTAwer08NgOoSnqK5dbXHOaawcHc6TaCmoaO5z1dgGdbgRJ3X9WF7CGEpoSGtxsKKvDsQqByvHFel6fjd4KSqFkf1Jk/vT0mKRs9kS/E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy8raTBDTU52bUNzWkdSRFVZMkJRQVIyMVJLb1BWYXpwZ2x4WVduRllVWUxG?=
 =?utf-8?B?NExobnRocXhlZnBUN1ZuWmdoZ2Roc2s1WG5BMjduQzdjaDFVVndBMlUxYzRj?=
 =?utf-8?B?eFVVMDI4WmNja3pJWWNvVkRVQVRzcDNVR3NVT2Q1VGx6SG1oekZuTVhZQVdB?=
 =?utf-8?B?RXFmK3hBdC9SN0FqeUZTZ29iY0szbFpIdjB4OTB3Tm5iakNUVEpIalkyZzFT?=
 =?utf-8?B?aGl0REJFRmhHN2tMQmtQeldHTXNySktmZXFmWmE1YzJYU3Y5YWFvWkdiKzNh?=
 =?utf-8?B?UFQ2dDRaRDRueDYxNFUwdjBlaHlFaWtJTmlIWnBnYnFjdXhSdU1sSFR6Z0ZD?=
 =?utf-8?B?Wk1rQkU2WVhUbXcxK2lwNi8wa3ZrUHlXZSt3NXh5ZmE4cEtSdVo5QThFbHZP?=
 =?utf-8?B?MVhnbURHREF6OEN1Z1JjbDZrNkhKYTAvajJiRDBNQThETzBzaS9pbVdFK2J5?=
 =?utf-8?B?ek0vVVdTWG9USmlhRm1jcjNLNGF5WTFKRWJ3a0c5cnRxOC9OeWhWVVRodGd6?=
 =?utf-8?B?dlFvazA0RFY0SkpWS1JzdFRqaU1ueGU5eFNYU1pRaXEwVlo1Y2dxTW00alI1?=
 =?utf-8?B?WXRxbWFqNGt6YzIwNDAzNXRBSnRGK1ArVnJHQ0lCYjNMVjArTmFSUy92Smlv?=
 =?utf-8?B?TkFSMm1TcmVienlBY3U1dEY5VS9jSFpvdVlDaEQ3ejNUWUJZWHhocTNDYlly?=
 =?utf-8?B?cUVocWlCdWRKeUZrOVFUeDd5SzUrVkhIVG9lOWgyTlJ6UnpTcWpWWU5YUWV5?=
 =?utf-8?B?YjRhN3BvdWJDQzMrMnpLUUg1UTlNWG53UndGNnBoeUJlaExZVHI2UmMraEJw?=
 =?utf-8?B?WjhDWmdFQW9mY0JsWjNLV3BJWTh5eHl0WVNLWllTNWRQcWpjOTBHN3pDOWs0?=
 =?utf-8?B?TDUwS0U3UzhxYWExYXpHbFZteGwzNG1RbEF0RWhMZHJHWEtLZCs3TzdQWHpz?=
 =?utf-8?B?aFZUSGV2NWVxaW5XbVRrK2pXRm9lbUI5UlFqajJpdzhQaGcxcmIzMHY2ZXQ1?=
 =?utf-8?B?YThWM1hlMmdib3MwaWRnaHZIRGZnNUVNU3hsRXQvUVFCY1NTUkdSVTBjV1Vx?=
 =?utf-8?B?cmFnYkF3d1Z0MXRkVUtIeUQ1Tm5Ka1dCNittdzhnYzFLUUs3TElmOXlKdzB4?=
 =?utf-8?B?T1JtU3Zra0s3RWV3U3d0Q1ZxVmJ2dnFxL0lqU3E1UWF0VWVGSUdmalZZY0V6?=
 =?utf-8?B?TXplY28yNnZCUU1mMGZOUWx3cFhZY241N05zZXpUdExMWHFqdkxlZTk3S0dV?=
 =?utf-8?B?UEpwSGZjVG51U3dMNGlBSXo2YkNXSTJ4QWhXVHZ6M3g5YnpFb2pCdVJPK0t0?=
 =?utf-8?B?cHBjWndrdlYwVnBNUGtYQS9uQTRZTVNYZm1RK2lVdWxicTd3bnU1UjAwYW1J?=
 =?utf-8?B?L1EyVVZqZTkweVV6c0VIdkdVYmlGSHBCaThrTVlmSGEwNXVpNVZZajlER0pT?=
 =?utf-8?B?Mm9VRUFPT0RacDRXUm51cTQvN0FTdHpCTWRlMnJyY1VWTWJOVG1LMnNIUUF1?=
 =?utf-8?B?STE4cEFTT211NCsrQ2RCY2pLM0Y4S2Y1L0pGU3ZwMitvT2JXT1ZxM3dYRXhG?=
 =?utf-8?B?MlFQaUc4a2FCQms4ekZDb1AwS3lEY1F5UzVvZG96WnBBZ0dmYlFDaEs1KzJt?=
 =?utf-8?B?VzVWVUR3aGNiTWRUSURmVXgvU2xwd0pCbWN5TVNXK2lWbGxrblVBWFBSZnU3?=
 =?utf-8?B?R1poT3RsS1VuVTFFMEg2MVVxb2hNa3g5MXR6dTBKY09tUU9uY2J0WTQyV3N0?=
 =?utf-8?B?dEhUd3hXZnNmWjY4WjliTkhnMFlpRGYxRzE1Wk1rM2hpYVE3c01BODRaNnA4?=
 =?utf-8?B?VXFZbDBSRWwvby9QWDZQZFJDZHMwZjIrdGxvK0Y0NDBmMC9YOGFpRVZYby91?=
 =?utf-8?B?VnZGYmxnWHduRjJpYlNOSjY4Q1o5Wkt3d0FsUjlvMGNWdXp5cGNzZHVrd2lF?=
 =?utf-8?B?aUI4TXl0MjJDcWZjdEFLSTh2ZTRkdXNpQkl1RXFranRhK0UwTis0ZjVPKzFO?=
 =?utf-8?B?ZzliQUFraWkvcjZ6WWxZUTBWLzlEU0llaWwrL3VEcVR1cjFhU1VsTitTUmhJ?=
 =?utf-8?B?bGhxbytGWFFUenpXS3hiNWdHOHVRK1Z4ek0xNGp4MXBlNnhRblVkQ2ZER0pG?=
 =?utf-8?B?ajhnSmxGL2tuNkk2Z29BaEhBd3lDSU9YekdUQVluZnJLdzJ3bnp1K3FzL3lP?=
 =?utf-8?B?YTVwc2JvTUEvdDhvZjhFU2xORnAxQXV4WDJXZVZiT0hyUDNQU1FNTEFzc1dw?=
 =?utf-8?B?dStXd2xMTlFNZTZUVVY5ZDVESjdKbk1HMjl4ZDJ1cnUxamh1cTZCb0UrbmhT?=
 =?utf-8?B?eThlcDdTV3FYT1lxQzMwODJrQUhQNnBqMUIrYzVPT0gzQWlmS0ZCYU94N1o0?=
 =?utf-8?Q?bmVU5yLV+LcXBqR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83DC185CF7D3B04DB4376DFC7B274CC1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OLxbgCFYAb1315zhAU67Ol5CffqLhrJBOHLL2etyRg8OhHzFpnV1t/rfU/C1eq535AYlL9/Jpg7bwZevg0rNPj4giP1BiwoLKz3AWVUnkt5rVP6VKL1fLyFA79IXw+yUNUqpXZ8wi0mHjITp98mr6mRNbgSP3HSRVGFlU1S6G3gUcFi8sGVPY81/kiKQ6Paq173sxVFvncbuH/KMwPngLiMYc7+ZNglE3JBrx6HycvF8hFtqvSqGWOi8ltZcleX7yo6DzX3gOi2bCA+EmVcGC8kTnya+rUbBkJje1JppBW5AWza1azkLdLv47z6uW/i6nwKeVlnSgR88h/WvqSXqkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2582261e-c717-4938-5033-08ded81ddaf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 09:39:47.2410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uASUucKd0jJxoCfYpKmnzoil6+u7wG9PZ2ColCwxGvKsfbTJqPwzPPFJnm0F1jpbf8aKsFqXyLdc0wN7r4RerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6802
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_024005_138060_0D227D58 
X-CRM114-Status: GOOD (  22.36  )
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

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDEwOjU1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSSBjb21wbGV0ZWx5IGFncmVlIGFib3V0IHRoYXQuIEhvbmVzdGx5LCBJ
J20gbm90IGV2ZW4gc3VyZSB3aHkNCj4gTWVkaWFUZWsgbmVlZHMgdGhlDQo+IHJlc2V0cyBpbiB0
aGUgdWZzY2ZnMC1hbyBzcGFjZSAoYmVjYXVzZSBJIGRpZG4ndCBkbyBleHRlbnNpdmUNCj4gcmVz
ZWFyY2gsIGJ1dCB0aGF0DQo+IG1pZ2h0IGJlIHJpZ2h0ZnVsKSwgYnV0IHRoaXMgaXMgZ2V0dGlu
ZyBhIGJpdCBhbm5veWluZyBhcyB0aGV5IGtlZXANCj4gcHVzaGluZyBmb3INCj4gYWRkaW5nIHNv
bWV0aGluZyBzaW1pbGFyIHRvIHRoZSBUSSBzeXNjb24gcmVzZXQgYXQgbGVhc3QgYXQgZXZlcnkg
bmV3DQo+IGNoaXAgdGhhdA0KPiBjb21lcyBvdXQgKG9yIGV2ZXJ5IDYtOCBtb250aHMgaWYgSSBy
ZWNhbGwgY29ycmVjdGx5KSwgYW5kIHdlIGtlZXANCj4gZG9pbmcgdGhlIHNhbWUNCj4gcmV2aWV3
IG92ZXIgYW5kIG92ZXIuDQo+IA0KPiBQbGVhc2UgTWVkaWFUZWssIHN0b3AgdHJ5aW5nIHRvIGFk
ZCBzeXNjb24tcmVzZXQuIFBsZWFzZSENCj4gDQo+IEkga25vdyB0aGF0IHlvdSdyZSB0cnlpbmcg
dG8gZG8gdGhhdCBiZWNhdXNlIGluIHlvdXIgZG93bnN0cmVhbSB5b3UNCj4gbmV2ZXIgc3RvcHBl
ZA0KPiB1c2luZyB0aSxzeXNjb24tcmVzZXQ6IGlmIHRoYXQgd29ya3MgYmV0dGVyIGZvciB5b3Ug
aW4geW91cg0KPiBkb3duc3RyZWFtLCB0aGF0J3Mgb2sNCj4gYXMgaXQncyBwdXJlbHkgeW91cnMg
YnV0LCBhcyBhIG1hdHRlciBvZiBmYWN0LCBpbiB0aGlzIGZvcm0sIGl0J3Mgbm90DQo+IHVwc3Ry
ZWFtYWJsZS4NCj4gDQo+IElmIHlvdSBoYXZlIHRvIHVwc3RyZWFtIGEgKnB1cmUqIHJlc2V0IGNv
bnRyb2xsZXIsIG1ha2UgYSByZXNldA0KPiBjb250cm9sbGVyIGRyaXZlcg0KPiBhbmQgcHV0IGl0
IGluIHRoZSBhcHByb3ByaWF0ZSBrZXJuZWwgc3Vic3lzdGVtIC0gYnV0IEkgYWxzbyB3YW50IHRv
DQo+IHJlbWluZCB5b3UNCj4gdGhhdCBJIGtub3cgTWVkaWFUZWsgU29DcywgYW5kIEkga25vdyB0
aGF0IHVwIHVudGlsIE1UODE5NiB0aGVyZQ0KPiBzaG91bGRuJ3QgYmUgYW55DQo+IGhhcmR3YXJl
IHRoYXQgaXMgcHVyZWx5IGEgcmVzZXQgY29udHJvbGxlciAoYXMgaW4sIHRoZXJlJ3Mgbm8gSVAg
dGhhdA0KPiBtYW5hZ2VzIG9ubHkNCj4gcmVzZXRzKS4NCj4gDQo+IFRoYW5rcyBldmVyeW9uZSEN
Cj4gQW5nZWxvDQoNCkhpIEFuZ2Vsb0dpb2FjY2hpbm8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBy
ZXZpZXcuDQpJbmRlZWQsIHlvdSdyZSByaWdodCDigJMgd2UgZG9uJ3QgaGF2ZSBhbnkgaGFyZHdh
cmUgdGhhdCBmdW5jdGlvbnMNCnNvbGVseSBhcyBhIHJlc2V0IGNvbnRyb2xsZXIuIE91ciBoYXJk
d2FyZSBvbmx5IHByb3ZpZGVzIHBhcnRpYWwNCnJlc2V0IGNhcGFiaWxpdGllcywgd2hpY2ggbmVj
ZXNzaXRhdGVzIGEgcGFydGlhbCByZXNldCBkcml2ZXIgDQoocmVzcG9uc2libGUgZm9yIG1hbmFn
aW5nIGp1c3QgYSBmZXcgc2V0L2NsZWFyIGJpdHMpLg0KDQpXZSBhcmUgY3VycmVudGx5IHBsYW5u
aW5nIHRvIHJlbW92ZSB0aGUgdGksc3lzY29uLXJlc2V0IGltcGxlbWVudGF0aW9uDQphbmQgdXRp
bGl6ZSBhIE1lZGlhVGVrLXNwZWNpZmljIHN5c2Nvbi1yZXNldCBpbnN0ZWFkLiBIb3dldmVyLCAN
CmlmIHlvdSBvYmplY3QsIEkgd2lsbCBoYWx0IHRoaXMgcGxhbiwgYW5kIHdlIGNhbiBhZG9wdA0K
UGhpbGlwcCdzIHByb3Bvc2VkIHNvbHV0aW9uIGZvciBoYW5kbGluZyB0aGUgcmVzZXQuDQoNClRo
YW5rcw0KUGV0ZXINCg0KDQoNCg==

