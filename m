Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1F1D70E1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 06:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvb6RPABxQGtWgfk/+53hH0LUlUpII8zT9llR0gqCd0=; b=4+X80yIcned26pKBrEBKEoJBx4
	zhRO/FiYUtfYpSRaPwafXJ8Ay0GESK+DfchnesgLAbgeoc2ViEhxc2JqsnrzfwnPnu+9OCrC+Bgas
	Wl7b3r0YUMxvFJCZIjxnOiA7+6RYgxosWOTqBe7fekYbqyG3LSMRBrmwILanhOw8MB0uWr9feJC0B
	DEm56fBsCgGIKNVUr3ZCXkx5EBrGQd7uqUzwXuCatT473lHLgEFRUVs5E8kvOnsVLtDDmp9xf7qd6
	dctunTNbh8tXG4n4tsSQ4VlrsTm3F2SdyRxCFLgLIGiweLVa7Yw7PGyNjpuD3j+xZuAmAWSIHLHni
	RwsavadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuJt-0000000GzMt-0iNC;
	Fri, 29 Nov 2024 06:17:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuJq-0000000GzMP-2OKr
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Nov 2024 06:17:35 +0000
X-UUID: 9cbdf45cae1911ef82ff63e91e7eb18c-20241128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lvb6RPABxQGtWgfk/+53hH0LUlUpII8zT9llR0gqCd0=;
	b=LsEa+sb+qX9Ds9tob25wlCwWzeYtAVbgKJSZ7IbGnEBk2rqT1zQLUeOQN8txkQfTWSYOka54GArioMbKDbHCiCdBiomsCnXqma+zxZequK2oz42lvVszOiy9s0n4Gxan+CZoxWiQQWUHD52CNEwbcJt8C8yfpQsyTo0du3z0eD0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:124f3609-bf1d-4ac7-9597-0605a093b5d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:541895b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9cbdf45cae1911ef82ff63e91e7eb18c-20241128
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1092113429; Thu, 28 Nov 2024 23:17:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Nov 2024 14:17:26 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Nov 2024 14:17:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rqg+8RnFhGoS9AzE1CPkMyPWxnUjaURw6d5cStWfM6Dc3E8E7C3myY7m2DMggw/D0be9yUoSPDy96pqKsVBGTZpPzN0PjYDo3rbLnApQ8Ct83t0vEBsLOHmp7O9URVnk1kR0urD2oNXiAxzjD4t/rw5xauQ7P5w5UKfJQgRRuveB7UN21UEjGKPIUTLRb+NbNoeTUaijU+EMKSyntivb35UchkwmFzRc/S0idBe8Crkw5K2gqXDo2PLzINeOMrW1/gu9s7bKe9O7erfEES/dgVbt4b4p27UfYMvbfOb2lcvI0Xo/1TNLCov1RQjh1CdqKkP07oPHraD9hEMcymr4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvb6RPABxQGtWgfk/+53hH0LUlUpII8zT9llR0gqCd0=;
 b=bJeV3Z6elnZP0Gi1UoCnhLHg0im+g/XSJoBvYbUD2DxmEQWCOX7xsTPiilzLxcGEEGtC7xli13hgeuzPi8Ri48XpdhTUz1LAZNN3fa+KFGvDIeEJHJE2UDoLqMXTuSnEjLdCvNwaNUAztlWFrSjYGC4pLP8fVLC7QpwUR3QQAdtMVsyPeu5/dGqRdhmyBXyZvVX5b8rNKjOcq779otvCsXrnppSD2uoFo/eWO9Xq3Gv07UPh53UdRd06pPumlA804GEJmuRCdz7c94lJqP8gf3Z9DuSIr/DqyZ4KDWF9AWLi2svvIEXNwFn4lqkkQHZK7N6pqyOXztkDl5MPw6i+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvb6RPABxQGtWgfk/+53hH0LUlUpII8zT9llR0gqCd0=;
 b=Xn6Yvir4Us9CTSCZU62rukeq1pjIoyzkTsjOS1i3zaLG+lyOI+C8Ld1sLYZca/BhtMFnAkvzTYdDnS7tnFNWwHWuQ4z10zXczyOf1hibVPd4wQdN7D8fvVqgElRhd+OyZzbMAHnmKVuCooacrr4YV0YraoN5D4b1tnFq175e+K4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8410.apcprd03.prod.outlook.com (2603:1096:405:76::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Fri, 29 Nov
 2024 06:17:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 06:17:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "michal@nozomi.space" <michal@nozomi.space>,
	"2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com"
	<2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Index: AQHbQYGC43c9UQxNS0O+7J/f4K6jKrLNybAA
Date: Fri, 29 Nov 2024 06:17:23 +0000
Message-ID: <2306eb813042259c0b86fc77b8c4e566d4f8580a.camel@mediatek.com>
References: <UJ5MNS.Y9SOF1FBB3XG@nozomi.space>
In-Reply-To: <UJ5MNS.Y9SOF1FBB3XG@nozomi.space>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8410:EE_
x-ms-office365-filtering-correlation-id: 325d8ef0-4496-4011-9bed-08dd103d7d2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THZ3M09iN1FwSzBQNnA4dytxSmQ2MTFVOXVCeld6dXFZVnJHTHpWWXQ5R1l4?=
 =?utf-8?B?aFVDUytDbjZyMmdWR051bFNKamd2QXkzUWdHQWRWSjBtNXVMZmhEVlhhMlAr?=
 =?utf-8?B?bHVLNGFKa1RoVXJxeEMzTVpuNCtGMUZqTDQ4eFBkQ3VPa1g5RWVRRzBQUlpN?=
 =?utf-8?B?Mk9Zb2VuTjAwRTVnN21LdTRRK2RoNURhVEpBVEhjcXYwRzdHb3V1MGNDREYx?=
 =?utf-8?B?S3N3eWRGTUFyOHo2VTRBc1Z3SUFJZ0ROaDRSeGZRN09QcWFFdTcya1RIdDlI?=
 =?utf-8?B?cEhDRzlXL3pWR3NDRjB6cERYYTlRampBTW8wSHN5Q0Qxa2VYTHV0RnBpS2x5?=
 =?utf-8?B?S0FkU1c1SVgybjVwU1ZyYWppcHYrSGg4clhxM3h3eWdNWXdJbGtxVHF3WW1Z?=
 =?utf-8?B?Q3pQNlVTT3k2TXR2L3IwcTgyZnJnOEhodElLTkpiQ2RiUnBYdmdwbnZkMWlv?=
 =?utf-8?B?N0tNcmNyY3BsejZKejM5c1ArN2k5cHgwSXJTdkF6c3NnSjZ0aUVmYXhaMkNm?=
 =?utf-8?B?VWtZTGNhMnlKVWZLblZRSExTdTNHZHdkVjBsaVEvUDBYd1E0dHFxeXJvWlN5?=
 =?utf-8?B?UXJxZDE4UVRYeFVDcFdDdVBlOFhtbGdQaEE1SjU1SWxyTXVEY2dlK25DdDFm?=
 =?utf-8?B?bVlSOW8vUW1WSk9QRmJmN01Xcjl1SWFaRTMxNlJxdUtRZ0plclR3SUQzWjV4?=
 =?utf-8?B?S1Y0RjNJWnlHWEhVT1dYV28yaFRoOHJXVjJQcGpJSXJjZGd0T2tCU2lVRzhi?=
 =?utf-8?B?a1E1b2RrK245THRYMWtZeFRpQWVWOFdsd3d5R0pyRWlmRk04UU1qdE85QXR2?=
 =?utf-8?B?cDlHcXRSWXFicElKK29va01xZkp0MGNqa2cxbDhDV3hQZTRlcHFGYTRnK0Fp?=
 =?utf-8?B?Vmp1eHJDQVNoUUwrTkJGQjZESk9BaFpsaVRGemNkZGJlendXTEEvRXdlRmFa?=
 =?utf-8?B?ME0rNkhwT0ExcmN2NWg1dlF1UGMyWklnakhIOWNmaFl5M0RSZnh0QmVocFFI?=
 =?utf-8?B?VUovWU9HbnVnRHIvVDVwQitxRkw5akFFMGMvK2lZUFpBUUpRUXZqcnFGVTBU?=
 =?utf-8?B?UFNZUUFzc1VSZmpiT0VoZnhQc1p1Uzd2VmtscFViSnZyMnF2REZzeE1lQmo2?=
 =?utf-8?B?R21JTzZBTEZYeWczdE40OXc1cExONXh3TklIZWJHdGp4QmlKNzlOVkhNREps?=
 =?utf-8?B?ajA5MWtMdkNIczJka3o4VkRNZ0Q5VVNVYk9nWDJMZm04TlpEckJGOFVGOHdj?=
 =?utf-8?B?NFYybllrTnpIRGhVVFVYa3c3eUVFTE12ZGFQZkFRVGhnenRKbExkN29TVytE?=
 =?utf-8?B?UzZqV2NEYVQwMG9SRlMxTHdnNDBiSkZBUzluVTdkT3d1MWF5RS81a3FwRXV4?=
 =?utf-8?B?aEJzNUJURC9JS2pOekptdkpsMThBd1JvVUZNTW5Yb2R3eE9YbmN3MzU4WVdm?=
 =?utf-8?B?YWxtVG43WXNPTHZjNytmajJEdDd5MW11dkVnTWNtSzVRRGUyRFd0Qzgrb25z?=
 =?utf-8?B?S2orYkJhMWZnVE1zazlMOE95TjZ1VCtuUVI0bUxJeHd3b2pYM1NlT1gwc3Ny?=
 =?utf-8?B?Njc1SURJSGdIbmxaODliNTZpWGZscXh4bXlDRmFoMWd4Tk5BNk5VMUNiejZ0?=
 =?utf-8?B?c3hqVmZFQzVvSm5WUUxUQlpXUnFtMnBzY1grakM2OXBHeVdZUGUweWwveGhx?=
 =?utf-8?B?S2FheGZrRUpJTzhjYVpMalp4YkNTZXFaUHhZaE5PTVZ0aTAwNENnQ1I0dlZ5?=
 =?utf-8?B?bEVBbENRcXlGKytUYmphbWlWWSsyL0xEQ2ZnbXRFazBCcC9BNkFUZXkwMFJZ?=
 =?utf-8?B?MUxHVGdYUHpTY2ZFQ1JhUzgyU0VxSTlhU0swMktmSGRsS0ltTE9INnQrMEFk?=
 =?utf-8?B?QzQwR044NmhicTI2d09ENjY5N0V2UVhtM2grWGJtNkwycHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFjalhsclh6bm9zNDVpa0ZSZ09ZMVJkUzI2MldYbHlvTXIvVDRRL3V2VkY5?=
 =?utf-8?B?OVJjY2puRHZHNy8zMyt3Q1l1V29HWUpudkh1Zk1iMTNDVlZGdUFrdU4vZy9r?=
 =?utf-8?B?TUhRa2NnWlUxUFJVbm5MdDRtMklMcldXdWlIWXlYQzJKWmc1cnlXRm1idFVF?=
 =?utf-8?B?QzUrR2ZVaFA1a3BHS0phS0g5b0RLOUZJWll4WmxIOTBLMTdTRVVMT0JJVUR5?=
 =?utf-8?B?Z3Z2MUtJR0NWWjdCNEx6UWtwbGo2WlJzb2d0QmxBS21LRCtYaUFJWFdUd21v?=
 =?utf-8?B?ZEVXeDhNQlh1SG1sZS8rU3ZOckNEN085OEs0cEhrRXZJdTJ1dTgyWWJ6R1ZU?=
 =?utf-8?B?MmMrV2Y1eHFHaVUveTJlTUk2amFqNTJUTnpZdUZ3QlJtZnNlbVpFWHVZZXhJ?=
 =?utf-8?B?UjZWdjNkSDRuRUl2NTg1aEpBcHdsUGNPSlZWUUNPRHRrYzM5SGkxaVlzS2gx?=
 =?utf-8?B?OFg0bG5ZbklqZzhNTW1ERi9SU001QlNQdTVVMFZBQ3A3Z1dKOWdaUXpwSExl?=
 =?utf-8?B?b3FVS20zWFZ0RncwM3gwTDFVTnBDa3k0cDN2cVNhU1dFRlA3UFFwVDdnZElq?=
 =?utf-8?B?d0NoY0p0TWVVVzlzQ3Y3NUJjVFVHZVdXazk4T3V4N21JSDQ2UDZpTHBjeHpD?=
 =?utf-8?B?NXdySkJWdjk4Ky8xOE5iWFNlWWE2VEZRTnJnd2RZS2t5di95SGtGRkhOK1Aw?=
 =?utf-8?B?WEtoQ0l5NWo4NGRKR3h0a3JEVVNvdXFoU0l0VjVkaEZLZlRvNTN6TjhWRXo4?=
 =?utf-8?B?bVY1WGFJS2ZqTDJjV0EwL25XU1dNeE0rditqU2pSNnRnZzdkOUgxenBpK0tl?=
 =?utf-8?B?TEtLbUVJdk9sL2FjVHhpNXM2RUZDdEJkc0hsWk9qdkZWZ2JsVXVXUkp0dHJ5?=
 =?utf-8?B?T0pMVUVIQnBvMXJxRTVBelBHNmlMT1RzS2hKUW9mNVNKQkREeGNTU0p0QlJy?=
 =?utf-8?B?RWFtZE9WbURsc0REYmM2WEJNQ0JKT2JsclpZclFBalpXeVk5NERySlVkM09I?=
 =?utf-8?B?OWcxVGtkUEdqaTNwSUpHeTgwcGErNkwrTzRkeCsvMG9tam9KOVl4MkpGU3VL?=
 =?utf-8?B?Y1FGeld2OXZDY3M5WTVPVDN2YzlFWjFGY1JRQnBxcXpnNzJMSXZFUk85ZG90?=
 =?utf-8?B?cFBUcWRrUWZMOE1xWnFRZndzRWVUS1VKeTVtY0lrVzhMZGtsZ21WT3J6MW9T?=
 =?utf-8?B?ZXJZUVU0TWpKZDlYV1B1TEI0bk96aDV5R25qWXdHY21yRVJWZEpLWlhuTld2?=
 =?utf-8?B?QytoSGhScU9jY3YxQWJmc3RwdVdDRXlpZmRiUktkM2wyeWsvenBEOS92dHo0?=
 =?utf-8?B?SGVMSXJwdjlvZHdBa2JjL2J4dEltd0lwb0ZXeGpqSGsrRkt6QVNLeEMyTlFD?=
 =?utf-8?B?L3plQmhnS05XQlFZSjgyb1RxenpoeUpTRXp5NVlhdWptQWhKM1o3UlY5UXdk?=
 =?utf-8?B?R3k2eGN1a05mS0twYU5oZlRyMDZ4eHZPY3ZJMGNEQ2MwK1NxODJYc2l5ajFI?=
 =?utf-8?B?bnVjSWZxMk9FTkpCaTB2T1ZSUm9KYXErZUdJY3o1ZUNhRGFOUlNWK21hdVpC?=
 =?utf-8?B?NFNlYkJUc0txWFN2aVNnSmVGMHZnUGs2bk9vL1U3WERRZ1NVd1g1dlR0bnh2?=
 =?utf-8?B?MjJTWk9VUUtoZXVhdzYrSGZFRS9YdlhCRzF1bk5GVm9vL0xtUUsyTlhONlA4?=
 =?utf-8?B?aElFOUlGZlF5Zlk1WlNTQklQK0lxN01nTnU3UVpsaXBSZzNxYmo1S2g1alZB?=
 =?utf-8?B?Q2JKb1FoemNhMnZ1d1FaNWVWUHFGc2ovMlp6UFVGZEZpckJtem1ZL2lsZlFH?=
 =?utf-8?B?MG5MR003VkVoak9JNzdmeWFUQ2tkS2U3TlpzdlBPYlhsRzRqMmRwY3doZEZr?=
 =?utf-8?B?Nk9CUkcwT3VuNTdYdWlFOHJPcGc4bUJiWjhUdWFuc1U2eVp3Q0p1THJyVUVP?=
 =?utf-8?B?NnVBWDJzd3RIQ1RwSzR5OWdyZ3dHZTM2UE9KeEk2aEFYL2ZNcjM4RFFsNzZT?=
 =?utf-8?B?VGJSdEhFQi9MQlJUVno3UEYvbm1kdS9PSjYvT2tCQkdnblJxMk1qSTNJWFkx?=
 =?utf-8?B?ZUQwWXJabzNFd0NCZmg5UmRXVS9wZW1PakFUSjdLV2dFUHJaV2xEa2lRYkJB?=
 =?utf-8?Q?obL1wplo4+wBt+I3Vdbxxa8w1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2581D35DB3EDD5439957E0A9019E416B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325d8ef0-4496-4011-9bed-08dd103d7d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 06:17:23.5208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTSCmTPhtbzwgPlAzH8ecZIjSOmNZTeOYuYAChESQCg/JzgAdU62o9DfA7+4YoUDWsr3dohuCV2zcijYo9MAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8410
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.395000-8.000000
X-TMASE-MatchedRID: +KinvNGKp7ZDZFBd1jLr/pnkBjZpSi5ejLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2ytPf0+gM21ZCs7hdHoFFA2ecrqZc3vabOMD
	75CTivSuGkAf6zZq9JCF9YGSL8C7eLSTGw1g/Kd4tMfCdg6KRDf6gtm160R4EbwOeVG8fgdCOJm
	pFkiF2wyBzWA4ULP9ObdaYOMNgWSmEKYksiicmGRfY306nA3bovioP2AtQrfe67Q3uPo9KI+m4G
	ctd/YRvZvu12g4I3jb+jFZADttS72bWleqBhaYOma6DzXaohvOBA/jzcz3nAcWkDW4kV3WaKJjk
	rG+1FfF5L73zFQk6/lWf2oHUKc0h8+RGx07+8j9GWpKGpvfmnm3eqxoVjgMEArMcoUfMuwn2wtJ
	dngDYbZfN8ATKXA3nkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJCdXKz
	IGTSygLan0ss/ny7Df34jLDWSaPcIA3XUZqn38ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.395000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C25CF14951B30417CD29E04522245DB93CF7A6F52F4A1F138161F386E923E0692000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_221734_648679_80937AA8 
X-CRM114-Status: GOOD (  18.72  )
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

KyBKYXNvbg0KDQpPbiBXZWQsIDIwMjQtMTEtMjcgYXQgMTU6MjggKzAxMDAsIE1pY2hhxYIgS29w
ZcSHIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IChSZS1zZW5kaW5nIGJlY2F1c2UgU2hhd24ncyBAZ29v
Z2xlIGVtYWlsIGlzIGluYWN0aXZlKQ0KPiANCj4gSGkgU2hhd24sDQo+IA0KPiBJJ20gYSBuZXcg
b3duZXIgb2YgdGhlIENocm9tZWJvb2sgQ2lyaSAoTVQ4MTg4KSBhbmQgaGF2ZSBydW4gaW50byBh
bg0KPiBpc3N1ZSB3aGljaCBJIGJlbGlldmUgaXMgcmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KPiAN
Cj4gSSdtIGF0dGVtcHRpbmcgdG8gdXNlIGEgMzQ0MHgxNDQwIDE0NEh6IG1vbml0b3Igb3ZlciBE
aXNwbGF5UG9ydCwgYnV0DQo+IHRoZSBhdmFpbGFibGUgcmVzb2x1dGlvbnMgYXJlIGxpbWl0ZWQg
dG8gMjU2MHgxNDQwQDEyMEh6LiBJIGZvdW5kIHRoaXMNCj4gcGF0Y2gsIHRoZW4gSSBjb25maXJt
ZWQgd2l0aCB0aGUgbW9uaXRvcidzIEVESUQgdGhhdCBpIGFtIGluZGVlZA0KPiByZWFjaGluZyBk
YXRhIHJhdGVzIGFib3ZlIDgyNTAgKHRob3VnaCBtaW5pbWFsbHkpIGluIGhpZ2hlciByZXNvbHV0
aW9uDQo+IG1vZGVzLg0KPiANCj4gSSB3YW50ZWQgdG8gYXNrIGFib3V0IHRoaXMgY29tbWVudDoN
Cj4gDQo+ICA+IFRoZSBwcm9wb3NlZCBmb3JtdWxhIGlzIG9ubHkgb25lIHdheSB0byBlc3RpbWF0
ZSB3aGV0aGVyIG91ciBTb0MNCj4gID4gc3VwcG9ydHMgdGhlIG1vZGUgc2V0dGluZy4gVGhlIGJh
c2ljIGlkZWEgYmVoaW5kIGl0IGlzIGp1c3QgdG8gY2hlY2sNCj4gID4gaWYgdGhlIGRhdGEgcmF0
ZSByZXF1aXJlbWVudCBpcyB0b28gaGlnaCAoZGlyZWN0bHkgcHJvcG9ydGlvbmFsIHRvDQo+ICA+
IHBpeGVsIGNsb2NrLCBpbnZlcnNlbHkgcHJvcG9ydGlvbmFsIHRvIHZicCkuIFBsZWFzZSBhZGp1
c3QgdGhlDQo+ICA+IGZ1bmN0aW9uIGlmIGl0IGRvZXNuJ3QgZml0IHlvdXIgc2l0dWF0aW9uIGlu
IHRoZSBmdXR1cmUuDQo+IA0KPiAtIENhbiB5b3UgY29uZmlybSBpZiB0aGUgcmVmZXJlbmNlIG51
bWJlciA4MjUwIGlzIHRoZSBoYXJkIGxpbWl0IG9mIHRoZQ0KPiBoYXJkd2FyZT8NCj4gLSBDb3Vs
ZCB5b3Ugc3VnZ2VzdCBvdGhlciBmb3JtdWxhZSB0aGF0IGNvdWxkIHdvcmsgZm9yIG15IHVzZSBj
YXNlPyBJJ2QNCj4gYmUgaGFwcHkgdG8gaW1wbGVtZW50IGFuZCB0ZXN0IG9uIG15IGVuZCBidXQg
YXMgSSBkb24ndCBoYXZlIGFjY2VzcyB0bw0KPiBNVEsgZG9jdW1lbnRhdGlvbiwgSSBkb24ndCBr
bm93IHRoZSBhY3R1YWwgbGltaXRzIG9mIHRoZSBoYXJkd2FyZSBhbmQNCj4gaG93IHRvIGRlYWwg
d2l0aCB0aGVtDQo+IA0KPiBSZWdhcmRzLA0KPiBNaWNoYcWCIEtvcGXEhw0KPiANCj4gDQo+IA0K
PiANCg==

