Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A1C6FD18
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 01:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oVkmppUYjYJer1kRNXfMhluHkQ4iruNrN1NdKXDXHU=; b=mM3T5FEFAY+YE4kVytvPMDxXWA
	NGFjDWcC0hf/HQrOCLCCQnWM91lzjXEkxZElYVfuOaddSG7LP4opc42qb85nxdJX8itmeakBZJQzs
	yNhD58QPNeLUO5hIWqwyT3vnVqETbCMFGsP99KKzt/ZeCi01zkbBZfP31JY4rh7yOv7rTd4fhMwqR
	zMJ+tnToLbZcNakydb/vYeXv/7IB4yxgepeaCgL/YAjGYXEMMl2z7zFOLs/VsRgYEoWtvOcDlTjrf
	P4bianDS6vqeHATUgjX63G876H1nU4L/eVu0e2NEgL2+wgfvmNNVoYJT7lfj51O0B+snfNmtu/jSR
	w+b4r4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phhV3-002INZ-0p;
	Thu, 30 Mar 2023 01:54:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phhUz-002IML-2R;
	Thu, 30 Mar 2023 01:54:47 +0000
X-UUID: 96aa87fece9d11edb7d8d11f642b8e78-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7oVkmppUYjYJer1kRNXfMhluHkQ4iruNrN1NdKXDXHU=;
	b=dY3NKIud/XoTXMqCOPis3OkEhu5iVSDOMucNJcEPn8ddNISQxlUHa1iDsOgAYLBINdn/savgzbpiWlOsrLIFk7aByTXy1YlKqxMFvYIgiFhcfn4RDysR4NX+vo9yy91Dncd1TTqyT25oq7Lp5izVfukWtHm3UfjiLmXBk40NF5g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:25f7d278-a00a-49be-ae2b-c541d8d9619b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:4cc256f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 96aa87fece9d11edb7d8d11f642b8e78-20230329
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1505944268; Wed, 29 Mar 2023 18:52:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 09:52:19 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 09:52:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKD/3rFGyvXMQojYoKv4wB/olXI67aeLsD9bupwNqznutyJgKmBqb+NXZHRswzZzyityDO/8IY4xocZqmtVyJM/k6PWRJWU0ufutllpQcx7Hz1s4TfFvgEgrumcodZwxH2tTXKuzVTkwYsm2yKxPmjxCrKkdaoOAHavw+5a3cgLKA9P99/IHun7dtKWxlkLmXOBw/VclxoiR6GR81FAkhW387f+u/Fu9rr4TMT5y5e/U86Xluoka4b41c0kZoEAnfD8nHeRRapb2LggdDH9ateZ7m+gehR7vvc6CVKkNCmaDrlJbGQueUvDkqq2aUUh6APXOFP5ApjF5pY6S/6ySFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oVkmppUYjYJer1kRNXfMhluHkQ4iruNrN1NdKXDXHU=;
 b=HLMpIevZSmKbAr4lnhfEo8qr4iNJZXs79z5mSY1qs0eSyKOGvCj6HenJ+b9sAc5Af3g4KoCy/PD/Aw/hGjyG5Wj74P/VVxJySblc4ueMA3vdBjCqkMPoxqzEGiPKJTJ291ozkvjv0zso7CQeE0wse4UW+zDC+S6a9/8/698RUKVtddxjotrMYeMehw2ICFuqXH10j3q00ncn86waZpQosVAHekCPaYPb3VRzcLJwX6h3+jymoTyiXjWNv54nmvz3eSyVWj/vl7PaIDMjlcaKiCfyvgH7zHEVETeVn0Tay9XT2EBwiQiy2XCgPvosn7QNi8xHf4ImFg8RFGGd/0dRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oVkmppUYjYJer1kRNXfMhluHkQ4iruNrN1NdKXDXHU=;
 b=aMJJx80VZYa3nVToNTR3L82oL1pIOSOjlEBOKKG7XD3WsA1EUNwuuIUbbR2i9u8ORV41dpN2lnI+KJjLMiOGoookKjJXzaB15PzudPYn82eOCE5GkR4sVLh/mdLHAD6yjRlLxnQjENNhSyDdwiuAJ/p+YySErjZ5d2tc0wemGqA=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SI2PR03MB5942.apcprd03.prod.outlook.com (2603:1096:4:146::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.41; Thu, 30 Mar 2023 01:52:17 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::4298:a8e4:7328:6bb1]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::4298:a8e4:7328:6bb1%5]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 01:52:16 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND 6/6] arm64: dts: mediatek: add iommu support for
 mt8365 SoC
Thread-Topic: [PATCH RESEND 6/6] arm64: dts: mediatek: add iommu support for
 mt8365 SoC
Thread-Index: AQHZYiRKl2UP5l4qCE+yoPMMp7hxDK8SkDiA
Date: Thu, 30 Mar 2023 01:52:16 +0000
Message-ID: <f54b853314c470a29344cd7aaab4bab13f1c679a.camel@mediatek.com>
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
	 <20230207-iommu-support-v1-6-4a902f9aa412@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-6-4a902f9aa412@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SI2PR03MB5942:EE_
x-ms-office365-filtering-correlation-id: 64f8dc96-75aa-4740-d473-08db30c163f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQ0z3d/06DlQVY1C/TrNEGrv9DRejKfSxCGWhJ5ITgFGfR/njnIjx/nprMA8nWBAomTF40IqZqg/46JSTGa6XYhK7B6WnKZtX1juqaHEKVmYxFIzio8XHtnMP84M/IKFiKXC4iRrXbh29kfs9gzhuE7dcG5IBu5N83ygsabEIJ2UqXBayrAxqS95QFR60ZXMxC9DSkkVWeCMAsjRoMF3me8fHzAYlURhkrJwIbImD+e0HYICkhh4YUKl8XM9RYGpU33wg3se1pvYIRZTcwpwx3S5Ak4xIvy0MDiD5Pnkcvi7ODES6bw/2MKQfT7P2tRXuaKuG5xidhWcJsvkT3GYbt5lqY5//8vwyGOpDW09+IYM19h+ewfAzg4B419TgiQ/6ySaYJ0/zKVnN6kbrlY9FDUFX0zrnloxzfpbObiNh89Aipvv9KPxHEbvSK1bOaGVOmuAvGE6cVB3T/ujfivAtE/m7feNPsK3xsJCmDTIsCYp4d0sSSmIqpqg/Kd8Fxk31gyZb19Ti+cZmESL0cPJ56E+DofkoruQCceZ9njGSxN+OOTmLhyCC1TLryOeTE3QZnMT7FLLJ1NGn80T0b2V/JnElIPm6qFzdxqqTsZZKYnopGNIzLiIlpgofa2Bps2VUZPnjv7d2TlkFurXSBeJuPP52//8df+H0eJrxP42TfQTtcAPdZElxIU1Sd8ekGWi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(41300700001)(64756008)(66446008)(76116006)(91956017)(8676002)(4326008)(66556008)(186003)(66946007)(66476007)(6486002)(7416002)(71200400001)(5660300002)(122000001)(36756003)(6512007)(6506007)(86362001)(2906002)(38100700002)(26005)(8936002)(110136005)(85182001)(38070700005)(2616005)(316002)(558084003)(54906003)(478600001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkYySnZoZUZmZ3NvekpZL214N0V5dWU1SGVsYXM2SU5tYWpydjZ5THNEN2pR?=
 =?utf-8?B?RU00V1kxanU1TFVRMHJwSlA4OEZBTGxnMlVxaDVTRXBoZ084TDNrRU1ZL2di?=
 =?utf-8?B?eVR3UU9LWXBiT1dEM05KTC8veTBTN241WE9RNHp3czRKcjlDUzlsYzdpcUtQ?=
 =?utf-8?B?TE81QWRsZFF6a0EvT2lSZCtaRHl6Sk9penpWTDg3WUdsNmJmcFhwOHBwaWxX?=
 =?utf-8?B?VlZUOU1NbWZzcC9ieTNDV2kwWEsvNmVkN0VXWHdHalc1cFZUaGdoZVU1S0dW?=
 =?utf-8?B?K0xUZnQ0NCtyUE56cXF0TUJsUWlYbnVwNVBrZ2QxdFIxMGNoZGRobTlPVTN2?=
 =?utf-8?B?OXNCZkhYS3RIMkIrVEdjMFMxSEQ4ejQ0akphTUNueEQzUHFXOWR0c21XN0Fv?=
 =?utf-8?B?SXFOK0VXaW5ncS9IZ3hVUDByWit5VlVGVm8rVVNFTGZ1ODZ4dXJ0Nm5uQ0VO?=
 =?utf-8?B?VjRmZW1tQmhmblhmcUVvOUNmdGxZOEZCdW9CMHJSN0dIS2phN2hVb252ZkRO?=
 =?utf-8?B?VU5RUkxraFY1R1pJMTJ5Lzg2cHJiSm5KS203cG5TZVhKQnRDOGU4dlZVdzJa?=
 =?utf-8?B?RFJsVXZNRjg5bHFBZ2pGSTVFVVZIcUN6ZndJY2JkaHJOYVJiOERRMjA0NGhq?=
 =?utf-8?B?bG5zQlNXcU9BbzhpcGhLR1RCM2t6MzZQb3gwY3Nnakp2bVZNdDRlMS9QRExW?=
 =?utf-8?B?a2NFRTJFVDlnSHMvTGJVd2dhV1FkejA0RFNNZUV4ZlVVUHoyU2hsVndlV0g3?=
 =?utf-8?B?czI3d3NLc1NGVktISGVpaHVQbmNMZzI5N2hHRmxGNE1MYmZXOVJLYUhjQ2pY?=
 =?utf-8?B?MnFvc1dhcVQ5bys0Z1FqR1J2VVdkOXVveWRTZEpDeTFHL2RaV1FGL1hoemhT?=
 =?utf-8?B?OHBES2RCZ0dOeDVQMThNSWFaVVpSNUowS0RCQkFHM1owZEFyNU5ON2ZwazYv?=
 =?utf-8?B?MHRPYTNMeU5qS1VWWW1aTUlYQzBNRDF5VXNmYkpkam9rRWpvRkJYa1hTT25S?=
 =?utf-8?B?SGZVQ1dhMFVqRTdJY2g2WGt6VThxclMrVG5lUVVnNXRRNytsSjl1NmR6cmJi?=
 =?utf-8?B?MWhoOFIxd0F2YngrQzIzaDhTV1JFZ0gzdFlHRWloUERtMVdsSHd6OVdoRnlU?=
 =?utf-8?B?WTBZZG9EZTlFYkNwNjRVYWhHaHBPWG1UYTFzcFRkdzdMVzJPWEViSkp4T3lt?=
 =?utf-8?B?RE1mdHkrU1pHU01pelpVRFlnL280bVVXYzZKaTB1NnZVeFNMR2x6L0w3aHFy?=
 =?utf-8?B?U1RIOGdvN1RoMkliUzFuWlNLcjBSM0hKcDB1UHI5elNMSWwyTVloWm9NWGRI?=
 =?utf-8?B?dGlsUUNkZ2dlNXdDaHN2Ym13RkMyTUhnL1RYQ2tvdEc3RXNlcHRyNTJMK2Uz?=
 =?utf-8?B?bUEzOHdPcTUveExEWVNlRWpndXh2QW1la0ZNNTQxS0dxRUZLZmtvR1M1cWV6?=
 =?utf-8?B?dGthWjB2NnJ1RnVRU1N0RWtSTXNMWDFFK2xkU3pDNlJzaUM4NE5OSHJ2VE95?=
 =?utf-8?B?ckU4dW03NjVhTU1yTVA0UWhqVXN1RzlWL3ZhN3hzVlhRUmgwcFdqVzBxZGtG?=
 =?utf-8?B?dnRRMStVOGJXVnlGZlY2VEFmVi9WK2lUWGloaURTMmhWOGowRzYwbHVoaks0?=
 =?utf-8?B?aGpOazR1ZXU4R0I5L2RDc3NHa1JaTkFUMkVETlhpNUlWazI3dGRTd2lpcm5P?=
 =?utf-8?B?enhKVzRibDFnSSt6YWc1cWNEcCtMcUpUVEIrODBOSk9Jd21pdkY4aVluTzFz?=
 =?utf-8?B?dHUzU3lzcTlDSUZUNTU1VVovRFFOVytzTFNtdVdnNHJSTHduM0Z2YlNGRTI2?=
 =?utf-8?B?OTd0T2tzb3hiMkdYeUhxZTBra2EzYkIvM3lIZ0hGcEpMN2FhelJRMVhaN3BC?=
 =?utf-8?B?dkthcjJOTjhqbGc4blZLOVplUG5pTnREb3pjQ3VsVWZKVjhiZmFIMFRlQmJW?=
 =?utf-8?B?dTRRZnR6MTI2Q1JYUHI4cFhHK3M2WDFGV0c2WWZYT2dlaFRiWlBzOE5ENFVo?=
 =?utf-8?B?ZUhKMXczYjJsaDQ1ekFkZVJuRkZiYW53Y3ZQRm9QVUVVK0NrVW54eWlIbU1C?=
 =?utf-8?B?aEI4Uy9oT0hRWGZNVmV2aDZ4WXJPdzF1U2d0NVdqOHpnZ0k5N1BWdXRVOWRH?=
 =?utf-8?B?dUk3ajZnamVWWTQ2R3hINTdrOHRtcEdPdmd0bFR1N0FYT3JrWm1pSXJsbGgv?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D2726EC5236134396BBAA0D74188E83@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f8dc96-75aa-4740-d473-08db30c163f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 01:52:16.6562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuEhs/yGgf+SgRQ/fapnSKvKS+SLVlbFiC70WYIYBiNbPdEH433jeR4JG7WvLpCNNPYxHtBBxkZNgtz4MmUpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5942
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_185445_804300_077A9D2D 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAyMDIzLTAzLTI5IGF0IDExOjUyICswMjAwLCBBbGV4YW5kcmUgTWVyZ25hdCB3cm90
ZToNCj4gDQo+IEFkZCBpb21tdSBzdXBwb3J0IGluIHRoZSBTb0MgRFRTIHVzaW5nIHRoZSA0IGxv
Y2FsIGFyYml0ZXJzIChMQVJCcykNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBNZXJn
bmF0IDxhbWVyZ25hdEBiYXlsaWJyZS5jb20+DQoNClJldmlld2VkLWJ5OiBZb25nIFd1IDx5b25n
Lnd1QG1lZGlhdGVrLmNvbT4NCg==

