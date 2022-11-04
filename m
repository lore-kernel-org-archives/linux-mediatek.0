Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D0C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=; b=nLIp5Fxt5vyJB9hIkdUo+zTbcz
	hKF7RsDQJDHPD+umkyHUn3/6L+1wjrxzQJIqASFLgd+sQ5lqNCTtRQw8/YL8UFxxNxfT1tlGFAJTi
	maw+wfOPl8WbHUZQ2ei6AJOlE+pAUQ5FbdOcJn5eSuyxBTyfvHk4TG7zhqGuiV3niuMZ1Tm/JFcuO
	cQdPKqTesqKlkkbIS3Rv9XnZq2mzkPp5R09u06tNosmONDChug4y7QoH/ci+Wzh7Af4yvzvN3ypPQ
	UqZwphkpNhsSgozuM+D5rDAMgXH/vzxCXezINrIei+2cuiiZKT6r1DzGQc8R3Q4JeU4GMhfl7gSkl
	rVFczE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqt4A-0036J6-RM; Fri, 04 Nov 2022 09:32:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqt48-0036I6-Vu; Fri, 04 Nov 2022 09:32:46 +0000
X-UUID: e7929959c86343a58c4c0210cf1a3a67-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=;
	b=t2rA5EVAiyq7G6nyym1e3iXS90ofs1ej9hPhTiEg268ilTakOmP8/sqL1QFTMjKiV+U9Q3wS/H0nG4BP3pA7/78tsVeVCdF4XXgNIQadF2VwmVtdvhnMZ05RuDOXBZYXrQ30WHNWurX6Nusvo3dyhw+9BKFGGEMV7iLqcHZVvPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c39fd033-963e-499e-80f5-95437884bbf2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:c23d72eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e7929959c86343a58c4c0210cf1a3a67-20221104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1531742653; Fri, 04 Nov 2022 02:32:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:32:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 4 Nov 2022 17:32:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RabtGL9Q1Oo+hHqyRzxUJXPmkVekHeM3EKfivExOgHXyQTT4DpFHpf6UmU8N1UeHeDAZCHbx7iI9qYAyWE8nlSeExBU23Tao8DwLkU9sQNVGGcmEHIO/aI6p2+uZ0DJOBwuKlyLzTnvFsLMcH5ga3mcTQLTfiYJxNYwp0h3Zf3HgL5jgbn31fLAxWVKwyiQmmK39Gg9QbpPwpfEf9gU2iIcETnbx9y30nY5ZOxL96WK7uxeQt6lAm29u5z/tF7rEwijorPgg2IkoBX8PrAbouLZI9B4/iRnODQVtpxGC4Dahwgvm/5a8LntQEc1qS7zj5ZMB8Km5oqYR8Ho5Zl/gLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=;
 b=R1I0h3YJ8aUGEK2IRv/5mK4lxiTYYBAvL6BTRyHgfUTf0v3jPlGzWA59gXZyJcJFmX77XrtWH0j2ljzpFCdlppdZtVyss92RqULjxUs5TorKH5G3eKsei9qPHbog6HnfInsp3Oa1d0aTmsoobg4xClhS7QAh2wfObYy4pEJTg91l5w9lWg1QA/LvaElRivFEQR+JpSsIsqLkshWkF+a2ek2CfzMye7+2Ofsvi11UAnADGR/fXz+sVg7ne9p2R/d1n5/ismRKOCyLUE0PXuccJsRPOMChuI7CVAavkdSiFhWJGNw5MGcDZzJJePY5gevLBj7/y06wBf1/kN2EX/tiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=;
 b=i+VVHfXsH/d64UnmNaTVVeKsE6j38D66ez01ccY4Jfo//jzTjakd1wmt8ljCYDamWzMfpgIWJojySYK37N0FpC6EytaNTT6ssWweflr5tU7JIcxJz8VZ4+am4TtAZyjleKnGMHkkWNfDcMfpmubmkHhJKGFQHDlIGkUFLVo3OMA=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PUZPR03MB6966.apcprd03.prod.outlook.com (2603:1096:301:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Fri, 4 Nov
 2022 09:31:59 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:31:59 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>
Subject: Re: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Thread-Topic: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Thread-Index: AQHY7zQIYLmWmoqLe068p111QNawC64tnk2AgADj2AA=
Date: Fri, 4 Nov 2022 09:31:59 +0000
Message-ID: <dae6f6075673919e22e0b642d1ebf2f601f94f1a.camel@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
	 <20221103032512.9144-7-nancy.lin@mediatek.com>
	 <20221103195625.azajpe3vf5kxccar@notapiano>
In-Reply-To: <20221103195625.azajpe3vf5kxccar@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PUZPR03MB6966:EE_
x-ms-office365-filtering-correlation-id: 0c984e5f-9d34-4ae4-6522-08dabe476c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: igMzmi9J2/kqAG19Oa5+JSSY2st1GditRUohy/H8C7+T+zefHFYWuBvLTblm8ptbHVPZe5cFLVlMaS9dPdeVpG8BV9QJoe7d6Ydk4ptdOHQopvT3wkIGVH5JXlnrgRfTa1e2hjRrG/Ctzx7wvm1PKHspAl9ZqOZ2Lj23w64emxXOA+XUpc4pOwSWyZ7Pg59K+ODVYRf0psa4b145vvS3SpNbUJvBDA//YM8xSds5YjIbDuaYsRxBE0v+v68Ry29MkaingeTloOpXu2tiMxzJhaflCb0UbrvsiKaLvckTfrAyZDv991IM1zlA8Z6PF6A9j5lsZxfOI+Wn1ZSzWy7MxNLQKNHD9vLXPySgDIG+j0tbJDJCMZRRXadSgVEeW8211KG9q44liJ1ZdukwJ6CQtdlrY6uTiEx8YGYy3kLCoPP+iNHTAo13xaO6u7OLXqTLC1OxtNCHvRiRd6H3i9oW+26PZimyIhZ804iFDxLPfe943TNdM1VKnh0IuJu1r0gv8LLsSYQJhSxMyD7r072h2w3X/WnRqpr7ObqGfggIFtj6xzviAqbN6abEJ7Iw5a/BomNNi6gTyJltcffv9514I0bvLQNSA4roXMhWOcKqm95Ihlat85AyO0OB9D4oo6t0UjlHGxBMWih9BsVnNI6PpTNEXdwEX40PKUJR3LzmAHwdiJbH5Bj8ZnbOGO/TSu1cKnHqiIXw6l6wTu3C/9oICWndkxq5xakFknpvOhnTkazKZCj8C49HWap7oSzc36kucXO0a5ZIY5DRzpV251mp7lw0JW3S0IjLeQRp1g2MS6pqEOvFgyKLMeKkTZRb0xu3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(7416002)(4326008)(71200400001)(5660300002)(41300700001)(8676002)(38070700005)(66946007)(86362001)(66446008)(83380400001)(6486002)(66574015)(186003)(2616005)(122000001)(26005)(6512007)(91956017)(38100700002)(478600001)(64756008)(76116006)(6916009)(316002)(66476007)(66556008)(54906003)(8936002)(2906002)(6506007)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThBMDhldFR0WmU5RWJJTDBDTGhXTWd0bVNRWlQzZ2ZGTzRvaDBUeTdJOW1T?=
 =?utf-8?B?M01rQzRYZGhkeHhTalFWUEd4eUI4M3EyUzJWYklORUJWKzc4bG9IdDZoMjB1?=
 =?utf-8?B?cmc5Q29ZVnRIZlBCaFVjSllQZEpwYmZka2VxWmJwNWVWd0pENmZSUFR2Uk5h?=
 =?utf-8?B?Tnk2RlUvZ3dGUS9kd2s3dStPSk5HSXVFekxzOVA0N0dCWGZudHJ2b2lsUTFG?=
 =?utf-8?B?RTdzSDRjU25KcFdSNnRpT240Wi9IV2JvOVBmbjk3UkE3d0p6TURYSlBVU1lG?=
 =?utf-8?B?UWNyNEd4KzNadzQyMTFlcWZaNjNDSjYzb1RKb3BFNERUbHBMSFMwZFpLUGwx?=
 =?utf-8?B?cDJYc2poTk1nMjRmRnhjSDNiSEFlYThadGZYdkc4dzY2MzZ1ZnY3bERMS1Vt?=
 =?utf-8?B?T3JWY202cTV1UUNqMWpiYmJTK3A2c2ZXd2lEOFc3VkdrVEp4RmtIRXRoTkk4?=
 =?utf-8?B?WmhMcVZHNEM1aDI4WGM3Y0xEK3M5c2JweWZoa0lvZjVPTHV5N2Z5RWhhSE1t?=
 =?utf-8?B?VUZiTE0reVVFaVdJUnhtNmtVSXFTL3Z1dHpzbFNEQ3huWFFsVWFUWFJvcEND?=
 =?utf-8?B?eU5nUHpURkRnTTI1ZGVKS3MwS0Q3bG4yMEU0NU01MHdkZGt3aTNBN2ZDNU1F?=
 =?utf-8?B?c1VjT1BNRHNwaUJISWhlQVRKdGFyNFQ4VVJxa1BNSkpJVG5oYTdyN3NnakJu?=
 =?utf-8?B?cUhZZURtR0NVSmkzdWZXOTg2Q2J5dWh5UGtqQU02ZDc0KzBXSUxGY0lsLzdi?=
 =?utf-8?B?THRqNnZPQ3BCRzZTcFRKc1N5TE85dFdwcG5XbVpCQ1ZHWEVhM0daNzJtVUpu?=
 =?utf-8?B?Yy9hNWdkN3QwZ3VWSnpWK1FnRWxSVTRlbDUraEs1Nmg5Z3AwSTZwY1lreUt6?=
 =?utf-8?B?MlhhT2JMaGFLUC9WQWR6enNTYUEvL1o4WHlDOHNqTGhmMzArdUJmMWJJbXM1?=
 =?utf-8?B?NENJbDNYZG1VTWdwTXRQbXRaQkxVYzFHL3FybDRnT0NLd2VYVjRKeEhvZDl3?=
 =?utf-8?B?UGhsUkcyMmRMR0UyUDFuUW1zYzhKU0dEaTRBK3lVcHlvWXhobkJKTlU0c1Mw?=
 =?utf-8?B?NE1OZEdyeURHalVDTGtSVmJMaXlhaUpnNWY3Q01EdE42RVN2RkN0NVFpT2xS?=
 =?utf-8?B?Q0tXVnQ0eTBnWk41aUovcnJRNXRMaUNPTXBNZU5Jc2lVNFpwSEsrbEFld2xQ?=
 =?utf-8?B?VGhaTzJQNHhlczVkcTYzYUxleWl0S1NHd2laWGNjL1N0TmYvdEJHQXIvR05a?=
 =?utf-8?B?MG83cjQ2WGpHTDl3cUkxZk8rc3lMbWRPdW1zME0wN202djJWWXo1TW0ySlVt?=
 =?utf-8?B?cnNGYnBYMnF6alBtWktYbGkzbFJQV1p2clJ1c2JsSkRQN2FTQ1l6TXNUT3hz?=
 =?utf-8?B?MWhVTDZWQ3JTcnY5UWM0Z2NPK3U2bGxsOGVtSzA5cUNzNnV1WnVwVjRJQ0lo?=
 =?utf-8?B?SURrbjM2ajk2ZzZPSElaOGovenR4U2dVSmp1RTBJNTczdjJtaVNuSTFlMU84?=
 =?utf-8?B?UmlLRUs0d09uVFI5QlN1dks1bUlIY0tSdFN0eklLdGp5RE5yWTdFYVFGVW8y?=
 =?utf-8?B?cUtVQUZaR0xZZFdDSFdheFlUbXlKL0l5REhVb3Q2dEl3SEtJWHFOVzBrVUta?=
 =?utf-8?B?REJXYXJ5ZEZXR1VabTdjci9qN2pZTEVlMTNUb1A2T2M3RjNqeHJUbC8vTmtO?=
 =?utf-8?B?K1ZJcXZoMG96ODMzQUx3V09MMGlicFdmWjhWV2hMcDdySHQ1aktNWStoTmg4?=
 =?utf-8?B?MnJDR3FJc0tIZlBCMzhFMmQ2cnZscUpJbFd0TmNXbkhCejM2cnVxOEpGWGxJ?=
 =?utf-8?B?TXhHVXQ2NUdXZ0g0b3JwejlwMlI5VElsaWp2VWZCQXRpaE9qTElwenREdHVi?=
 =?utf-8?B?ZmdsSmdMbGcvNmhoQncvNE91VzE3MmhaMjU2RURZU0JnQm40enlTRG9aWjNM?=
 =?utf-8?B?bThsWjZnUDRhTFM2cFF2SXFmY21JYlQ5WXIvN2hCeFNmaVZaWmIxTUh1MkNZ?=
 =?utf-8?B?RDNwWVdqcnU0amhDd2xid1I4ek45VXBtTzFUaFdhK3gwK24ydUhkM0MxT2tE?=
 =?utf-8?B?ZXdrMVBnQVVLOUFrYlJuYW5meXFRTjJMQWFKdFJxL3NoaUllY1U1OU1XK1Bl?=
 =?utf-8?B?NFFsMmhqN3VTb3hPemZGNFlFeE52VlpQaTRlZjBZTEc4WlJsTzZMMUdYYnJH?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF59369F5AEA5248AFDBE7C3B3098A56@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c984e5f-9d34-4ae4-6522-08dabe476c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:31:59.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwYUPBPchtnyr6ffFkGDzZcGsHogNmATZLxpaVYPBNV1iq1+Kx0AbRkGODHONDYXNJta90bVI/bMnNjprIv5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_023245_054469_A31DAD32 
X-CRM114-Status: GOOD (  16.78  )
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

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNTo1NiAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI1OjA3QU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gPiBBZGQgZm91ciBtbXN5cyBjb25maWcgQVBJcy4gVGhlIGNvbmZpZyBBUElzIGFyZSB1c2Vk
IGZvciBjb25maWcNCj4gPiBtbXN5cyByZWcuIFNvbWUgbW1zeXMgcmVncyBuZWVkIHRvIGJlIHNl
dCBhY2NvcmRpbmcgdG8gdGhlDQo+ID4gSFcgZW5naW5lIGJpbmRpbmcgdG8gdGhlIG1tc3lzIHNp
bXVsdGFuZW91c2x5Lg0KPiA+IA0KPiA+IDEuIG10a19tbXN5c19tZXJnZV9hc3luY19jb25maWc6
IGNvbmZpZyBtZXJnZSBhc3luYyB3aWR0aC9oZWlnaHQuDQo+ID4gICAgYXN5bmMgaXMgdXNlZCBm
b3IgY3Jvc3MtY2xvY2sgZG9tYWluIHN5bmNocm9uaXphdGlvbi4NCj4gPiAyLiBtdGtfbW1zeXNf
aGRyX2NvbmZpbmc6IGNvbmZpZyBoZHIgYmFja2VuZCBhc3luYyB3aWR0aC9oZWlnaHQuDQo+IA0K
PiBbLi5dDQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiAr
KysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiANCj4gWy4uXQ0KPiA+ICt2
b2lkIG10a19tbXN5c19oZHJfY29uZmluZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBiZV93aWR0
aCwgaW50DQo+ID4gYmVfaGVpZ2h0KQ0KPiANCj4gY29uZmluZyAtPiBjb25maWcNCj4gDQo+IE5l
ZWQgdG8gdXBkYXRlIHRoZSBmb2xsb3dpbmcgY29tbWl0IGFzIHdlbGwuDQo+IA0KPiBUaGFua3Ms
DQo+IE7DrWNvbGFzDQo+IA0KU29ycnkgZm9yIHRoZSB0eXBvLiBJIHdpbGwgZml4IGl0IGluIHRo
ZSBuZXh0IHJldmlzaW9uLg0KDQpUaGFua3MsDQpOYW5jeQ0KDQo+ID4gK3sNCj4gPiArCW10a19t
bXN5c191cGRhdGVfYml0cyhkZXZfZ2V0X2RydmRhdGEoZGV2KSwNCj4gPiBNVDgxOTVfVkRPMV9I
RFJCRV9BU1lOQ19DRkdfV0QsIH4wLA0KPiA+ICsJCQkgICAgICBiZV9oZWlnaHQgPDwgMTYgfCBi
ZV93aWR0aCk7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2hkcl9j
b25maW5nKTsNCj4gDQo+IFsuLl0NCj4gPiArdm9pZCBtdGtfbW1zeXNfaGRyX2NvbmZpbmcoc3Ry
dWN0IGRldmljZSAqZGV2LCBpbnQgYmVfd2lkdGgsIGludA0KPiA+IGJlX2hlaWdodCk7DQo+IA0K
PiBbLi5dDQo=

