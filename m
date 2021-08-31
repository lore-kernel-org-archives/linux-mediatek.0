Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44117C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0EE760F9E
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0EE760F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FknxrFyjyHpR0q66CJq8ZxlU0kEwHnYE/2QUWOU61AY=; b=4AC64ZlyE1bGjb
	k3Qga52oRizR5SzwLJeBv52AhHjt6Zapfhtvs5Ew9P1ePWlnPQX9oM2Y2gWJ/s/du8NdttTrEpgoN
	SC2zpSOSU30G5uG2mZob2CAOIfvJ4DEGA7jluHUPqrG8Drrn6EOnXxJM3QYwjRXy7nJyvfLdVXihk
	mkfnHgo0xWHGWhbLv7In0mxhHa2N0gO2nYJxXcy9BCv+UO7Q4K5XCqyFSuSOG1PuiGr/HBe5PvuvE
	F+vPpeslGfRQ0RQqept79/rtq3xTddkjDPB6tVbP7qXSk2gg3lIW0/MRgPY/fm5mMGzIWbwkMDYVL
	K0t7wVXDz/x3IrmGCQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKxFW-001RiJ-7S; Tue, 31 Aug 2021 06:27:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKxFF-001Rgu-Nl; Tue, 31 Aug 2021 06:27:45 +0000
X-UUID: f5ed0e929d8441cd9498316f041d015d-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pW+/s0ECqJ+Ztd6yxtNaPW15O2Z32AI8iM7/Y6NLiqk=; 
 b=psObLO3j+ndUFaipdN4fRH1Ja6KT0EUJzo7jf609tY9A5q8n5FaXrd61BFZxDTNiCYaqnxLPVk6EhfNpupk6dt0lsf6vlGbuCMvJTn2wemsnVITKl4WU4VcJm5d8hB5rNcyuSd6PPUTV0Fj8CYCBW6h2ANrWvD6Zb8f2UIP7DWc=;
X-UUID: f5ed0e929d8441cd9498316f041d015d-20210830
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 263360089; Mon, 30 Aug 2021 23:27:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 23:27:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 14:27:36 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Aug 2021 14:27:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGFcYkf9d8S3SqzsKB2VtoIfRo1JzS8VX2YBO6bFnMsZkI6f02Xu1ZSg+d4rJYISiqphmtD7+rJJUfwzlmSGvf4q6qM7oi7eIo5udPGgxqW2M4kfi511642fmmPgii17EHR7HmjrJiJL8WV2z21WUrtONLFTAsIVsI5ELRxdB51/ep6MyTIHGtDzrH4pbnvHf1Uw2BuNYixf0rFg+Bnt508chkw9/x14060QrWiMa6deIHc3YJo7H5GQJ0x1+j4CxtMFz0bHUranGXGgDGAhuEg2HSgS4/NxqzSfGxlClH9rRKvCYpelrJy9f8efHM6NtXaDJeBO66ymWU7fJGbINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pW+/s0ECqJ+Ztd6yxtNaPW15O2Z32AI8iM7/Y6NLiqk=;
 b=cqGYG5GJh7rZyVsyml8LUoCsm1Xnkf4dJ5s5OgAstgWDIiar8oCXPY/Y7IcCU0iF/EL6S1EDBLc6HTbY+IrdZsCk8JEz2C8bDmyumyplFLfKFpHSzznH80zpgXvaW0lqrw20bfxH8emEl9yAVbx9i7q18S8oJC2iJkBSwdcys/E9DYqnc+7CZ3hCjyJtf+bS6hwayzXVBAcAstgX7BxaZL7yXnclFJyIZo5TEP9aYyCxeF+cJiMLnzzuUOnu/OTLFv0BkGtIG2mLm6aGGtY0D/aBqk1faF6R2oX7im4kS9K1rOkOGRBU9E4wF6f8bQo5HuoW8Jh8fKHzNCL2wF8LmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW+/s0ECqJ+Ztd6yxtNaPW15O2Z32AI8iM7/Y6NLiqk=;
 b=dK+RKffivrgMaD/dyz4Lw7HwH5j/mrvs4YJbkofIGE78qYbTGNThNXtaOlvPCXMzrlopMlU9NaC1NbFqIczZchy6xfLMX5zsnDF/unB0AGlpy147LJ47g2YAxHHQgCOkM7mRmIRY1tnJYI9BWBlKxSvfBNrAw0iDX51/Tp1LmhA=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR03MB5636.apcprd03.prod.outlook.com (2603:1096:820:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Tue, 31 Aug
 2021 06:27:18 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c%7]) with mapi id 15.20.4457.017; Tue, 31 Aug 2021
 06:27:18 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "mans0n@gorani.run" <mans0n@gorani.run>
CC: "b-liu@ti.com" <b-liu@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Thread-Topic: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Thread-Index: AQHXnbiA/Q+TZIhyUk2qQADVVY0HNauNJwSA
Date: Tue, 31 Aug 2021 06:27:18 +0000
Message-ID: <16f980b95e1f32bb8eb32448f1615bafdc51b792.camel@mediatek.com>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
In-Reply-To: <20210830155903.13907-2-mans0n@gorani.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd25db86-4065-4358-5a7d-08d96c48620b
x-ms-traffictypediagnostic: KL1PR03MB5636:
x-microsoft-antispam-prvs: <KL1PR03MB56368C8C2166209F4EE63B6AFDCC9@KL1PR03MB5636.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wBWrBiC9Z71TBbOMz4WOZcr9JGsreeZfq4oWx0oRDqDrlxUpP41sNiRKfEGvE/JMeyICFJU1734n6HA043EPH86FtpTDXdA69lXVA/dPjNCA1xbygfSRdVhT6CYLIixb8sc1yunA2j8MBDuCwF4q/laapeONrre+EFgA1c2BA40Kkrc1Kt7jNgpr5a3rQqoJ/kQrs3gvo/xbsrD73j0a/XptJAoQZ97TSVxCCyRIWmrrKqz7L1XYu05qVdWnb1laRymDaIDWkwVp6XOXwMPO6J8d/3rvN9jiW2jRrmcdMZpXRQffrQSSbUp/kb065FqdaxyyXO6fW2qW2wsXCI3iIUYKaDA5waX73iAkEPiGLXQaOu4EErOQw4p/nmeIAghCBpR+wLTxHL+2NWYbiGoUUia2AM9DJC1f+h5Xt7Wk7w/I5gQMoPqdh03vjpebLuu7WeY92Zn4HHWyoI9lgyn/mHrpXKZ1Au36xdYsKhhEaOqEcyZ8iDY8bkPC7I2j8wXWkl4jG7FI/B2CNpK2QFD8pRPlKnx8tl7E6UJLR4RXW9Cd42PIU82TP59xSzn9is3NDzQfbt8HALyNajpfClrcLWj7ddGuCxAzUY6Z1cPEIIEKIEtJG8Nvi+f1UgXgDpRbp0qt6LpxQkf6GfHKdXn+wN7eV7xM9kJNpGrlAgSs/lU6s4Zun8BNwBTO9Pfkv0anj2kx/pVQ8XdIo7VoZVLTxck0gWSi1vTWvFaopNlY37s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(2906002)(6512007)(5660300002)(66946007)(91956017)(8676002)(316002)(4326008)(7416002)(2616005)(186003)(76116006)(83380400001)(85182001)(6486002)(38100700002)(122000001)(86362001)(8936002)(38070700005)(508600001)(66556008)(66446008)(66476007)(64756008)(6506007)(54906003)(26005)(36756003)(110136005)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjVwakpWRGZOYTB3Qlh4bXRkTnRvU2UxWGtEMGNuVU9vRURlNkI0dVh6TkRO?=
 =?utf-8?B?UlVEVG1NdjNEZTlCaEQxYkNrc2M1c3BOYXZqK2VXUjVNUURNVUJvbysvdGdH?=
 =?utf-8?B?TTNjZ3NHM25JK2IwVysraFlKQXIvMEhuV0U0eEJPSjd5UHkyaFNqZlZrc1Bj?=
 =?utf-8?B?aVN4OGpORzYrUXJQeXVZSTl2bTBad1hPVnFLTWRPMml3N1liTmhndXZ2Q0Nq?=
 =?utf-8?B?a3krSlNaRmVsSUhQTCtzVVltcTdoTEFsUUF3N1FJbWRPVnJWQXNyVXd0Rmw4?=
 =?utf-8?B?ekt0cE9LN1grZGxBSzA2MmlFSVBsSjVCdHV2WFhUbTBiT3FwTVdVRU5FWUU2?=
 =?utf-8?B?OGVEQTFnY0tjd25tTVNlVmlmRU9Cb3ZmK2J6OEpqaFg5M0dYeHBJSzhuaUJ2?=
 =?utf-8?B?TXVaRVJTM0FaZTdkUy9rMnhJVlpFVVZiQTNzR0hPRnI0cExsNXc4WEtCaGpl?=
 =?utf-8?B?cmRqL1FsNlZXaHBiMmdKQ2V0VFh3ejNGRU1ONllUb1NuYlYrRGljck5ycGFM?=
 =?utf-8?B?Mmx4Qlh4RGdPZDN0WGlZclY3eG5RU1hrUEphUUlHZS9mREpuRWFTY1BSanQ4?=
 =?utf-8?B?Q3lWeVdZaTdxQjV5S1N1ak9na0QrOVRhNmN6NmlFK1h3b2lsN3JZZW8rVHoy?=
 =?utf-8?B?ZkZGK1IwQ1FJZ21YQWRRT2NFbUdPYkZxTDhIY2tzamphWmEwV1o1QlhpbDdQ?=
 =?utf-8?B?eXMzZWRPVzZmYlQwcE50NEd3ZStDVlg2dGdDUElreEkzZTJHNzNCMHRoenA4?=
 =?utf-8?B?MWtteEszRTFkc3pxdGJtbTB5V0dZSjNxT3A3UU82c2JPR1JxZkpYWGhYN0k5?=
 =?utf-8?B?aEFFeGpTYVNlaVZrTTJ2T2p3V0hNb1h2STJybWcvVkVrMFZ3Z0hyOVRQV2sr?=
 =?utf-8?B?SSt2NmVmWlNKODg3K05NZU1WcWo2YXNjc2NyRFRDUnNxL01QMS84UCtCQkpM?=
 =?utf-8?B?a0ZuZnVUQ0hPanZaeWtkdCtTUStSQ3k3a0lYS04yZUcyaE9mbjJvNE15R0hM?=
 =?utf-8?B?YVJSUDg5TzEwR1I0cmI3QTU3ZVRmNHdPazF2K21PNDE5T3FCVitnZmpHc3Ji?=
 =?utf-8?B?ZUtvMzFjN1YzZ2dVSmJBTmRINGJlc2RHZHNjdW1DdXVIcklkVkNtNDIvbyti?=
 =?utf-8?B?bDBXK2REQ1VlU0dHSDBVSWwzVUdFMXRRb3UvYmlQUkpIV1dZbjgyMnF0c2Z1?=
 =?utf-8?B?UHJEZS9DMHN0Y1ROL0ZWY2t0cEZYdTFHdDJ2RXFhdzZHa1hSbWVmZHIyVU56?=
 =?utf-8?B?TGlxU1Q1YkdvVDJJdWZUU2NGbWxNQjVaZ0xYck9qamdlVFNiM2VLbWNCeWtj?=
 =?utf-8?B?WWhLYjR4NjBqRUxTNndqYkNwN1BOL0RDcC96bDByWkYzRjFTL2NFeEQ4a0lD?=
 =?utf-8?B?bE01S0crRzVoZmZiblRvcTVhZC9OS0FzbHJGT3ZQeTVqYWI5SzMweFlVUU9a?=
 =?utf-8?B?VThYZEpoU0pILzB5Q1E5TEhmSDl4ZWxXeCsyU1lrUWk5WVJISnhHVFZkVHhy?=
 =?utf-8?B?Y25vNGNJdXV3S09Ua3l2M2U2Mkd0anZnVndIbERWb21DUW44SzFoaGRSWXBH?=
 =?utf-8?B?UVlwSE95YzBhaTlTMGRENlZhNTMxTlJTdHUvVGR2L3l2T08vT2ZsTHg5TVNF?=
 =?utf-8?B?U2doSlZZNkVsUlN0TS9Xd2xSczVKM0F4b0hzZFF2bUJKWUh5cHU4a2N4VVhG?=
 =?utf-8?B?UE1aUm9tMlZJKzdKVThJekcwdTRlemhsNXNSUlZxNnF5ZlV2OGU4V1JpS2Fo?=
 =?utf-8?Q?/rWjJs/KSFFH8KDTAY75VtoGqTzInWFlIhk5Z/g?=
x-ms-exchange-transport-forked: True
Content-ID: <2D9C9303D8EC5C48A06E52151417ECE9@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd25db86-4065-4358-5a7d-08d96c48620b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 06:27:18.7192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFzsRkW2E05FaG4jN/HpHT945XAuvYgHV7wYMNOxyFhEkjD430GOgZpxEWEewD8iTFoBH91XluLdvAWVzNDN4uYPmioolX1JiqMYPdKHhTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5636
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_232741_827880_B2CCA2DA 
X-CRM114-Status: GOOD (  19.47  )
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

On Tue, 2021-08-31 at 00:59 +0900, Sungbo Eo wrote:
> MT7623 has an musb controller that is compatible with the one from
> MT2701.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> * add tested by Frank
> 
> v3:
> * remove unnecessary status=okay from u2port2
> 
> v2:
> * rename usb3 label to usb0
> * move usb0 & u2phy1 nodes to the right sorted place
> * disable u2phy1 by default
> * correct u2port2 node name to match its reg address
> ---
>  arch/arm/boot/dts/mt7623.dtsi  | 33
> +++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623.dtsi
> b/arch/arm/boot/dts/mt7623.dtsi
> index 3c11f7cfcc40..21c8a291b74e 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -585,6 +585,39 @@ spi2: spi@11017000 {
>  		status = "disabled";
>  	};
>  
> +	usb0: usb@11200000 {
> +		compatible = "mediatek,mt7623-musb",
> +			     "mediatek,mtk-musb";
> +		reg = <0 0x11200000 0 0x1000>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "mc";
> +		phys = <&u2port2 PHY_TYPE_USB2>;
> +		dr_mode = "otg";
> +		clocks = <&pericfg CLK_PERI_USB0>,
> +			 <&pericfg CLK_PERI_USB0_MCU>,
> +			 <&pericfg CLK_PERI_USB_SLV>;
> +		clock-names = "main","mcu","univpll";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> +		status = "disabled";
> +	};
> +
> +	u2phy1: t-phy@11210000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
> +		reg = <0 0x11210000 0 0x0800>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		u2port2: usb-phy@11210800 {
> +			reg = <0 0x11210800 0 0x0100>;
> +			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
> +			clock-names = "ref";
> +			#phy-cells = <1>;
> +		};
> +	};
> +
>  	audsys: clock-controller@11220000 {
>  		compatible = "mediatek,mt7623-audsys",
>  			     "mediatek,mt2701-audsys",
> diff --git a/arch/arm/boot/dts/mt7623a.dtsi
> b/arch/arm/boot/dts/mt7623a.dtsi
> index 0735a1fb8ad9..d304b62d24b5 100644
> --- a/arch/arm/boot/dts/mt7623a.dtsi
> +++ b/arch/arm/boot/dts/mt7623a.dtsi
> @@ -35,6 +35,10 @@ &scpsys {
>  	clock-names = "ethif";
>  };
>  
> +&usb0 {
> +	power-domains = <&scpsys MT7623A_POWER_DOMAIN_IFR_MSC>;
> +};
> +
>  &usb1 {
>  	power-domains = <&scpsys MT7623A_POWER_DOMAIN_HIF>;
>  };

Is the dt-binding patch applied? 
It's better to put it into this series due to the new
compatible "mediatek,mt7623-musb" is used for the first time.

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
