Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DBC606A31A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 23:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=du5fLXEs;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=dq5YG9vv;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=WEWVoqxb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0DrQsw2+JosrVj7ff5c32x60EDbwaWRyf2chnouvmdg=; b=du5fLXEsHqomshC0H4qc4VN+f+
	OE8bkHbr9pJfhZngUK28A+l+cBRVqgas1JnR+tPvTkamRgyqA9CWL1sphQ/pAd7eeWC69VxN6Xb9B
	d99ZjOVk0ZCVSXubbxcZW0jCsXD1vJpcJwKmSiyTpjgIYpyygX/yE9m6oqlL+M3LemUqwSeNCEaz8
	gS+iGQX6Z2j/DhvcVxBniNXvI7l/YdhWM5jz5UY3MWZjId0rimA24lf2q6LN27nL4/KzK25n8xUkk
	JGPIElvbynIwGbB//HhWAscc1anAXe/gpfUh6QUoEnfWEmvocmjCi36YQZ30KXrs9He1BFmHbY8L2
	OYcEFFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHJ8-00000001uDj-3bKR;
	Sun, 22 Nov 2026 23:49:18 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHJ3-00000001uDE-4BJI
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Nov 2026 23:49:17 +0000
X-UUID: 4ed9287ee6cf11f1afed4741b24580c9-20261122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0DrQsw2+JosrVj7ff5c32x60EDbwaWRyf2chnouvmdg=;
	b=dq5YG9vvnM1fkBpk6RvKB1m2n4mKdIkOso0HEzLKi3gheo0qcadNb6BI9i8LBrlX6zbPj4VMQ/TwM5rq7W2hKVYkgGF3qPm8lAadMUUKhrpHdgp6VNpgw4e7AhLMo23MUM1qJpFMF9FC5x8oJPZtvqiAtvzVreo1MItJy3UgJpE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:df4c22b0-1aea-4e85-87ad-4d457dea0caf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:85f2a566-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ed9287ee6cf11f1afed4741b24580c9-20261122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585562600; Sun, 22 Nov 2026 16:49:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Mon, 23 Nov 2026 07:49:05 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 07:49:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ld56K9XroRBcgFEvAiVR7YHHh3OhnqeKCU83Cqy1TW0jVMua9Q9/ogS8+IsGhw0AzA0pD7NRLtoyYqcyrnXFlVxpEyF0TGhH+87aJVQRN0sX7YFk73pFD/trgp6BY4858y9aMsSkIBF+TKUxFjhS/oWDfpcexcpvi0IaiMg19OPADOLUnGp9WYDDY5jklfy4NoOkg2kY7khXyZYB4/6Q+D9jclBAQ81EM+aIHqd0Eyx1wiXc/0ZE/7feKNWrUCZ+/TrBtHYnhapPKRXPRQMTfAucEjJlmUVEv/4ZUw8msjiaUU1Z73gN+7GqtbSLpQhfUzcEUZbtGwq/kEt8Y/Y4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DrQsw2+JosrVj7ff5c32x60EDbwaWRyf2chnouvmdg=;
 b=DYtFrOQ95oY7FOSpO6J+jfbzC+UFCE145T6+PEmfMiNwd9QGSUmFRV45STg3HxpWY34EAcw4d7VP41iybSG8oq5LKWZu1BOKTOM3saGFIuitXJHR5n8xltvObl+qPn9SV411RyxspFXfDzrH7aEUqyAoIbJNchpbU6Ct+HbLpIutQIt03fBwMkyW38pjjxM9lrwEHOTFAOv16VvxwpwOtnhRzWbwHkHFZhWVRMaQ+kz6M4XFllDHeseVqgw0Mglx2U5qNln/PXnGSyuxpOSHlMkGcsmF220SkgxkhWezVYNoJ5U7LyUxQKorzPLly7hKN/ERvb94yuIrFu3qzvixbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DrQsw2+JosrVj7ff5c32x60EDbwaWRyf2chnouvmdg=;
 b=WEWVoqxbDIazUg4sDQ1s4BUcqLDutIHU+qwRpIxkzIT5d/QhYksNi/jBvxNlXHGyk0YRcQP47sikUF6PUoMZFz5NMSwp5j3gD7b2ZUwL+2uZzoFuuS7zgja3hZAkZnZ7Ev80sj5yjBglESCC5nrXqQPTidNtlMEbnh2OxbrLjnA=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by OSNPR03MB9838.apcprd03.prod.outlook.com (2603:1096:604:486::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 23:49:03 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 23:49:03 +0000
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
Thread-Index: AQHddvqv2cae2uYt/kKPeBSLEAzg3bc2oyYAgAQm/gA=
Date: Sun, 22 Nov 2026 23:49:03 +0000
Message-ID: <5a8a96eece9925010a7bb4d9f7657afd2c0e15e6.camel@mediatek.com>
References: <20261118010310.1044193-1-michael.shih@mediatek.com>
	 <20261118011758.1049815-1-michael.shih@mediatek.com>
	 <c28aba9d-9401-4834-8d45-b0156012a670@nbd.name>
In-Reply-To: <c28aba9d-9401-4834-8d45-b0156012a670@nbd.name>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|OSNPR03MB9838:EE_
x-ms-office365-filtering-correlation-id: 9b7998fd-3bab-435c-f432-08df48f33050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261021121427099003|261026121527099003|261102123227099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: fI4O3ULID/jZOeC9ebNKsVNjkMKAIJJ0tUtgr09nxPskm4SU6Vq5nds8IqKEPczkTmzX4uET9yHYibWjLPFdQkS6qPGbEBnsruU0UdowcOrAuUNai5BwCcSwax5LNDrQUTLj5EG3IQtmcoI7rd28MNYvg2iWeJ5lDRJzJ30wsWZFPvpZe3//bbgVyo4mfHrLDY9ICiWXIC1op458PpY1eUvt1lauTW6ITDGDtTcQ77bB1hHWuw2/cKOIkJL3UCkWg4wpPFoIqSYCRb0YKtA76c8QzjkSg+jgIXkTPcl0E9adUr9WcrlhV76++TEu5p7L2tJw+Xj9FiiIEgiJ9r2xgS/yiTzmyfGtooPSn9KRC6pxeEg+f5JYPGnMu2mEcLa+E30Aa+mMfKzxx+qihDXaLmFLo0fEUYYHDJLBPMvszNqBqVPopfPMTCWTehINZV2aaPbFpMIqretTGDR3Eel4DQbT8e/iIu68OmoWyUL1FrRcuBbxiVtzn0O20g/bfRcLFMVX6njW4X/DLKh49Iv74LzEh/2AhzAM/ibgKddZI4nkCw6d6UCJjPn5E/OmSgrG4tRY0jp3SnL0dsZ68A/OvgRkBSFJyHpK/tsX0kYyTDFuyK0fnCR2IV8PZxYeMQMJH7QzF4nHFzXeBt/qv38gV9QU75A5gwJ5HKvUwalIEAqcpCZVZQhurMxq4NyJyTu/9RQvV1nNrsFIkp7HCGzqhk8MzJw8G4Ff/nGjNJknEAA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5742.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk1nRFRzTkpOc1k5c0RxcEZneG5CaGsxRUhPYmozaXZmVWZRSWl3SHh6Ny9m?=
 =?utf-8?B?SEU1QXNvNG9hWFdnUkRWSzVnTzBLYzE0dDJyakJtcEJudTJLR21sbDVOazZB?=
 =?utf-8?B?SHdhMzdCOW4wckFZZ2NDL2RyNG1DcE53Z3FVY3Y5RFVTTk43UWVkblo2c0JI?=
 =?utf-8?B?cVpablhCUkpjbzZLUVFxdlBGWUhmN1I3RHJpdFpIZzZSbDZYSnlOK1RaR2Uz?=
 =?utf-8?B?WHh2RERLWTBMYlVxSEpoaXVXUVRzWGpGRlladWY1VkpYVGNnMm5yNWlyWDZO?=
 =?utf-8?B?K3pYNkJMbG1iazV2ejFnRlhRWk1oci9XMTYxcDJpUzJRL0crSExRQjhQZW1D?=
 =?utf-8?B?UnJldkxTQjJRRlYvWTcwbHY1ZmNMdTIyWXRaZEZlbGt6MjRueEFqVEpqUGlD?=
 =?utf-8?B?ejIxTnBoYU10OGx4VW9Ka0kzbUZXZHNjTXkySzFYVTIvQ2xKenFTMDlzTEZN?=
 =?utf-8?B?WjF4RkEvc3lVcUEwdHZMSXJEb1ZJUDlSTGdOMzd2ZXJrcGtWV3RQNngxeWdR?=
 =?utf-8?B?eVJ6ZURxNGZNV2Y0NGRNVlB6NXFvUkVzQVRXdEtoSGlRWnIxMjM3MFR3bzJr?=
 =?utf-8?B?Z096OEJQelpObnlBT0pFSkpmZWJ1WGJEUVphNHpHeEorYndTRTRaakkyd3Iw?=
 =?utf-8?B?UDF4c0hVb1NRMkhmNnVsZXk1NnFQRVphUUJPWktKS1oxSDFaN0gwNG5OczZO?=
 =?utf-8?B?a29zdnRPYlhzaWJ1elpCZUZ5MlFoaEV5Z1hKcmJFVU5GWEtKRit0Z2l1eDhp?=
 =?utf-8?B?N1gxUGRIRGFDQzMzcVJNUFBjOFMzUWoxbTJOQThaQTAwYmlXem9oYnpYYTNo?=
 =?utf-8?B?S0xmVW9JNmhPV1VXMmc3alR5dXpBdUhubEpsNDJHNE1GaXkwTVYzNnU2NG9z?=
 =?utf-8?B?VWVFcm5JbDBpdnF1U3FWTGxQR3BDZzd1bzA5VGhic2FPZG85Y0FrWEJ6MXVJ?=
 =?utf-8?B?Q2lNQjcycjBNZjhzdEpraldBYUQwdllvQm5nY00wUllCUDIrV2pBaStlaFpM?=
 =?utf-8?B?dmRDdlk0enNVeVRmVXlkK3hBaFNDQ0hPdGZYSllqYzF6bEd6NEhkb01iVWJ6?=
 =?utf-8?B?SkxtNVRXWk9lZ2IwWXc5dm5lZ2U3ZVh6M1E3a05nWExHc25zY3dLNVVFbnBz?=
 =?utf-8?B?Z3owejdCUytIbURsd0M2TVZBUGZjc2pXZ2wxYmYyOWkzTUJKNDJPZ1dJbmV4?=
 =?utf-8?B?SSthaHFyb08xSk5CYVBaenBRbjdFU3hobjJ5Mi91YXpqNnNZVFVpQ0o4MVVE?=
 =?utf-8?B?S29SbHI1MjBnQkM0TTl4dWZ6Z244SXFDSnl4VTh0RW1nTDR1Y1BpS2NJSUFp?=
 =?utf-8?B?RHB4cW5xSWwycVI0RDloK2hiNkJnbmtndkxkRWo1c0xrcWhlNnpVMHJoYmYx?=
 =?utf-8?B?UDdWYVdYTWxzQlFOOUlOVTNVenN0VHhVM2hJWVE5V2k1WTN6R1BQVnNySzll?=
 =?utf-8?B?dm1CNTNPTXlodFpPSFhsM3VBOWNhRnRMODRWcU9FRjZPSlhPdjJSYmZNOFF5?=
 =?utf-8?B?SE1nS000N0RmQzNDOEE1cngvYnRJMm0rUUpMR2kvWHM4OTRONlErZmVXRDho?=
 =?utf-8?B?bXI2NmpoUjRCV1BCYjhiYUwyYVNsL2dmdFJPdVdjV1JUVDVOdXpBQUlPRERP?=
 =?utf-8?B?MDdVY1hKZ1IwRzkySjlqcm1ZNmRkTGlSd2JzMWY5Qy9NRkszVG9nOTdpQTlk?=
 =?utf-8?B?cEdUTktycEYyUnRxdVM2NDltdzBkdnhWNWJBbitDR0ZSZFhleXZDaCtqY1VF?=
 =?utf-8?B?Q01JK3FQK09POFcvQkFhN3NGbmxYbHNJRHVkQi9FZjAxU3QzdzZaM1Y1aUE3?=
 =?utf-8?B?S0pvVjlwSXRoWnR0ZXdPamI1dTVmclU0b0ZLSHpaN3ZFdjNlTHZUNmRkNlBh?=
 =?utf-8?B?OXJRZlBYZ3NBTG54bkloUmRkZWZOSTNEd2h3V2pmYzhLY0lCeU1DRVFmenU2?=
 =?utf-8?B?d2ZiREt4MVVta0dHMnliTlVCYyt0Z0dmcEVPdHdlWlVUSUdYdzBGVXltL29E?=
 =?utf-8?B?KzhtZGVEVzRVRW1uNDYxQ1V0eE5FczY5aGpOY3JmUnA5c2RPTzlNQ0hNVXoy?=
 =?utf-8?B?cTZUY2xKck9GNmNpamZWbk9XaU90Wng2TFRZMGVYUVE1VE5hcHA1NGdHM25l?=
 =?utf-8?B?TzhsREdJU1dQV0EwciswdmNhSk5UU3ZMa2xOa245d2xCNnc5OUV1eDhhNmtS?=
 =?utf-8?B?bUFDU3l2eXNpV0J5UE9Xb3NpbUI2bEZSWE16S0M1eXZXRHEyNlhLeERROW42?=
 =?utf-8?B?SndZL0YwUFVwSE1lc3B3dEdDcTR0NE1QWGNIZzFZYUsvM3gydml1RkVQSXRD?=
 =?utf-8?B?blNxNFFTYmJERFFBT3BXNjdxOEJST2tVZzJYYmwyY3g3V0N4QlVTZkNBOC9a?=
 =?utf-8?Q?EMmtEh8ygJzpKWgM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <271DD37B924F7A4797B95C9221CE9F20@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YQ5Crazk3H8e2BOyJzjM7HEXQZ3JJ/fd4qG5DoDjBGyyMrtf1P5yh9VYrc08U/x2STvmcucdJN7EOnrMMcBsRFtne0u/Wl1G89HMrofhxm4y/9I2Ha/zkEo85m73wYZ4CN/cUZfezahd+jk1jNoFjI1k0+5M+YaQTtSCfso/SJlzGYP/pOAeIN+3sl+pEU3caBZIopNKcGW4Ze4KAjRouZFPXjToi6EuidFbUPVLVEsZPcG2sCqcyNIR4h70/cxDCh+X7+7r/DjL1OIF9AgusBM8Hc7h+Qr9rcVPbwV3SdnX8Hy5SLoXlPxJVHpdmIfc63Ulcmrm49fjPfiGZbCH9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7998fd-3bab-435c-f432-08df48f33050
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 23:49:03.4357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvhabqUihDQCwo0XnI5S2MIOKBi3n1TTD/NAGo/d2S0wg92v4cXJgH412B7/u1tWDK1fgEByiGEmaxxLYTTNnxKReS5zbpW0Re0rYCa94KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9838
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_154914_100400_BD6C1C55 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -1.3 (-)
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

SGkgRmVsaXgsDQpUaGlzIGlzIGEgZHJpdmVyIHBhdGNoIHRoYXQgc3VwcG9ydHMgYWR2ZXJ0aXNp
bmcgTWVkaWFUZWsgT1VJIHZlbmRvcg0KY29tbWFuZCBpbiB0aGUgbXQ3NiBkcml2ZXIgZm9yIFdQ
QSBzdXBwbGljYW50LiANClRoaXMgc3VwcG9ydCBmZWF0dXJlIHdpbGwgb25seSBiZSB0cmlnZ2Vy
ZWQgaW50ZW50aW9uYWxseS4NCg0KVGhlcmVmb3JlLCBJIGhhdmUgYWRkZWQgYnVpbGQgZmxhZyBp
biBLY29uZmlnIHNvIHRoYXQgaXQgd2lsbCBub3QgYmUNCmVuYWJsZWQgaW4gdXBzdHJlYW0gaWYg
bm90IHJlcXVpcmVkLCBpdCBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGluDQpBbmRyb2lkIHBsYXRm
b3Jtcy4NCg0KSSBob3BlIHRoaXMgd2lsbCBjbGFyaWZ5IHlvdXIgcXVlc3Rpb24uDQoNClRoYW5r
cywNCk1pY2hhZWwuDQoNCj4gSGksDQo+IA0KPiBPbiAxOC4xMS4yNiAwMjoxNywgTWljaGFlbCBT
aGloIHdyb3RlOg0KPiA+IEN1c3RvbWVyIHJlcXVlc3QgTVRLIHRvIHN1cHBvcnQgT1VJIGZvciB3
cGEgc3VwcGxpY2FudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFNoaWggPG1p
Y2hhZWwuc2hpaEBtZWRpYXRlay5jb20+DQo+IFdoYXQgaXMgdGhpcyBzdXBwb3NlZCB0byBiZSB1
c2VkIGZvcj8NCj4gDQo+IFRoYW5rcywNCj4gDQo+IC0gRmVsaXgNCg0K

