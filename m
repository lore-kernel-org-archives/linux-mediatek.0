Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E3C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfDpX6TTsPmoGU6BJjKmRpYgcb7i6842OUjhvF8/lgE=; b=T9phkbaqImLWLQc8/QiVzJW1LK
	5loiU0UutDksrVJyODNo0BOFy7RoPPfs35Ijzes2Qjgbsg523l6CmcDL5/NrQ1tqigjj4oMR8F+hK
	SO5KYMnYKaPij7HpHcsRFWPVmBSH/qYudZcnKsp4m+PrSpaCnGKIOGn2bIl1vC36T6YVWVofl45QU
	cHDW+pRcGP9ySCAi66xHV6Jc1dC2cHEU9FFt0vZcPuYgCQKVxToS864+sZWwkHtUFxHGJuFQ5hN/l
	DWWOEewrDvu4ko8WPRy91WunsIZhexDmJZ7EYPPpJi7OanGyTVg/LVUt5bJ2qCaHW9Z5svFvKaFwp
	yZsWntOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKQE-0000000Ac5b-22z3;
	Fri, 09 Aug 2024 07:52:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKPI-0000000AbwA-3syE;
	Fri, 09 Aug 2024 07:51:30 +0000
X-UUID: 2adbd6b2562411ef955bff358274dad2-20240809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VfDpX6TTsPmoGU6BJjKmRpYgcb7i6842OUjhvF8/lgE=;
	b=knLXgRKsm8czCNIZTJXg5yFsC0pd8iUntRHyBgl+iPek+LLPaZINOGsHz+W3VFVHV21VGZUTNBT5ZKKiVv6t18KDUXG4k075pt2u30IHoGw+A1HgXK8RYRjKaZj5K0k/8d/ugn2xVRcU9g8J0UhW9Sm4afCKo4EXidikw/7xZm0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:42f52d15-78cc-4628-bff4-72ff32227f73,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d4d7f53d-6aa5-4057-84d5-0e7d47251781,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2adbd6b2562411ef955bff358274dad2-20240809
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 947651908; Fri, 09 Aug 2024 00:51:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 9 Aug 2024 00:50:43 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 9 Aug 2024 15:50:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwBz+QtlfHPgIwRnG9UjRFx9CQEupzFPUKFOI+zJAf3ohWsQ1y+/MKzUXNEoJDZdC/22uAPmT44CNReObovwLkj3pnFRxZqg48hXk1nJmmdmktnm9mzCYJrzxlkJKBxpDmuO9mrM0OdZr13WGd+FasoaXDc7XvYWm89e+c5qhu9T1IIH3TU0QfkU434wCpuPZgNi6ZQ+MHiZK9ZJVAcFbvwGWkmAScZ9WiMLXjSMlpmdarGUjmdv8GQODRxrMnnI316mANg63Ij33Yt656eEtwCyOK/L/7QavgYCgMxnTB5yH4JsoXbjoR4QPEFCagOMI+8TelmX4LVwJsX6rs8kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfDpX6TTsPmoGU6BJjKmRpYgcb7i6842OUjhvF8/lgE=;
 b=YSsPEKPf8rcxKICAmHD4Rqsn3m69rHDI4qNx5fng++Li8e+E2OBIsezU4RdU4Q6SXnF+GXpIFcKnPvJsBqdE1VSAgqDZOXLHirP9jDI0PoEv9YAmfSLIJva7VpimjoKe1248hBTcov9KSQDt6ZVlUWWvIQFcDL1KHwE4ZA/bd5EcP8MsUd1iXEBLZ72Wkw2DhIwnjUuM0iuErUgCuRXdpqO6ikkZgHdEFukj7wBf/7bjY4qzRLR26QhVUMSlf80K7W4YgRPo96WtNtbeR9Kfk5VBSo/o0VOz+3MBEWNINyWY54cVXZOlQgby2ltEV/jUAFL4i6IBUrxbQJHnv8MkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfDpX6TTsPmoGU6BJjKmRpYgcb7i6842OUjhvF8/lgE=;
 b=lsXsUYbNZm2GHPJopwp3ZSIBtJGp/HBqe2Sas/5HH3kRt1sIK4oxqlCb7o//oSuMJ/4NkAPZt05tcTnZZh4vPoE9sIsWwJ2ZWmZfnmeyIAsnoSeuq9lKSNdGs03pqyxZfGt4Jls8qpU3d+6TzfrBUzDo6H2POhpRGDiK1R2yRn8=
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com (2603:1096:400:465::7)
 by SI2PR03MB6463.apcprd03.prod.outlook.com (2603:1096:4:1a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 07:50:41 +0000
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::f95:7de7:753d:4b9]) by TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::f95:7de7:753d:4b9%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 07:50:41 +0000
From: =?utf-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>
To: "tj@kernel.org" <tj@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"boris@bur.io" <boris@bur.io>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "cgroups@vger.kernel.org"
	<cgroups@vger.kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>,
	=?utf-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4] blk-cgroup: Replace u64 sync with spinlock for iostat
Thread-Topic: [PATCH v4] blk-cgroup: Replace u64 sync with spinlock for iostat
Thread-Index: AQHa2O5aruOvW4TdxkyHU/91XL9eyrH8/V0AgABMBgCAAQfXgIAKGNoAgAdXXoCADu5ZAA==
Date: Fri, 9 Aug 2024 07:50:41 +0000
Message-ID: <4f06abd438009266997bd41901c05c9139e19472.camel@mediatek.com>
References: <20240718084112.12202-1-boy.wu@mediatek.com>
	 <ZpmF8HJsuefjC7Xr@slm.duckdns.org>
	 <00c595a16b4e96ae56973ac2ce586f6ad736059f.camel@mediatek.com>
	 <ZpqjCVxSAV-Q7Yhy@slm.duckdns.org>
	 <e944e61fb64e5094aa6a0afef652359734619ba5.camel@mediatek.com>
	 <ZqlD5WXx39E8xVnA@slm.duckdns.org>
In-Reply-To: <ZqlD5WXx39E8xVnA@slm.duckdns.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7867:EE_|SI2PR03MB6463:EE_
x-ms-office365-filtering-correlation-id: 62cf3a45-ad64-4c77-404e-08dcb847f780
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVFUUWw2UHcvT0xwNnQ2YjhRaXZ6VWxxMUl3NFQ2NDNNMGlkK0dUNkM4Wm81?=
 =?utf-8?B?NlpRZm5BeWNob3l4ZkR5V3VSM3RYRTAyV3JkSFJML0szdXk4Y0RiM2lnSWYw?=
 =?utf-8?B?V2tjUVdsMDVZenljVW5IVEpmb3dIcU12encvczh4M3BGYllFVjdEaGh5cUJX?=
 =?utf-8?B?OGJHdlpQRjlEK0FqY2xtK05TZ2QxcDYvWm8wQzUyM05KY3o2NW9mbHdubU40?=
 =?utf-8?B?d0ErQVZCTmJkbEhKOVpOSXRNd1Myb3Y1UituZU5qL244M2pJSmdEbTlGYmp2?=
 =?utf-8?B?clA4M0psanFnK3FuYkUxbkQ3YmlSRmk5UnVJNm1tL1JXejRYd01ValZvd2tM?=
 =?utf-8?B?b0IzMUhKNHdhcFAvQkw3aVBKdCtSOE9yeGM2L1hUQzJJcFdYei9XZjZzdWJ2?=
 =?utf-8?B?OEV0LzFtU3YrT1R0WEp6bjJSTThDRXVQTTA1SWlNN0xicWJrQTdNWXk5Tjhj?=
 =?utf-8?B?WEFxeTBzME9vMkRYY0krRTNmV0RUOGxiTkpOZzUzSVpEMm5NSWt1T3ZlNHpI?=
 =?utf-8?B?bXBQRzNZOU9kRWFWVCs1SmVHM3Bwa0lUUFIvZ2tkdlFVblJsMjhaT0pCUndJ?=
 =?utf-8?B?R21TVGVBbytPdmVTSXZKS3RtWlFQNjIvbFoxRnhzSm9GdjQ1VjJDcjk3eXJt?=
 =?utf-8?B?TnlKeUgxWUQ3YVY2bkhoUFFtWEEwWDh6eTJ4SDkwYTZRTE9BbDJTeGg1UUxY?=
 =?utf-8?B?OFJ4R0loSFFHdjduVUtqbndXWXczdGIwaVIwa0RpV0h0RTkxQTBhbml2NDJO?=
 =?utf-8?B?NTJYaGRzT2RCZnZXU3Zxb0JWMzJzdTRSUUtzSW9ib0syZnJnTFhYVTNNejJI?=
 =?utf-8?B?MmlSOG9RVlQwRVpoUGlZZGNSV1RabWk2NTFPckJPRmUyeGl0ajBqK3ovTEh0?=
 =?utf-8?B?bEJNZTNYQ3V4K1JodHFJazA1NW96RzFyOGYzR1hTeHNrV0QrQ3lmU0UxTFFn?=
 =?utf-8?B?cHNqenJLaktwdjR5bHBBeVJqZUhxd1I5c0tBSG1zb3RaSm01eVBxWGpWVUpq?=
 =?utf-8?B?U0hHQ1lPQ042cVhLaWRVNG9VSlNvUGJPT0p4M1dydDF5RDdXYU1MY0gxUi9u?=
 =?utf-8?B?TWdITHZOK0pYWFBBZE5GZW1ndmZzOXJzSG5TKzZFbDF1Z3hKWlNrOGVOSVls?=
 =?utf-8?B?OWFUcW9PQWRGNUt3YVpoWFVFSU16eGdxWUozNUJxQTRJTlFUQ2RUUEphYWNM?=
 =?utf-8?B?by9TTCs1czhOVktRdVhmUnBub0ltaWJjYnNoMG5yNGJ6WVRXaEJ5eDFhR2Nk?=
 =?utf-8?B?S1V6aDZVSFVRVXplcWdPOFlhOXYrQVhOcVpRVkFLeHl1NUhidjhmeEpLZFpN?=
 =?utf-8?B?c0JWRGZ4Y1VyS21zcytiMlFvY0hQT21RLzBIdEJqQ1FNbkVWN1gra2xVOXNQ?=
 =?utf-8?B?b1hqTTZ5R3ZrdGdCU3hFa0JaYmdDUHBNK1pUTXVvbldvckhzaVVyNThNZFpG?=
 =?utf-8?B?WXVWZXMraWZXR2VpOGdDeWNHOGxSNGlrSS9hWUQvU1phMGkyODBaODdLNGYx?=
 =?utf-8?B?bkRlVmRkVkFqODNERXFGOTA0cWh3bytGV3oyeDZPeHg4WDJ6anNZSlNBK3Nu?=
 =?utf-8?B?VS84Z3NIM2QrRnRFQXJKOFJSbmU2Q21aRWQ4Vkxvd0wzOWg1YUFNeXNES29X?=
 =?utf-8?B?cndOb2x4T2VQWXRrYlljL3NNSUcreFhwaEFnb0V6MHhzR1MzMmtqVFJGUDAw?=
 =?utf-8?B?Tm9HRVphVTYvK3VvOGphTm1CdFI4cVhTU0c3NTFKS21GdVdNVm53K2F1Z2Ev?=
 =?utf-8?B?SlJFYmYwUFRoNUlLeFgycXJ1UjNIMXpIVVFrcVlwUVpEY2tkcVk4VjN4WDdv?=
 =?utf-8?Q?82CX8OhVWGoqIM/cJAX09E7ooxGcHy+tNHW3I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7867.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtlVC9YdmlyZmcreGdFWERWcGdqVTFBOE5Za0dhWFhsL2FqT1ZjWW43QWVh?=
 =?utf-8?B?VzQ4SW10R01DT0RraExaTGJ1ZTdETCtlSGh1VHU5U0RCaE5DSThOTUNwVHdz?=
 =?utf-8?B?dXc2V01xRC9xeWFPUmxhQVB5OEpzWjlTMTR3VWFGSjZkb3J0eTQ1a0Z6cGRQ?=
 =?utf-8?B?bDV5Qkh0bjROa05weS9ENHN2MDNxbklqZFBQMEZpaWR1Rjg2UFJ6M3RTYTFK?=
 =?utf-8?B?L1YxeUFVa2RaL2REWEtVNEhucXRsQnNDcTVEMFFteVdWV2luRkVyL0grV2hF?=
 =?utf-8?B?MzdaVmY3QUFycWlvcmJsTXZBU1UzWmNLRFdyU3lWZHRLZ3d5dDJjN3FnRVZJ?=
 =?utf-8?B?WVhsNTJJb1BHWUh2c2hDUU05clp1cmJRNGhFNG90TTY0T013Q2hJRDkzbGx0?=
 =?utf-8?B?ZnYvTEh6Umo2QjBJUWVGaFVaVDc3MXJNb0p4em45Z2NnZExLcnNWd2JoUVZ0?=
 =?utf-8?B?V1pscnhIZkVDcm5WRVB2STBBV1BSVkJZOHlhRkUyaDNyb3pQTkxXNEt4bzd3?=
 =?utf-8?B?cUliQlpkQkd6bHBSU1BlZUdDalNhWWpWU0M4UHJWSk82ZHlROGtUVVBaMUl5?=
 =?utf-8?B?eGd0L2FKWiszOUtid3dHb1B2dGR3ckI0QkIxUTJlb3BhNVl6UEtNZ201MnVU?=
 =?utf-8?B?WEhQbk43UzRrNm1aNXhZMVUralQyRE9wWDY0eXhVRHZYTk1WMkxnUjFzbTJy?=
 =?utf-8?B?aWQydTYvS3ZsZWYxS1A3S2NzNDhmYnNxM2JodTRrT01zVm1qYnRtL0EvSkJy?=
 =?utf-8?B?Ky9XT3FoZElZMGEvNDdKMGV4RDFZcGlDSmNXTXUxQ3N3b2dNaHVpdTkzWEg2?=
 =?utf-8?B?NEREdTRDMWRHZUtLdnNJYVIxT3I2cUhMblgzQ0pKY09xSkZTSURrNDlZWnlt?=
 =?utf-8?B?N3NOT1hIWXorTXJKSTVrWFdieEZCUjBwdFJuZ25xUHYvNnFvbGl2dFhCUDgy?=
 =?utf-8?B?Rmh4dWl6d2lrWVU5c1N0SFB2b0o5Y1BwTGRSdXovbTBxNWsxZitmbENCU1lL?=
 =?utf-8?B?TXlhMXh2TjhLZ2I5Z1VXVmg0czJoaDMrdWFjaEVaODRHNVZQTUVuZmZ4SlVu?=
 =?utf-8?B?b2pnazdveFBXcFlpVEYyUmh3ckVlcW1UMmRUanM3TUFWQ0R6TVVmRXU2R2E5?=
 =?utf-8?B?TW0vczdxVmt1NE93YlpJUHBET3JRMGdBT2lHWGhZY2MxKzkxOTFqZ3hPWDlz?=
 =?utf-8?B?R2ticVV2RjBZUVI1QzI0dm5XdWxOdTk1dDhIV3g5MTcvck1FbjA5NHM2MEUz?=
 =?utf-8?B?aXc2YjkxbFpkSU93WDl1VnFLQ09HdWdyTkowbjZuYXFESU85SExqL3lGSDdI?=
 =?utf-8?B?WmNyazlQMHZNODNpMnBNaU5PNnlxL2lpRkdCOHRKL0xFVjA5aUsxbDU5eTJO?=
 =?utf-8?B?S3RsbXFtcmtiTWdPSGFBOXROR2lHK2lvdjdIS1NiWFVWY29QdEgrNXhvTEZt?=
 =?utf-8?B?cUlhQXBiaVVTWTFsK2RxT3NQeCtSVEx1alJod1ZvNTdWbGxwOTZGNXh6Q1gy?=
 =?utf-8?B?alAxSERsQzRROXpManNXQWxXZ3NTd05ZSjBPQW8zVnBydnNmSVJ5K0FUemdy?=
 =?utf-8?B?ZFZJYTkyK0tmZjRkL0pxQXYrcFZrQVI4UkxhRXRWVEk3NTFmckIrMnJNcmNR?=
 =?utf-8?B?RkpMdmJLYTQ2SElEUzNtNXNZS2hoM2dlYU5rRGVtYWIxNlJUVkxWVWtnMVBa?=
 =?utf-8?B?UHhYUmFtemxsOVlnZHVlOXFoQTM4N2ZyVTIvamFjYlEzZ0pibWpaSExFNytu?=
 =?utf-8?B?YmVCVjZXc1gwK2RqUisyakZUN2VsVzhRNldFcCtvdXJ0WExPdTNaWFQ1ZE15?=
 =?utf-8?B?SzU3RnB6Nmx3Z0RFT3pvd2ZjbzZ1TWJxTHVqazNUL2xRRHBsNW0rL3hnWjk5?=
 =?utf-8?B?RGJRUG1GRUg2eVZRZGlNeGk4TzY0aElpREpzUDNNYnNXNXcyZWd1aVlHSUVS?=
 =?utf-8?B?bWdvQVJIbkdUSXJiN0JTdmFra1p1VHpmNG81M2VsWHNjU0pNMWRkNW9ZTFhm?=
 =?utf-8?B?elBHZkgvV1FSYUxITFZJT1ptM2txK2wvWTQzVFZDRkFFTE41VVk3OVZQMmNa?=
 =?utf-8?B?SSthb08wdlYyZ1hFcXcvV3R5R2F1RXdETjYrNWN0S0c2NUFyeFJ6R1NNY1dG?=
 =?utf-8?Q?LgjGtmfgUK4XiF9KLQ0BHqR51?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61F27D18F469F644B5BF1A4EA7809DE6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7867.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cf3a45-ad64-4c77-404e-08dcb847f780
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 07:50:41.3580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDGtXxrhKUu8g5sPj8VKhNU2SId25sSG0a/Zy6exeU5ot0wQqUQOKUXo+ddbhiMjozSddfvnvhjaMdDqOyLuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_005128_977934_3399B6A7 
X-CRM114-Status: GOOD (  18.01  )
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDA5OjQ5IC0xMDAwLCB0akBrZXJuZWwub3JnIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIEhlbGxvLCBCb3kuDQo+IA0KPiBPbiBGcmksIEp1bCAyNiwgMjAyNCBh
dCAwMzo0MzoyN0FNICswMDAwLCBCb3kgV3UgKOWQs+WLg+iqvCkgd3JvdGU6DQo+IC4uLg0KPiA+
IFRoZSB1c2Ugb2YgYSBzcGlubG9jayB3aXRoIHU2NCBzeW5jIGlzIHN1Z2dlc3RlZCBpbg0KPiA+
IGluY2x1ZGUvbGludXgvdTY0X3N0YXRzX3N5bmMuaDozMy4NCj4gPiANCj4gPiAgKiBVc2FnZSA6
DQo+ID4gICoNCj4gPiAgKiBTdGF0cyBwcm9kdWNlciAod3JpdGVyKSBzaG91bGQgdXNlIGZvbGxv
d2luZyB0ZW1wbGF0ZSBncmFudGVkIGl0DQo+ID4gYWxyZWFkeSBnb3QNCj4gPiAgKiBhbiBleGNs
dXNpdmUgYWNjZXNzIHRvIGNvdW50ZXJzIChhIGxvY2sgaXMgYWxyZWFkeSB0YWtlbiwgb3IgcGVy
DQo+IGNwdQ0KPiA+ICAqIGRhdGEgaXMgdXNlZCBbaW4gYSBub24gcHJlZW1wdGFibGUgY29udGV4
dF0pDQo+ID4gICoNCj4gPiAgKiAgIHNwaW5fbG9ja19iaCguLi4pIG9yIG90aGVyIHN5bmNocm9u
aXphdGlvbiB0byBnZXQgZXhjbHVzaXZlDQo+IGFjY2Vzcw0KPiA+ICAqICAgLi4uDQo+ID4gICog
ICB1NjRfc3RhdHNfdXBkYXRlX2JlZ2luKCZzdGF0cy0+c3luY3ApOw0KPiA+ICAqICAgdTY0X3N0
YXRzX2FkZCgmc3RhdHMtPmJ5dGVzNjQsIGxlbik7IC8vIG5vbiBhdG9taWMgb3BlcmF0aW9uDQo+
ID4gICogICB1NjRfc3RhdHNfaW5jKCZzdGF0cy0+cGFja2V0czY0KTsgICAgLy8gbm9uIGF0b21p
YyBvcGVyYXRpb24NCj4gPiAgKiAgIHU2NF9zdGF0c191cGRhdGVfZW5kKCZzdGF0cy0+c3luY3Ap
Ow0KPiA+IA0KPiA+IElzIHRoaXMgYSBpbmNvcnJlY3Qgc3RhdG1lbnQ/DQo+IA0KPiBUaGF0J3Mg
bm90IGluY29ycmVjdCBhbmQgaXQnZCBtYWtlIHNlbnNlIGlmIHdlIHJlYWxseSB3YW50IHRvIHVz
ZQ0KPiB1NjRfc3luYyAtDQo+IGUuZy4gdGhlIHJlYWRlciBpcyBob3QgcGF0aC4gSGVyZSwganVz
dCBhIHNwaW5sb2NrIHdvdWxkIGJlIHNpbXBsZXINCj4gYW5kIGRvDQo+IGZpbmUuDQo+IA0KPiBU
aGFua3MuDQo+IA0KPiAtLSANCj4gdGVqdW4NCg0KDQp1NjRfc3luYyB3aXRoIHNwaW4gbG9jayBo
YXMgdGhlIGJlbmVmaXQgb2YgbG9ja2luZyBvbmx5IHdoZW4gd3JpdGluZw0KaW9zdGF0LCBidXQg
cmVwbGFjaW5nIHU2NF9zeW5jIHdpdGggc3BpbiBsb2NrIHdpbGwgbG9jayBub3Qgb25seSB3aGVu
DQp3cml0aW5nIGlvc3RhdCBidXQgYWxzbyB3aGVuIHJlYWRpbmcgaW9zdGF0LiBEb2VzIGl0IGhh
dmUgZW5vdWdoDQpiZW5lZml0IHRvIHJlcGxhY2UgdTY0X3N5bmMgYW5kIGFkZCB0aGUgY29zdCBv
ZiBsb2NraW5nIHdoZW4gcmVhZGluZw0KaW9zdGF0Pw0KDQotLQ0KQm95Lld1DQo=

