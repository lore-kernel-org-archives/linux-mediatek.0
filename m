Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C20C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlgJvpkbXymrUkj3Ht5QyZQ2y5+mgMCVwVPzb99bV7Y=; b=BMrUZtpcGn+Ae7nWHtCYwFq10N
	B/z9YX9hXxucNuMTxrTCfxagFqTgNzIXET2eTQmYY/1jbsTxB3nzrs/h9EUw89EFJ0YUBQKFQQ356
	Q5fbm0lFqhuoWGu7tUglv9AJhje88YPQ5V+ebtWK+kXC8wRzUSQHUVNNGNlZyOxDv0urv0KXahDBT
	ymErkmP1LylEDUSpFd+kWIEV50L2u4fqcCPR/zmy330UEVt44yBfZtMsVLbaiRYxsEtR05aXj52UK
	o9X8Txl3C+JMCFfAzujteLP9LLC3Zr4hKM2TfY3oMGFpFaG0UvFgBPyc174q7A+4PH4U6+sjPCA7J
	lMfYjdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8isU-000aRb-A9; Tue, 05 Jul 2022 13:46:10 +0000
Received: from mail-am6eur05on2118.outbound.protection.outlook.com ([40.107.22.118] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8isI-000aMq-6Y; Tue, 05 Jul 2022 13:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaTo+eC4CPKeSYn3I+ABRlhGh6vcrfRQVeUR0yK7mqeNW7CvClhkcCrgFDT6mu8W4vHB6wKpyapshJ9G/ixofNUvPiZ3+ZXqS759fqQNxX2hAeKWT3Ce4bZz+yFjw4B19PBpm8/hwxeZkc22v7UzUfLNH/NQpdTrjz8d4/ZeFbXrnqMf/LRJnqNWOzT26O5EaJ1icS+boYVvD+B+l/EX81P6zT8IkCJUjzM3/PM1+gRa8IagtLekpo8EaVwAMa/s1PvfZLZmBwjH8j52qunWIg8/jpxInzJw/fU+bxhA2DaWtgSny4BiQ86gdar6UG5EeX3BpMieE3kZURybGQfeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlgJvpkbXymrUkj3Ht5QyZQ2y5+mgMCVwVPzb99bV7Y=;
 b=OLtrzDtYKcBR0q5dzbmw9d8LzgD3DeUo3mEfaiWnJ/L+7DC1AzIsFFHIECTR04q9kUp2q8nqU1NtxXou/kR7e1J2wrb21r7itj8oOVJCSwzvjWtkv4crXULPxyRGvniPt38/jhzTXG9ApNDQrRKiAMalwToKgFkC1mI0oNOqhZ8IZjc6t8HdaHfd0LIML1TANCrdWuxamd3U63sq+1VKdVJ2fKVWKKKaZ9CvsbMFEyqN0xBMZDWc1FSdshQkKnR1oH+aMBb0IjU3qBi1w3SsIspEivSWsF9ltYs+jpyH98QT2nCQexnOlPVfaXtIlQvGbRYSQ4MLiHFTKvhRnAmqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlgJvpkbXymrUkj3Ht5QyZQ2y5+mgMCVwVPzb99bV7Y=;
 b=pRjLHm0YHTBSJj6jd59TA4/rKKBsN77ZfGaL3pdyyEKI9CeRAjcQzgN0tODFEW6Ifc0c6VpWTbKT5Ukao3TqjId2kE4tP40En2yfQquI0rTxIIrfOyIBLiqEaFzPAbwkUnk7jfVPMVGDgbYMg2Ezw+T9Q3G9gv4xxwcwjlcoQYk=
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com (2603:10a6:803:75::30)
 by AM6PR03MB3559.eurprd03.prod.outlook.com (2603:10a6:209:2e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 13:45:43 +0000
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::de7:d0ed:2d93:9f78]) by VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::de7:d0ed:2d93:9f78%6]) with mapi id 15.20.5395.020; Tue, 5 Jul 2022
 13:45:43 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil
	<claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, DENG
 Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Florian
 Fainelli <f.fainelli@gmail.com>, George McCollister
	<george.mccollister@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jakub
 Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
	<Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Sean Wang
	<sean.wang@mediatek.com>, "UNGLinuxDriver@microchip.com"
	<UNGLinuxDriver@microchip.com>, Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: DSA: request for your help with your DSA driver
Thread-Topic: DSA: request for your help with your DSA driver
Thread-Index: AQHYkGnx7PT3cs5WfE6XFbY6GtXoWK1vyjUA
Date: Tue, 5 Jul 2022 13:45:42 +0000
Message-ID: <20220705134542.u4hi5acol4ws5mlo@bang-olufsen.dk>
References: <20220705142236.1fab0033@thinkpad>
In-Reply-To: <20220705142236.1fab0033@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7737c004-265d-4cc9-8697-08da5e8ca7bb
x-ms-traffictypediagnostic: AM6PR03MB3559:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CUoCLwNmMt0y0AMC7i/ftnZ9XgKMw+zoIL00pPHRF17G9elo4bV2aSa3haHZDVaffsaiV+/H3Cqd7zhquNVQ0FabXlmkXPj3Gd0MmI7MGJmn8gIuGRsYZBuI/fegmG3kC3NDNcBxYV54oZV3J40NAYDtfgwLXxUsLbFei4ltXFUJJd6HQrCrfexzt/64TB6KmVNC8fnipf0vuomKsKwP7/zWvEbbD5KN2yk/WQeQYTUmCmhvIV8xHnl2guzvszJKUClIxk5deykIBSk/gcuLqT3ryo/WzqPpkjCc55Jn2k6VvYlmgM1FgOS1r9FeXX6Tl5YK/ZPtiBLd+lqdv552wRo4xgr4zeXzL+9hcVC2iDtrba5O0lKrVzwVGaWwod7Vodys9hcCwVxZff3mYLIjm8SBjP5xYKgGb+/4BGEe9aMzDr7q/hreNDP0fxMNcZiVTkH1mVaPK22FRnr6TGoLtFWd3WnI1MNEsL6zxEUZMz+MidWYTD4RWn4pd5eDVuBoiaHOfTV0V+GkiONEJcxk64wbJTPihor5JvUROfZTngVGrEPbgnW6wiUrVAwZYC8Km4SbK5HucEtQ0XqzIBXIG2avJ3BBDKPRoaRy0reWco9Qzn4v7rNaSp7AslLmeLJNBPuchvaSIsaMynVaanrN2ZaC8MOnLCn5pUA52bmqrjAP0I6rxm9aT2ZA0uDmjaWpTv63VNfHn78jeM5rMG0yzBXK1bQJJmSApySZkyQHYzdTYqj7Ta0MdSFrQs+fwvSEuvo7kX9WzOX/JepOHsP584/mzAravyFkykCcexPyo7QiMAU2rqI1dc5E2vc+yGPS
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3950.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(478600001)(6486002)(86362001)(2906002)(122000001)(38100700002)(38070700005)(316002)(66446008)(8676002)(66476007)(4326008)(64756008)(66556008)(91956017)(76116006)(66946007)(71200400001)(6916009)(54906003)(8976002)(8936002)(5660300002)(7416002)(1076003)(26005)(2616005)(85182001)(85202003)(41300700001)(186003)(66574015)(83380400001)(6506007)(6512007)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d2NxdjgrVEpGZ2lIa3oyMjBnWW1IbWF4UDBUV0lkYkJLV2lDcFp5cW9ZbHlC?=
 =?utf-8?B?bndISmJ3TFpuNEtxZFJmY0pRdTEyN0ZiOTY1SE01eS9zNEtpSVd4ZG5FM2pW?=
 =?utf-8?B?ZFJEc3NCOThvbTJoVGVuRTBSVnVnNjNWUjl2R3BxbDFnOGFtWnVpNVg3akRX?=
 =?utf-8?B?ZHU0dHh0WGxzMUx2L3dIdGFDL1pjS2xid2loWDhyellYVzk3Znh1RkJNUldt?=
 =?utf-8?B?ck1Ka0lqZk8wR0d0NEJKU3NVbzNKdis2RnNna2EycWVUd0lqQnFyR1JPb2h1?=
 =?utf-8?B?RWxVSkszMnNQN2dDMGVJM1ZDQS9JU0RZVVg3WHptQXo0T2hLbDJqQlRIWDgy?=
 =?utf-8?B?WDdLbngwUDJjVTYwU2dsMmx3d1AyWlBDNnplMlVOVnhqMmd6WnRIdWtsR1gr?=
 =?utf-8?B?NUZIbzg2bTcwZTdScGUvbVBLM2l4REozYk5KRFJKUTU5RkNlbzk2TW1RTExT?=
 =?utf-8?B?SGx3cnpsQnlZTXI4SG55cldmZmwwSlNYTG00Yi85ZjAxWHpJSVl3NUhwRi9J?=
 =?utf-8?B?R0FZRmpWbk9NR1ZSM2FZbDZIMnl1d0dGcTlENks3T01udTRWTjhKWWJsSGxP?=
 =?utf-8?B?SDRwWjFid1NLQVp0L3dLWTRzNEdsWlRjcDJDaUxLSThCbnRDU21Lbmt2Qzlr?=
 =?utf-8?B?M2FrMlRXajJabmU4cU1hQVRlN29FUXFkVEo0K0pKQXNyMExTaWFUVnI5aGRE?=
 =?utf-8?B?cDZOanEzTVgrTUJUVXVGektjN3o1WWc5Zm5ta0crZHJ5SGh2MVhyRWNLS1Zv?=
 =?utf-8?B?ZnpXYUdERDlBSXBUOStZa1Axazh0MHAvbVhJUFh0a0IwRkdCRWpRS1cvSFBi?=
 =?utf-8?B?K1drUnIxNUx1dSsyWk1QWkxRSmlvY210cEh6T2tJZWkva3hoMEV6QjJIVlRW?=
 =?utf-8?B?Ykx1d3dYWjRlTFNzQ3l1TXNmeDgxV3orT2MzMTZudW9LZXVUalNwYlJyelZj?=
 =?utf-8?B?WS9TdWVPRFlhb0ovY2ltSkphZmJaV2pkSENwTTlESGdsQ1RFMG56WnRkQUhI?=
 =?utf-8?B?YXo2WDg1L3JPUTZVWHBrT1RmUlljOVpoM21NaTZKaW43QjJBY2pXVWhCTHJj?=
 =?utf-8?B?aHN5aThxbkY4QVpoSkw5bUFPdnQxem5OMUlhMmI3RHRMNWRvQjR3ekN3V0ox?=
 =?utf-8?B?VVJwNWJPTGUzcWRzNXNQK3NMWC9PWlcyejUwN0hCTzM2YUVwaW9lNWtmazVi?=
 =?utf-8?B?M0FxclpXOFdXQ0MrRmN4TWxEUmJwT0dnSFlkS3VZL3IvSnVkN3Y2T3FHWkYw?=
 =?utf-8?B?cU81N2VlNVpXMkt6V29hdWxSTVhYUFFpT3dJc3ZsbU83SXdkMHQxeDRjZlJR?=
 =?utf-8?B?UmFoT085QnJFTFN3R3dZcVNSWHM2NEY1bWpmMFRIRnk4Y0t6K3FwV0xZYmlU?=
 =?utf-8?B?azlseFZvdHNHKzRWc2VQVHdqY1VIRmIrUy8vTmVmOXpHVkNRUmV3bWVsaSt3?=
 =?utf-8?B?TndkclNCaHlFLzFRc2FRQmRhZmZKUHNjK0JBekgwZUdhSWZ1L2lhZGdoN3Jn?=
 =?utf-8?B?Y1c2ZittS052ZlBIRHlrTVpIWFNPNFQxWFRmMDJTam9WTTZjOHVPL1JrQmxy?=
 =?utf-8?B?QW9aYndhcVdBOEpDWVRFb0pKemQ0QVZVakVVT0xYcVhHMi8yaDdnUWtMcXRD?=
 =?utf-8?B?MFBHOUhFM292YWJtb1o4dVJrMCtWVWN1czJlZk15WjlaZmpyOTdlM2tqYnQ5?=
 =?utf-8?B?S2taaC9vZ1dBWTh1R0JBRXd2M0JvalVhbTVvUVRTc01xbnFSZ3FZZ1VkR2wz?=
 =?utf-8?B?c2lEV3hwcnA2T21CemNaUWUrMzlnOVE0KzZMTGl0cm5xcXpiU2pDVXJacFBj?=
 =?utf-8?B?NGtadmluS2xCVjhRSHJnR3VMRFVpZVhxNjR1bFZzWjVERWl2Tkplclh1MXJq?=
 =?utf-8?B?RG9vUHdCMDBrU256UCtCcUxMK1hPNjRveHdpRFFYemJ0UkV0bkNyazlyREpN?=
 =?utf-8?B?aStBT0YwT2s3elFlTnJ2ZEJkemxGdjg0OENaWFhHM2RNdC8zRWg5MDlqT3ZY?=
 =?utf-8?B?bkxXZDVKK2ZKOHVQNnZBQmRRU3NtbTRGUllZU1VIRWJXYVNENEFpT24ySkd2?=
 =?utf-8?B?WFA5aWN1cW9LckhMd1JRZEJxNDExUHU1UnRDYmFKdUVFdksrdDFrMDFrcnpE?=
 =?utf-8?B?ZnRIUVdlNHJ5Nzg4SzVTK0ErVk1YdXYzdG1EOE9kZHZJL09LNmNyR1l0S0JN?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D6B5C9A1E56944EA16EC55DA253D0D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3950.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7737c004-265d-4cc9-8697-08da5e8ca7bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 13:45:42.8551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZdOGYZXZtxcpuMLgdhpm3vxDBTU+K5cllFLRwZH7vyfom7e+WyRFVt16NHoMA101AfSNhJIWrinazbRUs7V7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_064558_592201_BD8F166F 
X-CRM114-Status: GOOD (  20.93  )
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

SGkgTWFyZWssDQoNCk9uIFR1ZSwgSnVsIDA1LCAyMDIyIGF0IDAyOjIyOjM2UE0gKzAyMDAsIE1h
cmVrIEJlaMO6biB3cm90ZToNCj4gSGVsbG8gZ3V5cywNCj4gDQo+IHRoaXMgaXMgYSByZXF1ZXN0
IGZvciBoZWxwL2NvbW1lbnRzIG9uIHRoZSBEU0EgZHJpdmVycyB5b3UgaGF2ZSBiZWVuDQo+IHdv
cmtpbmcgb24gaW4gTGludXguDQo+IA0KPiBJIGFtIHdyaXRpbmcgdGhpcyBlLW1haWwgYmVjYXVz
ZSBwZW9wbGUgZG9uJ3Qgc2VlbSB0byBiZSByZXNwb25kaW5nIHRvDQo+IFJGQyBwYXRjaGVzLg0K
PiANCj4gQmFzaWNhbGx5IFJ1c3NlbGwgYW5kIEkgYXJlIHRyeWluZyB0byBkbyBzb21lIGRldmVs
b3BtZW50IG9uIHBoeWxpbmsgKw0KPiBEU0EgdG8gbW92ZSBpdCBmb3J3YXJkLCB3aXRob3V0IGJy
ZWFraW5nIGV4aXN0aW5nIGRyaXZlcnM6DQo+IA0KPiAtIHdlIHdhbnQgdG8gbWFrZSBpdCBzbyB0
aGF0IHBoeWxpbmsgaXMgYWx3YXlzIHVzZWQgZm9yIENQVSBhbmQgRFNBDQo+ICAgcG9ydHMgKG5l
ZWRlZCBmb3IgY29udmVyc2lvbiB0byBwaHlsaW5rX3BjcykNCj4gDQo+IC0gdG8gZG8gdGhhdCwg
cGh5bGluayBuZWVkcyB0byBrbm93IHRoZSBpbnRlcmZhY2UgdHlwZSB0byB3aGljaCB0aGUNCj4g
ICBwb3J0IHdpbGwgYmUgY29uZmlndXJlDQoNCjxzbmlwPg0KDQo+IA0KPiBJdCBpcyB2ZXJ5IHBy
b2JhYmxlIHRoYXQgdGhpcyB3aWxsIGJyZWFrIHlvdXIgZHJpdmVycywgYW5kIHNvIEkgYXNrIHlv
dQ0KPiB0byBsb29rIGF0IHRoZSBSRkMgc2VyaWVzLCBtYXliZSB0ZXN0IGl0LCBhbmQgZ2l2ZSB5
b3VyIGNvbW1lbnRzIG9yDQo+IGFkZGl0aW9uYWwgcGF0Y2hlcyB0aGF0IG1ha2UgaXQgd29yay4N
Cg0KRm9yIGRyaXZlcnMvbmV0L2RzYS9yZWFsdGVrL3J0bDgzNjVtYjoNCg0KSSB0aGluayB3ZSBh
cmUgT0suIFRoZSAucGh5bGlua19nZXRfY2FwcyBvcCB3aWxsIHBvcHVsYXRlDQpzdXBwb3J0ZWRf
aW50ZXJmYWNlcyBmYWl0aGZ1bGx5IGZvciBhbGwgcG9ydCB0eXBlcywgc28gaW4gdGhlIGFic2Vu
Y2Ugb2YNCmEgZml4ZWQtbGluayBJIHRoaW5rIGl0IGlzIHBlcmZlY3RseSBmaW5lIGZvciBwaHls
aW5rIHRvIGNhbGN1bGF0ZSB0aGUNCmhpZ2hlc3Qgc3BlZWQgaW50ZXJmYWNlIGFuZCB1c2UgdGhh
dC4gVGhlIGRyaXZlciBhbmQgaGFyZHdhcmUgd2lsbCBiZQ0KYWJsZSB0byBzdXBwb3J0IHdoYXRl
dmVyIGl0IGFkdmVydGlzZXMuDQoNCkZyb20gcmVhZGluZyB0aGUgc2VyaWVzIEkgdW5kZXJzdGFu
ZCB0aGF0IHRoZSBiZWhhdmlvdXIgZm9yIERUcyB3aXRoDQpmaXhlZC1saW5rIHdpbGwgcmVtYWlu
IHVuY2hhbmdlZC4NCg0KV2l0aCB0aGUgYWJvdmUgaW4gbWluZCwgSSB0aGluayBpdCdzIGZpbmUg
bm90IHRvIHNldCBkZWZhdWx0X2ludGVyZmFjZQ0KaW4gdGhlIC5waHlsaW5rX2dldF9jYXBzIGNh
bGxiYWNrPyBUaGlzIG1lYW5zICJsZXQgcGh5bGluayBkZWNpZGUgdGhlDQptb3N0IHN1aXRhYmxl
IGRlZmF1bHQiLg0KDQpLaW5kIHJlZ2FyZHMsDQpBbHZpbg==

