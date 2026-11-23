Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86602606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P/Roqp1q;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=adGgUO/T;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=mWlWHqk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=avhJASql/uriUYyW4e9c9Tbj1uukyv66SAzC6zgI05E=; b=P/Roqp1qxtRCGTKlFnpbrQ0Ev9
	qUtGhgea90a5fDrp1ClBuNfI9296cbML9iLtMBwcXljgLsqkOZIruaQVihWkG/2QOqIKNHIsKlyWz
	/P5Qzgk0kVY3Z7Do/86EU96fmTgiLV7LcWZjKAbyRVSr5WX0aQ+5cA8Ifoc/+dR8bZuyWr3P/CT+p
	Yh9jd4PJS5PS8xV6l3TE+zrvb1IWWEFT8hx9Tef4ADzP3FHfGNVbHN+bfK794lnVgGcwZ2EsVrZCs
	9Nj/JenHDXUxOneUfbMrvwXyNPoN6CH6wB9CwHV1RU93I5LseADwyo3UrcY/QHdLO/oXP/eUTjAsz
	OEFtlZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdfV-00000005CMJ-0sDi;
	Mon, 23 Nov 2026 23:41:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdfS-00000005CKs-1ul6
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 23:41:52 +0000
X-UUID: 7214f66ae79711f1afed4741b24580c9-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=avhJASql/uriUYyW4e9c9Tbj1uukyv66SAzC6zgI05E=;
	b=adGgUO/Tu9DeFHl29I488R/9xU3czo3ITbQl1SUOf5oNRGUDx/t724NMATB5qM41hstUS1fuH9A/wY1Nma57Bx7lSAIrLvK65o5bwhHTH4+3E7I+7PAnjN7eYEWvl784r5R8MUVnijVvuNP4d37l0mZGo5nSiSwMU0s3P6I4J64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4577a577-0cf1-4875-922a-402c3741ebe7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:d00df919-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7214f66ae79711f1afed4741b24580c9-20261123
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699148462; Mon, 23 Nov 2026 16:41:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 07:41:44 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Tue, 24 Nov 2026 07:41:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f82OcJV3eT6lhp59zTMF9rPz/QsFV88ejdUz0Qf/gi8QlEqO24q4o40aQS+zuacDceDUI9GGRT7Pjv5djJ9f96X56LfWxVlQnqd8gPjUVX5oRZklYJFhrD6HCxQkL77GteuFe9xLpbhWwkVScscyaERxRDgTKVvezOk18kGwbRgxtD8WAieg4FcdJ8MYl1DAl2qxGQYsRj+yrldY8c55Jni2mXOllVcfmgtARTgHuwXRdryJfaFIdxEIf9bVjyyJ6kTLgqJ6T6I5mR++sxzMJ6fGKbKaEi4wKK3vDqnsMYqz7w9bJH9pMS48epjnzEtQMrYyTP4iY7hBYlzRsTm6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avhJASql/uriUYyW4e9c9Tbj1uukyv66SAzC6zgI05E=;
 b=XcVKyMgXG3kvlKPKQ7n2q7ZM57IJSZROL+OnMF3pOWenL2YGn8aoyruDZdqi03x3g3QIUfBjg8VyRoNQR8DNohBebpC+SQZvzHSFZWypNCYPKtkqPyKYIHwUJ4vHweYowY9hIIXw9ZAgYKM3shynxqfUvKlB7/OY9fJ0eBI0QDyplmCDZKAvLJCifvllBrlalnaVgcrTgKMhcHy1DaO9iIHmhnwI+JiOMtY9pbzbFdjGAlPrpcK802hwEgP1XVoYNEaJH3JPFDnm6KL2x3vuAoCIW72HsZvfE6c364wnHURdIQ9N8b1E6KSKeeZeQ1tgOYW8uX1iPqY4EnS9LBVfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avhJASql/uriUYyW4e9c9Tbj1uukyv66SAzC6zgI05E=;
 b=mWlWHqk/vWTisNVAEXZQ+vIIroeK5SY5v+Pto+ryL0Y17jHp3BRH7aQhyIxK5zdz2lMX61stGRsPNHwD8BSZ3jBFiPnEGUEwkip+q1j2VGIqoqWkiBO0uyYMDxKReGEliw3enDnsyIFQSnxYqrgiocNTZYBOTxcWvjBJw+GoP+M=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SEZPR03MB10137.apcprd03.prod.outlook.com (2603:1096:101:337::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 23:41:41 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:41:41 +0000
From: =?utf-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: =?utf-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>,
	=?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?=
	<Quan.Zhou@mediatek.com>, =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
	<Deren.Wu@mediatek.com>, =?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
	<Litien.Chang@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v3] wifi: mt76: mt7928: Add MTK OUI support for nl80211
 (ALOS support for wpa_supplicant to get MTK OUI)
Thread-Topic: [PATCH v3] wifi: mt76: mt7928: Add MTK OUI support for nl80211
 (ALOS support for wpa_supplicant to get MTK OUI)
Thread-Index: AQHddvqv2cae2uYt/kKPeBSLEAzg3bc2oyYAgAQm/gCAAJZNgIAA+fkA
Date: Mon, 23 Nov 2026 23:41:41 +0000
Message-ID: <bfdbcb0071e680bda8c7de5d73f813cc92c618d3.camel@mediatek.com>
References: <20261118010310.1044193-1-michael.shih@mediatek.com>
	 <20261118011758.1049815-1-michael.shih@mediatek.com>
	 <c28aba9d-9401-4834-8d45-b0156012a670@nbd.name>
	 <5a8a96eece9925010a7bb4d9f7657afd2c0e15e6.camel@mediatek.com>
	 <2712203a-9b38-476e-80fa-b0c8f222e01c@nbd.name>
In-Reply-To: <2712203a-9b38-476e-80fa-b0c8f222e01c@nbd.name>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SEZPR03MB10137:EE_
x-ms-office365-filtering-correlation-id: c11248c2-fa07-4afe-40fe-08df49bb5320
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|261009223027099003|18002099003|22082099003|261026121527099003|261028144727099003|261102123227099003|261021121427099003|261022105027099003|56012099006|261026140227099003|10067099003|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info: HSBgqAQrkFr0W5RMMc+gusxfg2MjV8y0Mr0S/kYmcpcNkL3O1pxLOWIam/zpJsy0z1pBUptZjBz/9T3xBvHWFruoClQvLmcv7E84Tl+KCpfY9YIs/xQne5i99wotuSLsSkVGMs9arcsvaNx0nobYiP2bt8fXJOpKakF90j2JLJznQn6CqmsiFfMZGD+aoQoIi2UQr4Rr87tDsisn1fC6c7rLDUUMFVeUAkdxn2seL+i731ujrLcgYmVteiSL4k7dgxh8rLVzhKpx0v9wqytTXllAk3Qz67KqCSSmjsDYTcMHZJVqqgzHbdkVQr/u1abFUBOiCU34Izespc9BWtUeKxADDBJIkH2CI+aWzT3piBwzLDqYiPiD6DFY1Umks8nTBA7ZiqOAk0l5eLnc7DFEAyleU1eDS4TinNMIWauK9r45vhHqzPdgM5BR6GQ/AFofZXCYC6D7xMumwNMCXfzWQtoflvuj0c32R5q12GpMHb918ZwAiJ6hwP40Sf5XVhif561MCkrwRoTPre0lIbgCOSWL/fNshglkMAhIb7JLoz+RETKW36B3hufzKYG/PPsy59/QYbZqRd7PJqm4dJMI2glfwLKoVH3Gv1qcetaHToraNvyImo3/S04yBq6N2Ub3jdyhcCXYgqRuFi+BylF5xIRoy7qiMkHHNJIhnkVz6+wE+d0AXb6I5hGZV0H7jpTIAG1FT4SxFgkQG5c1r/otkRmBaJ1iZ3/qmK8aUJiWS/w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5742.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(56012099006)(261026140227099003)(10067099003)(38070700021)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzlaUHFNeXIwOUhmVHNQRGYwdzdqMVR4bFJXQ3lpYUNjZlIyTHpDWmVqa1Vm?=
 =?utf-8?B?cmJwOGRBMkZjN2s2WEZjUFF2U2xYaVNrWGYzUUhGQVp0Y1FiYnF5ajBWWkU0?=
 =?utf-8?B?UTZhZEFobVpIRENZdDVjYjV1bjV3cVlvYVRTUWNFN293aXBsaVhHOW1BVTBj?=
 =?utf-8?B?OHp3cTQ2YTZyVE5kMVZZRk1HYmdOS2U0VkJOOVN4Ynpja01jRlA1VlJhZE1w?=
 =?utf-8?B?MWtZdGlrMWtWcng5aXB4eVlSdVd2TkFaaVNVVWpWcXRYMmpoV29CT2dlYjFm?=
 =?utf-8?B?ZEl4eGxVZmc2TEt1elFEcElGeXpjZ2JRU0d0b2hCdk4rWWJDb1VlN1VLNCt2?=
 =?utf-8?B?VHk3NnNCT2VscmltOHFrTFcwMXgzbmhpLzd1WGR1MkM0UnA3RjlKcDhPUHFI?=
 =?utf-8?B?L0tJNDhEYUNaVVJ5eG43V2pFL3F1ZkFsanJtY1pEK1piT1NEZjd1OWw0RzNY?=
 =?utf-8?B?YndPQzBOb1o3TEFiQVI5OWRjaHZoM0wzZFN6VmYxZjZNR09hc3ozUVFjT0o3?=
 =?utf-8?B?My9Wam9jQURkUWtjaXN2Q3QycEZEQ1pYNWd2MFR5dnhwNXRGVUtPcy8yRVds?=
 =?utf-8?B?aENPKy9qN1FXb1d2NnRKMTJPNUxFT1FzZi96SzQwSVZOZjRDSUdzYmVQSXhy?=
 =?utf-8?B?dDZ4WG1jZTg3V2xkK1BCVmk0aXRxeG1wZEVvM3RTYytWNzdBWWlzeFpsbzJl?=
 =?utf-8?B?S0g5UFlMaTZEeHowOThnbTdiNmNBYmdPaGtUNWFBL3FuUWJ3TDBuNW5wdG1j?=
 =?utf-8?B?SXZpNWFLcGt2RDJyMTFVMDk4ak9ucW5pTzI1NFlibVpVWUFMeDZ1NlFFMkZP?=
 =?utf-8?B?aVJGYTB0RFV4bFIzKzF5R3hFYjRhUWM1K3lrdUdNRGJLS2VYY011Rnovb0Ur?=
 =?utf-8?B?TzZkYTlqRVB3cExrNk1DTll1eWxpQU10Q3liQXFCZU5kMUtUMGtsZDhBYnd3?=
 =?utf-8?B?VFhDWXJ2UHNUNHZrK2pwaG1PVUlQU2l6Qkp2emxIRlk2TEQ0OFVjQzUwNzlj?=
 =?utf-8?B?N1QybDQ3Y3Q0QkhpMWltV2lpTHNFS2tHTHFjZy9adzlGaDFkRThCeG5GeWps?=
 =?utf-8?B?RUZmNzIrdjRzckRGZDQva2UxRlZQZjlaTVZ2NUUzSjlOQ0MzQUVRY25Odjhq?=
 =?utf-8?B?bFFhWTY3WTdsOGpJZndubjY0c0s5aHB1UzNiWlhOZmwzNHFMSVFnc0h0RGF6?=
 =?utf-8?B?cFp6R0ZXeGtyVloxWS85V29QSkNlMG1udTBxQ3hwZzlveEdhaG9FV0pxdXdv?=
 =?utf-8?B?ZUZGTGNJNW5wczBqUFpiaG8vSlY2MHpHRHg1TFUzd24yblNwWFM3UHNwOXFk?=
 =?utf-8?B?MXRwbTRWSzFleHdDMzlHekwrRm5aSitzT0kwekh5ME1DQlRRZFZ2ay95SDVr?=
 =?utf-8?B?ZmtGMmxjcnRLTWVrbFNpVm5PdGcwSm84QjBTbjZzenArZEgzY1RiYmxLcmwx?=
 =?utf-8?B?c284MDA4K1dMcGZ5cVhDVEZGSjFiYUtxS2dKOEdTdjlTVUVPZGFPZzZCa21n?=
 =?utf-8?B?NUc0eTFWYlBkTkJSbzh5TkduWnA0NFBtRStXRTN0UFlmSENMWkdhdXlqQkFQ?=
 =?utf-8?B?Sms2blRIZitlTGwxNFh2RmVCRUg0V2t3d0VkUWZXU2tjcXZpb3BpZTJvZWly?=
 =?utf-8?B?NkFGRXlMUnVjQi83eUdDWlBsb1NQbVBSM0pOS0g0UkJ4UElFbnVSSjkzaDFZ?=
 =?utf-8?B?WVpyNU85Wm95Q3JXTjVOdFF0K1N5OHk1dUpRNE5LWlN6eC9PT29FQ0NGNlYy?=
 =?utf-8?B?ck1Bc1cxWEZERi9aVG01Y1BCa2lQemFiZkNXNkJ0SFlQVmlyTkR1ODZkUlBz?=
 =?utf-8?B?amJ1T29sTkRUc2pZcTBzUjJtWHJHSWxhZDdNSE1IdUxhcXBOUkY1bVQ4cGcz?=
 =?utf-8?B?RTE5UXowaFBrS3o1dlA5U2Q5VFlGUnUya0lDZzZtV0d6UFRjMDdFZTlOMmFQ?=
 =?utf-8?B?elZQaHFSbi9aVjlOb0cyNWc2eTR4ejRDb25FdDNrZnU1ZTJBcVUzT29sSTdl?=
 =?utf-8?B?MFNNT3dId2w0aytKYjFwRkhsUHlaMFVmajYzZUszU0hjVGhrTzFReWJwSUdq?=
 =?utf-8?B?enVrV200N3NIYUxwVDJmZ2g4SVZ1YXd0ZnhUOGI2SHZ6cXNRUGZ6d0I2WDF0?=
 =?utf-8?B?dFIyZHJLT1dza3pqbTd5QjJleDlWcVB4aXB0aTZIT3BYUUx5Z3FuVGhOQ091?=
 =?utf-8?B?blpGcmxUZGNVVmxqTFA5UFFydDUvd3RUT2FLNnJkS21GTW9wUHhuUnFhOGhq?=
 =?utf-8?B?UFBUNCtkRUpUbHdxNWxUdURTTEM0dUZ0RDhhTXo5UkI5WWtBa1NocHVMeVBo?=
 =?utf-8?B?ODNOS2NaT01qSndTak1mNzdaYVQrWFc4UlBBN2lWWVNvNjMxS09sd1oybm9U?=
 =?utf-8?Q?3/2O2S+FjIb1M3GQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F2D244B28C2E34AAEA7C774CDCF094B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BNWRAKxUW554yM/f3ZXUBqDr1LRtAoM73jBw/MiI0My1JI3LDGnZQrxN3EVucFY4wm5xIgEuPfuDmj5FJhIg0I2e55jysL3S3bDmKbe5MZ0EJ5ulEN22Rf24gjZTj2YXpo2tc+yn1IOj4PbaoAl4vp3Na+6CCJHpQ51FIJL6OZbCb2ae+hUm2EfAeP1uCpHr+E68JhHkIaVn0BjfbK9MF3/qYXRDuYhofNLKjPOji+ZPh4NHK+LbqvF0etABWi0UDxKy+SKt2R76xVP6vBxjUx3gbVQJtiT3M8Wfo1vEr9tItFohrK3lfGFST6jmQM0LlRzfx87ZPUMNrBiq+EfW2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11248c2-fa07-4afe-40fe-08df49bb5320
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 23:41:41.1683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8G6rlqRHc+7doWmIz+ACd54aF4a5XNcKzVVzBSVwX+JEmeIJmRhN2sJ+Gcyj0pzN77M5VS86wQtSUkLDlhasLTC/Vyx3XwPU5eApsSx/7dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB10137
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_154150_869876_D7A6897C 
X-CRM114-Status: GOOD (  21.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmVsaXgsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KVGhlIGhhbmRsZXIgaXRzZWxm
IGlzIG1pbmltYWwgKHJldHVybnMgY2hpcCByZXZpc2lvbiBhbmQgdGhlIE1USyBPVUkpLA0KYnV0
IHRoZSBwb2ludCBvZiB0aGlzIHBhdGNoIGlzbid0IHRoZSBzdWItY29tbWFuZCDigJQgaXQncyB0
byBhZHZlcnRpc2UNCnRoZSBNVEsgT1VJIG9uIHRoZSB3aXBoeSBzbyB0aGF0IHdwYV9zdXBwbGlj
YW50IChhbmQgb3RoZXIgdXNlciBzcGFjZSkNCmNhbiBkZXRlY3QgYW4gTVRLIGRyaXZlciB2aWEg
dGhlIHN0YW5kYXJkIE5MODAyMTFfQVRUUl9WRU5ET1JfREFUQQ0KbGlzdCwgdGhlIHNhbWUgd2F5
IGl0IGFscmVhZHkgZG9lcyBmb3IgUUNBLCBCcm9hZGNvbSBhbmQgSW50ZWwgaW4NCmRyaXZlcl9u
bDgwMjExX2NhcGEuYy4NCg0KVGhlcmUgaXMgbm8gc3RhbmRhcmQgbmw4MDIxMSBhdHRyaWJ1dGUg
dGhhdCBzZXJ2ZXMgdGhpcyBib290c3RyYXAgcm9sZQ0K4oCUIHZlbmRvci1jb21tYW5kIE9VSSBk
aXNjb3ZlcnkgaXMgdGhlIG1lY2hhbmlzbSBjZmc4MDIxMSBwcm92aWRlcyBmb3INCml0LCBhbmQg
bWFjODAyMTFfaHdzaW0sIGJyY21mbWFjIGFuZCBpd2x3aWZpL212bSBhbGwgZm9sbG93IHRoZSBz
YW1lDQpwYXR0ZXJuIGluLXRyZWUuIFRoaXMgcGF0Y2ggc2ltcGx5IGVzdGFibGlzaGVzIHRoZSBz
YW1lIGVudHJ5IHBvaW50IGZvcg0KTVRLIGRyaXZlcnMuDQoNCkJlc3QgcmVnYXJkcywNCk1pY2hh
ZWwuDQoNCg0KPiBIaSBNaWNoYWVsLA0KPiANCj4gV2hhdCBmdW5jdGlvbmFsaXR5IHNpdHMgYmVo
aW5kIHRoaXMgY2FsbCwgYW5kIGlzIGl0IHNvbWV0aGluZyB0aGF0DQo+IG1pZ2h0IA0KPiBiZSB3
b3J0aCBpbXBsZW1lbnRpbmcgdGhyb3VnaCBhIHByb3BlciBubDgwMjExIEFQST8NCj4gDQo+IFRo
YW5rcywNCj4gDQo+IC0gRmVsaXgNCj4gDQo+IE9uIDIzLjExLjI2IDAwOjQ5LCBNaWNoYWVsIFNo
aWggKOWPsuWQm+S7sikgd3JvdGU6DQo+ID4gSGkgRmVsaXgsDQo+ID4gVGhpcyBpcyBhIGRyaXZl
ciBwYXRjaCB0aGF0IHN1cHBvcnRzIGFkdmVydGlzaW5nIE1lZGlhVGVrIE9VSQ0KPiA+IHZlbmRv
cg0KPiA+IGNvbW1hbmQgaW4gdGhlIG10NzYgZHJpdmVyIGZvciBXUEEgc3VwcGxpY2FudC4NCj4g
PiBUaGlzIHN1cHBvcnQgZmVhdHVyZSB3aWxsIG9ubHkgYmUgdHJpZ2dlcmVkIGludGVudGlvbmFs
bHkuDQo+ID4gDQo+ID4gVGhlcmVmb3JlLCBJIGhhdmUgYWRkZWQgYnVpbGQgZmxhZyBpbiBLY29u
ZmlnIHNvIHRoYXQgaXQgd2lsbCBub3QNCj4gPiBiZQ0KPiA+IGVuYWJsZWQgaW4gdXBzdHJlYW0g
aWYgbm90IHJlcXVpcmVkLCBpdCBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGluDQo+ID4gQW5kcm9p
ZCBwbGF0Zm9ybXMuDQo+ID4gDQo+ID4gSSBob3BlIHRoaXMgd2lsbCBjbGFyaWZ5IHlvdXIgcXVl
c3Rpb24uDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IE1pY2hhZWwuDQo+ID4gDQo+ID4gPiBIaSwN
Cj4gPiA+IA0KPiA+ID4gT24gMTguMTEuMjYgMDI6MTcsIE1pY2hhZWwgU2hpaCB3cm90ZToNCj4g
PiA+ID4gQ3VzdG9tZXIgcmVxdWVzdCBNVEsgdG8gc3VwcG9ydCBPVUkgZm9yIHdwYSBzdXBwbGlj
YW50Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTaGloIDxtaWNo
YWVsLnNoaWhAbWVkaWF0ZWsuY29tPg0KPiA+ID4gV2hhdCBpcyB0aGlzIHN1cHBvc2VkIHRvIGJl
IHVzZWQgZm9yPw0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+ID4gPiANCj4gPiA+IC0gRmVsaXgN
Cj4gDQoNCg==

