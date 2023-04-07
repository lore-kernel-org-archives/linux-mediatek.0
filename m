Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860F1C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAMsHDb+6PVro1GVOqntObEfiV0oixGw9Cp6C3Q154M=; b=MuYB7uOlF+OwceAOBXl13Vwzp+
	JHdTNoXlMdfzuJTRAIHu9OrjhsUNC0YlLySl41Ddx9meDaLIWX7Rpjdvg8UtDKeP+GV87H95XLw1A
	zriCtIPAUuY21I+wx/7nwYZmnjhVKza/yhBcBpZuTqQfq1PaJqbk/p+TJTuHHcw83DzA8p0c4YNr4
	i7O2mgq+H9CF0a/l3FWfmt9lZ+vW/sY9rm0xdIn07CPdOQo/W4PnYN5FlomUqD4yTnp9ddAPnZIou
	6kfw6ufsUkvjdP7VwV6Abm3KQeonDk5PtJOgXApfXVK6i7WwvGxl5iG62LEt4wXnOOFneNK9jAHDl
	2v0GBdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhDF-009SVI-2U;
	Fri, 07 Apr 2023 08:12:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhDB-009SUK-31;
	Fri, 07 Apr 2023 08:12:47 +0000
X-UUID: f8942e6ed51b11edb7d8d11f642b8e78-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TAMsHDb+6PVro1GVOqntObEfiV0oixGw9Cp6C3Q154M=;
	b=geedgYHGAI/s9TJoCmbPt7Vw3YASdciU4VJ6QUtaW3QATrN5F2pqlNqGCdwC/LwyANsrLDegtqceK2RlRviBopvoO59TvlQqD2eqhMVk2AtPM0rjPFFFpQteQ+E5mpAmE+i/GdIVC73IkGHnwkpGR+Sw+tDfb/Se9sR+K7GZ0CU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:14310794-4a45-4e57-97e0-fae6eb1a6e85,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:d8969f2a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: f8942e6ed51b11edb7d8d11f642b8e78-20230407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1533949394; Fri, 07 Apr 2023 01:12:42 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 16:12:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 16:12:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecmf2bZ5MbIAwD7ILoK5tJCJ/O0l80CKGtAQeq5saG+FhhM6sRpUpsH/FaF8etaKCUeGiQZWWNhHUM6VBY6FB9Hi+m18wNpaUu+5/bWPyNIG8IAdbG1uMSCUQxmjeJnZvaQl1p3XGmz7G4oUf1XvWgXnAYDLdDgoU1OavYcFkktYpbHuM+mhhBJqoNRM9bqNWiWebfIAYmryRDRqovVAktmLp9NtcvVTby1Tv5kyA+RliZwsFwETHkxdpCpfR7AGZROnLPwFPiS2K5E7xi/bmjc7ERwRGBW0xOlhFc6S5mU40dhaBWhulPugbHfTqnTk2qWvuDLcUKcmoQ9ZOfeDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAMsHDb+6PVro1GVOqntObEfiV0oixGw9Cp6C3Q154M=;
 b=eS/IBj41Q6FQonP/5d6KyVt9ONB6hiiHZgJ+zwsItaRLGZDWj3DGsYkAYIhsg7WQKkOROhdKLpgVcR5vcRRiLZBiRLfve+/MPuGrWB2CehAlx+W+iAseXuAYVbRA7nKWaJ8v+OjduJK40n+8WZcpBUdhwOsqEU3CMpCYmJa/GMvP1Sh+iTuI0nePv9gPCLAFafysr58kLVhQFLkxWi6YApfLOR9nkMNiQ7ImnbzcTdq/v9a3PN/xRsSykm5yaJtBV/4I4gvOXj8T6YEArYqq5JU5c9+teMZ9AiAUWOdBnMKLgJw+l7LMBymw3NsQXyU2IIm9esmzT8KCnMs28rBDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAMsHDb+6PVro1GVOqntObEfiV0oixGw9Cp6C3Q154M=;
 b=CJwGLHX1K44BQL7dOqIRiN44rd0Fi0qIiM6odO++PoCT6K3lpAVRe7ZjunzlFAVuE+fyWjtAvFycnacNqgkCfvsHf3it7U7dL0pAU3RHbdqPal843h6xZ2ScOWznxRKXm8AeQJphmXV2A0L3XzcyfhKXiZgiJk283//zURUlyS8=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by TYZPR03MB5422.apcprd03.prod.outlook.com (2603:1096:400:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 08:12:07 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464%7]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 08:12:07 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>,
	=?utf-8?B?VGlhbnBpbmcgRmFuZyAo5pa55aSp5bmzKQ==?=
	<Tianping.Fang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH 7/7] usb: mtu3: add optional clock xhci_ck and frmcnt_ck
Thread-Topic: [PATCH 7/7] usb: mtu3: add optional clock xhci_ck and frmcnt_ck
Thread-Index: AQHZZddoCng4h1GjY0KJ872Xwjvxia8ZhYMAgAYAFYA=
Date: Fri, 7 Apr 2023 08:12:07 +0000
Message-ID: <a3691e8c93ed33a29011f716667b6963c44ac23f.camel@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
	 <20230403025230.25035-7-chunfeng.yun@mediatek.com>
	 <8e7584d6-92a1-e948-302e-489af8cf6394@collabora.com>
In-Reply-To: <8e7584d6-92a1-e948-302e-489af8cf6394@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|TYZPR03MB5422:EE_
x-ms-office365-filtering-correlation-id: e8490865-9d07-4087-4aab-08db373fc761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f2lth6EHdV/VWpHFlgxrKyF2bkMYP6vmC0Xdiaad2VUe1B5tVVtnd5OeLejCeqaeHxENJc5w3evj1ZoU7P6MbSN6p4gtPAkWOBAZ9ye/PQTDTimK0mpa6AZQLotqODpTfHK6ePDWQdYmm/v8AdaDP9enaU7hR/ubcQjpSJ7BfZHTibB79x3D4NvPsRuwI+foAXrPM/2y/SunTLC4Yi7C+un2zajqtTVvrBvXmpDT/rJ5D7mk5KkyGh+sfFsrMTBXEzNY42q4DfjrvW2tx2W3VctTt4CQxyTArO2bjJpb0xGY7Y7CjeJw+7eMS+csdH4c+Js40BDRuDe5SnQ+q80laQ/auxq/rerGrEf6sl63XzTuNB27OPKRl0lmEX7PFrcQrYlfY6p+Sr2mCLE7jvOeJDZvFb6fhl8aAJivPsa1Q/hgduWXaA2a3oEaUlFg2x9+/8GxxGTwg9sSAX9yS8R/lpM3rn0/7OVjKfi4pC8G3Das0sdHIRKpUyM42oB6kjADu12eYGfVAhhmvYupr2lX0Qvq1dmpxZjDdwZywJoEpG8bqg2PdjXONdYjpifPos9O9z2Tuzwlm6o+VGZaGetPV4WD6c/aA79uG8/la2wydROg9gMllxX7pwCwUIW0niJrR3Z+fGgJpSvyf9XWodb86A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(478600001)(5660300002)(7416002)(110136005)(54906003)(316002)(76116006)(38070700005)(8936002)(36756003)(85182001)(86362001)(4326008)(91956017)(4744005)(2906002)(64756008)(8676002)(122000001)(66556008)(41300700001)(6506007)(66946007)(26005)(6486002)(83380400001)(6512007)(2616005)(66476007)(66446008)(38100700002)(186003)(71200400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEM5dWp4bUEyZG82S3YreWpjK1ZBaktzcFdGcDlaOVZWRXBySWo4TVV2dy96?=
 =?utf-8?B?cFk0ajA5V3MvN0RFRmdYR3VnNEtqbDZGdVpRVDY3MjZFVlRSV0JUcW4xSWU2?=
 =?utf-8?B?TTN0VWJndk5VTVN1Y3FEQjFGdEZTSERLYVpNZ2J2WWVuN3U2OHFsTGZwazBo?=
 =?utf-8?B?anV5akgwNU1kSFpNZ2dob2RVRmRyZU9IdjRmZFJ6Qm5sY1Q2ekJiSVEyT25j?=
 =?utf-8?B?U0YvODE0YzJPYXJZbU00WC9BcmdvcmlabWVlT3JmWWtqNzdoaUFEZDI0VHlU?=
 =?utf-8?B?bnA3eVhaRFpuMzhCb2NiU0lzVFhWeis5SFJmbWpjL3JoTktXc2tyR2wzckVn?=
 =?utf-8?B?YUovVXM3b0hqc3I0Z0pIa2w3RzhYaUQrV2FhWk5ld0d5TFhkWnk2RWZhTWVC?=
 =?utf-8?B?aEozVzUxSDBJaGRzT1J2dmtuUW14TDg1ekNLeG1Md3A2anZsbnhPUTB3eldk?=
 =?utf-8?B?UVgxbEZBblc1d09WZGF6TzQvTDhOVE1iWU5vRGQzVUE1ZW9aRVg5VjIyNVJI?=
 =?utf-8?B?V2VjVkc1U29odEIzcEI1ZEtwQ25lWTZQejVoZThFMEo4dWhnNWVRSGcrK0Q4?=
 =?utf-8?B?aGZLeDFGSUFCYm1XL1JrOFYvRHQrQ1NKSTVNVDc0OUx2cnJQTDY1U2F5V1Jj?=
 =?utf-8?B?ZEp3L0s4akFsS0NyVVBrOHVKQVpmT1lDL1pFa3p6V05NZ1dPU21sZld2bVM5?=
 =?utf-8?B?TnEzMXNvenI0Qy93UkdmejUwRE9kRW9JeExGR24xdkQ1TnA1L0dNdW1ONVpM?=
 =?utf-8?B?dlV1RldOTlFoclE1Tkcvb3VwMHZJSCtPT1ZoMTRHTzFTOUNqemZZK1Y1T2s5?=
 =?utf-8?B?VmFuNURybmN1N3NMNXJWS3pIYUt4c3FzbEZCVFIrckNpMjBRelBKNHV1RGxM?=
 =?utf-8?B?THExVGVxdmZVVDQrV0ZEUHhEeHY1ajI0Wm4wajBIU0JsV2xEY3pobG5pQ2lx?=
 =?utf-8?B?TnQwVVhDNVN5ZWtlL0NmUk9BRStGNXdkbVNyU21RSUlhdUhMczBEbWRFc20r?=
 =?utf-8?B?MlJCTnhZcEhCNWNFaVI0ZjIvZTBnazFpRUgwbTduQjV6RTVGM2lTbHRjZGNn?=
 =?utf-8?B?UjJqVmgwZFdGL2RCZUhmZ3BNN2tXcHB2c0hqbXJ3SkhybDdmRUJBekFDMWYr?=
 =?utf-8?B?S2hUL0lmUjJPRm1yZnlTOGpiZnNJc1lZNlNHOEhkVWs3dmhkeXVTK09rY1pu?=
 =?utf-8?B?RE4zS1hGc0hJZjRaZEtnZkNTVTZFeG5vQW5TZEVORWV4VXhYUHpHdUV2L05P?=
 =?utf-8?B?aUdRNXZtMTNTUVk1MEV2RGlHYk9mWFpkL2pyNWhXS3ovVmlURUNoNE1oVUxj?=
 =?utf-8?B?NFZSaWhIMFdCR05jSEJFSmlZbER1S1pFNUNMWjJ1bEVlb1daWmRtWEI2ZkRs?=
 =?utf-8?B?blRtaDhkSjFRa2lHZVUwQ1oxcHlSSEpCU0FsMHQ2ZWlmUUgwWTk1bEVIb05j?=
 =?utf-8?B?RzNlMm85WFBtNzkyUkhpZTZSSTM4eTZDaXVUNzNZWFhFRUNpNGJQMi9Wbjd3?=
 =?utf-8?B?RXo1eDN2WUZ0RTFpMGFHUEdtV1BlSTBXbVZBY2ZORENKNXdTaVptUC9JWUJq?=
 =?utf-8?B?d3JBQ04zamRDL1RjR25IdFdnK0ZGYlQxOW5Sa25vL0hnR3REQVE3b3JOVkhO?=
 =?utf-8?B?c1doTWtOZ0xheEN4ZVJVckpyOWc4R2doTVN0RUg2ays0cDNraFB3THJvdlYz?=
 =?utf-8?B?SGxJSzlLZ1F1K1ZnUHluQ2pPTTczTFR2emwxZVEvbnN0NGlTaTJRWU5QL2U0?=
 =?utf-8?B?eDJvU3BONjYyK0JkZkw2NmJ1b2xtNU5MYTAvNDRvZXNISVR4dEJkV20vb2M5?=
 =?utf-8?B?NCs2SkxWNm1WMkNkbEt2b2g3YzZ0czFidzdmbCtIRXNIZ29CK3VCM3EyT2d2?=
 =?utf-8?B?MlZwd09TOVpBSGZ6cTNJSVd1N0ZubHU0dUV5alNqMjQ3MEd4aXdOQTY0TzBM?=
 =?utf-8?B?bEt3c1NtS243ODBNY0V3aUhOWnNhUXI4S1NLYmJOL3d1aDBxUzh5Y1F0a0c5?=
 =?utf-8?B?d0F2bjlnVTZIRklnK3BpbDFwemlheFczQmpncStCWC9PNHpYK1pxcDdVa2w5?=
 =?utf-8?B?TjVQVDBuNHNBSTMrenIzUnVOQTZYbDdoNmhHQjd4Y3NCdDhSV2Z3bXdQVWRM?=
 =?utf-8?B?RGgrMEUzSGxDVGFGUGU1dFFNRUxKMUZmM0o3YjZ3cXcyUktGWDRKS3pCckxF?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BD956B8CA22CE4A98D6829FF5903A92@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8490865-9d07-4087-4aab-08db373fc761
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 08:12:07.0359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUJuJgrGHvxw4jthKL35Zl0MTcQ6lryQ9ARMThxNQkPje6kBfO2aJkkM1GU9uzmIrhQZQfqmjJl9Q/XBo6L5VIZx+h9pzmKU7QQ8knQ1kDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5422
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_011245_986015_C1AC3422 
X-CRM114-Status: GOOD (  14.61  )
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

T24gTW9uLCAyMDIzLTA0LTAzIGF0IDE0OjM0ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwMy8wNC8yMyAwNDo1MiwgQ2h1bmZlbmcg
WXVuIGhhIHNjcml0dG86DQo+ID4gQWRkIG9wdGlvbmFsIGNsb2NrICd4aGNpX2NrJyB3aGljaCBp
cyB1c3VhbGx5IHRoZSBzYW1lIGFzIHN5c19jaywNCj4gPiBidXQNCj4gPiBzb21lIFNvQyB1c2Ug
dHdvIHNlcGFyYXRlZCBjbG9ja3Mgd2hlbiB0aGUgY29udHJvbGxlciBzdXBwb3J0cyBkdWFsDQo+
ID4gcm9sZSBtb2RlOw0KPiA+IEFkZCBvcHRpb25hbCBjbG9jayAnZnJtY250X2NrJyB1c2VkIG9u
IDRubSBvciBhZHZhbmNlZCBwcm9jZXNzIFNvQy4NCj4gDQo+IFRoaXMgbmVlZHMgbW9yZSBkZXRh
aWxzLCBiZWNhdXNlIGZyb20gd2hhdCBpdCBzZWVtcywgYHhoY2lfY2tgIGNvdWxkDQo+IGJlDQo+
IGEgY2hpbGRyZW4gb2YgYHN5c19ja2AsDQpObywgaXQncyBub3QgY2hpbGQgb2YgJ3N5c19jaycs
IHRoZXkgYXJlIGFsbCB0aGUgMTI1TWh6IGNsb2Nrcy4NCg0KPiBpbiB3aGljaCBjYXNlIHRoZXJl
IHdvdWxkIGJlIG5vIG5lZWQgdG8gYWRkIHRoYXQNCj4gdG8gdGhpcyBkcml2ZXIsIGFzIGl0J2Qg
YmUgaGFuZGxlZCBieSB0aGUgY2xvY2sgQVBJIGluc3RlYWQuDQo+IA0KPiBXaGF0IFNvQyBpcyB0
aGlzIGZvcj8NCmVuY291bnRlciB0aGUgaXNzdWUgb24gbXQ4MTk1DQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IEFuZ2Vsbw0KPiANCg==

