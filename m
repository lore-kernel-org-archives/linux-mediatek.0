Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B62EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=; b=Yo8y4XZi+iWnChDlmOx7EcUVoO
	16p6poPbimfNZnEXW9T4+WAeVVoaM+7c6k9W8fKqspaE51I10xfh9Add0V3DReANRSaZCV1mg5b5O
	WvEabqtCqkHnSUDyGIQ/5I0Mf9A8gUbzIGv/GhqYnz3OpZ5sgYO/ZHWjyDHgQaK9XJGKAMKZjT1YN
	a+EssQ72sEDiWlBk1zW8itLS0ZFZMwjUEG3paXxCJYhk4DDQNpDVheYMq6z+27My6YLBA6OFLJ6jH
	+NefVoxKpEoB2p4r7QCAzWPGezC750ILUwdrbX0UVplOxdPi7sYguFvUBvaGUxm9g5sDhJTMDELXG
	xQAre83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkoT-00Adpf-17;
	Mon, 10 Jul 2023 06:56:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkoP-00Adoj-2P;
	Mon, 10 Jul 2023 06:55:59 +0000
X-UUID: cef8fd4c1eee11ee912e1518a6540028-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=;
	b=MwCg9kqglTRV504YvtQHBmXxhJMEKfVbHcDe9Djm6pGmiDYxAcTLzflSeiPDRII66aLp5/51uR4+UUTYFpl6Y6YYieEbsageONg3CxOFABsSNQ6yQEnQDw9GOC+KXJLfydDd+NPUNUHHrI3JpZNJh50IwH25g2HbAYv9zjuF27c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:83c49dd9-13a0-4d35-b828-01a51ff90bab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:e2a0c10d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cef8fd4c1eee11ee912e1518a6540028-20230709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1754820241; Sun, 09 Jul 2023 23:55:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 14:45:49 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 14:45:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZrnAgICkeZHX9Iw/nt+aC1t29bkjG6Pi7H4u4K9y/0gE3G7K/ttvWrI5jUYofbErOMR1yb4OLq8trEGwzbk/6fvfbIzdnOhCrDEzn74AkbisEjRfaGgtKMoiHQRa5luEjQI4KsrI0PI3a3grOvBbOvBRtjQSMkpuakZogRADvZ6HLhGFAhC1EMvhYQFneiaqj/M3RnGD8FNw3x1rTCXN/Pf3/fwArPNoswqVRsoEVT6KnZtsdB+QB99fprJXwyevMyrwvtFsE5lk1/HrxMZDzBwIwp4/3a96W4NdqZTlZeUauoLr3K6SZpR/8Juen9Q0+6waEaDGjiGQay0JS4+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=;
 b=CDYANjARokV6MSsceFlBVMHjKSwZodWmgr3P9mxa6G6iGw5dtLF847jEOMZfhuREPYVoAMMyn0+3UdoB+j7LOEC3AxaFYcy+owT+VwK1jmI5lyzO5N60mC73Rux/PvkGsCGdbNer8yNcUxFYOwHUnwPWKeXEp43bYnH1MZc0CpbzHQ2imHd5aUv7cV1aaV4Uw0NzWfhpMJE3rTIS2PV3jJDzsbJhmjPnXfFaQezOuuQNSvyDTY4gZIat4t3GOWnLmTkWMdgN1qLFUoVivOZRsqvsFpREBc36CfdWOMrmzansqAs/mVgZQlgrMGJ/iK1W7NLpjWebEq4C/IP9dq0NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=;
 b=YOsKVGV2h7gGYCYoKoHCSLt7KuLuaMqOAky6TAzBPzr0ndBOSD0ymMyRoUTg83x1wdUYf59ZAAneAhox0KW/fH2b2uWTMsfyDD4aaviLzmIKWsCgUh4zG9vNAJjwhtNZb5FCHSyI/4TZctUfkTYfSCCo2AMPsRC6tFumCvyoy9g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7668.apcprd03.prod.outlook.com (2603:1096:400:41a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Mon, 10 Jul
 2023 06:45:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%7]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 06:45:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 2/4] drm/mediatek: Add cnt checking for coverity issue
Thread-Topic: [PATCH v3 2/4] drm/mediatek: Add cnt checking for coverity issue
Thread-Index: AQHZpCprBe8Tt23dtEuhVR6mTlSRaa+yq/mA
Date: Mon, 10 Jul 2023 06:45:46 +0000
Message-ID: <5579fba13bf27c79f0945571c5febf464d6ef98c.camel@mediatek.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
	 <20230621102247.10116-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230621102247.10116-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7668:EE_
x-ms-office365-filtering-correlation-id: b289b836-0fd7-4e19-070d-08db81114a52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slpESGUqUQcCz2UwiXLLvP7ctoF5H4PciFaUAe74nfdeMwUr5ggVbG8iy5uNoitSFQwlQa50loUGuZrYHLQGWM+kEe2H8/7r7Gf6QH0QWCYq/h0qyYQqv4TINYAmpJyRg6eEmLjHGCEMS2GTl6gtYzrGqb817J56+Cagzyg02EwyZVBo6T4trCiz4QSm+rqs57xaEd8ItTVY8fhs/DTNEmeDUpLrsr7YbwTMYehJ6FCOc/F2PotLK6BLnjtMxqpeK8SPQecCM0tiVIefRqqtSQuf/BsZufu7ytzv2i3CiPIejT9M0KJ+0P+XB1qik7vRN+HRV3taUc3cBHDZvEw6VAPV88fBAkCWg4Q3lJu69hkzZa5V+g/Mc6qv3VpitD1mItfueHi1Kt/a9YIiBJqeLy/OWmOHVUjRNr5Zjppx3+JnLAVzmfQxuNLlfaAuuL7ymkQ1pf+aSIn6vkIK6Ts9Pciy8A0yLYjZLzghoL1uEgU64G3zGojFuJSO9oBeqy0sv1x1utdBYLDCLVjzUBgHVovEO7QJPn/kE/BjFb7jo6L32RZ9pzYGJxrrZJBe3SiWvJg6prIkfF1ET6LkmZ4P9pZ8iCm3nhlE0QfAjUeW7C67CZe7IWQqzWFr2scWjIe0IhwNNDOfapgJIxu8zcP0fFynC2rSIzyjqos2cUrpFfY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(6506007)(2906002)(6486002)(71200400001)(110136005)(54906003)(478600001)(36756003)(85182001)(8676002)(8936002)(122000001)(41300700001)(76116006)(64756008)(316002)(66946007)(66556008)(66446008)(66476007)(4326008)(6512007)(83380400001)(38100700002)(5660300002)(38070700005)(86362001)(2616005)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjBWdHJDa1BmV3ZBVXhhZitKeUJINEtBNEwvMFlxd0NhY1YwbmswdXJPMmI4?=
 =?utf-8?B?bFBERldEL1g0WWFPRnhwTnQvYW9SWmp0RTJZbm41cjNMZXcrM0VBelZwc3BH?=
 =?utf-8?B?dXFyb3M5WGFzZTkvUTBDMFdpOWdPRnVsY3lvRmUzbHZvQ2hjbnI0bm9pY3ha?=
 =?utf-8?B?V3ZDdHI5bFRlVWwydXRzeVVZMklkL1J6WE5paWVFc3RwSEpWMzUybG1OZXF1?=
 =?utf-8?B?ZlhLYXhxRU5LdGQxR21FSDZyZGtjRm1QQVNLZzZHU0htQzlBMnhvTm1MTzVo?=
 =?utf-8?B?TktaU1pQYlNwQ2h1MzZ4eVhqVTVjaEtiOGw1OFowaEpYOE9PQXZ1S1JHdmZk?=
 =?utf-8?B?emVtdXlkZzVwbXZlYTZJWWV6ajJ3akhSVHlaZlptSUZmT1JRalpackhZVW1i?=
 =?utf-8?B?aTZDVXpRV1E5K3pVK0dJdHBIVkhMcDJ3SVpPTnJqZzkvRnd0RWErKzZobHJR?=
 =?utf-8?B?WTRBejFEb05Rd0dTcm9BSGxSUUl0VEhFNHI4SnZ5U0tyQWtLOUQxbm84aVlI?=
 =?utf-8?B?UGdEYzFaRTIwUmhlN0tybDBwY0s5RUdmT2RNZHVVeTdFQUIyRjd6QmtnZC9v?=
 =?utf-8?B?VnNwYzZ4SnVDSGtrQUxHb2VCVW1DSjdwU1Y1dlRZYTRvOTdVU0V2U0RqRnZz?=
 =?utf-8?B?WWRyNUdhZ3k4eE5ZNDVCQ01LcklRaWZsZ3grQmdNajNTTFJKTUpXRTgwWHBK?=
 =?utf-8?B?YStLWXB1VEU0b3FnbE5xZ0czVk5FRHA4TEFmZzVDYTd1aGt3QXVLenNjeDJv?=
 =?utf-8?B?RDltbmtCRU1kcFlaMm5tbVVWckVjZDUvUFU5WUFwUzJ0eFlaVXIzMmQ3OVBo?=
 =?utf-8?B?aUdzNU9hNjQwUDJXSGk2cTQrL1JIQ2c1eUtCSExKQlFsWnJxSXRKMzhMY0dL?=
 =?utf-8?B?ZC9vMnpRTTIrOXkzZG5zRkY4dE9HanEzRk54d1FSQTkwQjl2aG52NUJPSEpl?=
 =?utf-8?B?dTdOcEV4R3FkdktpSFluZ1VpR0EvT2lLdUV2THdYZ2ZGcURKUEhWd3gyMUJS?=
 =?utf-8?B?akdRMEdKRFhMZVVQNFFMK2VRM1Uva2dONWRSY1Q2WDlMdnNwRFdLQ0R2bEI0?=
 =?utf-8?B?bi9lMHB5ZDg3dy96dGxtTCtVRnJDRXhtZnBWVzI5RWRuOGN2UTNVSm81SXo1?=
 =?utf-8?B?SjJocUhRUFNmVFY0Zyt2RnRjdUZISVorMWMvLzZna1htRjd2TkNFNDFkZHpD?=
 =?utf-8?B?ZU1FWThrUWJibXo0eSsvbzVodWdUUWV3bUltT0VhRThweld2YWlFLzZiNGRr?=
 =?utf-8?B?UEo5RWJrVFlINmtjT2lrNGRneHhDYjdSS0NoOXBtZkRyWlFHV1F5UzRSVmdF?=
 =?utf-8?B?clZUMGFXRklpNlA4NUxrWEc2NThDNUsyNkdCS3lNcnB4YlEyQjdMallqak1n?=
 =?utf-8?B?MHl2SmZkdDlOY3RPRWtESnh4bmNNb2Q0SUl5K21QckNQc1lCdFpxVEZQM2xB?=
 =?utf-8?B?QStQdGFUMFI2Q0x5Q0RSeUFLNGEzREw4bEZDZlIyWEo2amZRcDZKYzZFQzRP?=
 =?utf-8?B?MVB3cGdMYzRucWgyazBxYlpVOTdiVTErYjBoZisxNURKRXc2S0VmT054S0lF?=
 =?utf-8?B?U1hHY3NJMUFudTFBbHZ6SmZyNjdQcUsxWHU0bE84T3ZNcTA3Zjl1T0ZqM2ZV?=
 =?utf-8?B?MkU2YlUvVG9xZmhFditTVmdzYXE1czJLR0JxYmUzSUJ2dGozVmxmUVYrOGVw?=
 =?utf-8?B?ZWp6eVM5WUxuMitZNFRUOE8weHZGK3ZNNmdENkREekFBSGZ1blBGWllXdVFY?=
 =?utf-8?B?ODlRSTBkU0FQL0RWc2JET1FTTi90U0doZUFEYk9ZMmJFb2Z4S0JUeE9KZ25p?=
 =?utf-8?B?NTd6ank0VXQ0NDZCUXRYd2w2cGVoNmJHVVlTV2IxL2lMd0RpTlJEVngvdlk0?=
 =?utf-8?B?a1VIWUovTkM3SGFLM1czVDRBNEpoUWVkTGVPdDRnS3kyb3g5dVo4OUdJV1lZ?=
 =?utf-8?B?L1pmQ2x1TiswM1Y2OU5Kb0hBS09FOUg5NDBZOVRQTVplQWFGTm8xUS82b3VL?=
 =?utf-8?B?MzA2bDdkS0U3ZVAzQkgrd3gzVHA2REZkT3NJY3NZMlJwbnVQdEpkUnUvWjFQ?=
 =?utf-8?B?S3NNNnNTRXRvS2RMZjhzNDlEQXRBSnpVYjZMeDNOeUJtK0VJZHZudFZwRXhP?=
 =?utf-8?Q?82NZibGIbpWQKxi0Tjr3gAuJG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3A98D3FA5CD114EA5A45BBFDEF3A8DA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b289b836-0fd7-4e19-070d-08db81114a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 06:45:46.3938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWQ6l0M8WIW26GGSati5ZYQ7mcx58SDBMjQ0wyd8tS8wEdigDeaZVK3WCPbTFMzl9U5XgVQxF6kX3HiMWfnVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_235557_802876_994984E8 
X-CRM114-Status: GOOD (  18.99  )
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

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMDYtMjEgYXQgMTg6MjIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQ0VSVC1DIENoYXJhY3RlcnMgYW5kIFN0cmluZ3MgKENFUlQgU1RSMzEt
QykNCj4gYWxsX2RybV9wcml2W2NudF0gZXZhbHVhdGVzIHRvIGFuIGFkZHJlc3MgdGhhdCBjb3Vs
ZCBiZSBhdCBuZWdhdGl2ZQ0KPiBvZmZzZXQgb2YgYW4gYXJyYXkuDQo+IA0KPiBJbiBtdGtfZHJt
X2dldF9hbGxfZHJtX3ByaXYoKToNCj4gR3VhcmFudGVlIHRoYXQgc3RvcmFnZSBmb3Igc3RyaW5n
cyBoYXMgc3VmZmljaWVudCBzcGFjZSBmb3IgY2hhcmFjdGVyDQo+IGRhdGEgYW5kIHRoZSBudWxs
IHRlcm1pbmF0b3IuDQo+IA0KPiBTbyBjaGFuZ2UgY250IHRvIHVuc2lnbmVkIGludCBhbmQgY2hl
Y2sgaXRzIG1heCB2YWx1ZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IEZpeGVzOiAxZWY3ZWQ0ODM1NmMgKCJkcm0vbWVkaWF0ZWs6IE1vZGlmeSBt
ZWRpYXRlay1kcm0gZm9yIG10ODE5NQ0KPiBtdWx0aSBtbXN5cyBzdXBwb3J0IikNCj4gU2lnbmVk
LW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiBSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYw0KPiBpbmRleCA2ZGNiNGJhMjQ2NmMuLmZjMjE3ZTBhY2Q0NSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTM1NCw3ICszNTQsNyBA
QCBzdGF0aWMgYm9vbCBtdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3RydWN0DQo+IGRldmljZSAq
ZGV2KQ0KPiAgCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOw0KPiAgCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZTsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkcm1fZGV2Ow0KPiAtCWludCBj
bnQgPSAwOw0KPiArCXVuc2lnbmVkIGludCBjbnQgPSAwOw0KPiAgCWludCBpLCBqOw0KPiAgDQo+
ICAJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwaGFuZGxlLT5wYXJlbnQsIG5vZGUpIHsNCj4gQEAg
LTM3NSw2ICszNzUsOSBAQCBzdGF0aWMgYm9vbCBtdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3Ry
dWN0DQo+IGRldmljZSAqZGV2KQ0KPiAgCQlhbGxfZHJtX3ByaXZbY250XSA9IGRldl9nZXRfZHJ2
ZGF0YShkcm1fZGV2KTsNCj4gIAkJaWYgKGFsbF9kcm1fcHJpdltjbnRdICYmIGFsbF9kcm1fcHJp
dltjbnRdLQ0KPiA+bXRrX2RybV9ib3VuZCkNCj4gIAkJCWNudCsrOw0KPiArDQo+ICsJCWlmIChj
bnQgPT0gTUFYX0NSVEMpDQo+ICsJCQlicmVhazsNCj4gIAl9DQo+ICANCj4gIAlpZiAoZHJtX3By
aXYtPmRhdGEtPm1tc3lzX2Rldl9udW0gPT0gY250KSB7DQo=

