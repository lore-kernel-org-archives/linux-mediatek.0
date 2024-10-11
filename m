Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75167D24463
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 02:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rlywefQftcJoIVPd28pYI20ycr9KJ++1/WzTCTeUFI=; b=0OcspIl9zYbVMI3rcWZyyRmJBD
	augBeaEUq5pFgdLFBhQx7Ky9XJebebvdr76rYoRoZvsWvpYor/opAs5Usd4x2RmUoAGXCf/w8CpUa
	1pPmH4luV25yQ6GKLUIrqlB3or5kZlWJ9Wx5PI5qeSFOxFJntGFLry1yiaiYYQVG0vNh6CAvJnYa9
	W61EmhVOjWs8EpwXYLfBeHHeADizoWRNvmwxPBoFJWOwjgbSyyJecj038zCGHjHDag4S3Kqss9Eje
	/GncKLQrxuirI0NutMwCtJ+GVYJ/5n5BSpwJfdCfA/54rRKcN256ujXajFCZkFUEgc6Fz78EMW1JP
	KDlzLb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5LI-0000000F2fS-1fpy;
	Fri, 11 Oct 2024 02:25:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5Ju-0000000F2Tr-3a2b;
	Fri, 11 Oct 2024 02:24:00 +0000
X-UUID: dbeb61b4877711efba0aef63c0775dbf-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=2rlywefQftcJoIVPd28pYI20ycr9KJ++1/WzTCTeUFI=;
	b=L6WMcjCs0bYk/4pHNOcx/i3e46Mw20g34S4wfSBvt3SB65dyWDDAl4JGL3IaXHHG4egk9vjM1Vc98Nt0nJHOMG3nJZ67WgyT/LX2JuzI+2xQBAKJYJHSAzNKXUZLWciGxwTKmiaM80JV3EOr8xYXggYw7JI39zmDbvYXoSuoQxY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:631801e1-4ee9-41e3-92bb-7bdc1d0a55d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8d731341-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dbeb61b4877711efba0aef63c0775dbf-20241010
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 439075319; Thu, 10 Oct 2024 19:23:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 10:23:50 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 10:23:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO7W1CmKBbjIfumOQqGZyQqznJJx7LF2LpbUDSegYMlIf1jFHEdeZ/DhUkNFvSZTTrAUz18CEeAMv0+aC9lKajqomAtEDh66vPq7Z7n6dCth1/srROmXc+KI2qvD3IJjn+17cRg/VsJey4+KNTokHAhQq1igK/HVdfhtq7aofnk8/RtHWNn6fbhJq0P05398ahDO1smicwyJW/+bmpHQ6m/Thja9c2zaH/C3rOLunaR/aPfJyJFgomwObDKCfKy37A0A+fD6dit8XDMYJEMqD9/7n7Pl0rSu1AC25pNv2Q11EarnyDsNc0Y0VVSO7ZQiZfW9rnbr3SKC7CUpXTse0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rlywefQftcJoIVPd28pYI20ycr9KJ++1/WzTCTeUFI=;
 b=yz8SvXECrO97Dgb3iCTVV3A048qwRUKUcoHFrG5zuHQOf3s86P2fFYIHyC41z3of6v3QZaXghTzU/mCIdRcCtfUAxdbMoI8wT6dBPHshR2mmqE5kNFnLZOeQGifcpj34pfW3DOufA+G9aim4vuv0A+CLUmjV5KLLgwQIr8oBdxWOZNq1g4cS2nc4Skd6AXFNq2x0dsDKyQ76QPKLJghEH3R1cjbIMZxwhxY5yNexG6yyO3ganj1q+OeazFeH2DKEZMoeA0R5H16ger0/1lCe6iQmcAK8EIDqlitKn9viguWfSFXhT4HRfcOcpyyQ/wNsm8oNMlg9cLLtMYwjUu+fsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rlywefQftcJoIVPd28pYI20ycr9KJ++1/WzTCTeUFI=;
 b=nXnoSI9A7qT6cM8/APmj16nGNysVIkI2iQK6Dy3BBqHl7IObulVfZRuSa1I28Y2R142Mv/NTXg7faGbkYb1py9uydNIgeZtYEzI+/5RrOX/lIXLdCYxRktMv06tprBb87GuGiCN4KojC3kIdTC9xekSsa02RFaqtQ2C4jubSbrA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6497.apcprd03.prod.outlook.com (2603:1096:400:1be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 02:23:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 02:23:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KA1LcA
Date: Fri, 11 Oct 2024 02:23:47 +0000
Message-ID: <f76a0e2d0536c9dc146d8ab56afdda7cf165d581.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6497:EE_
x-ms-office365-filtering-correlation-id: 62020229-29b2-4914-985f-08dce99bbca5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VkVuOElGMFRZdE9pZFdBd1JqYklKbSthbFdRMWZ4WHJNNEtMT1pic1dJTGRC?=
 =?utf-8?B?UVVRVm9RNGdJaFhQbnV5UHRmQW9JQXVkNHU0K2RNemUyTjZKckF5TFM1ajNy?=
 =?utf-8?B?UGRCWm51WTdIdHBqbUhhQTRQMENTRGJMWkdQZGhDOGdLWlJwcnZ1QytpOS9S?=
 =?utf-8?B?Uy9TNzJYWUV2NmtyUGN2Q2NnOTdGVGoyRkh5U2UxNVlEVVdVUkhKcGE5bUZ5?=
 =?utf-8?B?NGF3cUNiSXBKWkxCanJIcHQ5TFJlRndIT0c0Nmpydk4ycytDU0RmYmxZNU5q?=
 =?utf-8?B?YzNXdlBnM3pKZVlVMWtsY3RUNGFONmhCY3hDQnEvMG9nalkwRk14Y0xrbG1Q?=
 =?utf-8?B?WGEweFErRW1kNFNEZ2xTZU5OMk9nS2U0TVJVL0NRRElVMUFXM3ZnK1hZcVdG?=
 =?utf-8?B?QnpvaGh0bDlnaHdDY2hOSTFSaStUU3FNTUtXOFNGRzBNcWlOYU5YVUNwWll6?=
 =?utf-8?B?TEFMUHFkN094R2F3dXRKOUZ6ajl1cEN6N1NvVC84VThDZ2dLUmg1aE50SzB5?=
 =?utf-8?B?OFU2OG9SZ3BoRGlZWmwrU1RXK0RvK0UwelVDL21yRE1mSDdnUTA0R3V1cEhj?=
 =?utf-8?B?VVNXcFlmb0NXWkZtUFdZWDJ3UDlySWxZVEVEdkZRUEtyeHJoNjViUS9BSVN0?=
 =?utf-8?B?RDZwbVQ4RUFGcWVCN3RXbXgwSHYwM2Z6YUl4RTN3eXNwQXc0dnhSc3h3cUhh?=
 =?utf-8?B?N1VLb0NaN1hmbm1wcFhMbVdLZm1ua3Z1NFZSajZVaFpIQXJWUEZKOW1Ca2NS?=
 =?utf-8?B?OVRkdkM1ZSs4TXJmSU5nV3JCdW1JV1Z1U2x4L3JhMXZyWDZFeHErSVJNcUc0?=
 =?utf-8?B?S2F4UUROUUl4b2RJcjZHcVRSNm0ya1hyeUlpMEhGK1JpRkttSThlU0JVanRl?=
 =?utf-8?B?WEdFTnFvZHFpZGVRK3JIUEY4aWptNGV6OHJkb011Zjl2dXF4Qjl3aUwxYTJL?=
 =?utf-8?B?QkdpdE1QYXh2QTQzcm5YajdldWJvQnAwcnhma2RXaWxXa3QyaFErNWdoYTMv?=
 =?utf-8?B?MktZOGlVVGlERnc4RmRKZDRFc2pWUlFDVVFlUnVYQ09kcnNNUTFyZUlwWFhJ?=
 =?utf-8?B?Q2RBd1JDUnR2UWNqVWxvbTZjVUxvOTRCaUZ1V2JGdlBJa0RYNlc2c1gvUFVk?=
 =?utf-8?B?dGVZeVFwMm9YYWJxbElwdFNDaUxTSXFYM3M0SEtaMm5STmxieXppamh4WWp4?=
 =?utf-8?B?RlovUHRMUFhQd2lvNFF5eGJLZUxVbXVOWVpOQUM0SlRZb29vZDBoUThva1pT?=
 =?utf-8?B?YWwrL3Q1VENCNy90K29CUDI3TTZRN1dOT21CQTJBM0NhRkVlcnJPNFZjM1pY?=
 =?utf-8?B?MXhPVzNnMUcvbllkajZiSktzanp4SW43bkQrdFB5SEdXeGR0TXBKNDlxbk1l?=
 =?utf-8?B?S0xSTnlmdUpXNDdadG5tWUZMTkIrcjJaVmhnQWhxQ3dDT3hrb292SnhDbWp6?=
 =?utf-8?B?SDFsWklNWlBXMlYyamdjRGNZWGNXOGdkWmVaaVhJMGFUcEl1d1dySWFHYUpw?=
 =?utf-8?B?NHdiWkdWK2oyanF0L25FbjlxbDh3OHREUmxjeHNFdzBCYnpDWlRkNGVMWnZk?=
 =?utf-8?B?T1hNaFdvMWRGYXh4Qk5QWHhrY0tQblQ2VTdwM1doTHZERkpvZ3d2Vzl6ZzlD?=
 =?utf-8?B?V3E2WmY4NnlVQTNHU0xCeVRRWlV3cE44ZWdCbGZmS2JTRTRiT1RmL1RpajZm?=
 =?utf-8?B?aDkrKzZzME5PbEZKWDVFK2poYXIyZEFnYVlQT3BCSUtKZFBzR2pJOHpBVHE2?=
 =?utf-8?B?ZkhnOWJDd01mRXMycVBBdWtZSTNWWkhTNXFCZHpna0grQTFBcm1FSU1OSUoz?=
 =?utf-8?B?YnJPc2d0WGpBaVFocks1UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTJxVFp3QXdYU0hMMHpWWXVNSjVPdTRvTkFPZ0ljaU5yREM4OXNPWDk5VHR2?=
 =?utf-8?B?RUdFa0tyWnA1TXMxUDJUamtnRkFHNGFsY0k4b3lPUjdOeEt1TEsxSkNremcy?=
 =?utf-8?B?UjRCeVVtUVRsY3c2SlBxbWRSQjBZVzgzRmRBNlFNbmdTM2d1MkVxNU13b25E?=
 =?utf-8?B?RmhPaFhzajQ3OGVyZm16cEdqSE9BVFFCZ3RXVkMrSVhpNmZSN241YmZvT3Ry?=
 =?utf-8?B?UERxM01HVVVoMVNaTFU2K0pHNnNESFd4bXY4L2Q4MnJXTDI3b3dmaG0vbmtK?=
 =?utf-8?B?SHcvNlp4bERkTW96RzBOWHN5UndzWFNieTlnWDBPQWFSMno3bUtqMitIdEpk?=
 =?utf-8?B?ZStJQ05keTFzRmtqZTN2bnlwNVpqSXBsbFlGRnBnRDBPTW9BYVgxaE9KdEJ4?=
 =?utf-8?B?SUdydjVna3JaamE0RSt6dldka1Y5OTVoVXlTQUlsS3pQcWE2ZitPMXV1eU1r?=
 =?utf-8?B?V2gvL2RGbTBqTUdEZmZqVC9DUEZ6L2h2WStFYjNWdzhabXhWQWxwd2JvQy81?=
 =?utf-8?B?TGFaendaVDZsdXRuSjY3SGdVY2Fkc3NRUWtIdGFzM3RHVzF6NXN5TUFLTHNl?=
 =?utf-8?B?RHNFOW9oSHJNdlNSaTVHd2ZsOE9ROHZSSU5kR0ppTjU0TDA0UzJZWWNsem16?=
 =?utf-8?B?aU9nMVlOd1JFUWhXbThSTjNpTGh6cENDOURRaHZHVWJyc3NJeWtDZG5EMUxC?=
 =?utf-8?B?S3dEcVJRWU40ZHBiVWJSeUowZStLeVlkOEZBaG0vYlhlQlZuMVo1bStYcXpW?=
 =?utf-8?B?Q2F2OHdibEFRbkdZKzh2cEFqdXNqYmoybEVBSG0vQkRQWDhOcWl0alFzZDQ0?=
 =?utf-8?B?S20vb1I1aTdINjNqaTYvM0U4ek8wajVWZEN2amRBSmEraFJmZGZ6MTJyQ2ZZ?=
 =?utf-8?B?bmNJdzkzWDNhYTNmRloyUmg0T0dLNUVHcGNXSGxHc3dGbFJlTytkVzNVL0g2?=
 =?utf-8?B?RlI1ZDYxSEozaHBCekd1ZkQ2YmNCT1owYkdwSXhaclBFVTJJN0o0RkNWb3Zy?=
 =?utf-8?B?V2tOVC80WUdzcjFHVXhKUzhUZjFLTE14Wk9ndTh6cHdSTzRraGg3WUE5dnRl?=
 =?utf-8?B?RFpHZ3k4QUZQaTk0OVdhV2FrUW56Q3V0ZzBTT251dWtFc3JIQUY0dDhDVlhn?=
 =?utf-8?B?SVFhajR4a2ZaQVkxd1BxL2FSbmpoOXFiSm5rZDBsdHE3Mk1ZVDlJWW1lS2tJ?=
 =?utf-8?B?cXdPT2RZMGRJWDZiUGpFWGMyTEJaM3VJanlKL09vc2RQbmwwbU1OQUdUa0xw?=
 =?utf-8?B?bmpIRjRUd2NDOGlKdDdzYjBxYmE1S0ZUUUVJV3hHRFhqc253bkpvaURYUUFV?=
 =?utf-8?B?aS85UEZueDZydlNlV2FKMWRqMGFWcHVoUFhVZitVS1RmdDlUQ0xTNXYyNUtq?=
 =?utf-8?B?cmM1THhIazUvanhmQXp6R0pWMDBUbkgvbUtuL2ovQzZYcU9KZnJ5QXJOLzNX?=
 =?utf-8?B?cTRkTmFrZlpIYWk1eXA5ZE44QjJwSWZQaVNFVy9zOG1uWmNuYXBSSkJhU2tx?=
 =?utf-8?B?dERoVmd3VERpTUdZdHhkeVhWa0R4YUhPS2o1elNMVUMrbkViMVBJa3VsblR2?=
 =?utf-8?B?Z2w1Q2JOLzJHMVF2VXVtT2NTeEFIZm1MaFIzTlh1S3RZaGczQ2ZDa2pQTlF2?=
 =?utf-8?B?cU10cWF1czFZcHVFQVBqTHgxZFpFUDFmOGFmOS8yNEYzUERBZXJtL096WnF5?=
 =?utf-8?B?NkphMmdmZWlvWE5EQXNSdDhSNXVCM0tvVkFjR29nUEdFejdmT0hYSTNMenlu?=
 =?utf-8?B?ZmtKTERqTjZHazRLUVRJR04wT0ZhdjlmVGNqSGphUXoyQ3pGS0hzMzhublgz?=
 =?utf-8?B?UDA0OTZhSFBDU2tZTXZTcDZsdUJRdzAydzREU0dNbTVQbjJuZFM0QXJ1bDd5?=
 =?utf-8?B?aVNucjZEQlJYbGhzTU5KU2twSHFnNDNzSkx1NXNJaVNVTkFOVmZRSWVyVkxq?=
 =?utf-8?B?WGRIU0ZBdnlxR1dRN1FNWHhIdmR4SE1hZkJQWDNWcXNlODFCb1hWems5bk1I?=
 =?utf-8?B?YWhJUUxLRno3aUg1UTkzd1g2Wnh4OHpJQ2JPdmZWSnNjZ0Q4bkxhb1VteDZw?=
 =?utf-8?B?ZGRjWjNmMjVoL3hGbzlJZkJHVUNmTy84Qy8vQTJBWVB3WnhQT2FPenZGaEY3?=
 =?utf-8?Q?yedJaU0CJGMRRocOEI4fJTPkN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A879B1EC548EEC42AED2518430E58CA2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62020229-29b2-4914-985f-08dce99bbca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 02:23:47.3509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WACBfrYxFF6TgO62yFOrJNtIs6kv0ARvmJ6naPRqWHHKHNw5PZACurrcddGvbU3ERJ+2UZIcMZ576OSkta4NKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_192358_936269_5FA14325 
X-CRM114-Status: UNSURE (   8.50  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICAuLi4vbWVkaWF0ZWsvaXNwL2lzcF83
eC9jYW1zeXMvbXRrX2NhbS1yYXcuYyAgfCA1MzU5ICsrKysrKysrKysrKysrKysrDQo+ICAuLi4v
bWVkaWF0ZWsvaXNwL2lzcF83eC9jYW1zeXMvbXRrX2NhbS1yYXcuaCAgfCAgMzI1ICsNCj4gIC4u
Li9pc3AvaXNwXzd4L2NhbXN5cy9tdGtfY2FtLXJhd19kZWJ1Zy5jICAgICB8ICA0MDMgKysNCj4g
IC4uLi9pc3AvaXNwXzd4L2NhbXN5cy9tdGtfY2FtLXJhd19kZWJ1Zy5oICAgICB8ICAgMzkgKw0K
PiAgLi4uL2lzcF83eC9jYW1zeXMvbXRrX2NhbWVyYS12NGwyLWNvbnRyb2xzLmggIHwgICA2NSAr
DQoNCldpdGhvdXQgZGVidWcsIHRoaXMgZHJpdmVyIGNvdWxkIHN0aWxsIHdvcmssIHNvIHNlcGFy
YXRlIGRlYnVnIGZ1bmN0aW9uIHRvIGFuIGluZGVwZW5kZW50IHBhdGNoLg0KSXQgc2VlbXMgeXV2
IGlzIGFuIGluZGVwZW5kZW50IGZ1bmN0aW9uLiBJZiBzbywgc2VwYXJhdGUgeXV2IGZ1bmN0aW9u
IHRvIGFuIGluZGVwZW5kZW50IHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0K

