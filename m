Return-Path: <SRS0=T8Q+=OP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 19:13:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F8C6109D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 19:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79F8C6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdKrZg/qzafSzYkqyEmxzxiHxvks5T101npq95oxs/I=; b=b3mn5yGxjQJ+D9
	SbVjTtt9LwIeDmQw9Sy88RSFjHSzIWMSVEXMB5P1aeS75pj7JbElt+m4aikm6MNj5k0JxiI4C4iN1
	+cUjplM7QnP1JVXUHKCQx+138S58AT6cP9NbqBlO+lMQvNYXGX1EmZ9vhql0qcwGeRL666O8wsAew
	/NA8lObsAVwm0OfJP6fL/hYP6xdCjGhXb6jcNieqR2Y2fbtniwwkMY167dQhwnhbuqKM4i8xeXs+n
	/4/tItMrrelVCx4eBkRVXlXDrirqWOYiOus54Z13vKK7d0r6qqEU3PBOwJ6bOvIHvcHidDPcSdmPV
	Ob3iK0/4nWAYfrowE28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUD6s-00H6N0-2b; Sat, 25 Sep 2021 19:13:18 +0000
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUD6n-00H6MN-Ue; Sat, 25 Sep 2021 19:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXgXyRoPJRtgMxsETXWBpau3KyFhvCQYdC5x4DhxihV2OvYiYU6fmLVomKp4WevH+yGDgDjVrlfgHZkdGcNFeaKMW94cHUjXE9K+Z+LK8QRHUlMEtA990CipEEWOdSOIPZglKRGN6kGTOfQkUoIGihsZnoFemcL8J643WV1A0J6CMEdbLTslJpu63OsH2UjaupvfD75ALWV0C1GqkMF0L9H1F3RmKQtxjEshf5rz33Efeit5NaJaYN70FsuBc5XTs4LrQBYGRW/1BKNKzOT9NRPQICErYoiLUDNgAGB0GkrtQWYyxD5+wIcRoMmJphMojoFw/pVsgqq2s6epdMUDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QQ15CQp7Wq48KxjnGRP/qJKXSl0/TCjjEhUTVl4o3W0=;
 b=ffIgF9YcvhRZh0irycn76VoT6Rxyc7CMTLTJxM3IMT5OGQoYCZHWwc5RoaIhVMpb11OU31IY4o85oO/GN+h2P2IcIDDxWLIi+nyy4HXKs+Ry+nxKuFiRC9ZiQ6rmc813P0rR/tyr1dfJEDY/BLMW0Ut8pXrfwCuez3D91Y+L+vsHfQkCEwoLMDp3DdiHRRZQQSXyXn99zSeRmJwai/Z4aqeInxsyt24w4WivYv4wvYvSQJP9y7/q+f+5DFcCHWmm7vtdG/C8AGykNOwvFnOVu1/PXp0arGDt4nBMw+l1kZtg1qo1+yhPWX6l5QRh38/09xn4EwP14xiZivDJohIP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ15CQp7Wq48KxjnGRP/qJKXSl0/TCjjEhUTVl4o3W0=;
 b=UCmxgsnfCi2hbfrRNlXzuST3KHNbgVNow9hqdgdd6WWmS83HxzMvHkC68J9g2fnwnfgAB6wS8u7LPe0Jd3zw8q7l38gBrVHih2z8XL6eEOibF3vSkmRckW/7WiK4NhR0im1PuxR1AitK3EREeOYFUfP/eudjfAvSlvjE/iCjUWs=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB4685.eurprd04.prod.outlook.com (2603:10a6:803:70::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Sat, 25 Sep
 2021 19:13:08 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e157:3280:7bc3:18c4]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e157:3280:7bc3:18c4%5]) with mapi id 15.20.4544.020; Sat, 25 Sep 2021
 19:13:08 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
CC: "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "allan.nielsen@microchip.com" <allan.nielsen@microchip.com>,
 "joergen.andreasen@microchip.com" <joergen.andreasen@microchip.com>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "vinicius.gomes@intel.com" <vinicius.gomes@intel.com>,
 "michael.chan@broadcom.com" <michael.chan@broadcom.com>, "vishal@chelsio.com"
 <vishal@chelsio.com>, "saeedm@mellanox.com" <saeedm@mellanox.com>,
 "jiri@mellanox.com" <jiri@mellanox.com>, "idosch@mellanox.com"
 <idosch@mellanox.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "kuba@kernel.org" <kuba@kernel.org>, Po Liu
 <po.liu@nxp.com>, Leo Li <leoyang.li@nxp.com>, "f.fainelli@gmail.com"
 <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "horatiu.vultur@microchip.com"
 <horatiu.vultur@microchip.com>
Subject: Re: [PATCH v5 net-next 1/9] net: mscc: ocelot: serialize access to
 the MAC table
Thread-Topic: [PATCH v5 net-next 1/9] net: mscc: ocelot: serialize access to
 the MAC table
Thread-Index: AQHXsSiNdI/FyYdkjEKxnocevBuSrqu1IG2A
Date: Sat, 25 Sep 2021 19:13:08 +0000
Message-ID: <20210925191307.qoon6iz32gep6st7@skbuf>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
 <20210924095226.38079-2-xiaoliang.yang_1@nxp.com>
In-Reply-To: <20210924095226.38079-2-xiaoliang.yang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bb89d0a-ce2b-41e1-e5f0-08d980588283
x-ms-traffictypediagnostic: VI1PR04MB4685:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB468552DEF48FFC9D046D5241E0A59@VI1PR04MB4685.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xOMiDJeRGbM/xuWEmBwAGGYzZDrq8yHhgG/Lfs9xXYWLJ4F4IoANUSoBsAMVv6N2YCBzvMmr0Ref/uFO6HVCOpoHRdnyjJvbpse3udcnExGh6K05Q+1jUSxdFcTnYoLk3YV6B8emAaReBfbqNlkQJa3NSs6OG9lT2IVgxhMDpI0ZMxFw8aEYAMu2Mv4XIsL1LA1bYCmSt//OYaXcuUiNJ+XAn+nmHQHoW9o3lCpkKSGQwYcuMrxjIpHzQFRMyRl1fa7GhyrSsPMq4kyZeKG5hh1oljEhHJhh/BRFYeqQceLq6miVUrYtZMxZH3pcaXXtPd7JqAxnW75ws1br4sG8vtaRo5mKh1RSLtRe8QrO9Ko8eeZbPoQSbXVySFEUo0zD9Kv5ErW4Af4WEoTP/Eqm4GvxivBUe8bJFhndJ0lUS6aFgI8hVWMbFNXWm8rn/E4KWenyrrBBcYvERrC8Y1vABJnWlKxsGhJjYSTIhJIThnYQMO4hTfFwXDbALdRFhC11fUSgVioYOnDQmn05X9z6NPQRHkJlRp1+i/csrRR8TvswqyxHfzWByJ2C9ZKvmVPQ9cHwo0hyvVEcbLC70g/JDv4Bp3j6vCD7q+1O6ctNb2EbsSbCyUYQnRIXNHa17jApQDX9gcVL7n/s+/+QH5f0fltwi1uNOoCTQlEZC1nWTvHUCz2eepsmSyN7l/FpZCPihhoYGe6gdrRz1XVjTfaMIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(86362001)(8936002)(33716001)(1076003)(8676002)(66446008)(64756008)(66556008)(66476007)(44832011)(66946007)(76116006)(91956017)(508600001)(71200400001)(2906002)(38100700002)(54906003)(6506007)(83380400001)(316002)(6512007)(9686003)(122000001)(4744005)(38070700005)(5660300002)(6636002)(6862004)(186003)(4326008)(7416002)(26005)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qy32qJoBRS8Kzo5kQ0BMQiyS1v7eRZnMSZINEV3Ru+l+JEJG4rxysz4hLm/F?=
 =?us-ascii?Q?odNpmEyfP0SezrIDhLQQ05P7MHpWCnb+N7U5lb0jKCnLgxUEg16mWGVeEup5?=
 =?us-ascii?Q?HpgEPHpqYAPZo1F5JX/GVDZmtzfqw1NtmuksJl+9qCV2GkyCj5Jr+kCsFNXS?=
 =?us-ascii?Q?Q1IAFjl3oH/2PK962hEAYOaPPWAc0NE39nF153oLb1KGW3tUkgKV7Y3OVAVu?=
 =?us-ascii?Q?NlUX+2jdtVp+Mg+T/JuWsJ33fzbqfBdSQwX1wej2v254TYoP0F8uFykJ3Vd5?=
 =?us-ascii?Q?JG6A91yYVxr67kvhY29Op5i/rMAxe4PO6NwjL3jgPnVL2fQOxjIfXHgJ+HGn?=
 =?us-ascii?Q?eClKDRQxY6fUlCdCZZjEZ511eoxtVJeybaayU/EOow1jpKYj4Y+liH3JLEeU?=
 =?us-ascii?Q?AgS6/BlQgQSgRTB8NuFkoDoA1TdBHXQVsBmiUbgxszAO9FxlTQ3htDTrVlTS?=
 =?us-ascii?Q?3NAzaGWgbUJC5r33dVIMiEQR4iRqvK8m+i+/VBlnWXXFVyzDDoJ3OnOvRFyO?=
 =?us-ascii?Q?nFg1FSzZtcAypuwVrfpYVOgIM7cr+VdOrRSCKq6uDp4l56uGJ6gDc3z/5MYM?=
 =?us-ascii?Q?4tawzArTA713d90TsHShgyyk6bCWMVr1hfJ8DJpILXTBXuyp+kMOBaQXjEzN?=
 =?us-ascii?Q?/6Q2LrPnYuSkdgb1jUKdQrC7lT3KfVprhbnbAl/qwtqqbzSri5HVcSeRUlui?=
 =?us-ascii?Q?dWZAO5I7l93E75D/PRNtDHfGN9V7ALeev44OmkfO0RcLz3ojxH5mz6VyLWEu?=
 =?us-ascii?Q?fYGrmbzhLDd69rTrwAyVJTtTpC/hQSMAtntK6hyenit3xrAxi0wOIga7bnEM?=
 =?us-ascii?Q?U4PkkBupcrn+kXzwQQeo/U5yTUXJwBpHn3W5qxF88pA9+f46At4It5tsKM6b?=
 =?us-ascii?Q?9UeN4ONrPbPeTWnh1kKoYf6WBa1b3qXEUsOokRk7b0gYdUgZ1MBPgZR7bFnx?=
 =?us-ascii?Q?J+ptYiFkASpxYa9RulqIr+FIJoo9lHheTfap9+ucMjv2cGDasXXsAekbMNSe?=
 =?us-ascii?Q?9dqJBp2O/iYOk8X8p1Jd7zrTCEYwsrCs588WUnne0GA7z4WhRkic7amatxL8?=
 =?us-ascii?Q?leE7t3y2yAROcZPPOgme3/DQGabfH8BoQ/KnytAbgX2qNTfbWj16Q9fXlBvP?=
 =?us-ascii?Q?HWm35ip/7VTjbPnpZStIX6phnhV/hjOXji5JLtcX+Ct03JR3+zbKkvWh+viY?=
 =?us-ascii?Q?Q1167CSpkl+RjvzNK8fTTDy9NtUmF6xNznl2oj1PcY24TekRu+G5Ph7JWhIi?=
 =?us-ascii?Q?fX78KK3gw96DjfpZef80mmm2WrSzSxu5+Ymt6JuQKa37lOjzMd6iKPW/t2yh?=
 =?us-ascii?Q?2084kTkSr81Yl57tgMNCXkBd?=
Content-ID: <3B54424CEF3F0841984A1D574DF49BCE@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb89d0a-ce2b-41e1-e5f0-08d980588283
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2021 19:13:08.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zITmhjs5LpmfbPtM2tXatZzec1EsEZWwe8Yzga6auCc/zKdNi25HV1FUk+wC0dg3IhEbOrUAK20Bm7ib5mw9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_121314_122868_6B6DE4A4 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Sep 24, 2021 at 05:52:18PM +0800, Xiaoliang Yang wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> DSA would like to remove the rtnl_lock from its
> SWITCHDEV_FDB_{ADD,DEL}_TO_DEVICE handlers, and the felix driver uses
> the same MAC table functions as ocelot.
> 
> This means that the MAC table functions will no longer be implicitly
> serialized with respect to each other by the rtnl_mutex, we need to add
> a dedicated lock in ocelot for the non-atomic operations of selecting a
> MAC table row, reading/writing what we want and polling for completion.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---

This patch needs your sign-off too.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
