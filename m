Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89336606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 00:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vNB23bi0;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s4H0IUBb;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=qhzOZS6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=; b=vNB23bi06VcPXWZ8HKozKPtzKz
	oUX8LeCA7cXQjxaD7+EUkOgj5w2Fe/Q6vtpRYv/cYQgHHIs5pjnAGKHb+ZJkNjzBSCIQCWmKODyH3
	T7oR2HlIs+RFrB1MDVGbsoIhuPmlxTiwXZVz82Aq+6plR3CbwUc5yyR+1fq+KGurF6U94/BhttgNk
	oQtMBlMl1yMUCDvjkDvkxatjnJ7Ald+ZneJjveMNILvNwtM71zNjBXsx1ugmFsmKJGD2oStB+N0dQ
	HIeS6QxR+nuZ4P87YX49R3W4kAXyGwM49W65f5A5thDItZP088mBi9KMf6/tg+6DWkp3O6g5mb1P5
	FKXEgLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjUU-0000000EgWJ-3Ff2;
	Fri, 27 Nov 2026 00:07:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjUR-0000000EgVh-2bRW
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 00:07:00 +0000
X-UUID: 7303dd3ce9f611f1a170bf5142e12a73-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
	b=s4H0IUBbPbB7ig/p68god5tSZG5ytw6da7kIrhHNpN5FPmLLRYR97eq8ESoRT+gAox4rBQX3uD7N/V3+v3MU8xkCjJNETULYnLss5k68JcNrofxqruavQzLUJjDkVLDOmFBIsCVaDikTQpnExkNnPQF1E4lVJ6K8L+BzcHh9oF8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:42495f55-10fd-4a18-a7e4-902a65827afa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:a6f1d666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7303dd3ce9f611f1a170bf5142e12a73-20261126
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2045775528; Thu, 26 Nov 2026 17:06:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 08:06:50 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 08:06:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0dB7rHjb8ZirQrGvliRYvtBS7r+bOW4EjK4NfHlCB2YkWXyJE7NRJK3dNj3zEvOQ6vcQXHTAf1PsnyY4HnAj83InQxZka1SYJTT0MeF5nYiVRggM/51WmZpqwcBLt6kZ+pyrYqTIz7OOExP87NOzCmKBT1nE7ZzODwX8BlP7BIkrScLq6e8n1VHvqtuQDtz4+9aRoXf4paajNZzPdglz8K4hmjL0rl0qWHtZcgwI3eK65AzlgEviY+5fum2LFxl28Mp8D6veWEtJ9svD7wLINu/Tne6hSYfhhe0pxGPuVY4qfkVyJl8YeaZOtsY1us53F6rFmlH2AwNY8ya9+fstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
 b=Bk5bsBKs6NdPvQvZVf6mxvrdaEYNYau+An5mKK+9Qs7j9cikIQFTHsgk3hgBS1XdYOXELlEOHnodtUbYw/VGk5ZsrQ8RRv5QCtEySNHeTublh0XPkBsc+KEgaSG4F2WLN58wBgb4/++O0PUiXmX7J/qiemtdxkkBN3AUOMgvpKkYiFg1u8QWnnAi0j1tsz3bRA30SkpswvNKE+DLSS5MBC66wZxAO96QmSNPTOvDza7m5NGrasILor1RV3FO5Pz7ReENvUyYZu1rdcwaiE3+SCnnd1zUVZvP4z7dlyfzxke5R9XhzbBLmSWqIvnw3Qy8mekPWXYffUyZhjIUh98crQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
 b=qhzOZS6QwzH0yPR4mLqWfsLQQ4XLB5L3ZbV+ho1+pTPr3nQrLA66iL9MEDQKliO8lRfyaCoPmmrCPTr5D/Gp/D3lsSz5ZMBm4iUuEotdiHUFsCFHYUZu3nVQKgGQ/kcwsGkHlSh1/5h8aQU7QPbf3K1VFQwOOrAy+mT2OjCWnHw=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SG2PR03MB6684.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 00:06:45 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 00:06:45 +0000
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
Subject: Re: [PATCH v6 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Topic: [PATCH v6 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Index: AQHddkNbL6a1le0dXki/MD03jnFH/bc+1DIAgAJFpYA=
Date: Fri, 27 Nov 2026 00:06:44 +0000
Message-ID: <a865eaf5c06a8f8953313e62c074d0a2e1cfd621.camel@mediatek.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
	 <20261117032530.470475-1-michael.shih@mediatek.com>
	 <20261117032530.470475-3-michael.shih@mediatek.com>
	 <2ea4dc91-9235-4b54-ad7e-0fcefcb933e5@nbd.name>
In-Reply-To: <2ea4dc91-9235-4b54-ad7e-0fcefcb933e5@nbd.name>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SG2PR03MB6684:EE_
x-ms-publictraffictype: Email
client-request-id: e5de864b-8ee0-4e77-9c58-8afab3c653f4
request-id: 7085ecac-ae15-4bd9-7309-08df4c1a52b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003;
x-microsoft-antispam-message-info: x4Mdhxs4F6UhRf0W9al6MMweYIF2zXyZ0N4DO3bic05/G/QRqJVdupcaIIdkAxqpzkxACh2fXmxuvZGx4QfVL1LeHrpFQCFXTkTV3rKw/UFDaRMfOtFsj+31QbTZTY0U6K/dqKNC+WMuWCYBtia3Bl1i0xVlejyrqRXgM80hLyh+nt0vm47+wqy91uS9WEd7XMt1OwQTYAb65kKDe+56gliNfWlpQh2F7QDjAShnOAb8k1EQmaFI/3RwZ+32yvqumb6rk/F3KgqERAFzMU1qSacvrWYjR1nnwVxSNthYVQQ0xa8KmNF+ufgIrQAuS0juF6CDUoKNAbPUFxUSpbpagaF3w9Z1qX4EbYm9m6NQ0jZQX6TCUHpRQv/7TKfpLji7N1Z/goHTmHQfC0/Xn1p5NsUxFz9RvA2X3izxK+uOwsroS7Fgwemk+8U8AJjy30TDB9YWW7YnMNQiS324yXcPswFID9Zv2uyacmrYbrQD81ZeN24xTDkCVpoqel7O0kKb2HBiqUp3usVnDO5AJf4+vYeTxyAlv4NOXkoybATyHnOLYlxvJjbjCaLJwN6F10ewQkxkRPVlQOR/ECD8clhoLFu5qi2y87AdyN5iJHkPOekhwvguEAVpNyTPTUwKNkWoqQE07R659OgVvmLzv5+S0qF0zmBNK/kfQueEE9ABXyg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVdQVzFLZXhFQi96MWlkT0RVU0syRFNCMy95b09CeTlCWmhmTEI0REhpQXkr?=
 =?utf-8?B?OTdtTFJUQ1RuRjgwZEV4MElyL3UrcStodUE1L0gvWWFmbzh6dTFtS1l2eVJl?=
 =?utf-8?B?K1Y0enhBQ3dVcWVBSWJPb2Z3VVJUTndsTDMvMWphY3VmRUgyNTlIVS9sMkpF?=
 =?utf-8?B?VVo3c24zWTYxZ0hOb2cxTEQ1VGk2UllGV2YwMjc2REVseUMrVkJaOUdOOGQ2?=
 =?utf-8?B?NTlSVWFGL28wSGV5dmh0eTZwME00czlZSEpVZUUvYXNGZ3VNbERmTWFsMzEw?=
 =?utf-8?B?cEwxNkxFZjU4cng2NFJPUEZPRWtuNUNlQXB3VXB6b3R4cCtEbkRHS0s3a3Jj?=
 =?utf-8?B?bmlqeWJoY1hTbWpZV0lNc0NuWVVtSnZwLzl2bEtVUTljNzZubS8xUzRFTDls?=
 =?utf-8?B?QllzQSs3N09GdHpVTUVWNFNkdTIwSUw5V2NBNk1NUHZVOEkyYSs2QjhFVnhP?=
 =?utf-8?B?Y2R0NlNzbzQvTU9qaGd5dytRWGZzc0R6K2QyMzI1Z3haMGZmZkhFU0tOMFRo?=
 =?utf-8?B?eGhMR256MzNXR0VnT1dZRTFEZWpndnFsZkNKS0EyV1RiZnVUc0dRMXpMUldt?=
 =?utf-8?B?VjNsWEJtRTFML0hmRnNScjRqZzB3UXdIMmxaQWJNZks2L1NUU0VjM3VPQy9W?=
 =?utf-8?B?RThOUTNjWU1rQkNHbzF4ZlIraGRmTHk3QzdFVEgwRDJjRTI3RzkyY01LVytk?=
 =?utf-8?B?Z3NkSlluSmlHL3F4WXlVYnc4YlJxbUhOQUZZaEhHOGZneEhFaGZIdG5BekMx?=
 =?utf-8?B?bkJVL2ZkYTdVaWhNNEJyOExvRDNZaEVVR1RmVGFYQVZ0V2U5U01ZV1BuU0ph?=
 =?utf-8?B?OTFhc0lKait4QTY0VDhzazhyeHVCZlpnY3NvSlZXdDBzcXRWRWwwNEhHZW1Y?=
 =?utf-8?B?VFRxTVhQbHNSTmlmSE90Sk4xNkNFR1AzOG41bWVEbWZPMUUxYlVHN0h5M3ZW?=
 =?utf-8?B?QndGL2pKNGlzZ0NlWjN5bll2VE1Db2lXSzlzZ2k0RUJpRmVoKzUwOUQyWU5W?=
 =?utf-8?B?cXFJRGJOaXhJazgzOGFRUTlPRVM4UjdPVzdCWW5EL3dmS0NJRkJZQm9CaUdV?=
 =?utf-8?B?anVCdEZ1Z0kvb2p6KzhNTEJPL0ZmaStiM1dza2xXZFRQaUhxZGltL2lsZldh?=
 =?utf-8?B?TnFFemwrbFprQi9iTmoycnc1Z2tXYXUrU0Q1Z3I0NDBXdEw5YWFkVGl6UWNB?=
 =?utf-8?B?S0RBV3Y0SXdCRnBOMG1hd2J6dzJjT3Iza3ErRytHVVBzeHNzQ2J0K3JQNFMz?=
 =?utf-8?B?ZWM5RzVLcUl0TWRXbm5zZDhsT1AyOGdkREt4OFF1bDhkbi9lQkk1VnVLTkgy?=
 =?utf-8?B?K3ZDS2xYelE3Yzc0OUhjOU4yZnNjS25kc2V0aVdGbEkrYVJ4b2VTdkFPcDBj?=
 =?utf-8?B?RzBPbTZiaVBVWkVtZmduYTZFK2ZpSEV1amlDQXQ1Snk4L2QrSU1FTmV3ajhM?=
 =?utf-8?B?djNDZjh1TGNjU05GTEJIcUtEUHlhcGdFbmh3U1ZJWWpUUlIwS1lKTGE4b0Fr?=
 =?utf-8?B?SS9odlNMaDJKREdLS3oyaktpZHJQYXNKYzNnbTJXcUFZUStNeDd3NHRRakxv?=
 =?utf-8?B?Zy9mUWtOZ3JyVnA2VUN6a3NKVFBNeEFzT0NJZkRyRzVJV3I0YllqTmtlblhU?=
 =?utf-8?B?KzBWaXZYR0pYcnUwTEZyRXJjY0ZmMU1GdFpZZmtLQ2hkTi80U21zVVM4blpD?=
 =?utf-8?B?QjNYOUhnRkx2RFdHZ2lsNHR5aTIvbnJFeVNQZ0YrZFJUYXdxTERvMlhTTDZQ?=
 =?utf-8?B?UlB2cU8ydG0zQ2Y0MkZCOTRIdHlNSFJ0cEFJUlZaQU43T0NBVFRWaWQ3ckk5?=
 =?utf-8?B?WjYwTTRxVCt2S3MzZEVyNDNxekNBeVp0TmZLajYrYzArQjRUbll4ZFYwRHk1?=
 =?utf-8?B?TEhJUnl3MDhDWURZa0R5a2xhdWMwOXZuWFdORUMxbWZFUWxaTURmR2FLSjFi?=
 =?utf-8?B?WkgwZVZGYWNpY2l6MWpMbHBPendRRE1Qd3lVRFlDTlFKM1Q5VUpjbnRoNFFW?=
 =?utf-8?B?bFVLalhlcExnL2M0R1JwQk9lczM4RzBRVTBCZ1dtWmFKVHFRZ3lBQXZnK1dy?=
 =?utf-8?B?ZUJweUprelVOM0FkNjZIbnQ3T2xva0NtWGJ2U3pwMm16QVdIaTRUc1ZNYmlH?=
 =?utf-8?B?eWVKQjFudDZKeS9sRVhONTM0Z21oTHRDeE04SCtQQWxqRU9tYWd3MlRWQUNN?=
 =?utf-8?B?U004T1M4TUFTK2JERkl5NDNUSTdQSGJBWFVnSFZLbEViYW81Z2NnMzIwTzUw?=
 =?utf-8?B?amFCWkdzTUtPd042QVV0RTNrZmM3MGIvWEQ5SlZvNzkrb2pxN0pMQnNLRGND?=
 =?utf-8?B?Z1lUYnpxTjRoV2tBdXN6WUgwY25nd01POWNDUVZHUy9NYi9qWHBFWm4rc3ZH?=
 =?utf-8?Q?Jm2Im2FY4e87OhrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A53733EABD96EC44AD871F8CDDFF0E18@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Tx7pco6SB3y/+A/8cBQA2DX57ZnDHhlq+cT5+equpVhFHWlkTn2CYsSAcQ81/xLpmQGCU/A77BC3vN7FapCTa9SokSapyTO9Xi6aPstsEtl5OsLMICKKyOFOv1gdZf+jf+hLV+WNN0LUwVcx4NNW0H2qC2SbE1HE01krgGPz23g6r/J1fMw+vZpjxB2iPDDV9V7Aim5pOc5vIWy8xjPtVbPSLFYp3hpPSeX9DtoZW6SG+E7/6Yek6TDUNGfN5Uk/y5J1l/1VrIbP6bSaBkKFBoiYJPKmNU/rCfM4V2VxRtI4U5Z4gqQKccuXiEjtazWrIhG5MgE6uARzSvL0M5Qm5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7085ecac-ae15-4bd9-7309-08df4c1a52b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 00:06:44.9835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxHNBXQ3zpImfKMWXGVW9Gf3zrb57l93oxLladW/RsOPyOsv28rRwAVLhr5ddAcOwvEgQjXj89tmZ2WedzJFM8bfKgmZetMgv79dG+lp0x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6684
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_160659_679840_B1564105 
X-CRM114-Status: GOOD (  11.28  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmVsaXgsDQoNCigxKSBUaGUgY2hhbm5lbC1pZGxlIGNvdW50ZXIgaW4gRlcgd2FzIGluIHNs
b3QgdW5pdHMgKG9uZSBzbG90ID0gOSB1cyksDQpidXQgdGhlIGZpcm13YXJlIGFscmVhZHkgc2Nh
bGVzIGl0IHRvIG1pY3Jvc2Vjb25kcyBiZWZvcmUgcmVwb3J0aW5nIHRvDQpEcml2ZXIuwqANCldo
aWxlIHRoZSAnYnVzeScgdGltZSBzdGF0cyB3ZXJlIGFscmVhZHkgcHJvdmlkZWQgaW4gcmVhbCBt
aWNyby0NCnNlY29uZHMuDQoNClNvIHRoaXMgcGFydCBmb3IgJ2J1c3kgKyBpZGxlJyBzaG91bGQg
YmUgYWN0dWFsIHRpbWUuDQoNCigyKSBZZXMsIHlvdSBhcmUgcmlnaHQgYWJvdXQgdGhlIE1MTyBi
YW5kIDAgYW5kIGJhbmQgMSBpc3N1ZSBmb3IgdGhlDQpzY2FuIGRvbmUgcmVwb3J0IGZyb20gb3Vy
IEZXLiAgSSB3aWxsIGZpeCB0aGlzIHBhcnQgYW5kIGxldCB5b3Uga25vdw0KZm9yIG5ldyB1cGRh
dGVzIG9uY2Ugc3VibWl0dGVkIHRvIHVwc3RyZWFtIGFnYWluLg0KDQpUaGFua3MsDQpNaWNoYWVs
Lg0KDQoNCj4gSGksDQo+IEkndmUgdGVzdGVkIGEgcmViYXNlZCB2ZXJzaW9uIG9mIHRoaXMgcGF0
Y2ggd2l0aCBmaXJtd2FyZSAyMDI2MDgxMw0KPiBhbmQgDQo+IGZvdW5kIGEgZmV3IGRpc2NyZXBh
bmNpZXM6DQo+IA0KPiAtIHRoZSBpZGxlIGNvdW50ZXIgc2VlbXMgdG8gY291bnQgc2xvdHMgb2Yg
YWJvdXQgOCB1cywgbm90DQo+IG1pY3Jvc2Vjb25kcywgDQo+IHNvIGJ1c3kgKyBpZGxlIGdpdmVz
IGFib3V0IDEvOCBvZiByZWFsIHRpbWUuDQo+IC0gdGhlIGNvZGUgYWx3YXlzIHF1ZXJpZXMgYmFu
ZMKgMC4gV2l0aCBNTE8sIHRoZSBmaXJtd2FyZSBwdXRzIHRoZQ0KPiBzZWNvbmQgDQo+IGxpbmsg
b24gYmFuZCAxLCBzbyB0aGF0IGxpbmsncyBhaXJ0aW1lIGlzIG1pc3NlZC4NCj4gDQo+IFRoYW5r
cywNCj4gDQo+IC0gRmVsaXgNCg0K

