Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA805C5DF74
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 05:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJqhyxemdYwXFlFyutlNSQzQfblEGMPcmouHqMQ6R2I=; b=XVoXG5bo/VAUZXkEgQM4dSmjSi
	biNQz7E5knYRYrQ3uk7QWjMZkovJnoQZUqtay1teepKMrKTrtzUT4qOY9/W//qBbpjleAal2OI6eZ
	kSQ02AMbyu3DoWmuB3d6UepwyScYpQDpS2oCdOT40RQFXZy+h6lv5s1l3/i7KvjHlCNs6ao4E/HZc
	aJwGHxtQeNHwh39+mu3adwhqdLZS3PvNxwK1eMyzZeL0u/R/R5NuonNmlabHQxa2dS3r6staa0kXP
	YBUOGpGDPreZpZGEkFscLdb8ZBe0ubFf1oOcvnSUp/bOcbq0txy7RvxChhnEnlrxlkfRmep9/ZX8F
	PfeavMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCJn-00000007LJe-06To;
	Tue, 18 Aug 2026 05:24:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCJj-00000007LIu-3FwI
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 05:24:57 +0000
X-UUID: 212c95889ac511f1acbe4559397dec65-20260817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hJqhyxemdYwXFlFyutlNSQzQfblEGMPcmouHqMQ6R2I=;
	b=XP5SEtnhHWPtP01SldeARoZOzlA92wmbIPK3h5gH0tHWDjutuMLG/8zTrCEQanx9fhH6hrsD9BBSQEqpvKx3fB2pVFtE65A/pEMHB70nAti8jCuPRfP9W6ZLMCCZYL/OPcZ1bk6oaga2Z448Atb6CrkYVcabMGbSUNaQNmHOTYg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8a3f8ba0-8756-4095-8db5-bccbb52a9e9f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:11c35cd0-5207-40cb-8685-ff26586b2b1d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 212c95889ac511f1acbe4559397dec65-20260817
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1471204090; Mon, 17 Aug 2026 22:24:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 18 Aug 2026 13:24:45 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 18 Aug 2026 13:24:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuOmziIOYOfuiq2aox30HR8SuQm3Q/RFaVDLJpSHk7e8wvauBQuyNWbTSjIsNkw1nOT+WEbiNYmB4YKgNm4/g4+ccuHYgqDnlor6gK0f7hKaVIns1EOJs92ZnOtDM7axj5b0Jc3fJAxggA7iGsysmZ1rx92t7a+WDwu6KVJXd8iX6M/taWK7PPaAxN9IOA/kDKzSjE7cdx3wU06p7UJAfrQrINMuAOeHOJMfrSma7+uIqGtdzKaO4WL3qWT3Fjj+pfQImFNwcL5szEB58Mh6B5+CsI+UqVpPcMWtnSUS3bvGWVZpU4mYXkILFJhLTMsuog6ex4xx9jo/UskV66E9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJqhyxemdYwXFlFyutlNSQzQfblEGMPcmouHqMQ6R2I=;
 b=ZnX37xXnjbka8CuMUqjg+uLaEopzasB+JnlnKu6SXcnjuku7gGjsK6ELHVdEfHri7IHZ56zOkc9RuS45ehC3yt5YZVeXsOBuwuPkGIef9iZbdCBxA5eNga3vnMkOO2jrd0LAR1f3FjNjwVNUicDdcZ/+fHxiQC0pbZSX2Wy7jCPuxAbqCGt7XriN475wbyi+oQhB7wXP0ZkI8pz3uYVQGvdIxImArXhbzQuR7KLo98gs8dB7u83b9yvNoAgN57SrMeo1YreDqMJG0sEHrZJB0ey3hBuX+b2uQSAPoaGk0MpPXvYa+VYX7OMHQIFCPh1o7HfLUxzo1goD7RA6tS+2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJqhyxemdYwXFlFyutlNSQzQfblEGMPcmouHqMQ6R2I=;
 b=JedbKXB228UJimbNahPWWTVFy99SvO40X2Zj0HdiQcstDK9CuVAwGrqDHgU+w684CGoKgNLvF160aJo5ThJWbU92jBt5l5+JNNsfsoFum5Pj/jwbNGniWldn9JzxNOmjLu0F/Z5bsH/sbt396wVz2oYilQBSXZU/J2CCv2Ba7aE=
Received: from KL1PR03MB7079.apcprd03.prod.outlook.com (2603:1096:820:d5::5)
 by SI3PR03MB9957.apcprd03.prod.outlook.com (2603:1096:4:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 18 Aug
 2026 05:24:43 +0000
Received: from KL1PR03MB7079.apcprd03.prod.outlook.com
 ([fe80::9bd3:f66a:efd4:f6af]) by KL1PR03MB7079.apcprd03.prod.outlook.com
 ([fe80::9bd3:f66a:efd4:f6af%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 05:24:43 +0000
From: =?utf-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
	"lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>
CC: =?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?=
	<Quan.Zhou@mediatek.com>, =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
	<Deren.Wu@mediatek.com>, =?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
	<Litien.Chang@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v2] wifi: mt76: mt792x: fix memory leak in USB TX path
Thread-Topic: [PATCH v2] wifi: mt76: mt792x: fix memory leak in USB TX path
Thread-Index: AQHdLicU72PdNnppQ0qM4MM+/gl+MraiczUAgADUOwA=
Date: Tue, 18 Aug 2026 05:24:43 +0000
Message-ID: <8eb13334c59a38fdecb5f4617f9b675b32ecf875.camel@mediatek.com>
References: <20260817090157.168089-1-eason.lai@mediatek.com>
	 <20260817164506.13333-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260817164506.13333-1-lucid_duck@justthetip.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7079:EE_|SI3PR03MB9957:EE_
x-ms-office365-filtering-correlation-id: 18f468db-d164-4939-501f-08defce9028c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|4133799003|56012099006|11063799006|5023799004|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: EHm6uIfdZg0ff4/0SZ6J0zJhQ9mZnQRdS0EfSaBJo8LxKDMA+mvksDE0GC4AcPJ5hje0EpJn46htn8bvrwnP7nHUvEil8vFTKxHnjTp6IpQzUS8eodeW/YlzDq25T9d41fovmRD+UDuTnxT9pYwQLFOsLfW9H+wBosml0Bh4eHuzEPzX20gc6tADNrgE8Gnubu5RDLEwVLwu+PbSWBPKyLIlvhYQ7NZbTWxxz/X8XPYKhZd0sCGkixoTA2YFvYQA9b7xI3SBO/ukmKJLDcKkWCERKb6FouqBw40R2NVS43dXxizaRw3fpXpsq/drzcvcaXrV6EbJXWuHaVX1sjjzU59AX4rtZvFMeJ5hYgkhRPEJvnSiYs7np7UOvs/oLRKuuj3nYA6DI6v2WmIIATA5kHjk0FPzLuPVU+rlnqDbCM01lMbQPIikWb0/tZs4ceyEtGHHroTEOVJr2x56nH4i1OELN9Wtei+bwvqLrcy/OeUCNuxTGxGfilaA7O8egcBVN2dZ5L8fnPeYedDO1CoS4kseuuGDVHy9XqPSizy8255rTlmDCg6IP6JsWb+UPfVpEdCCGKruNSopZFsNuAeU6a/y1aDKcB1gqWXnIeT7apt7uEtqIr3VBBKnedm3AB4AY3oGwjqut+PZBwfwZPxeotvGeVk5BeBG+6RPkIrl5YNR+8xr2R2KyJY6+qwjWs5DzMS009ixY31PjT8vsQZx/CAnhZfL6hEuw5DEDhyHzqk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7079.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(4133799003)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0QvREYvNUtEbzFVWlRSMU9EK2xRbFAybUhmVWdKek9tTXA5WndNYitUUGlh?=
 =?utf-8?B?MDk0U2c4cEkvZUl2dFdMaDNIMzBiUDNmT0EzeWNLOHBpYlJhZFpaZFhlaS9u?=
 =?utf-8?B?UGJCUVpsTGJjNTlkZHBJb3VYVlpNSEY1Lzd2SFB4V3NlVGRVU3JtNHU0YW1H?=
 =?utf-8?B?NTdyRkRZUlNscWh2d2FqM0JZK2VKNEdMRFNYY3dxY3NHcjBtV1JLTlZESUJp?=
 =?utf-8?B?YThqMUNtcXNkRWxNV3NzMlg0NklhM1o1ckNPa2wwNDhPRVh2TFBuZzRnV3lZ?=
 =?utf-8?B?TE1lUllTbXVlUm1mNWlTYm5HZTY4Z2tJb1NYRE9KaFE2MG5NMHVXM0FOVllv?=
 =?utf-8?B?ZzNWdmx2WGZoRVZZZmJ3TXR0L0ZxbGZTdmlTRUZWWGE4R3VSU0QySzdXSnhs?=
 =?utf-8?B?WjVmc1FwUFE2L1VwNG9KOEpJOC8rL0tZdHpHc2J3a09HMVJIQnNpenNOQy84?=
 =?utf-8?B?cTNzakJjMldWM3FIS2ozdU90azdPVXdGV0NpUmFVakJrSVZDZGN3K1lhbkJm?=
 =?utf-8?B?cUdSRUp3TUg5OTdIUVl6S1EwazIyK1VMaE52Qndua2NPbFhLbzBHT1VrQ1VU?=
 =?utf-8?B?b2dqUjZTU0hPdkt0QXZ4enZwbmlBV0dkQlBFTjFzU2NGaFgxTkJxdHVUSVNv?=
 =?utf-8?B?Nzl2MHcvRVNRMmFaeStWSXlhQ0I5TGtoamh2eU1aRVlTMFdPV0d2VXRQNUZX?=
 =?utf-8?B?S2RSR3Z0SHBaNG1oWVBubjliNERRZkx0bm5iUk5zVEdxRXpoeU01Ykxic2ly?=
 =?utf-8?B?a3gwdm5hWnpqS1hGbTk4eVl1eGZsaU1UUlVINFZDakRNSGZsQ1AzekgyMDJ1?=
 =?utf-8?B?dkVRU25IRzFZWGJMSS9JUGdIWi9saXBPWjFGeW5MN1ozMERZM1FyNEx0MjRv?=
 =?utf-8?B?MitCMUpHQVEzenBaM3ZxRWc0L2ljZ1Yvbmp4ZzdKQkQrUEg5N00yOGVoUXFH?=
 =?utf-8?B?cENwaTRxS1EwbVp1eXlIZHl5aHZ0dkZtd3E5TmtlTGJ4N0lSMnBkeGJ2enpj?=
 =?utf-8?B?aVlOTjZwak1pK3ZQMlNGTXU5djJWaEYveVRNYWhiQmU5VG5hWmdSK0VrRERC?=
 =?utf-8?B?Q3NjVUIySVp6bVJ0eDhZakFMSDFGMWliTG9Qc0xxbjYyZS9HOWVUTDRMTVNl?=
 =?utf-8?B?WCtVY0x5Um5YMDZhc0xMdTVlRzBRMVFMbkJzSDZuT0k1cHFIVzVTc0oxMUZt?=
 =?utf-8?B?TDlGRDRnQXViOXBDNUZhQTNJSXV6S0ZwQlFubXgxM2ZQaEc3cmI2S0MwYlJS?=
 =?utf-8?B?RUUyMzN1cGxEMTdKbDNYTlBuaFkwVWlkUzU1N1BDU1BZZnJVbm13aVdrcTRL?=
 =?utf-8?B?QU9uSGw2VzFwY0dROW0wY0EwWU9IR1FSeDhubXJlbTc4aDhnYVdCK3E4RVUz?=
 =?utf-8?B?akRGbktrUHJkUE5nNHdBY1pFMmhrZ3h0NkRrTEFkS2M1WE9aODFja2tCQ0JW?=
 =?utf-8?B?UEszQUNoZ282UFhqc2U0bXlhZ3pBYmR5M0tNb1RNUXRzWjFMaTJ5NjNvdnJr?=
 =?utf-8?B?WWo3L21iY1YvWFJsVnMxOWxOVE92cnpjM2JWSWs0OEZjMDlvTXZKVks1dmVX?=
 =?utf-8?B?c1pBd0w4S28ydnZrd2o0VERvcGFCUXhwWVAzTjlyUy9nYk5ZeVMrN3A4Q01H?=
 =?utf-8?B?MHJiMzBNMTJDSzFraFBHU0xUYnpBS1RmNzJWNHZvR3lVR0l2akkwUHpUb1px?=
 =?utf-8?B?S1pZUWI1WFN5b1V6enlBSDFaRkRvdUh0Ynl3Z0lBRWhEZ1hxRWtoYTVMYldu?=
 =?utf-8?B?aHNBbnRHWGtwYk50WlZ4cWNkOHlKUnY1aFhFUDN4RytpMVRQeG9rNzRTRm45?=
 =?utf-8?B?OTkrbnRrdDZ2blpvdlBYOURyWm1CTWVRSGpVTjdKekMyTXF0VE1QVlQvNUFo?=
 =?utf-8?B?UGk0elh4dml2OUdtRm1QWUhyU0VacWZPc3hKNGZLUFNiWHFzK0RSWkViMGVu?=
 =?utf-8?B?WEhBRFlXdWIyb2I0WnNlK2UrTTJYUEhvbjZwbDZVWkJ1TG51SXNPYUpSSllN?=
 =?utf-8?B?UGRSeW5ES2Y1RXdOV08yVmc3VTBvT2lDZVorZjlBL0oycE40TFptUTVYaklk?=
 =?utf-8?B?eGNteHdnMHBkWTVmcU1CZUR1TTlpZHg4TEZWN2dkMzhkQ29DR0NXd1BtYWM4?=
 =?utf-8?B?M21tWmh1Z3BRT0trV3NqeG1nQTRMOUc2cUU4clhjQ2t3MWVXL3U4SjNkbmF3?=
 =?utf-8?B?RkQvT0thZFVTbmQvbFJWT2ZTQ0h4NlFic0U5MjFMWndYNDJOV1dHaUxTeVg2?=
 =?utf-8?B?dG1haWpveTFQcm0zdjlZWndTVms5M054VVU2eDc5ZjJPQ01iUUFwY1ZHMWNM?=
 =?utf-8?B?SzROWXo1bUdoek13WEk4SE9HaGRaTGFMM2lSYVpzS1VUbGxPalV0V3JFa0JC?=
 =?utf-8?Q?oVLPv42JVc9Rn5u8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEEF18E0B4E6FF46B8E6F1BB26311A28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ljEsWhNWDbf4GOOXg+1KJsP+drfbOexy2KjmskmFwidzIGk2zw+9pEojTxX6xvVd9dzdEP1SbFXPTC8VKKaNr+Mk4umQ+XHaDia/eJOkYUBezUIGrhtHomuNeWiwY6XZfUsCJY3UtZm+IYOOu481z4o67Ou0w0gZYqsJmReoIqdya0IDAkF3zB+aKI7eLxSzCeNz/IfBLLbIpXi9P3Llewl0g7UsFonGsf06daitc2E+VA8FtI2h3vqdm9XaGlwB8dxIw6QIBYX860vtYq0RgxybxZur+z6ahESUQyNgfD4gFl3UR+ayxa2Y827ego4Q+5LR4pUL8J6GAE5BWvl1ng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7079.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f468db-d164-4939-501f-08defce9028c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 05:24:43.3322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQKSYd2X8czPo3eWtv3tqTZTdD8lm7J5RoUg+JdjN2nvEGrmVOEgn6imDzsFl9PtU6QB8jI3zRMHFQYuhjhLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR03MB9957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_222455_840257_BCEBD1AE 
X-CRM114-Status: GOOD (  23.39  )
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

T24gTW9uLCAyMDI2LTA4LTE3IGF0IDA5OjQ1IC0wNzAwLCBEZXZpbiBXaXR0bWF5ZXIgd3JvdGU6
DQo+IA0KPiBPbiBNb24sIDIwMjYtMDgtMTcgYXQgMDk6MjMgKzAwMDAsIEVhc29uIExhaSB3cm90
ZToNCj4gPiBJZiB5b3UgaGF2ZSB0aW1lLCBwbGVhc2UgaGVscCB0ZXN0IHRoZSB2MiBvbiBtdDc5
MjF1Lg0KPiANCj4gRG9uZSwgb24gYW4gTVQ3OTIxQVUuIFVucGF0Y2hlZCwgdGhlIHNvY2tldCBm
aWxscyBhZnRlciAxMTEgemVyby0NCj4gbGVuZ3RoDQo+IGZyYW1lcyBhbmQgaXMgc3RpbGwgYmxv
Y2tlZCAyMCBzIGxhdGVyLiBXaXRoIGJvdGggcGF0Y2hlcyBpdCBydW5zDQo+IDMwMDAgd2l0aA0K
PiBubyBibG9jaywgYW5kIHRoZSBkcml2ZXIgc3RpbGwgcmVqZWN0cyBhbGwgMzAwMCwgc28gb25s
eSB0aGUgY2xlYW51cA0KPiBjaGFuZ2VkLg0KPiANCj4gVGVzdGVkLWJ5OiBEZXZpbiBXaXR0bWF5
ZXIgPGx1Y2lkX2R1Y2tAanVzdHRoZXRpcC5jYT4NCj4gDQoNClRoYW5rIHlvdSENCg0KPiBUaGF0
IGlzIHRoZSB0eF9wcmVwYXJlX3NrYiBleGl0LiBUaGUgb3RoZXIgdHdvIG5ldmVyIGZpcmVkIGlu
IGFueQ0KPiBhcm0sIGFuZA0KPiB0aGUgYnVmZmVyLXNldHVwIG9uZSBjYW5ub3QgZmlyZSBoZXJl
IGF0IGFsbCwgc2luY2UgbWFjODAyMTEgY2FwcyB0aGUNCj4gZnJhZ21lbnQgY291bnQgYmVsb3cg
dGhlIHRhYmxlIHNpemUuIFRob3NlIHR3byBodW5rcyBhcmUgdW50ZXN0ZWQuDQo+IA0KPiBPbmUg
Y29ycmVjdGlvbiBmcm9tIHRoZSAxNnRoOiBtdDc2c190eF9xdWV1ZV9za2IncyBwcmVwYXJlIGV4
aXQNCj4gYWxyZWFkeQ0KPiBmcmVlcywgZnJvbSB5b3VyIEp1bHkgcGF0Y2guIE9ubHkgaXRzIHF1
ZXVlLWZ1bGwgZXhpdCBzdGlsbCBtaXNzZXMNCj4gaXQuDQo+IA0KPiBCZWZvcmUgdGhpcyBsYW5k
cy4gVGhlIHR3byBwYXRjaGVzIGFyZSBub3QgbWFya2VkIGFzIGEgc2VyaWVzLCBhbmQNCj4gdGhp
cyBvbmUNCj4gZG9lcyBub3Qgc2F5IGl0IG5lZWRzIHRoZSBza2JfcGFkIGNoYW5nZSBmaXJzdC4g
SSB0cmllZCBpdCBhbG9uZSBhbmQNCj4gaXQNCj4gc3RpbGwgcGFzc2VzLCBiZWNhdXNlIHRoZSBm
cmFtZSByZXR1cm5zIGJlZm9yZSB0aGUgcGFkZGluZyBydW5zLCBzbw0KPiBwYXNzaW5nDQo+IGFs
b25lIHByb3ZlcyBub3RoaW5nLiBXb3J0aCBzZW5kaW5nIGJvdGggYXMgb25lIHNlcmllcy4NCj4g
DQo+IFRoZSBza2JfcGFkIHBhdGNoIGFsc28gbmVlZHMgbXkgc2lnbi1vZmYgdW5kZXIgdGhlIENv
LWRldmVsb3BlZC1ieSwNCj4gb3INCj4gY2hlY2twYXRjaCBvYmplY3RzOg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogRGV2aW4gV2l0dG1heWVyIDxsdWNpZF9kdWNrQGp1c3R0aGV0aXAuY2E+DQo+IA0K
PiBBbmQgaXQgaXMgd29ydGggQ2M6IHN0YWJsZS4gVGhlIEZpeGVzIGdvZXMgYmFjayB0byAyMDE4
LCBhbmQgb24NCj4gbXQ3OTIxIGFuZA0KPiBtdDc5MjUgVVNCIHRoaXMgc2lsZW50bHkga2lsbHMg
d3BhX3N1cHBsaWNhbnQgd2l0aCB0aGUgbGluayBzdGlsbCB1cCwNCj4gc28NCj4gbm90aGluZyBu
b3RpY2VzIHVudGlsIGEgZ3JvdXAgcmVrZXkuIFRoZSByZXBvcnRlciB0aGVyZSBoaXQgaXQgb24N
Cj4gZGlmZmVyZW50DQo+IGhhcmR3YXJlIGFuZCByYW4gdGhlIGVxdWl2YWxlbnQgY2hhbmdlOg0K
PiANCj4gQ2xvc2VzOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRo
dWIuY29tL21vcnJvd25yL210NzYvaXNzdWVzLzgzX187ISFDVFJOS0E5d01nMEFSYnchamFDVkF1
LWM3bTFGSzNWSHpTLTRZMFVmWjNER2ZWeG9aUUhjNkFaNW9ZeHkySjljSG1mdmMxV0d0RzNhSWdO
M2lCYUFUaEQtZkJ4QXFTeHIwUTN6d19fZE9BJA0KPiANCj4gRGV2aW4NCg0KTm8gcHJvYmxlbS4g
SSB3aWxsIHNlbmQgdGhlIHBhdGNoZXMgYXMgYSBzZXJpZXMgYW5kIHZlcmlmeSB0aGVtIG9uIGFu
DQptdDc5MjV1IGRldmljZSBiZWZvcmUgc2VuZGluZyB0byB0aGUgbWFpbGluZyBsaXN0IHRoaXMg
d2Vlay4NCg==

