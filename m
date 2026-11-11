Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317A606A886
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2j7Ro8if;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jzsI92V5;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=ApVptqvK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BE91dv9EtHLdqb8Zv1rDnjsz969zkwaPxE5lGWRJpgg=; b=2j7Ro8if0/y/Q8+eh/SfSIoelb
	9n2x+wTzdETx9IawY104ljil0jthQL/J1Qm+cI3Vdr9b2Gox7D/BWOOPcabzVeO+qJwYylNHsq9rV
	BI36xMeVNqvzoOzWDvKgmLBDJ2MPGSDUNNpgKl17kJ9yhle2f7htr25emZ6WlLhKAHz+oUdNUhs06
	JIrGKJ2+NGkvkXMWaX5fWd61feOoFgjZoEWHR1Npyi+t2tg+SRzU8sqBVX58SelmoGGnilfg71bJX
	AkMaCW1AteObACx0VTKw8P/xFlFrh4G9FFKLKmeilpD46/3o8zJRpjBBhGkwSM9RreWyrh6Tn7xnE
	a25vKcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR84v-00000006mTH-49Cf;
	Wed, 11 Nov 2026 13:09:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR84u-00000006mSp-0Eu6;
	Wed, 11 Nov 2026 13:09:29 +0000
X-UUID: 1bf53a58ddd111f1afed4741b24580c9-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BE91dv9EtHLdqb8Zv1rDnjsz969zkwaPxE5lGWRJpgg=;
	b=jzsI92V5rGWEhhvrBysFIEREaTO9LnVzOrE/Dml7MTnSWIfsllfDbqx00gT+tzz45vhofdFpCkqwlnQRTVYxWeTQcC0yQWL7SKaLutUKGK3qovye73tl0GAoDU1fjN4sFHCbrOMUOTXf7TUyZ7F5A2t7SSe6IUAkXRycAFIu2Ig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:669aea30-547b-45ee-a5ed-3d6424b59bcd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:75b3b530-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1bf53a58ddd111f1afed4741b24580c9-20261111
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 435410417; Wed, 11 Nov 2026 06:09:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 21:09:18 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 21:09:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlE+oVs/Z4Q2V8mg8bAIM8M2n6uUGnvf6LhQglilgEkzOHLjh2JPJ6kgI2MCWg+7hNcH6g3xSxwTQtT7Dwchf9HHmxxQQLf0Qe4f/3TP9gEQDFpsNGlYDmsS09Db+njtNr1aVh4ogbxSyr6WLU9JhrIk6gVXcnEIVlHcyizUCGSaPt1w/CrEC+X17b3FXMsye1FOHUkyPtW8qRTv8Cpiskhj+oqSGP1PcUvOjO5Ijfl5fZ2RmbB5xvMdkyy4THW7t6ENncYMBLyS1+q5pwbAzj8xoxGM9dFNRxFZ+PDAK1wChbkYYuL23qDcse2zH+mpg68fZSGg425+5F1CufKvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE91dv9EtHLdqb8Zv1rDnjsz969zkwaPxE5lGWRJpgg=;
 b=ZNVJVEAiVPBnYYoOh5cvHtZUxJFmbOPDgW2yO59M9UuZ9xjm1c8qV5X9Vtq0tSk4s80imzgHM4NqRR1wOuV8O5w0FiKrbdSjLq7LC9rnMfSykLcW8dAe6tZrD/qmqKgjzwcxA3ftHPZqCKYUpA98NuZ/1zs6KsfG2bYffnIWtFMXAlnQ+qAWbXyWfW682+HqtDDwKSttqvDM48h96ZjBmrpdT/htDK6sB3hw82LrBk7s89dJSpMbKgj/8U5F6Ovp9+t2TRhkaz+MRB6q+tj9bdpJDNw6OdNLX/eHOEc2lYmq/vSpp+9CyJ2J31pgeYZy44djIpjtZmuSHZrOl6AuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE91dv9EtHLdqb8Zv1rDnjsz969zkwaPxE5lGWRJpgg=;
 b=ApVptqvKFYyYpCiEnz96FMzzOFt8E6FOBpAyHtIq6/5a7oIS/Llt23qqyN1SWTRQM/oYpwvvOy/Cnkzviif4SnX047f6elszvfuYNo2avidt+0vfw+aboVXVAPR/JiyeVT6MhvBuDpY2twQy3Eq0fcWrGYgeu2OEKYlhwGbVxuQ=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by KUXPR03MB10478.apcprd03.prod.outlook.com (2603:1096:d10:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 13:09:16 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:09:16 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"sven@kernel.org" <sven@kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Topic: [PATCH 1/4] thunderbolt: add platform nhi driver
Thread-Index: AQHdaEhJ4pguqtEuU069KUF8fxIinrcjBRKAgAXmEYA=
Date: Wed, 11 Nov 2026 13:09:15 +0000
Message-ID: <9a604d06738e13250413a844e2af2c6895162068.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
	 <179407827117.165429.11777170722243752189.b4-review@b4>
In-Reply-To: <179407827117.165429.11777170722243752189.b4-review@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|KUXPR03MB10478:EE_
x-ms-office365-filtering-correlation-id: be131c20-e892-4a81-dadc-08df3ff4fd0a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021135927099003|261028144727099003|261009223027099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: NOqpZikqlpFxkYc4dQul3zownhES25bt4bZ3IuYiGMwnf9h8y7uqUL/mEr+XCDhEy8PhJp+89HE9LMxJOKHQx/Ooic3iL+eO65iiMho/i70a4FqlstFi9eEy2xWN0RrSB5TvpJ9DxmFHPH5KCgLJbB1Wqy4oPM8dBgqO4WVGzDkeHMxKMSDVm/GunffIKXSzrNo8I1Jf3dEKrg5mmGwEcT+270L4u+CnaTwcRs0BR2C5lTjFonNfyhyAsqILX7Wn28dCKXuBTPPvOW8kbtFXVghe0BKCEzyfiZ/aLLddzlfeF9uwHSFpR8fGzx5tMiwA2gi3C0doCwW922aAtrR+SPzCAz62qZNBJBHeJ3K+Y8R5rmynd9QlQAIi+5l5xUdX5T1lcYbsv+/pbxOvfpxITUOLZ64v16qj10sSxHDhYN196jFmVBZlkGsuqqbd1pNC+QTIiL+DKx1czY/RzSpOMM3IsKx6ZtTpbgO1kMmzCqwt/KZ8gvoqHvEgFUb9YtV9EHklAizbILJy95+NL9Na+KWhblP5a9UEbQLws5pd79N2e8H/AAzlSAJlaENgdhJeZq4VWh1VCX36BBW2khc76CSInq1MLChgZdN7bKsZrYdTiMhugHy4ObybwS5mWgpBXvhwl3pP8gkzFsUJBDyHTw5KDJWvelIey5idW+4DOio=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021135927099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SS83R2NVOUM3dmJBanJhVVBra0RmS3FGYXQzOTdNeHZlYjkra1Vva0hMUU5B?=
 =?utf-8?B?M0xIK2pPVkVieWE0eWMzeHJ3bC83RFY5MWg2RGh5ZUl6NWRET3NJc2VzVGZM?=
 =?utf-8?B?WENqUHdycGNnMFZ3WHJSTWhnMXZ5N2EybVZRVDIrNTZkQzRiYjZMOUhpUnBM?=
 =?utf-8?B?dktkWm14VlFnUUZueVVraEZ3bkpBWW4rVzdsck9sWTk4UWNvQ3FhQWlLQ2hY?=
 =?utf-8?B?Tm1ET3gyc2VhS2FkdW1CdlowY2JMa0M5bGJ4QVhOcTdod21UWkMyT2ZqMjdu?=
 =?utf-8?B?VDZaMy9uaDJ2VGhlSzR2T3NkaFJzRTJmS2pobEFZTHg3V1YvRUJyZ2JZR1Ni?=
 =?utf-8?B?bDhvNnRDYUF2U0l4d3MrREZoOWtacExPcjJFZ2tLdXRKYlRoc2I3dDZEeDk2?=
 =?utf-8?B?NTFpR3grN2JJVTJVbHRra3lPZm01Vm0xT0w0em1FcFhydGNaSEZzWW9sbTVQ?=
 =?utf-8?B?YTU4WksyOHIzaFVRSnRJSlVqZXJCZWRyb2x5eWt6aytQNWlyMk5SZVFZdksz?=
 =?utf-8?B?eCsydjB4aFdBVnlJTHoyQktycXVmeUM0cTRoT3V4dXQ2U09ORnJYV2R3eGc2?=
 =?utf-8?B?MGpzSDBmaUw4cHUrdlFPTzFRV3lGMnpaMlRZUjFCZVhyTytjOUF3OFVkZ2V2?=
 =?utf-8?B?Wit5Nmx5clpnMXlkaVhPbFVpYXMvVjk2RG5EM1ZBZ3dIZFlCeWE5T0dIcVZJ?=
 =?utf-8?B?b0tTQmx2OEVKaWhPRmlHcWxGTnlHdjVaejhCbEMyYjYrUkFUVUgxTDNiVDM3?=
 =?utf-8?B?U0kwRDZ3RkNJU3IvdzhsMTBab0lQYWlMSmsrNmFKRThWM0FCejg3UFN5a3F5?=
 =?utf-8?B?WTFjaHFnRm9Cb2h3YVJGaGVZRGxVWTIvQitFTDBpZTdYei9jZU8rMjY4UFdP?=
 =?utf-8?B?UDEwbTRDQzdCRlpFekQxWWgwcUp1ZjFpOEs4QTlBWnJBN2x4YVNGVmxxUW9S?=
 =?utf-8?B?WWxTTW1hUS9OL0Rmdll5M0lMcktZTFRHZlZBN3E0Mis2SUdLTHlEb054dlBn?=
 =?utf-8?B?UE1SSGFocXBiSXdUVE1CRDBxT3p0d1kyNXc5RXZzSE5DOXA2VXgyNkpWSEpo?=
 =?utf-8?B?a3l1NW1WcE5HVWVRMEV3dFZEUHFVNTJweGgyZmYzM3I0R2dGRnQvd0hJQlZn?=
 =?utf-8?B?bE9KR2ZIa0RvdUZFU2c3a0IzOW1OMTcrTFFEQTFPZTA2SjRCeEhESnZ2c25a?=
 =?utf-8?B?MDI5bUJCS05qOEtncTg2N0tRdytZc1k3YzB1K3kzUGJBS04zdU9tbzVEczI2?=
 =?utf-8?B?T2RPVDVLVmYyYzlNSk5IOVBWSXNiRUlrYWRDelRwbHRQemZWNEhubFVLRDhM?=
 =?utf-8?B?YU5Ba3BlLzcwQnVzeWhYZmhRaSs1WHpXQitzaVBidnJCdWZ4b3RENHZ6Ylov?=
 =?utf-8?B?cDgwMmF2ZzJCaWpQY2ZmN3NFZkpLenNMVGpKMkxQeWVJN3J5R2VLZERQRGZu?=
 =?utf-8?B?L2ZFRTBRUzhOaU5rSU5wK1NiYUZPVHh4eldrNVA2aXBXb2lsb0RBeWxjOGdp?=
 =?utf-8?B?M1UzYkRFakJreUxmWktTeUp6UlcvUGkyZEVJeVJ2eTZxU2szVDhJeWo0Z1JP?=
 =?utf-8?B?b0RsRkU4Z01qd0RidGEwb05HaVY0QWtIUm9Fa3ZSUWEyRHRpelhtdXdpdW53?=
 =?utf-8?B?eU4wcmx5ZDUyWXo1SkxJVnA1eXl0NHZjdDZjVTIzS0VabGJrcmZMNmFCR3lD?=
 =?utf-8?B?V0djRVhTTUhVRU9GWHN6bmY0OU91aml6bGNBaEtmOVM1NGJ4WnNXSlVYaFpw?=
 =?utf-8?B?bHJhd2hRL0VlREZxdUdRb2QzUG9zZTdwVTFpUEJ2NnQveEY5MFFyZG5UUWVv?=
 =?utf-8?B?bUpiMm4wMk1zUU9QYTljZm9tcEljNUt3eE1ZbW1EOTRlcDZQWUVtaFpKU2Ra?=
 =?utf-8?B?YnQ4OFZrN1lEZFVSSGdaNWQ4S0pFY2d5Q05YZFVOTTJlWkYyc0E1ams1ODFv?=
 =?utf-8?B?TEM5alVZZVZzYTA4VDdTT2VtNzl3UlNsN0MxYXp0LzQ5ZVZBTWIyaGQxYndB?=
 =?utf-8?B?QjZsVlhXeG4zU3k4ZmQ3dlRiUTlDSkxDYWFzZW9NbGY4dStYYlVmTnM4dmNo?=
 =?utf-8?B?aWpPMVkwWklmNmllcVAwemxPSnIyY3VQN25qdnZVYXBHZ2ErQ1V5VGlRenJT?=
 =?utf-8?B?V1VHbC9vYjlsQXI2blBBUXZYc2ZHak9hWE01cUR1aDF5MmcwWXNwMkh0dWha?=
 =?utf-8?B?QmRHdzRHSHMrVVY4UWdkYlNYanpFOWhCbStnZTBYeDJ6elJoZzh4QnFrNllD?=
 =?utf-8?B?emppSG9FVE5jRm9qMVNMWkFibVVFZVZXZDBTcGdTcC9tajQ2MHBHSnlnWW9U?=
 =?utf-8?B?ZEhvWGJldFVBSUZJTkJkQ0Rqd0g1TXplTkl2VFlscVd6dGJuVHliYTUrcXpR?=
 =?utf-8?Q?cBRYI0Dnxz8nAfrE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12AEFC955FBF25408D6A5875A1D426A4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Me92wPKP+hG4y71WsXH05eanE8bKn3sS/3+8vn4owuzAk4v1/2cJ/utC3Aaw8yoqNumKBXilkYda4nPr9h+13NwQuPRoof8kLJNXs+wGambQTgUlpL3wiRtotY/LWnWC4hzC/ed/9DpNLVwfywm6fIpdrW89tkH9IuHMvjetg4bUdgS3YHG6PjLZjpy1EYFsEhezJ8mRJSVh/FNb9pdqRilWA3doQLQMS5BjrNojcfcRu9hlSkPF398hBB+F/TFhwYnn/2rdC96Vq9D+2Quxflbat5XJES1tzXka+6pgult4CDAXMrgqerHep1s9zLXbzo1uYnlYpcuwVKP4w2WTbg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be131c20-e892-4a81-dadc-08df3ff4fd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:09:15.9585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chr/u3AyTOwpVCZhsEloZKL7E4coAahGKGGSjTXs4w98zrUjcMIjzuLgH82n4TQSzt0kR5FiI5Pz7K9ipBv3fOMyX64FrMW8plLyf5nqKac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10478
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050928_124479_7551DB73 
X-CRM114-Status: GOOD (  24.73  )
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

T24g5YWtLCAyMDI2LTExLTA3IGF0IDIwOjA0ICswMTAwLCBTdmVuIFBldGVyIHdyb3RlOg0KPiA+
IEFkZCBhIG5ldyBmaWxlIHBsYXQuYyB0byByZWdpc3RlciBwbGF0Zm9ybSBOSEkgZHJpdmVyIGZv
ciBNZWRpYVRlaw0KPiA+IG10ODkwMS9tdDg5OTIgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gDQo+IA0K
PiBbLi4uXQ0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIG5oaV9wbGF0X3NodXRkb3duKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArCW5oaV9wbGF0X2RvX3Jl
bW92ZShwZGV2LCB0cnVlKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArDQo+ID4gKyNpZmRlZiBDT05G
SUdfT0YNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbmhpX3BsYXRfb2Zf
bWF0Y2hbXSA9IHsNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAidGh1bmRlcmJvbHQtcGxhdGZvcm0i
IH0sDQo+IA0KPiBEbyB5b3UgYWxyZWFkeSBoYXZlIGhhcmR3YXJlIHRoYXQgcHJvYmVzIHZpYSBk
ZXZpY2UgdHJlZT8gWW91J2xsIGhhdmUNCj4gdG8NCj4gd3JpdGUgYmluZGluZ3MgYW5kIGdldCB0
aGVtIHJldmlld2VkIGJlZm9yZSBhZGRpbmcgYW55IGNvbXBhdGlibGUNCj4gaGVyZS4NCj4gR2Vu
ZXJpYyBvbmVzIGxpa2UgeW91IHVzZWQgaGVyZSBhcmVuJ3QgdXN1YWxseSBhbGxvd2VkLg0KPiAN
Cj4gSWYgeW91IGRvbid0IGhhdmUgYSBkdHMgYmFzZWQgcGxhdGZvcm0gSSdkIHByb2JhYmx5IGRy
b3AgdGhpcyzCoA0KTWFrZSBzZW5zZSwgY3VycmVudGx5IHdlIG9ubHkgdXNlIHRoaXMgZHJpdmVy
IG9uIEFDUEktYmFzZSBwbGF0Zm9ybXMNCndoZXJlIHRoZSB2ZW5kb3Itc3BlY2lmaWMgcG93ZXIv
Y2xvY2svcGh5IHNlcXVlbmNpbmcgaXMgYWJzdHJhY3RlZCBieQ0KZmlybXdhcmUgKHRoZSBkZWRp
Y2F0ZWQgd2FrZXVwIGlycSBtYXkgYmUgdmVuZG9yLXNwZWNpZmljIGR1ZSB0byBub3QNCmRlZmlu
ZWQgaW4gc3BlYyksIGFuZCB3ZSBkb24ndCBoYXZlIGEgRFQtYmFzZWQgcGxhdGZvcm0gZXhlcmNp
c2luZyB0aGlzDQp5ZXQuDQoNCkkgd2lsbCBkcm9wIHRoZSBPRiBtYXRjaCB0YWJsZSBpbiB0aGUg
bmV4dCB2ZXJzaW9uIGFuZCBrZWVwIGl0IGZvY3Vlc2QNCm9uIEFDUEkgZm9yIG5vdy4NCg0KPiBu
b3QgbXVjaCBvZg0KPiB0aGlzIGNvZGUgaGVyZSBpcyBlLmcuIHJlLXVzYWJsZSBmb3IgQXBwbGUg
c2luY2UgdGhleSBsaWtlIHRvIHRoaW5rDQo+IHZlcnkNCj4gZGlmZmVyZW50LCBzZWUgbXkgc2Vy
aWVzIGluIFsxXSB0aGF0IEkgY2FuIHBpY2sgdXAgYWdhaW4gbm93IHRoYXQgd2UNCj4gbWFkZSBw
cm9ncmVzcyBvbiBob3cgdG8gcmVwcmVzZW50IGNvbm5lY3Rpb25zIGJldHdlZW4gdGhlIE5ISSBh
bmQgdGhlDQo+IHByb3RvY29sIGFkYXB0ZXJzLg0KWWVzLCBJIGFscmVhZHkgbG9va2VkIHRocm91
Z2ggeW91ciBzZXJpZXMgd2hlbiBwcmVwYXJlIHRoZXNlIHBhdGNoZXMsDQp0aGFua3MNCg0KPiAN
Cj4gTm90IHN1cmUgYWJvdXQgcXVhbGNvbSBzaW5jZSBJIGhhdmVuJ3Qgc2VlbiBhIHNlcmllcyBm
b3IgdGhlIE5ISSB5ZXQNCj4gYnV0DQo+IEknbSBzdXJlIEtvbnJhZCBjYW4gY29tbWVudCB0aGVy
ZS4gSSBraW5kYSBleHBlY3QgdGhhdCBpdCB3b24ndCBoYXZlDQo+IG11Y2ggc2hhcmVkIGNvZGUg
ZWl0aGVyLg0KPiANCj4gVGFrZSBhIGxvb2sgYXQgZS5nLiBtb3JlIHJlY2VudCBkcml2ZXJzIGlu
IGRyaXZlcnMvdXNiL2R3YzM6IFRoZXkNCj4gdXN1YWxseSBhZGQgYSBkd2MzLSR2ZW5kb3IuYyBm
aWxlIHRoYXQgdGFrZXMgY2FyZSBvZiBhbGwgdGhlDQo+IHZlbmRvci1zcGVjaWZpYyBxdWlya3Mg
YW5kIHRoYXQgZW5kcyB1cCBiZWluZyBuaWNlciB0aGFuIGEgc2luZ2xlDQo+IHBsYXRmb3JtLmMg
ZmlsZSB3aXRoIHRvbnMgb2YgcXVpcmtzIGFuZCBzZXBhcmF0ZSBjb2RlIHBhdGhzIGZvciBlYWNo
DQo+IGFuZA0KPiBldmVyeSB2ZW5kb3IuDQo+IA0KPiANCj4gU3Zlbg0KPiANCj4gDQo+IFsxXQ0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hc2FoaS8yMDI2MDkwNi1iNC1hcHBsZS1zb2MtdGJ0
LXYyLTAtMWY4MDA4NWY5M2ZiQGtlcm5lbC5vcmcvDQo+IMKgDQo+IA0KDQo=

