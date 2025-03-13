Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE2C28B28
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 02:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52D1C3fkKeBNRmNXVAXe1qFypN5H12NP5VOTNfiJvaY=; b=3HZopl3Xkhfh7oLYaBWfBiRv4U
	cVeGKUadZzK6hz3rnsx70tj06sHNKHDE/ADaLTrYb+Yo+OWjfrZD/LlUwTzk6w54dEzlxiAYrJPbe
	oHzFXQwikhXlWfarOcUJv4QcLfuS9c2MpNJzzmn4PruRJ1FHGNBRJi5vQmLcomiUWfezlRNKKT5AZ
	bUqo60T1JicPxxcwoVBkLlWMR6f1J0zBXWWKyISTh+lkIH6Km6WnbhlT1Rdkjz6cKvBX1TmOG0HPp
	C9aiUriJOPXokYVKImMa6OfRdcEVwtMM6HFkjyNyqLo7m4r+3cXOQhcFlRpgED0nLaHNiZ9oXIx7G
	SNRIrq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXvG-00000009txX-0acz;
	Thu, 13 Mar 2025 02:03:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXvD-00000009tx7-2WiI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 02:03:44 +0000
X-UUID: 6031ddd6ffaf11efa1e849db4cc18d44-20250312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=52D1C3fkKeBNRmNXVAXe1qFypN5H12NP5VOTNfiJvaY=;
	b=pt5TMaP/fB8ww18yJ06hFf4smxFtGF32HFgk4lbMJR73SuId5ZtY3g8ExM8Bc4ySO0yNWrF47V7c0pi+v13Q9V0MClTwS0WxAAzVsmYOA38Dvu6JJ1haMgOrgS7zp2qJkHK2IMxtTcgcG8UlSL0FtLUzES9NMMuhGwrX0mJJR10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0073dcf5-2187-4e6c-a6f5-c9f13716fbfd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:553245c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6031ddd6ffaf11efa1e849db4cc18d44-20250312
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yake.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1148154414; Wed, 12 Mar 2025 19:03:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Mar 2025 10:03:03 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Mar 2025 10:03:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1OG1O2a94ZJVr7E9RDAYMIkoGj8Hr1npLVwNStSluye2mltx3MD+yESdn4IzmaYl8q3ScX1PxpSVaLGKOjyKwC6WaOraxppIjU8PNEqMuK6BOTJbheRxq1TeKnb6CzCSa0U1aMZ+QzOk7k3uoK2lUlBwPCF/Pz5Jy0C4g03PAYRixKmh+K5uxeuhHbI2ktvWAUwhC8DRn36nCMrwb+t2kyrxoz5146XOOEz131dF8C9MwKouLjmmw0mIqLnQDxjjpdsN5Cnpn1+6kRYA1n2VyWm34pgyuwgpwyUmYtpFDs9YvRPOriTWIFhfUn5TNFmrEAVVzfeAusYPimdkg6o8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52D1C3fkKeBNRmNXVAXe1qFypN5H12NP5VOTNfiJvaY=;
 b=NBFZSQaJk4a2wVtoojQKIa52bFoT5PIls2kld6huXqOI2nIcvcS/nNM84ULINre9xgc8oBeHCdBQUiIDji834VjpxK8jU6hCln19rfib7+4tXWu2l0A1LnN9JkG/QptkX4Ao6CzEbNaGo70roO2inR6YOcqeatGPmPfOy2jOi7I41a2e2ojnzLKyXBWXRj82j/g9vxAtjm2RAIoj8tAL11XgInSjzyT/F9MkZ8ZCdPSzB+Esd+v66M/y6OrqBSDQiw5N5J4CXGDBcZp6+5oe7xCgyqrKxFvWkxAOtOUc0qx1hoBGneFbUJO0QqXZR9P23M6f+sD50TuQ82R2rjrzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52D1C3fkKeBNRmNXVAXe1qFypN5H12NP5VOTNfiJvaY=;
 b=iQ93G3sZXofo/GDoXvTI6Fh4+JeeDeF7wmQ2074Shyd6IHBZRbVyYhMo1DU3bXahWCXbLxJ/8xETRuZ77cMK89UXDoYIEoJWfR0FHiAVxpLcKKeAwT6pkSDo9mVg12ZNvMdBIH5eGSFx9sAPfDxpu3CcWrMpDp4pCGIwRFgS20U=
Received: from TYZPR03MB5278.apcprd03.prod.outlook.com (2603:1096:400:3a::7)
 by TYSPR03MB8683.apcprd03.prod.outlook.com (2603:1096:405:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 02:03:01 +0000
Received: from TYZPR03MB5278.apcprd03.prod.outlook.com
 ([fe80::e7ea:eb4a:4712:cb1c]) by TYZPR03MB5278.apcprd03.prod.outlook.com
 ([fe80::e7ea:eb4a:4712:cb1c%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 02:03:01 +0000
From: =?utf-8?B?WWFrZSBZYW5nICjmnajkuprlhYsp?= <yake.yang@mediatek.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Sean Wang <Sean.Wang@mediatek.com>,
	Wentao Guan <guanwentao@uniontech.com>
CC: "marcel@holtmann.org" <marcel@holtmann.org>, "johan.hedberg@gmail.com"
	<johan.hedberg@gmail.com>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIEJsdWV0b290aDogYnRtdGs6IGRlbGF5IHVzYl9h?=
 =?utf-8?B?dXRvcG1fcHV0X2ludGVyZmFjZSB1bnRpbCBXTVQgZXZlbnQgcmVjZWl2ZWQ=?=
Thread-Topic: [PATCH] Bluetooth: btmtk: delay usb_autopm_put_interface until
 WMT event received
Thread-Index: AQHbkxruAx5Si6Idiki6tjgJJEOnmbNwUV2Q
Date: Thu, 13 Mar 2025 02:03:01 +0000
Message-ID: <TYZPR03MB527870252CC08268C037A42982D32@TYZPR03MB5278.apcprd03.prod.outlook.com>
References: <20250311231630.35255-1-sean.wang@kernel.org>
 <24204a3f-836d-4767-a9ec-08b22a27b76b@molgen.mpg.de>
In-Reply-To: <24204a3f-836d-4767-a9ec-08b22a27b76b@molgen.mpg.de>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrMDc1NDBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy00OTgxNTkyZS1mZmFmLTExZWYtYjc1Mi0wNDdjMTYyMjczYWVcYW1lLXRlc3RcNDk4MTU5MzAtZmZhZi0xMWVmLWI3NTItMDQ3YzE2MjI3M2FlYm9keS50eHQiIHN6PSI3MDQyIiB0PSIxMzM4NjMwNDk3OTk4NTc1OTYiIGg9InN3T1NEZ2p2UEYyLzJkSE14SEZlQ1lyYVg3OD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5278:EE_|TYSPR03MB8683:EE_
x-ms-office365-filtering-correlation-id: fe9e9740-a260-46fd-14eb-08dd61d32f32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OHZTRm1LemNYd01MMVJ4TFZTWmFrdXBNOGJuZWgxRm5CY1lwTXFtSDJreHNV?=
 =?utf-8?B?UW1KQXFDT3hpVWN4M2RjZjR4VW1nRHlZUXIwZmxtRng3MjZ1cUJmYjJabTlo?=
 =?utf-8?B?OTB0YmFIQlYwRjc3WTIxeGZXcTZ0TUh1NytNWUZaZ1ZUT1JLekhGTmV2YWFR?=
 =?utf-8?B?aWFybFNESk0yOFEyRHhWVjBEOTQ3NmZBeDJiWnVuekVNYTd1SnRKME9MOU9k?=
 =?utf-8?B?M3VJM3JtRnQzTmUvbXBYUEE3MTdPK0RkanBHOEp4TG9xWjl3azV5eEwwUy9p?=
 =?utf-8?B?SlNGRlZCelFTcFBDWk1qRUJZSkQ1U1ozVGZUOXRwZ1RuUjVhTGVaZG0yTFJo?=
 =?utf-8?B?THFUSVdneUNGM3ZpTnE4QjRseDNCVnZoRFpMZ3V2RmJlTzNZWW92clFzcWx5?=
 =?utf-8?B?WDdNZnNpTUl3VGQ0L3VWTlVNcGYzMTRLR1BBRTJCYnZESFUwOElXdGNRQ0FH?=
 =?utf-8?B?YWF2UExQWG5tL1loTFo4cTJ5Z2twS2JmOTdqMUwvK3lYMncycjJsRXlMK1RF?=
 =?utf-8?B?V1VrS0krMXZwRHJyZU5mTXQ2R2tobHlvVTB2aVhPNWxQQ0grb1piVkc2eEd2?=
 =?utf-8?B?RzVCMG1DeXRrZmdoTkNVYzFwN2tueDFwMmcwamNpR0N0QTd1RXhGejQ2UVVx?=
 =?utf-8?B?S2ZTTUQrWG5QR0RwekRMYVIwTHkwYm1rS0MzcnhBTUpCaTUzbHptYmhOR0Ju?=
 =?utf-8?B?eTFXWjZsV1g0TUhhTy85Y1phZ3YrWHpQUlZVTWNETWlvY2FYSTdvbnhJczlQ?=
 =?utf-8?B?VzlpZlFhMVluWG9aMXZBZGFER0t5dE1sUHoyZkFDajNtdXQ5NXdnZFFSK1hk?=
 =?utf-8?B?NzZNa0NGL3ZaYnBVTC9PeVorUzJFcXRtNit4OWxDczJjVG9aUUovbGZzcjNO?=
 =?utf-8?B?c25TU2ZpZ3JxSXVxOUd4UWNvSmJSOEU2a1N1RFRrTzlLanFNRkhTbU40SW9h?=
 =?utf-8?B?NDNsMjM2RnVadFlTSUU2bTY1bjczbUIrNG40SWNtY1RwSFpCRlIvUVB5d2wr?=
 =?utf-8?B?WjB0bjNpVnhkSnJzYjdUbnIwUVNEUHZsYWZsV0tLeUc2UERKUXd1OTgyeWVa?=
 =?utf-8?B?dGZicVlURHMwQTBza2wrNkI2MHdHdnF4MkJ1cW9vcDh1UE9GMEtkaWJpT0tu?=
 =?utf-8?B?ZHVMQVlnMGhsdVZBcGU5TktLbUxRVlp3L3hSRmNUUlpxcGRwWHRQWSs3S2Zw?=
 =?utf-8?B?NjZVcmM2aCtoRlpMTmpwWUpiZEJBRXV3OGNSV2JZYTAzM1d4T29pLytPOHJQ?=
 =?utf-8?B?Vk5qQjdpVy9xQ2psQ3FMcXJDSkRuU0FpQW1rQkxBQnBlam50akJNaVRvOWV5?=
 =?utf-8?B?aFYrU25nK1grTmM2TXk2aFZkL3lEWFlyK3ZyNkkxMVphY0xQV01mZGYyRklG?=
 =?utf-8?B?UGtkWnUyNHpYVkJPT1hRc0ROK1dzSzJGREdza0laREhxRDJ2Q09CT0pkZlJ0?=
 =?utf-8?B?OWJuN3pYdVVmMVVFSjE0cDJZOXNZc1BpeVdjcVFUUGdlSms3c3pSWS9INVVY?=
 =?utf-8?B?TndjQjVUcDJIUFdlQ3JXMkkwWjhYeWdoMXRvUUphY0ptcEs0cndNdzBqUTc1?=
 =?utf-8?B?TDRSL2h4NXhDSzBHazdxbWxlS25vNEFRTG1SektUYllqdm1wSWhuN29wdjZE?=
 =?utf-8?B?TlpwU1B6MmttbytLMUs5MHBXR0VQNStkcFdabCtOL2JsODh6Vk9tWitSVnJh?=
 =?utf-8?B?RDE1cmFqMFBxVXNwa2Q0a2ZQbzlBeUh1d3lyeUVydDVSYU9QUEszSGtzc1Nw?=
 =?utf-8?B?a0MraGhIV1Avek0xa1ZzM0R2RTNEaHhiOEtxYTBWLzhuS0Rla0grNDJ3R3FD?=
 =?utf-8?B?cnczTWVqNFlKTFdDWmo1QjhMK3VRakFtNHF1dm5CM1RtT1c4R00wM05vVWJh?=
 =?utf-8?B?b21jeXJGM2k1NEtSSnc0ZWswRTkrMnA1UWxJT3doWUhEMUlublhrRTFpaU83?=
 =?utf-8?Q?pbBwab+q3FKAliecYGfdMTUEvH6JXQ3G?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5278.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFhFa0JqWTZzaW1janRJVklqbnBnbUhkakNtaEViMmo5ai9leit4ZG5qb3Fh?=
 =?utf-8?B?dk9ZVWs3eCsxY2ZqV2lvc3Q2RUhISUlMc1hDL0VCR3J0YmdqdE9vZkJMWUJk?=
 =?utf-8?B?STljcWk0VzZlZHFrVVZtdG1pNEgxaThKZ05IK24vVy9Pb3lsYVlXODRmdEZp?=
 =?utf-8?B?cndOWWlmTm02bXRSWlBqcExYVTQ5QkFRdnZGck04UnZEVlN4QXNUcllNYlgx?=
 =?utf-8?B?NU5RRXdlQ2VPYkZnUlY1Q1dOemFFOG9PbDdkdzNTMjRQemdVLzIwQkc5SlYy?=
 =?utf-8?B?dGV3WlZJVDFiTk5wUkVLaWd0S00xSG40ZUo4NmF5ZzB5YW55MGJqSCsvbWRV?=
 =?utf-8?B?d2taRTFLc0Y4SGllQUdLQUIzVGx0NHdjWldvWjQyRy9yUkFqS3pDOFhpQkVh?=
 =?utf-8?B?NHNLSWxDSEdXQzhqdjArTFpNT3lPeHR5amp1THd3WGNJNXl4ak16YlFMQnNE?=
 =?utf-8?B?LytudTIzSFJueWhMOFM3N09IZ04xeE5paStxU2x2ODl1L0E0aVk3ZS9iUEhW?=
 =?utf-8?B?bkttVUZicE04YlMxR3U4a1pTZWMzUUVEbWtJbVBsdnZ2TWZVRWF2VWsrRFJW?=
 =?utf-8?B?WFU4RUtVS1hwVnRGV3l4VWJNNXJyVURhU1I2a0FmMC80Y2JtRUFseGZBbzlz?=
 =?utf-8?B?V1RxMVlrTFovaHE5RHJ1Z2Q4UElxcWZ4bERiWlhRVnNHZ2hTU2sxMFdhVHRo?=
 =?utf-8?B?NHlkWW5pYlpkMzNUamtxRUt5dExwdWoyQTVVZ0VwVXh5b0ZGSTNmSVY2SXg0?=
 =?utf-8?B?U1d1L3ZFTXU1L3ZGenQ0UEd6VklxVER4K1FBQ3orcXFjMUJLNFE3VTJDMDZy?=
 =?utf-8?B?L2I5elVxTFVQTCs4K1lCVWh1b1YrMnAweGVycWZidlNVVFV6aVRPTUJQTyt2?=
 =?utf-8?B?UHdwQW1CcFRIL2d3RjRLU0Z0cnduTkVLRHNvTG9RV2U1SmFibXI2SnU1TnJl?=
 =?utf-8?B?d3lLalk3SzFUQnBKT3kxUHBiU0drNlBaajYzUFEwcGRmaVVTYndLNVdYTGd5?=
 =?utf-8?B?aE5pZlRRSXFQMVlLYms2K2g4aEY5SC9aMjlJVXpjRitrbjUyZ1ZtUDNyS21O?=
 =?utf-8?B?dFJNU21EM09PV3p3dzcrcmcxOGl0OXJqdlVNRldmbTExV3hCSnpmdW1KbW5l?=
 =?utf-8?B?Sm56Z1dORzYzL2kzTFlXRlB0S09IL1orQ0grMzRldU4rWUhIUHM2alRzQlFD?=
 =?utf-8?B?WXpMZXdxeGEzYzZ6dUg1R0tldkpLdTY2Q3krNFpyaUtIQlp5WXdwY0g1bk1P?=
 =?utf-8?B?OThDUGNUeUZGdlNwR1FmeG5PeFZCZkFod3ZqME9vbEEwSURraG41K25WNVp3?=
 =?utf-8?B?NGFmUVdJeWFyck56Unp6TnZPTGE2WlBPL3ZLWWxtSW9hNERqV3M4TzB0SHZj?=
 =?utf-8?B?aXZncTNKTUJMRHdPdkM1Z0Z6S2QvNFUzSmx2dGh4N1FvV0FoM0p5cFNrLzJJ?=
 =?utf-8?B?RUVwK0EwSXR5Z1MvWUNVVEhkUjg3czhhdHU4S2hITWd3ZEttL2p5aTlxVUx4?=
 =?utf-8?B?Q0s3dFNtZkp1ZVpxSWw5ZGVIRWRWcnlVU2ZVK0JyZGVvWWliMkdCM2huK2ZO?=
 =?utf-8?B?YjgzTzdxV3pKOUhFOGQ0TDdjd3ZTUHBBQ2k3SEt1RFNid1ZUcm1XOXg1c3Mv?=
 =?utf-8?B?b013c0Z2eWxCVUN6U0tNbzFuN2t4Q3I4QzllVVByWEZyaUorcytpL0pUbzQ5?=
 =?utf-8?B?SkVBU3JBd0owMG1oVGdQNTh2NVBLc0ZKTm0vVCs4L3krRjRNRzVwQUgxQjYy?=
 =?utf-8?B?Y1NaVmdmT2U0OTlQcFVwcXRwd1hiNkY4NjQ4ZnNGY1NqdHVDMjhNM1g4U1B2?=
 =?utf-8?B?QU5SUUh4SG5IazluOEtYZUJuOVRTOHl6TVNJcGg1RDBsTEVtZjRpR3FsUVJ6?=
 =?utf-8?B?SzdJL0ZXM2x1UFpLZ014WWlDQ204R1NDM0tyT3NkaU5FbXcyK3JYSldBY0tN?=
 =?utf-8?B?d3Z3R0JGeUQva24vSzZiRkE5N1Y4TXRwaXY4NlVHUFZqQjZVMnBsdWV2c25a?=
 =?utf-8?B?WStlZ0t6SXRHOEt5OXlrejRyeU4zODlXR1NKZ0xieDFmMGZhNTlCNFBHMXFW?=
 =?utf-8?B?M1R3a3F4akxxYnNnMjk2ZXBmS25Hc2RUblBObHhidklzTGJ5SXFzdXJzOTNJ?=
 =?utf-8?Q?p/1ULeSs1RWZl3NY3y2nZES31?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5278.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9e9740-a260-46fd-14eb-08dd61d32f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 02:03:01.4033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 965IBunbk4OdyYO6IoCKuFsPFnnR9bFyasgNFar9feKIS0TPl0wSfEO2yU2eJj+SfiiZ82O4k0FCxaB1tIVeuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_190343_658523_89B15DDC 
X-CRM114-Status: GOOD (  16.33  )
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

RGVhciBQYXVsICwgU2VhbiwNCldlbnRhbyAoZ3VhbndlbnRhb0B1bmlvbnRlY2guY29tKSBpcyB0
aGUgcmVwcm9kdWNlciAuDQpUaGFua3MhDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7
tuS6ujogUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2VuLm1wZy5kZT4gDQrlj5HpgIHml7bpl7Q6
IDIwMjXlubQz5pyIMTLml6UgMTQ6NDANCuaUtuS7tuS6ujogU2VhbiBXYW5nIDxTZWFuLldhbmdA
bWVkaWF0ZWsuY29tPjsgWWFrZSBZYW5nICjmnajkuprlhYspIDx5YWtlLnlhbmdAbWVkaWF0ZWsu
Y29tPg0K5oqE6YCBOiBtYXJjZWxAaG9sdG1hbm4ub3JnOyBqb2hhbi5oZWRiZXJnQGdtYWlsLmNv
bTsgbHVpei5kZW50ekBnbWFpbC5jb207IGxpbnV4LWJsdWV0b290aEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCuS4u+mimDogUmU6IFtQQVRDSF0gQmx1ZXRvb3RoOiBidG10azogZGVsYXkgdXNi
X2F1dG9wbV9wdXRfaW50ZXJmYWNlIHVudGlsIFdNVCBldmVudCByZWNlaXZlZA0KDQoNCkV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQoNCg0K
RGVhciBTZWFuLCBkZWFyIFlha2UsDQoNCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQoNCkFt
IDEyLjAzLjI1IHVtIDAwOjE2IHNjaHJpZWIgc2Vhbi53YW5nQGtlcm5lbC5vcmc6DQo+IEZyb206
IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4NCj4NCj4gRGVsYXkgY2FsbGluZyB1
c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2UgdW50aWwgdGhlIFdNVCBldmVudCByZXNwb25zZSBpcyAN
Cj4gcmVjZWl2ZWQgdG8gZW5zdXJlIHByb3BlciBzeW5jaHJvbml6YXRpb24gYW5kIHByZXZlbnQg
cHJlbWF0dXJlIHBvd2VyIA0KPiBtYW5hZ2VtZW50IGFjdGlvbnMuDQoNCkRvIHlvdSBoYXZlIGEg
cmVwcm9kdWNlcj8gSXTigJlkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBhZGQgdGhhdCB0byB0aGUg
Y29tbWl0IG1lc3NhZ2UuDQoNCg0KS2luZCByZWdhcmRzLA0KDQpQYXVsDQoNCg0KPiBDby1kZXZl
bG9wZWQtYnk6IFlha2UgWWFuZyA8eWFrZS55YW5nQG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogWWFrZSBZYW5nIDx5YWtlLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Ymx1ZXRvb3RoL2J0bXRrLmMgfCAxNSArKysrKysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibHVldG9vdGgvYnRtdGsuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmMgDQo+IGlu
ZGV4IDY4ODQ2YzViZDRmNy4uMDE4MzJiYzZhMjU5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Js
dWV0b290aC9idG10ay5jDQo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmMNCj4gQEAg
LTYyMCwxNyArNjIwLDE0IEBAIHN0YXRpYyBpbnQgYnRtdGtfdXNiX2hjaV93bXRfc3luYyhzdHJ1
Y3QgaGNpX2RldiANCj4gKmhkZXYsDQo+DQo+ICAgICAgIGlmIChlcnIgPCAwKSB7DQo+ICAgICAg
ICAgICAgICAgY2xlYXJfYml0KEJUTVRLX1RYX1dBSVRfVk5EX0VWVCwgJmRhdGEtPmZsYWdzKTsN
Cj4gLSAgICAgICAgICAgICB1c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2UoZGF0YS0+aW50Zik7DQo+
IC0gICAgICAgICAgICAgZ290byBlcnJfZnJlZV93YzsNCj4gKyAgICAgICAgICAgICBnb3RvIGVy
cl9wbV9wdXQ7DQo+ICAgICAgIH0NCj4NCj4gICAgICAgLyogU3VibWl0IGNvbnRyb2wgSU4gVVJC
IG9uIGRlbWFuZCB0byBwcm9jZXNzIHRoZSBXTVQgZXZlbnQgKi8NCj4gICAgICAgZXJyID0gYnRt
dGtfdXNiX3N1Ym1pdF93bXRfcmVjdl91cmIoaGRldik7DQo+DQo+IC0gICAgIHVzYl9hdXRvcG1f
cHV0X2ludGVyZmFjZShkYXRhLT5pbnRmKTsNCj4gLQ0KPiAgICAgICBpZiAoZXJyIDwgMCkNCj4g
LSAgICAgICAgICAgICBnb3RvIGVycl9mcmVlX3djOw0KPiArICAgICAgICAgICAgIGdvdG8gZXJy
X3BtX3B1dDsNCj4NCj4gICAgICAgLyogVGhlIHZlbmRvciBzcGVjaWZpYyBXTVQgY29tbWFuZHMg
YXJlIGFsbCBhbnN3ZXJlZCBieSBhIHZlbmRvcg0KPiAgICAgICAgKiBzcGVjaWZpYyBldmVudCBh
bmQgd2lsbCBoYXZlIHRoZSBDb21tYW5kIFN0YXR1cyBvciBDb21tYW5kIEBAIA0KPiAtNjQ2LDE4
ICs2NDMsMTggQEAgc3RhdGljIGludCBidG10a191c2JfaGNpX3dtdF9zeW5jKHN0cnVjdCBoY2lf
ZGV2ICpoZGV2LA0KPiAgICAgICBpZiAoZXJyID09IC1FSU5UUikgew0KPiAgICAgICAgICAgICAg
IGJ0X2Rldl9lcnIoaGRldiwgIkV4ZWN1dGlvbiBvZiB3bXQgY29tbWFuZCBpbnRlcnJ1cHRlZCIp
Ow0KPiAgICAgICAgICAgICAgIGNsZWFyX2JpdChCVE1US19UWF9XQUlUX1ZORF9FVlQsICZkYXRh
LT5mbGFncyk7DQo+IC0gICAgICAgICAgICAgZ290byBlcnJfZnJlZV93YzsNCj4gKyAgICAgICAg
ICAgICBnb3RvIGVycl9wbV9wdXQ7DQo+ICAgICAgIH0NCj4NCj4gICAgICAgaWYgKGVycikgew0K
PiAgICAgICAgICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIkV4ZWN1dGlvbiBvZiB3bXQgY29tbWFu
ZCB0aW1lZCBvdXQiKTsNCj4gICAgICAgICAgICAgICBjbGVhcl9iaXQoQlRNVEtfVFhfV0FJVF9W
TkRfRVZULCAmZGF0YS0+ZmxhZ3MpOw0KPiAgICAgICAgICAgICAgIGVyciA9IC1FVElNRURPVVQ7
DQo+IC0gICAgICAgICAgICAgZ290byBlcnJfZnJlZV93YzsNCj4gKyAgICAgICAgICAgICBnb3Rv
IGVycl9wbV9wdXQ7DQo+ICAgICAgIH0NCj4NCj4gICAgICAgaWYgKGRhdGEtPmV2dF9za2IgPT0g
TlVMTCkNCj4gLSAgICAgICAgICAgICBnb3RvIGVycl9mcmVlX3djOw0KPiArICAgICAgICAgICAg
IGdvdG8gZXJyX3BtX3B1dDsNCj4NCj4gICAgICAgLyogUGFyc2UgYW5kIGhhbmRsZSB0aGUgcmV0
dXJuIFdNVCBldmVudCAqLw0KPiAgICAgICB3bXRfZXZ0ID0gKHN0cnVjdCBidG10a19oY2lfd210
X2V2dCAqKWRhdGEtPmV2dF9za2ItPmRhdGE7IEBAIA0KPiAtNzAwLDYgKzY5Nyw4IEBAIHN0YXRp
YyBpbnQgYnRtdGtfdXNiX2hjaV93bXRfc3luYyhzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gICBl
cnJfZnJlZV9za2I6DQo+ICAgICAgIGtmcmVlX3NrYihkYXRhLT5ldnRfc2tiKTsNCj4gICAgICAg
ZGF0YS0+ZXZ0X3NrYiA9IE5VTEw7DQo+ICtlcnJfcG1fcHV0Og0KPiArICAgICB1c2JfYXV0b3Bt
X3B1dF9pbnRlcmZhY2UoZGF0YS0+aW50Zik7DQo+ICAgZXJyX2ZyZWVfd2M6DQo+ICAgICAgIGtm
cmVlKHdjKTsNCj4gICAgICAgcmV0dXJuIGVycjsNCg0K

