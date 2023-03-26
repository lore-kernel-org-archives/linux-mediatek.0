Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37379C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mGaPypfEpGixNvcqokESdaxl6CBttsT5VOXge2vvus=; b=48zgi9YNFgQmosn59PUkXuCfM5
	GGpaTjkh0FOQHtWqCOUo9JbWgCmCpPWVlnPZ7jDkkKonxaXQM5VAondqI8tZ7CA0Any0PKpBnLm/f
	rskmZFk1vWDHYjCWsXuGNfFicx10+bMIhZ7hf1E/s71UKIMdJuhWp702TX6r4oRfcE7BU85OK4MBW
	Ug2oqs1KkeWk+Lr0/LgabHT71BIU4T9zpEongikAkfUS0+f9akurMUyTlkmjr2pv9plqI7D01pDxc
	rluFCoKehKTRPiLs/XBsklP/oukFoVO1IWbcGF7Hnen6l5wQ8aPTQa964T7KpEOq0rymy4jGMTZa0
	EyTu/g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgUse-008xfo-0g;
	Sun, 26 Mar 2023 18:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgUsa-008xeF-0H;
	Sun, 26 Mar 2023 18:14:10 +0000
X-UUID: f9377ab0cc0111edb7d8d11f642b8e78-20230326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6mGaPypfEpGixNvcqokESdaxl6CBttsT5VOXge2vvus=;
	b=VrmxC2mPMhn+/ldfsCl2KqPu9Iw0pKZQiDf25rKBeCUye/TBZ5pcn4JAqbqPW0+b3jNkYn0ujlhlFUV7h/U3ZcvAugbkCtRidMrq+5mlw75MYjFMcnuY9/GBgM4Hq5w8CdvCymhTlve7DVUOvxeJN9Yp/ffMKotqox+KWL3S9m8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:34fbd01a-0a43-44f0-841d-271f545697db,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:84e767b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: f9377ab0cc0111edb7d8d11f642b8e78-20230326
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <landen.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 704183480; Sun, 26 Mar 2023 11:13:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 27 Mar 2023 02:13:54 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 02:13:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3VuyHpSqhFj6rV7nNg1+0RWJXBqiJhlIY5atGjXYgdqvDI+ovRWX6UPIfmmbrTSICDtc+E2/TXd6ZEVCcTchcfUtniqLj1sY43zEKwozd+n/iz3RnKBnU1hmwJDH4gL1JwY6axQ4mm+1uuFv7yN1eT0NaQXf+1AmLYGfVZl9JNhbnj4M/tTjKzpaaDY4vKAYCGkeBcq4d6YCVohVFgX2WCIRTuvuQNMC9AgyiYUsfXmVFNLRbuqHqoVKTYDyXC/k/3YJd/Jop2FUmSt7x4mOxI6xo4PAiuzGLuV+la2TjPls9sXjZ0V0tNImqz2IC7DdczMsuqCUAyTRRig/+VjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mGaPypfEpGixNvcqokESdaxl6CBttsT5VOXge2vvus=;
 b=JXGYPTtcMCjbKEQLPXixmDtQ17K1zA3MDf2wIuNbvK7bKlLo5BpCixtcq5ffb0i5kWlA3sEzPPNEfyI31+2Gclxoy7+7HvMGnBaz6A/i+5E1BGH4RVyPII56jo0aBbsb6St7KfRKcU/FMegBRrrzqYvdvd3yBYKhDSF2XsuvjZNWSGaDiVO8xqZIku34i4aM2d0RG2VdHQwxyj/hH+1aNhWhJBLQrihdzs0a63Ra/SKrwJ/MWOnYdrbzu0uqVDy0bvsqdNoY8/Bs+GI2v02FJ2AKMkvmv32mbUC0/vUIDKbUHQzCW5v028Wpmdr3KYdihYJGMOLLVqRh7RJz3TC2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mGaPypfEpGixNvcqokESdaxl6CBttsT5VOXge2vvus=;
 b=hJIsSO5w5vrZyh57knvX8yaN11/WaeyowRj6Q3CRYUqhanE8k0SBG8FHW3ics6Au3NDCtezX+bEIpmuXy1dEl8lDGkZBAyR+83FObWr9EZ/ykc7K4UEDyx3LnXf+ltkyQ1a1ZULT0uK6SLr4kJDk/ur04mFXhgSMOJmgaO40VNU=
Received: from SG2PR03MB5182.apcprd03.prod.outlook.com (2603:1096:4:de::17) by
 PSAPR03MB6235.apcprd03.prod.outlook.com (2603:1096:301:9c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.41; Sun, 26 Mar 2023 18:13:50 +0000
Received: from SG2PR03MB5182.apcprd03.prod.outlook.com
 ([fe80::2428:bdbc:5582:4864]) by SG2PR03MB5182.apcprd03.prod.outlook.com
 ([fe80::2428:bdbc:5582:4864%5]) with mapi id 15.20.6178.041; Sun, 26 Mar 2023
 18:13:50 +0000
From: =?utf-8?B?TGFuZGVuIENoYW8gKOi2meeajuWujyk=?= <Landen.Chao@mediatek.com>
To: "olteanv@gmail.com" <olteanv@gmail.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "arinc9.unal@gmail.com" <arinc9.unal@gmail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, Sean Wang
	<Sean.Wang@mediatek.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "dqfext@gmail.com" <dqfext@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "erkin.bozoglu@xeront.com"
	<erkin.bozoglu@xeront.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "arinc.unal@arinc9.com" <arinc.unal@arinc9.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net 2/3] net: dsa: mt7530: move lowering TRGMII driving to
 mt7530_setup()
Thread-Topic: [PATCH net 2/3] net: dsa: mt7530: move lowering TRGMII driving
 to mt7530_setup()
Thread-Index: AQHZW18D4jD4kE171kSFtPDNy25/jq8NZqyA
Date: Sun, 26 Mar 2023 18:13:49 +0000
Message-ID: <4d9c562eb980642381cb43f65efb2ee13d742485.camel@mediatek.com>
References: <20230320190520.124513-1-arinc.unal@arinc9.com>
	 <20230320190520.124513-2-arinc.unal@arinc9.com>
In-Reply-To: <20230320190520.124513-2-arinc.unal@arinc9.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB5182:EE_|PSAPR03MB6235:EE_
x-ms-office365-filtering-correlation-id: 24bb0ec3-d217-4240-5c6c-08db2e25d96e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LP7MPSIq8vNYxbNilrUA7WT2jD04lGk5+BWpjjMogrGPa6NkMBkGrmO20ipZZdcyf6ocygbGnR9Tr1Og1lRGMszSJSFS3DS9VQDp4I5ZwW/NlMqHrRc5N74e0aV/r3T6GtALhE5Y7NYtoocLh/gJV4ZEOuyxTt+kiruqnVGnBrzrFMPSmuOPWitijQc78ocYW0RxOWtvpcaOmCSjlItOtAg2H1pGAochB11ilqCkmI8VMUijbKC7s+oAur5zK/B0KuNivaIq7Ku61ffX/BhOOAJ0Lw87qe2efEKHYrJ/+gLS+XoLt2+JdbSfWaPv792nDEiqU98o8VEv6JZuf3y8Vds72ithssWBR75HVYTvUJY4Jc9AdwTMUapbi8oI6QEsBpSqyFxdfdr836qel6rQeECkttfaU8pShyMwpvPxdJ19K8rZQF+vlhUtMQflUAdlqJR7JyGeJgzPVwGQPk+8BkWschV2YMecvBepzbKPC0/pskzftvAsqfeXYfsP61A3UAZc00tsdoDXL1ErMvOdUkushExxiKvx4zZfkEmpbouyVnltaWid+LLYZkpeYs/NQJov6iV5yG0JjTRBEZknhmdJ3L1Hc8KSzOzfJxRsoqFTgpAbdvdJG8qidUVktOpj8S7UXkYNG7b7Z3NFg1c/4bX89cP6H12GL6hpzwq6wNLFpE+PAHrOQYK+jcQlVN/T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB5182.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(451199021)(54906003)(4326008)(316002)(6506007)(6512007)(26005)(5660300002)(2906002)(7416002)(8936002)(921005)(4744005)(38100700002)(38070700005)(122000001)(86362001)(8676002)(91956017)(66556008)(66946007)(66446008)(76116006)(64756008)(66476007)(186003)(2616005)(85182001)(41300700001)(36756003)(478600001)(71200400001)(6486002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXkzZXJWeWk1dUx0Ny9xZDFrYmVNTnIwU2Fyd3FEVnE5cDZzYmdlYXlzRGVN?=
 =?utf-8?B?dlluUVIxcC9ZU1VXcVpLZ2phemRSdElqeHg1TlRER01VQkV3RTlINGE4UUdI?=
 =?utf-8?B?bUdzQWo4MjA3aGVOU2VZT2Z4MWFCWXkwY3d3NU5zaVd1eE1NemdZaXhSekt1?=
 =?utf-8?B?QktnNkVWVzhuUHNUTUI4Q1NTMGRocDhjeUtRMmpLcmQxMC9qeXZoWkQ5Skto?=
 =?utf-8?B?Z0c3RmltOVduUXIxOGhCaXZpQmduNFhSQ29SZU9vQjZLTnpNMnIyeVp5My9B?=
 =?utf-8?B?UjhidXFhWTdRSktRbTJNRWo2MktrelNFTVdhQkxVYzBuREs1VjVMVFU3Wlpl?=
 =?utf-8?B?N3g0Ky9rQVRGYVlqQjEzUUljL1A3R1JyWWFSQTRMV2NOOXBZVVFhTHFvQ0ZW?=
 =?utf-8?B?UkdkZERtSDNHUjZMMHBjcHZzK1VBSjJka0ovZWV3ZzI1Unlzdmk4ZFRUdmYz?=
 =?utf-8?B?QU5sWEdlOUJQOGFaUmdlUytaZVZEN0lBYVNuVlFUT0UreUhGbEloQlowNWp3?=
 =?utf-8?B?RHBVVi90VUtmcEIrK0FKaDFZT0ErRUw5NG1EakFGOFJxVmFVQU1CR3kvVStM?=
 =?utf-8?B?NUNXQmUvd0RiQWU5K0t0WWM4NWlqQzZtWldLVEtDRVQ0Z2ZKK0gwWDZ1L1Vl?=
 =?utf-8?B?SFZGMlgwcUYwK0crdlJBTGJVTGkwakg1OG55Q2JTSW55U3NvTDk3b2RvdFNF?=
 =?utf-8?B?Q3ZucUYwMG1tS2hQT2UyYTNPYmNMZ1p6UHV0S2pPTjRJTUNCTkg2MDZRSlFW?=
 =?utf-8?B?LzlvQWlDRE5wNHdMNVg3SXZQWlI4OWc0Z3phRUdtV0twYlg3U0tJeDBjQnJO?=
 =?utf-8?B?VkxNdHVYdW5neUlmWGZ0Z1hXYVlFU29wRUsxalQyZGkyK0Fyam03cXF5czk4?=
 =?utf-8?B?dmNWcTcyUldHbFIxWVlrY2NNTDF4K3JuSTNYdCtQOUtHQ0pxa2hLWGpoTWpY?=
 =?utf-8?B?aXQxdE51UE5sNDhwUk9Ia3NBSHoyQjcvbkZzdjhORzM2a2tZb2N2MlNpWHFl?=
 =?utf-8?B?WkZYWUZVbXhDUnMrQ1dRcDU0WGRLY3hEZ1g4U1Z3UVlXQUJDR3BxWWJIWmJh?=
 =?utf-8?B?N2ZXYkxKcitZNnlHbHpGOUZqM1liRFFDbHJDaUZhSk9oSE5yaERWTHMrdGg4?=
 =?utf-8?B?Z1N6a3VWTHJrejRkbjl2Tzl1V0lPR0E3eTgvN2xPOVQyclR0c0xNYlptS1BO?=
 =?utf-8?B?NmdFajV5bTQ0U1hudmNlUzFOaEo0Z2pVcVJteDdvMWJQWFdRaTJJaS9LRG9I?=
 =?utf-8?B?RWFYTit5VDBhVGdiOFJudTVHcG9OOXltZ1NQV3BrdmRpVG1MeDFLc0FFOWNT?=
 =?utf-8?B?bVhSNGFNNFRhWTJVa1pmc3NTSklTY0NNcHJIZ2FrQ0E0WWxNRDJkSm84bUFk?=
 =?utf-8?B?eHRnbnVXcDRkbXhVS3JxOEJ3VUJFYXE0SkQ0aFpyb1lUa2VQczlGUk4wbDNw?=
 =?utf-8?B?YWJxWkJ3YzFjdmVCdFgvTmNFUWFsN3RiQ2RYb1dHSEtaYWxWU250ZUZGRWZv?=
 =?utf-8?B?VnJ5MHZyZjkyMmdtTTcvL3dPYWNSQXNoVWwySHRjMURjRUpCcThVZFI0Q2w1?=
 =?utf-8?B?OG9wR0pXNnQrWE5BbSsvVDlYZzVhYU5saXJ4Z0hzb1ovVHdyeEdNblAxQ081?=
 =?utf-8?B?aEQ2SXMvZ3lqb1FWMkRKSU1HMElJTU42N2hzTTRIQlY4QkZQSS9Sb0Q5YVEx?=
 =?utf-8?B?Q0MzMzBPVVdlQVQ1SFhabExFRmpOUjk0KzAwOFlhWk1GMi9xWDd6WC9rcS95?=
 =?utf-8?B?WndYYWJIS3lwcm5XNXFvcjBXMU1nNDhRY25LUC90anZoelUvaW80czJxTEww?=
 =?utf-8?B?TTlBcUZpMmZqN3FERHRJWWsvc3QwTklDVjBpVWlwWkJjdGp0WXlYRHpZWVR0?=
 =?utf-8?B?MW80RGtEeXBmYXNMaFVTM0ZTOGVsTWVsbDE1MTFkOUFPTXdZN2dUamJLMTNX?=
 =?utf-8?B?OHZ2dGFMM0t5NTU2N0kvSHdIUi9WZmpDUjBvSURHc0VWc3BSSWFyRHVWRXZO?=
 =?utf-8?B?UmJYNnpWajBRRU85b2xTbTBQS2V6MTFiM0g2MlVOd05DY2VZOVRkeFRkVUNF?=
 =?utf-8?B?dnZKMlRZcWNwTDROTVJ4anpZNmFucXNFS2hzRjlSUkw5UnJLbU03YzZnUTdw?=
 =?utf-8?B?UzE0N05oVkE5RHZkNFgwVWxvc2ZZVDk0UGJzNFBhRGFibWthR2JpdENNR2Jt?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08BAC12111F2084C988EF741E0004A0D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB5182.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bb0ec3-d217-4240-5c6c-08db2e25d96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2023 18:13:49.8988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TaJL9k0assa6AFA42lhXp75+lGP9ZgPIY77Bg7n1DXzqHRqRAodd0cOS377x6MohCIb4gMS2EC8ol12it0qQeyteFy2vR8+14teWFms5UII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_111408_498092_D174E653 
X-CRM114-Status: GOOD (  12.15  )
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

T24gTW9uLCAyMDIzLTAzLTIwIGF0IDIyOjA1ICswMzAwLCBhcmluYzkudW5hbEBnbWFpbC5jb20g
d3JvdGU6DQo+IA0KPiBJIGFza2VkIHRoaXMgYmVmb3JlLCBNVDc1MzAgRFNBIGRyaXZlciBtYWlu
dGFpbmVycywgcGxlYXNlIGV4cGxhaW4NCj4gdGhlIGNvZGUNCj4gSSBtZW50aW9uZWQgb24gdGhl
IHNlY29uZCBwYXJhZ3JhcGguDQo+IA0KPiAtLS0NCj4gQEAgLTIyMDcsNiArMjE5OCwxNSBAQCBt
dDc1MzBfc2V0dXAoc3RydWN0IGRzYV9zd2l0Y2ggKmRzKQ0KPiANCj4gICAgICAgICBtdDc1MzBf
cGxsX3NldHVwKHByaXYpOw0KPiANCj4gKyAgICAgICAvKiBMb3dlciBUeCBkcml2aW5nIGZvciBU
UkdNSUkgcGF0aCAqLw0KPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBOVU1fVFJHTUlJX0NUUkw7
IGkrKykNCj4gKyAgICAgICAgICAgICAgIG10NzUzMF93cml0ZShwcml2LCBNVDc1MzBfVFJHTUlJ
X1REX09EVChpKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBURF9ETV9EUlZQKDgp
IHwgVERfRE1fRFJWTig4KSk7DQo+ICsNCkkgZ3Vlc3MgeW91IGFzayB0aGlzIHBhcnQsIGFuZCBJ
IHRyeSBteSBiZXN0IHRvIHJlY2FsbCB3aGF0IHRoZQ0Kb3JpZ2luYWwgYXV0aG9yIHNhaWQgeWVh
cnMgYWdvLg0KSXQgaXMgdXNlZCB0byBhZGp1c3QgdGhlIFJYIGRlbGF5IG9mIHBvcnQgNiB0byBt
YXRjaCB0aGUgdHgNCnNpZ25hbCBvZiB0aGUgbGluayBwYXJ0bmVyLg0KPiArICAgICAgIGZvciAo
aSA9IDA7IGkgPCBOVU1fVFJHTUlJX0NUUkw7IGkrKykNCj4gKyAgICAgICAgICAgICAgIG10NzUz
MF9ybXcocHJpdiwgTVQ3NTMwX1RSR01JSV9SRChpKSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgUkRfVEFQX01BU0ssIFJEX1RBUCgxNikpOw0KPiArDQo+IA0KPiANCg==

