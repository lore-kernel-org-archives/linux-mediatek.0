Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF22BC53210
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 05:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrcmwfS6+2Iu+cZ8WVitC9NHhR40T0s0ZefFCdVA/Hw=; b=ISWgVlMMXMBLD+6GOxg3YNlhx5
	YNPrp6j/1EBLXGVzQQPQR/tSAQbzfG0VFD+UnHtM3i8r2/zAltu6cOOADarNKi39uTYAB2lqXTPWF
	7CaOzQ38nReotEYCVvj6F1CJs6u+0EeXT2wytbzlp/z5BHzg6RyWO0XFAkqxRI4reHBak3Gs4sDX9
	xQuF29AVGiPFT6ipOlW0vo3szTD4PT55U5kJ2ZRia1GVAs1ZyXUiRHL7Iix7V+h2bJvoxKDWpjQw1
	ihut7s2qFG1Y+Zj8VdWtoQd5Mr0RvQVg+JPU7XKGrZaetZOu1Aw4+1ah6QbfrqR4y9iFlL2b+VYLc
	YEiQrD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCa6l-00GrTM-Kg; Tue, 03 Jan 2023 05:45:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCa5e-00Gqxm-Dk; Tue, 03 Jan 2023 05:44:00 +0000
X-UUID: 1379b78c07004768b0ce95681d6f50b7-20230102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=OrcmwfS6+2Iu+cZ8WVitC9NHhR40T0s0ZefFCdVA/Hw=;
	b=AhaXCnwhvx38MF1hv8IRiz90EwwoZWk6pRajBLzJ/S9pUL7m0K51VswounAmsIZ8vb0zekQiNNdRcK58i3SgLpV0kj2LVi5wCJAE2s3wUH23cOvhAEJuVXZxvIKPADlIGU5+sIHPqUIyddTFHOm3ArSMglBvW5UKahvU4hHFX70=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:98c04973-a108-4a89-a201-a209b0f0d291,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:6cab7553-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 1379b78c07004768b0ce95681d6f50b7-20230102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1445400010; Mon, 02 Jan 2023 22:43:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 13:43:45 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 Jan 2023 13:43:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpKD/KWP5j0IpYEgK7Z23f9L3M2or7q3hEL2yW2HYeuQzmAdXMxXJGCwifgfVAnuMza6uSLxsDCb5gSRqcAKF7uxvQifh1jcbAIfacVWX6B7aQdaW9GUJFroFBIssZ2Lw12Yu9Ytb/7cuNA7LBQ0ym8u7jShm8aRrg0PXjcq9TUvyqEONoxjrwr0LEklrPO5Z1wR+jI8zLKU0DY7WxkUKV2gw3LMWGHsfYwE/cGg5+vuX+Zz6yvML1blX8T6lzZgqjI/UrOfR+T+qQVT+lIeAKAhMF5LLg3dQ99DO36tqXFDzD1OIWEU/uQ9gpJ0i1uuLOl5dbKpIZzOCDAOncjHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrcmwfS6+2Iu+cZ8WVitC9NHhR40T0s0ZefFCdVA/Hw=;
 b=IMupWsIOllWjvaS6EJF/tPW4RsCctzwv8MypbhPXsrXhoPOy8abPzsFngQ4UJicq8SVl/+CKWll9iqWipurZpeTmMVcdoyLK+L/5p4980pTgSLo9tJT0Fe/qKT85KDII0AT/J+4WM0bOHCBu14Cjyjti4GG2TMlt1TBKRTCzacWIo2OPjfwvbedAlmSV3TITmnZJ4kWNfglDKeXkJm2yRULCVCfxKeYhX3bYHSubuS4zDyPbVQKrVcgWHCpgths9BMjiptQwUTOh9NPBigQNfT+04btDYWJO2XWXEDxneku0Qiw9dETjE1fGuCeuqPXmqgV5/KnnX6RSXaEGU9Uvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrcmwfS6+2Iu+cZ8WVitC9NHhR40T0s0ZefFCdVA/Hw=;
 b=Ixakg/uFvHfj143gxUJj0v1LdqhB3AB5x+jauzkkyO0L9HIqrI/GRy2Envoz3yODdwrJxSNp3EhdwmZUQC8C4ggo1eZUC8a5JD49gWvwS3dpkNwJXq+RD7SIev2KPiYs2nuvCeUwp6u4IJFL4JpK3UNqXBz38LZ6fKaqdiCF/NE=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR0302MB5441.apcprd03.prod.outlook.com (2603:1096:820:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 05:43:42 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::5e9b:f4cf:8d7f:60d1%3]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 05:43:42 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "bero@baylibre.com"
	<bero@baylibre.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365
 SoC bindings
Thread-Topic: [PATCH v6 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365
 SoC bindings
Thread-Index: AQHZHI5elRZMSV3IAEaOyMsCkjGZra6MM46A
Date: Tue, 3 Jan 2023 05:43:42 +0000
Message-ID: <bb6dad8a0f7efe0be352eea94da9009e9605dbfa.camel@mediatek.com>
References: <20221230203541.146807-1-bero@baylibre.com>
	 <20221230203541.146807-7-bero@baylibre.com>
In-Reply-To: <20221230203541.146807-7-bero@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|KL1PR0302MB5441:EE_
x-ms-office365-filtering-correlation-id: 4ade9312-7f8f-4fec-02c8-08daed4d78ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDBZR9xHhnW75UGSXKbJkdI6PDsH8+eIP9DiXGz3xun0ClwbOm3aHXHAwUL8lFTZPcYnHSvNApei2tnaas0Q/anqtZZ91C6DhQakrIUwna0JObprn2McfmF9kUbVLhZ6SESgRS2Jab7CrP7iJsX9wVO4jUnrSaymT8wicWTXZO/KRUhYfJn8kLX3tdMe3+qW1WwvN4AeZ/s8LiFmcEPghnTHFyyJyH+SDFA4iKjJNQWFMkfd4ybkd7bJ0hAYNstfxhR8NFuIJQ3sbAlVEk7axkJywCp+6MTWFzRzLekFhtbREVt4YxfEio9Fh/aOtaT75wyxRHqJFtoBk3s908Aob3UQDz1WaIpsSHefNf1LrS6yh3zUQgL0bpnvPrkQMvAXfMz+0C05glhog5StxYIbeuGn2zFjxweboQj79SymZj4Dt6gk9bsHyHJE7AJc8fjB6XpH9qj5YJ+HfW+Qq5ZR91sTQ2otJCjNScDbh83FAY7QK8Bdloq86tVnvZMirhM5gmRtF1dfE8YySwdV5IAjmQn0Cmvf17DTceBQHFSXvSRZbkiSxwg0izNUGK5QFJLaHn2YfHxxGWU1J7F4ysX5hMrz9W/gk9C1lR+xRSm8KGjr4jJFd8Dvz0obPpGQuHbBng1pTcUj3PjXG0YbO5iE0/f42S55MrN12hB5cP7TeQEpwS8p0rqeg25MBb8lxe7W9IO3NX6Tu69/fN+KXWfcNZvdvn/iB9VwkgvSP/aU8wXXD7j95eCo7o1EEHiaNx4XSe4uuHRBipHEkOM5DSVmyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(6512007)(26005)(6506007)(86362001)(38070700005)(36756003)(85182001)(38100700002)(921005)(122000001)(2616005)(186003)(478600001)(41300700001)(8676002)(2906002)(4001150100001)(7416002)(5660300002)(8936002)(6486002)(71200400001)(66556008)(66946007)(76116006)(66476007)(316002)(66446008)(64756008)(110136005)(22166006)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUFLbEhwWVBTV1NEMFE5b2kxWGFJOWFPRjZEVUltZHRjK1pCZU1zNWVVbkRJ?=
 =?utf-8?B?dUd3UFZXQW13SnpGSTh2dnNzazBuVFBEQkYvcEg3NHBFMXFxWWlZdW9OemxP?=
 =?utf-8?B?OWtQVG1XdjhzWlJVU3BRK3JvTHJsZ3ZxTW5UeUVrYloyUVFvajI1WTZteWNB?=
 =?utf-8?B?ZmN1MGVJZEhweG14WkwvSTdKaWpLd1JXTUt0YmNQRHhTRlV4dHd5ZWwzMnJK?=
 =?utf-8?B?ZHYzQ1NTcE1ucjdPQlgyaHRNZjZXOEtuYmhqR003RVU2UEdPdEdKaDFhTGhL?=
 =?utf-8?B?WXd1eG00L2dEWWxQUFpPbWxaWDJuUm51OEhBeUR2dHpQRTVUbTByaVZGOGVs?=
 =?utf-8?B?UG5jQjlncjlpb1AwQWpGbnpXd2wxM3hyMWtRU0RJaUVyb3hvOHA2blpucGNk?=
 =?utf-8?B?UlJLRWpkT1dVbmdpK1ZrK2V4SVJ6cnR5QzhGS1NnTWhXVWE0WEtCNGMrZWlu?=
 =?utf-8?B?NDkzL0JEeHJ4WEoxbHAwWHdIYUFVc3FMS21NQURaL21wMzVybnNxUTNNZmpr?=
 =?utf-8?B?dW1zeEJDUm4xTE93aUxLS1BuaTZSOVVZdDZNcFBwWHJTbEM3NGRZV3hhN09F?=
 =?utf-8?B?YWhvMy9yRjNEZ3E5Njk4NHdlUm4yZkNkS05vVG9ER09maW1aSllBTk9teU1y?=
 =?utf-8?B?VytUcHp3NXhqMHh0NGw4YmZ0OWsxeHI5SGlFdndFTTJVSUdUV2tnVDRsdXJC?=
 =?utf-8?B?WGQ2aVdCZ0lYcjRIemFHNXlNRzhUeHE3S3BFQWYxRG1YdWZpNGsyblN6M3Bl?=
 =?utf-8?B?Q1krVzR6NVNZL1pLSjdpSXA5VnNTOEhwaGJNaFZqbGI5eXZYQXdYM21VZmJ0?=
 =?utf-8?B?dEhhTnNQQjNrZE9OQy9vb3EvUGx1b3Joaml1eGdpcittUVp0RU5HdWg0S1FU?=
 =?utf-8?B?TXdPcHdIWjI1aXdoNWtzWlhobWZhRE4xVkpGWEw3UDB1U0RscHlLanNtQll3?=
 =?utf-8?B?NXpFc216WmpSRGxLRXdpL2VuTkhFK1BVZk13VFV3NFNkeitJalQxczk1aFBT?=
 =?utf-8?B?VS9VZkdBQ2V2N0dqcUg5alFSdnAxSkozNkloQjI1b3NqbExjR2gyc3pySzdD?=
 =?utf-8?B?bDBpZ3JyUitVZmhlYmhWN3ZnejRMc1FWaFNNb0VWdUdFc3UvTTZBU28vT2FW?=
 =?utf-8?B?RVJSZEczclZONW1nSGhTQ1FJaXpoejhsV0JwVSs3RVltSFhBM3k4S2hZU3A0?=
 =?utf-8?B?QUJOTDZIR3J0dnpJbHpnZVIxSTFEOWJwNzEvR09ROFZBNmRKTFZzZytaWWdE?=
 =?utf-8?B?VjZRcGZRb29TYVB5S3NjZVhLYlRtU0pkQTZvSXZWNWZRMUNqMWpXRW00bVZF?=
 =?utf-8?B?MXpCZFcxSkdBaVkrbDRjbGRyZ2wrU05TQzJHcmFDYnJTU0dSSTUyYmZ2RkNH?=
 =?utf-8?B?L0JtOUpLekt3UXBVNGtaakdHSjlHbVV5ZEtaVitUUCs0RUYrNUpqc05FUEY1?=
 =?utf-8?B?ZHdWbEw3UmRtaHlBcy9zaFJrOW9OL1YzVkg3V1RlclNBWkpNVHFVQzlVZUxQ?=
 =?utf-8?B?Yk1LQ0hEbE1xMEFjeFR1b2wzdW9RVDIwVmNMMm1hZDlrNkJQS1E2dzU3alc2?=
 =?utf-8?B?ZjBpWUpYNGd0RXRSb3hsSHRBRm9nUjJ1QSs1b0txeE5peSs1bmppWlZmdjBi?=
 =?utf-8?B?QU9MYlhTeUlLcUIrckM0UWJENDNyazdZZVNRN2ZQMjBhYlFCWm9CVEFyV3Ix?=
 =?utf-8?B?QXpLQ3BqUUs5SmRBMmQ0anlYenFWNVFzeklVQWVxVHNyemQwUjBJcTdqVUxX?=
 =?utf-8?B?TU4veFhqb1d0c0NaSEFLYnZpVTl3WHIwaTMwTXh6bmJGNndSSWVTbytYeGRm?=
 =?utf-8?B?YXhLTjYyUWt3bWdrUThlN0dRdnYwSHZiYWpwSCtXczJJbWhBRWdkQTlrMXpH?=
 =?utf-8?B?RFZFcE5BeURPWmF1NHViR2JkTEg5S2lHM1o2OVdnNklGZ1ZMOWlWeEN1ZnJw?=
 =?utf-8?B?eFl5VHIzMElKK09PcUNWR3RFRXlIZWppU1NIOFVhVmI1TCtKbnVsSVR2L2tV?=
 =?utf-8?B?UzdUTDRPME1ncERKYUtjYWtxbUpmMTBhQzl3MTNESzNZU21WeVUxUWh2N3ZU?=
 =?utf-8?B?a0JjM2hJOHowWWNnUkF6cG5YcE5rVko3NU40eGNWNU80RmRXeW1iU2tKQzJq?=
 =?utf-8?B?ZVB6alZwaGFzQXZlTTNEWUhweXN4UEpSbU1wY1gwTitIYUREQW9UcFRwQSsy?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DAA2E78CC9D974A8C4F4C00F9BF0290@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade9312-7f8f-4fec-02c8-08daed4d78ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 05:43:42.4120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zb9CcW5JGXghkccokn9hgGa9LNVhQJO9/d8Vx8RTWFPmLGcnt8gUJk6Pd+NFZxYd0hwUKhh3Bphe4ZsTiNNHwbEr+iRvrbNVDt6c/jk6QjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5441
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_214358_551369_89894B15 
X-CRM114-Status: GOOD (  13.60  )
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

T24gRnJpLCAyMDIyLTEyLTMwIGF0IDIxOjM1ICswMTAwLCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IHdyb3RlOg0KPiBGcm9tOiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4NCj4g
DQo+IEFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgzNjUgU29DLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+DQo+IFti
ZXJvQGJheWxpYnJlLmNvbTogQ2xlYW51cHMgc3VnZ2VzdGVkIGJ5IHJldmlld2Vyc10NCj4gU2ln
bmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+DQo+
IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+DQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sIHwg
MSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4g
eGhjaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRl
ayxtdGstDQo+IHhoY2kueWFtbA0KPiBpbmRleCBhM2MzNzk0NGM2MzA1Li5jMTE5Y2FhOWFkMTY4
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21l
ZGlhdGVrLG10ay14aGNpLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sDQo+IEBAIC0zNSw2ICszNSw3IEBAIHBy
b3BlcnRpZXM6DQo+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgteGhjaQ0KPiAgICAgICAg
ICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXhoY2kNCj4gICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5
NS14aGNpDQo+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgzNjUteGhjaQ0KPiAgICAgICAgLSBj
b25zdDogbWVkaWF0ZWssbXRrLXhoY2kNCj4gIA0KUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzDQoNCj4gICAgcmVnOg0K

