Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622F6C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWXZEeuMvZtE57BcI9/X6RUqP6nzSHpOKx3KpqbOdig=; b=pxXuGJH8jNYqPSm27E1ZM2LBXI
	27twGtN/AYc28XdajDdtYrLGprIrQeuVxcZRE9BHfw2ZYBIL1RtuR2Ox06VvrAKsttBErlCe+91sM
	xR8Kt7R0pDMG+B3luYxsuCDewpDXAqVYcEMzG9mPg4dVLsg7TwWrvNY423pY1N5wqE5MI1xGwZpNA
	Q5uXR8JuJgpTjtrcxYEvTSI8rtEFyxOz8wmJC26t53fm8MmahVaObz6wv1D9znMfX2wM9to26AIEy
	u3YNUrh27CdbbLXtJ3AXAZkuSeF9cSFZ7GlW8RWgoREZV8/iXhAu3GFV1Uz6i2K85mT8k+0G/IeXR
	BVkBxgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi8Ut-0063jx-2Y;
	Fri, 31 Mar 2023 06:44:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi8Up-0063iN-3D;
	Fri, 31 Mar 2023 06:44:26 +0000
X-UUID: 75dcfe74cf8f11edb7d8d11f642b8e78-20230330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fWXZEeuMvZtE57BcI9/X6RUqP6nzSHpOKx3KpqbOdig=;
	b=QG7PoT7XRh5i2DFj5hep7GpwyyjOkJgU/LAK3Puw48dz/inMSXETz0jBZbEpTQDiN5j/OO0IOBUDsOg32md+QlWKlGkbXKl+Bg2a+OQmNbHepHYWPorOi0Qh7GqE7GnzXFYo2ZBCGGLjJM99jAgDnkNxpkVw26LoidctqqlG1tI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:2c4a3a6c-0b1d-456b-955b-73b5ff571f09,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:b446f1b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 75dcfe74cf8f11edb7d8d11f642b8e78-20230330
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1776650596; Thu, 30 Mar 2023 23:44:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 14:23:41 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 14:23:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC8lQ47+GTcHA3OWAEARJ5A3DWqstaabHmGtXCgHP/5c0Q/f/etTvk3IBc8DrEgvmdLMgVyCpmaa9cp6wKo258xX6E/3VM8xYDaaFpD/PomMKsqz2LcP79krKd/B2whqeSHjBSGALaZg70A8F0fGYcPpg0suT8HfzkNkh7cCNPlePmJn9eGbUTGOdVGKsYwt61hjHw3W3jXUB0IrzAsB0JI/APt7ORPBeHbzkhxYGCyfqVagyYsZRjJ5uHke2k62FtB7+MUdUm4K+2yL3rTm8lw73DvKIa5n+HZaNs1DbR17XCIVLzKCJBVt9WdzK5ihWSXjFn2hbm4PC87tOgC8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWXZEeuMvZtE57BcI9/X6RUqP6nzSHpOKx3KpqbOdig=;
 b=DauvqMQ3PqsoP4ks3dww6xnmDovtTzLZuLa4TY4sS/Qo1Hz6ZLdG1Ort3nRZy5hQCWAlScbAYyt9e10SHf1nAOtDFn0vu/Tb7uj8lByMQugZI77v0QJYh335IgWobthMq2sH4Xnr6mTF6f5SmuHr3C3KmCkjzcdq0AnRbkLO9raCHJnWqE+WNjvtsbigOjofYkkFmXIEGunSw8gfWQwOrwvWUhLIvEmTB2VA1m/Sl3WnF4wsKpxasCAwbUx4O/jy7TDEl6jybWWoGGipR3NYMmIRJjvIBgzFx+XBg6EeU6wH3Jx0EOmZ/OCasGWBh0aaD9UKrGXqPIbG0h7YhOu6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWXZEeuMvZtE57BcI9/X6RUqP6nzSHpOKx3KpqbOdig=;
 b=Lh5GwTaB+4ZpRBahg8S18cdebMSOQgw5eS4mBLtRuV7Z+xmyAgOt6e6tTJvqC1B/ju74sPnTdlqTh//FG1yIHN3TKaFEUX7IqpVm7bPleUHC/GivVIQMgRkBmu55BCa2jLkpfnoBaC5TaSQtavDZGkIEpc5GoDayu+qneYQ4Ci0=
Received: from PUZPR03MB5877.apcprd03.prod.outlook.com (2603:1096:301:a5::6)
 by SEYPR03MB6650.apcprd03.prod.outlook.com (2603:1096:101:82::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 06:23:37 +0000
Received: from PUZPR03MB5877.apcprd03.prod.outlook.com
 ([fe80::cd32:5baf:ebd0:3eaa]) by PUZPR03MB5877.apcprd03.prod.outlook.com
 ([fe80::cd32:5baf:ebd0:3eaa%8]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 06:23:37 +0000
From: =?utf-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= <Garmin.Chang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "richardcochran@gmail.com"
	<richardcochran@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 03/19] clk: mediatek: Add MT8188 topckgen clock support
Thread-Topic: [PATCH v6 03/19] clk: mediatek: Add MT8188 topckgen clock
 support
Thread-Index: AQHZUo68VDXe0a+1w0uIa2y7goq9ta76BJQAgBqI8AA=
Date: Fri, 31 Mar 2023 06:23:37 +0000
Message-ID: <96e603e7164583b9e83dcc6a4055ddab81114aac.camel@mediatek.com>
References: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
	 <20230309135419.30159-4-Garmin.Chang@mediatek.com>
	 <bf221312-ce85-8696-8b5a-f5b78206bd07@collabora.com>
In-Reply-To: <bf221312-ce85-8696-8b5a-f5b78206bd07@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5877:EE_|SEYPR03MB6650:EE_
x-ms-office365-filtering-correlation-id: 0c886aed-6595-446e-0ef3-08db31b07660
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oaD8zQoq/sZwZ+dPaYKsytAK4ShHXtMxh+1tUlxodK9TOyZzGWuZRP6U9LgWVbNq6zfNFz11JcPUuoTETugTFU13oPEg5cQ1iPonxsCNNZfEy+PqZzTOuKlQyQ8HhOhFPpH9YIglOFy5JKhR56TZID+I5UjCIcCRuNRnFTAjrGwquqYTTSCX0e/iZ62wb/c1n0HfM2spXwxesAnkbIkIeD+t8oXdLd6byaocqclSza/rV0M5mt3tf31RikJf0wJGbaAv9wIkTzYT8l0ZgZhLlsctggiJmFvRNso2qEBgr7rV90HXZ30Fth/TosPfW9ji1SgCLW07hpN7mkHz5D1ftWxQUwCOc9mj7fwugB3r0haD+rTMXKMN6/7f6ys+FZB+jwu3bD1pHEGmYF68Ywfs2eiTz0W2vhqrqW1GbsFPch0tAomOWkTdv6MBKliIKUGgRAqklzhD7jFJrUxaaGQW89rM1d/yeHFyIf+criyu/keMFG8v2RtA3Zp/XEYpO20B55k3EhO+Rzji27avJc1mPEJ8pzMapqKFDBYdXTGm3jthMqGegWnMETqdLK3kzzt5nhnb0+aCL/XPpdoM1k0/J+GJ/l2TCeOReh6jTmqF4OwIzcjILgyw+YeyB0nl/zLe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5877.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6512007)(41300700001)(4326008)(66476007)(66946007)(76116006)(66556008)(64756008)(91956017)(66446008)(7416002)(6506007)(26005)(54906003)(83380400001)(316002)(6486002)(2906002)(71200400001)(122000001)(8676002)(478600001)(5660300002)(8936002)(38100700002)(110136005)(38070700005)(2616005)(86362001)(186003)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFhXa0o1MTRpZGFkMVM0OE4vT2Jjb3B0NFdFV3lFLzZjTnNsQXBNVG5BNVg3?=
 =?utf-8?B?TDQ2aWZCWldWS2E1UFdIbHN0clI2VVBCViszSTNkUW5VL3N4Q3N0U0xqMXFQ?=
 =?utf-8?B?RkZNQ2JjbXkwOTh3Yll6SGt3NnB2QzludHJ1MWFtenp5c2N3Y2lGa2dVOXBM?=
 =?utf-8?B?VlVZd3pQQU5WTWlaN2xJekFvNk1TQndhYWJGTVhDZ1h5eXlnQm96QVY1a21a?=
 =?utf-8?B?eTg4LzEwcThPTWVWRVduTWYvVkIrRHB5clBCQkRWR1U3MEJVdStvdFNxZHRG?=
 =?utf-8?B?WitWZEZpOGxTc3orTXVaNmJiWFZnUXZ4Ri9iOHlXMEY5RVhVd29menp3cjlT?=
 =?utf-8?B?MzVVTEgrM2t6dUxHclhOeW9EZjdDTm8zeEdqSzRKL2FGYkxVbTVEUkh0MCtH?=
 =?utf-8?B?NXdNZHlzTG9ISnVLaFdqQ1VLK0Q1MFNiRnJDUjBnbmJ4ZnYwOS9iaVByMlhQ?=
 =?utf-8?B?ODUwRloraTJBMXBDZVBxYXZSMXVublAyYlk3aUtFVjQ3ZHZZUFBRT3Y3ZXd0?=
 =?utf-8?B?RDM5MHVVcitnVTJKK2drdTdGTzAyNTZ5UUpVN01GV0xud2xIR2NCRE1xUDYx?=
 =?utf-8?B?WEtLb1h0VW5WdTl1NjNzckozZ251Vmp6ODlvYzJaWjZ6STdVUlFOR051NEpR?=
 =?utf-8?B?RFZXQ2VOam02anJwejNYM1liVUEyVTNBaEg1SGNZUHdXM2haSGV5MkNuMzY1?=
 =?utf-8?B?Z1BucjRWUWhEZldQOWdrYk84U1BCMm1BeEtTR010UElyREdzWmxvSU9iYWRj?=
 =?utf-8?B?bGdrUEFnVnZ1UHpSWXZ1bXpVM1gwZmpXT3JTTU1EVnN3elpUby9vRFlacjZM?=
 =?utf-8?B?dy9kRWJ3bWpvK3hqQmRRa0xBT2tBNVJiTzU5TEpnZTdlTGxQSFdqcnJoNE9C?=
 =?utf-8?B?eW9HczJacFZNbEFhcW0xNlVaK3lsUHgvNDdFQ3l5OTVrOEMvdlVGakUwbTd3?=
 =?utf-8?B?L1ZkSDF3UTR4MHhSa3ZPWXErNWVkcmp5czBjMzZPL0VIR1JLZTJ6eXYwTzBO?=
 =?utf-8?B?K2trdHJoVHN2RTYzNmtmZ1JkWTlXR3c2NEVOSmVsQjcvSWFibjU0QkYzamt5?=
 =?utf-8?B?RDJzK29NQlNrM0dINFdDNDd4RG11R01Takl5T0lOZUdrVDdWOVJGaG9XUlMr?=
 =?utf-8?B?QktJTmx0VFEwekgxdi92b2liTzBmUmVUQk5hOEwwQjh4cHBLclAyaEo4TVhW?=
 =?utf-8?B?Nm80aHd0MlpZOFZvblc2bHBUYnVkS3hoRjBna2pPTzE4Y2xZTjQzTWhTM0xt?=
 =?utf-8?B?VmxZMklZcXpQQ2Y4djZIR0JuTVNJNVpLMmMwYW5kTmtRUlF0OUFRY1J3bEY1?=
 =?utf-8?B?aDBMU3hmNW44cVJkWjltT2U1S3IxUDVUS1ZuNVdNcHUwM2JvZFRrdndRdFpt?=
 =?utf-8?B?b3pMRkY2TGFNZzM5S2ZlMFV1ZW5VZzVabGF3Z3BrWFFZSlF1UGNzQnFpaGJ2?=
 =?utf-8?B?M280a3ZrWGNYL1VETUhHYnUvQVFrYVhPYjhCRlppYzE2dGY0bXh0eW8xak9B?=
 =?utf-8?B?SytzYzlEanhRMFF6bGw2TGQveXFQNk1qbk1nNThDb0xXOGkvMEh3UkVBUmRX?=
 =?utf-8?B?RENNSG9JL3Q5cG1lNXZDcVR3OCs1WG1yWm4wMGR5ODBzaGJ2eVQwS3pLRkcx?=
 =?utf-8?B?Ym5lRkJxV3lmcDFqNzRidUwyR0xJb20rNlM3dExvVkNmOEx5clZMRUJjMzNW?=
 =?utf-8?B?aFJiWXVWYVAwTDhFQmF6ZVZTZXVVOFdENUhIaTFNNFl6NWx5d21GN2hzeHlw?=
 =?utf-8?B?WkYyckFrQnpMNU93T20welU1Y01zajFQM1hhRUtUUjF5RFQ3eUpVVkJjVXN1?=
 =?utf-8?B?eEFmS3lxcnJsK1RQZGhLVGpIbzdsSDB5OHpWSyt1Z25WODN1OTJ5SHZRd2ZI?=
 =?utf-8?B?NER6c0VVc2Z5aHJEU21tYjlKUEM5TFhHVFdlZEtMNDlkVUlWUUx1d0FhZGFD?=
 =?utf-8?B?cVg5ZjRsd1VaREdoQ0tnK0wrYTFxSWYrNnArLzJTeVFKTERaYVNWb3lEVXVa?=
 =?utf-8?B?Z3BBL005MzZZeUQ1K2RLa1p0N1ZWNmRrTWRuMVZGUFhKSXRxRnVLVEFmNGQz?=
 =?utf-8?B?VzlnZHA5Y2p3a2g5OW1jU3lUWlZQa0xObitoRzliWEwyRWUrUmRRTFNLSXBa?=
 =?utf-8?B?a3BXQmlOZHNBL1pYbkZ6TFhvTUtaZDVMSm9VeS9DZURCaGVjMDJQOW9xQWh0?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D8D69C7F4F39E47BA077984B435B0B2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5877.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c886aed-6595-446e-0ef3-08db31b07660
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 06:23:37.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOGW0IScZ5Lq6sp3v9hRjYbK8JEoHXJDQOXIK5UO5iRIjgAhMJe9Fha9xXnavM0sTe4xbL909v/iHVZqpQdijUy68XChUdbThp2RnFDoX00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_234424_310743_838B4D70 
X-CRM114-Status: GOOD (  22.34  )
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

T24gVHVlLCAyMDIzLTAzLTE0IGF0IDEwOjEwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDkvMDMvMjMgMTQ6NTQsIEdhcm1pbi5DaGFuZyBoYSBzY3JpdHRv
Og0KPiA+IEFkZCBNVDgxODggdG9wY2tnZW4gY2xvY2sgY29udHJvbGxlciB3aGljaCBwcm92aWRl
cyBtdXhlcywgZGl2aWRlcnMNCj4gPiB0byBoYW5kbGUgdmFyaWV0eSBjbG9jayBzZWxlY3Rpb24g
aW4gb3RoZXIgSVAgYmxvY2tzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEdhcm1pbi5DaGFu
ZyA8R2FybWluLkNoYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvY2xr
L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgIDIgKy0NCj4gPiAgIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDgxODgtdG9wY2tnZW4uYyB8IDEzNDcNCj4gPiArKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMzQ4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRl
ay9jbGstbXQ4MTg4LXRvcGNrZ2VuLmMNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL01ha2VmaWxl
DQo+ID4gaW5kZXggMWY4MjJmY2Y2MDg0Li5kODQ1YmY3MzA4YzMgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9tZWRp
YXRlay9NYWtlZmlsZQ0KPiA+IEBAIC05MSw3ICs5MSw3IEBAIG9iai0kKENPTkZJR19DT01NT05f
Q0xLX01UODE4NikgKz0gY2xrLW10ODE4Ni0NCj4gPiBtY3UubyBjbGstbXQ4MTg2LXRvcGNrZ2Vu
Lm8gY2xrLW10DQo+ID4gICAJCQkJICAgY2xrLW10ODE4Ni1tZmcubyBjbGstbXQ4MTg2LW1tLm8N
Cj4gPiBjbGstbXQ4MTg2LXdwZS5vIFwNCj4gPiAgIAkJCQkgICBjbGstbXQ4MTg2LWltZy5vIGNs
ay1tdDgxODYtdmRlYy5vDQo+ID4gY2xrLW10ODE4Ni12ZW5jLm8gXA0KPiA+ICAgCQkJCSAgIGNs
ay1tdDgxODYtY2FtLm8gY2xrLW10ODE4Ni1tZHAubw0KPiA+IGNsay1tdDgxODYtaXBlLm8NCj4g
PiAtb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTg4KSArPSBjbGstbXQ4MTg4LWFwbWl4ZWRz
eXMubw0KPiA+ICtvYmotJChDT05GSUdfQ09NTU9OX0NMS19NVDgxODgpICs9IGNsay1tdDgxODgt
YXBtaXhlZHN5cy5vIGNsay0NCj4gPiBtdDgxODgtdG9wY2tnZW4ubw0KPiA+ICAgb2JqLSQoQ09O
RklHX0NPTU1PTl9DTEtfTVQ4MTkyKSArPSBjbGstbXQ4MTkyLm8NCj4gPiAgIG9iai0kKENPTkZJ
R19DT01NT05fQ0xLX01UODE5Ml9BVURTWVMpICs9IGNsay1tdDgxOTItYXVkLm8NCj4gPiAgIG9i
ai0kKENPTkZJR19DT01NT05fQ0xLX01UODE5Ml9DQU1TWVMpICs9IGNsay1tdDgxOTItY2FtLm8N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4OC10b3Bja2dl
bi5jDQo+ID4gYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg4LXRvcGNrZ2VuLmMNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjNmOTU3N2Rl
MDgxDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Ns
ay1tdDgxODgtdG9wY2tnZW4uYw0KPiA+IEBAIC0wLDAgKzEsMTM0NyBAQA0KPiANCj4gLi5zbmlw
Li4NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9t
YXRjaF9jbGtfbXQ4MTg4X3RvcGNrW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4OC10b3Bja2dlbiIsIH0sDQo+IA0KPiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODgtdG9wY2tnZW4iIH0sDQo+IAl7IC8qIHNlbnRpbmVsICovIH0NCj4gDQpUaGFuayB5
b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbnMuDQoNCk9rLCBJIHdvdWxkIHJlbW92ZSBjb21tYSBpbiB2
Ny4NCj4gPiArCXt9DQo+ID4gK307DQo+ID4gKw0KPiA+ICsvKiBSZWdpc3RlciBtdXggbm90aWZp
ZXIgZm9yIE1GRyBtdXggKi8NCj4gPiArc3RhdGljIGludCBjbGtfbXQ4MTg4X3JlZ19tZmdfbXV4
X25vdGlmaWVyKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiBzdHJ1Y3QgY2xrICpjbGspDQo+ID4g
K3sNCj4gPiArCXN0cnVjdCBtdGtfbXV4X25iICptZmdfbXV4X25iOw0KPiA+ICsNCj4gPiArCW1m
Z19tdXhfbmIgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm1mZ19tdXhfbmIpLA0KPiA+IEdG
UF9LRVJORUwpOw0KPiA+ICsJaWYgKCFtZmdfbXV4X25iKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVN
Ow0KPiA+ICsNCj4gPiArCW1mZ19tdXhfbmItPm9wcyA9ICZjbGtfbXV4X29wczsNCj4gPiArCW1m
Z19tdXhfbmItPmJ5cGFzc19pbmRleCA9IDA7IC8qIEJ5cGFzcyB0byBUT1BfTUZHX0NPUkVfVE1Q
ICovDQo+ID4gKw0KPiA+ICsJcmV0dXJuIGRldm1fbXRrX2Nsa19tdXhfbm90aWZpZXJfcmVnaXN0
ZXIoZGV2LCBjbGssDQo+ID4gbWZnX211eF9uYik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgY2xrX210ODE4OF90b3Bja19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgY2xrX2h3X29uZWNlbGxfZGF0YSAqdG9wX2Nsa19kYXRh
Ow0KPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+
ID4gKwlzdHJ1Y3QgY2xrX2h3ICpodzsNCj4gPiArCWludCByOw0KPiA+ICsJdm9pZCBfX2lvbWVt
ICpiYXNlOw0KPiA+ICsNCj4gPiArCXRvcF9jbGtfZGF0YSA9IG10a19hbGxvY19jbGtfZGF0YShD
TEtfVE9QX05SX0NMSyk7DQo+ID4gKwlpZiAoIXRvcF9jbGtfZGF0YSkNCj4gPiArCQlyZXR1cm4g
LUVOT01FTTsNCj4gPiArDQo+ID4gKwliYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291
cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VSUihiYXNlKSkgew0KPiA+ICsJCXIgPSBQVFJf
RVJSKGJhc2UpOw0KPiA+ICsJCWdvdG8gZnJlZV90b3BfZGF0YTsNCj4gPiArCX0NCj4gPiArDQo+
ID4gKwlyID0gbXRrX2Nsa19yZWdpc3Rlcl9maXhlZF9jbGtzKHRvcF9maXhlZF9jbGtzLA0KPiA+
IEFSUkFZX1NJWkUodG9wX2ZpeGVkX2Nsa3MpLA0KPiA+ICsJCQkJCXRvcF9jbGtfZGF0YSk7DQo+
ID4gKwlpZiAocikNCj4gPiArCQlnb3RvIGZyZWVfdG9wX2RhdGE7DQo+ID4gKw0KPiA+ICsJciA9
IG10a19jbGtfcmVnaXN0ZXJfZmFjdG9ycyh0b3BfZGl2cywgQVJSQVlfU0laRSh0b3BfZGl2cyks
DQo+ID4gdG9wX2Nsa19kYXRhKTsNCj4gPiArCWlmIChyKQ0KPiA+ICsJCWdvdG8gdW5yZWdpc3Rl
cl9maXhlZF9jbGtzOw0KPiA+ICsNCj4gPiArCXIgPSBtdGtfY2xrX3JlZ2lzdGVyX211eGVzKCZw
ZGV2LT5kZXYsIHRvcF9tdGtfbXV4ZXMsDQo+ID4gKwkJCQkgICBBUlJBWV9TSVpFKHRvcF9tdGtf
bXV4ZXMpLCBub2RlLA0KPiA+ICsJCQkJICAgJm10ODE4OF9jbGtfbG9jaywgdG9wX2Nsa19kYXRh
KTsNCj4gPiArCWlmIChyKQ0KPiA+ICsJCWdvdG8gdW5yZWdpc3Rlcl9mYWN0b3JzOw0KPiA+ICsN
Cj4gPiArCWh3ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXJfbXV4KCZwZGV2LT5kZXYsICJtZmdfY2tf
ZmFzdF9yZWYiLA0KPiA+IG1mZ19mYXN0X3JlZl9wYXJlbnRzLA0KPiA+ICsJCQkJICAgICAgQVJS
QVlfU0laRShtZmdfZmFzdF9yZWZfcGFyZW50cyksDQo+ID4gQ0xLX1NFVF9SQVRFX1BBUkVOVCwN
Cj4gPiArCQkJCSAgICAgIChiYXNlICsgMHgyNTApLCA4LCAxLCAwLA0KPiA+ICZtdDgxODhfY2xr
X2xvY2spOw0KPiANCj4gSWYgeW91IG1ha2UgdGhpcyBhIG10ayBtdXggYW5kIHB1dCBpdCBpbiB0
b3BfbXRrX211eGVzLCB5b3UgY2FuDQo+IG1pZ3JhdGUgdG9wY2tnZW4gdG8NCj4gdGhlIHNpbXBs
ZV9wcm9iZSgpIG1lY2hhbmlzbSwgZ3JlYXRseSByZWR1Y2luZyB0aGUgc2l6ZSBvZiB0aGlzIGZp
bGUuDQo+IA0KQWZ0ZXIgY2hlY2tpbmcsIHRoZSBtdDgxOTUgY2hpcCB1c2VzIHRvcF9tdGtfbXV4
ZXMgYW5kIGRvZXMgbm90IHVzZQ0Kc2ltcGxlX3Byb2JlKCkgbWVjaGFuaXNtLg0KDQptdDgxODgg
YW5kIG10ODE5NSBhbHNvIHVzZSB0b3BfbXRrX211eGVzIGluIHRoZSBzYW1lIHdheSwgc28NCm10
ODE4OCB3aWxsIG5vdCBiZSBtb2RpZmllZCB0aGlzIHRpbWUuDQoNCj4gPiArCWlmIChJU19FUlIo
aHcpKSB7DQo+ID4gKwkJciA9IFBUUl9FUlIoaHcpOw0KPiA+ICsJCWdvdG8gdW5yZWdpc3Rlcl9t
dXhlczsNCj4gPiArCX0NCj4gPiArCXRvcF9jbGtfZGF0YS0+aHdzW0NMS19UT1BfTUZHX0NLX0ZB
U1RfUkVGXSA9IGh3Ow0KPiA+ICsNCj4gPiArCXIgPSBjbGtfbXQ4MTg4X3JlZ19tZmdfbXV4X25v
dGlmaWVyKCZwZGV2LT5kZXYsDQo+ID4gKwkJCQkJICAgIHRvcF9jbGtfZGF0YS0NCj4gPiA+aHdz
W0NMS19UT1BfTUZHX0NLX0ZBU1RfUkVGXS0+Y2xrKTsNCj4gPiArCWlmIChyKQ0KPiA+ICsJCWdv
dG8gdW5yZWdpc3Rlcl9tdXhlczsNCj4gPiArDQo+ID4gKwlyID0gbXRrX2Nsa19yZWdpc3Rlcl9j
b21wb3NpdGVzKCZwZGV2LT5kZXYsIHRvcF9hZGpfZGl2cywNCj4gPiArCQkJCQlBUlJBWV9TSVpF
KHRvcF9hZGpfZGl2cyksIGJhc2UsDQo+ID4gKwkJCQkJJm10ODE4OF9jbGtfbG9jaywNCj4gPiB0
b3BfY2xrX2RhdGEpOw0KPiA+ICsJaWYgKHIpDQo+ID4gKwkJZ290byB1bnJlZ2lzdGVyX211eGVz
Ow0KPiA+ICsNCj4gPiArCXIgPSBtdGtfY2xrX3JlZ2lzdGVyX2dhdGVzKCZwZGV2LT5kZXYsIG5v
ZGUsIHRvcF9jbGtzLA0KPiA+ICsJCQkJICAgQVJSQVlfU0laRSh0b3BfY2xrcyksIHRvcF9jbGtf
ZGF0YSk7DQo+ID4gKwlpZiAocikNCj4gPiArCQlnb3RvIHVucmVnaXN0ZXJfY29tcG9zaXRlX2Rp
dnM7DQo+ID4gKw0KPiA+ICsJciA9IG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIobm9kZSwgb2ZfY2xr
X2h3X29uZWNlbGxfZ2V0LA0KPiA+IHRvcF9jbGtfZGF0YSk7DQo+ID4gKwlpZiAocikNCj4gPiAr
CQlnb3RvIHVucmVnaXN0ZXJfZ2F0ZXM7DQo+ID4gKw0KPiA+ICsJcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgdG9wX2Nsa19kYXRhKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcjsNCj4gPiArDQo+
ID4gK3VucmVnaXN0ZXJfZ2F0ZXM6DQo+ID4gKwltdGtfY2xrX3VucmVnaXN0ZXJfZ2F0ZXModG9w
X2Nsa3MsIEFSUkFZX1NJWkUodG9wX2Nsa3MpLA0KPiA+IHRvcF9jbGtfZGF0YSk7DQo+ID4gK3Vu
cmVnaXN0ZXJfY29tcG9zaXRlX2RpdnM6DQo+ID4gKwltdGtfY2xrX3VucmVnaXN0ZXJfY29tcG9z
aXRlcyh0b3BfYWRqX2RpdnMsDQo+ID4gQVJSQVlfU0laRSh0b3BfYWRqX2RpdnMpLCB0b3BfY2xr
X2RhdGEpOw0KPiA+ICt1bnJlZ2lzdGVyX211eGVzOg0KPiA+ICsJbXRrX2Nsa191bnJlZ2lzdGVy
X211eGVzKHRvcF9tdGtfbXV4ZXMsDQo+ID4gQVJSQVlfU0laRSh0b3BfbXRrX211eGVzKSwgdG9w
X2Nsa19kYXRhKTsNCj4gPiArdW5yZWdpc3Rlcl9mYWN0b3JzOg0KPiA+ICsJbXRrX2Nsa191bnJl
Z2lzdGVyX2ZhY3RvcnModG9wX2RpdnMsIEFSUkFZX1NJWkUodG9wX2RpdnMpLA0KPiA+IHRvcF9j
bGtfZGF0YSk7DQo+ID4gK3VucmVnaXN0ZXJfZml4ZWRfY2xrczoNCj4gPiArCW10a19jbGtfdW5y
ZWdpc3Rlcl9maXhlZF9jbGtzKHRvcF9maXhlZF9jbGtzLA0KPiA+IEFSUkFZX1NJWkUodG9wX2Zp
eGVkX2Nsa3MpLCB0b3BfY2xrX2RhdGEpOw0KPiA+ICtmcmVlX3RvcF9kYXRhOg0KPiA+ICsJbXRr
X2ZyZWVfY2xrX2RhdGEodG9wX2Nsa19kYXRhKTsNCj4gPiArCXJldHVybiByOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IGNsa19tdDgxODhfdG9wY2tfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBjbGtfaHdfb25lY2VsbF9k
YXRhICp0b3BfY2xrX2RhdGEgPQ0KPiA+IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+
ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gKw0K
PiA+ICsJb2ZfY2xrX2RlbF9wcm92aWRlcihub2RlKTsNCj4gPiArCW10a19jbGtfdW5yZWdpc3Rl
cl9nYXRlcyh0b3BfY2xrcywgQVJSQVlfU0laRSh0b3BfY2xrcyksDQo+ID4gdG9wX2Nsa19kYXRh
KTsNCj4gPiArCW10a19jbGtfdW5yZWdpc3Rlcl9jb21wb3NpdGVzKHRvcF9hZGpfZGl2cywNCj4g
PiBBUlJBWV9TSVpFKHRvcF9hZGpfZGl2cyksIHRvcF9jbGtfZGF0YSk7DQo+ID4gKwltdGtfY2xr
X3VucmVnaXN0ZXJfbXV4ZXModG9wX210a19tdXhlcywNCj4gPiBBUlJBWV9TSVpFKHRvcF9tdGtf
bXV4ZXMpLCB0b3BfY2xrX2RhdGEpOw0KPiA+ICsJbXRrX2Nsa191bnJlZ2lzdGVyX2ZhY3RvcnMo
dG9wX2RpdnMsIEFSUkFZX1NJWkUodG9wX2RpdnMpLA0KPiA+IHRvcF9jbGtfZGF0YSk7DQo+ID4g
KwltdGtfY2xrX3VucmVnaXN0ZXJfZml4ZWRfY2xrcyh0b3BfZml4ZWRfY2xrcywNCj4gPiBBUlJB
WV9TSVpFKHRvcF9maXhlZF9jbGtzKSwgdG9wX2Nsa19kYXRhKTsNCj4gPiArCW10a19mcmVlX2Ns
a19kYXRhKHRvcF9jbGtfZGF0YSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGNsa19tdDgxODhfdG9wY2tf
ZHJ2ID0gew0KPiA+ICsJLnByb2JlID0gY2xrX210ODE4OF90b3Bja19wcm9iZSwNCj4gPiArCS5y
ZW1vdmUgPSBjbGtfbXQ4MTg4X3RvcGNrX3JlbW92ZSwNCj4gPiArCS5kcml2ZXIgPSB7DQo+ID4g
KwkJLm5hbWUgPSAiY2xrLW10ODE4OC10b3BjayIsDQo+ID4gKwkJLm9mX21hdGNoX3RhYmxlID0g
b2ZfbWF0Y2hfY2xrX210ODE4OF90b3BjaywNCj4gPiArCX0sDQo+ID4gK307DQo+ID4gK2J1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDgxODhfdG9wY2tfZHJ2KTsNCj4gDQo+IG1vZHVsZV9w
bGF0Zm9ybV9kcml2ZXIuLi4uDQo+IE1PRFVMRV9MSUNFTlNFLi4uLg0K

