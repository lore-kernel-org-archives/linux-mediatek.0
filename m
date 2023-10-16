Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A60ECDB482
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=; b=a264fVfooRjXAb/lSvJBQIWvCK
	g+E4CBLmNYiWPCwMDjOBLec/a+J/5Adm1ntvAhtrQxS9opUwFafYxxc7EUz/uNCqSlTUMCA21nahq
	4lmVHehfE6NMt10Jv+VVSc7JmAjvA/IQQFlbtsj3D7wN1ADq5Wtpt/hFQEW61IkQcnB5lWGJGEJdq
	3Tfvuy+WwBqOpe8qA/zl0W0BUZrozExXe2lyO8bq4+qWHRw+niJT+tOT58MCaqcFod3CbW3TH9Bdz
	BwBp4PI3MzE+Ilm+Pl5ZwZap/t51LVB4x8QyAbne1hyabZfPd7JBEfM2PFh7JpENGg//SdvkTK9zY
	gKew0+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsF9j-008GoD-2v;
	Mon, 16 Oct 2023 04:24:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsF9d-008Gmb-0E;
	Mon, 16 Oct 2023 04:24:37 +0000
X-UUID: e34418066bdb11ee9b7791016c24628a-20231015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=;
	b=AwVJegDiEadAkPaxzU/OrOWRUb1PGuLK2GuPsx2FhfBczcpOpLMT/hcfRg8Ci4uGJrhcVh5F7jsrjjt2oa+SvA+oAzpP6dqKujrtRnogBQsa++tk9hfsTG/RsVJkC5IMqoR5kcmEIAsyckgKh/YGn+NPVdt8y1dQhJtpW2GsYkI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:e505202c-2c4d-41f9-8739-0f887f5bde4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:9e52f8bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e34418066bdb11ee9b7791016c24628a-20231015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1590827953; Sun, 15 Oct 2023 21:24:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 12:23:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 12:23:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV61PfM+QTQgvgkG2xkC+ypx8WL0MJzduRVlqCBRK/7YWpctMT618GbyVwoi2OeZgkIX1qx8wSkAa9UiC654t35wbYp09qJDJPf+TjaZZ6MVRsO6SHHVDhP3E7xsq3tojF9uo1xWiZ0Yu/uXEhQrOIcjaMaDw9szEL97N1YiENgrwwHKrlyNoFWYWaBd9LXGuvNjTT1Y0pKXyBxOk7kZ0SZQ6GWwIorIjm9lXIfwEbgLTac4qj1vRrSLTSOp4HgVhtm73a3PWcyO0RSBx2U1hZ+ZrksdhIsI3KnhD3+lHRu9nV674ZdVU4MqFyIWE3QIKTuOJ1nFKEWDl5yCMJriEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=;
 b=WGfN/DI71/4gr9zSg8rK5tqCMgvzABmOocAkm15MEnG33TjCtnGucCbNexiFBR+3f9VKuIldmz75rXshlnbFGbsDszlOWYTDzYP53nDTHX9FhjtZeEsw9vSDu+FPtcpdpDKEtYgjXvbn80ggwOtqJImppHQYnDMlF2toIlMprgnLbKVUCbNIy5FMtKEUUW3InvRUu90C1PVuNTUeF6bQAJ7i0Lcx3r49YBA8seulZFKhpV4dYT2jqGpZ98D3Z7fBgE5HOGVL1RfE2EIuvauyNSJlK92f0Qk11vUCQu/mbn+Q1nxRzb7cBXZT5tf5/AfkPH3Hwz0lDlHcuVT1DcwfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=;
 b=CGi374j9WNBueWyey97nuGe9PMKz18FzHpkk5tIHZMKfzWOCIINgn0F7TMJxrjcY9v79sFyLz25LxOapTAZeNfAp/kzn3QHAVy5gjbs5tALnPxWqGD9p120692WL5vP2nc+bWqYLd1vj9iPKgOFqo3OGjxgdz9wL0LLbPduBudA=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEYPR03MB8077.apcprd03.prod.outlook.com (2603:1096:101:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 04:23:45 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 04:23:45 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "daniel@fooishbar.org" <daniel@fooishbar.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Topic: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Index: AQHZ+Cgp187jkr0vBEqA6ERKZhPrzbBH886AgAPs+YA=
Date: Mon, 16 Oct 2023 04:23:45 +0000
Message-ID: <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
	 <20231006073831.10402-5-shawn.sung@mediatek.com>
	 <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
In-Reply-To: <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEYPR03MB8077:EE_
x-ms-office365-filtering-correlation-id: 16f10b01-3691-4670-4d06-08dbcdffafb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTzRmGCxg7jpVD2K5cHbBuiSGMxmVxd0AwX535u5Oip6wPyv306W3RelKkUoHOMXAnxW1Gi8Z7coHRZfMNYI5TAXwpzTxW1Ftc8v/NrX5neagYwBw/F2F41ND8hherBYqsSiisx12vhaKv3CD3A+Fz+brNVp8+OoV03haaDnz8dZQu8rAcEnXdBeXjh6SwXIrPt33HJq0V3U5a5TouwO6Y6zQPuc9/Jo+FO1G/RlZkTWNLXyYss9/LCRRTt8cTkPyU9htOA158hKh4linG9sjugHRRf+Kz/oZlkIK4+o42ATUN+x9+tVKJhyamtEiohPBCY8t8LJ7r5ziZ/e4fvYV0alrIvtBneviutE7aHVCyPpLkiC1yU3iY1bRRdUhhM5ODSWYowhbhyOUMhWyoW6lwvpFE+W8GV5pR9Tv+46tyVSv59UE1NsMBVHkQq0RkqclGduzOTTEH5d2FEefexpMQHFEJG2nUgyq6faDm66VPSGt2B//iqaxYQefHp0R/clPGF+ptcrw25jWmgXX31GrsRkiIIADQ/DqgkQlm4ZDa6mk3gJdE4tejuC0z/Q1dNP2uItSm0AiAenECTVdZpuNrP31hQD75czFI6Ewahaau1uItyPyTIbVCX8kns7QIA+Kqofw44xDNHJDOIZNGJzszmcUUKjT8zFIkZDq1vOBoQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(6486002)(122000001)(85182001)(36756003)(38070700005)(38100700002)(83380400001)(71200400001)(6512007)(26005)(6506007)(66446008)(76116006)(66946007)(66556008)(66476007)(6916009)(316002)(64756008)(54906003)(478600001)(2616005)(4001150100001)(7416002)(41300700001)(2906002)(86362001)(5660300002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lSWWJEL2RCcGtaSk1GT1EyQ2p3dFRZUUs2YWNocm1LbFlkcmlKTk10N2Np?=
 =?utf-8?B?K1dLcjNOZTdWSnBQT2MvYS9kNzBNUmFWNmo1d3ZnR0hCa0FMWmZqQ3greWFN?=
 =?utf-8?B?UnBnN0VnVlhmM3F1YVNvUW1DMUlhQmMxNmt6S0hoVjZTVDYyVVF5dTNGcW5k?=
 =?utf-8?B?TmNFTWMzQ2ZoenZ0STJJcml5OFpvOTY3Uys3N0ZUTWRUcE1xc1Y4OVdyS2Zt?=
 =?utf-8?B?MC80YnB6dkViZ1BnL1FOYXovVWt5czZwaTF4WFNtQ1UxSDB5OVJOKzZXTmVZ?=
 =?utf-8?B?M09VSzBnbnZ5RVdSVFkyL1kzbTFKSEppd2Fwc091dzhUV0dTaVRrdi9Hdnpy?=
 =?utf-8?B?Sm9mbFRJZVl0dEVTNGpZU3I5b0VtSHAzeDRXNWpJak1DY1N0WExrZWpTK1d1?=
 =?utf-8?B?UWJPQXFSR0FYNkMvRWpTUjNOcTI0ZEt4L1hVeGE4OHQyNG9rQi9nMkpRNjhM?=
 =?utf-8?B?blFrRjdEQ1p5UXJyMVJyQXQyNWdBb3JUNlM1MmNFQ0hjK0tOdEZGT1hhL1F1?=
 =?utf-8?B?M0hsUHBwVm5zd2JQckRSVk10aVZlZmI5N3JkdE92Y0dJTnhvWnYxNXQ0SWZu?=
 =?utf-8?B?U3RWcDRNTGxieVRIeTk2UTlhWWdMWDNHczNvS05Gd05MSG5aS3U0dEZkc2FH?=
 =?utf-8?B?T2F4eWRnUUhZNkRLK2MxSko5ZUF4bmNyc1RoaXRqcUxPdExPdjA2RXNtYVNw?=
 =?utf-8?B?Rk0xbXp0U2dURmhKT1hMWTFiemV0UGdiZU1sVUFSS25ocnBTdzA4NnVQcHZE?=
 =?utf-8?B?cnVFWCtER1lzYU1aRW9aTE5Udjd2TXR1QSs3OTJWOU80Mkc0WW5JL2F6RFk3?=
 =?utf-8?B?empBNDMrN1VMK3VNc2Y1N3RRaE1EeXlydmJ3TFdrUEFxTmtVeDBtTkROQW1v?=
 =?utf-8?B?WkhIZkFiTzQ3dVlpN25OZEw4Qzl0ME5FTWVxVnZQS1dFdCtOeEo3T3duTXA2?=
 =?utf-8?B?eXhJcnVHMCt2QUZ2blhXRWowZlNtc3pZTVd0R3l6aE4rMEJhYU9PSFV6ZWt1?=
 =?utf-8?B?d0NQSU00Rk5iQXAvbGNxWmJVZWtiNWU5ZTcyb2ZIb2Q5eVVpWGx6YzZZdXY5?=
 =?utf-8?B?dWgvZ1dNUS81OFBXVnlsWU4xTUtoc3Roblg5OGQ1NXMwLzB5dW9Cb2hDeThF?=
 =?utf-8?B?dFZabDl3NzQ4MEZZTjR4WVJpTHI4TXdRYlN5N2k3ZHBXR3NTeXgvcDRwcnJ2?=
 =?utf-8?B?WVFJMDYzOUJsMlZmdDlBRHlRaC9XWk9YcnNmcUJiU09aODhndFI0cE1JQWlE?=
 =?utf-8?B?QU5Md0lNSG9iU1k1dzJMaUxMWjFuclJ1R0ZQNHBYK0V0bjBXNk1hL2orOE5r?=
 =?utf-8?B?YzRFcGlBcG9ER0FScElVbjAzSTdLN2NMd3N3L25tU04yNGpWUTFMeVNKbXZI?=
 =?utf-8?B?aFBydHMzVTQ1MW9kelpOQ3RJak8yMkp2MTNGVTh0WGZPUGVNSHFjelNlNlVP?=
 =?utf-8?B?SzRqTGY3M0VQOHg5Q2xKZGNRSSt0ZHBSVWdlR1gyS25WaWs3V1MwRmNUeDBV?=
 =?utf-8?B?c1ZxRHFLTGJENW81R0RpT1MydGhhNmRSUFdSY2JCTkZIT2hsVDBYODg3VWxQ?=
 =?utf-8?B?cTNEbVpVbXk4bDRIblQ1b2JrMjJDSlpFOFlhSlJXUEFWeU0xa0YvTGVITkVB?=
 =?utf-8?B?WEtURkxyZlUvbUNZM1JoTXZBdnFSVlN1NXE1R2lUN3JhWWxuMTZwN0E1Z29Q?=
 =?utf-8?B?aUhMb2RoMFVZYk0xbU55KzE5NFlwUzNkZXZNQTR0cTgrZHcxb1JDT2JGeTVN?=
 =?utf-8?B?YkRBcTRIdllVWnNjOFBqR2twcFpmazF2Tzg4QmJ2UTJoeWdEclN4cncvT0cr?=
 =?utf-8?B?RGRWTFl0aDRKaWVLd3hBVG5CQSsrRnRFZlFPUnJKQWpYUEpQR2JlTEptYXFD?=
 =?utf-8?B?NjZlVE9WSjJRdDNrajJWRjd6V3lSdjUzUHV3Lzg4NzhjTzFnaC9PckJVNk5s?=
 =?utf-8?B?NFcyYXppT1BZbENqU2hvdStaNWdxQWhRUHY2b0I5SlN2N0NvYU5hNHV3TFhw?=
 =?utf-8?B?V0E1d3Q3MkF2YW02YzZJM0xHaTdlNlhPSXR4TVJ3a1NxdWFCbFU2MFVMb2xi?=
 =?utf-8?B?N09iVzljbDFQN0l0ZTk3MllEdTNSZUgxRjZKNlV4RkFTVkprSExEb2JrWS9O?=
 =?utf-8?B?S3ZKVGl4em1hdmRJUXhjcWZnVHlNb1BqQVVIdDViQlBCM3JZOHBXcEdEK1gx?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DBDC21625B0884AAF1E4D84E0975AED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f10b01-3691-4670-4d06-08dbcdffafb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 04:23:45.1062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U31HDVLKQekmTEvcS3oPHLqzBNk0iyH5W+cKWJpFWSniA9Z0S55gP7TNL825o20TTGECtRiWG7DGK4pmCHiTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_212433_123448_1EFA085C 
X-CRM114-Status: GOOD (  22.05  )
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

SGkgRGFuaWVsLA0KDQpPbiBGcmksIDIwMjMtMTAtMTMgYXQgMTc6MjYgKzAxMDAsIERhbmllbCBT
dG9uZSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSBTaGF3biwNCj4gDQo+IE9uIEZyaSwgNiBP
Y3QgMjAyMyBhdCAwODozOCwgSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdAbWVkaWF0
ZWsuY29tPiB3cm90ZToNCj4gPiArICBQYWRkaW5nIHByb3ZpZGVzIGFiaWxpdHkgdG8gYWRkIHBp
eGVscyB0byB3aWR0aCBhbmQgaGVpZ2h0IG9mIGENCj4gbGF5ZXIgd2l0aA0KPiA+ICsgIHNwZWNp
ZmllZCBjb2xvcnMuIER1ZSB0byBoYXJkd2FyZSBkZXNpZ24sIE1peGVyIGluIFZET1NZUzENCj4g
cmVxdWlyZXMNCj4gPiArICB3aWR0aCBvZiBhIGxheWVyIHRvIGJlIDItcGl4ZWwtYWxpZ24sIG9y
IDQtcGl4ZWwtYWxpZ24gd2hlbg0KPiBFVEhEUiBpcyBlbmFibGVkLA0KPiA+ICsgIHdlIG5lZWQg
UGFkZGluZyB0byBkZWFsIHdpdGggb2RkIHdpZHRoLg0KPiA+ICsgIFBsZWFzZSBub3RpY2UgdGhh
dCBldmVuIGlmIHRoZSBQYWRkaW5nIGlzIGluIGJ5cGFzcyBtb2RlLA0KPiBzZXR0aW5ncyBpbg0K
PiA+ICsgIHJlZ2lzdGVyIG11c3QgYmUgY2xlYXJlZCB0byAwLCBvciB1bmRlZmluZWQgYmVoYXZp
b3JzIGNvdWxkDQo+IGhhcHBlbi4NCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB0aGUgZHJpdmVyIGNv
cnJlY3RseSwgcGFkZGluZyBpcyBhdXRvbWF0aWNhbGx5DQo+IGFwcGxpZWQNCj4gdG8gY29tcGVu
c2F0ZSBmb3IgdW5hbGlnbmVkIGRpbWVuc2lvbnMuIFRoZSBmaXJzdC9sYXN0IHJvd3MvY29sdW1u
cw0KPiBvZg0KPiB0aGUgb3ZlcmxheSBhcmVhIHdpbGwgYmUgZmlsbGVkIHdpdGggYSBzcGVjaWZp
ZWQgY29sb3VyIChibGFjaz8pIHRvDQo+IHByZXNlcnZlIHRoZSBhcmVhLiBUaGlzIGlzIHVuZm9y
dHVuYXRlbHkgbm90IE9LIHRvIGRvIHRyYW5zcGFyZW50bHkuDQo+IFVzZXJzcGFjZSBtdXN0IGJl
IGF3YXJlIG9mIHRoaXMgcG9saWN5IGRlY2lzaW9uIGFuZCBzcGVjaWZpY2FsbHkNCj4gcmVxdWVz
dCBpdC4gSWYgbm90LCB0aGUgYXRvbWljIHJlcXVlc3QgY2hlY2sgc2hvdWxkIGZhaWwgYW5kIHRl
bGwNCj4gdXNlcnNwYWNlIHRoYXQgdGhlIHJlcXVlc3RlZCBjb25maWd1cmF0aW9uIGlzIG5vdCBw
b3NzaWJsZSB0bw0KPiBhY2hpZXZlLg0KPiANCj4gQ2hlZXJzLA0KPiBEYW5pZWwNCg0KWWVzLCBQ
YWRkaW5nIHdvcmtzIGFzIHlvdSBkZXNjcmliZWQsIHVzZXJzIGNhbiBhc3NpZ24gYmFja2dyb3Vu
ZCBjb2xvcnMNCmZvciB0aGUgZmlsbGVkIGFyZWEgaW4gMTBiaXQgUkdCIGZvcm1hdCwgaG93ZXZl
ciwgdGhlIHJvd3MgYW5kIGNvbHVtbnMNCnRoYXQgYXJlIGZpbGxlZCBieSBQYWRkaW5nIHdpbGwg
YmUgY3JvcHBlZCBieSB0aGUgaGFyZHdhcmUgY29tcG9uZW50cw0KYWZ0ZXIgaXQgdG8gYXZvaWQg
c2l0dWF0aW9ucyBhcyB5b3UgbWVudGlvbmVkLCBzbyB1c2VycyBzaG91bGQgbm90DQpub3RpY2Ug
YW55IGRpZmZlcmVuY2UuDQoNClRoZSByZWFzb24gd2h5IHdlIGFkZCBwYWRkaW5ncyB0byB0aGUg
ZnJhbWUgYW5kIHRoZW4gcmVtb3ZlIGl0IGJlZm9yZQ0Kc2hvd2luZyBpdCBvbiB0aGUgc2NyZWVu
IGlzIGR1ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBFVEhEUi4gV2hlbiBIRFIgaXMNCmVuYWJsZWQs
IHRoZSBpbnB1dCBwaXhlbHMgaW4gd2lkdGggbXVzdCBiZSA0LXBpeGVsIGFsaWduZWQsIGJ1dCBm
b3Igbm93DQpFVEhEUiBpcyBieXBhc3NlZCBzbyBhcyB0aGUgUGFkZGluZ3MuDQoNClNpbmNlIHRo
ZSBQYWRkaW5ncyBhcmUgYWx3YXlzIGJ5cGFzc2VkIGN1cnJlbnRseSwgdGhlIGxvZ2ljcyBkZXNj
cmliZWQNCmFib3ZlIGFyZSBub3QgaW1wbGVtZW50ZWQgeWV0LCBtdGtfcGFkZGluZ19jb25maWco
KSB3aWxsIGFsc28gYmUNCnJlbW92ZWQgaW4gdGhlIG5leHQgdmVyc2lvbiBhcyB0aGUgcmV2aWV3
ZXIncyBzdWdnZXN0aW9uLg0KDQpDaGVlcnMsDQpTaGF3bg0K

