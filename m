Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EFEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 06:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJU3Bkq+uuQbkV9ge6GJokBgKXn01hZogSBvuZIWqtg=; b=T+lv8jsv3qPoaFxsM0pR59VoRL
	rQkSdbvwDVAQMRS5aatldoMHKBgTz3RhxFC8mYSyHRigKR4+78Vqy2SnQ88mQPoX0S2bl91Wq1jnf
	dISawojzkM+Oqwl91XRiLw2bx0SpbLZ5ItqcGVXjBkX8uM+dMmYYkMaET6K9uIfgXxWJ0EapXr29V
	7rKhH4heR/mq/ILiDiaK5hTgbaNCW/wLOQPOtyuzyzFQ1XaoEGHOIJv/6eUQjvPhuUEUDxGGd/Sr+
	nXw1G1PABPRw3zm+bZ9YDzd6NPqrmWpHbZsMqauz4RbvGa6uL+lJ8f/lHlonlFEywD8kqysDeTL6a
	ahTNFK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4cdR-0092PO-6T; Mon, 12 Dec 2022 06:49:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4cd9-009295-9C; Mon, 12 Dec 2022 06:49:41 +0000
X-UUID: 1bad696b3a7a47a6bf93b1add812f585-20221211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wJU3Bkq+uuQbkV9ge6GJokBgKXn01hZogSBvuZIWqtg=;
	b=eCR5iB9AZjlty2JhRiiMzAQ1lt5DD5r1LMIJ55Sgk7CckVEwBWovbTtRD96WHac4rcYMA21GiBJPPGZ85ZeFMUSXG2HWBrnJgk6It8Hfnsu0I4CUNFl15IuGrxvGsIBYBMDNiXN+qnFU0b/Ore9kKyLEk7hbkC6F9D6iE7M9Bv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:6b24375f-0d1d-4774-94aa-05e54c99537b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:644755d2-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1bad696b3a7a47a6bf93b1add812f585-20221211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 747271674; Sun, 11 Dec 2022 23:49:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Dec 2022 14:28:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 12 Dec 2022 14:28:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj5C1CVBU6bzG9nEk43qsMsIwB3UzsFO+MkDIUsep6k2yj8EhCAJytoQwqMb1+uUQa+A+RVn2Fpc0K/n4j+fodAamqNDX8O1Jy+Fr90pvP7kfzUNKZnBXHo6imUfhjHi0yxc4SgH42GfMNRn17ZKeQuPyAleCMHZuZgGl0xJQ87pxWK8sGo+P9QTE5qOIaUR/2tD/4DuGOiMmjndEUdA67H52px9Lg9rU2HQxb6pJiU/0J0FAJGTU8h8bKqZ1XGcjJ+qWwuFCpEZterXeWjY1W2lmh9oiGw8HF+zDnjYNHJMA3wroX0Yc6vFe2+qL5vB7qGRIm4IPFgvdAjUwS/OGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJU3Bkq+uuQbkV9ge6GJokBgKXn01hZogSBvuZIWqtg=;
 b=Xf3baY/bJyH1LEgMt6hTFlYGjHTOZyUGKKLg487g6KYeWeNo8NoaSfS/kgzys+HduRIak6BJi3ivnzVvMSFlpeKBsXQyESlI7S30jXe3YW2Cg/9bPf4pkqdOc5KVxWPSSUPsI+oq/gTWk1rJgtIebDm5huhh69KVWsa0ApCadMJkquWvCVJ5lQviUM7jDNiU1rTkcuNhGxDGre5nwuNpu2+UwURBlm5Ci2MzM/Uj8qYlZZnuhB3UCeR6fvbXGu1BWElsMpRkKinZcts5Y40bdJqRzVhSKZgnfwnZw6q6FV27Tcuc3tG6t8lE6aYR5ddf8G2r9RoXqPLuXHqb6PWWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJU3Bkq+uuQbkV9ge6GJokBgKXn01hZogSBvuZIWqtg=;
 b=RkuxhHmTibNZqX7FQYg8ZnXC6KnQjTRUe0frA7sPlGDMtkCqUsXXmL603wZh4Ytg4ajWHa3jB+XrNsUcMBUWE3+kc22bx6A8Kbb/Vo7qMlsVOPaySG65HYf3KfKtufTn1WqDSUY36pWHANU4Gbx3yeNBtPfpO5KdkTaFx4OL/5E=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5489.apcprd03.prod.outlook.com (2603:1096:820:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 06:28:45 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::eb3c:770d:783d:352d]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::eb3c:770d:783d:352d%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 06:28:45 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/12] dt-binding: mediatek: add bindings for MediaTek
 8195 MDP3 components
Thread-Topic: [PATCH v2 01/12] dt-binding: mediatek: add bindings for MediaTek
 8195 MDP3 components
Thread-Index: AQHZChg2SrhJ6eLCS0i0+PCiF9zeBK5mEAiAgAPBtoA=
Date: Mon, 12 Dec 2022 06:28:44 +0000
Message-ID: <a731f459237051094940bc024ede9dee75ffde9b.camel@mediatek.com>
References: <20221207084412.14075-1-moudy.ho@mediatek.com>
	 <20221207084412.14075-2-moudy.ho@mediatek.com>
	 <20221209210631.GA3840519-robh@kernel.org>
In-Reply-To: <20221209210631.GA3840519-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5489:EE_
x-ms-office365-filtering-correlation-id: 3980110a-aa53-4e5e-bcf6-08dadc0a1ed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +BZJfLtgovtRT+H75tYDidcl473GEhp2rPHkddTJ3aWVuakEhHNyXkpNPrU4W5Cf16aQkClgkIARoDaKJEBNyo5tTtFjKme1BaFv31OHYXHinaE0PpCTqKGdve0lRk2dLLemdQqVU2GozHOqTSYQJwj3qwz0yK+ed7O6nOw9O+W2JLAw3kFhlIpeHK3qMnT2nWAQ+tA6BFTFfhMCHzznabRSrq2AOC55pU7wBDST9M1NcrK1+YTtusca8AlEgyerhizY8L43MrKvakL7Ln0UM24KNBh1SWzBGuupRIGVBchhDAinbEmxBz3Y2MbP/RyZoR4TJLc939UtO0hZreyyM3YqkdpBXYRfBXSHEUCIlHcmM69TLHoZ/aG4z+/kml0TL85JMM9eUbDIfVvumZDmCAV2pLpKUJolBkg666oSCXIpZCYm9nrldFAhjOC1SiXSWbGJ1gQE0oSab0YyhgsX383kkM8wZqrRJD4C9ZL35UTquSVcb19O+eWs0+StaL3m+anxKKE5x+UJVUcs/B517pBYOYfVNPnqdnkdFJfaMbth6yeAMv+1LYwW1Fo3QCxaR1F9MCAnePS2Y/ng5Z4XJxlFF7dOKuOM11V8z59qi7AUydZEzGOAoKnfK2PEGDPo2xE/Loj7rKtjzjXiAaawYot1fX5ufMbrFwqoogF6+tmPpNqQL33ZKRpwmGub5nGNi8hYZ3iNSPdYmYznxu7X3UNHGiY0roXb50IEHnfAS+jdQxUlAlZz/GNHjd5isUTRhp8hVjB190YUga4tV5z5YY5vKArVcW2+ffTSyRXG3yXbbXeScAsm/nORJkee0CZouNdsxhlhwrqQIMQ0wd7WHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(54906003)(316002)(6916009)(66556008)(8936002)(66476007)(64756008)(66446008)(41300700001)(83380400001)(76116006)(8676002)(4326008)(66946007)(36756003)(85182001)(6512007)(478600001)(38100700002)(122000001)(86362001)(6486002)(38070700005)(966005)(26005)(71200400001)(186003)(2616005)(6506007)(2906002)(5660300002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3FKU3MxNVNDQXV2S3VYRzlhd3Nta3BkcjJ3OTFicmF4UGs2cThyRTRDZmFL?=
 =?utf-8?B?Umd2SVlvRi9TNUxFTFFHaGRucmF4QVcwNGl2bjEwenFTcWxJanpHMi94TmR0?=
 =?utf-8?B?S0RRdVhzcmZLbHFGMVdTaFp3TC9hcFZFd2lkTTN1ZDg1VGt4L1UzQjZDMVRG?=
 =?utf-8?B?aGNWUm9nelg5bnBsemVUOWhidFVoWmpWWEF3dDg2cWdNbmhBdUtwL0dCYXor?=
 =?utf-8?B?SXlLeTJ4RmdSYjlkWlRDUTJOWEhUU21XQm80cEp5R1NLdTN2ZnJBbm0wYndr?=
 =?utf-8?B?cjdHd1ZKNWIvUEx2a1lOVEw0VURDYXYyRlh2bElwQjdzVjlrMkdyZUhZYjNC?=
 =?utf-8?B?ekhYYzZoYm9tNUNYSHJPUGZ1akQ2RTFxMUd5VWVFTXhpY0xYZ0FVTHZRT0J6?=
 =?utf-8?B?aG5CSHovT0FialNxZlRKNEFiQjAvejZkcCtTeDRIc09GQWJDY3RWVGJvWnlZ?=
 =?utf-8?B?WU9CU0hMblpFendUWHA1Y25YYm5BYmc0YU84S1RtU2tjUlpWdlVhV3A0QnBp?=
 =?utf-8?B?eFVhTlp2dmJBWTZHcnhnMy9UT3FPbFByOXpQWDB5NUQvMXN5cEVQR2dKT0V4?=
 =?utf-8?B?Vk5DeUVySlR4clkvd2wyMmhhV1ZtaE9Yb1FoaEsyWlVIeUx6OWxTOWhiZTdr?=
 =?utf-8?B?UEdyMDdEWW8wRlhNenk3K3VScUJaTmRDZldvTWRtMUdOQzV5a3BBOFp6a0xn?=
 =?utf-8?B?WkFCOHZwRmNXdEFPK0xjL3FyWHd2R3Myd3lCTE5mZlRmL09Sa2E0enJLaHJO?=
 =?utf-8?B?aXdrblBUdU8yeVV5TjlreEVZVFVBRklSMkJrME85c21GQWtmOFJCM2x0NXNS?=
 =?utf-8?B?ZTcxZ0lDUXd2UXN5SmJKNG5HK096YXJ6ODM1Ykd1WTBqQVRIczBTcktxbnc1?=
 =?utf-8?B?YjlUV2h1QXZZbXlCa2lkR3lYdVpGZndNMU1jR3JhYXI3WDZxN2JrTXNUOVM0?=
 =?utf-8?B?aXdkMjQzZUI4dzFURE9yb0NEajRIdkNuSXNkSWFqTUZxYVM0dDIycWNrYzIr?=
 =?utf-8?B?MHkwM1pTd0wwVUpBakJGbzBWcnd4cTVHQmRJSEtqMUlIZ2tXTmdVU2Zkb1JC?=
 =?utf-8?B?SG93MGdEUjJ1Q1JSanFOdU9WcGxwNjdDa3lmOUdnOThKZUd6MXpacko5RzZh?=
 =?utf-8?B?ZjljeTR0NGlvV1hyWjhMYjdiUUNhaHQ0UTNJKzE2eVhlZ3hVekZrUXN2bDFs?=
 =?utf-8?B?L2pudjN0MWxJSXNpQjYwQ2MwV3FmVXFsR1hPYkJtMzlVNmc1NlowdGRGNzJz?=
 =?utf-8?B?UUtBL0Rqc0tseUljS1BEa2RpeHYrSCtWSXZsbE9nVmIzL0JsNmlWZFdYR1N3?=
 =?utf-8?B?ZFZlYlJhYVNra1k2dDJZVXlHNXhkNVFzOXJtRmFTeEpHYnJPcFlSRXJYcmd0?=
 =?utf-8?B?dVhJNldpYm4vS1c4Mk11M1M2NEM3U3hNc002MnU4T3VQWWorak5PaFdjSGZD?=
 =?utf-8?B?RXcrM08rSFdreG96YUxOb1ovalhrekNSNTloa1M0NEdNejFEeGtsK3ZjOGEx?=
 =?utf-8?B?Yi9yeHRTRjdvMjZBMEVjYUxpNitRREwyRngyKzN4NVZubEZEUXJ6eEZGVkp3?=
 =?utf-8?B?N2pLaHlaTXgwR2l3VG9OOXFrekRyVzlwYUJSV1VEVVNqWVliT2o1Rm41YUVY?=
 =?utf-8?B?bXJtZGFxUWl4V21vNlorMjlTbVIvMzdkNmZ6NTNnSmUvSGIrUlZRZGxub09S?=
 =?utf-8?B?eWsrMk9QVUdGUlgvakFpcCtDVjNwMUdUV01wVWRpMmJ4TTEzVld1dnZwK2Q5?=
 =?utf-8?B?THJjdWpqNU01ZTZuSVBHMkhUM0JVZ2w1aitKWE9IVDZMc1FOb2dYWUtNZ0Yv?=
 =?utf-8?B?YitNUExJSnpUbzAzNnl1Q0JTKzRoWmt4ZHc2TDdQaXdZZUFmSHNvVVN0Tzlm?=
 =?utf-8?B?ZStBSGpXZmUxYUNnem5jN1I0OWNUWHFRMUJDeGk1T1ZwZUFybDdrdFJkZWVx?=
 =?utf-8?B?QlZ4dDQ0KzBrMmgvSlJvQXUvV0RYdWZnckFWNHVGTVgxMFhmTnpGeFdxNUZM?=
 =?utf-8?B?WnNDdkk3Q1Zld3NvQ2ZyQ3M5MUNWTkYyeVhmbFNnbFpscnBVVC9xeWNtKytY?=
 =?utf-8?B?QmYzeFFJZmF0NDhvNTZSNjJMK0hPbGh6NWtXcjVZWEZ2OUtTYXJMaUsyKzhy?=
 =?utf-8?B?K3E2STREdnVWMWd2bVNIck11bTE2R3Z5ZDF6OGs5OWNDWWVxenlCNWZFRkRC?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <855692C5916D504C8063175F6E9901A1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3980110a-aa53-4e5e-bcf6-08dadc0a1ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 06:28:45.1494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pUt+4KaIfi05S8O0wOsjD3m5DxwnHLl41f4T3/owuBR32CGGrzbstPYWXvmmfS6xrf8DT/PsFIjjbB+W0CvoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5489
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_224939_371625_285F51CD 
X-CRM114-Status: GOOD (  17.42  )
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

SGkgUm9iLA0KDQpUaGFua3MgZm9yIGhlbHBpbmcgdG8gcmV2aWV3IHRoaXMgc2VyaWVzLg0KDQpP
biBGcmksIDIwMjItMTItMDkgYXQgMTU6MDYgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBP
biBXZWQsIERlYyAwNywgMjAyMiBhdCAwNDo0NDowMVBNICswODAwLCBNb3VkeSBIbyB3cm90ZToN
Cj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgTVQ4MTk1IE1EUDMgUkRNQSwgYW5kIGlu
dHJvZHVjZSBtb3JlDQo+ID4gTURQMyBjb21wb25lbnRzIHByZXNlbnQgaW4gTVQ4MTk1Lg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLWFhbC55YW1sICAg
ICB8IDY0DQo+ID4gKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWssbWRwMy1jb2xvci55YW1sICAgfCA2NA0KPiA+ICsrKysrKysrKysrKysrKysNCj4gPiAg
Li4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtZmcueWFtbCAgICAgIHwgNjQNCj4gPiAr
KysrKysrKysrKysrKysrDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLWhk
ci55YW1sICAgICB8IDYzICsrKysrKysrKysrKysrKw0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWssbWRwMy1tZXJnZS55YW1sICAgfCA2NA0KPiA+ICsrKysrKysrKysrKysrKysNCj4g
PiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtb3ZsLnlhbWwgICAgIHwgNjQNCj4g
PiArKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAz
LXBhZC55YW1sICAgICB8IDY0DQo+ID4gKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yZG1hLnlhbWwgICAgfCAgNSArLQ0KPiA+ICAuLi4vYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1zcGxpdC55YW1sICAgfCA3Ng0KPiA+ICsrKysrKysr
KysrKysrKysrKysNCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtc3RpdGNo
LnlhbWwgIHwgNjQNCj4gPiArKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtZHAzLXRjYy55YW1sICAgICB8IDYzICsrKysrKysrKysrKysrKw0KPiA+ICAu
Li4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy10ZHNocC55YW1sICAgfCA2NA0KPiA+ICsr
KysrKysrKysrKysrKysNCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgNzE3IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLWFhbC55YW1sDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlayxtZHAzLWNvbG9yLnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1k
cDMtZmcueWFtbA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1oZHIueWFtbA0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvbWVkaWF0ZWssbWRwMy1tZXJnZS55YW1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLW92
bC55YW1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXBhZC55YW1sDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtZHAzLXNwbGl0LnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtc3RpdGNo
LnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtdGNjLnlhbWwNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21l
ZGlhdGVrLG1kcDMtdGRzaHAueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiBhYWwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAz
LQ0KPiA+IGFhbC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjViNTllMDgwMjM1Nw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiBh
YWwueWFtbA0KPiA+IEBAIC0wLDAgKzEsNjQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+
ICstLS0NCj4gPiArJGlkOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWssbWRwMy1hYWwueWFtbCpfXztJ
dyEhQ1RSTktBOXdNZzBBUmJ3IWdESUZLV3NjTVU3cm9OVGJkQTEtQXl6enJ4Q3dBN0VyUGtrRi1P
YUhvOVVVOFk1M19TR2NWaE93cDZkZ0I5aFJoTHptbW9sNTNTcWxxZyTCoA0KPiA+ICANCj4gPiAr
JHNjaGVtYTogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchZ0RJ
RktXc2NNVTdyb05UYmRBMS1BeXp6cnhDd0E3RXJQa2tGLU9hSG85VVU4WTUzX1NHY1ZoT3dwNmRn
QjloUmhMem1tb2xUemJPUzdRJMKgDQo+ID4gIA0KPiA+ICsNCj4gPiArdGl0bGU6IE1lZGlhVGVr
IE1lZGlhIERhdGEgUGF0aCAzIEFBTCBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KPiANCj4gRHJvcCAn
IERldmljZSBUcmVlIEJpbmRpbmdzJyBmcm9tIHRpdGxlcy4NCj4gDQo+ID4gKw0KPiA+ICttYWlu
dGFpbmVyczoNCj4gPiArICAtIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+DQo+ID4gKyAgLSBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4g
PiArZGVzY3JpcHRpb246IHwNCj4gDQo+IERvbid0IG5lZWQgJ3wnDQo+IA0KPiA+ICsgIE9uZSBv
ZiBNZWRpYSBEYXRhIFBhdGggMyAoTURQMykgY29tcG9uZW50cyBpcyByZXNwb25zaWJsZSBmb3IN
Cj4gPiBiYWNrbGlnaHQNCj4gPiArICBwb3dlciBzYXZpbmcgYW5kIHN1bmxpZ2h0IHZpc2liaWxp
dHkgaW1wcm92aW5nLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBtZWRpYXRlayxtdDgxOTUtbWRwMy1hYWwN
Cj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAg
bWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAg
ICAgaXRlbXM6DQo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSBvZiBHQ0UNCj4g
PiArICAgICAgICAtIGRlc2NyaXB0aW9uOiBHQ0Ugc3Vic3lzIGlkDQo+ID4gKyAgICAgICAgLSBk
ZXNjcmlwdGlvbjogcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjog
cmVnaXN0ZXIgc2l6ZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSByZWdpc3RlciBvZiBjbGll
bnQgZHJpdmVyIGNhbiBiZSBjb25maWd1cmVkDQo+ID4gYnkgZ2NlIHdpdGgNCj4gPiArICAgICAg
NCBhcmd1bWVudHMgZGVmaW5lZCBpbiB0aGlzIHByb3BlcnR5LiBFYWNoIEdDRSBzdWJzeXMgaWQg
aXMNCj4gPiBtYXBwaW5nIHRvDQo+ID4gKyAgICAgIGEgY2xpZW50IGRlZmluZWQgaW4gdGhlIGhl
YWRlciBpbmNsdWRlL2R0LQ0KPiA+IGJpbmRpbmdzL2djZS88Y2hpcD4tZ2NlLmguDQo+IA0KPiBI
b3cgbWFueSA0IGNlbGwgZW50cmllcz8gVGhpcyBhbGxvd3MgYW55IG51bWJlci4gSWYgMSwgdGhl
biB5b3UgbmVlZCANCj4gJ21heEl0ZW1zOiAxJyB3aXRoIHRoZSBvdXRlciAnaXRlbXMnLg0KPiAN
Cg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24gaGVyZSwgc2luY2UgdGhlIEdDRSBjbGllbnRzIGFy
ZSBhbGwgdW5pcXVlLA0KSSdsbCBhZGQgYSAibWF4SXRlbXM6IDEiIGluIHRoaXMgcHJvcGVydHku
DQoNCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArDQo+
ID4gKyAgcG93ZXItZG9tYWluczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICty
ZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gbWVk
aWF0ZWssZ2NlLWNsaWVudC1yZWcNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gcG93ZXItZG9t
YWlucw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+
ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9j
bG9jay9tdDgxOTUtY2xrLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ2NlL210
ODE5NS1nY2UuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTUt
cG93ZXIuaD4NCj4gPiArDQo+ID4gKyAgICBtZHAzLWFhbDBAMTQwMDUwMDAgew0KPiA+ICsgICAg
ICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1tZHAzLWFhbCI7DQo+ID4gKyAgICAgIHJl
ZyA9IDwweDE0MDA1MDAwIDB4MTAwMD47DQo+ID4gKyAgICAgIG1lZGlhdGVrLGdjZS1jbGllbnQt
cmVnID0gPCZnY2UxIFNVQlNZU18xNDAwWFhYWCAweDUwMDANCj4gPiAweDEwMDA+Ow0KPiA+ICsg
ICAgICBjbG9ja3MgPSA8JnZwcHN5czAgQ0xLX1ZQUDBfTURQX0FBTD47DQo+ID4gKyAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZQUFNZUzA+Ow0KPiANCj4g
SW5kZW50IGJ5IDQgc3BhY2VzIGhlcmUuDQo+IA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBpbmRlbnRh
dGlvbiBtaXNtYXRjaCwgaXQgd2lsbCBiZSBjb3JyZWN0ZWQgaW4gbmV4dA0KdmVyc2lvbi4NCg0K
PiA+ICsgICAgfTsNCj4gDQo+IFNhbWUgY29tbWVudHMgZm9yIHRoZSByZXN0Li4uDQo+IA0KDQpT
aW5jZXJlbHksDQpNb3VkeQ0K

