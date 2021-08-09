Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3500C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 08:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F21760232
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 08:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F21760232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQKfhp1/1I3vDPLhVGND832tQwk7MifdShXHMQ7Qvo4=; b=33YKmcZ9eInfEL
	76zLZJAN3wvCgWG+AhYZ2897RWbocGOlLPq0P0MZb27Hm8swC4zA9A6Px1S71y6AcYsF69si2Qnzh
	6I6dwJeuG9tl0lkTGp+/34BTicnGjQqXMnCmFxjqn68igNFffozipL0AHZdVpq3bRguvoS8NipoQz
	eFaQQiYMxv6lBbErEDUbpyBP4K5PLuXacYMYpZuAxOHZpIxPISN6GaC7342MS9TiiIWuzSxrCA4qK
	OHCFE5KoJSeDLTZ3GJsNpgYnre1b1mgzLjYXi3dEgn33hjFNx6sqme5H+4DryEkyfFz18ySFbBqdD
	zNEwYyjK4RgmhuMoUBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD0g9-00HUmR-CT; Mon, 09 Aug 2021 08:30:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD0fv-00HUk1-3Y; Mon, 09 Aug 2021 08:30:24 +0000
X-UUID: 758ccd26879443f2bc3ffde8a7989bdc-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=; 
 b=bjaHtoUuq57REYZ0uSDD+1fjVc60j/ub6Zmat0u6CM8KxH9OzuE88GPOcISS4xBEyZXAh9LdGr7Zm4wQXyEHmQQisdObJTeIwxq5EP7M1Nvt/Ju9Dg0TW6++UKohIhXEqlhvX/dGR/JWLsLXD2GdLZX1Q6W9fDJbjk6q/nXKl0c=;
X-UUID: 758ccd26879443f2bc3ffde8a7989bdc-20210809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1044818119; Mon, 09 Aug 2021 01:30:19 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 01:30:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 16:30:15 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Aug 2021 16:30:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVjlDWGKs71VOmXBO8kZeFs/+hqrlCMNQ8x1BspR5t+8zm1XFj2w8kO0lXUZ1F4Jy2xw+5sgqguielb5N98Hov/JW4y2L/DFBbGD7UfAh6MfJR5xu04F9dQStC3/jsx7emF6eLX2EvCzhXzU69QaeMtVPO6qs7m3DJa4mMeG+r6nPeNhfso9IpbJY4LN4Tp7vkM3XmK52TcfC0fhl7eZbVSDlLilTVOrQ4L/wb0KvrTKJm/meYZAl7ZEEmLHw8l5lf2dFu2jVWH3oK056IgDgYFBKqse8qwYTqJwygVFgJ++fdgozSCPzCmHvG/eASohOfy6+CkdI5QfXgedNLzWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=;
 b=eNDamAh0EHJFkgVvyhBoXUZ75KRq2r273rP74Bn64ouyLlF9h52ONkJd4//9NF91R3IofPOGX8Nxh4j85YLCxogzrEHbM1EdXL/72XRLUnLCDfUq3YvxzT86GnBq9hKiO9Sv77EGYNoXpihGiBEsxmSP9XGYZhWqLF0CfIXs5BzuwajBzWWisPBUe5Difv6jUM5nE0+x2TqPESHNPio8R9H1TTp2ntiYen8vpAa7KaMDkMdsbw6mUW209h2G+eCx9O96Y9x3DcChIaQI33fIu4are0iQ/0vIfBGxbkQIxm9Dllo28/2gLNgQQhwU7IvJWJWOGhz/x5YyqxDgWUd1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=;
 b=giHCIMTU8mUaS2WOttAM+bQZforki7QeO6FSkCT8pFX9WtLmv9QoOlJisy/Rfmdsrx5Wni+RzusjwNlb1jbU+uvcVCXhSsBk+9z4A8bzK2mKLiMxka7q84DRQOtT248TRrmk42nFOECC/A68Q9qDzt5hR41PJ0PbTr2MeA1dqrA=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK0PR03MB4689.apcprd03.prod.outlook.com (2603:1096:203:bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.9; Mon, 9 Aug
 2021 08:30:03 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de%5]) with mapi id 15.20.4415.012; Mon, 9 Aug 2021
 08:30:03 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "joro@8bytes.org" <joro@8bytes.org>
CC: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, =?utf-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?=
 <Xia.Jiang@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "eizan@chromium.org" <eizan@chromium.org>, 
 =?utf-8?B?WWkgS3VvICjpg63mh78p?= <Yi.Kuo@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "evgreen@chromium.org" <evgreen@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 =?utf-8?B?QW50aG9ueSBIdWFuZyAo6buD5bu65ZiJKQ==?=
 <Anthony.Huang@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
 <Ming-Fan.Chen@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com"
 <will.deacon@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mka@chromium.org"
 <mka@chromium.org>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Topic: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Index: AQHXhO4/B+asb7CmWUi2ITwnwJWoI6tf/iCAgArljAA=
Date: Mon, 9 Aug 2021 08:30:03 +0000
Message-ID: <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
 <YQfALZNWyw8VKODp@8bytes.org>
In-Reply-To: <YQfALZNWyw8VKODp@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: 8bytes.org; dkim=none (message not signed)
 header.d=none;8bytes.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f64dd73b-b873-4f9b-274b-08d95b0fe2cf
x-ms-traffictypediagnostic: HK0PR03MB4689:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB46892A100ADA547C11A4E6FC98F69@HK0PR03MB4689.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e600U8MSOTRqFFhTE+TKVtab4W/AYFq4Xrxb0r/NyJKHsh1mi6nmY/o9kSimy3MxdORVSV+SNBDkdawE+CeSiDKF7Br59lJs9fKzuqr3Xuml2xHQg8zhKbpDQQbudi7WI1F43uZHcUlt8CKmU6HaSt0rOy6TXeD2SQjJ9Ox4FumvhYwHjxe/DGmsXsVQL4gUp6GV23IRkokgRqGSh3KEZ2aLfKYV5Dy3IsnN1lcZLAjyeB3f0OvMynbeahYxWtrhgZO6LgtO1mGhHimMMubjt0kbErD3kCktRqW3LZVUNNarK43FGz0ervddIXywYLyI3l7CKQr1vvQFACyNGIcjnsThd7GSAckDZpGasHBJd8yTQrU3+8JDfY5sN9MO4gtZFDjXXm8lyR82X2xR94ogyktU4tXZ/YdhqYyoRrnrex0+FeteYHpR80GL7CJWuot0IsOeCU1+XhUGAeB6coPJYW2AI1y43UWLh1zCC/2OFEEp0SaBlS92eY2QmnJe/LF0DzqC1XZY8TFV9LXXMZac7NYhTsStwSDUzOoDNAEBp4NWuQ1AXFtAue3RWi/n8hztp+5B045r7Jjx7U4qeVznSggdfxGMfuRsLA0zdn8Q3RiY3rZRDOauakUGu9Ab+k60/s5e4y0//dZTIsy9L9PZxCh7aynl4gTiZHY66eclCCeMk33vsb8Ml9t+/WYC1lbSWievfu3Xrw7EuRGgP2VTTOpHkMnyoe8InvhzB79jftk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(83380400001)(6916009)(36756003)(122000001)(8936002)(6486002)(2906002)(38070700005)(316002)(85182001)(26005)(5660300002)(2616005)(7416002)(66446008)(66946007)(66556008)(66476007)(6512007)(6506007)(4326008)(8676002)(64756008)(186003)(76116006)(38100700002)(508600001)(86362001)(71200400001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2xpcnhDY3lQTFozSEJPOXhoRTM3N0g2UDFYcERwcE1PQ1JyR0FLQkFkNWdV?=
 =?utf-8?B?QU5lVThOUXpvY0FSZHdQcHJwa0l6VjE5QlRESTBrU2M1bTh1QUR6Q2w4Rkl4?=
 =?utf-8?B?R0J6dTdPQzlKK3pTV3J4czdpWHhKU28xN1gza0V4bFFucEM2OXlCdWlJZE5y?=
 =?utf-8?B?UjdzUkZLUk5tb3IxbzM0bWp4TzhPSExxNnM1MEF6STlsWFBRLzVPbWg3Wkw2?=
 =?utf-8?B?ZGNxK0ZlMWZFWjUyUURNbEE2YXlHZTg2WG9WYktITmpibFU2MWk0N1VaQzlN?=
 =?utf-8?B?eEZJTUFSazFrdGF5RmlFRnV2UWxLYWp0RkRzLzFnNFBwWDhHM3JJNGpuSHI5?=
 =?utf-8?B?VjlsdmFNME1lSEg4UXQ1eTBKakZIeis1d2l1MzZ0U1Z3L2EzSkdMdWt1dUxO?=
 =?utf-8?B?SkllSzhtUHpJaERkUk5VMjNZNzZrOFE5T0NUS1g1ZDhzTzBKcFYxY1pGQ3h3?=
 =?utf-8?B?ZFE4TUY4Z3Z0SnZNYjBGVDNxU0pQTVd0VFVSdVZHT0Juc2dVSGxTdEsrYmlB?=
 =?utf-8?B?bTNObXkzMFVBQ01POUFFNS9YTGMzOGYvTWdvY1gyZVJEaFlCT05hNDJjR29i?=
 =?utf-8?B?V1NHUGIyUERlVXdNam1RMzB6V0R6T0ZLLzVvSHYrTUp4U1FML29EK0k5Yk5T?=
 =?utf-8?B?WWFLSHFZWVRnSzlmcjBNaVR5MTc3R1ZPTmxaQU1XaWRwVTJrcVpTWkREU1NR?=
 =?utf-8?B?NEtoMGRBaXk5V1hOZ0JGYm5CdHU5SEFzaVJud2EwL2Z6cXNqajhQbnd0bFVE?=
 =?utf-8?B?Z0hlaW5sNXdwYThmdmFwQ3QwTndXZmY1RktySXNzenhXTFdJbWd5TFJseERx?=
 =?utf-8?B?ay9WWjhpdUdZNUkrd25jSER4d1JKOWhuYUlPVkhMRE8wdmd3V2lqZk1Pa3Jn?=
 =?utf-8?B?cEVlazl1emk3aTZkbEJybjR2aDdtNzhLbmhzL3dUd1V5T2U4UzZBMjhnakVX?=
 =?utf-8?B?ZzFXUEFUcTRXbFYrWGZsQU9iN256ZG9JREVVMWtac3pHbkxiUWppZVQ0Sy9n?=
 =?utf-8?B?S25KWVYweWVyZjErdDM1cm5iejNOa0wrQ00zWnBTbWRrRkZ4d3psLzBpVngv?=
 =?utf-8?B?NE44T1JzWTBkM1Mxbm5hRXJONW9hNUlNazdlbzdzWGVzUis2YkxiU0p1c0ly?=
 =?utf-8?B?ZmZKV3ZlQ2JGeWlNNlljRjZLTHVwWWVQVlhGMm5DL2ZoSG9EdDNiUm45Y1hz?=
 =?utf-8?B?dzRTZUNzNHBuNUU4VktDS3RMS2psblpTKzBVSG0vNE0xS05hc0VnMmVhU3hl?=
 =?utf-8?B?dVZtK3E3N3NreHEva1hJSFJkaS9lOHZqbjArUmhiTmt4WlREQ1lGaC9kZHFz?=
 =?utf-8?B?N1QwWFhmZmY4R3BUVkozOTc0bGJXckRadElBK2pwTHdtaFBVK2FGRDdRUng3?=
 =?utf-8?B?czF2VG5SVmJvWGtDM2tidjFvMi9RVEVlK05GZm1uSzRsWWVoYkJEY2xudDJG?=
 =?utf-8?B?OVJ1YXVWSkJ5b2ZKSEdUK2UvUTJSd1h5ajFweFIvTTA5UGVhNUFZUTE4Uzcw?=
 =?utf-8?B?cW1mNm1oaGtLVUxDWmErUFNGWUNydGcxTk1rTVIzYUFhbFgxT3hkTWx5UG5s?=
 =?utf-8?B?UVFWSzRpclRtelYvSDB6NDRrOWtVaHZTRC9wT05KdFRudkNHWUQxLzV3YXNm?=
 =?utf-8?B?VEJLZzBVTmIrMHRnTHNXbE9QanN4anlJd1JtdzdxV0dDcmJBQUoveXlNb25K?=
 =?utf-8?B?d0xtdllWeXhwazBacGthNG5GaCt6dDhJQ0wweGlBbS90dWd0MWxBWmY5aWxv?=
 =?utf-8?Q?wOxzXQQ61T5ScEa27JmtVR7//W3pnls1ogj/9tb?=
Content-ID: <2B3C272E8D6A4B47AB989598907E21EC@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64dd73b-b873-4f9b-274b-08d95b0fe2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 08:30:03.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmwZIoouDotxgI+Tmyp5+8IFsUirUGiRFZDx+K1WKQJezdCpoBjZ/PMzRqDQ8JXL91+evnWKoT/5n9IN6qQ57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4689
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_013023_208257_4BB12F3E 
X-CRM114-Status: GOOD (  14.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-08-02 at 11:51 +0200, Joerg Roedel wrote:
> On Fri, Jul 30, 2021 at 10:52:26AM +0800, Yong Wu wrote:
> >  .../display/mediatek/mediatek,disp.txt        |  9 ----
> >  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
> >  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
> >  .../bindings/media/mediatek-mdp.txt           |  8 ----
> >  .../bindings/media/mediatek-vcodec.txt        |  4 --
> >  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
> >  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
> >  drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
> >  drivers/iommu/mtk_iommu_v1.c                  | 31 ++++++++++++-
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +------------
> > -----
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------
> > ------
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++-------------
> > ---
> >  drivers/memory/mtk-smi.c                      | 14 ------
> >  include/soc/mediatek/smi.h                    | 20 --------
> >  28 files changed, 92 insertions(+), 321 deletions(-)
> 
> So this is likely not going through the IOMMU tree, given Matthias
> has
> reviewed the IOMMU changes you can add my Acked-by: Joerg Roedel <
> jroedel@suse.de>

Hi Joerg,

Thanks very much for your confirm. I will your Ack for iommu part in
the next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
