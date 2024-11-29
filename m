Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41315D6EBF7
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VZWvLKotK0ELAb5gmVvtv46CVp4AXQpdRdu9h2lfkQ=; b=EYxVsaBntQn5NLYe48GZvcz2YF
	FMXh7cSVhSc9I8KTsr03b4bBovSa11Jjn2E/eX8wuY70hMv7kW0M1DXGRARof5dZr1VgKpBzG4hh7
	fBeCubtj0wFlLSA+RfWiRZln3fYjo69q6F2njWQQoFgD+cAfMUzflA8CS/DF7brq0to9k0v49lN0+
	YBlDhi7EpFJxt4m36HYQ0x3wIeereWrOILtFW0Szs9JxxDOUuzxkMF2/Lbv9fum73rDJOKU1C7Q6A
	9PlbxxHoEOrdFhJ6+wHkbbJfhRHZxxBNzTliKtj2vBLifM9MTw1oqgx91Ydjw3xJTmL79Q3oyA3g0
	bPJHgHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyD9-0000000HQTd-0Zv2;
	Fri, 29 Nov 2024 10:26:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyD6-0000000HQT7-2Z3f
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Nov 2024 10:26:53 +0000
X-UUID: 6f95aa10ae3c11ef9048ed6ed365623b-20241129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8VZWvLKotK0ELAb5gmVvtv46CVp4AXQpdRdu9h2lfkQ=;
	b=iJ5yhFe7VfUgSWs/GezC/yjaHrIzPut8Zmm0VGyJNc581CxNidjbJaHpRVVQzhNRdYgKFgeabYH5gJpmaHRcGWSwZYAcMXWFlRN5Y/9pbS7Exm3dECZFIBl4CdvuZIpjYcIG1aRv6V1oa7VG8rwFrKxxJFvw7n8THt/sTVnBZSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:09de509a-ffaa-4c11-8086-5bb6b080a73b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:a5e57ae0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6f95aa10ae3c11ef9048ed6ed365623b-20241129
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1045498201; Fri, 29 Nov 2024 03:26:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Nov 2024 18:26:44 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Nov 2024 18:26:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkG2bqqAVWES21iCvHM3js5i26qFKVe9ebRO+lGJgwX53CgP+0nATUaPkjrNAF2JqVBzqDyx0jsX6n7RisXmG1TFCnUrJRVDiFvNu5kgdYXbhfE168LJU7A0GOaQaqmWImyddFrWNxHhkjwCoWa/JiTOiMAJ0UFf3a4mqBOoukcT89THEumtUSkQXO7F/Hfj3/AJ7wqoRiHY8wNNaAWjeq7r7KVhO4o3eL3JarvdepStuwn7oKyvCbLxOomb17vnveThc58Km+NPwm/z5yP5/wxNER47HuB4V9xio6irYG2TfAjaaKPwwHB2y/BKXYJ/NqVLGxPt8GCKPaYrZ6Dw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VZWvLKotK0ELAb5gmVvtv46CVp4AXQpdRdu9h2lfkQ=;
 b=Ww/JDL0Jnql5s/j/ErdJ8rVIIkWtY+wzczqoCwjdY3RPJxu6DsBdJbvIe1/4Cav40zA2BQ8OGeTntXUQ3VFvQtftHJTFuSXpGa8PiEsRYXy23+OrIE1mFJRGvmbsx/gchTc7trFVIZdBNeZa52mgwCnhpJtE1gOLI4FNbgNRtB+7+Riio/RoHAcpojXjPmC2yY2D5BhYTDdVllNztu1731aUJN5sNYIlhzX275xpGFHjaZZqKnqQJg0AgX9MFAkHaIUZoFCwUhiVg7SOHQCKWO5xzknqjj0WVfBw4s57UG3i8MqthR/YAZgInvolciydnagsx+YXc0//JOd0dVl+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VZWvLKotK0ELAb5gmVvtv46CVp4AXQpdRdu9h2lfkQ=;
 b=EG7AIepU2GhL6PpSwtNCTJ3UOWendYF4YPvt7embjbc1imOg5K3L9cBV776helc9OR18ElXgz0dksZJ80qfp9EMSce0sgGQW2UIORoCPqOB40DynhwJB9/0oOL37YJEdn/WMgr8Ov0QpNsUP89f+uf494lvnJ7mkAoduoE1zA6w=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEZPR03MB8444.apcprd03.prod.outlook.com (2603:1096:101:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 10:26:41 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%5]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 10:26:41 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com"
	<2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [SPAM]Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to
 hardware capability
Thread-Topic: [SPAM]Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to
 hardware capability
Thread-Index: AQHbQNrEZVA//4+eOku29nH5J0SiKbLOEKUA
Date: Fri, 29 Nov 2024 10:26:41 +0000
Message-ID: <0442e558c1771fd23f5cc75806f9cbf0c6167094.camel@mediatek.com>
References: <UJ5MNS.Y9SOF1FBB3XG@nozomi.space>
In-Reply-To: <UJ5MNS.Y9SOF1FBB3XG@nozomi.space>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEZPR03MB8444:EE_
x-ms-office365-filtering-correlation-id: 1f80fc42-bb89-4419-600f-08dd106050a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|217643003;
x-microsoft-antispam-message-info: =?utf-8?B?RTdobFlFRlFibHhIeVVMWUx3Y09hWlhWcmxYWU1tUEZRaFdsdjZCUFd1VElu?=
 =?utf-8?B?cjQwUDBoTnV4TWFDWHdkOEVOVFpWNUlwd0xrcUN4ekYwcGw2RVNoc0FwM2g4?=
 =?utf-8?B?N1ZXeTF0YkVmSjVNV09nMWJkaWszSFNjRk04SitLMzZTQkd6TlJnVWtTRzJQ?=
 =?utf-8?B?ZkJkanpLYll0ZEpGTmRGT0hhK2JQbklqL2tkcWRpY043aVRERVV2djhjemEz?=
 =?utf-8?B?b0tIckhXWWZ6Qlcxc1dyN1g2Wm95dkhJVHFkdk4wOTJndFFXUzNabklyL2Yx?=
 =?utf-8?B?WWt2Wi9BQ3UyanBZeVpPVWhnd0RiMW84aStzUjBxTlFmTFRsS3I3WExSaFlp?=
 =?utf-8?B?SVhkdVJzRnJSbDQweVE2MmVXbFF6SzYrTm9mQU1DendCM3NWdnA1VjJrTFB1?=
 =?utf-8?B?SkRJcHVlRTdnZ1dxbmx0NnB3OUVqS1VTSEx6ZXlnQllvc0k2LzRnSlovaXBr?=
 =?utf-8?B?bU4vTEJ1d25kUVpKM3o4L3U5RnpjZi90cnRIK1E0am96NDlHazFlV3dRa3pn?=
 =?utf-8?B?ZzE5bEdWUE5YczZVMGZ4MlBFV3ZHMjgrYW1xcTNKRDFHbGk1ZGR0V01mdGJ2?=
 =?utf-8?B?ejhiU3A5RXA1eFlzS2hQTWNXWTFaTTJqZE9NRVZvWktRQ2l1Q3V6dXVVUmpa?=
 =?utf-8?B?bEhPL2JwNitkVXMxWnEzMmUzNTYxWGVXQm13SVBoYi9qYUQyQjg3WUFNQmh6?=
 =?utf-8?B?b29rSDFhSThxYUw5YWFZaThqYW1qUXRZUXFHanB0OXFNd3d5Y3ZYZlI1aUMw?=
 =?utf-8?B?aVdHNE0xYkRlbHBnZ2IwdzFxOVNQM2k1V0k2VWF1SFZTZlhLVFU5eGg2MDVh?=
 =?utf-8?B?akZ0TGJGRWpWM1BUTXNJTG13MFRXZnEwL1k4clJVamVPUjl0TlZwemVsLy9T?=
 =?utf-8?B?Njd1cGM3L0Q2ZERjOTZEUG14dkFYKzBKQlJISGFQOWtlTTlTREkxL3BmbXBV?=
 =?utf-8?B?Q2NWRVgzcSt0aU1WM1hMR3FoaXpTYU8wQnMyMXFXY3kxRWNUWUNoTldNcEpL?=
 =?utf-8?B?K1FWazFkek8rNFdPaUs4enJCZGJQak9ESzBFa2JMUGFnZEp6U1lGdXY0Nzdj?=
 =?utf-8?B?K1hKYm5BM2dweUQ4WEJ0L3IyVENBbnlVU2h6WkY3cS9MYkM4K2xzOExmM0l3?=
 =?utf-8?B?Q2M0WFpZdHpJKzhHZXBnUFVVTmR0SW55MW1SM3R5OUpERy96My9ZV0NrR2hJ?=
 =?utf-8?B?Tnh3UzZCcFQwUnlaaEw5alRPblAxK2w1TisyeHhtMitaeG52N1ROSUxHTWts?=
 =?utf-8?B?aWtGUUtCL3BNQmtCbllwS1d5WjVGVWc5L0F6QmhLV09tKzdZclQwdmU1TXhG?=
 =?utf-8?B?ZE00N3RsOGVSVUZDbzlicjlyRFFmZXBtODQ3ZDVWQXB3UWRqb0Nkdm51OUlK?=
 =?utf-8?B?eXgyQXRyaTltcjRZT1piRzd3NDgrV2ZnaXR2d2Rva3lwbWwzSE81cUlPeDZD?=
 =?utf-8?B?TlphOTdYVmhjVForbERPUE41YkZnaTRXeUhGMHVDUWtETzhXYmFtRTZlWjdz?=
 =?utf-8?B?TTEwSm90QW9JOHBkRUlLOVM1WlNJNHluV1F2T09ONUdJa25OY2p4RjlvZkln?=
 =?utf-8?B?a2FYZTZHOUFjQnJyUVdDUXk1MnY5OUxqeXdNK0Y5SzFIUHprdmZqc0h0MlB4?=
 =?utf-8?B?N0l3bEs0emJkOEdHdzMzL2NEdkt0U3BUbkJTeDJBSjRlS3pYZlNIVkVlZC9H?=
 =?utf-8?B?N3JwTnI2YXhTMlJZREE2QTJya2FXeHRXWk9QL2JjdVNXTy9rdC9PQWFwZUJ2?=
 =?utf-8?B?cVdNeFFUM0VBT1ZJYVFYeXZNQXZaSnlyVGtDTVhzT0JKeDlJUVZEdnY3UDg0?=
 =?utf-8?B?RlRyMkptQ1VNckdTeUJNdHhUd2ZGMFlBOXY4UlhKZ3U5RUJhaTdYT0ZsdnVT?=
 =?utf-8?B?NjRIWXptaVlRS0NDL2psRGJLblo4WFJVQTVad2lnb2tuMFhPRnJQOGplMDN3?=
 =?utf-8?Q?bNhFzNZrxJs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(217643003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG4xQmJHbTN3cjY5cllBOSt5WlJqaW9QbWVHUGFLZk4reU9oOENjVHZaT1Bt?=
 =?utf-8?B?REZlWnV0MVJTSDJmd0J6cHNwMWg4NkQ2ZVlSV0Z3TzdMcUtNT25JTFRBc250?=
 =?utf-8?B?VmxQNUp2aFlYSmF1Kzlta281Um1qVWYzR2lqVW1kS1doNDViSFVhMnQzVnI1?=
 =?utf-8?B?ajg5SDJ0UTg4ZUNrSllWRDBlWndEQTNMLzBnTmhJMHEzRzZ2L3lmV2duZkp1?=
 =?utf-8?B?c0hNdU9NbTRZd09YTlY0dG1JczI5TWdUblY4UVl4MmsvNXB4eTlhSzFlNTZQ?=
 =?utf-8?B?ODlWalo0MUVtVDVjcjhwRmtHRVE0U3RieEZZR0hhaVA3ekFyTUFQRVAwQnhQ?=
 =?utf-8?B?SUxxREJOQ3l1Rnd2N1hqanJyWEtWSzF4Y29ySWRoZzNLVmVHT2pLUlpWZG5F?=
 =?utf-8?B?cFhiK2dsZGV3Z2tvZDlYMmJ0NUxTaTgxVDh4SWZZVFU3ekZpeEVUbnB1OGdF?=
 =?utf-8?B?Z1p3MFVaR3FsWXhjQjFQdzdEb21XMTlnWWptNnNBMUNDa3ZENlJHNUM3NmJZ?=
 =?utf-8?B?K0I4bXB5ZDk2b2d5NVBKUHNMMkJRR3E2MlJIRnA0MlduQUZnSDBXMWtiaVFH?=
 =?utf-8?B?V1ROb3lvVzRmd2tZWGlnNjZSQWpkR3RhRzMzbzY3c3FIaStqTlpyNWRYUlpX?=
 =?utf-8?B?SUg0WXlHV1ExTllaT3ZYNlNyN0ZjcWF3dDg1QzlYcHRPZmIwbkdBa1YzaW5K?=
 =?utf-8?B?Y1JEWGp4QVVNTEZneUZZRUJhZnJuRXBDdEI4U05qY1F1RUhmNkwwczdjT1hZ?=
 =?utf-8?B?WCtvU3N3Y09hamtDRFJyZlNVQUJ6TWVzL0hUZVBHM2hZWHZOZmhGMXM3bU1Y?=
 =?utf-8?B?amFlWHhWejJ3L2EvWHpMeUg0Nk5rUkIydnFhclhkaTlrV1duRGY1bG53b2tq?=
 =?utf-8?B?R3Z4Wk52K0w4U21CMWpOTFhGdDJmcW9CbHAvdmVhNjRzREg0WWhNYk9PM0Y4?=
 =?utf-8?B?VnNCMWpkc3crYjdJenVNSWM4ZmxYb01EY0hnRC9wQXFaUi9ZZ2ZNQnA4enVs?=
 =?utf-8?B?L3N2YjVpMjZ2SWJyaDlOOU4yZnRJZVQ0U2dwWmkrUnBmSS9WTUJSN0M1eVE1?=
 =?utf-8?B?Y1RndWdRRHNvcSs1WFR2R01CZ2pRVXJSYXVweWNFTmtSMko1U2ZpbEhHQm9O?=
 =?utf-8?B?TnlxWnlwVGdxVEhhbDUxSGQ2K1FPTTk3NVJMSHk2VnN0aHV5SDFtRFNYQkhx?=
 =?utf-8?B?NThtRm5BTmtHY24zMFAvRWNPUGQzVHRnNkt3MXB0Zjl5Tk9uc2tpZEMzbDJo?=
 =?utf-8?B?cE1UWVVwMm1PZTJZQTJOYzlHalB5NWZnUjEwdWt0SXJYV2dGRG9PU0JJRFkr?=
 =?utf-8?B?WCtxK3VCY2hTcnh0dGd4WVJiR0t0dDVsTHIrMmNhWThIQXFTWUdtWEZEamor?=
 =?utf-8?B?bUo4TXZiWER5anY3aVhZcHJLN2FjU3FsWXBaSk1iV2c0Sm1VV05yanNQMWJl?=
 =?utf-8?B?ejRSdG01dWgvSyswNU5VblY2ZURSSXJQUTh5US8yV2tHUDJyKzY2eWs2Ymx4?=
 =?utf-8?B?MGg5Q095dzR1REhHNkd1K3RWRVVjNGcvV1pEUXo1aEdqRnRwQ2Z2aU0wUSt1?=
 =?utf-8?B?NUpVQnp0VENWS3U3NDExSlJQQTJVdlhUN2p1aHhGMTlIS1JuQUtCYXFmOXZR?=
 =?utf-8?B?ZE5BQzJScncvdVJUU0Q3Ni9rdmVOT2RwSDExdDlLclN6OUhWMXk4Z3EraTVn?=
 =?utf-8?B?N3U5ZkQwMGdHRG9YeWF6Rlplc2RGUU40bjZ2V3VnRlBnazkrR1ExdVBxckY4?=
 =?utf-8?B?MTYyTE5WbVZmNWVKaDRxV3ZSaXY5QWs2cUJPL0J6VURDbk1MOHh0ZTB3RU5s?=
 =?utf-8?B?TnFDY0NjS2V0azgxNnFHWGJnekdtUlB1dTVVTjZMRnozY3pVVWE0a1NCUGJn?=
 =?utf-8?B?RzlROCs5MUtEenJGZ2U3cHcrd1l6aGxiRFFMUEFHbzg0RnhvalhQSm9Ibkt4?=
 =?utf-8?B?MUpFSElxWWtydlBHMmJjSWMvSjdVYTYzM05nRVRQRnBabjRmd2RVMkd0K2ZU?=
 =?utf-8?B?bmQ1cGRHV3dqbWlKOVIxdHB1aGU1MWZ0MXJnRlArcTI2MFA0Si9wK3VUOHd0?=
 =?utf-8?B?R1FGdXNzUWVxSjFzZlBKZWxCMm9WN3QreVBZRk9kZm9zcm1lcjdocW1oTXRP?=
 =?utf-8?B?WXZra1ZPMVZXai94bFRmSFlTdGgzeWNGRm43SVpiRzZXQXZEWmdxNXovOEc5?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <406ACFC36643E74EBC4C26733FDC3831@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f80fc42-bb89-4419-600f-08dd106050a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 10:26:41.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8CBNGBhdO6kgHOZoqFwgvHuzbDdvptKaQNLKvCx8KDz/89cz/inQAe6K7kgGIfTbXh+uKxmrrjEshdZcLCfMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_022652_684009_B3FEFB46 
X-CRM114-Status: GOOD (  24.47  )
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

SGkgTWljaGHFgiwNCg0KT24gV2VkLCAyMDI0LTExLTI3IGF0IDE1OjI4ICswMTAwLCBNaWNoYcWC
IEtvcGXEhyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNl
bmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiAoUmUtc2VuZGluZyBiZWNhdXNlIFNoYXdu
J3MgQGdvb2dsZSBlbWFpbCBpcyBpbmFjdGl2ZSkNCj4gDQo+IEhpIFNoYXduLA0KPiANCj4gSSdt
IGEgbmV3IG93bmVyIG9mIHRoZSBDaHJvbWVib29rIENpcmkgKE1UODE4OCkgYW5kIGhhdmUgcnVu
IGludG8gYW4NCj4gaXNzdWUgd2hpY2ggSSBiZWxpZXZlIGlzIHJlbGF0ZWQgdG8gdGhpcyBwYXRj
aC4NCj4gDQo+IEknbSBhdHRlbXB0aW5nIHRvIHVzZSBhIDM0NDB4MTQ0MCAxNDRIeiBtb25pdG9y
IG92ZXIgRGlzcGxheVBvcnQsIGJ1dA0KPiB0aGUgYXZhaWxhYmxlIHJlc29sdXRpb25zIGFyZSBs
aW1pdGVkIHRvIDI1NjB4MTQ0MEAxMjBIei4gSSBmb3VuZA0KPiB0aGlzDQo+IHBhdGNoLCB0aGVu
IEkgY29uZmlybWVkIHdpdGggdGhlIG1vbml0b3IncyBFRElEIHRoYXQgaSBhbSBpbmRlZWQNCj4g
cmVhY2hpbmcgZGF0YSByYXRlcyBhYm92ZSA4MjUwICh0aG91Z2ggbWluaW1hbGx5KSBpbiBoaWdo
ZXINCj4gcmVzb2x1dGlvbg0KPiBtb2Rlcy4NCg0KQXMgdGhlIHJlZmVyZW5jZSBudW1iZXIgODI1
MCA9IDU5NDAwMCAvIDcyOg0KNTk0MDAwIGlzIEtIeiBvZiB0aGUgY2xvY2sgcmF0ZSBpbiBtb2Rl
IHNldHRpbmcNCjcyIGlzIGxpbmVzIGR1cmluZyBWQlAgKFZlcnRpY2FsIEJhY2sgUG9yY2gpDQpD
YW4geW91IHNoYXJlIHlvdXIgcmVmZXJlbmNlIG51bWJlciBvciB0aGUgRURJRCBpbiAzNDQweDE0
NDBAMTQ0IHdpdGgNCnVzPw0KDQo+IA0KPiBJIHdhbnRlZCB0byBhc2sgYWJvdXQgdGhpcyBjb21t
ZW50Og0KPiANCj4gID4gVGhlIHByb3Bvc2VkIGZvcm11bGEgaXMgb25seSBvbmUgd2F5IHRvIGVz
dGltYXRlIHdoZXRoZXIgb3VyIFNvQw0KPiAgPiBzdXBwb3J0cyB0aGUgbW9kZSBzZXR0aW5nLiBU
aGUgYmFzaWMgaWRlYSBiZWhpbmQgaXQgaXMganVzdCB0bw0KPiBjaGVjaw0KPiAgPiBpZiB0aGUg
ZGF0YSByYXRlIHJlcXVpcmVtZW50IGlzIHRvbyBoaWdoIChkaXJlY3RseSBwcm9wb3J0aW9uYWwg
dG8NCj4gID4gcGl4ZWwgY2xvY2ssIGludmVyc2VseSBwcm9wb3J0aW9uYWwgdG8gdmJwKS4gUGxl
YXNlIGFkanVzdCB0aGUNCj4gID4gZnVuY3Rpb24gaWYgaXQgZG9lc24ndCBmaXQgeW91ciBzaXR1
YXRpb24gaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IC0gQ2FuIHlvdSBjb25maXJtIGlmIHRoZSByZWZl
cmVuY2UgbnVtYmVyIDgyNTAgaXMgdGhlIGhhcmQgbGltaXQgb2YNCj4gdGhlDQo+IGhhcmR3YXJl
Pw0KDQpUaGUgcmVmZXJlbmNlIG51bWJlciA4MjUwIGlzIGVzdGFibGlzaGVkIGJhc2VkIG9uIG91
ciBoYXJkd2FyZQ0Kc3BlY2lmaWNhdGlvbnMuIE51bWJlcnMgaGlnaGVyIHRoYW4gdGhhdCBtYXkg
ZnVuY3Rpb24sIGJ1dCBjb3VsZCBiZQ0KdW5zdGFibGUuIEZvciBleGFtcGxlLCB0aGUgbW9uaXRv
ciBtYXkgc2VlbSB0byB3b3JrIHByb3Blcmx5IGF0IGZpcnN0LA0KYnV0IHlvdSBjb3VsZCBlbmNv
dW50ZXIgYmxhY2sgc2NyZWVucyBvciBnbGl0Y2hpbmcgZnJvbSB0aW1lIHRvIHRpbWUuIA0KDQo+
IC0gQ291bGQgeW91IHN1Z2dlc3Qgb3RoZXIgZm9ybXVsYWUgdGhhdCBjb3VsZCB3b3JrIGZvciBt
eSB1c2UgY2FzZT8NCj4gSSdkDQo+IGJlIGhhcHB5IHRvIGltcGxlbWVudCBhbmQgdGVzdCBvbiBt
eSBlbmQgYnV0IGFzIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MNCj4gdG8NCj4gTVRLIGRvY3VtZW50YXRp
b24sIEkgZG9uJ3Qga25vdyB0aGUgYWN0dWFsIGxpbWl0cyBvZiB0aGUgaGFyZHdhcmUgYW5kDQo+
IGhvdyB0byBkZWFsIHdpdGggdGhlbQ0KPiANCg0KTWF5IEkgY29uZmlybSBpZiB5b3UgYXJlIGdv
aW5nIHRvIGltcGxlbWVudCB0aGUgcGF0Y2gganVzdCBmb3IgbG9jYWwNCnRlc3Rpbmcgb3IgZm9y
IHVwc3RyZWFtPyBBcyA4MjUwIGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhlDQpzcGVjaWZpY2F0
aW9ucyBhbmQgd2FzIHZlcmlmaWVkIHRocm91Z2ggYSBzZXJpZXMgb2YgcHJvY2VkdXJlcy4gQW55
DQpjaGFuZ2VzIHRvIGl0IG1heSByZXF1aXJlIHRob3JvdWdoIHZlcmlmaWNhdGlvbnMgYmVmb3Jl
IGJlaW5nIGFjY2VwdGVkLg0KDQo+IFJlZ2FyZHMsDQo+IE1pY2hhxYIgS29wZcSHDQo+IA0KPiAN
ClJlZ2FyZHMsDQpTaGF3bg0KDQo+IA0K

