Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F1C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 03:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=; b=xsmPVNumk4HKIKjr1xHGG3uE56
	js6FLVqPcIvSz7nSloOxBU3kFsBICh+vJ7y0/hxtZhVySuwigV2Zl6Lgypj4b40xSUmL5riqRbaVz
	gpyivXg70kaefoOcWK8fDDUTErm/uXHlVuqzUfWlvFpLnhxeptYiVl0yC/QEE2IKL+3ERfHVVaahM
	xTCHlq8d163sMu2SfOuDb2HniZY0lDyDje4lNg46sJLYhZl18J072zm2HVnqU578eDkUCC2v5TFDc
	Y9xAfqYtI8YrKh2ywCV8w+XEezrkn2g0R0MSsSxY7BB6I3pTbxOAKEZb7PJMj/9W9pvhrZ5j0mYvL
	i8gEexnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy5I-00000001Ku3-3t9i;
	Fri, 14 Jun 2024 03:58:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy5F-00000001Ksg-0YZu;
	Fri, 14 Jun 2024 03:58:38 +0000
X-UUID: 5c5abd0a2a0211efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=;
	b=uwoA4Nf3dhssHwPRhOXEO060lnoBL6CjxYHPBjvnmbCknDyYVY9fVHbVNWJqfDIiEpZNEsPP23csoKHXG/XBti3WsKiPsQKBV+9qInR1k7pWBW74Xiel5f2JVkrtnk1w6oz/2D5O5OVmIPTDv7gja+S2rQtX5BHPKBxHDPU0H1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:8c8e9ecc-cfdb-4849-a6e6-e72bd35f6ae5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:76abf993-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5c5abd0a2a0211efaf04eb0598667787-20240613
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2021873647; Thu, 13 Jun 2024 20:58:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 11:58:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 11:58:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYKVqIzZLNALHLinfFjXATUrXFX99E0WFoLGvZQ4o+jNQ+WIPhNsTA6m81adnHZ7/RreV2iKpDLcLHXQqUVr2J+9x2HmJ+juEjXx4KQURw+AV2J+t64Ohi3vrydLOrmWWIuE/lcQabVvwuMxiEY7O3lX0LCPlWNlgaduRZ9Q66SSUzv8OHZK7KSRa1/DYEABN86UuWZ7dyUQYJemwbD3e3LEdn4xOBd3rkx7IomM3U5/PsKebFJz75Xlut/jKuNhN7xwgVDdSp0Mg/xuZ0wnKetBd4FrpWZwajGK7r/V/xuGkNhgkNUnzRr5dKswtrSo+TsYkX1/iZ+e3CU2YePhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=;
 b=L88RMtRY76TjL2hHkATcTFhLnMTPNcI3YE+gj6ohDesUl6fT50CdKUqodNARNw/9kjfqzYyisbK/qHi38YiIt8XWBcP4vZxX5aY5U3U+GhAvikbEeuwrp/RBZfhRyM07r3jQ0ahibEBcMfT+eFRfmv9ohj7XFkIXQZ74xiNe2Owiy6xV0ckzInIUG4GTBHZ8vyIFhvq2+zpVHMmckkrxjOXDZ7KWWbPETHtbtRw21rUlEMY1vHfp99Q4P0ljj5cU8eADbI5Imwe8gAJBzvnlBydwYmeIFzuKUPxL6kOQ80H8PIJFvRu8vjyqyhhcgra9t8JRgtmUJE1eA3KuSEzOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=;
 b=dST+op4mK6fNKpkrtPTAcHZDey5zJ+FU+OhTYYM0RbxtbG136NtKkH73ZN5UeIhSL7vqmcYE2i7uA1QKrA1zSyfrc/ctNsvAeWR3jfmAzhHlhQc/C6V4Go6VBD6j+Hl0k5t1YtTEoPZFS1LlxL5qYrSSag5ZZh36hiTWf4MMaOk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB7281.apcprd03.prod.outlook.com (2603:1096:400:21f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 03:58:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:58:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v9 10/21] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Topic: [PATCH v9 10/21] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Index: AQHavgU2BIIUh+nU3Em9hsnbQR963bHGoimA
Date: Fri, 14 Jun 2024 03:58:24 +0000
Message-ID: <20d9165c911b7e165de1bb1eb6aa08d705bd3a4a.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
	 <20240614024620.19011-11-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-11-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB7281:EE_
x-ms-office365-filtering-correlation-id: 2ed4a4cd-04b2-4267-7270-08dc8c263d16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|366011|1800799019|376009|7416009|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?TS9JUnlpc1Fya2UrRE5Nb0h6eTI0OVNkOXFseDQzQ2xnM1JhYUROcE9HeFdt?=
 =?utf-8?B?d0U3ZWFSd3Zwc1VFNGUrRnJaN0VUUFR0ZlIyV3RYWDRGTXpqK25nQlZBQmgw?=
 =?utf-8?B?a1VDY0tZcG1WNGsvcy9Ib1RZc0lBZ2IvQWVId0ljUkF6QmFyOEFlZG9xc3Vy?=
 =?utf-8?B?cUI2YjY5eU5uQzRrK0JjWFFoTXZCNXVOQWl3Qmw3SkhRQ3VsK2JWV2dUMVZC?=
 =?utf-8?B?MU1QQWZ1TE5SazlVQlhUdGRCZXN5OVlOc05OWm03V0d0MXBieU5zSmZkeGQv?=
 =?utf-8?B?NGJMbU5wSit2L05uVjZyUEJqNXkwUUtGbnhKWTBmOTQyRFRPYU5WcCtkZ0NM?=
 =?utf-8?B?NVFHR20yZGN5RHZKQ1lxbzF4cklReEZpZ2ppeXdWaVRvNWlhUENBOEhXOUJS?=
 =?utf-8?B?T1ltNmE4MkEvMzJzN1EzZlRCQW5jNUJUb0t3Z3JQd1JTK003Mkw5QnZLNDJi?=
 =?utf-8?B?cVpDRExndU1NQnhDaTdLcThwWnpiRXRiRUtiOU1DQkV2dTVUMkxyWUN1Q3F1?=
 =?utf-8?B?dENneStQQ3dpb1UraGpoYUNrcEhiTjhyd2ptNUs3MGt5cGJnb0tkNjZyaU5i?=
 =?utf-8?B?NjhPL0tqUHVkMGhWRUZHZzJMNzBvRTdlZnNkVGhiNkIwL0ZzV3pNTkpBaU9M?=
 =?utf-8?B?ZG52REZoQVZBRldTbHlXbkdRRStMQzl4N0REYmtkejVLMkYrWGhpTkVkQ0NT?=
 =?utf-8?B?d0R6dWdyMC9hMGo1dHpxWFBCYUplYmw3Q3oyMzNmT1lGakM4WFNZblBnbmFk?=
 =?utf-8?B?VWhpSGgxUklqQUlwT3RpaTRGM3ZHK1dKZEJXWUJId1o5RnM0dnEwRFhaRi9M?=
 =?utf-8?B?d1JaVHhuOW9xNEl6V2srcXFQT3B3NDMxalNpVkU2QXdSSXFpVk13Zkk0Q3Rx?=
 =?utf-8?B?MjhIN2U2b0ZJbWhHV3RHTEt2ZmoyZy8xOFdZOEZobHFyZWpKdlByRjEvL2Fl?=
 =?utf-8?B?MVZKeU4vbU5kYy9NNlBxZkFiYW9XV1kyZGtnZThvOWV6TEVORHJrQ3RYNWVq?=
 =?utf-8?B?SlJjSVJZdmtmQWVYNHd0SWlLaS9jeEJVSmdLemhjZjBOcDlVcmpZV3hIWGJC?=
 =?utf-8?B?MzgyMTBiQk5wRU93RUJFbkdyWlpXbVBsM1hFMmsyK3VhMHFUMGJ6ZjhMbnVD?=
 =?utf-8?B?OGtnSzJHRkNwOUN6MU5aTUhhbFMvZE9rSzducVlER1h0NDRNdldqNk5IMU1V?=
 =?utf-8?B?UXhkbWEvcEpjV2EzTG9iVnJiY0RvTEI3bUJmYVRXb3FQQnZsVyttV1VMd2FK?=
 =?utf-8?B?K2puNHZIL0ZHN1J1ZjNNRE1hNU1tT2pJaGpwY2VGd3BXQ1dxSmpvV3dBVWh2?=
 =?utf-8?B?TUEyUlY0dXNlbDd1ZjBuMnFOdW43SXZOYk53Y0xQUWdEalpjeGJmT0wrWGZ6?=
 =?utf-8?B?NjdvSkQxY0ZXSStmd3dyZFFKeXpWdk94YnRnelduaXcyZDhrcTQzUGw5Vnlp?=
 =?utf-8?B?aEVuSVE5YThsZC9UaFk3WCtleGZYOEJGejVYZXIzN2hpcTE4NmhVQS9KSTlj?=
 =?utf-8?B?bDRzMzlBZTdxcFFDeW9lL2NSUURST1pKY1c5c0FoOVhDMW5nalRPVHRlenRG?=
 =?utf-8?B?Wi9CN1UvN0pvaUMvb2xHbDZaOGNxU09vUDhFTEUxeXk5K29YUVFWYWNabUJF?=
 =?utf-8?B?MEh4S2Uzd3lmeEgvYzZJOGpvTGNBL3RNNm16c3J4d2I5RGlFcGI5aVp3UFhQ?=
 =?utf-8?B?aWt2Q3lxaG1KTnlpaDVPSFdQUG1JQnY3VndhWUNNU1dySmdRQ3prUXFrb2RU?=
 =?utf-8?B?azBMWlQ0ak5yS0hENGVtRStxY0g3V21RSXR4QU9rMmpOWnVNaUtDQmdNNTVO?=
 =?utf-8?Q?MdJXDR3LtcD6SG9RtoBm/FBpf3hOHenEBNsb4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(366011)(1800799019)(376009)(7416009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?US81dWpWYS9CN3JheFE2MGxuY3ZaaXZqMTlHSjdRYVFra3owMHY3ZmMrcjda?=
 =?utf-8?B?N3h3WjlURU04WGhJU25qQTNsTEU3Zm1UOTRmcFZOeUkrWmp4ZlhZQzR3bUkv?=
 =?utf-8?B?SGQ1NllaczN6RWtuSlpZdHgramh6dnVkOXp0ZFhpeER5YnhOcy9Da3RIVDZp?=
 =?utf-8?B?bVNUUUtHSDZFaUpjbHZuaXYvVC9tNUZqME15MThJRkFIT2hTWnRiYUNyTjE5?=
 =?utf-8?B?UlJ4TTFJdms4YTd6UllnQitwSnJSVzErUloxT0xjbm5kMHFXVXdOVHdNdmU3?=
 =?utf-8?B?Z1RBTTFWakNORFdEbzlPWitBcmVnQm8yMWpvc21GYVFVRGVQTHhLeE85a2pM?=
 =?utf-8?B?SS9ORnpCWnlGWTFlcmsyem90c0ZweHA2ZGtqRDdDWmx4RCtVQm9oRlFmbk01?=
 =?utf-8?B?Q0dsdDJpWWd3WnFJVUV0VVIzUVBLQ2xybVlQRks3ZElwVHdQT0dCay9SLzk2?=
 =?utf-8?B?bDlpN1gwNTNHSlVnQkdkOElnenVSSytXUW9hUzFtejFTVThlRVE4UzgrdkFi?=
 =?utf-8?B?QVNEaDV0Z3Ezb3JJVnhFcVdjY05FbUhGQW1wRXVWQVczWi83TGF4eXNpUlly?=
 =?utf-8?B?TUhmMWl3eW9zWUh1UUcwdGE0dlJ0bFpPWUxNRFcyRE1CckdBWnJpdXhmczdZ?=
 =?utf-8?B?TWUzV1Q0SmtZeWhCUXpEZEhkazhzRjA2V3RLVU45K0c1YWFEV09kUFdKVmNm?=
 =?utf-8?B?dUlRWlVCMnF0SFFNdFlMN3J3K3FVNS9vNzIyckxSZzBhU3d1NFU1MUVkR1g5?=
 =?utf-8?B?YWlweERLd1lqMmlNcDFxRE53OFpNV0NULysrTlp1SzZlb3l5dStTQWxMWFJT?=
 =?utf-8?B?bVk1WkpCYnovVGVuRitsbWJhS25xZHFtK1d3NzU3UEJmMC9lUHJJT1FLMzd6?=
 =?utf-8?B?L3Y5ODVZaTdwYklSYUdub2d3WW9GSjNPOSt5M29OcllqWlQ2MGFMQjNteDNQ?=
 =?utf-8?B?dTJNNWxENjE0UjZCWUFmK2FNazAvcDA1Qi9YVU9rbkN2Q0xzTngzZFdkSmxZ?=
 =?utf-8?B?cVJyRjhyQTR5ckFtUEU1Y2lLbm93ek15UjkzQ2RZeXcvMlkyL0t2YUFwcUVL?=
 =?utf-8?B?dmNaYU12T2U5bk15ZmRpd2N4MVJHSmdFQ3ptejJnUHVyYXp1WXdjNmtsN29E?=
 =?utf-8?B?ZGpFaWFqK084czBkYmJVVmNCeTl0bGdkT29nWUViUGJLRG8rUDZaL1hZY2Ez?=
 =?utf-8?B?RGJyUDg5anJ5TWNsUVlPbXhrRU4vYmxMY2RJcWtZTWRuYmcxa3g4c3UvMndH?=
 =?utf-8?B?VDB2QWt6U3RYU2FUWGVWNjVLY1M0a1U0RUhqMlk5bW5hZ1FTWXB0cUpBNFRK?=
 =?utf-8?B?NjdCTVdKUENuRnhIWklSVU9CQ1gwRjE5NXZmUVRsMTVYc1N4Y1M3RWQ1NkFX?=
 =?utf-8?B?SGNVZ3ZxaGdDVDB0bkxIOG1ReGJ6cE03UHhzK3hMYTREYnRibStvQzUvOVVV?=
 =?utf-8?B?VG9HVElqTktPNkJvNEJDaXZIM0hzd0xnaGZUQXJaODBwOHZPdWdGOG1FVUI2?=
 =?utf-8?B?akhxUllpc202UURONFUvc2hxa0hkS05VWjlVOWdETzBQQ0x0NlhKUGxkQW9j?=
 =?utf-8?B?d3BEa0I4YWt3RmFZVDdYNUE3Z1NnR1FZRGNKOGI2a2RqWW45VUd1Rks4eWFv?=
 =?utf-8?B?QTlzT2lIekplYkZtTm9ENk5iUURhOUNoSm5TRS9vaXcxZWNVVUtJai9mV2tJ?=
 =?utf-8?B?MGZHMjVBeWdNS1pLazhNbUoveU0yS3NLUlBJODlUSHVrdDJwK2dGSi9rUzRE?=
 =?utf-8?B?MThRSnlzNktCK3l6dmx5aENyV1NqMTNoQVZDcnVhOUZ3SFpINTgzZVpZYU9C?=
 =?utf-8?B?WTQ3S2JFR3puVXlqdVpENlRYd0JaUm1PUWZRKzBuVHdXOEhIVXpsQllNVnB4?=
 =?utf-8?B?a0NuOFNPWmlpeTV6MlN3VlptNi9PcFpvZWhNNXBzd2ROS3plazk3UDNyZ1Z5?=
 =?utf-8?B?VU9NQk5XWTFMenFMVlRncWJJanZWK0xEVzZkNWxQY1FtSkJuY3c1UjV5QjJz?=
 =?utf-8?B?SGRGZjdic1c3Y1VvZWpWM3NoOHZKdHdkUy9ranhDWWNDTDJzMnBEcmhCZXlM?=
 =?utf-8?B?NlEzNEppVGtHMlljU2x3cG94OW95aGZHWTd0YWxGMDdXcnBnaUcvbURxUjZs?=
 =?utf-8?Q?osDYC5JZoVfZkuzXq9tUp83DQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFFED623852CC7438353524500C28AB8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed4a4cd-04b2-4267-7270-08dc8c263d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 03:58:24.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vzr6qWg7YPUWUXxx3o0gdrnBY/pNUQAdn7161uTpkT1X1mRxLW1um4NYccWTHtjwVXF0rY0bByxuNq14irSr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_205837_212061_BE8BDCD7 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, "sean@poorly.run" <sean@poorly.run>, "jason-ch.chen@mediatek.corp-partner.google.com" <jason-ch.chen@mediatek.corp-partner.google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gQWx0aG91Z2ggdGhlIGFscGhhIGNoYW5uZWwgaW4gWFJHQiBmb3JtYXRzIGNh
biBiZSBpZ25vcmVkLCBBTFBIQV9DT04NCj4gbXVzdCBiZSBjb25maWd1cmVkIGFjY29yZGluZ2x5
IHdoZW4gdXNpbmcgWFJHQiBmb3JtYXRzIG9yIGl0IHdpbGwgc3RpbGwNCj4gYWZmZWN0cyBDUkMg
Z2VuZXJhdGlvbi4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoN
Cj4gDQo+IEZpeGVzOiBkODg2YzAwMDliZDAgKCJkcm0vbWVkaWF0ZWs6IEFkZCBFVEhEUiBzdXBw
b3J0IGZvciBNVDgxOTUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3
bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2V0aGRyLmMgfCAxMiArKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZXRoZHIuYw0KPiBpbmRleCA5Nzk2ZmQxZDUxZjIuLjkwMmRlYzAzYTdkZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBAQCAtMTUzLDYgKzE1Myw3IEBAIHZvaWQg
bXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBp
ZHgsDQo+ICAJdW5zaWduZWQgaW50IG9mZnNldCA9IChwZW5kaW5nLT54ICYgMSkgPDwgMzEgfCBw
ZW5kaW5nLT55IDw8IDE2IHwgcGVuZGluZy0+eDsNCj4gIAl1bnNpZ25lZCBpbnQgYWxpZ25fd2lk
dGggPSBBTElHTl9ET1dOKHBlbmRpbmctPndpZHRoLCAyKTsNCj4gIAl1bnNpZ25lZCBpbnQgYWxw
aGFfY29uID0gMDsNCj4gKwlib29sIHJlcGxhY2Vfc3JjX2EgPSBmYWxzZTsNCj4gIA0KPiAgCWRl
dl9kYmcoZGV2LCAiJXMrIGlkeDolZCIsIF9fZnVuY19fLCBpZHgpOw0KPiAgDQo+IEBAIC0xNzIs
OCArMTczLDE1IEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJaWYgKHN0YXRlLT5iYXNlLmZiICYmIHN0YXRlLT5i
YXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gIAkJYWxwaGFfY29uID0gTUlYRVJfQUxQSEFf
QUVOIHwgTUlYRVJfQUxQSEE7DQo+ICANCj4gLQltdGtfbW1zeXNfbWl4ZXJfaW5fY29uZmlnKHBy
aXYtPm1tc3lzX2RldiwgaWR4ICsgMSwgYWxwaGFfY29uID8gZmFsc2UgOiB0cnVlLA0KPiAtCQkJ
CSAgTUlYRVJfQUxQSEEsDQo+ICsJaWYgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5m
Yi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHsNCj4gKwkJLyoNCj4gKwkJICogTWl4ZXIgZG9lc24ndCBz
dXBwb3J0IENPTlNUX0JMRCBtb2RlLA0KPiArCQkgKiB1c2UgYSB0cmljayB0byBtYWtlIHRoZSBv
dXRwdXQgZXF1aXZhbGVudA0KPiArCQkgKi8NCj4gKwkJcmVwbGFjZV9zcmNfYSA9IHRydWU7DQo+
ICsJfQ0KPiArDQo+ICsJbXRrX21tc3lzX21peGVyX2luX2NvbmZpZyhwcml2LT5tbXN5c19kZXYs
IGlkeCArIDEsIHJlcGxhY2Vfc3JjX2EsIE1JWEVSX0FMUEhBLA0KPiAgCQkJCSAgcGVuZGluZy0+
eCAmIDEgPyBNSVhFUl9JTlhfTU9ERV9FVkVOX0VYVEVORCA6DQo+ICAJCQkJICBNSVhFUl9JTlhf
TU9ERV9CWVBBU1MsIGFsaWduX3dpZHRoIC8gMiAtIDEsIGNtZHFfcGt0KTsNCj4gIA0K

