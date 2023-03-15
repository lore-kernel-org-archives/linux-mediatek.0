Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D9C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgXTx4enF6WTuFopDZLWu9/TzGywfS0OHVqcSFKv44g=; b=bfw6VW8X5NQGuZw5aDQCBKCiEH
	dYBINk3i6tj6INf2CMZ3DDKU1A12ovGZLMThdDYM1z+rUJC0pNj1nyRSz6sT9M4Yei456xBxxMYdF
	12IsIcWVr1O5m9IarjP2scwSCnoEkg+LaSOTGFOGMymlHbx0QWiSh3IivZKlKY6K+DLd+2CdaEEm5
	sieyIZmizi00GQNNXfI87CyjgnY0DRKfpQM+2pYGMbf2vTxSWNoFPv2UipUBdM6kSbz2jmpMYfBuE
	///duARiFKE0LEgfWM0MCbkSQJOZWHbYQp7Zp47IjaJHeh/wJ4HQT96dGZRNkZsoFAfqnfdaS8PTE
	8i4evNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO6q-00D1qw-2G;
	Wed, 15 Mar 2023 10:11:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO6n-00D1oO-1Y
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 10:11:51 +0000
X-UUID: c7b3e258c31911edb5598346aad47b14-20230315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lgXTx4enF6WTuFopDZLWu9/TzGywfS0OHVqcSFKv44g=;
	b=r0rQAhHXvRcT4nFW+bWTSpa2MqziYGrSZIGwb92BFyfg0eJj85XsqTJxiCTQW/QHtAHmAA3gbpYNyxrwa+oxzPk/tiAnmhK9tCSRR8T++S1Ay55Tw6F38NLGIQFzLTBh3oKFRJw/QGQXE0/ii/cS/8R79B/MtYINAx4YITElYtI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:3f61fd64-b6d8-4bb1-999c-4be963791b43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:1d05e2f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c7b3e258c31911edb5598346aad47b14-20230315
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1138462379; Wed, 15 Mar 2023 03:11:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 15 Mar 2023 18:01:38 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 15 Mar 2023 18:01:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1ENwpmhmyj2j4i0sptOTCIdjD+g9jc5yj6lcoq2Fk3pvbo4HwyGYl2L4uefZGyLIO9dKkyQBxtgnBy8v908aeL93kx5y8TVXDsxM2IC9x5kZRkQLrMFzd4ZDdRLC0ZV0PgxhTm4gHItiXVAYDCtTRsqNQoecHxAH/nOzS+k+YuNrqKcczv9IbhxWO5Mz4c9IlX+6XI12XRS5Rz45L32W0TAk4egUF/vQY2RxwjoQp8zka5r7gBo7nNFYRwhj3o1PcGjNrsZYoImQmLe4HX+kwjfNPNHCGlO8Y9fVSoaiG94903GglptFRXbR28HRKBHKSrVQ98XakZHUAw6uj15cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgXTx4enF6WTuFopDZLWu9/TzGywfS0OHVqcSFKv44g=;
 b=WEGis0jYGbTx02J6ZdSMPQU8k54Nerxpymn+VNfkf5ntKZY7SYwp30JGbuVcm/H2uTDw32dGFtn10lKaKNRkiBYfQpSDkRaoQ0nqaOuKR1Mxu20maL6+8KTCYCpU9+zISD525uoEimDsnA5lCjiD2Piwp6UyMhDnkgZbqcAAJ+bMccofFEipLoonwFpA2EtC+4bvzWvMAuxGZMnuM0HAKIjFwIUgZR+zFHdErRFl5hanlAZWaKtOAoZOGJBJJTrC/qzd3AKweijkZu2fzG4f7MucqqRq9efxQR95ATNXqFb6VAPl0Wr6cZXo88GpotIsjISPox8c6wQiyf39B8BDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgXTx4enF6WTuFopDZLWu9/TzGywfS0OHVqcSFKv44g=;
 b=eDQtt2v75xdcyxaRM5ib0wKd8RN00mPYawrzx56HLU3Ak1hFY7BMNsfhdCCsw0o6ZXdBcpmEqqkvbsA4cJEUFARs4hnQ/IaHqDdAjDq0n2k9KOOUZ8WG7jWoLCajZ3ztgiTXU+PmuHKMfkJezuwnhrJ2kC6HAt8V2QEhb2FHkro=
Received: from KL1PR03MB5507.apcprd03.prod.outlook.com (2603:1096:820:50::6)
 by TYZPR03MB7153.apcprd03.prod.outlook.com (2603:1096:400:33c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:01:36 +0000
Received: from KL1PR03MB5507.apcprd03.prod.outlook.com
 ([fe80::a826:a86e:abc3:e552]) by KL1PR03MB5507.apcprd03.prod.outlook.com
 ([fe80::a826:a86e:abc3:e552%6]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 10:01:36 +0000
From: =?utf-8?B?TWljaGFlbC1jeSBMZWUgKOadjuWzu+Wuhyk=?=
	<Michael-cy.Lee@mediatek.com>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	=?utf-8?B?TWljaGFlbC1jeSBMZWUgKOadjuWzu+Wuhyk=?=
	<Michael-cy.Lee@mediatek.com>, "nbd@nbd.name" <nbd@nbd.name>,
	=?utf-8?B?TW9uZXkgV2FuZyAo546L5L+h5a6JKQ==?= <Money.Wang@mediatek.com>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] wifi: mac80211: check the control channel before
 downgrading the bandwidth
Thread-Topic: [PATCH] wifi: mac80211: check the control channel before
 downgrading the bandwidth
Thread-Index: AQHZFeW7Ufe4GFzX60OkXD2JlsAcjK6kFeeAgFZLJwCAAARYgIAADRSAgAADGACAAajigA==
Date: Wed, 15 Mar 2023 10:01:36 +0000
Message-ID: <629361853628dd817d9c3b3dffcc515216805d04.camel@mediatek.com>
References: <20221222091354.14050-1-michael-cy.lee@mediatek.com>
	 <277f8db1f790931aaac0f94ba0ea69efcb6ba3ac.camel@sipsolutions.net>
	 <70f19f86043750c8f164c316496a8690709fc062.camel@mediatek.com>
	 <386c21d475215c95966bbac6b0853e2715081789.camel@sipsolutions.net>
	 <c9a31a6c06fe7a48df1d7871ac563b6f71cd4436.camel@mediatek.com>
	 <6528ceb761b7be9862dfc5e404031e832f086cb3.camel@sipsolutions.net>
In-Reply-To: <6528ceb761b7be9862dfc5e404031e832f086cb3.camel@sipsolutions.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5507:EE_|TYZPR03MB7153:EE_
x-ms-office365-filtering-correlation-id: abe2c99c-e3af-46a8-4617-08db253c4357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5UyMfghgkfSGfM1aoa+ApAn9/RCaz0SJ33MbaQ8nOjj46Aa2imURXvciWYHLkJDIpPug6mXrpy9uRsYgLw77Qce+gcQgfKdd05hkVvaq8N/ECChIFumwjCy+clI4/VPi5tfKnlkQ5Y8UpZsv5dGpCPjbMLnIMOTyLn8QfB61SXtYjqXi2gD9kt8ZtFVGUU92pp1A1m7HMMbQyiZM3otdh407zY6cQscNqFCR2oH2H91sutOqfZ41TxvFuKvWbgXk7j5Mz2RYr7ZLugaob6AoOzjSSK/DeUIrUGobPCBxZtjIUXKSBqaCh5HzfgI9s9mrVStjLC7b/fY0KNKJxtoJ2CB/By0PEBYEnfiYW+bAhNhFlbLayNnCuERmN/p6uPvFeEmS9UTHgHSYFJz9e5sQwga7uAfIf2m7srOYKYilWCTdBqQot5vAFDceAkJSVc9m0QuLH8eskpGZsAz54BJimJOu6RQX6hWPL4JssUiVF5hy2+GC1g6X7renVc5JX7mIPiPwxQWFxV30NiH4Iyg4uptDHiqmwSUahWGCtJXaYpdndozRc+dg0aEe2OSlthh2YEfxHiX2kw8PFRSiE0CEXJyX80Z/70H+WJnE+eT1kxv2WtGayF18gyrDKnEbKussHaYbSnDLElZn1FR9+hUGg4SI6awQM9xFcpbwTtds0dF/+8mrBEzI8/yvs7DJrZE5889EBfU2poG0ixoX6AYbZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5507.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(86362001)(38070700005)(85182001)(38100700002)(36756003)(122000001)(8936002)(2906002)(41300700001)(5660300002)(316002)(4326008)(6506007)(26005)(83380400001)(6512007)(110136005)(186003)(54906003)(2616005)(8676002)(66446008)(66476007)(66946007)(91956017)(6486002)(107886003)(64756008)(478600001)(71200400001)(66556008)(76116006)(66899018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blgwcnEzSEVmL0xtckxDNFhzd1FqZTRaQ05LazE2Z0o1YTRwL241MzZtN3hN?=
 =?utf-8?B?ekVQakdqYnljMkpFcWRFQjJPVTY4VHAvZ0RyT1hZWkVXYWdwN3d0ZEx4Y285?=
 =?utf-8?B?M3hGdE1hK2ZtUWVHL3VxbmpLOUR6cUFGbk5jcmJQR2pvME16N3pqTnhKTTFU?=
 =?utf-8?B?QlV0YTRMN2NpMVh2VEMxSWJtMFlkZnpsamdidlE5bm5lY3hVQytmckNsTVQr?=
 =?utf-8?B?MXJ0UnhQTS9mejRSeGdoWjhKNDNJSDgvYzNjajRIdnBrb0xGbmhUNUhHRWdn?=
 =?utf-8?B?TXB6T0l5OXA3NXlkU1p3WHo2a2Jhc1hTYXJUYnpoR3UzazRZYlZ6cndoQU0w?=
 =?utf-8?B?a0xhWVNxZ0V3dVVFejdiWkFBRWd3TGNrOTl4WXNwMERFZVl1VzR4Wk5scUZM?=
 =?utf-8?B?emxHWVc3ZUZFNCtOeDRtRzlzY3poaUdZWnptUlRNV2l6bnRpWkFJeStmcThZ?=
 =?utf-8?B?N2p6elJRWnZmYkNzME9WUXZUbWVJcmN4R0VMTUVxTGFGM0pUOWRLKzNMNWYy?=
 =?utf-8?B?ZjBSdTBHWTB4cjdxVUU4U2p1Z29XenVIYzh2WlhDdk5PVThEbjB6YXJ0b3Zn?=
 =?utf-8?B?ZTN3YS80bitKZm85Y0lNM3BxY0NIVzN4d1h1ZGd6cmFDN3MzQWYyRW81MEcw?=
 =?utf-8?B?SGpteVJxS2E4RWk5Q3FxYmo2U3pwcWVvUGloaDRKUHRxRHN5ZVdZSDdpZGRU?=
 =?utf-8?B?R0dSczc0bytuZjN3R3BYSlc2eGR4N1A3UWVuUkRic3JGeXFlNk56Nk1ZVWUx?=
 =?utf-8?B?ZEZKVTZRZXdlQlIxcmVCdEIzREViZFpBYSthekdFYmxzR2gxQ09UVm5Bb2U5?=
 =?utf-8?B?Um9hbHk2bzdCQnpYa2lQREw1MzVOK3RROTB3RDZxWXBwcnVWS0Z5cmlKdVRx?=
 =?utf-8?B?Ri9mUmdIajlHLzIyVWZvalVVZVpmUHQwN2NPOHZqQi9WVm1kZTVHSkdGSmVn?=
 =?utf-8?B?QVhUakxCMWdSdnJqcndyRk5CZlhkeFo1M1FsSGFDdVVyNjRaNEZoMHh1bnFq?=
 =?utf-8?B?K2ZHQkl1WXp3Zi9MaTNhaU9TZjQvTjF5Znh0MDljWk5YQXV2N2hGeGJGL2N3?=
 =?utf-8?B?eXpOdk14Vm4vdVdvNS84c21uZDVaTzJ2blVuU2lid2V0TzhnOGhrSXB4N3VV?=
 =?utf-8?B?YVE5V1c3dmlmd3ZMcU9oK3EzSGRoeGR3YUVQNk1pbVZ0MGl6WFZpMjBwLzQy?=
 =?utf-8?B?a09Cekl2RXNZbk51NTg3QndQa3pZazVrMHZKU3NVS3BCSktIc2thQXdOaWZy?=
 =?utf-8?B?K1pYSWs4WDNraFFOUWZ3SWQzTW9XcHM0Umt0MCtjbFFFYllnQXJWWWxvdFFJ?=
 =?utf-8?B?YkFIbllMNlRDTDcveVZkL2Jtd05zdTNCUWFpamJzL0lxQTdqUldYbGNWOERZ?=
 =?utf-8?B?cFgrbit0SkdvZjFaZHdRT1dIbGEyQXUyWXgxQWpUQ2hMWlBOZDVsSVYxOW9n?=
 =?utf-8?B?QTgyMkI2ZytQZVhScCtXVVUzSTNFN0pOQWZ0SzcyTzF5Vi9sS29DRHhNK1Jq?=
 =?utf-8?B?dER6Wm5BWitBakYzZUdmS0lEYmMzQnNpd0tRZHlEUGhvMlFuZVpoQWpjaTdS?=
 =?utf-8?B?NlJJT285NHJCeW1MUVMxRmRNNGZQTHVsREk0RXYyTlJnVHFJRkFSeldLTmt4?=
 =?utf-8?B?eG9ZOUVDKzhLaFdJdDIrYk5CajNtb0NUU2FZV252d21zUlB4M1ZtM2d2S1BP?=
 =?utf-8?B?RzZ3eGpsT2w0UDJ3VytQUzFEUFgrbWx3RzV1Q2o4NEFjc2tkV3JlM2JyNXdn?=
 =?utf-8?B?TGk2eGtsYnhiK2pxK0M4NUpmUXZ6cXBreGlldFJuWWg5cGNKbmlKdWFlaGVL?=
 =?utf-8?B?cnd5SjRvNHNVaUZRZzhSTklxK2dLaGlpK29UaGZqOFdrdEdCeDR0aG1UUzFG?=
 =?utf-8?B?Q3g4YkhJeHR3Qi9lM21ncjFxN1JBOCtYV2k3VUp6SlhGUFVWdXYyNk5LbWwx?=
 =?utf-8?B?ditPRmRhN3VCcnZJZmZFL2VjNjd3U2cvR05Hcmg4YXlKd3M3c0xkcnBWS3Vv?=
 =?utf-8?B?UFZEV3htRWFpRkVsOExpckhJbFQxaURSemR4WHhTanRKSzZjb2RYZ3FsbWhw?=
 =?utf-8?B?K2dqbGxOa0lvWnV5cGZmS2h5WkhiVnN0blZLV1RtbUMxYmNBODB5MDFuRmhM?=
 =?utf-8?B?aG8wNUNZd1RJM2VIb2RCK0M2N2o5dG1oK2ZVcUtCREtCbVpCU0IzMGY5M3g3?=
 =?utf-8?Q?1S8ZVPtWeXQmJwtkBEM8Qu0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <305203BF1226194085853DA2CACF2974@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5507.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe2c99c-e3af-46a8-4617-08db253c4357
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 10:01:36.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vype3kKIZdEnzbNw2Qwx1/MZZIqXsY+T9XDQQus/shcyl854o1jOo6rqGjg8jSp3Pn1TDFVjMBlGc9OUE1rmshu5eozyH2UCFPoUzPL3or8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_031149_800778_B82E21A8 
X-CRM114-Status: GOOD (  18.16  )
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

SGksIA0KDQpPbiBUdWUsIDIwMjMtMDMtMTQgYXQgMDk6NDAgKzAxMDAsIEpvaGFubmVzIEJlcmcg
d3JvdGU6DQo+IEhpLA0KPiANCj4gPiBJdCBtYXR0ZXJzIGJlY2F1c2UgRXh0ZW5kZXIncyBTVEEg
aW50ZXJmYWNlJ3MgaWZtZ2QtPmZsYWdzIGlzDQo+ID4gY2hhbmdlZA0KPiA+IGR1cmluZyBiYW5k
d2lkdGggZG93bmdyYWRpbmcgYW5kIHJlbWFpbnMgY2hhbmdlZCB0byB0aGUgbmV4dA0KPiA+IGFz
c29jaWF0aW9uLg0KPiANCj4gT0sgYnV0IHRoZW4gX3RoYXRfIHNlZW1zIGxpa2UgdGhlIHByb2Js
ZW0gaGVyZSwgbm8/DQoNClJpZ2h0Lg0KDQo+IA0KPiA+IFNpbmNlIHRoZXJlIGlzIG5vIHdheSB0
byByZXNldCBpZm1nZC0+ZmxhZ3MgYWZ0ZXIgYmFuZHdpZHRoDQo+ID4gZG93bmdyYWRpbmcsIHdl
IGNoZWNrIHRoZSBjb250cm9sIGNoYW5uZWwgYmVmb3JlIGRvd25ncmFkaW5nIHRoZQ0KPiA+IGJh
bmR3aWR0aC4gSWYgdGhlIGNvbnRyb2wgY2hhbm5lbHMgYXJlIGRpZmZlcmVudCwgd2UgZGlyZWN0
bHkgZmFpbA0KPiA+IHRoZQ0KPiA+IGFzc29jaWF0aW9uLg0KPiA+IA0KPiANCj4gUmlnaHQsIGJ1
dCB3aGF0IGlmIHlvdSBoYWQgYW4gYXNzb2NpYXRpb24gdG8gc29tZSBvdGhlciBBUCwgb3IgdHdv
DQo+IGNoYW5jdHhlcyB3ZXJlIGFsbG93ZWQsIG9yIHNvbWV0aGluZyBlbHNlPw0KDQpJbiBvdXIg
c2NlbmFyaW8sIGlmIHR3byBjaGFuY3R4cyB3ZXJlIGFsbG93ZWQsDQppZWVlODAyMTFfbGlua191
c2VfY2hhbm5lbCB3b3VsZCBub3QgcmV0dXJuIG5vbi16ZXJvLCBhbmQgdGhlDQphc3NvY2lhdGlv
biBzaG91bGQgc3VjY2VlZC4NCg0KQW5kIGlmIEV4dGVuZGVyJ3MgU1RBIGludGVyZmFjZSBoYWQg
YW4gYXNzb2NpYXRpb24gd2l0aCBzb21lIG90aGVyIEFQLA0KaXQgd291bGQgZmlyc3QgZGUtYXV0
aGVudGljYXRlIHdpdGggdGhhdCBBUCwgdGhlbiBzY2FuIGFuZCBhc3NvY2lhdGUNCndpdGggYW5v
dGhlciBuZXcgQVAuIFRoZSBzYW1lIGlzc3VlIHN0aWxsIGhhcHBlbnMgaW4gdGhpcyBjYXNlLg0K
DQpUbyBkZWFsIHdpdGggb3RoZXIgY2FzZXMsIHRoZSBuZXcgZnVuY3Rpb24NCmllZWU4MDIxMV9j
aGVja19zYW1lX2N0cmxfY2hhbm5lbCBpdGVyYXRlcyB0aHJvdWdoIGllZWU4MDIxMV9sb2NhbCdz
DQpjaGFuY3R4X2xpc3QgdG8gZmluZCBhIGNoYW5jdHggd2l0aCB0aGUgc2FtZSBjZmc4MDIxMV9j
aGFuX2RlZiBhcw0KUm9vdEFQLg0KDQo+IA0KPiBJIGZlZWwgd2Ugc2hvdWxkIHByb2JhYmx5IGlu
c3RlYWQganVzdCByZXNldCB0aGVzZSBpZm1nZC0+ZmxhZ3MNCj4gYmVmb3JlDQo+IGFzc29jaWF0
aW9uLCBvciBzbz8NCg0KWWVzLCBpdCBtaWdodCBhbHNvIGJlIGEgc29sdXRpb24uDQoNCj4gDQo+
IGpvaGFubmVzDQoNCg0KQmVzdCwgDQpNaWNoYWVsDQo=

