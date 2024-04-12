Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D64C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQy3jXSiI2f8wePFSoBX/RLsXa0F5mqiML1dBipTTqY=; b=rddgd8vf2o2uKOgIIgLWC3g0zI
	GESIW20YyWQMVDqInVXQHiQrEPhdxRMj05shVhOqLfrgQm3TUl03Mb5GdN4faaVcQFh8UAQNhPMG5
	rU7aVDXMRCmUQUDL9557jE2oBbxGTqakrkvJ2dLCbVoyCTajmx0j1s02eHIjdqXS0IIorA+f/KnZm
	vz3XRucIIzkkNmSHJymIjlrUSaeEoRXDhd+W99KnqRA6Qajyf42ipzQWFqymobLPL8NNxMBQM63yE
	tdaRkmsLzVT5kr2iSMRSHMSojsjO+ZTgY0KUmwN6U4HC/gdYGGBq8RRaHstaFxcXbVjB3cI+YSWxy
	QAxZ4T3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEfK-0000000Gpdj-2CDK;
	Fri, 12 Apr 2024 11:01:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEfD-0000000GpcG-297d;
	Fri, 12 Apr 2024 11:01:51 +0000
X-UUID: 0ba12ab0f8bc11eeac1957ae9f99f617-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OQy3jXSiI2f8wePFSoBX/RLsXa0F5mqiML1dBipTTqY=;
	b=W0RYFKwJKa6v1+9MfHB8NqBc0Jd6G179cie+ToYsm2gNI+fHF2LZGB2/Klz3nlYh+vBYI8yxNYNrlo8t1hz4UISPnpMnKcYHChi8zlH1eoOzT9tPfOjgX3qV7rU/WO0WvU/KNIECHMOvDBkCEhQjKdfknhAT+ij9ZbzL/F38NGQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:bd383ce6-eeff-4cfe-b15d-8383b1732b6d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:404d8191-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0ba12ab0f8bc11eeac1957ae9f99f617-20240412
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2101556436; Fri, 12 Apr 2024 04:01:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 19:01:40 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 19:01:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9RVjJ+r5BYlnF4/wes98RmF2tcgqsHKWKOYveJQxHG5hmH00dpT+g8cVokLTXdbE9/xiFdvBiun2D9TNeKj64jr7i1BpPvgdsxJDpvatXkJ5YRX3a95FD/kV/jyTkmyM+LTYAXZ4ppcYPY5vIveFUDjMKGwfcs4mnJFDb8Em2VCLcFNgzmD0xeU9mw/ykEb4mHuOaVQ01KXFib+hGI9HSGDR7AdfU+cADz5NyPnkLj1L0MydxJWYE8poFZGuzXzvxAyTwZw1m6U8kZduR2zXUcuTivHf/MPBg1+wE4ZY727UHGrsemm7KBk4rxfTwT7V3wt1qHdFLPGt5NDUffT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQy3jXSiI2f8wePFSoBX/RLsXa0F5mqiML1dBipTTqY=;
 b=bFOg51IccyxoNk4bCbIAoZ3fcpjF40t2AR33jh4pL0d2EIoIVASdErNnWBqfd8iEc/ZiDtOE117+DYbjfYW6xmaB80/dLbZ9kGIx5wRgbEKsZcPLEDccMiOFeulphKDZT1dlkJLSPJl8zr1kGh+pOXp5x6iRXvbTDj/XlbUxJso9/XTcOu0HtWE6GzM+eyzg1GH5EpuMC/QhHzDjgwPfhIXYNVqdk5QkQIzyVhvvE0QGZCPS6NohoL29QzZPIKDipFwE0/sT1lUmQ5GdY3B+qtqzMaXUHbAtkyWNFAupBtqBa6XLAilQVWQnWWdx8hMNhKHNs8z9KSB8ciejrYXDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQy3jXSiI2f8wePFSoBX/RLsXa0F5mqiML1dBipTTqY=;
 b=QSaVCtFTRBuK4syOeNP32HCtDwsZF/wFw3h4itIo7KIOw+1XFJ0VoKkhj7kFp3Kbb/6b4u9eF6M6UCie56PvxKrYcUgkVnftQZ4xiQ5xsKwlHwqhtX+fqxavz5DYcgKGjLOOP+ZrWDgoLr8u5RgKTjJAsHmFdrIu4M/PWl3i++c=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by TYSPR03MB8901.apcprd03.prod.outlook.com (2603:1096:405:97::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Fri, 12 Apr
 2024 11:01:38 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::85d1:1a4f:cc89:46fa]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::85d1:1a4f:cc89:46fa%7]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 11:01:38 +0000
From: =?utf-8?B?T2xpdmlhIFdlbiAo5rip5YCp6IuTKQ==?= <Olivia.Wen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "andersson@kernel.org"
	<andersson@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Support MT8188
 dual-core SCP
Thread-Topic: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Support MT8188
 dual-core SCP
Thread-Index: AQHai+NzkV2m7c/nxE+B5uMVEPmmbLFkecyA
Date: Fri, 12 Apr 2024 11:01:38 +0000
Message-ID: <fed4ef723f15991c2445de957a10420e6a1c0101.camel@mediatek.com>
References: <20240411033750.6476-1-olivia.wen@mediatek.com>
	 <20240411033750.6476-2-olivia.wen@mediatek.com>
	 <5cf005b9-d737-4509-a9fb-f0e59465482c@collabora.com>
	 <6e8e553b-8c5f-404a-a396-17d8b3440d93@collabora.com>
In-Reply-To: <6e8e553b-8c5f-404a-a396-17d8b3440d93@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|TYSPR03MB8901:EE_
x-ms-office365-filtering-correlation-id: bf58d103-64ad-4cfd-e3ec-08dc5adfed2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qea1cLAUbe7RSk2odURi/iEv/KWj70EUP1hiMtsaB99fq0esH3xGIIMzyhdJjMXyTi6PE/1csSZLHuvRIWLeypa6SEcK+xLDM6200MAc2//SuUL+He9FIk3NfIiAMgYbtps4YjTMq4uoGIigb/1TPM7bKIH7eHOppVnVBp+MVhIAk/hR6UWb/vSJvdqDYEBjFFMsrAgHo3PrKoTfqWTs6bFLTitgJN6VAFHH/WrECXU0yBqC9lcvxNC5TO8AzJl16q2sInRUvKJ2A2oYwiNy5zI355FjPtjLVmlr6Tyg0uw8tJJq4tZR6gRs6gYCg5qUIV1fK8j+PgJeybubJ699pJCIsJk/1Epw6ykHsOB699tKQ6TXuwi52w3rvpzbsE7DKuh9fpouFBVjQLdmgw41e2JbuhJc8e5oXjnWismAOqfZb6LllGgu9LQgR1q6vHPQw1AnFWRurIq7592HEwZCa8aMHOZeQo72xhgXU5w2nNIWzUJfBizLR5J0LCh9IwgAPyO+9MFOdFT3KHmk9JI4tGs4UOMPb3MA7bi7VoqO6Pz2gNwpo+wBTV5MDAzOK5z7HVk1sTdf2UBKyOYP96admMwlp5P78ykzBdOnJnZLLTzmsq0fq5+HHoR1np6bfUgq2SCuhxZ3IEMQVabkc7FOtR+hATBKxTsPpdfoiyuVwkOlpgD1tQ7UdcPEKFQBMkr1pgT2p9fzkmZIWVGY0B3wPcS88QbH52EPUjuUrhgisiY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1ZycERHRE9PVC83OXc0akNBZmhVZTVDczIwMFhZMHlnV3NpQkR4eWY0cjd3?=
 =?utf-8?B?MXRyNHNUOUdTY1BmcldtL1dVL29QM0lMYXV1QU9GY2wrMDZUeUhKNU5lNHVE?=
 =?utf-8?B?Z3NhaWdUcUJSUEd2MXcxTmFsbUFEbFZCZWFnSUFSMFFKaFZqWGZrUnJ3YStx?=
 =?utf-8?B?bW9qM29tL2MxejIvYVVscXh0am11MWtubmVwa1o0WXRBTVVlbDNJQXE4endY?=
 =?utf-8?B?bGJmM0t3T0RYZjJLdEFnUk1uYSsrMk5aTFdPZGhqcUpIL3BBNkpNLytuekVK?=
 =?utf-8?B?RnhlZG5NM1F6bG9zWG5OTiswNVFlRjY5QmhNbzBYdXd4ZTg4YklKbWIzc3Uy?=
 =?utf-8?B?aGtLSFkrZFA5TGhENmhGZk9vK202dXJuWkpJeXNvNDlCTnJWY0RLU0YwaFhi?=
 =?utf-8?B?YlRJTVB4NEI2aTJHV0xxTC9VQUh3NU9abTlqT3VERmlIZW9RRnpIazg0LzdM?=
 =?utf-8?B?aHdaaHB5Qk9sMUVYTFJsb3VsblUwSjlVMlBBMWs5bWROL1lNbFNzcllERitU?=
 =?utf-8?B?RkhZVUMrNEFPTkRqMlh5Wno4TmgxNmpCbXFzTFZQbEx0L1g0RFRCblpNQVVK?=
 =?utf-8?B?YTdpQjc4a2s3VWNtZXVIb0JsdWFGdTNoNEhtaWs4RHhqTStRMHpSb1lERkJF?=
 =?utf-8?B?M3BLck1qRXh1TGFNc21KRGZQOFA0SmpUWnNiMGR6S0xUNkhjOS84SUJJdyti?=
 =?utf-8?B?YisxNFkyMy9yV3FFbENwQ0d6dC8xV1hrS2doUE5SeUtLUWVYM0puTDE5UkYw?=
 =?utf-8?B?QzhBL004OGVBc3hlZkJEdlV1UVpaazNTQmszaElXY20xa0xJN3dQTlZVTDk3?=
 =?utf-8?B?aUNVTFJlZ0hFeXUvdDJhMFlWcFpuZFFURW15NWVKZjFXeVFPR21ZMGhKVW40?=
 =?utf-8?B?dmRjVFVpYlR1U3NEdWlDdFhnOUtQU09kbHFoaU53UmJRb250dzNtd3BqbmhO?=
 =?utf-8?B?SXcrdDlJOTE5aFNqRUZvWm9BOEhlTExGcE0zRGM4SFhWdkVGdTJqNDZGbWsy?=
 =?utf-8?B?L0lFeHp3aXBia3gwcnMyOTVEeGREMXlZdzB5bGhXa0N4b3RiejV6WlNXS3Bi?=
 =?utf-8?B?cnFGc3VRVWZBRDNqL01KN0NmSHJXRkRTdkt5MHJDWkdzclhwNWUxenVNNytI?=
 =?utf-8?B?c0tzalpKNzBnWWNVNlBqbDlYR1FWbk5vTUIwNEp2QXI5WFplblFwUEFlVFUz?=
 =?utf-8?B?YlJ3YzlIcEY4bTJPcGNiTDljTVZmVk90Rjk3QjNFMHV3OVdNaURDUUlHVUpM?=
 =?utf-8?B?UFhzM1V6c3VyazRvYzdKbXc1TE5KaU1FMXhaeEJzd0FNSXRBWThEVkQ5WnhI?=
 =?utf-8?B?c3p0NWdYdi9sb2wwa3FreHhEa3VxOCtZNVZ6cStGUnd6TGltbE96VWxwTVBX?=
 =?utf-8?B?QjlPdkNUY2k3K1NnaEpycDRGTU55UkhaWVN6YnkyWElKQjZMWFVwQ1lkcDJS?=
 =?utf-8?B?M1VOUGoxbzh4MW9XYW42c1JPWmQ5N3drbTV6RFV2RXlzWnNveS9RRjVTV0xx?=
 =?utf-8?B?QjY1NXVxcjBBRGNscXJ3YmpjQXltZGs5QTVwcy9ObnNxbGhuS2ZtMmt2WnZq?=
 =?utf-8?B?bUNXMlhkVlB4MVdpMEhiK1dVcjRGRVNnOURqZG54QVZ4eGp6Q2t2Y1lYTkpu?=
 =?utf-8?B?M09JdXEyNm9HY2ptcHhrVUFZUVJWWTE4Z0YxcTRnSVFURkJCdVRiNk5aeXdX?=
 =?utf-8?B?NmZWOHRpWDlRSzJlNDJkSnUyT0xQSThSdDNjbXpOMXI3ZjRlYXFmeFdtRFVQ?=
 =?utf-8?B?QXJHUXZzeC9iQXlRUHpoam5DWGpZVFVDczNlMUVvN2owYkUvb2FialZqelZo?=
 =?utf-8?B?SVFlSnYvZEZEY2MwaExXM241VGgvTys5c0Y3S2tHREJxa2R2WDROOW5pRnVX?=
 =?utf-8?B?WjYwZ3NlV1hnOE5JRjNOSDdCMTZQNndqK3I1YzY5dVNJaXNBWVhHdDA4N3R1?=
 =?utf-8?B?eHNPSVZaZGJwNmgzb3htQWkvblllOHFocmdyZSs0bTR4UGkyOVFLMDkyeEd1?=
 =?utf-8?B?Umd4TU1tNFNZbUZ4SEhWVmlacWNod3h6RGU2MTZtR29aR0xrdk1jNEc1VnlD?=
 =?utf-8?B?Sld2TldKZFFpK3JHVlNFakM5b1YzN2tvTitnbmxHZ0p4c0tpUlVOOWMvY21N?=
 =?utf-8?B?SkQ3R3Zza0VpQmkrcXd5SjB2Y0E4SjBsTmM1b0k2ZDQ3UG04cGszWm56NUFn?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C0342383CB2BD42ADAB7ED19F272D00@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf58d103-64ad-4cfd-e3ec-08dc5adfed2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 11:01:38.2634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDoD39H9VupZyelt1h59EmV6jzFdLevvkPRwhrdge+K24I+6Kei2IlYx2yMYo4slXNMsNNuOhaHjEJH+FAvzrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_040147_634347_EED13712 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgQW5nZWxvR2lvYWNjaGlubywNCg0KT24gVGh1LCAyMDI0LTA0LTExIGF0IDA5OjM5ICswMjAw
LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwgMTEvMDQvMjQgMDk6MzQs
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86DQo+ID4gSWwgMTEvMDQvMjQg
MDU6MzcsIG9saXZpYS53ZW4gaGEgc2NyaXR0bzoNCj4gPiA+IFVuZGVyIGRpZmZlcmVudCBhcHBs
aWNhdGlvbnMsIHRoZSBNVDgxODggU0NQIGNhbiBiZSB1c2VkIGFzDQo+ID4gPiBzaW5nbGUtY29y
ZQ0KPiA+ID4gb3IgZHVhbC1jb3JlLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBvbGl2
aWEud2VuIDxvbGl2aWEud2VuQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgfCAz
DQo+ID4gPiArKy0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCANCj4gPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1s
DQo+ID4gPiBpbmRleCA1MDdmOThmLi43ZTdiNTY3IDEwMDY0NA0KPiA+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sDQo+ID4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGss
c2NwLnlhbWwNCj4gPiA+IEBAIC0yMiw3ICsyMiw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICAg
ICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXNjcA0KPiA+ID4gICAgICAgICAtIG1lZGlhdGVrLG10ODE5
NS1zY3ANCj4gPiA+ICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtc2NwLWR1YWwNCj4gPiA+IC0N
Cj4gPiANCj4gPiBEb24ndCByZW1vdmUgdGhlIGJsYW5rIGxpbmUsIGl0J3MgdGhlcmUgZm9yIHJl
YWRhYmlsaXR5Lg0KPiA+IA0KPiA+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXNjcC1kdWFs
DQo+IA0KPiBBaCwgc29ycnksIG9uZSBtb3JlIGNvbW1lbnQuIFBsZWFzZSwga2VlcCB0aGUgZW50
cmllcyBvcmRlcmVkIGJ5DQo+IG5hbWUuDQo+IDgxODggZ29lcyBiZWZvcmUgODE5NS4NCj4gDQo+
ID4gDQo+ID4gQWZ0ZXIgYWRkcmVzc2luZyB0aGF0IGNvbW1lbnQsDQo+ID4gDQo+ID4gUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gPiBhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gDQo+ID4gPiAgICAgcmVnOg0KPiA+ID4gICAg
ICAgZGVzY3JpcHRpb246DQo+ID4gPiAgICAgICAgIFNob3VsZCBjb250YWluIHRoZSBhZGRyZXNz
IHJhbmdlcyBmb3IgbWVtb3J5IHJlZ2lvbnMNCj4gPiA+IFNSQU0sIENGRywgYW5kLA0KPiA+ID4g
QEAgLTE5NSw2ICsxOTUsNyBAQCBhbGxPZjoNCj4gPiA+ICAgICAgICAgICBjb21wYXRpYmxlOg0K
PiA+ID4gICAgICAgICAgICAgZW51bToNCj4gPiA+ICAgICAgICAgICAgICAgLSBtZWRpYXRlayxt
dDgxOTUtc2NwLWR1YWwNCj4gPiA+ICsgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1zY3At
ZHVhbA0KPiANCj4gc2FtZSBoZXJlLg0KPiANCj4gPiA+ICAgICAgIHRoZW46DQo+ID4gPiAgICAg
ICAgIHByb3BlcnRpZXM6DQo+ID4gPiAgICAgICAgICAgcmVnOg0KPiA+IA0KPiA+IA0KPiANCg0K
VGhhbmtzIGZvciB0aGUgcmV2aWV3cy4NCkl0IHdpbGwgYmUgY29ycmVjdGVkIGluIHRoZSBuZXh0
IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcywNCk9saXZpYQ0K

