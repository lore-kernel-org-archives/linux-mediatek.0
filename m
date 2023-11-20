Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468F8C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3wlR8rjFk0Uh7K1pc94lp00a6DIFDb8V7XexYqI+QU=; b=Ie/MR/4yxJn1m+RUHOMKA0yKxC
	2a217t5JQ2M4l2MaongfpfSe98El7oTqLIwXce9gynAAw3okD/9SxqKM8Fbv9WT/5itXuq9Bh3HWK
	agThRuJ036o/0J19f+Ul2TLKp0sbzy02C2tj88PLdJGtxzAKMRWn39Fk2eeeYtYn7gfBUFHVUkuOZ
	2z62gnCf+McVqbV5JP2uB+6Wuoqj984TBmXZ/E0TpGN04RhVzSgjLDM17qaocU5/iX6kv+XbkNhHR
	+kP71vfeQA8HIKaXz096aXCWbrzL00pV80mxoTpjSo6tFw8wJFrUjMMTr5C35l0CpweuMdlfuzraj
	gvJaZjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zMd-00BTsZ-26;
	Mon, 20 Nov 2023 08:10:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zMa-00BTsE-1j
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 08:10:38 +0000
X-UUID: 45ecc83e877c11ee86758d4a7c00f3a0-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b3wlR8rjFk0Uh7K1pc94lp00a6DIFDb8V7XexYqI+QU=;
	b=HuIByIMWRZiwMahDgN93+z5ksdKlvBWD0riII1UwIhD1AoXC5/d+t+CPBAoJViRBWQY0bK5JJViQRpHzOyJaWku5Ed1nimOg6ZiKZI6qCzPr726OyMcJ0ExNiOuyc1u0xF6ypP2ZI4958++GTtyacSP+CcQ84tKLc2RSC07mItI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:87bf7df5-beb2-49f2-ae4b-c4b6a906f01f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:55249795-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 45ecc83e877c11ee86758d4a7c00f3a0-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 169427393; Mon, 20 Nov 2023 01:10:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 15:49:54 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 15:49:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoLZFDZ1LfXyIig0V1jSiiULffhhgSwAXUoPRMukCDXnIne3TuGokufuZ9e0z/SzqO+KGiFAL6uG0zGsY+/z8XJyJOtyvAjghk1rIyQBLVrcpH99TBWfehOMQ40Ui9+JjsgM6f1y2n+O3iKUD1Ghd1PtB1CWHEucUnROmoxbl2iN0B/oJ4rTlGkK6HPKZyYx+hiE8eCEPOSs6wtJ5N5DMNzJ1okODFmfcthUUa10Spsq15Oj9ORzm9iCbEFvWslL+vuDzrSsoeBRfqPwiPaplxrv9S5sCJJ6R9a/83LkrDg73Ckh85ftv+KjVcUbE38syNcHfmIgG58ub+af6NHA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3wlR8rjFk0Uh7K1pc94lp00a6DIFDb8V7XexYqI+QU=;
 b=Qkc3v10Xru/8xjI5H8PQ1XgmGC6rRgfpE1fQqlFBk09fX+XBYmz8qKGAPGlRt1+Qsr6rJisohvAgB2amdpIPVSd8fZq/Drcv2r3EBdxdFqASm6Hf7WkwMFwRDGB5uyasRuyZtVl4L2pKfT2/uMOrR5VODzbi2huGToCYuczcvuv/zJUnQZzfuRi1UXyC6H+ttRO6HVTaAAPYLVymzh7DqpYjvSWKBBpfZnDZyq1MVhVeiSy7JPFuzO2JqeGyho+CB0ZHroD62YPaeZvqJdm5TdAhmQthsN9AjrtSIMZCaLT4/jaQHXBQJADSlkpfiw0yzFt6ojOweDJSBBcjzp6z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3wlR8rjFk0Uh7K1pc94lp00a6DIFDb8V7XexYqI+QU=;
 b=IaiQE/kopY2E3wei5ur82bU3dj9a7ilpNHFETL9HZr65uWofo6akRhpMtbgoNOWSxkwjlPvZVeqarrUs+kxvoRNqPOfJJ845K44rhiX/3Cg5O8E6EsdXHiqVLKE2UxwXvtZWY/gyhG3M1WKnuUxZbxYHl8Ewl1y251l1v2ImYLE=
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com (2603:1096:101:7d::13)
 by SI2PR03MB6639.apcprd03.prod.outlook.com (2603:1096:4:1e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 07:49:52 +0000
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5]) by SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5%6]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 07:49:52 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"zhourui@huaqin.corp-partner.google.com"
	<zhourui@huaqin.corp-partner.google.com>, "broonie@kernel.org"
	<broonie@kernel.org>, =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
	<Allen-KH.Cheng@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"perex@perex.cz" <perex@perex.cz>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v7 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset
 codec init/exit api
Thread-Topic: [PATCH v7 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset
 codec init/exit api
Thread-Index: AQHaGHBNh4W35roGdE63FJ2se4S3kLCC22iA
Date: Mon, 20 Nov 2023 07:49:52 +0000
Message-ID: <a47c0cf513d1baf54249f9d262a073759c1dbb5d.camel@mediatek.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
	 <20231116093512.4180240-3-zhourui@huaqin.corp-partner.google.com>
In-Reply-To: <20231116093512.4180240-3-zhourui@huaqin.corp-partner.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6690:EE_|SI2PR03MB6639:EE_
x-ms-office365-filtering-correlation-id: bc5f181d-1621-46c4-618e-08dbe99d477a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e0dB9799bzPrKN+f17XtgO53gEYvLgO5G78JjGNtNSIucdRfl7Drd+VcryL+4uxyBX/J5Zd2KYduXVsrIr8CKhcy5fwwWaT1M0gCg9y1HC7jtLmQpIncxMGD6gOnBqoLLoYaA3yac7XUxSfMraDdaDAm5ibnMKB/4v/VNuNqJDOMKhpuL3CgYSxWPe12qEmfmQK4vkP6/cx7wUUmwJmwM5f6NRY7IvLt0u1KZPTux1agILeE2+qm7LCWY9IEH5vQOCADs68sIhE98ImxldgP5rJkceGKPy7AuBKuzfSIz/mgeWT/MMoWlNwof47WXe9PuNZl/Extesr5MkVd0w4nd8AkQOvZjADBrkBVn54VYCApn8AO7729AmZ/Sb2tghxRo+Qv5aDMm65vNMLDl6AQqysXDgXTYnMenxOLg+D7R29x3cuZX7DoFW/dy6a/NKdzYxEJcAndFMMQnT1LBqBmEfFfsmXfwwQwDqQhdVC17PxKC8eqwifSNXim+4igqLANm36NWx+Sum3mhYp5+UmU7Wdt/lN7Dh4lUYa6DZFfvls1u4OMs6QwYCX03MPnl+fQsruNyrF/V9BrB0xhU5f13RCAen6QUwOMjNl7XqdelMC9ycOXnzk33OOEHwKJTUoo+sluh3Psvf3eZ4ZX1fpyz40kW/wBEFppbzdYi02nzwBSy6uo8iQfTqv2xGNY6P2WM1fhtHKQjWIpoy1GN7cXaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6690.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6506007)(2616005)(71200400001)(478600001)(6512007)(26005)(91956017)(110136005)(76116006)(66556008)(66946007)(64756008)(54906003)(66476007)(66446008)(316002)(558084003)(86362001)(2906002)(4001150100001)(41300700001)(122000001)(7416002)(5660300002)(85182001)(921008)(38070700009)(38100700002)(36756003)(8676002)(4326008)(8936002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmd1YlNIazZnaGp5MTJYL3Y2ck4zWVZnSXI0eVA3dDlhREpVWjhmSlR6bW5s?=
 =?utf-8?B?d3E1V3N0Tk5IRkVZY01jZEkzNFVaRHNIeU5ZaVllYWo1V0F2ZTJ0dTBYNmxz?=
 =?utf-8?B?Z3V6b2dSVFYyR2NTODNBZVh2WFlkWGdFVlBPd2s0SXBPN3I2ODM1NkNreXlN?=
 =?utf-8?B?M0E3aE9pY2RPSU4wa09pL2x3cStjZ2FoU3c3SkROVi9xVVdDQzBWeHJpVjI3?=
 =?utf-8?B?V2tuYTU5S0JmZzRiOTZjVG9SUTlla1BQVHR6U29PWWc2Y2RRbGtScVdOMEkw?=
 =?utf-8?B?QThmV2NmaDFmVmV3SjdVbVhCTkZsZVdkN3hKRHFjWmY4OGdRaXdoT3lIazRT?=
 =?utf-8?B?b2xKTk5xY2ZpSG5yR2ZkMS91QUI4M1hDMys4V0dHalNseHVJdmlGQU9IZFc2?=
 =?utf-8?B?aHdhQjY4MEs2dlZCSE8xbVBtYWdrQk9YRnB5bW9lN25xN2poOUgwR1RCenJS?=
 =?utf-8?B?WnhLa1FyV09jekNPT3ZmU0ErUjJNQS9kdGw0TithSUhMV2NET2srT2FhTGhh?=
 =?utf-8?B?NHE4SE10UEVrVlNQbmp1MnFQbk5jMW5VdDJ0Z3BWaFVBQ0I2c1VFRUVod3FT?=
 =?utf-8?B?MkhMcWdtbkFaQWQ2dnRONDl0Q0ZlNk9NK3loRWY5YVFLUDY5dmgrN1ltQnhh?=
 =?utf-8?B?QnhMbHdRa3hobGxEaUV5T0VDclNsZU9CMjE0VGJTa1F1QkloUXlzQVRKMDF3?=
 =?utf-8?B?NlZPSzRnODdFeWg2VnFCcUlIdGtxMGEzODhNb2pSU0RveSswdUdhUTdmMGNi?=
 =?utf-8?B?STd6WEhNc21rUHNXQ0JURi8wekNKRUNlY1I0eWs4ejNwc3Zjb3VoM0dWdE4w?=
 =?utf-8?B?V0F3dTJmdXZFTUpMWmlua3JrYkhlemdmcTdWcHh6Y0dkUnBmc3YzVHpoQVQx?=
 =?utf-8?B?cE0rNndaRG43SDkwTlRoUWtmRHdoaDBqQmxJMlk4ZVAzd2tWUEE4MWZkaU9j?=
 =?utf-8?B?TE53ZU9kMUhjMmpQcU5hRnNoM3FGRzRnNGl1VnllK3UrV3JDVytMZk44NUNE?=
 =?utf-8?B?TVdKeU1rZVB0b0tZUkN3YzRVM25GYU5iYXJKRGd5NUFnVXdXcWQ3K0lKYTlt?=
 =?utf-8?B?NWpqZ08rTk1zemV4TSs3cDBHZTE0aHh6dDhta29lUkhwL05jbklVM1ViVXVR?=
 =?utf-8?B?ZVlIVW44dXBLTEptYWR4aEI3SDI1TlU3dUtzQTUyU0Z6UWdSVHp2SU1oNkZG?=
 =?utf-8?B?SHIxZDdvWDBIalR3Y0pkc1RlZXhveW1aWHNnVFJDam9zUEY5Z2lMWXQxUVRX?=
 =?utf-8?B?d3hyNzJUZjJDT21ZY1hkdDJPcExDN3JNSVNKdlJpV05VVzFWMkdpcklvbkVB?=
 =?utf-8?B?ajVYMEdDaFFqNXRhNnJIQTNKRGttb2gzcGZMVU9sZ0FmTVZsTExXUkJCV3FL?=
 =?utf-8?B?MEtCK2lBWUtVNnJIQ2VQampVekp4ajJGUlBSOXczM2ZFc084d0hCc245QzZN?=
 =?utf-8?B?K1hGTHlSV3lwbVVyMEZwTEdDOTY3b01meU5PTUZYaytYeDlOMmNaTk1ReUxz?=
 =?utf-8?B?NGhRZTRBcEl5NExVTFF3cVdMa0hLcjllNmRCYjZPdVVzdVdoaHowQlFHTVYx?=
 =?utf-8?B?VzlNYzRyQkVaeEI4WnZhUERvbEozTmdLT3V1Z1g4OGM1RnozQ2lPMjd6ZGph?=
 =?utf-8?B?RlRzanhONEk0alpLNHlpSUdXejVzd3Q4dVYwNkE1WjEvd3owMm1rUWprTzBn?=
 =?utf-8?B?SVZJZ092VkVRU2pMMTE5STRodmgwTjZaem50ZkVVbXJIWVA4MWRRb3Zzc2Zu?=
 =?utf-8?B?WWFvZDY0QnY2TEpZdjY1U1ZZZy9DbE1XZExaTmpRUmZOWTV5NXJqd2xnMnVB?=
 =?utf-8?B?d2pvbVBJVFFRTnAxYkErclFrQ0pxc1NvUU5uTlJnUTllUndjeVlYazdlZDhD?=
 =?utf-8?B?L2RCcHliOGhxTzJTM2JveVQzR29uR2UyZENud3JsSFpzSTd0KytCb3A0dU9I?=
 =?utf-8?B?NnUra1RkODVrL0hWd2RabGRVRDBwdEd2VWNyRmFBb2FyL0hvbmdUZ2FQdEEw?=
 =?utf-8?B?cVppUEVRU1hRUWV4N3ZjeUQ3czYwVXhNQ29wTlVLRGRpaTg2WUtKbE1pck1n?=
 =?utf-8?B?Vm5xRnFlL3p0Y0xTbHk2RlRFMnVad1F2UExiNGtNUjVWQ01lMFhqazFxdjlH?=
 =?utf-8?B?WWhtVzNLV2dvZS9ubTY4RTNxZWZnZS9Nc0lybGhGV3FYZ1hHUm9DUWxaWUtU?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA3F05DC01FD2240B0A61BFBAD4E95EB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6690.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5f181d-1621-46c4-618e-08dbe99d477a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 07:49:52.1148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FghDyfJmNoi3BG1XDMEAPBC0ZzdYmmDpzij5nqf0E89OcPfMFlXENAyfqO5PnIkAuxDELr5m96vrytmoD9Vk+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6639
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_001036_681780_77E29418 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE3OjM1ICswODAwLCBSdWkgWmhvdSB3cm90ZToNCj4gIFJl
ZHVjZSBjb2RlIGR1cGxpY2F0aW9uLCB1bmlmeSB0aGUgaGVhZHNldCBjb2RlYyBpbml0L2V4aXQg
YXBpLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4g
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBSdWkgWmhvdSA8emhvdXJ1aUBodWFxaW4uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQoNClJl
dmlld2VkLWJ5OiBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+DQoNClRoYW5rcywN
ClRyZXZvcg0KDQo=

